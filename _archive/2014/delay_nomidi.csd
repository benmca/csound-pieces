;
; ""
; by 
;
; -B value and DMA buffer setting must be equal!
;
; Generated by blue 0.104.3 (http://csounds.com/stevenyi/blue/index.html)
;

<CsoundSynthesizer>

<CsInstruments>
sr=44100
ksmps=441
nchnls=1

#define guideTrackFile	#"D:\\Audio\\Ben\\Guitar Improvs\\Finished\\AcousticScratch.wav"#
#define overdubFile		#"c:\\overdub.wav"#
; this is the y offset caused by the tabs
#define tabsYoffset	#50#
;***********************************************************
;	THIS IS THE MAXIMUM DELAY TIME
;***********************************************************
#define	totalDelayLineTime	#32#
;***********************************************************
;
;***********************************************************
;***********************************************************
;	THIS IS THE IO Base channel - stereo output 
;	goes in and out from IOBaseChannel and 
;	IOBaseChannel+1
;***********************************************************
#define	IOBaseChannel	#1#
;***********************************************************
;
;***********************************************************
;gkpedalval		init	0
gkmaxdel	init $totalDelayLineTime
gidelsize init i(gkmaxdel)
gasig	init 0
gaout1	init 0
gaout2	init 0
gaout1_1	init 0
gaout2_1	init 0
gaout1_2	init 0
gaout2_2	init 0
gaout1_3	init 0
gaout2_3	init 0
gaout1_4	init 0
gaout2_4	init 0
gkfileflag init 0
gkfileopen init 0
gkguidefilestopflag init 0;
gkregen 	init 1.0
gkrate	init 0
gkmod	init 1
gkpitch	init 0
gkdelayflag init 1
gktapdelayflag init 0
gksineflag init 0
gkcomptime init 0
gkcomptime1 init 0
gkcomptime2 init 0
gkcomptime3 init 0
gkcomptime4 init 0
gkcomptime1_flag init 0
gkcomptime2_flag init 0
gkcomptime3_flag init 0
gkcomptime4_flag init 0
garegensig init 0
garegensig2 init 0
; this is set to 1 by reset button event
gkturnoff init 0
;
; this turns off midi keys as tap tempos
;
gkmiditap init 0
;
; for multitracks

garegensig1_1 init 0
garegensig2_1 init 0
garegensig1_2 init 0
garegensig2_2 init 0
garegensig1_3 init 0
garegensig2_3 init 0
garegensig1_4 init 0
garegensig2_4 init 0
;
;temp values
;
;gkregen init 1
gkmintap init .1
;gkrate init 16
;gksineflag init 1
;gkdelayflag init 1
;gktapdelayflag init 1
;iwidth,iheight,ibpp bmopen	"allblack.bmp",1 ,1
gkloop1 init 0
gkloopread1 init 0
	FLpanel	"Delay",510, 900;***** start of container
	FLtabs	510, 900, 0, 0
;****************************************************
;	Tracks page	
;****************************************************
	FLgroup	"Tracks",510,900,0,0+$tabsYoffset,0
ihandle1  FLbox  "Track:", 1, 1, 20, 100, 100, 0, 0+$tabsYoffset
ihandle2  FLbox  "1", 1, 1, 20, 100, 100, 100, 0+$tabsYoffset
ihandle3  FLbox  "2", 1, 1, 20, 100, 100, 200, 0+$tabsYoffset
ihandle4  FLbox  "3", 1, 1, 20, 100, 100, 300, 0+$tabsYoffset
ihandle5  FLbox  "4", 1, 1, 20, 100, 100, 400, 0+$tabsYoffset
;
;
ihandle6  FLbox  "Input", 1, 1, 16, 100, 50, 0, 125+$tabsYoffset
ihandle7  FLbox  "Output", 1, 1, 16, 100, 50, 0, 175+$tabsYoffset
ihandle8  FLbox  "Delay Time", 1, 1, 16, 100, 100, 0, 300+$tabsYoffset
ihandle9  FLbox  "Regeneration", 1, 1, 16, 100, 100, 0, 450+$tabsYoffset
gkinput1,gihinput1		FLtext	" ", 0, 1, .05, 1,        80, 20, 110, 135+$tabsYoffset
gkoutput1,gihoutput1		FLtext	" ", 0, 1, .05, 1,        80, 20, 110, 185+$tabsYoffset
gkloop1,gihbut1		FLbutton	" ", 1, 0, 3, 		20, 20, 190, 135+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gkloopread1,gihbutread1	FLbutton	" ", 1, 0, 3, 		20, 20, 190, 185+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gihrate1			FLvalue 	" ",			80, 25, 110, 425+$tabsYoffset
gkrate1,gihtap1		FLslider	" ", 0, gidelsize, 0 ,2, gihrate1, 20,200, 140, 220+$tabsYoffset
gihregen1			FLvalue 	" ",			80, 25, 110, 525+$tabsYoffset
gkregen1, gihregknob1	FLknob  	" ", 0.001, 1, 0, 1, gihregen1, 80, 110, 450+$tabsYoffset
gkinput2,gihinput2		FLtext	" ", 0, 1, .05, 1,        80, 20, 210, 135+$tabsYoffset
gkoutput2,gihoutput2		FLtext	" ", 0, 1, .05, 1,        80, 20, 210, 185+$tabsYoffset
gkloop2,gihbut2	FLbutton	" ", 1, 0, 3, 		20, 20, 290, 135+$tabsYoffset, 		0, 5, 0, 1, 0, 2
gkloopread2,gihbutread2	FLbutton	" ", 1, 0, 3, 		20, 20, 290, 185+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gihrate2		FLvalue 	" ",		80, 25, 210, 425+$tabsYoffset
gkrate2,gihtap2	FLslider	" ", 0, gidelsize, 0 ,2, gihrate2, 20,200, 240, 220+$tabsYoffset
gihregen2			FLvalue 	" ",			80, 25, 210, 525+$tabsYoffset
gkregen2, gihregknob2	FLknob  	" ", 0.001, 1,0, 1, gihregen2, 80, 210, 450+$tabsYoffset
gkinput3,gihinput3		FLtext	" ", 0, 1, .05, 1,        80, 20, 310, 135+$tabsYoffset
gkoutput3,gihoutput3		FLtext	" ", 0, 1, .05, 1,        80, 20, 310, 185+$tabsYoffset
gkloop3,gihbut3	FLbutton	" ", 1, 0, 3, 		20, 20, 390, 135+$tabsYoffset, 		0, 5, 0, 1, 0, 3
gkloopread3,gihbutread3	FLbutton	" ", 1, 0, 3, 		20, 20, 390, 185+$tabsYoffset,  		0, 5, 0, 1, 0, 1
gihrate3		FLvalue 	" ",		80, 25, 310, 425+$tabsYoffset
gkrate3,gihtap3	FLslider	" ", 0, gidelsize, 0 ,2, gihrate3, 20,200, 340, 220+$tabsYoffset
gihregen3			FLvalue 	" ",			80, 25, 310, 525+$tabsYoffset
gkregen3, gihregknob3	FLknob  	" ", 0.001, 1, 0, 1, gihregen3, 80, 310, 450+$tabsYoffset
gkinput4,gihinput4		FLtext	" ", 0, 1, .05, 1,        80, 20, 410, 135+$tabsYoffset
gkoutput4,gihoutput4		FLtext	" ", 0, 1, .05, 1,        80, 20, 410, 185+$tabsYoffset
gkloop4,gihbut4	FLbutton	" ", 1, 0, 3, 		20, 20, 490, 135+$tabsYoffset, 		0, 5, 0, 1, 0, 3
gkloopread4,gihbutread4	FLbutton	" ", 1, 0, 3, 		20, 20, 490, 185+$tabsYoffset,  		0, 5, 0, 1, 0, 4
gihrate4		FLvalue 	" ",		80, 25, 410, 425+$tabsYoffset
gkrate4,gihtap4	FLslider	" ", 0, gidelsize, 0,2, gihrate4, 20,200, 440, 220+$tabsYoffset
gihregen4			FLvalue 	" ",			80, 25, 410, 525+$tabsYoffset
gkregen4, gihregknob4	FLknob  	" ", 0.001, 1, 0, 1, gihregen4, 80, 410, 450+$tabsYoffset
; reset button - reinit
;gkresetbutton,ihresetbutton	FLbutton	"RESET", 1, 0, 1, 		100, 100, 0, 550+$tabsYoffset,  		0, 12, 0, 1, 1
gk_tempo_1,ih_tempo_1	FLtext	"tempo", 20, 400, 1, 1,        80, 20, 110, 570+$tabsYoffset
gk_w_1,ih_w_1		FLbutton	"w", 1, 0, 3, 		20, 20, 100, 600+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_h_1,ih_h_1		FLbutton	"h", 1, 0, 3, 		20, 20, 100, 620+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_q_1,ih_q_1		FLbutton	"q", 1, 0, 3, 		20, 20, 100, 640+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_e_1,ih_8th_1		FLbutton	"e", 1, 0, 3, 		20, 20, 100, 660+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_s_1,ih_16th_1		FLbutton	"s", 1, 0, 3, 		20, 20, 100, 680+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_update_1,ih_update_1	FLbutton	"update", 1, 0, 1, 		50, 80, 140, 620+$tabsYoffset, 		0, 15, 0, 1
gk_mult_1,ih_mult_1		FLtext	"multiplier", 1, 10, 1, 1,   80, 20, 110, 700+$tabsYoffset
gk_update_tap_1,ih_update_tap_1	FLbutton	"tap", 1, 0, 2, 	50, 80, 140, 750+$tabsYoffset, 		0, 27, 0, 1
FLsetVal_i 120, ih_tempo_1
FLsetVal_i 1, ih_mult_1
gk_tempo_2,ih_tempo_2	FLtext	"tempo", 20, 400, 1, 1,        80, 20, 100+110, 570+$tabsYoffset
gk_w_2,ih_w_2		FLbutton	"w", 1, 0, 3, 		20, 20, 100+100, 600+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_h_2,ih_h_2		FLbutton	"h", 1, 0, 3, 		20, 20, 100+100, 620+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_q_2,ih_q_2		FLbutton	"q", 1, 0, 3, 		20, 20, 100+100, 640+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_e_2,ih_8th_2		FLbutton	"e", 1, 0, 3, 		20, 20, 100+100, 660+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_s_2,ih_26th_2		FLbutton	"s", 1, 0, 3, 		20, 20, 100+100, 680+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_update_2,ih_update_2	FLbutton	"update", 1, 0, 1, 		50, 80, 100+140, 620+$tabsYoffset, 		0, 16, 0, 1
gk_mult_2,ih_mult_2		FLtext	"multiplier", 1, 10, 1, 1,   80, 20, 100+110, 700+$tabsYoffset
gk_update_tap_2,ih_update_tap_2	FLbutton	"tap", 1, 0, 2, 	50, 80, 100+140, 750+$tabsYoffset, 		0, 28, 0, 1
FLsetVal_i 120, ih_tempo_2
FLsetVal_i 1, ih_mult_2
gk_tempo_3,ih_tempo_3	FLtext	"tempo", 20, 400, 1, 1,        80, 20, 200+110, 570+$tabsYoffset
gk_w_3,ih_w_3		FLbutton	"w", 1, 0, 3, 		20, 20, 200+100, 600+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_h_3,ih_h_3		FLbutton	"h", 1, 0, 3, 		20, 20, 200+100, 620+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_q_3,ih_q_3		FLbutton	"q", 1, 0, 3, 		20, 20, 200+100, 640+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_e_3,ih_8th_3		FLbutton	"e", 1, 0, 3, 		20, 20, 200+100, 660+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_s_3,ih_36th_3		FLbutton	"s", 1, 0, 3, 		20, 20, 200+100, 680+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_update_3,ih_update_3	FLbutton	"update", 1, 0, 1, 		50, 80, 200+140, 620+$tabsYoffset, 		0, 17, 0, 1
gk_mult_3,ih_mult_3		FLtext	"multiplier", 1, 10, 1, 1,   80, 20, 200+110, 700+$tabsYoffset
gk_update_tap_3,ih_update_tap_3	FLbutton	"tap", 1, 0, 2, 	50, 80, 200+140, 750+$tabsYoffset, 		0, 29, 0, 1
FLsetVal_i 120, ih_tempo_3
FLsetVal_i 1, ih_mult_3
gk_tempo_4,ih_tempo_4	FLtext	"tempo", 20, 400, 1, 1,        80, 20, 300+110, 570+$tabsYoffset
gk_w_4,ih_w_4		FLbutton	"w", 1, 0, 3, 		20, 20, 300+100, 600+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_h_4,ih_h_4		FLbutton	"h", 1, 0, 3, 		20, 20, 300+100, 620+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_q_4,ih_q_4		FLbutton	"q", 1, 0, 3, 		20, 20, 300+100, 640+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_e_4,ih_8th_4		FLbutton	"e", 1, 0, 3, 		20, 20, 300+100, 660+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_s_4,ih_46th_4		FLbutton	"s", 1, 0, 3, 		20, 20, 300+100, 680+$tabsYoffset, 		0, 5, 0, 1, 0, 1
gk_update_4,ih_update_4	FLbutton	"update", 1, 0, 1, 		50, 80, 300+140, 620+$tabsYoffset, 		0, 18, 0, 1
gk_mult_4,ih_mult_4		FLtext	"multiplier", 1, 10, 1, 1,   80, 20, 300+110, 700+$tabsYoffset
gk_update_tap_4,ih_update_tap_4	FLbutton	"tap", 1, 0, 2, 	50, 80, 300+140, 750+$tabsYoffset, 		0, 30, 0, 1
FLsetVal_i 120, ih_tempo_4
FLsetVal_i 1, ih_mult_4
FLsetVal_i	 	$totalDelayLineTime, gihtap1
FLsetVal_i	 	$totalDelayLineTime, gihtap2
FLsetVal_i	 	$totalDelayLineTime, gihtap3
FLsetVal_i	 	$totalDelayLineTime, gihtap4
FLsetVal_i	 	1, gihregknob1
FLsetVal_i	 	1, gihregknob2
FLsetVal_i	 	1, gihregknob3
FLsetVal_i	 	1, gihregknob4
FLsetTextColor 0, 255, 0, ihandle1
FLsetTextColor 0, 255, 0, ihandle2
FLsetTextColor 0, 255, 0, ihandle3
FLsetTextColor 0, 255, 0, ihandle4
FLsetTextColor 0, 255, 0, ihandle5
FLsetTextColor 0, 255, 0, ihandle6
FLsetTextColor 0, 255, 0, ihandle7
FLsetTextColor 0, 255, 0, ihandle8
FLsetTextColor 0, 255, 0, ihandle9
FLsetColor		0, 0, 0, ihandle1
FLsetColor		0, 0, 0, ihandle2
FLsetColor		0, 0, 0, ihandle3
FLsetColor		0, 0, 0, ihandle4
FLsetColor		0, 0, 0, ihandle5
FLsetColor		0, 0, 0, ihandle6
FLsetColor		0, 0, 0, ihandle7
FLsetColor		0, 0, 0, ihandle8
FLsetColor		0, 0, 0, ihandle9
FLsetColor		128, 0, 0, gihregknob1
FLsetColor		128, 0, 0, gihregknob2
FLsetColor		128, 0, 0, gihregknob3
FLsetColor		128, 0, 0, gihregknob4
FLsetColor		255, 255, 0, gihtap1
FLsetColor		255, 255, 0, gihtap2
FLsetColor		255, 255, 0, gihtap3
FLsetColor		255, 255, 0, gihtap4
FLsetVal_i	 	1, gihinput1
FLsetVal_i	 	1, gihinput2
FLsetVal_i	 	1, gihinput3
FLsetVal_i	 	1, gihinput4
FLsetVal_i	 	1, gihoutput1
FLsetVal_i	 	1, gihoutput2
FLsetVal_i	 	1, gihoutput3
FLsetVal_i	 	1, gihoutput4
	FLgroup_end
;****************************************************
;	Config page	
;****************************************************
	FLgroup	"Config",500,700,0,0+$tabsYoffset,0
; delay time - hit reset to activate
;ihdelinitsize 	FLvalue 	" ", 100,50,330,100
;gkmaxdel,ihmaxdel	FLslider	"Max Delay Time - hit reset to activate", 1, 100, 0 ,5, ihdelinitsize, 300,15, 20, 100
gkpedalinst, ihpedalinst	FLcount 	"Sus Pedal = Tap Tempo instrument", 1, 4, 1, 3, 0, 	200, 50, 20, 100, -1
gksliderinst, ihsliderinst	FLcount 	"Slider = Tap Point instrument", 0, 4, 1, 3, 0, 	200, 50, 250, 100, -1
; min tap slider
; sus pedal - tap tempo for which track
; slider - tap point for which track
ihdelsize  	FLvalue 	"Min Delay Time",25, 25,330,200
gkmintap,ihmintap	FLslider	"Min Delay Time (secs)", 0.000001, 1, 0 ,5, ihdelsize, 300,15, 20, 200
gkfileflag,ihgkfileflag		FLbutton	"File Output", 1, 0,2, 		300, 50, 20, 250,	 		0, 5, 0, 1, 0, 1
gkfilestop,ihgkfilestart		FLbutton	"Start Guide Track", 1, 0, 1, 		100, 50, 20, 350,	 		0, 2, 0, 3600, 0, 1
gkfilestop,ihgkfilestop		FLbutton	"Stop Guide Track", 1, 0, 1, 		100, 50, 200, 350,	 		0, 5, 0, 1, 1212, 1
gkmiditap,ihgkmiditap		FLbutton	"Midi Tempo Tap off", 1, 0, 2, 	100, 50, 20, 450,	 		0, 5, 0, 1, 0, 1
ihfilter	  			FLvalue 	" ",				50, 50,330,500
gkfilter,ihgkfilter			FLslider	"lopass filter for krate signals", 1, 2500, 0 ,5, ihfilter, 300,50, 20, 500
; reset button - reinit
gkresetbutton2,ihresetbutton2	FLbutton	"RESET", 1, 0, 1, 		100, 100, 0, 550+$tabsYoffset,  		0, 12, 0, 1, 1
FLsetVal_i	 	1, ihmintap
FLsetVal_i	 	1, ihpedalinst
FLsetVal_i	 	1, ihsliderinst
FLsetVal_i	 	2500, ihgkfilter
	FLgroup_end
	FLtabs_end 
	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!






	instr 5	;button handler
igotcalled = 0
iset = p5
;.printks	"Button Handler Received: %f\\n", 1,  p4
;printks	"Button Handler Global1: %f\\n", 1,  gk1
;printks	"Button Handler Global1: %f\\n", 1,  gk2
if p4 != 1212 kgoto end
gkguidefilestopflag 	linseg	1, .1, 1, .001, 0, p3-.101, 0
end:

	endin

	instr 6	;track 1
;printks	"track 1 called\\n", 3600
;gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0

if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig = ainputsig * gkinput1
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_1 * gkregen1)
kgoto done
noadd:
asig = ainputsig
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate1 > gkmintap 	kgoto done
gkrate1 = gkmintap
done:
aout vdelay	asig, gkrate1*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
readquery:
if 	gkloopread1 = 0	kgoto off
read:

