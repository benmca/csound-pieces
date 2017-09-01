sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0

;  (:parameters instr inst mytime dur amp pitch pan dist pct indx))

instr 1
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9

kamp	linen	1, .01, idur, .01

al	diskin	"sources/christmasball.wav", ipitch, indx
al=al*kamp
al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin


instr 99
klin linseg  1000, p3, 1000
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, .75
a2	reverb2	ga2, klin, .75
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0
endin

