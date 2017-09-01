<CsoundSynthesizer>
<CsOptions>
;Csound -p -P1000 -m7 -A -iadc -s -b128 -B128 -V50 -E32 -odac
</CsOptions>
<CsInstruments>
; paris smaragdis scanned demo instruments
instr 1 ; Basic Scan Instrument with Audio Injection
	a0	in
	a0	=		1 - 2 / (exp( a0/32000) + 1)
;	ka	linseg	0, 4, 1, .1, 0
	ka	=		0
;	a0	=				0
		scanu	-1, .01, 6,\
				2, 3, 4, 5, \
				2, .1, .1, -.05, \
				.1, .5, .5, ka, \
				a0, p5, 1

	a1	scans	6000, cpspch(p4), 7, 1
		out		a1
endin

; Chord instrument with Audio Injection
instr 2
	i1	bexprnd	5
	i2	bexprnd	1
	ko	oscil	i1, i2, 9
	a0	in
	a0	=		1 - 2 / (exp( a0/32000) + 1)
	ka1	oscili	6000, .15 * 8, p7
	ka2	oscili	6000, .15 * 8, p8
	kf	oscili	1, .15, p4
	kf	=		2^(kf/12) * p6 * 440 + ko
		scanu	-1, .05, 6,\
				2, 3, 4, 5, \
				2, .1, .1, -.5, \
				.25, .75, 0, 0, \
				a0, p5, 1
	a1	scans	ka1, kf+i1, 7, 1
	a2	scans	ka2, (kf+i1)*2, 7, 1
			out	(a1+a2) * p9
endin
</CsInstruments>
<CsScore>
; Initial condition
f1 0 128 7 0 60 0 2 1 2 0 60 0
; Masses
f2 0 128 -7 1 128 1
; Spring matrix
f3 0 0 -23 "string-128"
; Centering force
f4 0 128 -7 0 64 2 64 0
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 -.0 128 .0
; Trajectory
f7 0 128 -7 0 128 128
; Pluck
f8 0 128 7 0 60 0 2 1 2 0 60 0
; Sine wave
f9 0 1024 10 1
; Pitch tables for sliding chords
f100 0 1024 -7 +3 128 +3 128 -2 128 -2 128 +0 128 +0 128 -4 128 -4 128 +3
f101 0 1024 -7 -2 128 -2 128 -2 128 -2 128 -5 128 -5 128 -4 128 -4 128 -2
f102 0 1024 -7 +3 128 +3 128 +2 128 +2 128 +0 128 +0 128 +0 128 +0 128 +3
f103 0 1024 -7 +7 128 +7 128 +5 128 +5 128 +3 128 +3 128 +3 128 +3 128 +7 
; Amplitude table
f200 0 1024 7 1 128 0 128 0 127 0 1 1 128 0 128 0 127 0 1 1 128 0 127 0 1 1
f201 0 1024 7 0 127 0 1 1 127 0 1 1 128 0 127 0 1 1 127 0 1 1 128 0 127 0 1 1 127 0 1 1
f202 0 1024 7 1 127 0 1 1 127 0 1 1 127 0 1 1 127 0 1 1 127 0 1 1 127 0 1 1 127 0 1 1 127 0 1 
f203 0 1024 7 1 1024 0
f204 0 1024 7 1 512 0 511 0 1 1
i1 0 4  6.00 0
i1 0 .5 7.00 0
i1 + .  7.00
i1 + .  7.02
i1 + .  7.04
i1 + .  7.05
i1 + .  7.02
i1 + .  7.04
i1 + 4  7.005
i1 + 4  6.00
s
i1 0 10 6.00 0
i1 . .  7.04 0
i1 . .  7.07 0
i1 . .  7.09 0
s
i2 0 30  101 0 .5  200 202 1.5
i2 . .   102 0 .5  200 201 1
i2 . .   103 0 .5  200 201 1 
i2 . .   100 0 .25 200 200 2
e
</CsScore>
</CsoundSynthesizer>
