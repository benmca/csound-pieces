;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-
;;; -*- syntax: Lisp; font-size: 16; line-numbers: no; -*-

(define (mom count)
  (let* (
   (rhythms (make-cycle '(e s q e. s.)))
   )
    (loop repeat count
          do
          (if (odds .5)
            (sprout child '(e3 gs4 b4 ds4))
            ))
))

(osc:open 7779 7825)

(define (launch num)
  (let*  (
   (rhythms (make-cycle '(e s s s s s s+q q)))
)
  (process 
           for r = (rhythm (next rhythms) 120)
           for iternum from 0 to num
           do
           (set! iternum (+ iternum 1))
           (sprout (list 
         (quartetlet-1 10 10 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-2 30 10 (make-heap '(gs4 b4 a4 fs4)))
         (quartetlet-3 60 10 (make-heap '(e5 fs5)))
         (quartetlet-4 45 10 (make-heap '(fs3)))
         )
                    )
           (wait r)
           )
  )
)
(sprout (launch 50))

(define (play-notes pitches t dur amp pan dist pct)
                      (loop for p in pitches
                            do
                            (osc:message "/router" 1 t dur amp (hertz p) pan dist pct )
                            )
)


(define (child pan pitches rhythms tem len)
  (process for t = (elapsed #t)
             for dist = 5
             for pct = .025
             for origdur = 1
             for rhy = (rhythm (next rhythms) tem)
             for dur = (* rhy 1.5)
             for amp = 1
             for pos = (between 0 (length pitches))
             for change = (between -2 2)
             repeat len
            do
            (if (odds .5)
                (begin 
                  (define newpitch (note (transpose (keynum (nth pitches pos)) change)))
                  (list-set! pitches pos newpitch))
                )
            (play-notes pitches t dur amp pan dist pct)
            (wait rhy)
))

(define (mom rhythms tem pitches)
  (process with curtime = 0
           for rhy = (rhythm (next rhythms) tem)
           for i from 1 to 20
             do
             (print "momcount:" momcount)
             (print pitches)
             (if (odds .5)
               (begin
                 (if (odds .5)
                   (begin
                     (set! idcounter (+ idcounter))
                     (sprout (child (between 0 90) (list (nth pitches (between 0 (length pitches)))) rhythms tem 5) :id idcounter)
                   )
                   (begin
                     (set! idcounter (+ idcounter))
                     (sprout (child (between 0 90) (list (nth pitches 0)) rhythms tem 5) :id idcounter)
;                     (sprout (child (between 0 90) 1 pitches rhythms tem 5) :id idcounter)
                     )
                   )
                 )
               (begin
                 (if (and (odds .3) (< momcount maxmoms)) 
                 (begin 
                   (set! momcount (+ momcount 1))
                   (set! idcounter (+ idcounter))
;                   (sprout (mom rhythms tem pitches) :id idcounter)
                   (print "sprouting mom")
                   )
                 )
               )
               )
             (if (= i 20)
               (begin
                   (set! momcount (- momcount 1))
                   (print "decrementing mom")
                 )
               )
             (wait rhy)
))
(define maxmoms 3)
(define momcount 0)
(define idcounter 1)

(sprout (list 
         (mom (make-cycle '(s e s. e. q)) 240 '(e4 gs4 b4 ds4) )
         (mom (make-cycle '(s e s. e. q)) 120 '(e4 gs4 b4 ds4) )
))

