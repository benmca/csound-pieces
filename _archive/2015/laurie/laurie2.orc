
sr=44100
kr=4410
ksmps=10
nchnls=1
pyinit

pyruni {{
import random
from thuja import itemstream

random.seed()
class PitchQueue:
    curdx = 0;
    rhythm_stream = itemstream.itemstream(['e', 'q', 's', 'q'],'heap', tempo=120)
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
    def reverse(self,arg):
        self.items.reverse()


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
