from thuja.itemstream import Itemstream
from thuja.notegenerator import Line, GeneratorThread
from thuja.itemstream import streammodes, notetypes
from thuja.streamkeys import StreamKey as key, keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import random

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
    note.pfields['inst_file'] = '"' + '/Users/ben/Library/CloudStorage/Dropbox/_gtrs/' + note.pfields[key.frequency] + '.wav' + '"'


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

def spawn(note):
    pass

a = (
    Line().with_rhythm(Itemstream(['w+w']+['e']*12 , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note:note.rhythm*.5)
        .with_amps(1)
        .with_pitches(Itemstream([['e4', 'g4', 'a4']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30 45 60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(5)
        .with_percent(lambda note: random.random()*.04 + .01)
        .with_instr(5)
)

a.post_processes = [spawn, freq_to_file_5ths]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.start_time = 0
a.time_limit = 50
a.tempo(120)
a.with_index(0)
a.set_stream('filepitch',Itemstream([2, 3], notetype=notetypes.number, streammode=streammodes.sequence))

a.generate_notes()


reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

cs_utils.play_csound("260.orc", a, silent=True, args_list=['-odac1', '-W'])
