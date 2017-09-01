<CsoundSynthesizer>
<CsOptions>
CsoundVST -h -m0 -n test.orc test.sco
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

instr 1 ; global reverb
	a1, a2					ins
						; Any sort of signal processing could be done here.
						; This is just an example.
	a3, a4  				freeverb 	a1, a2, .8, .5, 1., 0., .4, 0
						outs		a3, a4
endin







































































</CsInstruments>
<CsScore>
f3 0 1024 10 1
f7 0 1024 8 0.001 300 .2 212 1 212 .2 300 0.001
f9 0 1024 8 1 512 .6 512 1
f0 60
; Turn on global reverb.
i 100 0 55
e
; leave in all f statements
; comment out all notes from the score
; add an f0 line at top of score
















































































</CsScore>
<CsArrangement>
</CsArrangement>
</CsoundSynthesizer>
