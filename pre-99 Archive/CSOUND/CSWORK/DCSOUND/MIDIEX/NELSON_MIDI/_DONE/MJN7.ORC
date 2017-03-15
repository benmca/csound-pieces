sr             =         44100
kr             =         4410
ksmps          =         10
nchnls         =         2

massign        1,1

instr          1

inote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc,0,3,.01

i1             =         inote
k1             linseg    0,3/2,2500,3/2,0
k9             rand      .75,10
k10            oscil     2500/10,1.5+k9,1              ;TREMELO
a1             gbuzz     k1+k10,i1,2,2,0,4

               outs      a1*kgate,a1*kgate
               endin
