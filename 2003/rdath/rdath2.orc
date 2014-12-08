sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0

;  (:parameters instr inst mytime dur amp pitch pan dist pct indx))

instr 1
idur = p3
iamp = p4*100
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10
iendx = indx+(iorigdur*.8)
indx = indx + (.3 * iorigdur)
kamp	linen	iamp, .01, idur, .01
ktime   line    indx, idur , iendx
 
al  sndwarp kamp, ktime, ipitch, 3, 0, 4410, 882, 15, 1, 1

al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 2
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10

kamp	linen	iamp, .01, idur, .01

al	diskin	"rdath/repeaterM.wav", ipitch, indx
al=al*kamp
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

