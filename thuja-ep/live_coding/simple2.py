from __future__ import print_function

import random

import ctcsound
from thuja.notegenerator import Line, NoteGenerator, NoteGeneratorThread
from thuja.itemstream import streammodes, notetypes, Itemstream
import thuja.csound_utils as cs_utils
import thuja.streamkeys as keys


def add_env_streams(c, atck=.01, rel=.01):
    c.set_stream('atck', atck)
    c.set_stream('rel', rel)


a = (
    Line().with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(lambda note:note.rhythm)
        .with_amps(1)
        .with_pitches(Itemstream(['g4', 'bf4', 'f'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.01)
)

add_env_streams(a)

a.time_limit = 1000
a.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']


cs = cs_utils.init_csound_with_orc(['-odac2', '-+rtaudio=CoreAudio', '--devices'],
                                   "/Users/ben/src/csound-pieces/thuja-ep/1min-cs/226.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(a, cs, cpt)
t.daemon = True
t.start()

a.with_pitches(Itemstream('a3 c e g a5 g f e d d r d d r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))

a.rhythms(Itemstream('q 32 32 s e s s'.split(), streammode=streammodes.sequence, notetype=notetypes.rhythm, tempo=120))
a2 = a.deepcopy()
a.pan(10)
a2.pan(80)
a.add_generator(a2)
a.rhythms(Itemstream('q 32 32 s e s s'.split(), streammode=streammodes.heap, notetype=notetypes.rhythm, tempo=120))
a2.rhythms(Itemstream('q 32 32 s e s s'.split(), streammode=streammodes.heap, notetype=notetypes.rhythm, tempo=120))
import random
a2.set_streams_to_seed(random.seed())
# a.g()

a3 = a2.deepcopy()
a3.with_pitches(Itemstream('e4 f g a5 r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
a3.rhythms(Itemstream('q e e'.split(), streammode=streammodes.heap, notetype=notetypes.rhythm, tempo=120))
a.add_generator(a3)
t.gen()

a.amps(0)
b.rhythms(('e. e. e e e e e'.split()))
a.amps(.5)
# run to here in daemon more, then

p = (Line().with_rhythm(Itemstream(['q'] , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
        .with_duration(lambda note:note.rhythm)
        .with_amps(1)
        .with_pitches(Itemstream(['c5'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream([10, 80]))
        .with_dist(10)
        .with_percent(.01))

a.add_generator(p)

p.amps(.75)
a.generate_notes()

#
# these bits. generate_notes has to be called to update the note queue.
a.with_pitches(Itemstream('g3 bf4 f f f g3'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
a.with_rhythm(Itemstream(['8'], notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
# a.generate_notes()

b = p.deepcopy()
a.with_pan(Itemstream([10]))
b.with_duration(lambda note:note.rhythm)
b.with_pitches(Itemstream('g3 g5 g5'.split(), notetype=notetypes.pitch)).with_rhythm(Itemstream(['e'], notetype=notetypes.rhythm))
b.amps(.75)
b.with_pan(Itemstream([80]))
a.add_generator(b)
a.generate_notes()



c = b.deepcopy()
c.with_pan(Itemstream([45]))
c.pitches(Itemstream('g5 g g g a bf c ds ef f'.split(), notetype=notetypes.pitch)).rhythms(Itemstream('e. e. s s s s s s'.split(), notetype=notetypes.rhythm))

a.add_generator(c)
a.g()

d = c.deepcopy()
d.with_pan(Itemstream([70]))
d.pitches(Itemstream('g5 g g g a bf c f f f'.split(), notetype=notetypes.pitch)).rhythms(Itemstream('e. e. s s s  s s'.split(), notetype=notetypes.rhythm))
a.add_generator(d)
a.generate_notes()

a.amps(0)
a.g()


# time.sleep(120)
# t.stop_event.set()
# t.join()
#
# cpt.stop()
# cpt.join()
# cs.reset()
