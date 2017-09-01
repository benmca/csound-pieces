sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
k1	linen	1, .01, p3, .01
a1	diskin	"bass.aif",p5
a1=a1*k1
outs	a1*(p6),a1*(1-p6)
endin


instr 2
k1	linen	3, .01, p3, .01
a1	diskin	"snare.aif",p5
a1=a1*k1
;outs	a1*(p6),a1*(1-p6)
endin


instr 3
k1	linen	1, .01, p3, .01
a1	diskin	"hh.aif",p5
a1=a1*k1
;outs	a1*(p6),a1*(1-p6)
endin

