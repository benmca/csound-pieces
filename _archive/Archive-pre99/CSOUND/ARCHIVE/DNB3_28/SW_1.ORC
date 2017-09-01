sr=22050
kr=2205
ksmps=10
nchnls=2

ga1 	init	0
ga2	init	0

instr 1
iamp=p4
idur=p3
ipitch=p5
irev=p6*.01
iangle=p7

kenv	linen	iamp, .01, idur, .01

;sndwarp

ktm		linseg	0, iamp, 10
a1, acmp	sndwarp	1, ktm, 1, 2, 0, 2000, 400, 10, 3, 1
a1		balance	a1, acmp

a1=a1*kenv

;resons

anarrow		reson	a1, ipitch, .1
a10		reson	a1, ipitch, 10
a1000		reson	a1, ipitch, 1000

;balance?

;anarrow	balance	anarrow, a1
;a10		balance	a10, a1
;a1000		balance	a1000, a1

;narrow filter to reverb

asig1, asig2	locsig	anarrow, iangle, 1, irev
ar1, ar2	locsend

;rest to out, panned with locsig

asig=anarrow+a10+a1000

asig3, asig4	locsig	asig, 45, 10, .1
ar3, ar4	locsend

ga1=ga1+ar1
ga2=ga2+ar2

		outs	asig3, asig4


instr 99
a1	reverb	ga1, p4, .5
a2	reverb	ga2, p4, .5
	outs	a1,a2
ga1=0
ga2=0
endin