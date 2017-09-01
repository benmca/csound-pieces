
sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
aenv	linen	p4/10, .01, p3, .01
aline	expseg	p5, p3*.75, p6, p3*.25, p6
arati	expseg	2, p3*.75, 1, p3*.25, 5
amod	oscili	aline*arati, aline*arati, 1
acar1	oscili	aenv, aline+amod, 1
		out	acar1
endin

