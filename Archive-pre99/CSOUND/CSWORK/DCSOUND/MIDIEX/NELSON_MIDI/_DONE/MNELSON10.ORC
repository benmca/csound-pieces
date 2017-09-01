nchnl          =         2


instr          1                   ;NOISE GENERATOR P4=PCH P5=AMP P6=CHNL1AMP

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc, 0, .2, .01

;i1            =         cpspch(p4)
 i1            =         cpspch(5.08)
;k1            randi     i1/3.5,500
 k1            randi     knote/3.5,knote
;k2            linseg    0,p3/3,p5,p3/3,p5,p3/3,0
 k2            linseg    0,9.1/3,3500,9.1/3,3500,9.1/3,0
;a1            oscili    k2,i1+k1,1
 a1            oscili    k2,knote+k1,1
               ;outs     a1*p6,a1*(1-p6)
               outs      a1*.25*kgate, a1*(1-.25)*kgate
               endin
