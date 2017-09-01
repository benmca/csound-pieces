(defun calc-form (notes prime?)
  (let ((len 0) 
        (int most-positive-fixnum)
        set sum end)
    ;; coerce to intervals within one octave sorted low to high
    (setf notes (sort (loop for n in notes
                            for i = (mod (degree n) 12)
                            unless (find i set)
                            collect i into set
                            and do
                            (setf int (min int i)) ; find lowest
                            (incf len)
                            finally (return set))
                      #'<))
    ;; transpose to 0, save pointer to last cons cell
    (loop for tail on notes
          do (setf (first tail) (- (first tail) int)
                   end tail))
    (setf set (make-list len))      ; holds best normal form
    (setf int most-positive-fixnum)
    ;; find rotation with smallest span and interval content.
    ;; destructively modify notes to avoid intermediate consing
    (loop with x
          repeat len
          do
          (cond ((< (first end) int)
                 ;; save normal form, largest interval and interval sum
                 (loop for i in notes for tail on set 
                       do (setf (first tail) i))
                 (setf int (first end) sum (apply #'+ (cdr notes))))
                ((and (= (first end) int)
                      (< (setf x (apply #'+ (cdr notes)))
                         sum))
                 (loop for i in notes for tail on set 
                       do (setf (first tail) i))
                 (setf sum x)))
          ;; put first note at end, tranpose all to 0
          (setf (first notes) 12)
          (loop with n = (second notes)
                for tail on notes
                do (setf (first tail) (- (first tail) n)))
          (setf (cdr end) notes
                end (cdr end)
                notes (cdr notes)
                (cdr end) nil)) ; avoid circular list
    ;; return best normal form or its inversion, whichever has
    ;; smallest interval content
    (if prime?
      (progn (loop for i from (1- len) downto 0
                   for tail on notes
                   do (setf (first tail) (- int (elt set i))))
             (if (< (apply #'+ (cdr notes)) sum) notes set))
      set)))

(defun prime-form (notes)
  (calc-form notes t))

(defun normal-form (notes)
  (calc-form notes nil))

(defconstant major-triad '(0 4 7))
(defconstant minor-triad '(0 3 7))
(defconstant diminished-triad '(0 3 6))
(defconstant augmented-triad '(0 4 8))
(defconstant incomplete-major-triad '(0 4))
(defconstant incomplete-minor-triad '(0 3))

(defconstant diminished-seventh '(0 3 6 9))
(defconstant half-diminished-seventh '(0 2 5 8))
(defconstant minor-seventh '(0 2 5 8))
(defconstant dominant-seventh '(0 3 5 8))

(defun chord-type (notes)
  (let ((form (normal-form notes)))
    (cond ((equal form major-triad)
           ':major-triad)
          ((equal form minor-triad)
           ':minor-triad)
          ((equal form diminished-triad)
           ':diminished-triad)
          ((equal form augmented-triad)
           ':augmented-triad)
          ((equal form incomplete-major-triad)
           ':incomplete-major-triad)
          ((equal form incomplete-minor-triad)
           ':incomplete-minor-triad)
          ((equal form diminished-seventh)
           ':diminished-seventh)
          ((equal form half-diminished-seventh)
           ':half-diminished-seventh)
          ((equal form dominant-seventh)
           ':dominant-seventh)
          
          (t nil))))
          

