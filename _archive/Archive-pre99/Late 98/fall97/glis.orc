sr=22050
kr=2205
ksmps=10
nchnls=1
;
instr	1
aenv1	oscili	p5,1/p3,2,0
aenv2	oscili	p5,1/p3,2,.1
aenv3	oscili	p5,1/p3,2,.2
aenv4	oscili	p5,1/p3,2,.3
aenv5	oscili	p5,1/p3,2,.4
aenv6	oscili	p5,1/p3,2,.5
aenv7	oscili	p5,1/p3,2,.6
aenv8	oscili	p5,1/p3,2,.7
aenv9	oscili	p5,1/p3,2,.8
aenv10	oscili	p5,1/p3,2,.9
aenv11	oscili	3900,1/p3,3,0
aenv12	oscili	3900,1/p3,3,.1
aenv13	oscili	3900,1/p3,3,.2
aenv14	oscili	3900,1/p3,3,.3
aenv15	oscili	3900,1/p3,3,.4
aenv16	oscili	3900,1/p3,3,.5
aenv17	oscili	3900,1/p3,3,.6
aenv18	oscili	3900,1/p3,3,.7
aenv19	oscili	3900,1/p3,3,.8
aenv20	oscili	3900,1/p3,3,.9
aosc1	oscili	aenv1,aenv11,1
aosc2	oscili	aenv2,aenv12,1
aosc3	oscili	aenv3,aenv13,1
aosc4	oscili	aenv4,aenv14,1
aosc5	oscili	aenv5,aenv15,1
aosc6	oscili	aenv6,aenv16,1
aosc7	oscili	aenv7,aenv17,1
aosc8	oscili	aenv8,aenv18,1
aosc9	oscili	aenv9,aenv19,1
aosc10	oscili	aenv10,aenv20,1
		out		aosc1+aosc2+aosc3+aosc4+aosc5+aosc6+aosc7+aosc8+aosc9+aosc10
endin
