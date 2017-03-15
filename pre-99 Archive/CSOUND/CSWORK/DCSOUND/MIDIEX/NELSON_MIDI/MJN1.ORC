ssr            =         44100
kr             =         4410
ksmps          =         10
nchnls         =         2

massign        1,1

instr          1

inote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc,0,2,.01

i1             =         inote
k1             expseg    .001,.01,1.3,3-.01,.001
k2             expseg    .001,.03,1.3,3-.03,.001
k1             =         k1*k2
k3             randi     3,3.7
k4             randi     3,4,.1
k5             line      5,3,2
k6             line      8,3,4
k7             line      3,3,5.5
k8             oscil     6,k5,1
k9             oscil     4,k6,1
k10            oscil     9,k7,1
a1             oscili    1,i1+k8,3
a2             oscili    1,i1+k3+k9,3
a3             oscili    1,i1+k4+k10,3
a1             =         (a1+a2+a3)*(k1*7000 )
               outs      a1*kgate,a1*kgate
               endin
