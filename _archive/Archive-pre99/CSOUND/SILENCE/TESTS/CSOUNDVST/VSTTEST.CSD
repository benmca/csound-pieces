<CsoundSynthesizer>
<CsOptions>
CsoundVST -h -n -d -m0 temp.orc temp.sco


</CsOptions>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 2

instr 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
	knote	cpsmidib
	iveloc	ampmidi	1
	kgate	linenr	iveloc/2, 0, .2, .01
	kva	line	0, 3, .02
	kv	oscil	knote*kva, 4, 3
	kf	linseg	2200, 1.5, 1200, .5, 880, 5, 440
	k1	linseg	8000, .5, 8000, 5, 2000
	k2	line	700, .5, 700
	a5	oscil	k2, knote, 3
	a6	oscil	k2, knote*1.499, 3
	a1	oscil	k1, knote*2.001 + a5 + kv, 3
	a2	oscil	k1, knote*1.502 + a6 + kv, 3
	a2	butterlp	a2 + a1, kf
	a2	=		a2 * kgate
		outs	    a2,a2
endin

; substitute knote for all audio oscillator frequency arguments
; multiply the output by kgate
; insert knote ...  iveloc... and kgate .... at the start of each instrument
;	knote	cpsmidib
;	iveloc	ampmidi	1
;	kgate	linenr	iveloc, 0, .2, .01



</CsInstruments>
<CsScore>

f0 10001
f3 0 1024 10 1
f7 0 1024 8 0.001 300 .2 212 1 212 .2 300 0.001
f9 0 1024 8 1 512 .6 512 1
e
; leave in all f statements
; comment out all notes from the score
; add an f0 line at top of score



























































































</CsScore>
<CsArrangement>
</CsArrangement>
</CsoundSynthesizer>
