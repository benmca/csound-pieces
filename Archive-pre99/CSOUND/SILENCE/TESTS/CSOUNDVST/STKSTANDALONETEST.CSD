<CsoundSynthesizer>
<CsOptions>
CsoundVST -m1F test.smf -RWfo test.wav test.orc test.sco
</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

massign 0, 1
massign 1, 2
massign 2, 3
massign 3, 4
massign 4, 1
massign 5, 2
massign 6, 3
massign 7, 4
massign 8, 1
massign 9, 2
massign 10, 3
massign 11, 4
massign 12, 1
massign 13, 2
massign 14, 3
massign 15, 4

gareverb1 init 0
gareverb2 init 0

instr 100 ; global reverb
	a1, a2  				freeverb 	gareverb1, gareverb2, .8, .5, 1., 0., .4, 0
						outs		a1, a2
	gareverb1				=		0
	gareverb2				=		0
endin

instr 1
	inotenumber 				cpsmidi
	ivelocity 				veloc		0, 1	
	kstatus, kchannel, kdata1, kdata2 	midiin
	kgate					linenr		8000.0, 0, .2, .01
	a2					stkwurley 	inotenumber, ivelocity, kstatus, kchannel, kdata1, kdata2
	a3					=	 	a2 * kgate
	a4					=		a2 * kgate
						outs		a3, a4
	gareverb1				=		gareverb1 + (a3 * .4)
	gareverb2				=		gareverb1 + (a4 * .4)
endin

instr 2
	inotenumber 				cpsmidi
	ivelocity 				veloc		0, 1	
	kstatus, kchannel, kdata1, kdata2 	midiin
	kgate					linenr		3000.0, 0, .2, .01
	a2					stkmandolin 	inotenumber, ivelocity, kstatus, kchannel, kdata1, kdata2
	a3					=	 	a2 * kgate
	a4					=		a2 * kgate
						outs		a3, a4
	gareverb1				=		gareverb1 + (a3 * .4)
	gareverb2				=		gareverb1 + (a4 * .4)
endin

instr 3
	inotenumber 				cpsmidi
	ivelocity 				veloc		0, 1	
	kstatus, kchannel, kdata1, kdata2 	midiin
	kgate					linenr		3000.0, 0, .2, .01
	a2					stkbowed 	inotenumber, ivelocity, kstatus, kchannel, kdata1, kdata2
	a3					=	 	a2 * kgate
	a4					=		a2 * kgate
						outs		a3, a4
	gareverb1				=		gareverb1 + (a3 * .4)
	gareverb2				=		gareverb1 + (a4 * .4)
endin

instr 4
	inotenumber 				cpsmidi
	ivelocity 				veloc		0, 1	
	kstatus, kchannel, kdata1, kdata2 	midiin
	kgate					linenr		3000.0, 0, .2, .01
	a2					stkbeethree 	inotenumber, ivelocity, kstatus, kchannel, kdata1, kdata2
	a3					=	 	a2 * kgate
	a4					=		a2 * kgate
						outs		a3, a4
	gareverb1				=		gareverb1 + (a3 * .4)
	gareverb2				=		gareverb1 + (a4 * .4)
endin

; substitute knote for all audio oscillator frequency arguments
; multiply the output by kgate
; insert knote ...  iveloc... and kgate .... at the start of each instrument
;	knote	cpsmidib
;	iveloc	ampmidi	1
;	kgate	linenr	iveloc, 0, .2, .01










































































</CsInstruments>
<CsScore>
f3 0 1024 10 1
f7 0 1024 8 0.001 300 .2 212 1 212 .2 300 0.001
f9 0 1024 8 1 512 .6 512 1
f0 60
; Turn on global reverb.
i 100 0 -1
e
; leave in all f statements
; comment out all notes from the score
; add an f0 line at top of score
















































































</CsScore>
<CsArrangement>
</CsArrangement>
</CsoundSynthesizer>
