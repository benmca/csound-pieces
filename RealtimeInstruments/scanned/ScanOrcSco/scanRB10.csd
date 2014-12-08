<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
   instr 1
 idisp = p6
 icondfn = p7
 imasf = p8
 ivelf = p9
 ispgmtrxf = p10
 icntrf = p11
 idampf = p12
	kspgstf line p13, p3, p14
	kmasf   line p15, p3, p16
	kcntr   line p17, p3, p18
	iscnrat = p19
	kdamp   line p20, p3, p21
	a0	=				0
;         icondfn,iscnrat,ivelf,imasf, ispgmtrxf, icntrf, idampf, kmasf, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, idisp, id
   scanu  icondfn,iscnrat,ivelf,imasf, ispgmtrxf, icntrf, idampf, kmasf, kspgstf, kcntr, kdamp,      .1,        .5,   .5,       0,   a0,  idisp,  1
;  scans	   kamp,  kfreq, itrj, iid
a1 scans  ampdb(p4), cpspch(p5),    7,   1
a1 dcblock a1
   out	  a1
   endin
</CsInstruments>
<CsScore>
; Initial Condition/State
f1     0 128  7 0 60 0 2 1 2 0 60 0
f11    0 128  7 0 30 0 2 1 2 0 30 0 30 0 2 -1 2 0 30 0
f111   0 128 10 1 0 0 0 1 0 0 0 1
f1111  0 128 10 1
; Initial Masses
f2     0 128 -7  1 128 1
; Dynamic Masses
f22    0 128 -7  1 128 .9
f222   0 128 -7  1 128 .8
f2222  0 128 -7  1 128 .6
; Spring Matrix
f3     0 0 -23 "string-128"
f33    0 0 -23 "circularstring-128"
f333   0 0 -23 "cylinder-128,8"
f3333  0 0 -23 "torus-128,8"
f33333 0 0 -23 "grid-128,8"
; Centering Force
f4    0 128 -7 0 64  2 64 0
f44   0 128 -7 0 64  6 64 0
f444  0 128 -7 0 64 12 64 0
f4444 0 128 -7 0 64 20 64 0
; Damping
f5 0 128 -7 1 128 1
f55 0 128 -7 .01 64 1 64 .01
f555 0 128 -7 1 128 .0001
; Initial Velocity
f6    0 128 -7 0 128 0
f66   0 128 -7 0 128 .02
f666  0 128 -7 .02 128 0
f6666 0 128 -7 .01 128 .01
; Trajectory
f7 0 128 -7 0 128 128
; Pluck
f8 0 128 7 0 60 0 2 1 2 0 60 0
; Sine wave
f9 0 1024 10 1
; DAMPING STUDY - DYNAMIC
i1 0 2   80 7.00 1 1     2 6    3    4    5   .2  .2   2  2  .2  .2  .05 -.05 -.5
i1 + .   80 7.07 1 1     2 6    3    4    55  .2  .2   2  2  1  3    .01 -.4 -.01
i1 + 5   80 8.00 1 1     2 6    3    4    555 .2  .2   2  2  2  1    .1  -.1 -.01
i1 + 2   80 7.00 1 11    2 66   33   44   5   .2  .2   2  2  .2  .4  .05 -.2 -.02
i1 + .   80 7.07 1 11    2 66   33   44   55  .2  .2   2  2  .4  .8  .03 -.01 -.3
i1 + 5   80 8.00 1 11    2 66   33   44   555 .2  .2   2  2  .3  .01 .01 -.04 -.2
i1 + 2   80 7.00 1 111   2 666  333  444  5   .2  .2   2  2  .1  .2  .1  -.3  -.03
i1 + .   80 7.07 1 111   2 666  333  444  55  .2  .2   2  2  .01  .2 .2  -.03 -.1
i1 + 5   80 8.00 1 111   2 666  333  444  555 .2  .2   2  2  .5  .01 .02 -.2  -.05
i1 + 2   80 7.00 1 1111  2 6666 3333 4444 5   .2  .2   2  2  .1  .3  .06 -.02 -.04
i1 + .   80 7.07 1 1111  2 6666 3333 4444 55  .2  .2   2  2  .01 .02 .02 -.5  -.03
i1 + 20  80 8.00 1 1111  2 6666 3333 4444 555 .2  .2   2  2  .1  .001 .1 -.01 -.4
e
</CsScore>
</CsoundSynthesizer>
