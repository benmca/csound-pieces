<CsoundSynthesizer>
<CsInstruments>
sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init    0
ga2 init    0

gihandle OSCinit 7825


instr 1
idur = p3
iamp = p4 * 16000
ipitch = p5
ipan = p6
idist = p7
ipct = p8

inote = ((log(ipitch/440.0)/log(2)) * 12) + 69

ifn = 0
imeth = 1
kamp    linen   iamp, 0, idur, .01
asig    pluck   kamp, ipitch, ipitch, ifn, imeth
noteondur 1, inote, 1, idur

a1, a2      locsig  asig, ipan, idist, ipct
ar1, ar2    locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
endin



instr 99

a1  reverb2 ga1, p4, .75
a2  reverb2 ga2, p4, .75
    outs    a1,a2
ga1=0
ga2=0
endin

instr   1000
kinst init 0
kstart init 0
kdur init 0
kamp init 0
kpitch init 0
kpan init 0
kdist init 0
kpct init 0
kwhen init 0

nxtmsg:
	kk  OSClisten gihandle, "/router", "ifffffff", kinst, kstart, kdur, kamp, kpitch, kpan, kdist, kpct
	if (kk == 0) goto exit
;	printk 0,kinst
;	printk 0,kstart
;	printk 0,kdur
;	printk 0,kamp
;	printk 0,kpitch
;	printk 0,kpan
;	printk 0,kdist
;	printk 0,kpct
	schedkwhen kk, -1, -1, kinst, kwhen, kdur, kamp, kpitch, kpan, kdist, kpct
	kgoto nxtmsg
	exit:
endin
</CsInstruments>
<CsScore>
i1000 0 3600
</CsScore>
</CsoundSynthesizer>