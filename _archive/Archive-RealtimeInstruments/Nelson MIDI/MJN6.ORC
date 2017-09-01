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
k1             linseg    0,3/4,2000,3/2,2000*.9,3/4,0       ;ENV
a1             oscili    1,i1*.9983,3
a2             oscili    1,i1,3
a3             =         a1*a2
a1             =         a3*k1
               outs      a1*kgate,a1*kgate
               endin
