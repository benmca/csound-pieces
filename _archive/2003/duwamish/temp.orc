sr=44100
kr=44100
ksmps=1
nchnls=1



	instr 1	;untitled
idur = 3
iendpt = 3
ifreq 	cpsmidi
inotnum	notnum
ibinoffset  = 10*(inotnum-36)
;ramp the sound 
kramp	linen	10000, .01, iendpt, .01
;ktime	line	0, idur, iendpt
ktime	loopseg	1/3, 0, 0, 0, 1, 3
ar	pvadd	ktime, 1, "pend.pvoc", 1, 10 , ibinoffset
print ibinoffset
out ar*kramp
	endin


