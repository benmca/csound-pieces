;8 in 2 out Mixer

sr		= 44100
kr 		= 4410
ksmps 		= 10
nchnls 		= 2
zakinit	30,30

instr 1
iamp		=	p4
ifrq		=	p5
iout		=	p6
kdclk		linseg  	0, .2, 1, p3-.4, 1, .2, 0	;declick envelope
asig		oscil	p4, p5, 1
		zaw	asig*kdclk, iout
	endin

	instr 100	;8 in 2 out MIXER

;++CHANNEL 1
a1		zar	p4		;IN
igL1		init	p5*p6		;GAIN
igR1		init	p5*(1-p6)	;PAN
;=====
;++CHANNEL 2
a2		zar	p7		;IN
igL2		init	p8*p9		;GAIN
igR2		init	p8*(1-p9)	;PAN
;=====
;++CHANNEL 3
a3		zar	p10		;IN
igL3		init	p11*p12	;GAIN
igR3		init	p11*(1-p12)	;PAN
;=====
;++CHANNEL 4
a4		zar	p13		;IN
igL4		init	p14*p15	;GAIN
igR4		init	p14*(1-p15)	;PAN
;=====
;++CHANNEL 5
a5		zar	p16		;IN
igL5		init	p17*p18	;GAIN
igR5		init	p17*(1-p18)	;PAN
;=====
;++CHANNEL 6
a6		zar	p19		;IN
igL6		init	p20*p21	;GAIN
igR6		init	p20*(1-p21)	;PAN
;=====
;++CHANNEL 7
a7		zar	p22		;IN	
igL7		init	p23*p24	;GAIN
igR7		init	p23*(1-p24)	;PAN
;=====
;++CHANNEL 8
a8		zar	p25		;IN
igL8		init	p26*p27	;GAIN
igR8		init	p26*(1-p27)	;PAN
;=====

aoutL		=	a1+igL1+a2+igL2+a3+igL3+a4+igL4+a5+igL5+a6+igL6+a7+igL7+a8+igL8
aoutR		=	a1+igR1+a2+igR2+a3+igR3+a4+igR4+a5+igR5+a6+igR6+a7+igR7+a8+igR8
		outs	aoutL, aoutR
		zacl	0, 30
		endin
	