out	aout*gkoutput1
gaout1_1 = aout
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
out:

	endin

	instr 7	;track 2
;printks	"track 2 called\\n", 3600
;gkrate2	tonek	gkrate2, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
if	gkloop2 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig = ainputsig * gkinput2
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_2 * gkregen2)
kgoto done
noadd:
asig = ainputsig
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate2 > gkmintap 	kgoto done
gkrate2 = gkmintap
done:
aout vdelay	asig, gkrate2*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_2 = aout
readquery:
if 	gkloopread2 = 0	kgoto off
read:
out	aout*gkoutput2
gaout1_2 = aout
kgoto out
off:
gaout1_2 = 0
;turnoffk	gkturnoff
out:

	endin

	instr 8	;track 3
;printks	"track 3 called\\n", 3600
;gkrate3	tonek	gkrate3, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
if	gkloop3 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig = ainputsig * gkinput3
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_3 * gkregen3)
kgoto done
noadd:
asig = ainputsig
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate3 > gkmintap 	kgoto done
gkrate3 = gkmintap
done:
aout vdelay	asig, gkrate3*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_3 = aout
readquery:
if 	gkloopread3 = 0	kgoto off
read:
out	aout*gkoutput3
gaout1_3 = aout
kgoto out
off:
gaout1_3 = 0
;turnoffk	gkturnoff
out:

	endin

	instr 9	;track 4
