sr = 22050
kr = 2205
ksmps = 10
nchnls = 2

ga1 init 0
ga2 init 0
ga3 init 0
ga4 init 0
;
;using oscili:
;
instr 1
;p3=dur	p4=amp	p5=freq	p6=ifn
aenv	linen	p4, .01, p3, .01
asig	oscili	1,p5, p6
asig=asig*aenv
outs asig, asig

endin
;
;using buzz
;
instr 2

endin
;
;using 
;
instr 99

irevtime = 2.5

arev1 nreverb ga1, irevtime-.1, .25
arev2 nreverb ga2, irevtime, .25

ga1=0
ga2=0

outs arev1, arev2

endin
