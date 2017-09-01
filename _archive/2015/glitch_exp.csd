<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables.
sr = 44100
kr = 441
nchnls = 1

gkdelcheck init 0
gkamp init 1

instr 1
chnset p4, "delaytime"
endin 

instr 10 
ktime times
gkamp = 1
kdelaytime chnget "delaytime"
if gkdelcheck > 0 kgoto doneinit
gkdelcheck = kdelaytime
doneinit:

if kdelaytime == gkdelcheck kgoto done
printks "kdelaytime: %f\n",.001,kdelaytime
printks "gkdelcheck: %f\n",.001,gkdelcheck
;schedule 11,0,.1
event "i",11,0,.1
done:
endin

instr 11
idur = p3
printf_i "instr 11 %f",1, idur
kamp linseg 1, .01, 0, idur-.02, 0, .01, 1
gkamp = kamp
endin

instr 12
kdelaytime chnget "delaytime"
gkdelcheck = kdelaytime
;kdelaytime portk kdelaytime, .01
;adelaytime interp kdelaytime
;adelaytime tone adelaytime, kcf

adelaytime = a(kdelaytime*1000)

out	adelaytime*gkamp

endin


</CsInstruments>  
<CsScore>
f1 0 4096 10 1
i1 0 1 5
i1 1 1 10
i1 2 1 15
i10 0 3
i12 0 3

</CsScore>
</CsoundSynthesizer>