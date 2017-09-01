
import csnd6
import os
# from Tkinter import *
# from ttk import *

os.environ["OPCODE6DIR64"] =  "/Library/Frameworks/CsoundLib64.framework/Versions/6.0/Resources/Opcodes64"
# create & compile instance
cs = csnd6.Csound()
cs.Compile("ex.csd")

# create the thread object
perf = csnd6.CsoundPerformanceThread(cs)

# play
perf.Play()

# root = Tk()
# w = Label(root, text="Hello, world!")
# w.pack()
# root.mainloop()