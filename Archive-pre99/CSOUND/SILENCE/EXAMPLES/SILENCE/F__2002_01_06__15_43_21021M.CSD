<CsoundSynthesizer>
<CsOptions>
csound -RWdo C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-06--15-43-21.021.mml.wav C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-06--15-43-21.021.mml.orc C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-06--15-43-21.021.mml.sco
</CsOptions>
<CsInstruments>
sr = 44100
kr = 44100
ksmps = 1
nchnls = 2

;gisoundfonts		sfload 				"c:/SoundFonts/MMBIGAcousticDemo.SF2"
;					sfpassign			0, gisoundfonts
;gisoundfonts1		sfload 				"c:/SoundFonts/pc402.sf2"
;					sfpassign			6, gisoundfonts1

iafno ftgen 1, 		0, 	65537, 	10, 	1 ; Sine wave.
iafno ftgen 2, 		0, 	4097, 	10, 	1, .2, .08, .07 ; Flute-like.
iafno ftgen 3, 		0, 	4097, 	10, 	1, .4, .2, .1, .1, .05
iafno ftgen 4, 		0, 	513, 	7, 	0, 1, 0, 49, .2, 90, .6, 40, .99, 25, .9, 45, .5, 50, .25, 50, .12, 50, .06, 50, .02, 62, 0
iafno ftgen 5, 		0, 	513, 	7, 	0, 1, 0, 49, .2, 100, .6, 50, .99, 150, .2, 162, 0
iafno ftgen 6, 		0, 	513, 	7, 	0, 1, 0, 49, .2, 200, .5, 100, .2, 162, 0
iafno ftgen 7, 		0, 	513, 	7, 	0, 1, 0, 79, .5, 60, .5, 20, .99, 120, .4, 140, .6, 92, 0
iafno ftgen 8, 		0, 	513, 	5, 	.001, 513, 1 ; Exponential rise.
iafno ftgen 12, 	0, 	513, 	9, 	1, .26, 0
iafno ftgen 13, 	0, 	513, 	9, 	1, .3, 0
iafno ftgen 20, 	0, 	8193, 	20, 	3, 1 ; Triangle window.
iafno ftgen 23, 	0, 	513, 	9, 	1, 1, 0
iafno ftgen 24, 	0, 	513, 	-7, 	3000, 71, 3000, 168, 2300, 100, 2100, 71, 2000, 102, 2000
iafno ftgen 25, 	0, 	513, 	-7, 	.025, 71, .02, 102, .025, 71, .05, 268, .06
iafno ftgen 26, 	0, 	513, 	-7, 	.25, 71, .25, 102, .08, .05, 339, .05
iafno ftgen 27, 	0, 	513, 	-7, 	5, 71, 2.3, 102, 1.5, 237, 2.5, 102, 2.3
iafno ftgen 28, 	0, 	513, 	-7, 	5, 512, 6.5
iafno ftgen 30, 	0, 	8193, 	10, 	1
iafno ftgen 31, 	0, 	2049, 	19, 	.5, 1, 270, 1
iafno ftgen 32, 	0, 	513, 	-7, 	-1, 150, .1, 110, 0, 252, 0
iafno ftgen 33, 	0, 	1025, 	10, 	.3, 0, 0, 0, .1, .1, .1, .1, .1, .1
iafno ftgen 34, 	0, 	8193, 	9, 	1, 1, 90 ; Cosine for Fitch instruments.
iafno ftgen 41, 	0, 	65537, 	10, 	1 ; Sine wave.
iafno ftgen 42, 	0, 	65537, 	11, 	1 ; Cosine wave. Get that noise down on the most widely used table!
iafno ftgen 43, 	0, 	8193, 	-12, 	20.0 ; Unscaled ln(I(x)) from 0 to 20.0.
iafno ftgen 44, 	0, 	4097, 	10, 	1, .25, .1 ; Kelley flute.
iafno ftgen 45, 	0, 	2049, 	7, 	-1, 1800, 1, 249, -1 ; Kelley string.
iafno ftgen 46, 	0, 	2049, 	7, 	-1, 1024, 1, 1024, -1 ; Kelley harpsichord.
iafno ftgen 47, 	0, 	2049, 	10, 	1, 0, 1, 0, 1 ; Kelley oboe.
iafno ftgen 48, 	0, 	2049, 	10, 	3, 1, 0, .25, .3, .76 ; Nelson Chebyshev.
iafno ftgen 49, 	0, 	2049, 	13, 	1, 1, .9, .8, .7, .6, .5, .4, .3, .2, .1 ; Nelson table lookup.
iafno ftgen 50, 	0, 	8193, 	20, 	2, 1 ; Hanning window.
iafno ftgen 51, 	0, 	8193, 	-10, 	809, 14581, 2030, 990, 522, 1545, 2030, 262, 61, 45, 45, 64, 465, 139, 19, 75, 29, 42, 39, 96, 86, 75, 39, 45 ; Horner Erhu.
iafno ftgen 52, 	0, 	8193, 	-10, 	1567, 910, 870, 3119, 595, 151, 45, 111, 123, 31, 41, 127, 148, 196, 124, 142, 49, 22, 22, 59, 74, 37 ; Horner Erhu.
iafno ftgen 53, 	0, 	8193, 	-10, 	2411, 1158, 352, 922, 854, 70, 66, 152, 83, 15, 69, 69, 92, 91, 60, 30, 42, 78, 38, 41, 59, 22 ; Horner Erhu.
iafno ftgen 54, 	0, 	8193, 	-10, 	18607, 805, 771, 832, 115, 166, 115, 21, 66, 22, 135, 165, 18, 41, 85, 27, 93, 23, 8, 15, 23, 7 ; Horner Erhu.
iafno ftgen 55, 	0, 	8193, 	7, 0, 	819, 1.1, 819, 1.2, 820, 1.4, 819, 1.2, 819, 1.15, 820, 0, 8200, 0 ; Horner Erhu.
iafno ftgen 61, 	0, 	8193, 	-10, 	30, 37, 282, 99, 29, 327, 96, 77, 102, 11, 45, 7, 4, 3, 1, 1 ; Horner Pipa.
iafno ftgen 62, 	0, 	8193, 	-10, 	324, 300, 144, 160, 383, 847, 1311, 1121, 885, 586, 125, 174, 269, 100, 428, 190, 563, 294, 178, 236, 169, 173, 75, 57, 52, 57, 131, 43, 134, 77, 54, 51, 60, 107, 51, 274, 54, 30, 23, 66, 20, 12 ; Horner Pipa.
iafno ftgen 63, 	0, 	8193, 	-10, 	79, 51, 133, 10, 21, 20, 7, 3, 11, 4, 3, 2, 1, 2, 1, 2 ; Horner Pipa.
iafno ftgen 64, 	0, 	8193, 	-10, 	475, 207, 545, 323, 104, 1890, 1304, 1031, 350, 269, 245, 180, 200, 43, 45, 14, 13, 8, 13, 34, 16, 28, 16, 3, 3 ; Horner Pipa.
iafno ftgen 65, 	0, 	8193, 	-10, 	8, 24, 10, 14, 35, 30, 19, 31, 16, 16, 11, 6, 2, 7, 8, 9, 13, 11, 3, 2, 3, 1, 4, 2, 2, 2, 1, 2, 2, 1, 3, 3, 1, 4, 2, 3, 1 ; Horner Pipa.
iafno ftgen 66, 	0, 	2049, 	13, 	1, 1, .9, .8, .7, .6, .5, .4, .3, .2, .1 ; gen, 13, table, lookup, (was, 31)
iafno ftgen 67, 	0, 	2049, 	13, 	1, 1, .9, .8, .7, .6, .7, .8, .9, 1 ; gen, 13, table, lookup, (was, 32)
iafno ftgen 68, 	0, 	8193, 	20, 	7, 1, 2 ; Semi-rectangular Kaiser window.
iafno ftgen 69, 	0, 	16385, 	9, 	.5, 1, 0 ; Half-sine window.
iafno ftgen 77, 	0, 	4097, 	10, 	.28, 1, .74, .66, .78, .48, .05, .33, .12, .08, .01, .54, .19, .08, .05, .16, .01, .11, .3, .02, .2 ; Bergeman f1
iafno ftgen 100,	0, 	2049, 	-17, 	0, 101, 575, 102, 625, 103, 675, 104, 725, 105, 775, 106, 825, 107, 875, 108, 925, 109, 975, 110, 1025, 111, 1075, 112, 1125, 113, 1175, 114 ; Steinway octave : tablenumber
iafno ftgen 101, 	0, 	2049, 	-17, 	0, 5.5, 575, 6, 625, 6.5, 675, 7, 725, 7.5, 775, 8, 825, 8.5, 875, 9, 925, 9.5833333333333, 975, 10, 1025, 10.5, 1075, 11, 1125, 11.5, 1175, 12 ; Steinway octave : baseoctave
iafno ftgen 121, 	0, 	4097, 	10, 	1
iafno ftgen 122, 	0, 	4097, 	10, 	.45, .31, .38, .9, .32, .28, 0, 0, .2, .18, 0, 0, 0, 0, .2, .3, .4, .24, .24, .24
iafno ftgen 123, 	0, 	4097, 	10, 	.86, .9, .32, .2, 0, 0, 0, 0, 0, 0, 0, 0, 0, .3, .5
iafno ftgen 124, 	0, 	4097, 	10, 	.34, .9, .88, .32, 0, .32, 0, .32, 0, .22, .29, 0, .29, 0, .29, 0, .52, 0, .34, 0, .49, 0, .52
iafno ftgen 125, 	0, 	4097, 	10, 	.52, 0, .86, 0, .2, .156, 0, .156, 0, 0, .156, 0, .156, 0, .28, 0, .48, 0, .4, 0, .7, 0, .22
iafno ftgen 126, 	0, 	4097, 	10, 	.3, .3, .44, .34, .56, .3, .06, .03
iafno ftgen 127, 	0, 	4097, 	10, 	.28, 1, .74, .66, .78, .48, .05, .33, .12, .08, .01, .54, .19, .08, .05, .16, .01, .11, .3, .02, .2
iafno ftgen 128, 	0, 	4097, 	10, 	.6, .4, 1, .22, .09, .24, .02, .06, .05
iafno ftgen 129, 	0, 	4097, 	10, 	1, .41, .95, .45, .18, 0, .05
iafno ftgen 130, 	0, 	4097, 	10, 	1, 1, .1, .2, .156, .02, .02, .02
iafno ftgen 131, 	0, 	4097, 	10, 	1, 0, .5, .1, .6, .3, .5, .3, .1, .01
iafno ftgen 132, 	0, 	4097, 	10, 	1, .7, .12, .5, .08, 0, 0, .02, .05, 0, 0, .03
iafno ftgen 133, 	0, 	4097, 	10, 	.9, 1, .2, .1, .3, .1, 0, 0, .05
iafno ftgen 134, 	0, 	4097, 	10, 	.3, .1, .6, .15
iafno ftgen 135, 	0, 	4097, 	10, 	1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0
iafno ftgen 136, 	0, 	513, 	7, 	0, 128, 1, 128, .7, 128, .7, 128, 0
iafno ftgen 137, 	0, 	513, 	5, 	.01, 128, 1, 128, .7, 128, .7, 128, .01
iafno ftgen 138, 	0, 	513, 	7, 	1, 128, .8, 128, .6, 128, .4, 64, .2, 64, 0
iafno ftgen 139, 	0, 	513, 	5, 	1, 128, .8, 128, .4, 64, .6, 32, .2, 32, .4, 64, .2, 64, .01
iafno ftgen 140, 	0, 	513, 	7, 	0, 128, 1, 128, .7, 128, .5, 128, 0
iafno ftgen 141, 	0, 	513, 	7, 	0, 64, 1, 128, .8, 64, .6, 128, .4, 128, 0
iafno ftgen 142, 	0, 	513, 	7, 	0, 128, .5, 128, 1, 128, .7, 128, 0
iafno ftgen 143, 	0, 	9, 	-2,	110, 146.6, 165, 293, 330, 440, 586.4, 660, 880
iafno ftgen 144, 	0, 	17, 	-2, 	27.5, 41.25, 55, 73.3, 82.5, 110, 146.6, 165, 220, 293, 330, 440, 586.4, 660, 880, 1172.8, 1320
iafno ftgen 145, 	0, 	8, 	-2, 	220, 293, 330, 440, 586.4, 660, 1172.8, 1320
iafno ftgen 146, 	0, 	5, 	-2, 	27.5, 36.65, 41.25, 55, 73.3, 82.5
iafno ftgen 151, 	0, 	2049, 	10, 	1 ; Pinkston wavestat.
iafno ftgen 152, 	0, 	2049, 	10, 	0, 1 ; Pinkston wavestat.
iafno ftgen 153, 	0, 	2049, 	10, 	0, 0, 1 ; Pinkston wavestat.
iafno ftgen 154, 	0, 	2049, 	10, 	0, 0, 0, 1 ; Pinkston wavestat.
iafno ftgen 155, 	0, 	513, 	5, 	.01, 513, 1 ; Pinkston wavestat.
iafno ftgen 160, 	0, 	8193, 	10, 	8, 8, 8, 4, 0, 5, 0, 3, 0, 0, 0, 0, 0, 0, 0, 8 ; Tone wheel organ drawbars.
iafno ftgen 161, 	0, 	257, 	7, 	0, 110, .3, 18, 1, 18, .3, 110, 0 ; Tone wheel organ Leslie, envelope 1.
iafno ftgen 162, 	0, 	257, 	7, 	0, 80, .5, 16, 1, 64, 1, 16, .5, 80, 0 ; Tone wheel organ Leslie envelope 1.
iafno ftgen 163, 	0, 	1025, 	8, 	-.8, 42, -.78, 100, -.7, 740, .7, 100, .78, 42, .8 ; Tone wheel organ Leslie envelope 1.
iafno ftgen 163, 	0, 	1025, 	8, 	-.8, 42, -.78, 100, -.7, 740, .7, 100, .78, 42, .8 ; Tone wheel organ Leslie envelope 1.
iafno ftgen 164, 	0, 	513, 	5, 	.0001, 33, 1, 480, .000001 ; Pinkston ticker3.
iafno ftgen 165, 	0, 	257, 	7, 	.5, 128, 1, 129, .25 ; Pinkston ticker3.
iafno ftgen 166, 	0, 	257, 	7, 	0, 128, 1, 129, 0 ; Pinkston ticker3.
iafno ftgen 167, 	0, 	513, 	7, 	0, 513, 1 ; Pinkston koto linear rise.
iafno ftgen 168, 	0, 	513, 	7, 	1, 513, 0 ; Pinkston koto linear fall.
iafno ftgen 169, 	0, 	513, 	5, 	.001, 513, 1 ; Pinkston koto exponential rise.
iafno ftgen 170, 	0, 	513, 	5, 	1, 513, .001 ; Pinkston koto exponential fall.
iafno ftgen 171, 	0, 	513, 	10, 	1, 1, 1, 1, 1, 1, 1, 1, 1 ; Pinkston koto buzz-like wave.
iafno ftgen 172, 	0, 	257, 	4, 	4, 1 ; Pinkston waveshaper normalizing function with midpoint bipolar offset.
iafno ftgen 173, 	0, 	513, 	13, 	1, 1, 0, 1, -.8, 0, .6, 0, 0, 0, .4, 0, 0, 0, 0, .1, -.2, -.3, .5 ; Pinkston waveshaper transfer func1: h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16.
iafno ftgen 174, 	0, 	513, 	13, 	1, 1, 0, 0, 0, -.1, 0, .3, 0, -.5, 0, .7, 0, -.9, 0, 1, 0, -1, 0 ; transfer func2: h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16.
iafno ftgen 175, 	0, 	513, 	13, 	1, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 1, 0, 0, -.1, 0, .1, 0, -.2, .3, 0, -.7, 0, .2, 0, -.1 ; transfer func3: h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23.
iafno ftgen 176, 	0, 	129, 	9, 	.4, 1, 0 ; Pinkston Fazex phasing instrument envlpx attack function.
iafno ftgen 177, 	0, 	513, 	10, 	1, .1, .4, .1, .2, .3, .4, .3, .2, .1 ; Pinkston Fazex fundamental timbre function A.
iafno ftgen 178, 	0, 	513, 	10, 	0, 0, .4, 0, 0, .2, 0, .1, .2, .3, .4, .5, .6, .7, .8, .9 ; Pinkston Fazex fundamental timbre function B.
iafno ftgen 179, 	0, 	129, 	9, 	.5, 1, 0 ; Pinkston, Fazex attack envelope function.
iafno ftgen 180, 	0, 	129, 	7, 	.4, 50, .4, 50, .15, 29, .1 ; Pinkston Fazex vibrato scaling function.
iafno ftgen 181, 	0, 	129, 	7, 	0, 129, 1 ; Pinkston Fazex transient removal gate function.
iafno ftgen 182, 	0, 	513, 	10, 	0 ; Blank wavetable for some Cook FM opcodes.
iafno ftgen 183, 	0, 	8193, 	10, 	1, 0.5, 0.25, 0.125   ;organ sine
iafno ftgen 184, 	0, 	8193,  	7, 	0, 50, 1, 50, .5, 300, .5, 112, 0                ;ADSR
iafno ftgen 185, 	0, 	513,  	5, 	1, 512, 256                                ;reverse exp env
; Begin Horner and Ayers French Horn tables
iafno ftgen 191, 	0, 	4097,   -9,  	1, 1.0, 0
iafno ftgen 192, 	0, 	16,  	-2,  	40, 40, 80, 160, 320, 640, 1280, 2560, 5120, 10240, 10240
iafno ftgen 193, 	0, 	64,  	-2,  	11, 12, 13, 52.476, 14, 15, 16, 18.006, 17, 18, 19, 11.274, 20, 21, 22, 6.955, 23, 24, 25, 2.260, 26, 27, 10, 1.171, 28, 29, 10, 1.106, 30, 10, 10, 1.019
iafno ftgen 194, 	0, 	2049,    -17, 	0, 0, 85, 1, 114, 2, 153, 3, 204, 4, 272, 5, 364, 6, 486, 7
iafno ftgen 210, 	0, 	5,   	-9,  	1, 0.0, 0
iafno ftgen 211, 	0, 	4097,  	-9,  	2, 6.236, 0, 3, 12.827, 0
iafno ftgen 212, 	0, 	4097,  	-9,  	4, 21.591, 0, 5, 11.401, 0, 6, 3.570, 0, 7, 2.833, 0
iafno ftgen 213, 	0, 	4097,  	-9,  	8, 3.070, 0, 9, 1.053, 0, 10, 0.773, 0, 11, 1.349, 0, 12, 0.819, 0, 13, 0.369, 0, 14, 0.362, 0, 15, 0.165, 0, 16, 0.124, 0, 18, 0.026, 0, 19, 0.042, 0
iafno ftgen 214, 	0, 	4097,  	-9,  	2, 3.236, 0, 3, 6.827, 0
iafno ftgen 215, 	0, 	4097,  	-9,  	4, 5.591, 0, 5, 2.401, 0, 6, 1.870, 0, 7, 0.733, 0
iafno ftgen 216, 	0, 	4097,  	-9,  	8, 0.970, 0, 9, 0.553, 0, 10, 0.373, 0, 11, 0.549, 0, 12, 0.319, 0, 13, 0.119, 0, 14, 0.092, 0, 15, 0.045, 0, 16, 0.034, 0
iafno ftgen 217, 	0, 	4097,  	-9,  	2, 5.019, 0, 3, 4.281, 0
iafno ftgen 218, 	0, 	4097,  	-9,  	4, 2.091, 0, 5, 1.001, 0, 6, 0.670, 0, 7, 0.233, 0
iafno ftgen 219, 	0, 	4097,  	-9,  	8, 0.200, 0, 9, 0.103, 0, 10, 0.073, 0, 11, 0.089, 0, 12, 0.059, 0, 13, 0.029, 0
iafno ftgen 220, 	0, 	4097,  	-9,  	2, 4.712, 0, 3, 1.847, 0
iafno ftgen 221, 	0, 	4097,  	-9,  	4, 0.591, 0, 5, 0.401, 0, 6, 0.270, 0, 7, 0.113, 0
iafno ftgen 222, 	0, 	4097,  	-9,  	8, 0.060, 0, 9, 0.053, 0, 10, 0.023, 0
iafno ftgen 223, 	0, 	4097,  	-9 , 	2, 1.512, 0, 3, 0.247, 0
iafno ftgen 224, 	0, 	4097,  	-9,  	4, 0.121, 0, 5, 0.101, 0, 6, 0.030, 0, 7, 0.053, 0
iafno ftgen 225, 	0, 	4097,  	-9,  	8, 0.030, 0
iafno ftgen 226, 	0, 	4097,  	-9,  	2, 0.412, 0, 3, 0.087, 0
iafno ftgen 227, 	0, 	4097,  	-9,  	4, 0.071, 0, 5, 0.021, 0
iafno ftgen 228, 	0, 	4097,  	-9,  	2, 0.309, 0, 3, 0.067, 0
iafno ftgen 229, 	0, 	4097,  	-9,  	4, 0.031, 0
iafno ftgen 230, 	0, 	4097,  	-9,  	2, 0.161, 0, 3, 0.047, 0
; End Horner and Ayers French Horn tables
; Begin ffitch FM bell tables
iafno ftgen 231,	0,	8193,	10,		1
iafno ftgen 232,	0,	4097, 	5,		1, 1024, .01
iafno ftgen 233,	0,	4097, 	5,		1, 1024, .001
; End ffitch FM bell tables
; Begin Fischman double waveshaper tables
iafno ftgen 235, 	0,	8193,	13,		0.5, 1, 0, 1, .7, .8, .3, .1, .8, .9, 1, 1 ; DISTORTION INDEX (ENVELOPE)
iafno ftgen 236,	0,	513,	7, 		0, 96, 1, 96, .8, 96, .84, 96,  0.77, 32,  0.6, 96,  0 ; WAVESHAPER FOR SHORT SOUNDS
iafno ftgen 237, 	0, 	513,   	7,		0, 32, 1, 32, .8, 64, .9,  128, 0.6,  128, 0.4, 100, 0.25, 28, 0 ; WAVESHAPER FOR LONG SOUNDS
; End Fischman double waveshaper tables

