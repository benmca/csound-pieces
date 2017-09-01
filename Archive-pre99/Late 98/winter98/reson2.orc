sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
iamp=p4
ifreq=p5
kbw	expseg	p7, p3, 1
anoise	randi	10000, p6
ares	reson	anoise, ifreq, kbw, 1
abal	balance ares, anoise
kenv	linen 	1, .01, p3, .01
out 	abal*kenv*iamp
endin
