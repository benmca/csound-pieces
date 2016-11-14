
(define (f1)
  (let* (
   (rhythms (make-heap '(s q e)))
   )
   (process repeat 3
            do
             (cs:i 1 t dur 1 220 45 5 .025)
              (set! curtime t)
              (wait rhy)
            )
      )
)

(define (launch num)
  (let*  (
   (rhythms (make-cycle '(e s s s s s s+q q)))
)
  (process 
           for r = (rhythm (next rhythms) 120)
           for iternum from 0 to num
           do
           (sprout 
            (f1)
                   "test.sco" :write #f)
           (wait r)
           )
  )
)
(sprout (launch 5))

