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
sr=96000
kr=96000
ksmps=1
nchnls=1

        opcode declick, a, a

ain     xin
aenv    linseg 0, 0.02, 1, p3 - 0.05, 1, 0.02, 0, 0.01, 0
        xout ain * aenv         ; apply envelope and write output

        endop

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

gafadein_3 init 0
gafadeout_3 init 1

gafadein_4 init 0
gafadeout_4 init 1

gihandle OSCinit 8000


	instr 1	;track 1
SDestIP strget 1
prints SDestIP



icrossinstr = 101

ainputsig = 0
kstarted = 0

kcrossfade_before init 0
kcrossfade_after init 0
kcrossfade_in_progress init 0

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

if kstarted == 0 then
OSCsend 1, SDestIP, 9000, "/1/fader1", "f", (kdelay_tap_point / (gkmaxdel - gimin)) + gimin
OSCsend 1, SDestIP, 9000, "/1/rotary1", "f", kregeneration_scalar
OSCsend 1, SDestIP, 9000, "/1/toggle1", "f", kinput_on_off
OSCsend 1, SDestIP, 9000, "/1/toggle2", "f", koutput_on_off
OSCsend 1, SDestIP, 9000, "/1/rotary2", "f", kinput_volume
OSCsend 1, SDestIP, 9000, "/1/rotary3", "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten gihandle, "/1/fader1", "f", kosc_delaytime
if (k1 == 0) goto osc_2
	printks "kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (gkmaxdel - gimin)) + gimin
	printks "kdelay_tap_point: %f \n", .001, kdelay_tap_point
kgoto osc_1
osc_2:
k2  OSClisten gihandle, "/1/rotary1", "f", kosc_regentime
if (k2 == 0) goto osc_3
	printks "kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten gihandle, "/1/toggle1", "f", kosc_input_on
if (k3 == 0) goto osc_4
	printks "kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten gihandle, "/1/toggle2", "f", kosc_output_on
if (k4 == 0) goto osc_5
	printks "kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten gihandle, "/1/rotary2", "f", kosc_involume
if (k5 == 0) goto osc_6
	printks "kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten gihandle, "/1/rotary3", "f", kosc_outvolume
if (k6 == 0) goto osc_7
	printks "kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten gihandle, "/1/push1", "f", kosc_push1val
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
ainputsig declick ainputsig
asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar
asig_for_delayline declick asig_for_delayline
kactive active k(icrossinstr)

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then
	printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		printks "event is ended\n", .01
        kcrossfade_in_progress = 0
        gafadein_1 = 1.0
        gafadeout_1 = 0
        kcrossfade_before = kcrossfade_after
		;OSCsend 1, $DestIP", 9000, "/1/fader1", "f", kcrossfade_after / gkmaxdel
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		printks "crossfading, keeping state....\n", .01
		; don't update the tap time until we're done x-fading
		;kdelay_tap_point = kcrossfade_before
    elseif (kcrossfade_in_progress == 0) then
		printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        gafadein_1 = 0
        gafadeout_1 = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

endif

aout_total  delayr     gidelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig_for_delayline
aout = ainputsig + (aoutnew * gafadein_1) + (aoutold * gafadeout_1)
aout declick aout
printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
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


	instr 2	;track 1
SDestIP strget 1
prints SDestIP

icrossinstr = 102

ainputsig = 0
kstarted = 0

kcrossfade_before init 0
kcrossfade_after init 0
kcrossfade_in_progress init 0

aout	init 0

kinput_volume init 1	; input volume
koutput_volume init 1	; output volume

kinput_on_off init 0 	; input on/off
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

if kstarted == 0 then
OSCsend 1, SDestIP, 9000, "/1/fader2", "f", (kdelay_tap_point / (gkmaxdel - gimin)) + gimin
OSCsend 1, SDestIP, 9000, "/1/rotary4", "f", kregeneration_scalar
OSCsend 1, SDestIP, 9000, "/1/toggle3", "f", kinput_on_off
OSCsend 1, SDestIP, 9000, "/1/toggle4", "f", koutput_on_off
OSCsend 1, SDestIP, 9000, "/1/rotary5", "f", kinput_volume
OSCsend 1, SDestIP, 9000, "/1/rotary6", "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten gihandle, "/1/fader2", "f", kosc_delaytime
if (k1 == 0) goto osc_2
	printks "2 kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (gkmaxdel - gimin)) + gimin
