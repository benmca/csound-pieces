sr=22050
kr=2205
ksmps=10
nchnls=1
instr	6
icarfreq=p6
iratio=p7
imodfreq=icarfreq*iratio
index=p8
idev=imodfreq*index
iamp=p4*32000
iampfunc=p5

kenv	oscil1	0,1,p3,iampfunc
amod	oscili	idev, imodfreq, 1
acar	oscili	kenv*iamp, icarfreq+amod, 1
		out acar
endin
instr	7
icarfreq=p6
iratio=p7
imodfreq=icarfreq*iratio
index=p8
idev=imodfreq*index
iamp=p4*32000
iampfunc=p5

kenv	oscil1	0,1,p3,iampfunc
amod	oscili	idev*kenv, imodfreq, 1
acar	oscili	kenv*iamp, icarfreq+amod, 1
		out acar
endin
