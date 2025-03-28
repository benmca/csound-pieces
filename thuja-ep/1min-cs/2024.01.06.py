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

starting_point = 0

files = [
    ["c0.wav", 26],
    ["c1.wav", 20],
    ["c2.wav", 15],
    ["e0.wav", 15],
    ["e1.wav", 14],
    ["e2.wav", 4],
    ["g0.wav", 15],
    ["g1.wav", 13],
    ["g2.wav", 6],
    ["b0.wav", 9],
    ["b1.wav", 8],
    ["b2.wav", 7]
]

path_to_1min = '/Volumes/T7 Shield/1min/'


def update_index(note, context):
    # note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    if context['pointer'] < starting_point:
        context['pointer'] = starting_point
    note.pfields['indx'] = context['pointer']
    if 'phrase' in context and (context['phrase'] == 1 or context['phrase'] == 2):
        note.pfields[keys.duration] = note.rhythm * .5
    elif 'phrase' in context and (context['phrase'] == 3):
        note.pfields[keys.duration] = note.rhythm * .75
    else:
        note.pfields[keys.duration] = note.rhythm * 1.05

    context['pointer'] += note.pfields[keys.duration]
    # note.pfields[keys.duration] = note.pfields[keys.duration]*10
    note.pfields['inst_file'] = '\"' + path_to_1min + '6/sources/' + files[note.pfields['filedx']][0] + '\"'
    if note.pfields['indx'] > files[note.pfields['filedx']][1]:
        note.pfields['indx'] = starting_point
        context['pointer'] = starting_point
    context['note_count'] += 1

container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(1)
        .with_amps(0)
        .with_freqs(1)
        .with_pan(45)
        .with_dist(30)
        .with_percent(.02)
)

container.set_stream('inst_file', '\"' + path_to_1min +  '6/sources/c0.wav\"')
container.set_stream('orig_rhythm', .01)
container.set_stream('output_prefix', 0)
container.set_stream('ifadein', 0)
container.set_stream('ifadeout', 0)
container.set_stream('filedx', Itemstream(0, notetype=notetypes.number, streammode=streammodes.random))
container.pfields += [keys.index, 'orig_rhythm', 'inst_file', 'output_prefix', 'ifadein', 'ifadeout']
container.note_limit = 1
container.post_processes = [update_index]
container.context = {'pointer': 0, 'note_count': 0}

first_phrase = container.deepcopy()
second_phrase = container.deepcopy()
third_phrase = container.deepcopy()
fourth_phrase = container.deepcopy()

rhythm_stream = Itemstream(np.linspace(.01, .1, 100).tolist() + np.linspace(.1, .01, 100).tolist() , notetype=notetypes.number, streammode=streammodes.sequence, tempo=120)
rhythm_stream_2 = Itemstream(np.linspace(.01, .2, 100).tolist() + np.linspace(.2, .01, 100).tolist() , notetype=notetypes.number, streammode=streammodes.sequence, tempo=120)
rhythm_stream_3 = Itemstream(np.linspace(.01, .3, 75).tolist() + np.linspace(.3, .01, 75).tolist() , notetype=notetypes.number, streammode=streammodes.sequence, tempo=120)

c_swell = (
    BasicLine().with_rhythm(rhythm_stream)
        .with_duration(1)
        .with_amps(1)
        .with_freqs(1)
        .with_pan(45)
        .with_dist(20)
        .with_percent(.02)
)
c_swell.set_stream('inst_file', '\"' + path_to_1min +  '6/sources/c0.wav\"')
c_swell.set_stream('orig_rhythm', .01)
c_swell.set_stream('output_prefix', 0)
c_swell.set_stream('ifadein', 0)
c_swell.set_stream('ifadeout', 0)
c_swell.set_stream('filedx', Itemstream(0, notetype=notetypes.number, streammode=streammodes.random))
c_swell.pfields += [keys.index, 'orig_rhythm', 'inst_file', 'output_prefix', 'ifadein', 'ifadeout']
c_swell.note_limit = 200
c_swell.post_processes = [update_index]
c_swell.context = {'pointer': 0, 'note_count': 0, 'phrase': 1}

c_swell2 = c_swell.deepcopy()
c_swell2.pan(10)
c_swell2.set_stream('filedx', Itemstream(1, notetype=notetypes.number, streammode=streammodes.random))

c_swell3 = c_swell.deepcopy()
c_swell3.pan(80)
c_swell3.set_stream('filedx', Itemstream(2, notetype=notetypes.number, streammode=streammodes.random))

first_phrase.add_generator(c_swell)
first_phrase.add_generator(c_swell2)
first_phrase.add_generator(c_swell3)
########################################
c_0 = c_swell.deepcopy()
c_0.context['phrase'] = 2
c_1 = copy.deepcopy(c_swell2)
c_1.context['phrase'] = 2
c_2 = copy.deepcopy(c_swell3)
c_2.context['phrase'] = 2

