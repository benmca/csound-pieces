from thuja.itemstream import Itemstream
from thuja.generator import BasicLine, GeneratorThread
from thuja.itemstream import streammodes, notetypes
from thuja.generator import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils
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
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields[key.frequency] = 2


def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_ebows/' + utils.freq_to_pc(note.pfields[key.frequency], False) + '.wav' + '"'
    note.pfields[key.frequency] = 3



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


a = (
    BasicLine().with_rhythm(Itemstream(['e'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(0)
        .with_amps(0)
        .with_pitches(Itemstream(ost_1*2 + ost_2*2, notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('45'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05))

a.post_processes = [freq_to_file, durations, amps]
# a.post_processes = [freq_to_file, durations]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.time_limit = 45
a.tempo(280)
a.context["duration_step"] = 1
a.context["duration_cycle"] = 1

b = (
    BasicLine().with_rhythm(Itemstream([['s']*16 + ['32']*16] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note: note.rhythm*.75)
        .with_amps(1)
        .with_pitches(Itemstream(['e', 'd'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('0 10 20 30 40 45 50 60 70 80 90'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(10)
        .with_percent(lambda note: random.random()*.04 + .01)
        .with_instr(4))

b.post_processes = [cleanup_strings_ebows, random_indexes]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .001)
b.set_stream('rel', .1)
b.with_index(0)
b.start_time = 16
b.time_limit = 45

a.add_generator(b)
a.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("258.orc", a, silent=True, args_list=['-odac0', '-W'])
