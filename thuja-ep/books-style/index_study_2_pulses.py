from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import keys
from thuja.itemstream import streammodes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
from collections import OrderedDict
import copy
import random
import time

#voivod machine
# seed = 1536186904

digipines = {
    'rhythms' : [],
    'indexes': []
}

digipines2 = {
    'rhythms' : [],
    'indexes': []
}

digipines_break = {
    'rhythms' : [],
    'indexes': []
}

# seed = 1536186845
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines['rhythms'].append(['e.', 's', 'h', 's', 's', 'q', 's', 'e.', 'e', 's', 'e.', 's', 'h', 's', 's', 'h', 'q', 's', 's', 'e.', 'h', 's', 's', 'e.', 's', 's', 's', 's', 'h', 'q'])
digipines['indexes'].append([24.24412438669991, 20.546606690929615, 28.3958905284828, 42.42720478727473, 50.470267574044406, 16.421166346919428, 16.4028606661105, 57.443874124647294, 45.80748165273449, 22.15744112769787, 56.347814873226994, 49.809139985670534, 46.13802015427525, 20.9910439514226, 42.69605617320123, 27.793801606590623, 35.82097869882248, 17.543558267356342, 45.318002972843175, 8.425868949724759, 43.088310958458756, 13.401255454921838, 45.973050127868994, 25.59214971467503, 13.467578241674298, 19.7352759754203, 2.8496514350033064, 20.050832731772083, 20.434536295580127, 14.169378563770083])
# 1536186845
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines['rhythms'].append(['e.', 's'])
digipines['indexes'].append([46.368453551128326, 43.74794305998091])
# 1536186845
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines['rhythms'].append(['s', 'q'])
digipines['indexes'].append([44.250196180499906, 29.29910989948058])

# seed = 1536186994
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines2['rhythms'].append(['e.', 's', 's', 's', 'e', 'e.', 's', 'q', 's', 's', 's', 'e', 's', 's', 's', 's', 's', 's', 's', 'q', 'q', 'e.', 's', 'h', 'q', 'e', 's', 's', 's', 'e'])
digipines2['indexes'].append([54.923355601889895, 43.91657989266747, 51.48810904084862, 0.13873363236977188, 18.17075822265162, 16.175619905505187, 18.7618872855493, 54.33582306956144, 50.38103413024042, 29.71261326604633, 6.723458907471529, 44.790341699500914, 49.40926316544683, 49.817669640297034, 4.159877689494871, 30.45445564254411, 9.537861519175907, 29.899188615495746, 35.81858194416861, 2.147855870150328, 25.972894010482335, 18.101244359485126, 16.919649263043556, 51.072819195327455, 50.952256962319524, 47.86889281753811, 22.07703566132899, 54.14139274854302, 24.130539466556208, 17.088399975624363])
# 1536186994
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines2['rhythms'].append(['s', 'e.'])
digipines2['indexes'].append([27.91510021771608, 55.65978184863675])
# 1536186994
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines2['rhythms'].append(['s', 's'])
digipines2['indexes'].append([10.556591641410067, 9.597273528872448])
#break in the pines:
# seed = 1536187056
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines_break['rhythms'].append(['s', 'q', 'q', 'e', 's', 's', 'e.', 'h', 's', 'e.', 's', 's', 's', 's', 's', 'h', 'e.', 's', 's', 'e.', 's', 'h', 's', 'e.', 'e', 's', 'e', 's', 'q', 's'])
digipines_break['indexes'].append([11.492879369810197, 50.26029484343292, 47.683094517875034, 5.972581821614602, 3.5524439443056854, 34.739848919753584, 34.62027466512907, 30.19436065259488, 40.879260749255415, 33.726570945318514, 11.527323145090808, 44.39020319004689, 38.01713984793915, 38.699610898867554, 48.00073601745289, 5.465017599699249, 10.790762157210407, 3.161452048162121, 35.55762738820606, 55.20376727903605, 9.856383866873667, 5.719230539719518, 16.130903149536167, 11.093881500702636, 6.127198953130821, 2.2179391342359334, 23.16826806348293, 9.532967476450176, 35.9521804874386, 52.79455888298876])
# 1536187056
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines_break['rhythms'].append(['h', 'q'])
digipines_break['indexes'].append([45.57130720276772, 19.969634737104375])
# 1536187056
# ['a', 'a', 'c', 'c', 'd', 'd', 'd']
digipines_break['rhythms'].append(['s', 'q'])
digipines_break['indexes'].append([20.591623190460666, 30.078615239259623])

tempo = 120

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

def post_process(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)
    # note.pfields[keys.frequency] = context['tuplestream'].tempo / utils.quarter_duration_to_tempo(.697-.018)
    note.pfields['inst_file'] = '"' + '/Users/ben/Dropbox/_gtrs/' + note.pfields[keys.frequency] + '.wav' + '"'
    note.pfields[keys.frequency] = 1
    pass


