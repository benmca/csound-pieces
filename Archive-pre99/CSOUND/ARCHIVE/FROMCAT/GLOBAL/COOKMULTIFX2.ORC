sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 2
zakinit  50, 1
;Based on Hans Mikelson's MultiFX orc
;----------------------------------------------------------------------------------
ga01     init 0
ga02     init 0
ga03     init 0
ga04     init 0
ga05     init 0
ga06     init 0
ga07     init 0
ga08     init 0
;----------------------------------------------------------------------------------
instr    1 ; Input Mono
ilevl    = p4 ; Output level
iout     = p5 ; Out
a1       soundin  "Marimba.aif"
zawm     a1*ilevl, iout
endin
;----------------------------------------------------------------------------------
instr    2 ; Input Stereo
ilevl    = p4 ; Output level
iout1    = p5 ; Out 1
iout2    = p6 ; Out 2
a1, a2   soundin  "AllOfMeStereo.aif"
zawm     a1*ilevl, iout1
zawm     a2*ilevl, iout2
endin
;----------------------------------------------------------------------------------
instr    3 ; Returns 1 to 8
iout1    = p4
iout2    = p5
iout3    = p6
iout4    = p7
iout5    = p8
iout6    = p9
iout7    = p10
iout8    = p11
aout1    = ga01
aout2    = ga02
aout3    = ga03
aout4    = ga04
aout5    = ga05
aout6    = ga06
aout7    = ga07
aout8    = ga08
ga01     = 0
ga02     = 0
ga03     = 0
ga04     = 0
ga05     = 0
ga06     = 0
ga07     = 0
ga08     = 0
zawm     aout1, iout1
zawm     aout2, iout2
zawm     aout3, iout3
zawm     aout4, iout4
zawm     aout5, iout5
zawm     aout6, iout6
zawm     aout7, iout7
zawm     aout8, iout8
endin
;----------------------------------------------------------------------------------
instr    4 ; 6-Stage Phaser from Sean Costello
ilevl    = p4     ; Output level
in1      = p5     ; In
iout     = p6     ; Out
irate    = p7     ; LFO rate
iphase   = p8/360 ; LFO phase in degrees
ifdbk    = p9     ; Feedback
imix     = p10    ; Mix: 0=Dry 1=Phase
afdbk    init 0
ay1      init 0
ay2      init 0 
ay3      init 0
ay4      init 0
ay5      init 0
ay6      init 0
ain      zar  in1
ain      = ain + afdbk
alfo     oscili  1.24, irate, 2, iphase
alfo     = 1.24 - alfo - .9
ax1       delay1  ain
ay1      = alfo*ain + ax1 - alfo*ay1
ax2       delay1  ay1
ay2      = alfo*ay1 + ax2 - alfo*ay2
ax3       delay1  ay2
ay3      = alfo*ay2 + ax3 - alfo*ay3
ax4       delay1  ay3
ay4      = alfo*ay3 + ax4 - alfo*ay4
ax5       delay1  ay4
ay5      = alfo*ay4 + ax5 - alfo*ay5
ax6       delay1  ay5
ay6      = alfo*ay5 + ax6 - alfo*ay6
afdbk    = ay6*ifdbk
zawm     (ain*imix + ay6*(1 - imix))*ilevl, iout
endin
;----------------------------------------------------------------------------------
instr    5 ; Chorus/Flanger
ilevl    = p4      ; Output level
in1      = p5      ; In
iout     = p6      ; Out
idelay   = p7/1000 ; Delay in ms
idepth   = p8/2000 ; LFO depth in ms
irate    = p9      ; LFO rate
iwave    = p10     ; LFO waveform
iphase   = p11/360 ; LFO phase in degrees
ifdbk    = p12     ; Feedback
imix     = p13     ; Mix: 0=Dry 1=Flange
imax     = (idelay + idepth)*2
ain      zar  in1
alfo     oscili  idepth, irate, iwave, iphase
alfo     = alfo + idepth
aflng    flanger  ain, alfo + idelay, ifdbk, imax
aout     = (ain*imix + aflng*(1 - imix))*ilevl
zawm     aout, iout
endin
;----------------------------------------------------------------------------------
instr    6 ; Delay
ilevl    = p4      ; Output level
in1      = p5      ; In
iout     = p6      ; Out
idelay   = p7/1000 ; Delay in ms
ifdbk    = p8      ; Feedback
ifreq    = p9      ; Cutoff freq
imix     = p10     ; Mix: 0=Dry 1=Del
afilt    init 0
ain      zar  in1
adelay   delay  ain + afilt*ifdbk, idelay
afilt    butterlp  adelay, ifreq
aout     = ain*imix + afilt*(1 - imix)
zawm     aout*ilevl, iout
endin
;----------------------------------------------------------------------------------
instr    7 ; 4-Tap Multitap
ilevl    = p4       ; Output level
in1      = p5       ; In
iout     = p6       ; Out
idel1    = p7/1000  ; Tap1 delay
idel2    = p8/1000  ; Tap2 delay
idel3    = p9/1000  ; Tap3 delay
idel4    = p10/1000 ; Tap4 delay
igain1   = p11      ; Tap1 gain
igain4   = p12      ; Tap4 gain
igain2   = p11 - (p11 - p12/3) ; Tap2 gain
igain3   = p12 + (p11 - p12/3) ; Tap3 gain
ifdbk    = p13      ; Overall feedback
imix     = p14      ; Mix: 0=Dry 1=Multitap
afdbk    init 0
ain      zar  in1
ain      = ain + afdbk*ifdbk
atap1    delay  ain, idel1
atap2    delay  atap1, idel2
atap3    delay  atap2, idel3
atap4    delay  atap3, idel4
amulti   = atap1*igain1 + atap2*igain2 + atap3*igain3 + atap4*igain4
afdbk    = amulti
aout     = amulti*imix + ain*(1 - imix)
zawm     aout*ilevl, iout
endin
;----------------------------------------------------------------------------------
instr    8 ; Harmoniser
ilevl    = p4                              ; Output level
in1      = p5                              ; In
iout     = p6                              ; Out
ishift   = p7/120                          ; Shift in 1/100th semitones +/-
idelay   = p8/1000                         ; Base delay time in ms
imix     = p9                              ; Mix: 0=Dry 1=Harmonized
imin     = 1/kr                            ; Minimum delay
ain      zar  in1                          ; Input
asaw1    oscili  idelay, ishift, 3         ; Saw   0 degrees
asaw2    oscili  idelay, ishift, 3, .5     ; Saw 180 degrees
ax       delayr   imin + idelay            ; Create delay line
atap1    deltap3  imin + asaw1             ; Tap 1
atap2    deltap3  imin + asaw2             ; Tap 2
         delayw   ain                      ; Write input into delay
