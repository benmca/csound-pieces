<CsoundSynthesizer>
<CsInstruments>
sr     =        44100
kr     =        4410
ksmps  =        10
nchnls =        1        
;dbfs  =		1
    
	instr 1
iptch	=	cpspch(p4)
kcps 	init	1/7
kidx	init	1
kidx	phasor kcps 
ixmode	=	1

;two random noise generators
krptch	table  kidx ,1 ,ixmode
k.rptch	randi  .1, 8

;LFO
klfo1	oscili .7, p3/16 , 4

;ADSR
kadsr	adsr	.05,.2 , .6, .05

;oscilators
a1	oscili	.13,iptch+k.rptch*2,2
a2	oscili	.13,iptch,2    
a3	oscili	.25,iptch+klfo1,2 ;low oscil 
a4  =	a1*a2*10000

;read resonator envelope table
kres	table  kidx ,3 ,ixmode
kcps	=	1/4
;filter for 1st and 2nd oscil
a5	resonr		a4, kres*2, 100
;filter for bass oscil
a3	butterbp	a3,	80+klfo1, 100	
	out (a5+a3)*kadsr
	endin

</CsInstruments>
<CsScore>
;random noise
f1 0 1024 21 1 
;main waveform
f2 0 4096 10 .5 .5 .8 .0 .5 .4 .3 
;filter envelope
f3 0 8192 -5 350 2048 700 2048 320 256 600 256 320 512 600 1024 400 1024 610 1024 250
;lfo waveform
f4 0 1024 10 1 

i1	0	10	6.00
i1 	0	10	5.00
i1	0	10	6.07

</CsScore>
</CsoundSynthesizer>

