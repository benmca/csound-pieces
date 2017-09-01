<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
   instr 1
 icondfn = p6
 ispgmtrxf = p8
 itrj = p9
	a0	=				0
	; a0 in
;         icondfn, scnrat,  ivelf, imasf, ispgmtrxf, icntrf, idampf, kmas, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  icondfn,    .02,      6,     2, ispgmtrxf,      4,      5,    2,      .1,    .2,  -.05,      .1,        .5,   .5,       0,   a0/20000,   p7,  0
;  scans	     kamp,      kfreq, itrj, iid
a1 scans  ampdb(p4), cpspch(p5), itrj,   0
a1 dcblock a1
kenv linen 1, .03, p3, .1
   out	  a1*kenv
   endin
</CsInstruments>
<CsScore>
; Initial Condition/State
f1      0 128  7 0 60 0 2 1 2 0 60 0
f11     0 128  7 0 30 0 2 1 2 0 30 0 30 0 2 -1 2 0 30 0
f111    0 128 10 1 0 0 0 1 0 0 0 1
f1111   0 128 10 1
; Initial Masses
f2     0 128 -7 1 128 1
f22    0 128 -7 1 128 0
f222   0 128 -7 0 128 1
f2222  0 128 -7 0 64 1 64 0
; Spring Matrix
f3     0 0 -23 "string-128"
f33    0 0 -23 "circularstring-128"
f333   0 0 -23 "cylinder-128,8"
f3333  0 0 -23 "torus-128,8"
f33333 0 0 -23 "grid-128,8"
; Centering force
;f4 0 128 -7 1 128 1
f4 0 128 -7 0 64 1 64 0
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 0 128 0
; Trajectory
f7 0 128 -7 0 128 127
f77 0 128 -7 0 64 127 64 0
f777 0 128 -7 0 32 32 32 64 32 127 32 0
f7777 0 128 -5 1 32 64 32 1 32 127 32 1
f77777 0 128 -5 1 32 127 32 64 32 127 32 1
; TRAJECTORY STUDY
i1 + 2  86 7.00 1111 1 3  7
i1 + .  .  7.05 1111 1 3  77
i1 + .  .  7.07 1111 1 3  777
i1 + .  .  7.11 1111 1 3  7777
i1 + 6  .  8.00 1111 1 3  77777
i1 + 2  86 7.00 1111 1 3  7
i1 + .  .  7.05 1111 1 33  77
i1 + .  .  7.07 1111 1 333  777
i1 + .  .  7.11 1111 1 3333  7777
i1 + 12  .  8.00 1111 1 33333  77777
e
</CsScore>
</CsoundSynthesizer>
