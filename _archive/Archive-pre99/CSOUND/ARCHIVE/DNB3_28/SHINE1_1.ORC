sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0

instr 1
iamp=p4
ipitch=p5
ipan=p6
idist=p7
ipct=p8
indx=p9

kamp	linen	iamp, .5, p3, .5

al	diskin	"thunhiss3.aif", 1, indx, 1


al       reson  al, ipitch, 1
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

endin

instr 99

a1	reverb2	ga1, p4, .9
a2	reverb2	ga2, p4, .9

a1	butterhp a1, 1000
a2	butterhp a1, 1000



	outs	a1,a2
ga1=0
ga2=0
endin
