sr=22050
kr=2205
ksmps=10
nchnls=2

instr	1
klin	line	0, p3*2, p4

ar	pvoc	klin, 3, "test.pv"
;ar	pvadd	klin, 1, "test.pv", 1, 200
outs	ar, ar
endin