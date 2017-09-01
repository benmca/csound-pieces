<CsoundSynthesizer>

<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=2

ga1 init 0
ga2 init 0

	instr 1	;christmas ball
idur = p3
iamp = p4*100
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10
iendx = indx+iorigdur
;indx = indx + iorigdur)
kamp	linen	iamp, .01, idur, .01
ktime   line    indx, idur , iendx
 
;al	diskin	"sources/christmasball.wav", ipitch, indx
al  sndwarp kamp, ktime, 1, 3, 0, 4410, 882, 15, 1, 1
  
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

	endin

	instr 2	;christmas ball
idur = p3
iamp = p4*100
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10
iendx = indx+iorigdur
;indx = indx
kamp	linen	iamp, .3*idur, idur, .3*idur
ktime   line    indx, idur , iendx
 
;al	diskin	"sources/christmasball.wav", ipitch, indx
al  sndwarp kamp, ktime, 1, 3, 0, 4410, 882, 15, 1, 1
  
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

	endin

	instr 3	;swmix
idur = p3
iamp = p4*100
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
idecay = p10
iorigdur = 62

kamp	linen	iamp, .01, idur, idecay

ktime   line    indx, idur , iorigdur 

al,ar  	sndwarpst kamp, ktime, ipitch, 5, 0, 4410, 882, 15, 1, 1
al=al*kamp
ar=ar*kamp
asig = (al+ar)*.5
al, ar  	locsig	asig, ipan, idist, ipct
ar1, ar2	locsend
	outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2
	endin

	instr 4	;alert
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = 9.36
iendx = indx + iorigdur
kamp	linen	iamp, iorigdur*.5, idur, iorigdur*.5
ktime   line    indx, idur , iendx
 
al	diskin	"alert.wav", ipitch, indx
;al  sndwarp kamp, ktime, 1, 3, 0, 4410, 882, 15, 1, 1
  
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

	endin

	instr 5	;pulse
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
kamp	linen	iamp, .01, idur, .01
 
al,ar	diskin	"rdath/PoorSolosTrack.aif", ipitch, indx
  
al=al*kamp

al, ar  	locsig	al, ipan, idist, ipct
ar1, ar2	locsend
	outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

	endin

	instr 99	;reverb
klin linseg  p4, p3, p4
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, 1
a2	reverb2	ga2, klin, 1
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0

	endin


</CsInstruments>

<CsScore>

f1 0 16384 9 .5 1 0
f2 0 16384 10 1
f3 0 2097152 1 "christmasball.wav" 0 0 0
f4 0 512 5 .001 100 1.0 312 1.0 100 .001
f5 0 16777216 1 "sw_mix_filetered.wav" 0 0 0 




i3	109.7	174.70001	1.499	1	45	2	0.075	40	10	
i3	58.0	61.75	1.499	1	45	2	0.075	40	1	
i3	154.0	50.0625	1.499	1.25	9	2	0.075	40	1	
i3	134.1	70.0	1.499	0.8	9	2	0.075	40	10	
i3	171.5	32.6	1.499	0.4	9	2	0.075	40	10	
e

</CsScore>

</CsoundSynthesizer>