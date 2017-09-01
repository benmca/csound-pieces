; 1503.ORC
; CREATED BY PER BYRNE VILLEZ 1997 HBYRNE@PAVILION.CO.UK


sr      =       44100   ; AUDIO RATE IN Khz
kr      =       4410    ; CONTROL RATE IN Khz
ksmps   =       10      ; CONTROL SAMPLES
nchnls  =       2       ; NUMBER OF AUDIO CHANNELS

        instr 1503      ; INSTRUMENT NUMBER
idur    =       p3                  ; ASSIGN  P-FIELED 3 TO IDUR (NOTE DURATION)
ifq     =       p4                  ; ASSIGN P-FIELD 4 TO ifq
     
; JITTER  ADDS RANDOM FLUCTUATION TO THE FUNDAMENTAL

k50     randi   .01,1/.05, .8135        ; RANDOM JITTER
k60     randi   .01,1/.111, .3111
k70     randi   .01,1/1.219, .6711

kjitter =       (k50 + k60 + k70) * ifq

ksing   linseg  ifq-2 ,p3*.02 ,ifq-3 ,p3*.02 ,ifq ,p3*.96 ,ifq-4 ; FUND  MOVEMENT
kdur    linseg  1,p3*.02 ,1 ,p3*.02 ,.5 ,p3*.96 ,.5 ; kdur CHANGE
kdec    linseg  1,p3*.02 ,1 ,p3*.02 ,.5 ,p3*.96 ,.5 ; kdec CHANGE
kenv    linseg  10000 ,p3*.02 ,10000 ,p3*.02 ,8000 ,p3*.76 ,200 ,p3*.2 ,0;

kf0     =       ksing+kjitter

ktwist  linseg  1 ,p3*.7 ,1.2 ,p3*.2,1.1 ,p3*.1 ,1 ; TWIST FORMANT FREQUENCY OF a1
ktwist2 linseg  1 ,p3*.7 ,1.21 ,p3*.2 ,1.12 ,p3*.1 ,1; TWIST FORMANT FREQUENCY OF a2

                                                                      
; LEFT CHANNEL  FOF OSCILLATOR
a1      fof     kenv, ksing, ktwist, 0, 0, .003, kdur, kdec, 200, 1, 19, idur,0 ,1
; RIGHT CHANNEL  FOF OSCILLATOR
a2      fof     kenv, ksing,ktwist2, 0, 0, .003, kdur, kdec, 200, 2, 19, idur,0 ,1 
 
        outs    a1 ,a2    ; OUTPUT  SIGNALS  a1 ON LEFT AND a2 ON RIGHT
        endin
