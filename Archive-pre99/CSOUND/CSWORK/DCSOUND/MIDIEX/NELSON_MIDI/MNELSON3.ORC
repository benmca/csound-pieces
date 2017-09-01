nchnls         =         2


instr          1         ;SHIMMERING INSTR #1
                         ;VARIABLE #PARTIALS, POWER TO PARTIALS, STARTING PARTIAL, ETC
                         ;P4=PCH P5=AMP P6=POWER P7=CHNL1AMP

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc, 0, .2, .01

;i1            =         cpspch(p4-2)
 i1            =         cpspch(11.04-2)
;k1            linseg    0,p3/2,p5,p3/2,0                        ;ENV
 k1            linseg    0,.1/2,5000,12/2,0
k2             randi     2,25
k3             oscil     .03,4+k2,1                              ;RAND TREM
;a1            gbuzz     .33+k3,i1,p6,1,50,4
 a1            gbuzz     .33+k3,knote,2.4,1,50,4
k4             randi     1.2,15
k5             oscil     .03,4+k2,1                              ;RAND TREM
;a2            gbuzz     .33+k5,i1+(i1*.02),p6,1,50,4
 a2            gbuzz     .33+k5,knote+(knote*.02),2.4,1,50,4
k6             randi     1.5,20
k7             oscil     .03,4+k2,1                              ;RAND TREM
;a3            gbuzz     .33+k7,i1-(i1*.021),p6,1,50,4
 a3            gbuzz     .33+k7,knote-(knote*.021),2.4,1,50,4
a4             =         (a1+a2+a3)*k1
;ga1           =         a4*p7
 a1            =         a4*.5
;ga2           =         a4*(1-p7)
 a2            =         a4*(1-.5)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
