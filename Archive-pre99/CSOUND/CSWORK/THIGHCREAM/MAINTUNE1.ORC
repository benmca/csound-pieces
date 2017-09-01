sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0

instr 1
idur = p3
iamp = p4 * 32768
ipitch = p5
ipan = p6
idist = p7
ipct = p8

kamp    linen   iamp, .02, idur, idur*.5
asig    oscili  kamp, ipitch, 2

a1, a2		locsig	asig, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2

endin


instr 99
a1	reverb	ga1, 5
a2	reverb	ga2, 5
	outs	a1,a2
ga1=0
ga2=0
endin
