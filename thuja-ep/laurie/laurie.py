
import ctcsound
#from Tkinter import *
#from ttk import *



# create & compile instance
cs = ctcsound.Csound()
cs.compileCsd("laurie2.csd")
cs.st

# create the thread object
perf = ctcsound.CsoundPerformanceThread(cs)
# set the callback
#perf.SetProcessCallback(tes.callb, None)

# play
perf.Play()

#root = Tk()

#w = Label(root, text="Hello, world!")
#w.pack()

#root.mainloop()