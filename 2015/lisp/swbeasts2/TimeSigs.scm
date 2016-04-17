;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-

; given the dur of a quarter, return tempo
(define (quarterDur->tempo quarterdur)
  (* 60 (/ 1.0 quarterdur)) 
  )

;
; remix - based on idxdur, remix sections of jam.aif loop
;
; args: 
; - tem: tempo (should be a float)
; - pan: angle to pan signal (between 0 and 90)
; - amp: attenuate signal (between 0.0 and 1.0)
; - totaldur: process continues until totaldur is exceeded
; 


(define heaplist (loop with foo = '()
      for x from 0 to 40
      do
      (set! foo (concat foo x))
      finally (return foo)) )

(define (timesig_mix tem pan amp totaldur pitch)
  (let* (
   (iter (make-cycle (list 
    (make-heap heaplist)
    )))	     
   (origtem 60)
   )
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for i = (next iter)
             for dist = 5
             for pct = .025
             for origdur = 1
             for r = (rhythm 'q tem)
             for d = (* .1 (modulo t 10))
             for p = (/  tem origtem)
; faster tempo, the quieter
            until (> curtime totaldur)
            do
            (cs:i 1 t d  1.0 (* pitch p) pan dist pct i "TimeSignal2.wav")
            (set! curtime t)
            (wait r)
            )
      )
  ) 

(sprout (list 
         (timesig_mix 60.0 10 1.0 50 1.0)
         (timesig_mix 60.0 45 1.0 50 1.0)
         (timesig_mix 60.0 80 1.0 50 1.0)
         (timesig_mix 60.0 10 1.0 50 .5)
         (timesig_mix 60.0 45 1.0 50 .5)
         (timesig_mix 60.0 80 1.0 50 .5)
         (timesig_mix 60.0 10 1.0 50 .25)
         (timesig_mix 60.0 45 1.0 50 .25)
         (timesig_mix 60.0 80 1.0 50 .25)
         (make-reverb-note 55)
         ) "timesig.sco" :play #t :orchestra "timesig.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
    \n")

;
; make-reverb-note
;   Turn instrument on for duration of score
;
(define (make-reverb-note dur)
  (process repeat 1 do
  (cs:i 99 0.0 dur 5))
)
; A verbose way to sprout this process at multiple tempos.
; The result is a Nancarrow-esque tempo canon
(sprout (list 
    (remix 100.0 10 1.0 30) 
    (remix 110.0 30 1.0 30) 
    (remix 120.0 60 1.0 30) 
    (remix 130.0 80 1.0 30) 
    (remix 140.0 10 1.0 30) 
    (remix 150.0 30 1.0 30) 
    (remix 160.0 60 1.0 30) 
    (remix 170.0 80 1.0 30) 
    (remix 180.0 10 1.0 30) 
    (remix 190.0 30 1.0 30) 
    (remix 200.0 60 1.0 30) 
    ) "remix.sco" :play #t :orchestra "sndwarp.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
\n")

; A cleaner, less verbose way to generate the same
(define mixes '())

(loop for i from 100.0 to 200.0 by 10.0
    do
    (set! mixes (append mixes (list (remix i 45 1.0 60))))
    )

(sprout mixes "remix.sco" :play #t :orchestra "sndwarp.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
    \n")

; a single instance of remix, with reverb note
(sprout (list (remix 100.0 45 1.0 30) (make-reverb-note 40)) "remix.sco" :play #t :orchestra "sndwarp.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
\n")