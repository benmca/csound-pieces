from thuja.itemstream import Itemstream
from thuja.notegenerator import Line, NoteGeneratorThread
from thuja.itemstream import streammodes
from thuja.itemstream import notetypes
from thuja.streamkeys import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import numpy as np
import random
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

a = (
    Line().with_rhythm(Itemstream('e e e w+w w+w'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
        .with_amps(.5)
        .with_pitches(Itemstream('e3 fs g a r'.split(), notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10 30 60 80 80'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05)
)

a.post_processes = [cycle_by_intervals]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .01)
a.time_limit = 4500

b = (
    Line().with_rhythm(Itemstream('q h q. q. q h+h.'.split() , notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=([120]*12+[180]*18+[60]*6)))
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
b.time_limit = 4500


c = (
    Line().with_rhythm(Itemstream(['w+w'], notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(2)
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
c.time_limit = 4500
c.context["interval"] = 3


a.add_generator(b)

a.add_generator(c)
a.generate_notes()

reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
# print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
# cs_utils.play_csound("simple-index-247.orc", a, silent=True, args_list=['-odac1', '-W'])

cs = cs_utils.init_csound_with_orc(['-odac0', '-+rtaudio=CoreAudio'],
                                   "simple-index-247.orc",
                                   True,
                                   None)
cs.readScore("f1 0 513 10 1\ni99 0 3600 10\ne\n")
cs.start()
cpt = ctcsound.CsoundPerformanceThread(cs.csound())
cpt.play()

t = NoteGeneratorThread(a, cs, cpt)
t.daemon = True
t.start()

c.with_pitches(Itemstream(['e3', 'fs3', 'a3'], notetype=notetypes.pitch, streammode=streammodes.sequence))
b.rhythms(Itemstream(['q'], notetype=notetypes.rhythm, streammode=streammodes.random))
t.gen()

a.tempo(240)
a.amps(0)
a.with_rhythm(Itemstream('e e e w+w w+w'.split(), notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=120))
a.with_pitches(Itemstream(['e3','a4','b','a','r',['e2','c3','b'],['e2','d3','b'],['e2','e3','b'],['e2','c3','b'],'r'], notetype=notetypes.pitch, streammode=streammodes.sequence))
t.gen()

a2 = a.deepcopy()
a3.with_rhythm(Itemstream('q'.split(), notetype=notetypes.rhythm, streammode=streammodes.random, tempo=120))
a2.durs(lambda note: note.rhythm*1.25)
a2.with_pitches(Itemstream(['e4'], notetype=notetypes.pitch, streammode=streammodes.sequence))
a2.post_processes = [freq_to_file]
a.add_generator(a2)
# a.add_generator(b)
a3 = a2.deepcopy()
a.add_generator(a3)
a2.pan('10')
a3.tempo(120)
a3.durs(lambda note: note.rhythm*1.25)
a3.pan('80')
t.gen()

a.amps(.25)
a.tempo(60)
a2.amps(0)
a3.amps(0)
a2.post_processes = [freq_to_file_disperse_octaves]
a3.post_processes = [freq_to_file_disperse_octaves]
b.amps(.25)
a2.generators = []
a.pan(10)
b.pan(80)
t.gen()