instr 1 ; Filtered noise, Michael Bergeman
; INITIALIZATION
; Original pfields
; p1 p2 p3 p4 p5 p6 p7 p8 p9
; ins st dur db func at dec freq1 freq2
iattack 		= 			0.03
isustain 		= 			p3
irelease 		= 			0.052
p3 				= 			iattack + isustain + irelease
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
ip4 			= 			p5
iamp 			= 			(ip4 + 36) - (p4 * 4)
idb 			= 			ampdb(p5) * 15848.6 / 18000
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			=	 		p8
ijunk9 			=	 		p9
ijunk10 		= 			p10
ijunk11 		= 			p11
ip5		 		= 			77
ip3 			= 			p3
ip6 			= 			p3 * .25
ip7 			= 			p3 * .75
ip8 			= 			cpsoct(p4 - .01)
ip9 			= 			cpsoct(p4 + .01)
isc 			= 			idb * .333
; KONTROL
k1 				line 		40, p3, 800
k2 				line 		440, p3, 220
k3 				linen 		isc, ip6, p3, ip7
k4 				line 		800, ip3,40
k5 				line 		220, ip3,440
k6 				linen 		isc, ip6, ip3, ip7
k7 				linen 		1, ip6, ip3, ip7
; AUDIO
a5 				oscili 		k3, ip8, ip5
a6 				oscili 		k3, ip8 * .999, ip5
a7 				oscili 		k3, ip8 * 1.001, ip5
a1 				= 			a5 + a6 + a7
a8 				oscili 		k6, ip9, ip5
a9 				oscili 		k6, ip9 * .999, ip5
a10 			oscili 		k6, ip9 * 1.001, ip5
a11 			= 			a8 + a9 + a10
a2 				butterbp 	a1, k1, 40
a3 				butterbp 	a2, k5, k2 * .8
a4 				balance 	a3, a1
a12 			butterbp 	a11, k4, 40
a13 			butterbp 	a12, k2, k5 * .8
a14 			balance 	a13, a11
a15 			reverb2 	a4, 5, .3
a16 			reverb2 	a4, 4, .2
a17 			= 			(a15 + a4) * ileftgain * k7
a18 			= 			(a16 + a4) * irightgain * k7
				outs 		a17 * kdamping, a18 * kdamping
endin

instr 2 ; Heavy metal model, Perry Cook
; INITIALIZATION
iattack 		= 			0.008
isustain 		= 			p3
irelease 		= 			0.125
p3 				= 			iattack + isustain + irelease
iindex 			= 			1
icrossfade 		= 			3
ivibedepth 		= 			0.02
iviberate 		= 			4.8
ifn1 			= 			41
ifn2 			= 			3
ifn3 			= 			3
ifn4 			= 			41
ivibefn 		= 			42
ifrequency 		= 			cpsoct(p4)
iamplitude 		= 			ampdb(p5) * 15848.6 / 7927.5
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; AUDIO
adecay 			expseg 		0.001, iattack, 1.001, 6.0, 0.001, isustain, 0.001
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
asignal			fmmetal 	1.0, ifrequency, iindex, icrossfade, ivibedepth, iviberate, ifn1, ifn2, ifn3, ifn4, ivibefn
;asignal 		tubularbell ifrequency, iamplitude, 20, 20, 3, 6
				outs 		ileftgain * asignal * iamplitude * kdamping * (adecay - 0.001), irightgain * asignal * iamplitude * kdamping * (adecay - 0.001)
endin

instr 3 ; Rhodes electric piano model, Perry Cook
; INITIALIZATION
iattack 		= 			0.005
isustain 		= 			p3
irelease 		= 			0.125
p3 				= 			iattack + isustain + irelease
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
iindex 			= 			4
icrossfade 		= 			3
ivibedepth 		= 			0.2
iviberate 		= 			6
ifn1 			= 			41
ifn2 			= 			42
ifn3 			= 			41
ifn4 			= 			182
ivibefn 		= 			41
ifrequency 		= 			cpsoct(p4)
iamplitude 		= 			ampdb(p5) * 15848.926 / 16164
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; AUDIO
asignal 		fmrhode 	iamplitude, ifrequency, iindex, icrossfade, ivibedepth, iviberate, ifn1, ifn2, ifn3, ifn4, ivibefn
				outs 		ileftgain * asignal * kdamping, irightgain * asignal * kdamping
endin

instr 4 ; Tubular bell model, Perry Cook
; INITIALIZATION
iattack 		= 			0.005
isustain 		= 			p3
irelease 		= 			0.125
p3 				= 			iattack + isustain + irelease
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
iindex 			= 			1
icrossfade 		= 			2
ivibedepth 		= 			0.2
iviberate 		= 			6
ifn1 			= 			41
ifn2 			= 			2
ifn3 			= 			41
ifn4 			= 			41
ivibefn 		= 			42
ifrequency 		= 			cpsoct(p4)
iamplitude 		= 			ampdb(p5) * 15848.6 / 15848.6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; AUDIO
asignal 		fmbell 		1.0, ifrequency, iindex, icrossfade, ivibedepth, iviberate, ifn1, ifn2, ifn3, ifn4, ivibefn
				outs 		ileftgain * asignal * iamplitude * kdamping, irightgain * asignal * iamplitude * kdamping
endin

instr 5 ; Dynamic FM with comb filter, Michael Gogins
; PFIELDS.
iattack 		= 			0.003
idecay 			= 			0.125
isustain 		= 			p3
irelease 		= 			0.5
p3 				= 			iattack + idecay + isustain + irelease
ifrequency 		= 			cpsoct(p4)
; Normalize so iamplitude for p5 of 80 == ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 18282
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; INITIALIZATION
icosinetable 	= 			42
icarrier1 		= 			0.998
icarrier2 		= 			1.002
ifmamplitude 	= 			12.5 * (iamplitude / 32767.0)
index 			= 			0.375
ilooptime 		= 			0.028
ireverbtime 	= 			0.75
; KONTROL
kdamping 		linseg 		0.0, iattack, 1.0, idecay + isustain, 1.0, irelease, 0.0
kenvelope0 		expseg 		1.0, iattack, 2.0, idecay, 1.3, isustain, 1.1, irelease, 1.0
kenvelope 		= 			kenvelope0 - 1.0
kindex 			= 			index + (kenvelope * ifmamplitude)
; AUDIO
imodulator 		= 			.01
aouta 			foscili 	iamplitude, ifrequency, icarrier1, imodulator, kindex, icosinetable
aoutb 			foscili 	iamplitude, ifrequency, icarrier2, imodulator, kindex, icosinetable
afmout 			= 			(aouta + aoutb) * kenvelope * kdamping
				outs 		ileftgain * afmout, irightgain * afmout
endin

instr 6 ; Dynamic FM with comb filter 2, Michael Gogins
; PFIELDS
iattack 		= 			0.002
idecay 			= 			0.125
isustain 		= 			p3
irelease 		= 			0.5
p3 				= 			iattack + idecay + isustain + irelease
ifrequency 		= 			cpsoct(p4)
; Normalize so iamplitude for p5 of 80 == ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 20561
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; INITIALIZATION
icosinetable 	= 			42
icarrier1 		= 			0.998
icarrier2 		= 			1.002
ifmamplitude 	= 			17.5 * (iamplitude / 32767.0)
index 			= 			0.375
ilooptime 		= 			0.028
ireverbtime 	= 			0.75
; KONTROL
kdamping 	linseg 			0.0, iattack, 1.0, idecay + isustain, 1.0, irelease, 0.0
kenvelope0 	expseg 			1.0, iattack, 2.0, idecay, 1.4, isustain, 1.2, irelease, 1.0
kenvelope 		= 			kenvelope0 - 1.0
kindex 			= 			index + (kenvelope * ifmamplitude)
; AUDIO
imodulator 		= 			.01
aouta 			foscili 	iamplitude, ifrequency, icarrier1, imodulator, kindex, icosinetable
aoutb 			foscili 	iamplitude, ifrequency, icarrier2, imodulator, kindex, icosinetable
afmout 			= 			(aouta + aoutb) * kenvelope * kdamping
				outs 		ileftgain * afmout, irightgain * afmout
endin

instr 7 ; FM moderate index, Michael Gogins
; INITIALIZATION
icarrier 		= 			1
iratio 			= 			1.25
ifmamplitude 	= 			8
index 			= 			5.4
iattack 		= 			0.02
isustain 		= 			p3
irelease 		= 			0.05
p3 				= 			iattack + isustain + irelease
ifrequency 		= 			cpsoct(p4)
ifrequencyb 	= 			ifrequency * 1.003
icarrierb 		= 			icarrier * 1.004
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 39488.4
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; KONTROL
kindenv 		expseg 		.000001, iattack, 1, isustain, .125, irelease, .000001
kindex 			= 			kindenv * index * ifmamplitude
; AUDIO
aouta 			foscili 	iamplitude, ifrequency, icarrier, iratio, index, 1
aoutb 			foscili 	iamplitude, ifrequencyb, icarrierb, iratio, index, 1
; Plus amplitude correction.
afmout 			= 			(aouta + aoutb) * kindenv * 2.565
				outs		ileftgain * afmout, irightgain * afmout
endin

instr 8 ; FM moderate index 2, Michael Gogins
; INITIALIZATION
icarrier 		= 			1
iratio 			= 			1.25
ifmamplitude 	= 			8
index 			= 			5.4
iattack 		= 			0.02
isustain 		= 			p3
irelease 		= 			0.05
p3 				= 			iattack + isustain + irelease
ifrequency 		= 			cpsoct(p4)
ifrequencyb 	= 			ifrequency * 1.003
icarrierb 		= 			icarrier * 1.004
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 39488.4
ijunk6 			= 			p6
; Constant-power pan.
; x location ranges from hard left = -1 through center = 0 to hard right = 1.
; angle of pan ranges from hard left = - pi / 2 through center = 0 to hard right = pi / 2.
ix 				= 			p7
iangle 			= 			ix * 3.14159265359 / 2.0
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; KONTROL
kindenv 		expseg 		.000001, iattack, 1, isustain, .125, irelease, .000001
kindex 			= 			kindenv * index * ifmamplitude
; AUDIO
aouta 			foscili 	iamplitude, ifrequency, icarrier, iratio, index, 1
aoutb 			foscili 	iamplitude, ifrequencyb, icarrierb, iratio, index, 1
; Plus amplitude correction.
afmout 			= 			(aouta + aoutb) * kindenv * 2.565
				outs 		ileftpan * afmout, irightpan * afmout
endin

instr 9 ; Plain FM, Michael Gogins
; INITIALIZATION
iwavetable 		= 			1
imodulator 		= 			.5
ifmamplitude 	= 			1
index 			= 			1.375
iattack 		= 			.025
irelease 		= 			.125
isustain 		= 			p3  - (iattack + irelease)
				if 			isustain > 0 goto longenvelope
isustain 		= 			0.03
p3 				= 			iattack + isustain + irelease
longenvelope:
ifrequency 		= 			cpsoct(p4)
icarrier 		=  			.998
icarrierb 		=  			1.002
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 12729.0
ijunk6 			= 			p6
; Constant-power pan.
; x location ranges from hard left = -1 through center = 0 to hard right = 1.
; angle of pan ranges from hard left = - pi / 2 through center = 0 to hard right = pi / 2.
ix 				= 			p7
iangle 			= 			ix * 3.14159265359 / 2.0
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; KONTROL
kindenv 		expseg 		.00001, iattack, 1, isustain, .1, irelease, .00001
kindex 			= 			kindenv * index * ifmamplitude
; AUDIO
aouta 			foscili 	iamplitude, ifrequency, icarrier, imodulator, kindex, iwavetable
aoutb 			foscili 	iamplitude, ifrequency, icarrierb, imodulator, kindex, iwavetable
afmout 			= 			(aouta + aoutb) * kindenv * 2.556
				outs 		ileftpan * afmout, irightpan * afmout
endin

