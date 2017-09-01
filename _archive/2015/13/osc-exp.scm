;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
(osc:open 7779 7825)


(define (quartetlet-1 pan totaldur pitches)
  (let* (
   (rhythms (make-cycle '(s s s s q)))
   (amps (make-cycle '(1 1 1 1 1 1 )))
   )
  (process with curtime = 0
             for t = (elapsed #t) ; get true score time
             for dist = 5
             for pct = .025
             for origdur = 1
             for tem = 72
             for rhy = (rhythm (next rhythms) tem)
             for dur = rhy
             for amp = (next amps)
             for pitch = 0
; faster tempo, the quieter
            until (> curtime totaldur)
            do
              (if (> amp 0)
                (set! pitch (hertz (next pitches)))
                (set! pitch 0)
                )
              (osc:message "/router" 1 t dur amp pitch pan dist pct )
              
              (set! curtime t)
              (wait rhy)
            )
      )
)
(sprout (list 
         (quartetlet-1 45 10 (make-heap '(gs4 b4 a4 fs4)))
))