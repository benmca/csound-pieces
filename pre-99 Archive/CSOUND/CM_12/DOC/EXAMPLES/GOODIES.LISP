(in-package :stella)

;;;
;;; split-channels splits midi data in a into seperate time lined threads
;;; according to the channel. merging the resulting threads would produce
;;; exactly the same output as the original data .if
;;; recurse is true (the default), then  subthreads are recursively processed.
;;; 

(defun split-channels (thread &key (copy t) (recurse t))
  (let ((channels (make-array 16 :initial-element nil))
        (timeinfo (make-array 16 :initial-element 0))
        (timeline 0.0)
        (results ()))
    (map-object 
     #'(lambda (x)
        (when (typep x 'midi-note)
          (when copy (setf x (copy-object x)))
          (let* ((chan (slot-value x 'channel))
                 (last (aref timeinfo chan)))
            (if (aref channels chan)
              (let ((obj (car (aref channels chan))))
                (setf (slot-value obj 'rhythm)
                      (- timeline last))
                (push x (aref channels chan)))
              (setf (aref channels chan)
                    (if (> timeline 0.0)
                      (list x (make-instance 'rest :rhythm timeline))
                      (list x))))
            (setf (aref timeinfo chan) timeline)))
        (incf timeline (slot-value x 'rhythm)))
     thread :level recurse)

    ;; for each channel found, set last rhythm and make new thread
    (dotimes (i 16)
      (when (aref channels i)
        (let ((obj (car (aref channels i))))
          (setf (slot-value obj 'rhythm)
            (- timeline (aref timeinfo i))))
        ;; use intern instead of gentemp
        (let* ((lab (intern (format nil "~A-CHAN-~A"   
                                     (object-name thread) i)))
               (new (make-object (list 'thread lab))))
          (add-objects (nreverse (aref channels i)) new nil)
          (push new results))))
    (nreverse results)))

;;;
;;; force "natural" notes that cancel sharps and flats to explictly include
;;; an N in their spelling. Example: df d ds d -> df dn ds dn
;;;

(defun naturalize (container)
  (flet
    ((naturalize-aux (note classes)
     (let* ((name (symbol-name note))
            (class (elt name 0))
            (accidental (car (member (elt name 1) '(#\S #\F #\N))))
            (octave (or (subseq name (if accidental 2 1)) "4"))
            (spec (assoc class classes :test #'char=))
            (entry (assoc octave (cdr spec) :test #'string=)))
      (unless entry
        (setf entry (list octave))
        (push entry (cdr spec)))
      (if accidental
          (progn (setf (cdr entry) accidental)
                 note)
        (if (not (cdr entry))
            note
          (if (char= (cdr entry) #\N)
              note
            (progn
              (setf (cdr entry) #\N)
              (find-symbol (concatenate 'string (string class) 
                                        "N" octave)))))))))

    (let ((classes (loop for x in '(#\A #\B #\C #\D #\E #\F #\G) 
                         collect (list x)))
          (pos 0))
      (map-object #'(lambda (x)
                     (let ((y (careful-slot-value x 'note)))
                       (when (and y (symbolp y))
                         (let ((z (naturalize-aux y classes)))
                           (unless (eq z y)
                             (format t  "~S	~A -> ~A~%" pos y z)
                           (setf (slot-value x 'note) z))))
                        (incf pos)))
                 container))
    container))

;;;
;;; make copy of object allowing differences to be specified as slotinit pairs.
;;;

(defun derive-object (object &rest whatever)
  (apply #'reinitialize-instance (duplicate-object object) whatever))

;;;
;;; map thread calling fn on groups of simultaneos objects. fn takes
;;; a single &rest argument and is passed sets of simultaneous object.
;;; if slot is specified then the function receveive slot values rather
;;; than the objects themselves. all objects < fudge time apart are
;;; considered to be simultaneous.
;;;

(defun map-simultaneous (fn thread &optional slot (fudge 0.0))
  (macrolet ((get-value (x slot) `(if ,slot (slot-value ,x ,slot) ,x)))
    (let ((tail (container-objects thread)))
      (loop while tail
            for next = (pop tail)
            for time = (object-time next)
            for more = (loop with tim = time
                             while (and tail
                                        (<= (- (object-time (first tail))
                                               tim) 
                                            fudge))
                             do (setf tim (object-time (first tail)))
                             collect (get-value (pop tail) slot))
            do (apply fn (get-value next slot) more)))))

;;;
;;; return the list of simultaneous objects or slot values.
;;;

(defun collect-simultaneous (thread &optional slot)
  (let ((results '()))
    (map-simultaneous #'(lambda (&rest things) 
                          (push (if (cdr things) things (first things)) results)) 
                      thread slot)
    (nreverse results)))

#|
(generator foo midi-note (length 10 amplitude .1 duration .1 rhythm .1)
  (setf note (item (notes [c4 d e] [e4 g b] [g4 b d5]))))
(run-object #!foo)
(collect-simultaneous #!foo 'note)
(let ((m 0)) ; count max simultaneous
  (map-simultaneous #'(lambda (&rest l) (setf m (max m (length l)))) #!foo)
  m)
|#

;;;
;;; map thread calling fn on groups of overlapping objects, ie objects 
;;; that produce harmony. fn is passed the overlaps as a single &rest
;;; arguement.  if slot is specified then the function recevies values
;;; from that slot rather than the objects themselves.
;;;

(defun map-overlaps (fn thread &optional slot)
  (macrolet ((get-value (x slot) `(if ,slot (slot-value ,x ,slot) ,x)))
    (let ((tail (container-objects thread)))
      (loop while tail
            for next = (pop tail)
            for time = (object-time next)
            for dur = (+ time (slot-value next 'duration))
            for more = (loop with l = tail
                             while (and l (< (object-time (first l)) dur))
                             for n = (pop l)
                             collect (get-value n slot))
            do (apply fn (get-value next slot) more)))))

(defun collect-overlaps  (thread &optional slot)
  (let ((results '()))
    (map-overlaps #'(lambda (&rest things)
                      (push (if (cdr things) things (first things)) results))
                  thread slot)
    (nreverse results)))

#|
(thread bar ()
  (object midi-note rhythm 1 note 'c4 duration .1)
  (object midi-note rhythm 1 note 'd4  duration 2.5)
  (object midi-note rhythm 1 note 'e4  duration 2.5)
  (object midi-note rhythm 1 note 'f4  duration .1)
(run-object #!bar)
(collect-overlaps #!bar 'note)
(let ((m 0))
  (map-overlaps #'(lambda (&rest l) (setf m (max m (length l)))) #!foo)
  m)
|#

