sr=22050
kr=2205
ksmps=10
nchnls=1

instr 1
kenv	linen	10000, .01, p3, .01
ktmpnt	linseg	0, p3, 4	

kp1,ka1	pvread	ktmpnt, "Medium.pv", 22
kp2,ka2	pvread	ktmpnt, "Medium.pv", 24
kp3,ka3	pvread	ktmpnt, "Medium.pv", 26
kp4,ka4	pvread	ktmpnt, "Medium.pv", 28
kp5,ka5	pvread	ktmpnt, "Medium.pv", 30
kp6,ka6	pvread	ktmpnt, "Medium.pv", 32
kp7,ka7	pvread	ktmpnt, "Medium.pv", 34
kp8,ka8	pvread	ktmpnt, "Medium.pv", 36
kp9,ka9	pvread	ktmpnt, "Medium.pv", 38
kp10,ka10	pvread	ktmpnt, "Medium.pv", 40

asig1	oscili	ka1, kp1, 1
asig2	oscili	ka2, kp2, 1
asig3	oscili	ka3, kp3, 1
asig4	oscili	ka4, kp4, 1
asig5	oscili	ka5, kp5, 1
asig6	oscili	ka6, kp6, 1
asig7	oscili	ka7, kp7, 1
asig8	oscili	ka8, kp8, 1
asig9	oscili	ka9, kp9, 1
asig10	oscili	ka10, kp10, 1

out	asig1+asig2+asig3+asig4+asig5+asig6+asig7+asig8+asig9+asig10

endin