;printks	"track 4 called\\n", 3600
;gkrate4	tonek	gkrate4, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
if	gkloop4 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig = ainputsig * gkinput4
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig + (garegensig1_4 * gkregen4)
kgoto done
noadd:
asig = ainputsig
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate4 > gkmintap 	kgoto done
gkrate4 = gkmintap
done:
aout vdelay	asig, gkrate4*1000, gidelsize*1000
aout = ainputsig+aout
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_4 = aout
readquery:
if 	gkloopread4 = 0	kgoto off
read:
out	aout*gkoutput4
gaout1_4 = aout
kgoto out
off:
gaout1_4 = 0
;turnoffk	gkturnoff
out:

	endin

	instr 14	;file output
if	gkfileflag = 0 	kgoto done

ainputsig = 0
ainputsig2 = 0
;if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig2 	inch kchan+1

fout "track1.wav", 1, gaout1_1, gaout2_1
fout "track2.wav", 1, gaout1_2, gaout2_2
fout "track3.wav", 1, gaout1_3, gaout2_3
fout "track4.wav", 1, gaout1_4, gaout2_4
fout "master.wav", 1, ainputsig, ainputsig2
done:
	endin

	instr 15	;update tempo 1
iwhole = i(gk_w_1)
ihalf = i(gk_h_1)
iquarter = i(gk_q_1)
ieighth = i(gk_e_1)
isixteenth = i(gk_s_1)
itempo = i(gk_tempo_1)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate1 = gk_mult_1*inewlength
FLsetVal	1, gkrate1, gihtap1
done:

	endin

	instr 16	;update tempo 2
