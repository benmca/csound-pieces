;
;; Steve Reich's Piano Phase
;

; To run code put your cursor after each expression and press
; Command-Return then check the console window for any output.

(define (piano-phase endtime keys rate pan)
  (let* (
   (pat (make-cycle keys))
   )
  (process with curtime = 0
           for t = (elapsed #t) ; get true score time
           for amp = 10000
           for attack = (* rate .01)
           for release = (* rate .5)
           for dist = 2
           for pct = .025
           while (< (elapsed) endtime)
           do 
           (cs:i 1 t rate amp (hertz (next pat)) attack release pan dist pct)
;           (mp:midi :key (next pat) :dur rate)
           (wait rate)))
)


(define (make-reverb-note dur)
  (process repeat 1 do
  (cs:i 99 0.0 dur 5))
)
; Play the example in real time out your midi port

(define (emit-phase notelist stoptime)
(let ((keynums (keynum notelist)))
  (sprout (list 
           (piano-phase stoptime keynums .167 40)
           (piano-phase stoptime keynums .170 50)
;           (piano-phase stoptime keynums .164 30)
;           (piano-phase stoptime keynums .174 60)
                (make-reverb-note (+ stoptime 10))
                )
          "reichtest.sco" 
          :play #t 
          :orchestra "reich_csound.orc" 
          :header "f1   0    4096 10 1"
          )
)
)

(emit-phase '(e4 fs4 b4 cs5 d5 fs4 e4 cs5 b4 fs4 d5 cs5) 20)
(emit-phase '(e5 fs5 b5 cs5 d5 fs2 e2 cs2 b2 fs4 d5 cs5) 100)

(emit-phase '(e3 f3 c3 b3 e3 f3 c3 b3 a3) 20)


                                                                                            


