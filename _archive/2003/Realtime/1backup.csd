<CsoundSynthesizer>

<CsInstruments>
sr=22050
kr=2205
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
gksineflag init 0

gkcomptime init 0

	FLpanel	"Delay",450,850 ;***** start of container

;ihdelsize  FLvalue "Length of Delay Line",75, 25,330,50

;gk1,ih11	FLslider	"Length of Delay Line (secs)", 0.0, 16.0, 0 ,5, ihdelsize, 300,15, 20, 250

gksineflag,ih1	FLbutton	"Sine", 1, 0, 3, 300, 15, 20, 50, 0, 5, 0, 1
gkdelayflag,ih2	FLbutton	"Delay", 1, 0, 3, 300, 15, 20, 150, 0, 5, 0, 1
gktapdelayflag,ih3	FLbutton	"Tap Delay On", 1, 0, 3, 300, 15, 20, 250, 0, 5, 0, 1



	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!



	instr 1	;controlled delay
if	gkdelayflag = 0 kgoto off

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
off:
	endin

	instr 2	;double input with sine tone
if	gksineflag = 0 kgoto off
ihighfreq = 2000
isineamp = 32000
igateamp = 10
asnd	in


;asnd	butterlp	asnd, ihighfreq
;asnd      limit      asnd, 0, 400
;kcps, kamp		pitchamdf asnd*.1, 20, ihighfreq
;if 	kamp < igateamp kgoto off
;kpc	= octcps(kcps)
;if	kpc > 16.0 	kgoto off
kcps, kamp		pitchamdf asnd*.1, 20,2000
if 	kamp < igateamp kgoto off
;asig	oscili	kamp*10, kcps, 2
kpc	= octcps(kcps)
kamp	tonek	kamp, 40
kcps	tonek	kcps, 500
computepitch:
kcps1 = cpsoct(kpc+gkpitch)
kcps2 = cpsoct(kpc-gkpitch)

;asig1	oscili	kamp*100, kcps1, 2
;asig2	oscili	kamp*100, kcps2, 2
asig1	oscili	isineamp, kcps1, 2
asig2	oscili	isineamp, kcps2, 2

;if 	kpc > 4 		kgoto end
;if	gkpedalval = 0	kgoto end
gasig = gkmod * (asig2 + asig1)

;gasig 	butterlp	gasig, ihighfreq

end:
out gasig
off:
	endin

	instr 3	;midi messages
kstatus, kchan, kdata1, kdata2 midiin

if	kchan	!= 1	kgoto done
if	kstatus	!= 224	kgoto nopitchchange
if	kdata1	!= 0	kgoto nopitchchange	
gkpitch = abs(1 - (kdata2 * .015625))
printks	\"Pitch Offset: %f\\n\", .25,  gkpitch
kgoto	done

nopitchchange:
if	kstatus	!= 176	kgoto done
if	kdata1	!= 1	kgoto nomodwheelchange	
gkmod = kdata2 * .007874016
printks	\"Sine Blend: %f\\n\", .25, gkmod
kgoto	done
nomodwheelchange:

if	kdata1	!= 4	kgoto nopedalchange	
kdata2	port	kdata2, .05
gkregen = kdata2 * .007874016
printks	\"RegenerationRate: %f\\n\", .1, gkregen
kgoto	done
nopedalchange:

if	kdata1	!= 6	kgoto nodatasliderchange	
gkrate = gidelsize*(kdata2 * .007874016)
printks	\"Tap TimePoint: %f\\n\", .1,  gkrate
kgoto	done
nodatasliderchange:

if	kdata1	!= 64	kgoto done	
gkpedalval = kdata2
if	gkpedalval = 127 	kgoto on
printks	\"Infinite Loop Off\\n\", .25
kgoto 	done
on:
printks	\"Infinite Loop On\\n\", .25
if	gktapdelayflag = 0 kgoto done
if	gkcomptime > 0 	kgoto compare
gkcomptime times
kgoto done
compare:
ktemptime times
knewdelaytime = ktemptime - gkcomptime
gkcomptime = 0
printks	\"DelayTime is %f\\n\", .25,knewdelaytime
if	knewdelaytime > gidelsize kgoto settomax
if	knewdelaytime  < 0 kgoto settozero
gkrate = knewdelaytime
kgoto done
settomax:
gkrate = gidelsize
kgoto done
settozero:
gkrate = .1

;printks	\"Infinite Loop Off\\n\", .25
;kgoto 	done
;on:
;printks	\"Infinite Loop On\\n\", .25

done:

	endin

	instr 4	;midi diagnostic

kstatus, kchan, kdata1, kdata2 midiin
printks	\"Status: %f Channel: %f Data1: %f Data2: %f\\n\", .25, kstatus, kchan, kdata1, kdata2

	endin

	instr 5	;button handler
igotcalled = 0
;.printks	\"Button Handler Received: %f\\n\", 1,  p4
;printks	\"Button Handler Global1: %f\\n\", 1,  gk1
;printks	\"Button Handler Global1: %f\\n\", 1,  gk2

	endin


</CsInstruments>

<CsScore>

f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1


i1 0 3600
i2 0 3600
i3 0 3600
;i4 0 3600

;
;	Don't turn off - breaks GUI
;
i5 0 3600

e

</CsScore>

</CsoundSynthesizer>