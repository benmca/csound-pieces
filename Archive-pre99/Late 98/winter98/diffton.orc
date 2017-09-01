sr=44100
kr=4410
ksmps=10
nchnls=1


instr	1
idur = p3
icf = p4
ifreq1 = 10000+(10000*p5)
ifreq2 = ifreq1+p4
;
asig1	pluck	20000, ifreq1, 100, 0, 1
asig2	pluck	20000, ifreq2, 100, 0, 1
asig = asig1 + asig2
;
anew	reson asig, icf, 100
;anew1	reson anew, icf, 10
;anew2	reson anew1, icf, 10
anews	balance	anew, asig
out anews*10
endin