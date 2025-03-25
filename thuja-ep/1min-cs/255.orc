sr=44100
ksmps=10
nchnls=2

ga1 init 0
ga2 init 0

ga3 init 0
ga4 init 0



instr 1
idur = p3
iamp = p4*10
ipitch = p5
ipan = p6
idist = p7
ipct = p8

Spath = p9

ifadein = p10
ifadeout = p11

printf_i "hey: %s, %f\n", 1, Spath, ipitch

if (ifadein == 0) then
    ifadein = .01
endif
if (ifadeout == 0) then
    ifadeout = .01
endif

if p4 = 0 kgoto the_end

;iendx = indx + iorigdur

kamp	linen	iamp, ifadein, idur, ifadeout
;ktime   line    indx, idur , iendx
al, ar	diskin2	    Spath, ipitch, 0

al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend
		outs	al, ar

ga1=ga1+ar1
ga2=ga2+ar2

the_end:

endin

instr 2
idur = p3
iamp = p4*10
ipitch = p5
ipan = p6
idist = p7
ipct = p8

Spath = p9

ifadein = p10
ifadeout = p11

; printf_i "hey: %s, %f\n", 1, Spath, ipitch

if (ifadein == 0) then
    ifadein = .01
endif
if (ifadeout == 0) then
    ifadeout = .01
endif

if p4 = 0 kgoto the_end
if p5 = 0 kgoto the_end


kamp	linen	iamp, ifadein, idur, ifadeout
al, ar	diskin2	    Spath, ipitch, 0, 1

al=al*kamp

;al, ar  locsig	al, ipan, idist, ipct
;ar1, ar2	locsend
;		outs	al, ar

ga3 = ga3+al
ga4 = ga4+ar

;ga1=ga1+ar1
;ga2=ga2+ar2

the_end:

endin

instr 3
idur = p3
iamp = p4
ipan = p6
idist = p7
ipct = p8

al, ar  locsig	ga3, ipan, idist, ipct
ar1, ar2	locsend

ga1=ga1+ar1
ga2=ga2+ar2

outs al, ar

ga3 = 0
ga4 = 0
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