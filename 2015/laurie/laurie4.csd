<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B1024  -M0 -Q0 -+rtmidi=virtual
</CsOptions>
<CsInstruments>

sr=44100
kr=4410
ksmps=10
nchnls=1
pyinit

pyruni {{

}}



instr 1
ktrig init 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000
if (ktrig == 0) goto contin
		printks 	"new note", .01
		pycall		"pitches.enqueue", ifreq
		event 		"i", 10, 0, .5, iamp, ifreq
ktrig = 0
contin:
endin

instr 2
ktrig init 1
idur = .25
iamp = 10000
if (ktrig == 0) goto contin
kfreq   pycall1     "pitches.get_random_pitch", 0
kdur   pycall1     "pitches.get_next_dur", 0
		event 		"i", 10, 0, .25, iamp, kfreq
		event 		"i", 2, kdur, .25
ktrig = 0
contin:
endin

instr 10
inote = p5
iveloc = 10000
kenv 	linen 		1, .01, p3, .1
aout 	oscil 		kenv*iveloc, inote, 1
		out 		aout
endin

</CsInstruments>
<CsScore>
;f 1  0  256  -17   0  0  
f0 3600
f1 0 16384 10 1 
i2 0 1
e
</CsScore>
</CsoundSynthesizer>