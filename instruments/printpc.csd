<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in   No messages  MIDI in
-odac           -iadc     -d         -M0  --m-amps=0 ;;;RT audio I/O with MIDI in
; For Non-realtime ouput leave only the line below:
; -o pchmidi.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1
pyinit

pyruni {{
import thuja.utils

pitches = []

def printpc(midinote):
    pitches.append(thuja.utils.midi_note_to_pc(int(midinote)))
    print pitches
}}

; Instrument #1.
instr 1
  imidinote notnum
  pycalli "printpc", imidinote

    idur = 1
    iamp = 10000
ifreq pycall1i "thuja.utils.midinote_to_freq", imidinote

    kamp    linen   iamp, idur*.1, idur, idur*.4
    acar    oscili  kamp, ifreq, 1

    out acar
endin


</CsInstruments>
<CsScore>

;Dummy f-table to give time for real-time MIDI events
f1 0 16384 10 1
f 0 8000
e


</CsScore>
</CsoundSynthesizer>
