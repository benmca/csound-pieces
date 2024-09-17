from __future__ import print_function

import ctcsound

from thuja.itemstream import Itemstream
from thuja.generator import BasicLine
from thuja.generator import Generator, GeneratorThread
from thuja.generator import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
from collections import OrderedDict
import numpy as np
import copy
import random
import time
import threading



def add_env_streams(c, atck=.01, rel=.01):
    c.set_stream('atck', atck)
    c.set_stream('rel', rel)


container = (
    BasicLine().with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(.25)
        .with_amps(1)
        .with_pitches(Itemstream(['g4'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(container)

container.time_limit = 1000
container.generate_notes()

# reverb_time = 10
# container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']


cs = cs_utils.init_csound_with_orc(['-odac0', '-W', '-+rtaudio=CoreAudio'],
                                   "/Users/ben/src/csound-pieces/thuja-ep/1min-cs/226.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = GeneratorThread(container, cs, cpt)
t.daemon = True
t.start()

# container.with_rhythm(Itemstream(['q','e','e','e'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
#
# time.sleep(100)
# t.stop_event.set()
# t.join()
#
# cpt.stop()
# cpt.join()
# cs.reset()
