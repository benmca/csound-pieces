<CsoundSynthesizer>
<CsInstruments>
sr=44100
kr=44100
nchnls=1

giosc_handle OSCinit 8000
gafadein_101 init 0
gafadeout_101 init 1
gafadein_102 init 0
gafadeout_102 init 1

	opcode GlitchDelay, a, iiiiiaaSSSSSSSS
idelsize, imin_tap_point, icrossfadetime, ioschandle, icrossfade_instrument, afadein, afadeout, SControllerIP, 
STapPointCtrl, SRegenerationScalarCtrl, SInputOnCtrl, SOutputOnCtrl, SInputVolCtrl, SOutputVolCtrl, STapTempoCtrl	xin

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
OSCsend 1, SControllerIP, 9000, STapPointCtrl, "f", (kdelay_tap_point / (k(idelsize) - imin_tap_point)) + imin_tap_point
OSCsend 1, SControllerIP, 9000, SRegenerationScalarCtrl, "f", kregeneration_scalar
OSCsend 1, SControllerIP, 9000, SInputOnCtrl, "f", kinput_on_off
OSCsend 1, SControllerIP, 9000, SOutputOnCtrl, "f", koutput_on_off
OSCsend 1, SControllerIP, 9000, SInputVolCtrl, "f", kinput_volume
OSCsend 1, SControllerIP, 9000, SOutputVolCtrl, "f", koutput_volume
kstarted = 1
endif

osc_1:
k1  OSClisten ioschandle, STapPointCtrl, "f", kosc_delaytime
if (k1 == 0) goto osc_2
	printks "kosc_delaytime: %f \n", .001, kosc_delaytime
kdelay_tap_point = (kosc_delaytime * (k(idelsize) - imin_tap_point)) + imin_tap_point
kgoto osc_1
osc_2:
k2  OSClisten ioschandle, SRegenerationScalarCtrl, "f", kosc_regentime
if (k2 == 0) goto osc_3
	printks "kosc_regentime: %f \n", .001, kosc_regentime
kregeneration_scalar = kosc_regentime
kgoto osc_2
osc_3:
k3  OSClisten ioschandle, SInputOnCtrl, "f", kosc_input_on
if (k3 == 0) goto osc_4
	printks "kosc_input_on: %f \n", .001, kosc_input_on
kinput_on_off = kosc_input_on
kgoto osc_3
osc_4:
k4  OSClisten ioschandle, SOutputOnCtrl, "f", kosc_output_on
if (k4 == 0) goto osc_5
	printks "kosc_output_on: %f \n", .001, kosc_output_on
koutput_on_off = kosc_output_on
kgoto osc_4
osc_5:
k5  OSClisten ioschandle, SInputVolCtrl, "f", kosc_involume
if (k5 == 0) goto osc_6
	printks "kosc_involume: %f \n", .001, kosc_involume
kinput_volume = kosc_involume
kgoto osc_5
osc_6:
k6  OSClisten ioschandle, SOutputVolCtrl, "f", kosc_outvolume
if (k6 == 0) goto osc_7
	printks "kosc_outvolume: %f \n", .001, kosc_outvolume
koutput_volume = kosc_outvolume
kgoto osc_6
osc_7:
k7  OSClisten ioschandle, STapTempoCtrl, "f", kosc_push1val
if (k7 == 0) goto osc_done
	if (kosc_push1val == 1.0) then
		printks "tap recvd: %f \n", .001, kosc_push1val
if	ktap_tempo_comp_time > 0 	kgoto tap_tempo_compare
;if	gk_update_tap_1 == 0 kgoto done
ktap_tempo_comp_time times
		printks "gkcomptime: %f \n", .1, ktap_tempo_comp_time
kgoto tap_tempo_done
tap_tempo_compare:
ktemptime times
krate1 = ktemptime - ktap_tempo_comp_time
		printks "krate: %f \n", .1, krate1
		printks "idelsize: %f \n", .1, idelsize
OSCsend (krate1 / idelsize), SControllerIP, 9000, STapPointCtrl, "f", (krate1 / idelsize)
		printks "fader set to : %f \n", .1, (krate1 / idelsize)
kdelay_tap_point = krate1

ktap_tempo_comp_time = 0
tap_tempo_done:
	endif

osc_done:
if	kinput_on_off = 0 kgoto noread
kchan = 1
kchanout = 1
ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume
noread:

asig = ainputsig +  (aregenerated_signal * kregeneration_scalar)
kactive active k(icrossfade_instrument)

if  ((kcrossfade_before != kdelay_tap_point && kactive == 0.0) || kactive > 0) then
	printks "checking....", .01
	if (kcrossfade_in_progress == 1 && kactive == 0.0) then
		printks "event is ended\n", .01
        kcrossfade_in_progress = 0
        afadein = 1.0
        afadeout = 0
        kcrossfade_before = kcrossfade_after
		;OSCsend 1, SControllerIP, 9000, STapPointCtrl, "f", kcrossfade_after / gkmaxdel
    elseif (kcrossfade_in_progress == 1 && kactive > 0) then
		printks "crossfading, keeping state....\n", .01
		; don't update the tap time until we're done x-fading
		;kdelay_tap_point = kcrossfade_before
    elseif (kcrossfade_in_progress == 0) then
		printks "starting event....\n", .01
        kcrossfade_after = kdelay_tap_point
        kcrossfade_in_progress = 1
        afadein = 0
        afadeout = 1.0
        event "i", icrossfade_instrument, 0, icrossfadetime
    endif

endif

aout_total  delayr     idelsize
aoutnew   	deltapi     kcrossfade_after
aoutold   	deltapi     kcrossfade_before
			delayw      asig
aout = (aoutnew * afadein) + (aoutold * afadeout)

printks "kcrossfade_before: %f, kcrossfade_after: %f\n", 1, kcrossfade_before, kcrossfade_after
;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout
readquery:
if 	koutput_on_off = 0	kgoto off

read:
xout	aout*koutput_volume
aout = aout
kgoto out
off:
aout = 0
out:
	endop

	instr 1	;track 1
; todo - factor out control signals from separate osc-routing instrument
aout 	GlitchDelay		8, .001, .05, giosc_handle, 101, gafadein_101, gafadeout_101, "10.0.0.180", 
						"/1/fader1", "/1/rotary1", "/1/toggle1", "/1/toggle2", "/1/rotary2", "/1/rotary3", "/1/push1"
	out aout
	endin

	instr 2	;track 1
aout 	GlitchDelay		8, .001, .05, giosc_handle, 102, gafadein_102, gafadeout_102, "10.0.0.180", 
						"/1/fader2", "/1/rotary4", "/1/toggle3", "/1/toggle4", "/1/rotary5", "/1/rotary6", "/1/push3"
	out aout
	endin



    instr 101
gafadein_101   linseg    0.0, p3, 1.0
gafadeout_101   linseg   1.0, p3, 0.0
    endin

    instr 102
gafadein_102   linseg    0.0, p3, 1.0
gafadeout_102   linseg   1.0, p3, 0.0
    endin



</CsInstruments>

<CsScore>
i1 0 3600
;i2 0 3600
e

</CsScore>

</CsoundSynthesizer>
