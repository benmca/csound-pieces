from thuja.itemstream import Itemstream
from thuja.generator import BasicLine
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
from thuja.generator import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils
from collections import OrderedDict
import numpy as np
import random
import time


def post_process(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1

    pass


a = (
    BasicLine().with_rhythm(Itemstream('e e e w+w w+w'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps(.8)
        .with_pitches(Itemstream('e3 fs g a r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10 30 60 80 80'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.1)
)

a.post_processes = [post_process]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .01)
a.time_limit = 45

b = (
    BasicLine().with_rhythm(Itemstream('q h q. q. q h+h.'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps([.6, .6, .6, .8, .8, .8, .8, .8])
        .with_pitches(Itemstream([['e2', 'e3', 'e4'], 'r', 'e2', 'e2', 'e2', 'r'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(lambda x: np.random.random() * 90)
        .with_dist(10)
        .with_percent(.05)
)

b.post_processes = [post_process]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .01)
b.set_stream('rel', .01)
b.time_limit = 45

a.add_generator(b)

a.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
# print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("simple-index-247.orc", a, silent=True, args_list=['-odac3', '-W'])
