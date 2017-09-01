sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
iamp=p4*.1
idur=.212
k1	linen	iamp, .01, idur, .01
a1	soundin	"hh2.aif",.007
a1=a1*k1
out	a1
endin

instr 2
iamp=p4*.1
idur=.33
k1	linen	iamp, .01, idur, .01
a1	soundin	"opcloshhM2.aif",.025
a1=a1*k1
out	a1
endin

instr 3
iamp=p4*.1
idur=.27
k1	linen	iamp, .01, idur, .01
a1	soundin	"uglybd2M2.aif",.008
a1=a1*k1
out	a1
endin

instr 4
iamp=p4*.1
idur=.27
k1	linen	iamp, .01, idur, .01
a1	soundin	"ruinsnr1M2.aif",.052
a1=a1*k1
out	a1
endin

instr 5
iamp=p4*.1
idur=.8
k1	linen	iamp, .01, idur, .01
a1	soundin	"cageh.aif",.018
a1=a1*k1
out	a1
endin

instr 6
iamp=p4*.1
idur=.8
k1	linen	iamp, .01, idur, .01
a1	soundin	"cagemid.aif",.024
a1=a1*k1
out	a1
endin

instr 7
iamp=p4*.1
idur=.8
k1	linen	iamp, .01, idur, .01
a1	soundin	"cagelo.aif",.034
a1=a1*k1
out	a1
endin