kgoto osc_1
osc_2:
k2  OSClisten gihandle, "/1/rotary4", "f", kosc_regentime
if (k2 == 0) goto osc_3
	printks "2 kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten gihandle, "/1/toggle3", "f", kosc_input_on
if (k3 == 0) goto osc_4
	printks "2 kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten gihandle, "/1/toggle4", "f", kosc_output_on
if (k4 == 0) goto osc_5
	printks "2 kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten gihandle, "/1/rotary5", "f", kosc_involume
if (k5 == 0) goto osc_6
	printks "2 kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten gihandle, "/1/rotary6", "f", kosc_outvolume
if (k6 == 0) goto osc_7
	printks "2 kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten gihandle, "/1/push3", "f", kosc_push1val
if (k7 == 0) goto osc_done
	if (kosc_push1val == 1.0) then
		printks "2 tap recvd: %f \n", .001, kosc_push1val
if	ktap_tempo_comp_time > 0 	kgoto tap_tempo_compare
;if	gk_update_tap_1 == 0 kgoto done
ktap_tempo_comp_time times
		printks "2 gkcomptime: %f \n", .1, ktap_tempo_comp_time
kgoto tap_tempo_done
tap_tempo_compare:
;if	gk_update_tap_1 == 1 kgoto done
ktemptime times
krate1 = ktemptime - ktap_tempo_comp_time
;FLsetVal	1, krate1, gihtap1
		printks "krate: %f \n", .1, krate1
		printks "gidelsize: %f \n", .1, gidelsize
OSCsend (krate1 / gidelsize), SDestIP, 9000, "/1/fader2", "f", (krate1 / gidelsize)
		printks "fader set to : %f \n", .1, (krate1 / gidelsize)
kdelay_tap_point = krate1

ktap_tempo_comp_time = 0
;kgoto tap_tempo_done
tap_tempo_done:
	endif

osc_done:

if kinput_on_off == 0 kgoto noread
;if kcrossfade_after == 0.0 kgoto noread

kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume

noread:

asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar
kactive active k(icrossinstr)

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then
	printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		printks "event is ended\n", .01
        kcrossfade_in_progress = 0
        gafadein_2 = 1.0
        gafadeout_2 = 0
        kcrossfade_before = kcrossfade_after
		;OSCsend 1, $DestIP", 9000, "/1/fader1", "f", kcrossfade_after / gkmaxdel
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		printks "crossfading, keeping state....\n", .01
		; don't update the tap time until we're done x-fading
		;kdelay_tap_point = kcrossfade_before
    elseif (kcrossfade_in_progress == 0) then
		printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        gafadein_2 = 0
        gafadeout_2 = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

endif



aout_total  delayr     gidelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig_for_delayline
aout = ainputsig + (aoutnew * gafadein_2) + (aoutold * gafadeout_2)

printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout

readquery:
if 	koutput_on_off == 0	kgoto off
;if kcrossfade_after == 0.0 kgoto off

read:
out	aout*koutput_volume
aout = aout
kgoto out
off:
aout = 0
out:
	endin



;
;
;		INSTR 3
;
;
;
;
	instr 3
SDestIP strget 1
prints SDestIP

icrossinstr = 103

ainputsig = 0
kstarted = 0

kcrossfade_before init 0
kcrossfade_after init 0
kcrossfade_in_progress init 0

aout	init 0

kinput_volume init 1	; input volume
koutput_volume init 1	; output volume

kinput_on_off init 0 	; input on/off
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

if kstarted == 0 then
OSCsend 1, SDestIP, 9000, "/2/fader4", "f", (kdelay_tap_point / (gkmaxdel - gimin)) + gimin
OSCsend 1, SDestIP, 9000, "/2/rotary7", "f", kregeneration_scalar
OSCsend 1, SDestIP, 9000, "/2/toggle5", "f", kinput_on_off
OSCsend 1, SDestIP, 9000, "/2/toggle6", "f", koutput_on_off
OSCsend 1, SDestIP, 9000, "/2/rotary8", "f", kinput_volume
OSCsend 1, SDestIP, 9000, "/2/rotary9", "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten gihandle, "/2/fader4", "f", kosc_delaytime
if (k1 == 0) goto osc_2
	;printks "2 kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (gkmaxdel - gimin)) + gimin
