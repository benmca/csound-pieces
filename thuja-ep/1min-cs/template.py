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


container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(1)
        .with_amps(0)
        .with_freqs(1)
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

container.generate_notes()

reverb_time = 10
# container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o148-60.wav', '-W'])

