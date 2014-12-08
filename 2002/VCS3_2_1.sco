;------------------------------------------------------------------------------------------
; EMS VCS3 / Synthi A Emulator by Steven Cook - stevencook@appleonline.net
;------------------------------------------------------------------------------------------
f1 0 4097 7 0 4096 1                      ; + Ramp
f2 0 4097 7 -1 2048 1 2048 -1             ; Triangle
f3 0 4097 7 1 2048 1 0 -1 2048 -1         ; Square
f4 0 4097 -9 .5 1 270                     ; Rising Sigmoid for sine shaper
f5 0 8193 7 0 2048 1 2048 1 2048 0 2048 0 ; Trapezoid
f7 0 8193 -5 .5 8192 16384                ; Exponential curve for oscillator frequency
f8 0 8193 -5 5 8192 10000                 ; Exponential curve for filter frequency
t 0 .1 ; Adjust tempo to vary output duration
;------------------------------------------------------------------------------------------
;OSCILLATOR 1   freq   shape  sine   saw
i1  0   1       7.000  0.52   0.75   0.10
;OSCILLATOR 2   freq   shape  pulse  ramp   sync
i2  0   1       1.000  0.00   0.75   0.60   0
;OSCILLATOR 3   freq   shape  pulse  ramp   sync   lfo
i3  0   1       3.050  0.33   0.00   0.25   0      1
;NOISE          color  level
i4  0   1       0.40   0.75
;INPUT          level  level
;i5 0   1       1.00   1.00
;FILTER         freq   resp   level
i6  0   1       0.50   0.90   0.50  
;ENVELOPE       attack on     decay  off    trap   signal
i10 0   1       0.25   0.00   7.75   1.00   0.66   1.00
;RING MOD       level
i7  0   1       0.66
;REVERBERATION  mix    level
i8  0   1       1.00   0.50
;JOYSTICK       rangeX rangeY rateX  rateY
i9  0   1       0.10   0.10   1.33   2.77
;OUTPUT         level1 pan1   pan2   level2 color1 color2
i99 0   1       0.70   0.00   1.00   0.70   0.50   0.50

i80 0 1
i81 0 1
i82 0 1
i83 0 1
i84 0 1
i85 0 1
i86 0 1
i87 0 1
i88 0 1
i89 0 1
i90 0 1
i91 0 1
i92 0 1
i93 0 1
i94 0 1
i95 0 1
