sr      = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
zakinit  30, 30
gaecho   init 0
;----------------------------------------------------------------------------------
instr    1 ; Disk Input Mono
ilevl    = p4 ; Output level
iout     = p5 ; Out
a1       soundin  "Marimba.aif"
zaw      a1*ilevl, iout
endin
;----------------------------------------------------------------------------------
instr    2 ; Disk Input Stereo
ilevl    = p4 ; Output level
iout1    = p5 ; Out 1
iout2    = p6 ; Out 2
a1, a2   soundin  "AllOfMeStereo.aif"
zaw      a1*ilevl, iout1
zaw      a2*ilevl, iout2
endin
;----------------------------------------------------------------------------------
instr    4 ; Ring Modulator with Osc
ilevl    = p4 ; Output level
in1      = p5 ; In
iout1    = p6 ; Out
ifreq1   = p7 ; Start frequency
ifreq2   = p8 ; End frequency
iwave    = p9 ; Waveform
k1       expseg  ifreq1, p3, ifreq2
ain      zar  in1
a2       oscili  1, k1, iwave
zaw      ain*a2*ilevl, iout1
endin
;----------------------------------------------------------------------------------
instr    5 ; S+H Using 'Reson' Filter
ilevl    = p4/200
in1      = p5
iout1    = p6
ifreq    = p7
idpth    = p8/2
irate    = p9
iseed    = p10
k1       randh  idpth, irate, iseed
k1       = k1 + idpth
ain      zar  in1
ares     reson  ain, ifreq + k1, (ifreq + k1)/16
zaw      ares*ilevl, iout1
endin
;----------------------------------------------------------------------------------
instr    6 ; Moog VCF with LFO
ilevl    = p4  ; Output level
in1      = p5  ; In
iout1    = p6  ; Out
ifreq    = p7  ; Freq
idepth   = p8  ; LFO depth
irate    = p9  ; LFO rate
iwave    = p10 ; LFO waveform
irez     = p11 ; Resonance
ain      zar  in1
alfo     oscili  idepth, irate, iwave
alfo     = alfo + idepth
avcf     moogvcf  ain, ifreq + alfo, irez, 32767
zaw      avcf*ilevl, iout1
endin
;----------------------------------------------------------------------------------
instr    7 ; Moog VCF with Envelope Follower.
ilevl    = p4 ; Output level
in1      = p5 ; In
iout1    = p6 ; Out
idepth   = p7 ; Sweep depth
irez     = p8 ; Resonance
ain      zar  in1
a2       follow  ain, .025
a3       butterlp  a2, 25
avcf     moogvcf  ain, (a3/8)*idepth, irez, 32767
zaw      avcf*ilevl, iout1
endin
;----------------------------------------------------------------------------------
instr    8 ; Flanger
ilevl    = p4      ; Output level
in1      = p5      ; In
iout     = p6      ; Out
idelay   = p7/1000 ; Delay in ms
irate    = p8      ; LFO rate
idepth   = p9/2000 ; LFO depth in ms
iwave    = p10     ; LFO waveform
ifdbk    = p11     ; Feedback
idry     = p12     ; Dry signal level
imax     = (idelay + idepth)*2
ain      zar  in1
alfo     oscili  idepth, irate, iwave
alfo     = alfo + idepth
aflng    flanger  ain, alfo + idelay, ifdbk, imax
aout     = (ain*idry + aflng)*ilevl
zaw      aout, iout
endin
;----------------------------------------------------------------------------------
instr     9 ; 'Reson' filter bank
ilevl    = p4/1000                        ; Output level
in1      = p5                             ; In
iout1    = p6                             ; Out
ipitch1  = (p7 < 20 ? cpspch(p7) : p7)    ; Filter 1 freq
ipitch2  = (p8 < 20 ? cpspch(p8) : p8)    ; Filter 2 freq
ipitch3  = (p9 < 20 ? cpspch(p9) : p9)    ; Filter 3 freq
ipitch4  = (p10 < 20 ? cpspch(p10) : p10) ; Filter 4 freq
ipitch5  = (p11 < 20 ? cpspch(p11) : p11) ; Filter 5 freq
ipitch6  = (p12 < 20 ? cpspch(p12) : p12) ; Filter 6 freq
iband    = p13                            ; Filter bandwidth
ain      zar  in1
ares1    reson  ain, ipitch1, iband
ares2    reson  ain, ipitch2, iband
ares3    reson  ain, ipitch3, iband
ares4    reson  ain, ipitch4, iband
ares5    reson  ain, ipitch5, iband
ares6    reson  ain, ipitch6, iband
aout     = ares1 + ares2 + ares3 + ares4 + ares5 + ares6
zaw      aout*ilevl, iout1    
endin
;----------------------------------------------------------------------------------
instr    99 ; Stereo Output
ilevl    = p4
in1      = p5
in2      = p6
kdclik   linseg 0, .002, ilevl, p3-.004, ilevl, .002, 0
a1       zar  in1
a2       zar  in2
outs     a1*kdclik, a2*kdclik
zacl     1, 30
endin
