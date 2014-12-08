<CsoundSynthesizer>

<CsInstruments>
;-------------------------------------------------------------------------------
; rtin1 - realtime input experimenting
;-------------------------------------------------------------------------------
sr     = 22050
kr     = 2205
ksmps  = 10
nchnls = 1

;-------------------------------------------------------------------------------
; get pitch of signal, send to midi instrument
;-------------------------------------------------------------------------------
instr    1 ; 
asnd	in
asnd	butterlp	asnd, 4000
kcps, kamp	pitchamdf asnd*.25, 20,2000


;asig	oscili	kamp*10, kcps, 2

kpc	= octcps(kcps)

kamp	tonek	kamp, 40
kcps	tonek	kcps, 500

kcps1 = cpsoct(kpc+1)
kcps2 = cpsoct(kpc-1)


asig1	oscili	kamp*10, kcps1, 2
asig2	oscili	kamp*10, kcps2, 2

asig1	delay	asig1, 2
asig2	delay	asig2, 2


out asig1+asig2
endin

instr 2
asig	oscili	p4*10, p5, 2
out asig
endin

</CsInstruments>
<CsScore>
f 1 0 16384 9 .5 1 0
f 2 0 8192 10 1

i1 0 3600
</CsScore>
</CsoundSynthesizer>
