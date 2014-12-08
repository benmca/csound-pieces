<CsoundSynthesizer>

<CsOptions>

</CsOptions>

<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=1




	FLpanel	"Sndwarp",450,850 ;***** start of container
ih1  FLvalue "Overall Amp",75, 25,330,50
ih2  FLvalue "xdens",75, 25,330,150
ih3  FLvalue "kgdur",75, 25,330,250
ih4  FLvalue "Rand Amp",75, 25,330,350
ih5  FLvalue "Rand Freq",75, 25,330,450
ih6  FLvalue "Freq Scalar",75, 25,330,550 
ih7  FLvalue "Grain Amp",75, 25,330,650 


gk1,ih11	FLslider	"Overall Amp", 1, 16000, 0 ,5, ih1, 300,15, 20,50
gk2,ih22	FLslider	"Grain Density", .1, 10, 0 ,5, ih2, 300,15, 20,150
gk3,ih33	FLslider	"Grain Duration", .005, 1, 0 ,5, ih3, 300,15, 20,250
gk4,ih44	FLslider	 "Rand Amp",0,1,0,5,ih4,300,15,20,350
gk5,ih55	FLslider	 "Rand Freq",0,1,0,5,ih5,300,15,20,450
gk6,ih66	FLslider	 "Freq Scalar into drone",.1,2,0,5,ih6,300,15,20,550
gk7,ih77	FLslider	 "Amp of Grain",1, 16000, 0 ,5,ih7, 300,15, 20,650
;rewrite inst is #2 - calls instr 2 for 1 sec

FLsetVal_i 10000, ih11
FLsetVal_i .1, ih22
FLsetVal_i .1, ih33
FLsetVal_i 0, ih44
FLsetVal_i 0, ih55
FLsetVal_i .1, ih66
FLsetVal_i 10000, ih77
	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!


	instr 1	;untitled

iinitfreq cpsmidi
ifreq	= .33 * (iinitfreq / 440)
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
;###################################################
;grain stuff
;	uses xdens (gk2) and kgdur (gk3) 
;	from GUI
;Bette is f5
;####################################################
;a1	grain		kmp *.4, ifreq*2, gk2, 0, 10, gk3, 5, 4, 1
agrain 	grain		kmp , ifreq, gk2, gk4, gk5, gk3, 5, 6, 1, 1
;####################################################
;all together now
;####################################################
;a1, a2	locsig	a1, 50, 5, .1
;ar1, ar2	locsend

;ga1=ga1+(a1*.01)
;ga1=ga1+ar1
;ga2=ga2+ar2

;	outs	a1, a2
	out	agrain
	endin


</CsInstruments>

<CsScore>

; Chel polynomial

f1	0	513	13	1	1	0	2	0	2	2	3	4

				;partials:  ^ on...

f2	0	513	10	1

;sine

f3	0	513	20	9

;half sine/sine window func

f4	0	513	20	6

;blueberry pie sample
f5 0 131072 1 "C:\CSOUND\snd\EmergencyPants\BlueberryPie.aif" 0 0 0 

;rectangle
f6   0   8192   -20   8   1




i1	0	20



e

e

</CsScore>

</CsoundSynthesizer>