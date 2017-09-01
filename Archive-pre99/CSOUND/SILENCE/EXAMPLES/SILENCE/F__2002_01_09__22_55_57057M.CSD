<CsoundSynthesizer>
<CsOptions>
csound -RWdo C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-09--22-55-57.057.mml.wav C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-09--22-55-57.057.mml.orc C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-09--22-55-57.057.mml.sco
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
Guitar, Michael Gogins
Dynamic FM with comb filter 2, Michael Gogins
Xing by Andrew Horner
Heavy metal model, Perry Cook
Tubular bell model, Perry Cook
</CsArrangement>
<CsScore>
i 3 0 2 8.66666666666667 68 -1 -0.46309976521984 -0.5 -0.5 3898.680494306192 1
i 3 3.18809694124476 2 9.08333333333333 68 -1 0.42090014449843 -0.5 -0.5 3829.880250289024 1
i 3 3.80613229604066 2 9.5 68 -1 0.06707512749622 -0.5 -0.5 3822.235778731561 1
i 3 4.11514997343861 2 9.66666666666667 68 -1 -0.2545367184532 -0.5 -0.5 3898.680494306192 1
i 2 4.11514997343861 2 9.66666666666667 68 -1 -0.47062829683947 -0.5 -0.5 3890.898696912367 1
i 2 4.73318532823451 2 10.08333333333333 68 -1 -0.44302667278038 -0.5 -0.5 3890.898696912367 1
i 2 4.73318532823451 2 10.08333333333333 68 -1 -0.15010370617656 -0.5 -0.5 3890.898696912367 1
i 2 5.4865645741022 2 8.75 68 -1 0.2103887648683 -0.5 -0.5 3906.4778552948046 1
i 3 5.4865645741022 2 8.75 68 -1 -0.283640290029 -0.5 -0.5 3898.680494306192 1
i 3 6.70547323299364 2 6.75 68 -1 -0.47140437469397 -0.5 -0.5 2869 1
i 3 6.82591011557314 2 9.91666666666667 68 -1 0.13120534506981 -0.5 -0.5 3890.898696912367 1
i 2 8.2298468611533 2 8.83333333333333 68 -1 -0.38341288114635 -0.5 -0.5 3829.880250289024 1
i 2 8.42594685635646 2 10.33333333333333 68 -1 0.00136476595275 -0.5 -0.5 3890.898696912367 1
i 2 8.67466151534696 2 9.33333333333333 68 -1 -0.19058781608605 -0.5 -0.5 3829.880250289024 1
i 2 8.98367919274491 2 9.41666666666667 68 -1 0.28107057282576 -0.5 -0.5 3829.880250289024 1
i 3 9.12998159939941 2 6.66666666666667 68 -1 0.12245993149239 -0.5 -0.5 2869 1
i 2 9.29269687014286 2 9.75 68 -1 -0.41540167081789 -0.5 -0.5 3822.235778731561 1
i 2 10.14460967646399 2 10.33333333333333 68 -1 -0.07269082919059 -0.5 -0.5 3960.7950806892363 1
i 3 10.45362735386194 2 10.58333333333333 68 -1 0.00246078719979 -0.5 -0.5 4040.010982303021 1
i 2 10.45362735386194 2 10.58333333333333 68 -1 -0.13822992067865 -0.5 -0.5 4031.9470881267675 1
i 2 10.51867164369509 2 10.58333333333333 68 -1 0.02363619877574 -0.5 -0.5 3968.7166708506147 1
i 2 10.51867164369509 2 10.25 68 -1 -0.3024985314078 -0.5 -0.5 3960.7950806892363 1
i 2 10.94506269079764 2 7.91666666666667 68 -1 0.42436654290853 -0.5 -0.5 3032.4637670766256 1
i 3 11.07166270865784 2 11 68 -1 -0.20806656058121 -0.5 -0.5 4031.9470881267675 1
i 2 11.25408036819559 2 8.16666666666667 68 -1 0.06708530349845 -0.5 -0.5 3093.1130424181583 1
i 3 11.25408036819559 2 8.16666666666667 68 -1 -0.36004185346705 -0.5 -0.5 3086.9391640899785 1
i 3 11.55448996580519 2 6.66666666666667 68 -1 0.26109231270899 -0.5 -0.5 2869 1
i 2 11.86275845659172 2 9.75 68 -1 -0.24158497091925 -0.5 -0.5 3762.2941282251 1
i 2 11.87211572299149 2 8.83333333333333 68 -1 -0.13766430706206 -0.5 -0.5 3086.9391640899785 1
i 2 12.1725253206011 2 7 68 -1 0.26068870864681 -0.5 -0.5 2869 1
i 3 12.65340111880166 2 6.41666666666667 68 -1 0.2310460263958 -0.5 -0.5 3503.6679774588247 1
i 3 14.16122608944916 2 9.41666666666667 68 -1 0.19625026823191 -0.5 -0.5 3837.540010789602 1
i 3 14.16122608944916 2 9.41666666666667 68 -1 -0.27504762129843 -0.5 -0.5 3829.880250289024 1
i 2 14.59703368700687 2 6.91666666666667 68 -1 0.35283453364621 -0.5 -0.5 2926.38 1
i 2 14.59703368700687 2 6.91666666666667 68 -1 -0.14173957478092 -0.5 -0.5 2920.538922155689 1
i 2 14.60604074364281 2 9.83333333333333 68 -1 -0.16546692170666 -0.5 -0.5 3688.523655122647 1
i 3 14.70412121837234 2 9.91666666666667 68 -1 -0.29794443926035 -0.5 -0.5 3960.7950806892363 1
i 3 14.88653887791008 2 7 68 -1 0.14690297120108 -0.5 -0.5 2978.949700598803 1
i 2 15.19555655530803 2 7.25 68 -1 0.15525523208006 -0.5 -0.5 3038.528694610779 1
i 3 15.19555655530803 2 7.25 68 -1 -0.07238086560995 -0.5 -0.5 3032.4637670766256 1
i 2 15.32215657316824 2 10.33333333333333 68 -1 0.37245766385115 -0.5 -0.5 3960.7950806892363 1
i 3 15.63117425056619 2 10.66666666666667 68 -1 -0.37907953946967 -0.5 -0.5 3960.7950806892363 1
i 2 15.81359191010394 2 7.66666666666667 68 -1 0.1948016439984 -0.5 -0.5 3032.4637670766256 1
i 2 15.84149806004641 2 6.91666666666667 68 -1 -0.37166719115852 -0.5 -0.5 3441.8385425624924 1
i 3 16.43162726489983 2 8.25 68 -1 -0.49457948205983 -0.5 -0.5 3032.4637670766256 1
i 2 16.45953341484231 2 7.41666666666667 68 -1 -0.17207528358333 -0.5 -0.5 3434.968605351789 1
i 2 16.76855109224027 2 7.58333333333333 68 -1 -0.30877817296707 -0.5 -0.5 3503.6679774588247 1
i 2 16.76855109224027 2 7.58333333333333 68 -1 -0.4352724510511 -0.5 -0.5 3496.6746282024196 1
i 3 16.90450837650026 2 9.58333333333333 68 -1 -0.05067794605641 -0.5 -0.5 3762.2941282251 1
i 2 17.38658644703617 2 8 68 -1 -0.03934290250921 -0.5 -0.5 3496.6746282024196 1
i 3 17.38658644703617 2 8 68 -1 0.23753789795711 -0.5 -0.5 3496.6746282024196 1
i 3 18.13996569290385 2 6.58333333333333 68 -1 -0.36606595680812 -0.5 -0.5 3510.6753134137425 1
i 2 18.13996569290385 2 6.58333333333333 68 -1 0.09736964048997 -0.5 -0.5 3503.6679774588247 1
i 2 18.23810027650971 2 7.58333333333333 68 -1 0.35135527665649 -0.5 -0.5 3032.4637670766256 1
i 2 19.16555228555116 2 9.41666666666667 68 -1 0.02034768914382 -0.5 -0.5 3623.432061208718 1
i 2 19.44605041981843 2 6.66666666666667 68 -1 -0.11098532212183 -0.5 -0.5 2920.538922155689 1
i 3 19.47456996294911 2 9.75 68 -1 -0.39233376915114 -0.5 -0.5 3695.9007024328926 1
i 3 19.47456996294911 2 9.75 68 -1 -0.48799185016743 -0.5 -0.5 3688.523655122647 1
i 2 19.47931123437479 2 7.83333333333333 68 -1 0.29949960471005 -0.5 -0.5 3496.6746282024196 1
i 3 20.06408577461433 2 7 68 -1 0.23056201201015 -0.5 -0.5 2920.538922155689 1
i 2 20.09260531774501 2 10 68 -1 -0.37469000591333 -0.5 -0.5 3688.523655122647 1
i 2 20.37310345201228 2 7.41666666666667 68 -1 0.0909829914018 -0.5 -0.5 2978.949700598803 1
i 2 20.66260864291549 2 7.5 68 -1 -0.12490201499834 -0.5 -0.5 3026.4109451862532 1
i 2 20.88324797995495 2 6.83333333333333 68 -1 -0.14683485516435 -0.5 -0.5 3441.8385425624924 1
i 3 20.90436171563263 2 6.91666666666667 68 -1 0.20386272014914 -0.5 -0.5 3136.1209192112565 1
i 2 21.07934797515812 2 8.25 68 -1 -0.28617624155729 -0.5 -0.5 3496.6746282024196 1
i 2 21.28064399771139 2 7.91666666666667 68 -1 -0.40250584044673 -0.5 -0.5 3026.4109451862532 1
i 3 21.32806263414861 2 7.33333333333333 68 -1 0.35993097537004 -0.5 -0.5 3441.8385425624924 1
i 3 21.63708031154656 2 7.33333333333333 68 -1 -0.19095154255709 -0.5 -0.5 3441.8385425624924 1
i 3 21.94609798894451 2 7.66666666666667 68 -1 -0.3750498783101 -0.5 -0.5 3434.968605351789 1
i 2 22.79801079526565 2 8.41666666666667 68 -1 0.1877871275956 -0.5 -0.5 3559.489142481505 1
i 2 23.1070284726636 2 8.75 68 -1 -0.120049995985 -0.5 -0.5 3630.6789253311354 1
i 2 23.1070284726636 2 8.75 68 -1 -0.45369198115635 -0.5 -0.5 3623.432061208718 1
i 2 23.17207276249674 2 8.08333333333333 68 -1 -0.37257891528588 -0.5 -0.5 3566.608120766468 1
i 2 23.17207276249674 2 8.08333333333333 68 -1 0.10845234527735 -0.5 -0.5 3559.489142481505 1
i 3 23.70515236411717 2 7.83333333333333 68 -1 -0.40985902026713 -0.5 -0.5 3086.9391640899785 1
i 2 23.70515236411717 2 7.83333333333333 68 -1 -0.46536078312574 -0.5 -0.5 3080.777608872234 1
i 2 23.7250638274595 2 8.91666666666667 68 -1 0.15413418987038 -0.5 -0.5 3623.432061208718 1
i 2 24.34309918225541 2 9.41666666666667 68 -1 -0.31501506763928 -0.5 -0.5 3623.432061208718 1
i 2 24.51615957539337 2 7.66666666666667 68 -1 -0.183581858982 -0.5 -0.5 3381.1002153408012 1
i 3 24.65211685965336 2 9.75 68 -1 0.27337254427002 -0.5 -0.5 3623.432061208718 1
i 3 25.59535485793539 2 7.83333333333333 68 -1 -0.39462867828601 -0.5 -0.5 3080.777608872234 1
i 3 25.75337844844418 2 6.83333333333333 68 -1 -0.08598491757374 -0.5 -0.5 3136.1209192112565 1
i 2 26.14957219386528 2 8.75 68 -1 -0.2132811060005 -0.5 -0.5 3623.432061208718 1
i 3 26.81462720825081 2 7.33333333333333 68 -1 0.21748549193479 -0.5 -0.5 3448.7222196476173 1
i 3 26.81462720825081 2 7.33333333333333 68 -1 -0.00872124100226 -0.5 -0.5 3441.8385425624924 1
i 2 26.82199019361931 2 7.08333333333333 68 -1 0.29422302156198 -0.5 -0.5 3142.393161049679 1
i 2 26.82199019361931 2 7 68 -1 0.26342122164702 -0.5 -0.5 3136.1209192112565 1
i 3 27.25944186244447 2 7.83333333333333 68 -1 0.36038199336159 -0.5 -0.5 3314.80413268706 1
i 3 27.357522337174 2 7.83333333333333 68 -1 -0.04561745494072 -0.5 -0.5 3559.489142481505 1
i 2 27.9755576919699 2 8.41666666666667 68 -1 0.33672812965736 -0.5 -0.5 3559.489142481505 1
i 3 28.17788681484996 2 6.83333333333333 68 -1 0.0248037464223 -0.5 -0.5 3136.1209192112565 1
i 2 28.28457536936785 2 8.41666666666667 68 -1 0.32478608530965 -0.5 -0.5 3559.489142481505 1
i 3 28.55416909692873 2 7.83333333333333 68 -1 0.36532801883062 -0.5 -0.5 3080.777608872234 1
i 2 28.55416909692873 2 7.83333333333333 68 -1 0.1490824240667 -0.5 -0.5 3080.777608872234 1
i 2 28.57408056027106 2 8.75 68 -1 -0.09316279490978 -0.5 -0.5 3616.199661884948 1
i 2 28.79592216964586 2 7 68 -1 0.20174391266353 -0.5 -0.5 3136.1209192112565 1
i 2 29.55790949530191 2 7.41666666666667 68 -1 -0.41084670058007 -0.5 -0.5 3381.1002153408012 1
i 2 29.78080443261264 2 7.25 68 -1 -0.21625918713484 -0.5 -0.5 3080.777608872234 1
i 3 30.38916165166927 2 9.91666666666667 68 -1 -0.092734592377 -0.5 -0.5 3822.235778731561 1
i 2 30.69817932906723 2 10.08333333333333 68 -1 -0.12857732643044 -0.5 -0.5 3898.680494306192 1
i 2 30.69817932906723 2 10.08333333333333 68 -1 0.14994891212588 -0.5 -0.5 3890.898696912367 1
i 2 30.99858892667683 2 8.75 68 -1 0.06256669941789 -0.5 -0.5 3616.199661884948 1
i 2 31.22043053605164 2 6.83333333333333 68 -1 0.20048671782723 -0.5 -0.5 3198.8433375954814 1
i 2 31.22043053605164 2 6.83333333333333 68 -1 0.08939527863759 -0.5 -0.5 3192.4584207539733 1
i 2 31.31621468386313 2 10.66666666666667 68 -1 0.25052419767947 -0.5 -0.5 3890.898696912367 1
i 2 31.61662428147274 2 8.91666666666667 68 -1 -0.2131288974892 -0.5 -0.5 3616.199661884948 1
i 3 31.81895340435281 2 7.25 68 -1 0.02395707676108 -0.5 -0.5 3256.307589169053 1
i 2 32.12797108175076 2 7.5 68 -1 -0.33518346090741 -0.5 -0.5 3321.4337409524337 1
i 2 32.12797108175076 2 7.5 68 -1 -0.16252361183886 -0.5 -0.5 3314.80413268706 1
i 3 32.74600643654666 2 7.91666666666667 68 -1 -0.40761403508759 -0.5 -0.5 3314.80413268706 1
i 2 34.04113264787851 2 8.83333333333333 68 -1 0.49135481683911 -0.5 -0.5 3688.523655122647 1
i 3 34.04113264787851 2 8.83333333333333 68 -1 0.25141117790369 -0.5 -0.5 3681.1613324577315 1
i 2 34.33063783878172 2 9 68 -1 -0.26641928831226 -0.5 -0.5 3754.7845591068863 1
i 2 34.50548872203844 2 7.16666666666667 68 -1 0.03169966693701 -0.5 -0.5 4477.564019234017 1
i 2 34.63965551617967 2 9.33333333333333 68 -1 -0.35454098682943 -0.5 -0.5 3829.880250289024 1
i 2 34.63965551617967 2 9.25 68 -1 0.42010070235133 -0.5 -0.5 3822.235778731561 1
i 2 35.25769087097557 2 9.75 68 -1 -0.16539843003525 -0.5 -0.5 3822.235778731561 1
i 3 35.87572622577148 2 10.08333333333333 68 -1 0.04108145541785 -0.5 -0.5 3822.235778731561 1
i 3 36.06944726886321 2 6.83333333333333 68 -1 -0.07951048460221 -0.5 -0.5 3192.4584207539733 1
i 2 36.68748262365912 2 7 68 -1 -0.42106012090567 -0.5 -0.5 3192.4584207539733 1
i 2 36.99650030105706 2 7.25 68 -1 -0.45796168688864 -0.5 -0.5 3256.307589169053 1
i 2 37.30551797845502 2 7.58333333333333 68 -1 0.12230631369235 -0.5 -0.5 3256.307589169053 1
i 3 37.68219923738135 2 9.5 68 -1 0.0216473192084 -0.5 -0.5 3822.235778731561 1
i 2 38.89014938069007 2 8.75 68 -1 0.20539871964086 -0.5 -0.5 3681.1613324577315 1
i 3 39.19648186434122 2 7.66666666666667 68 -1 0.00119027582939 -0.5 -0.5 4398.548183600475 1
i 2 39.35450545485 2 6 68 -1 0.31449575802297 -0.5 -0.5 4477.564019234017 1
i 2 39.50818473548597 2 9 68 -1 0.4023923926136 -0.5 -0.5 3681.1613324577315 1
i 2 39.81720241288392 2 9.25 68 -1 -0.18787837872244 -0.5 -0.5 3754.7845591068863 1
i 2 40.10670760378714 2 9.41666666666667 68 -1 -0.34325748709382 -0.5 -0.5 3814.60656560036 1
i 2 40.34846067650429 2 8.91666666666667 68 -1 0.13976640544124 -0.5 -0.5 3952.889302085066 1
i 3 40.42311720002512 2 7.25 68 -1 0.35179245927974 -0.5 -0.5 4486.519147272485 1
i 2 40.42311720002512 2 7.25 68 -1 0.12396565719575 -0.5 -0.5 4477.564019234017 1
i 3 40.72474295858304 2 9.83333333333333 68 -1 -0.06083081854434 -0.5 -0.5 3814.60656560036 1
i 3 41.77901382125577 2 6 68 -1 0.34907126729968 -0.5 -0.5 4477.564019234017 1
i 2 42.15529610333456 2 7.66666666666667 68 -1 0.3823731101304 -0.5 -0.5 4398.548183600475 1
i 2 43.14925132498882 2 9.66666666666667 68 -1 -0.3588620281786 -0.5 -0.5 3890.8986969123675 1
i 2 43.14925132498882 2 9.66666666666667 68 -1 0.20620037070427 -0.5 -0.5 3883.132432048271 1
i 2 43.38193143901847 2 7.33333333333333 68 -1 -0.23646571599727 -0.5 -0.5 4398.548183600475 1
i 2 43.59409491265399 2 8.08333333333333 68 -1 0.19703502223321 -0.5 -0.5 4732.677118540656 1
i 2 43.81687288322389 2 7.41666666666667 68 -1 0.10640210786326 -0.5 -0.5 4320.926745066348 1
i 2 43.90311259005194 2 8.25 68 -1 -0.37206207116899 -0.5 -0.5 4827.330660911469 1
i 2 43.90311259005194 2 8.33333333333333 68 -1 -0.08931436201212 -0.5 -0.5 4817.6952703707275 1
i 2 44.20352218766155 2 6.66666666666667 68 -1 -0.0048313974121 -0.5 -0.5 4477.564019234017 1
i 3 44.52114794484784 2 8.75 68 -1 -0.42512469885046 -0.5 -0.5 4817.6952703707275 1
i 2 44.82155754245745 2 7.08333333333333 68 -1 0.28811981685556 -0.5 -0.5 4477.564019234017 1
i 2 44.90492460944544 2 8 68 -1 -0.24428004377793 -0.5 -0.5 4096.184905527571 1
i 2 45.03945381880704 2 9.41666666666667 68 -1 -0.10320970553164 -0.5 -0.5 3883.132432048271 1
i 2 45.19747740931584 2 8.66666666666667 68 -1 0.49588325854074 -0.5 -0.5 3952.889302085066 1
i 2 45.23555678258968 2 7.33333333333333 68 -1 0.04742480583186 -0.5 -0.5 4407.345279967675 1
i 2 45.23555678258968 2 7.33333333333333 68 -1 -0.03820817959171 -0.5 -0.5 4398.548183600475 1
i 3 46.26608915449096 2 9.25 68 -1 0.48979449886914 -0.5 -0.5 3960.7950806892363 1
i 2 46.26608915449096 2 9.33333333333333 68 -1 0.2618611663887 -0.5 -0.5 3952.889302085066 1
i 2 47.24606590886323 2 6 68 -1 0.42890767061302 -0.5 -0.5 4567.1152996186975 1
i 3 47.24606590886323 2 6 68 -1 -0.47411868948514 -0.5 -0.5 4557.9993010166645 1
i 2 47.53557109976643 2 7.08333333333333 68 -1 0.41121986145035 -0.5 -0.5 4649.159287036998 1
i 2 47.62198577572163 2 8.66666666666667 68 -1 0.24351662531389 -0.5 -0.5 3952.889302085066 1
i 2 47.84458877716438 2 7.58333333333333 68 -1 0.28724967911947 -0.5 -0.5 4742.142472777738 1
i 2 47.84458877716438 2 7.33333333333333 68 -1 -0.14714542831327 -0.5 -0.5 4732.677118540656 1
i 2 47.99826805780038 2 9.41666666666667 68 -1 -0.33055840960561 -0.5 -0.5 3883.132432048271 1
i 2 47.99826805780038 2 9.41666666666667 68 -1 -0.13884873484171 -0.5 -0.5 3883.132432048271 1
i 2 48.07292458132125 2 7 68 -1 0.28644719305105 -0.5 -0.5 4398.548183600475 1
i 2 48.24002113051753 2 9 68 -1 -0.05006152646618 -0.5 -0.5 3952.889302085066 1
i 2 48.45268845397108 2 7.08333333333333 68 -1 -0.27527746618804 -0.5 -0.5 4320.926745066348 1
i 2 48.45268845397108 2 7.08333333333333 68 -1 -0.3853760461902 -0.5 -0.5 4320.926745066348 1
i 2 48.46262413196029 2 7.75 68 -1 0.11046668012615 -0.5 -0.5 4732.677118540656 1
i 2 49.08065948675619 2 8.16666666666667 68 -1 -0.43604511654817 -0.5 -0.5 4732.677118540656 1
i 2 49.09037418412269 2 7 68 -1 -0.03245383216088 -0.5 -0.5 4096.184905527571 1
i 3 49.2249033934843 2 9.08333333333333 68 -1 0.15857040184615 -0.5 -0.5 3883.132432048271 1
i 2 49.5959177517482 2 8.58333333333333 68 -1 -0.01987783306032 -0.5 -0.5 4023.899289547672 1
i 2 49.87137235333687 2 7.41666666666667 68 -1 -0.21947584855739 -0.5 -0.5 4320.926745066348 1
i 3 50.66452949692331 2 8.83333333333333 68 -1 -0.28231701985214 -0.5 -0.5 4031.9470881267675 1
i 2 50.66452949692331 2 8.83333333333333 68 -1 -0.34896225198596 -0.5 -0.5 4023.899289547672 1
i 2 50.82255308743211 2 8.25 68 -1 -0.3498798967297 -0.5 -0.5 4104.377275338626 1
i 3 50.82255308743211 2 8 68 -1 -0.43309793378364 -0.5 -0.5 4096.184905527571 1
i 2 50.88713249836607 2 7.75 68 -1 -0.00088182757339 -0.5 -0.5 4732.677118540656 1
i 3 51.1830989714613 2 7 68 -1 0.46014026113004 -0.5 -0.5 4178.108603638122 1
i 2 52.09508264167478 2 6.66666666666667 68 -1 0.30956705041159 -0.5 -0.5 4557.9993010166645 1
i 3 52.55473199074154 2 8.58333333333333 68 -1 -0.29001449555061 -0.5 -0.5 4023.899289547672 1
i 3 52.71311799647069 2 7.08333333333333 68 -1 0.37333939819781 -0.5 -0.5 4557.9993010166645 1
i 2 52.78313571224464 2 8 68 -1 -0.05616708307683 -0.5 -0.5 4178.108603638122 1
i 3 53.02213567386864 2 7.41666666666667 68 -1 0.10127354468476 -0.5 -0.5 4649.159287036998 1
i 3 53.14368159627384 2 7.58333333333333 68 -1 -0.3547454285076 -0.5 -0.5 4244.6750966240015 1
i 3 53.31164086477184 2 7.5 68 -1 0.46634216766587 -0.5 -0.5 4723.230657226203 1
i 2 53.55339393748897 2 7.08333333333333 68 -1 -0.4190564478557 -0.5 -0.5 4894.451790807748 1
i 3 53.78136732642545 2 8.25 68 -1 -0.05437120311127 -0.5 -0.5 4023.899289547672 1
i 2 53.92967621956774 2 7 68 -1 0.02457533913754 -0.5 -0.5 4723.230657226203 1
i 3 54.37031693195775 2 7.08333333333333 68 -1 0.3799525598621 -0.5 -0.5 4329.568598556481 1
i 2 54.37031693195775 2 7.08333333333333 68 -1 -0.2948935040243 -0.5 -0.5 4320.926745066348 1
i 2 54.87586049958327 2 7 68 -1 -0.45895495430616 -0.5 -0.5 4261.670775710884 1
i 2 54.87586049958327 2 7 68 -1 0.1209758202706 -0.5 -0.5 4253.16444681725 1
i 3 55.51354622973487 2 8.58333333333333 68 -1 0.4508983761628 -0.5 -0.5 4023.899289547672 1
i 2 55.51354622973487 2 8.58333333333333 68 -1 0.05001586749259 -0.5 -0.5 4023.899289547672 1
i 3 56.10249583526718 2 7.58333333333333 68 -1 -0.02370879369829 -0.5 -0.5 4253.16444681725 1
i 2 56.35418458597353 2 7 68 -1 -0.16962634964498 -0.5 -0.5 4817.6952703707275 1
i 2 56.35418458597353 2 7 68 -1 0.32266802396436 -0.5 -0.5 4808.079112146434 1
i 2 57.3291311709511 2 7.16666666666667 68 -1 -0.26079456095746 -0.5 -0.5 4244.6750966240015 1
i 2 58.24438707979174 2 7.5 68 -1 0.06155874894114 -0.5 -0.5 4808.079112146434 1
i 2 58.40241067030053 2 6.75 68 -1 0.15667810777655 -0.5 -0.5 4894.451790807748 1
i 3 59.06131007426052 2 7.58333333333333 68 -1 -0.42100295697877 -0.5 -0.5 4253.16444681725 1
i 2 59.47102241547565 2 7.25 68 -1 -0.48923419279019 -0.5 -0.5 4904.240694389363 1
i 2 59.47102241547565 2 7.16666666666667 68 -1 0.24316509407786 -0.5 -0.5 4894.451790807748 1
i 3 60.82691903670632 2 6.66666666666667 68 -1 -0.10715513151933 -0.5 -0.5 4894.451790807748 1
i 2 61.20320131878508 2 7.58333333333333 68 -1 0.01026691939241 -0.5 -0.5 4808.079112146434 1
i 2 61.20320131878508 2 7.58333333333333 68 -1 -0.26363330427839 -0.5 -0.5 4808.079112146434 1
i 2 61.44495439150222 2 7.08333333333333 68 -1 0.07470133423335 -0.5 -0.5 4894.451790807748 1
i 3 62.429836654469 2 7.25 68 -1 -0.43386710961322 -0.5 -0.5 4808.079112146434 1
i 2 63.24675964893778 2 7.25 68 -1 -0.06690142881891 -0.5 -0.5 4253.16444681725 1
i 2 63.86946275790801 2 6 68 -1 0.16722990159196 -0.5 -0.5 4992.340826623903 1
i 2 63.86946275790801 2 6 68 -1 -0.41021929093599 -0.5 -0.5 4982.376074474953 1
i 4 64.43751462413182 2 8.66666666666667 68 -1 -0.30165835027658 -0.5 -0.5 433314.8534955089 1
i 2 64.8467963897211 2 7 68 -1 -0.03110833105927 -0.5 -0.5 4253.16444681725 1
i 3 66.93952117705975 2 7.5 68 -1 -0.45535276761377 -0.5 -0.5 4338.227735753595 1
i 2 66.93952117705975 2 7.5 68 -1 -0.24632377356383 -0.5 -0.5 4329.568598556482 1
i 4 67.62561156537657 2 8.83333333333333 68 -1 -0.49056767944182 -0.5 -0.5 425668.1207867646 1
i 5 68.24364692017248 2 9.25 68 -1 -0.3699905956026 -0.5 -0.5 424818.4838191263 1
i 4 68.55266459757043 2 9.66666666666667 68 -1 0.32008825941431 -0.5 -0.5 433314.85349550884 1
i 5 68.55266459757043 2 9.58333333333333 68 -1 0.34605229140705 -0.5 -0.5 432449.95358833217 1
i 3 68.71847949071956 2 6.66666666666667 68 -1 -0.13552837013534 -0.5 -0.5 4982.376074474953 1
i 4 69.17069995236633 2 9.91666666666667 68 -1 -0.47569258998758 -0.5 -0.5 432449.95358833217 1
i 5 69.17069995236633 2 9.91666666666667 68 -1 0.31279112639838 -0.5 -0.5 432449.95358833217 1
i 5 69.92407919823403 2 8.5 68 -1 0.16160334831106 -0.5 -0.5 434181.4832024999 1
i 5 69.92407919823403 2 8.66666666666667 68 -1 -0.42128496790193 -0.5 -0.5 433314.8534955089 1
i 3 71.12497075173698 2 7.25 68 -1 -0.43855052662289 -0.5 -0.5 4329.568598556482 1
i 5 71.14298785712535 2 6.58333333333333 68 -1 -0.42229042695743 -0.5 -0.5 318872.068766397 1
i 4 71.26342473970496 2 9.91666666666667 68 -1 -0.23814868828891 -0.5 -0.5 432449.95358833217 1
i 5 72.66736148528511 2 8.66666666666667 68 -1 -0.35024871037958 -0.5 -0.5 425668.1207867646 1
i 5 72.86346148048828 2 10.25 68 -1 -0.42288103620245 -0.5 -0.5 432449.95358833217 1
i 4 73.11217613947876 2 9 68 -1 0.41189382112905 -0.5 -0.5 425668.1207867646 1
i 4 73.42119381687672 2 9.25 68 -1 -0.02863129863018 -0.5 -0.5 425668.1207867646 1
i 4 73.56749622353112 2 6.41666666666667 68 -1 -0.31053951046829 -0.5 -0.5 318872.068766397 1
i 5 73.73021149427467 2 9.5 68 -1 -0.24468385320382 -0.5 -0.5 424818.4838191263 1
i 5 74.58212430059584 2 10.16666666666667 68 -1 -0.30327375927116 -0.5 -0.5 440218.5156288411 1
i 4 74.8911419779938 2 10.41666666666667 68 -1 0.13517691033849 -0.5 -0.5 449022.88594141795 1
i 5 74.8911419779938 2 10.41666666666667 68 -1 -0.06313761001497 -0.5 -0.5 448126.63267606584 1
i 4 74.95618626782692 2 10.08333333333333 68 -1 0.10867355467152 -0.5 -0.5 441098.9526600988 1
i 5 74.95618626782692 2 10.08333333333333 68 -1 0.4343203017222 -0.5 -0.5 440218.5156288411 1
i 5 75.38257731492938 2 7.83333333333333 68 -1 -0.09065281256709 -0.5 -0.5 337040.0818636685 1
i 5 75.50917733278969 2 10.75 68 -1 -0.0954198494106 -0.5 -0.5 448126.63267606584 1
i 5 75.69159499232732 2 7.91666666666667 68 -1 0.42411655426367 -0.5 -0.5 343780.8835009419 1
i 5 75.69159499232732 2 7.91666666666667 68 -1 -0.48185859498773 -0.5 -0.5 343094.6941127165 1
i 4 75.99200458993691 2 6.41666666666667 68 -1 0.26563624139021 -0.5 -0.5 318872.068766397 1
i 5 76.30027308072351 2 9.5 68 -1 0.04273149146399 -0.5 -0.5 418156.3304199393 1
i 5 76.30963034712323 2 8.58333333333333 68 -1 0.32804558479432 -0.5 -0.5 343094.6941127165 1
i 5 76.61003994473282 2 6.83333333333333 68 -1 -0.42331990314987 -0.5 -0.5 318872.068766397 1
i 4 77.09091574293343 2 6.58333333333333 68 -1 0.1244267565678 -0.5 -0.5 389411.59157994896 1
i 4 78.59874071358097 2 9.16666666666667 68 -1 0.32805287726741 -0.5 -0.5 426519.4570283381 1
i 5 78.59874071358097 2 9.25 68 -1 -0.43458920168222 -0.5 -0.5 425668.1207867646 1
i 5 79.0345483111386 2 6.58333333333333 68 -1 -0.05428515430059 -0.5 -0.5 325249.51014172495 1
i 4 79.0345483111386 2 6.83333333333333 68 -1 -0.42198016688123 -0.5 -0.5 324600.3095226796 1
i 5 79.04355536777462 2 9.58333333333333 68 -1 -0.30830670374182 -0.5 -0.5 409957.186686215 1
i 5 79.14163584250417 2 9.91666666666667 68 -1 0.3265177651021 -0.5 -0.5 440218.5156288411 1
i 5 79.32405350204182 2 6.83333333333333 68 -1 -0.3285676304265 -0.5 -0.5 331092.3157131332 1
i 4 79.63307117943977 2 7.16666666666667 68 -1 0.37987495667344 -0.5 -0.5 337714.16202739585 1
i 5 79.63307117943977 2 7.08333333333333 68 -1 -0.44189724445332 -0.5 -0.5 337040.0818636685 1
i 4 79.75967119730008 2 10.08333333333333 68 -1 -0.34201618060044 -0.5 -0.5 440218.5156288411 1
i 4 80.06868887469803 2 10.91666666666667 68 -1 0.01037804241173 -0.5 -0.5 440218.5156288411 1
i 5 80.25110653423566 2 7.41666666666667 68 -1 0.37810187433042 -0.5 -0.5 337040.0818636685 1
i 4 80.27901268417818 2 6.75 68 -1 -0.43730905468824 -0.5 -0.5 382539.6223167734 1
i 4 80.86914188903157 2 7 68 -1 0.15056909755512 -0.5 -0.5 337040.0818636685 1
i 4 80.89704803897409 2 7.16666666666667 68 -1 -0.19190102702244 -0.5 -0.5 381776.07017642056 1
i 4 81.20606571637202 2 7.58333333333333 68 -1 0.45760992761717 -0.5 -0.5 389411.59157994896 1
i 4 81.20606571637202 2 7.33333333333333 68 -1 0.46171560920509 -0.5 -0.5 388634.3229340808 1
i 5 81.34202300063207 2 9.33333333333333 68 -1 0.39172366435146 -0.5 -0.5 418156.3304199393 1
i 4 81.82410107116793 2 7.83333333333333 68 -1 0.37277266570818 -0.5 -0.5 388634.3229340808 1
i 4 81.82410107116793 2 7.83333333333333 68 -1 -0.0283541432922 -0.5 -0.5 388634.3229340808 1
i 5 82.57748031703562 2 6.58333333333333 68 -1 -0.07259298937071 -0.5 -0.5 390190.4147631089 1
i 5 82.57748031703562 2 6.58333333333333 68 -1 0.48045676524783 -0.5 -0.5 389411.59157994896 1
i 4 82.67561490064145 2 7.41666666666667 68 -1 0.0941274263146 -0.5 -0.5 337040.0818636685 1
i 4 83.60306690968295 2 9.16666666666667 68 -1 0.2290017970549 -0.5 -0.5 402722.6480976347 1
i 5 83.88356504395016 2 6.5 68 -1 0.15110259633762 -0.5 -0.5 324600.3095226796 1
i 5 83.91208458708091 2 9.33333333333333 68 -1 -0.32948430593523 -0.5 -0.5 410777.10105958744 1
i 5 83.91208458708091 2 9.5 68 -1 0.00640495504073 -0.5 -0.5 409957.186686215 1
i 4 83.91682585850657 2 7.75 68 -1 0.13605616082866 -0.5 -0.5 388634.3229340808 1
i 4 84.50160039874606 2 6.83333333333333 68 -1 -0.31586989806041 -0.5 -0.5 324600.3095226796 1
i 4 84.53011994187682 2 9 68 -1 -0.33106041149038 -0.5 -0.5 409957.186686215 1
i 5 84.81061807614401 2 7.16666666666667 68 -1 -0.17361683714306 -0.5 -0.5 331092.3157131332 1
i 4 85.10012326704724 2 7.5 68 -1 0.33096354173486 -0.5 -0.5 336367.3471693299 1
i 5 85.32076260408671 2 6.58333333333333 68 -1 0.35561987195111 -0.5 -0.5 382539.6223167734 1
i 5 85.34187633976437 2 6 68 -1 0.41764476436626 -0.5 -0.5 348560.9499513656 1
i 4 85.5168625992899 2 8.25 68 -1 0.27559552741123 -0.5 -0.5 388634.3229340808 1
i 4 85.71815862184314 2 7.75 68 -1 -0.0377098308735 -0.5 -0.5 336367.3471693299 1
i 5 85.76557725828037 2 6 68 -1 0.27600727786168 -0.5 -0.5 382539.6223167734 1
i 5 86.07459493567832 2 7.25 68 -1 -0.49778962576633 -0.5 -0.5 382539.6223167734 1
i 4 86.38361261307628 2 7.41666666666667 68 -1 0.23879756223805 -0.5 -0.5 381776.07017642056 1
i 5 87.23552541939745 2 8 68 -1 0.36762024558737 -0.5 -0.5 395615.7778370882 1
i 4 87.5445430967954 2 8.25 68 -1 0.29453915502565 -0.5 -0.5 403528.09339383 1
i 5 87.5445430967954 2 8.58333333333333 68 -1 0.2681861843159 -0.5 -0.5 402722.6480976347 1
i 5 87.60958738662852 2 7.91666666666667 68 -1 -0.36096052105438 -0.5 -0.5 396407.0093927624 1
i 5 87.60958738662852 2 7.91666666666667 68 -1 -0.29350460102395 -0.5 -0.5 395615.7778370882 1
i 5 88.14266698824892 2 7.58333333333333 68 -1 0.36247324943113 -0.5 -0.5 343094.6941127165 1
i 5 88.14266698824892 2 7.5 68 -1 0.08937031204999 -0.5 -0.5 342409.8743639885 1
i 5 88.16257845159129 2 8.66666666666667 68 -1 0.27856407148529 -0.5 -0.5 402722.6480976347 1
i 5 88.7806138063872 2 9.16666666666667 68 -1 -0.31945022005056 -0.5 -0.5 402722.6480976347 1
i 5 88.95367419952512 2 7.5 68 -1 -0.33269900230782 -0.5 -0.5 375788.9230994186 1
i 5 89.08963148378515 2 9.58333333333333 68 -1 0.41811126283951 -0.5 -0.5 402722.6480976347 1
i 4 90.03286948206713 2 7.16666666666667 68 -1 0.14155599890922 -0.5 -0.5 342409.8743639885 1
i 5 90.19089307257593 2 6.5 68 -1 -0.10296240727423 -0.5 -0.5 348560.9499513656 1
i 4 90.58708681799708 2 8.58333333333333 68 -1 -0.0135813635693 -0.5 -0.5 402722.6480976347 1
i 4 91.25214183238256 2 7.08333333333333 68 -1 0.14298676887935 -0.5 -0.5 383304.70156140695 1
i 4 91.25214183238256 2 7.25 68 -1 -0.09025631710197 -0.5 -0.5 382539.6223167734 1
i 5 91.25950481775105 2 6.83333333333333 68 -1 -0.4192677642276 -0.5 -0.5 349258.0718512683 1
i 4 91.25950481775105 2 6 68 -1 0.38031746490571 -0.5 -0.5 348560.9499513656 1
i 5 91.69695648657621 2 7.5 68 -1 -0.21338945324319 -0.5 -0.5 368420.51284256723 1
i 5 91.79503696130578 2 7.58333333333333 68 -1 0.31951401334561 -0.5 -0.5 395615.7778370882 1
i 4 92.41307231610169 2 8 68 -1 -0.48407497075339 -0.5 -0.5 395615.7778370882 1
i 5 92.61540143898172 2 6.41666666666667 68 -1 -0.06926631658045 -0.5 -0.5 348560.9499513656 1
i 4 92.72208999349962 2 8.5 68 -1 0.04166191636588 -0.5 -0.5 395615.7778370882 1
i 4 92.99168372106048 2 7.25 68 -1 0.20708073921894 -0.5 -0.5 342409.8743639885 1
i 4 92.99168372106048 2 7.25 68 -1 -0.19984260830521 -0.5 -0.5 342409.8743639885 1
i 4 93.01159518440285 2 8.41666666666667 68 -1 0.21042218715359 -0.5 -0.5 401918.81047668133 1
i 4 93.23343679377761 2 6 68 -1 -0.46208244591686 -0.5 -0.5 348560.9499513656 1
i 5 93.99542411943366 2 7.25 68 -1 0.1110847525176 -0.5 -0.5 375788.9230994186 1
i 5 94.21831905674439 2 6.91666666666667 68 -1 0.14424504297535 -0.5 -0.5 342409.8743639885 1
i 5 94.8266762758011 2 9.66666666666667 68 -1 -0.05074266763713 -0.5 -0.5 424818.48381912627 1
i 5 95.13569395319905 2 9.91666666666667 68 -1 -0.29393379057551 -0.5 -0.5 433314.8534955088 1
i 5 95.13569395319905 2 9.91666666666667 68 -1 0.33460040038037 -0.5 -0.5 432449.9535883321 1
i 5 95.43610355080864 2 8.41666666666667 68 -1 0.19792471954724 -0.5 -0.5 401918.81047668133 1
i 4 95.6579451601834 2 6.66666666666667 68 -1 0.38942447014161 -0.5 -0.5 355532.1689503929 1
i 5 95.6579451601834 2 6.75 68 -1 0.27198650642464 -0.5 -0.5 354822.52390258777 1
i 5 95.75372930799496 2 10.41666666666667 68 -1 -0.47922178230983 -0.5 -0.5 432449.9535883321 1
i 4 96.05413890560455 2 8.75 68 -1 0.19543769673775 -0.5 -0.5 401918.81047668133 1
i 4 96.25646802848456 2 7.08333333333333 68 -1 -0.06176192106885 -0.5 -0.5 361918.97438063956 1
i 5 96.56548570588251 2 7.25 68 -1 0.23677884111547 -0.5 -0.5 369157.35386825236 1
i 5 96.56548570588251 2 7.25 68 -1 -0.12003825603945 -0.5 -0.5 368420.51284256723 1
i 4 97.18352106067843 2 7.66666666666667 68 -1 0.41082364473443 -0.5 -0.5 368420.51284256723 1
i 5 98.47864727201033 2 8.58333333333333 68 -1 -0.3592474868119 -0.5 -0.5 409957.186686215 1
i 4 98.47864727201033 2 8.58333333333333 68 -1 0.3354883771646 -0.5 -0.5 409138.908868478 1
i 5 98.76815246291356 2 8.83333333333333 68 -1 0.17886389646993 -0.5 -0.5 417321.6870458476 1
i 5 98.94300334617014 2 6.91666666666667 68 -1 -0.12016258918659 -0.5 -0.5 497654.27042423654 1
i 4 99.07717014031151 2 9 68 -1 0.2152269673108 -0.5 -0.5 425668.12078676454 1
i 4 99.07717014031151 2 9 68 -1 -0.31448128393348 -0.5 -0.5 424818.48381912627 1
i 4 99.6952054951074 2 9.5 68 -1 -0.2660917339347 -0.5 -0.5 424818.48381912627 1
i 4 100.31324084990331 2 9.91666666666667 68 -1 -0.20603170454934 -0.5 -0.5 424818.48381912627 1
i 4 100.50696189299495 2 6.5 68 -1 0.21055691495184 -0.5 -0.5 354822.52390258777 1
i 5 101.12499724779086 2 6.91666666666667 68 -1 -0.49217889375007 -0.5 -0.5 354822.52390258777 1
i 5 101.43401492518882 2 7 68 -1 -0.3295931379676 -0.5 -0.5 361918.97438063956 1
i 5 101.74303260258677 2 7.33333333333333 68 -1 -0.40134986754354 -0.5 -0.5 361918.97438063956 1
i 5 102.11971386151318 2 9.33333333333333 68 -1 0.49911063943452 -0.5 -0.5 424818.48381912627 1
i 4 103.3276640048219 2 8.33333333333333 68 -1 0.33547846813233 -0.5 -0.5 409138.908868478 1
i 4 103.63399648847292 2 7.33333333333333 68 -1 0.45338996809198 -0.5 -0.5 488872.1362402794 1
i 5 103.7920200789817 2 6.91666666666667 68 -1 -0.26580917747489 -0.5 -0.5 497654.27042423654 1
i 5 103.9456993596178 2 8.75 68 -1 0.06425875975364 -0.5 -0.5 409138.908868478 1
i 4 104.25471703701574 2 9 68 -1 0.47383399629651 -0.5 -0.5 417321.6870458476 1
i 4 104.54422222791895 2 9.25 68 -1 0.05488325127256 -0.5 -0.5 423970.542733659 1
i 4 104.78597530063605 2 8.83333333333333 68 -1 -0.30232721983367 -0.5 -0.5 439339.8359569273 1
i 4 104.86063182415683 2 7 68 -1 -0.1635218113503 -0.5 -0.5 498649.57896508503 1
i 5 104.86063182415683 2 7 68 -1 -0.41779951592113 -0.5 -0.5 497654.27042423654 1
i 4 105.16225758271486 2 9.58333333333333 68 -1 -0.4285949779052 -0.5 -0.5 423970.542733659 1
i 5 106.21652844538747 2 6.5 68 -1 0.18940004615807 -0.5 -0.5 497654.27042423654 1
i 5 106.59281072746626 2 7.75 68 -1 -0.18586291276613 -0.5 -0.5 488872.1362402794 1
i 4 107.58676594912063 2 9.58333333333333 68 -1 -0.32407088943151 -0.5 -0.5 432449.95358833217 1
i 5 107.58676594912063 2 9.5 68 -1 0.41833975729583 -0.5 -0.5 431586.7800282756 1
i 5 107.81944606315018 2 7.08333333333333 68 -1 0.31035617909296 -0.5 -0.5 488872.1362402794 1
i 5 108.03160953678567 2 7.75 68 -1 0.35902281336994 -0.5 -0.5 526008.5547551237 1
i 5 108.2543875073556 2 6 68 -1 0.15760073881434 -0.5 -0.5 480244.9808948627 1
i 4 108.34062721418363 2 8.16666666666667 68 -1 0.30825543088204 -0.5 -0.5 536528.7258502261 1
i 5 108.34062721418363 2 8.16666666666667 68 -1 -0.09361349428245 -0.5 -0.5 535457.8102297666 1
i 4 108.64103681179323 2 6.41666666666667 68 -1 -0.39232285860263 -0.5 -0.5 497654.27042423654 1
i 5 108.95866256897952 2 8.41666666666667 68 -1 0.43246745999668 -0.5 -0.5 535457.8102297666 1
i 5 109.25907216658914 2 6.91666666666667 68 -1 -0.42189228693247 -0.5 -0.5 497654.27042423654 1
i 4 109.34243923357712 2 7 68 -1 0.21927029066879 -0.5 -0.5 455266.27914787905 1
i 5 109.47696844293883 2 9.16666666666667 68 -1 -0.25998537442295 -0.5 -0.5 431586.7800282756 1
i 5 109.6349920334476 2 8.58333333333333 68 -1 -0.04972222667145 -0.5 -0.5 439339.8359569273 1
i 5 109.67307140672139 2 7.33333333333333 68 -1 -0.32222567213043 -0.5 -0.5 489849.88051275996 1
i 4 109.67307140672139 2 7.16666666666667 68 -1 -0.37807872669397 -0.5 -0.5 488872.1362402794 1
i 4 110.70360377862275 2 8.91666666666667 68 -1 0.43409206366904 -0.5 -0.5 440218.5156288411 1
i 4 110.70360377862275 2 8.83333333333333 68 -1 0.16850545455799 -0.5 -0.5 439339.8359569273 1
i 4 111.68358053299491 2 6.66666666666667 68 -1 0.24582051224599 -0.5 -0.5 507607.3558327213 1
i 5 111.68358053299491 2 6.66666666666667 68 -1 0.00049942777384 -0.5 -0.5 506594.1674977258 1
i 5 111.97308572389811 2 6 68 -1 -0.00595261195594 -0.5 -0.5 516726.0508476803 1
i 4 112.05950039985338 2 8.33333333333333 68 -1 0.18153472660379 -0.5 -0.5 439339.8359569273 1
i 4 112.28210340129606 2 7.16666666666667 68 -1 -0.19918460635645 -0.5 -0.5 527060.5718646339 1
i 5 112.28210340129606 2 7.25 68 -1 0.09360468658637 -0.5 -0.5 526008.5547551237 1
i 4 112.43578268193217 2 9.25 68 -1 -0.18717389705901 -0.5 -0.5 431586.7800282756 1
i 5 112.43578268193217 2 9.25 68 -1 0.06361614887181 -0.5 -0.5 431586.7800282756 1
i 4 112.51043920545295 2 7.75 68 -1 0.39434477028703 -0.5 -0.5 488872.1362402794 1
i 4 112.67753575464928 2 8.83333333333333 68 -1 -0.09279294028699 -0.5 -0.5 439339.8359569273 1
i 4 112.89020307810281 2 6.83333333333333 68 -1 -0.03311327289466 -0.5 -0.5 480244.9808948627 1
i 5 112.89020307810281 2 6.83333333333333 68 -1 -0.33311168452374 -0.5 -0.5 480244.9808948627 1
i 5 112.90013875609196 2 7.66666666666667 68 -1 0.01909933883702 -0.5 -0.5 526008.5547551237 1
i 5 113.51817411088787 2 8 68 -1 0.3339516677973 -0.5 -0.5 526008.5547551237 1
i 5 113.52788880825439 2 7.5 68 -1 -0.2829982189829 -0.5 -0.5 455266.27914787905 1
i 5 113.66241801761609 2 8.83333333333333 68 -1 -0.2404853983006 -0.5 -0.5 431586.7800282756 1
i 4 114.0334323758799 2 8.25 68 -1 0.24331953234561 -0.5 -0.5 447232.16833938705 1
i 4 114.30888697746857 2 7.08333333333333 68 -1 -0.08210828923656 -0.5 -0.5 480244.9808948627 1
i 5 115.10204412105504 2 8.75 68 -1 -0.32956889286733 -0.5 -0.5 448126.63267606584 1
i 5 115.10204412105504 2 8.66666666666667 68 -1 0.11035338425844 -0.5 -0.5 447232.16833938705 1
i 5 115.2600677115638 2 7 68 -1 -0.40242708076948 -0.5 -0.5 456176.8117061748 1
i 5 115.2600677115638 2 7 68 -1 -0.48922102072753 -0.5 -0.5 455266.27914787905 1
i 5 115.32464712249772 2 7.41666666666667 68 -1 -0.48490088515549 -0.5 -0.5 526008.5547551237 1
i 5 115.62061359559301 2 7.41666666666667 68 -1 0.45284828557114 -0.5 -0.5 464371.60473083664 1
i 4 116.53259726580643 2 6.5 68 -1 0.17043355136178 -0.5 -0.5 506594.1674977258 1
i 5 116.99224661487324 2 8.41666666666667 68 -1 0.47727903905332 -0.5 -0.5 447232.16833938705 1
i 5 117.15063262060234 2 6.91666666666667 68 -1 -0.15007420861623 -0.5 -0.5 506594.1674977258 1
i 4 117.22065033637637 2 7.75 68 -1 0.2256514802345 -0.5 -0.5 464371.60473083664 1
i 5 117.45965029800031 2 7.16666666666667 68 -1 0.01059428181273 -0.5 -0.5 516726.0508476803 1
i 5 117.58119622040556 2 7.25 68 -1 -0.4883436403558 -0.5 -0.5 471770.0694673063 1
i 5 117.74915548890351 2 7.25 68 -1 0.06946726151867 -0.5 -0.5 524958.6374801634 1
i 4 117.9909085616206 2 6.83333333333333 68 -1 -0.0042076921697 -0.5 -0.5 543988.8351384676 1
i 4 118.21888195055716 2 8 68 -1 0.36218783227417 -0.5 -0.5 447232.16833938705 1
i 5 118.36719084369939 2 7.75 68 -1 -0.15788262446337 -0.5 -0.5 524958.6374801634 1
i 4 118.80783155608948 2 6.91666666666667 68 -1 -0.5 -0.5 -0.5 481205.4708566524 1
i 5 118.80783155608948 2 6.83333333333333 68 -1 0.38691949916203 -0.5 -0.5 480244.9808948627 1
i 4 119.31337512371499 2 7.75 68 -1 -0.46131738715442 -0.5 -0.5 473659.0368254534 1
i 5 119.31337512371499 2 7.75 68 -1 0.42968117641253 -0.5 -0.5 472713.60960624093 1
i 4 119.95106085386658 2 8.41666666666667 68 -1 -0.05803931291429 -0.5 -0.5 447232.16833938705 1
i 5 119.95106085386658 2 8.41666666666667 68 -1 -0.07132258078392 -0.5 -0.5 447232.16833938705 1
i 4 120.54001045939891 2 7.25 68 -1 -0.26989380237945 -0.5 -0.5 472713.60960624093 1
i 4 120.79169921010518 2 7.83333333333333 68 -1 0.11330689181629 -0.5 -0.5 535457.8102297666 1
i 5 120.79169921010518 2 7.58333333333333 68 -1 0.18682296261632 -0.5 -0.5 534389.0321654357 1
i 4 121.76664579508282 2 6 68 -1 -0.17593402671669 -0.5 -0.5 471770.0694673063 1
i 4 122.68190170392337 2 7.33333333333333 68 -1 -0.03386823550073 -0.5 -0.5 534389.0321654357 1
i 4 122.83992529443216 2 6.66666666666667 68 -1 -0.43622496472792 -0.5 -0.5 543988.8351384676 1
i 5 123.49882469839226 2 7.33333333333333 68 -1 -0.12444315417756 -0.5 -0.5 472713.60960624093 1
i 5 123.9085370396073 2 6 68 -1 0.21567954119882 -0.5 -0.5 545076.8128087445 1
i 4 123.9085370396073 2 6.91666666666667 68 -1 0.35908403451251 -0.5 -0.5 543988.8351384676 1
i 4 125.26443366083792 2 6.41666666666667 68 -1 0.18310009138531 -0.5 -0.5 543988.8351384676 1
i 4 125.64071594291671 2 7.33333333333333 68 -1 -0.32579600474881 -0.5 -0.5 534389.0321654357 1
i 4 125.64071594291671 2 7.33333333333333 68 -1 0.44220660660212 -0.5 -0.5 534389.0321654357 1
i 5 125.88246901563383 2 6.83333333333333 68 -1 0.24460373064556 -0.5 -0.5 543988.8351384676 1
i 5 126.86735127860064 2 7 68 -1 -0.40507014679876 -0.5 -0.5 534389.0321654357 1
i 4 127.68427427306952 2 7 68 -1 0.4833167497337 -0.5 -0.5 472713.60960624093 1
i 5 128.3069773820396 2 6.75 68 -1 0.37594919764029 -0.5 -0.5 554868.6118412369 1
i 5 128.3069773820396 2 6.75 68 -1 -0.29024494336581 -0.5 -0.5 553761.0896619131 1
i 6 128.87502924826322 2 8.16666666666667 68 -1 0.16945816904352 -0.5 -0.5 3010020.995149032 1
i 5 129.28431101385286 2 7.41666666666667 68 -1 -0.1180936576655 -0.5 -0.5 472713.60960624093 1
i 5 131.37703580119148 2 7.25 68 -1 -0.4171957601325 -0.5 -0.5 482167.88179836574 1
i 5 131.37703580119148 2 7.25 68 -1 0.42984725129899 -0.5 -0.5 481205.4708566524 1
i 5 132.06312618950798 2 8.66666666666667 68 -1 0.39190190011002 -0.5 -0.5 2956902.9775875784 1
i 6 132.68116154430388 2 9 68 -1 -0.24761248251628 -0.5 -0.5 2951000.9756363058 1
i 6 132.99017922170182 2 9.5 68 -1 0.21904835842324 -0.5 -0.5 3010020.9951490317 1
i 6 132.99017922170182 2 9.25 68 -1 0.29944921610725 -0.5 -0.5 3004012.9692106107 1
i 4 133.15599411485113 2 6.58333333333333 68 -1 -0.13848134059015 -0.5 -0.5 553761.0896619131 1
i 6 133.60821457649774 2 9.66666666666667 68 -1 0.42758561933018 -0.5 -0.5 3004012.9692106107 1
i 5 133.60821457649774 2 9.66666666666667 68 -1 0.03255307741355 -0.5 -0.5 3004012.9692106107 1
i 5 134.36159382236542 2 8.25 68 -1 0.21215321091478 -0.5 -0.5 3016041.03713933 1
i 6 134.36159382236542 2 8.5 68 -1 -0.4426664888324 -0.5 -0.5 3010020.995149032 1
i 4 135.56248537586876 2 6.91666666666667 68 -1 0.25501953863189 -0.5 -0.5 481205.4708566524 1
i 5 135.5805024812569 2 6.41666666666667 68 -1 0.19787988005235 -0.5 -0.5 2215044.3586476524 1
i 6 135.70093936383637 2 9.5 68 -1 0.34377193819887 -0.5 -0.5 3004012.9692106107 1
i 5 137.10487610941652 2 8.33333333333333 68 -1 0.37113523299511 -0.5 -0.5 2956902.9775875784 1
i 5 137.30097610461965 2 9.91666666666667 68 -1 -0.06997830082701 -0.5 -0.5 3004012.9692106107 1
i 6 137.5496907636102 2 8 68 -1 0.27026080078431 -0.5 -0.5 2956902.9775875784 1
i 5 137.8587084410081 2 9 68 -1 -0.30675088532526 -0.5 -0.5 2956902.9775875784 1
i 6 138.00501084766267 2 6.41666666666667 68 -1 -0.42434619069511 -0.5 -0.5 2215044.3586476524 1
i 5 138.16772611840605 2 9.25 68 -1 0.41716040832533 -0.5 -0.5 2951000.9756363058 1
i 5 139.0196389247272 2 9.91666666666667 68 -1 0.45773119410344 -0.5 -0.5 3057977.2740467293 1
i 6 139.32865660212516 2 10.25 68 -1 0.5 -0.5 -0.5 3119136.8195276638 1
i 5 139.32865660212516 2 10.16666666666667 68 -1 -0.11632008269805 -0.5 -0.5 3112910.9975325987 1
i 6 139.3937008919583 2 9.83333333333333 68 -1 0.39756074812798 -0.5 -0.5 3064093.228594823 1
i 6 139.3937008919583 2 9.83333333333333 68 -1 0.3083761077364 -0.5 -0.5 3057977.2740467293 1
i 6 139.8200919390609 2 7.58333333333333 68 -1 0.12432148329939 -0.5 -0.5 2341248.435017947 1
i 6 139.9466919569211 2 10.58333333333333 68 -1 -0.13472861839722 -0.5 -0.5 3112910.9975325987 1
i 5 140.12910961645883 2 7.75 68 -1 0.31671798878965 -0.5 -0.5 2388073.403718306 1
i 6 140.12910961645883 2 7 68 -1 -0.34670488092491 -0.5 -0.5 2383306.79013803 1
i 6 140.42951921406845 2 6 68 -1 -0.22892309728305 -0.5 -0.5 2215044.3586476524 1
i 6 140.7377877048549 2 9.33333333333333 68 -1 0.43943677967299 -0.5 -0.5 2904722.3368066214 1
i 6 140.74714497125473 2 8.33333333333333 68 -1 -0.27211427434364 -0.5 -0.5 2383306.79013803 1
i 6 141.04755456886434 2 6.58333333333333 68 -1 0.39457272378429 -0.5 -0.5 2215044.3586476524 1
i 5 141.52843036706483 2 6 68 -1 -0.49224639392005 -0.5 -0.5 2705047.0505558043 1
i 6 143.03625533771236 2 9.16666666666667 68 -1 -0.29779401150893 -0.5 -0.5 2962816.7835427537 1
i 5 143.03625533771236 2 9 68 -1 0.29055671129305 -0.5 -0.5 2956902.9775875784 1
i 5 143.47206293527012 2 6.41666666666667 68 -1 0.26643290280294 -0.5 -0.5 2259345.2458206057 1
i 6 143.47206293527012 2 6.75 68 -1 0.00089522604176 -0.5 -0.5 2254835.5746712633 1
i 5 143.481069991906 2 9.5 68 -1 -0.3808277747708 -0.5 -0.5 2847766.9968692367 1
i 5 143.57915046663555 2 9.83333333333333 68 -1 -0.09490877798136 -0.5 -0.5 3057977.2740467293 1
i 5 143.76156812617333 2 6.75 68 -1 0.33804610487542 -0.5 -0.5 2299932.286164689 1
i 6 144.07058580357128 2 6.83333333333333 68 -1 -0.27005824377986 -0.5 -0.5 2345930.931887983 1
i 5 144.07058580357128 2 6.91666666666667 68 -1 -0.00218002480004 -0.5 -0.5 2341248.435017947 1
i 6 144.19718582143145 2 9.91666666666667 68 -1 -0.17649600918989 -0.5 -0.5 3057977.2740467293 1
i 5 144.5062034988294 2 10.08333333333333 68 -1 -0.33375131642505 -0.5 -0.5 3057977.2740467293 1
i 6 144.68862115836717 2 7.25 68 -1 -0.25352792305082 -0.5 -0.5 2341248.435017947 1
i 6 144.71652730830957 2 6.58333333333333 68 -1 -0.17056854179752 -0.5 -0.5 2657310.926134231 1
i 6 145.3066565131631 2 7.66666666666667 68 -1 0.1030537844581 -0.5 -0.5 2341248.435017947 1
i 6 145.3345626631055 2 6.91666666666667 68 -1 -0.29395330064599 -0.5 -0.5 2652006.9123096117 1
i 5 145.64358034050343 2 7.25 68 -1 0.34339810865907 -0.5 -0.5 2705047.050555804 1
i 6 145.64358034050343 2 7.33333333333333 68 -1 -0.37897397765349 -0.5 -0.5 2699647.7550457125 1
i 6 145.77953762476346 2 9.08333333333333 68 -1 -0.06834004588534 -0.5 -0.5 2904722.3368066214 1
i 6 146.26161569529933 2 7.83333333333333 68 -1 0.03564512517406 -0.5 -0.5 2699647.7550457125 1
i 6 146.26161569529933 2 7.83333333333333 68 -1 0.43908768428421 -0.5 -0.5 2699647.7550457125 1
i 6 147.014994941167 2 6.16666666666667 68 -1 0.03244389805795 -0.5 -0.5 2710457.1446569157 1
i 6 147.014994941167 2 6.25 68 -1 -0.16840356796538 -0.5 -0.5 2705047.0505558043 1
i 6 147.11312952477294 2 7.08333333333333 68 -1 -0.22822768399652 -0.5 -0.5 2341248.435017947 1
i 5 148.04058153381433 2 8 68 -1 0.24789740562078 -0.5 -0.5 2797512.2851597797 1
i 5 148.32107966808164 2 6.25 68 -1 0.05346243024627 -0.5 -0.5 2254835.5746712633 1
i 6 148.34959921121228 2 9.16666666666667 68 -1 0.22459813875919 -0.5 -0.5 2853462.5308629754 1
i 6 148.34959921121228 2 9.16666666666667 68 -1 -0.09618723141558 -0.5 -0.5 2847766.9968692367 1
i 6 148.35434048263795 2 7.83333333333333 68 -1 -0.12663674163863 -0.5 -0.5 2699647.7550457125 1
i 6 148.93911502287756 2 6.75 68 -1 -0.03391357105312 -0.5 -0.5 2254835.5746712633 1
i 6 148.9676345660082 2 9.58333333333333 68 -1 0.27657367812839 -0.5 -0.5 2847766.9968692367 1
i 6 149.24813270027553 2 6.75 68 -1 0.30835093151164 -0.5 -0.5 2299932.286164689 1
i 5 149.5376378911787 2 7 68 -1 0.46837588421916 -0.5 -0.5 2336575.284449049 1
i 5 149.7582772282181 2 6.41666666666667 68 -1 0.18090514285061 -0.5 -0.5 2657310.926134231 1
i 6 149.77939096389582 2 6.5 68 -1 -0.23688419842147 -0.5 -0.5 2421278.1283150176 1
i 6 149.9543772234213 2 7.83333333333333 68 -1 0.24001795967259 -0.5 -0.5 2699647.7550457125 1
i 6 150.1556732459746 2 7.41666666666667 68 -1 0.19919805787088 -0.5 -0.5 2336575.284449049 1
i 6 150.20309188241177 2 6.75 68 -1 0.49306919360246 -0.5 -0.5 2657310.926134231 1
i 6 150.51210955980974 2 6.91666666666667 68 -1 0.45240695135243 -0.5 -0.5 2657310.926134231 1
i 6 150.82112723720766 2 7.08333333333333 68 -1 -0.4369897325876 -0.5 -0.5 2652006.9123096117 1
i 6 151.67304004352883 2 7 68 -1 0.29383297173289 -0.5 -0.5 2748144.4213040187 1
i 6 151.98205772092675 2 8.08333333333333 68 -1 0.20093349555509 -0.5 -0.5 2803107.309730099 1
i 6 151.98205772092675 2 8.08333333333333 68 -1 0.02922343354987 -0.5 -0.5 2797512.2851597797 1
i 5 152.0471020107599 2 7.66666666666667 68 -1 0.30406691141995 -0.5 -0.5 2753640.710146627 1
i 5 152.0471020107599 2 7.66666666666667 68 -1 -0.33133714361931 -0.5 -0.5 2748144.4213040187 1
i 6 152.5801816123804 2 7.33333333333333 68 -1 -0.14254182708524 -0.5 -0.5 2383306.79013803 1
i 5 152.5801816123804 2 7.25 68 -1 -0.48622764767805 -0.5 -0.5 2378549.690756517 1
i 6 152.60009307572267 2 8.5 68 -1 -0.42460031459335 -0.5 -0.5 2797512.2851597797 1
i 6 153.21812843051856 2 8 68 -1 -0.47327685632546 -0.5 -0.5 2797512.2851597797 1
i 6 153.3911888236565 2 7.25 68 -1 -0.12290611313713 -0.5 -0.5 2610417.2039083326 1
i 6 153.5271461079165 2 9.08333333333333 68 -1 0.32813322465127 -0.5 -0.5 2797512.2851597797 1
i 6 154.4703841061986 2 7.08333333333333 68 -1 0.28684164896218 -0.5 -0.5 2378549.690756517 1
i 6 154.62840769670734 2 6.25 68 -1 -0.38281454790149 -0.5 -0.5 2421278.1283150176 1
i 6 155.02460144212844 2 8.33333333333333 68 -1 0.02630604762351 -0.5 -0.5 2797512.2851597797 1
i 5 155.68965645651397 2 6 68 -1 -0.13578380887568 -0.5 -0.5 2662625.5479864995 1
i 6 155.68965645651397 2 6.91666666666667 68 -1 0.35522130974147 -0.5 -0.5 2657310.926134231 1
i 6 155.6970194418825 2 6.66666666666667 68 -1 -0.03392319939913 -0.5 -0.5 2426120.6845716476 1
i 5 155.6970194418825 2 6.83333333333333 68 -1 -0.41118349500405 -0.5 -0.5 2421278.1283150176 1
i 5 156.1344711107076 2 7.33333333333333 68 -1 0.23868498933716 -0.5 -0.5 2559232.5528513063 1
i 5 156.23255158543714 2 7.58333333333333 68 -1 0.05300530908886 -0.5 -0.5 2748144.4213040187 1
i 6 156.85058694023306 2 7 68 -1 0.23714945655596 -0.5 -0.5 2748144.4213040187 1
i 5 157.05291606311314 2 6.16666666666667 68 -1 -0.22191248120341 -0.5 -0.5 2421278.1283150176 1
i 6 157.159604617631 2 8 68 -1 -0.07544517864386 -0.5 -0.5 2748144.4213040187 1
i 5 157.42919834519194 2 7.08333333333333 68 -1 -0.22430964450423 -0.5 -0.5 2378549.690756517 1
i 6 157.42919834519194 2 7.08333333333333 68 -1 -0.20288777965912 -0.5 -0.5 2378549.690756517 1
i 6 157.44910980853422 2 8.41666666666667 68 -1 0.16639446260914 -0.5 -0.5 2791928.4283031733 1
i 6 157.670951417909 2 6.83333333333333 68 -1 0.26539601096378 -0.5 -0.5 2421278.1283150176 1
i 5 158.43293874356505 2 7.08333333333333 68 -1 0.10120285550102 -0.5 -0.5 2610417.2039083326 1
i 6 158.65583368087584 2 6.66666666666667 68 -1 -0.0591009133475 -0.5 -0.5 2378549.690756517 1
i 6 159.26419089993243 2 9.75 68 -1 -0.39994049006325 -0.5 -0.5 2951000.975636306 1
i 5 159.57320857733035 2 9 68 -1 -0.26227520837201 -0.5 -0.5 3010020.995149032 1
i 5 159.57320857733035 2 9.66666666666667 68 -1 0.32551455816198 -0.5 -0.5 3004012.969210611 1
i 6 159.87361817494 2 8 68 -1 -0.14342951991008 -0.5 -0.5 2791928.4283031733 1
i 5 160.0954597843148 2 6.41666666666667 68 -1 0.15351459970023 -0.5 -0.5 2469703.690881318 1
i 5 160.0954597843148 2 6.5 68 -1 0.14222437964025 -0.5 -0.5 2464774.1425961256 1
i 6 160.19124393212627 2 10.08333333333333 68 -1 0.27198520343713 -0.5 -0.5 3004012.969210611 1
i 6 160.49165352973588 2 8.58333333333333 68 -1 -0.46241291543298 -0.5 -0.5 2791928.4283031733 1
i 6 160.69398265261594 2 6.83333333333333 68 -1 0.08928604151308 -0.5 -0.5 2514069.625448048 1
i 6 161.0030003300139 2 7.33333333333333 68 -1 -0.16954138639094 -0.5 -0.5 2564351.017957009 1
i 5 161.0030003300139 2 7.33333333333333 68 -1 -0.42179761874707 -0.5 -0.5 2559232.5528513063 1
i 5 161.6210356848098 2 7.5 68 -1 -0.0072733182232 -0.5 -0.5 2559232.5528513063 1
i 6 162.91616189614166 2 8.5 68 -1 0.33822655370112 -0.5 -0.5 2847766.9968692367 1
i 6 162.91616189614166 2 8.58333333333333 68 -1 -0.02273885517778 -0.5 -0.5 2842082.8312068232 1
i 6 163.20566708704487 2 8.58333333333333 68 -1 -0.23542873759704 -0.5 -0.5 2898924.4878309597 1
i 6 163.38051797030144 2 6.66666666666667 68 -1 0.28211999092995 -0.5 -0.5 3456954.6606092784 1
i 5 163.5146847644428 2 8 68 -1 -0.167949137453 -0.5 -0.5 2956902.977587579 1
i 6 163.5146847644428 2 8.91666666666667 68 -1 0.04529194944378 -0.5 -0.5 2951000.975636306 1
i 6 164.1327201192387 2 9.25 68 -1 -0.0247540399081 -0.5 -0.5 2951000.975636306 1
i 6 164.7507554740346 2 9.75 68 -1 0.43043392450974 -0.5 -0.5 2951000.975636306 1
i 6 164.94447651712633 2 6.16666666666667 68 -1 0.09887165463253 -0.5 -0.5 2464774.1425961256 1
i 6 165.56251187192225 2 6.75 68 -1 0.06874180952761 -0.5 -0.5 2464774.1425961256 1
i 6 165.8715295493202 2 6.83333333333333 68 -1 -0.05737379673769 -0.5 -0.5 2514069.625448048 1
i 6 166.18054722671815 2 7 68 -1 0.44300563358173 -0.5 -0.5 2514069.625448048 1
i 6 166.5572284856445 2 9.25 68 -1 -0.06680659555255 -0.5 -0.5 2951000.975636306 1
i 6 167.76517862895318 2 8.25 68 -1 0.19068845593676 -0.5 -0.5 2842082.8312068232 1
i 6 168.0715111126042 2 7.25 68 -1 -0.38200838265422 -0.5 -0.5 3395949.5783632323 1
i 6 168.229534703113 2 6.66666666666667 68 -1 -0.19731658409393 -0.5 -0.5 3456954.6606092784 1
i 6 168.3832139837491 2 8.58333333333333 68 -1 -0.0611136413943 -0.5 -0.5 2842082.8312068232 1
i 5 168.69223166114705 2 8.75 68 -1 -0.32499467934314 -0.5 -0.5 2898924.4878309597 1
i 5 168.98173685205023 2 9.08333333333333 68 -1 0.25188842423443 -0.5 -0.5 2945110.75412805 1
i 5 169.22348992476736 2 8.5 68 -1 -0.06332264102664 -0.5 -0.5 3051873.5269927448 1
i 6 169.29814644828812 2 6.83333333333333 68 -1 -0.4115847408029 -0.5 -0.5 3463868.569930497 1
i 5 169.29814644828812 2 6 68 -1 0.15830715989851 -0.5 -0.5 3456954.6606092784 1
i 6 169.59977220684615 2 9.41666666666667 68 -1 0.20176075719979 -0.5 -0.5 2945110.75412805 1
i 5 170.65404306951876 2 6.66666666666667 68 -1 0.14039271942468 -0.5 -0.5 3456954.6606092784 1
i 5 171.03032535159755 2 7.25 68 -1 -0.16192728513036 -0.5 -0.5 3395949.5783632323 1
i 6 172.0242805732519 2 9.25 68 -1 -0.27905550354022 -0.5 -0.5 3004012.969210611 1
i 6 172.0242805732519 2 9.25 68 -1 0.00194250922315 -0.5 -0.5 2998016.9353399314 1
i 6 172.2569606872815 2 6.83333333333333 68 -1 0.35597598342132 -0.5 -0.5 3395949.5783632323 1
i 6 172.46912416091698 2 7.58333333333333 68 -1 0.1661162309543 -0.5 -0.5 3653917.6551844925 1
i 5 172.6919021314869 2 6.75 68 -1 -0.06080572564285 -0.5 -0.5 3336021.0563921165 1
i 6 172.77814183831492 2 7.75 68 -1 -0.01946496869574 -0.5 -0.5 3726996.0082881823 1
i 6 172.77814183831492 2 7.83333333333333 68 -1 0.18776036757001 -0.5 -0.5 3719556.894499184 1
i 6 173.07855143592454 2 6.16666666666667 68 -1 -0.21026502328988 -0.5 -0.5 3456954.6606092784 1
i 6 173.39617719311082 2 8.33333333333333 68 -1 0.44644232676428 -0.5 -0.5 3719556.894499184 1
i 5 173.69658679072043 2 6.66666666666667 68 -1 -0.26343078369716 -0.5 -0.5 3456954.6606092784 1
i 5 173.77995385770842 2 7.58333333333333 68 -1 -0.49026475045612 -0.5 -0.5 3162506.5412919186 1
i 5 173.91448306707014 2 9 68 -1 -0.421724049057 -0.5 -0.5 2998016.9353399314 1
i 6 174.07250665757888 2 8.25 68 -1 0.2152301930408 -0.5 -0.5 3051873.5269927448 1
i 6 174.1105860308527 2 6.91666666666667 68 -1 -0.31210762833615 -0.5 -0.5 3402741.4775199587 1
i 6 174.1105860308527 2 6 68 -1 -0.16270791852394 -0.5 -0.5 3395949.5783632323 1
i 6 175.14111840275402 2 8.83333333333333 68 -1 -0.29538050472231 -0.5 -0.5 3057977.2740467303 1
i 6 175.14111840275402 2 8.83333333333333 68 -1 -0.48220246224703 -0.5 -0.5 3051873.5269927448 1
i 6 176.1210951571262 2 6.66666666666667 68 -1 0.15777536284447 -0.5 -0.5 3526093.753821464 1
i 5 176.1210951571262 2 6.58333333333333 68 -1 0.05007902724361 -0.5 -0.5 3519055.642536391 1
i 6 176.41060034802942 2 6.91666666666667 68 -1 -0.36630473521733 -0.5 -0.5 3589436.755387119 1
i 5 176.49701502398466 2 8.08333333333333 68 -1 0.23302333595542 -0.5 -0.5 3051873.5269927448 1
i 5 176.71961802542737 2 6 68 -1 -0.33032207797348 -0.5 -0.5 3661225.4904948613 1
i 5 176.71961802542737 2 6 68 -1 0.45896000675291 -0.5 -0.5 3653917.6551844925 1
i 6 176.87329730606348 2 9 68 -1 -0.439216432346 -0.5 -0.5 2998016.9353399314 1
i 6 176.87329730606348 2 9 68 -1 -0.01294231036522 -0.5 -0.5 2998016.9353399314 1
i 6 176.94795382958424 2 7.25 68 -1 -0.49155771544269 -0.5 -0.5 3395949.5783632323 1
i 6 177.11505037878055 2 8.83333333333333 68 -1 0.17331167061017 -0.5 -0.5 3051873.5269927448 1
i 6 177.32771770223408 2 6.58333333333333 68 -1 0.13509772765027 -0.5 -0.5 3336021.0563921165 1
i 5 177.32771770223408 2 6.58333333333333 68 -1 -0.41241829765459 -0.5 -0.5 3336021.0563921165 1
i 5 177.33765338022326 2 7.33333333333333 68 -1 0.4110852213284 -0.5 -0.5 3653917.6551844925 1
i 6 177.95568873501918 2 7.83333333333333 68 -1 0.08583622874522 -0.5 -0.5 3653917.6551844925 1
i 6 177.9654034323857 2 7.58333333333333 68 -1 -0.24606308596739 -0.5 -0.5 3162506.5412919186 1
i 5 178.0999326417474 2 8.66666666666667 68 -1 -0.39712278977747 -0.5 -0.5 2998016.9353399314 1
i 6 178.4709470000112 2 8 68 -1 0.06316384397751 -0.5 -0.5 3106697.602327944 1
i 5 178.74640160159987 2 6.75 68 -1 0.11259840430666 -0.5 -0.5 3336021.0563921165 1
i 6 179.53955874518635 2 8.5 68 -1 0.39904631069142 -0.5 -0.5 3112910.9975325996 1
i 5 179.53955874518635 2 8.58333333333333 68 -1 -0.41593641470917 -0.5 -0.5 3106697.602327944 1
i 5 179.6975823356951 2 7.83333333333333 68 -1 0.23402705717817 -0.5 -0.5 3168831.5543745025 1
i 6 179.6975823356951 2 7.83333333333333 68 -1 -0.23073242966202 -0.5 -0.5 3162506.5412919186 1
i 5 179.76216174662903 2 7.25 68 -1 0.35749595263506 -0.5 -0.5 3653917.6551844925 1
i 6 180.05812821972432 2 7.33333333333333 68 -1 -0.21283695661092 -0.5 -0.5 3225756.672117757 1
i 6 180.97011188993773 2 6.25 68 -1 -0.08408762478858 -0.5 -0.5 3519055.642536391 1
i 5 181.42976123900453 2 8 68 -1 -0.04306655371826 -0.5 -0.5 3106697.602327944 1
i 6 181.58814724473365 2 6.66666666666667 68 -1 0.11563412725275 -0.5 -0.5 3519055.642536391 1
i 6 181.65816496050766 2 7.58333333333333 68 -1 -0.02070477879517 -0.5 -0.5 3225756.672117757 1
i 6 181.8971649221316 2 6.91666666666667 68 -1 -0.23468569575996 -0.5 -0.5 3589436.755387119 1
i 6 182.01871084453686 2 7.08333333333333 68 -1 -0.43588736243761 -0.5 -0.5 3277150.0965734324 1
i 5 182.18667011303478 2 7.08333333333333 68 -1 -0.33775569399996 -0.5 -0.5 3646624.406371749 1
i 5 182.4284231857519 2 6.58333333333333 68 -1 0.02627800644894 -0.5 -0.5 3778817.6465324517 1
i 6 182.65639657468844 2 7.75 68 -1 -0.11548423770009 -0.5 -0.5 3106697.602327944 1
i 5 182.8047054678307 2 7.91666666666667 68 -1 0.48779133743098 -0.5 -0.5 3646624.406371749 1
i 6 183.2453461802208 2 6.83333333333333 68 -1 0.15291242761959 -0.5 -0.5 3342693.098504901 1
i 6 183.2453461802208 2 6.75 68 -1 0.07428281708737 -0.5 -0.5 3336021.0563921165 1
i 5 183.7508897478463 2 7.5 68 -1 -0.43764988109028 -0.5 -0.5 3290271.8055601125 1
i 6 183.7508897478463 2 7.75 68 -1 -0.34858907664595 -0.5 -0.5 3283704.3967665792 1
i 6 184.38857547799788 2 8.58333333333333 68 -1 0.3515398660015 -0.5 -0.5 3106697.602327944 1
i 6 184.38857547799788 2 8.58333333333333 68 -1 -0.23004364220147 -0.5 -0.5 3106697.602327944 1
i 6 184.9775250835302 2 7.25 68 -1 -0.4640082048062 -0.5 -0.5 3283704.3967665792 1
i 6 185.22921383423648 2 7.33333333333333 68 -1 0.40618745942613 -0.5 -0.5 3719556.894499184 1
i 5 185.22921383423648 2 7.91666666666667 68 -1 0.40551299577101 -0.5 -0.5 3712132.629240703 1
i 6 186.20416041921413 2 6.83333333333333 68 -1 -0.42097373373663 -0.5 -0.5 3277150.0965734324 1
i 5 187.11941632805468 2 7.08333333333333 68 -1 0.23199890705978 -0.5 -0.5 3712132.629240703 1
i 6 187.27743991856343 2 6.33333333333333 68 -1 -0.05104262197818 -0.5 -0.5 3778817.6465324517 1
i 5 187.93633932252357 2 7.25 68 -1 -0.36759537374024 -0.5 -0.5 3283704.3967665792 1
i 6 188.3460516637386 2 6.75 68 -1 0.2439841477161 -0.5 -0.5 3786375.281825517 1
i 6 188.3460516637386 2 6.83333333333333 68 -1 -0.43133070334018 -0.5 -0.5 3778817.6465324517 1
i 6 189.70194828496923 2 6.25 68 -1 -0.34160689141039 -0.5 -0.5 3778817.6465324517 1
i 5 190.07823056704802 2 7.08333333333333 68 -1 0.26451177073755 -0.5 -0.5 3712132.629240703 1
i 6 190.07823056704802 2 7.08333333333333 68 -1 -0.22904595510029 -0.5 -0.5 3712132.629240703 1
i 6 190.3199836397651 2 6.83333333333333 68 -1 0.43793239686479 -0.5 -0.5 3778817.6465324517 1
i 5 191.30486590273193 2 6.91666666666667 68 -1 0.21519113846766 -0.5 -0.5 3712132.629240703 1
i 6 192.1217888972008 2 6.75 68 -1 -0.43124254711347 -0.5 -0.5 3283704.3967665792 1
i 6 192.7444920061709 2 6.5 68 -1 0.45035883891034 -0.5 -0.5 3854393.999463101 1
i 6 192.7444920061709 2 6.5 68 -1 0.19166408434735 -0.5 -0.5 3846700.5982665676 1
i 6 193.72182563798415 2 7.25 68 -1 0.14274351270091 -0.5 -0.5 3283704.3967665792 1
i 5 195.81455042532278 2 7.08333333333333 68 -1 -0.33017629601165 -0.5 -0.5 3349378.484701911 1
i 6 195.81455042532278 2 7.16666666666667 68 -1 0.17752511790683 -0.5 -0.5 3342693.0985049014 1
i 6 197.5935087389824 2 6.25 68 -1 -0.15905034938649 -0.5 -0.5 3846700.5982665676 1
i 6 200 2 6.83333333333333 68 -1 0.40070388102387 -0.5 -0.5 3342693.0985049014 1
</CsScore>
</CsoundSynthesizer>
