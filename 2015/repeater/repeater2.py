from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
from thuja.itemstream import streammodes
import thuja.utils as utils
import thuja.csound_utils as cs_utils

from collections import OrderedDict
import numpy as np
import csnd6
import copy

import numpy.random as nprnd

g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.rhythm,  Itemstream([.05*nprnd.random() for i in xrange(40)], 'sequence', tempo=60)),
        (keys.duration, Itemstream([(2*60)+44.859])),
        (keys.amplitude, Itemstream([.5])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.1]))
    ]),
    note_limit=40
)


g.gen_lines = [
    "f 1 0 16384 10 1\nf 2 0 256 7 0 128 1 0 -1 128 0\nf 3 0 256 7 1 128 1 0 -1 128 -1\nf4 0 131072 1 \"/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/OnTheHour_Distorted.wav\"\nf5 0 16384 9 .5 1 0\n"]
g.generate_notes()
g.end_lines = ['i99 0 ' + str(g.score_dur) + '\n']

cs_utils.play_csound('repeater.orc', g, string_values={'path_to_file': "/Users/benmca/Music/_toSort/2016.11.16.Three 4-tracks-p1.wav"})

