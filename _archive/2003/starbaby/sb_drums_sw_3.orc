sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0


instr 1
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = 1
ipct = .1
ibinoffset = p7 
indx = 0
iendx = 60
iorigdur = iendx-indx

kamp	linen	iamp, .01, idur, .01
ktime   line    indx, idur , iendx

ktimptsw	linseg	0,p3,60
ktimptdrm	linseg	0, p3, 60

kinterp	linseg	.9, p3*.25, .95, p3*.75, .8

pvbufread	ktimptdrm, "sbdrums_short_M.pv"

;experimenting with fixing either kfreqinterp or kampinterp...
asig	pvinterp	ktimptsw,1 , "shortwave.pv", 1, 1, 1, 1, 1, kinterp

asig = (asig*kamp)*.5

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
