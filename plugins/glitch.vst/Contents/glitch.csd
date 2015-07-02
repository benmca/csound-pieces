<Cabbage>
form caption("Glitch Delay") size(620, 130), pluginID("glit")
groupbox text("Glitch Delay"), bounds(0, 0, 620, 100)
rslider channel("delaytime"), bounds(10, 25, 70, 70), text("delaytime"), range(.1, 32, 32), identchannel("WRITEI")
rslider channel("regen"), bounds(70, 25, 70, 70), text("regen"), range(0, 1, 1)
rslider channel("kcf"), bounds(130, 25, 70, 70), text("cf"), range(1, 10000, 10000)
rslider channel("kq"), bounds(200, 25, 70, 70), text("q"), range(1, 20000, 20000)
button bounds(280, 25, 70, 70), caption("In"), text("On", "Off"), channel("inputon"), value(0), colour(0,0,0), fontcolour(255,255,255)
button bounds(350, 25, 70, 70), caption("Out"), text("On", "Off"), channel("outputon"), value(0), colour(0,0,0), fontcolour(255,255,255)
button bounds(420, 25, 70, 70), caption("Reinit"), text("Sending", "Send"), channel("reinit"), value(1), colour(0,0,0), fontcolour(255,255,255)
checkbox bounds(500, 25, 120, 70),caption("Host BPM"), text("Lock"), channel("lock"), value(0)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables.
sr = 44100
kr = 882
;ksmps = 125
nchnls = 2

;gkinput init 0
garegensig1 init 0
garegensig2 init 0

instr 1
kdelaytime chnget "delaytime"
kregen chnget "regen"
kinputon chnget "inputon"
koutputon chnget "outputon"
kcf chnget "kcf"
kq chnget "kq"
kbpm chnget "HOST_BPM"
klock chnget "lock"

if klock = 0 kgoto no_lock
printks	"locked\\n", 10
kdelaytime = (60/kbpm)
chnset kdelaytime, "delaytime"
printks	"%d\\n", 10, kdelaytime
no_lock:


;printks	"track 1 called\\n", 3600
;gkrate1	tonek	gkrate1, gkfilter
;
;	if delay flag == 0, no delay :)
;
ainputsig1 = 0
ainputsig2 = 0
if kinputon = 1 kgoto noread
ainputsig1,ainputsig2  		inch 1,2

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
asig1 = ainputsig1 +  (garegensig1 * kregen)
asig2 = ainputsig2 +  (garegensig2 * kregen)
kgoto done
noadd:
;asig = ainputsig
;printks	"%d\\n", 10, kregen
;
;	this binds the lower range of gkrate to gkmintap
;
;if	kdelaytime > gkmintap 	kgoto done
;kdelaytime = gkmintap
done:
;kdelaytime aresonk kdelaytime, kcf, kq
aout1 vdelay	asig1, kdelaytime*1000, 32*1000
aout2 vdelay	asig2, kdelaytime*1000, 32*1000

;
;	send out to regensig's for optional addition if sus pedal is pressed
;
garegensig1 = aout1
garegensig2 = aout2
;readquery:
if 	koutputon = 1	kgoto off
read:

;outs	aout*gkoutput,aout*gkoutput
outs	aout1,aout2
;gaout1_1 = aout
;kgoto out
off:
;turnoffk	gkturnoff
;gaout1_1 = 0
;out:

endin

instr 2

kreinit chnget "reinit"

if kreinit != 1 kgoto send
kgoto done
send:
;send message
chnset 1, "reinit"
done:

endin


</CsInstruments>  
<CsScore>
f1 0 4096 10 1
i1 0 1000
i2 0 1000
</CsScore>
</CsoundSynthesizer>