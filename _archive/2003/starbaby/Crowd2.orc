sr=44100
kr=4410
ksmps=10
nchnls=2
ga1 init 0
ga2 init 0


instr 1
idur = p3
iamp = p4*100
ipitch = p5
ipan = p6
idist = 1
ipct = .1
indx = 0
iendx = 19.73
iorigdur = iendx-indx
itable = p7
kamp	linen	iamp, .01, idur, .01
ktime   line    indx, idur , iendx

ktimewarp rand .1
ktimewarp = ktimewarp+1

;
; a little AM may help it sound good.. maybe not
; 
amod 	oscili	.001, .01, 2 
;amod oscili	1, 10, 2 
;asnd  sndwarp	kamp, ktime, ipitch, itable, 0, 4410, 882, 15, 1, 1
;
;use ktimewarp to vary the strechiness (last arg itimemode = 0) 
;
asnd  sndwarp	kamp, ktimewarp, ipitch, itable, 0, 4410, 882, 15, 1, 0

asnd=asnd*(kamp+amod)

;
;This is to scale to amount of high-end by the amplitude (rms?)
;
kamp 	rms	asnd
;get scalar ( 0 -> 1) value
kamp = kamp/32767

;why doesn't this do anything?
display kamp, .1

; worst case: halfpower point of atone filter is 440
afilt	atone	asnd, 440+(kamp*10000)

; add scalar for reverb pct 

a1, a2		locsig	afilt, ipan, idist, ipct
ar1, ar2	locsend
outs	a1,a2


ga1=ga1+ar1
ga2=ga2+ar2
endin




instr 99
a1	reverb	ga1, p4
a2	reverb	ga2, p4
	outs	a1,a2
ga1=0
ga2=0
endin
