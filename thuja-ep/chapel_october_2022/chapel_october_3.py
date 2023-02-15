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
seed = 1594358933
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
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'

def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_ebows/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'


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
        (keys.duration, lambda note:note.pfields['orig_rhythm']),
        (keys.amplitude, Itemstream([1])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01])),
        ('output_prefix', Itemstream([1])),
        ('filepitch', Itemstream(('c '*8 + 'e '*8 + 'g '*8).split())),
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
    note_limit=300,
    post_processes=[parse_rhythms_from_tuplestream, cleanup_strings_chapel, break_into_phrases]
)


def gen_rhythms(gen, l, opt=1):
    if opt == 1:
        rhystrings = ['s']
    if opt == 2:
        rhystrings = 'e q q q q e e e e e e e e e e e'.split()
    if opt == 3:
        rhystrings = 'e e q'.split()
    if opt == 4:
        rhystrings = ['w+w'] + ['s']*16
    else:
        rhystrings = sum([['32']*8, ['s']*4, ['e']*4, ['e.']*2, ['h']], [])
    gen.context['rhythms'] = []
    gen.context['indexes'] = []
    for x in range(l):
        if opt == 4:
            gen.context['rhythms'].append(rhystrings[x % len(rhystrings)])
        else:
            gen.context['rhythms'].append(rhystrings[random.randint(0, len(rhystrings)-1)])
        gen.context['indexes'].append(random.random()*filelen)
        gen.context['orig_rhythms'] = gen.context['rhythms']


# random.seed(1584747722)
gen_rhythms(g, 6*4, 4)

g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=tempo,
                                      # streammode=streammodes.random,
                                      seed=1584747722)
g.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
g.streams[keys.amplitude] = Itemstream([1])
g.time_limit = 48
#g.generate_notes()

metronome = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.rhythm, Itemstream(['q'], 'sequence', tempo=tempo, notetype='rhythm')),
        (keys.duration, Itemstream([.01])),
        (keys.amplitude, Itemstream([1])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([0])),
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
    note_limit=300,
    post_processes=[cleanup_strings_chapel]
)

# random.seed(1541470791)
second_line = copy.deepcopy(g)
second_line.streams[keys.pan] = Itemstream([90])
second_line.streams[keys.amplitude] = Itemstream([1])
second_line.streams[keys.frequency] = Itemstream([1])
second_line.streams['filepitch'] = Itemstream(['c'])
gen_rhythms(second_line, 4, 2)
second_line.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[second_line.context['rhythms'],
                                                     second_line.context['indexes']],
                                      tempo=60,
                                      # streammode=streammodes.random,
                                      seed=1541470791)
second_line.start_time = 4
second_line.time_limit = 12

random.seed(1584747196)
third_line = copy.deepcopy(g)
third_line.streams[keys.pan] = Itemstream([0])
third_line.streams[keys.amplitude] = Itemstream([1])
second_line.streams[keys.frequency] = Itemstream([1])
third_line.streams['filepitch'] = Itemstream(['c'])
gen_rhythms(third_line, 4, 2)
third_line.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[third_line.context['rhythms'],
                                                     third_line.context['indexes']],
                                      tempo=60,
                                      # streammode=streammodes.random,
                                      seed=1584747196)
third_line.start_time = 8
third_line.time_limit = 12

g.add_generator(second_line)
g.add_generator(third_line)

second_line_2 = copy.deepcopy(second_line)
third_line_2 = copy.deepcopy(third_line)

second_line_2.start_time = 20
second_line_2.time_limit = second_line_2.start_time + 16

third_line_2.start_time = 20
third_line_2.time_limit = third_line_2.start_time + 16

g.add_generator(second_line_2)
g.add_generator(third_line_2)

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

cs_utils.play_csound("generic-index.orc", g, silent=True, args_list=['-o/Users/ben/Desktop/ChapelOctober2022.3.wav','-W','-+rtaudio=CoreAudio'])

# lilsten to the repeatign ds here -
#        ('filepitch', Itemstream(('b '*8 + 'ds '*8 + 'fs '*8).split())),
# g.context['rhythms'] = ['s', '32', '32', '32', '32', 'e', 'e.', '32', 'e', '32', 's', '32', 'h', 'e', 'e', 'e.', '32', '32', 'h', '32', '32', '32', '32', 's']
# g.context['indexes'] = [41.09457734479521, 34.83612735669396, 4.125806261845879, 25.552187160672982, 19.26888478368347, 16.35334493262544, 3.6357973817001277, 53.13542471591472, 5.310456402096904, 5.833999653433175, 48.24784082534548, 26.98857063919712, 27.817313953211936, 10.920874533169657, 37.5951115787286, 4.581076584030113, 17.75646735953427, 20.95225347612351, 22.192846820178094, 17.535204288692963, 26.01652709020115, 31.78940154832977, 34.71990602843929, 7.868712245874406]
# 1541470791
