sr=44100
kr=4410
ksmps=10
nchnls=1

instr 1
idur=p3
imodfreq=100
imodamp=1000
icaramp=1000
icarfreq=400

alin	linen	1, .01, p3, .01

amod	oscili	imodamp, imodfreq, 1
acar	oscili	icaramp+amod, icarfreq, 1
	out		acar
endin

