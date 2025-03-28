sr=22050
kr=2205
ksmps=10
nchnls=2

garevin1 init 0
garevin2 init 0

instr 1
iamp=p4
ifreq=p5
irevpcnt=p6
ilocphs=p7/360
idist=p8

asig	pluck	iamp, ifreq, ifreq, 0, 1

idistr = 1/idist
idistrs = 1/sqrt(idist)
adirect = asig * idistr
atorev = (asig * idistrs) * irevpcnt
atorevg = atorev * idistr
atorevl = atorev * (1 - idistr)

klf tablei ilocphs, 2, 1, .25, 1
krf tablei ilocphs, 2, 1, 0, 1

adirect1=adirect*klf
adirect2=adirect*krf

garevin1=((atorevl*klf) + atorevg) + garevin1
garevin2=((atorevl*krf) + atorevg) + garevin2
outs adirect1, adirect2
endin


instr 2 ;Stereo or quad sound localization
	;using a time-invarient point per note
;doppler shift
idopmax = p10
kdop	line	0, p3, p10
iamp=p4
acar=p5
afreq = acar * (340 / (340 + kdop))
amod=afreq*p6
index=p7
idur=1/p3
irevpcnt = p11 ;try different values here!
idistend = p12
ilocphs=p8/360
ilocph2=p13/360         
idist=p9
;
adist	linseg	idist, p3, idistend
adev = amod*index
;
amod oscili adev, amod, 1
asig2 oscili iamp, afreq+amod, 1
asig1 linen asig2, .03, p3, .05
;

itop=p14
kbw	expseg	p14, p3, p14*.85
asig	reson	asig1, 0, kbw, 1

;

adistr = 1/adist
adistrs = 1/sqrt(adist)
adirect = asig * adistr
atorev = (asig * adistrs) * irevpcnt
atorevg = atorev * adistr
atorevl = atorev * (1 - adistr)

klocphs line	ilocphs, p3, ilocph2
klf tablei klocphs, 2, 1, .25, 1
krf tablei klocphs, 2, 1, 0, 1

adirect1=adirect*klf
adirect2=adirect*krf

garevin1=((atorevl*klf) + atorevg) + garevin1
garevin2=((atorevl*krf) + atorevg) + garevin2
outs adirect1, adirect2
endin

instr 3
iamp=p4
ifreq=p5
irevpcnt=p6
ilocphs=p7/360
idist=p8

asig	pluck	iamp, ifreq, ifreq, 0, 1

idistr = 1/idist
idistrs = 1/sqrt(idist)
adirect = asig * idistr
atorev = (asig * idistrs) * irevpcnt
atorevg = atorev * idistr
atorevl = atorev * (1 - idistr)

klf tablei ilocphs, 2, 1, .25, 1
krf tablei ilocphs, 2, 1, 0, 1

adirect1=adirect*klf
adirect2=adirect*krf

garevin1=((atorevl*klf) + atorevg) + garevin1
garevin2=((atorevl*krf) + atorevg) + garevin2
endin



instr 99

irevtime = 2.5

arev1 nreverb garevin1, irevtime-.1, .25, 1
arev2 nreverb garevin2, irevtime, .25, 2

garevin1=0
garevin2=0

outs arev1, arev2  ;, arev3, arev4

endin

