sr=44100
kr=4410
ksmps=10
nchnls=2

;
;Filter has wide bandwidth at point a, gradually growing narrow at point b
;
instr 1
idur=p3

kband	expseg	20000,p3-38, 20000, 15, 40,23,40
;soundin...
asigl, asigr	soundin	"sw_materials_mix.wav"


;filter...
al	butterbp	asigl, 344, kband
ar	butterbp	asigr, 344, kband

outs	al,ar
endin


