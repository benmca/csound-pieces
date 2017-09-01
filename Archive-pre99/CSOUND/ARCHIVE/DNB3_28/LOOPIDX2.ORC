sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
ipan=p5
kamp	linen	1, .01, p3, .01
al,ar	soundin	"slow2_2.aif copy", p4
al=al*kamp
ar=ar*kamp
		outs	al*ipan, ar*(1-ipan)
endin


instr 2
ipan=p5
kamp	linen	1, .01, p3, .01
al,ar	soundin	"flamin1.AIF slow", p4
al=al*kamp
ar=ar*kamp
		outs	al*ipan, ar*(1-ipan)
endin
