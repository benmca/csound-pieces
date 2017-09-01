sr=44100
kr=4410
ksmps=10
nchnls=1

instr 1
idur=p3
indx=.125
imodfreq=.5
imodamp=indx*imodfreq
icaramp=10000
icarfreq=.25

alin	linen	1, .01, p3, .01

amod	oscili	imodamp, imodfreq, 1
acar	oscili	icaramp, icarfreq+amod, 1
	out		acar
endin

