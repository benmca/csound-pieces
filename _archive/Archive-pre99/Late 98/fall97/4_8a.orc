sr=22050
kr=2205
ksmps=10
nchnls=1
instr 1
amod	oscili	p5, p4, 1
acar	oscili	amod+p5 , p4, 1
	out	acar
endin
