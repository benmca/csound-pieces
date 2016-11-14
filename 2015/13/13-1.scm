;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-

; given the dur of a quarter, return tempo
(define (quarterDur->tempo quarterdur)
  (* 60 (/ 1.0 quarterdur)) 
  )



(define (gtr top_tem bottom_tem pan amp pitch totaldur )
  (let* (
   (rhythms (make-heap '(s)))
   )
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for dist = 5
             for pct = .025
             for origdur = 1
             for tt = top_tem
             for bt = bottom_tem
             for tem = (interp (modulo t 5.0) 0.0 tt 2.5 bt 5.0 tt)
             for r = (rhythm (next rhythms) tem)
             for d = r
; faster tempo, the quieter
            until (> curtime totaldur)
            do
            (cs:i 1 t d amp pitch pan dist pct )
            (set! curtime t)
            (wait r)
            )
      )
)

(define pitches '(a4 cs4 e4 gs4))
(define calls '())

(for-each (lambda (x) 
            (display (hertz x))) pitches)

(for-each (lambda (x)
            (let ( (y (hertz x)) )
              (set! calls (append calls (list (gtr 120 (between 120 60) 45 1.0 y 10))))
              )
            )
            pitches
)


(sprout calls
"13-1.sco" :play #t :orchestra "13-1.orc")


(sprout (list 
         (gtr 120 60 45 1.0 50)
         (gtr 120 120 45 1.0 50)
         (make-reverb-note 55)
         ) 
"13-1.sco" :play #t :orchestra "13-1.orc")


;
; make-reverb-note
;   Turn instrument on for duration of score
;
(define (make-reverb-note dur)
  (process repeat 1 do
  (cs:i 99 0.0 dur 5))
)
