nchnls         =         2


instr          1                        ;RING MOD INSTR P4=PCH P5=AMP P6=CHNL1AMP

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc*8, 0, .2, .01

;i1            =         cpspch(p4)
 i1            =         cpspch(8.01)
;k1            linseg    0,p3/4,p5,p3/2,p5*.9,p3/4,0        ;ENV
 k1            linseg    0,4/4,1500,4/2,1500*.9,4/4,0
;a1            oscili    1,i1*.9983,3
 a1            oscili    1,knote*.9983,3
;a2            oscili    1,i1,3
 a2            oscili    1,knote,3
a3             =         a1*a2
a1             =         a3*k1
;ga1           =         a1*p6
 a1            =         a1*.75
;ga2           =         a1*(1-p6)
 a2            =         a1*(1-.75)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
