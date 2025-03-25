from thuja.itemstream import Itemstream
from thuja.generator import BasicLine, GeneratorThread
from thuja.itemstream import streammodes, notetypes
from thuja.generator import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import numpy as np
import random
import time
import ctcsound



def freq_to_file(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1

    pass

def freq_to_file_disperse_octaves(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        pc_notation = utils.freq_to_pc(note.pfields[key.frequency], True)
        if float(note.pfields[key.frequency]) <= float(utils.pc_to_freq("g5", "1")["value"]):
            pc_notation = pc_notation[:-1]+str(random.randint(2,5))
        else:
            pc_notation = pc_notation[:-1]+str(random.randint(2,4))

        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + pc_notation + '-p5.wav' + '"')

        note.pfields[key.frequency] = 1

    pass

def cycle_by_intervals(note, context):

    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        pc_notation = utils.freq_to_pc(note.pfields[key.frequency], True)
        if float(note.pfields[key.frequency]) <= float(utils.pc_to_freq("g5", "1")["value"]):
            pc_notation = pc_notation[:-1]+str(random.randint(2,5))
        else:
            pc_notation = pc_notation[:-1]+str(random.randint(2,4))

        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + pc_notation + '-p5.wav' + '"')

        note.pfields[key.frequency] = 1

    pass

def set_dur(note, context):
    note.pfields[key.duration] = note.pfields[key.rhythm]*.5

a = (
    BasicLine().with_rhythm(Itemstream('e e e w+w w+w'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps(.5)
        .with_pitches(Itemstream('e3 fs g a r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10 30 60 80 80'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05)
)

a.post_processes = [freq_to_file_disperse_octaves]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .01)
a.time_limit = 45

b = (
    BasicLine().with_rhythm(Itemstream('q h q. q. q h+h.'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=([120]*12+[180]*18+[60]*6)))
        .with_duration(2)
        .with_amps([.25]*3+[.6]*5)
        .with_pitches(Itemstream([['e2', 'e3', 'e4'], 'r', ['e2','g5','b4'], ['e2','d5','b4'], ['e2','fs5','b4'], 'r'] +
                                 [['e2', 'e3', 'e4'], 'r', ['e2','fs5','b4'], ['e2','a5','b4'], ['e2','g5','b4'], 'r']
                                 , notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(lambda x: np.random.random() * 90)
        .with_dist(10)
        .with_percent(.05)
)



b.post_processes = [freq_to_file]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .01)
b.set_stream('rel', .01)
b.time_limit = 1000

c = (
    BasicLine().with_rhythm(Itemstream('12 12 24 24 32 32 48 48'.split(), notetype=notetypes.rhythm, streammode=streammodes.random))
        .with_duration(lambda note: note.rhythm)
        .with_amps(.5)
        .with_pitches(Itemstream(['e2', 'fs3', 'gs4', 'as5'], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(45)
        .with_dist(10)
        .with_percent(.05)
)

c.post_processes = [freq_to_file]
c.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
c.set_stream('atck', .01)
c.set_stream('rel', .01)
c.time_limit = 120
c.context["interval"] = 3

a.add_generator(b)
a.add_generator(c)
a.generate_notes()
b.generate_notes()

# reverb_time = 10
# a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(c.generate_score_string())


cs = cs_utils.init_csound_with_orc(['-odac4', '-W', '-+rtaudio=CoreAudio'],
                                   "/Users/ben/src/csound-pieces/thuja-ep/1min-cs/simple-index-247.orc",
                                   True,
                                   None)

cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = GeneratorThread(b, cs, cpt)
t.daemon = True
t.start()


time.sleep(120)
t.stop_event.set()
t.join()

cpt.stop()
cpt.join()
cs.reset()

b.with_pitches(Itemstream([['e2', 'fs5', 'b4'], ['e3', 'fs3', 'a3', 'b3'], ['e2', 'g5', 'b4'], 'r'], notetype=notetypes.pitch, streammode=streammodes.sequence))
b.streams[key.rhythm].tempo = 420
b.with_rhythm(
    Itemstream('q h q. q. q h+h.'.split(), notetype=notetypes.rhythm, streammode=streammodes.sequence,
               tempo=240))

b.generate_notes()

c = b.deepcopy()
c.with_rhythm(
    Itemstream('s'.split(), notetype=notetypes.rhythm, streammode=streammodes.sequence,
               tempo=120))
b.add_generator(c)
b.generate_notes()

c.with_pitches(Itemstream([['e3', 'b3' ], 'e3'], notetype = notetypes.pitch, streammode = streammodes.sequence))