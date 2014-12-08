<CsoundSynthesizer>

<CsOptions>

</CsOptions>

<CsInstruments>
sr=44100
kr=4410
ksmps=10
nchnls=1

gkpedalval		init	0

gidelsize init 16
gasig	init 0

gkregen 	init 1.0
gkrate	init 0
gkmod	init 1
gkpitch	init 0

gkdelayflag init 0
gktapdelayflag init 0
gksineflag init 1

gkcomptime init 0

/****************
sndwarp-related
*****************/

gktimepoint	init 0
gisamplength	init 180



	FLpanel	"Delay",1000,200 ;***** start of container

;ihdelsize  FLvalue "Length of Delay Line",75, 25,330,50

;gk1,ih11	FLslider	"Length of Delay Line (secs)", 0.0, 16.0, 0 ,5, ihdelsize, 300,15, 20, 250

;gksineflag,ih1	FLbutton	"Sine", 1, 0, 3, 300, 15, 20, 50, 0, 5, 0, 1
;gkdelayflag,ih2	FLbutton	"Delay", 1, 0, 3, 300, 15, 20, 150, 0, 5, 0, 1
;gktapdelayflag,ih3	FLbutton	"Tap Delay On", 1, 0, 3, 300, 15, 20, 250, 0, 5, 0, 1
ih4  FLvalue "Time Point",75, 25,20,50

gktimepoint,ih44	FLslider	 "Time Pointer",0.1,gisamplength,0,5,ih4,980,15,20,20
FLsetVal_i 0.1, ih44


	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!



	instr 1	;sndwarp
;if	gkdelayflag = 0 kgoto off
idur = p3
iamp = p4*10
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
isuspoint = p10
iwinsize = p11
irandfactor = p12
itbl = p13
ioverlap = p14
isusportion = p15
iorigdur = p16
iendx = indx + iorigdur
isamptbl = 7
kamp	linen	iamp, .01, p3, .01
;ktime   linseg    indx, idur*isusportion , indx+(iorigdur*isuspoint), idur*(1-isusportion), iendx
 
al  sndwarp kamp, gktimepoint, ipitch, isamptbl, 0, iwinsize, irandfactor, ioverlap, itbl, 1
  
al=al*kamp
/*
al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
*/
	out al
/*
asig	in

delay:
anewsig	delayr	gidelsize
asigdelay	deltap	gkrate

if	gkpedalval = 0	kgoto noadd
asig = asig + ( (asigdelay +(.5 *  gasig)) * gkregen)  
kgoto done


noadd:
asig = asig
done:
	delayw	asig
out asigdelay
*/
off:
	endin


</CsInstruments>

<CsScore>

f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1
;half sine/sine window func

f4	0	513	20	6

;blueberry pie sample
f5 0 131072 1 "C:\CSOUND\snd\EmergencyPants\BlueberryPie.aif" 0 0 0 

;rectangle
f6   0   8192   -20   8   1
;BROWSE_FILE
;f7 0 1048576 1 "C:\CSOUND\snd\TrioClip.wav" 0 0 0 
f7 0  8388608 1 "BROWSE_FILE" 0 0 0 
;268435456


i1 0 3600 10 2 45 2 .75 0 1 22000 1000 4 16 1 .3


;
;	Don't turn off - breaks GUI
;
;i5 0 3600

e

</CsScore>

</CsoundSynthesizer>