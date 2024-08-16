from __future__ import print_function
from thuja.itemstream import Itemstream
from thuja.generator import Generator
from thuja.generator import BasicLine
from thuja.generator import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import copy
import random
import time

# seed = int(time.time())
# random.seed(seed)
filelen = 60
tempo = 60

filename = "/Users/ben/Library/CloudStorage/Dropbox/Apps/Voice Record Pro/20240512-back steps sander foley.wav"
steps = 16

def calc_dur(note, context):
    # steps = 16.0
    dur = .75
    if (context['durdx']%steps) < steps*.5:
        note.pfields[keys.duration] = ((context['durdx']%steps)/steps) * dur
    else:
        note.pfields[keys.duration] = (1-(context['durdx']%steps)/steps) * dur
    context['durdx'] = context['durdx']+1

# def smear_index(note, context):
#

container = BasicLine().with_amps(0)
container.set_stream(keys.index, [1.272]*steps + [9.130]*steps + [24.250]*steps + [26.830]*steps)
container.set_stream('orig_rhythm', .01)
container.set_stream('inst_file', ['\"' + filename + '\"'])
container.set_stream('fade_in', .01)
container.set_stream('fade_out', .01)

pulse = (
    BasicLine().with_rhythm(Itemstream(['s', 's', 's', 's','s.', 'e'], tempo=tempo, streammode=streammodes.random)).
    with_percent(0).with_index([1.272]*steps + [9.130]*steps + [24.250]*steps + [26.830]*steps).
    setup_index_params_with_file(filename)
)

pulse.gen.post_processes = [calc_dur]
pulse.gen.context['durdx'] = 0
pulse.gen.time_limit = 60

pulse2 = copy.deepcopy(pulse).with_pan(10).randomize()
pulse3 = copy.deepcopy(pulse).with_pan(80).randomize()

container.gen.add_generator(pulse.gen)
container.gen.add_generator(pulse2.gen)
container.gen.add_generator(pulse3.gen)
container.gen.end_lines = ['i99 0 ' + str(pulse.gen.score_dur+10) + ' 5\n']
container.gen.generate_notes()

# print(container.gen.generate_score_string())

cs_utils.play_csound("simple-index.orc", container.gen, silent=False, args_list=['-odac1','-+rtaudio=CoreAudio'])
