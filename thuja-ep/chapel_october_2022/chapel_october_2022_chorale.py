from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.generator import Generator
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


seed = int(time.time())
# seed = 1594358315
# seed = 1594358933
random.seed(seed)
filelen = 30
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



def cleanup_strings_chapel(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_chapel/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'

def cleanup_strings_gtrs(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'
    # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'
    note.pfields.pop('filepitch', None)

def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_ebows/' + note.pfields['filepitch'] + '.wav' + '"'
    # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'
    note.pfields.pop('filepitch', None)


def parse_rhythms_from_tuplestream(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)
    note.pfields[keys.duration] = note.pfields['orig_rhythm']

# see http://www.csounds.com/manual/html/i.html - experimenting w/held notes here
def break_into_phrases(note, context):
    note.pfields[keys.instrument] = note.pfields[keys.instrument]+.1
    pass


g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.duration, lambda note:note.pfields['orig_rhythm']*2),
        (keys.amplitude, Itemstream([1])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01])),
        ('filepitch', Itemstream([['c','e','g'],['f','a','c'],['g','b','d'],['d', 'f', 'a'],['a','c','e'],['e','g','b'],['b','d','f'],['c','e','g', 'b'],['c','e','g', 'b'],['c','e','g', 'b'],['f','a','c', 'e'],['f','a','c', 'e'],['f','a','c', 'e']])),
        ('output_prefix', Itemstream([1])),
        ('ifadein', Itemstream(['3'])),
        ('ifadeout', Itemstream(['3']))
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
        'output_prefix',
        'ifadein',
        'ifadeout'
    ],
    note_limit=3,
    post_processes=[parse_rhythms_from_tuplestream,cleanup_strings_chapel,break_into_phrases]
)


def gen_material(gen, l, opt=1):
    gen.context['rhythms'] = []
    gen.context['indexes'] = []
    if opt == 1:
        rhystrings = ['w+w']

    for x in range(l):
        if opt == 4:
            gen.context['rhythms'].append(rhystrings[x % len(rhystrings)])
        else:
            gen.context['rhythms'].append(rhystrings[random.randint(0, len(rhystrings)-1)])
        gen.context['indexes'].append(random.random()*filelen)
        gen.context['orig_rhythms'] = gen.context['rhythms']


gen_material(g, 21*4)

g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=tempo,
                                      # streammode=streammodes.random,
                                      seed=seed)
g.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
g.streams[keys.amplitude] = Itemstream([1])
g.time_limit = 180

metronome = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.rhythm, Itemstream(['q'], 'sequence', tempo=tempo, notetype='rhythm')),
        (keys.duration, Itemstream([.01])),
        (keys.amplitude, Itemstream([10])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01])),
        (keys.index, Itemstream([20])),
        ('orig_rhythm', lambda note: note.pfields[keys.duration]),
        ('output_prefix', Itemstream([1])),
        ('filepitch', Itemstream(['a'])),
        ('stretch', Itemstream(['1'])),
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
    note_limit=16,
    post_processes=[cleanup_strings_chapel]
)

# g.add_generator(metronome)
g.generate_notes()

reverb_time = 10
# g.end_lines = ['i99 0 ' + str(g.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(g.generate_score_string())

print('seed:', seed)
x=g
# for x in [g, g2, g3]:
print(x.streams[keys.frequency].values)
print("g.context['rhythms'] =", x.context['rhythms'])
print("g.context['indexes'] =", x.context['indexes'])
print(x.context['tuplestream'].seed)

cs_utils.play_csound("generic-index.orc", g, silent=True, args_list=['-o/Users/ben/Desktop/ChapelOctober2022.chorale.' + str(seed) + '.wav','-W','-+rtaudio=CoreAudio'])

# lilsten to the repeatign ds here -
#        ('filepitch', Itemstream(('b '*8 + 'ds '*8 + 'fs '*8).split())),
# g.context['rhythms'] = ['s', '32', '32', '32', '32', 'e', 'e.', '32', 'e', '32', 's', '32', 'h', 'e', 'e', 'e.', '32', '32', 'h', '32', '32', '32', '32', 's']
# g.context['indexes'] = [41.09457734479521, 34.83612735669396, 4.125806261845879, 25.552187160672982, 19.26888478368347, 16.35334493262544, 3.6357973817001277, 53.13542471591472, 5.310456402096904, 5.833999653433175, 48.24784082534548, 26.98857063919712, 27.817313953211936, 10.920874533169657, 37.5951115787286, 4.581076584030113, 17.75646735953427, 20.95225347612351, 22.192846820178094, 17.535204288692963, 26.01652709020115, 31.78940154832977, 34.71990602843929, 7.868712245874406]
# 1541470791
