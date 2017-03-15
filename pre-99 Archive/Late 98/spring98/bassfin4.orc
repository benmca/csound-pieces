sr=22050
kr=2205
ksmps=10
nchnls=2



instr 3
ilength=.3
ipitch=p5/120 ;120 is pitch of orig sample
iatck=.07
ifade=p6
;assign beginning and end pitches for glissando

ipitch=p5/120
ipitch2=p9/120

;type: where the note's at in the phrase; 0=beg, 1=mid, 2=end, 3=nosus, 4=solo

type:
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto end
if p7=3 kgoto allatck
if p7=4 kgoto onenote

beg:
katcktm	linseg	0, iatck+.1, iatck+.1
kenv	linseg 	0,.01, 10*p4, iatck-.02, 10*p4, .01, 0, .1, 0 ; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
	asig1 = atck*kenv
timout 	iatck+.3, p3-iatck, zero0
if katcktm >= iatck kgoto begsus
	asig2=0
	kgoto rest

zero0:
asig1=0
kgoto begsus

begsus:
asig1=0
ksustm	linseg	iatck, p3-iatck, ilength ;fade starts .1 before end???
kenvs	linen	15*p4, .01, p3-iatck, .01
kpitch	expseg	ipitch, p8+.01, ipitch, (p3-iatck)-(p8+((p3-iatck)*.6)), ipitch2, (p3-iatck)*.6, ipitch2 
asus	pvadd	ksustm, kpitch, "gnawa.pvoc", 1, 512, 2
asus2	pvadd	ksustm, kpitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, kpitch, "gnawa.pvoc", 1, 7, 2
asig2 = (asus+asus2+asus3)*kenvs
asig3 = 1*kpitch
kgoto rest



beg:
ktmpnt	linseg	0,iatck, iatck, p3-iatck, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	1, iatck, 1, .001, ipitch, p8+.01, ipitch, (p3-iatck)-.6, ipitch2, .5999, ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 2
asig1=asig*kenv
kgoto	rest

mid:
ibeg=iatck*p10
idur=iatck-ibeg
ktmpnt	linseg	ibeg, idur, iatck, p3-iatck, ilength
kenv	linen	15*p4, .01, p3, .01
kpitch	expseg	1, idur, 1, .001, ipitch, p8+.01, ipitch, (p3-iatck)-.6, ipitch2, .599, ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 2
asig1=asig*kenv
kgoto	rest

allatck:
asig2=0
katcktm	linseg	0, p3, iatck 
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest

long:
ibeg=iatck*p10
idur=iatck-ibeg
ktmpnt	linseg	ibeg, idur, iatck, p3-iatck, ilength
kenv	linseg	0, .01, p4*15, p3-p6, p4*15, p6, 0
kpitch	expseg	1, idur, 1, .001, ipitch, p8+.01, ipitch, (p3-iatck)-.6, ipitch2, .599, ipitch2
asig	pvadd	ktmpnt, kpitch, "gnawa.pvoc", 1, 512, 2
asig1=asig*kenv
kgoto	rest


rest:
	outs	asig1, asig1
endin


