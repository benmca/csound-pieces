sr=44100
kr=4410
ksmps=10
nchnls=1

instr 1
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"HH.AIF",.007
a1=a1*k1
out	a1
endin

instr 2
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"OPCLOShhM.aif",.025
a1=a1*k1
out	a1
endin

instr 3
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"UGLYBDM.aif",.008
a1=a1*k1
out	a1
endin

instr 4
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"RUINSNR1M.aif",.052
a1=a1*k1
out	a1
endin

instr 5
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"cageh2.aif",.018
a1=a1*k1
out	a1
endin

instr 6
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"cagemid2.aif",.024
a1=a1*k1
out	a1
endin

instr 7
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"cagelo2.aif",.034
a1=a1*k1
out	a1
endin


