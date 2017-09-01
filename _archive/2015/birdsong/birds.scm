
; 21 segments for /Users/benmca/Music/Portfolio/_Foley/2016.04.24.La Birdsong.wav
(define idxdur '((05.985 q)
(08.375 h)
(12.519 q)
(14.776 h)
(20.002 h)
(22.652 q)
(24.289 q)
(25.575 q)
(26.820 q)
(27.993 q)
(28.995 q)
(30.291 q)
(31.016 q)
(31.573 q)
(32.275 q)
(33.621 q)
(35.064 q)
(36.687 q)
(37.930 q)
(38.960 q)
(40.773 q)
))

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
(define (remix tem pan amp totaldur iter rhythms)
  (let* (
   (origtem 60)
   )
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for i = (next iter)
             for dist = 5
             for pct = .025
             for idx = (nth idxdur i)
             for indx = (nth idx 0)	
;             for origdur = (rhythm (nth idx 1) origtem)
;             for endx = (+ indx origdur)
;             for r = (rhythm (nth idx 1) tem)
             for r = (rhythm (next rhythms) tem)
             ;for d = (* .5 (rhythm r tem))
             for d = (interp t 0 .25 totaldur .01)
;             for p = (/  tem origtem)
             for p = 1
; faster tempo, the quieter
            ;for a = (+ .5 (- amp (/ tem 210.0)))
             for a = 1
            until (> curtime totaldur)
            do
            (cs:i 1 t d a p pan dist pct indx "/Users/benmca/Music/Portfolio/_Foley/2016.04.24.La Birdsong.wav")
;            (cs:i 1 t d a p pan dist pct indx)
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

(define straight (make-cycle '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)))
(define heap (make-heap '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)))
(define rhythms (make-heap '(s e e. s. )))
(define rhythms-pulse (make-heap '(q)))
(define pulse-indexes (make-cycle '(2)))


(sprout (list 
    (remix 240.0 10 1.0 10 heap rhythms) 
    (remix 120.0 20 1.0 10 heap rhythms) 
    (remix 60.0 45 1.0 15 straight rhythms) 
    (remix 60.0 0 1.0 15 pulse-indexes rhythms-pulse) 
    (remix 60.0 90 1.0 15 pulse-indexes rhythms-pulse) 
    (remix 120.0 70 1.0 10 heap rhythms) 
    (remix 240.0 80 1.0 10 heap rhythms) 
    (make-reverb-note 20)
    ) "remix.sco" :play #t :orchestra "index.orc" :header "f1 0 262144 1 \"jam.aif\" 0  0 0\nf2 0 16384 9 .5 1 0
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