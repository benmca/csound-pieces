
import csnd6
#from Tkinter import *
#from ttk import *



# create & compile instance
cs = csnd6.Csound()
cs.Compile("laurie2.csd")

# create the thread object
perf = csnd6.CsoundPerformanceThread(cs)

# set the callback
#perf.SetProcessCallback(tes.callb, None)

# play
perf.Play()

#root = Tk()

#w = Label(root, text="Hello, world!")
#w.pack()

#root.mainloop()