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
gimin 	init 	0

gafadein_1 init 0
gafadeout_1 init 1

gafadein_2 init 0
gafadeout_2 init 1

gihandle OSCinit 8000




	instr 1	;track 1
SDestIP strget 1
prints SDestIP



icrossinstr = 101

ainputsig = 0
kstarted = 0

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


kchan = $IOBaseChannel
kchanout = $IOBaseChannel

ainputsig 		inch kchan
ainputsig = ainputsig * kinput_volume

noread:
asig_for_delayline = (ainputsig + aregenerated_signal) * kregeneration_scalar

atime interp kdelay_tap_point
atime tonex atime, .1, 1

aout_total  delayr     gidelsize
aout_tap   	deltapi     atime
			delayw      asig_for_delayline
aout = ainputsig + aout_tap

;
;	send out to regensig's for optional addition if sus pedal is pressed
;
aregenerated_signal = aout
readquery:
if 	koutput_on_off == 0	kgoto off

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
i1 0 3600
;i2 0 3600
e

</CsScore>

</CsoundSynthesizer>
