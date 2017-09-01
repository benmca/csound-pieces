nchnls         =         2


instr          1              ;FINGER CYMBALS WHEN HIGH F, LOWER PITCHES INTERESTING TOO
                              ;P4=PCH P5=AMP P6=CHNL1AMP

knote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc*.05, 0, .2, .01
                                          
;i1            =         cpspch(p4)
 i1            =         cpspch(8.01)
;k1            expseg    .0001,.05,p5,p3-.05,.0001          ;ENV
 k1            expseg    .0001,.05,6300,.18-.05,.0001
;k2            linseg    1.69,.1,1.75,p3-.1,1.69            ;POWER TO PARTIALS
 k2            linseg    1.69,.1,1.75,.18-.1,1.69
a1             foscil    k1,i1,knote,knote*2.01,k2,1
;ga1           =         a1*p6
 a1            =         a1*31
;ga2           =         a1*(1-p6)
 a2            =         a1*31
               ;outs     ga1,ga2
               outs      a1*kgate, a2*kgate
               endin
