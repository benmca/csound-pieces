sr=44100
ksmps=1000
nchnls=2

ga1 init 0
ga2 init 0




instr 1 ;sine

inotenum  = 12 * (log(p5/220)/log(2))+57

;convert scalar 0 > 1 to velocity value 0 > 127
iamp = p4
ivelocity = 120
idur = .1

print inotenum
print ivelocity
print idur

noteondur2   1, inotenum, ivelocity, idur
endin
