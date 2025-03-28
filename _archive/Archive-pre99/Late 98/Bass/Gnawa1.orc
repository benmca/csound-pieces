sr=22050
kr=2205
ksmps=10
nchnls=2


instr 3
ilength=.3
iatck=.07
ifade=p6
ipitch=p5/120
ipitch2=p9/120
irandstart=p10

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto allatck
if p7=3 kgoto long

beg:
ktmpnt	linseg	0,iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-.001, 15*p4, .001, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 512, 2
asig2	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 40, 2
asig3	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 7, 2
asig1=(asig+asig2+asig3)*kenv
kgoto	rest

mid:
ktmpnt	linseg	iatck, p3, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 512, 4, 4
asig2	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 40, 2
asig3	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 7, 2
asig1=(asig+asig2+asig3)*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, iatck 
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "gnawaX.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest



long:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-p6, 15*p4, ifade, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 512, 4
asig2	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 40, 4
asig3	pvadd	ktmpnt, kpitch, "gnawaX.pvoc", 1, 7, 4
asig1=(asig+asig2+asig3)*kenv
kgoto	rest


rest:
	outs	asig1, asig1
endin

