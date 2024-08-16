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

filename = "/Users/ben/Library/CloudStorage/Dropbox/1min/165/klinkendaggers2.wav"
steps = 16

def calc_dur(note, context):
    # steps = 16.0
    # note.pfields[keys.duration] = note.rhythm
    note.pfields[keys.duration] = note.pfields['orig_rhythm']

container = (
    BasicLine().with_amps(Itemstream([1,0,1,0,1,0,1,0,1])).
    with_rhythm(Itemstream("e e e e e e e e w", tempo=120))
)

container.set_stream(keys.index, Itemstream([0.262, 0.638, 0.957, 1.272, 1.492, 1.768], streammode=streammodes.random))
container.set_stream('orig_rhythm', Itemstream([0.375, 0.319, 0.315, 0.219, 0.276, 0.329]))
container.set_stream('inst_file', ['\"' + filename + '\"'])
container.set_stream('fade_in', .001)
container.set_stream('fade_out', .01)

container.time_limit = 4
container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' 5\n']
container.post_processes = [calc_dur]

for x in range(0, 2):
    pans = [10, 80]
    pulse = copy.deepcopy(container).with_pan(pans[x]).randomize()
    pulse.streams[keys.rhythm].tempo = 240
    pulse.start_time = 4
    pulse.time_limit = 12
    container.add_generator(pulse)

for x in range(0, 2):
    pans = [10, 80]
    pulse = copy.deepcopy(container).with_pan(pans[x]).randomize().with_rhythm(Itemstream("s s. e e.", streammode=streammodes.random, tempo=180))
     # pulse = copy.deepcopy(container).with_pan(pans[x]).randomize()
    pulse.streams[keys.rhythm].tempo = 240
    pulse.start_time = 12
    pulse.time_limit = 18
    container.add_generator(pulse)
# pulse = copy.deepcopy(container).with_pan(pans[x]).randomize().with_rhythm(Itemstream("s s. e e.", tempo=240))
container.generate_notes()

print(container.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=False, args_list=['-odac1','-+rtaudio=CoreAudio'])
cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=["-odac0", "-W"])