instr 15 ; Delayed plucked string, Michael Gogins
; PFIELDS
iattack 		= 			0.02
isustain 		= 			p3
irelease 		= 			0.15
p3 				= 			iattack + isustain + irelease
ioctave 		= 			p4
ihertz 			= 			cpsoct(ioctave)
; Detuning of strings by 4 cents each way.
idetune 		= 			4.0 / 1200.0
ihertzleft 		= 			cpsoct(ioctave + idetune)
ihertzright 	= 			cpsoct(ioctave - idetune)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 18000.0
ijunk6 			= 			p6
; Constant-power pan.
; x location ranges from hard left = -1 through center = 0 to hard right = 1.
; Angle of pan ranges from hard left = - pi / 2 through center = 0 to hard right = pi / 2.
ix 				= 			p7
iangle 			= 			ix * 3.14159265359 / 2.0
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; INITIALIZATION
igenleft 		= 			1
igenright 		= 			42
; KONTROL
kvibrato 		oscili 		1.0 / 120.0, 7.0, 1
; AUDIO
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 0.25, irelease, 0.0
kexponential 	expseg 		1.0, p3, 0.05
kenvelope 		= 			kdamping * kexponential
ag 				pluck 		iamplitude, cpsoct(ioctave + kvibrato), 200, igenleft, 1
agleft 			pluck 		iamplitude, ihertzleft, 200, igenleft, 1
agright 		pluck 		iamplitude, ihertzright, 200, igenright, 1
imsleft 		= 			0.2 * 1000
imsright 		= 			0.21 * 1000
adelayleft 		vdelay 		ag * kenvelope, imsleft, imsleft + 100
adelayright 	vdelay 		ag * kenvelope, imsright, imsright + 100
asignal 		= 			kdamping * (agleft + adelayleft + agright + adelayright)
; Highpass filter to exclude speaker cone excursions.
asignal1 		butterhp 	asignal, 32.0
asignal2 		balance 	asignal1, asignal
				outs 		ileftpan * asignal * kdamping, irightpan * asignal * kdamping
endin

instr 10 ; Guitar, Michael Gogins
; INITIALIZATION
iattack 			= 			.01
irelease 			= 			.05
isustain 			= 			p3
p3 				= 			iattack + isustain + irelease
ifrequency 			= 			cpsoct(p4)
; Normalize to 80 dB = ampdb(80).
iamplitude 			= 			ampdb(p5) * 15848.926 / 7000.0
ijunk6 				= 			p6
; Constant-power pan.	
ipi 				= 			4.0 * taninv(1.0)
iradians 			= 			p7 * ipi / 2.0
itheta 				= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 			= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 			= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 				= 			p8
ijunk9 				= 			p9
ijunk10 			= 			p10
ijunk11 			= 			p11
; KONTROL
kamp 				linseg 			0.0, iattack, iamplitude, isustain, iamplitude, irelease, 0.0
; AUDIO
asig 				pluck 			kamp, ifrequency, ifrequency, 0, 1
af1 				reson 			asig, 110, 80
af2 				reson 			asig, 220, 100
af3 				reson 			asig, 440, 80
aout 				balance 		0.6 * af1+ af2 + 0.6 * af3 + 0.4 * asig, asig
kdamping 			linseg 			0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
kexp 				expseg 			1.0, iattack, 2.0, isustain + irelease, 1.0
kenv 				= 			(kexp - 1.0) * kdamping
				outs 			aout * ileftgain * kenv, aout* irightgain * kenv
endin

instr 11 ;  Flute, James Kelley
; INITIALIZATION
; Do some phasing.
icpsp1 				= 			cpsoct(p4 - .0002)
icpsp2 				= 			cpsoct(p4 + .0002)
; Normalize to 80 dB = ampdb(80).
ip6 				= 			ampdb(p5) * 15848.926 / 14142
ijunk6 				= 			p6
; Constant-power pan.	
ipi 				= 			4.0 * taninv(1.0)
iradians 			= 			p7 * ipi / 2.0
itheta 				= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 			= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 			= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 				= 			p8
ijunk9 				= 			p9
ijunk10 			= 			p10
ijunk11 			= 			p11
ip4 				= 			0
				if 			(ip4 == int(ip4 / 2) * 2) goto initslurs
				ihold
initslurs:
iatttm 				= 			0.09
idectm 				= 			0.1
isustm 				= 			p3 - iatttm - idectm
idec 				= 			ip6
ireinit 			= 			-1
				if 			(ip4 > 1) goto checkafterslur
ilast 				= 			0
checkafterslur:
				if 			(ip4 == 1 || ip4 == 3) goto doneslurs
idec 				= 			0
ireinit 			= 			0
; KONTROL
doneslurs:
				if 			(isustm <= 0) 	goto simpleenv
kamp 				linseg 			ilast, iatttm, ip6, isustm, ip6, idectm, idec, 0, idec
				goto 			doneenv
simpleenv:
kamp 				linseg 			ilast, p3 / 2,ip6, p3 / 2, idec, 0, idec
doneenv:
ilast 				= 			ip6
; Some vibrato.
kvrandamp 			rand 			.1
kvamp 				= 			(8 + p4) *.06 + kvrandamp
kvrandfreq 			rand 			1
kvfreq 				= 			5.5 + kvrandfreq
kvbra 				oscili 			kvamp, kvfreq, 1, ireinit
kfreq1 				= 			icpsp1 + kvbra
kfreq2 				= 			icpsp2 + kvbra
; Noise for burst at beginning of note.
knseenv 			expon 			ip6 / 4, .2, 1
; AUDIO
anoise1 			rand 			knseenv
anoise 				tone 			anoise1, 200
a1 				oscili 			kamp, kfreq1, 44, ireinit
a2 				oscili 			kamp, kfreq2, 44, ireinit
a3 				= 			a1 + a2 + anoise
				outs 			a3 * ileftgain, a3 * irightgain
endin

instr 12 ; Harpsichord, James Kelley
; INITIALIZATION
; Envelope initialization.
iattack 		= 			0.01
isustain 		= 			p3
irelease 		= 			0.05
p3 				= 			iattack + isustain + irelease
iduration 		= 			p3
ifrequency 		= 			cpsoct(p4)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 16381
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; KONTROL
kenvelope 		expseg 		iamplitude, iduration, 1
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
; AUDIO
apluck 			pluck 		iamplitude, ifrequency, ifrequency, 0, 1
aharp 			oscili 		kenvelope, ifrequency, 46
aharp2 			balance 	apluck, aharp
aoutsignal0 	= 			apluck + aharp2
aoutsignal 		= 			kdamping * aoutsignal0
				outs 		aoutsignal * ileftgain, aoutsignal * irightgain
endin

instr 13 ; FM modulated left and right detuned chorusing, Thomas Kung
; INITIALIZATION
iattack 		= 			0.05
irelease 		= 			0.1
isustain 		= 			p3
p3 				= 			isustain + iattack + irelease
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 40791.926
iphase 			= 			p6
; Constant-power pan.
; x location ranges from hard left = -1 through center = 0 to hard right = 1.
; angle of pan ranges from hard left = - pi / 2 through center = 0 to hard right = pi / 2.
ix 				= 			p7
iangle 			= 			ix * 3.14159265359 / 2.0
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
iy 				= 			p8
iz 				= 			p9
imason			=			p10
ihomogeneity 	= 			p11
ip6 			= 			0.3
ip7 			= 			2.2
; shift it 8/1200.
ishift 			= 			0.00666667
; convert parameter 5 to cps.
ipch 			= 			cpsoct(p4)
; convert parameter 5 to oct.
ioct 			= 			p4
; KONTROL
kadsr 			linseg 		0, iattack, 1, isustain, 1, irelease, 0
kmodi 			linseg 		0, iattack, 5, isustain, 3, irelease, 0
; r moves from ip6 to ip7 in p3 secs.
kmodr 			linseg 		ip6, p3, ip7
; AUDIO
a1 				= 			kmodi * (kmodr - 1 / kmodr) / 2
; a1*2 is argument normalized from 0-1.
a1ndx 			= 			abs(a1 * 2 / 20)
a2 				= 			kmodi * (kmodr + 1 / kmodr) / 2
; Look up table is in f43, normalized index.
a3 				tablei 		a1ndx, 43, 1
; Cosine
ao1 			oscili 		a1, ipch, 42
a4 				= 			exp(-0.5 * a3 + ao1)
; Cosine
ao2 			oscili 		a2 * ipch, ipch, 42
; Final output left
aoutl 			oscili 		iamplitude * kadsr * a4, ao2 + cpsoct(ioct + ishift), 1
; Final output right
aoutr 			oscili 		iamplitude * kadsr * a4, ao2 + cpsoct(ioct - ishift), 1
				outs 		ileftpan * aoutl, irightpan * aoutr
endin

instr 14 ; Plucked string chorused pitch-shifted delayed, Thomas Kung
; INITIALIZATION
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 17481
iattack 		= 			.025
irelease 		= 			.06
isustain 		= 			p3
p3 				= 			iattack + isustain + irelease
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iy 				= 			p8
iz 				= 			p9
imason			=			p10
ihomogeneity 	= 			p11
ishift 			= 			8.0 / 1200.0
ipch 			= 			cpsoct(p4)
ioct 			= 			p4
; KONTROL
kvib 			oscili 		1 / 120, p4, 41
; AUDIO
aenv1 			expseg 		0.000001, iattack, 1.0, 15.0, 0.000001
aenv 			= 			(aenv1 - 0.000001) * kdamping
ag 				pluck 		iamplitude, cpsoct(ioct + kvib), iamplitude / 2, 1, 1
agleft 			pluck 		iamplitude, cpsoct(ioct + ishift), iamplitude / 2, 1, 1
agright 		pluck 		iamplitude, cpsoct(ioct - ishift), iamplitude / 2, 1, 1
adump 			delayr 		1.5
				delayw 		ag * aenv
ada1 			deltap 		0.1
ad1 			= 			ada1 * kdamping
ada2 			deltap 		0.21
ad2 			= 			ada2 * kdamping
				outs 		ileftgain * aenv * (agleft + ad1) * kdamping, irightgain * aenv * (agright + ad2) * kdamping
endin

instr 16 ; Melody (Chebyshev / FM / additive), Jon Nelson
; INITIALIZATION
; Pitch.
i1 				= 			cpsoct(p4)
; Amplitude.
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5)
; Constant-power pan.
iangle 			= 			p6 / 2.0
ijunk7 			= 			p7
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
;ip6			=			cheby no
ip6 			= 			32
;ip7			=			choice
ip7 			=			1
iattack 		= 			.05
irelease 		= 			.1
isustain 		= 			p3
p3 				= 			iattack + isustain + irelease
; KONTROL
k100 			randi 		1,10
k101 			oscili 		i1 / 65, 5 + k100, 1
k102 			linseg 		0, .5, 1, p3 - .5, 1
k100 			= 			i1 + (k101 * k102)
; Envelope for driving oscillator.
k1 				linen 		.5, p3 * .4, p3 , p3 * .2
k2 				line 		1, p3, .5
k1 				= 			k2 * k1
				if 			ip7 = 2 		goto cresc
				if 			ip7 = 3 		goto dim
				if 			ip7 = 4 		goto sfz
				if 			ip7 = 5 		goto slow
; Amplitude envelope.
k10 			expseg 		.0001, iattack, iamplitude , isustain, iamplitude * .8, irelease, .0001; Power to partials.
k20 			linseg 		1.485, iattack, 1.5, isustain + irelease, 1.485
				goto 		next
cresc:
; Amplitude envelope.
k8 				expseg 		.0001, iattack, p5 * .25, isustain, p5, irelease, .0001
k9 				linseg 		1, p3 - .15, 1.5, .1, 0
k10 			= 			(k8 * k9) / 2
; Power to partials.
k20 			line 		1.475, p3, 1.5
				goto 		next
dim:
; Amplitude envelope.
k10 			linseg 		0, .05, iamplitude, .05, iamplitude * .8, p3 * .33, p5 *.7, (p3 * .66) - .1, 0
; Power to partials.
k20 			line 		1.5, p3, 1.475
				goto 		next
sfz:
; Amplitude envelope.
k10 			linseg 		0, .03, p5, .04, p5, .03, p5 * .3, p3 - .15, p5 * .3, .05, 0
; Power to partials.
k20 			linseg 		1.4, .03, 1.7, .04, 1.7, .03, 1.4, p3 - .1, 1.385
				goto 		next
slow:
; Amplitude envelope.
k10 			linseg 		0,.06, p5 * .45, .04, p5 * .2, (p3 / 3) - .1, p5, p3 / 3, p5 * .9, p3 / 3, 0
; Power to partials.
k20 			linseg 		1.475, p3 / 3, 1.5, p3 / 3, 1.4999, p3 / 3, 1.475
next:
;a1-3 are for cheby with p6=1-4
a1 				oscili 		k1, k100 - .025, 3
; Tables a1 to fn13, others normalize,
a2 				tablei 		a1, ip6, 1, .5
a3 				balance 	a2, a1
; Try other waveforms as well.
a4 				foscil 		1, k100 + .04, 1, 2.005, k20, 1
a5 				oscili 		1, k100, 1
a6 				= 			((a3 * .1) + (a4 * .1) + (a5 * .8)) * k10
a7 				comb 		a6, .5, 1 / i1
a6 				= 			(a6 * .9) + (a7 * .1)
				outs 		a6 * ileftpan, a6 * irightpan
endin

instr 17 ; Plain plucked string, Michael Gogins
; INITIALIZATION
iattack 		= 			.012
irelease 		= 			.075
isustain 		= 			p3 - (iattack + irelease)
				if 			isustain > 0 	goto longenvelope
isustain 		= 			0
p3 				= 			iattack + isustain + irelease
longenvelope:
ifrequency 		= 			cpsoct(p4)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 12652.5
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
; KONTROL
kenvelope 		expseg 		.00001, iattack, iamplitude, isustain, iamplitude / 10.0, irelease, .00001
; AUDIO
asignal1 		pluck 		1, ifrequency, ifrequency * 1.002, 0, 1
asignal2 		pluck 		1, ifrequency * 1.003, ifrequency, 0, 1
apluckout 		= 			(asignal1 + asignal2) * kenvelope
				outs 		ileftgain * apluckout, irightgain * apluckout
endin

instr 18 ;  Waveshaper, Jean-Claude Risset
; INITILIZATION
iattack 		= 			0.015
irelease 		= 			0.03
isustain 		= 			p3
p3 				= 			iattack + isustain + irelease
ifrequency 		= 			cpsoct(p4)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 78927.1
ijunk6 			= 			p6
; Constant-power pan.
iangle 			= 			p7 / 2.0
ileftpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) + sin(iangle))
irightpan 		= 			sqrt(2.0) / 2.0 * (cos(iangle) - sin(iangle))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
i1 				= 			1 / p3
i2 				= 			ifrequency
; AUDIO
; Scaling factor.
a1 				oscili 		iamplitude, i1, 2
a2 				oscili 		a1, i2, 1
; a3 			linenr 		1, iattack, irelease, .01
a3 				linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
a4 				oscili 		a3, i2 * .7071, 1
; Transfer function:
; f(x)=1+.841x-.707x**2-.595x**3+.5x**4+.42x**5-;.354x**6.279x**7+.25x**8+.21x**9
a5 				= 			a4 * a4
a6 				= 			a5 * a4
a7 				= 			a5 * a5
a8 				= 			a7 * a4
a9 				= 			a6 * a6
a10 			= 			a9 * a4
a11 			= 			a10 * a4
a12 			= 			a11 * a4
a13 			= 			1 + .841 * a4 - .707 * a5 - .595 * a6 + .5 * a7 + .42 * a8 - .354 * a9 - .297 * a10 + .25 * a11 + .21 * a12
; Amplitude correction.
a14 			= 			a13 * a2 * 5.06
				outs 		a14 * ileftpan, a14 * irightpan
endin

instr 19 ; Tone wheel organ with Leslie speaker, Hans Mikelson
; Original score
; f1 0 1024 10 1
; Tone Wheel Organ Drawbars
; SubFund Fund Sub 3rd 2nd Harm 3rd Harm 4th Harm 5th Harm 6th Harm 8th Harm
; f2 0 8192 10 8 8 8 4 0 5 0 3 0 0 0 0 0 0 0 8
; Lelie Filter Envelopes
; f3 0 256 7 0 110 .3 18 1 18 .3 110 0
; f4 0 256 7 0 80 .5 16 1 64 1 16 .5 80 0
; Distortion
; f5 0 1024 8 -.8 42 -.78 100 -.7 740 .7 100 .78 42 .8
; p1 p2 p3 p4 p5
; Inst Start Dur Amp Pitch
; i1 0 18 6000 7.04
; Inst Start Dur Speedi Speedf
; i4 0 18 .8 8
ip4 			= 			.8
ip5 			= 			8
isustain 		= 			p3
iattack 		= 			.01
idecay 			= 			.02
idur 			= 			iattack + isustain + idecay
p3 				= 			idur
ifqc 			= 			cpsoct(p4)
iamp 			= 			ampdb(p5) * 15848 / 37619
ijunk6 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
iradians 		= 			p7 * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
ijunk8 			= 			p8
ijunk9 			= 			p9
ijunk10 		= 			p10
ijunk11 		= 			p11
ifsine 			= 			41
ifdrawbars 		= 			160
ifleslie1 		= 			161
ifleslie2 		= 			162
ifdistort 		= 			163
; Tone Wheel Organ
asrc1 			oscili 		iamp, ifqc, ifdrawbars
kenv1 			linseg 		0, iattack, 1, isustain, 1, idecay, 0
asig1 			= 			asrc1 * kenv1
; Rotating Speaker
isep 			= 			.2
asig 			= 			asig1
; Distortion effect
asig 			= 			asig / 40000
aclip 			tablei 		asig ,ifdistort, 1, .5
aclip 			= 			aclip * 30000 * 15848.926 / 15848.926
aleslie 		delayr 		1
; Acceleration
kenv 			linseg 		ip4, idur, ip5
; Doppler Effect
koscl 			oscili 		1, kenv, 1, 0
koscr 			oscili 		1, kenv, 1, isep
kdopl 			= 			.01 - koscl * .0002
kdopr 			= 			.012 - koscr * .0002
aleft 			deltapi 	kdopl
aright 			deltapi 	kdopr
				delayw 		aclip
