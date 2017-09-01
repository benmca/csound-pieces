<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr       = 44100
kr       = 4410
ksmps    = 10
nchnls   = 1

instr    1 ; Random interpolation between 8 waveforms

ilevl    = p4*32767   ; Output level
ipitch   = cpspch(p5) ; Pitch
irate    = p6         ; Random rate
idet     = p7         ; Detune
ipitch   = ipitch + idet
iseed    = rnd(1)

kdclick  linseg  0, .002, 1, p3 - .004, 1, .002, 0
krnd     randi  .5, irate, iseed
krnd     = krnd + .5
krnd1    tablei  krnd, 50, 1, 0, 1
krnd2    tablei  krnd, 50, 1, .125, 1
krnd3    tablei  krnd, 50, 1, .250, 1
krnd4    tablei  krnd, 50, 1, .375, 1
krnd5    tablei  krnd, 50, 1, .500, 1
krnd6    tablei  krnd, 50, 1, .625, 1
krnd7    tablei  krnd, 50, 1, .750, 1
krnd8    tablei  krnd, 50, 1, .875, 1
a1       oscili  krnd1, ipitch, 1, -1
a2       oscili  krnd2, ipitch, 2, -1
a3       oscili  krnd3, ipitch, 3, -1
a4       oscili  krnd4, ipitch, 4, -1
a5       oscili  krnd5, ipitch, 5, -1
a6       oscili  krnd6, ipitch, 6, -1
a7       oscili  krnd7, ipitch, 7, -1
a8       oscili  krnd8, ipitch, 8, -1
aout     sum  a1, a2, a3, a4, a5, a6, a7, a8
out      aout*kdclick*ilevl

endin

</CsInstruments>
<CsScore>
f01 0 1024 10 10
f02 0 1024 10 10 9
f03 0 1024 10 10 0 8
f04 0 1024 10 10 0 0 7
f05 0 1024 10 10 0 0 0 6
f06 0 1024 10 10 0 0 0 0 5
f07 0 1024 10 10 0 0 0 0 0 4
f08 0 1024 10 10 0 0 0 0 0 0 3

f50 0 4096 -7 1 512 0 3072 0 512 1

;     Strt  Leng  Levl  Pitch Rate  Detune
i01   0.00  4.00  0.25  07.00 8.00  0.00
i01   .     .     .     .     9.00  0.30
i01   .     .     .     .     11.0  0.50
i01   .     .     .     .     7.00  0.80
e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>1610612736</width>
 <height>1610612736</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>0</r>
  <g>0</g>
  <b>0</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {0, 0, 0}
</MacGUI>
