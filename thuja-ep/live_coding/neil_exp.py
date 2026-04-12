import time

from thuja.notegenerator import Line, NoteGenerator, NoteGeneratorThread
from thuja.itemstream import streammodes, notetypes, Itemstream
import thuja.csound_utils as cs_utils
from thuja.streamkeys import keys

import thuja.utils as utils

from collections import OrderedDict
import copy
import ctcsound
import time


def post_process(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)

    # g.cur_time = g.cur_time + note.rhythm

    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)
    # note.pfields[keys.duration] = note.pfields['orig_rhythm']
    note.pfields[keys.duration] = note.rhythm
    note.pfields[keys.frequency] = context['tuplestream'].tempo / utils.quarter_duration_to_tempo((float(context['tuplestream'].values[1]['indx']) - float(context['tuplestream'].values[0]['indx']))/2)
    pass

g = (
    Line().with_instr(1).with_duration(1).with_amps(1).with_freqs(1).with_pan(45).with_dist(10).with_percent(.01)
)
g.set_stream(keys.index, None)
g.set_stream('orig_rhythm', None)
g.note_limit = 3000
g.post_processes = [post_process]

g.context['rhythms'] = 'e'.split()
# g.context['rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
# g.context['indexes'] = ['129.350', '129.837', '130.32399999999998', '130.81099999999998', '131.29799999999997', '131.78499999999997', '132.27199999999996', '132.75899999999996', '133.24599999999995', '133.73299999999995', '134.21999999999994', '134.70699999999994', '135.19399999999993', '135.68099999999993', '136.16799999999992', '136.65499999999992', '137.1419999999999', '137.6289999999999', '138.1159999999999', '138.6029999999999', '139.0899999999999', '139.57699999999988', '140.06399999999988', '140.55099999999987', '141.03799999999987', '141.52499999999986', '142.01199999999986', '142.49899999999985', '142.98599999999985', '143.47299999999984', '143.95999999999984', '144.44699999999983', '144.93399999999983', '145.42099999999982', '145.90799999999982', '146.3949999999998', '146.8819999999998', '147.3689999999998', '147.8559999999998', '148.3429999999998', '148.82999999999979', '149.31699999999978', '149.80399999999977', '150.29099999999977', '150.77799999999976', '151.26499999999976', '151.75199999999975', '152.23899999999975', '152.72599999999974', '153.21299999999974', '153.69999999999973', '154.18699999999973', '154.67399999999972', '155.16099999999972', '155.6479999999997', '156.1349999999997', '156.6219999999997', '157.1089999999997', '157.5959999999997', '158.08299999999969', '158.56999999999968', '159.05699999999968', '159.54399999999967', '160.03099999999966', '160.51799999999966']
g.context['indexes'] = ['129.843', '130.33599999999998', '130.82899999999998', '131.32199999999997', '131.81499999999997', '132.30799999999996', '132.80099999999996', '133.29399999999995', '133.78699999999995', '134.27999999999994', '134.77299999999994', '135.26599999999993', '135.75899999999993', '136.25199999999992', '136.74499999999992', '137.23799999999991', '137.7309999999999', '138.2239999999999', '138.7169999999999', '139.2099999999999', '139.7029999999999', '140.19599999999988', '140.68899999999988', '141.18199999999987', '141.67499999999987', '142.16799999999986', '142.66099999999986', '143.15399999999985', '143.64699999999985', '144.13999999999984', '144.63299999999984', '145.12599999999983', '145.61899999999983', '146.11199999999982', '146.60499999999982', '147.09799999999981', '147.5909999999998', '148.0839999999998', '148.5769999999998', '149.0699999999998', '149.5629999999998', '150.05599999999978', '150.54899999999978', '151.04199999999977', '151.53499999999977', '152.02799999999976', '152.52099999999976', '153.01399999999975', '153.50699999999975', '153.99999999999974', '154.49299999999974', '154.98599999999973', '155.47899999999973', '155.97199999999972', '156.46499999999972', '156.9579999999997', '157.4509999999997', '157.9439999999997', '158.4369999999997', '158.9299999999997', '159.4229999999997', '159.91599999999968', '160.40899999999968', '160.90199999999967']
g.context['orig_rhythms'] = ['e']*len(g.context['indexes'])
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=126,
                                      streammode=streammodes.sequence)


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
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
               # 'f4 0 262144 1 "/Volumes/NO NAME/2025.11.08.Neil First New House Play.WAV" 0  0 0\n']

# g.add_generator(g2)
# g.add_generator(g3)
g.generate_notes()
print(g.generate_score_string())


g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']


#

# cs_utils.play_csound("tp-index.orc", g, silent=True, args_list=['-odac1'])

cs = cs_utils.init_csound_with_orc(['-odac', '-+rtaudio=CoreAudio'],
                                   "neil-exp-index.orc",
                                   True,
                                   None)
cs.readScore(''.join(g.gen_lines)+"\ni99 0 3600 10\ne\n")

cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(g, cs, cpt)
t.daemon = True
t.start()

#--------------------------

g.add_generator(h)

h = g.deepcopy()
g.pan(20)
h.pan(80)
h.set_streams_to_seed(time.time())


t.gen()
#
#
g.context['rhythms'] = 'h'.split()
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=80,
                                      streammode=streammodes.random)
#
# g.post_processes = [post_process]
# g.amps([1, 0])
g.pitches(Itemstream([['c4', 'd', 'e']], streammode=streammodes.sequence, notetype=notetypes.number))
t.gen()
#
g.pan(10)
#
b = g.deepcopy()
b.pan(80)
g.add_generator(b)
b.randomize()
t.gen()


g.context['rhythms'] = 'h q. q. q e. q h h'.split()
# g.context['rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
g.context['indexes'] = ['0.826528', '2.417348', '3.654652', '4.891957', '5.952503', '6.600615', '7.454944', '8.721708']
g.context['orig_rhythms'] = ['h', 'q.', 'q.', 'q', 'e.', 'q', 'h', 'h']
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=60,
                                      streammode=streammodes.heap)

h.context['rhythms'] = 'h q. q. q e. q h h'.split()
# g.context['rhythms'] = ['q', 'q', 's', 'e', 's', 's', 'e', 's', 'q', 'e.', 'e', 'q', 'e', 's']
h.context['indexes'] = ['0.826528', '2.417348', '3.654652', '4.891957', '5.952503', '6.600615', '7.454944', '8.721708']
h.context['orig_rhythms'] = ['h', 'q.', 'q.', 'q', 'e.', 'q', 'h', 'h']
h.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=80,
                                      streammode=streammodes.heap)


i = h.deepcopy()
h.pan(20)
g.pan(45)
i.pan(80)

g.context['tuplestream'].tempo = 160

g.randomize()
h.randomize()
i.randomize()
t.gen()

h.amps(.2)
i.amps(.2)
g.amps(.2)
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
