from __future__ import print_function
import ctcsound
from itemstream import notetypes, streammodes
from thuja.notegenerator import Line, NoteGenerator, NoteGeneratorThread
from thuja.itemstream import streammodes, notetypes, Itemstream
import thuja.csound_utils as cs_utils
from thuja.streamkeys import keys

import thuja.utils as utils
import random
from collections import OrderedDict

import os
rhythms = 'q q s e s s e s q e. e q e s'.split()
indexes = [0.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.903, 4.242, 4.894, 5.236, 5.404]
# rhy_to_idx = Itemstream(mapping_keys=[keys.rhythm, keys.index], mapping_lists=[rhythms, indexes])
# rhy_to_idx.tempo = 100

def post_process(note):
    indx = g.context['indexstream'].get_next_value()
    item = g.context['tuplestream'].values[indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], g.context['tuplestream'].tempo)*2
    note.pfields[keys.index] = item[keys.index]


def calc_endx(note):
    position = indexes.index(note.pfields[keys.index])
    if position < len(indexes)-1:
        note.pfields['origdur'] = indexes[position+1]-indexes[position]


def calc_pitch(note):
    origtem = (60*(1/(.697-.018)))
    note.pfields[keys.frequency] = g.context['tuplestream'].tempo / origtem


g = (
    Line().with_instr(1)
        .with_duration(lambda note:note.rhythm)
        .with_amps(.5)
        .with_freqs(lambda note: g.streams[keys.rhythm].tempo / (60*(1/(.697-.018))))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

rhythms = 'q q s e s s e s q e. e q e s'.split()
indexes = [0.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.903, 4.242, 4.894, 5.236, 5.404]
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index], mapping_lists=[rhythms, indexes], tempo=100)
g.rhythms(Itemstream('s s e q'.split(), notetype=notetypes.rhythm, streammode=streammodes.heap, tempo=100)).index(Itemstream(indexes)).pan(45).amps(.75)
g.context['indexstream'] = Itemstream(list(range(0,13)), streammode=streammodes.heap)

g.note_limit=0
g.time_limit = 1000
g.start_time = 0
g.post_processes=[  calc_endx]

g.generate_notes()



cs = cs_utils.init_csound_with_orc(['-odac1', '-+rtaudio=CoreAudio'],
                                   "/Users/ben/src/csound-pieces/_archive/2015/jam/jam.orc",
                                   True,
                                   None)

cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")

cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(g, cs, cpt)
t.daemon = True
t.start()
#
#
# g.rhythms(Itemstream(['e'], notetype=notetypes.rhythm))
# g.freqs(lambda note: g.streams[keys.rhythm].tempo / (60*(1/.697)))
# t.gen()