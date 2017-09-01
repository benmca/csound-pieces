sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 1

instr    1 ; MN3011 BBD Reverb

ilevl    = p4   ; Output level
idelay   = p5/4 ; Delay factor
ifdbk    = p6   ; Feedback
iecho    = p7   ; Reverb amount

afdbk    init 0

ain      soundin  "Marimba.aif"

ain      = ain + afdbk*ifdbk

atemp    delayr  1
atap1    deltapi .0396*idelay
atap2    deltapi .0662*idelay
atap3    deltapi .1194*idelay
atap4    deltapi .1726*idelay
atap5    deltapi .2790*idelay
atap6    deltapi .3328*idelay
         delayw  ain

afdbk    butterlp  atap6, 7000
abbd     sum  atap1, atap2, atap3, atap4, atap5, atap6

abbd     butterlp  abbd, 7000

out      (ain + abbd*iecho)*ilevl

endin