awin1    oscili  1, ishift, 6              ; Window   0 degrees
awin2    oscili  1, ishift, 6, .5          ; Window 180 degrees
aharm    = atap1*awin1 + atap2*awin2       ; Sum taps
aout     = aharm*imix + ain*(1 - imix)     ; Mix
zawm     aharm*ilevl, iout                 ; Output
           endin
;----------------------------------------------------------------------------------
instr    90 ; Sends 1 to 4
in1      = p4  ; In1
in2      = p5  ; In2
in3      = p6  ; In3
in4      = p7  ; In4
ilevl1   = p8  ; Level1
ilevl2   = p9  ; Level2
ilevl3   = p10 ; Level3
ilevl4   = p11 ; Level4
ain1     zar  in1
ain2     zar  in2
ain3     zar  in3
ain4     zar  in4
ga01     = ga01 + ain1*ilevl1
ga02     = ga02 + ain2*ilevl2
ga03     = ga03 + ain3*ilevl3
ga04     = ga04 + ain4*ilevl4
endin
;----------------------------------------------------------------------------------
instr    91 ; Sends 5 to 8
in5      = p4  ; In5
in6      = p5  ; In6
in7      = p6  ; In7
in8      = p7  ; In8
ilevl5   = p8  ; Level5
ilevl6   = p9  ; Level6
ilevl7   = p10 ; Level7
ilevl8   = p11 ; Level8
ain5     zar  in5
ain6     zar  in6
ain7     zar  in7
ain8     zar  in8
ga05     = ga05 + ain5*ilevl5
ga06     = ga06 + ain6*ilevl6
ga07     = ga07 + ain7*ilevl7
ga08     = ga08 + ain8*ilevl8
endin
;----------------------------------------------------------------------------------
instr    99 ; Output
ilevl    = p4
in1      = p5
in2      = p6
ain1     zar  in1
ain2     zar  in2
outs     ain1*ilevl, ain2*ilevl
endin
;----------------------------------------------------------------------------------
instr    100 ; Clear
         zacl  1, 50
endin
