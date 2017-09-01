;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-

; given the dur of a quarter, return tempo
(define (quarterDur->tempo quarterdur)
  (* 60 (/ 1.0 quarterdur)) 
  )

(define (timesig_1stLine starttime tem pan totaldur)
  (let* (
         (rhythms (make-cycle '(e s s s s     s s s    s q e )))
         (insts (make-cycle '(3 3 1 3 3 1 2 1   1 1 1 )'(3 3 1 3 3 1 2 1   1 1 1 )))
         (amps (make-cycle '(1 1 1 1 1 1 1 1 0 0 0)))
)
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for inst = (next insts)
             for dist = 5
             for pct = .025
             for origdur = 1
             for r = (rhythm (next rhythms) tem)
             for dur = r
             for pitch = 1
             for amp = (next amps)
            until (> curtime totaldur)
            do
            (if (> curtime starttime)
             	( 
               (if (= inst 3)
              		(set! pitch .25)
               )
              (cs:i inst t dur amp pitch pan dist pct)
              (wait r)
               )
              )
              (set! curtime t)
)))

(list '(3 3 1 3 3 1 2 1   1 1 1 )'(3 3 1 3 3 1 2 1   1 1 1 )

;
; make-reverb-note
;   Turn instrument on for duration of score
;
(define (make-reverb-note dur)
  (process repeat 1 do
  (cs:i 99 0.0 dur 5))
)


(sprout (list 
         (timesig_1stLine 0 60.0 45 20.0 )
         (make-reverb-note 55)
         ) 
"timesig2.sco" :play #t :orchestra "timesig2.orc" :header "f 1 0 16384 10 1\nf 2 0 256 7 0 128 1 0 -1 128 0\nf 3 0 256 7 1 128 1 0 -1 128 -1\nf4 0 131072 1 \"/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/OnTheHour_Distorted.wav\"\nf5 0 16384 9 .5 1 0\n"
)


