sr=22050
kr=2205
ksmps=10
nchnls=1


	FLpanel		"Sndwarp",450,550 ;***** start of container
ih1  FLvalue "a",75, 25,330,50
ih2  FLvalue "a",75, 25,330,150

gk1,iha	FLslider	"Amp", 1, 16000, 0 ,5, ih1, 300,15, 20,50
gk2,iha	FLslider	"TimePoint", .1, 13.8, 0 ,5, ih2, 300,15, 20,150
	FLpanel_end	;***** end of container
	
	FLrun		;***** runs the widget thread, it is always required!

instr	1
ifreq cpsmidi
asig	sndwarp	gk1, gk2, ifreq, 2, 0, 4000, 2000, 40, 1, 1
out asig
endin
