sr=44100
ksmps=100
nchnls=2

ga1 init 0
ga2 init 0




instr 1 
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10
iendx = indx + iorigdur

kamp	linen	iamp, .0001, idur, .01
ktime   line    indx, idur , iendx
 
al	diskin	"/Users/ben/src/csound-pieces/_archive/2015/jam/jam.aif", ipitch, indx
;al  sndwarp kamp, ktime, 1, 4, 0, 4410, 882, 15, 1, 1

al=al*kamp*100

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 99
klin linseg  p4, p3, p4
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, 1
a2	reverb2	ga2, klin, 1
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0

endin