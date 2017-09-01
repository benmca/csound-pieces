(in-package :cm)

;;; lock.lisp
;;; a time-based locking facility.  A locked datum becomes automatically
;;; unlocked after a specified period of time. algorithms can use this
;;; facility to "claim" values that should not be used for a specified
;;; unit of time:
;;;
;;; (locked? <thing> <time>)
;;; Returns true if <thing> is locked at <time>.
;;;
;;; (lock <thing> <start-time> <end-time>)
;;; Claims <thing> between times <start-time> and <end-time>
;;;
;;; (unlock <thing> <time>)
;;; Explicitly unlocks <thing> at <time>.  This is normally not necessary
;;; since locking expires automatically as time is incremented.
;;;
;;; (unlock-all)
;;; Unlocks everything. An algorithm should use this
;;; to reinitialize the locking mechanism before running.
;;;

(defclass lock ()
  ((table :initarg table :initarg :table :accessor lock-table)
   (count :initform 0 :initarg count :initarg :count :accessor lock-count)
   (maximum :initarg maximum :initarg :maximum :accessor lock-maximum)))

(defmethod initialize-instance :after ((object lock) &rest args)
  (declare (ignore args))
  (unless (slot-boundp object 'table)
    (setf (slot-value object 'table) (make-hash-table)))
  (unless (slot-boundp object 'maximum)
    (setf (slot-value object 'maximum) most-positive-fixnum)))

(defun make-lock (&rest args) (apply #'make-instance 'lock args))

(defparameter *lock* (make-lock))

(defun locked? (thing time &optional (lock *lock*)
                      &aux (table (lock-table lock)))
  (and (setf thing (gethash thing table))
       (<= (car thing) time (cdr thing))))

(defun lock (thing from to &optional (lock *lock*)
                   &aux (table (lock-table lock)))
  ;(format t "~%Locking ~A from ~S to ~S" thing from to ) 
  (let ((v (gethash thing table)))
    (unless v 
      (setf (gethash thing table) (setf v (cons nil nil)))
      (incf (lock-count lock)))
    (setf (car v) from (cdr v) to)
    thing))

(defun unlock (thing time &optional (lock *lock*)
                     &aux (table (lock-table lock)))
  (let ((v (gethash thing table)))
    (when (and v (not (eql (cdr v) -1)))
      (setf (car v) time (cdr v) -1)
      (when (> (lock-count lock) 0)
        (decf (lock-count lock))))
    thing))

(defun unlock-all (&optional (lock *lock*)) 
  (clrhash (lock-table lock))
  (setf (lock-count lock) 0))

(defun num-locked (&optional (lock *lock*))
  (lock-count lock))

(defun show-locked (&optional (lock *lock*) all)
  (maphash (if all #'(lambda (a b) (format t "~%~S:	~S" a b))
               #'(lambda (a b)
                   (when (> (cdr b) (car b))
                     (format t "~%~S:	~S" a b))))
           (lock-table lock)))

(defmacro unlocked-value (form time &optional rep)
  ;; eval form until unlocked result or rep number of interations occur.
  (let ((var (gensym))
        (tim (gensym)))
    (if rep
      (let ((cnt (gensym)) (len (gensym)))
        `(let ((,tim ,time)
               (,cnt 0) 
               (, len ,rep)
               ,var)
           (loop do (setf ,var ,form) 
                 while (and ,tim (locked? ,var, tim) (< ,cnt ,len))
                 do (incf ,cnt)
                 finally
                 (return 
                  (progn
                    (when (and ,tim (= ,cnt ,len))
                      (warn "Failed to get an unlocked value ~
                             after ~D tries. Returning ~S." ,len ,var))
                    ,var)))))
      `(let ((,tim ,time) ,var)
         (loop do (setf ,var ,form)
               while (and ,tim (locked? ,var, tim))
               finally (return ,var))))))

(defun unlocked-item (stream time &optional (lock *lock*))
  (loop for thing = (item stream)
        unless (locked? thing time lock)
        return thing))

(defun unlocked-items (stream time &optional (lock *lock*))
  (loop with x and y
        do (multiple-value-setq (x y) (item stream))
        unless (locked? x time lock)
        collect x until (eq y +eop+)))

#|

;; locker1 displays the locking mechanism at work: Run locker1 0

(algorithm locker1 midi-note (length 100 initializer 'unlock-all amplitude .5)
  (loop do
        (setf note (item (notes c4 d ef f g af bf c5 in random)))
        while (locked? note time)
        do
        (format t "~%Skipping locked note ~S at time ~S." note time))
  (setf duration (item (rhythms s e q in random)))
  (setf rhythm (item (rhythms s e q in random)))
  (format t "~%Locking ~S from ~S to ~S." note time (+ time duration))
  (lock note time (+ time duration)))


;; locker2 is the same example without print out: mix locker2 0

(algorithm locker2 midi-note (length 100 initializer 'unlock-all amplitude .5)
  (loop do
        (setf note (item (notes c4 d ef f g af bf c5 in random)))
        while (locked? note time))
  (setf duration (item (rhythms s e q in random)))
  (setf rhythm (item (rhythms s e q in random)))
  (lock note time (+ time duration)))


|#
