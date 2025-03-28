sr=32768 ; Using this sampling rate with a note duration of 1 second
kr=32768 ; will give a soundfile of 32768 in size.
ksmps=1
nchnls=1

instr 1 ;This instrument along with the score below
        ;reads a portion of a soundfile and applies
        ;a half sine envelope. This can then be used
        ;in the sampling instrument which overlaps
        ;two copies of this file to prolong the duration
        ;without changing the frequency. See instr. 5
        ;of the simple sampling examples.

a1 soundin "bulge2.aiff", 1
aenv    oscili  1, 1/p3, 1

out a1 * aenv

endin
