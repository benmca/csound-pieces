;INSTR 100
;8 in 2 out Mixer using ZAK system
;LEE ZAKIAN 7/28/02 10:31:04 PM

sr		= 44100
kr 		= 4410
ksmps 		= 10
nchnls 		= 2
zakinit	30,30	;initialize ZAK system
			;30 audio rate channels, 30 control rate channels

	instr 1		;test oscillator
iamp		=	ampdb(p4)		;amplitude converter
ifrq		=	cpspch(p5)		;pitch converter
iout		=	p6
kdclk		linseg  	0, .2, 1, p3-.4, 1, .2, 0	;declick envelope
asig		oscil	iamp, ifrq, 1
		zawm	asig*kdclk, iout
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
			;mac opcode multiplies & accumulates signals
aoutL		mac	igL1, a1, igL2, a2, igL3, a3, igL4, a4, igL5, a5, igL6, a6, igL7, a7, igL8, a8 
aoutR		mac	igR1, a1, igR2, a2, igR3, a3, igR4, a4, igR5, a5, igR6, a6, igR7, a7, igR8, a8 
		outs	aoutL, aoutR
		zacl	0, 30	;final zak instrument clears audio channels 0 to 30
		endin
	