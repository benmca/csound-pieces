<CsoundSynthesizer>
; Boulanger SCANNED TOOTS - Simple Scan - Audio Injection Study
<CsOptions>
;Csound -p -P1000 -m7 -A -s -b128 -B128 -V50 -E32 -iadc -odac
</CsOptions>
<CsInstruments>
strset 100, "fox.aif"
strset 101, "hellorcb.aif"
strset 102, "whiteNoise.aif"
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
	ilplkpos = p22
	irplkpos = p23
	isoundin = p24
a0	soundin isoundin
;         icondfn,iscnrat,ivelf,imasf, ispgmtrxf, icntrf, idampf, kmasf, kspgstf, kcntr, kdamp,ilplkpos,irplkpos, kpos, kstrngth, ain, idisp, id
   scanu  icondfn,iscnrat,ivelf,imasf, ispgmtrxf, icntrf, idampf, kmasf, kspgstf, kcntr, kdamp,ilplkpos,irplkpos,    0,       0,   a0/26000, idisp,  1
;  scans	   kamp,  kfreq, itrj, iid
a1 scans  ampdb(p4), cpspch(p5),    7,   1
a1 dcblock a1
kenv linen 1, .03, p3, .2
   out	  a1*kenv
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
f22    0 128 -7  1 128 .9
f222   0 128 -7  1 128 .8
; Spring Matrix
f3     0 0 -23 "string-128"
f33    0 0 -23 "circularstring-128"
f333   0 0 -23 "cylinder-128,8"
; Centering Force
f4    0 128 -7 0 64  2 64 0
f44   0 128 -7 0 64  6 64 0
f444  0 128 -7 0 64 12 64 0
; Damping
f5 0 128 -7 1 128 1
f55 0 128 -7 .01 64 1 64 .01
f555 0 128 -7 1 128 .0001
; Initial Velocity
f6    0 128 -7 0 128 0
f66   0 128 -7 0 128 .02
f666  0 128 -7 .02 128 0
; Trajectory
f7 0 128 -7 0 128 128
; Pluck
f8 0 128 7 0 60 0 2 1 2 0 60 0
; Sine wave
f9 0 1024 10 1
; INPUT STUDY
i1 0 1  80 9.00 1 1     2 6 3  4 5   .2  .2   2  2  .2  .4  .05 -.2  -.02  .1  .5  100
i1 + .  80 8.07 1 -1     22 66 33  44 55  .2  .2   2  2  .3  .01 .01 -.04 -.2   .5  .4 100
i1 + .  80 8.00 1 1111    2 6 3  4 5   .2  .2   2  2  .1  .2  .1  -.3  -.03  .9  .1 100
i1 + .  80 7.07 1 111    22 66 33  44 55  .2  .2   2  2  .5  .01 .02 -.2  -.05  .2  .1 100
i1 + 3 80 7.00 1 -11     222 666 333  444 555   .2  .3   2  1  .3  .1  .05 -.02  -.2  .1  .5 100
i1 + 1  80 9.00 1 1     2 6 3  4 5   .2  .2   2  2  .2  .4  .05 -.2  -.02  .1  .5  101
i1 + .  80 8.07 1 -1     22 66 33  44 55  .2  .2   2  2  .3  .01 .01 -.04 -.2   .5  .4 101
i1 + .  80 8.00 1 1111    2 6 3  4 5   .2  .2   2  2  .1  .2  .1  -.3  -.03  .9  .1 101
i1 + .  80 7.07 1 111    22 66 33  44 55  .2  .2   2  2  .5  .01 .02 -.2  -.05  .2  .1 101
i1 + 3 80 7.00 1 -11     222 666 333  444 555   .2  .3   2  1  .3  .1  .05 -.02  -.2  .1  .5 101
i1 + 1  80 9.00 1 1     2 6 3  4 5   .2  .2   2  2  .2  .4  .05 -.2  -.02  .1  .5  102
i1 + .  80 8.07 1 -1     22 66 33  44 55  .2  .2   2  2  .3  .01 .01 -.04 -.2   .5  .4 102
i1 + .  80 8.00 1 1111    2 6 3  4 5   .2  .2   2  2  .1  .2  .1  -.3  -.03  .9  .1 102
i1 + .  80 7.07 1 111    22 66 33  44 55  .2  .2   2  2  .5  .01 .02 -.2  -.05  .2  .1 102
i1 + 6 80 7.00 1 -11     222 666 333  444 555   .2  .3   2  1  .3  .1  .05 -.02  -.2  .1  .5 102
e
</CsScore>
</CsoundSynthesizer>
