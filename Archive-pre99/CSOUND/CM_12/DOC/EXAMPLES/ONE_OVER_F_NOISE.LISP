(in-package :cm)

(defun one-over-f-aux (n power-of-2 r half-range)
  (let ((sum 0))
    (loop for i below power-of-2 
          do
          (let ((pow (expt 2 i)))
            (when (not (= (/ n pow) (/ (- n 1) pow)))
              (setf (aref r i) (between (- half-range) half-range)))
            (incf sum (aref r i))))
    sum))

;;; One over f noise generator. Returns a list of size 2^power-of-2 of
;;; numbers from -1 to 1
;;; Based on Gardner (1978) and Dick Moore (1988?)

(defun one-over-f-noise (power-of-2)
  (let*  (rtn
          (length (expt 2 power-of-2))
          (half-range  (/ 1.0 power-of-2))
          (r (make-array (list power-of-2))))  ; bug: should free array
    (loop for n from 0 to (- length 1) do
          (push 
           (one-over-f-aux n power-of-2 r half-range)
           rtn))
    rtn))


