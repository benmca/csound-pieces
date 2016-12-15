# use variable blueDuration for duration from blue
# use variable userConfigDir for user's .blue dir
# use variable blueLibDir for blue's lib directory
# use variable blueProjectDir for this project's directory
# use variable score at end of script to bring score back into blue
from composition.itemstream import Itemstream
from composition.score import Score
import numpy.random as nprnd

rhythms = Itemstream([.05*nprnd.random() for i in xrange(40)], 'sequence', tempo=60)
# rhythms = Itemstream([.1*nprnd.random() for i in xrange(10)], 'sequence', tempo=60)
# rhythms = Itemstream([.5+nprnd.random() for i in xrange(10)], 'sequence', tempo=60)
# rhythms = Itemstream([1+nprnd.random() for i in xrange(10)], 'sequence', tempo=60)
# rhythms.notetype = 'rhythm'
amps = Itemstream([.5])

pitches = Itemstream([1])
# pitches.streammode = 'heap'

pan = Itemstream([45])
dist = Itemstream([10])
pct = Itemstream([.1])

s = Score(rhythms, [amps, pitches, pan, dist, pct], note_limit=40)

s.gen_lines = [
    "f 1 0 16384 10 1\nf 2 0 256 7 0 128 1 0 -1 128 0\nf 3 0 256 7 1 128 1 0 -1 128 -1\nf4 0 131072 1 \"/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/OnTheHour_Distorted.wav\"\nf5 0 16384 9 .5 1 0\n"]
s.durstream = Itemstream([(2*60)+44.859])
s.instr = Itemstream([1])
s.generate_notes()

s.end_lines = ['i99 0 ' + str(s.score_dur) + '\n']

s.generate_score("repeater2-.05.sco")
# print(s.generate_score_string())

