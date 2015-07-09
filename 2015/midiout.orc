sr=44100
ksmps=1000
nchnls=2

ga1 init 0
ga2 init 0




instr 1 ;sine

; convert incoming freq to midinote
;int n = (int) ( ( 12 * log(f / 220.0) / log(2.0) ) + 57.01 );
ifreq = p5
if_over_220 = ifreq/220
i1 = log(if_over_220)
i2 = log(2.0)
isolution = ( ( 12 * i1 / i2 ) + 57.01 )
inotenum = int(isolution)

;convert scalar 0 > 1 to velocity value 0 > 127
iamp = p4
ivelocity = int(127*iamp)

noteondur2   1, inotenum, ivelocity, p3-.1
endin
