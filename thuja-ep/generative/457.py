from asyncio import create_subprocess_exec

from thuja.itemstream import Itemstream
from thuja.notegenerator import Line
from thuja.itemstream import streammodes, notetypes
from thuja.streamkeys import keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import random


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
        .with_instr(2)
    )

    # spawn_bg.set_stream('atck', .001)
    # spawn_bg.set_stream('rel', .1)
    # spawn_bg.set_stream('filepitch', context['self'].streams['filepitch'])
    # spawn_bg.set_stream('filepitch', note.pfields['filepitch'])
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
        .with_pitches(Itemstream([['e5', 'g', 'b', 'd'],['d', 'fs', 'a', 'cs'],['e', 'g', 'b', 'd'],['d', 'fs', 'a', 'cs']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30 45 60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(15)
        .with_percent(.01)
        .with_instr(2)
)
a.set_stream('spawned_amps', Itemstream(['.1']*4+['.3']*4+['.1']*15, notetype=notetypes.number, streammode=streammodes.sequence))

a.post_processes = [spawn_gesture]
a.start_time = 0
a.note_limit = 0
a.time_limit = 30
a.tempo(120)
a.context['self'] = a


def melody_spawn(note, context):
    spawn_mel = (
        Line().with_rhythm(
            Itemstream('s '.split(), notetype=notetypes.rhythm, streammode=streammodes.random, tempo=120))
        .with_duration(lambda note:note.rhythm)
        .with_amps(context['melself'].streams['spawned_amps'])
        .with_pitches(context['melself'].streams[keys.frequency])
        .with_pan(context['melself'].streams[keys.pan])
        .with_dist(context['melself'].streams[keys.distance])
        .with_percent(context['melself'].streams[keys.percent])
        .with_instr(context['melself'].streams[keys.instrument])
    )

    spawn_mel.start_time = note.pfields[keys.start_time]
    spawn_mel.note_limit = 0
    spawn_mel.generator_dur = note.pfields[keys.duration]

    p = spawn_mel.streams[keys.frequency].values
    r = spawn_mel.streams[keys.rhythm].values

    p_index = random.randint(0, len(p) - 1)
    r_index =  p_index % len(r)

    # for x in range(note.pfields['iter']):
    #     p.insert(p_index, p[p_index])
    #     r.insert(r_index, r[r_index])

    context['melself'].generators.append(spawn_mel)
    pass


def create_melody():
    melody = (
        Line().with_rhythm(Itemstream(['w'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note: note.rhythm * 1.25)
        .with_amps(0)
        .with_pitches(
            Itemstream(['c3', 'd', 'e', 'f', 'g', 'a', 'b'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(5)
        .with_percent(.04)
        .with_instr(2)
    )
    melody.post_processes = [melody_spawn]
    melody.set_stream('spawned_amps',
                      Itemstream('2'.split(), notetype=notetypes.number, streammode=streammodes.heap))
    melody.set_stream('iter',
                      Itemstream([1, 2, 3, 4, 5, 6], notetype=notetypes.number, streammode=streammodes.sequence))
    melody.start_time = 4
    melody.note_limit = 0
    melody.time_limit = 30
    melody.tempo(120)
    melody.with_index(0)
    melody.context['melself'] = melody
    return melody


melody = create_melody()
melody2 = create_melody()
melody2.with_pitches(Itemstream('a2 c a g r r r r a3 c a g '.split(), notetype=notetypes.pitch, streammode=streammodes.sequence)).with_pan(Itemstream('80'.split(), notetype=notetypes.number, streammode=streammodes.heap))
a.generators.append(melody)
a.generators.append(melody2)
a.generate_notes()


reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

cs_utils.play_csound("sine.orc", a, silent=True, args_list=['-odac1'])
