from __future__ import print_function

import random

from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import copy
# import random
# import dill
# import pickle
import time

seed = int(time.time())
# seed = 1535157965
# random.seed(seed)
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

def get_random_index(note, context):
    note.pfields[keys.index] = random.randrange(20.0)

def cleanup_strings(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_ebows/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'


def parse_rhythms_from_tuplestream(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    # orig_rhythm = context['orig_rhythms'][indx]
    note.pfields[keys.index] = item[keys.index]
    # note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)


def calc_dur_l(note, context):
    steps = 16.0
    dur = .1
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur + .1
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur + .1
    context['durdx'] = context['durdx']+1


def calc_dur_r(note, context):
    steps = 9.0
    dur = .2
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur + .1
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur + .1
    context['durdx'] = context['durdx']+1


def slide_start_l(note, context):
    steps = 30.0
    window_size = .4
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.index] = note.pfields[keys.index] + (((context['durdx']%steps)/steps) * window_size)
    else:
        note.pfields[keys.index] = note.pfields[keys.index] - (((context['durdx']%steps)/steps) * window_size)


def slide_start_r(note, context):
    steps = 20.0
    window_size = .4
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.index] = note.pfields[keys.index] + (((context['durdx']%steps)/steps) * window_size)
    else:
        note.pfields[keys.index] = note.pfields[keys.index] - (((context['durdx']%steps)/steps) * window_size)


pulse_l = Generator(
    streams=[
        (keys.instrument, 1),
        (keys.duration, .1),
        (keys.rhythm, Itemstream('s', notetype=notetypes.rhythm)),
        (keys.amplitude, .5),
        (keys.frequency, Itemstream([1])),
        (keys.pan, 10),
        (keys.distance, 10),
        (keys.percent, .01),
        (keys.index, 18.075),
        ('output_prefix', 1),
        ('filepitch', Itemstream(['b', 'd', 'fs'])),
        ('stretch', "1"),
        ('orig_rhythm', 1),
        ('fade_in', .1),
        ('fade_out', .1)
    ],
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
        'fade_in',
        'fade_out'
    ],
    post_processes=[cleanup_strings, calc_dur_l, slide_start_l, get_random_index],
    init_context={'durdx': 0}
)


def texture1_fadein(note, context):
    fade_time = 60.0
    diff = note.pfields[keys.start_time] - context['texture_start']
    if diff < fade_time:
        note.pfields[keys.amplitude] = note.pfields[keys.amplitude] * (diff/fade_time)
    pass


def texture3_fadeout(note, context):
    fade_time = context['texture_end'] - context['texture_start']
    diff = note.pfields[keys.start_time] - context['texture_start']
    note.pfields[keys.amplitude] = note.pfields[keys.amplitude] * (1-(diff/fade_time))
    pass

# pulse_l.note_limit = utils.rhythm_to_duration('q', pulse_l.tempo()) * 4 * (1 + 128)
pulse_l.time_limit = 120

pulse_r = copy.deepcopy(pulse_l)
pulse_r.notes = []
pulse_r.streams[keys.pan] = 80
pulse_r.post_processes = [cleanup_strings, calc_dur_r, slide_start_r, get_random_index]


texture1 = copy.deepcopy(pulse_l)
texture1.streams[keys.pan] = 45
texture1.start_time = utils.rhythm_to_duration('q', texture1.tempo()) * 4 * (4)
texture1.streams[keys.index] = Itemstream([18.394266363423284, 29.986405701944328, 2.3787051284598992, 30.06279737830769,
                        18.511066510650128, 42.11027927574142, 41.84313592235877, 53.576331546688465])
texture1.streams[keys.rhythm] = Itemstream("q e s h".split(), notetype=notetypes.rhythm, streammode=streammodes.heap)
texture1.streams[keys.duration] = lambda note: note.rhythm
texture1.streams[keys.amplitude] = 2.0
texture1.post_processes = [cleanup_strings, texture1_fadein]
texture1.context['texture_start'] = texture1.start_time
texture1.time_limit = 75

texture2 = copy.deepcopy(texture1)
texture2.start_time = 60
texture2.streams[keys.index].streammode = streammodes.heap
texture2.streams[keys.rhythm] = Itemstream("q e e. s s s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence)
texture2.post_processes = [cleanup_strings]
texture2.time_limit = 90


texture3 = copy.deepcopy(texture2)
texture3.start_time = 90
texture3.streams[keys.rhythm] = Itemstream("w+w w h q s s s s s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence)
texture3.post_processes = [cleanup_strings, texture3_fadeout]
texture3.time_limit = 120
texture3.context['texture_start'] = texture3.start_time
texture3.context['texture_end'] = texture3.time_limit

pulse_l.add_generator(texture1)
pulse_l.add_generator(texture2)
pulse_l.add_generator(texture3)
pulse_l.add_generator(pulse_r)

pulse_l.generate_notes()

pulse_l.end_lines = ['i99 0 ' + str(pulse_l.score_dur+10) + ' 5\n']
print(pulse_l.generate_score_string())


cs_utils.play_csound("../books-style/generic-index.orc", pulse_l, silent=True, args_list=['-odac0', '-W', '-+rtaudio=CoreAudio'])