kgoto osc_1
osc_2:
k2  OSClisten gihandle, "/2/rotary7", "f", kosc_regentime
if (k2 == 0) goto osc_3
	;printks "2 kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten gihandle, "/2/toggle5", "f", kosc_input_on
if (k3 == 0) goto osc_4
	;printks "2 kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten gihandle, "/2/toggle6", "f", kosc_output_on
if (k4 == 0) goto osc_5
	;printks "2 kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten gihandle, "/2/rotary8", "f", kosc_involume
if (k5 == 0) goto osc_6
	;printks "2 kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten gihandle, "/2/rotary9", "f", kosc_outvolume
if (k6 == 0) goto osc_7
	;printks "2 kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten gihandle, "/2/push5", "f", kosc_push1val
if (k7 == 0) goto osc_done
	if (kosc_push1val == 1.0) then
		;printks "2 tap recvd: %f \n", .001, kosc_push1val
if	ktap_tempo_comp_time > 0 	kgoto tap_tempo_compare
;if	gk_update_tap_1 == 0 kgoto done
ktap_tempo_comp_time times
		;printks "2 gkcomptime: %f \n", .1, ktap_tempo_comp_time
kgoto tap_tempo_done
tap_tempo_compare:
;if	gk_update_tap_1 == 1 kgoto done
ktemptime times
krate1 = ktemptime - ktap_tempo_comp_time
;FLsetVal	1, krate1, gihtap1
		;printks "krate: %f \n", .1, krate1
		;printks "gidelsize: %f \n", .1, gidelsize
OSCsend (krate1 / gidelsize), SDestIP, 9000, "/2/fader4", "f", (krate1 / gidelsize)
		;printks "fader set to : %f \n", .1, (krate1 / gidelsize)
kdelay_tap_point = krate1

ktap_tempo_comp_time = 0
;kgoto tap_tempo_done
tap_tempo_done:
	endif

osc_done:

if kinput_on_off == 0 kgoto noread
;if kcrossfade_after == 0.0 kgoto noread

kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume

noread:

asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar
kactive active k(icrossinstr)

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then
	;printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		;printks "event is ended\n", .01
        kcrossfade_in_progress = 0
        gafadein_3 = 1.0
        gafadeout_3 = 0
        kcrossfade_before = kcrossfade_after
		;OSCsend 1, $DestIP", 9000, "/1/fader1", "f", kcrossfade_after / gkmaxdel
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		;printks "crossfading, keeping state....\n", .01
		; don't update the tap time until we're done x-fading
		;kdelay_tap_point = kcrossfade_before
    elseif (kcrossfade_in_progress == 0) then
		;printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        gafadein_3 = 0
        gafadeout_3 = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

endif



aout_total  delayr     gidelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig_for_delayline
aout = ainputsig + (aoutnew * gafadein_3) + (aoutold * gafadeout_3)

;printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout

readquery:
if 	koutput_on_off == 0	kgoto off
;if kcrossfade_after == 0.0 kgoto off

read:
out	aout*koutput_volume
aout = aout
kgoto out
off:
aout = 0
out:
	endin




;
;
;		INSTR 4
;
;
;
;
	instr 4
SDestIP strget 1
prints SDestIP

icrossinstr = 104

ainputsig = 0
kstarted = 0

kcrossfade_before init 0
kcrossfade_after init 0
kcrossfade_in_progress init 0

aout	init 0

kinput_volume init 1	; input volume
koutput_volume init 1	; output volume

kinput_on_off init 0	; input on/off
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

