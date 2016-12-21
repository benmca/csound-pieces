from composition.itemstream import notetypes
from composition.itemstream import streammodes
from composition.itemstream import Itemstream
from composition.generator import Generator
from composition.generator import keys
from collections import OrderedDict
from composition import utils
import copy
import csnd6

global_tempo = 60

rhythms = Itemstream(
    'w w w w w+w+w w+w w w w+w'.split(),
    streammode=streammodes.sequence,
    tempo=global_tempo,
    notetype=notetypes.rhythm)

pitches = Itemstream('r b4 a g3 f e d c b'.split(),
    streammode=streammodes.sequence,
    notetype=notetypes.pitch
)

line1 = Generator(
    streams=OrderedDict([
        (keys.instrument, 1),
        (keys.rhythm, rhythms),
        (keys.duration, lambda note: note.rhythm*1.25),
        (keys.amplitude, .5),
        (keys.frequency, pitches),
        (keys.pan, 0),
        (keys.distance, 10),
        (keys.percent, .1)
    ]),
    pfields=None,
    gen_lines = [';sine\n',
               'f 1 0 16384 10 1\n',
               ';saw',
               'f 2 0 256 7 0 128 1 0 -1 128 0\n',
               ';pulse\n',
               'f 3 0 256 7 1 128 1 0 -1 128 -1\n']
)



rhythm_list = ['w+w+w w w+w w w w+w+w w+w',
                'w+w+w+w+w w+w+w+w+w w w w',
                'w w+w w w+w w w w+w+w w+w',
                'w w w w w+w+w w+w w w w+w',
                'w w w w w w w w w+w w w w']

pitch_list = ['c4 b a g3 e f e',
            'r cs4 c4 b a',
            'r d4 e f g b5 a b',
            'd4 e f g a5 b c d e',
            'r r r r r r r r ds4 e f g']

for r in range(len(rhythm_list)):
    new_line = copy.deepcopy(line1)
    new_line.streams[keys.rhythm] = Itemstream(
                                    rhythm_list[r].split(),
                                    streammode=streammodes.sequence,
                                    tempo=global_tempo,
                                    notetype=notetypes.rhythm)
    new_line.streams[keys.frequency] = Itemstream(pitch_list[r].split(),
                                                streammode=streammodes.sequence,
                                                notetype=notetypes.pitch
                                                )
    angle = 90.0/(len(rhythm_list)+1) * r
    new_line.streams[keys.pan] = Itemstream([angle])
    line1.add_generator(new_line)

line1.time_limit = utils.rhythm_to_duration('w',global_tempo)*13.0
line1.generate_notes()
line1.end_lines = ['i99 0 ' + str(line1.score_dur+10) + '\n']

with open ("../sine.orc", "r") as f:
    orc_string=f.read()
score_string = line1.generate_score_string()
line1.generate_score('mandala2.sco')
print score_string
cs = csnd6.Csound()
cs.CompileOrc(orc_string)
cs.ReadScore(score_string)


#csound -odac -Q3 -b64 -B64 tests/test.orc test.sco
cs.SetOption('-odac4')
# cs.SetOption('-Q0')
# cs.SetOption('-b64')
# cs.SetOption('-B64')
cs.Start()
cs.Perform()
cs.Stop()
