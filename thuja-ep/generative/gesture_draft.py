from asyncio import create_subprocess_exec

from thuja.itemstream import Itemstream
from thuja.notegenerator import Line
from thuja.itemstream import streammodes, notetypes
from thuja.streamkeys import keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import random

ost_1 = "a2 b c3 a2 d3 a2 d3 e3 a2 e3 a2".split()
ost_2 = "f2 g a f b f b c3 f2 b f".split()
ost_3 = "e2 f2 g a e2 b e2 b c3 e2 d2 f".split()

def durations(note, context):

    note.pfields[keys.duration] = 1 * ((context["duration_step"] % 22) / 22) + .1
    context["duration_step"] = context["duration_step"] + 1

def amps(note, context):

    note.pfields[keys.amplitude] = .4 * ((context["duration_step"] % 22) / 22) + .1
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
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_gtrs/' + note.pfields[keys.frequency] + '.wav' + '"'


def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_ebows/' + utils.freq_to_pc(note.pfields[keys.frequency], False) + '.wav' + '"'



def random_indexes(note, context):
    note.pfields[keys.index] = random.random()*20

def freq_to_file(note, context):
    if note.pfields[keys.frequency] == 0:
         note.pfields[keys.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/single-open/'
                                     + utils.freq_to_pc(note.pfields[keys.frequency], True) + '.wav' + '"')
        note.pfields[keys.frequency] = 1
    pass

def freq_to_file_5ths(note, context):
    if note.pfields[keys.frequency] == 0:
         note.pfields[keys.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[keys.frequency], True) + '-p5.wav' + '"')
        note.pfields[keys.frequency] = 1
    pass

def spawn_gesture(note, context):
    spawn_bg = (
        Line().with_rhythm(
            Itemstream(['s'] * 8 + ['32'] * 16, notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(.1)
        .with_amps(note.pfields['spawned_amps'])
        .with_pitches(context['self'].streams[keys.frequency])
        .with_pan(Itemstream('0 10 20 30 40 45 50 60 70 80 90'.split(), notetype=notetypes.number,
                             streammode=streammodes.heap))
        .with_dist(context['self'].streams[keys.distance])
        .with_percent(context['self'].streams[keys.percent])
        .with_instr(4)
    )

    spawn_bg.post_processes = [cleanup_strings_ebows, random_indexes]
    spawn_bg.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
    spawn_bg.set_stream('atck', .001)
    spawn_bg.set_stream('rel', .1)
    spawn_bg.with_index(0)
    # spawn_bg.set_stream('filepitch', context['self'].streams['filepitch'])
    spawn_bg.set_stream('filepitch', note.pfields['filepitch'])
    spawn_bg.start_time = note.pfields[keys.start_time]
    spawn_bg.note_limit = 0

    spawn_bg.generator_dur = note.pfields[keys.duration]

    context['self'].generators.append(spawn_bg)
    pass


a = (
    Line().with_rhythm(Itemstream(['w+w'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note:note.rhythm * 1.5)
        .with_amps(0)
# .with_pitches(Itemstream([['e4', 'g4', 'a4']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pitches(Itemstream([['e', 'g', 'b', 'd'],['d', 'fs', 'a', 'cs'],['e', 'g', 'b', 'd'],['d', 'fs', 'a', 'cs']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30 45 60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(15)
        .with_percent(.01)
        .with_instr(4)
)

a.post_processes = [spawn_gesture, freq_to_file_5ths]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.set_stream('filepitch', Itemstream(['1']*4+['2']*4+['3']*4+['4']*4, notetype=notetypes.number, streammode=streammodes.sequence))
a.set_stream('spawned_amps', Itemstream(['.1']*4+['0']*4+['.1']*15, notetype=notetypes.number, streammode=streammodes.sequence))
a.start_time = 0
a.note_limit = 0
a.time_limit = 60
a.tempo(120)
a.with_index(0)
a.context['self'] = a



def melody_spawn(note, context):
    spawn_mel = (
        Line().with_rhythm(
            Itemstream('s s e q s h'.split(), notetype=notetypes.rhythm, streammode=streammodes.random, tempo=60))
        .with_duration(lambda note:note.rhythm*.75)
        .with_amps(context['melself'].streams['spawned_amps'])
        .with_pitches(context['melself'].streams[keys.frequency])
        .with_pan(context['melself'].streams[keys.pan])
        .with_dist(context['melself'].streams[keys.distance])
        .with_percent(context['melself'].streams[keys.percent])
        .with_instr(context['melself'].streams[keys.instrument])
    )

    spawn_mel.post_processes = [cleanup_strings_ebows, random_indexes]
    spawn_mel.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
    spawn_mel.set_stream('atck', .01)
    spawn_mel.set_stream('rel', random.uniform(.01, .1))
    spawn_mel.with_index(0)

    spawn_mel.set_stream('filepitch', note.pfields['filepitch'])
    spawn_mel.start_time = note.pfields[keys.start_time]
    spawn_mel.note_limit = 0
    spawn_mel.generator_dur = note.pfields[keys.duration]

    p = spawn_mel.streams[keys.frequency].values
    r = spawn_mel.streams[keys.rhythm].values

    p_index = random.randint(0, len(p) - 1)
    r_index =  p_index % len(r)

    for x in range(note.pfields['iter']):
        p.insert(p_index, p[p_index])
        r.insert(r_index, r[r_index])

    context['melself'].generators.append(spawn_mel)
    pass


def create_melody():
    melody = (
        Line().with_rhythm(Itemstream(['w'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note: note.rhythm * 1.25)
        .with_amps(0)
        .with_pitches(
            Itemstream(['c', 'd', 'e', 'f', 'g', 'a', 'b'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(10)
        .with_percent(.01)
        .with_instr(4)
    )
    melody.post_processes = [melody_spawn, freq_to_file_5ths]
    melody.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
    melody.set_stream('atck', random.uniform(.01, .1))
    melody.set_stream('rel', .1)
    melody.set_stream('filepitch', Itemstream(['3'], notetype=notetypes.number, streammode=streammodes.sequence))
    melody.set_stream('spawned_amps',
                      Itemstream('.4 .5 .6 .7'.split(), notetype=notetypes.number, streammode=streammodes.heap))
    melody.set_stream('iter',
                      Itemstream([1, 2, 3, 4, 5, 6], notetype=notetypes.number, streammode=streammodes.sequence))
    melody.start_time = 4
    melody.note_limit = 0
    melody.time_limit = 60
    melody.tempo(120)
    melody.with_index(0)
    melody.context['melself'] = melody
    return melody


melody = create_melody()
melody2 = create_melody()
melody2.with_pan(Itemstream('60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
melody2.start_time = melody2.start_time + 2
a.generators.append(melody)
a.generators.append(melody2)
a.generate_notes()


reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

cs_utils.play_csound("../1min-cs/260.orc", a, silent=True, args_list=['-odac', '-W'])
