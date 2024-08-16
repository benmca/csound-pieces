;===========
; toot03.orc 
;===========

sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

ga1 init 0
ga2 init 0

          instr 1
idur = p3
iamp = p4*20000
ifreq = p5
ipan = p6
idist = p7
ipct = p8

iatck = p9
irel = p10
		  			                  ; p3=duration of note
k1        linen     iamp, iatck, idur, irel      ; p4=amp
a1        oscil     k1, ifreq, 1           ; p5=freq

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

endin

