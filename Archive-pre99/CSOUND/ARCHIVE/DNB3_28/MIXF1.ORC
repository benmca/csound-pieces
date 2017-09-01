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
ipan = .5

kamp	linen	iamp, .01, p3, .01


asig,asig2	diskin	"mix1_2.aiff", ipitch, 0

outs	asig*kamp,asig2*kamp
endin




instr 2
idur = p3
iamp = p4
ipitch = p5


kamp	linen	iamp, .01, p3, .01


asig,asig2	diskin	"minimal3_1.aiff", ipitch, 2.48

outs	asig*kamp,asig2*kamp
endin


instr 3
idur = p3
iamp = p4
ipitch = p5
ipan = .7

kamp	linen	iamp, .01, p3, 5

asig,asig2	diskin	"vl1_5.aiff", ipitch, 14.431

outs	ipan*(asig2*kamp),(1-ipan)* asig2*kamp
endin


instr 4
idur = p3
iamp = p4
ipitch = p5

kamp	linen	iamp, 5, p3, .01

asig,asig2	diskin	"mix1_2.aiff", ipitch, 42.937

outs	asig*kamp,asig2*kamp
endin




instr 5
idur = p3
iamp = p4
ipitch = p5

kamp	linen	iamp, .01, p3, 3

asig,asig2	diskin	"minimal3_2.aiff", ipitch, 1.422

outs	asig*kamp, asig2*kamp
endin


instr 6
idur = p3
iamp = p4
ipitch = p5
ipan = .4
kamp	linen	iamp, .01, p3, .01


asig,asig2	diskin	"drop2.aiff", ipitch, 0

outs	ipan*(asig*kamp),(1-ipan)*( asig*kamp)
endin




instr 7
idur = p3
iamp = p4
ipitch = p5


kamp	linen	iamp, .01, p3, .01


asig,asig2	diskin	"minimal3_3.aiff", ipitch, 0

outs	asig*kamp,asig2*kamp
endin


instr 8
idur = p3
iamp = p4
ipitch = p5

kamp	linen	iamp, .01, p3, .01

asig,asig2	diskin	"mix1_2.aiff", ipitch, 52

outs	asig*kamp,asig2*kamp
endin


instr 9
idur = p3
iamp = p4
ipitch = p5

kamp	linen	iamp, .01, p3, .01

asig,asig2	diskin	"ending2.aiff", ipitch, .01

outs	asig*kamp, asig2*kamp
endin