iwhole = i(gk_w_2)
ihalf = i(gk_h_2)
iquarter = i(gk_q_2)
ieighth = i(gk_e_2)
isixteenth = i(gk_s_2)
itempo = i(gk_tempo_2)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate2 = gk_mult_2*inewlength
FLsetVal	1, gkrate2, gihtap2
done:

	endin

	instr 17	;update tempo 3
iwhole = i(gk_w_3)
ihalf = i(gk_h_3)
iquarter = i(gk_q_3)
ieighth = i(gk_e_3)
isixteenth = i(gk_s_3)
itempo = i(gk_tempo_3)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate3 = gk_mult_3*inewlength
FLsetVal	1, gkrate3, gihtap3
done:

	endin

	instr 18	;update tempo 4
iwhole = i(gk_w_4)
ihalf = i(gk_h_4)
iquarter = i(gk_q_4)
ieighth = i(gk_e_4)
isixteenth = i(gk_s_4)
itempo = i(gk_tempo_4)
;idur = (iwhole * 1) + (ihalf * .5) + (iquarter *.25) + (ieighth * .125) + (isixteenth * .06125)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate4 = gk_mult_4*inewlength
FLsetVal	1, gkrate4, gihtap4
done:

	endin

	instr 19	;track 5
;printks	"track 1 called\\n", 3600
gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
ainputsig2 = 0
;if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig2 	inch kchan+1
ainputsig = ainputsig * gkinput1
ainputsig2 = ainputsig2 * gkinput1
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_1 * gkregen1)
asig2 = ainputsig2 +  (garegensig2_1 * gkregen1)
kgoto done
noadd:
asig = ainputsig
asig2 = ainputsig2
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate1 > gkmintap 	kgoto done
gkrate1 = gkmintap
done:
aout vdelay	asig, gkrate1*1000, gidelsize*1000
aout2 vdelay	asig2, gkrate1*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
garegensig2_1 = aout2
readquery:
;if 	gkloopread1 = 0	kgoto off
read:
outch	kchanout, aout*gkoutput1
outch	kchanout+1, aout2*gkoutput1
gaout1_1 = aout
gaout2_1 = aout2
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
gaout2_1 = 0
out:

	endin

	instr 20	;track 6
