sr=44100
kr=4410
ksmps=10
nchnls=1

	FLpanel		"PVINTERP",450,750 ;***** start of container
ih1  FLvalue "kinterp",75, 25,330,50
ih2  FLvalue "kfmod",75, 25,330,150

gk1,iha	FLslider	"Piano (0) -> (1) Guitar", .01, 1, .01 ,5, ih1, 300,15, 20,50
gk2,iha	FLslider	"Freq Scalar", .01, 10, .01 ,5, ih2, 300,15, 20,150
	FLpanel_end	;***** end of container
	FLrun		;***** runs the widget thread, it is always required!


instr	1
;ktimptpno	linseg	0,4.829,4.829,4,8.829,p3-8.829,8.829
ktimptpno	linseg	0,4.829,4.829,4,8.829,p3-8.829,8.829

ktimptgtr	linseg	0.255,4.829,0.255,4,1,p3-8.829,14.870

;kinterp	linseg	0, 4.829,0,4,1,p3-8.829,1

	pvbufread	ktimptgtr, "gtr1.pvoc"

asig	pvinterp	ktimptpno,1 , "pno1.pvoc", 1, 1, 1, 1, gk1, gk1
;asig	pvcross	ktimpt2, 1, "pend.pvoc", 1-kinterp, kinterp
out asig
endin