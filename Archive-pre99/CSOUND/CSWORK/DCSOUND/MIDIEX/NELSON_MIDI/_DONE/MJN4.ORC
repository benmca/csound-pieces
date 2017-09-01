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
k1             expseg    .0001,.05,15000,3-.05,.0001             ;ENV
k2             linseg    1.69,.1,1.75,3-.1,1.69                  ;POWER TO PARTIALS
a1             foscil    k1,i1,1,2.01,k2,1
               outs      a1*kgate,a1*kgate
               endin

