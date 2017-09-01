;-------------------------------------------------------------------------------
; EMS VCS3 / Synthi A Emulator by Steven Cook - steve@babcom.u-net.com
;-------------------------------------------------------------------------------
sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 2
zakinit  16, 1 ; 16 Audio channels for Patch Matrix & 1 control channel for sync
;-------------------------------------------------------------------------------
;                 Inputs (global)         Outputs (zak)
ga01     init 0 ; Not used                Oscillator 1 sine
ga02     init 0 ; Output ch.1 in          Oscillator 1 saw
ga03     init 0 ; Output ch.2 in          Oscillator 2 pulse
ga04     init 0 ; Trapezoid amp in        Oscillator 2 ramp
ga05     init 0 ; Ring Mod A in           Oscillator 3 pulse
ga06     init 0 ; Ring Mod B in           Oscillator 3 ramp
ga07     init 0 ; Reverb in               Noise
ga08     init 0 ; Filter in               Input ch.1
ga09     init 0 ; Oscillator 1 freq mod   Input ch.2
ga10     init 0 ; Oscillator 2 freq mod   Filter
ga11     init 0 ; Oscillator 3 freq mod   Trapezoid
ga12     init 0 ; Decay mod               Env signal
ga13     init 0 ; Reverb mix mod          Ring Mod
ga14     init 0 ; Filter freq mod         Reverb
ga15     init 0 ; Output level mod ch.1   Joystick X
ga16     init 0 ; Output level mod ch.2   Joystick Y
;-------------------------------------------------------------------------------
instr    1 ; OSCILLATOR 1 - Variable sine and fixed saw
ioct     = int(p4)*2184.533333            ; Frequency - octaves
isemi    = frac(p4)*18204.44444           ; Frequency - semitones
ifreq    = ioct + isemi                   ; Sum octaves and semitones
ishape   = p5 - .5                        ; Shape
ilevl1   = p6*32767                       ; Sine output level
ilevl2   = p7*65535                       ; Saw output level
afmod    = ga09                           ; Frequency modulation input
ga09     = 0                              ; Clear global ch.09
afreq    = ifreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
ksaw     downsamp  asaw                   ; Convert ramp to kr
ksync    trigger  ksaw, .5, 1             ; Detect falling edge of ramp
zkw      ksync, 0                         ; Output sync pulse to zak ch.0
atri     oscili .5, afreq, 2, -1          ; Generate triangle
asine    tablei  atri + ishape, 4, 1, .5  ; Shape triangle into sine
zaw      asine*ilevl1, 01                 ; Output to zak ch.01
zaw      (asaw - .5)*ilevl2, 02           ; Output to zak ch.02
endin
;-------------------------------------------------------------------------------
instr    2 ; OSCILLATOR 2 - Variable pulse and ramp
asaw     init 0                           ; Initialise ramp to zero
ioct     = int(p4)*2184.533333            ; Frequency - octaves
isemi    = frac(p4)*18204.44444           ; Frequency - semitones
ifreq    = ioct + isemi                   ; Sum octaves and semitones
ishape   limit  p5, .01, .99              ; Shape, limited to avoid 0% pulse
ishift   = abs(.5 - ishape)/2 + .25       ; Calc DC level shift for ramp
ilevl1   = p6*32767                       ; Pulse output level
ilevl2   = p7*65535                       ; Ramp output level
isync    = p8                             ; Sync
afmod    = ga10                           ; Frequency modulation input
ga10     = 0                              ; Clear global ch.10
afreq    = ifreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
ksync    zkr 0                            ; Sync pulse input from oscillator 1
ksync    = (isync > 0 ? ksync : 0)        ; Sync on/off switch
afreq    = (ksync > 0 ? (1 - asaw)*sr : afreq) ; Calc frequency to reset
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
asaw1    limit  asaw, 0, ishape           ; Isolate lower section
asaw2    limit  asaw, ishape, 1           ; Isolate upper section
aramp    = asaw1*(.5/ishape) + (asaw2 - ishape)*(.5/(1 - ishape)) ; Recalc ramp
apulse   table  aramp, 3, 1               ; Read pulse wave from table
aramp    mirror  1 - asaw - ishape, 0, 1  ; Full wave rectify (saw + shape)
zaw      apulse*ilevl1, 03                ; Output to zak ch.03
zaw      (aramp - ishift)*ilevl2, 04      ; Output to zak ch.04
endin
;-------------------------------------------------------------------------------
instr    3 ; OSCILLATOR 3 - Variable pulse and ramp, LFO or audio rate
asaw     init 0                           ; Initialise ramp to zero
ioct     = int(p4)*2184.533333            ; Frequency - octaves
isemi    = frac(p4)*18204.44444           ; Frequency - semitones
ifreq    = ioct + isemi                   ; Sum octaves and semitones
ishape   limit  p5, .01, .99              ; Shape, limited to avoid 0% pulse
ishift   = abs(.5 - ishape)/2 + .25       ; Calc DC level shift for ramp
ilevl1   = p6*32767                       ; Pulse output level
ilevl2   = p7*65535                       ; Ramp output level
isync    = p8                             ; Sync
imode    = (p9 > 0 ? .05 : 1)             ; LFO/audio rate switch
afmod    = ga11                           ; Frequency modulation input
ga11     = 0                              ; Clear global ch.11
afreq    = ifreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
ksync    zkr 0                            ; Sync pulse input from oscillator 1
ksync    = (isync > 0 ? ksync : 0)        ; Sync on/off switch
afreq    = (ksync > 0 ? (1 - asaw)*sr : afreq*imode) ; Calc frequency to reset
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
asaw1    limit  asaw, 0, ishape           ; Isolate lower section
asaw2    limit  asaw, ishape, 1           ; Isolate upper section
aramp    = asaw1*(.5/ishape) + (asaw2 - ishape)*(.5/(1 - ishape)) ; Recalc ramp
apulse   table  aramp, 3, 1               ; Read pulse wave from table
aramp    mirror  1 - asaw - ishape, 0, 1  ; Full wave rectify (saw + shape)
zaw      apulse*ilevl1, 05                ; Output to zak ch.05
zaw      (aramp - ishift)*ilevl2, 06      ; Output to zak ch.06
endin
;-------------------------------------------------------------------------------
instr    4 ; NOISE GENERATOR
icolour1 = ampdb((1 - p4 - .5)*24)        ; Colour (bass)
icolour2 = ampdb((p4 - .5)*24)            ; Colour (treble)
ilevl    = p5                             ; Output level
iseed    = rnd(1)                         ; Generate seed value
anoise   rand  32000, iseed               ; Generate white noise
anoise   pareq  anoise, 100, icolour1, .707, 1 ; Bass +/-
anoise   pareq  anoise, 10000, icolour2, .707, 2 ; Treble -/+
zaw      anoise*ilevl, 07                 ; Output to zak ch.07
endin
;-------------------------------------------------------------------------------
instr    5 ; INPUT 1 and 2 - Mono Sample1 inputs
ilevl1   = p4                             ; Input 1 level
ilevl2   = p5                             ; Input 2 level
ain1     soundin  "Sample1"               ; Input Sample1 1
ain2     soundin  "Sample2"               ; Input Sample1 2
zaw      ain1*ilevl1, 08                  ; Output to zak ch.08
zaw      ain2*ilevl2, 09                  ; Output to zak ch.09
endin
;-------------------------------------------------------------------------------
instr    6 ; FILTER / OSCILLATOR
ifreq    = p4*.8 + .2                     ; Frequency (cutoff)
irez     = p5                             ; Response (resonance)
ilevl    = p6*65536                       ; Output level
ain      limit  ga08/65536, -1, 1         ; Signal input, limited
ga08     = 0                              ; Clear global ch.08
afmod    = ga14/32767                     ; Frequency modulation input
ga14     = 0                              ; Clear global ch.14
afreq    tablei  ifreq + afmod, 8, 1      ; Linear to exponential convertor
afilt    moogvcf  ain, afreq, irez        ; Filter
zaw      afilt*ilevl, 10                  ; Output to zak ch.10
endin
;-------------------------------------------------------------------------------
instr    7 ; RING MOD
ilevl    = p4                             ; Output level
ain1     = ga05/32767                     ; Input A
ain2     = ga06/32767                     ; Input B
ga05     = 0                              ; Clear global ch.05
ga06     = 0                              ; Clear global ch.06
aring    = ain1*ain2*32767                ; Calculate and scale ring modulation
zaw      aring*ilevl, 13                  ; Output to zak ch.13
endin
;-------------------------------------------------------------------------------
instr    8 ; REVERBERATION
imix     = p4                             ; Mix (wet/dry)
ilevl    = p5                             ; Output level
ain      = ga07                           ; Signal input
amixmod  = ga13/32767                     ; Mix modulation input
ga07     = 0                              ; Clear global ch.07
ga13     = 0                              ; Clear global ch.13
arvb     reverb  ain, 3                   ; Generate reverb
amix     limit  amixmod + imix, 0, 1      ; Limit mix range 0 to 1
arvb     = arvb*amix + ain*(1 - amix)     ; Calculate wet/dry balance
zaw      arvb*ilevl, 14                   ; Output to zak ch.14
endin
;-------------------------------------------------------------------------------
instr    9 ; JOYSTICK - Dual random moulation source
irngex   = p4*32767                       ; X Range
irngey   = p5*32767                       ; Y Range
iratex   = p6                             ; X Rate
iratey   = p7                             ; Y Rate
iseed    = rnd(1)                         ; Generate random seed value
kx       randi  1, iratex, iseed          ; Generate X random modulation
ky       randi  1, iratey, iseed          ; Generate Y random modulation
kjoyx    = sin(90 - sininv(kx))           ; Calculate X circular boundary
kjoyy    = sin(90 - sininv(ky))           ; Calculate Y circular boundary
kx       limit  kx, -kjoyy, kjoyy         ; Constrain X within Y boundary
ky       limit  ky, -kjoyx, kjoyx         ; Constrain Y within X boundary
ax       upsamp  kx                       ; Convert X to sr
ay       upsamp  ky                       ; Convert Y to sr
zaw      ax*irngex, 15                    ; Output X to zak ch.15
zaw      ay*irngey, 16                    ; Output Y to zak ch.16
endin
;-------------------------------------------------------------------------------
;instr    9 ; JOYSTICK - Realtime X-Y input using mouse (untested)
;irangex  = p4                             ; Range X
;irangey  = p5                             ; Range Y
;kx, ky   xyin  .1, -32767, 32767, -32767, 32767, 0, 0 ; Input mouse position
;ajoyx    interp  kx*irangex               ; Convert to audio rate
;ajoyy    interp  ky*irangey               ; Convert to audio rate
;zaw      ajoyx, 15                        ; Output to zak ch.15
;zaw      ajoyy, 16                        ; Output to zak ch.16
;endin
;-------------------------------------------------------------------------------
instr    10 ; ENVELOPE SHAPER
iattack  limit  p4, .001, 100             ; Attack time
ion      = p5 + .001                      ; On (sustain) time
kdecay   init p6 + .001                   ; Decay time
ioff     = p7 + .001                      ; Off (repeat delay) time
itrap    = p8*32767                       ; Trapezoid output level
iamp     = p9                             ; Amplifier output level
ain      = ga04*iamp                      ; Amplifier signal input
admod    = ga12/32767                     ; Decay modulation input
ga04     = 0                              ; Clear global ch.04
ga12     = 0                              ; Clear global ch.12
kdmod    downsamp  admod                  ; Convert decay modulation to kr
kdecay   = kdecay + abs(kdmod)            ; Add decay modulation avoiding (-)
krate    = 1/(iattack + ion + kdecay + ioff) ; Total env time
i1       = iattack                        ; 1st index level
i2       = i1 + ion                       ; 2nd index level
k3       = i2 + kdecay                    ; 3rd index level
k4       = k3 + ioff                      ; 4th index level
aramp    oscil  k4, krate, 1              ; Generate (+) ramp
a1       limit  aramp, 0, i1              ; Isolate 1st section of ramp
a2       limit  aramp, i1, i2             ; Isolate 2nd section of ramp
a3       limit  aramp, i2, k3             ; Isolate 3rd section of ramp
a4       limit  aramp, k3, k4             ; Isolate 4th section of ramp
; Recalculate ramp
aramp = .25*(a1*(1/iattack)+(a2-i1)*(1/ion)+(a3-i2)*(1/kdecay)+(a4-k3)*(1/ioff))
atrap    tablei  aramp, 5, 1              ; Generate trapezoid envelope shape
zaw      atrap*itrap, 11                  ; Output to zak ch.11
zaw      ain*atrap, 12                    ; Output to zak ch.12
endin
;-------------------------------------------------------------------------------
instr    98 ; PATCH MATRIX
ain      zar  p04                         ; Read selected zak ch.
ga02     = (p06 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (p07 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (p08 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (p09 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (p10 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (p11 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (p12 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (p13 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (p14 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (p15 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (p16 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (p17 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (p18 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (p19 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (p20 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
endin
;-------------------------------------------------------------------------------
instr    99 ; OUTPUT
ilevl1   = p4                             ; Output level ch.1
ipan1    = p5                             ; Pan ch.1
ipan2    = (1 - p6)                       ; Pan ch.2
ilevl2   = p7                             ; Output level ch.2
icolor1b = ampdb((1 - p8 - .5)*24)        ; Colour ch.1 (bass)
icolor1t = ampdb((p8 - .5)*24)            ; Colour ch.1 (treble)
icolor2b = ampdb((1 - p9 - .5)*24)        ; Colour ch.2 (bass)
icolor2t = ampdb((p9 - .5)*24)            ; Colour ch.2 (treble)
ain1     = ga02                           ; Signal input ch.1
ain2     = ga03                           ; Signal input ch.2
almod1   = ga15/32767                     ; Level modulation input ch.1
almod2   = ga16/32767                     ; Level modulation input ch.2
ga02     = 0                              ; Clear global ch.02
ga03     = 0                              ; Clear global ch.03
ga15     = 0                              ; Clear global ch.15
ga16     = 0                              ; Clear global ch.16
ain1     pareq  ain1, 100, icolor1b, .707, 1 ; Bass +/- ch.1
ain1     pareq  ain1, 10000, icolor1t, .707, 2 ; Treble -/+ ch.1
ain2     pareq  ain2, 100, icolor2b, .707, 1 ; Bass +/- ch.2
ain2     pareq  ain2, 10000, icolor2t, .707, 2 ; Treble -/+ ch.2
alevl1   limit ilevl1 + almod1, 0, 1      ; Limit level modulation ch.1
alevl2   limit ilevl2 + almod2, 0, 1      ; Limit level modulation ch.2
aout1    = ain1*alevl1                    ; VCA ch.1
aout2    = ain2*alevl2                    ; VCA ch.2
outs1    aout1*sqrt(ipan1) + aout2*sqrt(1 - ipan2) ; Output and pan ch.1
outs2    aout1*sqrt(1 - ipan1) + aout2*sqrt(ipan2) ; Output and pan ch.2
endin
;-------------------------------------------------------------------------------
