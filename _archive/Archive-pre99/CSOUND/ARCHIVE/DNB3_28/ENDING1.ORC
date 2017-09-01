;
; minimal2.orc: simple sndwarp readthroughs of short drum samples
; 1- bass, 2-snare, 3 and 4 - penderecki gong-like sounds, 5-7 tom from j. cage landscape no 4(?)
;

sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0

instr 1
idur = p3
iamp = p4
ipitch = p5
irandfactor = p6

kamp	linen	iamp, .01, p3, 10
kpfact linseg ipitch, p3, ipitch * irandfactor
;kpfact	linseg	ipitch, p3*.1, ipitch+.1, p3*(.5-irandfactor), (ipitch * (1+irandfactor)), p3*(.4+irandfactor), ipitch
asig,asig2	diskin	"minimal3_1.aiff", kpfact, 0

outs	p7*(asig*kamp),(1-p7)* asig2*kamp
endin




instr 2
idur = p3
iamp = p4
ipitch = p5
irandfactor = p6

kamp	linen	iamp, .01, p3, 10
kpfact linseg ipitch, p3, ipitch * irandfactor
;kpfact	linseg	ipitch, p3*.1, ipitch+.1, p3*(.5-irandfactor), (ipitch * (1+irandfactor)), p3*(.4+irandfactor), ipitch
asig,asig2	diskin	"mix1_2.aiff", kpfact, 0

outs	p7*(asig*kamp),(1-p7)* asig2*kamp
endin


instr 3
idur = p3
iamp = p4
ipitch = p5
irandfactor = p6

kamp	linen	iamp, .01, p3, 10
kpfact linseg ipitch, p3, ipitch * irandfactor
;kpfact	linseg	ipitch, p3*.1, ipitch+.1, p3*(.5-irandfactor), (ipitch * (1+irandfactor)), p3*(.4+irandfactor), ipitch
asig,asig2	diskin	"vl1_7.aiff", kpfact, 14.431

outs	p7*(asig2*kamp),(1-p7)* asig2*kamp
endin


instr 4
idur = p3
iamp = p4
ipitch = p5
irandfactor = p6

kamp	linen	iamp, .01, p3, 10
kpfact linseg ipitch, p3, ipitch * irandfactor
;kpfact	linseg	ipitch, p3*.1, ipitch+.1, p3*(.5-irandfactor), (ipitch * (1+irandfactor)), p3*(.4+irandfactor), ipitch
asig,asig2	diskin	"drop.aiff", kpfact, 0

outs	p7*(asig*kamp),(1-p7)* asig*kamp
endin


