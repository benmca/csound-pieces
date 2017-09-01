sr=44100
kr=4410
ksmps=10
nchnls=1
ga1 init	0
ga2	init	0



instr 1
indx=p4
ipan=p5
idist=p6
ipct=p7
ipitch=p8
iamp=p9

kamp	linen		iamp, .01, p3, .01

al	diskin	"polvoish.aif", ipitch, indx
al=al*kamp

al, ar  locsig	al, ipan, idist, ipct
ar1, ar2	locsend

		out	al

ga1=ga1+ar1
ga2=ga2+ar2
endin

instr 10
endin

