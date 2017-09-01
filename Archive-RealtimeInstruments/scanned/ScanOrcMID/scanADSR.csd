<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
kr = 441
ksmps = 100
nchnls = 1

ctrlinit 1, 16,40, 17,70, 18,84, 19,64, 73,84, 80,20, 81,60, 82,90, 83,56  ; preset2

   instr 1   ; controllable scanner with adsr envelope
icps cpsmidi
iamp ampmidi 30000
kc16 midic7 16, .01, 1      ; stiffness
kc17 midic7 17,   0, 1      ; centering
kc18 midic7 18,  -1, .5     ; damping
kc19 midic7 19,   0, 1      ; position
kc73 midic7 73,   1.1, 20   ; mass
ic80 midic7 80,   .01,1
ic81 midic7 81,   .01,1
ic82 midic7 82,   .01,1
ic83 midic7 83,   .01,3

kenv	mxadsr	ic80, ic81, ic82, ic83
	a0	=				0
; icondfunc, scnrat, ivelf, imasf, ispgmatrxf, icntrf, idampf, kmas, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  1,    .01,     6,     2,          3,      4,      5, kc73,    kc16,  kc17,  kc18,       .1,       .3, kc19,        0,  a0,    0,  0
a1 scans  iamp, icps, 7, 0
   out	  a1*kenv
   endin

</CsInstruments>
<CsScore>

; Initial condition
f1  0 128 7 0 64 1 64 0
f11 0 128 7 0 32 1 32 0 32 1 32 0
f111 0 128 10 1
; Masses
f2  0 128 -7 1 128 1
f22 0 128 -7 1 128 .6
; Centering force
f4  0 128 -7 0 128 2
f44 0 128 -7 2 64 0 64 2
; Damping
f5  0 128 -7 1 128 1
f55 0 128 -7 1 128 .9
; Initial velocity
f6  0 128 -7 -.0 128 .0
f66 0 128 -7 -.1 128 .1
; Trajectories
f7   0 128 -7 0 128 128
f77  0 128 -23 "spiral-8,16,128,2,1over2"
f777 0 128 -5 .1 128 128
; Spring matrices
f3 0 16384 -23 "string-128"
f33 0 16384 -23 "circularstring-128"
f333 0 16384 -23 "cylinder-128,8"

f0 60

i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1

</CsScore>
</CsoundSynthesizer>
