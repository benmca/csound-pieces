sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"uglybdM2.aif",0
a1=a1*k1
out	a1
endin

instr 2
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"uglybd2M2.aif",.007
a1=a1*k1
out	a1
endin

instr 3
iamp=p4*.1
k1	linen	iamp, .01, p3, .01
a1	soundin	"penderhit2M2.aif",.02
a1=a1*k1
out	a1
endin
