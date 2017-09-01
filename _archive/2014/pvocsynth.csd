<CsoundSynthesizer>
<CsOptions>


</CsOptions>
<CsInstruments>
sr=44100
kr=44100
ksmps=1
nchnls=1



	instr 1	;pvocer
	idur filelen "gtr.pvoc"
;idur filelen "pend.pvoc"
;idur filelen "RyanLoop.pvoc"
;idur filelen "Repeater.pvoc"
ireadur = idur
iendpt = idur
itotalbins = 256
inumkeys = 61
ifreq 	cpsmidi
inotnum	notnum
ifn = 1
iamp = 2
ibinoffset  = (itotalbins/inumkeys)*(inotnum-36)
ibend	pchbend 0.01
ibend = ibend + 1

;
; 
;

;if inotnum < 72 igoto after72
;ibend = ibend *.1
;iamp = iamp * 4
;igoto afterall
;after72:

;if inotnum < 60 igoto after60
;ibend = ibend *.2
;iamp = iamp * 4
;igoto afterall
;after60:

;afterall:
;
; ramp the sound, shutting it OFF after idur*.99 (for an hour!)
; 
;kramp	linseg	0, .01, iamp, idur*.99, iamp, idur*.01, 0, 10, 0
kramp	linenr	iamp, .01, 1, .01
ktime	line	0, ireadur, iendpt
;
; totalbins/61: gives even spread to number of bins/key
;
ar	pvadd	ktime, ibend, "gtr.pvoc", ifn, itotalbins/inumkeys , ibinoffset
print ibinoffset
print ibend
out ar*kramp
	endin




</CsInstruments>
<CsScore>

f1	0	513	10	1



f0 7200


e




</CsScore>
<CsArrangement>
</CsArrangement>
</CsoundSynthesizer>
