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

import argparse
import soundfile as sf

parser = argparse.ArgumentParser()
parser.add_argument("numtapes", help="The number of copies of audio to run.", type=int)
parser.add_argument("delta", help="Time, in seconds, separating beginning of tape.",type=float)
parser.add_argument("path", type=str, help="Path to audio file.")
parser.add_argument("-o","--outpath", type=str, help="Option to write audio to Output path.")
args = parser.parse_args()

f = sf.SoundFile(args.path)
print('samples = {}'.format(len(f)))
print('sample rate = {}'.format(f.samplerate))
print('seconds = {}'.format(len(f) / f.samplerate))
filedur = (float(len(f)) / float(f.samplerate))

g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.rhythm,  Itemstream([args.delta*nprnd.random() for i in xrange(args.numtapes)], 'sequence', tempo=60)),
        (keys.duration, Itemstream([filedur])),
        (keys.amplitude, Itemstream([.25])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.1]))
    ]),
    note_limit=args.numtapes
)
g.generate_notes()
g.end_lines = ['i99 0 ' + str(g.score_dur) + '\n']

if args.outpath:
    cs_utils.play_csound('repeater.orc', g, args_list=['-W', '-o'+args.outpath], string_values={'path_to_file':args.path})
else:
    cs_utils.play_csound('repeater.orc', g, string_values={'path_to_file': args.path})
