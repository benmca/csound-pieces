sr             =              44100
kr             =              4410
ksmps          =              10
nchnls         =              2

massign        1,1

instr          1

inote          cpsmidib
iveloc         ampmidi 1
kgate          linenr         iveloc,0,1,.01

i1             =              inote
k100           randi          1,10
k101           oscili         i1/65,5+k100,1
k102           linseg         0,.5,1,3-.5,1
k100           =              i1+(k101*k102)
k1             linen          .5,3*.4,3,3*.2                ;DRIVING OSCIL ENV
k2             line           1,3,.5
k1             =              k2*k1

     
k10            linseg         0,.03,7500,.04,7500,.03,7500*.3,3-.15,7500*.3,.05,0         ;AMP ENV
k20            linseg         1.4,.03,1.7,.04,1.7,.03,1.4,3-.1,1.385  ;POWER TO PARTIALS
    
a1             oscili         k1,k100-.025,3
a2             tablei         a1,31,1,.5                    ;TABLES A1 TO FN13, OTHERS NORMALIZE
a3             balance        a2,a1
a4             foscil         1,k100+.04,1,2.005,k20,1      ;TRY OTHER FN AS WELL
a5             oscili         1,k100,1
a6             =              ((a3*.1)+(a4*.1)+(a5*.8))*k10
a7             comb           a6,.5,1/i1
a6             =              (a6*.9)+(a7*.1)
               outs           a6*kgate,a6*kgate
               endin
