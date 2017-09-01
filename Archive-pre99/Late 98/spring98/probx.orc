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

out atck
sus:
a1=0
out a1
endin


