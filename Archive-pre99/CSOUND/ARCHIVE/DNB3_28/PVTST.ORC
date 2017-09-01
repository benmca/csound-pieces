sr=44100
kr=4410
ksmps=10
nchnls=2



instr 1
idur = p3
itim = p4

krmp	linen	10000, .01, p3, .01
ktim	linseg	0, p3, itim

ar      pvadd      ktim, 1, "1024_4.pvc", 1, 3, p5 	;ibins[, ibinoffset, ibinincr]
ar=ar*krmp
outs	ar, ar

endin