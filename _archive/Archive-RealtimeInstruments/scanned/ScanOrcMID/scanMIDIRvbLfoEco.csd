<CsoundSynthesizer>
; Boulanger SCANNED TOOTS - MIDI Instrument - Controllable Scan Parameters
<CsOptions>
; Csound -p -P1000 -m0 -A -MIDI -s -b128 -B128 -V50 -E32 -odac
</CsOptions>
<CsInstruments>

gacmb	init	0
garvb	init	0

ctrlinit 1, 16,40, 17,70, 18,84, 19,64, 73,84, 80,20, 81,60, 82,90, 83,56, 75,6, 76,12, 72,127, 78,64, 77,100

		instr	1   ; MIDI Controllable Scanner with ADSR, LFO & FX
;init
kcps cpsmidib
iamp ampmidi 30000
;string mapping
kc16 midic7 16, .01, 1      ; stiffness
kc17 midic7 17,   0, 1      ; centering
kc18 midic7 18,  -1, .5     ; damping
kc19 midic7 19,   0, 1      ; position
kc73 midic7 73,   1.1, 20   ; mass
;adsr mapping
ic80 midic7 80,   .01,1     ; attack
ic81 midic7 81,   .01,1     ; decay
ic82 midic7 82,   .01,1     ; sustain
ic83 midic7 83,   .01,3     ; release
;lfo mapping
kc75 midic7 75,  0,100      ; vib depth
kc76 midic7 76,  0,50       ; vib rate
ic72 midic7 72,  0,5        ; vib shape
;fx mapping
kc78 midic7 78,  0,1        ; reverb send
kc77 midic7 77,  0,1        ; echo send
; envelope & lfo
kenv	mxadsr	ic80, ic81, ic82, ic83
kvib	lfo	 kc75, kc76, int(ic72)
; scan
	a0	=				0
; icondfunc, scnrat, ivelf, imasf, ispgmatrxf, icntrf, idampf, kmas, kspgstf, kcntr, kdamp, ilplkpos, irplkpos, kpos, kstrngth, ain, disp, id
   scanu  1,    .01,     6,     2,          3,      4,      5, kc73,    kc16,  kc17,  kc18,       .1,       .3, kc19,        0,  a0,    0,  0
a1 scans  iamp*kenv, kcps+kvib, 7, 0
   out	  a1
; fx
garvb	=		garvb+(a1*kc78)
gacmb	=		gacmb+(a1*kc77)
endin
		instr	198
idur	=		p3
itime 	= 		p4
iloop 	= 		p5
kenv	linen	1, .01, idur, .01
acomb 	comb	gacmb, itime, iloop, 0
		out		acomb*kenv
gacmb	=		0
endin
        instr 	199
idur	=		p3					
irvbtim	=		p4
ihiatn	=		p5
arvb	nreverb	garvb, irvbtim, ihiatn
		out		arvb
garvb	=		0
endin
</CsInstruments>
<CsScore>
; Initial condition
f1  0 128 7 0 64 1 64 0
; Masses
f2  0 128 -7 1 128 1
; Centering force
f4  0 128 -7 0 128 2
; Damping
f5  0 128 -7 1 128 1
; Initial velocity
f6  0 128 -7 -.0 128 .0
; Trajectories
f7   0 128 -7 0 128 128
; Spring matrices
f3 0 16384 -23 "string-128"
; Sine
f9 0 1024 10 1
;NoteList
f 0     60
i 198	0		60		5		    .5
i 199	0		60		6.6		    .1		
i 1     0       .1
i 1     0       .1
i 1     0       .1
i 1     0       .1
i 1     0       .1
i 1     0       .1
</CsScore>
</CsoundSynthesizer>
