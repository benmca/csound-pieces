sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
ipan=p5
ipitch=p6
kamp	linen	1, .01, p3, .01
al,ar	diskin	"slow2_2.aif copy", ipitch, p4
al=al*kamp
ar=ar*kamp
		outs	al*ipan, ar*(1-ipan)
endin


instr 2
ipan=p5
ipitch=p6
kamp	linen	1, .01, p3, .01
al,ar	diskin	"flamin1.AIF slow", ipitch, p4
al=al*kamp
ar=ar*kamp
		outs	al*ipan, ar*(1-ipan)
endin
