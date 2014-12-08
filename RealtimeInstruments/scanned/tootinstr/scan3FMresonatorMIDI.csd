<CsoundSynthesizer>
<CsOptions>
Csound -p -P1000 -m0 -A -iadc -MIDI -s -b128 -B128 -V50 -E32
</CsOptions>
<CsInstruments>
; FM instrument with scanned wavetable as source f8
			instr 1
	i1	cpsmidib
	a1	foscili	2000, i1, 1, .5, .01, 8
			out			a1
			endin	
; Vibrating structure with audio injection
			instr 2
	a0	in
	a0 	=				a0/15000
			scanu		1, .01, 6, 2, 3, 4, 5, 2, .01, .1, -.05, .1, .5, 0, 0, a0, 0, -8
			endin
</CsInstruments>
<CsScore>
; Initial condition
f1 0 128 7 0 64 0 64 0
; Masses
f2 0 128 -7 1 128 1
; Spring matrix
f3 0 0 -23 "circularstring-128"
; Centering force
f4 0 128 -7 0 64 2 64 0
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 -.0 128 .0
; Trajectory
f7 0 128 -7 0 128 128
; sine
f8 0 128 10 1
; Notelist
f0 20
i2 0 20
</CsScore>
</CsoundSynthesizer>


