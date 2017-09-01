<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
kr = 441
ksmps = 100
nchnls = 1
; Paris Smaragdis Models
; Plain scanned syntnesis
instr 1
	a0	=				0
			scanu		1, .01, 6, 2, 3, 4, 5, \
							2, .1, .1, -.01, .1, .5, 0, 0, a0, 1, 0
	a1	scans		ampdb(p4), cpspch(p5), 7, 0
			out			a1
endin

; Scan synthesis with audio injection and dual scan paths
instr 2
	iamp = ampdb(p4)
	iamp = iamp*.5
	a0	soundin	"hellorcb.aif"
	a1 	=				a0/30000
			scanu		1, .01, 6, 2, 13, 14, 5, \
							2, .01, .05, -.05, .1, .5, 0, 0, a1, 1, 0
	a1	scans		iamp, cpspch(p5), 7, 0
	a2	scans		iamp, cpspch(p5)*1.01, 17, 0
			out			a1+a2+(a0*.1)
endin

</CsInstruments>

<CsScore>
; Initial condition
f1 0 128 7 0 64 1 64 0
; Masses
f2 0 128 -7 1 128 1
; Centering force
f4  0 128 -7 0 128 2
f14 0 128 -7 2 64 0 64 2
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 -.0 128 .0
; Trajectories
f7 0 128 -5 .001 128 128
f17 0 128 -23 "spiral-8,16,128,2,1over2"
; Spring matrices
f3 0 16384 -23 "string-128"
f13 0 16384 -23 "cylinder-128,8"

; Note list
i1 0 6  86 6.00
i1 7 10 86 7.00
s
i2 0 6  63 6.00
i2 7 10 63 7.00
e

</CsScore>
</CsoundSynthesizer>
