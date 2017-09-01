sr=22050
kr=2205
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0


instr 2

ilength=.9
ifade=p6
ipitch=p5/292
ipitch2=p9/292
iamp=7000

type:
if p7=0 kgoto mid
if p7=1 kgoto allatck
if p7=2 kgoto long


mid:
ktmpnt	linseg	0, p3, ilength
kenv	linen	iamp*p4, .01, p3, .03
apitch	expseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, apitch, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, .017 
kenva	linen	iamp*p4, .01, p3, .01; ramp
asi1, asi2	sndwarp	1, ktmpnt, 1, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto rest

long:
ktmpnt	linseg	0, p3, ilength
kenv	linseg	0, .01, iamp*p4, p3-ifade, iamp*p4, ifade-.01, 0
apitch	expseg	ipitch, (p8+.01), ipitch, p3-(p8+.01), ipitch2
asi1, asi2	sndwarp	1, ktmpnt, apitch, 2, 0, 2205, 441, 15, 3, 1
asig	balance	asi1, asi2
asig1=asig*kenv
kgoto	rest

rest:
a1, a2	locsig	asig1, p10, p11, p12;maybe less?
ar1, ar2 locsend
ga1=ga1+ar1
ga2=ga2+ar2
	outs	a1, a2
endin

instr 3
ilength=.3
iatck=.07
ifade=p6
ipitch=p5/120
ipitch2=p9/120
iamp=.25

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto allatck
if p7=3 kgoto long

beg:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .01, iamp*p4, iatck-.02, iamp*p4, .01, (iamp*1.5)*p4, (p3-iatck)-.01, (iamp*1.5)*p4, .01, 0
kpitch	expseg	1, iatck+p8, 1,.01, ipitch, (p3-iatck)-(p8+.01), ipitch2
asig	pvoc	ktmpnt, kpitch, "gnawa.pvoc"

asig1=(asig)*kenv
kgoto	rest

mid:
ktmpnt	linseg	.2, p3, ilength
kenv	linen	(iamp*1.5)*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2
asig	pvoc	ktmpnt, kpitch, "gnawa.pvoc"
asig1=(asig)*kenv
kgoto	rest

allatck:
katcktm	linseg	0, p3, iatck 
kenva	linen	(iamp)*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest

long:
ktmpnt	linseg	0, iatck, iatck, p3-iatck, ilength
kenv	linseg	0, .01, iamp*p4, iatck-.02, iamp*p4, .01, (iamp*1.5)*p4, (p3-iatck)-p6, (iamp*1.5)*p4, ifade, 0
kpitch	expseg	1, iatck+p8, 1,.01, ipitch, (p3-iatck)-(p8+.01), ipitch2
asig	pvoc	ktmpnt, kpitch, "gnawa.pvoc"
asig1=(asig)*kenv
kgoto	rest

rest:
a1, a2	locsig	asig1, p10, p11, p12;maybe less?
ar1, ar2 locsend
ga1=ga1+ar1
ga2=ga2+ar2
	outs	a1, a2
endin

instr 4
ilength=.17
ifade=p6
ipitch=p5/161
ipitch2=p9/161

type:
if p7=0 kgoto mid
if p7=1 kgoto allatck
if p7=2 kgoto long

mid:
ktmpnt	linseg	0, p3, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 1024, 2
asig1=asig*kenv
kgoto	rest

allatck:
katcktm	linseg	0, p3, .0179
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "polvo.pvoc", 1, 1024,2
asig1 = atck*kenva
kgoto rest

long:
ktmpnt	linseg	0, p3, ilength
kenv	linseg	0, .01, 10*p4, p3-ifade, 10*p4, ifade-.02, 0
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 1024, 2
asig1=asig*kenv
kgoto	rest


rest:
a1, a2	locsig	asig1, p10, p11, p12; this is like thunder. don't go past!!
ar1, ar2 locsend
ga1=ga1+ar1
ga2=ga2+ar2
	outs	a1, a2
endin

instr 5
;bird
adelin init 0
istart=.142
iend=1.58
ilength=iend-istart
ktmpnt	linseg	istart, ilength*p5, iend
kenv	linen	5*p4, .01, p3, .5
asig	pvadd	ktmpnt, 1, "bird.pvoc", 1, 49, 28
asig=asig*kenv
adel	delayr	.8
adelin=(asig+adel)*.8
	delayw	adelin
kangle	linseg	0, p3, 90
a1, a2	locsig	adelin, kangle, 10, .2
ar1,ar2	locsend
ga1=ga1+ar1
ga2=ga2+ar2
	outs	a1, a2
endin

instr 6
ilength=.17
ifade=p6
ipitch=p5/161
ipitch2=p9/161

ktmpnt	linseg	0, p3, ilength
kenv	linseg	0, .01, 10*p4, p3-ifade, 10*p4, ifade-.02, 0
kpitch	expseg	ipitch, p8+.001, ipitch, p3-(p8+.001), ipitch2
asig	pvadd	ktmpnt, kpitch, "polvo.pvoc", 1, 1024, 2
asig1=asig*kenv
kangle	linseg	0, p3*.3, 90, p3*.3, 20, p3*.4, 70
a1, a2	locsig	asig1, kangle, p11, p12
ar1, ar2 locsend
ga1=ga1+ar1
ga2=ga2+ar2
	outs	a1, a2
endin

instr 7
endin


instr 99
a1	reverb	ga1, p4, .5
a2	reverb	ga2, p4, .5
	outs	a1,a2
ga1=0
ga2=0
endin