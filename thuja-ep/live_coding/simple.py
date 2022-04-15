from __future__ import print_function

import ctcsound

from thuja.itemstream import Itemstream
from thuja.generator import Generator, GeneratorThread
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
import threading

seed = int(time.time())
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


def cleanup_strings(note, context):
    note.pfields['inst_file'] = '"' + '/Users/admin/Dropbox/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'


def parse_rhythms_from_tuplestream(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm,
                                                           context['tuplestream'].tempo)


g = Generator(
    streams=OrderedDict([
        (keys.instrument, Itemstream([1])),
        (keys.duration, lambda note: note.pfields['orig_rhythm']),
        (keys.amplitude, Itemstream([3, 0])),
        (keys.frequency, Itemstream([1])),
        (keys.pan, Itemstream([45])),
        (keys.distance, Itemstream([10])),
        (keys.percent, Itemstream([.01])),
        ('output_prefix', Itemstream([1])),
        ('filepitch', Itemstream(('f ' * 32).split())),
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
    note_limit=0,
    post_processes=[parse_rhythms_from_tuplestream,
                    cleanup_strings]
)


def gen_rhythms(gen, l):
    rhystrings = ['q']
    gen.context['rhythms'] = []
    gen.context['indexes'] = []
    for x in range(l):
        gen.context['rhythms'].append(rhystrings[random.randint(0, len(rhystrings) - 1)])
        # gen.context['indexes'].append(random.random() * filelen)
        gen.context['indexes'].append(.5)
        gen.context['orig_rhythms'] = gen.context['rhythms']


gen_rhythms(g, 1)

g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                      mapping_lists=[g.context['rhythms'],
                                                     g.context['indexes']],
                                      tempo=tempo,
                                      streammode=streammodes.random,
                                      seed=seed)

cs = cs_utils.init_csound_with_orc(['-odac', '-W', '-+rtaudio=CoreAudio'],
                                   "/Users/admin/src/csound-pieces/thuja-ep/books-style/generic-index.orc",
                                   True,
                                   None)
cs.readScore("f0 3600\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = GeneratorThread(g, cs)
t.daemon = True
t.start()
time.sleep(5)
t.stop_event.set()
t.join()

cpt.stop()
cpt.join()
cs.reset()
