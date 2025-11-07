from thuja.notegenerator import Line, NoteGenerator, NoteGeneratorThread
from thuja.itemstream import streammodes, notetypes, Itemstream
import thuja.csound_utils as cs_utils
from thuja.streamkeys import keys

import thuja.utils as utils

from collections import OrderedDict
import copy
import ctcsound

import numpy as np

def post_process(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)

    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)
    # note.pfields[keys.duration] = note.pfields['orig_rhythm']
    note.pfields[keys.duration] = note.rhythm
    note.pfields[keys.frequency] = context['tuplestream'].tempo / utils.quarter_duration_to_tempo(.697-.018)
    pass
g = (
    Line().with_instr(1).with_duration(1).with_amps(1).with_freqs(1).with_pan(45).with_dist(10).with_percent(.01)
)
g.set_stream(keys.index, None)
g.set_stream('orig_rhythm', None)
g.note_limit = 3000
g.post_processes = [post_process]

# g.context['rhythms'] = 'q q e e'.split()
g.context['rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
g.context['indexes'] = [.018, .697, 1.376, 1.538, 1.869, 2.032, 2.2, 2.543, 2.705, 3.373, 3.895, 4.232, 4.894, 5.231]
g.context['orig_rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=120,
                                      streammode=streammodes.heap)

# g2 = copy.deepcopy(g)
# g2.context['indexes'] = [.018]
# g2.context['rhythms'] = ['q']
# g2.streams[keys.pan] = Itemstream([0])
# g2.streams[keys.amplitude] = Itemstream([1])
# g2.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
#                                       mapping_lists=[g2.context['rhythms'],
#                                                      g2.context['indexes']],
#                                       tempo=80)
#
# g3 = copy.deepcopy(g2)
# g3.context['indexes'] = [.018]
# g3.context['rhythms'] = ['s']
# g3.streams[keys.pan] = Itemstream([90])
# g3.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
#                                       mapping_lists=[g3.context['rhythms'],
#                                                      g3.context['indexes']],
#                                       tempo=80)

g.gen_lines = [';halfsine\n',
               'f 1  0 16384 9 .5 1 0\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n',
               'f4 0 262144 1 "/Users/ben/src/csound-pieces/_archive/2015/jam/jam.aif" 0  0 0\n']

# g.add_generator(g2)
# g.add_generator(g3)
g.generate_notes()
print(g.generate_score_string())


g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']


#

# cs_utils.play_csound("jam-index.orc", g, silent=True, args_list=['-odac1'])

cs = cs_utils.init_csound_with_orc(['-odac2', '-+rtaudio=CoreAudio'],
                                   "jam-index.orc",
                                   True,
                                   None)

# cs_utils.play_csound("jam-index.orc", g, silent=True, args_list=['-odac1'])
# cs.readScore(''.join(g.gen_lines)+"\ni99 0 3600 10\ne\n")

cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(g, cs, cpt)
t.daemon = True
t.start()
#
#
g.context['rhythms'] = 's w'.split()
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=60,
                                      streammode=streammodes.random)
#
# g.post_processes = [post_process]
g.amps(np.linspace(.01, 1, 32).tolist() + np.linspace(1, .01, 32).tolist())
t.gen()
#
g.pan(10)
#
b = g.deepcopy()
b.pan(80)
g.add_generator(b)
b.randomize()
t.gen()

g.context['rhythms'] = 'q'.split()
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=60,
                                      streammode=streammodes.random)


b.randomize()
b.context['rhythms'] = 'q'.split()
b.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[b.context['rhythms'],
                                                     b.context['indexes']],
                                      tempo=60,
                                      streammode=streammodes.heap)
t.gen()



#
c = g.deepcopy()

g.add_generator(c)

c.pan(45)
c.randomize()
c.context['rhythms'] = 'q s s e'.split()
c.context['indexes'] = [b.context['indexes'][9], b.context['indexes'][2], b.context['indexes'][1], b.context['indexes'][0]]
c.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[c.context['rhythms'],
                                                     c.context['indexes']],
                                      tempo= 120,
                                      streammode=streammodes.heap)
c.amps(0)
# g.add_generator(c)
t.gen()

b.amps(0)
g.amps(0)
