sr=44100
kr=4410
ksmps=10
nchnls=1
ga1 init	0
ga2	init	0



instr 1
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8
iamp=p9

kamp	linen		iamp, .01, p3, .01

al	diskin	"polvoish.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

		out	al;, ar

ga1=ga1+ar1
ga2=ga2+ar2
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
;	outs	ar, al
; output to reverb
ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 3
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8
iamp=p9

kamp	linen		iamp, .01, p3, .01

al	diskin	"jam1_1.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

;		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 10
endin


instr 99

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75
;	outs	a1,a2
ga1=0
ga2=0
endin

