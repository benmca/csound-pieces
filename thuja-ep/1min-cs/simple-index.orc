sr=44100
ksmps=10
nchnls=2

ga1 init 0
ga2 init 0

gatrack1 init 0
gatrack2 init 0
gatrack3 init 0
gatrack4 init 0


instr 1
idur = p3
iamp = p4*10
ipitch = p5
ipan = p6
idist = p7
ipct = p8
indx = p9
iorigdur = p10
Spath = p11
ifadein = p12
ifadeout = p13
if (ifadein == 0) then
    ifadein = .01
endif
if (ifadeout == 0) then
    ifadeout = .01
endif
;iendx = indx + iorigdur

kamp	linen	iamp, ifadein, idur, ifadeout
;ktime   line    indx, idur , iendx
al	diskin	Spath, ipitch, indx

al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

endin

instr 99
klin 	linseg  p4, p3, p4
kamp	linseg	1, p3, 1
a1	reverb2	ga1, klin, .5
a2	reverb2	ga2, klin, .5
	outs	a1*kamp,a2*kamp
ga1=0
ga2=0
endin