g_0 = c_swell.deepcopy()
g_0.pan(45)
g_0.context['phrase'] = 2
g_0.set_stream('filedx', Itemstream(6, notetype=notetypes.number, streammode=streammodes.random))

g_1 = c_swell.deepcopy()
g_1.pan(80)
g_1.context['phrase'] = 2
g_1.set_stream('filedx', Itemstream(7, notetype=notetypes.number, streammode=streammodes.random))

g_2 = c_swell.deepcopy()
g_2.pan(10)
g_2.context['phrase'] = 2
g_2.set_stream('filedx', Itemstream(8, notetype=notetypes.number, streammode=streammodes.random))

second_phrase.add_generator(c_0)
second_phrase.add_generator(c_1)
second_phrase.add_generator(c_2)
second_phrase.add_generator(g_0)
second_phrase.add_generator(g_1)
second_phrase.add_generator(g_2)

c_0_p3 = copy.deepcopy(c_0)
c_0_p3.context['phrase'] = 3
c_1_p3 = copy.deepcopy(c_1)
c_1_p3.context['phrase'] = 3
c_2_p3 = copy.deepcopy(c_2)
c_2_p3.context['phrase'] = 3
g_0_p3 = copy.deepcopy(g_0)
g_0_p3.context['phrase'] = 3
g_1_p3 = copy.deepcopy(g_1)
g_1_p3.context['phrase'] = 3
g_2_p3 = copy.deepcopy(g_2)
g_2_p3.context['phrase'] = 3


b_0 = c_swell.deepcopy()
b_0.pan(45)
b_0.context['phrase'] = 3
b_0.set_stream('filedx', Itemstream(9, notetype=notetypes.number, streammode=streammodes.random))

b_1 = c_swell.deepcopy()
b_1.pan(80)
b_1.context['phrase'] = 3
b_1.set_stream('filedx', Itemstream(10, notetype=notetypes.number, streammode=streammodes.random))

b_2 = c_swell.deepcopy()
b_2.pan(10)
b_2.context['phrase'] = 3
b_2.set_stream('filedx', Itemstream(11, notetype=notetypes.number, streammode=streammodes.random))

f_0 = c_swell.deepcopy()
f_0.pan(45)
f_0.freqs(.75)
f_0.dist(10)
f_0.context['phrase'] = 3
f_0.set_stream('filedx', Itemstream(0, notetype=notetypes.number, streammode=streammodes.random))


f_1 = c_swell.deepcopy()
f_1.pan(80)
f_1.freqs(.75)
f_1.dist(10)
f_1.context['phrase'] = 3
f_1.set_stream('filedx', Itemstream(1, notetype=notetypes.number, streammode=streammodes.random))

f_2 = c_swell.deepcopy()
f_2.pan(10)
f_2.freqs(.75)
f_2.dist(10)
f_2.context['phrase'] = 3
f_2.set_stream('filedx', Itemstream(2, notetype=notetypes.number, streammode=streammodes.random))

lowc_0 = c_swell.deepcopy()
lowc_0.pan(45)
lowc_0.freqs(.75)
lowc_0.dist(10)
lowc_0.context['phrase'] = 3
lowc_0.set_stream('filedx', Itemstream(6, notetype=notetypes.number, streammode=streammodes.random))

lowc_1 = c_swell.deepcopy()
lowc_1.pan(80)
lowc_1.freqs(.75)
lowc_1.dist(10)
lowc_1.context['phrase'] = 3
lowc_1.set_stream('filedx', Itemstream(7, notetype=notetypes.number, streammode=streammodes.random))

lowc_2 = c_swell.deepcopy()
lowc_2.pan(10)
lowc_2.freqs(.75)
lowc_1.dist(10)
lowc_2.context['phrase'] = 3
lowc_2.set_stream('filedx', Itemstream(8, notetype=notetypes.number, streammode=streammodes.random))

third_phrase.add_generator(c_0_p3)
third_phrase.add_generator(c_1_p3)
third_phrase.add_generator(c_2_p3)

third_phrase.add_generator(g_0_p3)
third_phrase.add_generator(g_1_p3)
third_phrase.add_generator(g_2_p3)

third_phrase.add_generator(b_0)
third_phrase.add_generator(b_1)
third_phrase.add_generator(b_2)

third_phrase.add_generator(f_0)
third_phrase.add_generator(f_1)
third_phrase.add_generator(f_2)

third_phrase.add_generator(lowc_0)
third_phrase.add_generator(lowc_1)
third_phrase.add_generator(lowc_2)

for x in third_phrase.generators:
    x.streams[keys.rhythm] = rhythm_stream_2
    x.streams[keys.amplitude] = Itemstream(.6)


c_0_p4 = copy.deepcopy(c_0)
c_0_p4.context['phrase'] = 4
c_1_p4 = copy.deepcopy(c_1)
c_1_p4.context['phrase'] = 4
c_2_p4 = copy.deepcopy(c_2)
c_2_p4.context['phrase'] = 4
g_0_p4 = copy.deepcopy(g_0)
g_0_p4.context['phrase'] = 4
g_1_p4 = copy.deepcopy(g_1)
g_1_p4.context['phrase'] = 4
g_2_p4 = copy.deepcopy(g_2)
g_2_p4.context['phrase'] = 4

