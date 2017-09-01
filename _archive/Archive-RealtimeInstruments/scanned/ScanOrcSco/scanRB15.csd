<CsoundSynthesizer>

<CsOptions>
</CsOptions>

<CsInstruments>
sr = 22050
kr = 441
ksmps = 50
nchnls = 1

   instr 1
	a0	=				0
; icondfunc, scnrat, ivelf, imasf, ispgmatrxf, icntrf, idampf, kmas, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  1,    .01,     6,     2,         p5,      4,      5,    2,     .01,    .4,   -.1,       .1,       .5,    0,        0,  a0,    1,  0
a1 scans  30000, 220, p4, 0
a1 dcblock a1
   out	  a1
   endin
   
</CsInstruments>
<CsScore>

; Initial condition
f1  0 128 7 0 64 1 64 0
; Masses
f2  0 128 -7 1 128 1
; Spring matrices
f3 0 16384 -23 "circularstring-128"
f33 0 16384 -23 "torus-128,8"
f333 0 16384 -23 "full-128"
; Centering force
f4  0 128 -7 0 128 2
; Damping
f5  0 128 -7 1 128 1
; Initial velocity
f6  0 128 -7 -.0 128 .0
; Trajectory
f77   0 128 -7 0 128 128
f777  0 128 -23 "spiral-8,16,128,2,1over2"
f7777 0 128 -5 1 128 128

i1 0 4  77   3
i1 + .  777  3
i1 . .  7777 3
i1 . .  77   33
i1 . .  777  33
i1 . .  7777 33
i1 . .  77   333
i1 . .  777  333
i1 . .  7777 333
e
</CsScore>

</CsoundSynthesizer>
