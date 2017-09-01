sr=22050
kr=2205
ksmps=10
nchnls=1


instr 3
;
;attentiones!!!  You need to change .0348 to later in the file. Hence the burst.
;
ipitch=p5/120

katcktm	linseg	.01, .059, .069 
kenva	linen	10*p4, .01, .069, .01
atck	pvadd	katcktm, 1, "gnawa.pvoc", 1, 1024,1

timout	.069, p3-.069, sus

asig1 = atck*kenva

asig2=0
kgoto rest

sus:
asig1=0
ksustm	linseg	.069, p3-.069, .366
kenvs	linen	0*p4, .01, p3-.069, .01
asus	pvadd	ksustm, ipitch, "gnawa.pvoc", 1, 1000, 1
asus2	pvadd	ksustm, ipitch, "gnawa.pvoc", 1, 40, 2
asus3	pvadd	ksustm, ipitch, "gnawa.pvoc", 1, 7, 2

asig2 = (asus3)*kenvs

rest:
	out	asig1+asig2

endin


