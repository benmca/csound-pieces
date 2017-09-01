sr= 22050	
kr= 2205
ksmps=10
nchnls=1

instr 1


idur1 = p3
idur2 = p3*.9
idur3 = p3*.65
idur4 = p3*.55
idur5 = p3*.325
idur6 = p3*.35
idur7 = p3*.25
idur8 = p3*.2
idur9 = p3*.15
idur10 = p3*.1
idur11 = p3*.075
ifreq1 = p4*.56
ifreq2 = (p4*.56)+1
ifreq3 = p4*.92
ifreq4 = (p4*.92)+1.7
ifreq5 = p4*1.19
ifreq6 = p4*1.7
ifreq7 = p4*2
ifreq8 = p4*2.74
ifreq9 = p4*3
ifreq10 = p4*3.75
ifreq11 = p4*4.07
iamp1 = p5*2450
iamp2 = iamp1*.67
iamp3 = iamp1*1.35
iamp4 = iamp1*1.8
iamp5 = iamp1*2.67
iamp6 = iamp1*1.67
iamp7 = iamp1*1.46
iamp8 = iamp1*1.33
iamp9 = iamp1*1.33
iamp10 = iamp1*.75
iamp11 = iamp1*1.33
kenv1	oscil1	0, iamp1, idur1, 2
aosc1	oscili	kenv1, ifreq1, 1
kenv2	oscil1	0, iamp2, idur2, 2
aosc2	oscili	kenv2, ifreq2, 1
kenv3	oscil1	0, iamp3, idur3, 2
aosc3	oscili	kenv3, ifreq3, 1
kenv4	oscil1	0, iamp4, idur4, 2
aosc4	oscili	kenv4, ifreq4, 1
kenv5	oscil1	0, iamp5, idur5, 2
aosc5	oscili	kenv5, ifreq5, 1
kenv6	oscil1	0, iamp6, idur6, 2
aosc6	oscili	kenv6, ifreq6, 1
kenv7	oscil1	0, iamp7, idur7, 2
aosc7	oscili	kenv7, ifreq7, 1
kenv8	oscil1	0, iamp8, idur8, 2
aosc8	oscili	kenv8, ifreq8, 1
kenv9	oscil1	0, iamp9, idur9, 2
aosc9	oscili	kenv9, ifreq9, 1
kenv10	oscil1	0, iamp10, idur10, 2
aosc10	oscili	kenv10, ifreq10, 1
kenv11	oscil1	0, iamp11, idur11, 2
aosc11	oscili	kenv11, ifreq11, 1

out	aosc1+aosc2+aosc3+aosc4+aosc5+aosc6+aosc7+aosc8+aosc9+aosc10+aosc11
endin
