
import csnd6
from Tkinter import *
from ttk import *
import random
from composition import itemstream



orc = """
sr=44100
kr=4410
ksmps=10
nchnls=1

pyinit

pyruni {{
import random
from composition import itemstream

random.seed()
class PitchQueue:
    curdx = 0;
    rhythm_stream = itemstream.itemstream(['s','s.','e', 'e.'],'random', tempo=120)
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
kfreq   pycall1     "pitches.get_random_pitch", 0
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
cs.CompileOrc(orc)
# cs.ReadScore(sco)
cs.Start()


# create the thread object
perf = csnd6.CsoundPerformanceThread(cs)

# set the callback
# perf.SetProcessCallback(tes.callb, None)

# play
perf.Play()


class Application(Frame):

    def __init__(self,master=None):
        master.title("Csound API GUI Example")
        self.items = []
        self.notes = []
        Frame.__init__(self,master)
        self.pack()
        self.createUI()
        self.master.protocol("WM_DELETE_WINDOW", self.quit)

    def createUI(self):
        self.size = 600
        self.canvas = Canvas(self,height=self.size,width=self.size,bg="darkgray")
        self.canvas.pack()
        # create button and setup the playNote() callback
        self.button = Button(self.canvas, text='Play Note', command=self.playNote)    
        self.button.pack()

    def playNote(self):
    	pass
        # perfThread.InputMessage("i1 0 2 .5 400 .25")

    def quit(self):
        self.master.destroy()
        perf.Stop()
        perf.Join()


app = Application(Tk())
app.mainloop()


# perf.Join()

# cs.Stop()
