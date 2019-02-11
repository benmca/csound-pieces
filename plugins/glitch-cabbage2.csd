<Cabbage>
form caption("Glitch Delay") size(620, 130), pluginID("glit-cab2")
groupbox text("Glitch Delay"), bounds(0, 0, 620, 100)
rslider channel("delaytime"), bounds(10, 25, 70, 70), text("delaytime"), range(0, 32, 32), identchannel("WRITEI")
rslider channel("regen"), bounds(70, 25, 70, 70), text("regen"), range(0, 1, 1)
rslider channel("kcf"), bounds(130, 25, 70, 70), text("cf"), range(1, 100, 100)
rslider channel("kq"), bounds(200, 25, 70, 70), text("q"), range(.01, 2, .01)
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
ksmps = 1
nchnls = 2

garegensig1 init 0
garegensig2 init 0


gicrossfadetime init .05

gkcrossfade_before init 0
gkcrossfade_after init 0
gafadein init 0
gafadeout init 1
gkchange init 0

gkrate_in_temp init 0

instr 1
kdelaytime chnget "delaytime"
gkrate_in_temp = kdelaytime

kregen chnget "regen"
kinputon chnget "inputon"
koutputon chnget "outputon"
kcf chnget "kcf"
kq chnget "kq"
kbpm chnget "HOST_BPM"
klock chnget "lock"

if klock = 0 kgoto no_lock
;printks	"locked\\n", 10
;kdelaytime = (60/kbpm)
;chnset kdelaytime, "delaytime"
;printks	"%d\\n", 10, kdelaytime
no_lock:

icrossinstr = 101


ainputsig1 = 0
ainputsig2 = 0
if kinputon = 1 kgoto noread
ainputsig1,ainputsig2  		inch 1,2

noread:
asig1 = ainputsig1 +  (garegensig1 * kregen)
asig2 = ainputsig2 +  (garegensig2 * kregen)

kactive active k(icrossinstr)

kgoto done
noadd:
done:

if  ((gkcrossfade_before != gkrate_in_temp && kactive == 0.0) || kactive > 0) then
	if (gkchange == 1 && kactive == 0.0) then
	    printks "ended\n", .01 
        gkchange = 0
        gafadein = 1.0
        gafadeout = 0
        gkcrossfade_before = gkcrossfade_after
    elseif (gkchange == 1 && kactive > 0) then
		printks "continuing....", .01
    elseif (gkchange == 0) then
	    printks "started...", .01 
        gkcrossfade_after = gkrate_in_temp
        gkchange = 1
        gafadein = 0
        gafadeout = 1.0
        event "i", icrossinstr, 0, gicrossfadetime
    endif

endif

aout_total   delayr     32
aoutnew1   deltapi     gkcrossfade_after
aoutold1   deltapi     gkcrossfade_before
delayw      asig1
aout1 = (aoutnew1 * gafadein) + (aoutold1 * gafadeout)

aout_total   delayr     32
aoutnew2   deltapi     gkcrossfade_after
aoutold2   deltapi     gkcrossfade_before
delayw      asig2
aout2 = (aoutnew2 * gafadein) + (aoutold2 * gafadeout)


garegensig1 = aout1
garegensig2 = aout2
if 	koutputon = 1	kgoto off
read:
outs	aout1,aout2
off:
endin


    instr 101
gafadein   linseg    0, p3, 1.0
gafadeout   linseg   1.0, p3, 0
    endin


</CsInstruments>
<CsScore>
f1 0 4096 10 1
i1 0 1000
</CsScore>
</CsoundSynthesizer>