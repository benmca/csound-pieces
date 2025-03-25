from thuja.itemstream import Itemstream
from thuja.generator import BasicLine, GeneratorThread
from thuja.itemstream import streammodes, notetypes
from thuja.generator import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import numpy as np
import random
import time
import ctcsound



def freq_to_file(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/single-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '.wav' + '"')
        note.pfields[key.frequency] = 1
    pass

def freq_to_file_5ths(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1
    pass


a = (
    BasicLine().with_rhythm(Itemstream(['w+w'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(1)
        .with_amps(.25)
        .with_pitches(Itemstream([['f2','e3','c4','g4','a4'],['e2','fs3','cs4','fs4','b4']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10 30 45 60 80'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05))

a.post_processes = [freq_to_file]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.time_limit = 45

a2 = a.deepcopy()
(a2.with_rhythm(Itemstream(['w+w'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
 .with_duration(lambda note: note.rhythm)
 .with_amps(.5)
 .with_pitches(Itemstream(['g5', 'ds5', 'c5', 'b4', 'a4', 'gs4', 'f4' ], notetype=notetypes.pitch, streammode=streammodes.sequence))
 .with_pan([45])
 .with_instr([2]))

a2.post_processes = [freq_to_file_5ths]
a2.instr(Itemstream([2]))

b = (
    BasicLine().with_rhythm(Itemstream('e. e. s s s e.+q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=80 ))
        .with_duration(lambda note: note.rhythm*.5)
        .with_amps(1)
        .with_instr([3])
        .with_pan([10, 20, 30, 40, 50, 60, 70, 80])
        .with_dist(10)
        .with_percent(.01)
)

bl = a.deepcopy()
(bl.with_pan([10])
 .with_amps(.1)
 .with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=80 ))
 .with_pitches(Itemstream(['e3']*5+['a3']*5, notetype=notetypes.pitch,
                          streammode=streammodes.sequence))
 .with_duration(lambda note: note.rhythm*.25))
bl.post_processes = [freq_to_file_5ths]


br = a.deepcopy()
(br.with_pan([90])
 .with_amps(.1)
 .with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=80 ))
 .with_pitches(Itemstream(['e3']*3+['a3']*3, notetype=notetypes.pitch,
                          streammode=streammodes.sequence))
 .with_duration(lambda note: note.rhythm*.25))
br.post_processes = [freq_to_file_5ths]


a.add_generator(a2)
a.add_generator(b)
a.add_generator(bl)
a.add_generator(br)
a.generate_notes()

# a2.add_generator(b)
# a2.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("255.orc", a, silent=True, args_list=['-o255.wav', '-W'])