if kstarted == 0 then
OSCsend 1, SDestIP, 9000, "/2/fader5", "f", (kdelay_tap_point / (gkmaxdel - gimin)) + gimin
OSCsend 1, SDestIP, 9000, "/2/rotary10", "f", kregeneration_scalar
OSCsend 1, SDestIP, 9000, "/2/toggle7", "f", kinput_on_off
OSCsend 1, SDestIP, 9000, "/2/toggle8", "f", koutput_on_off
OSCsend 1, SDestIP, 9000, "/2/rotary11", "f", kinput_volume
OSCsend 1, SDestIP, 9000, "/2/rotary12", "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten gihandle, "/2/fader5", "f", kosc_delaytime
if (k1 == 0) goto osc_2
	;printks "2 kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (gkmaxdel - gimin)) + gimin
kgoto osc_1
osc_2:
k2  OSClisten gihandle, "/2/rotary10", "f", kosc_regentime
if (k2 == 0) goto osc_3
	;printks "2 kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten gihandle, "/2/toggle7", "f", kosc_input_on
if (k3 == 0) goto osc_4
	;printks "2 kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten gihandle, "/2/toggle8", "f", kosc_output_on
if (k4 == 0) goto osc_5
	;printks "2 kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten gihandle, "/2/rotary11", "f", kosc_involume
if (k5 == 0) goto osc_6
	;printks "2 kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten gihandle, "/2/rotary12", "f", kosc_outvolume
if (k6 == 0) goto osc_7
	;printks "2 kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten gihandle, "/2/push7", "f", kosc_push1val
if (k7 == 0) goto osc_done
	if (kosc_push1val == 1.0) then
		;printks "2 tap recvd: %f \n", .001, kosc_push1val
if	ktap_tempo_comp_time > 0 	kgoto tap_tempo_compare
;if	gk_update_tap_1 == 0 kgoto done
ktap_tempo_comp_time times
		;printks "2 gkcomptime: %f \n", .1, ktap_tempo_comp_time
kgoto tap_tempo_done
tap_tempo_compare:
;if	gk_update_tap_1 == 1 kgoto done
ktemptime times
krate1 = ktemptime - ktap_tempo_comp_time
;FLsetVal	1, krate1, gihtap1
		;printks "krate: %f \n", .1, krate1
		;printks "gidelsize: %f \n", .1, gidelsize
OSCsend (krate1 / gidelsize), SDestIP, 9000, "/2/fader5", "f", (krate1 / gidelsize)
		;printks "fader set to : %f \n", .1, (krate1 / gidelsize)
kdelay_tap_point = krate1

ktap_tempo_comp_time = 0
;kgoto tap_tempo_done
tap_tempo_done:
	endif

osc_done:

if kinput_on_off == 0 kgoto noread
;if kcrossfade_after == 0.0 kgoto noread

kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume

noread:

asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar
kactive active k(icrossinstr)

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then
	;printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		;printks "event is ended\n", .01
        kcrossfade_in_progress = 0
        gafadein_4 = 1.0
        gafadeout_4 = 0
        kcrossfade_before = kcrossfade_after
		;OSCsend 1, $DestIP", 9000, "/1/fader1", "f", kcrossfade_after / gkmaxdel
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		;printks "crossfading, keeping state....\n", .01
		; don't update the tap time until we're done x-fading
		;kdelay_tap_point = kcrossfade_before
    elseif (kcrossfade_in_progress == 0) then
		;printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        gafadein_4 = 0
        gafadeout_4 = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

endif



aout_total  delayr     gidelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig_for_delayline
aout = ainputsig + (aoutnew * gafadein_4) + (aoutold * gafadeout_4)

;printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout

readquery:
if 	koutput_on_off == 0	kgoto off
;if kcrossfade_after == 0.0 kgoto off

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

    instr 102
gafadein_2   linseg    0.0, p3, 1.0
gafadeout_2   linseg   1.0, p3, 0.0
    endin

    instr 103
gafadein_3   linseg    0.0, p3, 1.0
gafadeout_3   linseg   1.0, p3, 0.0
    endin

    instr 104
gafadein_4   linseg    0.0, p3, 1.0
gafadeout_4   linseg   1.0, p3, 0.0
    endin


</CsInstruments>

<CsScore>
i1 0 3600
i2 0 3600
i3 0 3600
i4 0 3600
e

</CsScore>

</CsoundSynthesizer>
