<CsoundSynthesizer>
<CsOptions>
-odac0 -b256 -B256  -M1 
</CsOptions>
<CsInstruments>

sr=44100
kr=4410
ksmps=10
nchnls=1
pyinit

pyruni {{
import random
random.seed()
class PitchQueue:
    def __init__(self):
        self.items = []
        self.max_size = 8

    def isEmpty(self):
        return self.items == []

    def enqueue(self, item):
        if len(self.items) >= self.max_size:
            self.dequeue()
        self.items.insert(0, item)
        print 'enqueue: ' + str(item) + ', items: ' + str(self.items)

    def dequeue(self):
        return self.items.pop()

    def size(self):
        return len(self.items)

    def get_random_pitch(self, arg):
        x = 0.0
        if len(self.items) > 1:
            x = self.items[random.randint(0, len(self.items) - 1)]

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
kfreq 	pycall1		"pitches.get_random_pitch", 0
		event 		"i", 10, 0, .25, iamp, kfreq
		event 		"i", 2, idur, .25
ktrig = 0
contin:
endin

instr 10
inote = p5
iveloc = 10000
kenv 	linen 		1, .01, p3, .1
aout 	oscil 		kenv*iveloc, inote, 1
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