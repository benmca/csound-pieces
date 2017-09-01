<Cabbage>

form size(200, 50), caption("Test"), pluginID("Test")

checkbox bounds(7,7, 60, 15), text("Write"), channel("WRITE"), value(0)

</Cabbage>

<CsoundSynthesizer>

<CsOptions>

-n -d ;-+rtmidi=asio -M0 --midi-key=4 --midi-velocity-amp=5

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2

0dbfs = 1

instr 1

;grab path to current .csd file
Spath chnget "CSD_PATH"
;concat path with name of file
SFilename strcat Spath, "/table.txt"

kwrite chnget "WRITE"
kwrite1 trigger kwrite, 1, 2
ftsavek SFilename, kwrite1, 1, 1000
kwriteoff = 0
chnset kwriteoff, "WRITE"

endin

</CsInstruments>

<CsScore>

f 0 3600

f 1000 0 8 -2 1 2 4 8 16 32 64 128

i 1 0 3600

</CsScore>

</CsoundSynthesizer>