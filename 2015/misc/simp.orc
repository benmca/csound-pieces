sr      =       44100 
ksmps   =       10
nchnls  =   2

    instr 1         ;simple WAVEGUIDE
kcps = cpsmidinn(p4)   ;convert from midi note number to cycles per second
icps = cpsmidinn(p4)
a1  pluck   p5, kcps, icps, 0, 1
    outs a1, a1
    endin

    instr 2

kcps = cpsmidinn(p4) ;convert from midi note number to cycles per second
kenv adsr .1, .1, .7, .2
aout oscil kenv*p5, kcps, 1
outs aout, aout

    endin
