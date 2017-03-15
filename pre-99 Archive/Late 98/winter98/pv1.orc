sr=44100		
kr=4410
ksmps=10
nchnls=1

instr 1
ilength = ftlen(1)
isampfreq = sr/ilength
iwsize = 3000
irand = 200
ioverlap = 20

;kenv	linen	1, .05, p3, .05
;asig	oscili	1, isampfreq, 1

awarp	linseg	.601, 2, 1.128
asig	sndwarp	p4, awarp, 1, 1, 0, iwsize, irand, ioverlap, 2, 1
out asig

endin
