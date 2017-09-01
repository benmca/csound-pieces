sr=44100
kr=4410
ksmps=10
nchnls=2

instr 1
ipan=p4
al, ar	soundin	"slow2_2.aif copy", p4
		outs	al*ipan, ar*(1-ipan)
endin


instr 2
ipan=p4
al, ar	soundin	"flamin1.AIF slow", p4
		outs	al*ipan, ar*(1-ipan)
endin
