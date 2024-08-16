from thuja.itemstream import Itemstream
from thuja.generator import BasicLine
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


def post_process(note, context):
    # note.pfields['inst_file'] = '"' + '/Users/ben/src/tidal/samples-extra/olalla-birds/' + pitches_to_files[note.pfields['filepitch']] + '"'
    # note.pfields.pop('filepitch')
    # # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'
    # note.pfields[keys.duration] = note.rhythm * note.pfields[keys.duration]
    pass


container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(1)
        .with_amps(1)
        .with_pitches(Itemstream('c4 e g b r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

container.set_stream('atck', .01)
container.set_stream('rel', .01)
container.time_limit = 60
container.with_amps(.25)

a = copy.deepcopy(container).with_pan(10).randomize()
b = copy.deepcopy(container).with_pan(80).randomize()

a.start_time = 4
a.streams[keys.frequency].streammode = streammodes.random
a.streams[keys.rhythm].tempo = 240

b.start_time = 4
b.streams[keys.frequency].streammode = streammodes.random
b.streams[keys.rhythm].tempo = 240

c = copy.deepcopy(container).with_pan(45).randomize()
c.start_time = 8
c.with_rhythm(Itemstream("e s e s e e e e e e".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
c.streams[keys.frequency] = Itemstream("c6 b5 c6 b5 c6 b5 g e c5 b4".split(), notetype=notetypes.pitch, streammode=streammodes.sequence)
c.with_duration([.01]*5+[.05]*5)
c.with_percent(.2)
c.with_amps(.2)

d = copy.deepcopy(c).with_pan(0)
d.streams[keys.rhythm].tempo = 240
d.start_time = 16


e = copy.deepcopy(c).with_pan(90)
e.streams[keys.rhythm].tempo = 240
e.start_time = 16

f = copy.deepcopy(c).with_pan(45)
f.streams[keys.rhythm].tempo = 60
f.start_time = 24
f.with_rhythm(Itemstream("e.".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
f.streams[keys.frequency] = Itemstream("a1 c2 r c e r e g g g r r r ".split(), notetype=notetypes.pitch, streammode=streammodes.sequence)
f.with_duration(lambda note: note.rhythm * .75)
f.with_percent(.2)
f.with_amps(1.5)



container.add_generator(a)
container.add_generator(b)
container.add_generator(c)
container.add_generator(d)
container.add_generator(e)
container.add_generator(f)

container.generate_notes()

reverb_time = 10
container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("226.orc", container, silent=True, args_list=['-odac0', '-W'])
