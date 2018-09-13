

from thuja.itemstream import notetypes
from thuja.itemstream import streammodes
from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
from collections import OrderedDict
from thuja import utils
import copy
import csnd6

rhythms = Itemstream(
    # '12 12 12 12 12 12 e. e. e q. e q. e q q'.split()+['s']*16,
    ['s'],
    streammode=streammodes.sequence,
    tempo=120,
    notetype=notetypes.rhythm)

amps = Itemstream([1])

pitches = Itemstream(['g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'd5', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'g6', 'd5', 'g6', 'g6', 'g6', 'g6', 'g6', 'd5', 'g6', 'g6', 'g6', 'd5', 'g6', 'g6', 'g6', 'd5', 'g6', 'g6', 'g6', 'b5', 'g6', 'g6', 'g6', 'g6', 'g6'],
    notetype=notetypes.pitch
)

g = Generator(
    streams=OrderedDict([
        (keys.instrument, 1),
        (keys.rhythm, rhythms),
        (keys.duration, Itemstream([.1])),
        (keys.amplitude, 10),
        (keys.frequency, pitches),
        (keys.pan, 45),
        (keys.distance, 10),
        (keys.percent, .1)
    ]),
    pfields=None,
    gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
)
g.time_limit=120


g.generate_notes()

g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']

with open ("../generative/sine.orc", "r") as f:
    orc_string=f.read()
score_string = g.generate_score_string()
cs = csnd6.Csound()
cs.CompileOrc(orc_string)
cs.ReadScore(score_string)
cs.SetOption('-odac')
cs.Start()
cs.Perform()
cs.Stop()
