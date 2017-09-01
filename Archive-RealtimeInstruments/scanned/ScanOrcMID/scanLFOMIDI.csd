<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
ctrlinit 1, 16,80, 17,50, 18,40, 19,35, 73,60, 72, 50, 75, 3, 76, 35, 80,35, 81,65, 82,110, 83,80
   instr 1
icps cpsmidi
iamp ampmidi 10000
kc16 midic7 16,  .01, .5  ; stiffness
kc17 midic7 17,  .1, 3    ; centering
kc18 midic7 18,  -.1, 1   ; damping
kc19 midic7 19,   0, 1    ; position
kc73 midic7 73,   2, 5    ; mass
;lfo
kc75 midic7 75,  0,100
kc76 midic7 76,  0,20
ic72 midic7 72,  0,5
;adsr
ic80 midic7 80,   .01,1
ic81 midic7 81,   .01,1
ic82 midic7 82,   .01,1
ic83 midic7 83,   .01,3
kenv	mxadsr	ic80, ic81, ic82, ic83
kvib	lfo	 kc75, kc76, int(ic72)
	a0	=				0
; icondfunc, scnrat,ivelf,imasf,ispgmatrxf,icntrf,idampf,kmas,kspgstf,kcntr,kdamp,ilplkpos,irplkpos,kpos,kstrngth,ain,disp,id
   scanu -1,    .05,    6,    2,         3,     4,     5,kc73,   kc16, kc17, kc18,      .1,      .3,kc19,       0, a0,   0, 0
a1 scans  iamp, icps+kvib, 7, 0
   out	  a1*kenv
   endin
</CsInstruments>
<CsScore>
; Initial condition
f1 0 128 10 1
; Masses
f2  0 128 -7 4 128 2
; Centering force
f4  0 128 -7 0 128 2
; Damping
f5  0 128 -7 2 128 2
; Initial velocity
f6  0 128 -7 .0 128 .0
; Trajectory
f7   0 128 -5 1 128 128
; Spring matrix
f3 0 16384 -23 "torus-128,8"

f0 60
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1


</CsScore>
</CsoundSynthesizer>
