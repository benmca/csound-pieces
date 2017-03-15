
sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

          instr     5

insnd     =         p4

gasig     diskin    insnd, 1

          endin

          instr     10

imax      =          1
idel1     =          p4
igain1    =         p5
idel2     =         p6
igain2    =         p7
idel3     =         p8
igain3    =         p9
idel4     =         p10
igain4    =         p11
idel5     =         p12
igain5    =         p13
idel6     =         p14
igain6    =         p15

afdbk     init      0

aout1     nestedap  gasig+afdbk*.4, 3, imax, idel1, igain1, idel2, igain2, idel3, igain3
aout2     nestedap  aout1, 2, imax, idel4, igain4, idel5, igain5
aout      nestedap  aout2, 1, imax, idel6, igain6
afdbk     butterlp  aout, 1000

          outs      gasig+(aout+aout1)/2, gasig-(aout+aout1)/2
gasig     =         0


          endin

          instr     20

ksv       =         p4
krv       =         p5
kbv       =         p6

ax, ay, az lorenz ksv, krv, kbv, .01, .6, .6, .6, 1

          outs      ax*1000, ay*1000

          endin

          instr     30

iamp      =         p4
ifqc      =         cpspch(p5)

kfco      linseg    300, .1, 2000, .2, 700, p3-.3, 600

ax        vco       1, ifqc, 2, 1, 1, 2/ifqc
ay        moogvcf   ax, kfco, 2, 2

          outs      ay*iamp, ay*iamp

          endin


