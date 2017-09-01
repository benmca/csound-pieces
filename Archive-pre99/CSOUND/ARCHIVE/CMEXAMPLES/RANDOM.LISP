(in-package :stella)

;;; Various random number generators culled from CLMATH (Gerald Roylance)
;;; and Dodge/Jerse.  All this code glibly assumes that RANDOM yields
;;; a good uniform distribution...I've included a graphing hack (MCL only)
;;; at the end of the file for plotting distributions.

;;;
;;; These two forms of linear distribution return float or integer x<n.
;;; lowpass-random prefers lower numbers, highpass-random prefers higher.
;;; Density = f(x)=2*(1-x)     {x 0<1}
;;; Mean = .2929
;;;

(defun lowpass-random (n &optional (state *random-state*))
  (min (random n state) (random n state)))

(defun highpass-random (n &optional (state *random-state*))
  (max (random n state) (random n state)))

;(defun linear-density (x) (* 2.0 (- 1 x)))
;(loop for x to 1 by 1/4 collect (linear-density x))

;;;
;;; Triangular random distribution prefers numbers in the middle.
;;; If n is integer, either integer or ratios will be returned.
;;; Mean = n/2
;;; 

(defun bandpass-random (n &optional (state *random-state*))
  (/ (+ (random n state) (random n state)) 2))

;;;
;;; Exponential random distribution returns floating point x>0. 
;;; lambda is a stretching factor; increase to prefer smaller numbers.
;;; value returned is unbounded, but when lambda is 1, x is %99.9 of
;;; the time less than 6.9077554, ie -log(.001)
;;; Density = f(x)=(exp -x)
;;; Mean = 1
;;;

(defconstant 2*e^-1 (* 2 (exp -1.0)))

(defun exp-random (lambda &aux u v)
  ; hmmm...appears to be broken since u can be 0.
  (declare (float u v 2*e^-1) (optimize (speed 3) (safety 0)))
  (loop do
        (setf u (random 1.0))
        (setf v (* 2*e^-1 (the float (random 1.0))))
        until (<= v (the float (* -2.0 u (the float (log u)))))
        finally (return (the float (/ v u lambda)))))

#|
(loop repeat 1000 for x = (exp-random 1) 
      maximize x into m sum x into s count (>= x 6.9078) into c 
      finally (return (values m (/ s 1000) 
                              (- 100.0 (* (/ c 1000) 100.00)))))
|#   

;(defun exp-density (x rate) ; rate is lambda*increment
;  (if (< x 0) 0 (* rate (exp (- (* rate x))))))
;(loop for x below 50 collect (exp-density x (* 1/50 1)))
;(loop for x below 50 collect (exp-density x (* 1/50 10)))


#|
something is wrong with the dodge/jerse version here -- it returns negative
numbers when lambda < 1 and it yields a larger x for a larger lambda, the
opposite of what should happen. maybe i screwed up reading the fortran code.

(defun dodge-exp-random (lambda &optional (state *random-state*) &aux u)
  (declare (float u) (optimize (speed 3) (safety 0)))
  (loop until (/= (setf u (/ (random 1.0) lambda)) 0.0))
  (- (log u)))
|#

;;;
;;; Normal (Gaussian) distribution returns unbounded x. The spread (standard
;;; deviation, or mu) in this implementation is 1.0 centered at 0, so 68.26%
;;; of the results are -1<=x<=1, and 99.74% of the results are -3<=x<=3.
;;;

(defconstant 2*sqrt2*e^-.5 (* 2.0 (sqrt 2.0) (exp -0.5)))

(defun normal-random (&aux u v)
  (declare (float u v 2*sqrt2*e) (optimize (speed 3) (safety 0)))
  (loop do
        (setf u (the float (random 1.0)))
        (setf v (* 2*sqrt2*e^-.5 
                   (the float (- (the float (random 1.0)) 0.5))))
        until (<= (* v v) (* -4.0 u u (log u)))
        finally (return (/ v u))))

#|
(loop repeat 1000 for x = (normal-random) 
      sum x into s minimize x into l maximize x into u 
      count (<= -1 x 1) into c1 count (<= -3 x 3) into c2
      finally (return (values (/ s 1000) l u 
                              (* (/ c1 1000) 100)
                              (* (/ c2 1000) 100))))
|#

;(defun normal-density (x) (/ (exp (* -0.5 x x)) (sqrt (* 2.0 pi))))

;;;
;;; Beta distribution returns 0<=x<=1. A and B control density behavior.
;;; When a=b=1 uniform distribution results. When a=b, the distribution
;;; is symetric around .5.  When a<1 and b<1 then density of large and
;;; small numbers increases. When a>1 and b>1, density is similar to the
;;; normal distribution.
;;;

(defun beta-random (a b)
  (loop with 1/a = (/ 1 a) and 1/b = (/ 1 b)
        for r1 = (random 1.0)
        for r2 = (random 1.0)
        for y1 = (expt r1 1/a)
        for y2 = (expt r2 1/b)
        for sum = (+ y1 y2)
        while (> sum 1.0)
        finally (return (/ y1 sum))))
;;;
;;;
;;;
;;;
;;;

