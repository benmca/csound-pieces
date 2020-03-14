;
; ""
; by 
;
;
; -B value and DMA buffer setting must be equal!
; 
; 2019.09.20 - you want to call this like so:  csound -odac1 -iadc1 -b64 -B256 --strset1=10.0.0.102 delay-noclick-osc.csd
;
;	where string #1 is the IP of source of OSC messages
; 

<CsoundSynthesizer>

<CsInstruments>
sr=44100
kr=44100
;ksmps=1
nchnls=1


;minimal global vars - from old UI

;***********************************************************
;	THIS IS THE MAXIMUM DELAY TIME
;***********************************************************
#define	totalDelayLineTime	#8#
;***********************************************************
;	THIS IS THE IO Base channel - stereo output 
;	goes in and out from IOBaseChannel and 
;	IOBaseChannel+1
;***********************************************************
#define	IOBaseChannel	#1#
;#define	DestIP	#169.254.36.241#
gkmaxdel	init $totalDelayLineTime
gidelsize init i(gkmaxdel)
gimin 	init 	.01
gicrossfadetime init .05

gafadein_1 init 0
gafadeout_1 init 1

gafadein_2 init 0
gafadeout_2 init 1

gihandle OSCinit 8000

gacross_1 init 0




	instr 1	;track 1
SDestIP strget 1
prints SDestIP

SdelayPointOscAddress = p4
SregenerationOscAddress = p5
SinputToggleOscAddress = p6
SoutputToggleOscAddress = p7
SinputVolumeOscAddress = p8
SoutputVolumeOscAddress = p9
StapTempoOscAddress = p10
iOscPort = p11

icrossinstr = 101

ainputsig = 0
kstarted = 0

kcrossfade_before init 0
kcrossfade_after init 0
kcrossfade_in_progress init 0
kcrossfade_in_progress_time init 0 ; to time crossfade instr

aout	init 0

kinput_volume init 1	; input volume
koutput_volume init 1	; output volume

kinput_on_off init 1 	; input on/off
koutput_on_off init 1 	; output on/off

aregenerated_signal init 0	; regenerated signal - added to delay output * regen setting 
kregeneration_scalar init 0 	; regenerated signal scalar (see aregenerated_signal)

kdelay_tap_point init 0	; delay point in line - update w/osc 
ktap_tempo_comp_time init 0 ; used in tap tempo


kosc_delaytime init 0
kosc_regentime init 0
kosc_input_on init 0
kosc_output_on init 0
kosc_involume init 0
kosc_outvolume init 0
kosc_push1val init 0

;kcf init 0
acf init 0

if kstarted == 0 then
OSCsend 1, SDestIP, iOscPort, SdelayPointOscAddress, "f", (kdelay_tap_point / (gkmaxdel - gimin)) + gimin
OSCsend 1, SDestIP, iOscPort, SregenerationOscAddress, "f", kregeneration_scalar
OSCsend 1, SDestIP, iOscPort, SinputToggleOscAddress, "f", kinput_on_off
OSCsend 1, SDestIP, iOscPort, SoutputToggleOscAddress, "f", koutput_on_off
OSCsend 1, SDestIP, iOscPort, SinputVolumeOscAddress, "f", kinput_volume
OSCsend 1, SDestIP, iOscPort, SoutputVolumeOscAddress, "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten gihandle, SdelayPointOscAddress, "f", kosc_delaytime
if (k1 == 0) goto osc_2
	printks "kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (gkmaxdel - gimin)) + gimin
	printks "kdelay_tap_point: %f \n", .001, kdelay_tap_point
kgoto osc_1
osc_2:
k2  OSClisten gihandle, SregenerationOscAddress, "f", kosc_regentime
if (k2 == 0) goto osc_3
	printks "kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten gihandle, SinputToggleOscAddress, "f", kosc_input_on
if (k3 == 0) goto osc_4
	printks "kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten gihandle, SoutputToggleOscAddress, "f", kosc_output_on
if (k4 == 0) goto osc_5
	printks "kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten gihandle, SinputVolumeOscAddress, "f", kosc_involume
if (k5 == 0) goto osc_6
	printks "kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten gihandle, SoutputVolumeOscAddress, "f", kosc_outvolume
if (k6 == 0) goto osc_7
	printks "kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten gihandle, StapTempoOscAddress, "f", kosc_push1val
