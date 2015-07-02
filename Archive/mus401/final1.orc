sr=22050
kr=2205
ksmps=10
nchnls=1



instr 3
ilength=.3
ipitch=p5/120 ;120 is pitch of orig sample
iatck=.08

;assign beginning and end pitches for glissando

if p6=0 kgoto type
ipitch=p5/289
ipitch2=p9/289


ipitch2=ipitch1 ;beg and end note are same (no gliss)

;type: where the note's at in the phrase; 0=beg, 1=mid, 2=end, 3=nosus, 4=solo

type:
ipitch2=ipitch1 ;beg and end note are same (no gliss)
if p7=0 kgoto beg
if p7=1 kgoto mid
if p7=2 kgoto end
if p7=3 kgoto allatck
if p7=4 kgoto onenote

beg:
katcktm	linseg	0, iatck+.5, iatck+.5
kenva	linseg	10*p4, iatck, 10*p4, .01, 0, .5, 0 ; amps
kenvb	linseg 	0,.01, 1, iatck-.02, 1, .01, 0, .5, 0 ; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = kenvb*(atck*kenva)
timout iatck+.1, p3-(iatck+.1), begsus
if katcktm > iatck kgoto begsus
asig2=0
kgoto rest

begsus:
asig1=0
ksustm	linseg	iatck, p3-iatck, ilength-.1 ;fade starts .1 before end???
kenvs	linseg	0, .01, 15*p4, p3-iatck, 15*p4
kenvsb	linen	1, .01, .1+(p3-iatck), .01
apitch	linseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2 
asus	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 512, 2, 4
asus2	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 7, 2
asig2 = kenvsb*((asus+asus2+asus3)*kenvs)
kgoto rest

mid:
ibeg=iatck/p10
idur=iatck-ibeg
katcktm	linseg	ibeg, iatck+.5, iatck+.5
kenva	linseg	10*p4, idur, 10*p4, .01, 0, .5, 0 ; amps
kenvb	linseg 	0,.01, 1, idur-.02, 1, .01, 0, .5, 0 ; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = kenvb*(atck*kenva)
timout idur+.1, p3-(idur+.1), midsus
if katcktm > iatck kgoto midsus
asig2=0
kgoto rest

midsus:
asig1=0
ksustm	linseg	iatck, p3-iatck, ilength-.1 ;fade starts .1 before end???
kenvs	linseg	0, .01, 15*p4, p3-idur, 15*p4
kenvsb	linen	1, .01, .1+(p3-idur), .01
apitch	linseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2 
asus	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 512, 2, 4
asus2	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 7, 2
asig2 = kenvsb*((asus+asus2+asus3)*kenvs)
kgoto rest

end:
ibeg=iatck/p10
idur=iatck-ibeg
katcktm	linseg	ibeg, iatck+.5, iatck+.5
kenva	linseg	10*p4, idur, 10*p4, .01, 0, .5, 0 ; amps
kenvb	linseg 	0,.01, 1, idur-.02, 1, .01, 0, .5, 0 ; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = kenvb*(atck*kenva)
timout idur+.1, p3-(idur+.1), midsus
if katcktm > iatck kgoto midsus
asig2=0
kgoto rest

endsus:
asig1=0
ksustm	linseg	iatck, p3-iatck, ilength
kenvs	linseg	0, .01, 15*p4, p3-idur, 15*p4
kenvsb	linen	1, .01, .1+(p3-idur), .01
apitch	linseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2 
asus	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 512, 2, 4
asus2	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 7, 2
asig2 = kenvsb*((asus+asus2+asus3)*kenvs)
kgoto rest



allatck:
asig2=0
katcktm	linseg	0, p3, ilength
kenva	linen	10*p4, .005, p3, .005; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = atck*kenva
kgoto rest

onenote:
katcktm	linseg	0, iatck+.5, iatck+.5
kenva	linseg	10*p4, iatck, 10*p4, .01, 0, .5, 0 ; amps
kenvb	linseg 	0,.01, 1, iatck-.02, 1, .01, 0, .5, 0 ; ramp
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1
asig1 = kenvb*(atck*kenva)
timout iatck+.1, p3-(iatck+.1), onesus
if katcktm > iatck kgoto onesus
asig2=0
kgoto rest

onesus:
asig1=0
ksustm	linseg	iatck, p3-iatck, ilength
kenvs	linseg	0, .01, 15*p4, p3-iatck, 15*p4
kenvsb	linen	1, .01, .1+(p3-iatck), .01
apitch	linseg	ipitch, p8+.01, ipitch, p3-(p8+.01), ipitch2 
asus	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 512, 2, 4
asus2	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, apitch, "gnawa.pvoc", 1, 7, 2
asig2 = kenvsb*((asus+asus2+asus3)*kenvs)
kgoto rest

rest:
	out	asig1+asig2
	
endin

