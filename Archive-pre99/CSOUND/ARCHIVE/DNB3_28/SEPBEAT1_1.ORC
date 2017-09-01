sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
indx=p4
ipan=p5
ipitch=p6
iamp=p7

kamp	linen	iamp, .01, p3, .01
al,ar	diskin	"slow2_2.aif copy", ipitch, indx
al=(al*kamp)*ipan
ar=(ar*kamp)*(1-ipan)
		outs	al, ar
endin


instr 2
indx=p4
ipan=p5
ipitch=p6
iamp=p7

kamp	linen	iamp, .01, p3, .01
al,ar	diskin	"flamin1.AIF slow", ipitch, indx
al=(al*kamp)*ipan
ar=(ar*kamp)*(1-ipan)
		outs	al, ar
endin

instr 3
indx=p4
ipan=p5
ipitch=p6
iamp=p7

kamp	linen	iamp, .01, p3, .01

al	diskin	"Jam1_1.aif", ipitch, indx
al=al*kamp
al=al*ipan
ar=al*(1-ipan)
		outs	al, ar

endin


