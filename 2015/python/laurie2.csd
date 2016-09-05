<CsoundSynthesizer>
<CsOptions>
-odac0 -b256 -B256  -M1 
</CsOptions>
<CsInstruments>
/*
x Add output to midi, so you can link to ableton

Add duration array for rhythmic mix up

Think about phrases, and instruct the computer to take a long pauses between phrases that it spits back out


Per Lori's first piece, add control messages to increase/decrease array size, apply serial procedures to array such as retrograde, inversion augmentation, diminution


Tempo control

UI - start with python, showing contents of arrays


Map in pitch recognition for guitar
*/

sr=44100
kr=4410
ksmps=10
nchnls=1
pyinit

pyruni {{
import random


random.seed()
class PitchQueue:
    curdx = 0;

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


pitches = PitchQueue()

}}



instr 1
ktrig init 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000
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
if (ktrig == 0) goto contin
kfreq 	pycall1		"pitches.get_next_pitch", 0
		event 		"i", 10, 0, .25, iamp, kfreq
		event 		"i", 2, idur, .25
ktrig = 0
contin:
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

</CsInstruments>
<CsScore>
;f 1  0  256  -17   0  0  
f0 3600
f1 0 16384 10 1 
i2 0 1
e
</CsScore>
</CsoundSynthesizer>