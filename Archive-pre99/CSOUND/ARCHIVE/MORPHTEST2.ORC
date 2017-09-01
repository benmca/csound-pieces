sr=44100
kr=4410
ksmps=10
nchnls=1

instr	1
ktimptpno	linseg	0,4.829,4.829,4,8.829,p3-8.829,8.829

ktimptgtr	linseg	0.255,4.829,0.255,4,1,p3-8.829,14.870

kinterp	linseg	0, 4.829,0,4,1,p3-8.829,1

	pvbufread	ktimptgtr, "gtr1.pvoc"

asig	pvinterp	ktimptpno,1, "pno1.pvoc", 1, 1, 1, 1, kinterp, kinterp
;asig	pvcross	ktimpt2, 1, "pend.pvoc", 1-kinterp, kinterp
out asig
endin