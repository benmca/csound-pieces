sr=22050
kr=2205
ksmps=10
nchnls=1

instr	1
isampledur = 10
;.975 - 1.393 drum
;gtr .069-.789

kamp	linen	1, .01, p3, .01

ktimpt1	loopseg	.1,0, .069, 0, 1.5, 1

ktimpt2	loopseg	.1,0, 0, 0, 6, 1

kinterp	linseg	0, 3,.4, 4, .8, p3-9 ,1, 2, 0

	pvbufread	ktimpt1, "gtr.pvoc"

asig	pvinterp	ktimpt2, 1, "pend.pvoc", 1, 1, 1, 1, 1-kinterp, kinterp
;asig	pvcross	ktimpt2, 1, "pend.pvoc", 1-kinterp, kinterp
out asig
endin