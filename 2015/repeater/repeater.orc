sr=96000
kr=9600
ksmps=10
nchnls=2
ga1 init	0
ga2	init	0



instr 1
iamp=p4
ipitch=p5
ipan=p6
idist=p7
ipct=p8

kamp	linen		iamp, .001, p3, .001

al,ar	diskin	"/Users/benmca/Music/_toSort/2016.11.16.Three 4-tracks-p1.wav", ipitch, 0

;al, ar  locsig	al, ipan, idist, ipct
;ar1, ar2	locsend

		outs al*kamp, ar*kamp

;ga1=ga1+ar1
;ga2=ga2+ar2
endin





instr 2
iamp=p4
idur=p3
ipitch = p5
ipan = p6		; *
idist = p7		; * locsig args
ipct = p8		; *
inst=p9
iendx=p10
indx=p11
iatckpt=p11+p12
iatck=p12

krmp	linen	iamp*10000, .01, idur, .01
ktim	linseg	indx, iatck, iatckpt, idur-iatck, iendx

;
;notes: tying amp to different params in sndwarp?
;
asnd,acmp	sndwarp		iamp, ktim, ipitch, inst, 0, 4000, 40, 40, 2, 1
asnd		balance		asnd,acmp

;ramp thangs
asnd = asnd*krmp

; locsig statements
ar, al		locsig		asnd, ipan, idist, ipct
ar1, ar2	locsend

outs	ar, al
; output to reverb
ga1=ga1+ar1
ga2=ga2+ar2
endin



instr 99

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75
;	outs	a1,a2
ga1=0
ga2=0
endin

