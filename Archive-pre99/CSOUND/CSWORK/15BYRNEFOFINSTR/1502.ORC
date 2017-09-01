sr      =      	44100
kr    	=     	4410
ksmps  	=     	10
nchnls	=		1

        instr   1502
;USE TO CREATE INTEREST IN FORMANT FREQ        
a1		phasor	.25
alin	table	a1*32768, 2 
a2		linseg	1, 1.5, 1, .5, 3, 1.5, 3, .5, 2, 1.5, 2, .5, 1, 2, 1
				;xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, ifna, ifnb, itotdur[, iphs[, ifmode]]
alin = alin * a2        
a1      fof     5000, p4, 		alin, 	  0, 	0,   .003, .02,  .005, 	20, 	1, 	  19, 	p3,        0,     1
        out     a1
        endin
