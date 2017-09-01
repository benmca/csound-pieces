nchnls         =         2


instr          1              ;SHARP ATTACK INSTR A P4=PCH P5=AMP P6=CHNL1AMP P7=0=DOWN
                              ;QUICK GLISS

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc, 0, .2, .01

;i1            =         cpspch(p4)
 i1            =         cpspch(5.08)
;k1            expseg    1,.05,1,p3-.05,1.35      ;GLISS UP
 k1            expseg    1,.05,1,.75-.05,1.35
;if            p7=0      goto next
 if            0=0       goto next
k1             =         2-k1
next:
;a1            oscili    1,i1*k1,8
 a1            oscili    1,knote*k1,8
;k5            expseg    .00001,.03,p5,.02,p5,p3-.05,.00001   ;env amp
 k5            expseg    .00001,.03,14000,.02,14000,.75-.05,.00001
;k6            linseg    1,.05,1,p3-.05,2.5
 k6            linseg    1,.05,1,.75-.05,2.5
k5             =         k5*k6
a1             =         a1*k5
;ga1           =         a1*p6
 a1            =         a1*.25
;ga2           =         a1*(1-p6)
 a2            =         a1*(1-.25)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