; Filter Effect
; Divide into three frequency ranges for directional sound.
; High Pass
alfhi 			atone 		aleft, 8000
arfhi 			atone 		aright, 8000
alfhi 			tone 		alfhi, 12000
arfhi 			tone 		arfhi, 12000
; Band Pass
alfmid 			atone 		aleft, 4000
arfmid 			atone 		aright, 4000
alfmid 			tone 		alfmid, 8000
arfmid 			tone 		arfmid, 8000
; Low Pass
alflow 			tone 		aleft, 4000
arflow 			tone 		aright, 4000
kflohi 			oscili 		1, kenv, ifleslie1, 0
kfrohi 			oscili 		1, kenv, ifleslie1, isep
kflomid 		oscili 		1, kenv, ifleslie2, 0
kfromid 		oscili 		1, kenv, ifleslie2, isep
; Amplitude Effect
kalosc 			= 			(koscl * .1 + 1)
karosc 			= 			(koscr * .1 + 1)
aleft 			= 			alfhi * kflohi + alfmid * kflomid + alflow * kalosc
aright 			= 			arfhi * kfrohi + arfmid * kfromid + arflow * karosc
				outs 		aleft, aright
endin

instr 20 ; FM reverse envelope, Kim Cascone
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.05
p3 				= 			iattack + isustain + irelease
ifrequency 		= 			cpsoct(p4)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 2710067.0
iphase 			= 			p6
; Constant-power pan.
ipi 			= 			4.0 * taninv(1.0)
ixpan 			= 			p7
iradians 		= 			ixpan * ipi / 2.0
itheta 			= 			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta)) * iamplitude
ileftgain 		= 			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta)) * iamplitude
iypan 			= 			p8
izpan 			= 			p9
imason 			= 			p10
ihomogeneity 	= 			p11
ip11 			= 			1
ip18 			= 			185
kcps      		=       	ifrequency
kcar      		=         	3.1
kmod      		=         	2.4
kpan      		=         	ixpan                       			; SCORE DETERMINES PAN POSITION
kndx      		=        	7.707
kamp      		=         	iamplitude
afm       		foscili   	kamp, kcps, kcar, kmod, kndx, ip11 	; f11 = HIRES SINE WAVE
afm1      		poscil     	afm, 1 / p3, ip18
afm2      		=         	afm1 * 400                 			; THIS INCERASES THE GAIN OF THE FOSCILI OUTx400
krtl      		=         	sqrt(2) / 2 * cos(kpan) + sin(kpan) 	; CONSTANT POWER PANNING
krtr      		=       	sqrt(2) / 2 * cos(kpan) - sin(kpan)	; FROM C.ROADS "CM TUTORIAL" pp460
al        		=       	afm2 * krtl
ar        		=       	afm2 * krtr
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
aleftsignal 	= 			al * kdamping
arightsignal 	= 			ar * kdamping
				outs 		aleftsignal, arightsignal
endin

instr 21; French horn with group wavetables, Andrew Horner and Lydia Ayers
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.035
irelease 		= 			.06
p3 				= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
ilownote		=			5.0 + 5.0 / 12.0 ; One octave lower than the French horn.
ihighnote		=			9.0 + 5.0 / 12.0 ; Same as the French horn.
; Do not play notes outside the actual range of this instrument.
				if 			((ioctave > ilownote) && (ioctave < ihighnote)) goto keepplaying
				turnoff
keepplaying:
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 14056.0
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 	=			p11
iamp			=			iamplitude						; OVERALL AMPL. SCALING FACTOR
ifreq			=			ifrequency						; PITCH IN HERTZ
ivibd			=			4 * ifreq / 100.0				; VIB DEPTH RELATIVE TO FUND.
iatt			=			iattack							; ATTACK TIME
idec			=			irelease						; DECAY TIME
isus			=			isustain						; SUSTAIN TIME
ifcut			tablei		9, 192							; LP FILTER CUTOFF FREQUENCY
kvibd			linseg		.1, .8 * p3, 1, .2 * p3, .7		; VIBRATO
kvibd			=			kvibd * ivibd					; VIBRATO DEPTH
iseed			=			.5
ivibr1			=			2.5 + iseed
iseed			=			frac(iseed * 105.947)
ivibr2			=			3.5 + iseed
iseed			=			frac(iseed * 105.947)
kvrate			linseg		ivibr1, p3, ivibr2				; TIME-VARYING VIBRATO RATE
kvib			oscili		kvibd, kvrate, 191
kfreq			=			ifreq+kvib
amp1			linseg		0, .001, 0, .5 * iatt, .5, .5 * iatt, .9, .5 * isus, 1, .5 * isus, .9, .5 * idec, .3, .5 * idec, 0, 1, 0
amp2			=			amp1 * amp1	 					; WAVETABLE ENVELOPES
amp3			=			amp2 * amp1
amp4			=			amp3 * amp1
irange			tablei		ifreq, 194
iwt1			=			1								; WAVETABLE NUMBERS
iwt2			table		(irange * 4),     193
iwt3			table		(irange * 4) + 1, 193
iwt4			table		(irange * 4) + 2, 193
inorm			table		(irange * 4) + 3, 193			; NORMALIZATION FACTOR
iiwt1 			=			iwt1
iiwt2 			=			iwt2 + 200
iiwt3 			=			iwt3 + 200
iiwt4 			=			iwt4 + 200
iphase			=			iseed							; SAME PHASE FOR ALL TABLES
iseed			=			frac(iseed * 105.947)
awt1			oscili		amp1, kfreq,  iiwt1, iphase 	; WAVETABLE LOOKUP
awt2			oscili		amp2, kfreq,  iiwt2, iphase
awt3			oscili		amp3, kfreq,  iiwt3, iphase
awt4			oscili		amp4, kfreq,  iiwt4, iphase
asig			=			(awt1 + awt2 + awt3 + awt4) * iamp / inorm
afilt			tone		asig, ifcut						; LP FILTER...
asig			balance		afilt, asig						; ... TO CONTROL BRIGHTNESS
areverb			reverb		asig, 1.2
asig			=			asig + .1 * areverb
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
aleftsignal 	= 			asig * ileftgain * kdamping
arightsignal 	= 			asig * irightgain * kdamping
				outs 		aleftsignal, arightsignal
endin

instr 22 ; Enhanced FM bell, John ffitch
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.06
p3 				= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 57968.6
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 	=			p11
idur      		=       	15
iamp      		=       	iamplitude
ifenv     		=       	232                      		; BELL SETTINGS:
ifdyn     		=       	233                      		; AMP AND INDEX ENV ARE EXPONENTIAL
ifq1      		=       	cpsoct(p4 - 1) * 5            	; DECREASING, N1:N2 IS 5:7, imax=10
if1       		=         	231                        		; DURATION = 15 sec
ifq2      		=         	cpsoct(p4 - 1) * 7
if2       		=         	231
imax      		=         	10
aenv      		oscili    	iamp, 1 / idur, ifenv      		; ENVELOPE
adyn      		oscili    	ifq2 * imax, 1 / idur, ifdyn	; DYNAMIC
anoise    		rand      	50
amod      		oscili    	adyn + anoise, ifq2, if2   		; MODULATOR
acar      		oscili    	aenv, ifq1 + amod, if1     		; CARRIER
          		timout    	0.5, idur, noisend
knenv     		linseg    	iamp, 0.2, iamp, 0.3, 0
anoise3   		rand      	knenv
anoise4   		butterbp  	anoise3, iamp, 100
anoise5   		balance   	anoise4, anoise3
noisend:
arvb      		nreverb   	acar, 2, 0.1
asignal      	=         	acar + anoise5 + arvb
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
aleftsignal 	= 			asignal * ileftgain * kdamping
arightsignal 	= 			asignal * irightgain * kdamping
				outs 		aleftsignal, arightsignal
endin

instr 23; Dynamic waveshaping intrument, Rajmil Fischman
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.06
p3 				= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 7187.9
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 	=			p11
ip6				=			1
ip7				=			235
ip8				=			236
; TWO BEATING SOURCES
; DISTORTION INDEX CHANGES ACCORDING TO
; FUNCTION INDICATED BY p11
;-------------------------------; PARAMETER LIST
;p4 : AMPLITUDE
;p5 : PITCH
;p6 : OSCILLATOR FUNCTION
;p7 : WAVESHAPING FUNCTION
;p8 : ENVELOPE (DISTORTION INDEX) FUNCTION
;-------------------------------; INITIALIZATION BLOCK
ifr     		=       	ifrequency     											; PITCH TO FREQ
ioffset 		=       	.5              										; OFFSET
ibeatfb 		=       	cpsoct(p4 - .02) 										; BEGINNING VALUE OF BEATING FREQUENCY
ibeatff 		=       	cpsoct(p4 + .01)										; FINAL VALUE OF BEATING FREQUENCY
inobeat 		=       	0.8             										; PROPORTION OF NON-BEATING OSCILLATOR
ibeat   		=       	0.2    					         						; PROPORTION OF NON-BEATING OSCILLATOR
;---------------------------------------
kenv    		oscil1i 	0, 1, p3, ip8                 							; ENVELOPE (DISTORTION INDEX)
kfreq2  		line    	ibeatfb, p3, ibeatff      								; FREQUENCY CHANGE
ain1    		oscili  	ioffset, ifr, ip6            							; FIRST OSCILLATOR
awsh1   		tablei  	kenv * ain1, ip7, 1, ioffset    						; WAVESHAPING OF FIRST OSCILLATOR
ain2    		oscili  	ioffset, kfreq2, ip6       								; SECOND OSCILLATOR
awsh2   		tablei  	kenv * ain2, ip7, 1, ioffset    						; WAVESHAPING OF SECOND OSCILLATOR
asignal			=       	kenv * iamplitude * (inobeat * awsh1 + ibeat * awsh2) 	; MIX
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
aleftsignal 	= 			asignal * ileftgain * kdamping
arightsignal 	= 			asignal * irightgain * kdamping
				outs 		aleftsignal, arightsignal
endin

instr 24 ; SoundFont bright guitar
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.06
p3 				= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 15848.926
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 	=			p11
; SOUNDFONT
ivel			=			p5
inotnum			=			(p4 * 12.0) - 36.0 ; Convert decimal octave to MIDI key number.
; Normalize so that velocity 80 = amplitude 15848.926.
iamp			=			15848.926 / 8356.9
ifreq			=			ifrequency
ipreset			=			0
iflag			=			1
; KONTROL
; SoundFont samples with decay in Csound require a Csound decay envelope to prevent looping artifacts.
kenvelope		linseg		0.0, iattack, 1.0, 2.0, 0.0
; AUDIO
a1, a2 			sfplay 		ivel, inotnum, iamp, ifreq, ipreset, iflag
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, iamp, irelease, 0.0
aleftsignal 	= 			a1 * ileftgain * kdamping * kenvelope
arightsignal 	= 			a2 * irightgain * kdamping * kenvelope
				outs 		aleftsignal, arightsignal
endin

instr 25 ; SoundFont piano
; INITIALIZATION
iinstrument 	= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.06
p3 				= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 15848.926
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 	=			p11
; SOUNDFONT
ivel			=			p5
inotnum			=			(p4 * 12.0) - 36.0 ; Convert decimal octave to MIDI key number.
; Normalize so that velocity 80 = amplitude 15848.926.
iamp			=			3.0
ifreq			=			ifrequency
ipreset			=			6
iflag			=			1
; KONTROL
; SoundFont samples with decay in Csound require a Csound decay envelope to prevent looping artifacts.
kenvelope		linseg		0.0, iattack, 1.0, isustain, 1.0, irelease, 0.0
; AUDIO
a1, a2 			sfplay 		ivel, inotnum, iamp, ifreq, ipreset, iflag
; OUTPUT
; Damping envelope to ensure that there are no clicks during attack or release.
kdamping 		linseg 		0.0, iattack, 1.0, isustain, iamp, irelease, 0.0
aleftsignal 	= 			a1 * ileftgain * kdamping * kenvelope
arightsignal 	= 			a2 * irightgain * kdamping * kenvelope
				outs 		aleftsignal, arightsignal
endin

instr 26 ; Xing by Andrew Horner
; p4 pitch in octave.pch
; original pitch	= A6
; range			= C6 - C7
; extended range	= F4 - C7
; INITIALIZATION
isine			=			1
iinstrument 		= 			p1
istarttime 		= 			p2
isustain 		= 			p3
iattack 		= 			.005
irelease 		= 			.06
p3 			= 			iattack + isustain + irelease
ioctave			=			p4
ifrequency 		= 			cpsoct(ioctave)
; Normalize to 80 dB = ampdb(80).
iamplitude 		= 			ampdb(p5) * 15848.926 / 5961.5
iphase 			=			p6
; Constant-power pan.
ipi 			=			4.0 * taninv(1.0)
ixpan 			=			p7
iradians 		=			ixpan * ipi / 2.0
itheta 			=			iradians / 2.0
; Translate angle in [-1, 1] to left and right gain factors.
irightgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) + sin(itheta))
ileftgain 		=			sqrt(2.0) / 2.0 * (cos(itheta) - sin(itheta))
iypan 			=			p8
izpan 			=			p9
imason 			=			p10
ihomogeneity 		=			p11

idur			=			p3
ifreq			=			ifrequency
iamp			=			iamplitude
inorm			=			32310

aamp1 			linseg	0,.001,5200,.001,800,.001,3000,.0025,1100,.002,2800,.0015,1500,.001,2100,.011,1600,.03,1400,.95,700,1,320,1,180,1,90,1,40,1,20,1,12,1,6,1,3,1,0,1,0
kdevamp1		linseg			0, .05, .3, idur - .05, 0
kdev1 			oscil 			kdevamp1, 6.7, 1, .8
amp1 			=			aamp1 * (1 + kdev1)

aamp2 			linseg			0,.0009,22000,.0005,7300,.0009,11000,.0004,5500,.0006,15000,.0004,5500,.0008,2200,.055,7300,.02,8500,.38,5000,.5,300,.5,73,.5,5.,5,0,1,1
kdevamp2		linseg			0,.12,.5,idur-.12,0
kdev2 			oscil 			kdevamp2, 10.5, 1, 0
amp2			=			aamp2 * (1 + kdev2)

aamp3 			linseg	0,.001,3000,.001,1000,.0017,12000,.0013,3700,.001,12500,.0018,3000,.0012,1200,.001,1400,.0017,6000,.0023,200,.001,3000,.001,1200,.0015,8000,.001,1800,.0015,6000,.08,1200,.2,200,.2,40,.2,10,.4,0,1,0
kdevamp3		linseg			0, .02, .8, idur - .02, 0
kdev3 			oscil  			kdevamp3, 70, 1 ,0
amp3			=			aamp3 * (1 + kdev3)

awt1  			oscili			amp1, ifreq, 1
awt2   			oscili			amp2, 2.7 * ifreq, 1
awt3  			oscili			amp3, 4.95 * ifreq, 1
asig			=			awt1 + awt2 + awt3
krel  			linen  			1,0, idur, .06
asig			=			asig * krel * (iamp / inorm)
			outs			asig * ileftgain, asig * irightgain
