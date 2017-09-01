<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B1024  -M1
</CsOptions>
<CsInstruments>

sr=44100
ksmps=1
nchnls=2

ga1 init 0
ga2 init 0




instr 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000
if (ktrig == 0) goto contin
		printks 	"new note", .01
ktrig = 0


endin
</CsInstruments>
<CsScore>
f0 3600
f1 0 16384 10 1
e
</CsScore>
</CsoundSynthesizer>