;printks	"track 1 called\\n", 3600
gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
ainputsig2 = 0
;if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig2 	inch kchan+1
ainputsig = ainputsig * gkinput1
ainputsig2 = ainputsig2 * gkinput1
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_1 * gkregen1)
asig2 = ainputsig2 +  (garegensig2_1 * gkregen1)
kgoto done
noadd:
asig = ainputsig
asig2 = ainputsig2
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate1 > gkmintap 	kgoto done
gkrate1 = gkmintap
done:
aout vdelay	asig, gkrate1*1000, gidelsize*1000
aout2 vdelay	asig2, gkrate1*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
garegensig2_1 = aout2
readquery:
;if 	gkloopread1 = 0	kgoto off
read:
outch	kchanout, aout*gkoutput1
outch	kchanout+1, aout2*gkoutput1
gaout1_1 = aout
gaout2_1 = aout2
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
gaout2_1 = 0
out:

	endin

	instr 21	;track 7
;printks	"track 1 called\\n", 3600
gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
ainputsig2 = 0
;if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig2 	inch kchan+1
ainputsig = ainputsig * gkinput1
ainputsig2 = ainputsig2 * gkinput1
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_1 * gkregen1)
asig2 = ainputsig2 +  (garegensig2_1 * gkregen1)
kgoto done
noadd:
asig = ainputsig
asig2 = ainputsig2
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate1 > gkmintap 	kgoto done
gkrate1 = gkmintap
done:
aout vdelay	asig, gkrate1*1000, gidelsize*1000
aout2 vdelay	asig2, gkrate1*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
garegensig2_1 = aout2
readquery:
;if 	gkloopread1 = 0	kgoto off
read:
outch	kchanout, aout*gkoutput1
outch	kchanout+1, aout2*gkoutput1
gaout1_1 = aout
gaout2_1 = aout2
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
gaout2_1 = 0
out:

	endin

	instr 22	;track 8
