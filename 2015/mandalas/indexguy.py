from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils

from collections import OrderedDict
import numpy as np
import csnd6



def post_processs(note):
    item = g.context['tuplestream'].get_next_value()
    indx = g.context['indexes'].index(item[keys.index])
    orig_rhythm = g.context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], g.context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, g.context['tuplestream'].tempo)
    note.pfields[keys.frequency] = g.context['tuplestream'].tempo / utils.quarter_duration_to_tempo(.697-.018)
    pass

g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.duration, lambda note:note.pfields['orig_rhythm']),
        (keys.amplitude, Itemstream([3])),
        (keys.frequency, Itemstream([1], notetype='number')),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01]))
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
        'orig_rhythm'
    ],
    note_limit=300,
    post_processes=[post_processs]
)
g.context['rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
g.context['indexes'] = [.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.895, 4.232, 4.894, 5.236]
g.context['orig_rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=160)

g.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
g.generate_notes()


g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']

cs_utils.play_csound("indexguy.orc", g)
