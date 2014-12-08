<CsoundSynthesizer>
<CsOptions>
Csound -p -P1000 -m0 -A -iadc -MIDI -s -b128 -B128 -V50 -E32
</CsOptions>

<CsInstruments>
sr = 22050
kr = 441
ksmps = 50

;ctrlinit 1, 16,110, 17,2, 18,20, 19,100, 71,15, 75,30
ctrlinit 1, 16,30, 17,0, 18,120, 19,127, 71,45, 75,3

instr 1
icps	cpsmidi
iamp	ampmidi	10000
kp	midic7	16, 0,100
kflngrt midic7  17, .1,5
klfodp	midic7  18, 0, 100
klfofr	midic7  19, 0, 20
kcut    midic7  71, 20,5000
kres	midic7  75, 20,200
	kgate	madsr	.01,.1,.5,1
	kptch	adsr	1,.2,.5,1
	kdel    expon   1,2,.001
	klfo	lfo     klfodp,klfofr,1
	alfo	lfo		1,kflngrt,0
	ascan	oscili	iamp, icps+klfo+(kptch*kp), 8		
	aflt	rezzy ascan, 100+kcut, 20+kres
	aflng	flanger aflt, 1+alfo, .01+kdel
	arvb	reverb2	aflng*.3,2.8,.2
	out	    (aflng+arvb)*kgate				
		endin

		instr 		2
a0	in
a0 		=			a0/20000
		scanu		1, .01, 6, 2, 3, 4, 5, 2, .01, .1, -.05, .1, .5, 0, 0, a0, 0, -8
		endin
</CsInstruments>

<CsScore>
; Initial condition
f1 0 16 7 0 8 1 8 0
; Masses
f2 0 128 -7 1 128 1
; Spring matrix
f3 0 0 -23 "string-128" 
; Centering force
f4 0 128 -7 0 64 2 64 0
; Damping
f5 0 128 -7 1 128 1
; Initial velocity
f6 0 128 -7 -.3 128 .6
; Trajectory
f7 0 128 -7 0 128 128
; Sine
f8 0 128 10 1

i2 0 60
i1 0 .01
i1 0 .01
i1 0 .01
i1 0 .01
i1 0 .01
i1 0 .01
i1 0 .01

</CsScore>
</CsoundSynthesizer>













