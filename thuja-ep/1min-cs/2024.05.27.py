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

# random.seed(12)
# random.seed(11)

tempo = 60
# seed = int(time.time())
# # seed = 1594358315
# seed = 1594358933
# random.seed(seed)

pitches_to_files = {
    'a': '1.wav',
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

def post_process(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/src/tidal/samples-extra/olalla-birds/' + pitches_to_files[note.pfields['filepitch']] + '"'
    note.pfields.pop('filepitch')
    # note.pfields['filepitch'] = '"' + note.pfields['filepitch'] + '"'
    note.pfields[keys.duration] = note.rhythm * note.pfields[keys.duration]


container = (
    BasicLine().with_rhythm(Itemstream('q'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=tempo))
        .with_duration(1)
        .with_amps(0)
        .with_freqs(1)
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

container.set_stream(keys.index,Itemstream([0]))
container.set_stream('orig_rhythm', .01)
container.set_stream('inst_file', '\"/Users/ben/src/tidal/samples-extra/olalla-birds/1.wav\"')
container.set_stream('fade_in', .01)
container.set_stream('fade_out', .01)
container.gen.pfields += [keys.index, 'orig_rhythm', 'inst_file', 'fade_in','fade_out']
container.gen.note_limit = 1
container.gen.time_limit = 70

first_phrase_1 = copy.deepcopy(container)


first_phrase_1.with_rhythm(Itemstream("s s e e e. e. q".split(), tempo=tempo))
first_phrase_1.amps(1)
first_phrase_1.set_stream('filepitch', Itemstream("a as b c cs d ds e f fs g gs".split(), streammode=streammodes.heap))
first_phrase_1.gen.post_processes = [post_process]
first_phrase_1.gen.note_limit = 300
first_phrase_1.with_duration(Itemstream([.1,.1, .5, .5, 1], streammode=streammodes.random))
first_phrase_1.with_pan([20])
first_phrase_1.gen.set_streams_to_seed(int(time.time()))
first_phrase_2 = copy.deepcopy(first_phrase_1)
first_phrase_2.with_pan([70])
first_phrase_2.gen.set_streams_to_seed(int(time.time()) + 100)

second_phrase = copy.deepcopy(first_phrase_1)
second_phrase.with_pan(45).with_rhythm(['q']).with_duration([1])
second_phrase.gen.start_time = 16

container.gen.add_generator(first_phrase_1.gen)
container.gen.add_generator(first_phrase_2.gen)
container.gen.add_generator(second_phrase.gen)

container.gen.gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
# g.gen.time_limit = 60

container.gen.generate_notes()

reverb_time = 10
# container.gen.end_lines = ['i99 0 ' + str(container.gen.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(container.gen.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container.gen, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("simple-index.orc", container.gen, silent=True, args_list=['-o148-60.wav', '-W'])