f_0_p4 = copy.deepcopy(f_0)
f_0_p4.context['phrase'] = 4
f_1_p4 = copy.deepcopy(f_1)
f_1_p4.context['phrase'] = 4
f_2_p4 = copy.deepcopy(f_2)
f_2_p4.context['phrase'] = 4
lowc_0_p4 = copy.deepcopy(lowc_0)
lowc_0_p4.context['phrase'] = 4
lowc_1_p4 = copy.deepcopy(lowc_1)
lowc_1_p4.context['phrase'] = 4
lowc_2_p4 = copy.deepcopy(lowc_2)
lowc_2_p4.context['phrase'] = 4

e_0 = c_swell.deepcopy()
e_0.pan(45)
e_0.freqs(2)
# e_0.dist(5)
# e_0.with_percent(.03)
e_0.context['phrase'] = 4
e_0.set_stream('filedx', Itemstream(6, notetype=notetypes.number, streammode=streammodes.random))

e_1 = c_swell.deepcopy()
e_1.pan(80)
e_1.freqs(2)
# e_1.dist(5)
# e_1.with_percent(.03)
e_1.context['phrase'] = 4
e_1.set_stream('filedx', Itemstream(7, notetype=notetypes.number, streammode=streammodes.random))

e_2 = c_swell.deepcopy()
e_2.pan(10)
e_2.freqs(2)
# e_2.dist(5)
# e_2.with_percent(.03)
e_2.context['phrase'] = 4
e_2.set_stream('filedx', Itemstream(8, notetype=notetypes.number, streammode=streammodes.random))

b_0 = c_swell.deepcopy()
b_0.pan(45)
b_0.freqs(2.5)
# b_0.dist(5)
# b_0.with_percent(.03)
b_0.context['phrase'] = 4
b_0.set_stream('filedx', Itemstream(6, notetype=notetypes.number, streammode=streammodes.random))

b_1 = c_swell.deepcopy()
b_1.pan(80)
b_1.freqs(2.5)
# b_1.dist(5)
# b_1.with_percent(.03)
b_1.context['phrase'] = 4
b_1.set_stream('filedx', Itemstream(7, notetype=notetypes.number, streammode=streammodes.random))

b_2 = c_swell.deepcopy()
b_2.pan(10)
b_2.freqs(2.5)
# b_2.with_percent(.03)
# b_2.dist(5)
b_2.context['phrase'] = 4
b_2.set_stream('filedx', Itemstream(8, notetype=notetypes.number, streammode=streammodes.random))

superlowc_0 = copy.deepcopy(c_0)
superlowc_0.context['phrase'] = 4
superlowc_0.freqs(.675)
# superlowc_0.dist(5)
superlowc_1 = copy.deepcopy(c_1)
superlowc_1.context['phrase'] = 4
superlowc_1.freqs(.675)
# superlowc_1.dist(10)
superlowc_2 = copy.deepcopy(c_2)
superlowc_2.context['phrase'] = 4
superlowc_2.freqs(.675)
# superlowc_2.dist(5)

fourth_phrase.add_generator(c_0_p4)
fourth_phrase.add_generator(c_1_p4)
fourth_phrase.add_generator(c_2_p4)

fourth_phrase.add_generator(g_0_p4)
fourth_phrase.add_generator(g_1_p4)
fourth_phrase.add_generator(g_2_p4)

fourth_phrase.add_generator(f_0_p4)
fourth_phrase.add_generator(f_1_p4)
fourth_phrase.add_generator(f_2_p4)

fourth_phrase.add_generator(lowc_0_p4)
fourth_phrase.add_generator(lowc_1_p4)
fourth_phrase.add_generator(lowc_2_p4)

fourth_phrase.add_generator(e_0)
fourth_phrase.add_generator(e_1)
fourth_phrase.add_generator(e_2)

fourth_phrase.add_generator(b_0)
fourth_phrase.add_generator(b_1)
fourth_phrase.add_generator(b_2)

fourth_phrase.add_generator(superlowc_0)
fourth_phrase.add_generator(superlowc_1)
fourth_phrase.add_generator(superlowc_2)


for x in fourth_phrase.generators:
    x.streams[keys.rhythm] = rhythm_stream_3
    x.note_limit = 150
    x.streams[keys.amplitude] = Itemstream(.4)



second_phrase.start_time = 10
third_phrase.start_time = 20
fourth_phrase.start_time = 40

container.add_generator(first_phrase)
container.add_generator(second_phrase)
container.add_generator(third_phrase)
container.add_generator(fourth_phrase)


container.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
# g.time_limit = 60

container.generate_notes()

reverb_time = 10
container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.generate_score_string())

cs_utils.play_csound("../books-style/generic-index.orc", container, silent=True, args_list=['-odac0'])
# ,'-+rtaudio=CoreAudio'])

