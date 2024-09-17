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


def freq_to_file(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1

    pass

def freq_to_file_disperse_octaves(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        pc_notation = utils.freq_to_pc(note.pfields[key.frequency], True)
        if float(note.pfields[key.frequency]) <= float(utils.pc_to_freq("g5", "1")["value"]):
            pc_notation = pc_notation[:-1]+str(random.randint(2,5))
        else:
            pc_notation = pc_notation[:-1]+str(random.randint(2,4))

        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + pc_notation + '-p5.wav' + '"')

        note.pfields[key.frequency] = 1

    pass

def cycle_by_intervals(note, context):

    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        pc_notation = utils.freq_to_pc(note.pfields[key.frequency], True)
        if float(note.pfields[key.frequency]) <= float(utils.pc_to_freq("g5", "1")["value"]):
            pc_notation = pc_notation[:-1]+str(random.randint(2,5))
        else:
            pc_notation = pc_notation[:-1]+str(random.randint(2,4))

        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + pc_notation + '-p5.wav' + '"')

        note.pfields[key.frequency] = 1

    pass

a = (
    BasicLine().with_rhythm(Itemstream('e e e w+w w+w'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps(.5)
        .with_pitches(Itemstream('e3 fs g a r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10 30 60 80 80'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05)
)

a.post_processes = [freq_to_file_disperse_octaves]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .01)
a.time_limit = 45

b = (
    BasicLine().with_rhythm(Itemstream('q h q. q. q h+h.'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=([120]*12+[180]*18+[60]*6)))
        .with_duration(2)
        .with_amps([.25]*3+[.6]*5)
        .with_pitches(Itemstream([['e2', 'e3', 'e4'], 'r', ['e2','g5','b4'], ['e2','d5','b4'], ['e2','fs5','b4'], 'r'] +
                                 [['e2', 'e3', 'e4'], 'r', ['e2','fs5','b4'], ['e2','a5','b4'], ['e2','g5','b4'], 'r']
                                 , notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(lambda x: np.random.random() * 90)
        .with_dist(10)
        .with_percent(.05)
)

b.post_processes = [freq_to_file]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .01)
b.set_stream('rel', .01)
b.time_limit = 45


c = (
    BasicLine().with_rhythm(Itemstream(['w+w'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps(.5)
        .with_pitches(Itemstream(['e2', 'fs3', 'gs4', 'as5'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.05)
)

c.post_processes = [freq_to_file]
c.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
c.set_stream('atck', .01)
c.set_stream('rel', .01)
c.time_limit = 45
c.context["interval"] = 3


a.add_generator(b)

# a.add_generator(c)
a.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
# print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("simple-index-247.orc", a, silent=True, args_list=['-o248.wav', '-W'])
