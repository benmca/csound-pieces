sr=44100
ksmps=2
nchnls=2

ga1 init 0
ga2 init 0




instr 1 ;sine
idur = p3
iamp = p4 * 16000
ipitch = p5
;ipan = p6
;idist = p7
;ipct = p8

kamp    linen   iamp, .001, idur, .001
;kamp    linen   iamp, .02, idur, idur*.5
;amod    oscili  1000, ipitch, 1
;acar    oscili  kamp, ipitch+amod, 1
;acar    oscili  kamp, ipitch+amod, 1
acar    oscili  kamp, ipitch, 1

;a1, a2  locsig  acar, ipan, idist, ipct
;ar1, ar2  locsend
;outs a1, a2
;ga1 = ga1+ar1
;ga2 = ga2+ar2
outs acar, acar

endin




