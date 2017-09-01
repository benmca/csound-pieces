sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
kenv	linen	10000, .01, p3, .01
ktmpnt	linseg	0, p3, 3.9
a2   	pvadd   ktmpnt, 1, "Medium.pv", 1, 55, 5, 2
ar   	reson	a2, 1500, 50
ar		balance ar, a2
	out	ar*kenv
;bins 5-75 sound like transistor radio due to buzzing, 10 or 20 -65 sound more direct.  
;The buzzing sound is somewhere between bin 5 and 10
;reson filter can magnify motion via narrow bw, or ring like saxes in mid of 'garage'
endin

