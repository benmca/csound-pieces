sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0


instr 1
indx=p4
ipan=p5
iamp=p6
iclimb=p7-.01
ipitch=1
idist=1
ipct=.1

kamp	linen	iamp, iclimb, p3, .01

al, ar	diskin	"loopidx4_1.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

al	reson	al, 0, 10000
ar	reson	ar, 0, 10000
ar1	reson	al, 0, 10000
ar2	reson	ar, 0, 10000

ga1=ga1+ar1
ga2=ga2+ar2
		outs	al, ar

endin


instr 99
klin linseg  p4, p3, p4
kamp	linseg	0, 80, 0, .01, 1, p3-(80.01), 1
a1	reverb2	ga1, klin, .75
a2	reverb2	ga2, klin, .75


	outs	a1*kamp,a2*kamp
ga1=0
ga2=0
endin
