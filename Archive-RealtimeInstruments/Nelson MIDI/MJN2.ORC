sr             =         44100
kr             =         4410
ksmps          =         10
nchnls         =         2

massign        1,1

instr          1

inote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc,0,1,.01

i1             =         inote
k1             expseg    1,.05,1,3-.05,1.35                           ;GLISS UP

a1             oscili    1,i1*k1,8
k5             expseg    .00001,.03,15000,.02,15000,3-.05,.00001      ;ENV AMP
k6             linseg    1,.05,1,3-.05,2.5
k5             =         k5*k6
a1             =         a1*k5
               outs      a1*kgate,a1*kgate
               endin
