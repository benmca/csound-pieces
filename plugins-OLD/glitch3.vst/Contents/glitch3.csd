<Cabbage>
form caption("Glitch Delay") size(620, 130), pluginID("glit")
groupbox text("Glitch Delay"), bounds(0, 0, 620, 100)
rslider channel("delaytime"), bounds(10, 25, 70, 70), text("delaytime"), range(.01, 4, 4), identchannel("WRITEI")
rslider channel("regen"), bounds(70, 25, 70, 70), text("regen"), range(0, 1, 1)
rslider channel("kcf"), bounds(130, 25, 70, 70), text("cf"), range(1, 100, 100)
rslider channel("kq"), bounds(200, 25, 70, 70), text("q"), range(.001, .01, .01)
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
kr = 441
nchnls = 2

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


ainputsig1 = 0
ainputsig2 = 0
if kinputon = 1 kgoto noread
ainputsig1,ainputsig2  		inch 1,2

kdelaytime portk kdelaytime, kq
adelaytime = a(kdelaytime)
;adelaytime tone adelaytime, kcf

noread:
asig1 = ainputsig1 +  (garegensig1 * kregen)
asig2 = ainputsig2 +  (garegensig2 * kregen)
kgoto done
noadd:
done:
aout1 vdelayx	asig1, adelaytime, 32, 1024
aout2 vdelayx	asig2, adelaytime, 32, 1024
garegensig1 = aout1
garegensig2 = aout2
if 	koutputon = 1	kgoto off
read:
outs	aout1,aout2
off:
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