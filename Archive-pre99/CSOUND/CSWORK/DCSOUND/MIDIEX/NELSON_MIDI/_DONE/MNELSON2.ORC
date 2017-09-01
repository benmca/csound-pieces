nchnls         =         2

;massign       1,1

instr          1              ;SHORT ATTACK INSTR
                              ;P4=PCH P5=AMP P6=CHNL1AMP P7=FUNCTION

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc, 0, .2, .01

;i1            =         cpspch(p4)
 i1            =         cpspch(8.10)
;k1            expseg    .001,.01,1.3,p3-.01,.001
 k1            expseg    .001,.01,1.3,.2-.01,.001
;k2            expseg    .001,.03,1.3,p3-.03,.001
 k2            expseg    .001,.03,1.3,.2-.03,.001
k1             =         k1*k2
k3             randi     3,3.7
k4             randi     3,4,.1
;k5            line      5,p3,2
 k5            line      5,.2,2
;k6            line      8,p3,4
 k6            line      8,.2,4
;k7            line      3,p3,5.5
 k7            line      3,.2,5.5
k8             oscil     6,k5,1
k9             oscil     4,k6,1
k10            oscil     9,k7,1
;a1            oscili    1,i1+k8,p7
 a1            oscili    1,knote+k8,3
;a2            oscili    1,i1+k3+k9,p7
 a2            oscili    1,knote+k3+k9,3
;a3            oscili    1,i1+k4+k10,p7
 a3            oscili    1,knote+k4+k10,3
;a1            =         (a1+a2+a3)*(k1*p5)
 a1            =         (a1+a2+a3)*(k1*7000)
;ga1           =         a1*p6
 a1            =         a1*.2
;ga2           =         a1*(1-p6)
 a2            =         a1*(1-.2)
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
