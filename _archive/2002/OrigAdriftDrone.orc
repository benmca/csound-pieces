sr=22050
kr=2205
ksmps=10
nchnls=1

ga1 	init	0
;ga2	init	0



	FLpanel	"Sndwarp",450,850 ;***** start of container
ih1  FLvalue "Amp",75, 25,330,50
ih2  FLvalue "xdens",75, 25,330,150
ih3  FLvalue "kgdur",75, 25,330,250
ih4  FLvalue "Rand Amp",75, 25,330,350
ih5  FLvalue "Rand Freq",75, 25,330,450
ih6  FLvalue "Freq Scalar",75, 25,330,550 
ih7  FLvalue "Grain Amp",75, 25,330,650 

FLsetVal_i 15000, ih1
FLsetVal_i 100, ih2
FLsetVal_i .1, ih3
FLsetVal_i 2, ih4
FLsetVal_i 2, ih5
FLsetVal_i 1, ih6
FLsetVal_i 15000, ih7

gk1,iha	FLslider	"Amp", 1, 16000, 0 ,5, ih1, 300,15, 20,50
gk2,iha	FLslider	"Grain Density", 50, 400, 0 ,5, ih2, 300,15, 20,150
gk3,iha	FLslider	"Grain Duration", .005, .5, 0 ,5, ih3, 300,15, 20,250
gk4,iha	FLslider	 "Rand Amp",.1,20,0,5,ih4,300,15,20,350
gk5,iha	FLslider	 "Rand Freq",.1,20,0,5,ih5,300,15,20,450
gk6,iha	FLslider	 "Freq Scalar into drone",.1,2,0,5,ih6,300,15,20,550
gk7,iha	FLslider	 "Amp of Grain",1, 16000, 0 ,5, ih7, 300,15, 20,650

	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!

;####################################################
	instr	1
;	Low Drone (Scene 1)
;####################################################

ifreq	cpsmidi

;####################################################
;	Ramp ends for midi note - equiv to linen 1,.01,p3,.01
;####################################################
	xtratim .1       ;extra-time, i.e. release dur;
krel	init    0
krel	release         ;outputs release-stage flag (0 or 1 values)
if	(krel > .5) kgoto  rel  ;if in relase-stage goto relase section
;
;************ attack and sustain section ***********
kmp1	linseg  0,.1,1,3600,1 
	kgoto   done
;
;************ release section **********************
rel:
kmp1	linseg  1,.1,0
done:
kmp     =       kmp1*gk1
kgrainamp = kmp1*gk7
;###################################################
;grain stuff
;####################################################
a1	grain		kgrainamp *.4, ifreq*2, gk2, 0, 10, gk3, 2, 4, 1
a2	grain		kgrainamp *.4, ifreq*3, gk2, 0, 10, gk3, 2, 4, 1
a1=(a1+a2)*.5

;####################################################
; fm drone with random index
;####################################################
knois	randh		gk4,gk5
kfreq1=ifreq*gk6
amod	oscili	(cpsoct(knois))*(kfreq1), kfreq1, 2
acar	oscili	kmp*.3, (kfreq1+amod), 2

;####################################################
;four oscillators with different vibrato
;####################################################
avib	oscili	.007, 1, 2
avib2	oscili	.007, 6, 2
avib3	oscili	.007, .25, 2
av1	oscili	kmp*.9, (ifreq),2;*(1+avib), 2
av2	oscili	kmp*.85, (ifreq)*(1+avib2), 2
av3	oscili	kmp*.85, (ifreq)*(1+avib3), 2
a1=(av1+av2+av3+a1+acar)
;####################################################
;all together now
;####################################################
;a1, a2	locsig	a1, 50, 5, .1
;ar1, ar2	locsend

ga1=ga1+(a1*.01)
;ga1=ga1+ar1
;ga2=ga2+ar2

;	outs	a1, a2
	out	a1

endin




instr 99
a1	reverb	ga1, 15, .5
;a2	reverb	ga2, 15, .5
;	outs	a1,a2
	out	a1

ga1=0
ga2=0
endin

