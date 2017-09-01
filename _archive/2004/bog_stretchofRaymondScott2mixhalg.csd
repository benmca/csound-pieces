<CsoundSynthesizer>

<CsOptions>

</CsOptions>

<CsInstruments>
sr=48000
kr=4800
ksmps=10
nchnls=1

	instr 1	;sndwarp
;if	gkdelayflag = 0 kgoto off
idur = p3
iamp = p4*10
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
isuspoint = p10
iwinsize = p11
irandfactor = p12
itbl = p13
ioverlap = p14
isusportion = p15
iorigdur = p16
iendx = indx + iorigdur
isamptbl = 7

kamp	linen	iamp, .01, p3, .01
ktime   linseg   0, 45, 45, 4, 47, 8, 49, 50, iendx
 
 al  sndwarp kamp, ktime, ipitch, isamptbl, 0, iwinsize, irandfactor, ioverlap, itbl, 1
  
al=al*kamp
	out al
	endin


</CsInstruments>

<CsScore>

f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1
;half sine/sine window func

f4	0	513	20	6

;blueberry pie sample
f5 0 131072 1 "C:\CSOUND\snd\EmergencyPants\BlueberryPie.aif" 0 0 0 

;rectangle
f6   0   8192   -20   8   1
;BROWSE_FILE
;f7 0 1048576 1 "C:\CSOUND\snd\TrioClip.wav" 0 0 0 
f7 0  16777216 1 "D:\Nuendo\Urban\Audio\RaymondScott2_mix_halfM.wav" 0 0 0 
f8 0  16777216 1 "d:\charlie.wav" 0 0 0 
;268435456

i1 0 120 10 2 45 2 .75 0 1 10000 40 4 16 1 65

;for charlie
;i1 0 1800 10 2 45 2 .75 0 1 8800 40 4 16 1 184


;
;	Don't turn off - breaks GUI
;
;i5 0 3600

e

</CsScore>

</CsoundSynthesizer>