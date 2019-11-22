from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.generator import Generator
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


seed = int(time.time())
seed = 1541470791
random.seed(seed)
filelen = 60
tempo = 60

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


# g =
# generator.make_line().withRhythm('q').withPitches('e').forBars(4).withAmp('1 0 1 0'),
# generator.make_line().withRhythm('e').withPitches('a').forBars(4).withAmp('1')
#
#

class GuitarLine(BasicLine):

    def __init__(self):
        super(GuitarLine, self).__init__()
        self.line.pfields.extend([keys.index, 'orig_rhythm', 'inst_file', 'output_prefix'])
        self.line.streams[keys.percent] = Itemstream([.01])
        self.line.streams['output_prefix'] = Itemstream([1])
        self.line.streams['filepitch'] = Itemstream(('f '*32).split())
        self.line.streams['stretch'] = Itemstream(['1'])

        self.gen_rhythms(24)

        self.line.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                      mapping_lists=[self.line.context['rhythms'],
                                                                     self.line.context['indexes']],
                                                      tempo=tempo,
                                                      streammode=streammodes.random,
                                                      seed=seed)
        self.line.note_limit = 100
        self.line.post_processes = [self.parse_rhythms_from_tuplestream, self.cleanup_strings, self.break_into_phrases]

    def cleanup_strings(self, note, context):
        note.pfields['inst_file'] = '"' + '/Users/ben/Music/Portfolio/snd/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'
        note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'

    def parse_rhythms_from_tuplestream(self, note):
        item = self.line.context['tuplestream'].get_next_value()
        indx = self.line.context['indexes'].index(item[keys.index])
        orig_rhythm = self.line.context['orig_rhythms'][indx]
        note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], self.line.context['tuplestream'].tempo)
        note.pfields[keys.index] = item[keys.index]
        note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, self.line.context['tuplestream'].tempo)

    def break_into_phrases(self, note):
        note.pfields[keys.instrument] = note.pfields[keys.instrument]+.1
        pass

    def gen_rhythms(self, l):
        rhystrings = ['s']
        self.line.context['rhythms'] = []
        self.line.context['indexes'] = []
        for x in range(l):
            self.line.context['rhythms'].append(rhystrings[random.randint(0, len(rhystrings)-1)])
            self.line.context['indexes'].append(random.random()*filelen)
            self.line.context['orig_rhythms'] = self.line.context['rhythms']


phrase = GuitarLine()
# phrase.with_rhythm('q').with_pitches('a1 d1 b1 b1').with_amps([1, 0])
phrase.line.generate_notes()
phrase.line.end_lines = ['i99 0 ' + str(phrase.line.score_dur+10) + '\n']
cs_utils.play_csound("generic-index.orc", phrase.line, silent=True)

#
#
#
#
# g = Generator(
#     streams=OrderedDict([
#         (keys.instrument, Itemstream([1])),
#         (keys.duration, lambda note:note.pfields['orig_rhythm']),
#         (keys.amplitude, Itemstream([3])),
#         (keys.frequency, Itemstream([1])),
#         (keys.pan, Itemstream([45])),
#         (keys.distance, Itemstream([10])),
#         (keys.percent, Itemstream([.01])),
#         ('output_prefix', Itemstream([1])),
#         ('filepitch', Itemstream(('f '*32).split())),
#         ('stretch', Itemstream(['1'])),
#     ]),
#     pfields=[
#         keys.instrument,
#         keys.start_time,
#         keys.duration,
#         keys.amplitude,
#         keys.frequency,
#         keys.pan,
#         keys.distance,
#         keys.percent,
#         keys.index,
#         'orig_rhythm',
#         'inst_file',
#         'output_prefix'
#     ],
#     note_limit=100,
#     post_processes=[parse_rhythms_from_tuplestream,cleanup_strings,break_into_phrases]
# )


#
#
# g.gen_lines = [';sine\n',
#                'f 1 0 16384 10 1\n',
#                ';saw',
#                'f 2 0 256 7 0 128 1 0 -1 128 0\n',
#                ';pulse\n',
#                'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
# g.generate_notes()
#
# g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']

# print(g.generate_score_string())

# print('seed:', seed)
# x=g
# # for x in [g, g2, g3]:
# print(x.streams[keys.frequency].values)
# print("g.context['rhythms'] =", x.context['rhythms'])
# print("g.context['indexes'] =", x.context['indexes'])
# print(x.context['tuplestream'].seed)
#
# cs_utils.play_csound("generic-index.orc", g, silent=True)
