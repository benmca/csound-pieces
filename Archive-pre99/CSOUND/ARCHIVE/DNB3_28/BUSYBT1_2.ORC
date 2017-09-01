;
; orc.orc
;	
;	orchestra template
;
sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 	init	0
ga2	init	0

;************************************
;	INSTRUMENT 1
;************************************

instr 1
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8
iamp=p9

kamp	linen	iamp, .01, p3, .01

al	diskin	"Jam1_1.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
al=al*.1
ar=ar*.1
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin

;************************************
;	INSTRUMENT 99 - REVERB
;************************************

instr 99
ga1	butterhp	ga1, 1000
ga2	butterhp	ga2, 1000

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75

a1	reson	a1, 0, 15000
a2	reson	a2, 0, 15000

;a2	delay	a2, .01

asig1=(a1*.75)+(a2*.25)
asig2=(a1*.25)+(a2*.75)

	outs	a1,a2
ga1=0
ga2=0
endin

