sr=44100
kr=44100
ksmps=1
nchnls=1

iafn0	ftgen	40, 0, 4, -2, 0,0,0,0
iafn1	ftgen	41, 0, 4, -2, 0,0,0,0
iafn2   ftgen   42, 0, 8, -2, .01,5,.01,5,0.0001,1,.01,5

FLcolor  0,0,0
iPh=400
iPl=500
	FLpanel	"Jcn Salle2002 Synthesis Tutorial",iPl,iPh
FLcolor  -1

imargin=5
ilength=iPl-2*imargin
iheight=300
	FLtabs	ilength,iheight,imargin,imargin

iborder=7
itabsh=30
itabsl=10



	FLgroup	"Wavetable",ilength-itabsl,iheight-itabsh,itabsl,itabsh,iborder
gkWavetable, ihWavetable   FLbutton  " ", 1, 0, 2, 30, 20, 20, 40, -1,0,0 
FLsetColor2 0,250, 50,ihWavetable



gkButton1,ihb1 FLbutBank 2,1,4,  35,112, 100+200,80,  -1,0,0
FLsetVal_i 	1, ihb1

ihb11  FLbox  "   64 points", 1, 5, 12, 90, 20, 135+200, 80+2
ihb12  FLbox  "  256 points", 1, 5, 12, 90, 20, 135+200, 80+27+2
ihb13  FLbox  " 8192 points", 1, 5, 12, 90, 20, 135+200, 80+27+27+2
ihb14  FLbox  "32768 points", 1, 5, 12, 90, 20, 135+200, 80+27+27+27+2

gkButton2,ihb2 FLbutBank 2,1,4,  35,112, 100,80,  -1,0,0
FLsetVal_i 	1, ihb2

ihb21  FLbox  "wavetable 1:  sine", 1, 5, 12, 140, 20, 135, 80+2
ihb22  FLbox  "wavetable 2:   saw", 1, 5, 12, 140, 20, 135, 80+27+2
ihb23  FLbox  "wavetable 3:custom", 1, 5, 12, 140, 20, 135, 80+27+27+2
ihb24  FLbox  "wavetable 4: pulse", 1, 5, 12, 140, 20, 135, 80+27+27+27+2


gkButton3,ihb3 FLbutBank 2,4,1,  280,25, 100,230,  -1,0,0
FLsetVal_i 	1, ihb3

ihb31  FLbox  "no interp", 1, 5, 12, 70, 20, 100, 260
ihb32  FLbox  "linear", 1, 5, 12, 70, 20, 100+70, 260
ihb33  FLbox  "cubic", 1, 5, 12, 70, 20, 100+70+70, 260
ihb34  FLbox  "sync 8 points", 1, 5, 12, 70, 20, 100+70+70+70, 260



	FLgroup_end


	FLgroup	"FM",ilength-itabsl,iheight-itabsh, itabsl,itabsh,iborder
gkFM, ihFM   FLbutton  " ", 1, 0, 2, 30, 20, 20, 40, -1,0,0 
FLsetColor2 0,250, 50,ihFM
FLlabel  12, 5, 4, 0,0,0


gkButtonfm1,ihbfm1 FLbutBank 2,1,4,  35,112, 100,80,  -1,0,0
FLsetVal_i 	1, ihbfm1

ihbfm11  FLbox  "c:m = 1:1 ", 1, 5, 12, 140, 20, 135, 80+2
ihbfm12  FLbox  "c:m = 3:2 ", 1, 5, 12, 140, 20, 135, 80+27+2
ihbfm13  FLbox  "c:m = 5:7 ", 1, 5, 12, 140, 20, 135, 80+27+27+2
ihbfm14  FLbox  "c:m custom", 1, 5, 12, 140, 20, 135, 80+27+27+27+2

ihfmrval	FLvalue	"c:m ratio", 60, 20, 90,210
gkfmr,  ihfmr	FLslider	" ", 1/10, 10, 0, 5, ihfmrval, 280, 16, 100,240
FLsetVal_i 	2, ihfmr

ihfmIval	FLvalue	"mod Index", 60, 20, 350,160
gkfmI,  ihfmI	FLknob	" ", 0, 20, 0, 1, ihfmIval, 50, 350,100
FLsetVal_i 	1, ihfmr

FLlabel  -1

	FLgroup_end




	FLtabs_end

ifxpannelh=iPh-iheight-imargin-iborder
ifxpannell=ilength

	FLpanel_end



	FLrun


instr 2
;Wavetable tutorial : change wave table, size, interpolation, aliasing

kfn = 4*gkButton2+(1+gkButton1)

kInt = gkButton3
aPh phasor p5

kPrevFn init 0
kNewFn trigger kfn, kPrevFn, 2

if (kNewFn==0) kgoto Next
reinit Next

Next:


if (kInt ==0) kgoto Interp0
if (kInt ==1) kgoto Interp1
if (kInt ==2) kgoto Interp3
if (kInt ==3) kgoto Interp8

Interp0:
ar	tablekt		aPh, kfn,1 
kgoto Made
Interp1:
ar	tablexkt	aPh, kfn, 0, 2,1,0,1
kgoto Made
Interp3:
ar	tablexkt	aPh, kfn, 0, 4,1,0,1
kgoto Made
Interp8:
ar	tablexkt	aPh, kfn, 0, 8,1,0,1
Made:
rireturn

out ar*10000

Skip:
endin



instr 3

if (gkButtonfm1==0) kgoto ratio1
if (gkButtonfm1==1) kgoto ratio2
if (gkButtonfm1==2) kgoto ratio3
if (gkButtonfm1==3) kgoto ratio4

ratio1:
kratio=1
kgoto fm
ratio2:
kratio=2/3
kgoto fm
ratio3:
kratio=7/5
kgoto fm
ratio4:
kratio=gkfmr

fm:
kImod tonek gkfmI,10

acarr	foscili	p4*10000, p5, 1, kratio, kImod,3

out acarr

endin