(defun cauchy-random (&aux u v)
  (declare (float u v ) (optimize (speed 3) (safety 0)))
  (loop do
        (setf u (the float (random 1.0)))
        (setf v (* 2.0 (- (the float (random 1.0)) 0.5)))
        until (< (+ (* v v) (* u u)) 1.0)
        finally (return (/ v u))))

;(defun cauchy-density (x) (/ 1.0 (* pi (1+ (expt x 2)))))

;;;;
;;;; hack for displaying probabilities in mcl.
;;;;

#+mcl
(progn

(defclass ranwin (ccl:window)
  ((ran :initform #'random :initarg :random)
   (len :initform 50 :initarg :length)
   (arg :initform nil :initarg :args)
   buf min max)
  (:default-initargs :window-show nil :view-size (xy 400 200)))

(defmethod initialize-instance :after ((object ranwin) &rest args)
  (declare (ignore args))
  (let ((len (slot-value object 'len))
        (ran (slot-value object 'ran))
        (arg (slot-value object 'arg)))
    (unless (listp arg) (setf arg (list arg)))
    (loop with buf = (make-array len) 
          for i below len for x = (apply ran arg)
          maximize x into max minimize x into min
          do (setf (aref buf i) x)
          finally (setf (slot-value object 'buf) buf
                        (slot-value object 'min) min
                        (slot-value object 'max) max))))

(defmethod ccl:view-draw-contents ((v ranwin))
  (when (slot-boundp v 'buf)  
    (let* ((xm 40)
           (ym 20)
           (s (ccl:view-size v))
           (w (- (xy-x s) xm))
           (h (- (xy-y s) ym)) ;
           (b (slot-value v 'buf))
           (l (slot-value v 'len))
           (max (slot-value v 'max))
           (min (slot-value v 'min)))
      (ccl:with-focused-view v
        ;(ccl:require-trap _moveto 3 (+ ym 5))
        (ccl:move-to v 3 (+ ym 5))
        (format v "~5,2F" max)
        ;(ccl:require-trap _moveto 3 (+ h 5))
        (ccl:move-to v 3 (+ h 5))
        (format v "~5,2F" min)
        (loop for i below l 
              for ? = (aref b i)
              for x = (floor (rescale i 0 l xm w))
              for y = (+ ym (- h (floor (rescale ? min max ym h)) ))
              do 
              (ccl:fill-oval v ccl:*black-pattern* 
                             x y (+ x 2) (+ y 2)))))))

(defmacro ranshow (s f &optional a l)
  `(let ((w (first (ccl:windows :class (find-class 'ranwin)))))
     (if w
       (progn
         (ccl:set-window-title w ,s)
         (setf (slot-value w 'ran) ,f
               (slot-value w 'arg) ,a)
         (initialize-instance w)
         (ccl:invalidate-view w t)
         w)
       (ccl:window-show
        (make-instance 'ranwin :window-title ,s :random ,f :args ,a )))))

#|
(ranshow "Discrete Uniform"   #'random 10)
(ranshow "Continuous Uniform" #'random 1.0)

;;;
;;; These two forms of linear distribution return float or integer x<n.
;;; lowpass-random prefers lower numbers, highpass-random prefers higher.
;;; Density = f(x)=2*(1-x)     {x 0<1}
;;; Mean = .2929
;;;

(ranshow "Discrete Highpass (linear)"   #'highpass-random 10)
(ranshow "Continuous Highpass (linear)" #'highpass-random 1.0)

(ranshow "Discrete Lowpass (linear)"   #'lowpass-random 10)
(ranshow "Continuous Lowpass (linear)" #'lowpass-random 1.0)

;;;
;;; Triangular random distribution prefers numbers in the middle.
;;; If n is integer, either integer or ratios will be returned.
;;; Mean = n/2
;;; 

(ranshow "Discrete Bandpass (triangular)"   #'bandpass-random 10)
(ranshow "Continuous Bandpass (triangular)" #'bandpass-random 1.0)

;;;
;;; Exponential random distribution returns floating point x>0. 
;;; lambda is a stretching factor; increase to prefer smaller numbers.
;;; value returned is unbounded, but when lambda is 1, x is %99.9 of
;;; the time less than 6.9077554, ie -log(.001)
;;; Density = f(x)=(exp -x)
;;; Mean = 1
;;;

(ranshow "Exponential (lambda=.1)" #'exp-random .1)
(ranshow "Exponential (lambda=1)"  #'exp-random 1)
(ranshow "Exponential (lambda=10)" #'exp-random 10)

;;;
;;; Normal (Gaussian) distribution returns unbounded x. The spread (standard
;;; deviation, or mu) in this implementation is 1.0 centered at 0, so 68.26%
;;; of the results are -1<=x<=1, and 99.74% of the results are -3<=x<=3.
;;;

(ranshow "Normal" #'normal-random)

;;;
;;; Beta distribution returns 0<=x<=1. A and B control density behavior.
;;; When a=b=1 uniform distribution results. When a=b, the distribution
;;; is symetric around .5.  When a<1 and b<1 then density of large and
;;; small numbers increases. When a>1 and b>1, density is similar to the
;;; normal distribution.
;;;

(ranshow "Beta (a=b=1)"  #'beta-random '(1.0 1.0))
(ranshow "Beta (a=b=.2)" #'beta-random '(.2 .2))
(ranshow "Beta (a=b=2)"  #'beta-random '(2.0 2.0))

|#

) ; end #+mcl

