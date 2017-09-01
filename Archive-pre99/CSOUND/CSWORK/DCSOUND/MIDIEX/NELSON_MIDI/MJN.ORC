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
                                                                 ;LONG OR SHORT CHEBY VARIANT
k1             linen     .5,3*.4,3,5*.2                          ;DRIVING OSCIL ENV
k2             line      1,3,.5
k1             =         k2*k1
k10            expseg    .0001,3/20,7500,.85*3,7500*.8,3,.0001   ;AMP ENV
a1             oscili    k1,i1,3
a2             tablei    a1,32,1,.5                              ;TABLES A1 TO FN13, OTHERS NORMALIZE
a3             balance   a2,a1
a4             comb      a3,1,1/i1
a5             =         ((a3*.15)+(a4*.25))*k10
               outs      a5*kgate,a5*kgate
               endin






