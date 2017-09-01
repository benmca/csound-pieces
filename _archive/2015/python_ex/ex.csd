<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B1024 -M0
</CsOptions>
<CsInstruments>

sr=44100
kr=4410
ksmps=10
nchnls=1


instr 1
ktrig init 1
printks 	"new note!!!!", .01
ifreq 	cpsmidi
iamp 	ampmidi 	10000

if (ktrig == 0) goto contin
		printks 	"new note", .01
ktrig = 0
contin:
endin

</CsInstruments>
<CsScore>
f0 3600
f1 0 16384 10 1 
;i1 0 1
e
</CsScore>
</CsoundSynthesizer>