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
asig1	diskin	"uglybdM.aif",p5
asig2	diskin	"DW13x15TomM.wav",p5
asig3=(((asig1*2)+asig2)*k1)
;
;These filters take mung out of tom, some clickiness out too
;
asig4    butterbr  asig3, 170, 40   
asig    butterbr  asig4, 3000, 1000   

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
a1	diskin	"ruinsnr1M.aif",p5
a1=a1*k1

a1, a2		locsig	a1, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 3
ipan = p6
idist = 1
ipct = .1
k1	linen	p4, .01, p3, .01
a1	diskin	"hh.aif",p5
a1=a1*k1

a1, a2		locsig	a1, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 4
ipan = p6
idist = 1
ipct = .1
k1	linen	p4, .01, p3, .01
a1	diskin	"uglybdM.aif",p5
a1=a1*k1

a1, a2		locsig	a1, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 99
a1	reverb	ga1, .5
a2	reverb	ga2, .5
	outs	a1,a2
ga1=0
ga2=0
endin
