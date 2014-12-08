<CsoundSynthesizer>
<CsInstruments>
/* octmidi.orc */
/* Written by Kevin Conder */
; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

; Instrument #1.
instr 1
  i1 octmidi

  print i1
iNum    notnum

; Convert MIDI note number to Hz
iHz     = (440.0*exp(log(2.0)*((iNum)-69.0)/12.0))

; Generate audio by indexing a table; fixed amplitude.
aosc    oscil   10000, iHz, 1

; Since there is no enveloping, there will be clicks.
        outs    aosc, aosc
endin
/* octmidi.orc */
</CsInstruments>
<CsScore>        
/* octmidi.sco */
/* Written by Kevin Conder */
; Play Instrument #1 for 12 seconds.
;sine
f 1 0 16384 10 1

;saw
f 2 0 256 7 0 128 1 0 -1 128 0
;pulse?
f 3 0 256 7 1 128 1 0 -1 128 -1
i 1 0 3600
e
</CsScore>        
</CsoundSynthesizer>
