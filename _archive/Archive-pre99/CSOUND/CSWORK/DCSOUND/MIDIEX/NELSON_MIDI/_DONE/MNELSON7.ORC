nchnls         =         2

instr          1              ;simple 8va harmonic instr      p4=pch p5=amp p6=chnl1amp

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc*16, 0, .2, .01

;i1            =         cpspch(p4-1)
 i1            =         cpspch(8.10-1)
;k1            linseg    0,p3/2,p5,p3/2,0
 k1            linseg    0,6.3/2,2500,6.3/2,0
k9             rand      .75,10
;k10           oscil     p5/10,1.5+k9,1           ;TREMELO
 k10           oscil     2500/10,1.5+k9,1
;a1            gbuzz     k1+k10,i1,2,2,0,4
 a1            gbuzz     k1+k10,knote/2,2,2,0,4
;ga1           =         a1*p6
 a1            =         a1*.2
;ga2           =         a1*(1-p6)
 a2            =         a1*(1-.2)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
