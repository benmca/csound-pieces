<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
   instr 1
 icondfn = p7
 imasf = p8
	a0	=				0
;	a0	in
;	a0	=				1 - 2 ./ (exp( a0/32000) + 1)
;         icondfn, scnrat,  ivelf, imasf, ispgmtrxf, icntrf, idampf, kmasf, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  icondfn,    .05,      6, imasf,         3,      4,      5,     2,      .2,    .2,  -.05,      .1,        .5,   .5,       0,   a0,   p6,  1
;  scans	     kamp,      kfreq, itrj, iid
a1 scans  ampdb(p4), cpspch(p5),    7,   1
a1 dcblock a1
   out	  a1
   endin
</CsInstruments>
<CsScore>
; Initial Condition/State
f1      0 128  7 0 60 0 2 1 2 0 60 0
f11     0 128  7 0 30 0 2 1 2 0 30 0 30 0 2 -1 2 0 30 0
f111    0 128 10 1 0 0 0 1 0 0 0 1
f1111   0 128 10 1
; Initial Masses
f2     0 128 -7  1 128 1
f22    0 128 -7  .3 128 1
f222   0 128 -7  1 128 .1
; Spring matrix
f3 0 0 -23 "string-128"
; Centering force
;f4 0 128 -7 1 128 1
f4 0 128 -7 0 64 2 64 0
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 0 128 0
; Trajectory
f7 0 128 -7 0 128 128
; Pluck
f8 0 128 7 0 60 0 2 1 2 0 60 0
; Sine wave
f9 0 1024 10 1
; INITIAL MASS STUDY
i1 0 3   90 7.00 1 11 2
i1 + .   90 7.07 1 11 22
i1 + 5  90 8.00 1 11 222
i1 + 3   90 7.00 1 111 2
i1 + .   90 7.07 1 111 22
i1 + 5  90 8.00 1 111 222
i1 + 3   90 7.00 1 1111 2
i1 + .   90 7.07 1 1111 22
i1 + 10  90 8.00 1 1111 222
e
</CsScore>
</CsoundSynthesizer>
