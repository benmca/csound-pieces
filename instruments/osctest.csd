<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in
-odac           -iadc    ;;;RT audio I/O
</CsOptions>
<CsInstruments>
  sr = 44100
  ksmps = 100
  nchnls = 2

  gihandle OSCinit 8000

  instr   1
    kf1 init 0
    kf2 init 0
;nxtmsg:
    printks "checking...", .1
;    kk  OSClisten gihandle, "/ping", "ff", kf1, kf2
    kk  OSClisten gihandle, "/1/faderA", "f", kf1
if (kk == 0) goto ex
    printks "got it\n", .1
    printk 0,kf1
;    printk 0,kf2
;    kgoto nxtmsg
ex:
  endin
        

</CsInstruments>
<CsScore>
i1 0 3600
e
</CsScore>
</CsoundSynthesizer>
