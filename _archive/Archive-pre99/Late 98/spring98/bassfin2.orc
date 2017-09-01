sr=22050
kr=2205
ksmps=10
nchnls=2

instr 2

ilength=1.01
ipitch=p5/165
iatck=.017
ifade=p6
;assign beginning and end pitches for glissando

ipitch=p5/297
ipitch2=p9/297

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto allatck
if p7=3 kgoto long

beg:
ktmpnt	linseg	0,iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .01, 3000*p4, iatck-.02, 3000*p4, .01, 3000*p4, (p3-iatck)-.01, 3000*p4, .01, 0
kpitch	expseg	1, iatck+(p8+.01), 1,.01, ipitch, (p3-iatck)-(p8+.01), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, kpitch, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto	rest

mid:
ktmpnt	linseg	iatck, p3, ilength
kenv	linen	3000*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, kpitch, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, iatck 
kenva	linen	3000*p4, .01, p3, .01; ramp
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, kpitch, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto rest

long:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .01, 3000*p4, iatck-.02, 3000*p4, .01, 3000*p4, (p3-iatck)-.01, 3000*p4, .001, 0
kpitch	expseg	1, iatck+(p8+.01), 1,.01, ipitch, (p3-iatck)-(p8+.02), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, kpitch, 2, 0, 2205, 441, 8, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto	rest


rest:
	outs	asig1, asig1
endin

instr 3
ilength=.3
iatck=.07
ifade=p6
ipitch=p5/120
ipitch2=p9/120

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto allatck
if p7=3 kgoto long

beg:
ktmpnt	linseg	0,iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-.001, 15*p4, .001, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 2
asig2	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 40, 2
asig3	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 7, 2
asig1=(asig+asig2+asig3)*kenv
kgoto	rest

mid:
ktmpnt	linseg	iatck, p3, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 4, 4
asig2	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 40, 2
asig3	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 7, 2
asig1=(asig+asig2+asig3)*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, iatck 
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest

long:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-p6, 15*p4, ifade, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 4
asig2	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 40, 4
asig3	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 7, 4
asig1=(asig+asig2+asig3)*kenv
kgoto	rest


rest:
	outs	asig1, asig1
endin

instr 4

ilength=.17
ipitch=p5/161 ;120 is pitch of orig sample
iatck=.0179
ifade=p6
;assign beginning and end pitches for glissando

ipitch=p5/161
ipitch2=p9/161

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto allatck
if p7=3 kgoto long

beg:
ktmpnt	linseg	0,iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-.001, 15*p4, .001, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 512, 2
asig1=asig*kenv
kgoto	rest

mid:
ktmpnt	linseg	iatck, p3, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 512, 4, 4
asig1=asig*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, iatck 
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "polvo.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest

long:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .001, 10*p4, iatck-.002, 10*p4, .001, 15*p4, (p3-iatck)-p6, 15*p4, ifade, 0
kpitch	expseg	1, iatck+(p8+.001), 1,.001, ipitch, (p3-iatck)-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 512, 4

asig1=asig*kenv
kgoto	rest


rest:
	outs	asig1, asig1
endin

