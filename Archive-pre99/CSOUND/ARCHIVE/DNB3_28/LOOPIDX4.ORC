sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
indx=p4
ipan=p5
ipitch=p6
iamp=1

kamp	linen	iamp, .01, p3, .01

al	diskin	"Jam1_1.aif", ipitch, indx
al=al*kamp

al=al*ipan
ar=al*(1-ipan)
		outs	al, ar

endin


