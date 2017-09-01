sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0

instr 1
ipan = p6
idist = 1
ipct = .1
k1	linen	p4, .01, p3, .01
asig	diskin	"josh4.wav",p5
asig=asig*k1
a1, a2		locsig	asig, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 2
ipan = p6
idist = 1
ipct = .1
k1	linen	p4, .01, p3, .01
asig	diskin	"josh3.wav",p5
asig=asig*k1

a1, a2		locsig	asig, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 99
a1	reverb	ga1, p4
a2	reverb	ga2, p4
	outs	a1,a2
ga1=0
ga2=0
endin
