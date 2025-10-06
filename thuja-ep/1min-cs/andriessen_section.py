from thuja.itemstream import Itemstream
from thuja.notegenerator import Line
from thuja.itemstream import streammodes, notetypes
from thuja.streamkeys import StreamKey as key
import thuja.utils as utils
import thuja.csound_utils as cs_utils


gtr1 = ['r','a3', 'g3', 'a3', 'a3', 'g3', 'a3', 'a3', 'g3', 'a3', 'a3', 'g3', 'a3', 'a3']
gtr1_rhythms = 'q+s e.+q+e. s+h+e e+h+q+s e.+q+e. s+h+e e+h+q+s e.+q+e. s+h+e e+h+q+s e.+q+e. s+h+e e+h+q+s e.+q'.split()

gtr2 = 'b2 a2 b2 a2 b2 a2 b2 a2 b2 a2 b2 a2 b2 a2 b2 a2 b2 a2'.split()
gtr2_rhythms = 'h+e e+h+s e.+q+e. s+q h+e e+h+s e.+q+e. s+q h+e e+h+s e.+q+e. s+q h+e e+h+s e.+q+e. s+q h+e e'.split()

gtr3 = 'a2'.split()
gtr3_rhythms = 'q'.split()

gtr4 = 'a3 r a3 r a3 r a3'.split()
gtr4_rhythms = 'q s e. e e e. s'.split()

tempo = 120


pitches_to_files = {
    'a': 'a.wav',
    'as': 'as.wav',
    'b': 'b.wav',
    'c': 'c.wav',
    'cs': 'cs.wav',
    'd': 'd.wav',
    'ds': 'ds.wav',
    'e': 'e.wav',
    'f': 'f.wav',
    'fs': 'fs.wav',
    'g': 'g.wav',
    'gs': 'gs.wav'
}


def cleanup_strings_gtrs(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_gtrs/' + note.pfields['filepitch'] + '.wav' + '"'


def cleanup_strings_ebows(note, context):
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_ebows/' + utils.freq_to_pc(note.pfields[key.frequency], False) + '.wav' + '"'



def freq_to_file(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/single-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '.wav' + '"')
        note.pfields[key.frequency] = 1
    pass

def freq_to_file_5ths(note, context):
    if note.pfields[key.frequency] == 0:
         note.pfields[key.amplitude] = 0
    else:
        note.pfields['inst_file'] = ('"' + '/Users/ben/Desktop/gtr-samples/p5-open/'
                                     + utils.freq_to_pc(note.pfields[key.frequency], True) + '-p5.wav' + '"')
        note.pfields[key.frequency] = 1
    pass


a = (
    Line().with_rhythm(Itemstream(gtr1_rhythms, notetype=notetypes.rhythm, streammode=streammodes.sequence, tempo=tempo))
        .with_duration(lambda note:note.rhythm*.25)
        .with_amps(1)
        .with_pitches(Itemstream(gtr1, notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('10'.split(), notetype=notetypes.number))
        .with_dist(10)
        .with_percent(.05))

a.post_processes = [freq_to_file_5ths]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.time_limit = 120

b = a.deepcopy().with_rhythm(Itemstream(gtr2_rhythms, notetype=notetypes.rhythm, tempo=tempo)).with_pitches(Itemstream(gtr2, notetype=notetypes.pitch)).with_pan(80)
a.add_generator(b)
c = a.deepcopy().with_rhythm(Itemstream(gtr3_rhythms, notetype=notetypes.rhythm, tempo=tempo)).with_pitches(Itemstream(gtr3, notetype=notetypes.pitch)).with_pan(45).with_amps(1.5).with_duration(lambda note:note.rhythm*.25)
a.add_generator(c)

d = a.deepcopy().with_rhythm(Itemstream(gtr4_rhythms, notetype=notetypes.rhythm, tempo=tempo)).with_pitches(Itemstream(gtr4, notetype=notetypes.pitch)).with_duration(lambda note:note.rhythm).with_pan(45).with_amps(1)
a.add_generator(d)

a.generate_notes()

reverb_time = 0.1
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

# cs_utils.play_csound("simple-index.orc", container, silent=True, args_list=['-o9_gtrs.wav', "-W"])
cs_utils.play_csound("255.orc", a, silent=True, args_list=['-odac99', '-W'])
