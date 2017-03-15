sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0


instr 1
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8

kamp	linen	1, .01, p3, .01

al	diskin	"Jam1_1.aif", ipitch, indx
al=al*kamp
al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 99
klin linseg  1000, p3, 1000
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, .75
a2	reverb2	ga2, klin, .75
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0
endin