if (k7 == 0) goto osc_done
	if (kosc_push1val == 1.0) then
		printks "tap recvd: %f \n", .001, kosc_push1val
if	ktap_tempo_comp_time > 0 	kgoto tap_tempo_compare
;if	gk_update_tap_1 == 0 kgoto done
ktap_tempo_comp_time times
		printks "gkcomptime: %f \n", .1, ktap_tempo_comp_time
kgoto tap_tempo_done
tap_tempo_compare:
;if	gk_update_tap_1 == 1 kgoto done
ktemptime times
krate1 = ktemptime - ktap_tempo_comp_time
;FLsetVal	1, krate1, gihtap1
		printks "krate: %f \n", .1, krate1
		printks "gidelsize: %f \n", .1, gidelsize
OSCsend (krate1 / gidelsize), SDestIP, 9000, "/1/fader1", "f", (krate1 / gidelsize)
		printks "fader set to : %f \n", .1, (krate1 / gidelsize)
kdelay_tap_point = krate1

ktap_tempo_comp_time = 0
;kgoto tap_tempo_done
tap_tempo_done:
	endif

osc_done:

if	kinput_on_off == 0 kgoto noread
;if kcrossfade_after == 0.0 kgoto noread


kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume

noread:
asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar
;kactive active k(icrossinstr)
kactive = 0
kactive_time times
aactive_time interp kactive_time, 0, 1
;printks "kactive_time: %f, kcrossfade_in_progress_time: %f\n",.1, kactive_time, kcrossfade_in_progress_time

; is there a timer UDO WE CAN USE?
; this whole cf chunnk could be factored out...
if kcrossfade_in_progress_time > 0 && kactive_time < (kcrossfade_in_progress_time + gicrossfadetime ) then
	kactive = 1
endif 
;
;kcf sc_phasor kactive, 1/(k(gicrossfadetime)*sr), 0, 1
;printks "kactive is %f, kcf: %f\n", .1, kactive, kcf

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then;
	printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		printks "event is ended %f\n", .01, acf
        kcrossfade_in_progress = 0
        kcrossfade_before = kcrossfade_after
        kcrossfade_in_progress_time = 0
        acf = 1.0
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		printks "crossfading, keeping state....\n", .01
		kbegin = kcrossfade_in_progress_time
		kend = kcrossfade_in_progress_time + gicrossfadetime
		acf = (aactive_time-kbegin) / (kend-kbegin)
		acf limit acf, 0.0, 1.0
		printks "kactive is 1, acf is %f\n",.01, acf 	
    elseif (kcrossfade_in_progress == 0) then
		printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        acf = 0
;        gafadein_1 = 0
;        gafadeout_1 = 1.0
        ktemp times
        kcrossfade_in_progress_time = ktemp
;        event "i", icrossinstr, 0, gicrossfadetime
    endif
endif
;acf =a(kcf)	
;printks "acf %f\n", .001, acf

aout_total  delayr     gidelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig_for_delayline
;aout = ainputsig + (aoutnew * gafadein_1) + (aoutold * gafadeout_1)
	aout = ainputsig + (aoutnew * acf) + (aoutold * (1.0-acf))
;if kactive == 1 then
;	aout = ainputsig + (aoutnew * kcf) + (aoutold * (1-kcf))
;	printks "kcf applied\n", .1
;else
;	aout = ainputsig + aoutnew 
;	printks "non kcf case\n", .1
;endif

;printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout
readquery:
if 	koutput_on_off == 0	kgoto off
;if kcrossfade_after == 0.0 && kcrossfade_before == 0.0 kgoto off

read:
out	aout*koutput_volume
aout = aout
kgoto out
off:
aout = 0
out:
	endin

    instr 101
gafadein_1   linseg    0.0, p3, 1.0
gafadeout_1   linseg   1.0, p3, 0.0
    endin

</CsInstruments>

<CsScore>
i1 0 3600  "/1/fader1"  "/1/rotary1"   "/1/toggle1"  "/1/toggle2"   "/1/rotary2"  "/1/rotary3"  "/1/push1"  9000 
;i1 0 3600  "/1/fader2"  "/1/rotary4"   "/1/toggle3"  "/1/toggle4"   "/1/rotary5"  "/1/rotary6"  "/1/push2"  9000
e
</CsScore>

</CsoundSynthesizer>
