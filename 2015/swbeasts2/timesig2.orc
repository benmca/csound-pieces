sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init	0
ga2	init	0



instr 1
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8

kamp    linen   iamp, .001, idur, .001
asig    soundin "/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/CleanClick1.wav"

a1, a2	locsig  asig * kamp, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin




instr 2
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8

kamp    linen   iamp, .001, idur, .001
asig    soundin "/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/Click2_Swell.wav"

a1, a2	locsig  asig * kamp, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin

instr 3
idur = p3
iamp = p4
ipitch = p5
ipan = p6
idist = p7
ipct = p8

kamp    linen   iamp, .001, idur, .001
asig    diskin "/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/OnTheHour_Distorted.wav", ipitch

a1, a2	locsig  asig * kamp, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin

instr 4
idur = p3
iamp = p4 * 32768
ipitch = p5
ipan = p6
idist = p7
ipct = p8

ifn1 = 4
ifn2 = 5
ibeg = 0
iwsize = 4410
irandw = 882
ioverlap = 15
itimemode = 1

kamp 	linen 	iamp, .001, idur, .001
ktime 	linseg	0, idur, .848

asig    sndwarp	 kamp, ktime, ipitch, ifn1, ibeg, iwsize,  irandw, ioverlap, ifn2, itimemode


a1, a2	locsig  asig, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin

instr 10
endin


instr 99

a1	reverb2	ga1, p4, .75
a2	reverb2	ga2, p4, .75
	outs	a1,a2
ga1=0
ga2=0
endin

