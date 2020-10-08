from __future__ import print_function
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


def cleanup_strings(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'


def parse_rhythms_from_tuplestream(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    # orig_rhythm = context['orig_rhythms'][indx]
    note.pfields[keys.index] = item[keys.index]
    # note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)


def calc_dur_l(note, context):
    steps = 32.0
    dur = .2
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur
    context['durdx'] = context['durdx']+1


def calc_dur_r(note, context):
    steps = 32.0
    dur = .2
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur
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

def pitch_to_tempo(note, context):
    note.pfields[keys.frequency] = 1 * (context['tempo']/240)

pulse_l = Generator(
    streams=[
        (keys.instrument, 1),
        (keys.duration, .1),
        (keys.rhythm, Itemstream('h', notetype=notetypes.rhythm)),
        (keys.amplitude, .001),
        (keys.frequency, Itemstream([1])),
        (keys.pan, 10),
        (keys.distance, 10),
        (keys.percent, .01),
        (keys.index, 18.075),
        ('output_prefix', 1),
        ('filepitch', "b"),
        ('stretch', "1"),
        ('orig_rhythm', 1)
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
        'output_prefix'
    ],
    post_processes=[cleanup_strings, pitch_to_tempo],# calc_dur_l, slide_start_l],
    init_context={'tempo': 240}
)

# pulse_l.note_limit = utils.rhythm_to_duration('q', pulse_l.tempo()) * 4 * (1 + 128)
pulse_l.time_limit = 120
pulse_l.streams[keys.rhythm].tempo = 240
pulse_r = copy.deepcopy(pulse_l)
pulse_r.notes = []
pulse_r.streams[keys.pan] = 80
pulse_r.post_processes = [cleanup_strings, pitch_to_tempo]

t = 220
for x in range(10):
    t = t-10
    l = copy.deepcopy(pulse_l)
    l.streams[keys.rhythm].tempo = t
    l.context['tempo'] = t
    r = copy.deepcopy(pulse_r)
    r.streams[keys.rhythm].tempo = t
    r.context['tempo'] = t

    pulse_l.add_generator(l)
    pulse_l.add_generator(r)


# pulse_l.add_generator(texture1)
# pulse_l.add_generator(texture2)
# pulse_l.add_generator(texture3)

pulse_l.add_generator(pulse_r)
pulse_l.generate_notes()

pulse_l.end_lines = ['i99 0 ' + str(pulse_l.score_dur+10) + ' 5\n']
print(pulse_l.generate_score_string())


cs_utils.play_csound("generic-index.orc", pulse_l, silent=True, args_list=['-odac2'])
