sr = 22050
kr = 2205
ksmps = 10
nchnls = 2

ga1 init 0
ga2 init 0
ga3 init 0
ga4 init 0

instr 1
iamp = p4*8
asampfreq = p5/220
ksampfreq = p5/220
ifn = p6
iloc=p7
idist=p8
irpct=p9
;
kamps	oscili iamp, 1/p3, 3
aenv	phasor	440
asig	sndwarp	1, aenv, asampfreq, 2,0, 2500, 200, 20, 3, 1
;asig	reson asig,880, 200
;
as1,as2	locsig	asig, iloc, idist, irpct
ar1,ar2	locsend
ga1=ga1+ar1
ga2=ga2+ar2
;
	outs	as1*kamps,as2*kamps
endin

instr 	2
ifreq = p4
iamp = 3500
iloc=p5
idist=p6
irpct=p7
kbal=p8

asig	pluck	1, ifreq, ifreq, 0, 1
;
kamps	linen	iamp, .1, p3, .1

as1,as2	locsig	asig, iloc, idist, irpct
ar1,ar2	locsend

ga3=ga3+(ar1*(1-kbal))
ga4=ga4+(ar2*(1-kbal))

outs as1*kamps*kbal, as2*kamps*kbal
;

endin

instr 10;lange!

iwsize = 2500
irand = 200
ioverlap = 20

aenv1	linseg	0, 20, 0, .01, 1, 30, 1, .01, 0, 5, 0, .01, 1,35,1,5, .5,40,0 
awarp1	linseg	0, 20, 0, 30.02, 7.0, .01, .01, 5.02, .01, 30.02, 7.0, .01, .01, 12, 7.0, .01,.01, 6.0, 6.0, 8, 7.0
;					    	 55"		             95"             105"                    121"
asig1	sndwarp	1500, awarp1, 1, 4, 0, iwsize, irand, ioverlap, 3, 1
awarp2	linseg	0, 20, 0, 30.02, 7.0, .01, .01, 5.02, .01, 30.02, 7.0, .01, .01, 12, 7.0, .01,.01, 6.0, 6.0, 8, 7.0

;					    	 55"		             95"             105"                    121"
asig2	sndwarp	1500, awarp2, 1, 5, 0, iwsize, irand, ioverlap, 3, 1
outs	asig1*aenv1, asig2*aenv1
endin

instr 11
idur=p3
endin

instr 98
irevtime = 20
arev1 nreverb ga3, irevtime-.1, .25
arev2 nreverb ga4, irevtime, .25
ga3=0
ga4=0
outs arev1, arev2
endin


instr 99

irevtime = 2.5

arev1 nreverb ga1, irevtime-.1, .25
arev2 nreverb ga2, irevtime, .25

ga1=0
ga2=0

outs arev1, arev2

endin
