from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import numpy as np
from collections import OrderedDict
import copy

rhythms = Itemstream(['e'],'sequence', tempo=np.linspace(60,80,32).tolist()+np.linspace(80,60,32).tolist(), notetype='rhythm')

g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.rhythm, rhythms),
        (keys.duration, Itemstream([.1])),
        (keys.amplitude, Itemstream([3])),
        (keys.frequency, Itemstream(['b4'], notetype='pitch',streammode = 'heap')),
        (keys.pan, Itemstream([0])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01]))
    ]),
    note_limit=300
)
g.gen_lines = [';sine\n','f 1 0 16384 10 1\n',';saw','f 2 0 256 7 0 128 1 0 -1 128 0\n',';pulse\n','f 3 0 256 7 1 128 1 0 -1 128 -1\n']


g2 = copy.deepcopy(g)
g2.streams[keys.rhythm].tempo = np.linspace(60,100,32).tolist()+np.linspace(100,60,32).tolist()
g2.streams[keys.frequency] = Itemstream(['c4'], notetype='pitch')
g2.streams[keys.pan] = Itemstream([30])
g2.note_limit=330
g.add_generator(g2)

g3 = copy.deepcopy(g)
g3.streams[keys.rhythm].tempo = np.linspace(60,120,32).tolist()+np.linspace(120,60,32).tolist()
g3.streams[keys.frequency] = Itemstream(['d4'], notetype='pitch')
g3.streams[keys.pan] = Itemstream([60])
g3.note_limit=154

g.add_generator(g3)

g4 = copy.deepcopy(g)
g4.streams[keys.rhythm].tempo = np.linspace(60,140,32).tolist()+np.linspace(140,60,32).tolist()
g4.streams[keys.frequency] = Itemstream(['e4'], notetype='pitch')
g4.streams[keys.pan] = Itemstream([90])
g4.note_limit=154

g.generate_notes()

g.end_lines = ['i99 0 ' + str(g.score_dur) + '\n']

# g.generate_score("tempo_canon.sco")
# print(g.generate_score_string())
cs_utils.play_csound('../sine.orc', g)