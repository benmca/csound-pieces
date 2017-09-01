sr=44100
kr=4410
ksmps=10
nchnls=2
;reverb global variables
ga1 init 0
ga2 init 0
;delay global variables
;gd1 init 0
;gd2 init 0



instr 1
idur = p3
iamp = p4
ipitch = p5
indx = p6		; beginning of samplefrag
iendx = p7		; end of samplefrag
ipan = p8		; *
idist = p9		; * locsig args
ipct = p10		; *
idir = p11		; flag: 0=forward, 1=backward
iatck= .025
; ramp soun

krmp	linen	1, .01, p3, .01

; forward or backward? if idir is true (not zero) then goto backward
if idir=1 kgoto backward

; FORWARD: timeline for sndwarp reads through normally until after attack, then for p3-attack time

ktim	linseg	indx, iatck, indx+iatck, p3-iatck, iendx

; sndwarp statement forward
; ifn1=loop, ifn2=half sine

asnd,acmp	sndwarp		iamp, ktim, ipitch, 1, 0, 4000, 1000, 40, 2, 1

asnd		balance		asnd,acmp

kgoto loc

; BACKWARD: timeline reads backward over p3, no special consideration for attack 
backward:
ktim	linseg iendx, p3, indx
asnd,acmp	sndwarp		iamp, ktim, ipitch, 1, 0, 4000, 1000, 40, 2, 1
asnd		balance		asnd,acmp

loc:
;ramp thangs

asnd = asnd*krmp

; locsig statements

al, ar	locsig	asnd, ipan, idist, ipct
ar1, ar2	locsend

		outs		al, ar
; output to reverb
;ga1=ga1+ar1
;ga2=ga2+ar2
; output to delay?

endin