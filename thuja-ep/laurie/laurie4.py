import csnd6
from Tkinter import *
from ttk import *
import random
from thuja.itemstream import Itemstream



orc = """
sr=44100
kr=441
nchnls=1

pyinit

pyruni {{
import random
from thuja.itemstream import Itemstream

random.seed()
class PitchQueue:
    curdx = 0;
    rhythm_stream = Itemstream(['s','s','s', 's', '32', '32', '32', '32'],'heap', tempo=60)
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
        #print 'enqueue: ' + str(item) + ', items: ' + str(self.items)

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
            indx = self.curdx % len(self.items)
            x = self.items[indx]
        self.curdx = self.curdx + 1
        return x
    def get_next_dur(self, arg):
        dur = self.rhythm_stream.get_next_value()
        return dur
    def reverse(self,arg):
        self.items.reverse()


pitches = PitchQueue()
}}


instr 1
ktrig init 1
ifreq 	cpsmidi
iamp 	ampmidi 	10000
if (ktrig == 0) goto contin
		;printks 	"new note", .01
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
kfreq   pycall1     "pitches.get_next_pitch", 0
kdur   pycall1     "pitches.get_next_dur", 0
		event 		"i", 10, 0, .25, iamp, kfreq
		event 		"i", 2, kdur, .25
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

"""

sco = """
f0 3600
f1 0 16384 10 1 
i2 0 1
"""


# create & compile instance
cs = csnd6.Csound()
cs.SetOption("-odac0")
cs.SetOption("-b128")
cs.SetOption("-B1024")
cs.SetOption("-M1")
cs.SetOption("--m-amps=0")
cs.CompileOrc(orc)
cs.ReadScore(sco)
cs.Start()
cs.Perform()
cs.Stop()
