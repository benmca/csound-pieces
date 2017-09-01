;
; This file sends osc messages to osc_router.csd, contained in 
; ../osc_plumbing
;
;

(osc:open 7779 7825)

; given the dur of a quarter, return tempo
(define (quarterDur->tempo quarterdur)
  (* 60 (/ 1.0 quarterdur)) 
  )



(define (quartetlet-1 pan totaldur pitches)
  (let* (
   (rhythms (make-cycle '(s s s s s s s s+q q)))
   (amps (make-cycle '(0 1 0 1 0 1 0 1 0)))
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


(define (quartetlet-2 pan totaldur pitches)
  (let* (
   (rhythms (make-cycle '(e e e e+q q)))
   (amps (make-cycle '(1 1 1 1 0)))
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

(define (quartetlet-3 pan totaldur pitches)
  (let* (
   (rhythms (make-cycle '(s q e.+q q)))
   (amps (make-cycle '(1 1 1 0)))
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

(define (quartetlet-4 pan totaldur pitches)
  (let* (
   (rhythms (make-cycle '(e s s s s s s+q q)))
   (amps (make-cycle '(1 1 1 1 1 1 1 0)))
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
         (quartetlet-1 10 300 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-2 30 300 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-3 60 300 (make-heap '(e5 fs5)))
         (quartetlet-4 45 300 (make-heap '(fs3)))
         )
)

(define (launch num)
  (let*  (
   (rhythms (make-cycle '(w w+h w+w w+w+w)))
)
  (process 
           for r = (rhythm (next rhythms) 72)
           for iternum from 0 to num
           do
           (set! iternum (+ iternum 1))
           (sprout (list 
         (quartetlet-1 10 5 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-2 30 5 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-3 60 5 (make-heap '(e5 fs5)))
         (quartetlet-4 45 5 (make-heap '(fs3)))
         )
                    )
           (wait r)
           )
  )
)
(sprout (launch 50))
