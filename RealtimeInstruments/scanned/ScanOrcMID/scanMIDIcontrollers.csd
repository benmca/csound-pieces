<CsoundSynthesizer>
; Boulanger SCANNED TOOTS - Basic MIDI - MIDI Controllable Scan Parameters
<CsOptions>
Csound -p -P1000 -m0 -A -MIDI -s -b128 -B128 -V50 -E32 -odac
</CsOptions>
<CsInstruments>

ctrlinit 1, 16,64, 17,64, 18,74, 19,64, 73,24 ; preset1

   instr 1
icps cpsmidi
iamp ampmidi 30000
kc16 midic7 16, .01, 1      ; stiffness
kc17 midic7 17,   0, 1      ; centering
kc18 midic7 18,  -1, .5     ; damping
kc19 midic7 19,   0, 1      ; position
kc73 midic7 73,   1.1, 20   ; mass
	a0	=				0
; icondfunc, scnrat, ivelf, imasf, ispgmatrxf, icntrf, idampf, kmas, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  1,    .01,     6,     2,          3,      4,      5, kc73,    kc16,  kc17,  kc18,       .3,       .1, kc19,        0,  a0,    1,  0
a1 scans  iamp, icps, 7, 0
   out	  a1
   endin
</CsInstruments>
<CsScore>
; Initial condition
f1  0 128 7 0 64 1 64 0
; Masses
f2  0 128 -7 1 128 1
; Spring matrices
f3 0 16384 -23 "string-128"
; Centering force
f4  0 128 -7 0 128 2
; Damping
f5  0 128 -7 1 128 1
; Initial velocity
f6  0 128 -7 -.0 128 .0
; Trajectories
f7   0 128 -7 0 128 128
; Notelist
f0 20
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
i1 0 .1
</CsScore>
</CsoundSynthesizer>
