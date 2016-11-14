sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init	0
ga2	init	0



instr 1
idur = p3
iamp = p4 * 16000
ipitch = p5
ipan = p6
idist = p7
ipct = p8

;  asig pluck p4, ipitch, ipitch*0.81, 1, 3, .5

  ifn = 0
  imeth = 1

asig pluck iamp, ipitch, ipitch, ifn, imeth

a1, a2	locsig  asig, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin



instr 99

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75
	outs	a1,a2
ga1=0
ga2=0
endin

