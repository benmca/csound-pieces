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

def add_env_streams(c, atck=.01, rel=.01):
    c.set_stream('atck', atck)
    c.set_stream('rel', rel)


container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(1)
        .with_amps(1)
        .with_pitches(Itemstream('c4 e g b r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(container)

container.gen.time_limit = 60
container.with_amps(.25)

a = copy.deepcopy(container).with_pan(10).with_tempo(120).randomize()


container.gen.add_generator(a.gen)

container.gen.generate_notes()

reverb_time = 10
container.gen.end_lines = ['i99 0 ' + str(container.gen.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.gen.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container.gen, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("226.orc", container.gen, silent=True, args_list=['-odac0', '-W'])