;printks	"track 1 called\\n", 3600
gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig = 0
ainputsig2 = 0
;if	gkloop1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig2 	inch kchan+1
ainputsig = ainputsig * gkinput1
ainputsig2 = ainputsig2 * gkinput1
noread:
;
;	todo: click filter should go here
;
;
;	if sus pedal is not pressed, no repeat
;
;if	gkpedalval = 0	kgoto noadd
;
;	repeat and hold - scale repeat with gkregen
;
asig = ainputsig +  (garegensig1_1 * gkregen1)
asig2 = ainputsig2 +  (garegensig2_1 * gkregen1)
kgoto done
noadd:
asig = ainputsig
asig2 = ainputsig2
;printk 	.25,gkrate
;
;	this binds the lower range of gkrate to gkmintap
;
if	gkrate1 > gkmintap 	kgoto done
gkrate1 = gkmintap
done:
aout vdelay	asig, gkrate1*1000, gidelsize*1000
aout2 vdelay	asig2, gkrate1*1000, gidelsize*1000
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
garegensig2_1 = aout2
readquery:
;if 	gkloopread1 = 0	kgoto off
read:
outch	kchanout, aout*gkoutput1
outch	kchanout+1, aout2*gkoutput1
gaout1_1 = aout
gaout2_1 = aout2
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
gaout2_1 = 0
out:

	endin

	instr 23	;update tempo 5
