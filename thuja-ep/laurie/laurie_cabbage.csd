<Cabbage>
form size(380, 160), caption("The Laurie"), pluginID("laurie")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -b128 -B1024 -M2
</CsOptions>
<CsInstruments>
sr=44100
kr=441
nchnls=1

pyinit

pyruni {{

import sys
print sys.path

}}


instr 1
ktrig init 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000
printks "received: %d, %d\n", .1, ifreq, iamp
endin



</CsInstruments>
<CsScore>
f0 3600
f1 0 16384 10 1 
e
</CsScore>
</CsoundSynthesizer>