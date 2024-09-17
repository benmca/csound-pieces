from thuja.itemstream import Itemstream
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


def post_process(note, context):
    # note.pfields['inst_file'] = '"' + '/Users/ben/src/tidal/samples-extra/olalla-birds/' + pitches_to_files[note.pfields['filepitch']] + '"'
    # note.pfields.pop('filepitch')
    # # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'
    # note.pfields[keys.duration] = note.rhythm * note.pfields[keys.duration]
    pass

def add_env_streams(c, atck=.01, rel=.01):
    c.set_stream('atck', atck)
    c.set_stream('rel', rel)


container = (
    BasicLine().with_rhythm(Itemstream(['q.', 'e', 'q.', 'e', 'q', 'h', 'q.', 'e', 'q.', 'e', 'q', 'h',
 'q.', 'e', 'q.', 'e', 'q', 'q+e', 'q', 'q.', 'e', 'q.', 'e', 'h'] , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(1)
        .with_amps(1)
        .with_pitches(Itemstream(['g4', 'g4', 'a4', 'g4', 'c5', 'b4', 'g4', 'g4', 'a4', 'g4', 'd5', 'c5',
 'g4', 'g4', 'g5', 'e5', 'c5', 'b4', 'a4', 'f5', 'f5', 'e5', 'c5', 'd5', 'c5'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(70)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(container)

container.time_limit = 20
container.with_amps(.25).with_duration(lambda note: note.rhythm * .5)

a = container.deepcopy().with_pan(20).with_rhythm(Itemstream(['q', 'q', 'q', 'q', 'q', 'h', 'q', 'q', 'q', 'q', 'q', 'h',
 'q', 'q', 'q', 'q', 'q', 'q', 'h', 'q', 'q', 'q', 'q', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))

b = container.deepcopy().with_pan(40).with_rhythm(Itemstream(['q+e', 's+s+s', 'q.', 'e', 'q.', 'h', 'q+e', 's+s+s', 'q.', 'e', 'q.', 'h',
 'q+e', 's+s+s', 'q.', 'e', 'q+e', 'e.', 'q', 'q.', 's+s+s', 'q.', 'e', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
c = container.deepcopy().with_pan(50).with_rhythm(Itemstream(['e+e', 'q.', 'e', 'q.', 'e', 'q', 'q.', 'e', 'e+e', 'q.', 'e', 'h',
 'e+e', 'q.', 'e', 'q.', 'e', 'q+e', 'e.', 'q.', 'e', 'q.', 'e', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))


container.add_generator(a)
container.add_generator(b)
container.add_generator(c)


d = (container.deepcopy().with_pan(15).with_rhythm(Itemstream(['q+e', 'e', 'q.', 'e', 'q', 'h', 'q.', 'e', 'q+e', 'e', 'q.', 'h',
 'q.', 'e', 'q.', 'e', 'q+e', 'q', 'q.', 's+s+s', 'q.', 'e', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(['a4', 'a4', 'b4', 'a4', 'd5', 'c5', 'a4', 'a4', 'b4', 'a4', 'e5', 'd5',
 'a4', 'a4', 'a5', 'f5', 'd5', 'c5', 'b4', 'g5', 'g5', 'f5', 'd5', 'e5', 'd5'], notetype=notetypes.pitch, streammode=streammodes.sequence)))
d.start_time = 20
d.time_limit = 40

e = (container.deepcopy().with_pan(30).with_rhythm(Itemstream(['e+e', 'q.', 'e', 'q.', 'e', 'q', 'q.', 'e', 'e+e', 'q.', 'e', 'h',
 'e+e', 'q.', 'e', 'q.', 'e', 'q+e', 'e.', 'q.', 'e', 'q.', 'e', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(['a4', 'a4', 'b4', 'a4', 'd5', 'c5', 'a4', 'a4', 'b4', 'a4', 'e5', 'd5',
 'a4', 'a4', 'a5', 'f5', 'd5', 'c5', 'b4', 'g5', 'g5', 'f5', 'd5', 'e5', 'd5'], notetype=notetypes.pitch, streammode=streammodes.sequence)))
e.start_time = 20
e.time_limit = 40

f = (container.deepcopy().with_pan(60).with_rhythm(Itemstream(['q', 's+s+s', 'q.', 'e', 'q.', 'e', 'q.', 'e', 's+s+s', 'q.', 'e', 'h',
 'q+e', 'e', 'q.', 's+s+s', 'q.', 'e.', 'q', 'q.', 'e', 'q.', 'e', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(['a4', 'a4', 'b4', 'a4', 'd5', 'c5', 'a4', 'a4', 'b4', 'a4', 'e5', 'd5',
 'a4', 'a4', 'a5', 'f5', 'd5', 'c5', 'b4', 'g5', 'g5', 'f5', 'd5', 'e5', 'd5'], notetype=notetypes.pitch, streammode=streammodes.sequence)))
f.start_time = 20
f.time_limit = 40

g = (container.deepcopy().with_pan(75).with_rhythm(Itemstream(['q.', 's+s+s', 'q.', 'e', 'q+e', 'h', 'q.', 's+s+s', 'q.', 'e', 'q.', 'h',
 'q.', 'e', 'q+e', 'e.', 'q', 'q.', 's+s+s', 'q.', 'e', 'q.', 'h'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(['a4', 'a4', 'b4', 'a4', 'd5', 'c5', 'a4', 'a4', 'b4', 'a4', 'e5', 'd5',
 'a4', 'a4', 'a5', 'f5', 'd5', 'c5', 'b4', 'g5', 'g5', 'f5', 'd5', 'e5', 'd5'], notetype=notetypes.pitch, streammode=streammodes.sequence)))
g.start_time = 20
g.time_limit = 40

# Variations in E-flat harmonic minor (highlighting the leading tone D natural)

variation_3_pitches = [
    # Variation 1
    ['eb4', 'eb4', 'f4', 'eb4', 'ab4', 'gb4', 'eb4', 'eb4', 'f4', 'eb4', 'bb4', 'ab4',
     'eb4', 'eb4', 'eb5', 'cb5', 'ab4', 'gb4', 'f4', 'd5', 'd5', 'cb5', 'ab4', 'bb4', 'ab4'],

    # Variation 2
    ['eb4', 'eb4', 'f4', 'eb4', 'ab4', 'gb4', 'eb4', 'eb4', 'f4', 'eb4', 'bb4', 'ab4',
     'eb4', 'eb4', 'eb5', 'cb5', 'ab4', 'gb4', 'f4', 'd5', 'd5', 'cb5', 'ab4', 'bb4', 'ab4'],

    # Variation 3
    ['eb4', 'eb4', 'f4', 'eb4', 'ab4', 'gb4', 'eb4', 'eb4', 'f4', 'eb4', 'bb4', 'ab4',
     'eb4', 'eb4', 'eb5', 'cb5', 'ab4', 'gb4', 'f4', 'd5', 'd5', 'cb5', 'ab4', 'bb4', 'ab4'],

    # Variation 4
    ['eb4', 'eb4', 'f4', 'eb4', 'ab4', 'gb4', 'eb4', 'eb4', 'f4', 'eb4', 'bb4', 'ab4',
     'eb4', 'eb4', 'eb5', 'cb5', 'ab4', 'gb4', 'f4', 'd5', 'd5', 'cb5', 'ab4', 'bb4', 'ab4']
]

variation_3_rhythms = [
    # Variation 1
    ['q.', 'e', 'q.', 'e', 'q+e', 'h', 'q.', 'e', 'q.', 'e', 'q', 'h',
     'q.', 'e', 'q.', 'e', 'q+e', 'q', 'q.', 'e', 'q.', 'e', 'q.', 'h'],

    # Variation 2
    ['q+e', 's+s+s', 'q.', 'e', 'q', 'h', 'q+e', 's+s+s', 'q.', 'e', 'q.', 'h',
     'q.', 'e', 'q+e', 'e.', 'q.', 'e', 'q.', 'e', 'h'],

    # Variation 3
    ['e+e', 'q.', 'e', 'q.', 'e', 'q', 'q.', 'e', 'e+e', 'q.', 'e', 'h',
     'e+e', 'q.', 'e', 'q.', 'e', 'q+e', 'e.', 'q.', 'e', 'q.', 'e', 'h'],

    # Variation 4
    ['q', 's+s+s', 'q.', 'e', 'q.', 'e', 'q.', 'e', 's+s+s', 'q.', 'e', 'h',
     'q+e', 'e', 'q.', 's+s+s', 'q.', 'e.', 'q', 'q.', 'e', 'q.', 'e', 'h']
]

h = (container.deepcopy().with_pan(0).with_rhythm(Itemstream(variation_3_rhythms[0], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(variation_3_pitches[0], notetype=notetypes.pitch, streammode=streammodes.sequence)))
h.start_time = 40
h.time_limit = 60

i = (container.deepcopy().with_pan(30).with_rhythm(Itemstream(variation_3_rhythms[1], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(variation_3_pitches[1], notetype=notetypes.pitch, streammode=streammodes.sequence)))
i.start_time = 40
i.time_limit = 60

j = (container.deepcopy().with_pan(60).with_rhythm(Itemstream(variation_3_rhythms[2], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(variation_3_pitches[1], notetype=notetypes.pitch, streammode=streammodes.sequence)))
j.start_time = 40
j.time_limit = 60

k = (container.deepcopy().with_pan(90).with_rhythm(Itemstream(variation_3_rhythms[3], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(variation_3_pitches[1], notetype=notetypes.pitch, streammode=streammodes.sequence)))
k.start_time = 40
k.time_limit = 60



container.add_generator(d)
container.add_generator(e)
container.add_generator(f)
container.add_generator(g)

container.add_generator(h)
container.add_generator(i)
container.add_generator(j)
container.add_generator(k)

# Free-form melody in E-flat harmonic minor

# Free-form variations in E-flat harmonic minor

free_form_pitches = [
    # Free-form Variation 1
    ['eb4', 'gb4', 'f4', 'd5', 'bb4', 'cb5', 'eb4', 'd5', 'ab4', 'eb5', 'gb4',
     'bb5', 'f4', 'cb5', 'd5', 'eb4', 'ab5', 'bb4', 'gb5', 'eb4'],

    # Free-form Variation 2
    ['eb4', 'f4', 'gb4', 'bb4', 'ab4', 'd5', 'f4', 'cb5', 'eb5', 'd5',
     'gb4', 'bb4', 'eb4', 'f4', 'ab4', 'cb5', 'eb5', 'd5', 'f4'],

    # Free-form Variation 3
    ['eb4', 'd5', 'cb5', 'ab4', 'bb4', 'gb4', 'f4', 'd5', 'ab5', 'bb4',
     'cb5', 'eb4', 'gb4', 'bb4', 'd5', 'f4', 'ab5', 'bb5', 'eb4', 'gb5'],

    # Free-form Variation 4
    ['f4', 'gb4', 'd5', 'bb4', 'ab4', 'eb5', 'cb5', 'f4', 'eb4', 'gb5',
     'bb5', 'ab4', 'd5', 'f4', 'cb5', 'eb4', 'gb4', 'bb4', 'd5', 'ab4']
]

free_form_rhythms = [
    # Free-form Variation 1
    ['q+e', 's+s+s', 'q.', 'e.', 'h', 'q.', 'e', 's+s+s', 'q+e', 'h',
     'q', 'e+e', 'q.', 'e', 's+s+s', 'q.', 'h', 'q+e', 'q.', 'e'],

    # Free-form Variation 2
    ['e+e', 'q.', 'e', 's+s+s', 'q+e', 'e.', 'q', 'q.', 's+s+s', 'q+e',
     'e', 'h', 'q.', 'e.', 's+s+s', 'q.', 'e+e', 'q.', 'q+e', 'h'],

    # Free-form Variation 3
    ['q.', 'e', 's+s+s', 'q+e', 'e.', 'q', 'q.', 'e', 'h', 'q.',
     's+s+s', 'q+e', 'e', 'q.', 'h', 'q.', 'e', 'q+e', 'q.', 'e+e'],

    # Free-form Variation 4
    ['q+e', 'h', 'q.', 'e', 's+s+s', 'q.', 'e.', 'q', 's+s+s', 'q+e',
     'e', 'q.', 'h', 'q+e', 's+s+s', 'q.', 'e.', 'q', 'e+e', 'q']
]
l = (container.deepcopy().with_pan(0).with_rhythm(Itemstream(free_form_rhythms[0], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(free_form_pitches[0], notetype=notetypes.pitch, streammode=streammodes.sequence)))
l.start_time = 60
l.time_limit = 76

m = (container.deepcopy().with_pan(35).with_rhythm(Itemstream(free_form_rhythms[1], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(free_form_pitches[1], notetype=notetypes.pitch, streammode=streammodes.sequence)))
m.start_time = 60
m.time_limit = 76

n = (container.deepcopy().with_pan(55).with_rhythm(Itemstream(free_form_rhythms[2], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(free_form_pitches[2], notetype=notetypes.pitch, streammode=streammodes.sequence)))
n.start_time = 60
n.time_limit = 76

o = (container.deepcopy().with_pan(90).with_rhythm(Itemstream(free_form_rhythms[3], notetype=notetypes.rhythm, streammode=streammodes.sequence))
     .with_pitches(Itemstream(free_form_pitches[3], notetype=notetypes.pitch, streammode=streammodes.sequence)))
o.start_time = 60
o.time_limit = 76

container.add_generator(l)
container.add_generator(m)
container.add_generator(n)
container.add_generator(o)

container.generate_notes()

reverb_time = 10
container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("226.orc", container, silent=True, args_list=['-odac0', '-W'])