iwhole = i(gk_w_1)
ihalf = i(gk_h_1)
iquarter = i(gk_q_1)
ieighth = i(gk_e_1)
isixteenth = i(gk_s_1)
itempo = i(gk_tempo_1)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate1 = gk_mult_1*inewlength
FLsetVal	1, gkrate1, gihtap1
done:

	endin

	instr 24	;update tempo 6
iwhole = i(gk_w_1)
ihalf = i(gk_h_1)
iquarter = i(gk_q_1)
ieighth = i(gk_e_1)
isixteenth = i(gk_s_1)
itempo = i(gk_tempo_1)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate1 = gk_mult_1*inewlength
FLsetVal	1, gkrate1, gihtap1
done:

	endin

	instr 25	;update tempo 7
iwhole = i(gk_w_1)
ihalf = i(gk_h_1)
iquarter = i(gk_q_1)
ieighth = i(gk_e_1)
isixteenth = i(gk_s_1)
itempo = i(gk_tempo_1)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate1 = gk_mult_1*inewlength
FLsetVal	1, gkrate1, gihtap1
done:

	endin

	instr 26	;update tempo 8
iwhole = i(gk_w_1)
ihalf = i(gk_h_1)
iquarter = i(gk_q_1)
ieighth = i(gk_e_1)
isixteenth = i(gk_s_1)
itempo = i(gk_tempo_1)
idur = (iwhole * 4) + (ihalf * 2) + (iquarter *1) + (ieighth * .5) + (isixteenth * .25)
if idur == 0 kgoto done
inewlength = (60/itempo) * idur
gkrate1 = gk_mult_1*inewlength
FLsetVal	1, gkrate1, gihtap1
done:

	endin

	instr 27	;update tempo 1 button