opening_l = Generator(
    streams=OrderedDict([
        (keys.instrument, 1),
        (keys.duration, lambda note:note.pfields['orig_rhythm']),
        (keys.amplitude, Itemstream(sum([('1 ' * 16).split(), ('1 0 0 0 ' * 4).split()], []))),
        (keys.frequency, Itemstream('a a c c d d d')),
        (keys.pan, 0),
        (keys.distance, 10),
        (keys.percent, .01),
        ('output_prefix', 1)
    ]),
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
    post_processes=[post_process]
)
# opening_l.context['rhythms'] = ['e.', 's', 'h', 's', 's', 'q', 's', 'e.', 'e', 's', 'e.', 's', 'h', 's', 's', 'h', 'q', 's', 's', 'e.', 'h', 's', 's', 'e.', 's', 's', 's', 's', 'h', 'q']
# opening_l.context['indexes'] = [24.24412438669991, 20.546606690929615, 28.3958905284828, 42.42720478727473, 50.470267574044406, 16.421166346919428, 16.4028606661105, 57.443874124647294, 45.80748165273449, 22.15744112769787, 56.347814873226994, 49.809139985670534, 46.13802015427525, 20.9910439514226, 42.69605617320123, 27.793801606590623, 35.82097869882248, 17.543558267356342, 45.318002972843175, 8.425868949724759, 43.088310958458756, 13.401255454921838, 45.973050127868994, 25.59214971467503, 13.467578241674298, 19.7352759754203, 2.8496514350033064, 20.050832731772083, 20.434536295580127, 14.169378563770083]
opening_l.context['rhythms'] = ['e.', 's']
opening_l.context['indexes'] = [46.368453551128326, 43.74794305998091]
opening_l.context['orig_rhythms'] = opening_l.context['rhythms']
opening_l.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                              mapping_lists=[opening_l.context['rhythms'],
                                                             opening_l.context['indexes']],
                                              tempo=tempo,
                                              streammode=streammodes.heap)
opening_l.time_limit = 8
opening_l.note_limit = 0

opening_r = copy.deepcopy(opening_l)
opening_r.start_time = 0
opening_r.time_limit = 0
opening_r.streams[keys.pan] = 90
opening_r.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                              mapping_lists=[opening_l.context['rhythms'],
                                                             opening_l.context['indexes']],
                                              tempo=tempo,
                                              streammode=streammodes.random)
sec1 = opening_l.deepcopy()
sec1.generators = []

opening_l.add_generator(opening_r)


for x in range(10):
    sec = sec1.deepcopy()
    sec.start_time = 8
    sec.time_limit = 24
    sec.streams[keys.pan] = x*10
    sec.streams[keys.amplitude] = Itemstream('.5'.split(), streammode=streammodes.sequence)
    # sec.streams[keys.amplitude] = Itemstream('.1 .3 .5 .7 1'.split(), streammode=streammodes.sequence)
    sec.context['indexes'] = [11.492879369810197, 50.26029484343292, 47.683094517875034, 5.972581821614602, 3.5524439443056854, 34.739848919753584, 34.62027466512907, 30.19436065259488, 40.879260749255415, 33.726570945318514, 11.527323145090808, 44.39020319004689, 38.01713984793915, 38.699610898867554, 48.00073601745289, 5.465017599699249, 10.790762157210407, 3.161452048162121, 35.55762738820606, 55.20376727903605, 9.856383866873667, 5.719230539719518, 16.130903149536167, 11.093881500702636, 6.127198953130821, 2.2179391342359334, 23.16826806348293, 9.532967476450176, 35.9521804874386, 52.79455888298876]
    sec.context['rhythms'] = ['s', 'q', 'q', 'e', 's', 's', 'e.', 'h', 's', 'e.', 's', 's', 's', 's', 's', 'h', 'e.', 's', 's', 'e.', 's', 'h', 's', 'e.', 'e', 's', 'e', 's', 'q', 's']
    sec.context['orig_rhythms'] = sec.context['rhythms']
    sec.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                  mapping_lists=[sec.context['rhythms'],
                                                                 sec.context['indexes']],
                                                  tempo=tempo,
                                                  streammode=streammodes.random,
                                            seed=int(time.time())*x
)
    opening_l.add_generator(sec)

for x in range(12):
    end = sec1.deepcopy()
    end.start_time = 24
    end.time_limit = 28
    pans = [0, 45, 90]
    end.streams[keys.pan] = pans[x % 3]
    end.streams[keys.amplitude] = Itemstream('1 1 1 0 1 0 0 0'.split(), streammode=streammodes.heap)
    # end.streams[keys.amplitude] = Itemstream('2'.split(), streammode=streammodes.sequence)
    end.streams[keys.frequency] = Itemstream('a')
    end.context['indexes'] = [11.492879369810197, 50.26029484343292, 47.683094517875034, 5.972581821614602, 3.5524439443056854, 34.739848919753584, 34.62027466512907, 30.19436065259488, 40.879260749255415, 33.726570945318514, 11.527323145090808, 44.39020319004689, 38.01713984793915, 38.699610898867554, 48.00073601745289, 5.465017599699249, 10.790762157210407, 3.161452048162121, 35.55762738820606, 55.20376727903605, 9.856383866873667, 5.719230539719518, 16.130903149536167, 11.093881500702636, 6.127198953130821, 2.2179391342359334, 23.16826806348293, 9.532967476450176, 35.9521804874386, 52.79455888298876]
    end.context['rhythms'] = ['s']*len(end.context['indexes'])
    end.context['orig_rhythms'] = end.context['rhythms']
    end.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                  mapping_lists=[end.context['rhythms'],
                                                                 end.context['indexes']],
                                                  tempo=tempo,
                                                  streammode=streammodes.random,
                                            seed=int(time.time()) * x)
    opening_l.add_generator(end)

opening_l.generate_notes()
opening_l.end_lines = ['i99 0 ' + str(opening_l.score_dur+10) + ' 10\n']

print(opening_l.generate_score_string())

# cs_utils.play_csound("generic-index.orc", opening_l, silent=True, args_list=['-o/Users/ben/Music/Portfolio/_csound/index-study-2.wav', '-W'])
#cs_utils.play_csound("generic-index.orc", opening_l, silent=True)

cs_utils.play_csound("generic-index.orc", opening_l, silent=True, args_list=['-odac2', '-W'])
