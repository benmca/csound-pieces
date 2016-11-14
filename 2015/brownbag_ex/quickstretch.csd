<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>
sr=44100
kr=441
nchnls=1


instr 1

kamp init 8000


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
ktimewarp line 0, p3, 14
itimemode = 1

a1 sndwarp kamp, ktimewarp, kresample, ifn1, ibeg, iwsize, irandw, ioverlap, ifn2, itimemode
out a1
endin

</CsInstruments>
<CsScore>
f 1 0 16777216 1 "gtr.wav" 0 0 0 
f 2 0 16384 9 0.5 1 0

i1 0 1400
e
</CsScore>
</CsoundSynthesizer>
