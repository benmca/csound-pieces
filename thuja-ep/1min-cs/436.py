from thuja.itemstream import Itemstream
from thuja.generator import BasicLine, GeneratorThread
from thuja.itemstream import streammodes, notetypes
from thuja.generator import StreamKey as key
from thuja.generator import keys
import thuja.utils as utils
import thuja.csound_utils as cs_utils
import random

ost_1 = "a2 b c3 a2 d3 a2 d3 e3 a2 e3 a2".split()
ost_2 = "f2 g a f b f b c3 f2 b f".split()
ost_3 = "e2 f2 g a e2 b e2 b c3 e2 d2 f".split()

def durations(note, context):

    note.pfields[key.duration] = 1 * ((context["duration_step"] % 22) / 22) + .1
    context["duration_step"] = context["duration_step"] + 1

def amps(note, context):

    note.pfields[key.amplitude] = .4 * ((context["duration_step"] % 22) / 22) + .1
    # context["duration_step"] = context["duration_step"] + 1



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



def random_indexes(note, context):
    note.pfields[key.index] = random.random()*20

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


def post_process(note, context):
    if random.random() > .5:
        i = random.randint(0, len(a.streams[keys.frequency].values)-1)
        val = a.streams[keys.frequency].values[i]
        if isinstance(val, list):
            for x in range(len(val)):
                val = a.streams[keys.frequency].values[i][x]
                freq = utils.pc_to_freq(val, a.streams[keys.frequency].current_octave)['value']
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
                a.streams[keys.frequency].values[i][x] = newpc
        else:
            freq = utils.pc_to_freq(val, a.streams[keys.frequency].current_octave)['value']
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
            a.streams[keys.frequency].values[i] = newpc


def post_process_2(note, context):
    if random.random() > .5:
        i = random.randint(0, len(b.streams[keys.frequency].values)-1)
        val = b.streams[keys.frequency].values[i]
        if isinstance(val, list):
            for x in range(len(val)):
                val = b.streams[keys.frequency].values[i][x]
                freq = utils.pc_to_freq(val, b.streams[keys.frequency].current_octave)['value']
                midinote = utils.freq_to_midi_note(freq)
                if random.random() > .6:
                    if random.random() > .5:
                        if random.random() > .5:
                            midinote += 5
                        else:
                            midinote -= 5
                    else:
                        if random.random() > .5:
                            midinote += 4
                        else:
                            midinote -= 4
                newfreq = utils.midinote_to_freq(midinote)
                newpc = utils.freq_to_pc(newfreq, True)
                b.streams[keys.frequency].values[i][x] = newpc
        else:
            freq = utils.pc_to_freq(val, b.streams[keys.frequency].current_octave)['value']
            midinote = utils.freq_to_midi_note(freq)
            if random.random() > .6:
                if random.random() > .5:
                    if random.random() > .5:
                        midinote += 3
                    else:
                        midinote += 4
                        midinote += 12
                else:
                    if random.random() > .5:
                        midinote -= 3
                    else:
                        midinote -= 4
                        midinote -= 12
            newfreq = utils.midinote_to_freq(midinote)
            newpc = utils.freq_to_pc(newfreq, True)
            b.streams[keys.frequency].values[i] = newpc


a = (
    BasicLine().with_rhythm(Itemstream(['w+w']+['e']*12 , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note:note.rhythm*.5)
        .with_amps(1)
        .with_pitches(Itemstream([['e4', 'g4', 'a4']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30 45 60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(5)
        .with_percent(lambda note: random.random()*.04 + .01)
        .with_instr(5)
)

a.post_processes = [post_process, freq_to_file_5ths]
a.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
a.set_stream('atck', .01)
a.set_stream('rel', .1)
a.start_time = 0
a.time_limit = 50
a.tempo(120)
a.with_index(0)
a.set_stream('filepitch',Itemstream([2, 3], notetype=notetypes.number, streammode=streammodes.sequence))


b = (
    BasicLine().with_rhythm(Itemstream(['w']+['s']*31 , notetype=notetypes.rhythm, streammode=streammodes.sequence))
        .with_duration(lambda note:note.rhythm*.9)
        .with_amps(1)
        .with_pitches(Itemstream([['e2', 'b2']], notetype=notetypes.pitch, streammode=streammodes.sequence))
        .with_pan(Itemstream('30 45 60'.split(), notetype=notetypes.number, streammode=streammodes.heap))
        .with_dist(5)
        .with_percent(lambda note: random.random()*.04 + .01)
        .with_instr(5)
)

b.post_processes = [post_process_2, freq_to_file_5ths]
b.set_stream('inst_file', Itemstream([""], notetype=notetypes.path))
b.set_stream('atck', .01)
b.set_stream('rel', .1)
b.start_time = 0
b.time_limit = 60
b.tempo(120)
b.with_index(0)
b.set_stream('filepitch',Itemstream([2, 3], notetype=notetypes.number, streammode=streammodes.sequence))

a.add_generator(b)
a.generate_notes()


reverb_time = 10
a.end_lines = ['i99 0 ' + str(a.score_dur+10) + ' ' + str(reverb_time) + '\n']
print(a.generate_score_string())

cs_utils.play_csound("260.orc", a, silent=True, args_list=['-o436.wav', '-W'])
