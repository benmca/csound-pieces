
import composition
import composition.itemstream as ci
import composition.score as cs
import numpy as np

rhythms = ci.itemstream(['e'],'sequence', tempo=np.linspace(60,500,64).tolist()+np.linspace(500,60,64).tolist(), notetype='rhythm')
amps = ci.itemstream([3])
pitches = ci.itemstream(['c4']*7+['c2'], notetype='pitch')
#pitches.streammode = 'heap'
pan = ci.itemstream([0])
dist= ci.itemstream([10])
pct = ci.itemstream([.01])

s = cs.score(rhythms,[amps,pitches,pan,dist,pct], note_limit=300)
s.gen_lines = [';sine\n','f 1 0 16384 10 1\n',';saw','f 2 0 256 7 0 128 1 0 -1 128 0\n',';pulse\n','f 3 0 256 7 1 128 1 0 -1 128 -1\n']
s.durstream = ci.itemstream([.1])
s.instr = 1
s.generate_notes()

s.rhythmstream.tempo = np.linspace(60,500,64).tolist()+np.linspace(500,60,64).tolist()
s.streams[1] = ci.itemstream(['d4']*7+['d2'], notetype='pitch')
s.streams[2] = ci.itemstream([45])
s.note_limit=330
s.generate_notes()

s.rhythmstream.tempo = np.linspace(30,300,64).tolist()+np.linspace(300,30,64).tolist()
s.streams[1] = ci.itemstream(['e4']*7+['e2'], notetype='pitch')
s.streams[2] = ci.itemstream([90])
s.note_limit=154
s.generate_notes()

output = ""
for x in range(len(s.gen_lines)):
    output += s.gen_lines[x]
for x in range(len(s.notes)):
    output += s.notes[x]

s.end_lines = ['i99 0 ' + str(s.score_dur) + '\n']

s.generate_score("tempo_canon.sco")
#score  = s.generate_score_string()
