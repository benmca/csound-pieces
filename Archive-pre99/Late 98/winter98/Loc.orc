sr=22050
kr=2205
ksmps=10
nchnls=2

garevin1 init 0
garevin2 init 0
;garevin3 init 0
;garevin4 init 0

instr 2 ;Stereo or quad sound localization
	;using a time-invarient point per note

iamp=p4
icar=p5
ifreq = icar * (340 / (340 - p10))
imod=ifreq*p6
index=p7
idur=1/p3
irevpcnt = p11 ;try different values here!
idistend = p12

ilocphs=p8/360 ;p8 is between 0 and 90 for Stereo
               ;and between 0 and 360 for Quad.
idist=p9 ;speaker distance is 1. Values greater than 1
         ;will sound more distant.

aenv	oscili	1, idur, 3

idev = imod*index

amod oscili idev*aenv, imod, 1
asig oscili iamp*aenv, ifreq+amod, 1

idistr = 1/idist
idistrs = 1/sqrt(idist)

adirect = asig * idistr
atorev = (asig * idistrs) * irevpcnt
atorevg = atorev * idistr
atorevl = atorev * (1 - idistr)

;change ilocphs to a time-varying k value
;to move the sound during a note!
;example: klocphs line 0, p3, 1 
;would move the sound from left to right over the
;duration of each note.
ilf tablei ilocphs, 2, 1, .25, 1
irf tablei ilocphs, 2, 1, 0, 1
;irb tablei ilocphs, 2, 1, .75, 1
;ilb tablei ilocphs, 2, 1, .5, 1

adirect1=adirect*ilf
adirect2=adirect*irf
;adirect3=adirect*krb
;adirect4=adirect*klb

garevin1=((atorevl*ilf) + atorevg) + garevin1
garevin2=((atorevl*irf) + atorevg) + garevin2
;garevin3=((atorevl*krb) + atorevg) + garevin3
;garevin4=((atorevl*klb) + atorevg) + garevin4

outs adirect1, adirect2  ;, adirect3, adirect4
endin


instr 99

irevtime = 2.5

arev1 reverb garevin1, irevtime-.1
arev2 reverb garevin2, irevtime
;arev3 reverb garevin3, irevtime, .5
;arev4 reverb garevin4, irevtime, .5

garevin1=0
garevin2=0
;garevin3=0
;garevin4=0

outs arev1, arev2  ;, arev3, arev4

endin

