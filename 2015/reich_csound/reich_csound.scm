;
;; Steve Reich's Piano Phase
;

; To run code put your cursor after each expression and press
; Command-Return then check the console window for any output.

(define (piano-phase endtime keys dur)
  (let* (
   (pat (make-cycle keys))
   )
  (process with curtime = 0
           for t = (elapsed #t) ; get true score time
           for amp = 10000
           for attack = (* dur .1)
           for release = (* dur .5)
           while (< (elapsed) endtime)
           do 
           (cs:i 1 t dur amp (hertz (next pat)) attack release)
;           (mp:midi :key (next pat) :dur rate)
           (wait dur)))
)


; Play the example in real time out your midi port

(let ((keynums (keynum '(e4 fs4 b4 cs5 d5 fs4 e4 cs5 b4 fs4 d5 cs5)))
      (stoptime 20))
  (sprout (list (piano-phase stoptime keynums .167)
                (piano-phase stoptime keynums .170))
            "reichtest.sco" :play #t :orchestra "reich_csound.orc" :header "f1	0	4096	10 1		; use GEN10 to compute a sine wave\n")


