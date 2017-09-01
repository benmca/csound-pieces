nchnls         =         2


instr          1                   ;SIMPLE MARIMBA
                                   ;P4=PCH P5=AMP P6=CHNL1AMP

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc, 0, .2, .01

;i1            =         cpspch(p4)
 i1            =         cpspch(8.01)
;k1            expseg    .0001,.03,p5,p3-.03,.001      ;ENV
 k1            expseg    .0001,.03,4000,.1-.03,.001
;k25           linseg    1,.03,1,p3-.03,3
 k25           linseg    1,.03,1,.1-.03,3
k1             =         k25*k1
;k10           linseg    2.25,.03,3,p3-.03,2           ;POWER TO PARTIALS
 k10           linseg    2.25,.03,3,.1-.03,2
;a1            gbuzz     k1,i1,k10,0,35,4
 a1            gbuzz     k1,knote,k10,0,35,4
a2             reson     a1,500,50,1                   ;FILT
a3             reson     a2,1500,100,1                 ;FILT
a4             reson     a3,2500,150,1                 ;FILT
a5             reson     a4,3500,150,1                 ;FILT
a6             balance   a5,a1
;ga1           =         a6*p6
 a1            =         a6*.75
;ga2           =         a6*(1-p6)
 a2            =         a6*(1-.75)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
