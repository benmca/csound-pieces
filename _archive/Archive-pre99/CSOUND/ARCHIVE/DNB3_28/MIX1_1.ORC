;
; minimal2.orc: simple sndwarp readthroughs of short drum samples
; 1- bass, 2-snare, 3 and 4 - penderecki gong-like sounds, 5-7 tom from j. cage landscape no 4(?)
;

sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0


instr 1
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8
iamp=p9

kamp	linen		iamp, .01, p3, .01

al	diskin	"Jam1_1.aiff", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

		outs	al, ar

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
iatckpt=p12
iatck=p12-p11

krmp	linen	iamp, .01, idur, .01
ktim	linseg	indx, iatck, iatckpt, idur-iatck, iendx

asnd,acmp	sndwarp		iamp, ktim, ipitch, inst, 0, 4000, 30, 40, 8, 1
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
klin linseg  p4, p3, p4
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, .75
a2	reverb2	ga2, klin, .75
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0
endin

