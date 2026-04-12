from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.notegenerator import NoteGenerator, NoteGeneratorThread, ko
from thuja.streamkeys import keys
from thuja.itemstream import streammodes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
from collections import OrderedDict
import copy
import random
import time
import ctcsound

seed = int(time.time())
#voivod machine
# seed = 1536186904

#digipines
# seed = 1536186845
# 1536186994
#break in the pines:
#1536187056


# seed = 1528952907
random.seed(seed)
filelen = 60
tempo = 120

pitches_to_files = {
    'a': 'a.wav',
    'as': 'as.wav',
    'b': 'b.wav',
    'c': 'c.wav',
    'cs': 'cs.wav',
    'd': 'd.wav',
    'ds': 'ds.wav',
    'e': 'e.wav',
    'f': 'f.wav',
    'fs': 'fs.wav',
    'g': 'g.wav',
    'gs': 'gs.wav'
}

def post_process(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)

    note.pfields[keys.duration] = note.rhythm
    # note.pfields[keys.frequency] = context['tuplestream'].tempo / utils.quarter_duration_to_tempo(.697-.018)
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_gtrs/' + note.pfields[keys.frequency] + '.wav' + '"'
    note.pfields[keys.frequency] = 1
    pass


g = NoteGenerator(
    streams=OrderedDict([
        (keys.instrument, 1),
        (keys.duration, 1),
        (keys.amplitude, 3),
        (keys.frequency, Itemstream('a a c c d d d'.split())),
        (keys.pan, 45),
        (keys.distance, 10),
        (keys.percent, .01),
        ('output_prefix', 1)
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
        'orig_rhythm',
        'inst_file',
        'output_prefix'
    ],
    note_limit=300,
    post_processes=[post_process]
)


def gen_rhythms(gen, l, opt=1):
    if opt == 1:
        # rhystrings = ('q h 32 32').split()
        rhystrings = ('q ' + 's ' * 5 + 'e e. h').split()
    else:
        rhystrings = ('32 ' + 's ' * 4 + 'e ' * 4 + 'e. h').split()
    gen.context['rhythms'] = []
    gen.context['indexes'] = []
    for x in range(l):
        gen.context['rhythms'].append(rhystrings[random.randint(0, len(rhystrings)-1)])
        gen.context['indexes'].append(random.random()*filelen)
        gen.context['orig_rhythms'] = gen.context['rhythms']

gen_rhythms(g, 30)
g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=tempo,
                                      streammode=streammodes.random,
                                      seed=seed)

g2 = copy.deepcopy(g)
gen_rhythms(g2, 2)
g2.streams[keys.pan] = Itemstream([0])
g2.streams[keys.amplitude] = Itemstream([1])
g2.streams['output_prefix'] = Itemstream([2])
# g2.streams[keys.frequency] = Itemstream(['g'])
g2.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g2.context['rhythms'],
                                                     g2.context['indexes']],
                                      tempo=tempo*.5,
                                      streammode=streammodes.random,
                                       seed=seed)
#
g3 = copy.deepcopy(g2)
gen_rhythms(g3, 2)
# g3.streams[keys.frequency] = Itemstream(['g'])
g3.streams[keys.pan] = Itemstream([90])
g3.streams[keys.amplitude] = Itemstream([1])
g2.streams['output_prefix'] = Itemstream([3])
g3.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g3.context['rhythms'],
                                                     g3.context['indexes']],
                                      tempo=tempo*.5,
                                       seed=seed)

g.add_generator(g2)
g.add_generator(g3)

g.streams[keys.amplitude] = Itemstream([.5])
g.generate_notes()

g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']


# print(g.generate_score_string())
#
# print('seed:', seed)
# for x in [g, g2, g3]:
#     print(x.streams[keys.frequency].values)
#     print("g.context['rhythms'] =", x.context['rhythms'])
#     print("g.context['indexes'] =", x.context['indexes'])
#     print(x.context['tuplestream'].seed)
#
# cs_utils.play_csound("generic-index.orc", g, silent=True)

cs = cs_utils.init_csound_with_orc(['-odac', '--devices', '-+rtaudio=CoreAudio'],
                                   "gtr-indexes.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(g, cs, cpt)
t.daemon = True
t.start()

t = ko(g, "gtr-indexes.orc", "dac6")

#-----------------------------------------------------------
t.gen()