<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B1024  -M1 -Q0
</CsOptions>
<CsInstruments>
/*
x Add output to midi, so you can link to ableton

x Add duration array for rhythmic mix up

x apply serial procedures to array such as retrograde, inversion augmentation, diminution

Think about phrases, and instruct the computer to take a long pauses between phrases that it spits back out


 Per Lori's first piece, add control messages to increase/decrease array size, 


Tempo control

UI - start with python, showing contents of arrays


Map in pitch recognition for guitar
*/

sr=44100
kr=4410
ksmps=10
nchnls=1

gk1 init 0
gk2 init 0
gk3 init 0
gk4 init 0

FLpanel "Buttons", 240, 400, 100, 100
    ion = 0
    ioff = 0
    ix = 10
    iy = 10
    ; Type 1
    gk1, iht1 FLbutton "Reverse", ion, ioff, 1, 200, 40, ix, iy + 65, 0, 100, 0, .001, 20
    ; Type 2
    gk2, iht2 FLbutton "Inverse", ion, ioff, 1, 200, 40, ix, iy + 110, 0, 101, 0, .001, 21
    gk3, iht3 FLbutton "half", ion, ioff, 1, 200, 40, ix, iy + 175, 0, 102, 0, .1, 22
    ; Type 2
    gk4, iht4 FLbutton "double", ion, ioff, 1, 200, 40, ix, iy + 240, 0, 103, 0, .1, 23
    ; Type 3
;    gkt3, iht3 FLbutton "3-Check Button", ion, ioff, 3, 200, 40, ix, iy + 155, -1 
    ; Type 4
;    gkt4, iht4 FLbutton "4-Round Button", ion, ioff, 4, 200, 40, ix, iy + 200, -1 
    ; Type 21
;    gkt5, iht5 FLbutton "21-Plastic Button", ion, ioff, 21, 200, 40, ix, iy + 245, -1 
    ; Type 22
;    gkt6, iht6 FLbutton "22-Plastic Light Button", ion, ioff, 22, 200, 40, ix, iy + 290, -1
    ; Type 23
;    gkt7, iht7 FLbutton "23-Plastic Check Button", ion, ioff, 23, 200, 40, ix, iy + 335, -1 
FLpanelEnd
FLrun

; no
pyinit

pyruni {{
import random
import audiolazy

from composition import itemstream

random.seed()
class PitchQueue:
    curdx = 0;
    rhythm_stream = itemstream.itemstream(['e', 'q', 's', 'q', 's', 's', 's'],'heap', tempo=120)
    rhythm_stream.notetype = 'rhythm'

    def __init__(self):
        self.items = []
        self.max_size = 8

    def isEmpty(self):
        return self.items == []

    def enqueue(self, item):
        if len(self.items) >= self.max_size:
            self.dequeue()
        self.items.append(item)
        print 'enqueue: ' + str(item) + ', items: ' + str(self.items)

    def dequeue(self):
        return self.items.pop(0)

    def size(self):
        return len(self.items)

    def get_random_pitch(self, arg):
        x = 0.0
        if len(self.items) > 1:
            x = self.items[random.randint(0, len(self.items) - 1)]
        return x
    def get_next_pitch(self, arg):
        x = 0.0        
        if len(self.items) > 0:
            x = self.items[self.curdx % len(self.items)]
        self.curdx = self.curdx + 1
        return x
    def get_next_dur(self, arg):
        return self.rhythm_stream.get_next_value()
    def reverse(self, arg):
        self.items.reverse()
        print 'reverse'

    def inverse(self, arg):
        new_items = []
        new_items.append(self.items[0])
        for x in range(1, len(self.items)):
            iprev_notenum  = int(audiolazy.freq2midi(self.items[x-1]))
            inotenum = int(audiolazy.freq2midi(self.items[x]))
            delta = iprev_notenum - inotenum
            new_notenum = int(audiolazy.freq2midi(new_items[x-1])) + delta
            new_freq = audiolazy.midi2freq(new_notenum)
            new_items.append(new_freq)
        self.items = new_items
        print self.items

    def half_temp(self, arg):
        self.rhythm_stream.tempo = (self.rhythm_stream.tempo * .5)
        print 'HALF tempo: ' + str(self.rhythm_stream.tempo)

    def double_temp(self, arg):
        self.rhythm_stream.tempo = (self.rhythm_stream.tempo * 2)
        print 'DOUBLE tempo: ' + str(self.rhythm_stream.tempo)

pitches = PitchQueue()

}}



instr 1
ktrig init 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000

; only call once
if (ktrig == 0) goto contin
		printks 	"new note", .01
		pycall		"pitches.enqueue", ifreq
		event 		"i", 10, 0, .5, iamp, ifreq
ktrig = 0
contin:
endin

instr 2
ktrig init 1
idur = .25
iamp = 10000

kdur   pycall1     "pitches.get_next_dur", 0

; only call once
if (ktrig == 0) goto contin
kfreq 	pycall1		"pitches.get_next_pitch", 0
        event       "i", 2, kdur, .25

; if no freq, skip triggering a note
if (kfreq  == 0) goto contin
		event 		"i", 10, 0, kdur, iamp, kfreq
contin:
ktrig = 0
endin

instr 10
ifreq = p5
iveloc = 10000

if_over_220 = ifreq/220
i1 = log(if_over_220)
i2 = log(2.0)
isolution = ( ( 12 * i1 / i2 ) + 57.01 )
inotenum = int(isolution)

        noteondur2  1, inotenum, 127, p3-.1

kenv 	linen 		1, .01, p3, .1
aout 	oscil 		kenv*iveloc, ifreq, 1

		out 		aout
endin

instr 100
ktrig init 1
; only call once
if (ktrig == 0) goto contin
        pycall     "pitches.reverse",0
contin:
ktrig = 0
endin

instr 101
ktrig init 1
; only call once
if (ktrig == 0) goto contin
        pycall     "pitches.inverse",0
contin:
ktrig = 0
endin

instr 102
ktrig init 1
; only call once
if (ktrig == 0) goto contin
        pycall     "pitches.half_temp",0
contin:
ktrig = 0
endin

instr 103
ktrig init 1
; only call once
if (ktrig == 0) goto contin
        pycall     "pitches.double_temp",0
contin:
ktrig = 0
endin

</CsInstruments>
<CsScore>
;f 1  0  256  -17   0  0  
f0 3600
f1 0 16384 10 1 
i2 0 1
e
</CsScore>
</CsoundSynthesizer>