sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
k1	linen	1, .01, p3, .01
a1	soundin	"bass22.aif",0
a1=a1*k1
out	a1
endin


instr 2
k1	linen	1, .01, p3, .01
a1	soundin	"snare22.aif",0
a1=a1*k1
out	a1
endin


instr 3
k1	linen	1, .01, p3, .01
a1	soundin	"hh22.aif",0
a1=a1*k1
out	a1
endin

