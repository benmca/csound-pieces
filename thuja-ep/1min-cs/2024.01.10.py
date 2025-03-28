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

# random.seed(12)
# random.seed(11)

filelen = 35
tempo = 120

pitches_to_files = {
    'a': '0.wav',
    'as': '1.wav',
    'b': '2.wav',
    'c': '3.wav',
    'cs': '4.wav',
    'd': '5.wav',
    'ds': '6.wav',
    'e': '7.wav',
    'f': '8.wav',
    'fs': '9.wav',
    'g': '10.wav',
    'gs': '11.wav'
}

def cleanup_strings(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/src/tidal/samples-extra/olalla-birds/' + note.pfields['filepitch'] + '.wav' + '"'
    note.pfields.pop('filepitch')
    # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'

# filelen = 162
def post_process(note, context):
    item = context['tuplestream'].get_next_value()
    indx = context['indexes'].index(item[keys.index])
    orig_rhythm = context['orig_rhythms'][indx]
    note.rhythm = utils.rhythm_to_duration(item[keys.rhythm], context['tuplestream'].tempo)
    note.pfields[keys.index] = item[keys.index]
    note.pfields['orig_rhythm'] = utils.rhythm_to_duration(orig_rhythm, context['tuplestream'].tempo)
    # note.pfields[keys.frequency] = context['tuplestream'].tempo / utils.quarter_duration_to_tempo(.697-.018)
    note.pfields[keys.frequency] = 1
    if item[keys.rhythm] == 'h.':
        note.pfields[keys.duration] = note.rhythm * .1
    else:
        note.pfields[keys.duration] = note.rhythm
    pass


container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(1)
        .with_amps(0)
        .with_freqs(1)
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

container.set_stream('inst_file', '\"/Users/ben/Desktop/1min/6/sources/c0.wav\"')
container.set_stream('orig_rhythm', .01)
container.set_stream('fade_in', .01)
container.set_stream('fade_out', .01)
container.set_stream('index', Itemstream(0, notetype=notetypes.number, streammode=streammodes.random))
# container.set_stream('file_pitch', Itemstream("a c e g a".split()*8, streammode=streammodes.heap))
# container.set_stream('filepitch', Itemstream('\"b\"'))
container.pfields += [keys.index, 'orig_rhythm', 'inst_file', 'fade_in','fade_out']
container.note_limit = 1


first_phrase = container.deepcopy()
second_phrase = container.deepcopy()
third_phrase = container.deepcopy()


def gen_rhythms(gen, l, opt=1):
    rhythms = None
    if opt == 1:
        rhythms = 's s s s e+q. h.'
    elif opt == 2:
        rhythms = 'q. q. h.'
    elif opt == 3:
        rhythms = 'q e q. h.'
    elif opt == 4:
        rhythms = 'e e e e h.'

    gen.context['rhythms'] = []
    gen.context['indexes'] = []
    for x in range(l):
        gen.context['rhythms'].extend(rhythms.split())
        for y in range(len(rhythms.split())):
            gen.context['indexes'].append(random.random()*filelen)
        gen.context['orig_rhythms'] = gen.context['rhythms']
    return rhythms

first_phrase.rhythms(gen_rhythms(first_phrase, 4).split())
first_phrase.amps(1)
first_phrase.set_stream('filepitch', Itemstream("a c e g a a".split()*8, streammode=streammodes.heap))
gen_rhythms(first_phrase, 4)
first_phrase.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                  mapping_lists=[first_phrase.context['rhythms'],
                                                                 first_phrase.context['indexes']],
                                                  tempo=tempo,
                                                  streammode=streammodes.sequence)
first_phrase.post_processes = [cleanup_strings, post_process]
first_phrase.note_limit = 6*8


second_phrase.rhythms(gen_rhythms(second_phrase, 1, 2).split() +
                      gen_rhythms(second_phrase, 1, 3).split() +
                      gen_rhythms(second_phrase, 1, 4).split() +
                      gen_rhythms(second_phrase, 1, 1).split())
second_phrase.amps(1)
second_phrase.set_stream('filepitch', Itemstream("d f a".split()+"f a c f".split()+"f a c e f".split()+"a c e g a a".split(), streammode=streammodes.heap))
second_phrase.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                  mapping_lists=[second_phrase.context['rhythms'],
                                                                 second_phrase.context['indexes']],
                                                  tempo=tempo,
                                                  streammode=streammodes.sequence)
second_phrase.post_processes = [cleanup_strings, post_process]
second_phrase.note_limit = 18
second_phrase.start_time = 22.65


third_phrase.rhythms(gen_rhythms(third_phrase, 4).split())
third_phrase.amps(1)
third_phrase.freqs(2)
third_phrase.set_stream('filepitch', Itemstream("a c e g a a".split()*8, streammode=streammodes.heap))
gen_rhythms(third_phrase, 4)
third_phrase.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
                                                  mapping_lists=[third_phrase.context['rhythms'],
                                                                 third_phrase.context['indexes']],
                                                  tempo=tempo,
                                                  streammode=streammodes.sequence)
third_phrase.post_processes = [cleanup_strings, post_process]
third_phrase.note_limit = 6*8
third_phrase.start_time = 32.8

# gen_rhythms(g, 30)
# g.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
#                                       mapping_lists=[g.context['rhythms'],
#                                                      g.context['indexes']],
#                                       tempo=tempo,
#                                       streammode=streammodes.random)
# #
# g2 = copy.deepcopy(g)
# gen_rhythms(g2, 2)
# g2.streams[keys.pan] = Itemstream([0])
# g2.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
#                                       mapping_lists=[g2.context['rhythms'],
#                                                      g2.context['indexes']],
#                                       tempo=tempo*.5,
#                                       streammode=streammodes.random)
# #
# g3 = copy.deepcopy(g2)
# gen_rhythms(g3, 2)
# g3.streams[keys.pan] = Itemstream([90])
# g3.context['tuplestream'] = Itemstream(mapping_keys=[keys.rhythm, keys.index],
#                                       mapping_lists=[g3.context['rhythms'],
#                                                      g3.context['indexes']],
#                                       tempo=tempo*.5)
#

container.add_generator(first_phrase)
container.add_generator(second_phrase)
container.add_generator(third_phrase)

container.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
# g.time_limit = 60

container.generate_notes()

reverb_time = 10
# container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.generate_score_string())

cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
# ,'-+rtaudio=CoreAudio'])