if	gkcomptime1 > 0 	kgoto compare
if	gk_update_tap_1 == 0 kgoto done
gkcomptime1 times
kgoto done
compare:
if	gk_update_tap_1 == 1 kgoto done
ktemptime times
gkrate1 = ktemptime - gkcomptime1
FLsetVal	1, gkrate1, gihtap1
gkcomptime1 = 0
kgoto done
done:

	endin

	instr 28	;update tempo 2 button
if	gkcomptime2 > 0 	kgoto compare
if	gk_update_tap_2 == 0 kgoto done
gkcomptime2 times
kgoto done
compare:
if	gk_update_tap_2 == 1 kgoto done
ktemptime times
gkrate2 = ktemptime - gkcomptime2
FLsetVal	1, gkrate2, gihtap2
gkcomptime2 = 0
kgoto done
done:

	endin

	instr 29	;update tempo 3 button
if	gkcomptime3 > 0 	kgoto compare
if	gk_update_tap_3 == 0 kgoto done
gkcomptime3 times
kgoto done
compare:
if	gk_update_tap_3 == 1 kgoto done
ktemptime times
gkrate3 = ktemptime - gkcomptime3
FLsetVal	1, gkrate3, gihtap3
gkcomptime3 = 0
kgoto done
done:

	endin

	instr 30	;update tempo 4 button
if	gkcomptime4 > 0 	kgoto compare
if	gk_update_tap_4 == 0 kgoto done
gkcomptime4 times
kgoto done
compare:
if	gk_update_tap_4 == 1 kgoto done
ktemptime times
gkrate4 = ktemptime - gkcomptime4
FLsetVal	1, gkrate4, gihtap4
gkcomptime4 = 0
kgoto done
done:

	endin


	instr 32	;button switcher
;printks	"button handler got called\\n", 1


i1 = i(gkloop1)
i2 = i(gkloop2)
i3 = i(gkloop3)
i4 = i(gkloop4)
i5 = i(gkloopread1)
i6 = i(gkloopread2)
i7 = i(gkloopread3)
i8 = i(gkloopread4)

;iset = p4

FLsetVal 1, i1, gihbut1
FLsetVal 1, i2, gihbut2
FLsetVal 1, i3, gihbut3
FLsetVal 1, i4, gihbut4
FLsetVal 1, i5, gihbutread1
FLsetVal 1, i6, gihbutread2
FLsetVal 1, i7, gihbutread3
FLsetVal 1, i8, gihbutread4

	endin


</CsInstruments>

<CsScore>

f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1
f4	0	513	20	6
f6   0   8192   -20   8   1


;i1 0 3600
;midi in on instr 3
;i3 0 3600

;button handler i4
i4 0 3600

;4 tracks i6-9
i6 0 3600
i7 0 3600
i8 0 3600
i9 0 3600

;file output instr 14
;i14 0 3600

;midi switchbd i31
;i31 0 3600

;button switchbd i32
i32 0 3600




























e

</CsScore>

</CsoundSynthesizer>
