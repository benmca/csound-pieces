
; 14 segments for jam.aif
(define idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)
    (2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)))

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
(define (remix tem pan amp totaldur)
  (let* (
   (iter (make-cycle (list 
    (make-cycle '(5 6 7 8))
    (make-cycle '(5 6 7 8))
    (make-heap '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 ))
    (make-heap '(5 6 7 8))
    )))	     
   (origtem (quarterDur->tempo (- .697 .018)))
   )
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for i = (next iter)
             for dist = 5
             for pct = .025
             for idx = (nth idxdur i)
             for indx = (nth idx 0)	
             for origdur = (rhythm (nth idx 1) origtem)
             for endx = (+ indx origdur)
             for r = (rhythm (nth idx 1) tem)
             for d = (rhythm r tem)
             for p = (/  tem origtem)
; faster tempo, the quieter
            for a = (+ .5 (- amp (/ tem 210.0)))
            until (> curtime totaldur)
            do
            (cs:i 1 t d a p pan dist pct indx)
            (set! curtime t)
            (wait r)
            )
      )
  ) 
;
; make-reverb-note
;   Turn instrument on for duration of score
;
(define (make-reverb-note dur)
  (process repeat 1 do
  (cs:i 99 0.0 dur 5))
)

(sprout (list 
    (remix 100.0 10 1.0 30) 
    ) "remix.sco" :play #t :orchestra "jam.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
\n")


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
    ) "remix.sco" :play #t :orchestra "jam.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
\n")

; A cleaner, less verbose way to generate the same
(define mixes '())

(loop for i from 100.0 to 200.0 by 10.0
    do
    (set! mixes (append mixes (list (remix i 45 1.0 60))))
    )

(sprout mixes "remix.sco" :play #t :orchestra "jam.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
    \n")

; a single instance of remix, with reverb note
(sprout (list (remix 100.0 45 1.0 30) (make-reverb-note 40)) "remix.sco" :play #t :orchestra "jam.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
\n")