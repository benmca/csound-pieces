from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.notegenerator import NoteGenerator, NoteGeneratorThread, Line, ko
from thuja.streamkeys import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
from thuja import utils
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
    # note.pfields.pop('filepitch', None)
    note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'


def parse_rhythms_from_tuplestream(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    # orig_rhythm = context['orig_rhythms'][indx]
    note.pfields[keys.index] = item[keys.index]
    # note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)


def calc_dur_l(note, context):
    steps = 16.0
    dur = .2
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur
    context['durdx'] = context['durdx']+1


def calc_dur_r(note, context):
    steps = 9.0
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

pulse_l = (
    Line().rhythms(Itemstream('s', notetype=notetypes.rhythm)).durs(.1).amps(3).freqs(1).pan(10).dist(10).pct(.01).index(18.075)
)

pulse_l.set_stream('output_prefix', 1)
pulse_l.set_stream('filepitch', "b")
pulse_l.set_stream('stretch', "1")
pulse_l.set_stream('orig_rhythm', 1)

pulse_l.pfields.append(keys.index)
pulse_l.pfields.append('orig_rhythm')
pulse_l.pfields.append('inst_file')
pulse_l.pfields.append('output_prefix')

pulse_l.post_processes = [cleanup_strings, calc_dur_l, slide_start_l]
pulse_l.context = {'durdx': 0}

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

pulse_l.time_limit = 600

pulse_r = copy.deepcopy(pulse_l)
pulse_r.notes = []
pulse_r.pan(80)
pulse_r.post_processes = [cleanup_strings, calc_dur_r, slide_start_r]


texture1 = copy.deepcopy(pulse_l)
texture1.pan(45).rhythms(Itemstream("q e s h".split(), notetype=notetypes.rhythm, streammode=streammodes.heap)).durs(lambda note: note.rhythm).amps(1.0)

texture1.start_time = utils.rhythm_to_duration('q', texture1.get_tempo()) * 4 * (4)

texture1.index(Itemstream([18.394266363423284, 29.986405701944328, 2.3787051284598992, 30.06279737830769,
                        18.511066510650128, 42.11027927574142, 41.84313592235877, 53.576331546688465]))

texture1.post_processes = [cleanup_strings, texture1_fadein]
texture1.context['texture_start'] = texture1.start_time
texture1.time_limit = 75

texture2 = copy.deepcopy(texture1)
texture2.start_time = 60
texture2.streams[keys.index].streammode = streammodes.heap
texture2.rhythms(Itemstream("q e e. s s s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture2.post_processes = [cleanup_strings]
texture2.time_limit = 600


texture3 = copy.deepcopy(texture2)
texture3.start_time = 90
texture3.rhythms(Itemstream("w+w w h q s s s s s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture3.post_processes = [cleanup_strings, texture3_fadeout]
texture3.time_limit = 600
texture3.context['texture_start'] = texture3.start_time
texture3.context['texture_end'] = texture3.time_limit

pulse_l.add_generator(texture1)
pulse_l.add_generator(texture2)
pulse_l.add_generator(texture3)
pulse_l.add_generator(pulse_r)

pulse_l.generate_notes()

pulse_l.end_lines = ['i99 0 ' + str(pulse_l.score_dur+10) + ' 5\n']
print(pulse_l.generate_score_string())


t = ko(pulse_l, "generic-index.orc", device_string='dac6')

#-----------------------------------------------

pulse_l.freqs([2,1,.25])
pulse_r.freqs([2,1,.25])
t.gen

pulse_l.freqs([4,1])
pulse_r.freqs([4,1])
t.gen

pulse_l.freqs(2)
pulse_r.freqs(2)
t.gen()

texture1.freqs(2)
texture2.freqs(1)
texture3.freqs(1)
t.gen()

texture1.amps(.5)
texture2.amps(.5)
texture3.amps(.5)
t.gen()



texture1.rhythms(Itemstream("s ".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture2.rhythms(Itemstream("s ".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture3.rhythms(Itemstream("s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
t.gen()

texture1.rhythms(Itemstream("s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture2.rhythms(Itemstream("s s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
texture3.rhythms(Itemstream(" s s s".split(), notetype=notetypes.rhythm, streammode=streammodes.sequence))
t.gen()
