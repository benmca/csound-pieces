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
    Line().with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(lambda note:note.rhythm)
        .with_amps(1)
        .with_pitches(Itemstream(['g4', 'bf4', 'f'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(container)

container.time_limit = 1000
container.generate_notes()

# reverb_time = 10
# container.end_lines = ['i99 0 ' + str(container.score_dur+10) + ' ' + str(reverb_time) + '\n']


cs = cs_utils.init_csound_with_orc(['-odac999', '-+rtaudio=CoreAudio'],
                                   "/Users/ben/src/csound-pieces/thuja-ep/1min-cs/226.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(container, cs, cpt)
t.daemon = True
t.start()

# run to here in daemon more, then
#
# these bits. generate_notes has to be called to update the note queue.
container.with_pitches(Itemstream('g3 bf4 f f f g3'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
container.with_rhythm(Itemstream(['8'], notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
container.generate_notes()


b = container.deepcopy()
container.with_pan(Itemstream([10]))
b.with_duration(lambda note:note.rhythm)
b.with_pitches(Itemstream('g6 g7 g7'.split(), notetype=notetypes.pitch)).with_rhythm(Itemstream(['e'], notetype=notetypes.rhythm))
b.with_pan(Itemstream([80]))
container.add_generator(b)
container.generate_notes()

c = b.deepcopy()
c.with_pan(Itemstream([45]))
container.add_generator(c)
container.generate_notes()

container.with_amps(0)
container.generate_notes()



# time.sleep(120)
# t.stop_event.set()
# t.join()
#
# cpt.stop()
# cpt.join()
# cs.reset()
