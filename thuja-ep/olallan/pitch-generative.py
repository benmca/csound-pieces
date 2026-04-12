from thuja.itemstream import Itemstream
from thuja.notegenerator import NoteGenerator, NoteGeneratorThread, Line, ko
from thuja.streamkeys import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
import thuja.utils as utils
import thuja.csound_utils as cs_utils
from collections import OrderedDict
import ctcsound

import random


rhythms = Itemstream(['s']*8,
    streammode=streammodes.sequence,
    tempo=60,
    notetype=notetypes.rhythm)
amps = Itemstream([1])

pitches = Itemstream('c5 g f g r c4 g f g r'.split(),
    streammode=streammodes.sequence,
    notetype=notetypes.pitch
)

g = Line().index(1).rhythms(rhythms).durs([.1]).amps(.7).freqs(pitches).pan(45).dist(10).pct(.1)
# g = NoteGenerator(
#     streams=OrderedDict([
#         (keys.instrument, 1),
#         (keys.rhythm, rhythms),
#         (keys.duration, Itemstream([.1])),
#         (keys.amplitude, .7),
#         (keys.frequency, pitches),
#         (keys.pan, 45),
#         (keys.distance, 10),
#         (keys.percent, .1)
#     ]),
#     pfields=None,
#     gen_lines = [';sine\n',
#                'f 1 0 16384 10 1\n',
#                ';saw',
#                'f 2 0 256 7 0 128 1 0 -1 128 0\n',
#                ';pulse\n',
#                'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
# )

g.time_limit = 60
def post_processs(note):
    if random.random() > .5:
        i = random.randint(0, len(g.streams[keys.frequency].values)-1)
        val = g.streams[keys.frequency].values[i]
        freq = utils.pc_to_freq(val, g.streams[keys.frequency].current_octave)['value']
        midinote = utils.freq_to_midi_note(freq)
        if random.random() > .6:
            if random.random() > .5:
                if random.random() > .5:
                    midinote += 3
                else:
                    midinote += 4
            else:
                if random.random() > .5:
                    midinote -= 3
                else:
                    midinote -= 4
        newfreq = utils.midinote_to_freq(midinote)
        newpc = utils.freq_to_pc(newfreq, True)
        g.streams[keys.frequency].values[i] = newpc


def post_processs_rhythm(note):
    # if random.random() > .5:
    i = random.randint(0, len(g.streams[keys.rhythm].values)-1)
    r = g.streams[keys.rhythm].values[i]
    newrhy = r
    diff = ''
    add = True
    if random.random() > .9:
        if random.random() > .5:
            if random.random() > .9:
                newrhy = utils.add_rhythm(r, 's')
                diff = 's'
            elif utils.rhythm_string_to_val(r) > utils.rhythm_string_to_val('s'):
                newrhy = utils.subtract_rhythm(r, 's')
                diff = 's'
                add = False
        else:
            if random.random() > .9:
                newrhy = utils.add_rhythm(r, 'e')
                diff = 'e'
            elif utils.rhythm_string_to_val(r) > utils.rhythm_string_to_val('e'):
                newrhy = utils.subtract_rhythm(r, 'e')
                diff = 'e'
                add = False

    # displace the rest of the stream (if possible) by the new rhythm diff
    if r != newrhy and r != '':
        g.streams[keys.rhythm].values[i] = newrhy
        if i + 1 < len(g.streams[keys.rhythm].values):
            for j in range(i + 1, len(g.streams[keys.rhythm].values)):
                if add:
                    item = utils.add_rhythm(g.streams[keys.rhythm].values[j], diff)
                    if item != '':
                        g.streams[keys.rhythm].values[j] = item
                elif utils.rhythm_string_to_val(g.streams[keys.rhythm].values[j]) > utils.rhythm_string_to_val(diff):
                    item = utils.subtract_rhythm(g.streams[keys.rhythm].values[j], diff)
                    if item != '':
                        g.streams[keys.rhythm].values[j] = item



    # newfreq = utils.midinote_to_freq(midinote)
    # newpc = utils.freq_to_pc(newfreq, True)
    # g.streams[keys.frequency].values[i] = newpc
    pass


g.post_processes = [post_processs, post_processs_rhythm]

g.generate_notes()

g.end_lines = ['i99 0 ' + str(g.score_dur+10) + '\n']


t = ko(g, "pitch-generative.orc", device_string="dac6")
#---------------------------
g.time_limit = 400
g.tempo(120)
g.durs(.1)
t.gen()
