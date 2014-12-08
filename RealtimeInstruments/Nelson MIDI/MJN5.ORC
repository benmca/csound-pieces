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
k1             linseg    0,3/2,5000,3/2,0              ;ENV
k2             randi     2,25
k3             oscil     .03,4+k2,1                    ;RAND TREM
a1             gbuzz     .33+k3,i1,2.5,1,50,4
k4             randi     1.2,15
k5             oscil     .03,4+k2,1                    ;RAND TREM
a2             gbuzz     .33+k5,i1+(i1*.02),2.5,1,50,4
k6             randi     1.5,20
k7             oscil     .03,4+k2,1                    ;RAND TREM
a3             gbuzz     .33+k7,i1-(i1*.021),2.5,1,50,4
a4             =         (a1+a2+a3)*k1
               outs      a4*kgate,a4*kgate
    ga1        =         a4*kgate
    endin
