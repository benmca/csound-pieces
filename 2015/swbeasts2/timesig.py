#use variable blueDuration for duration from blue
#use variable userConfigDir for user's .blue dir
#use variable blueLibDir for blue's lib directory
#use variable blueProjectDir for this project's directory
#use variable score at end of script to bring score back into blue
from thuja.itemstream import Itemstream
from thuja.score import Score

rhythms = Itemstream(['e','s','s','s','s','s','s','s','q','e'],'sequence', tempo=60)
rhythms.notetype = 'rhythm'
amps = Itemstream(sum([[1]*8+[0]*3],[]))

pitches = Itemstream(sum([[1]],[]))
pitches.streammode = 'heap'

pan  = Itemstream([45])
dist = Itemstream([10])
pct  = Itemstream([.1])

s = Score(rhythms,[amps,pitches,pan,dist,pct], note_limit=(len(pitches.values)*10))

s.gen_lines = ["f 1 0 16384 10 1\nf 2 0 256 7 0 128 1 0 -1 128 0\nf 3 0 256 7 1 128 1 0 -1 128 -1\nf4 0 131072 1 \"/Users/benmca/Music/Portfolio/snd/ShortwaveSounds/TimeSignals/OnTheHour_Distorted.wav\"\nf5 0 16384 9 .5 1 0\n"]
s.durstream = Itemstream([.1])
s.instr = Itemstream([3, 3, 1, 3, 3, 1, 2, 1, 1, 1, 1 ])
s.generate_notes()

output = ""
for x in range(len(s.gen_lines)):
    output += s.gen_lines[x]
for x in range(len(s.notes)):
    output += s.notes[x]
    
s.end_lines = ['i99 0 ' + str(s.score_dur) + '\n']
    
# s.generate_score("timesig.sco")
print(s.generate_score_string())

