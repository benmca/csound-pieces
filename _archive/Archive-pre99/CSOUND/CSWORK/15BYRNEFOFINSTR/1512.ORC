; TUVAWATER
; 1513.ORC
; CREATED BY PER BYRNE VILLEZ 1997 HBYRNE@PAVILION.CO.UK

sr      =      	44100
kr    	=     	4410
ksmps  	=     	10
nchnls	=		1

        instr   1513

ifq     =       p4

; ENVELOPE FOR SINGING  HARMONIC  LEVELS 
kflvl   linseg  7.8 ,p3*.05,7.8,p3*.05,12.4,p3*.2,12.4, p3*.05, 7.8 ,p3*.05,7.8,p3*.1,12.4,p3*.4,12.4
kflvl2  linseg  21.9,p3*.05,21.9,p3*.05,16.9,p3*.2,16.9, p3*.05, 21.9,p3*.05,21.9,p3*.1,16.9,p3*.4,16.9

; CONSTANT
kconst  =       32000

; NORMALISATION FUNCTION. PRODUCES THE HIGHEST POSSIBLE LEVEL WITHOUT DISTORTION
knorm   =       1/(12+kflvl+kflvl2+26.9+45.1)

; CONVERT FORMANT  AMPLITUDE FROM -dB TO Csound LVLS
kamp1   =       (kconst*12)*knorm       ;formant1 amplitude
kamp2   =       (kconst*kflvl)*knorm    ;moved by k80
kamp3   =       (kconst*kflvl2 )*knorm ; moved by k90
kamp4   =       (kconst*26.9)*knorm     ;formant4  amplitude
kamp5   =       (kconst*45.1)*knorm     ;formant5  amplitude


;    JITTER
k5      randi   .01,1/.05, .8135
k6      randi   .01,1/.111, .3111
k7      randi   .01,1/1.219, .6711
kjitter =       (k5 + k6 + k7) * p4

; SUM OF FUNDAMENTAL  AND JITTER
kfq     =       p4 +kjitter

; FUNDAMENTAL FREQUENCY DISPLACEMENT ENVELOPES
kd1     linseg  1, p3*.3, 1, p3*.7, 1.1
kd2     linseg  1, p3*.3, 1, p3*.7, 1.2
kd3     linseg  1, p3*.3, 1, p3*.7, 1.3
kd4     linseg  1, p3*.3, 1, p3*.7, 1.4
kd5     linseg  1, p3*.3, 1, p3*.7, 1.5

; SUM THE KFREQ  WITH kd DISPLACEMENTS
kfreq1  =       kfq*kd1 
kfreq2  =       kfq*kd2 
kfreq3  =       kfq*kd3
kfreq4  =       kfq*kd4
kfreq5  =       kfq*kd5

; xoormif MID SINGING  HARMONICS 
ksing1  linseg  953,p3*.05,953,p3*.05,1252,p3*.2,1252, p3*.05, 953,p3*.05,953,p3*.1,1252,p3*.4,1252

ksing2  linseg  2552,p3*.05,2552,p3*.05,2495,p3*.2,2495, p3*.05, 2552,p3*.05,2552,p3*.1,2495,p3*.4,2495

; OCTIVIATION
koct    linseg  0, (p3-3)*.5, 0, (p3-3)*.2, 6, (p3-3)*.3, 8 ; SUBTRACTED 3 FROM p3 TO ALLOW REVERB DECAY

ip3     =       p3-3 

a1      fof     kamp1,kfreq1,317 ,koct, 80 ,.003,.02,.007,50,1,2,ip3,0,1
a2      fof     kamp2,kfreq2,ksing1 ,koct, 90 ,.003,.02,.007,50,1,2,ip3,0,1
a3      fof     kamp3,kfreq3,ksing2 ,koct,120,.003,.02,.007,50,1,2,ip3,0,1
a4      fof     kamp4,kfreq4,3417,koct,130,.003,.02,.007,50,1,2,ip3,0,1
a5      fof     kamp5,kfreq5,5861,koct,140,.003,.02,.007,50,1,2,ip3,0,1

; MIX ALL FOF GENERATORS
a6      =       a1 + a2 + a3 + a4 + a5

; ROUTE a6 THROUGH 2 DIFFERENT REVERB SETTING
ar1     nreverb a6, 10, 0           ; REVERB GENERATOR1
ar10    nreverb a6, 7, 1            ; REVERB GENERATOR2
                            
; ADD THESE TOGETHER (YOU CAN'T ADD THINGS APART!)
ar100   =       ar1+ar10

; OUTPUT a6 WITH A DEGREE OF THE GORGEOUS REVERB YOU MADE EARLIER
        out     a6+(ar100*.03)
 
        endin
