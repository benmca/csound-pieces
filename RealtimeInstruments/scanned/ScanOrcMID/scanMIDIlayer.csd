<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
kr = 441
ksmps = 100
nchnls = 1

ctrlinit 1, 16,60, 17,100, 18,90, 19,100, 73,100, 80,46, 81,80, 82,110, 83,64; preset4

; layered with controllers plus new initial conditions (new ftables)
   instr 1
icps cpsmidi
iamp ampmidi 5000
kc16 midic7 16,  .01, .5   ; stiffness
kc17 midic7 17,  .1, 3    ; centering
kc18 midic7 18,  -.1, 1   ; damping
kc19 midic7 19,   0, 1    ; position
kc73 midic7 73,   2, 5  ; mass
a0 = 0
ic80 midic7 80,   .01,1
ic81 midic7 81,   .01,1
ic82 midic7 82,   .01,1
ic83 midic7 83,   .01,3

kenv	mxadsr	ic80, ic81, ic82, ic83
;  icondfunc, scnrat,   ivelf,  imasf, ispgmatrxf,  icntrf, idampf, kmas,  kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  1,   .04,        6,      2,          3,       4,      5,    3,     .4,     1,     -1,       .4,       .5,    0,        0,  a0,    0,  1
a2 scans  iamp, icps*2,  77, 1
a2 dcblock a2
   scanu  -111,  .09,      666,    222,        333,    444,    555, kc73,   kc16,   kc17,   kc18,      .3,       .1, kc19,        0,  a0,    0,  2
a3 scans  iamp, icps, 777, 2
a3 dcblock a3
   out	  (a3+a2)*kenv
   endin

</CsInstruments>
<CsScore>

; Initial condition
f1  0 128 10 1 0 0 0 1 0 0 0 1
f111 0 128 -7 0 32 1 32 0 64 0
; Masses
f2   0 128 -7   2 128 3
f222 0 128 -7 .99 128 1
; Spring matrices
f3 0 16384 -23 "circularstring-128"
f333 0 16384 -23 "grid-128,8"
; Centering force
f4  0 128 -7 1 128 .6
f444 0 128 -7 .1 128 .2
; Damping
f5  0 128 -7 .2 128 .2
f555 0 128 -7 -1 128 .2
; Initial velocity
f6  0 128 -7 -.02 128 .01
f666 0 128 -7 -.01 128 .01
; Trajectories
f77  0 128 -23 "spiral-8,16,128,2,1over2"
f777 0 128 -7 0 128 128

f0 120

i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1

</CsScore>
</CsoundSynthesizer>
