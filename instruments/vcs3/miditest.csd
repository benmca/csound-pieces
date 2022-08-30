<CsoundSynthesizer>
<CsOptions>
</CsOptions>
; ==============================================
<CsInstruments>

sr	=	48000
ksmps	=	1
;nchnls	=	2
0dbfs	=	1

massign 0,0
instr 1	

kstatus, kchan, kdata1, kdata2                  midiin
if (kstatus > 0) then
	printks "midi: status: %f, kchan: %f, kdata1: %f, kdata2: %fi\n", .001, kstatus, kchan, kdata1, kdata2
endif
if (kstatus == 144.0 && kdata1 == 48.0) then
	printks "48 received\n", .001
endif


endin

</CsInstruments>
; ==============================================
<CsScore>
i1 0 3600


</CsScore>
</CsoundSynthesizer>

