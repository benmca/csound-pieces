;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;
;; Csound output
;


(define (ransco len lb ub amp)
  (let* ((rhys (make-heap '(q s e s. 1/32 1/64))))
    (process repeat len
             for t = (elapsed #t) ; get true score time
             for k = lb then (between lb ub)
             for r = (next rhys)
             for d = (rhythm r)
             do
             (cs:i 1 t d k amp)
             (wait (rhythm r)))))

(sprout (ransco 100 60 72 1000) "test.sco" :play #t
        :orchestra "simp.orc")



(define g1 (make-cycle (list 
                          (make-cycle '(e4) :for 64)
                          (make-cycle '(e4) :for 4)
                          (make-cycle '(d4) :for 12)
                          (make-cycle '(d4) :for (* 9 16))
                          (make-cycle '(c4) :for (* 12 16))
                          (make-cycle '(d4) :for 16)
                          (make-cycle '(c4) :for 32)
                          (make-cycle '(e4) :for (* 9 16))
                          (make-cycle '(r) :for 16)
                          )))


(define (gtr1 )
  (let* ((rhys (make-heap '(q s e s. 1/32 1/64))))
    (process repeat 100
             for t = (elapsed #t) ; get true score time
             for k = (keynum (next g1))
             for r = (next rhys)
             for d = (rhythm r)
             do
             (cs:i 1 t d k 1000)
             (wait (rhythm r)))))


(sprout (gtr1) "test.sco" :play #t
        :orchestra "simp.orc")


    (define idxdur '((2.292000 0.175000 e)(2.467000 0.162000 e)(2.629000 0.186000 e)(2.815000 0.157000 e)
        (2.972000 0.156000 e)(3.128000 0.196000 e)(3.324000 0.170000 e)(3.494000 0.145000 e)(3.639000 0.177000 e)
        (3.816000 0.173000 e)(3.989000 0.157000 e)(4.146000 0.184000 e)(4.330000 0.165000 e)(4.495000 0.166000 e)
        (4.661000 0.173000 e)(4.834000 0.166000 e)(5.000000 0.156000 e)(5.156000 0.177000 e)(5.333000 0.158000 e)
        (5.491000 0.151000 e)(5.642000 0.171000 e)(5.813000 0.167000 e)(5.980000 0.154000 e)(6.134000 0.151000 q)
        (6.285000 0.352000 q)))
(define i (between 0 22))

(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (error "Index out of bounds.")
    (if (eq? n 0)
      (car l)
      (nth (- n 1) (cdr l)))))

(define idx (nth i idxdur))
   (define indx (nth 0 idx))	
    (define origdur (nth 1 idx) )

(print indx "," origdur)