endin
</CsInstruments>
<CsArrangement>
Plucked string chorused pitch-shifted delayed, Thomas Kung
SoundFont bright guitar
Harpsichord, James Kelley
Plucked string chorused pitch-shifted delayed, Thomas Kung
Tubular bell model, Perry Cook
Dynamic FM with comb filter 2, Michael Gogins
</CsArrangement>
<CsScore>
i 4 0 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 6.0145642633387 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 1.00242737722312 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 7.01699164056181 2 6.25 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 1.00242737722312 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 12.31186445358648 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 18.48064831342104 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 13.33999509689224 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 19.5087789567268 2 6.25 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 13.33999509689224 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 2.03569867374541 2 6.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 8.17363861428079 2 6.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 3.05868866383464 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 9.19662860437002 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 3.05868866383464 2 6.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 14.368125740198 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 20.53690960003256 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 15.39625638350376 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 21.56504024333832 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 15.39625638350376 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 1.00242737722312 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 13.33999509689224 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 3.05868866383464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 15.39625638350376 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 25.2294033053768 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 31.39818716521135 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 26.25753394868255 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 32.42631780851711 2 6.25 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 26.25753394868255 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 37.85695659110652 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 44.18391439606504 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 38.91144955859961 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 45.23840736355812 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 38.91144955859961 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 27.31729938101311 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 33.61262239694684 2 6.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 28.36651988366873 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 34.66184289960246 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 28.36651988366873 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 39.96594252609269 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 46.29290033105121 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 41.02043549358578 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 47.3473932985443 2 6.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 41.02043549358578 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 26.25753394868255 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 38.91144955859961 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 28.36651988366873 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 41.02043549358578 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 4.15522953840651 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 10.2931694789419 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 5.17821952849574 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 11.31615946903113 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 5.17821952849574 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 16.71964505770758 2 7 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 23.01496807364131 2 7 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 17.7688655603632 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 24.06418857629693 2 7.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 17.7688655603632 2 7 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 6.23268613366464 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 12.4965325345187 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 7.27666053380698 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 13.54050693466105 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 7.27666053380698 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 18.81808606301882 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 25.11340907895255 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 19.86730656567445 2 7.5 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 26.16262958160818 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 19.86730656567445 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 5.17821952849574 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 17.7688655603632 2 7 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 7.27666053380698 2 7 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 19.86730656567445 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 7.27666053380698 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 29.44737517534914 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 35.61615903518371 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 30.4755058186549 2 7 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 36.64428967848946 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 30.4755058186549 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 42.07492846107887 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 48.40188626603738 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 43.12942142857194 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 49.45637923353047 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 43.12942142857194 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 31.53527125098546 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 37.83059426691918 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 32.58449175364108 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 38.87981476957481 2 7.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 32.58449175364108 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 44.18391439606504 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 50.51087220102356 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 45.23840736355812 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 51.56536516851665 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 45.23840736355812 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 30.4755058186549 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 43.12942142857194 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 32.58449175364108 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 45.23840736355812 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 32.58449175364108 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 1.00242737722312 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 13.33999509689224 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 3.05868866383464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 15.39625638350376 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 26.25753394868255 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 38.91144955859961 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 28.36651988366873 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 41.02043549358578 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 5.17821952849574 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 17.7688655603632 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 7.27666053380698 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 19.86730656567445 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 7.27666053380698 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 30.4755058186549 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 43.12942142857194 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 32.58449175364108 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 45.23840736355812 2 6.25 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 32.58449175364108 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 51.72691889879283 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 57.8957027586274 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 52.7550495420986 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 58.92383340193316 2 6.25 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 52.7550495420986 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 64.35447218452256 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 70.68142998948109 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 65.40896515201565 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 71.73592295697418 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 65.40896515201565 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 53.81481497442915 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 60.11013799036289 2 6.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 54.86403547708478 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 61.15935849301851 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 54.86403547708478 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 66.46345811950874 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 72.79041592446724 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 67.51795108700182 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 73.84490889196033 2 6.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 67.51795108700182 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 52.7550495420986 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 65.40896515201565 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 54.86403547708478 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 67.51795108700182 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 77.60322998123057 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 83.9301877861891 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 78.65772294872366 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 84.98468075368218 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 78.65772294872366 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 90.5545666845431 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 97.04375417680826 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 5 91.63609793325398 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 98.12528542551914 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 91.63609793325398 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 79.74466185367807 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 86.2014034084819 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 80.82078544614538 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 87.27752700094922 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 80.82078544614538 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 92.71762918196484 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 99.20681667422998 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 93.7991604306757 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 100.28834792294084 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 93.7991604306757 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 78.65772294872366 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 91.63609793325398 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 80.82078544614538 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 55.98869278433798 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 62.28401580027171 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 57.0379132869936 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 63.33323630292733 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 57.0379132869936 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 68.87527280413396 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 75.33201435893778 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 69.95139639660125 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 76.40813795140508 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 69.95139639660125 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 58.11941749742324 2 7.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 64.54387534445304 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 59.19016047192821 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 65.61461831895801 2 7.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 59.19016047192821 2 7.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 71.02751998906855 2 7.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.48426154387239 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 72.10364358153585 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 78.56038513633969 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 72.10364358153585 2 7.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 57.0379132869936 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 69.95139639660125 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 59.19016047192821 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 72.10364358153585 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 59.19016047192821 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 81.92935497607401 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 88.25631278103252 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 82.9838479435671 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 89.31080574852561 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 82.9838479435671 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 94.88069167938654 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 101.36987917165169 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 95.9622229280974 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 102.45141042036256 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 95.9622229280974 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 84.07078684852151 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 90.52752840332533 2 7 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 85.1469104409888 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 91.60365199579265 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 85.1469104409888 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 97.04375417680825 2 7 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 103.53294166907341 2 7 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 98.12528542551912 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 104.61447291778428 2 7 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 98.12528542551912 2 7 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 82.9838479435671 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 95.9622229280974 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 85.1469104409888 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 98.12528542551912 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 85.1469104409888 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 52.7550495420986 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 65.40896515201565 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 54.86403547708478 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 67.51795108700182 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 78.65772294872366 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 91.63609793325398 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 80.82078544614538 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 57.0379132869936 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 69.95139639660125 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 59.19016047192821 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 72.10364358153585 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 59.19016047192821 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 82.9838479435671 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 95.9622229280974 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 85.1469104409888 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 98.12528542551912 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 85.1469104409888 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 8.50298515822416 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 14.64092509875955 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 9.52597514831339 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 15.66391508884878 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 9.52597514831339 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 21.06740067752524 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 27.36272369345896 2 7.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 22.11662118018085 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 28.41194419611459 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 22.11662118018085 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 10.58044175348229 2 8 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 16.84428815433635 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 11.62441615362464 2 8.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 17.8882625544787 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 11.62441615362464 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 23.16584168283648 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 29.46116469877021 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 24.2150621854921 2 8.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 30.51038520142583 2 8.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 24.2150621854921 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 9.52597514831339 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 22.11662118018085 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 11.62441615362464 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 24.2150621854921 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 34.24991468524971 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 40.54523770118345 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 35.29913518790534 2 8 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 41.59445820383907 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 35.29913518790534 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 47.13649470504568 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 53.59323625984951 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 48.21261829751299 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 54.66935985231682 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 48.21261829751299 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 36.38063939833497 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 42.80509724536478 2 8.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 37.45138237283995 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 43.87584021986976 2 8.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 37.45138237283995 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 49.28874188998029 2 8.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 55.74548344478413 2 8.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.3648654824476 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 56.82160703725142 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 50.3648654824476 2 8.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 35.29913518790534 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 48.21261829751299 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 37.45138237283995 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 50.3648654824476 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 37.45138237283995 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 12.74345017434158 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 19.00729657519564 2 8.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 13.78742457448392 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 20.05127097533798 2 8.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 13.78742457448392 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 25.56559729403856 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 31.99005514106838 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 26.63634026854354 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 33.06079811557335 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 26.63634026854354 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 14.86352126386141 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 21.25585682165607 2 9 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 15.92891052349386 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 22.32124608128851 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 15.92891052349386 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 27.7070832430485 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 34.13154109007832 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 28.77782621755347 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 35.20228406458328 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 28.77782621755347 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 13.78742457448392 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 26.63634026854354 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 15.92891052349386 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 28.77782621755347 2 8.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 15.92891052349386 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 38.55440905511893 2 8.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 44.84973207105267 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 39.60362955777455 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 45.89895257370829 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 39.60362955777455 2 8.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 51.44098907491491 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 57.89773062971874 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 52.51711266738221 2 8.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 58.97385422218604 2 8.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 52.51711266738221 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 40.6851337682042 2 8.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 47.109591615234 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 41.75587674270916 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 48.18033458973897 2 9 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 41.75587674270916 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 53.59323625984951 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 60.04997781465335 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 54.66935985231682 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 61.12610140712064 2 9 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 54.66935985231682 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 39.60362955777455 2 8.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 52.51711266738221 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 41.75587674270916 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 54.66935985231682 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 41.75587674270916 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 9.52597514831339 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 22.11662118018085 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 11.62441615362464 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 24.2150621854921 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 35.29913518790534 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 48.21261829751299 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 37.45138237283995 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 50.3648654824476 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 37.45138237283995 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 13.78742457448392 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 26.63634026854354 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 15.92891052349386 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 28.77782621755347 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 15.92891052349386 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.60362955777455 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 52.51711266738221 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 41.75587674270916 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 54.66935985231682 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 41.75587674270916 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 7.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 60.3791688884797 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 66.54795274831427 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 61.40729953178547 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 67.57608339162003 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 61.40729953178547 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 73.00672217420943 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 79.33367997916795 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 74.06121514170252 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 80.38817294666104 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 74.06121514170252 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 62.46706496411602 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 68.76238798004975 2 7.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 63.51628546677164 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 69.81160848270538 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 63.51628546677164 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 75.1157081091956 2 7.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 81.44266591415413 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 76.17020107668868 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.49715888164722 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 76.17020107668868 2 7.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 61.40729953178547 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 74.06121514170252 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 63.51628546677164 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 76.17020107668868 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 86.25547997091743 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 92.58243777587596 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 87.30997293841052 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 93.63693074336905 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 87.30997293841052 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 99.20681667422998 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 105.69600416649513 2 7.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 100.28834792294084 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 106.77753541520599 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 100.28834792294084 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 88.39691184336495 2 7.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 94.85365339816879 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 89.47303543583224 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 95.92977699063609 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 89.47303543583224 2 7.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 101.36987917165169 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 107.85906666391685 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 102.45141042036256 2 7.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 108.94059791262771 2 7.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 102.45141042036256 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 87.30997293841052 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 100.28834792294084 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 89.47303543583224 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 102.45141042036256 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 89.47303543583224 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 64.64094277402484 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 70.93626578995858 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 65.69016327668047 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 71.9854862926142 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 65.69016327668047 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 77.52752279382081 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 83.98426434862463 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 78.60364638628812 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 85.06038794109195 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 78.60364638628812 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 66.77166748711011 2 8.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 73.19612533413992 2 8.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 67.84241046161507 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 74.26686830864489 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 67.84241046161507 2 8.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 79.67976997875542 2 8.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.13651153355926 2 8.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 80.75589357122274 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 87.21263512602656 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 80.75589357122274 2 8.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 65.69016327668047 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 78.60364638628812 2 8 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 67.84241046161507 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 80.75589357122274 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 67.84241046161507 2 8 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 90.58160496576086 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 96.9085627707194 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 91.63609793325395 2 8 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 97.96305573821249 2 8 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 91.63609793325395 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 103.53294166907341 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 110.02212916133855 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 104.61447291778428 2 8 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 111.10366041004943 2 8 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 104.61447291778428 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 92.72303683820837 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 99.17977839301221 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 93.7991604306757 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 100.25590198547951 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 93.7991604306757 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 105.69600416649513 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 112.18519165876027 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 106.77753541520599 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 113.26672290747113 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 106.77753541520599 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 91.63609793325395 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 104.61447291778428 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 93.7991604306757 2 8 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 106.77753541520599 2 8 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 93.7991604306757 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 61.40729953178547 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 74.06121514170252 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 63.51628546677164 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 76.17020107668868 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 87.30997293841052 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 100.28834792294084 2 7.5 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 89.47303543583224 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 102.45141042036256 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 89.47303543583224 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 65.69016327668047 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 78.60364638628812 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 67.84241046161507 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 80.75589357122274 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 67.84241046161507 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 91.63609793325395 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 104.61447291778428 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 93.7991604306757 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 106.77753541520599 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 93.7991604306757 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 7.5 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 7.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 7.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 7.5 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 1.00242737722312 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 13.33999509689224 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 3.05868866383464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 15.39625638350376 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 26.25753394868255 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 38.91144955859961 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 28.36651988366873 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 41.02043549358578 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 5.17821952849574 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 17.7688655603632 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 7.27666053380698 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 19.86730656567445 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 7.27666053380698 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 30.4755058186549 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 43.12942142857194 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 32.58449175364108 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 45.23840736355812 2 6.25 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 32.58449175364108 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 52.7550495420986 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 65.40896515201565 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 54.86403547708478 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 67.51795108700182 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 78.65772294872366 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 91.63609793325398 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 80.82078544614538 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 57.0379132869936 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 69.95139639660125 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 59.19016047192821 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 72.10364358153585 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 59.19016047192821 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 82.9838479435671 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 95.9622229280974 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 85.1469104409888 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 98.12528542551912 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 85.1469104409888 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 9.52597514831339 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 22.11662118018085 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 11.62441615362464 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 24.2150621854921 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 35.29913518790534 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 48.21261829751299 2 6.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 37.45138237283995 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 50.3648654824476 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 37.45138237283995 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 13.78742457448392 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 26.63634026854354 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 15.92891052349386 2 6.75 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 28.77782621755347 2 6.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 15.92891052349386 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.60362955777455 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 52.51711266738221 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 41.75587674270916 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 54.66935985231682 2 6.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 41.75587674270916 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 61.40729953178547 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 74.06121514170252 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 63.51628546677164 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 76.17020107668868 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 87.30997293841052 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 100.28834792294084 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 89.47303543583224 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 102.45141042036256 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 89.47303543583224 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 65.69016327668047 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 78.60364638628812 2 6.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 67.84241046161507 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 80.75589357122274 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 67.84241046161507 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 91.63609793325395 2 6.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 104.61447291778428 2 6.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 93.7991604306757 2 6.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 106.77753541520599 2 6.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 93.7991604306757 2 6.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 11.62441615362464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 63.51628546677164 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 67.84241046161507 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 106.08079703913342 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 112.24958089896799 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 107.10892768243919 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 113.27771154227374 2 6.25 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 107.10892768243919 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 118.70835032486313 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 125.03530812982166 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 119.76284329235622 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 126.08980109731475 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 119.76284329235622 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 108.16869311476975 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 114.46401613070347 2 6.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 109.21791361742537 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 115.51323663335909 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 109.21791361742537 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 120.81733625984931 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 127.14429406480784 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 121.8718292273424 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 128.19878703230094 2 6.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 121.8718292273424 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 107.10892768243919 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 119.76284329235622 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 109.21791361742537 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 121.8718292273424 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 131.95710812157117 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 138.2840659265297 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 133.01160108906427 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 139.33855889402278 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 133.01160108906427 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 144.9084448248837 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 151.3976323171489 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 5 145.9899760735946 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 152.4791635658597 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 145.9899760735946 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 134.0985399940187 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 140.5552815488225 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 135.174663586486 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 141.6314051412898 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 135.174663586486 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 147.07150732230542 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 153.56069481457058 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 148.15303857101628 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 154.64222606328144 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 148.15303857101628 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 133.01160108906427 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 145.9899760735946 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 135.174663586486 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 148.15303857101628 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 110.34257092467857 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 116.6378939406123 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 111.39179142733418 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 117.68711444326792 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 111.39179142733418 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 123.22915094447455 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 129.68589249927837 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 124.30527453694185 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 130.7620160917457 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 124.30527453694185 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 112.47329563776383 2 7.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 118.89775348479365 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 113.5440386122688 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 119.9684964592986 2 7.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 113.5440386122688 2 7.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 125.38139812940916 2 7.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 131.838139684213 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 126.45752172187646 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 132.9142632766803 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 126.45752172187646 2 7.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 111.39179142733418 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 124.30527453694185 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 113.5440386122688 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 126.45752172187646 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 113.5440386122688 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 136.2832331164146 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 142.61019092137315 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 137.3377260839077 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 143.66468388886625 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 137.3377260839077 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 149.23456981972717 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 155.7237573119923 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 150.316101068438 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 156.80528856070316 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 150.316101068438 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 138.42466498886213 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 144.88140654366595 2 7 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 139.50078858132943 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 145.95753013613327 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 139.50078858132943 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 151.3976323171489 2 7 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 157.88681980941402 2 7 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 152.47916356585972 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 158.96835105812488 2 7 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 152.47916356585972 2 7 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 137.3377260839077 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 150.316101068438 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 139.50078858132943 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 152.47916356585972 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 139.50078858132943 2 6.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 107.10892768243919 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 119.76284329235622 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 109.21791361742537 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 121.8718292273424 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 133.01160108906427 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 145.9899760735946 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 135.174663586486 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 148.15303857101628 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 111.39179142733418 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 124.30527453694185 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 113.5440386122688 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 126.45752172187646 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 113.5440386122688 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 137.3377260839077 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 150.316101068438 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 139.50078858132943 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 152.47916356585972 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 139.50078858132943 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 159.13404719174147 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 165.46100499669998 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 160.18854015923455 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 166.51549796419306 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 160.18854015923455 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 172.085383895054 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 178.57457138731917 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 173.16691514376487 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 179.65610263603 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 173.16691514376487 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 161.275479064189 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 167.73222061899278 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 162.3516026566563 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 168.80834421146008 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 162.3516026566563 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 174.24844639247573 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 180.7376338847409 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 175.3299776411866 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 181.81916513345178 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 175.3299776411866 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 160.18854015923455 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 173.16691514376487 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 162.3516026566563 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 175.3299776411866 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 185.67385343013916 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 192.16304092240432 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 186.75538467885002 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 193.24457217111515 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 186.75538467885002 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 198.9572756899469 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 205.61285260509064 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 6 200.06653850913753 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 6 206.72211542428127 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 200.06653850913753 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 187.8701938121366 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 194.4924928427046 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 6 188.9739103172313 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 6 195.5962093477993 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 6 188.9739103172313 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 201.17580132832813 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 207.8313782434719 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 202.28506414751877 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 208.9406410626625 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 6 202.28506414751877 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 186.75538467885002 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 200.06653850913753 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 188.9739103172313 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 163.50509733076214 2 6.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 169.96183888556592 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 164.58122092322944 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 171.03796247803328 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 164.58122092322944 2 6.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 176.7221024792708 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 183.3444015098388 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 6 177.8258189843655 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 184.4481180149335 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 6 177.8258189843655 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 165.6904560108496 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 172.27964354626477 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 166.7886539334188 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 173.37784146883396 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 166.7886539334188 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 178.92953548946016 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 185.55183452002817 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 180.03325199455483 2 7.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 186.65555102512283 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 180.03325199455483 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 164.58122092322944 2 6.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 177.8258189843655 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 166.7886539334188 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 180.03325199455483 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 166.7886539334188 2 6.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 190.11090470690164 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 196.60009219916682 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 191.19243595561252 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 197.68162344787766 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 191.19243595561252 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 203.3943269667094 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 210.04990388185314 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 204.50358978590003 2 6.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 211.15916670104377 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 204.50358978590003 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 192.3072450888991 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 198.9295441194671 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 193.4109615939938 2 7 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 200.03326062456176 2 7 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 193.4109615939938 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 205.61285260509064 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 212.2684295202344 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 206.72211542428127 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 213.377692339425 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 206.72211542428127 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 191.19243595561252 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 204.50358978590003 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 193.4109615939938 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 206.72211542428127 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 193.4109615939938 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 160.18854015923455 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 173.16691514376487 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 162.3516026566563 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 175.3299776411866 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 186.75538467885002 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 200.06653850913753 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 188.9739103172313 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 164.58122092322944 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 177.8258189843655 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 166.7886539334188 2 6.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 180.03325199455483 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 166.7886539334188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 191.19243595561252 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 204.50358978590003 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 193.4109615939938 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 206.72211542428127 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 193.4109615939938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 114.80180745782488 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 121.09713047375861 2 7.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 115.8510279604805 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 122.14635097641423 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.8510279604805 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 127.68838747762085 2 7.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 134.14512903242468 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 128.76451107008816 2 7.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 135.22125262489197 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 128.76451107008816 2 7.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 116.93253217091014 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 123.35699001793995 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 118.0032751454151 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 124.42773299244492 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 118.0032751454151 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 129.84063466255546 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 136.29737621735927 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 130.91675825502276 2 8 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 137.3734998098266 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 130.91675825502276 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.8510279604805 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 128.76451107008816 2 7.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 118.0032751454151 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 130.91675825502276 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 7.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 141.2089146650306 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 147.66565621983443 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 142.2850382574979 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 148.74177981230173 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 142.2850382574979 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 154.42591981353928 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 161.0482188441073 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 155.52963631863395 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 162.15193534920198 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 155.52963631863395 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 143.39427334511802 2 8 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 149.98346088053322 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 144.49247126768722 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 151.0816588031024 2 8.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 144.49247126768722 2 8 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 156.6333528237286 2 8 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 163.25565185429664 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 157.73706932882328 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 164.35936835939134 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 157.73706932882328 2 8 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 142.2850382574979 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 155.52963631863395 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 144.49247126768722 2 7.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 157.73706932882328 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 144.49247126768722 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 119.15100234615042 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 125.57546019318025 2 8.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 120.2217453206554 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 126.6462031676852 2 8.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 120.2217453206554 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 132.3019224689166 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 138.89111000433178 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 133.40012039148579 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 139.98930792690098 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 133.40012039148579 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 121.32543423283745 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 127.88167583057556 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 122.4181411657938 2 8.75 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 5 128.9743827635319 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 5 122.4181411657938 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 134.49831831405498 2 8.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 141.08750584947018 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 135.59651623662418 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 5 142.18570377203937 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 5 135.59651623662418 2 8.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 120.2217453206554 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 133.40012039148579 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 122.4181411657938 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 135.59651623662418 2 8.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 122.4181411657938 2 8.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 145.62378068540926 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 152.08052224021307 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 146.69990427787656 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 153.1566458326804 2 8.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 146.69990427787656 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 158.84078583391795 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 165.46308486448598 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 159.94450233901262 2 8.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 166.56680136958065 2 8.5 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 159.94450233901262 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 147.80913936549672 2 8.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 154.39832690091188 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 148.90733728806592 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 5 155.49652482348108 2 8.75 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 5 148.90733728806592 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 161.0482188441073 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 167.67051787467528 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 162.15193534920198 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 168.77423437976998 2 8.66666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 162.15193534920198 2 8.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 146.69990427787656 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 159.94450233901262 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 148.90733728806592 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 162.15193534920198 2 8.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 148.90733728806592 2 8.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.8510279604805 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 128.76451107008816 2 7.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 118.0032751454151 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 130.91675825502276 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 7.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 142.2850382574979 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 155.52963631863395 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 144.49247126768722 2 7.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 157.73706932882328 2 7.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 144.49247126768722 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 120.2217453206554 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 133.40012039148579 2 7.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 122.4181411657938 2 7.75 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 135.59651623662418 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 122.4181411657938 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 146.69990427787656 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 159.94450233901262 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 148.90733728806592 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 162.15193534920198 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 148.90733728806592 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 7.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 7.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 7.5 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 168.00814974526645 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 174.33510755022496 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 169.06264271275955 2 7.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 175.38960051771807 2 7.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 169.06264271275955 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 180.95948644857899 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 187.44867394084417 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 182.04101769728987 2 7.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 188.530205189555 2 7.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 182.04101769728987 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 170.14958161771398 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 176.6063231725178 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 171.2257052101813 2 7.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 177.6824467649851 2 7.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 171.2257052101813 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 183.1225489460007 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 189.61173643826586 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 184.2040801947116 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 190.6932676869767 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 184.2040801947116 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 169.06264271275955 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 182.04101769728987 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 171.2257052101813 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 184.2040801947116 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 194.54795598366414 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 201.03714347592933 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 195.62948723237503 2 7.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 202.11867472464013 2 7.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 195.62948723237503 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 207.8313782434719 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 214.48695515861564 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 208.9406410626625 2 7.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 215.59621797780628 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 208.9406410626625 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 196.7442963656616 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 203.3665953962296 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 197.84801287075626 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 204.47031190132427 2 7.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 197.84801287075626 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 210.04990388185314 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 216.70548079699688 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 211.15916670104377 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 217.8147436161875 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 211.15916670104377 2 7.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 195.62948723237503 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 208.9406410626625 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 197.84801287075626 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 211.15916670104377 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 197.84801287075626 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 172.37919988428715 2 7.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 178.83594143909093 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 173.45532347675444 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 179.91206503155823 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 173.45532347675444 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 185.5962050327958 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 192.2185040633638 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 186.69992153789048 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 193.32222056845848 2 8 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 186.69992153789048 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 174.56455856437458 2 8 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 181.1537460997898 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 175.66275648694378 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 5 182.25194402235894 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 5 175.66275648694378 2 8 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 187.80363804298517 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 194.42593707355317 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 188.90735454807984 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 195.52965357864784 2 8.16666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 188.90735454807984 2 8.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 173.45532347675444 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 186.69992153789048 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 175.66275648694378 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 188.90735454807984 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 175.66275648694378 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 198.98500726042664 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 205.47419475269183 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 200.06653850913753 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 206.55572600140263 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 200.06653850913753 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 212.2684295202344 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 218.92400643537815 2 7.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 213.377692339425 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 220.03326925456875 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 213.377692339425 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 201.1813476424241 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 207.8036466729921 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 202.28506414751877 2 8 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 208.90736317808677 2 8 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 202.28506414751877 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 214.48695515861564 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 221.14253207375938 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 215.59621797780628 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 222.25179489295002 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 215.59621797780628 2 7.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 200.06653850913753 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 213.377692339425 2 7.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 202.28506414751877 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 215.59621797780628 2 7.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 202.28506414751877 2 7.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 169.06264271275955 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 182.04101769728987 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 171.2257052101813 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 184.2040801947116 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 195.62948723237503 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 208.9406410626625 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 197.84801287075626 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 211.15916670104377 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 197.84801287075626 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 173.45532347675444 2 7.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 186.69992153789048 2 7.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 175.66275648694378 2 7.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 188.90735454807984 2 7.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 175.66275648694378 2 7.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 200.06653850913753 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 213.377692339425 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 202.28506414751877 2 7.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 215.59621797780628 2 7.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 202.28506414751877 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 107.10892768243919 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 119.76284329235622 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 109.21791361742537 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 121.8718292273424 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 133.01160108906427 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 145.9899760735946 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 135.174663586486 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 148.15303857101628 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 111.39179142733418 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 124.30527453694185 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 113.5440386122688 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 126.45752172187646 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 113.5440386122688 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 137.3377260839077 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 150.316101068438 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 139.50078858132943 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 152.47916356585972 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 139.50078858132943 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 160.18854015923455 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 173.16691514376487 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 162.3516026566563 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 175.3299776411866 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 186.75538467885002 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 200.06653850913753 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 188.9739103172313 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 164.58122092322944 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 177.8258189843655 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 166.7886539334188 2 6.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 180.03325199455483 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 166.7886539334188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 191.19243595561252 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 204.50358978590003 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 193.4109615939938 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 206.72211542428127 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 193.4109615939938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 115.8510279604805 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 128.76451107008816 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 118.0032751454151 2 6.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 130.91675825502276 2 6.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 142.2850382574979 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 155.52963631863395 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 144.49247126768722 2 6.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 157.73706932882328 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 144.49247126768722 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 120.2217453206554 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 133.40012039148579 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 122.4181411657938 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 135.59651623662418 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 122.4181411657938 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 146.69990427787656 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 159.94450233901262 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 148.90733728806592 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 162.15193534920198 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 148.90733728806592 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 169.06264271275955 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 182.04101769728987 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 171.2257052101813 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 184.2040801947116 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 195.62948723237503 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 208.9406410626625 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 197.84801287075626 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 211.15916670104377 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 197.84801287075626 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 173.45532347675444 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 186.69992153789048 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 175.66275648694378 2 6.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 188.90735454807984 2 6.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 175.66275648694378 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 200.06653850913753 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 213.377692339425 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 202.28506414751877 2 6.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 215.59621797780628 2 6.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 202.28506414751877 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 118.0032751454151 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 171.2257052101813 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 175.66275648694378 2 6 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 17.42145822451678 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 23.55939816505217 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 18.44444821460601 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 24.5823881551414 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 18.44444821460601 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 29.98587374381786 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 36.28119675975158 2 9 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 31.03509424647348 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 37.33041726240721 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 31.03509424647348 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 19.49891481977491 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 25.76276122062898 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 20.54288921991726 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 26.80673562077132 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 20.54288921991726 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 32.0843147491291 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 38.37963776506283 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 33.13353525178472 2 9.5 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 39.42885826771845 2 9.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 33.13353525178472 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 18.44444821460601 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 31.03509424647348 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 20.54288921991726 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 33.13353525178472 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 43.16838775154233 2 9 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 49.46371076747607 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 44.21760825419796 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 50.51293127013169 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 44.21760825419796 2 9 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 56.0549677713383 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 62.51170932614213 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 57.13109136380561 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 63.58783291860944 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 57.13109136380561 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 45.2991124646276 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 51.7235703116574 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 46.36985543913256 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 52.79431328616237 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 46.36985543913256 2 9.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 58.20721495627291 2 9.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 64.66395651107673 2 9.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 59.28333854874022 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 65.74008010354405 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 59.28333854874022 2 9.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 44.21760825419796 2 9 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 57.13109136380561 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 46.36985543913256 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 59.28333854874022 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 21.6619232406342 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 27.92576964148826 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 22.70589764077654 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 28.9697440416306 2 10 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 22.70589764077654 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 34.48407036033119 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 40.908528207361 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 35.55481333483616 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 41.97927118186597 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 35.55481333483616 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 23.78199433015403 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 30.17432988794869 2 10.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 24.84738358978648 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 31.23971914758113 2 10.5 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 24.84738358978648 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 36.62555630934112 2 10.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 43.05001415637093 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 37.69629928384609 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 44.1207571308759 2 10.5 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 37.69629928384609 2 10.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 22.70589764077654 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 35.55481333483616 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 24.84738358978648 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 37.69629928384609 2 10 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 24.84738358978648 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 47.47288212141155 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 53.76820513734529 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 48.52210262406717 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 54.81742564000091 2 10 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 48.52210262406717 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 60.35946214120752 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 66.81620369601136 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 61.43558573367483 2 10 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 67.89232728847865 2 10 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 61.43558573367483 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 49.60360683449682 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 56.02806468152662 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 50.67434980900178 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 57.09880765603159 2 10.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 50.67434980900178 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 62.51170932614214 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 68.96845088094597 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 63.58783291860944 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 70.04457447341326 2 10.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 63.58783291860944 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 48.52210262406717 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 61.43558573367483 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 50.67434980900178 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 63.58783291860944 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 50.67434980900178 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 18.44444821460601 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 31.03509424647348 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 20.54288921991726 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 33.13353525178472 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 44.21760825419796 2 9 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 57.13109136380561 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 46.36985543913256 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 59.28333854874022 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 22.70589764077654 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 35.55481333483616 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 24.84738358978648 2 9.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 37.69629928384609 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 24.84738358978648 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 48.52210262406717 2 9.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 61.43558573367483 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 50.67434980900178 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 63.58783291860944 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 50.67434980900178 2 9.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 70.20944212636178 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 76.50476514229551 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 71.25866262901741 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 77.55398564495114 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 71.25866262901741 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 83.09602214615775 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 89.55276370096158 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 84.17214573862505 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 90.62888729342889 2 9.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 84.17214573862505 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 72.34016683944705 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 78.76462468647685 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 73.41090981395202 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 79.83536766098182 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 73.41090981395202 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 85.24826933109235 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 91.70501088589619 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 86.32439292355967 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 92.7811344783635 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 86.32439292355967 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 71.25866262901741 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 84.17214573862505 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 73.41090981395202 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 86.32439292355967 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 96.61654933356748 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 103.0732908883713 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 97.69267292603477 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 104.1494144808386 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 97.69267292603477 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 109.83355448207615 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 116.45585351264418 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 110.93727098717083 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 117.55957001773885 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 110.93727098717083 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 98.80190801365492 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 105.39109554907012 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 99.90010593622412 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 106.4892934716393 2 10 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 99.90010593622412 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 112.0409874922655 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 118.66328652283353 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 113.14470399736018 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 119.76700302792821 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 113.14470399736018 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 97.69267292603477 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 110.93727098717083 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 99.90010593622412 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 113.14470399736018 2 9.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 74.55863701468733 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 80.98309486171713 2 10 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 75.62937998919229 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 82.05383783622212 2 10.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 75.62937998919229 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 87.70955713745347 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 94.29874467286866 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 88.80775506002267 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 95.39694259543786 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 88.80775506002267 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 76.73306890137434 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 83.28931049911246 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 5 77.8257758343307 2 10.5 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 5 84.3820174320688 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 5 77.8257758343307 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 89.90595298259187 2 10.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 96.49514051800705 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 91.00415090516107 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 97.59333844057625 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 5 91.00415090516107 2 10.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 75.62937998919229 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 88.80775506002267 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 77.8257758343307 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 91.00415090516107 2 10.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 77.8257758343307 2 10 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 101.03141535394614 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 107.48815690874999 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 102.10753894641344 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 108.56428050121728 2 10.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 102.10753894641344 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 114.24842050245483 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 120.87071953302286 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 115.35213700754952 2 10.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 121.97443603811755 2 10.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 115.35213700754952 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 103.2167740340336 2 10.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 109.80596156944878 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 104.3149719566028 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 110.904159492018 2 10.5 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 104.3149719566028 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 116.45585351264418 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 123.0781525432122 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 117.55957001773885 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 124.18186904830688 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 117.55957001773885 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 102.10753894641344 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.35213700754952 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 104.3149719566028 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 117.55957001773885 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 104.3149719566028 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 71.25866262901741 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 84.17214573862505 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 73.41090981395202 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 86.32439292355967 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 97.69267292603477 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 110.93727098717083 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 99.90010593622412 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 113.14470399736018 2 9.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 75.62937998919229 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 88.80775506002267 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 77.8257758343307 2 9.5 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 91.00415090516107 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 77.8257758343307 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 102.10753894641344 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.35213700754952 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 104.3149719566028 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 117.55957001773885 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 104.3149719566028 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 26.09886359111478 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 32.36270999196884 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 27.14283799125712 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 33.40668439211118 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 27.14283799125712 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 38.92101071081177 2 10.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 45.34546855784158 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 39.99175368531674 2 10.75 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 46.41621153234654 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 39.99175368531674 2 10.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 28.21893468063461 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 34.61127023842927 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 29.28432394026705 2 11 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 35.67665949806172 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 29.28432394026705 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 41.0624966598217 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 47.48695450685151 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 42.13323963432667 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 48.55769748135648 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 42.13323963432667 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 27.14283799125712 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.99175368531674 2 10.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 29.28432394026705 2 10.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 42.13323963432667 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 52.37393526228444 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 58.79839310931425 2 10.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 53.44467823678941 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 59.86913608381921 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 53.44467823678941 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 65.52485538505059 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 72.11404292046578 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 66.62305330761978 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 73.21224084303498 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 66.62305330761978 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 54.54836714897146 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 61.10460874670957 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 55.6410740819278 2 11.25 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 62.19731567966591 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 55.6410740819278 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 67.72125123018898 2 11.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 74.31043876560418 2 11.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 68.81944915275818 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 75.40863668817337 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 68.81944915275818 2 11.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 53.44467823678941 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 66.62305330761978 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 55.6410740819278 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 68.81944915275818 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 55.6410740819278 2 10.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 30.4263125049987 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 36.81864806279336 2 11.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 31.49170176463114 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 37.8840373224258 2 11.5 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 31.49170176463114 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 43.51147802715101 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 50.06771962488912 2 11.5 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 44.60418496010737 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 51.16042655784548 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 44.60418496010737 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 32.58987223225228 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 39.1133326220017 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 33.67711563054384 2 11.75 60 -1 -0.5 -0.5 -0.5 140703128616960 1
i 4 40.20057602029327 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 35175782154240 1
i 4 33.67711563054384 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 45.69689189306372 2 11.75 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 52.25313349080183 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 46.78959882602007 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 35175782154240 1
i 4 53.34584042375818 2 12 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 46.78959882602007 2 11.75 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 31.49170176463114 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 44.60418496010737 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 33.67711563054384 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 46.78959882602007 2 11.5 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 33.67711563054384 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 56.76672695256123 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 63.19118479959104 2 11.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 57.83746992706621 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 64.26192777409601 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 57.83746992706621 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 69.91764707532737 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 76.50683461074256 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 71.01584499789656 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 77.60503253331176 2 11.75 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 71.01584499789656 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 58.94115883924825 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 65.49740043698635 2 11.75 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 60.03386577220459 2 11.75 60 -1 -0.5 -0.5 -0.5 35175782154240 1
i 4 66.5901073699427 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 60.03386577220459 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 72.11404292046578 2 11.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 78.70323045588097 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 73.21224084303498 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 79.80142837845017 2 11.91666666666667 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 73.21224084303498 2 11.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 57.83746992706621 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 71.01584499789656 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 60.03386577220459 2 11.5 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 73.21224084303498 2 11.66666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 60.03386577220459 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 27.14283799125712 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.99175368531674 2 10.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 29.28432394026705 2 10.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 42.13323963432667 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 53.44467823678941 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 66.62305330761978 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 55.6410740819278 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 68.81944915275818 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 55.6410740819278 2 10.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 31.49170176463114 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 44.60418496010737 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 33.67711563054384 2 10.75 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 46.78959882602007 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 33.67711563054384 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 57.83746992706621 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 71.01584499789656 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 60.03386577220459 2 11 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 73.21224084303498 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 60.03386577220459 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 10.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 10.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 10.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 79.03917416711916 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 85.33449718305287 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 80.08839466977477 2 10.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 86.3837176857085 2 10.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 80.08839466977477 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 91.92575418691513 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 98.38249574171896 2 10.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 93.00187777938243 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 99.45861933418627 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 93.00187777938243 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 81.16989888020443 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 87.59435672723421 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 82.24064185470938 2 11 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 88.6650997017392 2 11 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 82.24064185470938 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 94.07800137184974 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 100.53474292665356 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 95.15412496431703 2 11 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 101.61086651912086 2 11 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 95.15412496431703 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 80.08839466977477 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.00187777938243 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 82.24064185470938 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 95.15412496431703 2 10.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 105.44628137432485 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 111.90302292912867 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 106.52240496679215 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 112.97914652159598 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 106.52240496679215 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.66328652283353 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 125.28558555340156 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 119.76700302792821 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 126.38930205849623 2 11 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 119.76700302792821 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 107.63164005441229 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 114.22082758982748 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 108.72983797698149 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 115.31902551239668 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 108.72983797698149 2 11 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 120.87071953302286 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 127.4930185635909 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 121.97443603811755 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 128.59673506868558 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 121.97443603811755 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 106.52240496679215 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 119.76700302792821 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 108.72983797698149 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 121.97443603811755 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 108.72983797698149 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 83.3883690554447 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 89.81282690247451 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 84.45911202994967 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 90.88356987697948 2 11.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 84.45911202994967 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 96.53928917821085 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 103.12847671362603 2 11.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 97.63748710078005 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 104.22667463619523 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 97.63748710078005 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 85.56280094213172 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 92.11904253986982 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 86.65550787508808 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 35175782154240 1
i 4 93.21174947282618 2 11.5 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 86.65550787508808 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 98.73568502334923 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 105.32487255876443 2 11.5 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 99.83388294591843 2 11.5 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 106.42307048133362 2 11.58333333333333 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 99.83388294591843 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 84.45911202994967 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 97.63748710078005 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 86.65550787508808 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 99.83388294591843 2 11.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 86.65550787508808 2 11.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 109.86114739470354 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 116.31788894950736 2 11.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 110.93727098717085 2 11.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 117.39401254197467 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 110.93727098717085 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 123.07815254321221 2 11.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 129.70045157378024 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 124.1818690483069 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 130.8041680788749 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 124.1818690483069 2 11.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 112.04650607479098 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 118.63569361020618 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 113.14470399736018 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 119.73389153277537 2 11.5 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 113.14470399736018 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 125.28558555340156 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 131.90788458396958 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 126.38930205849623 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 3 133.01160108906427 2 11.5 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 126.38930205849623 2 11.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 110.93727098717085 2 11.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 124.1818690483069 2 11.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 113.14470399736018 2 11.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 126.38930205849623 2 11.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 113.14470399736018 2 11.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 80.08839466977477 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.00187777938243 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 82.24064185470938 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 95.15412496431703 2 10.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 106.52240496679215 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 119.76700302792821 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 108.72983797698149 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 121.97443603811755 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 108.72983797698149 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 84.45911202994967 2 10.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 97.63748710078005 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 86.65550787508808 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 99.83388294591843 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 86.65550787508808 2 10.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 110.93727098717085 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 124.1818690483069 2 11 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 113.14470399736018 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 126.38930205849623 2 11 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 113.14470399736018 2 10.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 10.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 10.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 10.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 10.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 18.44444821460601 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 31.03509424647348 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 20.54288921991726 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 33.13353525178472 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 44.21760825419796 2 9 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 57.13109136380561 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 46.36985543913256 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 59.28333854874022 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 22.70589764077654 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 35.55481333483616 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 24.84738358978648 2 9.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 37.69629928384609 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 24.84738358978648 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 48.52210262406717 2 9.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 61.43558573367483 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 50.67434980900178 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 63.58783291860944 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 50.67434980900178 2 9.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 71.25866262901741 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 84.17214573862505 2 9.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 73.41090981395202 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 86.32439292355967 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 97.69267292603477 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 110.93727098717083 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 99.90010593622412 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 113.14470399736018 2 9.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 75.62937998919229 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 88.80775506002267 2 9.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 77.8257758343307 2 9.5 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 91.00415090516107 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 77.8257758343307 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 102.10753894641344 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.35213700754952 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 104.3149719566028 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 117.55957001773885 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 104.3149719566028 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 27.14283799125712 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.99175368531674 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 29.28432394026705 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 42.13323963432667 2 9.5 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 53.44467823678941 2 9.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 66.62305330761978 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 55.6410740819278 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 68.81944915275818 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 55.6410740819278 2 9.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 31.49170176463114 2 9.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 44.60418496010737 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 33.67711563054384 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 46.78959882602007 2 9.75 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 33.67711563054384 2 9.5 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 57.83746992706621 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 71.01584499789656 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 60.03386577220459 2 9.75 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 73.21224084303498 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 60.03386577220459 2 9.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 9.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 80.08839466977477 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.00187777938243 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 82.24064185470938 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 95.15412496431703 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 106.52240496679215 2 9.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 119.76700302792821 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 108.72983797698149 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 121.97443603811755 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 108.72983797698149 2 9.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 84.45911202994967 2 9.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 97.63748710078005 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 86.65550787508808 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 99.83388294591843 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 86.65550787508808 2 9.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 110.93727098717085 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 124.1818690483069 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 113.14470399736018 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 126.38930205849623 2 10 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 113.14470399736018 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 9.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 73.41090981395202 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 29.28432394026705 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 9.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 82.24064185470938 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 9.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 77.8257758343307 2 9.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 33.67711563054384 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 86.65550787508808 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 33.67711563054384 2 9 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 123.8290021461834 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 129.99778600601798 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 124.85713278948917 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 131.02591664932373 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 124.85713278948917 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 136.45655543191313 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 142.78351323687164 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 137.5110483994062 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 143.83800620436475 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 137.5110483994062 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 125.91689822181974 2 9 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 132.21222123775345 2 9 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 126.96611872447535 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 133.26144174040908 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 126.96611872447535 2 9 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 138.5655413668993 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 144.89249917185782 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 139.6200343343924 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 145.94699213935093 2 9 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 139.6200343343924 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 124.85713278948917 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 137.5110483994062 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 139.6200343343924 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 149.70531322862115 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 156.03227103357966 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 150.75980619611425 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 157.08676400107277 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 150.75980619611425 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 162.65664993193369 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 169.14583742419887 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 163.73818118064457 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 170.22736867290968 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 163.73818118064457 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 151.84674510106868 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 158.3034866558725 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 152.92286869353597 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 159.3796102483398 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 152.92286869353597 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 164.81971242935543 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 171.30889992162057 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 165.90124367806627 2 9 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 172.39043117033142 2 9 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 165.90124367806627 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 150.75980619611425 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 163.73818118064457 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 165.90124367806627 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 128.09077603172855 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 134.3860990476623 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 129.13999653438418 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 135.4353195503179 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 129.13999653438418 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 140.97735605152454 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 147.43409760632838 2 9.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 142.05347964399184 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 148.51022119879568 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 142.05347964399184 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 130.22150074481382 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 136.64595859184365 2 9.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 131.2922437193188 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 137.7167015663486 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 131.2922437193188 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 143.12960323645916 2 9.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 149.58634479126297 2 9.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 144.2057268289265 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 150.66246838373027 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 144.2057268289265 2 9.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 129.13999653438418 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 142.05347964399184 2 9.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 131.2922437193188 2 9.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 144.2057268289265 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 131.2922437193188 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 154.0314382234646 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 160.35839602842313 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 155.0859311909577 2 9.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 161.41288899591623 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 155.0859311909577 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 166.98277492677715 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 173.47196241904228 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 168.06430617548799 2 9.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 174.55349366775317 2 9.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 168.06430617548799 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 156.1728700959121 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 162.62961165071593 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 157.2489936883794 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 163.70573524318326 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 157.2489936883794 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 169.14583742419887 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 175.635024916464 2 9.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 170.22736867290973 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 176.71655616517486 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 170.22736867290973 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 155.0859311909577 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 168.06430617548799 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 157.2489936883794 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 170.22736867290973 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 157.2489936883794 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 124.85713278948917 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 137.5110483994062 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 139.6200343343924 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 150.75980619611425 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 163.73818118064457 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 165.90124367806627 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 129.13999653438418 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 142.05347964399184 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 131.2922437193188 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 144.2057268289265 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 131.2922437193188 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 155.0859311909577 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 168.06430617548799 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 157.2489936883794 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 170.22736867290973 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 157.2489936883794 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 176.88225229879149 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 183.20921010375002 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 177.9367452662846 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 184.26370307124313 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 177.9367452662846 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 189.833589002104 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 196.32277649436918 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 190.91512025081488 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 197.40430774307998 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 190.91512025081488 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 179.02368417123898 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 185.4804257260428 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 180.09980776370628 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 186.5565493185101 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 180.09980776370628 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 191.99665149952568 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 198.48583899179087 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 193.07818274823657 2 9 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 199.5673702405017 2 9 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 193.07818274823657 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 177.9367452662846 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 190.91512025081488 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 193.07818274823657 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 203.42205853718914 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 209.9112460294543 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 204.50358978590003 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 210.99277727816514 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 204.50358978590003 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 216.70548079699688 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 223.36105771214065 2 8.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 217.8147436161875 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 224.47032053133125 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 217.8147436161875 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 205.6183989191866 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 212.24069794975458 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 206.72211542428127 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 213.34441445484927 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 206.72211542428127 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 218.92400643537815 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 225.5795833505219 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 220.03326925456875 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 226.68884616971252 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 220.03326925456875 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 204.50358978590003 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 217.8147436161875 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 220.03326925456875 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 181.25330243781212 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 187.71004399261594 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 182.32942603027942 2 9.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 188.78616758508323 2 9.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 182.32942603027942 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 194.4703075863208 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 201.0926066168888 2 9.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 195.57402409141548 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 5 202.19632312198348 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 5 195.57402409141548 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 183.43866111789958 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 190.02784865331478 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 184.53685904046878 2 9.5 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 191.12604657588392 2 9.5 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 184.53685904046878 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 196.67774059651015 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 203.30003962707815 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 197.78145710160484 2 9.5 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 204.40375613217282 2 9.5 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 197.78145710160484 2 9.41666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 182.32942603027942 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 195.57402409141548 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 184.53685904046878 2 9.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 197.78145710160484 2 9.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 184.53685904046878 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 207.85910981395165 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 214.3482973062168 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 208.9406410626625 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 215.42982855492764 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 208.9406410626625 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 221.14253207375938 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 227.79810898890312 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 222.25179489295002 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 228.90737180809376 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 5 222.25179489295002 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 210.05545019594908 2 9.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 216.67774922651708 2 9.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 211.15916670104377 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 217.78146573161177 2 9.33333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 211.15916670104377 2 9.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 223.36105771214065 2 9.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 230.0166346272844 2 9.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 224.47032053133125 2 9.25 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 231.125897446475 2 9.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 224.47032053133125 2 9.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 208.9406410626625 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 222.25179489295002 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 211.15916670104377 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 224.47032053133125 2 9.16666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 211.15916670104377 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 177.9367452662846 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 190.91512025081488 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 193.07818274823657 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 204.50358978590003 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 217.8147436161875 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 220.03326925456875 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 182.32942603027942 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 195.57402409141548 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 184.53685904046878 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 197.78145710160484 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 184.53685904046878 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 208.9406410626625 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 222.25179489295002 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 211.15916670104377 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 224.47032053133125 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 211.15916670104377 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 132.55001256487486 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 138.8453355808086 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 133.5992330675305 2 9.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 139.8945560834642 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 133.5992330675305 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 145.43659258467088 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 151.89333413947466 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 146.51271617713817 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 152.96945773194196 2 9.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 146.51271617713817 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 134.68073727796013 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 141.10519512498993 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 135.7514802524651 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 142.17593809949489 2 10 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 135.7514802524651 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 147.58883976960547 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 154.04558132440926 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 148.66496336207277 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 155.12170491687655 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 148.66496336207277 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 133.5992330675305 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 146.51271617713817 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 135.7514802524651 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 148.66496336207277 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 158.95711977208057 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 165.41386132688442 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 160.03324336454787 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 166.4899849193517 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 160.03324336454787 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 172.17412492058926 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 178.7964239511573 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 173.27784142568393 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 179.90014045625196 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 173.27784142568393 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 161.142478452168 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 167.7316659875832 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 162.2406763747372 2 10 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 168.82986391015243 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 162.2406763747372 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 174.38155793077857 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 181.00385696134663 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 175.48527443587327 2 10 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 182.10757346644132 2 10 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 175.48527443587327 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 160.03324336454787 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 173.27784142568393 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 162.2406763747372 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 175.48527443587327 2 9.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 162.2406763747372 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 136.8992074532004 2 10 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 143.32366530023026 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 137.96995042770538 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 144.39440827473518 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 137.96995042770538 2 10 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 150.05012757596654 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 156.63931511138176 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 151.14832549853574 2 10.25 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 157.73751303395096 2 10.25 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 151.14832549853574 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 139.07363933988745 2 10.25 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 145.62988093762556 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 4 140.16634627284378 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 35175782154240 1
i 4 146.72258787058192 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 140.16634627284378 2 10.25 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 152.24652342110497 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 158.83571095652016 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 153.34472134367417 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 4 159.93390887908936 2 10.41666666666667 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 153.34472134367417 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 137.96995042770538 2 10 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 151.14832549853574 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 140.16634627284378 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 153.34472134367417 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 140.16634627284378 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 163.37198579245927 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 169.82872734726305 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 164.44810938492657 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 170.90485093973038 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 164.44810938492657 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 176.58899094096793 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 183.21128997153593 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 177.6927074460626 2 10.25 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 184.3150064766306 2 10.25 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 177.6927074460626 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 165.5573444725467 2 10.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 172.1465320079619 2 10.25 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 166.6555423951159 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 3 173.2447299305311 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 4 166.6555423951159 2 10.25 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 178.7964239511573 2 10.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 185.4187229817253 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 3 179.90014045625196 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 3 186.52243948681996 2 10.33333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 3 179.90014045625196 2 10.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 164.44810938492657 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 177.6927074460626 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 166.6555423951159 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 179.90014045625196 2 10.16666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 166.6555423951159 2 10.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 133.5992330675305 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 146.51271617713817 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 135.7514802524651 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 148.66496336207277 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 160.03324336454787 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 173.27784142568393 2 9.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 162.2406763747372 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 175.48527443587327 2 9.75 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 162.2406763747372 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 137.96995042770538 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 151.14832549853574 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 140.16634627284378 2 9.75 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 153.34472134367417 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 140.16634627284378 2 9.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 164.44810938492657 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 177.6927074460626 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 166.6555423951159 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 179.90014045625196 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 166.6555423951159 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 185.7563548523165 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 192.08331265727503 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 186.81084781980957 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 193.1378056247681 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 186.81084781980957 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 198.707691555629 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 205.19687904789416 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 199.78922280433986 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 206.278410296605 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 199.78922280433986 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 187.897786724764 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 194.35452827956777 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 188.9739103172313 2 9.75 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 195.43065187203507 2 9.75 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 188.9739103172313 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 200.8707540530507 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 207.35994154531588 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 201.95228530176158 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 208.44147279402668 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 201.95228530176158 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 186.81084781980957 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 199.78922280433986 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 188.9739103172313 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 201.95228530176158 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 212.29616109071412 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 218.7853485829793 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 213.377692339425 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 219.86687983169014 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 213.377692339425 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 225.5795833505219 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 232.23516026566563 2 9.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 226.68884616971252 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 233.34442308485626 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 226.68884616971252 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 214.49250147271158 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 221.11480050327958 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 215.59621797780628 2 9.75 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 222.21851700837425 2 9.75 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 215.59621797780628 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 227.79810898890312 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 234.4536859040469 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 228.90737180809376 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 3 235.5629487232375 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 228.90737180809376 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 213.377692339425 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 226.68884616971252 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 215.59621797780628 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 228.90737180809376 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 215.59621797780628 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 190.12740499133713 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 196.58414654614091 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 191.20352858380443 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 197.6602701386082 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 191.20352858380443 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 203.3444101398458 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 209.9667091704138 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 204.4481266449405 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 4 211.07042567550846 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 4 204.4481266449405 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 192.31276367142456 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 198.90195120683978 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 3 193.4109615939938 2 10 60 -1 -0.5 -0.5 -0.5 8793945538560 1
i 3 200.00014912940892 2 10 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 3 193.4109615939938 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 205.55184315003515 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 212.17414218060316 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 3 206.65555965512982 2 10 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 3 213.27785868569782 2 10 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 3 206.65555965512982 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 191.20352858380443 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 204.4481266449405 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 193.4109615939938 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 206.65555965512982 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 193.4109615939938 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 216.73321236747663 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 223.2223998597418 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 217.8147436161875 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 224.30393110845262 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 217.8147436161875 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 230.0166346272844 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 236.67221154242813 2 9.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 231.125897446475 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 3 237.78147436161876 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 231.125897446475 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 218.92955274947408 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 225.55185178004209 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 34351349760 1
i 3 220.03326925456875 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 2198486384640 1
i 3 226.65556828513675 2 9.91666666666667 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 3 220.03326925456875 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 2 232.23516026566563 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 238.89073718080937 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 2 233.34442308485626 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 549621596160 1
i 2 240 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 137405399040 1
i 2 233.34442308485626 2 9.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 217.8147436161875 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 231.125897446475 2 9.75 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 220.03326925456875 2 9.75 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 2 233.34442308485626 2 9.75 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 220.03326925456875 2 9.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 186.81084781980957 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 199.78922280433986 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 188.9739103172313 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 201.95228530176158 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 213.377692339425 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 226.68884616971252 2 9.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 215.59621797780628 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 228.90737180809376 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 215.59621797780628 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 191.20352858380443 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 204.4481266449405 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 193.4109615939938 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 206.65555965512982 2 9.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 193.4109615939938 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 217.8147436161875 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 231.125897446475 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 220.03326925456875 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 2 233.34442308485626 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 220.03326925456875 2 9.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 9.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 9.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 9.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 9.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 124.85713278948917 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 137.5110483994062 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 139.6200343343924 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 150.75980619611425 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 163.73818118064457 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 165.90124367806627 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 129.13999653438418 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 142.05347964399184 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 131.2922437193188 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 144.2057268289265 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 131.2922437193188 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 155.0859311909577 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 168.06430617548799 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 157.2489936883794 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 170.22736867290973 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 157.2489936883794 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 177.9367452662846 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 190.91512025081488 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 193.07818274823657 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 204.50358978590003 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 217.8147436161875 2 8.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 220.03326925456875 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 182.32942603027942 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 195.57402409141548 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 184.53685904046878 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 197.78145710160484 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 184.53685904046878 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 208.9406410626625 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 222.25179489295002 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 211.15916670104377 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 224.47032053133125 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 211.15916670104377 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 133.5992330675305 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 146.51271617713817 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 135.7514802524651 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 148.66496336207277 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 160.03324336454787 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 173.27784142568393 2 9 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 162.2406763747372 2 9 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 175.48527443587327 2 9 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 162.2406763747372 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 137.96995042770538 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 151.14832549853574 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 140.16634627284378 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 153.34472134367417 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 140.16634627284378 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 164.44810938492657 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 177.6927074460626 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 166.6555423951159 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 179.90014045625196 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 166.6555423951159 2 9.08333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 9 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 186.81084781980957 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 199.78922280433986 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 188.9739103172313 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 201.95228530176158 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 213.377692339425 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 226.68884616971252 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 215.59621797780628 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 228.90737180809376 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 215.59621797780628 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 191.20352858380443 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 204.4481266449405 2 9 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 193.4109615939938 2 9 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 206.65555965512982 2 9 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 193.4109615939938 2 9 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 217.8147436161875 2 9 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 231.125897446475 2 9 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 220.03326925456875 2 9 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 2 233.34442308485626 2 9 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 220.03326925456875 2 9 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 8.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 180.09980776370628 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 8.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 135.7514802524651 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 8.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 8.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 188.9739103172313 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 8.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 8.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 8.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 184.53685904046878 2 8.75 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 140.16634627284378 2 8.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 193.4109615939938 2 8.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 140.16634627284378 2 8.75 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 1.00242737722312 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 13.33999509689224 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 3.05868866383464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 15.39625638350376 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 26.25753394868255 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 38.91144955859961 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 4 28.36651988366873 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 41.02043549358578 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 5.17821952849574 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 17.7688655603632 2 6.25 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 7.27666053380698 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 19.86730656567445 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 7.27666053380698 2 6.25 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 30.4755058186549 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 43.12942142857194 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 32.58449175364108 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 45.23840736355812 2 6.25 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 32.58449175364108 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 52.7550495420986 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 65.40896515201565 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 54.86403547708478 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 67.51795108700182 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 78.65772294872366 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 91.63609793325398 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 80.82078544614538 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 57.0379132869936 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 69.95139639660125 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 59.19016047192821 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 72.10364358153585 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 59.19016047192821 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 82.9838479435671 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 95.9622229280974 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 85.1469104409888 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 98.12528542551912 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 85.1469104409888 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 9.52597514831339 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 22.11662118018085 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 11.62441615362464 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 24.2150621854921 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 35.29913518790534 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 48.21261829751299 2 6.5 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 37.45138237283995 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 50.3648654824476 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 37.45138237283995 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 13.78742457448392 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 26.63634026854354 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 15.92891052349386 2 6.75 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 28.77782621755347 2 6.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 15.92891052349386 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.60362955777455 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 52.51711266738221 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 41.75587674270916 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 54.66935985231682 2 6.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 41.75587674270916 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 11.62441615362464 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 61.40729953178547 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 74.06121514170252 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 63.51628546677164 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 76.17020107668868 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 87.30997293841052 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 100.28834792294084 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 89.47303543583224 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 102.45141042036256 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 89.47303543583224 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 65.69016327668047 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 78.60364638628812 2 6.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 67.84241046161507 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 80.75589357122274 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 67.84241046161507 2 6.5 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 91.63609793325395 2 6.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 104.61447291778428 2 6.5 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 93.7991604306757 2 6.5 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 106.77753541520599 2 6.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 93.7991604306757 2 6.5 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 63.51628546677164 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 11.62441615362464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 63.51628546677164 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 67.84241046161507 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 107.10892768243919 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 119.76284329235622 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 109.21791361742537 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 121.8718292273424 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 133.01160108906427 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 145.9899760735946 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 135.174663586486 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 148.15303857101628 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 111.39179142733418 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 124.30527453694185 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 113.5440386122688 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 126.45752172187646 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 113.5440386122688 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 137.3377260839077 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 150.316101068438 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 139.50078858132943 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 152.47916356585972 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 139.50078858132943 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 160.18854015923455 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 173.16691514376487 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 162.3516026566563 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 175.3299776411866 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 186.75538467885002 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 6 200.06653850913753 2 6 60 -1 -0.5 -0.5 -0.5 65520 1
i 6 188.9739103172313 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 6 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 164.58122092322944 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 6 177.8258189843655 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 166.7886539334188 2 6.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 180.03325199455483 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 166.7886539334188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 191.19243595561252 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 204.50358978590003 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 193.4109615939938 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 206.72211542428127 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 193.4109615939938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 115.8510279604805 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 128.76451107008816 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 118.0032751454151 2 6.5 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 130.91675825502276 2 6.5 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 142.2850382574979 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 155.52963631863395 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 144.49247126768722 2 6.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 157.73706932882328 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 144.49247126768722 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 120.2217453206554 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 133.40012039148579 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 122.4181411657938 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 135.59651623662418 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 122.4181411657938 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 146.69990427787656 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 159.94450233901262 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 148.90733728806592 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 162.15193534920198 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 148.90733728806592 2 6.58333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 118.0032751454151 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 169.06264271275955 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 182.04101769728987 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 171.2257052101813 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 184.2040801947116 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 195.62948723237503 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 208.9406410626625 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 197.84801287075626 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 211.15916670104377 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 197.84801287075626 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 173.45532347675444 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 186.69992153789048 2 6.5 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 175.66275648694378 2 6.5 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 188.90735454807984 2 6.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 5 175.66275648694378 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 200.06653850913753 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 213.377692339425 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 202.28506414751877 2 6.5 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 215.59621797780628 2 6.5 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 202.28506414751877 2 6.41666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 171.2257052101813 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 118.0032751454151 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 171.2257052101813 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 175.66275648694378 2 6 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 18.44444821460601 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 31.03509424647348 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 20.54288921991726 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 33.13353525178472 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 44.21760825419796 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 57.13109136380561 2 6.75 60 -1 -0.5 -0.5 -0.5 2096640 1
i 4 46.36985543913256 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 59.28333854874022 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 46.36985543913256 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 22.70589764077654 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 35.55481333483616 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 24.84738358978648 2 7 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 37.69629928384609 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 24.84738358978648 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 48.52210262406717 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 61.43558573367483 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 50.67434980900178 2 7 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 63.58783291860944 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 50.67434980900178 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 71.25866262901741 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 84.17214573862505 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 73.41090981395202 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 86.32439292355967 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 97.69267292603477 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 110.93727098717083 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 5 99.90010593622412 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 113.14470399736018 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 99.90010593622412 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 75.62937998919229 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 88.80775506002267 2 7 60 -1 -0.5 -0.5 -0.5 268369920 1
i 5 77.8257758343307 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 5 91.00415090516107 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 5 77.8257758343307 2 7 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 102.10753894641344 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 115.35213700754952 2 7 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 104.3149719566028 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 117.55957001773885 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 104.3149719566028 2 7 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 73.41090981395202 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 27.14283799125712 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 39.99175368531674 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 29.28432394026705 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 42.13323963432667 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 53.44467823678941 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 66.62305330761978 2 7.25 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 55.6410740819278 2 7.25 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 68.81944915275818 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 55.6410740819278 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 31.49170176463114 2 7.25 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 44.60418496010737 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 33.67711563054384 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 1099243192320 1
i 4 46.78959882602007 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 33.67711563054384 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 57.83746992706621 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 71.01584499789656 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 60.03386577220459 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 73.21224084303498 2 7.41666666666667 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 60.03386577220459 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 29.28432394026705 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 80.08839466977477 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.00187777938243 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 82.24064185470938 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 95.15412496431703 2 7.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 106.52240496679215 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 119.76700302792821 2 7.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 108.72983797698149 2 7.25 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 121.97443603811755 2 7.25 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 108.72983797698149 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 84.45911202994967 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 97.63748710078005 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 86.65550787508808 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 99.83388294591843 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 86.65550787508808 2 7.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 110.93727098717085 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 124.1818690483069 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 113.14470399736018 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 126.38930205849623 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 113.14470399736018 2 7.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 82.24064185470938 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 7.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 7.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 20.54288921991726 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 6.75 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 73.41090981395202 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 29.28432394026705 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 82.24064185470938 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 77.8257758343307 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 33.67711563054384 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 86.65550787508808 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 33.67711563054384 2 6.75 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 124.85713278948917 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 137.5110483994062 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 126.96611872447535 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 139.6200343343924 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 150.75980619611425 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 163.73818118064457 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 152.92286869353597 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 165.90124367806627 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 152.92286869353597 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 129.13999653438418 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 142.05347964399184 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 131.2922437193188 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 144.2057268289265 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 131.2922437193188 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 155.0859311909577 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 168.06430617548799 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 157.2489936883794 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 170.22736867290973 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 157.2489936883794 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 177.9367452662846 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 190.91512025081488 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 180.09980776370628 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 193.07818274823657 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 204.50358978590003 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 217.8147436161875 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 206.72211542428127 2 6.75 60 -1 -0.5 -0.5 -0.5 67092480 1
i 5 220.03326925456875 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 5 206.72211542428127 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 182.32942603027942 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 195.57402409141548 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 184.53685904046878 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 197.78145710160484 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 184.53685904046878 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 208.9406410626625 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 222.25179489295002 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 211.15916670104377 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 224.47032053133125 2 6.83333333333333 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 211.15916670104377 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 180.09980776370628 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 133.5992330675305 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 146.51271617713817 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 135.7514802524651 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 148.66496336207277 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 160.03324336454787 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 173.27784142568393 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 162.2406763747372 2 7 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 175.48527443587327 2 7 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 162.2406763747372 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 137.96995042770538 2 7 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 151.14832549853574 2 7 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 4 140.16634627284378 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 274810798080 1
i 4 153.34472134367417 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 4 140.16634627284378 2 7 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 164.44810938492657 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 177.6927074460626 2 7 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 166.6555423951159 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 179.90014045625196 2 7.08333333333333 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 4 166.6555423951159 2 7 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 135.7514802524651 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 186.81084781980957 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 199.78922280433986 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 188.9739103172313 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 201.95228530176158 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 213.377692339425 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 226.68884616971252 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 215.59621797780628 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 4 228.90737180809376 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 4 215.59621797780628 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 191.20352858380443 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 204.4481266449405 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 1073479680 1
i 3 193.4109615939938 2 7 60 -1 -0.5 -0.5 -0.5 68702699520 1
i 3 206.65555965512982 2 7 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 3 193.4109615939938 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 217.8147436161875 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 231.125897446475 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 268369920 1
i 3 220.03326925456875 2 7 60 -1 -0.5 -0.5 -0.5 17175674880 1
i 2 233.34442308485626 2 7 60 -1 -0.5 -0.5 -0.5 4293918720 1
i 3 220.03326925456875 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 188.9739103172313 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 6.91666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 126.96611872447535 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 180.09980776370628 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 135.7514802524651 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 6.75 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 6.75 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 6.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 6.75 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 188.9739103172313 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 6.75 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 6.75 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 6.75 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 6.75 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 184.53685904046878 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 140.16634627284378 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 193.4109615939938 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 140.16634627284378 2 6.66666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 3.05868866383464 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 4 28.36651988366873 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 7.27666053380698 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 32.58449175364108 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 54.86403547708478 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 80.82078544614538 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 59.19016047192821 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 85.1469104409888 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 11.62441615362464 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 37.45138237283995 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 15.92891052349386 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 41.75587674270916 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 15.92891052349386 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 63.51628546677164 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 89.47303543583224 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 93.7991604306757 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 67.84241046161507 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 67.84241046161507 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 109.21791361742537 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 135.174663586486 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 113.5440386122688 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 139.50078858132943 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 162.3516026566563 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 6 188.9739103172313 2 6 60 -1 -0.5 -0.5 -0.5 32760 1
i 5 166.7886539334188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 118.0032751454151 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 144.49247126768722 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 122.4181411657938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 134184960 1
i 5 148.90733728806592 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 122.4181411657938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 171.2257052101813 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 197.84801287075626 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 202.28506414751877 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 8386560 1
i 5 175.66275648694378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 175.66275648694378 2 6 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 20.54288921991726 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 46.36985543913256 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 24.84738358978648 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 50.67434980900178 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 73.41090981395202 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 99.90010593622412 2 6.25 60 -1 -0.5 -0.5 -0.5 2096640 1
i 5 77.8257758343307 2 6.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 104.3149719566028 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 5 77.8257758343307 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 29.28432394026705 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 55.6410740819278 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 134184960 1
i 4 33.67711563054384 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 8587837440 1
i 4 60.03386577220459 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 33.67711563054384 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 82.24064185470938 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 108.72983797698149 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 86.65550787508808 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 113.14470399736018 2 6.33333333333333 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 86.65550787508808 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 24.84738358978648 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 77.8257758343307 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 33.67711563054384 2 6.25 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 86.65550787508808 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 33.67711563054384 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 126.96611872447535 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 152.92286869353597 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 131.2922437193188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 157.2489936883794 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 180.09980776370628 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 206.72211542428127 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 184.53685904046878 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 211.15916670104377 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 8386560 1
i 4 184.53685904046878 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 135.7514802524651 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 162.2406763747372 2 6.25 60 -1 -0.5 -0.5 -0.5 33546240 1
i 4 140.16634627284378 2 6.25 60 -1 -0.5 -0.5 -0.5 2146959360 1
i 4 166.6555423951159 2 6.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 4 140.16634627284378 2 6.25 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 188.9739103172313 2 6.25 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 215.59621797780628 2 6.25 60 -1 -0.5 -0.5 -0.5 8386560 1
i 3 193.4109615939938 2 6.25 60 -1 -0.5 -0.5 -0.5 536739840 1
i 3 220.03326925456875 2 6.25 60 -1 -0.5 -0.5 -0.5 134184960 1
i 3 193.4109615939938 2 6.25 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 131.2922437193188 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 184.53685904046878 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 140.16634627284378 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 193.4109615939938 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 140.16634627284378 2 6.16666666666667 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 7.27666053380698 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 59.19016047192821 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 67.84241046161507 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 113.5440386122688 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 5 166.7886539334188 2 6 60 -1 -0.5 -0.5 -0.5 16380 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 1048320 1
i 5 175.66275648694378 2 6 60 -1 -0.5 -0.5 -0.5 262080 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 24.84738358978648 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 5 77.8257758343307 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 1048320 1
i 4 33.67711563054384 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 67092480 1
i 4 86.65550787508808 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 4 33.67711563054384 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 131.2922437193188 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 184.53685904046878 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 262080 1
i 4 140.16634627284378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 16773120 1
i 3 193.4109615939938 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 4193280 1
i 4 140.16634627284378 2 6.08333333333333 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 15.92891052349386 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
i 5 122.4181411657938 2 6 60 -1 -0.5 -0.5 -0.5 8190 1
i 4 33.67711563054384 2 6 60 -1 -0.5 -0.5 -0.5 524160 1
i 4 140.16634627284378 2 6 60 -1 -0.5 -0.5 -0.5 131040 1
i 4 33.67711563054384 2 6 60 -1 -0.5 -0.5 -0.5 4095 1
</CsScore>
</CsoundSynthesizer>
