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

starting_point = 64
filelen = 80

def update_index(note, context):
    # note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    if context['pointer'] < starting_point:
        context['pointer'] = starting_point
    note.pfields['indx'] = context['pointer']
    context['pointer'] += note.pfields[keys.duration]*10
    # note.pfields[keys.duration] = note.pfields[keys.duration]*10
    if note.pfields['indx'] > filelen:
        note.pfields['indx'] = starting_point
        context['pointer'] = starting_point
    context['note_count'] += 1
    if context['note_count'] % 20 == 0:
        note.pfields[keys.duration] = .5

def process_flutes(note, context):
    note.pfields['indx'] = context['pointer']
    context['pointer'] += note.pfields[keys.duration]*10
    # note.pfields[keys.duration] = note.pfields[keys.duration]*10
    if note.pfields['indx'] > 110:
        note.pfields['indx'] = starting_point
        context['pointer'] = starting_point
    context['note_count'] += 1
    if context['note_count'] % 5 == 0:
        note.pfields[keys.duration] = .5
        note.pfields[keys.percent] = .01

g = BasicLine()
g.with_rhythm(Itemstream('q. e. e. e s s s s q'.split(),notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120)).with_duration(.05).with_amps(Itemstream([1]*8 + [0])).with_freqs(1).with_pan(45).with_dist(30).with_percent(.01)

g.set_stream('orig_rhythm', .25)
g.set_stream('inst_file', '\"/Volumes/Jim/Music/Portfolio/_Foley/ClaraStoryM.wav\"')
g.set_stream('output_prefix', 0)
g.set_stream('ifadein', 0)
g.set_stream('ifadeout', 0)
g.gen.pfields += [keys.index, 'orig_rhythm', 'inst_file', 'output_prefix', 'ifadein', 'ifadeout']
g.gen.note_limit = 100
g.gen.post_processes = [update_index]
g.gen.context = {'pointer': 0, 'note_count': 0}


g2 = copy.deepcopy(g)
g2.gen.streams[keys.pan] = 10
g2.gen.streams[keys.rhythm] = Itemstream('s'.split(), notetype=notetypes.rhythm,  streammode=streammodes.sequence, tempo=120)
g2.gen.start_time = 5
g.gen.add_generator(g2.gen)

g3 = copy.deepcopy(g)
g3.gen.streams[keys.pan] = 80
g3.gen.streams[keys.rhythm] = Itemstream('s s s e e q'.split(), notetype=notetypes.rhythm,  streammode=streammodes.heap, tempo=120)
g3.gen.start_time = 10
g.gen.add_generator(g3.gen)


flutes = copy.deepcopy(g)
flutes.gen.streams[keys.distance] = 5
flutes.gen.streams[keys.amplitude] = 1
flutes.gen.streams[keys.pan] = 45
flutes.gen.streams[keys.percent] = .1
flutes.gen.streams['inst_file'] = Itemstream(['\"/Volumes/Jim/Music/Portfolio/_Foley/Cinque Terre Flute.aiff\"'])
flutes.gen.streams[keys.rhythm] = Itemstream('q q q q q'.split(), notetype=notetypes.rhythm,  streammode=streammodes.heap, tempo=60)
flutes.gen.post_processes = [process_flutes]
flutes.gen.start_time = 15
g.gen.add_generator(flutes.gen)

g.gen.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
g.gen.time_limit = 60

g.gen.generate_notes()

reverb_time = 10
g.gen.end_lines = ['i99 0 ' + str(g.gen.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(g.gen.generate_score_string())

cs_utils.play_csound("../books-style/generic-index.orc", g.gen, silent=True, args_list=['-odac1'])
# ,'-+rtaudio=CoreAudio'])

# lilsten to the repeatign ds here -
#        ('filepitch', Itemstream(('b '*8 + 'ds '*8 + 'fs '*8).split())),
# g.context['rhythms'] = ['s', '32', '32', '32', '32', 'e', 'e.', '32', 'e', '32', 's', '32', 'h', 'e', 'e', 'e.', '32', '32', 'h', '32', '32', '32', '32', 's']
# g.context['indexes'] = [41.09457734479521, 34.83612735669396, 4.125806261845879, 25.552187160672982, 19.26888478368347, 16.35334493262544, 3.6357973817001277, 53.13542471591472, 5.310456402096904, 5.833999653433175, 48.24784082534548, 26.98857063919712, 27.817313953211936, 10.920874533169657, 37.5951115787286, 4.581076584030113, 17.75646735953427, 20.95225347612351, 22.192846820178094, 17.535204288692963, 26.01652709020115, 31.78940154832977, 34.71990602843929, 7.868712245874406]
# 1541470791
