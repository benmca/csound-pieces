sr=44100
ksmps=2
nchnls=2

ga1 init 0
ga2 init 0

instr 1
idur = p3
iamp = p4 * 16000
ipitch = p5
ipan = p6
idist = p7
ipct = p8
;ishapearg = p9

kamp    linen   iamp, .001, idur, idur-.001
;kamp    linen   iamp, .02, idur, idur*.5
;amod    oscili  1000, ipitch, 1
;acar    oscili  kamp, ipitch+amod, 1
;acar    oscili  kamp, ipitch+amod, 1
acar    oscili  kamp, ipitch, 1

a1, a2  locsig  acar, ipan, idist, ipct
ar1, ar2  locsend
outs a1, a2
ga1 = ga1+ar1
ga2 = ga2+ar2
;if (p2 > 79) kgoto cmplt
OSCsend     1, "10.0.0.3",12000, "", "idddd", p1, p2, p3, p4, p5
;kgoto end
;cmplt:
;OSCsend     1, "127.0.0.1",12000, "", "idddd", 99, p2, p3, p4, p5
;end:

endin

instr 99 
a1  reverb  ga1, 1
a2  reverb  ga2, 1
outs  a1,a2
ga1=0
ga2=0
endin


