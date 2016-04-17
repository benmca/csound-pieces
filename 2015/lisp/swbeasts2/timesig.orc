sr=44100
kr=4410
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
indx=p9
ifname=p10

kamp	linen		iamp, .05, p3, .01

al,ar	diskin	p10, ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin




instr 2
idur=p3
iamp=p4
ipitch = p5
ipan = p6		; *
idist = p7		; * locsig args
ipct = p8		; *
inst=p9 
indx=p10
iendx=p11
;iatckpt=p11+p12
;iatck=p12
iorigdur=iendx - indx 
iatck=p12

krmp	linen	iamp*10000, .01, idur, .01
; ktim	linseg	indx, iatck, iatckpt, idur-iatck, iendx
ktim linseg indx, iorigdur, iendx
;
;notes: tying amp to different params in sndwarp?
; 
;asnd,acmp	sndwarp		iamp, ktim, ipitch, inst, 0, 40, 10, 10, 2, 1
asnd,acmp	sndwarp		iamp, ktim, ipitch, inst, 0, 400, 40, 10, 2, 1
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

instr 3
iamp=p4
ipitch=p5
ipan=p6
idist=p7
ipct=p8
indx=p9

kamp	linen		iamp, .01, p3, .01

al	diskin	"jam.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 10
endin


instr 99

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75
	outs	a1,a2
ga1=0
ga2=0
endin

