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
kr=44100
;ksmps=1
nchnls=1

#define	totalDelayLineTime	#32#
#define	IOBaseChannel	#1#

gkmaxdel	init $totalDelayLineTime
gidelsize init i(gkmaxdel)

gicrossfadetime init 1

gkcrossfade_before_1 init 0
gkcrossfade_after_1 init 0
gafadein_1 init 0
gafadeout_1 init 1
gkchange_1 init 0

gasig	init 0
gaout1	init 0
gaout2	init 0
gaout1_1	init 0
gaout1_2	init 0
gaout1_3	init 0
gaout1_4	init 0
gkfileflag init 0
gkfileopen init 0
gkguidefilestopflag init 0
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
;
garegensig1_1 init 0
garegensig1_2 init 0
garegensig1_3 init 0
garegensig1_4 init 0

;
;temp values
;
gkmintap init .1
gkloopread_1 init 0



;min globals
gkinput_1 init 0
gkloop_1 init 0

	instr 1	;track 1
icrossinstr = 101

ainputsig = 0

if	gkloop_1 = 0 kgoto noread
kchan = $IOBaseChannel
kchanout = $IOBaseChannel
ainputsig 		inch kchan
ainputsig = ainputsig * gkinput_1
noread:

;if (gkcrossfade_before_1 = 0) then
;    gkcrossfade_before_1 = gkrate_in_1
;    gkcrossfade_after_1 = gkrate_in_1
;endif


asig = ainputsig +  (garegensig1_1 * gkregen_1)


;printk .1, gkchange_1

kactive active k(icrossinstr)

printk .01, kactive

;if kactive > 0 then
;	printks "setting", .01
;	FLsetVal	1, gkcrossfade_after_1, gihtap1
;	gkrate_in_1 = gkcrossfade_after_1
;endif
kstatus, kchan, kdata1, kdata2 midiin


; so - you're basically trying to get the thing to ignore the ui when change is 
; in progress, but it ain't workin so far...
if  gkcrossfade_before_1 != gkrate_in_1_temp && kactive == 0 then
	printks "checking....", .001
    if (gkchange_1 == 0) then
        gkcrossfade_after_1 = gkrate_in_1_temp
        gkchange_1 = 1
        gafadein_1 = 0
        gafadeout_1 = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

    ; this is why we line -> 1.01, remember:
	if (gkchange_1 == 1) then
        gkchange_1 = 0
        gafadein_1 = 1.0
        gafadeout_1 = 0
        gkcrossfade_before_1 = gkcrossfade_after_1

    	FLsetVal	1, gkcrossfade_before_1, gihtap1

        ; try sending to an 'done state instr' and be done in .05 seconds... 
    endif
endif

aout_total   delayr     gidelsize
aoutnew   deltapi     gkcrossfade_after_1
aoutold   deltapi     gkcrossfade_before_1
delayw      asig
aout = (aoutnew * gafadein_1) + (aoutold * gafadeout_1)

;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1_1 = aout
readquery:
if 	gkloopread_1 = 0	kgoto off

read:
out	aout*gkoutput_1
gaout1_1 = aout
kgoto out
off:
;turnoffk	gkturnoff
gaout1_1 = 0
out:

	endin


</CsInstruments>

<CsScore>

f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1
f4	0	513	20	6
f6   0   8192   -20   8   1


i1 0 3600


























e

</CsScore>

</CsoundSynthesizer>