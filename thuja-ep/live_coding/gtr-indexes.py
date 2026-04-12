from __future__ import print_function
import ctcsound
from thuja.notegenerator import Line, NoteGenerator, NoteGeneratorThread
from thuja.itemstream import streammodes, notetypes, Itemstream
import thuja.csound_utils as cs_utils
from thuja.streamkeys import StreamKey as key

import thuja.utils as utils
import random

ost_1 = "a2 b c3 a2 d3 a2 d3 e3 a2 e3 a2".split()
ost_2 = "f2 g a f b f b c3 f2 b f".split()
ost_3 = "e2 f2 g a e2 b e2 b c3 e2 d2 f".split()

def durations(note, context):

    note.pfields[key.duration] = 1 * ((context["duration_step"] % 22) / 22) + .1
    context["duration_step"] = context["duration_step"] + 1

def amps(note, context):

    note.pfields[key.amplitude] = .4 * ((context["duration_step"] % 22) / 22) + .1
    # context["duration_step"] = context["duration_step"] + 1



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


def cleanup_strings_gtrs(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_gtrs/' + note.pfields[key.frequency] + '.wav' + '"'

def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_ebows/' + utils.freq_to_pc(note.pfields[key.frequency], False) + '.wav' + '"'

def random_indexes(note, context):
    note.pfields[key.index] = random.random()*20

def freq_to_file(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/single-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '.wav' + '"')
        note.pfields[key.frequency] = 1
    pass

def freq_to_file_5ths(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1
    pass

top = (
    Line().with_rhythm(Itemstream('w+w+w+w', notetype=notetypes.rhythm ))
        .with_duration(1000)
        .with_amps(1)
        .with_pitches(Itemstream('g3 f'.split()))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

top.note_limit = 10
top.generate_notes()
# print(top.generate_score_string())

cs = cs_utils.init_csound_with_orc(['-odac', '-+rtaudio=CoreAudio'],
                                   "/Users/ben/src/csound-pieces/thuja-ep/live_coding/gtr-indexes.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(top, cs, cpt)
t.daemon = True
t.start()




a = (
    Line().with_rhythm(Itemstream(['e'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(.1)
        .with_amps(1)
        .with_pitches(Itemstream(ost_1*2 + ost_2*2, notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('45'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05))

# a.post_processes = [freq_to_file, durations, amps]
a.post_processes = [freq_to_file, durations]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.start_time = 0
a.time_limit = 1000
a.tempo([240]*18+[120]*4)
a.context["duration_step"] = 1
a.context["duration_cycle"] = 1
a.amps(.2)
top.add_generator(a)
top.g()

b = (
    Line().with_rhythm(Itemstream([['s']*16 + ['32']*16] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note: note.rhythm*.75)
        .with_amps(1)
        .with_pitches(Itemstream(['e', 'd']*32 + ['c', 'd']*32 + ['r']*64 +  ['a', 'd', 'g']*32 + ['a', 'c', 'e']*32 + ['a', 'b', 'c']*32 , notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('0 10 20 30 40 45 50 60 70 80 90'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(10)
        .with_percent(lambda note: random.random()*.04 + .01)
        .with_instr(4))

b.post_processes = [cleanup_strings_ebows, random_indexes]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .01)
b.set_stream('rel', .1)
b.with_index(0)
b.set_stream('filepitch',Itemstream([2, 3], notetype=notetypes.number, streammode=streammodes.sequence))
b.start_time = 0
b.time_limit = 4500
b.amps(2)
b.set_stream('atck', .1)
top.add_generator(b)
top.g()

# b.rhythms(Itemstream(['q']), notetype=notetypes.rhythm, streammode=streammodes.sequence)
# b.pan(Itemstream([0,90]))
a.amps(0)
a.tempo(60)
a.with_pitches(Itemstream(ost_3, notetype=notetypes.pitch, streammode=streammodes.sequence))
t.gen()

b.set_stream('filepitch',Itemstream([4, 1, .5], notetype=notetypes.number, streammode=streammodes.random))
b.amps(0)
b.with_duration(lambda note: note.rhythm * 1.5)
b.with_pitches(Itemstream(
    ['e'] * 8 + ['b'] * 8 + ['d']*4,
    notetype=notetypes.pitch, streammode=streammodes.sequence))
b.tempo(10)
t.gen()