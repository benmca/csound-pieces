from __future__ import print_function

import ctcsound

from thuja.itemstream import Itemstream
from thuja.notegenerator import Line
from thuja.notegenerator import NoteGenerator, NoteGeneratorThread
from thuja.streamkeys import keys
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
import thuja.csound_utils as cs_utils


def add_env_streams(c, atck=.01, rel=.01):
    c.set_stream('atck', atck)
    c.set_stream('rel', rel)


container = (
    Line().with_rhythm(Itemstream(['q','e','e'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(lambda note:note.rhythm)
        .with_amps(1)
        .with_pitches(Itemstream(['g4'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(container)

container.time_limit = 1000
container.generate_notes()

# reverb_time = 10
# container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']

cs_utils.play_csound("/Users/ben/src/csound-pieces/thuja-ep/1min-cs/226.orc", container, silent=True, args_list=['-odac1', '-W'])

# run to here in daemon more, then
#
# these bits. generate_notes has to be called to update the note queue.
# container.with_pitches(Itemstream('g3 bf4 f f f g3'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
# container.with_rhythm(Itemstream(['32'], notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
# container.generate_notes()
#
# b = container.deepcopy()
# b.with_duration(lambda note:note.rhythm)
# b.with_pitches(Itemstream('g5 g4 g3'.split(), notetype=notetypes.pitch)).with_rhythm(Itemstream(['e'], notetype=notetypes.rhythm))
# b.with_pan(Itemstream([90]))
# container.add_generator(b)
# container.generate_notes()
#
# c = b.deepcopy()
# c.with_pan(Itemstream([0]))
# container.add_generator(c)
# container.generate_notes()
#
# container.with_amps(0)
# container.generate_notes()



# time.sleep(120)
# t.stop_event.set()
# t.join()
#
# cpt.stop()
# cpt.join()
# cs.reset()
