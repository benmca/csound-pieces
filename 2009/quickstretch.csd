<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>
sr=44100
kr=441
nchnls=2


instr 1

kamp init 8000

; Start at 1 second and end at 3.5 seconds.
ktimewarp line 0, p3, 300

; Playback at the normal speed.
kresample init 1

; Use the audio file defined in Table #1.
ifn1 = 1
ibeg = 0
iwsize = 4410
irandw = 882
ioverlap = 15
; Use Table #2 for the windowing function.
ifn2 = 2

; Use the ktimewarp parameter as a "time" pointer.
itimemode = 1

a1,a2 sndwarpst kamp, ktimewarp, kresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode
outs a1,a2
endin

</CsInstruments>
<CsScore>
f 1 0 16777216 1 "c:\\gtr_bass.wav" 0 0 0 
f 2 0 16384 9 0.5 1 0

i1 0 3600
e
</CsScore>
</CsoundSynthesizer>
