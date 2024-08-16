<CsoundSynthesizer>
<CsOptions>


</CsOptions>
<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=2

          instr 1
ipan = p8
idist = p9
ipct = p10
		  			                  ; p3=duration of note
k1        linen     p4, p6, p3, p7      ; p4=amp
a1        oscil     k1, p5, 1           ; p5=freq

al, ar  locsig	a1, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

endin

instr 99
klin 	linseg  p4, p3, p4
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, 1
a2	reverb2	ga2, klin, 1
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0


</CsInstruments>
<CsScore>

f1	0	513	10	1



f0 7200


e




</CsScore>
</CsoundSynthesizer>
