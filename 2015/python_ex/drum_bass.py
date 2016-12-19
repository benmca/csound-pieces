from composition.generator import Generator
from composition.generator import keys
from composition.itemstream import Itemstream
from collections import OrderedDict
from composition import utils
import copy
import numpy as np
import csnd6
import os
# rhythms = 'q q s e s s e s q e. e q e s'.split()
indexes = [0.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.903, 4.242, 4.894, 5.236, 5.404]
# rhy_to_idx = Itemstream(mapping_keys=[keys.rhythm, keys.index], mapping_lists=[rhythms, indexes])
# rhy_to_idx.tempo = 100

def post_processs(note):
    indx = g.context['indexstream'].get_next_value()
    item = g.context['tuplestream'].values[indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], g.context['tuplestream'].tempo)*2
    note.pfields[keys.index] = item[keys.index]


def calc_endx(note):
    position = indexes.index(note.pfields[keys.index])
    if position < len(indexes)-1:
        note.pfields['origdur'] = indexes[position+1]-indexes[position]


def calc_pitch(note):
    origtem = (60*(1/.697))
    note.pfields[keys.frequency] = g.context['tuplestream'].tempo / origtem

g = Generator(
    streams=OrderedDict([
        (keys.instrument, 1),
        (keys.duration, lambda note: note.rhythm),
        (keys.amplitude, .5),
        (keys.frequency, lambda note: g.streams[keys.rhythm].tempo / (60*(1/.697))),
        (keys.index, 1),
        (keys.pan, 45),
        (keys.distance, 10),
        (keys.percent, .1)
    ]),
    pfields=[
        keys.instrument,
        keys.start_time,
        keys.duration,
        keys.amplitude,
        keys.frequency,
        keys.pan,
        keys.distance,
        keys.percent,
        keys.index,
        'origdur'
    ],
    note_limit=(len(indexes) * 4),
    post_processes=[calc_endx],
    gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
)

# g.generate_notes()



# g.context['indexstream'] = Itemstream([13])

rhythms = 'e. e. e s s e+q'.split()
indexes = [0.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.903, 4.242, 4.894, 5.236, 5.404]
# g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index], mapping_lists=[rhythms, indexes])
g.streams[keys.rhythm] = Itemstream(rhythms)
g.streams[keys.rhythm].notetype = 'rhythm'

g.streams[keys.index] = Itemstream([indexes[13]])

g.note_limit=0
g.time_limit = 30
g.start_time = 0
g.streams[keys.pan] = 45
g.streams[keys.amplitude] = .75

snare = copy.deepcopy(g)
snare.streams[keys.rhythm] = Itemstream('e. s q'.split())
snare.streams[keys.rhythm].notetype = 'rhythm'
snare.streams[keys.index] = Itemstream([indexes[11]])
snare.streams[keys.amplitude] = Itemstream([0,1,0])
snare.streams[keys.pan] = 10
snare.add_bars_to_starttime(bars=4,beats=0,num=4,denom=4, tempo=snare.streams[keys.rhythm].tempo)
g.add_generator(snare)

hh = copy.deepcopy(g)
hh.streams[keys.rhythm] = Itemstream('e e s s s s'.split())
hh.streams[keys.rhythm].notetype = 'rhythm'
hh.streams[keys.index] = Itemstream([indexes[0]])
hh.streams[keys.amplitude] = Itemstream([.5])
hh.streams[keys.duration] = Itemstream([.1]*2+[.05]*4)
hh.streams[keys.pan] = 80
hh.add_bars_to_starttime(bars=8,beats=0,num=4,denom=4, tempo=hh.streams[keys.rhythm].tempo)
g.add_generator(hh)

g.generate_notes()



# g.context['indexstream'] = Itemstream(range(0,13))
# g.context['indexstream'].streammode = 'random'
# rhy_to_idx.tempo = 100
# g.note_limit = (len(indexes) * 4)
# g.start_time = 0
# g.streams[keys.pan] = 45
# g.streams[keys.amplitude] = 1
# g.streams[keys.duration] = lambda note: note.rhythm
# g.generate_notes()
#
os.environ["SFDIR"] = "/Users/benmca/src/csound/2015/jam/"
with open ("/Users/benmca/src/csound/2015/jam/jam.orc", "r") as f:
    orc_string=f.read()
score_string = g.generate_score_string()
g.generate_score("/Users/benmca/src/csound/2015/jam/drum_and_bass.sco")
cs = csnd6.Csound()
cs.CompileOrc(orc_string)
# cs.CompileOrc("/Users/benmca/src/csound/2015/jam/jam.orc")
cs.ReadScore(score_string)
cs.SetOption('-odac')
cs.Start()
# while (cs.PerformKsmps() == 0):
#   pass
cs.Perform()
cs.Stop()



