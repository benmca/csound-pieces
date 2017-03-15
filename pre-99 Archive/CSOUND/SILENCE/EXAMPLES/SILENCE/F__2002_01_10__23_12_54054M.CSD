<CsoundSynthesizer>
<CsOptions>
csound -RWdo C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-10--23-12-54.054.mml.wav C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-10--23-12-54.054.mml.orc C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-10--23-12-54.054.mml.sco
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
i 4 0 2 6 68 -1 -0.49526723732129 -0.5 -0.5 2869 1
i 4 0.27285129604366 2 6 68 -1 -0.08094277288901 -0.5 -0.5 2869 1
i 4 0.54570259208731 2 6 68 -1 -0.17856676285302 -0.5 -0.5 2869 1
i 4 0.81855388813097 2 6 68 -1 0.4945808408997 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6 68 -1 -0.15122424453693 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6.33333333333333 68 -1 -0.30563821592598 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6 68 -1 -0.0054675834739 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 8.33333333333333 68 -1 -0.16279858508447 -0.5 -0.5 367232 1
i 4 1.36425648021828 2 6 68 -1 -0.23831696128081 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 6 68 -1 0.15390624574862 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 6.66666666666667 68 -1 0.03438075432068 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 7.16666666666667 68 -1 0.47423403639413 -0.5 -0.5 2869 1
i 5 1.36425648021828 2 7.66666666666667 68 -1 0.45193525121754 -0.5 -0.5 2869 1
i 4 1.36425648021828 2 6.33333333333333 68 -1 0.38484349420952 -0.5 -0.5 2869 1
i 4 1.36425648021828 2 8.33333333333333 68 -1 -0.36405305937713 -0.5 -0.5 367232 1
i 4 1.63710777626194 2 6.33333333333333 68 -1 0.19459338468409 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 6.66666666666667 68 -1 -0.04650696304344 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 6.33333333333333 68 -1 -0.06662945395178 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 8.33333333333333 68 -1 -0.43441685900333 -0.5 -0.5 367232 1
i 4 1.90995907230559 2 6.33333333333333 68 -1 -0.2407687693087 -0.5 -0.5 2869 1
i 4 1.90995907230559 2 6 68 -1 0.20886468952707 -0.5 -0.5 2869 1
i 4 1.90995907230559 2 8.33333333333333 68 -1 -0.44982367535932 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 6 68 -1 0.4081385032863 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 6.33333333333333 68 -1 0.065379411016 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 6 68 -1 -0.13819644603078 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 8.33333333333333 68 -1 0.22738380176399 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 8.58333333333333 68 -1 -0.30534411093492 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 8.33333333333333 68 -1 -0.47408011240517 -0.5 -0.5 367232 1
i 4 2.45566166439291 2 6 68 -1 -0.06976220043311 -0.5 -0.5 2869 1
i 4 2.45566166439291 2 8.33333333333333 68 -1 -0.15676795994433 -0.5 -0.5 367232 1
i 5 2.45566166439291 2 8.33333333333333 68 -1 -0.44292719020677 -0.5 -0.5 367232 1
i 5 2.45566166439291 2 8.91666666666667 68 -1 0.25096161838834 -0.5 -0.5 367232 1
i 6 2.45566166439291 2 9.5 68 -1 -0.47568820368587 -0.5 -0.5 367232 1
i 5 2.45566166439291 2 10 68 -1 -0.2587588685198 -0.5 -0.5 367232 1
i 4 2.45566166439291 2 8.58333333333333 68 -1 0.21816547308284 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 6 68 -1 -0.06710732253703 -0.5 -0.5 2869 1
i 4 2.72851296043656 2 8.58333333333333 68 -1 0.06747315137746 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 8.91666666666667 68 -1 -0.16207809036913 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 8.58333333333333 68 -1 -0.47449954966544 -0.5 -0.5 367232 1
i 4 3.00136425648022 2 6 68 -1 -0.00604916363576 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 6.33333333333333 68 -1 -0.43268686264927 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 6 68 -1 0.21570086548098 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 8.58333333333333 68 -1 0.36166893293718 -0.5 -0.5 367232 1
i 4 3.00136425648022 2 8.33333333333333 68 -1 0.12986865112321 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 6 68 -1 0.09088349039876 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 6 68 -1 -0.13138299004457 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 6.66666666666667 68 -1 -0.11587909381383 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 7.16666666666667 68 -1 -0.40614763948356 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 7.66666666666667 68 -1 0.03875606406603 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 6 68 -1 -0.36316849818397 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 6.66666666666667 68 -1 -0.32846255527549 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 7.16666666666667 68 -1 -0.45156280087465 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 7.66666666666667 68 -1 0.00600302455832 -0.5 -0.5 2869 1
i 4 3.27421555252387 2 6.33333333333333 68 -1 -0.29466888419489 -0.5 -0.5 2869 1
i 4 3.27421555252387 2 8.33333333333333 68 -1 -0.35495154917545 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 8.58333333333333 68 -1 0.30488712990884 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 8.33333333333333 68 -1 0.27669559137734 -0.5 -0.5 367232 1
i 4 3.54706684856753 2 6.33333333333333 68 -1 0.46382253207547 -0.5 -0.5 2869 1
i 4 3.54706684856753 2 8.33333333333333 68 -1 -0.43798092818382 -0.5 -0.5 367232 1
i 4 3.81991814461119 2 6.33333333333333 68 -1 0.48021432667339 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 6.66666666666667 68 -1 -0.20568752056152 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 6.33333333333333 68 -1 0.17698333579206 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 8.33333333333333 68 -1 -0.15824924593814 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 7.66666666666667 68 -1 0.02266084181245 -0.5 -0.5 2869 1
i 3 4.09276944065484 2 8 68 -1 -0.1472977143112 -0.5 -0.5 2869 1
i 3 4.09276944065484 2 7.66666666666667 68 -1 0.30785998317796 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 6.33333333333333 68 -1 -0.01533330916987 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 6.33333333333333 68 -1 0.41801767146028 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 6.91666666666667 68 -1 0.46662734328908 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 7.41666666666667 68 -1 0.08654414622285 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 8 68 -1 0.0623878195956 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 6.66666666666667 68 -1 -0.06485947566899 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 8.33333333333333 68 -1 0.03716218289746 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 8.58333333333333 68 -1 -0.42140222658063 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 8.33333333333333 68 -1 0.41434134349047 -0.5 -0.5 367232 1
i 3 4.3656207366985 2 7.66666666666667 68 -1 0.1792507248905 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.66666666666667 68 -1 -0.21971958679127 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.91666666666667 68 -1 0.06070252991752 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.66666666666667 68 -1 0.06012494078223 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 8.33333333333333 68 -1 -0.23676198927904 -0.5 -0.5 367232 1
i 5 4.3656207366985 2 8.33333333333333 68 -1 -0.15929104113669 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 8.91666666666667 68 -1 -0.0579058274416 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 9.5 68 -1 -0.14394674794556 -0.5 -0.5 367232 1
i 5 4.3656207366985 2 10 68 -1 0.14166835109054 -0.5 -0.5 367232 1
i 5 4.3656207366985 2 8.33333333333333 68 -1 -0.06035239802956 -0.5 -0.5 367232 1
i 5 4.3656207366985 2 8.91666666666667 68 -1 -0.08185331594843 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 9.5 68 -1 -0.05310638169942 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 10 68 -1 -0.37976400338905 -0.5 -0.5 367232 1
i 4 4.3656207366985 2 8.58333333333333 68 -1 -0.20492337304947 -0.5 -0.5 367232 1
i 4 4.63847203274216 2 6.66666666666667 68 -1 0.21272348517491 -0.5 -0.5 2869 1
i 4 4.63847203274216 2 6.33333333333333 68 -1 -0.3280708358045 -0.5 -0.5 2869 1
i 4 4.63847203274216 2 8.58333333333333 68 -1 0.42740255273839 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 6.33333333333333 68 -1 -0.34114133839785 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 6.66666666666667 68 -1 0.37913438982098 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 6.33333333333333 68 -1 -0.1153615402074 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 8.58333333333333 68 -1 -0.36814587107714 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 8.91666666666667 68 -1 0.19552048094595 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 8.58333333333333 68 -1 -0.10570739098845 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 6.33333333333333 68 -1 0.36346285177624 -0.5 -0.5 2869 1
i 3 5.18417462482947 2 10 68 -1 0.30074993292411 -0.5 -0.5 367232 1
i 3 5.18417462482947 2 10.33333333333333 68 -1 -0.04187726473832 -0.5 -0.5 367232 1
i 3 5.18417462482947 2 10 68 -1 0.07103016880787 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 8.58333333333333 68 -1 0.29142140618669 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 8.58333333333333 68 -1 0.02371478876541 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 9.25 68 -1 0.40057350536575 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 9.75 68 -1 0.1009532847907 -0.5 -0.5 367232 1
i 5 5.18417462482947 2 10.33333333333333 68 -1 -0.19231089470118 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 8.91666666666667 68 -1 -0.17022948802991 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 6.33333333333333 68 -1 0.31045286920211 -0.5 -0.5 2869 1
i 3 5.45702592087312 2 10 68 -1 -0.25963945744004 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 8.91666666666667 68 -1 -0.29075805042563 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 9.25 68 -1 -0.37760725619544 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 8.91666666666667 68 -1 -0.32654681947347 -0.5 -0.5 367232 1
i 4 5.72987721691678 2 6.33333333333333 68 -1 -0.00482255284132 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 6.66666666666667 68 -1 0.04539820834818 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 6.33333333333333 68 -1 0.29038186076596 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 8.91666666666667 68 -1 0.22149020950123 -0.5 -0.5 367232 1
i 4 5.72987721691678 2 8.58333333333333 68 -1 0.4518495904054 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 6.33333333333333 68 -1 0.11852384696897 -0.5 -0.5 2869 1
i 5 6.00272851296044 2 6.33333333333333 68 -1 0.08651787350457 -0.5 -0.5 2869 1
i 5 6.00272851296044 2 6.91666666666667 68 -1 0.15217105731935 -0.5 -0.5 2869 1
i 6 6.00272851296044 2 7.41666666666667 68 -1 0.22581081424059 -0.5 -0.5 2869 1
i 6 6.00272851296044 2 8 68 -1 0.38010224608878 -0.5 -0.5 2869 1
i 4 6.00272851296044 2 6 68 -1 -0.39673598273545 -0.5 -0.5 2869 1
i 4 6.00272851296044 2 8.58333333333333 68 -1 0.42146041709971 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 8.91666666666667 68 -1 0.02039840240537 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 8.58333333333333 68 -1 -0.22657138463145 -0.5 -0.5 367232 1
i 4 6.27557980900409 2 6 68 -1 -0.08728065374975 -0.5 -0.5 2869 1
i 4 6.27557980900409 2 8.58333333333333 68 -1 -0.3371164248914 -0.5 -0.5 367232 1
i 4 6.54843110504775 2 6 68 -1 -0.00225686955425 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 6.33333333333333 68 -1 -0.13481575456427 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 6 68 -1 -0.10109062809053 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 8.58333333333333 68 -1 0.4432126354503 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 6 68 -1 0.22136736981575 -0.5 -0.5 2869 1
i 5 6.82128240109141 2 6 68 -1 -0.3224143044074 -0.5 -0.5 2869 1
i 6 6.82128240109141 2 6.66666666666667 68 -1 0.28974272525079 -0.5 -0.5 2869 1
i 5 6.82128240109141 2 7.16666666666667 68 -1 0.31603079399562 -0.5 -0.5 2869 1
i 6 6.82128240109141 2 7.66666666666667 68 -1 -0.20120996278276 -0.5 -0.5 2869 1
i 4 6.82128240109141 2 6.33333333333333 68 -1 -0.43521521257471 -0.5 -0.5 2869 1
i 4 6.82128240109141 2 8.58333333333333 68 -1 -0.16999673533959 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 8.91666666666667 68 -1 0.46755573271579 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 8.58333333333333 68 -1 -0.21432697166102 -0.5 -0.5 367232 1
i 4 7.09413369713506 2 6.33333333333333 68 -1 0.41532424231098 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 6.66666666666667 68 -1 -0.06687987230202 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 6.33333333333333 68 -1 -0.29762750104976 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 8.58333333333333 68 -1 -0.04667093861376 -0.5 -0.5 367232 1
i 5 7.09413369713506 2 8.58333333333333 68 -1 -0.08505317995592 -0.5 -0.5 367232 1
i 6 7.09413369713506 2 9.25 68 -1 -0.11813644868104 -0.5 -0.5 367232 1
i 6 7.09413369713506 2 9.75 68 -1 -0.21712191433847 -0.5 -0.5 367232 1
i 5 7.09413369713506 2 10.33333333333333 68 -1 -0.0345463038997 -0.5 -0.5 367232 1
i 4 7.09413369713506 2 8.33333333333333 68 -1 0.27287283036291 -0.5 -0.5 367232 1
i 4 7.36698499317872 2 6.33333333333333 68 -1 0.02240126292667 -0.5 -0.5 2869 1
i 4 7.36698499317872 2 6 68 -1 -0.15346583222899 -0.5 -0.5 2869 1
i 4 7.36698499317872 2 8.33333333333333 68 -1 0.12862791499439 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 6 68 -1 -0.40557786154097 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 6.33333333333333 68 -1 0.4055635535233 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 6 68 -1 -0.04912609878321 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 8.33333333333333 68 -1 0.43267878547837 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 8.58333333333333 68 -1 -0.07926739018053 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 8.33333333333333 68 -1 0.35705075625543 -0.5 -0.5 367232 1
i 4 7.91268758526603 2 6 68 -1 0.17518284174825 -0.5 -0.5 2869 1
i 4 7.91268758526603 2 8.33333333333333 68 -1 -0.17798381974005 -0.5 -0.5 367232 1
i 5 7.91268758526603 2 8.33333333333333 68 -1 0.2239826570379 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 8.91666666666667 68 -1 0.08360842149475 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 9.5 68 -1 0.13892156169095 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 10 68 -1 0.27744918722062 -0.5 -0.5 367232 1
i 4 7.91268758526603 2 8.58333333333333 68 -1 -0.12560018903927 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 6 68 -1 -0.27849236142204 -0.5 -0.5 2869 1
i 4 8.18553888130969 2 8.58333333333333 68 -1 -0.23826820400158 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 8.91666666666667 68 -1 0.18572710295039 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 8.58333333333333 68 -1 0.10487468955348 -0.5 -0.5 367232 1
i 4 8.45839017735334 2 6 68 -1 0.3902023577373 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 6.33333333333333 68 -1 -0.31275386171262 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 6 68 -1 0.31150570321859 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 8.58333333333333 68 -1 -0.28417664536215 -0.5 -0.5 367232 1
i 4 8.45839017735334 2 8.33333333333333 68 -1 -0.20919820725353 -0.5 -0.5 367232 1
i 4 8.731241473397 2 6 68 -1 -0.43868701018703 -0.5 -0.5 2869 1
i 5 8.731241473397 2 6 68 -1 -0.16904229305364 -0.5 -0.5 2869 1
i 6 8.731241473397 2 6.66666666666667 68 -1 0.17288958792769 -0.5 -0.5 2869 1
i 5 8.731241473397 2 7.16666666666667 68 -1 0.39166466240691 -0.5 -0.5 2869 1
i 5 8.731241473397 2 7.66666666666667 68 -1 -0.31792255307216 -0.5 -0.5 2869 1
i 4 8.731241473397 2 8.33333333333333 68 -1 0.38822890378717 -0.5 -0.5 367232 1
i 4 8.731241473397 2 8.58333333333333 68 -1 -0.00720840928509 -0.5 -0.5 367232 1
i 4 8.731241473397 2 8.33333333333333 68 -1 0.46437516478508 -0.5 -0.5 367232 1
i 4 9.00409276944066 2 6 68 -1 -0.00388465847544 -0.5 -0.5 2869 1
i 4 9.00409276944066 2 8.33333333333333 68 -1 0.33452747574098 -0.5 -0.5 367232 1
i 4 9.27694406548431 2 6 68 -1 -0.23085560791493 -0.5 -0.5 2869 1
i 4 9.27694406548431 2 8.33333333333333 68 -1 -0.33929704911406 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 6 68 -1 -0.4567059555146 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 6.33333333333333 68 -1 -0.11228361903838 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 6 68 -1 0.41247508510262 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 8.33333333333333 68 -1 0.39437002455134 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 8.58333333333333 68 -1 0.03313102316127 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 8.33333333333333 68 -1 0.48982306086484 -0.5 -0.5 367232 1
i 4 9.82264665757162 2 6 68 -1 -0.23683729229087 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 6 68 -1 -0.31746694422198 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 6.66666666666667 68 -1 -0.0235865171946 -0.5 -0.5 2869 1
i 5 9.82264665757162 2 7.16666666666667 68 -1 -0.19568529816294 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 7.66666666666667 68 -1 0.27983298970088 -0.5 -0.5 2869 1
i 4 9.82264665757162 2 6.33333333333333 68 -1 -0.47869241871733 -0.5 -0.5 2869 1
i 4 9.82264665757162 2 8.33333333333333 68 -1 -0.45572642044791 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 8.33333333333333 68 -1 -0.06428690132929 -0.5 -0.5 367232 1
i 6 9.82264665757162 2 8.91666666666667 68 -1 -0.45527447531472 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 9.5 68 -1 0.40501555327593 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 10 68 -1 0.25692668163866 -0.5 -0.5 367232 1
i 4 10.09549795361528 2 6.33333333333333 68 -1 0.16682271579834 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 6.66666666666667 68 -1 0.07534836887838 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 6.33333333333333 68 -1 -0.01083524460374 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 8.33333333333333 68 -1 0.35295322394886 -0.5 -0.5 367232 1
i 4 10.36834924965894 2 6.33333333333333 68 -1 -0.12901508712133 -0.5 -0.5 2869 1
i 4 10.36834924965894 2 6 68 -1 0.34172164424901 -0.5 -0.5 2869 1
i 4 10.36834924965894 2 8.33333333333333 68 -1 0.12311126175099 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 6 68 -1 0.28972668266021 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 6.33333333333333 68 -1 0.07929440308565 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 6 68 -1 -0.21663869387259 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 8.33333333333333 68 -1 -0.19313644930567 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 8.58333333333333 68 -1 -0.16270847972388 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 8.33333333333333 68 -1 -0.08451391256219 -0.5 -0.5 367232 1
i 4 10.91405184174625 2 6 68 -1 0.2220361958066 -0.5 -0.5 2869 1
i 4 10.91405184174625 2 8.33333333333333 68 -1 -0.18902006170599 -0.5 -0.5 367232 1
i 5 10.91405184174625 2 8.33333333333333 68 -1 -0.29149311008381 -0.5 -0.5 367232 1
i 6 10.91405184174625 2 8.91666666666667 68 -1 0.11820555114451 -0.5 -0.5 367232 1
i 6 10.91405184174625 2 9.5 68 -1 -0.22523986190644 -0.5 -0.5 367232 1
i 6 10.91405184174625 2 10 68 -1 0.31308511983908 -0.5 -0.5 367232 1
i 4 10.91405184174625 2 8.58333333333333 68 -1 0.21763782131892 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 6 68 -1 0.40987524539427 -0.5 -0.5 2869 1
i 4 11.1869031377899 2 8.58333333333333 68 -1 -0.11551723109414 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 8.91666666666667 68 -1 0.10728937203632 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 8.58333333333333 68 -1 -0.32114182293872 -0.5 -0.5 367232 1
i 4 11.45975443383356 2 6 68 -1 0.06110066295416 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 6.33333333333333 68 -1 -0.10099604186473 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 6 68 -1 0.43224338540414 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 8.58333333333333 68 -1 -0.11247255710925 -0.5 -0.5 367232 1
i 4 11.45975443383356 2 8.33333333333333 68 -1 0.0487260577565 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 6 68 -1 0.26093103110953 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6 68 -1 -0.31590051613843 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6.66666666666667 68 -1 0.42467866756108 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 7.16666666666667 68 -1 -0.33151792199345 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.66666666666667 68 -1 0.44020498371345 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6 68 -1 0.15042160194347 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6.66666666666667 68 -1 0.05928928022217 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.16666666666667 68 -1 -0.37016768657128 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.66666666666667 68 -1 0.41694638149802 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6 68 -1 -0.30649437774995 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6.66666666666667 68 -1 0.33628400034395 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.16666666666667 68 -1 0.01910445773635 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 7.66666666666667 68 -1 0.33820869386596 -0.5 -0.5 2869 1
i 4 11.73260572987722 2 6.33333333333333 68 -1 0.44431024338811 -0.5 -0.5 2869 1
i 4 11.73260572987722 2 8.33333333333333 68 -1 -0.28533355403031 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 8.58333333333333 68 -1 0.16849600032227 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 8.33333333333333 68 -1 0.37304955377814 -0.5 -0.5 367232 1
i 4 12.00545702592087 2 6.33333333333333 68 -1 -0.23106974234709 -0.5 -0.5 2869 1
i 4 12.00545702592087 2 8.33333333333333 68 -1 -0.34299109839139 -0.5 -0.5 367232 1
i 4 12.27830832196453 2 6.33333333333333 68 -1 -0.49818664343066 -0.5 -0.5 2869 1
i 4 12.27830832196453 2 8.33333333333333 68 -1 0.23730189332063 -0.5 -0.5 367232 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 0.38986364522419 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 8 68 -1 0.46803714261194 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 -0.36197134958682 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 -0.09587047957625 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.33333333333333 68 -1 -0.15357874926999 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.66666666666667 68 -1 0.48002543281658 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.33333333333333 68 -1 -0.20734630084465 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 8.33333333333333 68 -1 0.18179652270124 -0.5 -0.5 367232 1
i 4 12.55115961800818 2 8.58333333333333 68 -1 0.48407956599011 -0.5 -0.5 367232 1
i 4 12.55115961800818 2 8.33333333333333 68 -1 0.33519238141598 -0.5 -0.5 367232 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 0.13886522283765 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 0.20012424044529 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 8 68 -1 -0.07407147211684 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 -0.27703486213216 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 6.33333333333333 68 -1 0.44023034881199 -0.5 -0.5 2869 1
i 5 12.82401091405184 2 6.33333333333333 68 -1 -0.45704141513114 -0.5 -0.5 2869 1
i 6 12.82401091405184 2 6.91666666666667 68 -1 0.1471837768281 -0.5 -0.5 2869 1
i 6 12.82401091405184 2 7.41666666666667 68 -1 -0.28715927538554 -0.5 -0.5 2869 1
i 6 12.82401091405184 2 8 68 -1 0.48608667435931 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 6.66666666666667 68 -1 0.3998607864345 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 8.33333333333333 68 -1 0.43885753821821 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 8.33333333333333 68 -1 -0.17185399384524 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.91666666666667 68 -1 -0.47582948378865 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 9.5 68 -1 -0.03817208303245 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 0.23687473130039 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.33333333333333 68 -1 -0.04639883474942 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.91666666666667 68 -1 -0.05615488611824 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 9.5 68 -1 -0.38669631079291 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 0.42181381596566 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.33333333333333 68 -1 -0.47115460403405 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.91666666666667 68 -1 0.20193873248374 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 9.5 68 -1 0.00500974904307 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 -0.33676333448076 -0.5 -0.5 367232 1
i 4 12.82401091405184 2 8.58333333333333 68 -1 0.23500172567642 -0.5 -0.5 367232 1
i 3 13.0968622100955 2 7.66666666666667 68 -1 0.15115110466525 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 7.66666666666667 68 -1 -0.17223875866921 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 8.33333333333333 68 -1 0.03871358863192 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 8.75 68 -1 -0.31990366494038 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 9.41666666666667 68 -1 -0.25521790068397 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 8 68 -1 0.43316982861534 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.66666666666667 68 -1 0.01636202059632 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.91666666666667 68 -1 0.26941020546594 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.66666666666667 68 -1 -0.32318610296369 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 8.58333333333333 68 -1 0.17285737978138 -0.5 -0.5 367232 1
i 3 13.36971350613916 2 8 68 -1 0.44257182561195 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 8.33333333333333 68 -1 -0.44994552480398 -0.5 -0.5 2869 1
i 3 13.36971350613916 2 8 68 -1 -0.33933011470926 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 6.66666666666667 68 -1 0.01034209440067 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 6.33333333333333 68 -1 0.14352643578195 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 8.58333333333333 68 -1 -0.02861218380748 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 8 68 -1 -0.23189137317782 -0.5 -0.5 2869 1
i 3 13.64256480218281 2 7.66666666666667 68 -1 0.32786065068678 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.33333333333333 68 -1 0.42569326509364 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.66666666666667 68 -1 0.07172797890379 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.33333333333333 68 -1 0.49775671604803 -0.5 -0.5 2869 1
i 3 13.64256480218281 2 10 68 -1 -0.0329210373724 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 10.33333333333333 68 -1 0.3510259247362 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 10 68 -1 0.42410429595271 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 10 68 -1 -0.09581197014065 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.58333333333333 68 -1 -0.26237013987539 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.91666666666667 68 -1 0.01568213136301 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.58333333333333 68 -1 0.25652673608322 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 7.66666666666667 68 -1 0.49832277083514 -0.5 -0.5 2869 1
i 4 13.91541609822647 2 8 68 -1 0.2848083792318 -0.5 -0.5 2869 1
i 3 13.91541609822647 2 7.66666666666667 68 -1 0.34562327213699 -0.5 -0.5 2869 1
i 4 13.91541609822647 2 6.33333333333333 68 -1 0.22319349716336 -0.5 -0.5 2869 1
i 4 13.91541609822647 2 10 68 -1 0.25500919160028 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 10 68 -1 0.2057875825503 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 10.33333333333333 68 -1 -0.25962098818453 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 10 68 -1 -0.11322976764757 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 8.58333333333333 68 -1 -0.28162205503903 -0.5 -0.5 367232 1
i 5 13.91541609822647 2 8.58333333333333 68 -1 -0.29974282425805 -0.5 -0.5 367232 1
i 6 13.91541609822647 2 9.25 68 -1 -0.12075547156798 -0.5 -0.5 367232 1
i 5 13.91541609822647 2 9.75 68 -1 0.04939861178833 -0.5 -0.5 367232 1
i 6 13.91541609822647 2 10.33333333333333 68 -1 0.38516093521425 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 8.91666666666667 68 -1 0.18885106039254 -0.5 -0.5 367232 1
i 3 14.18826739427012 2 7.66666666666667 68 -1 0.04489138259867 -0.5 -0.5 2869 1
i 4 14.18826739427012 2 6.33333333333333 68 -1 0.38276018883503 -0.5 -0.5 2869 1
i 3 14.18826739427012 2 10 68 -1 0.25997235787393 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 10 68 -1 -0.32371898287245 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 10.58333333333333 68 -1 0.20319175257552 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 11.25 68 -1 -0.21941010543773 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 11.75 68 -1 -0.06427051354126 -0.5 -0.5 367232 1
i 3 14.18826739427012 2 10.33333333333333 68 -1 -0.04353896949019 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 8.91666666666667 68 -1 -0.42603329123295 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 9.25 68 -1 0.16715405463509 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 8.91666666666667 68 -1 0.36308113589541 -0.5 -0.5 367232 1
i 3 14.46111869031378 2 7.66666666666667 68 -1 -0.40256933819528 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.33333333333333 68 -1 -0.47843757832969 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.66666666666667 68 -1 0.4601759058967 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.33333333333333 68 -1 -0.37827941920139 -0.5 -0.5 2869 1
i 3 14.46111869031378 2 10.33333333333333 68 -1 -0.09427074824166 -0.5 -0.5 367232 1
i 3 14.46111869031378 2 10.58333333333333 68 -1 -0.08858998795152 -0.5 -0.5 367232 1
i 3 14.46111869031378 2 10.33333333333333 68 -1 0.15232412469269 -0.5 -0.5 367232 1
i 4 14.46111869031378 2 8.91666666666667 68 -1 0.07100164237542 -0.5 -0.5 367232 1
i 4 14.46111869031378 2 8.58333333333333 68 -1 0.34356394415473 -0.5 -0.5 367232 1
i 3 14.73396998635744 2 7.66666666666667 68 -1 0.31060839004098 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 8 68 -1 -0.06982431884572 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 7.66666666666667 68 -1 0.36698789483499 -0.5 -0.5 2869 1
i 4 14.73396998635744 2 6.33333333333333 68 -1 -0.26671403561527 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 6.33333333333333 68 -1 -0.45996404980721 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 6.91666666666667 68 -1 0.18421815850091 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 7.41666666666667 68 -1 0.15282764893934 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 8 68 -1 0.32133173691343 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 6.33333333333333 68 -1 -0.23282110100966 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 6.91666666666667 68 -1 -0.06335803941704 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 7.41666666666667 68 -1 0.44520036427907 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 8 68 -1 -0.05983271839377 -0.5 -0.5 2869 1
i 4 14.73396998635744 2 6.66666666666667 68 -1 0.0990010453545 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 10.33333333333333 68 -1 0.22803860285671 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 10 68 -1 0.12964718241043 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.58333333333333 68 -1 0.45406947332709 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.91666666666667 68 -1 0.31924477423769 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.58333333333333 68 -1 -0.5 -0.5 -0.5 367232 1
i 3 15.00682128240109 2 7.66666666666667 68 -1 -0.3756342794275 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 7.66666666666667 68 -1 -0.02860329317964 -0.5 -0.5 2869 1
i 4 15.00682128240109 2 8.33333333333333 68 -1 0.25198548797443 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 8.75 68 -1 -0.11309455195367 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 9.41666666666667 68 -1 0.18666020910674 -0.5 -0.5 2869 1
i 4 15.00682128240109 2 6.66666666666667 68 -1 -0.08906067054153 -0.5 -0.5 2869 1
i 3 15.00682128240109 2 10 68 -1 0.12817902633814 -0.5 -0.5 367232 1
i 3 15.00682128240109 2 10.33333333333333 68 -1 -0.24068259590406 -0.5 -0.5 367232 1
i 3 15.00682128240109 2 10 68 -1 0.48545709442308 -0.5 -0.5 367232 1
i 4 15.00682128240109 2 8.58333333333333 68 -1 -0.19214041060706 -0.5 -0.5 367232 1
i 4 15.27967257844475 2 6.66666666666667 68 -1 0.36292841324829 -0.5 -0.5 2869 1
i 4 15.27967257844475 2 6.91666666666667 68 -1 -0.4081304733443 -0.5 -0.5 2869 1
i 4 15.27967257844475 2 6.66666666666667 68 -1 -0.33772712323059 -0.5 -0.5 2869 1
i 3 15.27967257844475 2 10 68 -1 0.43274919125819 -0.5 -0.5 367232 1
i 4 15.27967257844475 2 8.58333333333333 68 -1 0.258973409691 -0.5 -0.5 367232 1
i 3 15.5525238744884 2 8 68 -1 -0.37935685724879 -0.5 -0.5 2869 1
i 3 15.5525238744884 2 8.33333333333333 68 -1 0.05093468286946 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 8 68 -1 -0.35663068448624 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 6.66666666666667 68 -1 0.18821205482556 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 6.66666666666667 68 -1 0.03190643495496 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 7.33333333333333 68 -1 0.25277832003637 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 7.66666666666667 68 -1 0.29053561080297 -0.5 -0.5 2869 1
i 5 15.5525238744884 2 8.33333333333333 68 -1 0.25405828760991 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 6.91666666666667 68 -1 -0.45298097325118 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 10 68 -1 0.1883127428429 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.58333333333333 68 -1 -0.48612160781597 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.91666666666667 68 -1 -0.0406964754273 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.58333333333333 68 -1 0.02008760383804 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 8 68 -1 -0.05691111464639 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 6.91666666666667 68 -1 -0.2097540817004 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 7.33333333333333 68 -1 -0.44390217538296 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 6.91666666666667 68 -1 0.07039584785042 -0.5 -0.5 2869 1
i 3 15.82537517053206 2 10 68 -1 -0.23606340762479 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 10.33333333333333 68 -1 0.09364038412915 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 10 68 -1 0.33295932384808 -0.5 -0.5 367232 1
i 4 15.82537517053206 2 8.58333333333333 68 -1 0.16306966715254 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 8.58333333333333 68 -1 0.13517623968329 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.25 68 -1 -0.32234787241029 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.75 68 -1 -0.34234113004157 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 10.33333333333333 68 -1 0.39496163031983 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 8.58333333333333 68 -1 -0.12068664227482 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.25 68 -1 0.03651028142509 -0.5 -0.5 367232 1
i 5 15.82537517053206 2 9.75 68 -1 0.16138890283985 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 10.33333333333333 68 -1 0.35767701569464 -0.5 -0.5 367232 1
i 4 15.82537517053206 2 8.91666666666667 68 -1 0.14990379779221 -0.5 -0.5 367232 1
i 4 16.09822646657571 2 6.91666666666667 68 -1 -0.24265358343334 -0.5 -0.5 2869 1
i 4 16.09822646657571 2 6.66666666666667 68 -1 0.2758884979824 -0.5 -0.5 2869 1
i 3 16.09822646657571 2 10 68 -1 0.21358743844336 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 10 68 -1 0.42654225481961 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 10.58333333333333 68 -1 0.29469971379509 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 11.25 68 -1 0.03428313235918 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 11.75 68 -1 0.48347759407621 -0.5 -0.5 367232 1
i 4 16.09822646657571 2 8.91666666666667 68 -1 0.0490274441453 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 6.66666666666667 68 -1 -0.48480348464355 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 6.91666666666667 68 -1 -0.01792846221906 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 6.66666666666667 68 -1 -0.0898100645884 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 8.91666666666667 68 -1 -0.48779668676281 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 9.25 68 -1 0.2978707937968 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 8.91666666666667 68 -1 -0.40396373007281 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 6.66666666666667 68 -1 -0.43152947313689 -0.5 -0.5 2869 1
i 3 16.64392905866303 2 10.33333333333333 68 -1 0.18839672038573 -0.5 -0.5 367232 1
i 3 16.64392905866303 2 10.58333333333333 68 -1 0.07407493396332 -0.5 -0.5 367232 1
i 3 16.64392905866303 2 10.33333333333333 68 -1 0.27676634483241 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 8.91666666666667 68 -1 -0.32580829258968 -0.5 -0.5 367232 1
i 5 16.64392905866303 2 8.91666666666667 68 -1 0.38668963842249 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 9.5 68 -1 -0.14614165756243 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 10 68 -1 0.29374805982376 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 10.58333333333333 68 -1 -0.30019912563979 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 9.25 68 -1 -0.0370953515161 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 6.66666666666667 68 -1 -0.2276276782671 -0.5 -0.5 2869 1
i 3 16.91678035470668 2 10.33333333333333 68 -1 -0.3914993577435 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.25 68 -1 0.35667004848587 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.5 68 -1 -0.46238916818134 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.25 68 -1 0.34382515056717 -0.5 -0.5 367232 1
i 4 17.18963165075034 2 6.66666666666667 68 -1 0.07356658648523 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 6.91666666666667 68 -1 0.10856044604554 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 6.66666666666667 68 -1 -0.0991969340025 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 9.25 68 -1 0.34858727131623 -0.5 -0.5 367232 1
i 4 17.18963165075034 2 8.91666666666667 68 -1 -0.44556281664823 -0.5 -0.5 367232 1
i 4 17.462482946794 2 6.66666666666667 68 -1 -0.21314728121357 -0.5 -0.5 2869 1
i 5 17.462482946794 2 6.66666666666667 68 -1 0.0794142530682 -0.5 -0.5 2869 1
i 5 17.462482946794 2 7.33333333333333 68 -1 0.40037771522037 -0.5 -0.5 2869 1
i 6 17.462482946794 2 7.66666666666667 68 -1 -0.10214909505775 -0.5 -0.5 2869 1
i 6 17.462482946794 2 8.33333333333333 68 -1 -0.14933157659817 -0.5 -0.5 2869 1
i 4 17.462482946794 2 6.33333333333333 68 -1 0.00839383924061 -0.5 -0.5 2869 1
i 4 17.462482946794 2 8.91666666666667 68 -1 0.2034791129459 -0.5 -0.5 367232 1
i 4 17.462482946794 2 9.25 68 -1 -0.31739811452805 -0.5 -0.5 367232 1
i 4 17.462482946794 2 8.91666666666667 68 -1 0.05661034864514 -0.5 -0.5 367232 1
i 4 17.73533424283766 2 6.33333333333333 68 -1 -0.22787519003021 -0.5 -0.5 2869 1
i 4 17.73533424283766 2 8.91666666666667 68 -1 0.3519890380822 -0.5 -0.5 367232 1
i 4 18.00818553888131 2 6.33333333333333 68 -1 0.31670890142859 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 6.66666666666667 68 -1 -0.49449304516237 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 6.33333333333333 68 -1 0.3974964367805 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 8.91666666666667 68 -1 -0.38277577024597 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 6.33333333333333 68 -1 -0.39908271315317 -0.5 -0.5 2869 1
i 6 18.28103683492497 2 6.33333333333333 68 -1 -0.18820805199415 -0.5 -0.5 2869 1
i 5 18.28103683492497 2 6.91666666666667 68 -1 -0.08370817448521 -0.5 -0.5 2869 1
i 5 18.28103683492497 2 7.41666666666667 68 -1 0.27774536280259 -0.5 -0.5 2869 1
i 6 18.28103683492497 2 8 68 -1 0.472844191397 -0.5 -0.5 2869 1
i 4 18.28103683492497 2 6.66666666666667 68 -1 0.38781508188673 -0.5 -0.5 2869 1
i 4 18.28103683492497 2 8.91666666666667 68 -1 -0.46488855161622 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 9.25 68 -1 -0.20865408694702 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 8.91666666666667 68 -1 0.16328562672063 -0.5 -0.5 367232 1
i 4 18.55388813096862 2 6.66666666666667 68 -1 0.3677961347598 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 6.91666666666667 68 -1 0.31814338507122 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 6.66666666666667 68 -1 -0.23927918271908 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 8.91666666666667 68 -1 -0.26886187697582 -0.5 -0.5 367232 1
i 5 18.55388813096862 2 8.91666666666667 68 -1 -0.41964492273902 -0.5 -0.5 367232 1
i 5 18.55388813096862 2 9.5 68 -1 0.01738106658585 -0.5 -0.5 367232 1
i 6 18.55388813096862 2 10 68 -1 -0.30436221201279 -0.5 -0.5 367232 1
i 6 18.55388813096862 2 10.58333333333333 68 -1 -0.17539092768736 -0.5 -0.5 367232 1
i 4 18.55388813096862 2 8.58333333333333 68 -1 0.16607884378447 -0.5 -0.5 367232 1
i 4 18.82673942701228 2 6.66666666666667 68 -1 0.27518559224772 -0.5 -0.5 2869 1
i 4 18.82673942701228 2 6.33333333333333 68 -1 0.4324252338347 -0.5 -0.5 2869 1
i 4 18.82673942701228 2 8.58333333333333 68 -1 0.33217148517441 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 6.33333333333333 68 -1 0.31844161407942 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 6.66666666666667 68 -1 0.02143628236951 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 6.33333333333333 68 -1 -0.15124233718997 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 8.58333333333333 68 -1 -0.06872194219628 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 8.91666666666667 68 -1 -0.18121925792355 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 8.58333333333333 68 -1 0.18430090165206 -0.5 -0.5 367232 1
i 4 19.37244201909959 2 6.33333333333333 68 -1 -0.46032696198215 -0.5 -0.5 2869 1
i 4 19.37244201909959 2 8.58333333333333 68 -1 0.3576127506826 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 8.58333333333333 68 -1 -0.26502914549495 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 9.25 68 -1 0.16028371435196 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 9.75 68 -1 -0.03113669829004 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 10.33333333333333 68 -1 0.28229880676251 -0.5 -0.5 367232 1
i 4 19.37244201909959 2 8.91666666666667 68 -1 0.33345461096026 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 6.33333333333333 68 -1 -0.04925751387547 -0.5 -0.5 2869 1
i 4 19.64529331514324 2 8.91666666666667 68 -1 -0.25377740844124 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 9.25 68 -1 -0.35983465526204 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 8.91666666666667 68 -1 0.25402994031831 -0.5 -0.5 367232 1
i 4 19.9181446111869 2 6.33333333333333 68 -1 0.22133543822255 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 6.66666666666667 68 -1 0.24481869018485 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 6.33333333333333 68 -1 -0.29035919755344 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 8.91666666666667 68 -1 0.16891177433104 -0.5 -0.5 367232 1
i 4 19.9181446111869 2 8.58333333333333 68 -1 0.49558416436918 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 6.33333333333333 68 -1 0.29633315359952 -0.5 -0.5 2869 1
i 6 20.19099590723056 2 6.33333333333333 68 -1 -0.04829336275912 -0.5 -0.5 2869 1
i 5 20.19099590723056 2 6.91666666666667 68 -1 -0.26267094493451 -0.5 -0.5 2869 1
i 5 20.19099590723056 2 7.41666666666667 68 -1 0.08147675969568 -0.5 -0.5 2869 1
i 6 20.19099590723056 2 8 68 -1 0.48550769824738 -0.5 -0.5 2869 1
i 4 20.19099590723056 2 8.58333333333333 68 -1 -0.04450948901881 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 8.91666666666667 68 -1 0.13357050195008 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 8.58333333333333 68 -1 0.19829955688034 -0.5 -0.5 367232 1
i 4 20.46384720327422 2 6.33333333333333 68 -1 0.13272965334096 -0.5 -0.5 2869 1
i 4 20.46384720327422 2 8.58333333333333 68 -1 0.10272157609834 -0.5 -0.5 367232 1
i 4 20.73669849931787 2 6.33333333333333 68 -1 -0.44784486779028 -0.5 -0.5 2869 1
i 4 20.73669849931787 2 8.58333333333333 68 -1 -0.06292259341282 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 6.33333333333333 68 -1 0.12218971757246 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 6.66666666666667 68 -1 -0.25947163325117 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 6.33333333333333 68 -1 -0.17011906492527 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 8.58333333333333 68 -1 -0.15379305884884 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 8.91666666666667 68 -1 0.28362173939493 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 8.58333333333333 68 -1 -0.30023917554872 -0.5 -0.5 367232 1
i 4 21.28240109140518 2 6.33333333333333 68 -1 -0.44053167505064 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 6.33333333333333 68 -1 0.09302773590192 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 6.91666666666667 68 -1 -0.03199972077237 -0.5 -0.5 2869 1
i 5 21.28240109140518 2 7.41666666666667 68 -1 -0.48645405118914 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 8 68 -1 -0.08340973475546 -0.5 -0.5 2869 1
i 4 21.28240109140518 2 6.66666666666667 68 -1 0.39848825881682 -0.5 -0.5 2869 1
i 4 21.28240109140518 2 8.58333333333333 68 -1 -0.43355274559113 -0.5 -0.5 367232 1
i 5 21.28240109140518 2 8.58333333333333 68 -1 0.43158500410568 -0.5 -0.5 367232 1
i 6 21.28240109140518 2 9.25 68 -1 -0.13816120384491 -0.5 -0.5 367232 1
i 5 21.28240109140518 2 9.75 68 -1 -0.16034153467797 -0.5 -0.5 367232 1
i 6 21.28240109140518 2 10.33333333333333 68 -1 0.06803494236302 -0.5 -0.5 367232 1
i 4 21.55525238744884 2 6.66666666666667 68 -1 -0.08624496315289 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 6.91666666666667 68 -1 -0.3496990359828 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 6.66666666666667 68 -1 -0.38894463238948 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 8.58333333333333 68 -1 -0.28404601096286 -0.5 -0.5 367232 1
i 4 21.82810368349249 2 6.66666666666667 68 -1 0.20160771768192 -0.5 -0.5 2869 1
i 4 21.82810368349249 2 6.33333333333333 68 -1 0.40047317161991 -0.5 -0.5 2869 1
i 4 21.82810368349249 2 8.58333333333333 68 -1 0.0857518557469 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 6.33333333333333 68 -1 -0.39151887697739 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 6.66666666666667 68 -1 0.12821627924977 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 6.33333333333333 68 -1 -0.49896036475018 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 8.58333333333333 68 -1 0.05304613336905 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 8.91666666666667 68 -1 0.23445941733593 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 8.58333333333333 68 -1 -0.45898432817502 -0.5 -0.5 367232 1
i 4 22.37380627557981 2 6.33333333333333 68 -1 0.36839828067106 -0.5 -0.5 2869 1
i 4 22.37380627557981 2 8.58333333333333 68 -1 -0.43486999385077 -0.5 -0.5 367232 1
i 5 22.37380627557981 2 8.58333333333333 68 -1 0.02982421811207 -0.5 -0.5 367232 1
i 5 22.37380627557981 2 9.25 68 -1 -0.04659945328215 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 9.75 68 -1 -0.26631517388963 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 10.33333333333333 68 -1 -0.32789725767088 -0.5 -0.5 367232 1
i 4 22.37380627557981 2 8.91666666666667 68 -1 0.32006402631151 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 6.33333333333333 68 -1 -0.24071780746786 -0.5 -0.5 2869 1
i 4 22.64665757162346 2 8.91666666666667 68 -1 0.31361611774732 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 9.25 68 -1 0.42374349320469 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 8.91666666666667 68 -1 -0.06903753104588 -0.5 -0.5 367232 1
i 4 22.91950886766712 2 6.33333333333333 68 -1 0.36652200526236 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 6.66666666666667 68 -1 -0.19777914984833 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 6.33333333333333 68 -1 -0.29579103552128 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 8.91666666666667 68 -1 0.41471094854111 -0.5 -0.5 367232 1
i 4 22.91950886766712 2 8.58333333333333 68 -1 0.07529606109891 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 6.33333333333333 68 -1 0.14459231275572 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 6.33333333333333 68 -1 -0.41497261959837 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 6.91666666666667 68 -1 0.40143112881726 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 7.41666666666667 68 -1 -0.49854774648416 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 8 68 -1 0.24599993498567 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 6.33333333333333 68 -1 -0.00140861014627 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 6.91666666666667 68 -1 0.38135396221203 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 7.41666666666667 68 -1 0.22266022980401 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 8 68 -1 -0.02337554001474 -0.5 -0.5 2869 1
i 4 23.19236016371078 2 6 68 -1 0.28838872230656 -0.5 -0.5 2869 1
i 4 23.19236016371078 2 8.58333333333333 68 -1 -0.45597548904242 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 8.91666666666667 68 -1 0.25064365363021 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 8.58333333333333 68 -1 0.1292995376739 -0.5 -0.5 367232 1
i 4 23.46521145975444 2 6 68 -1 -0.1288020382296 -0.5 -0.5 2869 1
i 4 23.46521145975444 2 8.58333333333333 68 -1 0.21523172455776 -0.5 -0.5 367232 1
i 4 23.73806275579809 2 6 68 -1 -0.134310349994 -0.5 -0.5 2869 1
i 4 23.73806275579809 2 8.58333333333333 68 -1 0.37598942031025 -0.5 -0.5 367232 1
i 4 24.01091405184175 2 8 68 -1 0.01786040208709 -0.5 -0.5 2869 1
i 3 24.01091405184175 2 8.33333333333333 68 -1 0.01497889116861 -0.5 -0.5 2869 1
i 3 24.01091405184175 2 8 68 -1 -0.280658670525 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6 68 -1 0.49462186940627 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6.33333333333333 68 -1 0.27523275136778 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6 68 -1 0.23951362244448 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 8.58333333333333 68 -1 -0.23861366525686 -0.5 -0.5 367232 1
i 4 24.01091405184175 2 8.91666666666667 68 -1 0.32628897764064 -0.5 -0.5 367232 1
i 4 24.01091405184175 2 8.58333333333333 68 -1 -0.36499186396836 -0.5 -0.5 367232 1
i 3 24.2837653478854 2 8 68 -1 0.18386279773695 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 6 68 -1 -0.02314806207398 -0.5 -0.5 2869 1
i 6 24.2837653478854 2 6 68 -1 -0.4876694031143 -0.5 -0.5 2869 1
i 6 24.2837653478854 2 6.66666666666667 68 -1 0.47245325368289 -0.5 -0.5 2869 1
i 6 24.2837653478854 2 7.16666666666667 68 -1 0.2703423829636 -0.5 -0.5 2869 1
i 6 24.2837653478854 2 7.66666666666667 68 -1 -0.15505580091713 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 6.33333333333333 68 -1 -0.29760220311217 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 8.58333333333333 68 -1 0.19879174889147 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 8.58333333333333 68 -1 0.32596527779402 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 9.25 68 -1 -0.27609933581989 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 9.75 68 -1 0.23588169537676 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 10.33333333333333 68 -1 0.20655225594248 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 8.58333333333333 68 -1 0.05137213419091 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 9.25 68 -1 -0.43617186499563 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 9.75 68 -1 -0.1023042041014 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 10.33333333333333 68 -1 0.15807942409092 -0.5 -0.5 367232 1
i 4 24.2837653478854 2 8.33333333333333 68 -1 -0.36885530117071 -0.5 -0.5 367232 1
i 4 24.55661664392906 2 6.33333333333333 68 -1 0.30956043815679 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 6.66666666666667 68 -1 0.41711256163452 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 6.33333333333333 68 -1 0.40191754248579 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 8.33333333333333 68 -1 0.4348985136608 -0.5 -0.5 367232 1
i 4 24.82946793997271 2 6.33333333333333 68 -1 -0.00309460568501 -0.5 -0.5 2869 1
i 4 24.82946793997271 2 6 68 -1 -0.04780242813184 -0.5 -0.5 2869 1
i 4 24.82946793997271 2 8.33333333333333 68 -1 0.13580635927073 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 6 68 -1 -0.17439511432854 -0.5 -0.5 2869 1
i 4 25.10231923601637 2 6.33333333333333 68 -1 0.15222858897116 -0.5 -0.5 2869 1
i 4 25.10231923601637 2 6 68 -1 -0.17959299572844 -0.5 -0.5 2869 1
i 3 25.10231923601637 2 10.33333333333333 68 -1 0.1140679962725 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 10.58333333333333 68 -1 0.4505664813489 -0.5 -0.5 367232 1
i 3 25.10231923601637 2 10.33333333333333 68 -1 -0.36392521450469 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.33333333333333 68 -1 -0.16638100582751 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.58333333333333 68 -1 -0.25532785412694 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.33333333333333 68 -1 0.39193593120863 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 6 68 -1 0.28198847947617 -0.5 -0.5 2869 1
i 3 25.37517053206002 2 10.33333333333333 68 -1 0.37734724399792 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 8.33333333333333 68 -1 -0.15500026463939 -0.5 -0.5 367232 1
i 5 25.37517053206002 2 8.33333333333333 68 -1 0.32487693521441 -0.5 -0.5 367232 1
i 6 25.37517053206002 2 8.91666666666667 68 -1 -0.19469638034119 -0.5 -0.5 367232 1
i 6 25.37517053206002 2 9.5 68 -1 -0.2724305335494 -0.5 -0.5 367232 1
i 5 25.37517053206002 2 10 68 -1 -0.33635590206488 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 8.58333333333333 68 -1 -0.30849192832233 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 6 68 -1 0.23043014994228 -0.5 -0.5 2869 1
i 4 25.64802182810368 2 8.58333333333333 68 -1 -0.27318936779396 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 8.91666666666667 68 -1 0.19011674334081 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 8.58333333333333 68 -1 0.46816280627173 -0.5 -0.5 367232 1
i 4 25.92087312414734 2 6 68 -1 -0.35660996971391 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 6.33333333333333 68 -1 -0.4707853552938 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 6 68 -1 -0.35749424185876 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 8.58333333333333 68 -1 0.20192038328358 -0.5 -0.5 367232 1
i 4 25.92087312414734 2 8.33333333333333 68 -1 -0.33990916903905 -0.5 -0.5 367232 1
i 4 26.193724420191 2 6 68 -1 0.43745454939527 -0.5 -0.5 2869 1
i 6 26.193724420191 2 6 68 -1 0.15032184772414 -0.5 -0.5 2869 1
i 6 26.193724420191 2 6.66666666666667 68 -1 0.0274800199782 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.16666666666667 68 -1 0.12940971610765 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.66666666666667 68 -1 -0.1980573943537 -0.5 -0.5 2869 1
i 5 26.193724420191 2 6 68 -1 -0.23220306059315 -0.5 -0.5 2869 1
i 6 26.193724420191 2 6.66666666666667 68 -1 0.29111629962402 -0.5 -0.5 2869 1
i 5 26.193724420191 2 7.16666666666667 68 -1 -0.17472136492672 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.66666666666667 68 -1 0.01557397508183 -0.5 -0.5 2869 1
i 4 26.193724420191 2 6.33333333333333 68 -1 -0.32335577184874 -0.5 -0.5 2869 1
i 4 26.193724420191 2 8.33333333333333 68 -1 0.20249695123064 -0.5 -0.5 367232 1
i 4 26.193724420191 2 8.58333333333333 68 -1 0.25617701095267 -0.5 -0.5 367232 1
i 4 26.193724420191 2 8.33333333333333 68 -1 0.36597159595208 -0.5 -0.5 367232 1
i 4 26.46657571623465 2 6.33333333333333 68 -1 0.4472062835116 -0.5 -0.5 2869 1
i 4 26.46657571623465 2 8.33333333333333 68 -1 0.47827955900223 -0.5 -0.5 367232 1
i 4 26.73942701227831 2 6.33333333333333 68 -1 0.1239862557187 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 6.66666666666667 68 -1 -0.19352850084897 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 6.33333333333333 68 -1 0.237754656573 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 8.33333333333333 68 -1 0.25212349423542 -0.5 -0.5 367232 1
i 3 27.01227830832196 2 7.66666666666667 68 -1 0.17053958161927 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 8 68 -1 0.07828431537725 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 7.66666666666667 68 -1 -0.44519993200154 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 6.33333333333333 68 -1 -0.12281707122706 -0.5 -0.5 2869 1
i 5 27.01227830832196 2 6.33333333333333 68 -1 0.25704596182269 -0.5 -0.5 2869 1
i 6 27.01227830832196 2 6.91666666666667 68 -1 0.10376446940386 -0.5 -0.5 2869 1
i 6 27.01227830832196 2 7.41666666666667 68 -1 0.40346835712038 -0.5 -0.5 2869 1
i 6 27.01227830832196 2 8 68 -1 -0.02165665719935 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 6.66666666666667 68 -1 -0.17932225958588 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 8.33333333333333 68 -1 0.23558091836676 -0.5 -0.5 367232 1
i 4 27.01227830832196 2 8.58333333333333 68 -1 0.25840985045937 -0.5 -0.5 367232 1
i 4 27.01227830832196 2 8.33333333333333 68 -1 -0.10089237521708 -0.5 -0.5 367232 1
i 3 27.28512960436562 2 7.66666666666667 68 -1 -0.2495699481946 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.66666666666667 68 -1 -0.20211477212511 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.91666666666667 68 -1 0.39191452613928 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.66666666666667 68 -1 0.31874647346198 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 8.33333333333333 68 -1 0.17042794102761 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 8.33333333333333 68 -1 0.26328973217557 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 8.91666666666667 68 -1 -0.30941293660219 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 9.5 68 -1 0.28414566613858 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 10 68 -1 0.07286353061766 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 8.33333333333333 68 -1 -0.1579458615748 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 8.91666666666667 68 -1 0.00905175548981 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 9.5 68 -1 -0.13799379411632 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 10 68 -1 0.23098171414368 -0.5 -0.5 367232 1
i 4 27.28512960436562 2 8.58333333333333 68 -1 -0.21088139469404 -0.5 -0.5 367232 1
i 4 27.55798090040928 2 6.66666666666667 68 -1 -0.27556222765784 -0.5 -0.5 2869 1
i 4 27.55798090040928 2 6.33333333333333 68 -1 0.38246471210128 -0.5 -0.5 2869 1
i 4 27.55798090040928 2 8.58333333333333 68 -1 -0.05857648691343 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 6.33333333333333 68 -1 0.23935049094911 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 6.66666666666667 68 -1 -0.31919816650285 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 6.33333333333333 68 -1 0.06580583959356 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 8.58333333333333 68 -1 -0.0710822962561 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 8.91666666666667 68 -1 0.35273180038458 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 8.58333333333333 68 -1 -0.20059569276097 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 6.33333333333333 68 -1 -0.44658079638218 -0.5 -0.5 2869 1
i 3 28.10368349249659 2 10 68 -1 0.10933819147459 -0.5 -0.5 367232 1
i 3 28.10368349249659 2 10.33333333333333 68 -1 0.17756935753404 -0.5 -0.5 367232 1
i 3 28.10368349249659 2 10 68 -1 0.3052505456207 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 8.58333333333333 68 -1 0.31426665034486 -0.5 -0.5 367232 1
i 5 28.10368349249659 2 8.58333333333333 68 -1 -0.25685391242591 -0.5 -0.5 367232 1
i 6 28.10368349249659 2 9.25 68 -1 -0.31298128794329 -0.5 -0.5 367232 1
i 6 28.10368349249659 2 9.75 68 -1 0.43988498411317 -0.5 -0.5 367232 1
i 5 28.10368349249659 2 10.33333333333333 68 -1 -0.38375152789628 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 8.91666666666667 68 -1 0.46043952870055 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 6.33333333333333 68 -1 0.08429109353102 -0.5 -0.5 2869 1
i 3 28.37653478854025 2 10 68 -1 0.36729383524513 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 8.91666666666667 68 -1 0.066601336429 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 9.25 68 -1 -0.02311394085811 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 8.91666666666667 68 -1 0.18421449032449 -0.5 -0.5 367232 1
i 4 28.6493860845839 2 6.33333333333333 68 -1 0.04194745770066 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 6.66666666666667 68 -1 -0.22817985284964 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 6.33333333333333 68 -1 -0.05544637249395 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 8.91666666666667 68 -1 -0.19014595599612 -0.5 -0.5 367232 1
i 4 28.6493860845839 2 8.58333333333333 68 -1 -0.0756668836286 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 6.33333333333333 68 -1 0.04220007112157 -0.5 -0.5 2869 1
i 6 28.92223738062756 2 6.33333333333333 68 -1 -0.02244969940321 -0.5 -0.5 2869 1
i 6 28.92223738062756 2 6.91666666666667 68 -1 0.16266318181549 -0.5 -0.5 2869 1
i 6 28.92223738062756 2 7.41666666666667 68 -1 -0.06688362865201 -0.5 -0.5 2869 1
i 5 28.92223738062756 2 8 68 -1 -0.4041186027145 -0.5 -0.5 2869 1
i 4 28.92223738062756 2 6 68 -1 0.32391322206766 -0.5 -0.5 2869 1
i 4 28.92223738062756 2 8.58333333333333 68 -1 -0.21911728029231 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 8.91666666666667 68 -1 -0.23306263313301 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 8.58333333333333 68 -1 -0.31408496998086 -0.5 -0.5 367232 1
i 4 29.19508867667121 2 6 68 -1 -0.30798749847236 -0.5 -0.5 2869 1
i 4 29.19508867667121 2 8.58333333333333 68 -1 0.14420160349479 -0.5 -0.5 367232 1
i 4 29.46793997271487 2 6 68 -1 0.17523352674787 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 6.33333333333333 68 -1 0.30451248161541 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 6 68 -1 0.33390430902858 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 8.58333333333333 68 -1 0.40607586499537 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 6 68 -1 0.26983431381381 -0.5 -0.5 2869 1
i 5 29.74079126875853 2 6 68 -1 0.40833599807462 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 6.66666666666667 68 -1 0.23544825790858 -0.5 -0.5 2869 1
i 5 29.74079126875853 2 7.16666666666667 68 -1 0.17115081756992 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 7.66666666666667 68 -1 0.4333053529648 -0.5 -0.5 2869 1
i 4 29.74079126875853 2 6.33333333333333 68 -1 0.17160450704073 -0.5 -0.5 2869 1
i 4 29.74079126875853 2 8.58333333333333 68 -1 0.26723801521517 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 8.91666666666667 68 -1 0.20794714985246 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 8.58333333333333 68 -1 -0.09435099128789 -0.5 -0.5 367232 1
i 4 30.01364256480218 2 6.33333333333333 68 -1 -0.03741552083888 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 6.66666666666667 68 -1 -0.44346154027905 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 6.33333333333333 68 -1 0.37621983976211 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 8.58333333333333 68 -1 0.18277219692382 -0.5 -0.5 367232 1
i 6 30.01364256480218 2 8.58333333333333 68 -1 -0.44058749342772 -0.5 -0.5 367232 1
i 6 30.01364256480218 2 9.25 68 -1 0.34371175850957 -0.5 -0.5 367232 1
i 5 30.01364256480218 2 9.75 68 -1 -0.20025488452318 -0.5 -0.5 367232 1
i 5 30.01364256480218 2 10.33333333333333 68 -1 -0.07397235143393 -0.5 -0.5 367232 1
i 4 30.01364256480218 2 8.33333333333333 68 -1 0.0636864886764 -0.5 -0.5 367232 1
i 4 30.28649386084584 2 6.33333333333333 68 -1 -0.43437486016186 -0.5 -0.5 2869 1
i 4 30.28649386084584 2 6 68 -1 0.49002718395239 -0.5 -0.5 2869 1
i 4 30.28649386084584 2 8.33333333333333 68 -1 -0.31873826232523 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 6 68 -1 -0.21501599167877 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 6.33333333333333 68 -1 0.19851597327733 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 6 68 -1 -0.15884034866163 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 8.33333333333333 68 -1 -0.31401302110221 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 8.58333333333333 68 -1 -0.00989305383262 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 8.33333333333333 68 -1 -0.20312088485371 -0.5 -0.5 367232 1
i 4 30.83219645293315 2 6 68 -1 0.47244544549256 -0.5 -0.5 2869 1
i 4 30.83219645293315 2 8.33333333333333 68 -1 -0.08619136742342 -0.5 -0.5 367232 1
i 5 30.83219645293315 2 8.33333333333333 68 -1 -0.18677744652037 -0.5 -0.5 367232 1
i 5 30.83219645293315 2 8.91666666666667 68 -1 -0.28991865593101 -0.5 -0.5 367232 1
i 6 30.83219645293315 2 9.5 68 -1 -0.29351368472912 -0.5 -0.5 367232 1
i 6 30.83219645293315 2 10 68 -1 -0.03082857812847 -0.5 -0.5 367232 1
i 4 30.83219645293315 2 8.58333333333333 68 -1 -0.32444447783238 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 6 68 -1 0.35446343264782 -0.5 -0.5 2869 1
i 4 31.1050477489768 2 8.58333333333333 68 -1 0.17190987130375 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 8.91666666666667 68 -1 0.0038651967574 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 8.58333333333333 68 -1 0.39446729875633 -0.5 -0.5 367232 1
i 4 31.37789904502047 2 6 68 -1 -0.15565537551915 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 6.33333333333333 68 -1 0.17347012080059 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 6 68 -1 0.16610801774477 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 8.58333333333333 68 -1 0.09661247713221 -0.5 -0.5 367232 1
i 4 31.37789904502047 2 8.33333333333333 68 -1 -0.35278414892335 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 6 68 -1 0.24132832977514 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 6 68 -1 0.31363311269322 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 6.66666666666667 68 -1 0.30029560276842 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 7.16666666666667 68 -1 -0.3580578513381 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 7.66666666666667 68 -1 -0.04153489484269 -0.5 -0.5 2869 1
i 4 31.65075034106412 2 8.33333333333333 68 -1 -0.27153217770035 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 8.58333333333333 68 -1 0.44308194422944 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 8.33333333333333 68 -1 0.49436750170086 -0.5 -0.5 367232 1
i 4 31.92360163710778 2 6 68 -1 0.1541034462792 -0.5 -0.5 2869 1
i 4 31.92360163710778 2 8.33333333333333 68 -1 -0.09502514547302 -0.5 -0.5 367232 1
i 4 32.19645293315143 2 6 68 -1 0.08467496373117 -0.5 -0.5 2869 1
i 4 32.19645293315143 2 8.33333333333333 68 -1 0.3087463409554 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 6 68 -1 0.41880084815937 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 6.33333333333333 68 -1 0.08271641682771 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 6 68 -1 0.08350019646379 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 8.33333333333333 68 -1 -0.17191705612208 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 8.58333333333333 68 -1 -0.40733533909145 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 8.33333333333333 68 -1 -0.31270009876641 -0.5 -0.5 367232 1
i 4 32.74215552523874 2 6 68 -1 0.26972025495577 -0.5 -0.5 2869 1
i 6 32.74215552523874 2 6 68 -1 -0.16579022545606 -0.5 -0.5 2869 1
i 6 32.74215552523874 2 6.66666666666667 68 -1 0.35520632205342 -0.5 -0.5 2869 1
i 5 32.74215552523874 2 7.16666666666667 68 -1 -0.39487705876493 -0.5 -0.5 2869 1
i 5 32.74215552523874 2 7.66666666666667 68 -1 -0.34699342437466 -0.5 -0.5 2869 1
i 4 32.74215552523874 2 6.33333333333333 68 -1 0.13171107976722 -0.5 -0.5 2869 1
i 4 32.74215552523874 2 8.33333333333333 68 -1 -0.27886861508789 -0.5 -0.5 367232 1
i 5 32.74215552523874 2 8.33333333333333 68 -1 -0.1289531857458 -0.5 -0.5 367232 1
i 5 32.74215552523874 2 8.91666666666667 68 -1 -0.25832402851037 -0.5 -0.5 367232 1
i 5 32.74215552523874 2 9.5 68 -1 -0.27980288012132 -0.5 -0.5 367232 1
i 6 32.74215552523874 2 10 68 -1 0.18671454962738 -0.5 -0.5 367232 1
i 4 33.0150068212824 2 6.33333333333333 68 -1 -0.39656043885147 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 6.66666666666667 68 -1 0.40667100685777 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 6.33333333333333 68 -1 -0.18371452333482 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 8.33333333333333 68 -1 0.47153669053208 -0.5 -0.5 367232 1
i 4 33.28785811732605 2 6.33333333333333 68 -1 -0.14836495949733 -0.5 -0.5 2869 1
i 4 33.28785811732605 2 6 68 -1 -0.35000679918801 -0.5 -0.5 2869 1
i 4 33.28785811732605 2 8.33333333333333 68 -1 0.28729160331473 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 6 68 -1 0.45149551895569 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 6.33333333333333 68 -1 0.03235731971059 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 6 68 -1 0.38648590846596 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 8.33333333333333 68 -1 -0.20703811505509 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 8.58333333333333 68 -1 0.01985788219077 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 8.33333333333333 68 -1 0.31066693515797 -0.5 -0.5 367232 1
i 4 33.83356070941337 2 6 68 -1 -0.24863618366637 -0.5 -0.5 2869 1
i 4 33.83356070941337 2 8.33333333333333 68 -1 -0.34842193937151 -0.5 -0.5 367232 1
i 6 33.83356070941337 2 8.33333333333333 68 -1 0.12998040620444 -0.5 -0.5 367232 1
i 5 33.83356070941337 2 8.91666666666667 68 -1 -0.02171908274899 -0.5 -0.5 367232 1
i 6 33.83356070941337 2 9.5 68 -1 -0.4795112961468 -0.5 -0.5 367232 1
i 6 33.83356070941337 2 10 68 -1 -0.1400416425207 -0.5 -0.5 367232 1
i 4 33.83356070941337 2 8.58333333333333 68 -1 -0.42831836795319 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 6 68 -1 -0.3339034816636 -0.5 -0.5 2869 1
i 4 34.10641200545702 2 8.58333333333333 68 -1 -0.30083697598401 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 8.91666666666667 68 -1 -0.19046889834983 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 8.58333333333333 68 -1 0.28763526951621 -0.5 -0.5 367232 1
i 4 34.37926330150068 2 6 68 -1 0.49294791882744 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 6.33333333333333 68 -1 0.17091969342278 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 6 68 -1 0.1709564737546 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 8.58333333333333 68 -1 0.24568332069753 -0.5 -0.5 367232 1
i 4 34.37926330150068 2 8.33333333333333 68 -1 0.44112662928882 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 6 68 -1 0.43836279763312 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6 68 -1 0.33482420377047 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 6.66666666666667 68 -1 -0.14816402364277 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 7.16666666666667 68 -1 0.14489988767281 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 7.66666666666667 68 -1 0.06323779264154 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6 68 -1 0.23972140792357 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6.66666666666667 68 -1 -0.04024763898772 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 7.16666666666667 68 -1 -0.44311120460146 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 7.66666666666667 68 -1 -0.20883182360675 -0.5 -0.5 2869 1
i 4 34.65211459754434 2 8.33333333333333 68 -1 -0.31715251399331 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 8.58333333333333 68 -1 0.43274034117114 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 8.33333333333333 68 -1 -0.31515143334362 -0.5 -0.5 367232 1
i 4 34.924965893588 2 6 68 -1 -0.0362805982635 -0.5 -0.5 2869 1
i 4 34.924965893588 2 8.33333333333333 68 -1 -0.1983878040157 -0.5 -0.5 367232 1
i 4 35.19781718963165 2 6 68 -1 0.28588301158265 -0.5 -0.5 2869 1
i 4 35.19781718963165 2 8.33333333333333 68 -1 0.21888716672251 -0.5 -0.5 367232 1
i 3 35.47066848567531 2 7.66666666666667 68 -1 -0.38464484239094 -0.5 -0.5 2869 1
i 3 35.47066848567531 2 8 68 -1 -0.42992395092661 -0.5 -0.5 2869 1
i 3 35.47066848567531 2 7.66666666666667 68 -1 -0.01136132454101 -0.5 -0.5 2869 1
i 4 35.47066848567531 2 6 68 -1 0.20408423596492 -0.5 -0.5 2869 1
i 4 35.47066848567531 2 8.33333333333333 68 -1 -0.13888944117062 -0.5 -0.5 367232 1
i 4 35.47066848567531 2 8.58333333333333 68 -1 -0.01252463916043 -0.5 -0.5 367232 1
i 4 35.47066848567531 2 8.33333333333333 68 -1 -0.12297301035403 -0.5 -0.5 367232 1
i 3 35.74351978171897 2 7.66666666666667 68 -1 -0.21448707835548 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6 68 -1 0.21755088099107 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6.33333333333333 68 -1 0.31656933158932 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6 68 -1 0.10968202514163 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 8.33333333333333 68 -1 0.33015146734997 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 8.33333333333333 68 -1 0.2846557550822 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 8.91666666666667 68 -1 -0.02163750246374 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 9.5 68 -1 -0.43004052731864 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 10 68 -1 0.03693783510605 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 8.33333333333333 68 -1 0.4113418715241 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 8.91666666666667 68 -1 0.46669639839365 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 9.5 68 -1 -0.30545948081596 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 10 68 -1 -0.26494880520629 -0.5 -0.5 367232 1
i 4 36.01637107776262 2 6 68 -1 -0.24444803953701 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 6 68 -1 0.15631409338174 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 6.66666666666667 68 -1 -0.10909225665307 -0.5 -0.5 2869 1
i 5 36.01637107776262 2 7.16666666666667 68 -1 -0.36749476481757 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 7.66666666666667 68 -1 -0.3029357188252 -0.5 -0.5 2869 1
i 4 36.01637107776262 2 6.33333333333333 68 -1 -0.38283883213422 -0.5 -0.5 2869 1
i 4 36.01637107776262 2 8.33333333333333 68 -1 -0.07029524072145 -0.5 -0.5 367232 1
i 4 36.28922237380628 2 6.33333333333333 68 -1 0.01268925157891 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 6.66666666666667 68 -1 -0.43182867965123 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 6.33333333333333 68 -1 0.06181342325146 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 8.33333333333333 68 -1 -0.27156831036002 -0.5 -0.5 367232 1
i 4 36.56207366984994 2 6.33333333333333 68 -1 -0.49548896056617 -0.5 -0.5 2869 1
i 4 36.56207366984994 2 6 68 -1 0.31170308734732 -0.5 -0.5 2869 1
i 3 36.56207366984994 2 10 68 -1 0.34491004233419 -0.5 -0.5 367232 1
i 3 36.56207366984994 2 10.33333333333333 68 -1 0.02113066736892 -0.5 -0.5 367232 1
i 3 36.56207366984994 2 10 68 -1 -0.28371040802422 -0.5 -0.5 367232 1
i 4 36.56207366984994 2 8.33333333333333 68 -1 -0.21568283178052 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 6 68 -1 0.47520949559529 -0.5 -0.5 2869 1
i 4 36.83492496589359 2 6.33333333333333 68 -1 -0.31095669400871 -0.5 -0.5 2869 1
i 4 36.83492496589359 2 6 68 -1 -0.35605454312765 -0.5 -0.5 2869 1
i 3 36.83492496589359 2 10 68 -1 0.49330722038674 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.33333333333333 68 -1 0.39718793296919 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.58333333333333 68 -1 0.13140279126488 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.33333333333333 68 -1 -0.18056287147409 -0.5 -0.5 367232 1
i 4 37.10777626193725 2 6 68 -1 0.36731703769695 -0.5 -0.5 2869 1
i 4 37.10777626193725 2 8.33333333333333 68 -1 0.49574241737711 -0.5 -0.5 367232 1
i 5 37.10777626193725 2 8.33333333333333 68 -1 -0.0764035532414 -0.5 -0.5 367232 1
i 6 37.10777626193725 2 8.91666666666667 68 -1 0.1121452002701 -0.5 -0.5 367232 1
i 5 37.10777626193725 2 9.5 68 -1 0.39839029270943 -0.5 -0.5 367232 1
i 6 37.10777626193725 2 10 68 -1 0.00129124780663 -0.5 -0.5 367232 1
i 4 37.10777626193725 2 8.58333333333333 68 -1 0.28284448065156 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 6 68 -1 -0.28365892983844 -0.5 -0.5 2869 1
i 4 37.3806275579809 2 8.58333333333333 68 -1 0.26958040022792 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 8.91666666666667 68 -1 -0.28519081732417 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 8.58333333333333 68 -1 -0.17556799894317 -0.5 -0.5 367232 1
i 4 37.65347885402456 2 6 68 -1 -0.23942649203246 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 6.33333333333333 68 -1 -0.03636128777432 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 6 68 -1 -0.43635958139241 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 8.58333333333333 68 -1 -0.11660507098487 -0.5 -0.5 367232 1
i 4 37.65347885402456 2 8.33333333333333 68 -1 -0.34006880617976 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 6 68 -1 -0.19379296934822 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6 68 -1 -0.01510664187315 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6.66666666666667 68 -1 -0.41516111798316 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 7.16666666666667 68 -1 -0.37794898259438 -0.5 -0.5 2869 1
i 5 37.92633015006821 2 7.66666666666667 68 -1 0.21506660940467 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6 68 -1 0.15590072441721 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6.66666666666667 68 -1 -0.09714449145024 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 7.16666666666667 68 -1 0.22687736621587 -0.5 -0.5 2869 1
i 5 37.92633015006821 2 7.66666666666667 68 -1 -0.00400253945008 -0.5 -0.5 2869 1
i 4 37.92633015006821 2 6.33333333333333 68 -1 -0.15458474817687 -0.5 -0.5 2869 1
i 4 37.92633015006821 2 8.33333333333333 68 -1 0.36528077734133 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 8.58333333333333 68 -1 -0.3801959644513 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 8.33333333333333 68 -1 -0.07617719671204 -0.5 -0.5 367232 1
i 4 38.19918144611186 2 6.33333333333333 68 -1 -0.2875686953127 -0.5 -0.5 2869 1
i 4 38.19918144611186 2 8.33333333333333 68 -1 0.13823696979603 -0.5 -0.5 367232 1
i 4 38.47203274215552 2 6.33333333333333 68 -1 -0.26246366436874 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 6.66666666666667 68 -1 -0.29268238850642 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 6.33333333333333 68 -1 -0.01436680334549 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 8.33333333333333 68 -1 0.0347617722967 -0.5 -0.5 367232 1
i 3 38.74488403819918 2 7.66666666666667 68 -1 0.27833104012614 -0.5 -0.5 2869 1
i 3 38.74488403819918 2 8 68 -1 0.17868511375364 -0.5 -0.5 2869 1
i 3 38.74488403819918 2 7.66666666666667 68 -1 0.28803197542708 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 6.33333333333333 68 -1 -0.0908150439678 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 6.33333333333333 68 -1 -0.23031709967874 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 6.91666666666667 68 -1 -0.12768207443919 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 7.41666666666667 68 -1 -0.26781133867617 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 8 68 -1 0.21351527677361 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 6.66666666666667 68 -1 0.38243954195998 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 8.33333333333333 68 -1 -0.41980399883469 -0.5 -0.5 367232 1
i 4 38.74488403819918 2 8.58333333333333 68 -1 0.07299586860659 -0.5 -0.5 367232 1
i 4 38.74488403819918 2 8.33333333333333 68 -1 0.04428229081952 -0.5 -0.5 367232 1
i 3 39.01773533424284 2 7.66666666666667 68 -1 0.15866191294324 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.66666666666667 68 -1 0.46683935750281 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.91666666666667 68 -1 0.36028343787371 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.66666666666667 68 -1 -0.1052321704285 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 8.33333333333333 68 -1 0.4822970639972 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 8.33333333333333 68 -1 0.43549325503541 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 8.91666666666667 68 -1 0.15441402570963 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 9.5 68 -1 -0.21902867185633 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 10 68 -1 -0.30067286755824 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 8.33333333333333 68 -1 -0.18147526095949 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 8.91666666666667 68 -1 0.23721770439667 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 9.5 68 -1 0.29523896632808 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 10 68 -1 0.20523588150803 -0.5 -0.5 367232 1
i 4 39.01773533424284 2 8.58333333333333 68 -1 0.47064027161459 -0.5 -0.5 367232 1
i 4 39.29058663028649 2 6.66666666666667 68 -1 0.25022859924218 -0.5 -0.5 2869 1
i 4 39.29058663028649 2 6.33333333333333 68 -1 0.08320894577203 -0.5 -0.5 2869 1
i 4 39.29058663028649 2 8.58333333333333 68 -1 0.44246303402905 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 6.33333333333333 68 -1 0.22562852049055 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 6.66666666666667 68 -1 -0.33663376932938 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 6.33333333333333 68 -1 0.02950822879296 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 8.58333333333333 68 -1 0.17834144325288 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 8.91666666666667 68 -1 -0.1024223625559 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 8.58333333333333 68 -1 -0.17034423933816 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 6.33333333333333 68 -1 0.18683121290781 -0.5 -0.5 2869 1
i 3 39.83628922237381 2 10 68 -1 0.27253885733041 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 10.33333333333333 68 -1 -0.09172810482062 -0.5 -0.5 367232 1
i 3 39.83628922237381 2 10 68 -1 0.08684586142045 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 8.58333333333333 68 -1 0.4858833769249 -0.5 -0.5 367232 1
i 5 39.83628922237381 2 8.58333333333333 68 -1 0.42253378672953 -0.5 -0.5 367232 1
i 6 39.83628922237381 2 9.25 68 -1 0.21533898786755 -0.5 -0.5 367232 1
i 5 39.83628922237381 2 9.75 68 -1 0.22929162393472 -0.5 -0.5 367232 1
i 6 39.83628922237381 2 10.33333333333333 68 -1 0.24613732667282 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 8.91666666666667 68 -1 -0.22061713977345 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 6.33333333333333 68 -1 -0.35456443400879 -0.5 -0.5 2869 1
i 3 40.10914051841746 2 10 68 -1 -0.15265072314712 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 8.91666666666667 68 -1 -0.03361896814657 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 9.25 68 -1 -0.11436831355784 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 8.91666666666667 68 -1 0.45271556537812 -0.5 -0.5 367232 1
i 4 40.38199181446112 2 6.33333333333333 68 -1 -0.00565082841361 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 6.66666666666667 68 -1 0.0403569390882 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 6.33333333333333 68 -1 -0.35145366865192 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 8.91666666666667 68 -1 0.38533717176079 -0.5 -0.5 367232 1
i 4 40.38199181446112 2 8.58333333333333 68 -1 0.04651800356979 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 6.33333333333333 68 -1 -0.07235379203769 -0.5 -0.5 2869 1
i 5 40.65484311050478 2 6.33333333333333 68 -1 -0.43725122693059 -0.5 -0.5 2869 1
i 6 40.65484311050478 2 6.91666666666667 68 -1 0.02200771837823 -0.5 -0.5 2869 1
i 6 40.65484311050478 2 7.41666666666667 68 -1 -0.14062057028506 -0.5 -0.5 2869 1
i 5 40.65484311050478 2 8 68 -1 -0.38846022326295 -0.5 -0.5 2869 1
i 4 40.65484311050478 2 6 68 -1 0.48024933368381 -0.5 -0.5 2869 1
i 4 40.65484311050478 2 8.58333333333333 68 -1 0.21679639911073 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 8.91666666666667 68 -1 -0.1043462368038 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 8.58333333333333 68 -1 0.41668231092006 -0.5 -0.5 367232 1
i 4 40.92769440654843 2 6 68 -1 0.48029040353863 -0.5 -0.5 2869 1
i 4 40.92769440654843 2 8.58333333333333 68 -1 0.11680171478626 -0.5 -0.5 367232 1
i 4 41.20054570259209 2 6 68 -1 -0.27047961431157 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 6.33333333333333 68 -1 -0.21758281820544 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 6 68 -1 -0.28202554750584 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 8.58333333333333 68 -1 0.41742178778306 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 6 68 -1 -0.23496590501554 -0.5 -0.5 2869 1
i 6 41.47339699863574 2 6 68 -1 -0.31747119772423 -0.5 -0.5 2869 1
i 6 41.47339699863574 2 6.66666666666667 68 -1 0.16925879295651 -0.5 -0.5 2869 1
i 5 41.47339699863574 2 7.16666666666667 68 -1 0.05466549485107 -0.5 -0.5 2869 1
i 5 41.47339699863574 2 7.66666666666667 68 -1 0.18933147280311 -0.5 -0.5 2869 1
i 4 41.47339699863574 2 6.33333333333333 68 -1 -0.07371952356429 -0.5 -0.5 2869 1
i 4 41.47339699863574 2 8.58333333333333 68 -1 0.17961002459657 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 8.91666666666667 68 -1 0.3045286898692 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 8.58333333333333 68 -1 -0.33259860820072 -0.5 -0.5 367232 1
i 4 41.7462482946794 2 6.33333333333333 68 -1 0.44295860306536 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 6.66666666666667 68 -1 -0.47770452089335 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 6.33333333333333 68 -1 -0.45739995240359 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 8.58333333333333 68 -1 0.30495809608111 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 8.58333333333333 68 -1 0.3897550872955 -0.5 -0.5 367232 1
i 5 41.7462482946794 2 9.25 68 -1 0.21042569860856 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 9.75 68 -1 0.22571476333721 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 10.33333333333333 68 -1 0.34128672923099 -0.5 -0.5 367232 1
i 4 41.7462482946794 2 8.33333333333333 68 -1 0.11558393883703 -0.5 -0.5 367232 1
i 4 42.01909959072306 2 6.33333333333333 68 -1 -0.23044476362712 -0.5 -0.5 2869 1
i 4 42.01909959072306 2 6 68 -1 -0.34001682809965 -0.5 -0.5 2869 1
i 4 42.01909959072306 2 8.33333333333333 68 -1 0.1334170271855 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 6 68 -1 0.29987950120847 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 6.33333333333333 68 -1 0.2278688443455 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 6 68 -1 0.34901400488964 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 8.33333333333333 68 -1 -0.05128665007075 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 8.58333333333333 68 -1 0.12596738700278 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 8.33333333333333 68 -1 0.28153825757073 -0.5 -0.5 367232 1
i 4 42.56480218281037 2 6 68 -1 0.17003858920835 -0.5 -0.5 2869 1
i 4 42.56480218281037 2 8.33333333333333 68 -1 -0.13610660048689 -0.5 -0.5 367232 1
i 5 42.56480218281037 2 8.33333333333333 68 -1 -0.40407213107423 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 8.91666666666667 68 -1 0.31909614420416 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 9.5 68 -1 -0.32800718192733 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 10 68 -1 0.06161406632175 -0.5 -0.5 367232 1
i 4 42.56480218281037 2 8.58333333333333 68 -1 0.16223081064085 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 6 68 -1 -0.47754973033266 -0.5 -0.5 2869 1
i 4 42.83765347885402 2 8.58333333333333 68 -1 0.1209781507347 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 8.91666666666667 68 -1 -0.42806668252707 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 8.58333333333333 68 -1 0.24506448263053 -0.5 -0.5 367232 1
i 4 43.11050477489768 2 6 68 -1 0.3122397939369 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 6.33333333333333 68 -1 -0.0767655159056 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 6 68 -1 -0.20486840638625 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 8.58333333333333 68 -1 -0.20770683424828 -0.5 -0.5 367232 1
i 4 43.11050477489768 2 8.33333333333333 68 -1 0.02985405981156 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 6 68 -1 -0.11799817778643 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 6 68 -1 -0.01082011342104 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 6.66666666666667 68 -1 -0.3656645321448 -0.5 -0.5 2869 1
i 6 43.38335607094133 2 7.16666666666667 68 -1 -0.29664747055759 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 7.66666666666667 68 -1 0.44957765916701 -0.5 -0.5 2869 1
i 4 43.38335607094133 2 8.33333333333333 68 -1 0.08219745997498 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 8.58333333333333 68 -1 0.23726431693218 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 8.33333333333333 68 -1 0.12526727358884 -0.5 -0.5 367232 1
i 4 43.65620736698499 2 6 68 -1 -0.01821330493195 -0.5 -0.5 2869 1
i 4 43.65620736698499 2 8.33333333333333 68 -1 0.09047466460257 -0.5 -0.5 367232 1
i 4 43.92905866302865 2 6 68 -1 -0.26102956693101 -0.5 -0.5 2869 1
i 4 43.92905866302865 2 8.33333333333333 68 -1 -0.28009943617027 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 6 68 -1 0.16242571425531 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 6.33333333333333 68 -1 -0.26905649457713 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 6 68 -1 -0.22851136527431 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 8.33333333333333 68 -1 0.38887349179871 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 8.58333333333333 68 -1 0.1557278518757 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 8.33333333333333 68 -1 -0.26965025832591 -0.5 -0.5 367232 1
i 4 44.47476125511596 2 6 68 -1 -0.32176789742315 -0.5 -0.5 2869 1
i 5 44.47476125511596 2 6 68 -1 0.11754038750323 -0.5 -0.5 2869 1
i 5 44.47476125511596 2 6.66666666666667 68 -1 0.16188469381895 -0.5 -0.5 2869 1
i 5 44.47476125511596 2 7.16666666666667 68 -1 0.33895013653385 -0.5 -0.5 2869 1
i 6 44.47476125511596 2 7.66666666666667 68 -1 0.24405404753988 -0.5 -0.5 2869 1
i 4 44.47476125511596 2 6.33333333333333 68 -1 -0.18845626194641 -0.5 -0.5 2869 1
i 4 44.47476125511596 2 8.33333333333333 68 -1 -0.10172712850726 -0.5 -0.5 367232 1
i 5 44.47476125511596 2 8.33333333333333 68 -1 -0.0622204722553 -0.5 -0.5 367232 1
i 5 44.47476125511596 2 8.91666666666667 68 -1 0.24524397462113 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 9.5 68 -1 0.07150915424477 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 10 68 -1 0.36048089042719 -0.5 -0.5 367232 1
i 4 44.74761255115962 2 6.33333333333333 68 -1 0.41634736705102 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 6.66666666666667 68 -1 -0.1100985784355 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 6.33333333333333 68 -1 0.31108498528475 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 8.33333333333333 68 -1 0.46530217561312 -0.5 -0.5 367232 1
i 4 45.02046384720327 2 6.33333333333333 68 -1 0.36959614082333 -0.5 -0.5 2869 1
i 4 45.02046384720327 2 6 68 -1 -0.28787113610186 -0.5 -0.5 2869 1
i 4 45.02046384720327 2 8.33333333333333 68 -1 0.42506234458687 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 6 68 -1 0.12366628631551 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 6.33333333333333 68 -1 -0.13281212452469 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 6 68 -1 0.09939698986632 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 8.33333333333333 68 -1 0.06521571938794 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 8.58333333333333 68 -1 -0.10737105311619 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 8.33333333333333 68 -1 0.42857137812708 -0.5 -0.5 367232 1
i 4 45.56616643929058 2 6 68 -1 -0.22601884105549 -0.5 -0.5 2869 1
i 4 45.56616643929058 2 8.33333333333333 68 -1 -0.10144014296787 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 8.33333333333333 68 -1 0.30713587345676 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 8.91666666666667 68 -1 0.30987931281028 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 9.5 68 -1 0.03964534684069 -0.5 -0.5 367232 1
i 5 45.56616643929058 2 10 68 -1 0.09201544545398 -0.5 -0.5 367232 1
i 4 45.56616643929058 2 8.58333333333333 68 -1 0.21340769743368 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 6 68 -1 0.48551097834117 -0.5 -0.5 2869 1
i 4 45.83901773533424 2 8.58333333333333 68 -1 0.07915781516751 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 8.91666666666667 68 -1 0.3995299474443 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 8.58333333333333 68 -1 -0.21746713749779 -0.5 -0.5 367232 1
i 4 46.1118690313779 2 6 68 -1 -0.28471676063057 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 6.33333333333333 68 -1 -0.15138789330694 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 6 68 -1 -0.15125032047568 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 8.58333333333333 68 -1 -0.23354635881323 -0.5 -0.5 367232 1
i 4 46.1118690313779 2 8.33333333333333 68 -1 0.21738733684829 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 6 68 -1 0.24550145871027 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6 68 -1 -0.13552449206948 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6.66666666666667 68 -1 -0.25603123614177 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.16666666666667 68 -1 0.19296371630544 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 0.43893008044112 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6 68 -1 -0.10008607044443 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6.66666666666667 68 -1 0.35753935441045 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.16666666666667 68 -1 -0.17796001107302 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.66666666666667 68 -1 0.15351180953419 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6 68 -1 -0.25895107063863 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6.66666666666667 68 -1 -0.4018350386062 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.16666666666667 68 -1 -0.3039786443514 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 -0.12231578201789 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6 68 -1 -0.21821119052499 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6.66666666666667 68 -1 0.25178583442328 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.16666666666667 68 -1 0.22248248975211 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 -0.31086126384758 -0.5 -0.5 2869 1
i 4 46.38472032742155 2 6.33333333333333 68 -1 0.17212857997148 -0.5 -0.5 2869 1
i 4 46.38472032742155 2 8.33333333333333 68 -1 -0.0174179154864 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 8.58333333333333 68 -1 0.16286223700278 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 8.33333333333333 68 -1 -0.05216232750164 -0.5 -0.5 367232 1
i 4 46.65757162346521 2 6.33333333333333 68 -1 0.42484911080099 -0.5 -0.5 2869 1
i 4 46.65757162346521 2 8.33333333333333 68 -1 0.14326534079252 -0.5 -0.5 367232 1
i 4 46.93042291950887 2 6.33333333333333 68 -1 -0.08301780397319 -0.5 -0.5 2869 1
i 4 46.93042291950887 2 8.33333333333333 68 -1 0.42724967047576 -0.5 -0.5 367232 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 -0.02201714398988 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 8 68 -1 0.20507492959902 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 -0.0111938225451 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 0.26948106964467 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 -0.37073595609435 -0.5 -0.5 2869 1
i 4 47.20327421555253 2 6.33333333333333 68 -1 0.12290113242593 -0.5 -0.5 2869 1
i 4 47.20327421555253 2 8.33333333333333 68 -1 -0.43571939204204 -0.5 -0.5 367232 1
i 4 47.20327421555253 2 8.58333333333333 68 -1 -0.20331928107999 -0.5 -0.5 367232 1
i 4 47.20327421555253 2 8.33333333333333 68 -1 -0.2063838794141 -0.5 -0.5 367232 1
i 4 47.47612551159618 2 7.66666666666667 68 -1 -0.47285282915852 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 7.66666666666667 68 -1 -0.49516291598534 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 8 68 -1 -0.32361784079104 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 7.66666666666667 68 -1 -0.0458818247788 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 7.66666666666667 68 -1 -0.43572931108701 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.33333333333333 68 -1 -0.04130126885092 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.66666666666667 68 -1 0.12118938539303 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.33333333333333 68 -1 -0.05958481603709 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 8.33333333333333 68 -1 0.24444826800635 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.33333333333333 68 -1 0.06712487229662 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.91666666666667 68 -1 -0.29365721721472 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 9.5 68 -1 -0.07473924842444 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 10 68 -1 -0.45254608431674 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.33333333333333 68 -1 -0.38955493537589 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.91666666666667 68 -1 0.00015498230459 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 9.5 68 -1 0.44074814586765 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 10 68 -1 0.25261749500277 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.33333333333333 68 -1 0.11194286475719 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.91666666666667 68 -1 0.48131496572023 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 9.5 68 -1 0.00056025001835 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 10 68 -1 -0.07312457770116 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.33333333333333 68 -1 -0.4424880210184 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.91666666666667 68 -1 -0.42849237494108 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 9.5 68 -1 -0.10841281186023 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 10 68 -1 -0.02928589065765 -0.5 -0.5 367232 1
i 4 47.47612551159618 2 8.58333333333333 68 -1 -0.41923179744858 -0.5 -0.5 367232 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 0.47524497742796 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 7.66666666666667 68 -1 -0.38070184563552 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 8.33333333333333 68 -1 0.34726244825765 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 8.75 68 -1 -0.26914606482517 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 9.41666666666667 68 -1 -0.03171865814413 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 8 68 -1 0.09434637262795 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 0.06449331577461 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 8 68 -1 -0.23029748997506 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 -0.0263410882578 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 6.33333333333333 68 -1 -0.36686630094579 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 6.33333333333333 68 -1 -0.41226635663383 -0.5 -0.5 2869 1
i 6 47.74897680763984 2 6.91666666666667 68 -1 0.23398792345792 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 7.41666666666667 68 -1 -0.1287546159752 -0.5 -0.5 2869 1
i 6 47.74897680763984 2 8 68 -1 -0.28605700035356 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 6.66666666666667 68 -1 0.28352969234752 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 8.58333333333333 68 -1 0.47117888849171 -0.5 -0.5 367232 1
i 3 48.0218281036835 2 8 68 -1 -0.24744254369868 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8.33333333333333 68 -1 0.3892886168107 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8 68 -1 -0.00436448311268 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 7.66666666666667 68 -1 -0.15672896852099 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 7.66666666666667 68 -1 -0.2085362138187 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 8.33333333333333 68 -1 -0.02486634307563 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 8.75 68 -1 -0.16370371690623 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 9.41666666666667 68 -1 0.17517820081026 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8 68 -1 -0.43070426750672 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.66666666666667 68 -1 -0.20457149351347 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.91666666666667 68 -1 -0.05114509446146 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.66666666666667 68 -1 0.22899512478527 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 8.58333333333333 68 -1 0.10211041670291 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 8 68 -1 -0.46769770504873 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 7.66666666666667 68 -1 0.27158921730268 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 8 68 -1 -0.03847469397721 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 8.33333333333333 68 -1 0.0104758165357 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 8 68 -1 0.01049105777846 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 6.66666666666667 68 -1 -0.06667985576889 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 6.33333333333333 68 -1 -0.08973811614146 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 10 68 -1 -0.02846055816611 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10.33333333333333 68 -1 -0.13578468219709 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 -0.19837977761721 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 -0.01569210647344 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 0.36428037493831 -0.5 -0.5 367232 1
i 4 48.29467939972715 2 8.58333333333333 68 -1 -0.22407717578129 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 -0.3178515791057 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 8 68 -1 -0.00583082843194 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 0.00462432314969 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 8 68 -1 -0.33585141662741 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 -0.28889261424875 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.33333333333333 68 -1 -0.02358713977503 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.66666666666667 68 -1 -0.19755618033705 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.33333333333333 68 -1 0.22589475666931 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 10 68 -1 0.27266597879851 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 0.30329940854927 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10.33333333333333 68 -1 -0.01170556678261 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 0.41979576732084 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 0.08885108320425 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.58333333333333 68 -1 -0.37160732306155 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.91666666666667 68 -1 0.39032663923638 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.58333333333333 68 -1 0.04833670131182 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 7.66666666666667 68 -1 0.37281886845699 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 7.66666666666667 68 -1 -0.39842343419367 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 8 68 -1 0.0013561664278 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 7.66666666666667 68 -1 0.32317880803532 -0.5 -0.5 2869 1
i 4 48.84038199181446 2 6.33333333333333 68 -1 -0.34206623349739 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 10 68 -1 0.30705463117489 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 10 68 -1 -0.08259730906576 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 10.58333333333333 68 -1 0.42650757401856 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 11.25 68 -1 0.04501296085319 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 11.75 68 -1 -0.43002050682223 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 10.33333333333333 68 -1 -0.44412204130347 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10 68 -1 -0.42144652545859 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10.33333333333333 68 -1 0.27243438477061 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10 68 -1 -0.23292853615064 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 8.58333333333333 68 -1 0.14697124367116 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 8.58333333333333 68 -1 -0.33548662401551 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 9.25 68 -1 0.28347528765628 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 9.75 68 -1 0.11184750502117 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 10.33333333333333 68 -1 0.00677319385844 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 8.91666666666667 68 -1 -0.29521911867704 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 7.66666666666667 68 -1 0.17922803334763 -0.5 -0.5 2869 1
i 3 49.11323328785812 2 7.66666666666667 68 -1 -0.35129557044022 -0.5 -0.5 2869 1
i 4 49.11323328785812 2 6.33333333333333 68 -1 -0.1475269554499 -0.5 -0.5 2869 1
i 3 49.11323328785812 2 10.33333333333333 68 -1 -0.20716391097722 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10.58333333333333 68 -1 -0.08835026309613 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 10.33333333333333 68 -1 0.46248918741203 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10 68 -1 -0.3236734164617 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 10 68 -1 0.02133601727453 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 10.58333333333333 68 -1 -0.09589531861277 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 11.25 68 -1 0.16621336056186 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 11.75 68 -1 -0.43183862836679 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10.33333333333333 68 -1 0.49014714431652 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 8.91666666666667 68 -1 0.13958873096421 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 9.25 68 -1 0.04009149461592 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 8.91666666666667 68 -1 -0.15813819058751 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 -0.28478178621807 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 8 68 -1 -0.2979246663475 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 0.39201106438642 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 -0.13729131092363 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.33333333333333 68 -1 -0.39356280182369 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.66666666666667 68 -1 -0.41265222312137 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.33333333333333 68 -1 0.26063384294684 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 10.33333333333333 68 -1 -0.02071975336303 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10 68 -1 0.11832685213114 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10.33333333333333 68 -1 0.33262445131153 -0.5 -0.5 367232 1
i 4 49.38608458390177 2 10.58333333333333 68 -1 0.27949639604307 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10.33333333333333 68 -1 0.2063246671941 -0.5 -0.5 367232 1
i 4 49.38608458390177 2 8.91666666666667 68 -1 0.02131463175828 -0.5 -0.5 367232 1
i 4 49.38608458390177 2 8.58333333333333 68 -1 0.30556709495956 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 7.66666666666667 68 -1 0.04742480312955 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 7.66666666666667 68 -1 0.02727235679407 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 8.33333333333333 68 -1 -0.22507184969211 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 8.75 68 -1 0.15302072804454 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 9.41666666666667 68 -1 -0.20855769736967 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 7.66666666666667 68 -1 0.34434329482968 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 8 68 -1 -0.30372415370104 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 7.66666666666667 68 -1 0.42246733430003 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 6.33333333333333 68 -1 -0.07164670404114 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 6.33333333333333 68 -1 -0.13718335496419 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 6.91666666666667 68 -1 -0.48515865476294 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 7.41666666666667 68 -1 0.42055861939284 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 8 68 -1 0.04582042258394 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 6.33333333333333 68 -1 -0.41939733361693 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 6.91666666666667 68 -1 -0.35417321276261 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 7.41666666666667 68 -1 0.45274708421395 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 8 68 -1 -0.11202447502345 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 6.66666666666667 68 -1 -0.17337391026509 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 10 68 -1 0.39707407348044 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10.33333333333333 68 -1 0.4242997998282 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10 68 -1 -0.29708789408392 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10.33333333333333 68 -1 -0.22166297333556 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10 68 -1 0.42188302769268 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.58333333333333 68 -1 0.02615685128533 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.91666666666667 68 -1 0.25235528895392 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.58333333333333 68 -1 -0.15491716630276 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 7.66666666666667 68 -1 0.40673153746951 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 7.66666666666667 68 -1 0.01312700468543 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.33333333333333 68 -1 -0.03462332915286 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.75 68 -1 0.12611090516073 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 9.41666666666667 68 -1 -0.2714303753898 -0.5 -0.5 2869 1
i 4 49.93178717598909 2 7.66666666666667 68 -1 0.05287816062487 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.33333333333333 68 -1 0.14946799788842 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.75 68 -1 -0.32634727584358 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 9.41666666666667 68 -1 0.04273125160212 -0.5 -0.5 2869 1
i 3 49.93178717598909 2 8 68 -1 -0.39758400586265 -0.5 -0.5 2869 1
i 4 49.93178717598909 2 6.66666666666667 68 -1 0.3208003523116 -0.5 -0.5 2869 1
i 3 49.93178717598909 2 10 68 -1 -0.18374160286128 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10 68 -1 -0.42906666117668 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10.33333333333333 68 -1 0.12218561468198 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10 68 -1 -0.2723540920073 -0.5 -0.5 367232 1
i 4 49.93178717598909 2 8.58333333333333 68 -1 -0.49799870471253 -0.5 -0.5 367232 1
i 3 50.20463847203274 2 8 68 -1 0.29806701116204 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.66666666666667 68 -1 -0.17544962933349 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.91666666666667 68 -1 -0.13536286616983 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.66666666666667 68 -1 0.3765181476816 -0.5 -0.5 2869 1
i 3 50.20463847203274 2 10 68 -1 0.03220890880947 -0.5 -0.5 367232 1
i 3 50.20463847203274 2 10 68 -1 0.42856471699367 -0.5 -0.5 367232 1
i 4 50.20463847203274 2 8.58333333333333 68 -1 0.29052902899496 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 8 68 -1 0.29096297974929 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8.33333333333333 68 -1 -0.10631257193447 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 -0.39711632127052 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 0.48915718527827 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8.33333333333333 68 -1 0.14005168683495 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 -0.19054462654573 -0.5 -0.5 2869 1
i 4 50.4774897680764 2 6.66666666666667 68 -1 -0.19514238084174 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 6.66666666666667 68 -1 -0.22058386757481 -0.5 -0.5 2869 1
i 5 50.4774897680764 2 7.33333333333333 68 -1 0.08147905709471 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 7.66666666666667 68 -1 -0.4041853468189 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 8.33333333333333 68 -1 0.40224575188657 -0.5 -0.5 2869 1
i 4 50.4774897680764 2 6.91666666666667 68 -1 0.18821262828013 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 10 68 -1 0.45626656325745 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 10.33333333333333 68 -1 0.44805301263725 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 10 68 -1 -0.1196494882544 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 10 68 -1 -0.35119710127455 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.58333333333333 68 -1 -0.45032712778231 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.91666666666667 68 -1 -0.43173400967836 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.58333333333333 68 -1 -0.26729127898302 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 9.41666666666667 68 -1 0.31210223125946 -0.5 -0.5 2869 1
i 2 50.75034106412005 2 9.66666666666667 68 -1 -0.3911218229059 -0.5 -0.5 2869 1
i 2 50.75034106412005 2 9.41666666666667 68 -1 -0.47876878203151 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 8 68 -1 0.22179380687087 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 8 68 -1 0.40865197181073 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 8.66666666666667 68 -1 -0.31204162887595 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 9.16666666666667 68 -1 0.05415878343985 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 9.66666666666667 68 -1 0.09457363623454 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 8.33333333333333 68 -1 -0.42258358001323 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 8 68 -1 -0.4951519099024 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 6.91666666666667 68 -1 0.08545184544017 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 7.33333333333333 68 -1 0.46079141378644 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 6.91666666666667 68 -1 0.17008705634956 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 10 68 -1 -0.21273144596694 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 10 68 -1 -0.41939977165872 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 10.58333333333333 68 -1 0.22964158483909 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 11.25 68 -1 -0.0519122511915 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 11.75 68 -1 -0.13214901546735 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10 68 -1 0.06886160181434 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10.33333333333333 68 -1 0.37622490411204 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10 68 -1 0.13173990110009 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 8.58333333333333 68 -1 0.09219740013533 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 8.58333333333333 68 -1 -0.39977483238615 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 9.25 68 -1 0.07245068932594 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 9.75 68 -1 -0.21492820721935 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 10.33333333333333 68 -1 0.06112540245922 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 8.58333333333333 68 -1 -0.46494736057194 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 9.25 68 -1 -0.33190230104619 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 9.75 68 -1 -0.27641915328064 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 10.33333333333333 68 -1 -0.40061209222247 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 8.91666666666667 68 -1 0.22287626749029 -0.5 -0.5 367232 1
i 3 51.02319236016371 2 9.41666666666667 68 -1 -0.48376994354488 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.33333333333333 68 -1 -0.40914798286919 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.66666666666667 68 -1 -0.10664579797858 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.33333333333333 68 -1 0.24767515706342 -0.5 -0.5 2869 1
i 4 51.02319236016371 2 6.91666666666667 68 -1 -0.03963734874477 -0.5 -0.5 2869 1
i 4 51.02319236016371 2 6.66666666666667 68 -1 -0.07655775759206 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 10 68 -1 -0.02169224288794 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 10 68 -1 0.00434092982682 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 10.58333333333333 68 -1 -0.06812220468777 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.25 68 -1 0.36607930066431 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 11.75 68 -1 0.48622212999871 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 10 68 -1 0.16709882824612 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 10.58333333333333 68 -1 0.33506067694537 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.25 68 -1 0.10838415264731 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.75 68 -1 -0.3941784580322 -0.5 -0.5 367232 1
i 3 51.02319236016371 2 10.33333333333333 68 -1 -0.34387414547811 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 8.91666666666667 68 -1 0.00250507334802 -0.5 -0.5 367232 1
i 3 51.29604365620737 2 8.33333333333333 68 -1 -0.01813136674665 -0.5 -0.5 2869 1
i 3 51.29604365620737 2 8 68 -1 -0.05915242725365 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.66666666666667 68 -1 0.09857414230688 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.91666666666667 68 -1 -0.09410698387716 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.66666666666667 68 -1 -0.47100501420849 -0.5 -0.5 2869 1
i 3 51.29604365620737 2 10.33333333333333 68 -1 0.29278585274311 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 8.91666666666667 68 -1 0.34346283189588 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 9.25 68 -1 -0.06518140869526 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 8.91666666666667 68 -1 0.35288629045263 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 8 68 -1 -0.21654852391846 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 8.33333333333333 68 -1 -0.3162079161752 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 8 68 -1 0.13707165938504 -0.5 -0.5 2869 1
i 4 51.56889495225102 2 6.66666666666667 68 -1 -0.14153602097184 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 0.21077567756445 -0.5 -0.5 367232 1
i 4 51.56889495225102 2 10.58333333333333 68 -1 0.15849848298106 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 -0.39631863613915 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 0.42136202019606 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.58333333333333 68 -1 -0.26598135196275 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 -0.05768866850895 -0.5 -0.5 367232 1
i 4 51.56889495225102 2 8.91666666666667 68 -1 0.32823912142358 -0.5 -0.5 367232 1
i 6 51.56889495225102 2 8.91666666666667 68 -1 -0.0773522208469 -0.5 -0.5 367232 1
i 6 51.56889495225102 2 9.5 68 -1 0.33928886542924 -0.5 -0.5 367232 1
i 6 51.56889495225102 2 10 68 -1 0.47258369378915 -0.5 -0.5 367232 1
i 6 51.56889495225102 2 10.58333333333333 68 -1 0.05327632637066 -0.5 -0.5 367232 1
i 4 51.56889495225102 2 9.25 68 -1 0.16309675190149 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 8 68 -1 0.2670872548946 -0.5 -0.5 2869 1
i 4 51.84174624829468 2 6.66666666666667 68 -1 0.19366531275955 -0.5 -0.5 2869 1
i 3 51.84174624829468 2 11.75 68 -1 -0.10936487187761 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 12 68 -1 -0.22097007621337 -0.5 -0.5 367232 1
i 2 51.84174624829468 2 11.75 68 -1 0.30763570480837 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.33333333333333 68 -1 -0.11010198615812 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 10.33333333333333 68 -1 -0.27864525043303 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 10.91666666666667 68 -1 -0.05592250628419 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 11.5 68 -1 -0.30366496582672 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 12 68 -1 0.28413175800314 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.58333333333333 68 -1 -0.23013205832355 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.33333333333333 68 -1 -0.38794431507865 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.25 68 -1 0.36303126729339 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.5 68 -1 0.13494305554962 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.25 68 -1 0.19609337173177 -0.5 -0.5 367232 1
i 4 52.11459754433834 2 8 68 -1 -0.35327534409326 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.66666666666667 68 -1 -0.33775549166915 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.91666666666667 68 -1 0.10734675301182 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.66666666666667 68 -1 -0.06730920302859 -0.5 -0.5 2869 1
i 2 52.11459754433834 2 11.75 68 -1 0.15579219049923 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.58333333333333 68 -1 -0.39158838243461 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.91666666666667 68 -1 -0.47414873757273 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.58333333333333 68 -1 -0.2445732713447 -0.5 -0.5 367232 1
i 4 52.11459754433834 2 9.25 68 -1 -0.46014590713892 -0.5 -0.5 367232 1
i 4 52.11459754433834 2 8.91666666666667 68 -1 -0.44301230109828 -0.5 -0.5 367232 1
i 3 52.38744884038199 2 8 68 -1 -0.14621199315637 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 8.33333333333333 68 -1 0.47701992593117 -0.5 -0.5 2869 1
i 3 52.38744884038199 2 8 68 -1 -0.30984344080767 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 6.66666666666667 68 -1 0.34860817060283 -0.5 -0.5 2869 1
i 6 52.38744884038199 2 6.66666666666667 68 -1 -0.29069112425549 -0.5 -0.5 2869 1
i 5 52.38744884038199 2 7.33333333333333 68 -1 0.04991332109369 -0.5 -0.5 2869 1
i 6 52.38744884038199 2 7.66666666666667 68 -1 -0.32540969308782 -0.5 -0.5 2869 1
i 5 52.38744884038199 2 8.33333333333333 68 -1 -0.3263866299462 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 6.33333333333333 68 -1 0.29295068595721 -0.5 -0.5 2869 1
i 3 52.38744884038199 2 10.58333333333333 68 -1 0.15052676094133 -0.5 -0.5 367232 1
i 3 52.38744884038199 2 10.33333333333333 68 -1 0.23637023303968 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 8.91666666666667 68 -1 0.16797925068146 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 9.25 68 -1 0.35762496257674 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 8.91666666666667 68 -1 -0.36912301480882 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 8 68 -1 -0.10328022787994 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 8 68 -1 0.47573836982687 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 8.66666666666667 68 -1 0.19855858333445 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 9.16666666666667 68 -1 0.34759891486852 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 9.66666666666667 68 -1 0.05547467567865 -0.5 -0.5 2869 1
i 3 52.66030013642565 2 7.66666666666667 68 -1 -0.08846431144577 -0.5 -0.5 2869 1
i 4 52.66030013642565 2 6.33333333333333 68 -1 -0.08331739768569 -0.5 -0.5 2869 1
i 3 52.66030013642565 2 10.33333333333333 68 -1 0.19841377396461 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 10.58333333333333 68 -1 0.25117495511742 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 10.33333333333333 68 -1 -0.25298845222776 -0.5 -0.5 367232 1
i 4 52.66030013642565 2 8.91666666666667 68 -1 -0.02757248061681 -0.5 -0.5 367232 1
i 4 52.93315143246931 2 7.66666666666667 68 -1 -0.24935375280414 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.33333333333333 68 -1 0.10428028548181 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.66666666666667 68 -1 -0.03412104341059 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.33333333333333 68 -1 -0.19748651577243 -0.5 -0.5 2869 1
i 3 52.93315143246931 2 10.33333333333333 68 -1 -0.096363608756 -0.5 -0.5 367232 1
i 4 52.93315143246931 2 8.91666666666667 68 -1 0.2405160126711 -0.5 -0.5 367232 1
i 3 53.20600272851296 2 7.66666666666667 68 -1 0.12095524163652 -0.5 -0.5 2869 1
i 3 53.20600272851296 2 8 68 -1 0.28537775614308 -0.5 -0.5 2869 1
i 3 53.20600272851296 2 7.66666666666667 68 -1 -0.39759010400313 -0.5 -0.5 2869 1
i 4 53.20600272851296 2 6.33333333333333 68 -1 -0.18626448493546 -0.5 -0.5 2869 1
i 6 53.20600272851296 2 6.33333333333333 68 -1 0.35852761474053 -0.5 -0.5 2869 1
i 5 53.20600272851296 2 6.91666666666667 68 -1 -0.27658722796664 -0.5 -0.5 2869 1
i 6 53.20600272851296 2 7.41666666666667 68 -1 0.07205453770669 -0.5 -0.5 2869 1
i 5 53.20600272851296 2 8 68 -1 -0.24758690012271 -0.5 -0.5 2869 1
i 4 53.20600272851296 2 6.66666666666667 68 -1 -0.2095212656674 -0.5 -0.5 2869 1
i 4 53.20600272851296 2 10.33333333333333 68 -1 -0.14439168632777 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 8.91666666666667 68 -1 -0.07702965104643 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 9.25 68 -1 0.09487618358629 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 8.91666666666667 68 -1 -0.06820473538673 -0.5 -0.5 367232 1
i 3 53.47885402455662 2 7.66666666666667 68 -1 0.12585180262825 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 7.66666666666667 68 -1 -0.38748357258441 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 8.33333333333333 68 -1 0.00887404785721 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 8.75 68 -1 -0.37884034731089 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 9.41666666666667 68 -1 -0.27151833196678 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 8 68 -1 -0.09706503507345 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.66666666666667 68 -1 0.00824786199831 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.91666666666667 68 -1 -0.11129356677871 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.66666666666667 68 -1 -0.34303747155854 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 10.33333333333333 68 -1 0.09820967274331 -0.5 -0.5 367232 1
i 3 53.47885402455662 2 10.58333333333333 68 -1 0.38516306202452 -0.5 -0.5 367232 1
i 3 53.47885402455662 2 10.33333333333333 68 -1 0.2953319603095 -0.5 -0.5 367232 1
i 4 53.47885402455662 2 8.91666666666667 68 -1 0.30340618256906 -0.5 -0.5 367232 1
i 6 53.47885402455662 2 8.91666666666667 68 -1 -0.36806426769782 -0.5 -0.5 367232 1
i 6 53.47885402455662 2 9.5 68 -1 -0.16669584110951 -0.5 -0.5 367232 1
i 6 53.47885402455662 2 10 68 -1 -0.06129226066382 -0.5 -0.5 367232 1
i 6 53.47885402455662 2 10.58333333333333 68 -1 -0.23353353497715 -0.5 -0.5 367232 1
i 4 53.47885402455662 2 8.58333333333333 68 -1 0.09690385509728 -0.5 -0.5 367232 1
i 3 53.75170532060027 2 8 68 -1 -0.38654123410979 -0.5 -0.5 2869 1
i 3 53.75170532060027 2 8.33333333333333 68 -1 -0.18806193283617 -0.5 -0.5 2869 1
i 3 53.75170532060027 2 8 68 -1 -0.23300877905556 -0.5 -0.5 2869 1
i 4 53.75170532060027 2 6.66666666666667 68 -1 -0.34684856341794 -0.5 -0.5 2869 1
i 4 53.75170532060027 2 6.33333333333333 68 -1 -0.22517145413032 -0.5 -0.5 2869 1
i 4 53.75170532060027 2 10.33333333333333 68 -1 0.23029536889151 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 10.33333333333333 68 -1 0.01813720881082 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 10.91666666666667 68 -1 0.0696411828974 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 11.5 68 -1 0.30258173287944 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 12 68 -1 0.35004368392948 -0.5 -0.5 367232 1
i 3 53.75170532060027 2 10 68 -1 -0.31926532018982 -0.5 -0.5 367232 1
i 4 53.75170532060027 2 8.58333333333333 68 -1 -0.26667010434589 -0.5 -0.5 367232 1
i 3 54.02455661664393 2 8 68 -1 0.34325598809316 -0.5 -0.5 2869 1
i 3 54.02455661664393 2 7.66666666666667 68 -1 0.3709087772291 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.33333333333333 68 -1 -0.13470442219067 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.66666666666667 68 -1 0.496426069964 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.33333333333333 68 -1 -0.06393294113688 -0.5 -0.5 2869 1
i 3 54.02455661664393 2 10 68 -1 0.46315512182471 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.58333333333333 68 -1 0.43594356308723 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.91666666666667 68 -1 -0.11014102498881 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.58333333333333 68 -1 -0.48351892893355 -0.5 -0.5 367232 1
i 3 54.29740791268758 2 7.66666666666667 68 -1 0.19526215952364 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 8 68 -1 -0.0621532406664 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 7.66666666666667 68 -1 0.42997966149962 -0.5 -0.5 2869 1
i 4 54.29740791268758 2 6.33333333333333 68 -1 0.15834165238062 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 10 68 -1 -0.05942482365415 -0.5 -0.5 367232 1
i 4 54.29740791268758 2 10.33333333333333 68 -1 0.03898842877639 -0.5 -0.5 367232 1
i 3 54.29740791268758 2 10 68 -1 -0.16849558893484 -0.5 -0.5 367232 1
i 4 54.29740791268758 2 8.58333333333333 68 -1 -0.30988952252837 -0.5 -0.5 367232 1
i 6 54.29740791268758 2 8.58333333333333 68 -1 0.08541340757511 -0.5 -0.5 367232 1
i 6 54.29740791268758 2 9.25 68 -1 0.38861098939092 -0.5 -0.5 367232 1
i 5 54.29740791268758 2 9.75 68 -1 0.48376983296585 -0.5 -0.5 367232 1
i 5 54.29740791268758 2 10.33333333333333 68 -1 0.20668310276167 -0.5 -0.5 367232 1
i 4 54.29740791268758 2 8.91666666666667 68 -1 0.04160954481501 -0.5 -0.5 367232 1
i 3 54.57025920873124 2 7.66666666666667 68 -1 -0.05196700444045 -0.5 -0.5 2869 1
i 4 54.57025920873124 2 6.33333333333333 68 -1 0.15880306423218 -0.5 -0.5 2869 1
i 3 54.57025920873124 2 10 68 -1 0.29454389452278 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 10 68 -1 -0.19225205359288 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 10.58333333333333 68 -1 0.38612550129049 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 11.25 68 -1 0.24151457512957 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 11.75 68 -1 -0.35138807744494 -0.5 -0.5 367232 1
i 3 54.57025920873124 2 10.33333333333333 68 -1 -0.13089420197759 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 8.91666666666667 68 -1 0.12184568338235 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 9.25 68 -1 -0.14493100392151 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 8.91666666666667 68 -1 -0.34215104876089 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 7.66666666666667 68 -1 -0.2741028556337 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.33333333333333 68 -1 -0.22274820511524 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.66666666666667 68 -1 -0.15400805370686 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.33333333333333 68 -1 0.1519594792424 -0.5 -0.5 2869 1
i 3 54.8431105047749 2 10.33333333333333 68 -1 0.16055039767943 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 10.58333333333333 68 -1 0.11781511694258 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 10.33333333333333 68 -1 -0.22295721532785 -0.5 -0.5 367232 1
i 4 54.8431105047749 2 8.91666666666667 68 -1 0.19488332089131 -0.5 -0.5 367232 1
i 4 54.8431105047749 2 8.58333333333333 68 -1 0.35704163168845 -0.5 -0.5 367232 1
i 3 55.11596180081855 2 7.66666666666667 68 -1 0.48875024222778 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 8 68 -1 -0.02488439809274 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 7.66666666666667 68 -1 -0.32287481418473 -0.5 -0.5 2869 1
i 4 55.11596180081855 2 6.33333333333333 68 -1 0.11597521769803 -0.5 -0.5 2869 1
i 5 55.11596180081855 2 6.33333333333333 68 -1 0.43914898344013 -0.5 -0.5 2869 1
i 6 55.11596180081855 2 6.91666666666667 68 -1 0.04342836994754 -0.5 -0.5 2869 1
i 5 55.11596180081855 2 7.41666666666667 68 -1 -0.36598936600727 -0.5 -0.5 2869 1
i 6 55.11596180081855 2 8 68 -1 0.28359819273252 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 10.33333333333333 68 -1 0.32010730986957 -0.5 -0.5 367232 1
i 3 55.11596180081855 2 10 68 -1 0.19727125881507 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.58333333333333 68 -1 0.32720719800931 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.91666666666667 68 -1 0.10837647952915 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.58333333333333 68 -1 -0.13067961284052 -0.5 -0.5 367232 1
i 3 55.38881309686221 2 7.66666666666667 68 -1 -0.00893282537632 -0.5 -0.5 2869 1
i 5 55.38881309686221 2 7.66666666666667 68 -1 -0.22921063563858 -0.5 -0.5 2869 1
i 4 55.38881309686221 2 8.33333333333333 68 -1 0.24368547072669 -0.5 -0.5 2869 1
i 4 55.38881309686221 2 8.75 68 -1 0.33517135116727 -0.5 -0.5 2869 1
i 5 55.38881309686221 2 9.41666666666667 68 -1 -0.3863920749676 -0.5 -0.5 2869 1
i 4 55.38881309686221 2 6.33333333333333 68 -1 0.45387823431275 -0.5 -0.5 2869 1
i 3 55.38881309686221 2 10 68 -1 0.43082814599528 -0.5 -0.5 367232 1
i 3 55.38881309686221 2 10.33333333333333 68 -1 0.47793407983633 -0.5 -0.5 367232 1
i 3 55.38881309686221 2 10 68 -1 0.33079744187666 -0.5 -0.5 367232 1
i 4 55.38881309686221 2 8.58333333333333 68 -1 -0.33458536136283 -0.5 -0.5 367232 1
i 3 55.66166439290586 2 7.66666666666667 68 -1 -0.25932481705114 -0.5 -0.5 2869 1
i 4 55.66166439290586 2 6.33333333333333 68 -1 0.38006250192364 -0.5 -0.5 2869 1
i 3 55.66166439290586 2 10 68 -1 -0.1499600777925 -0.5 -0.5 367232 1
i 4 55.66166439290586 2 8.58333333333333 68 -1 0.11301745899551 -0.5 -0.5 367232 1
i 3 55.93451568894952 2 7.66666666666667 68 -1 -0.44560801951452 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.33333333333333 68 -1 0.20069880450722 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.66666666666667 68 -1 0.43733712572984 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.33333333333333 68 -1 -0.01394025782093 -0.5 -0.5 2869 1
i 3 55.93451568894952 2 10 68 -1 -0.33808130054506 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.58333333333333 68 -1 -0.40097558376718 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.91666666666667 68 -1 0.48097857915723 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.58333333333333 68 -1 -0.10514025874533 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 7.66666666666667 68 -1 0.14384265453854 -0.5 -0.5 2869 1
i 3 56.20736698499317 2 8 68 -1 0.38427478914882 -0.5 -0.5 2869 1
i 4 56.20736698499317 2 7.66666666666667 68 -1 -0.17544961266559 -0.5 -0.5 2869 1
i 4 56.20736698499317 2 6.33333333333333 68 -1 -0.29954322874081 -0.5 -0.5 2869 1
i 6 56.20736698499317 2 6.33333333333333 68 -1 0.35738591412956 -0.5 -0.5 2869 1
i 6 56.20736698499317 2 6.91666666666667 68 -1 -0.49703847704203 -0.5 -0.5 2869 1
i 5 56.20736698499317 2 7.41666666666667 68 -1 -0.41549669872113 -0.5 -0.5 2869 1
i 6 56.20736698499317 2 8 68 -1 -0.15031453602933 -0.5 -0.5 2869 1
i 4 56.20736698499317 2 6.66666666666667 68 -1 -0.17565145885059 -0.5 -0.5 2869 1
i 3 56.20736698499317 2 10 68 -1 -0.37016947487316 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 10.33333333333333 68 -1 0.17706580161153 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 10 68 -1 0.44219180555908 -0.5 -0.5 367232 1
i 4 56.20736698499317 2 8.58333333333333 68 -1 -0.16914086833585 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 8.58333333333333 68 -1 -0.33707542606986 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 9.25 68 -1 -0.29073376520385 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 9.75 68 -1 -0.49030230962691 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 10.33333333333333 68 -1 0.46278836900974 -0.5 -0.5 367232 1
i 3 56.48021828103683 2 7.66666666666667 68 -1 -0.18602884545806 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 7.66666666666667 68 -1 0.18051074451059 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 8.33333333333333 68 -1 0.31416912651769 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 8.75 68 -1 0.28881073878306 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 9.41666666666667 68 -1 0.27525299991901 -0.5 -0.5 2869 1
i 3 56.48021828103683 2 8 68 -1 -0.3453765099905 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.66666666666667 68 -1 -0.4477095547548 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.91666666666667 68 -1 0.02423980010818 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.66666666666667 68 -1 0.04038304556419 -0.5 -0.5 2869 1
i 3 56.48021828103683 2 10 68 -1 -0.4164020608181 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 10 68 -1 -0.15660042082982 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 10.58333333333333 68 -1 -0.24776290599946 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 11.25 68 -1 0.15461018112615 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 11.75 68 -1 0.23459427483453 -0.5 -0.5 367232 1
i 4 56.48021828103683 2 8.58333333333333 68 -1 -0.27467861925943 -0.5 -0.5 367232 1
i 3 56.7530695770805 2 8 68 -1 -0.11448062780643 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 8.33333333333333 68 -1 -0.30562438034495 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 8 68 -1 -0.02203409642246 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 6.66666666666667 68 -1 -0.46545338517786 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 6.33333333333333 68 -1 0.12986210102077 -0.5 -0.5 2869 1
i 3 56.7530695770805 2 10 68 -1 -0.0629776703402 -0.5 -0.5 367232 1
i 4 56.7530695770805 2 8.58333333333333 68 -1 -0.0824455242467 -0.5 -0.5 367232 1
i 3 57.02592087312415 2 8 68 -1 0.06050689389217 -0.5 -0.5 2869 1
i 3 57.02592087312415 2 7.66666666666667 68 -1 -0.44643895647898 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.33333333333333 68 -1 0.26794067297403 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.66666666666667 68 -1 0.07503752880437 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.33333333333333 68 -1 -0.19508619962303 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 10 68 -1 -0.0303529225685 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.58333333333333 68 -1 0.25693752823284 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.91666666666667 68 -1 -0.28711557133612 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.58333333333333 68 -1 0.04284286923284 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 7.66666666666667 68 -1 0.466966738631 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 8 68 -1 -0.06037213307288 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 7.66666666666667 68 -1 -0.12926795293897 -0.5 -0.5 2869 1
i 4 57.2987721691678 2 6.33333333333333 68 -1 -0.13260726464728 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 10 68 -1 0.04831502464428 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 10.33333333333333 68 -1 0.31450669590468 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 10 68 -1 0.35329483704107 -0.5 -0.5 367232 1
i 4 57.2987721691678 2 8.58333333333333 68 -1 -0.4056555300995 -0.5 -0.5 367232 1
i 5 57.2987721691678 2 8.58333333333333 68 -1 -0.00856186414722 -0.5 -0.5 367232 1
i 6 57.2987721691678 2 9.25 68 -1 0.12954370591153 -0.5 -0.5 367232 1
i 5 57.2987721691678 2 9.75 68 -1 -0.35665976677476 -0.5 -0.5 367232 1
i 5 57.2987721691678 2 10.33333333333333 68 -1 -0.15723309501577 -0.5 -0.5 367232 1
i 4 57.2987721691678 2 8.91666666666667 68 -1 -0.43588054661028 -0.5 -0.5 367232 1
i 3 57.57162346521146 2 7.66666666666667 68 -1 -0.05282272444419 -0.5 -0.5 2869 1
i 4 57.57162346521146 2 6.33333333333333 68 -1 -0.26725419139878 -0.5 -0.5 2869 1
i 3 57.57162346521146 2 10 68 -1 -0.36634957994633 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 10 68 -1 -0.27736719907611 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 10.58333333333333 68 -1 0.32847092159745 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 11.25 68 -1 0.14136754945842 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 11.75 68 -1 -0.26229363458095 -0.5 -0.5 367232 1
i 3 57.57162346521146 2 10.33333333333333 68 -1 0.44082310988576 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 8.91666666666667 68 -1 -0.1428192261251 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 9.25 68 -1 0.32935688929232 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 8.91666666666667 68 -1 -0.01424835948941 -0.5 -0.5 367232 1
i 3 57.84447476125511 2 7.66666666666667 68 -1 -0.4006057715248 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.33333333333333 68 -1 -0.27869047466173 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.66666666666667 68 -1 0.32423130681026 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.33333333333333 68 -1 0.02752120696278 -0.5 -0.5 2869 1
i 3 57.84447476125511 2 10.33333333333333 68 -1 0.47440772635071 -0.5 -0.5 367232 1
i 3 57.84447476125511 2 10.58333333333333 68 -1 0.04362651079897 -0.5 -0.5 367232 1
i 3 57.84447476125511 2 10.33333333333333 68 -1 0.13319332798471 -0.5 -0.5 367232 1
i 4 57.84447476125511 2 8.91666666666667 68 -1 0.37622401275508 -0.5 -0.5 367232 1
i 4 57.84447476125511 2 8.58333333333333 68 -1 -0.08137944095531 -0.5 -0.5 367232 1
i 3 58.11732605729877 2 7.66666666666667 68 -1 0.16970679700963 -0.5 -0.5 2869 1
i 3 58.11732605729877 2 8 68 -1 -0.07312190969706 -0.5 -0.5 2869 1
i 3 58.11732605729877 2 7.66666666666667 68 -1 -0.24377165519126 -0.5 -0.5 2869 1
i 4 58.11732605729877 2 6.33333333333333 68 -1 0.01951009215276 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.33333333333333 68 -1 -0.2394075041969 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 6.91666666666667 68 -1 0.0328082085047 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 7.41666666666667 68 -1 0.39638135416366 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 8 68 -1 0.01950330919124 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.33333333333333 68 -1 0.3925725413171 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.91666666666667 68 -1 0.44763661596252 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 7.41666666666667 68 -1 -0.33030175691836 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 8 68 -1 -0.38886134007426 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.33333333333333 68 -1 0.08168143824788 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 6.91666666666667 68 -1 -0.32066184924848 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 7.41666666666667 68 -1 0.13140520569085 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 8 68 -1 -0.23452774745267 -0.5 -0.5 2869 1
i 4 58.11732605729877 2 6.66666666666667 68 -1 -0.09515082836158 -0.5 -0.5 2869 1
i 4 58.11732605729877 2 10.33333333333333 68 -1 0.13524357074052 -0.5 -0.5 367232 1
i 3 58.11732605729877 2 10 68 -1 -0.02706205239547 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.58333333333333 68 -1 0.00331750699733 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.91666666666667 68 -1 0.39434185875226 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.58333333333333 68 -1 0.39030724910612 -0.5 -0.5 367232 1
i 3 58.39017735334242 2 7.66666666666667 68 -1 -0.36182718244496 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 7.66666666666667 68 -1 0.07613528288826 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.33333333333333 68 -1 -0.1728110224861 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.75 68 -1 -0.48916081346362 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 9.41666666666667 68 -1 -0.20774166756205 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 7.66666666666667 68 -1 -0.04116915037938 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.33333333333333 68 -1 0.39965758153467 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.75 68 -1 -0.44557458581801 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 9.41666666666667 68 -1 -0.03918757416361 -0.5 -0.5 2869 1
i 4 58.39017735334242 2 6.66666666666667 68 -1 0.48260527233619 -0.5 -0.5 2869 1
i 3 58.39017735334242 2 10 68 -1 0.31562836363362 -0.5 -0.5 367232 1
i 3 58.39017735334242 2 10.33333333333333 68 -1 0.26753730017436 -0.5 -0.5 367232 1
i 3 58.39017735334242 2 10 68 -1 -0.35242877762245 -0.5 -0.5 367232 1
i 4 58.39017735334242 2 8.58333333333333 68 -1 -0.24976848113913 -0.5 -0.5 367232 1
i 4 58.66302864938609 2 6.66666666666667 68 -1 -0.01411100565615 -0.5 -0.5 2869 1
i 4 58.66302864938609 2 10 68 -1 -0.1375944001356 -0.5 -0.5 367232 1
i 4 58.66302864938609 2 8.58333333333333 68 -1 0.42739569180155 -0.5 -0.5 367232 1
i 3 58.93587994542975 2 8 68 -1 -0.16402030467198 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 8.33333333333333 68 -1 -0.46976569946644 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 8 68 -1 0.02005170712585 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 8 68 -1 0.38476043375903 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.66666666666667 68 -1 -0.39325739652707 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.91666666666667 68 -1 -0.42426378197215 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.66666666666667 68 -1 -0.3163273869918 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 10 68 -1 -0.19426733667729 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.58333333333333 68 -1 0.27512918173798 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.91666666666667 68 -1 0.36549706164354 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.58333333333333 68 -1 0.30338613170341 -0.5 -0.5 367232 1
i 3 59.2087312414734 2 9.41666666666667 68 -1 0.257769582245 -0.5 -0.5 2869 1
i 2 59.2087312414734 2 9.66666666666667 68 -1 -0.37511545361204 -0.5 -0.5 2869 1
i 2 59.2087312414734 2 9.41666666666667 68 -1 0.03516172810088 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 -0.08749354650785 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 -0.40621940633732 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8.33333333333333 68 -1 -0.21118203261509 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 -0.20802101902395 -0.5 -0.5 2869 1
i 4 59.2087312414734 2 6.66666666666667 68 -1 -0.0892984105206 -0.5 -0.5 2869 1
i 5 59.2087312414734 2 6.66666666666667 68 -1 0.09201290418015 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 7.33333333333333 68 -1 -0.33765857851703 -0.5 -0.5 2869 1
i 5 59.2087312414734 2 7.66666666666667 68 -1 -0.39165203099712 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 8.33333333333333 68 -1 -0.1039091786307 -0.5 -0.5 2869 1
i 4 59.2087312414734 2 6.91666666666667 68 -1 -0.24139468025689 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 10 68 -1 -0.4593608535583 -0.5 -0.5 367232 1
i 3 59.2087312414734 2 10.33333333333333 68 -1 0.0558575093669 -0.5 -0.5 367232 1
i 3 59.2087312414734 2 10 68 -1 0.42968844107283 -0.5 -0.5 367232 1
i 4 59.2087312414734 2 8.58333333333333 68 -1 0.03540833026639 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 8.58333333333333 68 -1 -0.22673687299497 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.25 68 -1 -0.11139013653831 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 9.75 68 -1 0.35925906754759 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 10.33333333333333 68 -1 -0.39658090625771 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 8.58333333333333 68 -1 -0.235469692186 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 9.25 68 -1 0.15839861397327 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.75 68 -1 0.12765357463685 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 10.33333333333333 68 -1 0.33447311620417 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 8.58333333333333 68 -1 -0.25788523653996 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.25 68 -1 -0.46745087662858 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 9.75 68 -1 0.16971663960382 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 10.33333333333333 68 -1 0.13080338808284 -0.5 -0.5 367232 1
i 4 59.2087312414734 2 8.91666666666667 68 -1 0.39241210764755 -0.5 -0.5 367232 1
i 2 59.48158253751706 2 9.41666666666667 68 -1 0.26770642624957 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 8 68 -1 0.25272835419997 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 8 68 -1 -0.05440994721786 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 8.66666666666667 68 -1 -0.24066205984133 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 9.16666666666667 68 -1 0.15820900562627 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 9.66666666666667 68 -1 -0.0193166406542 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 8.33333333333333 68 -1 0.13407118306189 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 6.91666666666667 68 -1 0.33268692791374 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 7.33333333333333 68 -1 0.42213880106715 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 6.91666666666667 68 -1 0.15069966605711 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 10 68 -1 -0.1288015630177 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 10 68 -1 0.19497353593847 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 10.58333333333333 68 -1 -0.27475555432598 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.25 68 -1 0.20246955552465 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 11.75 68 -1 0.35449352625324 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 10 68 -1 -0.34393700712351 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 10.58333333333333 68 -1 -0.39312253112374 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.25 68 -1 -0.20666743775326 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.75 68 -1 -0.17515128972191 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 8.91666666666667 68 -1 -0.4450119482192 -0.5 -0.5 367232 1
i 3 59.75443383356071 2 8.33333333333333 68 -1 -0.12573215714733 -0.5 -0.5 2869 1
i 3 59.75443383356071 2 8.66666666666667 68 -1 0.05722607194225 -0.5 -0.5 2869 1
i 3 59.75443383356071 2 8.33333333333333 68 -1 0.41922594409343 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 6.91666666666667 68 -1 0.37579476771762 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 6.66666666666667 68 -1 0.38750838729175 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 8.91666666666667 68 -1 0.19814376216511 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 8.33333333333333 68 -1 0.15573277382887 -0.5 -0.5 2869 1
i 3 60.02728512960436 2 8 68 -1 -0.27544457514605 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.66666666666667 68 -1 0.15373659126656 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.91666666666667 68 -1 0.06594272192282 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.66666666666667 68 -1 0.1583123159602 -0.5 -0.5 2869 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 -0.07467940193163 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.58333333333333 68 -1 0.18413984094664 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 0.21381219187938 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 0.34351164544804 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 8.91666666666667 68 -1 -0.25270717325255 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 9.25 68 -1 -0.19867099944009 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 8.91666666666667 68 -1 0.22944657799486 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 8 68 -1 0.02512962899363 -0.5 -0.5 2869 1
i 3 60.30013642564802 2 8.33333333333333 68 -1 0.20107252316274 -0.5 -0.5 2869 1
i 3 60.30013642564802 2 8 68 -1 0.20694909303787 -0.5 -0.5 2869 1
i 4 60.30013642564802 2 6.66666666666667 68 -1 -0.16670185287356 -0.5 -0.5 2869 1
i 2 60.30013642564802 2 11.75 68 -1 -0.2315670074832 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 12 68 -1 -0.37733825753376 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 11.75 68 -1 0.330068441372 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 10.33333333333333 68 -1 -0.19064453816321 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.33333333333333 68 -1 -0.07653972990481 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.58333333333333 68 -1 0.27488485834795 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.33333333333333 68 -1 0.34825807142661 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 8.91666666666667 68 -1 0.4110121758553 -0.5 -0.5 367232 1
i 5 60.30013642564802 2 8.91666666666667 68 -1 0.43151328323543 -0.5 -0.5 367232 1
i 6 60.30013642564802 2 9.5 68 -1 -0.30860819774878 -0.5 -0.5 367232 1
i 5 60.30013642564802 2 10 68 -1 0.12031717753071 -0.5 -0.5 367232 1
i 6 60.30013642564802 2 10.58333333333333 68 -1 0.3078382354784 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 9.25 68 -1 -0.01559985132221 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 8 68 -1 -0.11425642548823 -0.5 -0.5 2869 1
i 4 60.57298772169168 2 6.66666666666667 68 -1 -0.39136878357957 -0.5 -0.5 2869 1
i 3 60.57298772169168 2 11.75 68 -1 0.41872386188822 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 10.33333333333333 68 -1 -0.10586675752647 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 10.33333333333333 68 -1 -0.31266313427472 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 10.91666666666667 68 -1 -0.20500087163891 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 11.5 68 -1 -0.41423655486014 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 12 68 -1 0.29911031621497 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 10.58333333333333 68 -1 0.1601823469134 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.25 68 -1 -0.389764701833 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.5 68 -1 -0.4736338556707 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.25 68 -1 0.21388609696578 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 8 68 -1 0.12658539626604 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.66666666666667 68 -1 0.35835967408105 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.91666666666667 68 -1 -0.48195486856017 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.66666666666667 68 -1 0.41365860911254 -0.5 -0.5 2869 1
i 3 60.84583901773534 2 10.58333333333333 68 -1 0.25274540333155 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 10.91666666666667 68 -1 0.16897032741372 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 10.58333333333333 68 -1 0.0383270983855 -0.5 -0.5 367232 1
i 4 60.84583901773534 2 9.25 68 -1 -0.06715510582751 -0.5 -0.5 367232 1
i 4 60.84583901773534 2 8.91666666666667 68 -1 0.13755631529662 -0.5 -0.5 367232 1
i 3 61.11869031377899 2 8 68 -1 -0.3938246485283 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 8.33333333333333 68 -1 0.13366275434237 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 8 68 -1 -0.24272772052764 -0.5 -0.5 2869 1
i 4 61.11869031377899 2 6.66666666666667 68 -1 -0.30346209929203 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 6.66666666666667 68 -1 0.25270280515839 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 7.33333333333333 68 -1 -0.15834902481066 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 7.66666666666667 68 -1 -0.23682660474864 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 8.33333333333333 68 -1 0.43536512803354 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 6.66666666666667 68 -1 0.38790407559976 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 7.33333333333333 68 -1 0.14105631382993 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 7.66666666666667 68 -1 0.30223837922079 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 8.33333333333333 68 -1 0.1129835169879 -0.5 -0.5 2869 1
i 4 61.11869031377899 2 6.91666666666667 68 -1 -0.49960798094982 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 10.58333333333333 68 -1 -0.48056418264806 -0.5 -0.5 367232 1
i 3 61.11869031377899 2 10.33333333333333 68 -1 -0.00237212853764 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 8.91666666666667 68 -1 -0.36367539643419 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 9.25 68 -1 -0.09027150544881 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 8.91666666666667 68 -1 -0.10545917606945 -0.5 -0.5 367232 1
i 3 61.39154160982265 2 8 68 -1 0.31183849665124 -0.5 -0.5 2869 1
i 4 61.39154160982265 2 8 68 -1 0.06947314093511 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 8.66666666666667 68 -1 0.15853489712324 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 9.16666666666667 68 -1 0.35641653030225 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 9.66666666666667 68 -1 0.10228554356064 -0.5 -0.5 2869 1
i 4 61.39154160982265 2 6.91666666666667 68 -1 0.08119081402478 -0.5 -0.5 2869 1
i 3 61.39154160982265 2 10.33333333333333 68 -1 0.34747654327131 -0.5 -0.5 367232 1
i 3 61.39154160982265 2 10.58333333333333 68 -1 -0.01490062847202 -0.5 -0.5 367232 1
i 4 61.39154160982265 2 10.33333333333333 68 -1 0.41069409538856 -0.5 -0.5 367232 1
i 4 61.39154160982265 2 8.91666666666667 68 -1 -0.27455964184349 -0.5 -0.5 367232 1
i 4 61.6643929058663 2 6.91666666666667 68 -1 0.28442218680098 -0.5 -0.5 2869 1
i 4 61.6643929058663 2 7.33333333333333 68 -1 0.4887128662434 -0.5 -0.5 2869 1
i 4 61.6643929058663 2 6.91666666666667 68 -1 -0.26805799620186 -0.5 -0.5 2869 1
i 3 61.6643929058663 2 10.33333333333333 68 -1 0.35076791436793 -0.5 -0.5 367232 1
i 4 61.6643929058663 2 8.91666666666667 68 -1 0.20904468333555 -0.5 -0.5 367232 1
i 3 61.93724420190996 2 8.33333333333333 68 -1 0.32338390541866 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 8.66666666666667 68 -1 -0.1853030547169 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 8.33333333333333 68 -1 -0.10785747719904 -0.5 -0.5 2869 1
i 4 61.93724420190996 2 6.91666666666667 68 -1 -0.4807218429123 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 6.91666666666667 68 -1 0.05422668992763 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 7.66666666666667 68 -1 -0.45892583324193 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 8 68 -1 -0.03692415015137 -0.5 -0.5 2869 1
i 5 61.93724420190996 2 8.66666666666667 68 -1 -0.07493950626172 -0.5 -0.5 2869 1
i 4 61.93724420190996 2 7.33333333333333 68 -1 0.09897660838376 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 10.33333333333333 68 -1 -0.42168921242886 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 8.91666666666667 68 -1 -0.28720021171534 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 9.25 68 -1 0.15446207279171 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 8.91666666666667 68 -1 0.48925379158254 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 8.33333333333333 68 -1 0.09644824798172 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.33333333333333 68 -1 0.30227745321164 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.66666666666667 68 -1 -0.27359520636235 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.33333333333333 68 -1 0.10345625019455 -0.5 -0.5 2869 1
i 3 62.21009549795361 2 10.33333333333333 68 -1 -0.12196006153288 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 10.58333333333333 68 -1 0.24602352336271 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 10.33333333333333 68 -1 0.44544446225287 -0.5 -0.5 367232 1
i 4 62.21009549795361 2 8.91666666666667 68 -1 -0.20078041206942 -0.5 -0.5 367232 1
i 5 62.21009549795361 2 8.91666666666667 68 -1 -0.20008176916336 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 9.5 68 -1 -0.19784357408949 -0.5 -0.5 367232 1
i 5 62.21009549795361 2 10 68 -1 -0.12690551455548 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 10.58333333333333 68 -1 0.13873227672162 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 8.91666666666667 68 -1 0.09561025759893 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 9.5 68 -1 0.13036002732307 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 10 68 -1 -0.05256562236648 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 10.58333333333333 68 -1 0.38371798419287 -0.5 -0.5 367232 1
i 4 62.21009549795361 2 9.25 68 -1 -0.04828955891872 -0.5 -0.5 367232 1
i 4 62.48294679399726 2 7.33333333333333 68 -1 -0.0432162257904 -0.5 -0.5 2869 1
i 4 62.48294679399726 2 6.91666666666667 68 -1 0.26167971196722 -0.5 -0.5 2869 1
i 3 62.48294679399726 2 10.33333333333333 68 -1 -0.3270363548702 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 10.33333333333333 68 -1 -0.40334459975949 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 10.91666666666667 68 -1 0.04109149077175 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 11.5 68 -1 0.21193867925064 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 12 68 -1 0.47407582652751 -0.5 -0.5 367232 1
i 4 62.48294679399726 2 9.25 68 -1 -0.37960019995202 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 6.91666666666667 68 -1 -0.37782403877292 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 7.33333333333333 68 -1 0.20838521266944 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 6.91666666666667 68 -1 -0.27232781038462 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 9.25 68 -1 0.0265669553002 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 9.5 68 -1 0.04853250018282 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 9.25 68 -1 -0.02176037528466 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 6.91666666666667 68 -1 0.12695025194609 -0.5 -0.5 2869 1
i 3 63.02864938608459 2 10.58333333333333 68 -1 -0.36436370055066 -0.5 -0.5 367232 1
i 3 63.02864938608459 2 10.91666666666667 68 -1 0.27012025382354 -0.5 -0.5 367232 1
i 3 63.02864938608459 2 10.58333333333333 68 -1 0.06410581631868 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 9.25 68 -1 -0.15864966457511 -0.5 -0.5 367232 1
i 6 63.02864938608459 2 9.25 68 -1 -0.19498553412643 -0.5 -0.5 367232 1
i 6 63.02864938608459 2 9.91666666666667 68 -1 -0.06490843281032 -0.5 -0.5 367232 1
i 5 63.02864938608459 2 10.33333333333333 68 -1 0.38037762385009 -0.5 -0.5 367232 1
i 5 63.02864938608459 2 10.91666666666667 68 -1 -0.45259410482027 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 9.5 68 -1 -0.42917634430681 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 6.91666666666667 68 -1 0.02487998733629 -0.5 -0.5 2869 1
i 3 63.30150068212824 2 10.58333333333333 68 -1 -0.49132437653634 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.5 68 -1 0.45668441173539 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.91666666666667 68 -1 -0.22271266697551 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.5 68 -1 -0.42671237642069 -0.5 -0.5 367232 1
i 4 63.5743519781719 2 6.91666666666667 68 -1 0.03874473640027 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 7.33333333333333 68 -1 0.12201035137431 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 6.91666666666667 68 -1 -0.16736882526517 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 9.5 68 -1 0.08390738651345 -0.5 -0.5 367232 1
i 4 63.5743519781719 2 9.25 68 -1 -0.28154910956763 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 6.91666666666667 68 -1 -0.14151216810994 -0.5 -0.5 2869 1
i 6 63.84720327421555 2 6.91666666666667 68 -1 -0.29998568779034 -0.5 -0.5 2869 1
i 6 63.84720327421555 2 7.66666666666667 68 -1 -0.27633982758398 -0.5 -0.5 2869 1
i 5 63.84720327421555 2 8 68 -1 0.3289128346598 -0.5 -0.5 2869 1
i 5 63.84720327421555 2 8.66666666666667 68 -1 0.25799272633527 -0.5 -0.5 2869 1
i 4 63.84720327421555 2 6.66666666666667 68 -1 0.23916856090663 -0.5 -0.5 2869 1
i 4 63.84720327421555 2 9.25 68 -1 -0.17216136217715 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 9.5 68 -1 -0.01994412998229 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 9.25 68 -1 -0.46532276657629 -0.5 -0.5 367232 1
i 4 64.1200545702592 2 6.66666666666667 68 -1 0.00663853417035 -0.5 -0.5 2869 1
i 4 64.1200545702592 2 9.25 68 -1 0.28305668172234 -0.5 -0.5 367232 1
i 4 64.39290586630285 2 6.66666666666667 68 -1 -0.09021581603333 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 6.91666666666667 68 -1 -0.33547587944274 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 6.66666666666667 68 -1 -0.40722892117692 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 9.25 68 -1 0.22276840663963 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 6.66666666666667 68 -1 0.39801334704201 -0.5 -0.5 2869 1
i 6 64.66575716234651 2 6.66666666666667 68 -1 -0.48298578367043 -0.5 -0.5 2869 1
i 5 64.66575716234651 2 7.33333333333333 68 -1 -0.25050115241036 -0.5 -0.5 2869 1
i 6 64.66575716234651 2 7.66666666666667 68 -1 0.08468799138199 -0.5 -0.5 2869 1
i 5 64.66575716234651 2 8.33333333333333 68 -1 0.18770355896828 -0.5 -0.5 2869 1
i 4 64.66575716234651 2 6.91666666666667 68 -1 -0.34363088637854 -0.5 -0.5 2869 1
i 4 64.66575716234651 2 9.25 68 -1 -0.46067864074369 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 9.5 68 -1 -0.46374482610677 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 9.25 68 -1 -0.15540152340003 -0.5 -0.5 367232 1
i 4 64.93860845839018 2 6.91666666666667 68 -1 0.40892276208787 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 7.33333333333333 68 -1 0.42127505187825 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 6.91666666666667 68 -1 0.41043777518329 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 9.25 68 -1 0.22367864952844 -0.5 -0.5 367232 1
i 5 64.93860845839018 2 9.25 68 -1 0.40115689915736 -0.5 -0.5 367232 1
i 6 64.93860845839018 2 9.91666666666667 68 -1 -0.18032036040781 -0.5 -0.5 367232 1
i 5 64.93860845839018 2 10.33333333333333 68 -1 -0.10488778487804 -0.5 -0.5 367232 1
i 6 64.93860845839018 2 10.91666666666667 68 -1 0.10188083319948 -0.5 -0.5 367232 1
i 4 64.93860845839018 2 8.91666666666667 68 -1 0.48519950804131 -0.5 -0.5 367232 1
i 4 65.21145975443383 2 6.91666666666667 68 -1 0.22409833965595 -0.5 -0.5 2869 1
i 4 65.21145975443383 2 6.66666666666667 68 -1 -0.21334344713629 -0.5 -0.5 2869 1
i 4 65.21145975443383 2 8.91666666666667 68 -1 -0.11594047185026 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 6.66666666666667 68 -1 0.17571549097365 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 6.91666666666667 68 -1 0.37450555464551 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 6.66666666666667 68 -1 -0.41983582091191 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 8.91666666666667 68 -1 0.41353063747903 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 9.25 68 -1 -0.09162210982683 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 8.91666666666667 68 -1 0.40253576954092 -0.5 -0.5 367232 1
i 4 65.75716234652114 2 6.66666666666667 68 -1 -0.31761909387189 -0.5 -0.5 2869 1
i 4 65.75716234652114 2 8.91666666666667 68 -1 0.01818707124842 -0.5 -0.5 367232 1
i 5 65.75716234652114 2 8.91666666666667 68 -1 -0.23379649807298 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 9.5 68 -1 -0.42924405143712 -0.5 -0.5 367232 1
i 5 65.75716234652114 2 10 68 -1 -0.38822690518927 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 10.58333333333333 68 -1 0.11280163170217 -0.5 -0.5 367232 1
i 4 65.75716234652114 2 9.25 68 -1 -0.3834825927818 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 6.66666666666667 68 -1 -0.00271209981557 -0.5 -0.5 2869 1
i 4 66.0300136425648 2 9.25 68 -1 -0.18772990559129 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 9.5 68 -1 -0.49735059266562 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 9.25 68 -1 0.28854508539964 -0.5 -0.5 367232 1
i 4 66.30286493860845 2 6.66666666666667 68 -1 -0.11246117363654 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 6.91666666666667 68 -1 -0.30883167881626 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 6.66666666666667 68 -1 -0.46836342401278 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 9.25 68 -1 0.01888387464049 -0.5 -0.5 367232 1
i 4 66.30286493860845 2 8.91666666666667 68 -1 -0.37163198535004 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 6.66666666666667 68 -1 -0.20337850182308 -0.5 -0.5 2869 1
i 6 66.5757162346521 2 6.66666666666667 68 -1 0.3669712332582 -0.5 -0.5 2869 1
i 6 66.5757162346521 2 7.33333333333333 68 -1 -0.21095434670101 -0.5 -0.5 2869 1
i 6 66.5757162346521 2 7.66666666666667 68 -1 0.2456201317477 -0.5 -0.5 2869 1
i 5 66.5757162346521 2 8.33333333333333 68 -1 0.41231816571968 -0.5 -0.5 2869 1
i 4 66.5757162346521 2 8.91666666666667 68 -1 -0.16278800399153 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 9.25 68 -1 -0.0693832614404 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 8.91666666666667 68 -1 -0.47845284945262 -0.5 -0.5 367232 1
i 4 66.84856753069577 2 6.66666666666667 68 -1 -0.44085719499133 -0.5 -0.5 2869 1
i 4 66.84856753069577 2 8.91666666666667 68 -1 -0.1698751851383 -0.5 -0.5 367232 1
i 4 67.12141882673943 2 6.66666666666667 68 -1 0.23447105337403 -0.5 -0.5 2869 1
i 4 67.12141882673943 2 8.91666666666667 68 -1 -0.24155863264416 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 6.66666666666667 68 -1 0.23505779652308 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 6.91666666666667 68 -1 0.1745021530992 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 6.66666666666667 68 -1 -0.33797362567246 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 8.91666666666667 68 -1 -0.49400840262414 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 9.25 68 -1 0.10906429394489 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 8.91666666666667 68 -1 -0.10579448297069 -0.5 -0.5 367232 1
i 4 67.66712141882674 2 6.66666666666667 68 -1 0.05234706488976 -0.5 -0.5 2869 1
i 6 67.66712141882674 2 6.66666666666667 68 -1 -0.12449972106413 -0.5 -0.5 2869 1
i 5 67.66712141882674 2 7.33333333333333 68 -1 -0.42839467824484 -0.5 -0.5 2869 1
i 6 67.66712141882674 2 7.66666666666667 68 -1 0.17745332277583 -0.5 -0.5 2869 1
i 5 67.66712141882674 2 8.33333333333333 68 -1 0.38529499992821 -0.5 -0.5 2869 1
i 4 67.66712141882674 2 6.91666666666667 68 -1 -0.20992038873698 -0.5 -0.5 2869 1
i 4 67.66712141882674 2 8.91666666666667 68 -1 0.04390910434276 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 8.91666666666667 68 -1 0.24040546189647 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 9.5 68 -1 -0.43438057418168 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 10 68 -1 0.15673617038228 -0.5 -0.5 367232 1
i 5 67.66712141882674 2 10.58333333333333 68 -1 0.04540558088174 -0.5 -0.5 367232 1
i 4 67.9399727148704 2 6.91666666666667 68 -1 0.23328654245968 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 7.33333333333333 68 -1 0.20764455442926 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 6.91666666666667 68 -1 0.25527157535266 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 8.91666666666667 68 -1 0.28781509143593 -0.5 -0.5 367232 1
i 4 68.21282401091405 2 6.91666666666667 68 -1 0.36343239196491 -0.5 -0.5 2869 1
i 4 68.21282401091405 2 6.66666666666667 68 -1 -0.47194481760505 -0.5 -0.5 2869 1
i 4 68.21282401091405 2 8.91666666666667 68 -1 0.06266357269572 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 6.66666666666667 68 -1 -0.48990113302122 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 6.91666666666667 68 -1 -0.43887940324128 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 6.66666666666667 68 -1 -0.47097205296906 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 8.91666666666667 68 -1 0.43290326241372 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 9.25 68 -1 0.26334958143127 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 8.91666666666667 68 -1 0.19656305034029 -0.5 -0.5 367232 1
i 4 68.75852660300136 2 6.66666666666667 68 -1 0.29120882872527 -0.5 -0.5 2869 1
i 4 68.75852660300136 2 8.91666666666667 68 -1 -0.17076521573738 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 8.91666666666667 68 -1 0.44730067528898 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 9.5 68 -1 0.42949299796706 -0.5 -0.5 367232 1
i 6 68.75852660300136 2 10 68 -1 -0.33710173038177 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 10.58333333333333 68 -1 0.13046599097054 -0.5 -0.5 367232 1
i 4 68.75852660300136 2 9.25 68 -1 0.10727133204772 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 6.66666666666667 68 -1 -0.25529416525371 -0.5 -0.5 2869 1
i 4 69.03137789904503 2 9.25 68 -1 -0.4063676336194 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 9.5 68 -1 0.07439629027941 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 9.25 68 -1 -0.13844808001447 -0.5 -0.5 367232 1
i 4 69.30422919508868 2 6.66666666666667 68 -1 0.4804840020578 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 6.91666666666667 68 -1 0.16759567859414 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 6.66666666666667 68 -1 0.36241646021484 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 9.25 68 -1 -0.07686015106922 -0.5 -0.5 367232 1
i 4 69.30422919508868 2 8.91666666666667 68 -1 0.29671689928693 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 6.66666666666667 68 -1 0.367271303293 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 6.66666666666667 68 -1 0.01060165034047 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.33333333333333 68 -1 0.34384064566356 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.66666666666667 68 -1 0.40890254884113 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 8.33333333333333 68 -1 0.38189239282546 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 6.66666666666667 68 -1 0.40248199529913 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.33333333333333 68 -1 -0.13627224062495 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 7.66666666666667 68 -1 -0.15024710367876 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 8.33333333333333 68 -1 0.47772140915738 -0.5 -0.5 2869 1
i 4 69.57708049113234 2 6.33333333333333 68 -1 -0.26999323097076 -0.5 -0.5 2869 1
i 4 69.57708049113234 2 8.91666666666667 68 -1 -0.39360648643749 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 9.25 68 -1 0.31364953879537 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 8.91666666666667 68 -1 0.09811837287729 -0.5 -0.5 367232 1
i 4 69.84993178717599 2 6.33333333333333 68 -1 -0.26332326041688 -0.5 -0.5 2869 1
i 4 69.84993178717599 2 8.91666666666667 68 -1 -0.0141883611979 -0.5 -0.5 367232 1
i 4 70.12278308321964 2 6.33333333333333 68 -1 0.41147391316884 -0.5 -0.5 2869 1
i 4 70.12278308321964 2 8.91666666666667 68 -1 -0.03056173306294 -0.5 -0.5 367232 1
i 3 70.3956343792633 2 8.33333333333333 68 -1 -0.04555178287736 -0.5 -0.5 2869 1
i 3 70.3956343792633 2 8.66666666666667 68 -1 0.43311005150675 -0.5 -0.5 2869 1
i 3 70.3956343792633 2 8.33333333333333 68 -1 -0.45703975116451 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.33333333333333 68 -1 0.3913737506073 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.66666666666667 68 -1 0.21965535625343 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.33333333333333 68 -1 -0.29757875452705 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 8.91666666666667 68 -1 -0.04033303060967 -0.5 -0.5 367232 1
i 4 70.3956343792633 2 9.25 68 -1 -0.07706431098094 -0.5 -0.5 367232 1
i 4 70.3956343792633 2 8.91666666666667 68 -1 -0.40901321795071 -0.5 -0.5 367232 1
i 3 70.66848567530695 2 8.33333333333333 68 -1 0.10506184657483 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 6.33333333333333 68 -1 -0.03333413336414 -0.5 -0.5 2869 1
i 5 70.66848567530695 2 6.33333333333333 68 -1 0.33385352086737 -0.5 -0.5 2869 1
i 5 70.66848567530695 2 6.91666666666667 68 -1 0.40583447779987 -0.5 -0.5 2869 1
i 6 70.66848567530695 2 7.41666666666667 68 -1 0.41530745019097 -0.5 -0.5 2869 1
i 6 70.66848567530695 2 8 68 -1 0.336005103692 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 6.66666666666667 68 -1 0.4291701932931 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 8.91666666666667 68 -1 -0.39508285590943 -0.5 -0.5 367232 1
i 5 70.66848567530695 2 8.91666666666667 68 -1 -0.12972721472099 -0.5 -0.5 367232 1
i 5 70.66848567530695 2 9.5 68 -1 0.26456126819048 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10 68 -1 -0.47993607347597 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10.58333333333333 68 -1 0.00947232195134 -0.5 -0.5 367232 1
i 5 70.66848567530695 2 8.91666666666667 68 -1 0.22112639089542 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 9.5 68 -1 -0.19069151109514 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10 68 -1 -0.09931715729559 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10.58333333333333 68 -1 -0.24464802525276 -0.5 -0.5 367232 1
i 4 70.66848567530695 2 8.58333333333333 68 -1 0.07493058064433 -0.5 -0.5 367232 1
i 4 70.94133697135062 2 6.66666666666667 68 -1 -0.35657058296702 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 6.91666666666667 68 -1 -0.27839749537396 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 6.66666666666667 68 -1 0.36888645782818 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 8.58333333333333 68 -1 0.20177341949315 -0.5 -0.5 367232 1
i 4 71.21418826739428 2 6.66666666666667 68 -1 -0.3998968237993 -0.5 -0.5 2869 1
i 4 71.21418826739428 2 6.33333333333333 68 -1 -0.45018664672391 -0.5 -0.5 2869 1
i 4 71.21418826739428 2 8.58333333333333 68 -1 -0.20747744664254 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 6.33333333333333 68 -1 0.36651199845301 -0.5 -0.5 2869 1
i 4 71.48703956343793 2 6.66666666666667 68 -1 -0.05812630595778 -0.5 -0.5 2869 1
i 4 71.48703956343793 2 6.33333333333333 68 -1 -0.01679779347446 -0.5 -0.5 2869 1
i 3 71.48703956343793 2 10.58333333333333 68 -1 -0.07933966295454 -0.5 -0.5 367232 1
i 3 71.48703956343793 2 10.91666666666667 68 -1 -0.08375606945299 -0.5 -0.5 367232 1
i 3 71.48703956343793 2 10.58333333333333 68 -1 -0.14176406920538 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.58333333333333 68 -1 0.20966719396218 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.91666666666667 68 -1 0.21050093372042 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.58333333333333 68 -1 -0.4704077057565 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 6.33333333333333 68 -1 -0.04525627349824 -0.5 -0.5 2869 1
i 3 71.75989085948159 2 10.58333333333333 68 -1 -0.43471050968323 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 8.58333333333333 68 -1 -0.01676171808115 -0.5 -0.5 367232 1
i 5 71.75989085948159 2 8.58333333333333 68 -1 0.08812911075298 -0.5 -0.5 367232 1
i 6 71.75989085948159 2 9.25 68 -1 0.3815987567199 -0.5 -0.5 367232 1
i 5 71.75989085948159 2 9.75 68 -1 0.1227977426116 -0.5 -0.5 367232 1
i 6 71.75989085948159 2 10.33333333333333 68 -1 0.26014162337257 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 8.91666666666667 68 -1 0.31442251504332 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 6.33333333333333 68 -1 -0.49351985217506 -0.5 -0.5 2869 1
i 4 72.03274215552524 2 8.91666666666667 68 -1 0.27266267006118 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 9.25 68 -1 0.27041254815159 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 8.91666666666667 68 -1 -0.18656211661109 -0.5 -0.5 367232 1
i 4 72.3055934515689 2 6.33333333333333 68 -1 0.18799164660598 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 6.66666666666667 68 -1 -0.12867420584586 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 6.33333333333333 68 -1 0.12801649948427 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 8.91666666666667 68 -1 -0.45134916744142 -0.5 -0.5 367232 1
i 4 72.3055934515689 2 8.58333333333333 68 -1 -0.35111404304694 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 6.33333333333333 68 -1 0.26369046495089 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 6.33333333333333 68 -1 -0.46425576195832 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 6.91666666666667 68 -1 0.2360279099465 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 7.41666666666667 68 -1 0.11080007142427 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 8 68 -1 -0.39815313594736 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 6.33333333333333 68 -1 0.12078603582508 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 6.91666666666667 68 -1 -0.18433839987853 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 7.41666666666667 68 -1 0.47777692095293 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 8 68 -1 0.07171099106768 -0.5 -0.5 2869 1
i 4 72.57844474761255 2 6.66666666666667 68 -1 0.05449585426906 -0.5 -0.5 2869 1
i 4 72.57844474761255 2 8.58333333333333 68 -1 0.02011064195187 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 8.91666666666667 68 -1 0.44137804447771 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 8.58333333333333 68 -1 0.32266927325297 -0.5 -0.5 367232 1
i 4 72.8512960436562 2 6.66666666666667 68 -1 0.11834248310705 -0.5 -0.5 2869 1
i 4 72.8512960436562 2 8.58333333333333 68 -1 -0.24205801364657 -0.5 -0.5 367232 1
i 4 73.12414733969987 2 6.66666666666667 68 -1 -0.12778029684295 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 6.91666666666667 68 -1 -0.19655970013407 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 6.66666666666667 68 -1 0.13145703689492 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 8.58333333333333 68 -1 -0.33647466617634 -0.5 -0.5 367232 1
i 3 73.39699863574353 2 8 68 -1 -0.35066763755472 -0.5 -0.5 2869 1
i 3 73.39699863574353 2 8.33333333333333 68 -1 0.07013035407261 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 8 68 -1 0.44868506497568 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 6.66666666666667 68 -1 -0.00540956333641 -0.5 -0.5 2869 1
i 5 73.39699863574353 2 6.66666666666667 68 -1 0.29174208519903 -0.5 -0.5 2869 1
i 5 73.39699863574353 2 7.33333333333333 68 -1 -0.20640673092395 -0.5 -0.5 2869 1
i 6 73.39699863574353 2 7.66666666666667 68 -1 -0.44315498953667 -0.5 -0.5 2869 1
i 6 73.39699863574353 2 8.33333333333333 68 -1 -0.48252522130797 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 6.91666666666667 68 -1 0.1881709002155 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 8.58333333333333 68 -1 -0.3822717736935 -0.5 -0.5 367232 1
i 4 73.39699863574353 2 8.91666666666667 68 -1 0.39372513066179 -0.5 -0.5 367232 1
i 4 73.39699863574353 2 8.58333333333333 68 -1 0.29402632482445 -0.5 -0.5 367232 1
i 3 73.66984993178718 2 8 68 -1 0.26714665006902 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 6.91666666666667 68 -1 0.17124425307712 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 7.33333333333333 68 -1 -0.01361939842703 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 6.91666666666667 68 -1 0.46513541262175 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 8.58333333333333 68 -1 -0.11165178586506 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 8.58333333333333 68 -1 0.46650901803542 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 9.25 68 -1 -0.01225964881776 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 9.75 68 -1 -0.10487751452644 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 10.33333333333333 68 -1 0.16896727630293 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 8.58333333333333 68 -1 -0.34646164503516 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 9.25 68 -1 -0.36617019086199 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 9.75 68 -1 0.1530150933068 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 10.33333333333333 68 -1 0.11366376790969 -0.5 -0.5 367232 1
i 4 73.66984993178718 2 8.91666666666667 68 -1 0.05866987579478 -0.5 -0.5 367232 1
i 4 73.94270122783084 2 6.91666666666667 68 -1 -0.44476389747562 -0.5 -0.5 2869 1
i 4 73.94270122783084 2 6.66666666666667 68 -1 0.46116470199022 -0.5 -0.5 2869 1
i 4 73.94270122783084 2 8.91666666666667 68 -1 0.37152449802488 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 6.66666666666667 68 -1 -0.38225911601009 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 6.91666666666667 68 -1 -0.34241051875699 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 6.66666666666667 68 -1 0.49770807854453 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 8.91666666666667 68 -1 -0.23665838561737 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 9.25 68 -1 0.23092095048299 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 8.91666666666667 68 -1 0.35133805527885 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 6.66666666666667 68 -1 -0.03386494811512 -0.5 -0.5 2869 1
i 3 74.48840381991815 2 10.33333333333333 68 -1 -0.46317718121004 -0.5 -0.5 367232 1
i 3 74.48840381991815 2 10.58333333333333 68 -1 -0.48809992704122 -0.5 -0.5 367232 1
i 3 74.48840381991815 2 10.33333333333333 68 -1 0.1791297115389 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 8.91666666666667 68 -1 0.34245164503324 -0.5 -0.5 367232 1
i 6 74.48840381991815 2 8.91666666666667 68 -1 -0.26279140816902 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 9.5 68 -1 0.15355730916894 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 10 68 -1 0.44797111345227 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 10.58333333333333 68 -1 -0.26997162694254 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 9.25 68 -1 -0.16845303676769 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 6.66666666666667 68 -1 0.07054011385405 -0.5 -0.5 2869 1
i 3 74.7612551159618 2 10.33333333333333 68 -1 -0.13517742491929 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.25 68 -1 0.40644641219225 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.5 68 -1 0.1409712637062 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.25 68 -1 -0.02547340647576 -0.5 -0.5 367232 1
i 4 75.03410641200546 2 6.66666666666667 68 -1 0.1959115200716 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 6.91666666666667 68 -1 -0.23507767174193 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 6.66666666666667 68 -1 -0.12450157369491 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 9.25 68 -1 0.42433095986053 -0.5 -0.5 367232 1
i 4 75.03410641200546 2 8.91666666666667 68 -1 -0.17368056876676 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 6.66666666666667 68 -1 -0.0950147266261 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 6.66666666666667 68 -1 -0.42243571816183 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 7.33333333333333 68 -1 0.32257690826305 -0.5 -0.5 2869 1
i 5 75.30695770804911 2 7.66666666666667 68 -1 -0.00217542625186 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 8.33333333333333 68 -1 0.25823688887573 -0.5 -0.5 2869 1
i 4 75.30695770804911 2 6.33333333333333 68 -1 0.39431823318919 -0.5 -0.5 2869 1
i 4 75.30695770804911 2 8.91666666666667 68 -1 -0.19467129936191 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 9.25 68 -1 -0.03623571297221 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 8.91666666666667 68 -1 -0.35801256946206 -0.5 -0.5 367232 1
i 4 75.57980900409277 2 6.33333333333333 68 -1 0.38336735580299 -0.5 -0.5 2869 1
i 4 75.57980900409277 2 8.91666666666667 68 -1 -0.11249351299681 -0.5 -0.5 367232 1
i 4 75.85266030013642 2 6.33333333333333 68 -1 0.34434746404228 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 6.66666666666667 68 -1 -0.08135625601346 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 6.33333333333333 68 -1 0.1767056018555 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 8.91666666666667 68 -1 0.09046353431846 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 6.33333333333333 68 -1 -0.34297752685476 -0.5 -0.5 2869 1
i 6 76.12551159618008 2 6.33333333333333 68 -1 0.32313934686352 -0.5 -0.5 2869 1
i 6 76.12551159618008 2 6.91666666666667 68 -1 0.28302366948666 -0.5 -0.5 2869 1
i 5 76.12551159618008 2 7.41666666666667 68 -1 -0.10664404460434 -0.5 -0.5 2869 1
i 5 76.12551159618008 2 8 68 -1 -0.14343703777906 -0.5 -0.5 2869 1
i 4 76.12551159618008 2 6.66666666666667 68 -1 0.41954663492337 -0.5 -0.5 2869 1
i 4 76.12551159618008 2 8.91666666666667 68 -1 -0.3812216904778 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 9.25 68 -1 -0.01863968736891 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 8.91666666666667 68 -1 -0.27751555004691 -0.5 -0.5 367232 1
i 4 76.39836289222373 2 6.66666666666667 68 -1 -0.16147627244027 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 6.91666666666667 68 -1 0.38542216702996 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 6.66666666666667 68 -1 0.2853087729019 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 8.91666666666667 68 -1 0.12149931492362 -0.5 -0.5 367232 1
i 5 76.39836289222373 2 8.91666666666667 68 -1 -0.05042685375932 -0.5 -0.5 367232 1
i 6 76.39836289222373 2 9.5 68 -1 -0.09609576644063 -0.5 -0.5 367232 1
i 5 76.39836289222373 2 10 68 -1 -0.24269656413137 -0.5 -0.5 367232 1
i 6 76.39836289222373 2 10.58333333333333 68 -1 -0.41058684761832 -0.5 -0.5 367232 1
i 4 76.39836289222373 2 8.58333333333333 68 -1 0.03178952687655 -0.5 -0.5 367232 1
i 4 76.67121418826738 2 6.66666666666667 68 -1 -0.29795147493698 -0.5 -0.5 2869 1
i 4 76.67121418826738 2 6.33333333333333 68 -1 0.17524012812413 -0.5 -0.5 2869 1
i 4 76.67121418826738 2 8.58333333333333 68 -1 0.26170264836594 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 6.33333333333333 68 -1 -0.43032566983083 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 6.66666666666667 68 -1 -0.31792759738128 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 6.33333333333333 68 -1 -0.43068039505717 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 8.58333333333333 68 -1 0.47254006060532 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 8.91666666666667 68 -1 -0.26157198951375 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 8.58333333333333 68 -1 0.46498483575564 -0.5 -0.5 367232 1
i 4 77.21691678035471 2 6.33333333333333 68 -1 0.11713634016266 -0.5 -0.5 2869 1
i 4 77.21691678035471 2 8.58333333333333 68 -1 0.01379149486858 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 8.58333333333333 68 -1 -0.2100725180416 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 9.25 68 -1 -0.40040407547085 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 9.75 68 -1 -0.31369993472766 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 10.33333333333333 68 -1 -0.31059180002566 -0.5 -0.5 367232 1
i 4 77.21691678035471 2 8.91666666666667 68 -1 -0.406813677213 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 6.33333333333333 68 -1 0.30533818556784 -0.5 -0.5 2869 1
i 4 77.48976807639836 2 8.91666666666667 68 -1 0.29228230656944 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 9.25 68 -1 -0.31279225163401 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 8.91666666666667 68 -1 -0.2785142641118 -0.5 -0.5 367232 1
i 4 77.76261937244202 2 6.33333333333333 68 -1 0.09848990010454 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 6.66666666666667 68 -1 -0.31036427302232 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 6.33333333333333 68 -1 -0.4273149270867 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 8.91666666666667 68 -1 0.00531793423036 -0.5 -0.5 367232 1
i 4 77.76261937244202 2 8.58333333333333 68 -1 -0.47763954610017 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 6.33333333333333 68 -1 0.03604068262809 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 6.33333333333333 68 -1 -0.07170043394196 -0.5 -0.5 2869 1
i 5 78.03547066848567 2 6.91666666666667 68 -1 -0.40305561272127 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 7.41666666666667 68 -1 -0.27619043294353 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 8 68 -1 0.05667313637501 -0.5 -0.5 2869 1
i 4 78.03547066848567 2 8.58333333333333 68 -1 0.11883192244269 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 8.91666666666667 68 -1 -0.10276748471074 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 8.58333333333333 68 -1 0.16392341564045 -0.5 -0.5 367232 1
i 4 78.30832196452933 2 6.33333333333333 68 -1 0.41954180706874 -0.5 -0.5 2869 1
i 4 78.30832196452933 2 8.58333333333333 68 -1 0.49404170484525 -0.5 -0.5 367232 1
i 4 78.58117326057298 2 6.33333333333333 68 -1 -0.35179344723001 -0.5 -0.5 2869 1
i 4 78.58117326057298 2 8.58333333333333 68 -1 0.31728074620871 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 6.33333333333333 68 -1 0.47873742113319 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 6.66666666666667 68 -1 -0.41522562657437 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 6.33333333333333 68 -1 0.14979766972363 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 8.58333333333333 68 -1 0.1832754375741 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 8.91666666666667 68 -1 -0.44459630359218 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 8.58333333333333 68 -1 0.15345807267849 -0.5 -0.5 367232 1
i 4 79.1268758526603 2 6.33333333333333 68 -1 -0.287311226623 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 6.33333333333333 68 -1 0.40417785094079 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 6.91666666666667 68 -1 0.46772552847119 -0.5 -0.5 2869 1
i 6 79.1268758526603 2 7.41666666666667 68 -1 -0.21580088740554 -0.5 -0.5 2869 1
i 6 79.1268758526603 2 8 68 -1 -0.45021433775211 -0.5 -0.5 2869 1
i 4 79.1268758526603 2 6.66666666666667 68 -1 -0.33518240622333 -0.5 -0.5 2869 1
i 4 79.1268758526603 2 8.58333333333333 68 -1 0.1179556252986 -0.5 -0.5 367232 1
i 5 79.1268758526603 2 8.58333333333333 68 -1 -0.44257814546638 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 9.25 68 -1 -0.14761513188416 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 9.75 68 -1 0.38006860878692 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 10.33333333333333 68 -1 0.01265818611033 -0.5 -0.5 367232 1
i 4 79.39972714870396 2 6.66666666666667 68 -1 -0.49032019501894 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 6.91666666666667 68 -1 0.17752930805387 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 6.66666666666667 68 -1 0.32462197066101 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 8.58333333333333 68 -1 0.46169671809051 -0.5 -0.5 367232 1
i 4 79.67257844474761 2 6.66666666666667 68 -1 -0.28316704626481 -0.5 -0.5 2869 1
i 4 79.67257844474761 2 6.33333333333333 68 -1 -0.0005922499103 -0.5 -0.5 2869 1
i 4 79.67257844474761 2 8.58333333333333 68 -1 0.33055112216204 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 6.33333333333333 68 -1 -0.38243887983419 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 6.66666666666667 68 -1 0.22612212790392 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 6.33333333333333 68 -1 -0.09967608169832 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 8.58333333333333 68 -1 0.28923523192988 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 8.91666666666667 68 -1 -0.10917925760598 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 8.58333333333333 68 -1 0.36923911538832 -0.5 -0.5 367232 1
i 4 80.21828103683492 2 6.33333333333333 68 -1 0.48917650167298 -0.5 -0.5 2869 1
i 4 80.21828103683492 2 8.58333333333333 68 -1 0.20785539986584 -0.5 -0.5 367232 1
i 6 80.21828103683492 2 8.58333333333333 68 -1 -0.45294031784126 -0.5 -0.5 367232 1
i 6 80.21828103683492 2 9.25 68 -1 -0.11789359592251 -0.5 -0.5 367232 1
i 5 80.21828103683492 2 9.75 68 -1 -0.35177818313306 -0.5 -0.5 367232 1
i 5 80.21828103683492 2 10.33333333333333 68 -1 -0.00092146231131 -0.5 -0.5 367232 1
i 4 80.21828103683492 2 8.91666666666667 68 -1 -0.14434518772738 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 6.33333333333333 68 -1 -0.31686903004497 -0.5 -0.5 2869 1
i 4 80.49113233287858 2 8.91666666666667 68 -1 0.08723509491455 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 9.25 68 -1 0.22665725727606 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 8.91666666666667 68 -1 0.20673694099056 -0.5 -0.5 367232 1
i 4 80.76398362892223 2 6.33333333333333 68 -1 -0.29178139817879 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 6.66666666666667 68 -1 0.42603775693646 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 6.33333333333333 68 -1 0.24584825310482 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 8.91666666666667 68 -1 -0.48234538116558 -0.5 -0.5 367232 1
i 4 80.76398362892223 2 8.58333333333333 68 -1 -0.45688924391377 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 6.33333333333333 68 -1 -0.47736683215608 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 6.33333333333333 68 -1 0.03369583687312 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 6.91666666666667 68 -1 0.08460878478268 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 7.41666666666667 68 -1 -0.26066268452424 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 8 68 -1 0.02224207216073 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 6.33333333333333 68 -1 -0.01936870084859 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 6.91666666666667 68 -1 0.36226880872079 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 7.41666666666667 68 -1 0.38928200959469 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 8 68 -1 -0.3280505539063 -0.5 -0.5 2869 1
i 4 81.03683492496589 2 8.58333333333333 68 -1 -0.28189193471773 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 8.91666666666667 68 -1 0.03744522868336 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 8.58333333333333 68 -1 -0.27977181064839 -0.5 -0.5 367232 1
i 4 81.30968622100956 2 6.33333333333333 68 -1 0.3615044583413 -0.5 -0.5 2869 1
i 4 81.30968622100956 2 8.58333333333333 68 -1 0.2215763875293 -0.5 -0.5 367232 1
i 4 81.58253751705321 2 6.33333333333333 68 -1 0.1947075029471 -0.5 -0.5 2869 1
i 4 81.58253751705321 2 8.58333333333333 68 -1 0.31512611832209 -0.5 -0.5 367232 1
i 3 81.85538881309687 2 8 68 -1 0.23326184715036 -0.5 -0.5 2869 1
i 3 81.85538881309687 2 8.33333333333333 68 -1 -0.28836790168846 -0.5 -0.5 2869 1
i 4 81.85538881309687 2 8 68 -1 -0.04869605361495 -0.5 -0.5 2869 1
i 4 81.85538881309687 2 6.33333333333333 68 -1 -0.2861123478913 -0.5 -0.5 2869 1
i 4 81.85538881309687 2 8.58333333333333 68 -1 0.18821629158737 -0.5 -0.5 367232 1
i 4 81.85538881309687 2 8.91666666666667 68 -1 -0.01215370717497 -0.5 -0.5 367232 1
i 4 81.85538881309687 2 8.58333333333333 68 -1 -0.4969058594664 -0.5 -0.5 367232 1
i 3 82.12824010914052 2 8 68 -1 0.05434989585359 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.33333333333333 68 -1 0.15465971411032 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.66666666666667 68 -1 -0.47091118702591 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.33333333333333 68 -1 -0.36907393125655 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 8.58333333333333 68 -1 0.13490364766226 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 8.58333333333333 68 -1 0.49177943725821 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 9.25 68 -1 -0.41841789387394 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 9.75 68 -1 -0.29504565353526 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 10.33333333333333 68 -1 -0.06986749583669 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 8.58333333333333 68 -1 -0.41203499518687 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 9.25 68 -1 -0.11191512142294 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 9.75 68 -1 -0.19293100802547 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 10.33333333333333 68 -1 0.26396115628507 -0.5 -0.5 367232 1
i 4 82.40109140518418 2 6.33333333333333 68 -1 0.48175665557193 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 6.33333333333333 68 -1 0.24847694320199 -0.5 -0.5 2869 1
i 5 82.40109140518418 2 6.91666666666667 68 -1 -0.42104103025788 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 7.41666666666667 68 -1 0.1800792056402 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 8 68 -1 0.10410548341421 -0.5 -0.5 2869 1
i 4 82.40109140518418 2 6.66666666666667 68 -1 -0.01185140205255 -0.5 -0.5 2869 1
i 4 82.40109140518418 2 8.58333333333333 68 -1 -0.24978319501446 -0.5 -0.5 367232 1
i 4 82.67394270122783 2 6.66666666666667 68 -1 -0.31301762205677 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 6.91666666666667 68 -1 -0.09268554223243 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 6.66666666666667 68 -1 0.11097784448938 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 8.58333333333333 68 -1 -0.37709005054403 -0.5 -0.5 367232 1
i 4 82.94679399727148 2 6.66666666666667 68 -1 -0.24972774870053 -0.5 -0.5 2869 1
i 4 82.94679399727148 2 6.33333333333333 68 -1 0.34317323428432 -0.5 -0.5 2869 1
i 3 82.94679399727148 2 10.33333333333333 68 -1 0.05807972476966 -0.5 -0.5 367232 1
i 3 82.94679399727148 2 10.58333333333333 68 -1 0.42024613021622 -0.5 -0.5 367232 1
i 3 82.94679399727148 2 10.33333333333333 68 -1 0.27138391157365 -0.5 -0.5 367232 1
i 4 82.94679399727148 2 8.58333333333333 68 -1 0.24768390488887 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 6.33333333333333 68 -1 -0.17349758707076 -0.5 -0.5 2869 1
i 4 83.21964529331515 2 6.66666666666667 68 -1 0.17429689804623 -0.5 -0.5 2869 1
i 4 83.21964529331515 2 6.33333333333333 68 -1 0.12893848795067 -0.5 -0.5 2869 1
i 3 83.21964529331515 2 10.33333333333333 68 -1 -0.08643565128022 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.58333333333333 68 -1 0.29344455798001 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.91666666666667 68 -1 0.40271765989012 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.58333333333333 68 -1 0.03739469421607 -0.5 -0.5 367232 1
i 4 83.49249658935881 2 6.33333333333333 68 -1 0.24833920859073 -0.5 -0.5 2869 1
i 4 83.49249658935881 2 8.58333333333333 68 -1 0.39781563856754 -0.5 -0.5 367232 1
i 6 83.49249658935881 2 8.58333333333333 68 -1 0.44830361142582 -0.5 -0.5 367232 1
i 6 83.49249658935881 2 9.25 68 -1 0.49434362796044 -0.5 -0.5 367232 1
i 6 83.49249658935881 2 9.75 68 -1 -0.24037575432832 -0.5 -0.5 367232 1
i 6 83.49249658935881 2 10.33333333333333 68 -1 -0.42088288387323 -0.5 -0.5 367232 1
i 4 83.49249658935881 2 8.91666666666667 68 -1 -0.13572932588744 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 6.33333333333333 68 -1 0.4756782657588 -0.5 -0.5 2869 1
i 4 83.76534788540246 2 8.91666666666667 68 -1 -0.07796411396052 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 9.25 68 -1 -0.23862967227224 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 8.91666666666667 68 -1 -0.41834915867722 -0.5 -0.5 367232 1
i 4 84.03819918144612 2 6.33333333333333 68 -1 -0.41516113613703 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 6.66666666666667 68 -1 0.23075518019846 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 6.33333333333333 68 -1 0.19798504548271 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 8.91666666666667 68 -1 0.14581613331367 -0.5 -0.5 367232 1
i 4 84.03819918144612 2 8.58333333333333 68 -1 -0.33178829751495 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 6.33333333333333 68 -1 0.42241243362638 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 6.33333333333333 68 -1 0.04178597354674 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 6.91666666666667 68 -1 0.01819243432694 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 7.41666666666667 68 -1 -0.49791078680117 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 8 68 -1 0.37058515918306 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 6.33333333333333 68 -1 0.42954483639893 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 6.91666666666667 68 -1 0.18138983255542 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 7.41666666666667 68 -1 -0.07859636085171 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 8 68 -1 0.16788988271776 -0.5 -0.5 2869 1
i 4 84.31105047748977 2 6.66666666666667 68 -1 0.11117231560658 -0.5 -0.5 2869 1
i 4 84.31105047748977 2 8.58333333333333 68 -1 -0.35910101046184 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 8.91666666666667 68 -1 0.43291544253585 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 8.58333333333333 68 -1 0.005852407844 -0.5 -0.5 367232 1
i 4 84.58390177353343 2 6.66666666666667 68 -1 0.05344762547377 -0.5 -0.5 2869 1
i 4 84.58390177353343 2 8.58333333333333 68 -1 0.27578469035268 -0.5 -0.5 367232 1
i 4 84.85675306957708 2 6.66666666666667 68 -1 0.17915971049395 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 6.91666666666667 68 -1 -0.4742622110565 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 6.66666666666667 68 -1 -0.18314703694516 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 8.58333333333333 68 -1 -0.36740126514844 -0.5 -0.5 367232 1
i 3 85.12960436562074 2 8 68 -1 -0.07958658985412 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 8.33333333333333 68 -1 -0.18860061461657 -0.5 -0.5 2869 1
i 3 85.12960436562074 2 8 68 -1 -0.03680448122922 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 6.66666666666667 68 -1 -0.113740858384 -0.5 -0.5 2869 1
i 6 85.12960436562074 2 6.66666666666667 68 -1 -0.05661218610324 -0.5 -0.5 2869 1
i 6 85.12960436562074 2 7.33333333333333 68 -1 0.2796085035289 -0.5 -0.5 2869 1
i 6 85.12960436562074 2 7.66666666666667 68 -1 -0.29953682046355 -0.5 -0.5 2869 1
i 6 85.12960436562074 2 8.33333333333333 68 -1 0.17720031852334 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 6.91666666666667 68 -1 -0.15741069332041 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 8.58333333333333 68 -1 0.36526355577927 -0.5 -0.5 367232 1
i 4 85.12960436562074 2 8.91666666666667 68 -1 0.15111459038038 -0.5 -0.5 367232 1
i 4 85.12960436562074 2 8.58333333333333 68 -1 -0.30588846591697 -0.5 -0.5 367232 1
i 3 85.40245566166439 2 8 68 -1 -0.38457786841422 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 6.91666666666667 68 -1 0.18546552021012 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 7.33333333333333 68 -1 -0.09524289214733 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 6.91666666666667 68 -1 0.23423690267255 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 8.58333333333333 68 -1 -0.36017905655038 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 8.58333333333333 68 -1 -0.23496573479132 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 9.25 68 -1 -0.39874015341296 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 9.75 68 -1 0.34306251056449 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 10.33333333333333 68 -1 0.03515532534723 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 8.58333333333333 68 -1 -0.20670215471813 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 9.25 68 -1 0.32628736427282 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 9.75 68 -1 -0.0595790411808 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 10.33333333333333 68 -1 0.2721092713982 -0.5 -0.5 367232 1
i 4 85.40245566166439 2 8.91666666666667 68 -1 0.07851617653781 -0.5 -0.5 367232 1
i 4 85.67530695770805 2 6.91666666666667 68 -1 -0.36967340467109 -0.5 -0.5 2869 1
i 4 85.67530695770805 2 6.66666666666667 68 -1 -0.25526295166281 -0.5 -0.5 2869 1
i 4 85.67530695770805 2 8.91666666666667 68 -1 0.33984476379573 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 6.66666666666667 68 -1 0.00321546132696 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 6.91666666666667 68 -1 0.43501272235371 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 6.66666666666667 68 -1 0.01944278167602 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 8.91666666666667 68 -1 -0.05032211777011 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 9.25 68 -1 -0.20798964774163 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 8.91666666666667 68 -1 0.09681324329442 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 6.66666666666667 68 -1 0.24846006817353 -0.5 -0.5 2869 1
i 3 86.22100954979535 2 10.33333333333333 68 -1 -0.21083128724002 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 10.58333333333333 68 -1 0.07742633219334 -0.5 -0.5 367232 1
i 3 86.22100954979535 2 10.33333333333333 68 -1 0.23427215974827 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 8.91666666666667 68 -1 -0.4144754289221 -0.5 -0.5 367232 1
i 6 86.22100954979535 2 8.91666666666667 68 -1 0.17547594312669 -0.5 -0.5 367232 1
i 5 86.22100954979535 2 9.5 68 -1 0.3259729257266 -0.5 -0.5 367232 1
i 5 86.22100954979535 2 10 68 -1 0.16459268991349 -0.5 -0.5 367232 1
i 5 86.22100954979535 2 10.58333333333333 68 -1 0.14596801827027 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 9.25 68 -1 0.48415991330014 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 6.66666666666667 68 -1 0.38499403344515 -0.5 -0.5 2869 1
i 3 86.49386084583901 2 10.33333333333333 68 -1 0.32563173419699 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.25 68 -1 0.32808610933331 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.5 68 -1 -0.26111740670749 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.25 68 -1 0.03165932889602 -0.5 -0.5 367232 1
i 4 86.76671214188266 2 6.66666666666667 68 -1 -0.36790183675955 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 6.91666666666667 68 -1 -0.16851920963437 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 6.66666666666667 68 -1 -0.35513810818181 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 9.25 68 -1 0.01758905080956 -0.5 -0.5 367232 1
i 4 86.76671214188266 2 8.91666666666667 68 -1 -0.01269905989586 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 6.66666666666667 68 -1 0.14802769242994 -0.5 -0.5 2869 1
i 6 87.03956343792632 2 6.66666666666667 68 -1 0.29272415107577 -0.5 -0.5 2869 1
i 6 87.03956343792632 2 7.33333333333333 68 -1 0.33864111846919 -0.5 -0.5 2869 1
i 6 87.03956343792632 2 7.66666666666667 68 -1 -0.10931703464652 -0.5 -0.5 2869 1
i 5 87.03956343792632 2 8.33333333333333 68 -1 0.01515584438645 -0.5 -0.5 2869 1
i 4 87.03956343792632 2 6.33333333333333 68 -1 -0.23394490360616 -0.5 -0.5 2869 1
i 4 87.03956343792632 2 8.91666666666667 68 -1 -0.49761385389324 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 9.25 68 -1 -0.33599643325345 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 8.91666666666667 68 -1 -0.45182264203842 -0.5 -0.5 367232 1
i 4 87.31241473396997 2 6.33333333333333 68 -1 -0.19390317645145 -0.5 -0.5 2869 1
i 4 87.31241473396997 2 8.91666666666667 68 -1 -0.0907898860012 -0.5 -0.5 367232 1
i 4 87.58526603001364 2 6.33333333333333 68 -1 -0.02994543362553 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 6.66666666666667 68 -1 -0.20165776296637 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 6.33333333333333 68 -1 0.08242950876948 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 8.91666666666667 68 -1 -0.29361425378692 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 6.33333333333333 68 -1 -0.11894954322185 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 6.33333333333333 68 -1 0.01822958566475 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 6.91666666666667 68 -1 0.4207697176268 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 7.41666666666667 68 -1 -0.2991812827824 -0.5 -0.5 2869 1
i 5 87.8581173260573 2 8 68 -1 -0.42034027417222 -0.5 -0.5 2869 1
i 4 87.8581173260573 2 6.66666666666667 68 -1 -0.11114465003361 -0.5 -0.5 2869 1
i 4 87.8581173260573 2 8.91666666666667 68 -1 -0.01218205556936 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 9.25 68 -1 -0.2430152350388 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 8.91666666666667 68 -1 0.03838048125006 -0.5 -0.5 367232 1
i 4 88.13096862210095 2 6.66666666666667 68 -1 -0.42772305492706 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 6.91666666666667 68 -1 0.45270442710069 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 6.66666666666667 68 -1 -0.13195318106699 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 8.91666666666667 68 -1 0.45371799087966 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 8.91666666666667 68 -1 0.38144956599186 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 9.5 68 -1 -0.38654319644926 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 10 68 -1 0.30990505931699 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 10.58333333333333 68 -1 -0.17308145456851 -0.5 -0.5 367232 1
i 4 88.13096862210095 2 8.58333333333333 68 -1 0.17814731436675 -0.5 -0.5 367232 1
i 4 88.4038199181446 2 6.66666666666667 68 -1 0.04011283551756 -0.5 -0.5 2869 1
i 4 88.4038199181446 2 6.33333333333333 68 -1 -0.22305071500083 -0.5 -0.5 2869 1
i 4 88.4038199181446 2 8.58333333333333 68 -1 -0.1600485241729 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 6.33333333333333 68 -1 -0.06141146834212 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 6.66666666666667 68 -1 0.4986904412435 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 6.33333333333333 68 -1 0.12714536164822 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 8.58333333333333 68 -1 0.18310724765183 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 8.91666666666667 68 -1 -0.09452974608531 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 8.58333333333333 68 -1 0.1690678635831 -0.5 -0.5 367232 1
i 4 88.94952251023192 2 6.33333333333333 68 -1 -0.04990717148463 -0.5 -0.5 2869 1
i 4 88.94952251023192 2 8.58333333333333 68 -1 0.05464379419654 -0.5 -0.5 367232 1
i 6 88.94952251023192 2 8.58333333333333 68 -1 0.07925962671041 -0.5 -0.5 367232 1
i 5 88.94952251023192 2 9.25 68 -1 -0.01872045340578 -0.5 -0.5 367232 1
i 5 88.94952251023192 2 9.75 68 -1 -0.35068381423356 -0.5 -0.5 367232 1
i 6 88.94952251023192 2 10.33333333333333 68 -1 -0.04547803775125 -0.5 -0.5 367232 1
i 4 88.94952251023192 2 8.91666666666667 68 -1 -0.094466559902 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 6.33333333333333 68 -1 0.45616725631956 -0.5 -0.5 2869 1
i 4 89.22237380627557 2 8.91666666666667 68 -1 0.48489195689458 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 9.25 68 -1 0.37793670624791 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 8.91666666666667 68 -1 -0.44136209392267 -0.5 -0.5 367232 1
i 4 89.49522510231924 2 6.33333333333333 68 -1 0.30225424365098 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 6.66666666666667 68 -1 -0.2570474455592 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 6.33333333333333 68 -1 -0.32841435320885 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 8.91666666666667 68 -1 0.45805231964902 -0.5 -0.5 367232 1
i 4 89.49522510231924 2 8.58333333333333 68 -1 -0.1640623868307 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 6.33333333333333 68 -1 0.21403726081171 -0.5 -0.5 2869 1
i 6 89.7680763983629 2 6.33333333333333 68 -1 -0.09116753966595 -0.5 -0.5 2869 1
i 5 89.7680763983629 2 6.91666666666667 68 -1 -0.34859666660617 -0.5 -0.5 2869 1
i 5 89.7680763983629 2 7.41666666666667 68 -1 0.36530378509401 -0.5 -0.5 2869 1
i 5 89.7680763983629 2 8 68 -1 -0.12936074346527 -0.5 -0.5 2869 1
i 4 89.7680763983629 2 8.58333333333333 68 -1 -0.22162348109937 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 8.91666666666667 68 -1 0.16906109596506 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 8.58333333333333 68 -1 0.16667800249836 -0.5 -0.5 367232 1
i 4 90.04092769440655 2 6.33333333333333 68 -1 -0.0925758044671 -0.5 -0.5 2869 1
i 4 90.04092769440655 2 8.58333333333333 68 -1 0.21094024289056 -0.5 -0.5 367232 1
i 4 90.3137789904502 2 6.33333333333333 68 -1 -0.26427816330426 -0.5 -0.5 2869 1
i 4 90.3137789904502 2 8.58333333333333 68 -1 0.18743698824536 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 6.33333333333333 68 -1 -0.07542376723126 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 6.66666666666667 68 -1 0.06245068648186 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 6.33333333333333 68 -1 -0.17067369566539 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 8.58333333333333 68 -1 -0.41542692361429 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 8.91666666666667 68 -1 -0.02721790493435 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 8.58333333333333 68 -1 -0.49841005465668 -0.5 -0.5 367232 1
i 4 90.85948158253751 2 6.33333333333333 68 -1 0.21599582823365 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 6.33333333333333 68 -1 -0.11251375666072 -0.5 -0.5 2869 1
i 5 90.85948158253751 2 6.91666666666667 68 -1 -0.49405652832573 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 7.41666666666667 68 -1 -0.3841914687495 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 8 68 -1 0.37081919983935 -0.5 -0.5 2869 1
i 4 90.85948158253751 2 6.66666666666667 68 -1 0.49663840602046 -0.5 -0.5 2869 1
i 4 90.85948158253751 2 8.58333333333333 68 -1 -0.4188979644285 -0.5 -0.5 367232 1
i 5 90.85948158253751 2 8.58333333333333 68 -1 -0.30464715341403 -0.5 -0.5 367232 1
i 5 90.85948158253751 2 9.25 68 -1 0.00237314353518 -0.5 -0.5 367232 1
i 5 90.85948158253751 2 9.75 68 -1 0.41272589005367 -0.5 -0.5 367232 1
i 5 90.85948158253751 2 10.33333333333333 68 -1 -0.22138378160377 -0.5 -0.5 367232 1
i 4 91.13233287858117 2 6.66666666666667 68 -1 0.48871119552914 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 6.91666666666667 68 -1 0.13347320897602 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 6.66666666666667 68 -1 -0.24753277067131 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 8.58333333333333 68 -1 -0.04148901412136 -0.5 -0.5 367232 1
i 4 91.40518417462482 2 6.66666666666667 68 -1 0.0738968536879 -0.5 -0.5 2869 1
i 4 91.40518417462482 2 6.33333333333333 68 -1 0.38910396312529 -0.5 -0.5 2869 1
i 4 91.40518417462482 2 8.58333333333333 68 -1 0.06596460639772 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 6.33333333333333 68 -1 0.44010517587097 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 6.66666666666667 68 -1 0.15764881184332 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 6.33333333333333 68 -1 0.12838356770074 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 8.58333333333333 68 -1 0.28025932794097 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 8.91666666666667 68 -1 0.21110699386767 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 8.58333333333333 68 -1 0.20348594862543 -0.5 -0.5 367232 1
i 4 91.95088676671215 2 6.33333333333333 68 -1 0.31801498285675 -0.5 -0.5 2869 1
i 4 91.95088676671215 2 8.58333333333333 68 -1 -0.26875794403902 -0.5 -0.5 367232 1
i 6 91.95088676671215 2 8.58333333333333 68 -1 -0.40117924858013 -0.5 -0.5 367232 1
i 6 91.95088676671215 2 9.25 68 -1 -0.06128759364207 -0.5 -0.5 367232 1
i 6 91.95088676671215 2 9.75 68 -1 -0.2275211810956 -0.5 -0.5 367232 1
i 5 91.95088676671215 2 10.33333333333333 68 -1 -0.44721467657087 -0.5 -0.5 367232 1
i 4 91.95088676671215 2 8.91666666666667 68 -1 0.33010789907466 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 6.33333333333333 68 -1 -0.02725169034396 -0.5 -0.5 2869 1
i 4 92.2237380627558 2 8.91666666666667 68 -1 -0.22305534982378 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 9.25 68 -1 0.3525406241142 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 8.91666666666667 68 -1 -0.27089374510962 -0.5 -0.5 367232 1
i 4 92.49658935879945 2 6.33333333333333 68 -1 -0.07015333245988 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 6.66666666666667 68 -1 -0.40555798501616 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 6.33333333333333 68 -1 0.36171600308108 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 8.91666666666667 68 -1 0.35920709451225 -0.5 -0.5 367232 1
i 4 92.49658935879945 2 8.58333333333333 68 -1 -0.29322984912931 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 6.33333333333333 68 -1 -0.38767796025777 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.33333333333333 68 -1 -0.05010621227175 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 6.91666666666667 68 -1 -0.30181594300359 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 -0.16157474471596 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 8 68 -1 -0.47491212468284 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 6.33333333333333 68 -1 -0.07077323357921 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.91666666666667 68 -1 0.22813944273591 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 0.16729776342595 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 8 68 -1 -0.03656747103022 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.33333333333333 68 -1 -0.1659936418816 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 6.91666666666667 68 -1 0.45798202715654 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 0.49185179563379 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 8 68 -1 0.41659828671323 -0.5 -0.5 2869 1
i 4 92.76944065484311 2 6 68 -1 -0.33516477593535 -0.5 -0.5 2869 1
i 4 92.76944065484311 2 8.58333333333333 68 -1 0.3776225172044 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 8.91666666666667 68 -1 -0.13952455782002 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 8.58333333333333 68 -1 0.12870265657949 -0.5 -0.5 367232 1
i 4 93.04229195088676 2 6 68 -1 0.22560410006541 -0.5 -0.5 2869 1
i 4 93.04229195088676 2 8.58333333333333 68 -1 -0.06076476935497 -0.5 -0.5 367232 1
i 4 93.31514324693042 2 6 68 -1 -0.30018702982847 -0.5 -0.5 2869 1
i 4 93.31514324693042 2 8.58333333333333 68 -1 0.26842076588488 -0.5 -0.5 367232 1
i 3 93.58799454297409 2 8 68 -1 -0.09641174853137 -0.5 -0.5 2869 1
i 3 93.58799454297409 2 8.33333333333333 68 -1 0.43499391201352 -0.5 -0.5 2869 1
i 3 93.58799454297409 2 8 68 -1 -0.28429859407333 -0.5 -0.5 2869 1
i 3 93.58799454297409 2 8 68 -1 -0.21042190558722 -0.5 -0.5 2869 1
i 4 93.58799454297409 2 6 68 -1 -0.26777493495161 -0.5 -0.5 2869 1
i 4 93.58799454297409 2 8.58333333333333 68 -1 0.02176727608209 -0.5 -0.5 367232 1
i 4 93.58799454297409 2 8.91666666666667 68 -1 -0.1858493748657 -0.5 -0.5 367232 1
i 4 93.58799454297409 2 8.58333333333333 68 -1 -0.40628200596161 -0.5 -0.5 367232 1
i 3 93.86084583901774 2 8 68 -1 0.22162023673538 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8 68 -1 -0.40721273176332 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8.33333333333333 68 -1 0.33017814715309 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8 68 -1 -0.18566022678918 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6 68 -1 0.39484522673917 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6.33333333333333 68 -1 -0.41505105977479 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6 68 -1 -0.0278849815742 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 8.58333333333333 68 -1 0.01317977974896 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 8.58333333333333 68 -1 0.21851908366953 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 -0.00063247379933 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.75 68 -1 0.04953711477648 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 10.33333333333333 68 -1 -0.37224613927126 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 8.58333333333333 68 -1 0.13000956651904 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 -0.49945437245265 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.75 68 -1 -0.04403295397042 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 10.33333333333333 68 -1 0.14016882089565 -0.5 -0.5 367232 1
i 5 93.86084583901774 2 8.58333333333333 68 -1 0.36807385240626 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 -0.49111009062831 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.75 68 -1 -0.41325094812882 -0.5 -0.5 367232 1
i 5 93.86084583901774 2 10.33333333333333 68 -1 0.33538488410799 -0.5 -0.5 367232 1
i 4 93.86084583901774 2 8.33333333333333 68 -1 -0.40480297105063 -0.5 -0.5 367232 1
i 3 94.1336971350614 2 8 68 -1 -0.25389109970653 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 8 68 -1 -0.04664690998887 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 8.66666666666667 68 -1 0.18625290250945 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 9.16666666666667 68 -1 -0.18524607266817 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 9.66666666666667 68 -1 -0.02052044156572 -0.5 -0.5 2869 1
i 3 94.1336971350614 2 8.33333333333333 68 -1 0.07586343308672 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 6 68 -1 -0.33558214372048 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 6 68 -1 0.20271677371839 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 6.66666666666667 68 -1 0.11110777817472 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 7.16666666666667 68 -1 0.25394584464186 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 7.66666666666667 68 -1 -0.01548435532592 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 6.33333333333333 68 -1 0.43549606702479 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 8.33333333333333 68 -1 -0.0523943724089 -0.5 -0.5 367232 1
i 3 94.40654843110505 2 8.33333333333333 68 -1 -0.0529562264681 -0.5 -0.5 2869 1
i 3 94.40654843110505 2 8.66666666666667 68 -1 0.26807891634168 -0.5 -0.5 2869 1
i 3 94.40654843110505 2 8.33333333333333 68 -1 -0.10908929946523 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.33333333333333 68 -1 -0.01998392923891 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.66666666666667 68 -1 -0.34682184543277 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.33333333333333 68 -1 -0.2167073174504 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 8.33333333333333 68 -1 -0.10251869765138 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 8.33333333333333 68 -1 0.4724038464074 -0.5 -0.5 2869 1
i 3 94.6793997271487 2 8 68 -1 0.27439445620599 -0.5 -0.5 2869 1
i 4 94.6793997271487 2 6.33333333333333 68 -1 0.39090011950227 -0.5 -0.5 2869 1
i 4 94.6793997271487 2 6 68 -1 0.32196782138947 -0.5 -0.5 2869 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 -0.02255565910543 -0.5 -0.5 367232 1
i 4 94.6793997271487 2 10.58333333333333 68 -1 -0.45739093702574 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 -0.47995391062119 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 -0.24856678050247 -0.5 -0.5 367232 1
i 4 94.6793997271487 2 8.33333333333333 68 -1 0.05213638358402 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 8 68 -1 0.38133094999057 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 8.33333333333333 68 -1 0.07613287627154 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 8 68 -1 -0.1689607561825 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6 68 -1 -0.35591291553586 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6.33333333333333 68 -1 0.03558948898077 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6 68 -1 0.04885108398457 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 10.33333333333333 68 -1 -0.36978781083241 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 10.33333333333333 68 -1 0.30928007911333 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 10.58333333333333 68 -1 -0.49231564942595 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 10.33333333333333 68 -1 -0.36200510520677 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.33333333333333 68 -1 0.15341038979757 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.58333333333333 68 -1 -0.28072009158452 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.33333333333333 68 -1 0.25195797190269 -0.5 -0.5 367232 1
i 3 95.22510231923602 2 8 68 -1 0.15704203973191 -0.5 -0.5 2869 1
i 4 95.22510231923602 2 6 68 -1 -0.04128662239383 -0.5 -0.5 2869 1
i 3 95.22510231923602 2 10.33333333333333 68 -1 -0.15469425686892 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 10.33333333333333 68 -1 0.2219425933545 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 10.91666666666667 68 -1 0.15139705698924 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 11.5 68 -1 -0.01545180042239 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 12 68 -1 0.12489494072041 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 10.58333333333333 68 -1 0.29114046123432 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 8.33333333333333 68 -1 0.37050217523136 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 8.33333333333333 68 -1 0.40506333343008 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 8.91666666666667 68 -1 -0.23101119105036 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 9.5 68 -1 -0.01319660892663 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 10 68 -1 -0.40999556694146 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 8.58333333333333 68 -1 0.11105853931928 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 8 68 -1 0.37820433194578 -0.5 -0.5 2869 1
i 4 95.49795361527967 2 6 68 -1 -0.12638425207398 -0.5 -0.5 2869 1
i 3 95.49795361527967 2 10.58333333333333 68 -1 0.0341396334199 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 10.91666666666667 68 -1 0.00223049426595 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 10.58333333333333 68 -1 0.3157041357158 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.58333333333333 68 -1 0.10788602312394 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.91666666666667 68 -1 -0.41178316349991 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.58333333333333 68 -1 -0.37839838112777 -0.5 -0.5 367232 1
i 3 95.77080491132334 2 8 68 -1 0.06364134811572 -0.5 -0.5 2869 1
i 3 95.77080491132334 2 8.33333333333333 68 -1 -0.17180207184943 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 8 68 -1 0.19518883010194 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6 68 -1 0.01745671814509 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6.33333333333333 68 -1 0.32305581442115 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6 68 -1 0.18463804850199 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 10.58333333333333 68 -1 -0.393637984142 -0.5 -0.5 367232 1
i 3 95.77080491132334 2 10.33333333333333 68 -1 -0.15689250206991 -0.5 -0.5 367232 1
i 4 95.77080491132334 2 8.58333333333333 68 -1 0.10733993740327 -0.5 -0.5 367232 1
i 4 95.77080491132334 2 8.33333333333333 68 -1 0.43095179290926 -0.5 -0.5 367232 1
i 3 96.043656207367 2 8 68 -1 -0.1766186912661 -0.5 -0.5 2869 1
i 5 96.043656207367 2 8 68 -1 -0.29197681991003 -0.5 -0.5 2869 1
i 5 96.043656207367 2 8.66666666666667 68 -1 -0.30319088708754 -0.5 -0.5 2869 1
i 5 96.043656207367 2 9.16666666666667 68 -1 0.36489876283342 -0.5 -0.5 2869 1
i 5 96.043656207367 2 9.66666666666667 68 -1 -0.34288834915397 -0.5 -0.5 2869 1
i 4 96.043656207367 2 6 68 -1 -0.13663309686518 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6 68 -1 -0.41903905532548 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6.66666666666667 68 -1 0.49659978478943 -0.5 -0.5 2869 1
i 5 96.043656207367 2 7.16666666666667 68 -1 0.49703064463949 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.66666666666667 68 -1 0.17858020507924 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6 68 -1 0.47598168148798 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6.66666666666667 68 -1 0.37764212441046 -0.5 -0.5 2869 1
i 5 96.043656207367 2 7.16666666666667 68 -1 0.02501176088872 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.66666666666667 68 -1 0.2102555723152 -0.5 -0.5 2869 1
i 4 96.043656207367 2 6.33333333333333 68 -1 0.38505813774696 -0.5 -0.5 2869 1
i 3 96.043656207367 2 10.33333333333333 68 -1 0.04366391874394 -0.5 -0.5 367232 1
i 3 96.043656207367 2 10.58333333333333 68 -1 -0.1220185742776 -0.5 -0.5 367232 1
i 3 96.043656207367 2 10.33333333333333 68 -1 -0.43878929970601 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.33333333333333 68 -1 0.42447704017313 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.58333333333333 68 -1 0.19407458246269 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.33333333333333 68 -1 -0.04015571935315 -0.5 -0.5 367232 1
i 4 96.31650750341065 2 6.33333333333333 68 -1 -0.32401083997649 -0.5 -0.5 2869 1
i 3 96.31650750341065 2 10.33333333333333 68 -1 0.2375254063565 -0.5 -0.5 367232 1
i 4 96.31650750341065 2 8.33333333333333 68 -1 0.45779198441205 -0.5 -0.5 367232 1
i 4 96.5893587994543 2 6.33333333333333 68 -1 -0.33012846530563 -0.5 -0.5 2869 1
i 4 96.5893587994543 2 6.66666666666667 68 -1 -0.39676366103612 -0.5 -0.5 2869 1
i 4 96.5893587994543 2 6.33333333333333 68 -1 -0.28558204186643 -0.5 -0.5 2869 1
i 3 96.5893587994543 2 10.33333333333333 68 -1 -0.24762977887846 -0.5 -0.5 367232 1
i 4 96.5893587994543 2 8.33333333333333 68 -1 0.25685639906891 -0.5 -0.5 367232 1
i 3 96.86221009549796 2 7.66666666666667 68 -1 0.29160934722168 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 8 68 -1 -0.21494378493845 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 7.66666666666667 68 -1 -0.38888704625351 -0.5 -0.5 2869 1
i 4 96.86221009549796 2 6.33333333333333 68 -1 0.01023185985424 -0.5 -0.5 2869 1
i 6 96.86221009549796 2 6.33333333333333 68 -1 0.22816028644098 -0.5 -0.5 2869 1
i 5 96.86221009549796 2 6.91666666666667 68 -1 0.17371394827972 -0.5 -0.5 2869 1
i 6 96.86221009549796 2 7.41666666666667 68 -1 -0.13421072269709 -0.5 -0.5 2869 1
i 6 96.86221009549796 2 8 68 -1 0.26985608359079 -0.5 -0.5 2869 1
i 4 96.86221009549796 2 6.66666666666667 68 -1 0.45422229959281 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 10.33333333333333 68 -1 0.44087620146797 -0.5 -0.5 367232 1
i 3 96.86221009549796 2 10.58333333333333 68 -1 -0.37295455205456 -0.5 -0.5 367232 1
i 3 96.86221009549796 2 10.33333333333333 68 -1 0.19123540180863 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.33333333333333 68 -1 0.24974132133839 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.58333333333333 68 -1 0.01694081096824 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.33333333333333 68 -1 0.34274047412763 -0.5 -0.5 367232 1
i 3 97.13506139154161 2 7.66666666666667 68 -1 0.00553855754994 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.66666666666667 68 -1 0.49854807960852 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.91666666666667 68 -1 -0.15203661987188 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.66666666666667 68 -1 0.39588117182431 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 10.33333333333333 68 -1 -0.03283378031851 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 10.33333333333333 68 -1 -0.28706250789321 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 10.91666666666667 68 -1 -0.36728080179797 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 11.5 68 -1 -0.42601825975877 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 12 68 -1 -0.21095868934942 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 8.33333333333333 68 -1 -0.34144118928364 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 8.33333333333333 68 -1 -0.32412274337834 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 8.91666666666667 68 -1 0.34503988522257 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 9.5 68 -1 -0.36440663692472 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 10 68 -1 -0.23192310738889 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 8.33333333333333 68 -1 0.19090831956536 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 8.91666666666667 68 -1 0.4459555841721 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 9.5 68 -1 -0.44196263403771 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 10 68 -1 -0.36115051864016 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 8.58333333333333 68 -1 -0.09730916621027 -0.5 -0.5 367232 1
i 4 97.40791268758527 2 6.66666666666667 68 -1 -0.35386857436473 -0.5 -0.5 2869 1
i 4 97.40791268758527 2 6.33333333333333 68 -1 0.07868156571686 -0.5 -0.5 2869 1
i 4 97.40791268758527 2 8.58333333333333 68 -1 0.18955097450576 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 6.33333333333333 68 -1 -0.1811385463095 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 6.66666666666667 68 -1 0.18421406203482 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 6.33333333333333 68 -1 -0.19489460311161 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 8.58333333333333 68 -1 -0.44956909060314 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 8.91666666666667 68 -1 -0.37544113523136 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 8.58333333333333 68 -1 0.30049663856343 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 6.33333333333333 68 -1 -0.37272882208285 -0.5 -0.5 2869 1
i 3 97.95361527967258 2 10 68 -1 0.1432690818126 -0.5 -0.5 367232 1
i 3 97.95361527967258 2 10.33333333333333 68 -1 -0.37584924264581 -0.5 -0.5 367232 1
i 3 97.95361527967258 2 10 68 -1 -0.23102561023833 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 8.58333333333333 68 -1 0.10904216118951 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 8.58333333333333 68 -1 -0.16787641371526 -0.5 -0.5 367232 1
i 5 97.95361527967258 2 9.25 68 -1 -0.07848083926685 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 9.75 68 -1 0.42798639837043 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 10.33333333333333 68 -1 -0.4033008845898 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 8.91666666666667 68 -1 0.24936400482388 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 6.33333333333333 68 -1 -0.08150567300779 -0.5 -0.5 2869 1
i 3 98.22646657571623 2 10 68 -1 -0.25623157440419 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 8.91666666666667 68 -1 -0.08771387613589 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 9.25 68 -1 0.17232926052192 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 8.91666666666667 68 -1 0.44217893576046 -0.5 -0.5 367232 1
i 4 98.49931787175989 2 6.33333333333333 68 -1 -0.28077519638314 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 6.66666666666667 68 -1 0.39296490094461 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 6.33333333333333 68 -1 0.19921725327279 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 8.91666666666667 68 -1 0.44277248089277 -0.5 -0.5 367232 1
i 4 98.49931787175989 2 8.58333333333333 68 -1 -0.2935471993095 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 6.33333333333333 68 -1 0.35580234873838 -0.5 -0.5 2869 1
i 5 98.77216916780354 2 6.33333333333333 68 -1 -0.46269171123628 -0.5 -0.5 2869 1
i 6 98.77216916780354 2 6.91666666666667 68 -1 -0.29960170631366 -0.5 -0.5 2869 1
i 5 98.77216916780354 2 7.41666666666667 68 -1 0.2717549551058 -0.5 -0.5 2869 1
i 5 98.77216916780354 2 8 68 -1 -0.26743820531049 -0.5 -0.5 2869 1
i 4 98.77216916780354 2 6 68 -1 -0.1076790662584 -0.5 -0.5 2869 1
i 4 98.77216916780354 2 8.58333333333333 68 -1 -0.44956115689734 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 8.91666666666667 68 -1 -0.10224955101515 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 8.58333333333333 68 -1 0.22871365199544 -0.5 -0.5 367232 1
i 4 99.0450204638472 2 6 68 -1 0.18178165448738 -0.5 -0.5 2869 1
i 4 99.0450204638472 2 8.58333333333333 68 -1 -0.36102202487667 -0.5 -0.5 367232 1
i 4 99.31787175989085 2 6 68 -1 0.39684502505396 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 6.33333333333333 68 -1 0.1539622519366 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 6 68 -1 0.00431797294915 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 8.58333333333333 68 -1 -0.40938172653942 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 6 68 -1 0.42182804466211 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 6 68 -1 -0.04407920870094 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 6.66666666666667 68 -1 -0.05640943125331 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 7.16666666666667 68 -1 -0.05813419835964 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 7.66666666666667 68 -1 0.09396715273536 -0.5 -0.5 2869 1
i 4 99.5907230559345 2 6.33333333333333 68 -1 -0.30037452528694 -0.5 -0.5 2869 1
i 4 99.5907230559345 2 8.58333333333333 68 -1 0.21304842453907 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 8.91666666666667 68 -1 -0.44271564568753 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 8.58333333333333 68 -1 0.21872771843637 -0.5 -0.5 367232 1
i 4 99.86357435197817 2 6.33333333333333 68 -1 -0.24054900159084 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 6.66666666666667 68 -1 -0.46866295181064 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 6.33333333333333 68 -1 -0.28050153349492 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 8.58333333333333 68 -1 -0.37184322353543 -0.5 -0.5 367232 1
i 6 99.86357435197817 2 8.58333333333333 68 -1 -0.02416829869748 -0.5 -0.5 367232 1
i 5 99.86357435197817 2 9.25 68 -1 -0.08775627585918 -0.5 -0.5 367232 1
i 5 99.86357435197817 2 9.75 68 -1 0.32719066733018 -0.5 -0.5 367232 1
i 5 99.86357435197817 2 10.33333333333333 68 -1 -0.32317854338845 -0.5 -0.5 367232 1
i 4 99.86357435197817 2 8.33333333333333 68 -1 0.26906128706432 -0.5 -0.5 367232 1
i 4 100.13642564802183 2 6.33333333333333 68 -1 -0.2656265296657 -0.5 -0.5 2869 1
i 4 100.13642564802183 2 6 68 -1 0.0195302626113 -0.5 -0.5 2869 1
i 4 100.13642564802183 2 8.33333333333333 68 -1 0.13745124610111 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 6 68 -1 -0.12900420359674 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 6.33333333333333 68 -1 0.20546943552768 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 6 68 -1 0.3934108915734 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 8.33333333333333 68 -1 0.04846797319729 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 8.58333333333333 68 -1 -0.48385820141924 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 8.33333333333333 68 -1 0.40000489923038 -0.5 -0.5 367232 1
i 4 100.68212824010914 2 6 68 -1 -0.09778632384758 -0.5 -0.5 2869 1
i 4 100.68212824010914 2 8.33333333333333 68 -1 0.30687816386841 -0.5 -0.5 367232 1
i 5 100.68212824010914 2 8.33333333333333 68 -1 -0.24758989284563 -0.5 -0.5 367232 1
i 6 100.68212824010914 2 8.91666666666667 68 -1 0.3527690220497 -0.5 -0.5 367232 1
i 5 100.68212824010914 2 9.5 68 -1 0.0806369349282 -0.5 -0.5 367232 1
i 6 100.68212824010914 2 10 68 -1 0.25559014340101 -0.5 -0.5 367232 1
i 4 100.68212824010914 2 8.58333333333333 68 -1 0.11309350181791 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 6 68 -1 0.451737400629 -0.5 -0.5 2869 1
i 4 100.95497953615279 2 8.58333333333333 68 -1 -0.30149951923476 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 8.91666666666667 68 -1 0.3396396770166 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 8.58333333333333 68 -1 0.48212109223055 -0.5 -0.5 367232 1
i 4 101.22783083219645 2 6 68 -1 -0.43834307991095 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 6.33333333333333 68 -1 -0.20572941445576 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 6 68 -1 -0.06695086786241 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 8.58333333333333 68 -1 0.14963782219436 -0.5 -0.5 367232 1
i 4 101.22783083219645 2 8.33333333333333 68 -1 0.16226585273102 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 6 68 -1 -0.23855166930206 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 6 68 -1 -0.45949145452953 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 6.66666666666667 68 -1 -0.16486337455734 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 7.16666666666667 68 -1 0.07296522222246 -0.5 -0.5 2869 1
i 5 101.5006821282401 2 7.66666666666667 68 -1 -0.34727870787539 -0.5 -0.5 2869 1
i 4 101.5006821282401 2 8.33333333333333 68 -1 0.20826710638012 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 8.58333333333333 68 -1 -0.1925560539123 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 8.33333333333333 68 -1 0.17888662915581 -0.5 -0.5 367232 1
i 4 101.77353342428377 2 6 68 -1 -0.05593746370012 -0.5 -0.5 2869 1
i 4 101.77353342428377 2 8.33333333333333 68 -1 0.1179730354478 -0.5 -0.5 367232 1
i 4 102.04638472032742 2 6 68 -1 -0.35830782512575 -0.5 -0.5 2869 1
i 4 102.04638472032742 2 8.33333333333333 68 -1 -0.20912049277081 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 6 68 -1 -0.06896657841219 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 6.33333333333333 68 -1 0.17859746519823 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 6 68 -1 -0.25624084905006 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 8.33333333333333 68 -1 -0.01592620515863 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 8.58333333333333 68 -1 -0.05325909533125 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 8.33333333333333 68 -1 0.02095606261804 -0.5 -0.5 367232 1
i 4 102.59208731241473 2 6 68 -1 -0.31494354979558 -0.5 -0.5 2869 1
i 5 102.59208731241473 2 6 68 -1 -0.28516817045136 -0.5 -0.5 2869 1
i 6 102.59208731241473 2 6.66666666666667 68 -1 -0.02727704000019 -0.5 -0.5 2869 1
i 6 102.59208731241473 2 7.16666666666667 68 -1 -0.20271219717407 -0.5 -0.5 2869 1
i 6 102.59208731241473 2 7.66666666666667 68 -1 0.16888626150878 -0.5 -0.5 2869 1
i 4 102.59208731241473 2 6.33333333333333 68 -1 -0.09631426286297 -0.5 -0.5 2869 1
i 4 102.59208731241473 2 8.33333333333333 68 -1 -0.3297193116719 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 8.33333333333333 68 -1 0.01318256705051 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 8.91666666666667 68 -1 -0.03799974873868 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 9.5 68 -1 0.31010831785093 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 10 68 -1 0.11529339714842 -0.5 -0.5 367232 1
i 4 102.86493860845839 2 6.33333333333333 68 -1 -0.04880528475819 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 6.66666666666667 68 -1 -0.1152693499041 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 6.33333333333333 68 -1 -0.45308205905569 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 8.33333333333333 68 -1 0.19990783307184 -0.5 -0.5 367232 1
i 4 103.13778990450204 2 6.33333333333333 68 -1 0.14147578595916 -0.5 -0.5 2869 1
i 4 103.13778990450204 2 6 68 -1 0.25013693229334 -0.5 -0.5 2869 1
i 4 103.13778990450204 2 8.33333333333333 68 -1 0.09655379656443 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 6 68 -1 -0.0524349069213 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 6.33333333333333 68 -1 -0.19439933422708 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 6 68 -1 -0.04260850468422 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 8.33333333333333 68 -1 0.36188201267247 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 8.58333333333333 68 -1 -0.09720567714186 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 8.33333333333333 68 -1 -0.16321180020443 -0.5 -0.5 367232 1
i 4 103.68349249658935 2 6 68 -1 -0.35636309242551 -0.5 -0.5 2869 1
i 4 103.68349249658935 2 8.33333333333333 68 -1 0.48923215477864 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 8.33333333333333 68 -1 -0.01595295721007 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 8.91666666666667 68 -1 0.49821154056204 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 9.5 68 -1 0.18247081815397 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 10 68 -1 -0.2802979325103 -0.5 -0.5 367232 1
i 4 103.68349249658935 2 8.58333333333333 68 -1 0.081666049723 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 6 68 -1 -0.21062171915192 -0.5 -0.5 2869 1
i 4 103.95634379263302 2 8.58333333333333 68 -1 -0.04347353941572 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 8.91666666666667 68 -1 0.45665283080773 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 8.58333333333333 68 -1 0.26240626227916 -0.5 -0.5 367232 1
i 4 104.22919508867668 2 6 68 -1 0.22996156554636 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 6.33333333333333 68 -1 0.40462412806684 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 6 68 -1 -0.28875215944793 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 8.58333333333333 68 -1 0.32658533681583 -0.5 -0.5 367232 1
i 4 104.22919508867668 2 8.33333333333333 68 -1 0.17247096288258 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 6 68 -1 -0.21343998891487 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6 68 -1 0.30472397295831 -0.5 -0.5 2869 1
i 5 104.50204638472033 2 6.66666666666667 68 -1 -0.07697364664724 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.16666666666667 68 -1 -0.41930338626652 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.66666666666667 68 -1 -0.36679043574335 -0.5 -0.5 2869 1
i 5 104.50204638472033 2 6 68 -1 -0.43403596712666 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6.66666666666667 68 -1 -0.36784384398815 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.16666666666667 68 -1 0.04634938172871 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.66666666666667 68 -1 -0.12304290705758 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6 68 -1 -0.10003261547665 -0.5 -0.5 2869 1
i 5 104.50204638472033 2 6.66666666666667 68 -1 -0.17134152196585 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.16666666666667 68 -1 0.23666044625352 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.66666666666667 68 -1 0.40854425213103 -0.5 -0.5 2869 1
i 4 104.50204638472033 2 6.33333333333333 68 -1 -0.29488810644915 -0.5 -0.5 2869 1
i 4 104.50204638472033 2 8.33333333333333 68 -1 0.08582224017565 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 8.58333333333333 68 -1 0.42503236362681 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 8.33333333333333 68 -1 -0.07874624189387 -0.5 -0.5 367232 1
i 4 104.77489768076398 2 6.33333333333333 68 -1 -0.24824957007393 -0.5 -0.5 2869 1
i 4 104.77489768076398 2 8.33333333333333 68 -1 -0.49508324063013 -0.5 -0.5 367232 1
i 4 105.04774897680764 2 6.33333333333333 68 -1 0.08898624642411 -0.5 -0.5 2869 1
i 4 105.04774897680764 2 8.33333333333333 68 -1 -0.18266645769095 -0.5 -0.5 367232 1
i 3 105.3206002728513 2 7.66666666666667 68 -1 -0.04696980135285 -0.5 -0.5 2869 1
i 3 105.3206002728513 2 8 68 -1 0.08734993150601 -0.5 -0.5 2869 1
i 3 105.3206002728513 2 7.66666666666667 68 -1 -0.13334005349665 -0.5 -0.5 2869 1
i 3 105.3206002728513 2 7.66666666666667 68 -1 -0.25531171080738 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.33333333333333 68 -1 -0.35016364726783 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.66666666666667 68 -1 0.32048870608263 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.33333333333333 68 -1 -0.24034426531504 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 8.33333333333333 68 -1 0.49576084989477 -0.5 -0.5 367232 1
i 4 105.3206002728513 2 8.58333333333333 68 -1 -0.20358571440813 -0.5 -0.5 367232 1
i 4 105.3206002728513 2 8.33333333333333 68 -1 0.24977190067669 -0.5 -0.5 367232 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 -0.13179654311107 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 -0.0434178643545 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 8 68 -1 0.33795077417249 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 -0.33202307531495 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 6.33333333333333 68 -1 -0.14315018694553 -0.5 -0.5 2869 1
i 6 105.59345156889495 2 6.33333333333333 68 -1 -0.0075588673273 -0.5 -0.5 2869 1
i 5 105.59345156889495 2 6.91666666666667 68 -1 -0.43665472356673 -0.5 -0.5 2869 1
i 6 105.59345156889495 2 7.41666666666667 68 -1 0.18320908377273 -0.5 -0.5 2869 1
i 6 105.59345156889495 2 8 68 -1 -0.38508824325837 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 6.66666666666667 68 -1 -0.19523535637596 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 8.33333333333333 68 -1 -0.45646359974628 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 0.27303647815539 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.91666666666667 68 -1 -0.35735125858871 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 9.5 68 -1 0.41897671111177 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 10 68 -1 0.02895404825412 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 -0.32287564775539 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.91666666666667 68 -1 0.40066062380149 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 9.5 68 -1 -0.15955298877743 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 10 68 -1 -0.11742793941334 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 -0.07030151344622 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.91666666666667 68 -1 -0.18330078279042 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 9.5 68 -1 0.32968197999704 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 10 68 -1 -0.04380413525045 -0.5 -0.5 367232 1
i 4 105.59345156889495 2 8.58333333333333 68 -1 -0.22896242020128 -0.5 -0.5 367232 1
i 4 105.86630286493862 2 7.66666666666667 68 -1 0.17088416222409 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 7.66666666666667 68 -1 -0.24861059988847 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 8.33333333333333 68 -1 0.27811600095655 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 8.75 68 -1 -0.31422878560696 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 9.41666666666667 68 -1 0.12398162434779 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 8 68 -1 -0.48368237133636 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.66666666666667 68 -1 0.15815709726424 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.91666666666667 68 -1 0.07860847228515 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.66666666666667 68 -1 -0.21147718874746 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 8.58333333333333 68 -1 0.48803605494084 -0.5 -0.5 367232 1
i 3 106.13915416098227 2 8 68 -1 -0.33678311989486 -0.5 -0.5 2869 1
i 3 106.13915416098227 2 8.33333333333333 68 -1 0.23791919544281 -0.5 -0.5 2869 1
i 3 106.13915416098227 2 8 68 -1 0.49939243089559 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 6.66666666666667 68 -1 0.25948238128788 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 6.33333333333333 68 -1 0.31540018032032 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 8.58333333333333 68 -1 -0.22775747042847 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 8 68 -1 -0.08052672242115 -0.5 -0.5 2869 1
i 3 106.41200545702593 2 7.66666666666667 68 -1 0.11437702942664 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.33333333333333 68 -1 -0.05917514237749 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.66666666666667 68 -1 -0.00527600748075 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.33333333333333 68 -1 -0.06881315616129 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 10 68 -1 0.03338283760612 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 10.33333333333333 68 -1 -0.19146540803035 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 10 68 -1 -0.27113375402339 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 10 68 -1 -0.12742600704441 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.58333333333333 68 -1 -0.05999261062728 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.91666666666667 68 -1 0.43757061468823 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.58333333333333 68 -1 -0.02260006079219 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 7.66666666666667 68 -1 -0.45735542617627 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 8 68 -1 0.1917528383459 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 7.66666666666667 68 -1 0.08806527860804 -0.5 -0.5 2869 1
i 4 106.68485675306958 2 6.33333333333333 68 -1 -0.42309149576677 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 10 68 -1 -0.04440507816579 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10 68 -1 0.18931676404293 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10.33333333333333 68 -1 -0.34758269492851 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10 68 -1 -0.46200818887361 -0.5 -0.5 367232 1
i 4 106.68485675306958 2 8.58333333333333 68 -1 0.43982026831588 -0.5 -0.5 367232 1
i 6 106.68485675306958 2 8.58333333333333 68 -1 -0.05673981873094 -0.5 -0.5 367232 1
i 5 106.68485675306958 2 9.25 68 -1 -0.24653129096653 -0.5 -0.5 367232 1
i 5 106.68485675306958 2 9.75 68 -1 -0.08621921682031 -0.5 -0.5 367232 1
i 6 106.68485675306958 2 10.33333333333333 68 -1 0.25753224123151 -0.5 -0.5 367232 1
i 4 106.68485675306958 2 8.91666666666667 68 -1 0.25087796655324 -0.5 -0.5 367232 1
i 3 106.95770804911324 2 7.66666666666667 68 -1 -0.44334512531912 -0.5 -0.5 2869 1
i 4 106.95770804911324 2 6.33333333333333 68 -1 0.29244122397761 -0.5 -0.5 2869 1
i 3 106.95770804911324 2 10 68 -1 0.17453307046428 -0.5 -0.5 367232 1
i 5 106.95770804911324 2 10 68 -1 0.30612743184727 -0.5 -0.5 367232 1
i 5 106.95770804911324 2 10.58333333333333 68 -1 0.24118900591995 -0.5 -0.5 367232 1
i 5 106.95770804911324 2 11.25 68 -1 0.37603544883489 -0.5 -0.5 367232 1
i 5 106.95770804911324 2 11.75 68 -1 0.47116037417582 -0.5 -0.5 367232 1
i 3 106.95770804911324 2 10.33333333333333 68 -1 -0.03436556948646 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 8.91666666666667 68 -1 0.15955963971254 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 9.25 68 -1 0.46075081257889 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 8.91666666666667 68 -1 0.12311883044494 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 7.66666666666667 68 -1 -0.23016745293636 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.33333333333333 68 -1 0.26023452137551 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.66666666666667 68 -1 0.14759480516557 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.33333333333333 68 -1 -0.03572487067048 -0.5 -0.5 2869 1
i 3 107.23055934515689 2 10.33333333333333 68 -1 -0.45700218241827 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 10.58333333333333 68 -1 0.13150003151943 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 10.33333333333333 68 -1 0.49413685414952 -0.5 -0.5 367232 1
i 4 107.23055934515689 2 8.91666666666667 68 -1 0.24885452821541 -0.5 -0.5 367232 1
i 4 107.23055934515689 2 8.58333333333333 68 -1 -0.3208309707333 -0.5 -0.5 367232 1
i 3 107.50341064120055 2 7.66666666666667 68 -1 0.45813803412704 -0.5 -0.5 2869 1
i 3 107.50341064120055 2 8 68 -1 -0.40917766407517 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 7.66666666666667 68 -1 -0.11910897246525 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 6.33333333333333 68 -1 -0.3750748629645 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.33333333333333 68 -1 0.4301368760589 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.91666666666667 68 -1 -0.05609091334757 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 7.41666666666667 68 -1 0.41331509164687 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 8 68 -1 -0.16718625176125 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.33333333333333 68 -1 -0.21849765660314 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 6.91666666666667 68 -1 0.34212582775985 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 7.41666666666667 68 -1 -0.36259397472453 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 8 68 -1 0.43919717728957 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 6.66666666666667 68 -1 -0.24398562695564 -0.5 -0.5 2869 1
i 3 107.50341064120055 2 10.33333333333333 68 -1 0.46813644805677 -0.5 -0.5 367232 1
i 3 107.50341064120055 2 10 68 -1 -0.32276675108611 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.58333333333333 68 -1 -0.25314652651814 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.91666666666667 68 -1 -0.39042823240842 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.58333333333333 68 -1 0.12514771993573 -0.5 -0.5 367232 1
i 4 107.7762619372442 2 7.66666666666667 68 -1 0.4487243408893 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 7.66666666666667 68 -1 0.06814422562667 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 8.33333333333333 68 -1 -0.25078335943169 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 8.75 68 -1 0.44988049185537 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 9.41666666666667 68 -1 -0.39904089551493 -0.5 -0.5 2869 1
i 4 107.7762619372442 2 6.66666666666667 68 -1 -0.4018205357035 -0.5 -0.5 2869 1
i 3 107.7762619372442 2 10 68 -1 0.44660360014565 -0.5 -0.5 367232 1
i 3 107.7762619372442 2 10.33333333333333 68 -1 -0.33990701073986 -0.5 -0.5 367232 1
i 3 107.7762619372442 2 10 68 -1 0.20084329669651 -0.5 -0.5 367232 1
i 4 107.7762619372442 2 8.58333333333333 68 -1 0.11315011319622 -0.5 -0.5 367232 1
i 4 108.04911323328785 2 6.66666666666667 68 -1 0.15236735788867 -0.5 -0.5 2869 1
i 4 108.04911323328785 2 6.91666666666667 68 -1 -0.46787065505989 -0.5 -0.5 2869 1
i 4 108.04911323328785 2 6.66666666666667 68 -1 0.49647851838192 -0.5 -0.5 2869 1
i 3 108.04911323328785 2 10 68 -1 -0.25791005050138 -0.5 -0.5 367232 1
i 4 108.04911323328785 2 8.58333333333333 68 -1 0.21417588111897 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8 68 -1 -0.40719044106648 -0.5 -0.5 2869 1
i 3 108.32196452933151 2 8.33333333333333 68 -1 -0.471159010622 -0.5 -0.5 2869 1
i 3 108.32196452933151 2 8 68 -1 0.28735517439266 -0.5 -0.5 2869 1
i 4 108.32196452933151 2 6.66666666666667 68 -1 0.27320970165222 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 6.66666666666667 68 -1 0.4852644370889 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 7.33333333333333 68 -1 0.23486135688989 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 7.66666666666667 68 -1 -0.4916035302126 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 8.33333333333333 68 -1 0.46563016888411 -0.5 -0.5 2869 1
i 4 108.32196452933151 2 6.91666666666667 68 -1 0.20422990078521 -0.5 -0.5 2869 1
i 3 108.32196452933151 2 10 68 -1 0.03110863682111 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.58333333333333 68 -1 -0.20490860386731 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.91666666666667 68 -1 0.34971856551891 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.58333333333333 68 -1 -0.33980015792566 -0.5 -0.5 367232 1
i 3 108.59481582537516 2 8 68 -1 -0.46532758133873 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 6.91666666666667 68 -1 0.0025649630624 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 7.33333333333333 68 -1 -0.07027070977132 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 6.91666666666667 68 -1 -0.4346838533983 -0.5 -0.5 2869 1
i 3 108.59481582537516 2 10 68 -1 0.38238449631823 -0.5 -0.5 367232 1
i 3 108.59481582537516 2 10.33333333333333 68 -1 0.45223659771579 -0.5 -0.5 367232 1
i 3 108.59481582537516 2 10 68 -1 0.13950414469559 -0.5 -0.5 367232 1
i 4 108.59481582537516 2 8.58333333333333 68 -1 0.40048217022643 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 8.58333333333333 68 -1 0.34080476729896 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.25 68 -1 -0.09990658390712 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.75 68 -1 -0.22924963845809 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 10.33333333333333 68 -1 -0.24637403621125 -0.5 -0.5 367232 1
i 5 108.59481582537516 2 8.58333333333333 68 -1 0.28815004990095 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.25 68 -1 0.34039772350719 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.75 68 -1 -0.39145886097982 -0.5 -0.5 367232 1
i 5 108.59481582537516 2 10.33333333333333 68 -1 0.23148507326236 -0.5 -0.5 367232 1
i 4 108.59481582537516 2 8.91666666666667 68 -1 -0.14687688551149 -0.5 -0.5 367232 1
i 4 108.86766712141882 2 6.91666666666667 68 -1 -0.11929928782301 -0.5 -0.5 2869 1
i 4 108.86766712141882 2 6.66666666666667 68 -1 -0.18434258476161 -0.5 -0.5 2869 1
i 3 108.86766712141882 2 10 68 -1 -0.08808427000476 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 10 68 -1 -0.26783053635703 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 10.58333333333333 68 -1 0.30716191841006 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 11.25 68 -1 0.19347350044667 -0.5 -0.5 367232 1
i 4 108.86766712141882 2 11.75 68 -1 -0.36373466769939 -0.5 -0.5 367232 1
i 4 108.86766712141882 2 8.91666666666667 68 -1 -0.09781489933508 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 6.66666666666667 68 -1 0.04453661237347 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 6.91666666666667 68 -1 0.09207844453112 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 6.66666666666667 68 -1 -0.1017150237539 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 8.91666666666667 68 -1 -0.33349419567996 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 9.25 68 -1 -0.11634540179192 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 8.91666666666667 68 -1 0.08565087365245 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 6.66666666666667 68 -1 0.0298896135223 -0.5 -0.5 2869 1
i 3 109.41336971350614 2 10.33333333333333 68 -1 0.11614858691987 -0.5 -0.5 367232 1
i 3 109.41336971350614 2 10.58333333333333 68 -1 -0.22120191369388 -0.5 -0.5 367232 1
i 3 109.41336971350614 2 10.33333333333333 68 -1 -0.49541313751929 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 8.91666666666667 68 -1 -0.44310885668415 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 8.91666666666667 68 -1 0.2644348697943 -0.5 -0.5 367232 1
i 5 109.41336971350614 2 9.5 68 -1 -0.01363687427624 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 10 68 -1 0.0342590869624 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 10.58333333333333 68 -1 0.20783809723119 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 9.25 68 -1 -0.47150539942258 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 6.66666666666667 68 -1 -0.34060090098667 -0.5 -0.5 2869 1
i 3 109.6862210095498 2 10.33333333333333 68 -1 0.23515987999864 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.25 68 -1 0.43760691625846 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.5 68 -1 0.20266246175536 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.25 68 -1 -0.42085072452 -0.5 -0.5 367232 1
i 4 109.95907230559345 2 6.66666666666667 68 -1 -0.27272224956184 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 6.91666666666667 68 -1 0.33252929863454 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 6.66666666666667 68 -1 0.30402778369088 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 9.25 68 -1 -0.36557983423103 -0.5 -0.5 367232 1
i 4 109.95907230559345 2 8.91666666666667 68 -1 -0.08258864596164 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 6.66666666666667 68 -1 0.32005760882708 -0.5 -0.5 2869 1
i 5 110.2319236016371 2 6.66666666666667 68 -1 -0.42976056375708 -0.5 -0.5 2869 1
i 6 110.2319236016371 2 7.33333333333333 68 -1 0.11184106532023 -0.5 -0.5 2869 1
i 5 110.2319236016371 2 7.66666666666667 68 -1 0.45706058234043 -0.5 -0.5 2869 1
i 5 110.2319236016371 2 8.33333333333333 68 -1 0.27762860467307 -0.5 -0.5 2869 1
i 4 110.2319236016371 2 6.33333333333333 68 -1 -0.3589987505769 -0.5 -0.5 2869 1
i 4 110.2319236016371 2 8.91666666666667 68 -1 -0.06962835004671 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 9.25 68 -1 -0.45613073084482 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 8.91666666666667 68 -1 -0.29053816644318 -0.5 -0.5 367232 1
i 4 110.50477489768076 2 6.33333333333333 68 -1 0.16375265885431 -0.5 -0.5 2869 1
i 4 110.50477489768076 2 8.91666666666667 68 -1 -0.0909006737269 -0.5 -0.5 367232 1
i 4 110.77762619372442 2 6.33333333333333 68 -1 -0.00363245266415 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 6.66666666666667 68 -1 -0.36891117017445 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 6.33333333333333 68 -1 0.4926579820385 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 8.91666666666667 68 -1 -0.016122351388 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 6.33333333333333 68 -1 -0.41021771669896 -0.5 -0.5 2869 1
i 6 111.05047748976807 2 6.33333333333333 68 -1 0.32825830048702 -0.5 -0.5 2869 1
i 5 111.05047748976807 2 6.91666666666667 68 -1 0.49759871138803 -0.5 -0.5 2869 1
i 5 111.05047748976807 2 7.41666666666667 68 -1 -0.17929754931992 -0.5 -0.5 2869 1
i 6 111.05047748976807 2 8 68 -1 -0.15440012317096 -0.5 -0.5 2869 1
i 4 111.05047748976807 2 6.66666666666667 68 -1 0.25549122687568 -0.5 -0.5 2869 1
i 4 111.05047748976807 2 8.91666666666667 68 -1 -0.31872883103649 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 9.25 68 -1 0.12462564611695 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 8.91666666666667 68 -1 0.11135014651271 -0.5 -0.5 367232 1
i 4 111.32332878581173 2 6.66666666666667 68 -1 -0.46629962821524 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 6.91666666666667 68 -1 -0.21856846377515 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 6.66666666666667 68 -1 0.15795263540479 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 8.91666666666667 68 -1 0.05732896710044 -0.5 -0.5 367232 1
i 5 111.32332878581173 2 8.91666666666667 68 -1 0.12361596733211 -0.5 -0.5 367232 1
i 6 111.32332878581173 2 9.5 68 -1 -0.44275748033571 -0.5 -0.5 367232 1
i 6 111.32332878581173 2 10 68 -1 -0.2719454864723 -0.5 -0.5 367232 1
i 5 111.32332878581173 2 10.58333333333333 68 -1 -0.25596809584555 -0.5 -0.5 367232 1
i 4 111.32332878581173 2 8.58333333333333 68 -1 0.48749223145138 -0.5 -0.5 367232 1
i 4 111.59618008185538 2 6.66666666666667 68 -1 0.40890244909829 -0.5 -0.5 2869 1
i 4 111.59618008185538 2 6.33333333333333 68 -1 0.13777203201281 -0.5 -0.5 2869 1
i 4 111.59618008185538 2 8.58333333333333 68 -1 -0.28346608398344 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 6.33333333333333 68 -1 -0.35135121738604 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 6.66666666666667 68 -1 0.26221341953436 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 6.33333333333333 68 -1 0.0860114174591 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 8.58333333333333 68 -1 0.44739399132056 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 8.91666666666667 68 -1 -0.28951565263499 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 8.58333333333333 68 -1 -0.12804286420374 -0.5 -0.5 367232 1
i 4 112.14188267394269 2 6.33333333333333 68 -1 0.29473641847468 -0.5 -0.5 2869 1
i 4 112.14188267394269 2 8.58333333333333 68 -1 -0.05787468682759 -0.5 -0.5 367232 1
i 5 112.14188267394269 2 8.58333333333333 68 -1 -0.17173958160288 -0.5 -0.5 367232 1
i 5 112.14188267394269 2 9.25 68 -1 -0.48583403658504 -0.5 -0.5 367232 1
i 6 112.14188267394269 2 9.75 68 -1 -0.0918748958629 -0.5 -0.5 367232 1
i 6 112.14188267394269 2 10.33333333333333 68 -1 0.34735813572369 -0.5 -0.5 367232 1
i 4 112.14188267394269 2 8.91666666666667 68 -1 0.19411892646739 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 6.33333333333333 68 -1 0.06606101624212 -0.5 -0.5 2869 1
i 4 112.41473396998634 2 8.91666666666667 68 -1 -0.34643537979378 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 9.25 68 -1 0.49375209497771 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 8.91666666666667 68 -1 -0.03249734855031 -0.5 -0.5 367232 1
i 4 112.68758526603 2 6.33333333333333 68 -1 -0.0296713712548 -0.5 -0.5 2869 1
i 4 112.68758526603 2 6.66666666666667 68 -1 -0.20128615812762 -0.5 -0.5 2869 1
i 4 112.68758526603 2 6.33333333333333 68 -1 0.23874425093687 -0.5 -0.5 2869 1
i 4 112.68758526603 2 8.91666666666667 68 -1 0.47618633534064 -0.5 -0.5 367232 1
i 4 112.68758526603 2 8.58333333333333 68 -1 0.21921425701162 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 6.33333333333333 68 -1 -0.16076413053865 -0.5 -0.5 2869 1
i 5 112.96043656207365 2 6.33333333333333 68 -1 -0.34878764741524 -0.5 -0.5 2869 1
i 6 112.96043656207365 2 6.91666666666667 68 -1 0.23025609882748 -0.5 -0.5 2869 1
i 6 112.96043656207365 2 7.41666666666667 68 -1 0.05773154646255 -0.5 -0.5 2869 1
i 5 112.96043656207365 2 8 68 -1 0.17898049779153 -0.5 -0.5 2869 1
i 4 112.96043656207365 2 8.58333333333333 68 -1 0.30712458153033 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 8.91666666666667 68 -1 0.14729867158214 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 8.58333333333333 68 -1 -0.30962532156762 -0.5 -0.5 367232 1
i 4 113.23328785811734 2 6.33333333333333 68 -1 -0.13813060266764 -0.5 -0.5 2869 1
i 4 113.23328785811734 2 8.58333333333333 68 -1 0.33970013129046 -0.5 -0.5 367232 1
i 4 113.50613915416099 2 6.33333333333333 68 -1 0.14527211756348 -0.5 -0.5 2869 1
i 4 113.50613915416099 2 8.58333333333333 68 -1 -0.42989878915654 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 6.33333333333333 68 -1 0.29023384561449 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 6.66666666666667 68 -1 0.14572671772241 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 6.33333333333333 68 -1 0.47287275022514 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 8.58333333333333 68 -1 -0.00965758243743 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 8.91666666666667 68 -1 0.47924143240275 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 8.58333333333333 68 -1 -0.11191083959933 -0.5 -0.5 367232 1
i 4 114.0518417462483 2 6.33333333333333 68 -1 0.24845840162794 -0.5 -0.5 2869 1
i 5 114.0518417462483 2 6.33333333333333 68 -1 -0.49897146726084 -0.5 -0.5 2869 1
i 6 114.0518417462483 2 6.91666666666667 68 -1 -0.06707228335295 -0.5 -0.5 2869 1
i 5 114.0518417462483 2 7.41666666666667 68 -1 0.13567275929025 -0.5 -0.5 2869 1
i 6 114.0518417462483 2 8 68 -1 -0.11864472731378 -0.5 -0.5 2869 1
i 4 114.0518417462483 2 6.66666666666667 68 -1 -0.01639125195972 -0.5 -0.5 2869 1
i 4 114.0518417462483 2 8.58333333333333 68 -1 0.46853557803195 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 8.58333333333333 68 -1 -0.15612736287707 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 9.25 68 -1 -0.02555945935374 -0.5 -0.5 367232 1
i 5 114.0518417462483 2 9.75 68 -1 -0.13863575733605 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 10.33333333333333 68 -1 -0.47659955057014 -0.5 -0.5 367232 1
i 4 114.32469304229195 2 6.66666666666667 68 -1 -0.49020014158175 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 6.91666666666667 68 -1 0.38922615176733 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 6.66666666666667 68 -1 0.38082603386801 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 8.58333333333333 68 -1 0.20023119010005 -0.5 -0.5 367232 1
i 4 114.59754433833561 2 6.66666666666667 68 -1 0.03273785281228 -0.5 -0.5 2869 1
i 4 114.59754433833561 2 6.33333333333333 68 -1 0.45437894016118 -0.5 -0.5 2869 1
i 4 114.59754433833561 2 8.58333333333333 68 -1 -0.25087873920152 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 6.33333333333333 68 -1 0.19571440442429 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 6.66666666666667 68 -1 -0.25387313003751 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 6.33333333333333 68 -1 0.29367409116615 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 8.58333333333333 68 -1 0.23091000729928 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 8.91666666666667 68 -1 0.31000047119809 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 8.58333333333333 68 -1 0.38011624997147 -0.5 -0.5 367232 1
i 4 115.14324693042292 2 6.33333333333333 68 -1 0.46625013236339 -0.5 -0.5 2869 1
i 4 115.14324693042292 2 8.58333333333333 68 -1 0.40789840429711 -0.5 -0.5 367232 1
i 6 115.14324693042292 2 8.58333333333333 68 -1 -0.02299410697636 -0.5 -0.5 367232 1
i 5 115.14324693042292 2 9.25 68 -1 -0.3979340672711 -0.5 -0.5 367232 1
i 5 115.14324693042292 2 9.75 68 -1 0.35401035888457 -0.5 -0.5 367232 1
i 6 115.14324693042292 2 10.33333333333333 68 -1 -0.3930812248297 -0.5 -0.5 367232 1
i 4 115.14324693042292 2 8.91666666666667 68 -1 -0.18729782594299 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 6.33333333333333 68 -1 0.42682512154801 -0.5 -0.5 2869 1
i 4 115.41609822646657 2 8.91666666666667 68 -1 0.05630203128794 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 9.25 68 -1 0.02904174083693 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 8.91666666666667 68 -1 0.08330134842998 -0.5 -0.5 367232 1
i 4 115.68894952251023 2 6.33333333333333 68 -1 0.49893480203815 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 6.66666666666667 68 -1 0.07908178652019 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 6.33333333333333 68 -1 -0.2702918151904 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 8.91666666666667 68 -1 0.14674281602651 -0.5 -0.5 367232 1
i 4 115.68894952251023 2 8.58333333333333 68 -1 -0.16653588761624 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 6.33333333333333 68 -1 0.23134224073795 -0.5 -0.5 2869 1
i 5 115.96180081855388 2 6.33333333333333 68 -1 0.3615222715886 -0.5 -0.5 2869 1
i 5 115.96180081855388 2 6.91666666666667 68 -1 -0.47409466211726 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 7.41666666666667 68 -1 -0.02899893103722 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 8 68 -1 -0.36500728346713 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 6.33333333333333 68 -1 0.0271794404886 -0.5 -0.5 2869 1
i 5 115.96180081855388 2 6.91666666666667 68 -1 -0.13407198192353 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 7.41666666666667 68 -1 0.07169140072982 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 8 68 -1 -0.24041657104378 -0.5 -0.5 2869 1
i 4 115.96180081855388 2 6 68 -1 0.12720405050466 -0.5 -0.5 2869 1
i 4 115.96180081855388 2 8.58333333333333 68 -1 0.40929535391755 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 8.91666666666667 68 -1 -0.37660719009731 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 8.58333333333333 68 -1 0.22248715224326 -0.5 -0.5 367232 1
i 4 116.23465211459754 2 6 68 -1 -0.1481495390752 -0.5 -0.5 2869 1
i 4 116.23465211459754 2 8.58333333333333 68 -1 -0.05456200825351 -0.5 -0.5 367232 1
i 4 116.50750341064119 2 6 68 -1 0.09005940564373 -0.5 -0.5 2869 1
i 4 116.50750341064119 2 8.58333333333333 68 -1 0.38052893337853 -0.5 -0.5 367232 1
i 3 116.78035470668485 2 8 68 -1 0.18448628352671 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 8.33333333333333 68 -1 0.42695784393504 -0.5 -0.5 2869 1
i 3 116.78035470668485 2 8 68 -1 -0.1615352139826 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6 68 -1 0.43332237574069 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6.33333333333333 68 -1 -0.00087097920699 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6 68 -1 0.24627027207027 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 8.58333333333333 68 -1 0.04976952269801 -0.5 -0.5 367232 1
i 4 116.78035470668485 2 8.91666666666667 68 -1 -0.43095432594427 -0.5 -0.5 367232 1
i 4 116.78035470668485 2 8.58333333333333 68 -1 0.43920338541892 -0.5 -0.5 367232 1
i 3 117.0532060027285 2 8 68 -1 0.2280405218048 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 6 68 -1 -0.12220204340554 -0.5 -0.5 2869 1
i 5 117.0532060027285 2 6 68 -1 0.35223062651783 -0.5 -0.5 2869 1
i 5 117.0532060027285 2 6.66666666666667 68 -1 -0.22492297301792 -0.5 -0.5 2869 1
i 6 117.0532060027285 2 7.16666666666667 68 -1 0.15542233979444 -0.5 -0.5 2869 1
i 6 117.0532060027285 2 7.66666666666667 68 -1 -0.09902220845328 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 6.33333333333333 68 -1 0.36587682242892 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 8.58333333333333 68 -1 0.19061782452759 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 8.58333333333333 68 -1 0.01612711452032 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.25 68 -1 0.31052263154248 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.75 68 -1 0.40542055706128 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 10.33333333333333 68 -1 -0.3535616766996 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 8.58333333333333 68 -1 -0.30756446008859 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.25 68 -1 0.08562876203901 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.75 68 -1 0.19352101805105 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 10.33333333333333 68 -1 -0.30096239253014 -0.5 -0.5 367232 1
i 4 117.0532060027285 2 8.33333333333333 68 -1 -0.38202200274634 -0.5 -0.5 367232 1
i 4 117.32605729877218 2 6.33333333333333 68 -1 -0.48507862768974 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 6.66666666666667 68 -1 0.05954231368798 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 6.33333333333333 68 -1 0.11777122029447 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 8.33333333333333 68 -1 0.28472427374481 -0.5 -0.5 367232 1
i 4 117.59890859481584 2 6.33333333333333 68 -1 -0.23801387842162 -0.5 -0.5 2869 1
i 4 117.59890859481584 2 6 68 -1 0.17465882288983 -0.5 -0.5 2869 1
i 4 117.59890859481584 2 8.33333333333333 68 -1 0.01522882143782 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 6 68 -1 -0.21746611917968 -0.5 -0.5 2869 1
i 4 117.8717598908595 2 6.33333333333333 68 -1 0.22998392572584 -0.5 -0.5 2869 1
i 4 117.8717598908595 2 6 68 -1 -0.48052121125652 -0.5 -0.5 2869 1
i 3 117.8717598908595 2 10.33333333333333 68 -1 0.06406546605794 -0.5 -0.5 367232 1
i 3 117.8717598908595 2 10.58333333333333 68 -1 -0.1630167511109 -0.5 -0.5 367232 1
i 3 117.8717598908595 2 10.33333333333333 68 -1 -0.05506291997529 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.33333333333333 68 -1 0.16623653397775 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.58333333333333 68 -1 0.44542778445666 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.33333333333333 68 -1 -0.17911318272272 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 6 68 -1 0.35329096737999 -0.5 -0.5 2869 1
i 3 118.14461118690315 2 10.33333333333333 68 -1 -0.00511517100583 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 8.33333333333333 68 -1 -0.36682311662861 -0.5 -0.5 367232 1
i 5 118.14461118690315 2 8.33333333333333 68 -1 -0.49475161531837 -0.5 -0.5 367232 1
i 5 118.14461118690315 2 8.91666666666667 68 -1 -0.04728454712548 -0.5 -0.5 367232 1
i 6 118.14461118690315 2 9.5 68 -1 0.23149565771 -0.5 -0.5 367232 1
i 6 118.14461118690315 2 10 68 -1 0.00928785537913 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 8.58333333333333 68 -1 -0.06667804283485 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 6 68 -1 0.44719430507341 -0.5 -0.5 2869 1
i 4 118.4174624829468 2 8.58333333333333 68 -1 0.39721390735809 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 8.91666666666667 68 -1 0.19084764180036 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 8.58333333333333 68 -1 0.10204406572629 -0.5 -0.5 367232 1
i 4 118.69031377899046 2 6 68 -1 0.42146770619085 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 6.33333333333333 68 -1 0.45976824768057 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 6 68 -1 -0.28185340927929 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 8.58333333333333 68 -1 -0.07158998595245 -0.5 -0.5 367232 1
i 4 118.69031377899046 2 8.33333333333333 68 -1 0.38870732838066 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 6 68 -1 0.43474203574394 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6 68 -1 -0.02406667460846 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6.66666666666667 68 -1 -0.0694411290782 -0.5 -0.5 2869 1
i 5 118.96316507503411 2 7.16666666666667 68 -1 -0.06041279324375 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.66666666666667 68 -1 -0.01465311804418 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6 68 -1 -0.04493697667812 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6.66666666666667 68 -1 -0.09404102619815 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.16666666666667 68 -1 -0.48484147564352 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.66666666666667 68 -1 -0.33298617092186 -0.5 -0.5 2869 1
i 4 118.96316507503411 2 6.33333333333333 68 -1 -0.48542289533759 -0.5 -0.5 2869 1
i 4 118.96316507503411 2 8.33333333333333 68 -1 0.20470702616615 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 8.58333333333333 68 -1 -0.05216193996801 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 8.33333333333333 68 -1 -0.03151851313137 -0.5 -0.5 367232 1
i 4 119.23601637107777 2 6.33333333333333 68 -1 -0.02947869338176 -0.5 -0.5 2869 1
i 4 119.23601637107777 2 8.33333333333333 68 -1 -0.09488888198599 -0.5 -0.5 367232 1
i 4 119.50886766712142 2 6.33333333333333 68 -1 -0.49160358677168 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 6.66666666666667 68 -1 -0.28572643767112 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 6.33333333333333 68 -1 -0.13203058796596 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 8.33333333333333 68 -1 -0.31206032283343 -0.5 -0.5 367232 1
i 3 119.78171896316508 2 7.66666666666667 68 -1 0.3772558260188 -0.5 -0.5 2869 1
i 3 119.78171896316508 2 8 68 -1 0.40900810511075 -0.5 -0.5 2869 1
i 3 119.78171896316508 2 7.66666666666667 68 -1 0.24850889827715 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 6.33333333333333 68 -1 0.36423127824799 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 6.33333333333333 68 -1 0.14498292170209 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 6.91666666666667 68 -1 -0.32753483359114 -0.5 -0.5 2869 1
i 5 119.78171896316508 2 7.41666666666667 68 -1 -0.18728229282022 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 8 68 -1 -0.4403820650624 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 6.66666666666667 68 -1 -0.42946915070866 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 8.33333333333333 68 -1 -0.44209115946848 -0.5 -0.5 367232 1
i 4 119.78171896316508 2 8.58333333333333 68 -1 0.14391206633925 -0.5 -0.5 367232 1
i 4 119.78171896316508 2 8.33333333333333 68 -1 -0.06841245126425 -0.5 -0.5 367232 1
i 3 120.05457025920873 2 7.66666666666667 68 -1 0.2874461310567 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.66666666666667 68 -1 0.34638048602956 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.91666666666667 68 -1 0.33004461457067 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.66666666666667 68 -1 0.20294788425544 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 8.33333333333333 68 -1 -0.29436670778855 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.33333333333333 68 -1 -0.33880293375771 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.91666666666667 68 -1 -0.12254156687262 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 9.5 68 -1 0.25383675704125 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 10 68 -1 -0.45264706072422 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.33333333333333 68 -1 -0.39222543079271 -0.5 -0.5 367232 1
i 5 120.05457025920873 2 8.91666666666667 68 -1 -0.22211619230465 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 9.5 68 -1 -0.00251135302884 -0.5 -0.5 367232 1
i 5 120.05457025920873 2 10 68 -1 0.45388777746265 -0.5 -0.5 367232 1
i 4 120.05457025920873 2 8.58333333333333 68 -1 0.39729730112855 -0.5 -0.5 367232 1
i 4 120.32742155525239 2 6.66666666666667 68 -1 0.40307470934407 -0.5 -0.5 2869 1
i 4 120.32742155525239 2 6.33333333333333 68 -1 0.32923366521801 -0.5 -0.5 2869 1
i 4 120.32742155525239 2 8.58333333333333 68 -1 -0.00261425111371 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 6.33333333333333 68 -1 -0.213563535113 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 6.66666666666667 68 -1 0.35900948707305 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 6.33333333333333 68 -1 0.27392135950733 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 8.58333333333333 68 -1 -0.2801232338076 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 8.91666666666667 68 -1 0.14973699507703 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 8.58333333333333 68 -1 0.33828641373297 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 6.33333333333333 68 -1 -0.41391167022597 -0.5 -0.5 2869 1
i 3 120.8731241473397 2 10 68 -1 0.19640099544595 -0.5 -0.5 367232 1
i 3 120.8731241473397 2 10.33333333333333 68 -1 0.18885342115204 -0.5 -0.5 367232 1
i 3 120.8731241473397 2 10 68 -1 -0.28356337441132 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 8.58333333333333 68 -1 -0.17780379428037 -0.5 -0.5 367232 1
i 6 120.8731241473397 2 8.58333333333333 68 -1 -0.27931624010783 -0.5 -0.5 367232 1
i 5 120.8731241473397 2 9.25 68 -1 -0.26120451151356 -0.5 -0.5 367232 1
i 6 120.8731241473397 2 9.75 68 -1 0.01620313726195 -0.5 -0.5 367232 1
i 5 120.8731241473397 2 10.33333333333333 68 -1 0.24613115726669 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 8.91666666666667 68 -1 -0.0367558060836 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 6.33333333333333 68 -1 0.3535922269165 -0.5 -0.5 2869 1
i 4 121.14597544338335 2 10 68 -1 -0.43395309308611 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 8.91666666666667 68 -1 0.30128700736891 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 9.25 68 -1 0.37860044028472 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 8.91666666666667 68 -1 0.36406087912888 -0.5 -0.5 367232 1
i 4 121.41882673942702 2 6.33333333333333 68 -1 0.25621151881559 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 6.66666666666667 68 -1 0.2129094201923 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 6.33333333333333 68 -1 -0.04655854172785 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 8.91666666666667 68 -1 0.05645559620098 -0.5 -0.5 367232 1
i 4 121.41882673942702 2 8.58333333333333 68 -1 0.45198466478113 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 6.33333333333333 68 -1 0.18108028494952 -0.5 -0.5 2869 1
i 5 121.69167803547067 2 6.33333333333333 68 -1 0.47292029103945 -0.5 -0.5 2869 1
i 5 121.69167803547067 2 6.91666666666667 68 -1 -0.20461174311061 -0.5 -0.5 2869 1
i 6 121.69167803547067 2 7.41666666666667 68 -1 -0.26721050425988 -0.5 -0.5 2869 1
i 5 121.69167803547067 2 8 68 -1 0.26957040233138 -0.5 -0.5 2869 1
i 4 121.69167803547067 2 6 68 -1 0.15782722686328 -0.5 -0.5 2869 1
i 4 121.69167803547067 2 8.58333333333333 68 -1 0.39020122630886 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 8.91666666666667 68 -1 -0.23237355767037 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 8.58333333333333 68 -1 -0.27383521613137 -0.5 -0.5 367232 1
i 4 121.96452933151433 2 6 68 -1 -0.12826578971173 -0.5 -0.5 2869 1
i 4 121.96452933151433 2 8.58333333333333 68 -1 -0.14076591493331 -0.5 -0.5 367232 1
i 4 122.23738062755798 2 6 68 -1 -0.1740578862112 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 6.33333333333333 68 -1 0.42120178165519 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 6 68 -1 -0.34750541277055 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 8.58333333333333 68 -1 0.47866079413819 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 6 68 -1 -0.24482548407329 -0.5 -0.5 2869 1
i 5 122.51023192360164 2 6 68 -1 0.02495476207055 -0.5 -0.5 2869 1
i 6 122.51023192360164 2 6.66666666666667 68 -1 -0.01409740384408 -0.5 -0.5 2869 1
i 5 122.51023192360164 2 7.16666666666667 68 -1 -0.07843587224016 -0.5 -0.5 2869 1
i 5 122.51023192360164 2 7.66666666666667 68 -1 0.45504030257641 -0.5 -0.5 2869 1
i 4 122.51023192360164 2 6.33333333333333 68 -1 0.08425055111968 -0.5 -0.5 2869 1
i 4 122.51023192360164 2 8.58333333333333 68 -1 0.41393611151198 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 8.91666666666667 68 -1 0.29714251193116 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 8.58333333333333 68 -1 -0.4195197205072 -0.5 -0.5 367232 1
i 4 122.78308321964529 2 6.33333333333333 68 -1 0.45141292320844 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 6.66666666666667 68 -1 -0.43951951262898 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 6.33333333333333 68 -1 -0.05475697307037 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 8.58333333333333 68 -1 -0.20993829562634 -0.5 -0.5 367232 1
i 5 122.78308321964529 2 8.58333333333333 68 -1 0.20654588888744 -0.5 -0.5 367232 1
i 5 122.78308321964529 2 9.25 68 -1 -0.07772062378928 -0.5 -0.5 367232 1
i 6 122.78308321964529 2 9.75 68 -1 0.25748245153517 -0.5 -0.5 367232 1
i 5 122.78308321964529 2 10.33333333333333 68 -1 -0.0262515405966 -0.5 -0.5 367232 1
i 4 122.78308321964529 2 8.33333333333333 68 -1 0.26208898370885 -0.5 -0.5 367232 1
i 4 123.05593451568895 2 6.33333333333333 68 -1 0.47218846481297 -0.5 -0.5 2869 1
i 4 123.05593451568895 2 6 68 -1 0.31380142436633 -0.5 -0.5 2869 1
i 4 123.05593451568895 2 8.33333333333333 68 -1 -0.25693799547327 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 6 68 -1 -0.37506955658615 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 6.33333333333333 68 -1 0.39736643715115 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 6 68 -1 -0.07110093600719 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 8.33333333333333 68 -1 0.03138418192041 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 8.58333333333333 68 -1 0.41629508782589 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 8.33333333333333 68 -1 0.23789116094414 -0.5 -0.5 367232 1
i 4 123.60163710777626 2 6 68 -1 -0.03103248742591 -0.5 -0.5 2869 1
i 4 123.60163710777626 2 8.33333333333333 68 -1 -0.45043256539049 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 8.33333333333333 68 -1 0.16964795948089 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 8.91666666666667 68 -1 -0.27192433094089 -0.5 -0.5 367232 1
i 5 123.60163710777626 2 9.5 68 -1 0.3839719595086 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 10 68 -1 0.22755329890462 -0.5 -0.5 367232 1
i 4 123.60163710777626 2 8.58333333333333 68 -1 -0.2250635419512 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 6 68 -1 -0.0325697657838 -0.5 -0.5 2869 1
i 4 123.87448840381991 2 8.58333333333333 68 -1 0.45159111812349 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 8.91666666666667 68 -1 0.46355902159617 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 8.58333333333333 68 -1 0.29077198734144 -0.5 -0.5 367232 1
i 4 124.14733969986356 2 6 68 -1 -0.23510709916827 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 6.33333333333333 68 -1 0.3192212536211 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 6 68 -1 -0.08517298895901 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 8.58333333333333 68 -1 0.44286111888845 -0.5 -0.5 367232 1
i 4 124.14733969986356 2 8.33333333333333 68 -1 0.40909319742537 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 6 68 -1 0.03140462848035 -0.5 -0.5 2869 1
i 5 124.42019099590722 2 6 68 -1 0.39828132976183 -0.5 -0.5 2869 1
i 6 124.42019099590722 2 6.66666666666667 68 -1 0.41730220795979 -0.5 -0.5 2869 1
i 6 124.42019099590722 2 7.16666666666667 68 -1 0.35216635629994 -0.5 -0.5 2869 1
i 6 124.42019099590722 2 7.66666666666667 68 -1 0.2185043384305 -0.5 -0.5 2869 1
i 4 124.42019099590722 2 8.33333333333333 68 -1 0.04441895547919 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 8.58333333333333 68 -1 -0.13651429689801 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 8.33333333333333 68 -1 -0.23513189227764 -0.5 -0.5 367232 1
i 4 124.69304229195087 2 6 68 -1 0.42507411559588 -0.5 -0.5 2869 1
i 4 124.69304229195087 2 8.33333333333333 68 -1 -0.27265365111125 -0.5 -0.5 367232 1
i 4 124.96589358799453 2 6 68 -1 0.46573025021122 -0.5 -0.5 2869 1
i 4 124.96589358799453 2 8.33333333333333 68 -1 0.49142476040436 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 6 68 -1 0.38157540793214 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 6.33333333333333 68 -1 -0.17670685347556 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 6 68 -1 0.07033332306435 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 8.33333333333333 68 -1 -0.09796233970365 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 8.58333333333333 68 -1 -0.31170331733673 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 8.33333333333333 68 -1 -0.0610448200072 -0.5 -0.5 367232 1
i 4 125.51159618008187 2 6 68 -1 -0.36746802965664 -0.5 -0.5 2869 1
i 6 125.51159618008187 2 6 68 -1 0.3722079348549 -0.5 -0.5 2869 1
i 6 125.51159618008187 2 6.66666666666667 68 -1 -0.11083807457538 -0.5 -0.5 2869 1
i 6 125.51159618008187 2 7.16666666666667 68 -1 -0.15459252393769 -0.5 -0.5 2869 1
i 5 125.51159618008187 2 7.66666666666667 68 -1 -0.417791344403 -0.5 -0.5 2869 1
i 4 125.51159618008187 2 6.33333333333333 68 -1 -0.19453675843744 -0.5 -0.5 2869 1
i 4 125.51159618008187 2 8.33333333333333 68 -1 0.19896638564325 -0.5 -0.5 367232 1
i 5 125.51159618008187 2 8.33333333333333 68 -1 -0.04962816111306 -0.5 -0.5 367232 1
i 5 125.51159618008187 2 8.91666666666667 68 -1 -0.24844243037525 -0.5 -0.5 367232 1
i 6 125.51159618008187 2 9.5 68 -1 0.17904097348545 -0.5 -0.5 367232 1
i 6 125.51159618008187 2 10 68 -1 -0.34522060145259 -0.5 -0.5 367232 1
i 4 125.78444747612552 2 6.33333333333333 68 -1 0.40965340703044 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 6.66666666666667 68 -1 0.27708801091023 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 6.33333333333333 68 -1 -0.30281485907258 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 8.33333333333333 68 -1 0.32878501924584 -0.5 -0.5 367232 1
i 4 126.05729877216918 2 6.33333333333333 68 -1 -0.36615162937154 -0.5 -0.5 2869 1
i 4 126.05729877216918 2 6 68 -1 -0.09788705272553 -0.5 -0.5 2869 1
i 4 126.05729877216918 2 8.33333333333333 68 -1 0.4548445806372 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 6 68 -1 0.24144800819601 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 6.33333333333333 68 -1 0.35794164874854 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 6 68 -1 -0.18197327384146 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 8.33333333333333 68 -1 -0.13677580868836 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 8.58333333333333 68 -1 0.28287595785179 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 8.33333333333333 68 -1 0.28832894306943 -0.5 -0.5 367232 1
i 4 126.60300136425649 2 6 68 -1 0.32482323488294 -0.5 -0.5 2869 1
i 4 126.60300136425649 2 8.33333333333333 68 -1 -0.40698418980491 -0.5 -0.5 367232 1
i 6 126.60300136425649 2 8.33333333333333 68 -1 -0.40593138759716 -0.5 -0.5 367232 1
i 5 126.60300136425649 2 8.91666666666667 68 -1 -0.23848430581072 -0.5 -0.5 367232 1
i 6 126.60300136425649 2 9.5 68 -1 0.4652075873377 -0.5 -0.5 367232 1
i 5 126.60300136425649 2 10 68 -1 -0.21093787754148 -0.5 -0.5 367232 1
i 4 126.60300136425649 2 8.58333333333333 68 -1 -0.31729121606898 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 6 68 -1 0.31024022353621 -0.5 -0.5 2869 1
i 4 126.87585266030014 2 8.58333333333333 68 -1 0.12318326456005 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 8.91666666666667 68 -1 -0.25311605943268 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 8.58333333333333 68 -1 -0.4701187229759 -0.5 -0.5 367232 1
i 4 127.1487039563438 2 6 68 -1 -0.41971103193925 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 6.33333333333333 68 -1 -0.03258535900343 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 6 68 -1 -0.00406121309382 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 8.58333333333333 68 -1 0.16650480598393 -0.5 -0.5 367232 1
i 4 127.1487039563438 2 8.33333333333333 68 -1 -0.18292767701685 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 6 68 -1 -0.18783196257348 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 6 68 -1 -0.08965305763135 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 6.66666666666667 68 -1 -0.38716208988009 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 7.16666666666667 68 -1 -0.12893895799066 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 7.66666666666667 68 -1 -0.13624184284744 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 6 68 -1 0.33327551349035 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 6.66666666666667 68 -1 -0.46863003037666 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 7.16666666666667 68 -1 0.45100298968599 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 7.66666666666667 68 -1 -0.26750349307833 -0.5 -0.5 2869 1
i 4 127.42155525238745 2 8.33333333333333 68 -1 -0.09469677510265 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 8.58333333333333 68 -1 -0.07725897109647 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 8.33333333333333 68 -1 -0.07824231908091 -0.5 -0.5 367232 1
i 4 127.6944065484311 2 6 68 -1 0.48818330368968 -0.5 -0.5 2869 1
i 4 127.6944065484311 2 8.33333333333333 68 -1 0.00657493859873 -0.5 -0.5 367232 1
i 4 127.96725784447476 2 6 68 -1 0.282757973158 -0.5 -0.5 2869 1
i 4 127.96725784447476 2 8.33333333333333 68 -1 0.27181833514318 -0.5 -0.5 367232 1
i 4 128.2401091405184 2 7.66666666666667 68 -1 -0.2475523112976 -0.5 -0.5 2869 1
i 3 128.2401091405184 2 8 68 -1 -0.36950556191411 -0.5 -0.5 2869 1
i 3 128.2401091405184 2 7.66666666666667 68 -1 0.20229255378822 -0.5 -0.5 2869 1
i 4 128.2401091405184 2 6 68 -1 -0.31942598586915 -0.5 -0.5 2869 1
i 4 128.2401091405184 2 8.33333333333333 68 -1 0.07497854078984 -0.5 -0.5 367232 1
i 4 128.2401091405184 2 8.58333333333333 68 -1 -0.39211772634008 -0.5 -0.5 367232 1
i 4 128.2401091405184 2 8.33333333333333 68 -1 -0.2510033632557 -0.5 -0.5 367232 1
i 3 128.51296043656205 2 7.66666666666667 68 -1 -0.16572753799024 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6 68 -1 0.48540704394459 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6.33333333333333 68 -1 -0.2275676423329 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6 68 -1 0.22901775655113 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 8.33333333333333 68 -1 -0.35898910565275 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 8.33333333333333 68 -1 -0.11597901836921 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 8.91666666666667 68 -1 0.49924811998616 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 9.5 68 -1 0.21061639925275 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 10 68 -1 0.3328941509275 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 8.33333333333333 68 -1 -0.07097846275251 -0.5 -0.5 367232 1
i 5 128.51296043656205 2 8.91666666666667 68 -1 -0.32526714338403 -0.5 -0.5 367232 1
i 5 128.51296043656205 2 9.5 68 -1 0.17400067683519 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 10 68 -1 -0.05735063834322 -0.5 -0.5 367232 1
i 4 128.7858117326057 2 6 68 -1 0.39795064999405 -0.5 -0.5 2869 1
i 6 128.7858117326057 2 6 68 -1 -0.33661749165623 -0.5 -0.5 2869 1
i 5 128.7858117326057 2 6.66666666666667 68 -1 0.30264282740741 -0.5 -0.5 2869 1
i 6 128.7858117326057 2 7.16666666666667 68 -1 0.05178148232226 -0.5 -0.5 2869 1
i 5 128.7858117326057 2 7.66666666666667 68 -1 -0.17606748013872 -0.5 -0.5 2869 1
i 4 128.7858117326057 2 6.33333333333333 68 -1 -0.2706083959464 -0.5 -0.5 2869 1
i 4 128.7858117326057 2 8.33333333333333 68 -1 0.12481910523466 -0.5 -0.5 367232 1
i 4 129.05866302864936 2 6.33333333333333 68 -1 0.0658840422213 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 6.66666666666667 68 -1 -0.28590523676585 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 6.33333333333333 68 -1 -0.2953581494396 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 8.33333333333333 68 -1 0.44207449061074 -0.5 -0.5 367232 1
i 4 129.33151432469302 2 6.33333333333333 68 -1 0.16269817648343 -0.5 -0.5 2869 1
i 4 129.33151432469302 2 6 68 -1 -0.33901700141346 -0.5 -0.5 2869 1
i 3 129.33151432469302 2 10 68 -1 0.00003451494575 -0.5 -0.5 367232 1
i 3 129.33151432469302 2 10.33333333333333 68 -1 -0.0003959478038 -0.5 -0.5 367232 1
i 3 129.33151432469302 2 10 68 -1 -0.32110971481909 -0.5 -0.5 367232 1
i 4 129.33151432469302 2 8.33333333333333 68 -1 -0.40819965421228 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 6 68 -1 -0.35001618097454 -0.5 -0.5 2869 1
i 4 129.6043656207367 2 6.33333333333333 68 -1 0.18964869513384 -0.5 -0.5 2869 1
i 4 129.6043656207367 2 6 68 -1 0.28733925467139 -0.5 -0.5 2869 1
i 3 129.6043656207367 2 10 68 -1 -0.41241800229692 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.33333333333333 68 -1 0.34651420840913 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.58333333333333 68 -1 0.23670254091642 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.33333333333333 68 -1 0.01154917189752 -0.5 -0.5 367232 1
i 4 129.87721691678036 2 6 68 -1 0.39016205100945 -0.5 -0.5 2869 1
i 4 129.87721691678036 2 8.33333333333333 68 -1 -0.43295182404772 -0.5 -0.5 367232 1
i 5 129.87721691678036 2 8.33333333333333 68 -1 0.15312176143795 -0.5 -0.5 367232 1
i 6 129.87721691678036 2 8.91666666666667 68 -1 0.18207751919266 -0.5 -0.5 367232 1
i 6 129.87721691678036 2 9.5 68 -1 0.20934436629418 -0.5 -0.5 367232 1
i 5 129.87721691678036 2 10 68 -1 0.41493866058225 -0.5 -0.5 367232 1
i 4 129.87721691678036 2 8.58333333333333 68 -1 -0.01197617875949 -0.5 -0.5 367232 1
i 4 130.150068212824 2 6 68 -1 -0.3333229522918 -0.5 -0.5 2869 1
i 4 130.150068212824 2 8.58333333333333 68 -1 -0.44500730526165 -0.5 -0.5 367232 1
i 4 130.150068212824 2 8.91666666666667 68 -1 -0.10441888764576 -0.5 -0.5 367232 1
i 4 130.150068212824 2 8.58333333333333 68 -1 -0.14724168328374 -0.5 -0.5 367232 1
i 4 130.42291950886766 2 6 68 -1 -0.11351426072919 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 6.33333333333333 68 -1 -0.13960266795707 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 6 68 -1 0.25576330361253 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 8.58333333333333 68 -1 -0.38423143713077 -0.5 -0.5 367232 1
i 4 130.42291950886766 2 8.33333333333333 68 -1 0.37217178700485 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 6 68 -1 0.41925587936214 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6 68 -1 0.05096933366318 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6.66666666666667 68 -1 0.13210104733668 -0.5 -0.5 2869 1
i 6 130.69577080491132 2 7.16666666666667 68 -1 -0.25265826871327 -0.5 -0.5 2869 1
i 6 130.69577080491132 2 7.66666666666667 68 -1 0.35717184179223 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6 68 -1 -0.29527995668838 -0.5 -0.5 2869 1
i 6 130.69577080491132 2 6.66666666666667 68 -1 0.14323950237493 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 7.16666666666667 68 -1 -0.08008919656667 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 7.66666666666667 68 -1 -0.03155232398276 -0.5 -0.5 2869 1
i 4 130.69577080491132 2 6.33333333333333 68 -1 -0.01560702389477 -0.5 -0.5 2869 1
i 4 130.69577080491132 2 8.33333333333333 68 -1 0.38720072344836 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 8.58333333333333 68 -1 0.34679693164983 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 8.33333333333333 68 -1 0.47718771979044 -0.5 -0.5 367232 1
i 4 130.96862210095497 2 6.33333333333333 68 -1 -0.42870101284188 -0.5 -0.5 2869 1
i 4 130.96862210095497 2 8.33333333333333 68 -1 0.4611020041929 -0.5 -0.5 367232 1
i 4 131.24147339699863 2 6.33333333333333 68 -1 -0.46531649524628 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 6.66666666666667 68 -1 0.06181298277969 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 6.33333333333333 68 -1 -0.48975767882426 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 8.33333333333333 68 -1 -0.31868054852387 -0.5 -0.5 367232 1
i 3 131.51432469304228 2 7.66666666666667 68 -1 -0.44765307299436 -0.5 -0.5 2869 1
i 3 131.51432469304228 2 8 68 -1 0.3443892251533 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 7.66666666666667 68 -1 -0.26196002584799 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 6.33333333333333 68 -1 -0.30004131281902 -0.5 -0.5 2869 1
i 6 131.51432469304228 2 6.33333333333333 68 -1 -0.38416133233927 -0.5 -0.5 2869 1
i 6 131.51432469304228 2 6.91666666666667 68 -1 -0.32306597480703 -0.5 -0.5 2869 1
i 5 131.51432469304228 2 7.41666666666667 68 -1 0.18448182634508 -0.5 -0.5 2869 1
i 6 131.51432469304228 2 8 68 -1 -0.01375782608953 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 6.66666666666667 68 -1 -0.37901982966365 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 8.33333333333333 68 -1 -0.02397749723371 -0.5 -0.5 367232 1
i 4 131.51432469304228 2 8.58333333333333 68 -1 0.38082264902626 -0.5 -0.5 367232 1
i 4 131.51432469304228 2 8.33333333333333 68 -1 -0.35887206809162 -0.5 -0.5 367232 1
i 3 131.78717598908594 2 7.66666666666667 68 -1 0.16492486256884 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.66666666666667 68 -1 -0.22971282190677 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.91666666666667 68 -1 -0.36479863883757 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.66666666666667 68 -1 0.10080520889779 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 8.33333333333333 68 -1 0.1213387708202 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 8.33333333333333 68 -1 -0.32688274596607 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 8.91666666666667 68 -1 0.46679683709975 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 9.5 68 -1 -0.30398723412912 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 10 68 -1 0.24044015773644 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 8.33333333333333 68 -1 0.19502779194003 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 8.91666666666667 68 -1 -0.21173201032814 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 9.5 68 -1 0.13646685139602 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 10 68 -1 0.14884223647796 -0.5 -0.5 367232 1
i 4 131.78717598908594 2 8.58333333333333 68 -1 -0.19181088184279 -0.5 -0.5 367232 1
i 4 132.0600272851296 2 6.66666666666667 68 -1 0.32353206848425 -0.5 -0.5 2869 1
i 4 132.0600272851296 2 6.33333333333333 68 -1 0.36919088050252 -0.5 -0.5 2869 1
i 4 132.0600272851296 2 8.58333333333333 68 -1 -0.4662694976682 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 6.33333333333333 68 -1 0.05225518625429 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 6.66666666666667 68 -1 -0.05040862186012 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 6.33333333333333 68 -1 -0.18639346102779 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 8.58333333333333 68 -1 0.1541316190231 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 8.91666666666667 68 -1 0.39237389453043 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 8.58333333333333 68 -1 0.47144429536585 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 6.33333333333333 68 -1 0.48081696438012 -0.5 -0.5 2869 1
i 3 132.6057298772169 2 10 68 -1 -0.27378871224128 -0.5 -0.5 367232 1
i 3 132.6057298772169 2 10.33333333333333 68 -1 0.48654411295949 -0.5 -0.5 367232 1
i 3 132.6057298772169 2 10 68 -1 0.34207490823597 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 8.58333333333333 68 -1 0.28792075879835 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 8.58333333333333 68 -1 -0.30393032178548 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 9.25 68 -1 -0.28591488089764 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 9.75 68 -1 0.22227620712628 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 10.33333333333333 68 -1 -0.07007261982638 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 8.91666666666667 68 -1 -0.21072369440715 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 6.33333333333333 68 -1 -0.31083187863486 -0.5 -0.5 2869 1
i 3 132.87858117326056 2 10 68 -1 -0.10460393058249 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 8.91666666666667 68 -1 0.47784784953814 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 9.25 68 -1 -0.43278039394712 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 8.91666666666667 68 -1 -0.00350850673341 -0.5 -0.5 367232 1
i 4 133.1514324693042 2 6.33333333333333 68 -1 0.41691239269014 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 6.66666666666667 68 -1 -0.46136502976682 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 6.33333333333333 68 -1 -0.4954055733231 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 8.91666666666667 68 -1 -0.4788474550342 -0.5 -0.5 367232 1
i 4 133.1514324693042 2 8.58333333333333 68 -1 -0.46285953009921 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 6.33333333333333 68 -1 0.05842289093413 -0.5 -0.5 2869 1
i 6 133.42428376534787 2 6.33333333333333 68 -1 -0.06477018420259 -0.5 -0.5 2869 1
i 6 133.42428376534787 2 6.91666666666667 68 -1 -0.15881152807584 -0.5 -0.5 2869 1
i 5 133.42428376534787 2 7.41666666666667 68 -1 0.43341172374196 -0.5 -0.5 2869 1
i 6 133.42428376534787 2 8 68 -1 -0.19146361127846 -0.5 -0.5 2869 1
i 4 133.42428376534787 2 6 68 -1 0.35892905206776 -0.5 -0.5 2869 1
i 4 133.42428376534787 2 8.58333333333333 68 -1 0.25768777787871 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 8.91666666666667 68 -1 0.36070974078375 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 8.58333333333333 68 -1 0.32905013959626 -0.5 -0.5 367232 1
i 4 133.69713506139155 2 6 68 -1 -0.20511199995175 -0.5 -0.5 2869 1
i 4 133.69713506139155 2 8.58333333333333 68 -1 0.33579905832515 -0.5 -0.5 367232 1
i 4 133.9699863574352 2 6 68 -1 0.47838815116379 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 6.33333333333333 68 -1 0.40920897612714 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 6 68 -1 -0.00485890738226 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 8.58333333333333 68 -1 -0.0033951154332 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 6 68 -1 0.15771062999098 -0.5 -0.5 2869 1
i 6 134.24283765347886 2 6 68 -1 -0.18987414301378 -0.5 -0.5 2869 1
i 5 134.24283765347886 2 6.66666666666667 68 -1 -0.25330303973175 -0.5 -0.5 2869 1
i 6 134.24283765347886 2 7.16666666666667 68 -1 -0.27807036876774 -0.5 -0.5 2869 1
i 6 134.24283765347886 2 7.66666666666667 68 -1 -0.14815592407701 -0.5 -0.5 2869 1
i 4 134.24283765347886 2 6.33333333333333 68 -1 -0.179005998459 -0.5 -0.5 2869 1
i 4 134.24283765347886 2 8.58333333333333 68 -1 -0.05097577212364 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 8.91666666666667 68 -1 0.00020454028662 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 8.58333333333333 68 -1 -0.45973751027485 -0.5 -0.5 367232 1
i 4 134.5156889495225 2 6.33333333333333 68 -1 -0.41344144647007 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 6.66666666666667 68 -1 0.22687562477349 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 6.33333333333333 68 -1 -0.04917917266497 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 8.58333333333333 68 -1 0.15192655814687 -0.5 -0.5 367232 1
i 5 134.5156889495225 2 8.58333333333333 68 -1 -0.02163243898381 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 9.25 68 -1 0.05553920142505 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 9.75 68 -1 0.46478967520055 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 10.33333333333333 68 -1 0.25439029712293 -0.5 -0.5 367232 1
i 4 134.5156889495225 2 8.33333333333333 68 -1 -0.1858937248515 -0.5 -0.5 367232 1
i 4 134.78854024556617 2 6.33333333333333 68 -1 0.44326985303468 -0.5 -0.5 2869 1
i 4 134.78854024556617 2 6 68 -1 -0.26757423099837 -0.5 -0.5 2869 1
i 4 134.78854024556617 2 8.33333333333333 68 -1 0.10810748569711 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 6 68 -1 0.40113101940416 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 6.33333333333333 68 -1 -0.18902908191589 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 6 68 -1 0.46753426503611 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 8.33333333333333 68 -1 -0.2260604747395 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 8.58333333333333 68 -1 0.37354131573567 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 8.33333333333333 68 -1 -0.44770930228494 -0.5 -0.5 367232 1
i 4 135.33424283765348 2 6 68 -1 0.15914719128075 -0.5 -0.5 2869 1
i 4 135.33424283765348 2 8.33333333333333 68 -1 -0.10063478625229 -0.5 -0.5 367232 1
i 6 135.33424283765348 2 8.33333333333333 68 -1 -0.41000335168038 -0.5 -0.5 367232 1
i 6 135.33424283765348 2 8.91666666666667 68 -1 0.38212807762306 -0.5 -0.5 367232 1
i 6 135.33424283765348 2 9.5 68 -1 -0.09758877406705 -0.5 -0.5 367232 1
i 5 135.33424283765348 2 10 68 -1 -0.07193298796261 -0.5 -0.5 367232 1
i 4 135.33424283765348 2 8.58333333333333 68 -1 0.31967623788007 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 6 68 -1 -0.48117326390913 -0.5 -0.5 2869 1
i 4 135.60709413369713 2 8.58333333333333 68 -1 -0.39028029633548 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 8.91666666666667 68 -1 -0.20344021041258 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 8.58333333333333 68 -1 0.41563462501999 -0.5 -0.5 367232 1
i 4 135.8799454297408 2 6 68 -1 -0.25127542834516 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 6.33333333333333 68 -1 -0.26900616848692 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 6 68 -1 0.1390336794058 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 8.58333333333333 68 -1 -0.07101644561697 -0.5 -0.5 367232 1
i 4 135.8799454297408 2 8.33333333333333 68 -1 0.10937469155585 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 6 68 -1 -0.02413965962568 -0.5 -0.5 2869 1
i 6 136.15279672578444 2 6 68 -1 -0.20521260594226 -0.5 -0.5 2869 1
i 6 136.15279672578444 2 6.66666666666667 68 -1 0.09263416177884 -0.5 -0.5 2869 1
i 5 136.15279672578444 2 7.16666666666667 68 -1 0.00657449454534 -0.5 -0.5 2869 1
i 6 136.15279672578444 2 7.66666666666667 68 -1 -0.3533561180088 -0.5 -0.5 2869 1
i 4 136.15279672578444 2 8.33333333333333 68 -1 0.36300112215159 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 8.58333333333333 68 -1 -0.34533393080398 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 8.33333333333333 68 -1 0.26975539332637 -0.5 -0.5 367232 1
i 4 136.4256480218281 2 6 68 -1 -0.13240228231953 -0.5 -0.5 2869 1
i 4 136.4256480218281 2 8.33333333333333 68 -1 0.32005186712704 -0.5 -0.5 367232 1
i 4 136.69849931787175 2 6 68 -1 0.02993922503913 -0.5 -0.5 2869 1
i 4 136.69849931787175 2 8.33333333333333 68 -1 0.2585152957779 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 6 68 -1 -0.28301350124339 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 6.33333333333333 68 -1 -0.25113931412659 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 6 68 -1 -0.4297530004716 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 8.33333333333333 68 -1 -0.43235707700655 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 8.58333333333333 68 -1 -0.0933899837322 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 8.33333333333333 68 -1 -0.09586475576283 -0.5 -0.5 367232 1
i 4 137.24420190995906 2 6 68 -1 0.0026229172261 -0.5 -0.5 2869 1
i 6 137.24420190995906 2 6 68 -1 0.04243990723664 -0.5 -0.5 2869 1
i 6 137.24420190995906 2 6.66666666666667 68 -1 0.01933390139928 -0.5 -0.5 2869 1
i 6 137.24420190995906 2 7.16666666666667 68 -1 -0.33487647792348 -0.5 -0.5 2869 1
i 5 137.24420190995906 2 7.66666666666667 68 -1 0.08388003159415 -0.5 -0.5 2869 1
i 4 137.24420190995906 2 6.33333333333333 68 -1 -0.45093864674981 -0.5 -0.5 2869 1
i 4 137.24420190995906 2 8.33333333333333 68 -1 0.26650879122314 -0.5 -0.5 367232 1
i 6 137.24420190995906 2 8.33333333333333 68 -1 0.31289346711077 -0.5 -0.5 367232 1
i 6 137.24420190995906 2 8.91666666666667 68 -1 -0.26248559924727 -0.5 -0.5 367232 1
i 6 137.24420190995906 2 9.5 68 -1 -0.03960411507594 -0.5 -0.5 367232 1
i 5 137.24420190995906 2 10 68 -1 0.22156685948809 -0.5 -0.5 367232 1
i 4 137.5170532060027 2 6.33333333333333 68 -1 0.40434517204145 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 6.66666666666667 68 -1 -0.02610017656905 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 6.33333333333333 68 -1 -0.36653693800514 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 8.33333333333333 68 -1 -0.27537886662734 -0.5 -0.5 367232 1
i 4 137.7899045020464 2 6.33333333333333 68 -1 -0.32649416620132 -0.5 -0.5 2869 1
i 4 137.7899045020464 2 6 68 -1 0.03848791040406 -0.5 -0.5 2869 1
i 4 137.7899045020464 2 8.33333333333333 68 -1 0.32318144653159 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 6 68 -1 0.49628809649504 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 6.33333333333333 68 -1 -0.27226811732089 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 6 68 -1 -0.00188761658465 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 8.33333333333333 68 -1 -0.46657523626048 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 8.58333333333333 68 -1 0.48465057144238 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 8.33333333333333 68 -1 -0.08180637481904 -0.5 -0.5 367232 1
i 4 138.3356070941337 2 6 68 -1 -0.29447577977377 -0.5 -0.5 2869 1
i 4 138.3356070941337 2 8.33333333333333 68 -1 -0.41050324495554 -0.5 -0.5 367232 1
i 5 138.3356070941337 2 8.33333333333333 68 -1 0.24171114868087 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 8.91666666666667 68 -1 -0.04012710473719 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 9.5 68 -1 0.01503051979029 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 10 68 -1 -0.11385034008336 -0.5 -0.5 367232 1
i 4 138.3356070941337 2 8.58333333333333 68 -1 0.42586491684287 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 6 68 -1 0.45438105560184 -0.5 -0.5 2869 1
i 4 138.60845839017736 2 8.58333333333333 68 -1 -0.40252401277815 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 8.91666666666667 68 -1 0.20725361966952 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 8.58333333333333 68 -1 -0.46196166326057 -0.5 -0.5 367232 1
i 4 138.88130968622102 2 6 68 -1 -0.30481373587839 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 6.33333333333333 68 -1 0.37754413134543 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 6 68 -1 0.05430417249652 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 8.58333333333333 68 -1 0.34096724898801 -0.5 -0.5 367232 1
i 4 138.88130968622102 2 8.33333333333333 68 -1 0.38807147762775 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 6 68 -1 -0.19336302481788 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 6 68 -1 0.36076527177089 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6.66666666666667 68 -1 0.18417476496971 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.16666666666667 68 -1 0.06931108313641 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 7.66666666666667 68 -1 0.27419718713437 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6 68 -1 -0.49931872230511 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6.66666666666667 68 -1 0.05811991287214 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 7.16666666666667 68 -1 0.04426759455806 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.66666666666667 68 -1 -0.24711683897707 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6 68 -1 0.2577342419393 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6.66666666666667 68 -1 -0.1414581745751 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.16666666666667 68 -1 0.29832395813581 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.66666666666667 68 -1 -0.23849018707651 -0.5 -0.5 2869 1
i 4 139.15416098226467 2 8.33333333333333 68 -1 -0.39856042630233 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 8.58333333333333 68 -1 -0.30059846586617 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 8.33333333333333 68 -1 -0.47239047169843 -0.5 -0.5 367232 1
i 4 139.42701227830833 2 6 68 -1 -0.42814938043533 -0.5 -0.5 2869 1
i 4 139.42701227830833 2 8.33333333333333 68 -1 0.09576195781003 -0.5 -0.5 367232 1
i 4 139.69986357435198 2 6 68 -1 0.25943603531555 -0.5 -0.5 2869 1
i 4 139.69986357435198 2 8.33333333333333 68 -1 -0.45019408115661 -0.5 -0.5 367232 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 0.0132235200785 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 8 68 -1 0.4255106128213 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 0.22328564417941 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 -0.4445377386193 -0.5 -0.5 2869 1
i 4 139.97271487039563 2 6 68 -1 0.26089323877085 -0.5 -0.5 2869 1
i 4 139.97271487039563 2 8.33333333333333 68 -1 -0.44720901589732 -0.5 -0.5 367232 1
i 4 139.97271487039563 2 8.58333333333333 68 -1 -0.41530967347573 -0.5 -0.5 367232 1
i 4 139.97271487039563 2 8.33333333333333 68 -1 -0.47672682977624 -0.5 -0.5 367232 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 0.43915117584048 -0.5 -0.5 2869 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 -0.26467045504152 -0.5 -0.5 2869 1
i 4 140.2455661664393 2 8 68 -1 0.01276225678987 -0.5 -0.5 2869 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 0.01155496261153 -0.5 -0.5 2869 1
i 4 140.2455661664393 2 6 68 -1 -0.00968253983166 -0.5 -0.5 2869 1
i 4 140.2455661664393 2 8.33333333333333 68 -1 0.06963780617952 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.33333333333333 68 -1 0.05052650797505 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.91666666666667 68 -1 -0.49772533742403 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 9.5 68 -1 0.03471794511637 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 10 68 -1 -0.46446617006055 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.33333333333333 68 -1 -0.04699048683695 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.91666666666667 68 -1 0.46754725895947 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 9.5 68 -1 -0.26343979057394 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 10 68 -1 -0.49659225028923 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.33333333333333 68 -1 0.44748806597683 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 8.91666666666667 68 -1 0.19378192268988 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 9.5 68 -1 -0.30226991414038 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 10 68 -1 0.27769405861133 -0.5 -0.5 367232 1
i 3 140.51841746248294 2 7.66666666666667 68 -1 -0.32296788464303 -0.5 -0.5 2869 1
i 5 140.51841746248294 2 7.66666666666667 68 -1 -0.12394785102144 -0.5 -0.5 2869 1
i 5 140.51841746248294 2 8.33333333333333 68 -1 0.12645035429426 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 8.75 68 -1 0.24515984959343 -0.5 -0.5 2869 1
i 5 140.51841746248294 2 9.41666666666667 68 -1 0.00526576839414 -0.5 -0.5 2869 1
i 3 140.51841746248294 2 8 68 -1 0.10321192027356 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6 68 -1 -0.24305472934634 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6.33333333333333 68 -1 0.42771764570226 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6 68 -1 0.49907340555086 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 8.33333333333333 68 -1 -0.27698367169082 -0.5 -0.5 367232 1
i 3 140.7912687585266 2 8 68 -1 -0.15506508710319 -0.5 -0.5 2869 1
i 3 140.7912687585266 2 8.33333333333333 68 -1 0.12090979672 -0.5 -0.5 2869 1
i 3 140.7912687585266 2 8 68 -1 0.15143197581767 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 6 68 -1 -0.16505167593768 -0.5 -0.5 2869 1
i 5 140.7912687585266 2 6 68 -1 0.16889261577366 -0.5 -0.5 2869 1
i 6 140.7912687585266 2 6.66666666666667 68 -1 -0.38657534121052 -0.5 -0.5 2869 1
i 5 140.7912687585266 2 7.16666666666667 68 -1 0.04141962053226 -0.5 -0.5 2869 1
i 6 140.7912687585266 2 7.66666666666667 68 -1 -0.3274529111268 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 6.33333333333333 68 -1 0.2111193699462 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 8.33333333333333 68 -1 -0.32729441819786 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 8 68 -1 0.45680051180853 -0.5 -0.5 2869 1
i 3 141.06412005457025 2 7.66666666666667 68 -1 -0.45449608820971 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.33333333333333 68 -1 0.15484550983929 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.66666666666667 68 -1 -0.34208656236024 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.33333333333333 68 -1 -0.19774275424029 -0.5 -0.5 2869 1
i 3 141.06412005457025 2 10 68 -1 -0.44914686217227 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10.33333333333333 68 -1 -0.46824916732417 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10 68 -1 -0.18860374316273 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10 68 -1 0.44100109743934 -0.5 -0.5 367232 1
i 4 141.06412005457025 2 8.33333333333333 68 -1 0.38110746107249 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 7.66666666666667 68 -1 -0.46929356453032 -0.5 -0.5 2869 1
i 3 141.3369713506139 2 8 68 -1 -0.29175322506343 -0.5 -0.5 2869 1
i 3 141.3369713506139 2 7.66666666666667 68 -1 -0.19542785252751 -0.5 -0.5 2869 1
i 4 141.3369713506139 2 6.33333333333333 68 -1 0.46795825851806 -0.5 -0.5 2869 1
i 4 141.3369713506139 2 6 68 -1 0.46443194058871 -0.5 -0.5 2869 1
i 3 141.3369713506139 2 10 68 -1 0.4983358147059 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10 68 -1 0.46107750745332 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10.33333333333333 68 -1 0.15667185393386 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10 68 -1 -0.43041220722659 -0.5 -0.5 367232 1
i 4 141.3369713506139 2 8.33333333333333 68 -1 -0.31889647911578 -0.5 -0.5 367232 1
i 3 141.60982264665756 2 7.66666666666667 68 -1 -0.0055283058018 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6 68 -1 0.21902479807357 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6.33333333333333 68 -1 -0.40157308237819 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6 68 -1 0.38097516710613 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 10 68 -1 -0.33854797296051 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 10 68 -1 -0.24065599729971 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 10.58333333333333 68 -1 -0.3843094137951 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 11.25 68 -1 0.30317445787908 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 11.75 68 -1 0.03233049240247 -0.5 -0.5 367232 1
i 3 141.60982264665756 2 10.33333333333333 68 -1 -0.18751199148421 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.33333333333333 68 -1 0.13824610735358 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.58333333333333 68 -1 -0.38251713943078 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.33333333333333 68 -1 -0.30884878689141 -0.5 -0.5 367232 1
i 3 141.88267394270125 2 7.66666666666667 68 -1 0.15109002223963 -0.5 -0.5 2869 1
i 4 141.88267394270125 2 6 68 -1 0.10414285903577 -0.5 -0.5 2869 1
i 3 141.88267394270125 2 10.33333333333333 68 -1 0.25661432206661 -0.5 -0.5 367232 1
i 4 141.88267394270125 2 10.58333333333333 68 -1 -0.32363855586094 -0.5 -0.5 367232 1
i 3 141.88267394270125 2 10.33333333333333 68 -1 -0.06443994545074 -0.5 -0.5 367232 1
i 4 141.88267394270125 2 8.33333333333333 68 -1 0.40688470671056 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 8.33333333333333 68 -1 0.35806288838572 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 8.91666666666667 68 -1 -0.32468101240616 -0.5 -0.5 367232 1
i 5 141.88267394270125 2 9.5 68 -1 0.28789925246507 -0.5 -0.5 367232 1
i 5 141.88267394270125 2 10 68 -1 0.16806880688594 -0.5 -0.5 367232 1
i 4 141.88267394270125 2 8.58333333333333 68 -1 -0.38243968228493 -0.5 -0.5 367232 1
i 3 142.1555252387449 2 7.66666666666667 68 -1 0.327495989029 -0.5 -0.5 2869 1
i 4 142.1555252387449 2 8 68 -1 -0.39211141886983 -0.5 -0.5 2869 1
i 3 142.1555252387449 2 7.66666666666667 68 -1 0.30212726527161 -0.5 -0.5 2869 1
i 4 142.1555252387449 2 6 68 -1 -0.32216788435438 -0.5 -0.5 2869 1
i 3 142.1555252387449 2 10.33333333333333 68 -1 0.34848582694993 -0.5 -0.5 367232 1
i 3 142.1555252387449 2 10 68 -1 -0.21943898183061 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.58333333333333 68 -1 -0.31249053743169 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.91666666666667 68 -1 -0.01027039869086 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.58333333333333 68 -1 0.38746284405959 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 7.66666666666667 68 -1 0.36209867347959 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 7.66666666666667 68 -1 -0.00342282747342 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 8.33333333333333 68 -1 -0.21450718596115 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 8.75 68 -1 0.30902790332034 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 9.41666666666667 68 -1 -0.21765750458002 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6 68 -1 0.00788233523986 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6.33333333333333 68 -1 -0.13464199054809 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6 68 -1 0.268216545763 -0.5 -0.5 2869 1
i 3 142.42837653478855 2 10 68 -1 0.07167928173257 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 10.33333333333333 68 -1 -0.27027077125029 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 10 68 -1 -0.07583163335399 -0.5 -0.5 367232 1
i 4 142.42837653478855 2 8.58333333333333 68 -1 0.3475185807952 -0.5 -0.5 367232 1
i 4 142.42837653478855 2 8.33333333333333 68 -1 -0.23595597398584 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 6 68 -1 -0.04410813042834 -0.5 -0.5 2869 1
i 6 142.7012278308322 2 6 68 -1 0.43529548768163 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6.66666666666667 68 -1 0.2282920483894 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 7.16666666666667 68 -1 0.03736058520671 -0.5 -0.5 2869 1
i 6 142.7012278308322 2 7.66666666666667 68 -1 -0.13568154969756 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6 68 -1 0.24232652516504 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6.66666666666667 68 -1 0.05034672984988 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 7.16666666666667 68 -1 -0.26400642658731 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 7.66666666666667 68 -1 0.00902810845449 -0.5 -0.5 2869 1
i 4 142.7012278308322 2 6.33333333333333 68 -1 0.33422820966795 -0.5 -0.5 2869 1
i 3 142.7012278308322 2 10 68 -1 0.0276455300644 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.33333333333333 68 -1 0.37862014910639 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.58333333333333 68 -1 0.30832251632317 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.33333333333333 68 -1 0.14673077961509 -0.5 -0.5 367232 1
i 4 142.97407912687586 2 6.33333333333333 68 -1 0.17117427901261 -0.5 -0.5 2869 1
i 3 142.97407912687586 2 10 68 -1 -0.40871708314864 -0.5 -0.5 367232 1
i 4 142.97407912687586 2 8.33333333333333 68 -1 -0.00361917388539 -0.5 -0.5 367232 1
i 4 143.24693042291952 2 6.33333333333333 68 -1 0.0322135465372 -0.5 -0.5 2869 1
i 4 143.24693042291952 2 6.66666666666667 68 -1 0.47098448282786 -0.5 -0.5 2869 1
i 4 143.24693042291952 2 6.33333333333333 68 -1 0.31576779750853 -0.5 -0.5 2869 1
i 3 143.24693042291952 2 10 68 -1 0.09956155322006 -0.5 -0.5 367232 1
i 3 143.24693042291952 2 10.33333333333333 68 -1 -0.06576649972723 -0.5 -0.5 367232 1
i 3 143.24693042291952 2 10 68 -1 0.43787462975108 -0.5 -0.5 367232 1
i 4 143.24693042291952 2 8.33333333333333 68 -1 0.19824154750044 -0.5 -0.5 367232 1
i 3 143.51978171896317 2 7.66666666666667 68 -1 -0.24991195370257 -0.5 -0.5 2869 1
i 3 143.51978171896317 2 8 68 -1 0.2507287647552 -0.5 -0.5 2869 1
i 4 143.51978171896317 2 7.66666666666667 68 -1 0.17331891399779 -0.5 -0.5 2869 1
i 4 143.51978171896317 2 6.33333333333333 68 -1 0.16800420625277 -0.5 -0.5 2869 1
i 5 143.51978171896317 2 6.33333333333333 68 -1 -0.27902996367485 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 6.91666666666667 68 -1 -0.09352110803964 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 7.41666666666667 68 -1 -0.24267458287319 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 8 68 -1 -0.06931791843808 -0.5 -0.5 2869 1
i 4 143.51978171896317 2 6.66666666666667 68 -1 0.12478556090193 -0.5 -0.5 2869 1
i 3 143.51978171896317 2 10 68 -1 -0.24623582432447 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 10 68 -1 0.3000711276838 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 10.58333333333333 68 -1 0.16149844186659 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 11.25 68 -1 0.02701489598282 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 11.75 68 -1 -0.38749023908781 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.33333333333333 68 -1 0.17559555718335 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.58333333333333 68 -1 0.13612556410942 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.33333333333333 68 -1 -0.15703004270667 -0.5 -0.5 367232 1
i 3 143.79263301500683 2 7.66666666666667 68 -1 0.48816449744513 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.66666666666667 68 -1 -0.40705535626082 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.91666666666667 68 -1 0.3321151774377 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.66666666666667 68 -1 -0.4681213702749 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 8.33333333333333 68 -1 -0.20977540374123 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 8.33333333333333 68 -1 -0.4642714024817 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 8.91666666666667 68 -1 0.41222485993898 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 9.5 68 -1 0.43264547007246 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 10 68 -1 -0.1999557640018 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 8.33333333333333 68 -1 -0.45217296460405 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 8.91666666666667 68 -1 -0.04781883368115 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 9.5 68 -1 -0.48091069367964 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 10 68 -1 0.10705196350184 -0.5 -0.5 367232 1
i 4 143.79263301500683 2 8.58333333333333 68 -1 0.33853104751835 -0.5 -0.5 367232 1
i 4 144.06548431105048 2 6.66666666666667 68 -1 0.13604465136671 -0.5 -0.5 2869 1
i 4 144.06548431105048 2 6.33333333333333 68 -1 0.33023783331409 -0.5 -0.5 2869 1
i 4 144.06548431105048 2 8.58333333333333 68 -1 -0.06592032047398 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 6.33333333333333 68 -1 0.04339108676835 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 6.66666666666667 68 -1 -0.42854917701561 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 6.33333333333333 68 -1 -0.04302021296651 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 8.58333333333333 68 -1 0.16117793023085 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 8.91666666666667 68 -1 -0.35037704394589 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 8.58333333333333 68 -1 0.44036488154275 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 6.33333333333333 68 -1 -0.46638931481328 -0.5 -0.5 2869 1
i 3 144.6111869031378 2 10 68 -1 -0.12068024358286 -0.5 -0.5 367232 1
i 3 144.6111869031378 2 10.33333333333333 68 -1 -0.43447783398686 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 10 68 -1 -0.48424324074288 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 8.58333333333333 68 -1 -0.44769018550236 -0.5 -0.5 367232 1
i 5 144.6111869031378 2 8.58333333333333 68 -1 0.05121277239912 -0.5 -0.5 367232 1
i 6 144.6111869031378 2 9.25 68 -1 -0.41018112400154 -0.5 -0.5 367232 1
i 6 144.6111869031378 2 9.75 68 -1 -0.01570024424534 -0.5 -0.5 367232 1
i 6 144.6111869031378 2 10.33333333333333 68 -1 0.15246561255239 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 8.91666666666667 68 -1 0.18704244172896 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 6.33333333333333 68 -1 -0.01401323269596 -0.5 -0.5 2869 1
i 3 144.88403819918145 2 10 68 -1 0.07843877491947 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 8.91666666666667 68 -1 0.13386517744275 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 9.25 68 -1 0.42299692937864 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 8.91666666666667 68 -1 0.47279615398411 -0.5 -0.5 367232 1
i 4 145.1568894952251 2 6.33333333333333 68 -1 0.10019029520017 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 6.66666666666667 68 -1 -0.27869417684752 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 6.33333333333333 68 -1 0.08058685131678 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 8.91666666666667 68 -1 0.30933138871573 -0.5 -0.5 367232 1
i 4 145.1568894952251 2 8.58333333333333 68 -1 0.12187431404479 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 6.33333333333333 68 -1 0.15823612293079 -0.5 -0.5 2869 1
i 5 145.42974079126876 2 6.33333333333333 68 -1 0.24717130843809 -0.5 -0.5 2869 1
i 5 145.42974079126876 2 6.91666666666667 68 -1 0.33816291162046 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 7.41666666666667 68 -1 -0.48347823682182 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 8 68 -1 0.13041110517721 -0.5 -0.5 2869 1
i 4 145.42974079126876 2 6 68 -1 0.10363041626997 -0.5 -0.5 2869 1
i 4 145.42974079126876 2 8.58333333333333 68 -1 0.18619750579296 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 8.91666666666667 68 -1 0.36347707192784 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 8.58333333333333 68 -1 0.11506110438005 -0.5 -0.5 367232 1
i 4 145.7025920873124 2 6 68 -1 0.46009204318084 -0.5 -0.5 2869 1
i 4 145.7025920873124 2 8.58333333333333 68 -1 0.23318189795427 -0.5 -0.5 367232 1
i 4 145.9754433833561 2 6 68 -1 -0.46906930955156 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 6.33333333333333 68 -1 -0.03303148814585 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 6 68 -1 0.03399962948764 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 8.58333333333333 68 -1 -0.29602629722823 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 6 68 -1 0.4432859884489 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 6 68 -1 0.43809267354839 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 6.66666666666667 68 -1 -0.05845087695891 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 7.16666666666667 68 -1 0.24964891029358 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 7.66666666666667 68 -1 -0.21010563938973 -0.5 -0.5 2869 1
i 4 146.24829467939975 2 6.33333333333333 68 -1 0.17593147222505 -0.5 -0.5 2869 1
i 4 146.24829467939975 2 8.58333333333333 68 -1 -0.40323297801311 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 8.91666666666667 68 -1 0.15718050461307 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 8.58333333333333 68 -1 -0.19612561541009 -0.5 -0.5 367232 1
i 4 146.5211459754434 2 6.33333333333333 68 -1 0.38696234678486 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 6.66666666666667 68 -1 0.19982109312137 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 6.33333333333333 68 -1 -0.40627605551231 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 8.58333333333333 68 -1 0.49527284246284 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 8.58333333333333 68 -1 -0.36446502328549 -0.5 -0.5 367232 1
i 6 146.5211459754434 2 9.25 68 -1 -0.34702421943428 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 9.75 68 -1 -0.23326374075429 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 10.33333333333333 68 -1 -0.22152790574352 -0.5 -0.5 367232 1
i 4 146.5211459754434 2 8.33333333333333 68 -1 0.25509887132887 -0.5 -0.5 367232 1
i 4 146.79399727148706 2 6.33333333333333 68 -1 -0.39186416163826 -0.5 -0.5 2869 1
i 4 146.79399727148706 2 6 68 -1 0.10424516000645 -0.5 -0.5 2869 1
i 4 146.79399727148706 2 8.33333333333333 68 -1 -0.27144610685462 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 6 68 -1 0.01447372077345 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 6.33333333333333 68 -1 0.12803635832856 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 6 68 -1 0.21582037657105 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 8.33333333333333 68 -1 0.07262402053536 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 8.58333333333333 68 -1 -0.15816440957044 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 8.33333333333333 68 -1 0.23378077461954 -0.5 -0.5 367232 1
i 4 147.33969986357437 2 6 68 -1 0.22984942826733 -0.5 -0.5 2869 1
i 4 147.33969986357437 2 8.33333333333333 68 -1 0.2892039559325 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 8.33333333333333 68 -1 0.09663506463092 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 8.91666666666667 68 -1 0.03685169540937 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 9.5 68 -1 -0.11949051529928 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 10 68 -1 0.09493485561262 -0.5 -0.5 367232 1
i 4 147.33969986357437 2 8.58333333333333 68 -1 0.09291691176726 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 6 68 -1 -0.04430881255583 -0.5 -0.5 2869 1
i 4 147.61255115961802 2 8.58333333333333 68 -1 -0.25080044917673 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 8.91666666666667 68 -1 0.42822981660899 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 8.58333333333333 68 -1 -0.29726918629634 -0.5 -0.5 367232 1
i 4 147.88540245566168 2 6 68 -1 -0.31408392745094 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 6.33333333333333 68 -1 -0.32342190346932 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 6 68 -1 0.49789942428358 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 8.58333333333333 68 -1 -0.19279955465298 -0.5 -0.5 367232 1
i 4 147.88540245566168 2 8.33333333333333 68 -1 0.10443138929267 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 6 68 -1 0.49977972884327 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 6 68 -1 -0.18141742396059 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 6.66666666666667 68 -1 0.25860412222014 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 7.16666666666667 68 -1 0.18664557236503 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 7.66666666666667 68 -1 -0.05874031344744 -0.5 -0.5 2869 1
i 4 148.15825375170533 2 8.33333333333333 68 -1 0.26654921308353 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 8.58333333333333 68 -1 -0.34442101838695 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 8.33333333333333 68 -1 0.46055461283929 -0.5 -0.5 367232 1
i 4 148.43110504774899 2 6 68 -1 0.41727339140893 -0.5 -0.5 2869 1
i 4 148.43110504774899 2 8.33333333333333 68 -1 0.17631521671833 -0.5 -0.5 367232 1
i 4 148.70395634379264 2 6 68 -1 0.08094794182791 -0.5 -0.5 2869 1
i 4 148.70395634379264 2 8.33333333333333 68 -1 -0.05456709876364 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 6 68 -1 0.08433422279086 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 6.33333333333333 68 -1 -0.3425900734395 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 6 68 -1 0.25130263718308 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 8.33333333333333 68 -1 -0.19083105155779 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 8.58333333333333 68 -1 -0.4353459359505 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 8.33333333333333 68 -1 -0.35485637161902 -0.5 -0.5 367232 1
i 4 149.24965893587995 2 6 68 -1 0.32360829711481 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 6 68 -1 -0.41673507365413 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 6.66666666666667 68 -1 0.17309667050862 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 7.16666666666667 68 -1 0.29109071953458 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 7.66666666666667 68 -1 -0.31770899304317 -0.5 -0.5 2869 1
i 4 149.24965893587995 2 6.33333333333333 68 -1 -0.48313011316978 -0.5 -0.5 2869 1
i 4 149.24965893587995 2 8.33333333333333 68 -1 0.26214092645869 -0.5 -0.5 367232 1
i 6 149.24965893587995 2 8.33333333333333 68 -1 0.45684020781738 -0.5 -0.5 367232 1
i 6 149.24965893587995 2 8.91666666666667 68 -1 0.23954691776034 -0.5 -0.5 367232 1
i 6 149.24965893587995 2 9.5 68 -1 0.04168870500599 -0.5 -0.5 367232 1
i 6 149.24965893587995 2 10 68 -1 -0.19159731669521 -0.5 -0.5 367232 1
i 4 149.5225102319236 2 6.33333333333333 68 -1 0.36764933284447 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 6.66666666666667 68 -1 0.29128114227841 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 6.33333333333333 68 -1 -0.38494300061536 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 8.33333333333333 68 -1 0.42278162491192 -0.5 -0.5 367232 1
i 4 149.79536152796726 2 6.33333333333333 68 -1 -0.48745584190667 -0.5 -0.5 2869 1
i 4 149.79536152796726 2 6 68 -1 -0.15633288847374 -0.5 -0.5 2869 1
i 4 149.79536152796726 2 8.33333333333333 68 -1 -0.395600267705 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 6 68 -1 -0.3155264691593 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 6.33333333333333 68 -1 0.46053081160384 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 6 68 -1 -0.38870449611597 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 8.33333333333333 68 -1 -0.10808973365933 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 8.58333333333333 68 -1 -0.31925211058385 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 8.33333333333333 68 -1 -0.07885812573789 -0.5 -0.5 367232 1
i 4 150.34106412005457 2 6 68 -1 0.41783411956945 -0.5 -0.5 2869 1
i 4 150.34106412005457 2 8.33333333333333 68 -1 0.46887768908684 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 8.33333333333333 68 -1 0.07771952450435 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 8.91666666666667 68 -1 -0.38676067525519 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 9.5 68 -1 0.37772960937243 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 10 68 -1 0.44672959813007 -0.5 -0.5 367232 1
i 4 150.34106412005457 2 8.58333333333333 68 -1 0.28696292488677 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 6 68 -1 0.04399170791116 -0.5 -0.5 2869 1
i 4 150.61391541609822 2 8.58333333333333 68 -1 0.47332303910719 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 8.91666666666667 68 -1 0.26052290327775 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 8.58333333333333 68 -1 -0.48402190365372 -0.5 -0.5 367232 1
i 4 150.88676671214188 2 6 68 -1 0.46463998292639 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 6.33333333333333 68 -1 -0.17906142643969 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 6 68 -1 0.36621290812589 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 8.58333333333333 68 -1 -0.15002942955971 -0.5 -0.5 367232 1
i 4 150.88676671214188 2 8.33333333333333 68 -1 -0.46307510023082 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 6 68 -1 0.28813871873108 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6 68 -1 -0.38620793922251 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6.66666666666667 68 -1 0.46152831479089 -0.5 -0.5 2869 1
i 5 151.15961800818553 2 7.16666666666667 68 -1 0.34250428902681 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.66666666666667 68 -1 0.06316478477863 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6 68 -1 0.39424012840655 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6.66666666666667 68 -1 0.39247576530929 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.16666666666667 68 -1 0.14376584083154 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.66666666666667 68 -1 0.16003235180418 -0.5 -0.5 2869 1
i 5 151.15961800818553 2 6 68 -1 -0.23443943743331 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6.66666666666667 68 -1 0.43496082645523 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.16666666666667 68 -1 -0.27680724661548 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.66666666666667 68 -1 -0.49228965390271 -0.5 -0.5 2869 1
i 4 151.15961800818553 2 6.33333333333333 68 -1 0.11747108553704 -0.5 -0.5 2869 1
i 4 151.15961800818553 2 8.33333333333333 68 -1 0.19652458050768 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 8.58333333333333 68 -1 0.32211096181606 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 8.33333333333333 68 -1 -0.4968966625551 -0.5 -0.5 367232 1
i 4 151.4324693042292 2 6.33333333333333 68 -1 -0.4051411327098 -0.5 -0.5 2869 1
i 4 151.4324693042292 2 8.33333333333333 68 -1 -0.22850489424409 -0.5 -0.5 367232 1
i 4 151.70532060027284 2 6.33333333333333 68 -1 0.41690978943159 -0.5 -0.5 2869 1
i 4 151.70532060027284 2 8.33333333333333 68 -1 -0.3892240472027 -0.5 -0.5 367232 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 0.27003064348309 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 8 68 -1 0.41148443574022 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 -0.37796247415222 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 0.24753912525296 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.33333333333333 68 -1 -0.02960977545757 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.66666666666667 68 -1 -0.47772156579514 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.33333333333333 68 -1 0.25675750741981 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 8.33333333333333 68 -1 -0.46294313782579 -0.5 -0.5 367232 1
i 4 151.9781718963165 2 8.58333333333333 68 -1 0.28235231049767 -0.5 -0.5 367232 1
i 4 151.9781718963165 2 8.33333333333333 68 -1 -0.20293865113338 -0.5 -0.5 367232 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 0.27845701295265 -0.5 -0.5 2869 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 0.45115930419399 -0.5 -0.5 2869 1
i 3 152.25102319236015 2 8 68 -1 0.04725528859144 -0.5 -0.5 2869 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 -0.0827689939474 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 6.33333333333333 68 -1 -0.20769313871872 -0.5 -0.5 2869 1
i 5 152.25102319236015 2 6.33333333333333 68 -1 -0.34438704197098 -0.5 -0.5 2869 1
i 5 152.25102319236015 2 6.91666666666667 68 -1 0.04286375609457 -0.5 -0.5 2869 1
i 5 152.25102319236015 2 7.41666666666667 68 -1 0.40474193952642 -0.5 -0.5 2869 1
i 5 152.25102319236015 2 8 68 -1 0.42671168713271 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 6.66666666666667 68 -1 0.03878559156409 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 8.33333333333333 68 -1 0.40736615442095 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 8.33333333333333 68 -1 -0.06951763427333 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.91666666666667 68 -1 -0.29869719490069 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 9.5 68 -1 0.3546203574153 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 10 68 -1 -0.08649482584985 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.33333333333333 68 -1 -0.01132300486674 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.91666666666667 68 -1 -0.14619291515981 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 9.5 68 -1 0.45867707205209 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 10 68 -1 -0.19946039686057 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.33333333333333 68 -1 0.00837116863645 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 8.91666666666667 68 -1 -0.4638051122999 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 9.5 68 -1 0.04602696154639 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 10 68 -1 0.21551537455965 -0.5 -0.5 367232 1
i 4 152.25102319236015 2 8.58333333333333 68 -1 0.1032261159234 -0.5 -0.5 367232 1
i 3 152.5238744884038 2 7.66666666666667 68 -1 0.40069002035215 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 7.66666666666667 68 -1 0.36586792622235 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 8.33333333333333 68 -1 -0.16205005855472 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 8.75 68 -1 -0.2954135718388 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 9.41666666666667 68 -1 -0.07862910480186 -0.5 -0.5 2869 1
i 3 152.5238744884038 2 8 68 -1 -0.04300131440687 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.66666666666667 68 -1 0.23451424879871 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.91666666666667 68 -1 0.48944181010478 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.66666666666667 68 -1 -0.4854885121352 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 8.58333333333333 68 -1 0.21582967454402 -0.5 -0.5 367232 1
i 3 152.79672578444746 2 8 68 -1 0.19152868714885 -0.5 -0.5 2869 1
i 3 152.79672578444746 2 8.33333333333333 68 -1 0.08420136377535 -0.5 -0.5 2869 1
i 3 152.79672578444746 2 8 68 -1 0.21374651536606 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 6.66666666666667 68 -1 -0.44536254899045 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 6.33333333333333 68 -1 0.04731675286813 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 8.58333333333333 68 -1 -0.26505558894452 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 8 68 -1 0.24048812131621 -0.5 -0.5 2869 1
i 3 153.06957708049111 2 7.66666666666667 68 -1 -0.15191973739088 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.33333333333333 68 -1 -0.48862218980488 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.66666666666667 68 -1 -0.46804408305287 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.33333333333333 68 -1 -0.30354583650154 -0.5 -0.5 2869 1
i 3 153.06957708049111 2 10 68 -1 0.21546023475949 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10.33333333333333 68 -1 0.09305222019794 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10 68 -1 -0.28189437266127 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10 68 -1 0.21096921716429 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.58333333333333 68 -1 0.38889436030934 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.91666666666667 68 -1 -0.12347416247192 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.58333333333333 68 -1 -0.19369184682451 -0.5 -0.5 367232 1
i 4 153.34242837653477 2 7.66666666666667 68 -1 0.40022632195875 -0.5 -0.5 2869 1
i 4 153.34242837653477 2 8 68 -1 0.4295009332073 -0.5 -0.5 2869 1
i 3 153.34242837653477 2 7.66666666666667 68 -1 -0.25344584605135 -0.5 -0.5 2869 1
i 4 153.34242837653477 2 6.33333333333333 68 -1 -0.12633887247179 -0.5 -0.5 2869 1
i 4 153.34242837653477 2 10 68 -1 0.20212581881908 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10 68 -1 -0.33509762880373 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10.33333333333333 68 -1 0.07624573727635 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10 68 -1 0.02939486946542 -0.5 -0.5 367232 1
i 4 153.34242837653477 2 8.58333333333333 68 -1 0.09334834945036 -0.5 -0.5 367232 1
i 5 153.34242837653477 2 8.58333333333333 68 -1 -0.46634754605636 -0.5 -0.5 367232 1
i 6 153.34242837653477 2 9.25 68 -1 -0.4395835722613 -0.5 -0.5 367232 1
i 5 153.34242837653477 2 9.75 68 -1 0.19954158286191 -0.5 -0.5 367232 1
i 6 153.34242837653477 2 10.33333333333333 68 -1 -0.20871863999141 -0.5 -0.5 367232 1
i 4 153.34242837653477 2 8.91666666666667 68 -1 0.2200644123598 -0.5 -0.5 367232 1
i 3 153.61527967257842 2 7.66666666666667 68 -1 -0.24484919491388 -0.5 -0.5 2869 1
i 4 153.61527967257842 2 6.33333333333333 68 -1 -0.00282885039491 -0.5 -0.5 2869 1
i 4 153.61527967257842 2 10 68 -1 0.20908984062328 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 10 68 -1 0.23162707014898 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 10.58333333333333 68 -1 -0.12026832603915 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 11.25 68 -1 -0.35813062118348 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 11.75 68 -1 -0.47246907683533 -0.5 -0.5 367232 1
i 3 153.61527967257842 2 10.33333333333333 68 -1 0.1605309649225 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 8.91666666666667 68 -1 0.15174828123744 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 9.25 68 -1 -0.2203447387432 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 8.91666666666667 68 -1 -0.00021334163785 -0.5 -0.5 367232 1
i 3 153.88813096862208 2 7.66666666666667 68 -1 0.07066644103418 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.33333333333333 68 -1 -0.01455483413782 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.66666666666667 68 -1 0.02696855375492 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.33333333333333 68 -1 -0.34075585019628 -0.5 -0.5 2869 1
i 3 153.88813096862208 2 10.33333333333333 68 -1 0.21799769367173 -0.5 -0.5 367232 1
i 4 153.88813096862208 2 10.58333333333333 68 -1 0.28147824642914 -0.5 -0.5 367232 1
i 3 153.88813096862208 2 10.33333333333333 68 -1 0.05567411575598 -0.5 -0.5 367232 1
i 4 153.88813096862208 2 8.91666666666667 68 -1 -0.44066558849324 -0.5 -0.5 367232 1
i 4 153.88813096862208 2 8.58333333333333 68 -1 0.09448994342754 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 7.66666666666667 68 -1 0.15930600448081 -0.5 -0.5 2869 1
i 3 154.16098226466576 2 8 68 -1 -0.07582959099417 -0.5 -0.5 2869 1
i 3 154.16098226466576 2 7.66666666666667 68 -1 -0.40084079008545 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 6.33333333333333 68 -1 0.20237612588734 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 6.33333333333333 68 -1 -0.49026980728619 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 6.91666666666667 68 -1 -0.04292748865999 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 7.41666666666667 68 -1 0.01867234908061 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 8 68 -1 0.05565115912856 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 6.33333333333333 68 -1 -0.49162021172514 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 6.91666666666667 68 -1 -0.44494829410567 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 7.41666666666667 68 -1 0.37264170892733 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 8 68 -1 0.41754576777133 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 6.66666666666667 68 -1 -0.3012667878921 -0.5 -0.5 2869 1
i 3 154.16098226466576 2 10.33333333333333 68 -1 -0.07920888876519 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 10 68 -1 0.21163348702023 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.58333333333333 68 -1 -0.38845279782221 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.91666666666667 68 -1 -0.37817509852195 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.58333333333333 68 -1 -0.29129508154272 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 7.66666666666667 68 -1 0.21785492230661 -0.5 -0.5 2869 1
i 5 154.43383356070942 2 7.66666666666667 68 -1 0.07649507107193 -0.5 -0.5 2869 1
i 5 154.43383356070942 2 8.33333333333333 68 -1 -0.01972532469162 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 8.75 68 -1 -0.27118301618759 -0.5 -0.5 2869 1
i 5 154.43383356070942 2 9.41666666666667 68 -1 -0.09203273133059 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 6.66666666666667 68 -1 0.20649158650962 -0.5 -0.5 2869 1
i 3 154.43383356070942 2 10 68 -1 0.46104144035651 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 10.33333333333333 68 -1 0.39083488841908 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 10 68 -1 0.43518350001406 -0.5 -0.5 367232 1
i 4 154.43383356070942 2 8.58333333333333 68 -1 0.13711515508956 -0.5 -0.5 367232 1
i 4 154.70668485675307 2 6.66666666666667 68 -1 -0.04869857752263 -0.5 -0.5 2869 1
i 4 154.70668485675307 2 6.91666666666667 68 -1 -0.44290168770871 -0.5 -0.5 2869 1
i 4 154.70668485675307 2 6.66666666666667 68 -1 -0.21530832635296 -0.5 -0.5 2869 1
i 4 154.70668485675307 2 10 68 -1 0.09280551029388 -0.5 -0.5 367232 1
i 4 154.70668485675307 2 8.58333333333333 68 -1 -0.30808435691923 -0.5 -0.5 367232 1
i 3 154.97953615279673 2 8 68 -1 -0.35365688312251 -0.5 -0.5 2869 1
i 3 154.97953615279673 2 8.33333333333333 68 -1 0.21069975185543 -0.5 -0.5 2869 1
i 3 154.97953615279673 2 8 68 -1 -0.03579449661352 -0.5 -0.5 2869 1
i 4 154.97953615279673 2 6.66666666666667 68 -1 -0.26705241221384 -0.5 -0.5 2869 1
i 6 154.97953615279673 2 6.66666666666667 68 -1 0.09277494770428 -0.5 -0.5 2869 1
i 5 154.97953615279673 2 7.33333333333333 68 -1 0.46564458487756 -0.5 -0.5 2869 1
i 6 154.97953615279673 2 7.66666666666667 68 -1 0.38020071176415 -0.5 -0.5 2869 1
i 6 154.97953615279673 2 8.33333333333333 68 -1 0.18971741134855 -0.5 -0.5 2869 1
i 4 154.97953615279673 2 6.91666666666667 68 -1 -0.17910659705787 -0.5 -0.5 2869 1
i 3 154.97953615279673 2 10 68 -1 -0.14564325365284 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.58333333333333 68 -1 -0.23929453819502 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.91666666666667 68 -1 0.44766263724589 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.58333333333333 68 -1 -0.20964388443131 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 8 68 -1 -0.0161068093509 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 6.91666666666667 68 -1 0.3662881917706 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 7.33333333333333 68 -1 0.01297682434512 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 6.91666666666667 68 -1 -0.04084415695347 -0.5 -0.5 2869 1
i 3 155.25238744884038 2 10 68 -1 0.10557966564427 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 10.33333333333333 68 -1 0.28910225914717 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 10 68 -1 0.22172788960874 -0.5 -0.5 367232 1
i 4 155.25238744884038 2 8.58333333333333 68 -1 0.0647631923117 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 8.58333333333333 68 -1 0.33336182049148 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 9.25 68 -1 0.41555331400257 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 9.75 68 -1 -0.18708450184599 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 10.33333333333333 68 -1 0.22162458640788 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 8.58333333333333 68 -1 0.05930116564179 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 9.25 68 -1 0.1198539888772 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 9.75 68 -1 -0.31527060443581 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 10.33333333333333 68 -1 0.41027326775369 -0.5 -0.5 367232 1
i 4 155.25238744884038 2 8.91666666666667 68 -1 0.14613242742599 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 6.91666666666667 68 -1 -0.08635799371062 -0.5 -0.5 2869 1
i 4 155.52523874488404 2 6.66666666666667 68 -1 0.27787717393871 -0.5 -0.5 2869 1
i 4 155.52523874488404 2 10 68 -1 0.01623639792255 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 10 68 -1 0.22215216890051 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 10.58333333333333 68 -1 0.27350786809244 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 11.25 68 -1 -0.06955255803268 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 11.75 68 -1 -0.44059089103127 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 8.91666666666667 68 -1 0.24756810717046 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 6.66666666666667 68 -1 -0.40592152093659 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 6.91666666666667 68 -1 -0.09419803539016 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 6.66666666666667 68 -1 -0.37609869899358 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 8.91666666666667 68 -1 -0.29429033991805 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 9.25 68 -1 -0.01203220624709 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 8.91666666666667 68 -1 0.42384112038221 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 6.66666666666667 68 -1 0.00122742518186 -0.5 -0.5 2869 1
i 3 156.07094133697134 2 10.33333333333333 68 -1 0.41972022086825 -0.5 -0.5 367232 1
i 3 156.07094133697134 2 10.58333333333333 68 -1 0.30777004463564 -0.5 -0.5 367232 1
i 3 156.07094133697134 2 10.33333333333333 68 -1 -0.11635847958695 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 8.91666666666667 68 -1 -0.11602120986688 -0.5 -0.5 367232 1
i 6 156.07094133697134 2 8.91666666666667 68 -1 0.20615467240046 -0.5 -0.5 367232 1
i 5 156.07094133697134 2 9.5 68 -1 0.1863215435278 -0.5 -0.5 367232 1
i 6 156.07094133697134 2 10 68 -1 -0.36821008147858 -0.5 -0.5 367232 1
i 6 156.07094133697134 2 10.58333333333333 68 -1 -0.22784045199487 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 9.25 68 -1 0.14985917404117 -0.5 -0.5 367232 1
i 4 156.343792633015 2 6.66666666666667 68 -1 -0.4162317419936 -0.5 -0.5 2869 1
i 3 156.343792633015 2 10.33333333333333 68 -1 -0.35739995508372 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.25 68 -1 -0.15508018237175 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.5 68 -1 -0.21314878551953 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.25 68 -1 0.09083253414048 -0.5 -0.5 367232 1
i 4 156.61664392905865 2 6.66666666666667 68 -1 0.26324997232678 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 6.91666666666667 68 -1 -0.20118389921345 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 6.66666666666667 68 -1 -0.35703354848117 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 9.25 68 -1 -0.21974203741778 -0.5 -0.5 367232 1
i 4 156.61664392905865 2 8.91666666666667 68 -1 -0.30842117267999 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 6.66666666666667 68 -1 -0.3388685360959 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 6.66666666666667 68 -1 -0.29408338243686 -0.5 -0.5 2869 1
i 5 156.8894952251023 2 7.33333333333333 68 -1 -0.2018568768991 -0.5 -0.5 2869 1
i 5 156.8894952251023 2 7.66666666666667 68 -1 -0.18573392477399 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 8.33333333333333 68 -1 0.13388730881313 -0.5 -0.5 2869 1
i 4 156.8894952251023 2 6.33333333333333 68 -1 0.23678376004595 -0.5 -0.5 2869 1
i 4 156.8894952251023 2 8.91666666666667 68 -1 -0.22299994070767 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 9.25 68 -1 0.25571189560656 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 8.91666666666667 68 -1 0.45201769745875 -0.5 -0.5 367232 1
i 4 157.16234652114596 2 6.33333333333333 68 -1 0.17007608248641 -0.5 -0.5 2869 1
i 4 157.16234652114596 2 8.91666666666667 68 -1 -0.26931079592186 -0.5 -0.5 367232 1
i 4 157.43519781718962 2 6.33333333333333 68 -1 -0.14055963354674 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 6.66666666666667 68 -1 -0.2208793026223 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 6.33333333333333 68 -1 0.15136687193499 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 8.91666666666667 68 -1 -0.49122986965023 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 6.33333333333333 68 -1 0.03034613122697 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 6.33333333333333 68 -1 0.1406669636736 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 6.91666666666667 68 -1 -0.09955974085496 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 7.41666666666667 68 -1 -0.45318194615062 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 8 68 -1 -0.14650617378773 -0.5 -0.5 2869 1
i 4 157.70804911323327 2 6.66666666666667 68 -1 0.46717251156236 -0.5 -0.5 2869 1
i 4 157.70804911323327 2 8.91666666666667 68 -1 0.03203727456781 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 9.25 68 -1 0.25557889410468 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 8.91666666666667 68 -1 0.14056890351618 -0.5 -0.5 367232 1
i 4 157.98090040927693 2 6.66666666666667 68 -1 0.14230233439909 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 6.91666666666667 68 -1 -0.46982142993677 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 6.66666666666667 68 -1 0.0112215556511 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 8.91666666666667 68 -1 -0.25283325271568 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 8.91666666666667 68 -1 -0.39477520406275 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 9.5 68 -1 -0.41865367950249 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 10 68 -1 0.09412833554963 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 10.58333333333333 68 -1 0.36158540238978 -0.5 -0.5 367232 1
i 4 157.98090040927693 2 8.58333333333333 68 -1 -0.43254646365018 -0.5 -0.5 367232 1
i 4 158.2537517053206 2 6.66666666666667 68 -1 -0.43443826913037 -0.5 -0.5 2869 1
i 4 158.2537517053206 2 6.33333333333333 68 -1 0.19707488803723 -0.5 -0.5 2869 1
i 4 158.2537517053206 2 8.58333333333333 68 -1 0.07624440473342 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 6.33333333333333 68 -1 -0.13759519670891 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 6.66666666666667 68 -1 -0.25568630837607 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 6.33333333333333 68 -1 -0.06794790004479 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 8.58333333333333 68 -1 -0.47073816359659 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 8.91666666666667 68 -1 0.17215245872152 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 8.58333333333333 68 -1 0.09959279098233 -0.5 -0.5 367232 1
i 4 158.79945429740792 2 6.33333333333333 68 -1 -0.31007367623885 -0.5 -0.5 2869 1
i 4 158.79945429740792 2 8.58333333333333 68 -1 -0.24539652007507 -0.5 -0.5 367232 1
i 6 158.79945429740792 2 8.58333333333333 68 -1 0.11814619151084 -0.5 -0.5 367232 1
i 6 158.79945429740792 2 9.25 68 -1 0.01693217361502 -0.5 -0.5 367232 1
i 6 158.79945429740792 2 9.75 68 -1 0.24248506046295 -0.5 -0.5 367232 1
i 5 158.79945429740792 2 10.33333333333333 68 -1 0.00044673781208 -0.5 -0.5 367232 1
i 4 158.79945429740792 2 8.91666666666667 68 -1 0.16440977777447 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 6.33333333333333 68 -1 -0.34387641013267 -0.5 -0.5 2869 1
i 4 159.07230559345157 2 8.91666666666667 68 -1 0.35743450710673 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 9.25 68 -1 0.3890312631344 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 8.91666666666667 68 -1 0.18341177320171 -0.5 -0.5 367232 1
i 4 159.34515688949523 2 6.33333333333333 68 -1 0.17229209483239 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 6.66666666666667 68 -1 0.4069004396022 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 6.33333333333333 68 -1 0.09511445481868 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 8.91666666666667 68 -1 0.29298039230037 -0.5 -0.5 367232 1
i 4 159.34515688949523 2 8.58333333333333 68 -1 -0.27347146409447 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 6.33333333333333 68 -1 0.32547144592983 -0.5 -0.5 2869 1
i 5 159.61800818553888 2 6.33333333333333 68 -1 0.42342134341788 -0.5 -0.5 2869 1
i 6 159.61800818553888 2 6.91666666666667 68 -1 -0.45878839834215 -0.5 -0.5 2869 1
i 5 159.61800818553888 2 7.41666666666667 68 -1 -0.05250671116254 -0.5 -0.5 2869 1
i 5 159.61800818553888 2 8 68 -1 -0.00030054807245 -0.5 -0.5 2869 1
i 4 159.61800818553888 2 8.58333333333333 68 -1 0.46766006005816 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 8.91666666666667 68 -1 0.2973706055199 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 8.58333333333333 68 -1 -0.31111525774915 -0.5 -0.5 367232 1
i 4 159.89085948158254 2 6.33333333333333 68 -1 -0.32471469640825 -0.5 -0.5 2869 1
i 4 159.89085948158254 2 8.58333333333333 68 -1 0.39537516339913 -0.5 -0.5 367232 1
i 4 160.1637107776262 2 6.33333333333333 68 -1 0.33552284510583 -0.5 -0.5 2869 1
i 4 160.1637107776262 2 8.58333333333333 68 -1 -0.28779544862259 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 6.33333333333333 68 -1 -0.43227699715479 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 6.66666666666667 68 -1 0.08041797374466 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 6.33333333333333 68 -1 0.15317981826976 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 8.58333333333333 68 -1 -0.29675577209094 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 8.91666666666667 68 -1 0.20579859152661 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 8.58333333333333 68 -1 -0.45098525740442 -0.5 -0.5 367232 1
i 4 160.7094133697135 2 6.33333333333333 68 -1 0.03762561938073 -0.5 -0.5 2869 1
i 6 160.7094133697135 2 6.33333333333333 68 -1 0.48494406539614 -0.5 -0.5 2869 1
i 6 160.7094133697135 2 6.91666666666667 68 -1 -0.40284481781443 -0.5 -0.5 2869 1
i 5 160.7094133697135 2 7.41666666666667 68 -1 -0.04542305986394 -0.5 -0.5 2869 1
i 5 160.7094133697135 2 8 68 -1 -0.08152120834072 -0.5 -0.5 2869 1
i 4 160.7094133697135 2 6.66666666666667 68 -1 0.45089715292567 -0.5 -0.5 2869 1
i 4 160.7094133697135 2 8.58333333333333 68 -1 0.16274202102709 -0.5 -0.5 367232 1
i 6 160.7094133697135 2 8.58333333333333 68 -1 0.01367325794161 -0.5 -0.5 367232 1
i 6 160.7094133697135 2 9.25 68 -1 -0.33104546239179 -0.5 -0.5 367232 1
i 6 160.7094133697135 2 9.75 68 -1 0.33594111453622 -0.5 -0.5 367232 1
i 5 160.7094133697135 2 10.33333333333333 68 -1 0.08977020423555 -0.5 -0.5 367232 1
i 4 160.98226466575716 2 6.66666666666667 68 -1 -0.30950901851982 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 6.91666666666667 68 -1 -0.41078946246083 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 6.66666666666667 68 -1 -0.29798877972794 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 8.58333333333333 68 -1 0.3053362599029 -0.5 -0.5 367232 1
i 4 161.2551159618008 2 6.66666666666667 68 -1 0.41605523698086 -0.5 -0.5 2869 1
i 4 161.2551159618008 2 6.33333333333333 68 -1 -0.21723698012534 -0.5 -0.5 2869 1
i 4 161.2551159618008 2 8.58333333333333 68 -1 0.37604632185782 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 6.33333333333333 68 -1 0.12164598303618 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 6.66666666666667 68 -1 -0.29385411404742 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 6.33333333333333 68 -1 -0.26032481083153 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 8.58333333333333 68 -1 0.27389727345238 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 8.91666666666667 68 -1 0.20497379665381 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 8.58333333333333 68 -1 0.02539257416876 -0.5 -0.5 367232 1
i 4 161.80081855388812 2 6.33333333333333 68 -1 -0.41610536507046 -0.5 -0.5 2869 1
i 4 161.80081855388812 2 8.58333333333333 68 -1 -0.03159780174487 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 8.58333333333333 68 -1 -0.29280256058267 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 9.25 68 -1 0.40803198931375 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 9.75 68 -1 0.11534087831547 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 10.33333333333333 68 -1 0.13471759236735 -0.5 -0.5 367232 1
i 4 161.80081855388812 2 8.91666666666667 68 -1 -0.46125980306707 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 6.33333333333333 68 -1 -0.44825790740371 -0.5 -0.5 2869 1
i 4 162.07366984993178 2 8.91666666666667 68 -1 0.44061855594584 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 9.25 68 -1 -0.47396890000146 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 8.91666666666667 68 -1 0.41906221656907 -0.5 -0.5 367232 1
i 4 162.34652114597546 2 6.33333333333333 68 -1 -0.36621611256232 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 6.66666666666667 68 -1 0.25117966364446 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 6.33333333333333 68 -1 -0.0813372025823 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 8.91666666666667 68 -1 0.27045663348494 -0.5 -0.5 367232 1
i 4 162.34652114597546 2 8.58333333333333 68 -1 -0.12771309299669 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 6.33333333333333 68 -1 -0.43995693619715 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 6.33333333333333 68 -1 0.16454812665777 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 6.91666666666667 68 -1 -0.38319753146099 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 7.41666666666667 68 -1 -0.22872092418071 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 8 68 -1 0.24779719160961 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 6.33333333333333 68 -1 0.34056772720017 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 6.91666666666667 68 -1 -0.30474970359598 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 7.41666666666667 68 -1 0.32209122187396 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 8 68 -1 -0.07363756335724 -0.5 -0.5 2869 1
i 4 162.6193724420191 2 6 68 -1 0.46084036748708 -0.5 -0.5 2869 1
i 4 162.6193724420191 2 8.58333333333333 68 -1 0.28530449951767 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 8.91666666666667 68 -1 0.07523897823252 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 8.58333333333333 68 -1 0.17297698907864 -0.5 -0.5 367232 1
i 4 162.89222373806277 2 6 68 -1 -0.4065179251866 -0.5 -0.5 2869 1
i 4 162.89222373806277 2 8.58333333333333 68 -1 -0.30587845153543 -0.5 -0.5 367232 1
i 4 163.16507503410642 2 6 68 -1 0.17625951359167 -0.5 -0.5 2869 1
i 4 163.16507503410642 2 8.58333333333333 68 -1 0.3060551516994 -0.5 -0.5 367232 1
i 3 163.43792633015008 2 8 68 -1 0.34107461591318 -0.5 -0.5 2869 1
i 3 163.43792633015008 2 8.33333333333333 68 -1 -0.12021336345877 -0.5 -0.5 2869 1
i 3 163.43792633015008 2 8 68 -1 0.38338477345828 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6 68 -1 -0.38553127766812 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6.33333333333333 68 -1 -0.1539239659974 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6 68 -1 -0.37175273008719 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 8.58333333333333 68 -1 -0.3641548017236 -0.5 -0.5 367232 1
i 4 163.43792633015008 2 8.91666666666667 68 -1 -0.0001040976392 -0.5 -0.5 367232 1
i 4 163.43792633015008 2 8.58333333333333 68 -1 -0.15029121992568 -0.5 -0.5 367232 1
i 3 163.71077762619373 2 8 68 -1 0.25509452708658 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 6 68 -1 -0.33517438800719 -0.5 -0.5 2869 1
i 6 163.71077762619373 2 6 68 -1 0.18279325186691 -0.5 -0.5 2869 1
i 6 163.71077762619373 2 6.66666666666667 68 -1 0.21674436766302 -0.5 -0.5 2869 1
i 5 163.71077762619373 2 7.16666666666667 68 -1 0.00632595801933 -0.5 -0.5 2869 1
i 5 163.71077762619373 2 7.66666666666667 68 -1 0.34464332291611 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 6.33333333333333 68 -1 -0.1116909799334 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 8.58333333333333 68 -1 -0.47275375105065 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 8.58333333333333 68 -1 0.17277848117062 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 9.25 68 -1 0.23288820235383 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 9.75 68 -1 0.46786227899844 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 10.33333333333333 68 -1 -0.22042315849961 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 8.58333333333333 68 -1 0.1713287978417 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 9.25 68 -1 -0.26814289721093 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 9.75 68 -1 -0.3559649237178 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 10.33333333333333 68 -1 0.20596957096074 -0.5 -0.5 367232 1
i 4 163.71077762619373 2 8.33333333333333 68 -1 0.18257130795804 -0.5 -0.5 367232 1
i 4 163.9836289222374 2 6.33333333333333 68 -1 0.03288368449247 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 6.66666666666667 68 -1 -0.47836032780885 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 6.33333333333333 68 -1 0.33677247111211 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 8.33333333333333 68 -1 0.31908344377975 -0.5 -0.5 367232 1
i 4 164.25648021828104 2 6.33333333333333 68 -1 -0.47347365551631 -0.5 -0.5 2869 1
i 4 164.25648021828104 2 6 68 -1 0.39154139482853 -0.5 -0.5 2869 1
i 4 164.25648021828104 2 8.33333333333333 68 -1 -0.46791564103424 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 6 68 -1 -0.06967489753934 -0.5 -0.5 2869 1
i 4 164.5293315143247 2 6.33333333333333 68 -1 -0.30001725425005 -0.5 -0.5 2869 1
i 4 164.5293315143247 2 6 68 -1 0.02205037009221 -0.5 -0.5 2869 1
i 3 164.5293315143247 2 10.33333333333333 68 -1 0.11606665830063 -0.5 -0.5 367232 1
i 3 164.5293315143247 2 10.58333333333333 68 -1 0.251222091022 -0.5 -0.5 367232 1
i 3 164.5293315143247 2 10.33333333333333 68 -1 0.07644859214303 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.33333333333333 68 -1 0.4075755861444 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.58333333333333 68 -1 0.21589325046241 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.33333333333333 68 -1 0.31087289195003 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 6 68 -1 0.23222258952475 -0.5 -0.5 2869 1
i 3 164.80218281036835 2 10.33333333333333 68 -1 -0.00771277983379 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 8.33333333333333 68 -1 0.25396457017439 -0.5 -0.5 367232 1
i 6 164.80218281036835 2 8.33333333333333 68 -1 -0.38094196880972 -0.5 -0.5 367232 1
i 5 164.80218281036835 2 8.91666666666667 68 -1 -0.23019247910822 -0.5 -0.5 367232 1
i 6 164.80218281036835 2 9.5 68 -1 -0.29321961284113 -0.5 -0.5 367232 1
i 5 164.80218281036835 2 10 68 -1 -0.09552252320188 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 8.58333333333333 68 -1 -0.44210247638529 -0.5 -0.5 367232 1
i 4 165.075034106412 2 6 68 -1 0.23230994658644 -0.5 -0.5 2869 1
i 4 165.075034106412 2 8.58333333333333 68 -1 -0.07805974840256 -0.5 -0.5 367232 1
i 4 165.075034106412 2 8.91666666666667 68 -1 0.20788105515094 -0.5 -0.5 367232 1
i 4 165.075034106412 2 8.58333333333333 68 -1 -0.47785800943372 -0.5 -0.5 367232 1
i 4 165.34788540245566 2 6 68 -1 -0.07879039151943 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 6.33333333333333 68 -1 -0.35576693114612 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 6 68 -1 0.4847878545447 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 8.58333333333333 68 -1 -0.26374037099506 -0.5 -0.5 367232 1
i 4 165.34788540245566 2 8.33333333333333 68 -1 -0.34599199262789 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 6 68 -1 -0.24645588135443 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 6 68 -1 -0.24196381554199 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 6.66666666666667 68 -1 0.0543597372332 -0.5 -0.5 2869 1
i 5 165.62073669849931 2 7.16666666666667 68 -1 -0.32793389053115 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.66666666666667 68 -1 0.11330356429733 -0.5 -0.5 2869 1
i 5 165.62073669849931 2 6 68 -1 -0.14894717310972 -0.5 -0.5 2869 1
i 5 165.62073669849931 2 6.66666666666667 68 -1 0.33309616744956 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.16666666666667 68 -1 0.06155683298493 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.66666666666667 68 -1 0.06226680523332 -0.5 -0.5 2869 1
i 4 165.62073669849931 2 6.33333333333333 68 -1 0.40747838889629 -0.5 -0.5 2869 1
i 4 165.62073669849931 2 8.33333333333333 68 -1 -0.49355485136492 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 8.58333333333333 68 -1 0.07524744350978 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 8.33333333333333 68 -1 -0.27666391995372 -0.5 -0.5 367232 1
i 4 165.89358799454297 2 6.33333333333333 68 -1 -0.17080937819324 -0.5 -0.5 2869 1
i 4 165.89358799454297 2 8.33333333333333 68 -1 0.04834637654288 -0.5 -0.5 367232 1
i 4 166.16643929058662 2 6.33333333333333 68 -1 0.49297658376912 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 6.66666666666667 68 -1 -0.47074341829311 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 6.33333333333333 68 -1 -0.019325853842 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 8.33333333333333 68 -1 -0.46499354139526 -0.5 -0.5 367232 1
i 3 166.4392905866303 2 7.66666666666667 68 -1 0.43568334020557 -0.5 -0.5 2869 1
i 3 166.4392905866303 2 8 68 -1 0.01694757521821 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 7.66666666666667 68 -1 0.47545700437152 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 6.33333333333333 68 -1 0.0822013242606 -0.5 -0.5 2869 1
i 5 166.4392905866303 2 6.33333333333333 68 -1 -0.31128521264631 -0.5 -0.5 2869 1
i 6 166.4392905866303 2 6.91666666666667 68 -1 0.29642681162515 -0.5 -0.5 2869 1
i 6 166.4392905866303 2 7.41666666666667 68 -1 0.44632407644686 -0.5 -0.5 2869 1
i 5 166.4392905866303 2 8 68 -1 -0.38166144725585 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 6.66666666666667 68 -1 0.39467822326153 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 8.33333333333333 68 -1 -0.36055739262907 -0.5 -0.5 367232 1
i 4 166.4392905866303 2 8.58333333333333 68 -1 0.36854949202237 -0.5 -0.5 367232 1
i 4 166.4392905866303 2 8.33333333333333 68 -1 0.12076299931447 -0.5 -0.5 367232 1
i 3 166.71214188267396 2 7.66666666666667 68 -1 0.38328400349682 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.66666666666667 68 -1 -0.39086600719748 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.91666666666667 68 -1 0.33222793817183 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.66666666666667 68 -1 0.37678058603615 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 8.33333333333333 68 -1 -0.09842610312679 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 8.33333333333333 68 -1 0.07230489868245 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 8.91666666666667 68 -1 -0.22181327919901 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 9.5 68 -1 0.16180984523376 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 10 68 -1 -0.21412688731288 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 8.33333333333333 68 -1 0.13479427391298 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 8.91666666666667 68 -1 0.43889930827057 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 9.5 68 -1 -0.33668505507681 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 10 68 -1 -0.35631207740569 -0.5 -0.5 367232 1
i 4 166.71214188267396 2 8.58333333333333 68 -1 -0.4518238015085 -0.5 -0.5 367232 1
i 4 166.98499317871762 2 6.66666666666667 68 -1 -0.38650172084067 -0.5 -0.5 2869 1
i 4 166.98499317871762 2 6.33333333333333 68 -1 0.15472018733625 -0.5 -0.5 2869 1
i 4 166.98499317871762 2 8.58333333333333 68 -1 -0.44482278358666 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 6.33333333333333 68 -1 0.40158501884494 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 6.66666666666667 68 -1 0.27821606057574 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 6.33333333333333 68 -1 0.08658275769099 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 8.58333333333333 68 -1 -0.28319207812407 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 8.91666666666667 68 -1 0.12621618282431 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 8.58333333333333 68 -1 0.27199815196612 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 6.33333333333333 68 -1 0.01345902319908 -0.5 -0.5 2869 1
i 3 167.53069577080493 2 10 68 -1 0.32224246227058 -0.5 -0.5 367232 1
i 3 167.53069577080493 2 10.33333333333333 68 -1 0.06448259011026 -0.5 -0.5 367232 1
i 3 167.53069577080493 2 10 68 -1 -0.06665597850432 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 8.58333333333333 68 -1 -0.18870710355148 -0.5 -0.5 367232 1
i 5 167.53069577080493 2 8.58333333333333 68 -1 0.45472648145513 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 9.25 68 -1 -0.29497800728899 -0.5 -0.5 367232 1
i 5 167.53069577080493 2 9.75 68 -1 0.23202026837193 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 10.33333333333333 68 -1 0.2448755093683 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 8.91666666666667 68 -1 0.40990933833833 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 6.33333333333333 68 -1 -0.32208884887692 -0.5 -0.5 2869 1
i 4 167.80354706684858 2 10 68 -1 0.44465775953652 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 8.91666666666667 68 -1 0.15441872669364 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 9.25 68 -1 -0.29267003741752 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 8.91666666666667 68 -1 0.18034608848078 -0.5 -0.5 367232 1
i 4 168.07639836289223 2 6.33333333333333 68 -1 0.14986728880214 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 6.66666666666667 68 -1 -0.28362514523906 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 6.33333333333333 68 -1 -0.12432446897767 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 8.91666666666667 68 -1 0.04025510878641 -0.5 -0.5 367232 1
i 4 168.07639836289223 2 8.58333333333333 68 -1 0.45223152134567 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 6.33333333333333 68 -1 0.46027379694782 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 6.33333333333333 68 -1 -0.09724739166572 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 6.91666666666667 68 -1 -0.4647320014 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 7.41666666666667 68 -1 0.29315409593065 -0.5 -0.5 2869 1
i 5 168.3492496589359 2 8 68 -1 0.48095996500049 -0.5 -0.5 2869 1
i 4 168.3492496589359 2 6 68 -1 0.47255267799232 -0.5 -0.5 2869 1
i 4 168.3492496589359 2 8.58333333333333 68 -1 0.44113511415857 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 8.91666666666667 68 -1 -0.3062208576475 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 8.58333333333333 68 -1 0.25525958388363 -0.5 -0.5 367232 1
i 4 168.62210095497954 2 6 68 -1 -0.22741111034143 -0.5 -0.5 2869 1
i 4 168.62210095497954 2 8.58333333333333 68 -1 0.14178144956165 -0.5 -0.5 367232 1
i 4 168.8949522510232 2 6 68 -1 -0.22295935889965 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 6.33333333333333 68 -1 0.24299555714628 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 6 68 -1 -0.44254161293311 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 8.58333333333333 68 -1 -0.49412991466504 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 6 68 -1 0.19235401195258 -0.5 -0.5 2869 1
i 5 169.16780354706685 2 6 68 -1 -0.34198563182645 -0.5 -0.5 2869 1
i 5 169.16780354706685 2 6.66666666666667 68 -1 -0.10015527762418 -0.5 -0.5 2869 1
i 6 169.16780354706685 2 7.16666666666667 68 -1 0.29000923930449 -0.5 -0.5 2869 1
i 5 169.16780354706685 2 7.66666666666667 68 -1 0.31452108175273 -0.5 -0.5 2869 1
i 4 169.16780354706685 2 6.33333333333333 68 -1 -0.30439187842688 -0.5 -0.5 2869 1
i 4 169.16780354706685 2 8.58333333333333 68 -1 0.46892201374158 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 8.91666666666667 68 -1 -0.12633074599485 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 8.58333333333333 68 -1 -0.43976197553166 -0.5 -0.5 367232 1
i 4 169.4406548431105 2 6.33333333333333 68 -1 -0.31121188923615 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 6.66666666666667 68 -1 -0.37394505973967 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 6.33333333333333 68 -1 -0.13225316323172 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 8.58333333333333 68 -1 -0.31908629115535 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 8.58333333333333 68 -1 -0.28027407764767 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 9.25 68 -1 -0.10051064114226 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 9.75 68 -1 0.42026651317256 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 10.33333333333333 68 -1 0.01850453384224 -0.5 -0.5 367232 1
i 4 169.4406548431105 2 8.33333333333333 68 -1 -0.34564642165634 -0.5 -0.5 367232 1
i 4 169.71350613915416 2 6.33333333333333 68 -1 -0.44200928189493 -0.5 -0.5 2869 1
i 4 169.71350613915416 2 6 68 -1 0.22402501522868 -0.5 -0.5 2869 1
i 4 169.71350613915416 2 8.33333333333333 68 -1 0.00067028870273 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 6 68 -1 0.28904684840044 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 6.33333333333333 68 -1 -0.25936290850138 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 6 68 -1 -0.34358077429272 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 8.33333333333333 68 -1 0.23262479588762 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 8.58333333333333 68 -1 -0.06293281258085 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 8.33333333333333 68 -1 -0.38607892130067 -0.5 -0.5 367232 1
i 4 170.25920873124147 2 6 68 -1 0.33616259218676 -0.5 -0.5 2869 1
i 4 170.25920873124147 2 8.33333333333333 68 -1 0.07339814731555 -0.5 -0.5 367232 1
i 5 170.25920873124147 2 8.33333333333333 68 -1 0.18263548623337 -0.5 -0.5 367232 1
i 5 170.25920873124147 2 8.91666666666667 68 -1 -0.2309805829959 -0.5 -0.5 367232 1
i 6 170.25920873124147 2 9.5 68 -1 0.41686497320997 -0.5 -0.5 367232 1
i 6 170.25920873124147 2 10 68 -1 0.28406657427162 -0.5 -0.5 367232 1
i 4 170.25920873124147 2 8.58333333333333 68 -1 -0.31166999418186 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 6 68 -1 0.4516535457239 -0.5 -0.5 2869 1
i 4 170.53206002728513 2 8.58333333333333 68 -1 -0.27070577717531 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 8.91666666666667 68 -1 -0.02324382488886 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 8.58333333333333 68 -1 0.2616668467253 -0.5 -0.5 367232 1
i 4 170.80491132332878 2 6 68 -1 -0.18375788540863 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 6.33333333333333 68 -1 -0.3215862830567 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 6 68 -1 -0.46208032878358 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 8.58333333333333 68 -1 0.13084829685173 -0.5 -0.5 367232 1
i 4 170.80491132332878 2 8.33333333333333 68 -1 -0.46032568890894 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 6 68 -1 -0.33695201196874 -0.5 -0.5 2869 1
i 6 171.07776261937244 2 6 68 -1 0.15664985935717 -0.5 -0.5 2869 1
i 5 171.07776261937244 2 6.66666666666667 68 -1 0.29825773104659 -0.5 -0.5 2869 1
i 5 171.07776261937244 2 7.16666666666667 68 -1 -0.03900817589137 -0.5 -0.5 2869 1
i 6 171.07776261937244 2 7.66666666666667 68 -1 -0.43053539337064 -0.5 -0.5 2869 1
i 4 171.07776261937244 2 8.33333333333333 68 -1 0.26674970886882 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 8.58333333333333 68 -1 -0.41358647714249 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 8.33333333333333 68 -1 -0.11170110399256 -0.5 -0.5 367232 1
i 4 171.3506139154161 2 6 68 -1 0.23781666239526 -0.5 -0.5 2869 1
i 4 171.3506139154161 2 8.33333333333333 68 -1 -0.0451122376508 -0.5 -0.5 367232 1
i 4 171.62346521145975 2 6 68 -1 -0.25496475053438 -0.5 -0.5 2869 1
i 4 171.62346521145975 2 8.33333333333333 68 -1 -0.21461664842261 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 6 68 -1 -0.13280524475935 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 6.33333333333333 68 -1 -0.23192696003995 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 6 68 -1 0.16811512139428 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 8.33333333333333 68 -1 -0.40971859218925 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 8.58333333333333 68 -1 0.33297211206258 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 8.33333333333333 68 -1 -0.44625531800479 -0.5 -0.5 367232 1
i 4 172.16916780354705 2 6 68 -1 0.01957261596029 -0.5 -0.5 2869 1
i 6 172.16916780354705 2 6 68 -1 -0.37546044481329 -0.5 -0.5 2869 1
i 5 172.16916780354705 2 6.66666666666667 68 -1 0.05675882565963 -0.5 -0.5 2869 1
i 6 172.16916780354705 2 7.16666666666667 68 -1 -0.36011214900765 -0.5 -0.5 2869 1
i 6 172.16916780354705 2 7.66666666666667 68 -1 -0.19154821027536 -0.5 -0.5 2869 1
i 4 172.16916780354705 2 6.33333333333333 68 -1 0.27429523360894 -0.5 -0.5 2869 1
i 4 172.16916780354705 2 8.33333333333333 68 -1 0.19400951181385 -0.5 -0.5 367232 1
i 6 172.16916780354705 2 8.33333333333333 68 -1 0.20941198302104 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 8.91666666666667 68 -1 0.04824753578226 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 9.5 68 -1 0.38150580454819 -0.5 -0.5 367232 1
i 6 172.16916780354705 2 10 68 -1 -0.13428061784671 -0.5 -0.5 367232 1
i 4 172.4420190995907 2 6.33333333333333 68 -1 -0.39539312762361 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 6.66666666666667 68 -1 0.01895283447086 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 6.33333333333333 68 -1 -0.35716559715985 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 8.33333333333333 68 -1 -0.21795094538685 -0.5 -0.5 367232 1
i 4 172.71487039563436 2 6.33333333333333 68 -1 -0.46071751130693 -0.5 -0.5 2869 1
i 4 172.71487039563436 2 6 68 -1 0.43179573654735 -0.5 -0.5 2869 1
i 4 172.71487039563436 2 8.33333333333333 68 -1 -0.38692128558071 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 6 68 -1 -0.46229223844772 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 6.33333333333333 68 -1 0.20008625707701 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 6 68 -1 -0.33734750664298 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 8.33333333333333 68 -1 0.04832616172607 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 8.58333333333333 68 -1 0.23556620757789 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 8.33333333333333 68 -1 -0.16575145003546 -0.5 -0.5 367232 1
i 4 173.26057298772167 2 6 68 -1 -0.17512970126317 -0.5 -0.5 2869 1
i 4 173.26057298772167 2 8.33333333333333 68 -1 0.48407277033652 -0.5 -0.5 367232 1
i 5 173.26057298772167 2 8.33333333333333 68 -1 -0.0343831052595 -0.5 -0.5 367232 1
i 6 173.26057298772167 2 8.91666666666667 68 -1 -0.21101788128888 -0.5 -0.5 367232 1
i 5 173.26057298772167 2 9.5 68 -1 0.45882382141329 -0.5 -0.5 367232 1
i 6 173.26057298772167 2 10 68 -1 -0.38002579272987 -0.5 -0.5 367232 1
i 4 173.26057298772167 2 8.58333333333333 68 -1 -0.08584577064243 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 6 68 -1 0.03874039495719 -0.5 -0.5 2869 1
i 4 173.53342428376533 2 8.58333333333333 68 -1 0.37371716445682 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 8.91666666666667 68 -1 0.15235602713342 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 8.58333333333333 68 -1 -0.46063711494425 -0.5 -0.5 367232 1
i 4 173.80627557980898 2 6 68 -1 0.04992835665383 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 6.33333333333333 68 -1 0.46094360084897 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 6 68 -1 0.0554878110464 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 8.58333333333333 68 -1 -0.21117597059307 -0.5 -0.5 367232 1
i 4 173.80627557980898 2 8.33333333333333 68 -1 0.36723240463802 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 6 68 -1 -0.05298648613885 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 6 68 -1 -0.25938495846199 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 6.66666666666667 68 -1 -0.37303075181352 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.16666666666667 68 -1 -0.33588990778985 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 7.66666666666667 68 -1 -0.4218508911572 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 6 68 -1 0.13097310395326 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 6.66666666666667 68 -1 0.49939384081801 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.16666666666667 68 -1 -0.21608893089299 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.66666666666667 68 -1 0.32771444288777 -0.5 -0.5 2869 1
i 4 174.07912687585264 2 8.33333333333333 68 -1 0.28273923925768 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 8.58333333333333 68 -1 -0.00849215166512 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 8.33333333333333 68 -1 -0.20146160631977 -0.5 -0.5 367232 1
i 4 174.3519781718963 2 6 68 -1 0.28640058055452 -0.5 -0.5 2869 1
i 4 174.3519781718963 2 8.33333333333333 68 -1 0.26758698153518 -0.5 -0.5 367232 1
i 4 174.62482946793995 2 6 68 -1 -0.09793604772259 -0.5 -0.5 2869 1
i 4 174.62482946793995 2 8.33333333333333 68 -1 -0.23019995599409 -0.5 -0.5 367232 1
i 3 174.89768076398363 2 7.66666666666667 68 -1 0.04843108661391 -0.5 -0.5 2869 1
i 4 174.89768076398363 2 8 68 -1 0.3591541699942 -0.5 -0.5 2869 1
i 3 174.89768076398363 2 7.66666666666667 68 -1 -0.15880104531233 -0.5 -0.5 2869 1
i 4 174.89768076398363 2 6 68 -1 -0.02448186321881 -0.5 -0.5 2869 1
i 4 174.89768076398363 2 8.33333333333333 68 -1 -0.02829553457229 -0.5 -0.5 367232 1
i 4 174.89768076398363 2 8.58333333333333 68 -1 0.12104856439908 -0.5 -0.5 367232 1
i 4 174.89768076398363 2 8.33333333333333 68 -1 -0.48032447392655 -0.5 -0.5 367232 1
i 4 175.17053206002728 2 7.66666666666667 68 -1 0.45924745054767 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6 68 -1 0.17941198030832 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6.33333333333333 68 -1 -0.12345719799804 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6 68 -1 -0.33073091077608 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 8.33333333333333 68 -1 0.42574087951804 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.33333333333333 68 -1 0.25293428143442 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.91666666666667 68 -1 -0.41082753148388 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 9.5 68 -1 0.43135535881895 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 10 68 -1 -0.32185659561815 -0.5 -0.5 367232 1
i 5 175.17053206002728 2 8.33333333333333 68 -1 -0.2877405471473 -0.5 -0.5 367232 1
i 5 175.17053206002728 2 8.91666666666667 68 -1 0.13485860741145 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 9.5 68 -1 -0.00623176264366 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 10 68 -1 -0.25951623970555 -0.5 -0.5 367232 1
i 4 175.44338335607094 2 6 68 -1 -0.25400052173447 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 6 68 -1 -0.35684154814573 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 6.66666666666667 68 -1 -0.06689131976318 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 7.16666666666667 68 -1 0.14776063598702 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 7.66666666666667 68 -1 -0.44491643109541 -0.5 -0.5 2869 1
i 4 175.44338335607094 2 6.33333333333333 68 -1 0.18306579026012 -0.5 -0.5 2869 1
i 4 175.44338335607094 2 8.33333333333333 68 -1 -0.46294484471931 -0.5 -0.5 367232 1
i 4 175.7162346521146 2 6.33333333333333 68 -1 -0.15506247504321 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 6.66666666666667 68 -1 0.42869443844662 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 6.33333333333333 68 -1 -0.25100741967301 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 8.33333333333333 68 -1 0.49013007004501 -0.5 -0.5 367232 1
i 4 175.98908594815825 2 6.33333333333333 68 -1 -0.43542987076868 -0.5 -0.5 2869 1
i 4 175.98908594815825 2 6 68 -1 0.08953421335444 -0.5 -0.5 2869 1
i 4 175.98908594815825 2 10 68 -1 -0.21282323107896 -0.5 -0.5 367232 1
i 3 175.98908594815825 2 10.33333333333333 68 -1 0.05309200746122 -0.5 -0.5 367232 1
i 3 175.98908594815825 2 10 68 -1 -0.10037531435736 -0.5 -0.5 367232 1
i 4 175.98908594815825 2 8.33333333333333 68 -1 -0.47436727512392 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 6 68 -1 -0.21670803037921 -0.5 -0.5 2869 1
i 4 176.2619372442019 2 6.33333333333333 68 -1 0.39690257838183 -0.5 -0.5 2869 1
i 4 176.2619372442019 2 6 68 -1 0.33616729446067 -0.5 -0.5 2869 1
i 3 176.2619372442019 2 10 68 -1 -0.34402041607284 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.33333333333333 68 -1 -0.16049850561871 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.58333333333333 68 -1 -0.140802641672 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.33333333333333 68 -1 -0.39337599096202 -0.5 -0.5 367232 1
i 4 176.53478854024556 2 6 68 -1 -0.40868874868821 -0.5 -0.5 2869 1
i 4 176.53478854024556 2 8.33333333333333 68 -1 -0.23759232194949 -0.5 -0.5 367232 1
i 6 176.53478854024556 2 8.33333333333333 68 -1 0.31075850052652 -0.5 -0.5 367232 1
i 5 176.53478854024556 2 8.91666666666667 68 -1 -0.18700278145687 -0.5 -0.5 367232 1
i 6 176.53478854024556 2 9.5 68 -1 -0.08479663055319 -0.5 -0.5 367232 1
i 5 176.53478854024556 2 10 68 -1 -0.45548508195066 -0.5 -0.5 367232 1
i 4 176.53478854024556 2 8.58333333333333 68 -1 0.20981844642614 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 6 68 -1 0.0670145134691 -0.5 -0.5 2869 1
i 4 176.8076398362892 2 8.58333333333333 68 -1 -0.23041674882467 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 8.91666666666667 68 -1 -0.29837375338646 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 8.58333333333333 68 -1 -0.29017728275759 -0.5 -0.5 367232 1
i 4 177.08049113233287 2 6 68 -1 0.45764482176989 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 6.33333333333333 68 -1 0.2769977325053 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 6 68 -1 -0.49444803682738 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 8.58333333333333 68 -1 0.08662673791142 -0.5 -0.5 367232 1
i 4 177.08049113233287 2 8.33333333333333 68 -1 0.20408816478162 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 6 68 -1 0.45280212761307 -0.5 -0.5 2869 1
i 5 177.35334242837652 2 6 68 -1 0.22002357027237 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 6.66666666666667 68 -1 -0.00528501808132 -0.5 -0.5 2869 1
i 5 177.35334242837652 2 7.16666666666667 68 -1 -0.01938782977579 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.66666666666667 68 -1 -0.06641201670625 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 6 68 -1 0.21376111628269 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 6.66666666666667 68 -1 -0.34052048674345 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.16666666666667 68 -1 0.11212665103138 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.66666666666667 68 -1 -0.44038926956477 -0.5 -0.5 2869 1
i 4 177.35334242837652 2 6.33333333333333 68 -1 -0.43102023036173 -0.5 -0.5 2869 1
i 4 177.35334242837652 2 8.33333333333333 68 -1 -0.13488415564891 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 8.58333333333333 68 -1 -0.03461344173215 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 8.33333333333333 68 -1 0.11863267145925 -0.5 -0.5 367232 1
i 4 177.62619372442018 2 6.33333333333333 68 -1 -0.27205630401357 -0.5 -0.5 2869 1
i 4 177.62619372442018 2 8.33333333333333 68 -1 -0.43333197231283 -0.5 -0.5 367232 1
i 4 177.89904502046383 2 6.33333333333333 68 -1 -0.31333573451486 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 6.66666666666667 68 -1 0.01623021443386 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 6.33333333333333 68 -1 0.45858436009704 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 8.33333333333333 68 -1 -0.09517859573807 -0.5 -0.5 367232 1
i 3 178.17189631650749 2 7.66666666666667 68 -1 -0.33236608558067 -0.5 -0.5 2869 1
i 3 178.17189631650749 2 8 68 -1 -0.20628677736606 -0.5 -0.5 2869 1
i 3 178.17189631650749 2 7.66666666666667 68 -1 -0.33227185586875 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 6.33333333333333 68 -1 0.19398680799385 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 6.33333333333333 68 -1 0.42979467335013 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 6.91666666666667 68 -1 -0.47105156627102 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 7.41666666666667 68 -1 -0.23350684509106 -0.5 -0.5 2869 1
i 6 178.17189631650749 2 8 68 -1 -0.29339006574198 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 6.66666666666667 68 -1 0.3092617763279 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 8.33333333333333 68 -1 -0.35383667164559 -0.5 -0.5 367232 1
i 4 178.17189631650749 2 8.58333333333333 68 -1 -0.18320397335448 -0.5 -0.5 367232 1
i 4 178.17189631650749 2 8.33333333333333 68 -1 0.43633851589056 -0.5 -0.5 367232 1
i 3 178.44474761255114 2 7.66666666666667 68 -1 -0.3849911579463 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.66666666666667 68 -1 -0.36755629321569 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.91666666666667 68 -1 -0.23426537883129 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.66666666666667 68 -1 0.15860761131162 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 8.33333333333333 68 -1 0.09353398067012 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 8.33333333333333 68 -1 0.36676606735214 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 8.91666666666667 68 -1 0.34302771128023 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 9.5 68 -1 0.31416264024495 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 10 68 -1 -0.37493484055483 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 8.33333333333333 68 -1 -0.0190738123745 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 8.91666666666667 68 -1 -0.4042340167838 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 9.5 68 -1 0.10721866450763 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 10 68 -1 0.11555294586902 -0.5 -0.5 367232 1
i 4 178.44474761255114 2 8.58333333333333 68 -1 -0.39027584990812 -0.5 -0.5 367232 1
i 4 178.7175989085948 2 6.66666666666667 68 -1 0.4479697655656 -0.5 -0.5 2869 1
i 4 178.7175989085948 2 6.33333333333333 68 -1 0.18645028910874 -0.5 -0.5 2869 1
i 4 178.7175989085948 2 8.58333333333333 68 -1 0.36809790285199 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 6.33333333333333 68 -1 -0.08477155357084 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 6.66666666666667 68 -1 -0.08745832524363 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 6.33333333333333 68 -1 0.2869156644548 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 8.58333333333333 68 -1 -0.34064357242312 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 8.91666666666667 68 -1 0.19344959562859 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 8.58333333333333 68 -1 0.5 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 6.33333333333333 68 -1 -0.01107323192522 -0.5 -0.5 2869 1
i 3 179.26330150068213 2 10 68 -1 -0.26907197238318 -0.5 -0.5 367232 1
i 3 179.26330150068213 2 10.33333333333333 68 -1 0.4750340193025 -0.5 -0.5 367232 1
i 3 179.26330150068213 2 10 68 -1 -0.42404888251548 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 8.58333333333333 68 -1 0.26964455021185 -0.5 -0.5 367232 1
i 5 179.26330150068213 2 8.58333333333333 68 -1 0.34261635735151 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 9.25 68 -1 -0.12240507183108 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 9.75 68 -1 -0.13506189689809 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 10.33333333333333 68 -1 0.27452553685498 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 8.91666666666667 68 -1 0.45246924877736 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 6.33333333333333 68 -1 0.09363493894032 -0.5 -0.5 2869 1
i 4 179.5361527967258 2 10 68 -1 0.28768873234108 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 8.91666666666667 68 -1 0.25573356156761 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 9.25 68 -1 -0.19370541272513 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 8.91666666666667 68 -1 0.03340077097613 -0.5 -0.5 367232 1
i 4 179.80900409276944 2 6.33333333333333 68 -1 0.47144428195612 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 6.66666666666667 68 -1 0.01579421870187 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 6.33333333333333 68 -1 -0.38294070230409 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 8.91666666666667 68 -1 0.31263272315586 -0.5 -0.5 367232 1
i 4 179.80900409276944 2 8.58333333333333 68 -1 0.43129128586437 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 6.33333333333333 68 -1 0.41793221432169 -0.5 -0.5 2869 1
i 6 180.0818553888131 2 6.33333333333333 68 -1 0.14089529866656 -0.5 -0.5 2869 1
i 5 180.0818553888131 2 6.91666666666667 68 -1 -0.17095160449062 -0.5 -0.5 2869 1
i 6 180.0818553888131 2 7.41666666666667 68 -1 0.34722385955792 -0.5 -0.5 2869 1
i 6 180.0818553888131 2 8 68 -1 -0.29463538543214 -0.5 -0.5 2869 1
i 4 180.0818553888131 2 6 68 -1 0.1965187055244 -0.5 -0.5 2869 1
i 4 180.0818553888131 2 8.58333333333333 68 -1 -0.43685802204636 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 8.91666666666667 68 -1 0.38484037757002 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 8.58333333333333 68 -1 -0.17996080359459 -0.5 -0.5 367232 1
i 4 180.35470668485675 2 6 68 -1 0.02277491594345 -0.5 -0.5 2869 1
i 4 180.35470668485675 2 8.58333333333333 68 -1 0.09116771952282 -0.5 -0.5 367232 1
i 4 180.6275579809004 2 6 68 -1 -0.21927988328098 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 6.33333333333333 68 -1 0.28774846360946 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 6 68 -1 0.3393209048378 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 8.58333333333333 68 -1 0.02460534819911 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 6 68 -1 0.1586213175026 -0.5 -0.5 2869 1
i 5 180.90040927694406 2 6 68 -1 -0.45906556142589 -0.5 -0.5 2869 1
i 5 180.90040927694406 2 6.66666666666667 68 -1 -0.06523856495819 -0.5 -0.5 2869 1
i 5 180.90040927694406 2 7.16666666666667 68 -1 0.47546341342489 -0.5 -0.5 2869 1
i 6 180.90040927694406 2 7.66666666666667 68 -1 0.41550003281223 -0.5 -0.5 2869 1
i 4 180.90040927694406 2 6.33333333333333 68 -1 0.22761925911862 -0.5 -0.5 2869 1
i 4 180.90040927694406 2 8.58333333333333 68 -1 -0.27041350326724 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 8.91666666666667 68 -1 -0.47359348419186 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 8.58333333333333 68 -1 0.33604621013869 -0.5 -0.5 367232 1
i 4 181.17326057298772 2 6.33333333333333 68 -1 -0.25664650794983 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 6.66666666666667 68 -1 -0.46683582756139 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 6.33333333333333 68 -1 0.02926581212903 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 8.58333333333333 68 -1 0.26933362112775 -0.5 -0.5 367232 1
i 6 181.17326057298772 2 8.58333333333333 68 -1 -0.45049030941154 -0.5 -0.5 367232 1
i 5 181.17326057298772 2 9.25 68 -1 0.1282554261728 -0.5 -0.5 367232 1
i 5 181.17326057298772 2 9.75 68 -1 0.48680600023017 -0.5 -0.5 367232 1
i 5 181.17326057298772 2 10.33333333333333 68 -1 0.15141694135137 -0.5 -0.5 367232 1
i 4 181.17326057298772 2 8.33333333333333 68 -1 0.04497455563212 -0.5 -0.5 367232 1
i 4 181.44611186903137 2 6.33333333333333 68 -1 -0.21926056070805 -0.5 -0.5 2869 1
i 4 181.44611186903137 2 6 68 -1 0.10002407077081 -0.5 -0.5 2869 1
i 4 181.44611186903137 2 8.33333333333333 68 -1 -0.1159737403926 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 6 68 -1 -0.38727921629629 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 6.33333333333333 68 -1 -0.39028189701208 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 6 68 -1 0.39816570786302 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 8.33333333333333 68 -1 0.36449380636136 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 8.58333333333333 68 -1 0.15718006872248 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 8.33333333333333 68 -1 -0.21228198271142 -0.5 -0.5 367232 1
i 4 181.99181446111868 2 6 68 -1 0.13395035755265 -0.5 -0.5 2869 1
i 4 181.99181446111868 2 8.33333333333333 68 -1 0.11743649267211 -0.5 -0.5 367232 1
i 5 181.99181446111868 2 8.33333333333333 68 -1 -0.21211702176789 -0.5 -0.5 367232 1
i 6 181.99181446111868 2 8.91666666666667 68 -1 0.44754343176773 -0.5 -0.5 367232 1
i 6 181.99181446111868 2 9.5 68 -1 0.01457313390077 -0.5 -0.5 367232 1
i 5 181.99181446111868 2 10 68 -1 0.09532355062187 -0.5 -0.5 367232 1
i 4 181.99181446111868 2 8.58333333333333 68 -1 0.33100317450519 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 6 68 -1 0.2234620186186 -0.5 -0.5 2869 1
i 4 182.26466575716233 2 8.58333333333333 68 -1 -0.39104159520426 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 8.91666666666667 68 -1 0.09867253971124 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 8.58333333333333 68 -1 -0.40099477090297 -0.5 -0.5 367232 1
i 4 182.537517053206 2 6 68 -1 -0.23876569684029 -0.5 -0.5 2869 1
i 4 182.537517053206 2 6.33333333333333 68 -1 0.4230936581801 -0.5 -0.5 2869 1
i 4 182.537517053206 2 6 68 -1 -0.43763442762023 -0.5 -0.5 2869 1
i 4 182.537517053206 2 8.58333333333333 68 -1 -0.35145384174247 -0.5 -0.5 367232 1
i 4 182.537517053206 2 8.33333333333333 68 -1 -0.06184030393333 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 6 68 -1 -0.08210991835798 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 6 68 -1 -0.00300847781199 -0.5 -0.5 2869 1
i 5 182.81036834924964 2 6.66666666666667 68 -1 0.18468273000766 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 7.16666666666667 68 -1 -0.24586292400456 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 7.66666666666667 68 -1 0.33974026816754 -0.5 -0.5 2869 1
i 4 182.81036834924964 2 8.33333333333333 68 -1 -0.32194796408273 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 8.58333333333333 68 -1 0.15802415126196 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 8.33333333333333 68 -1 0.27690173963753 -0.5 -0.5 367232 1
i 4 183.08321964529333 2 6 68 -1 0.33278700289935 -0.5 -0.5 2869 1
i 4 183.08321964529333 2 8.33333333333333 68 -1 -0.09487574466824 -0.5 -0.5 367232 1
i 4 183.35607094133698 2 6 68 -1 0.04752598394882 -0.5 -0.5 2869 1
i 4 183.35607094133698 2 8.33333333333333 68 -1 -0.33116587658703 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 6 68 -1 -0.03181117390268 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 6.33333333333333 68 -1 -0.36521496145452 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 6 68 -1 -0.03446309906162 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 8.33333333333333 68 -1 -0.20480673955407 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 8.58333333333333 68 -1 0.22208109845579 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 8.33333333333333 68 -1 0.39961865804813 -0.5 -0.5 367232 1
i 4 183.9017735334243 2 6 68 -1 -0.20780083251043 -0.5 -0.5 2869 1
i 5 183.9017735334243 2 6 68 -1 -0.39290870523488 -0.5 -0.5 2869 1
i 6 183.9017735334243 2 6.66666666666667 68 -1 0.33718893594847 -0.5 -0.5 2869 1
i 6 183.9017735334243 2 7.16666666666667 68 -1 0.19040873387997 -0.5 -0.5 2869 1
i 5 183.9017735334243 2 7.66666666666667 68 -1 0.48415230870009 -0.5 -0.5 2869 1
i 4 183.9017735334243 2 6.33333333333333 68 -1 -0.1269762347944 -0.5 -0.5 2869 1
i 4 183.9017735334243 2 8.33333333333333 68 -1 -0.06533500092245 -0.5 -0.5 367232 1
i 5 183.9017735334243 2 8.33333333333333 68 -1 -0.06813981715788 -0.5 -0.5 367232 1
i 5 183.9017735334243 2 8.91666666666667 68 -1 0.24721292366904 -0.5 -0.5 367232 1
i 5 183.9017735334243 2 9.5 68 -1 -0.16424055296632 -0.5 -0.5 367232 1
i 5 183.9017735334243 2 10 68 -1 -0.402518500787 -0.5 -0.5 367232 1
i 4 184.17462482946794 2 6.33333333333333 68 -1 -0.07943894891449 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 6.66666666666667 68 -1 0.41714026252892 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 6.33333333333333 68 -1 0.04504695559364 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 8.33333333333333 68 -1 0.01443554599129 -0.5 -0.5 367232 1
i 4 184.4474761255116 2 6.33333333333333 68 -1 -0.12577637724909 -0.5 -0.5 2869 1
i 4 184.4474761255116 2 6 68 -1 -0.43883315422316 -0.5 -0.5 2869 1
i 4 184.4474761255116 2 8.33333333333333 68 -1 -0.30830022385642 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 6 68 -1 -0.47126468497827 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 6.33333333333333 68 -1 0.20137921310472 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 6 68 -1 -0.04417400154829 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 8.33333333333333 68 -1 0.40173935931595 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 8.58333333333333 68 -1 -0.11845535612863 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 8.33333333333333 68 -1 -0.32335434441222 -0.5 -0.5 367232 1
i 4 184.9931787175989 2 6 68 -1 0.10217063127759 -0.5 -0.5 2869 1
i 4 184.9931787175989 2 8.33333333333333 68 -1 0.08095095466669 -0.5 -0.5 367232 1
i 6 184.9931787175989 2 8.33333333333333 68 -1 0.29245887314927 -0.5 -0.5 367232 1
i 5 184.9931787175989 2 8.91666666666667 68 -1 -0.19606939502824 -0.5 -0.5 367232 1
i 6 184.9931787175989 2 9.5 68 -1 -0.42409065768214 -0.5 -0.5 367232 1
i 6 184.9931787175989 2 10 68 -1 -0.34645142761548 -0.5 -0.5 367232 1
i 4 184.9931787175989 2 8.58333333333333 68 -1 0.41833636714497 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 6 68 -1 0.27295966838847 -0.5 -0.5 2869 1
i 4 185.26603001364256 2 8.58333333333333 68 -1 -0.36980456794754 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 8.91666666666667 68 -1 -0.16106612255103 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 8.58333333333333 68 -1 -0.22194422676478 -0.5 -0.5 367232 1
i 4 185.53888130968622 2 6 68 -1 0.34482305242887 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 6.33333333333333 68 -1 0.38064973186615 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 6 68 -1 -0.16019842428663 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 8.58333333333333 68 -1 0.2344716240531 -0.5 -0.5 367232 1
i 4 185.53888130968622 2 8.33333333333333 68 -1 0.19079757213058 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 6 68 -1 -0.37278898860668 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6 68 -1 -0.41422249493047 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6.66666666666667 68 -1 -0.17945922826121 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 0.29558069869323 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 7.66666666666667 68 -1 -0.43283293667296 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6 68 -1 0.44392029757137 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6.66666666666667 68 -1 -0.17682191645845 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 -0.41895291695353 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 7.66666666666667 68 -1 0.20658762140797 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6 68 -1 0.39406618875827 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6.66666666666667 68 -1 -0.03021756582837 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 0.46012673339199 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.66666666666667 68 -1 0.08277670600412 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6 68 -1 0.24300906080647 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6.66666666666667 68 -1 0.46102617014916 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 -0.12779893252742 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.66666666666667 68 -1 0.00030807467808 -0.5 -0.5 2869 1
i 4 185.81173260572987 2 8.33333333333333 68 -1 -0.30509685039932 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 8.58333333333333 68 -1 0.31465412679999 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 8.33333333333333 68 -1 0.31406960078068 -0.5 -0.5 367232 1
i 4 186.08458390177353 2 8.33333333333333 68 -1 0.17063454249974 -0.5 -0.5 367232 1
i 4 186.35743519781718 2 8.33333333333333 68 -1 0.12854422476968 -0.5 -0.5 367232 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 -0.05402027000392 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 8 68 -1 0.36325714863484 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 -0.1616377647061 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 0.24149311655556 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 0.05069476802105 -0.5 -0.5 2869 1
i 4 186.63028649386084 2 8.33333333333333 68 -1 -0.34302089880043 -0.5 -0.5 367232 1
i 4 186.63028649386084 2 8.58333333333333 68 -1 0.0239240003716 -0.5 -0.5 367232 1
i 4 186.63028649386084 2 8.33333333333333 68 -1 0.41317722863735 -0.5 -0.5 367232 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 -0.08170415575277 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 0.38332267525039 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 8 68 -1 0.3470657125385 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 -0.3738715299874 -0.5 -0.5 2869 1
i 4 186.9031377899045 2 7.66666666666667 68 -1 -0.46899554923037 -0.5 -0.5 2869 1
i 4 186.9031377899045 2 8.33333333333333 68 -1 0.43785088791024 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.33333333333333 68 -1 0.11236528988561 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.91666666666667 68 -1 -0.33659156395631 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 9.5 68 -1 -0.04219756584112 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 10 68 -1 -0.42307768065746 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.33333333333333 68 -1 0.07716106127219 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.91666666666667 68 -1 -0.22968142893029 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 9.5 68 -1 -0.14692848457499 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 10 68 -1 0.31419046080999 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.33333333333333 68 -1 0.44483760452925 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.91666666666667 68 -1 0.41312875790875 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 9.5 68 -1 -0.25653978995594 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 10 68 -1 -0.33379861416908 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.33333333333333 68 -1 0.16819458109028 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.91666666666667 68 -1 0.08901262273824 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 9.5 68 -1 0.43865353273134 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 10 68 -1 0.43340260028864 -0.5 -0.5 367232 1
i 3 187.17598908594817 2 7.66666666666667 68 -1 0.19426186111042 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 7.66666666666667 68 -1 0.3520929790573 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 8.33333333333333 68 -1 0.11561498596783 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 8.75 68 -1 0.20841668875831 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 9.41666666666667 68 -1 -0.15088400040184 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 8 68 -1 0.33225993993209 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 7.66666666666667 68 -1 -0.24089202082033 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 8 68 -1 0.09634834694859 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 7.66666666666667 68 -1 -0.49493150249749 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.37994517700911 -0.5 -0.5 2869 1
i 4 187.44884038199183 2 8.33333333333333 68 -1 -0.47283358734617 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.24050113117175 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 7.66666666666667 68 -1 -0.07183728916026 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 7.66666666666667 68 -1 0.11955513548678 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 8.33333333333333 68 -1 -0.32726759265389 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 8.75 68 -1 -0.19118332728507 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 9.41666666666667 68 -1 -0.26217100681847 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.48798648184041 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8 68 -1 0.2745955125656 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 7.66666666666667 68 -1 -0.01472350075492 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8 68 -1 -0.2073183346265 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8.33333333333333 68 -1 -0.05460466365658 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8 68 -1 0.07701394270408 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 10 68 -1 0.29628418738788 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10.33333333333333 68 -1 -0.19792156682498 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10 68 -1 0.13113147088308 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10 68 -1 0.48538187667888 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10 68 -1 -0.23969866347782 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 -0.01591465979426 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 8 68 -1 0.16163395105037 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 -0.47081917872314 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 8 68 -1 -0.01380562611993 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 -0.00676452876718 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 10 68 -1 0.16529676664745 -0.5 -0.5 367232 1
i 4 187.99454297407914 2 10 68 -1 -0.24587258188195 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 10.33333333333333 68 -1 -0.42569978689385 -0.5 -0.5 367232 1
i 4 187.99454297407914 2 10 68 -1 -0.25496739065385 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 10 68 -1 0.05339667509644 -0.5 -0.5 367232 1
i 4 188.2673942701228 2 7.66666666666667 68 -1 0.08945293961963 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 7.66666666666667 68 -1 -0.01775556262664 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 8 68 -1 0.30091154978221 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 7.66666666666667 68 -1 0.44577478380368 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 10 68 -1 0.16714889434852 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 10 68 -1 -0.20107553131976 -0.5 -0.5 367232 1
i 4 188.2673942701228 2 10.58333333333333 68 -1 -0.44782660293347 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 11.25 68 -1 -0.24683805959126 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 11.75 68 -1 0.01522614258977 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10.33333333333333 68 -1 0.40000227088232 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10 68 -1 0.26223987644339 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10.33333333333333 68 -1 -0.28202200350614 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10 68 -1 -0.07460780572781 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 7.66666666666667 68 -1 0.00748936741782 -0.5 -0.5 2869 1
i 3 188.54024556616645 2 7.66666666666667 68 -1 -0.16952071086829 -0.5 -0.5 2869 1
i 4 188.54024556616645 2 10.33333333333333 68 -1 0.37427850428601 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 10.58333333333333 68 -1 0.34424926668376 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 10.33333333333333 68 -1 -0.02005176075607 -0.5 -0.5 367232 1
i 4 188.54024556616645 2 10 68 -1 -0.11351376579396 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 10 68 -1 -0.27828735862796 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 10.58333333333333 68 -1 0.17641357577878 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 11.25 68 -1 -0.30030953776581 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 11.75 68 -1 -0.19462748120263 -0.5 -0.5 367232 1
i 4 188.54024556616645 2 10.33333333333333 68 -1 -0.20341559779623 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 7.66666666666667 68 -1 -0.44632170933139 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 8 68 -1 -0.11040698857956 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 7.66666666666667 68 -1 -0.12321127633877 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 7.66666666666667 68 -1 -0.27999373653426 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 0.12131174841459 -0.5 -0.5 367232 1
i 4 188.8130968622101 2 10 68 -1 -0.00547724210694 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 0.36074532139886 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.58333333333333 68 -1 0.45119072234427 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 -0.25859436157335 -0.5 -0.5 367232 1
i 4 189.08594815825376 2 7.66666666666667 68 -1 -0.25076580037208 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 7.66666666666667 68 -1 -0.09616892852487 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 8.33333333333333 68 -1 0.17455776151196 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 8.75 68 -1 -0.37913845823903 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 9.41666666666667 68 -1 -0.30205551733777 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 7.66666666666667 68 -1 0.03637980929083 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 8 68 -1 0.40283039859574 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 7.66666666666667 68 -1 0.1885815393462 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 10 68 -1 -0.39861289771046 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10.33333333333333 68 -1 0.03893249832897 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10 68 -1 0.10811816745499 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10.33333333333333 68 -1 0.24982890507792 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10 68 -1 0.32537261266679 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 7.66666666666667 68 -1 -0.47027372518154 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 7.66666666666667 68 -1 -0.28805812379326 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.33333333333333 68 -1 -0.01058493201042 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.75 68 -1 -0.22957803239785 -0.5 -0.5 2869 1
i 4 189.3587994542974 2 9.41666666666667 68 -1 0.06542070086975 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 7.66666666666667 68 -1 -0.27079939831879 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.33333333333333 68 -1 -0.31526075471689 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.75 68 -1 0.47292146714267 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 9.41666666666667 68 -1 0.3837493686593 -0.5 -0.5 2869 1
i 3 189.3587994542974 2 8 68 -1 0.21443292417805 -0.5 -0.5 2869 1
i 3 189.3587994542974 2 10 68 -1 -0.25587892089436 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10 68 -1 0.31285123841465 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10.33333333333333 68 -1 -0.10643179315043 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10 68 -1 0.26737171615437 -0.5 -0.5 367232 1
i 3 189.63165075034107 2 8 68 -1 -0.23630892666617 -0.5 -0.5 2869 1
i 3 189.63165075034107 2 10 68 -1 0.27613913741454 -0.5 -0.5 367232 1
i 3 189.63165075034107 2 10 68 -1 0.11973782157883 -0.5 -0.5 367232 1
i 4 189.90450204638472 2 8 68 -1 -0.09462447882495 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 8.33333333333333 68 -1 -0.12928643168172 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 8 68 -1 -0.34732455876622 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 10 68 -1 0.13309008147772 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10.33333333333333 68 -1 -0.3399333701305 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10 68 -1 -0.07170567108881 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10 68 -1 -0.2388626816052 -0.5 -0.5 367232 1
i 2 190.17735334242838 2 9.41666666666667 68 -1 0.25815975410098 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 9.66666666666667 68 -1 0.02232350831462 -0.5 -0.5 2869 1
i 2 190.17735334242838 2 9.41666666666667 68 -1 0.12623061777186 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 8 68 -1 -0.12393230137784 -0.5 -0.5 2869 1
i 4 190.17735334242838 2 8 68 -1 -0.37370241487862 -0.5 -0.5 2869 1
i 4 190.17735334242838 2 8.66666666666667 68 -1 -0.05227680756775 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 9.16666666666667 68 -1 -0.07060798171884 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 9.66666666666667 68 -1 0.19410511503956 -0.5 -0.5 2869 1
i 4 190.17735334242838 2 8.33333333333333 68 -1 -0.19265247351032 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 10 68 -1 0.45801370067775 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 10 68 -1 0.35581542863678 -0.5 -0.5 367232 1
i 4 190.17735334242838 2 10.58333333333333 68 -1 -0.46735175881447 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 11.25 68 -1 0.17161358040154 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 11.75 68 -1 -0.28587852719569 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 10 68 -1 0.40548825800865 -0.5 -0.5 367232 1
i 4 190.17735334242838 2 10.33333333333333 68 -1 -0.42562061549251 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 10 68 -1 0.06144814865319 -0.5 -0.5 367232 1
i 2 190.45020463847203 2 9.41666666666667 68 -1 0.1405228561957 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.33333333333333 68 -1 0.39518514047996 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.66666666666667 68 -1 0.08421377248655 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.33333333333333 68 -1 -0.39000558531397 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 10 68 -1 -0.07785211786801 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10 68 -1 -0.00550164904628 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10.58333333333333 68 -1 0.42772208231653 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.25 68 -1 0.0120089555038 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.75 68 -1 0.47350443009253 -0.5 -0.5 367232 1
i 4 190.45020463847203 2 10 68 -1 -0.0392345151941 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10.58333333333333 68 -1 -0.10947651914335 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.25 68 -1 0.187681859526 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.75 68 -1 0.31241098927588 -0.5 -0.5 367232 1
i 3 190.45020463847203 2 10.33333333333333 68 -1 0.19023319594282 -0.5 -0.5 367232 1
i 3 190.72305593451568 2 8.33333333333333 68 -1 0.07230806518933 -0.5 -0.5 2869 1
i 3 190.72305593451568 2 8 68 -1 -0.15856495613963 -0.5 -0.5 2869 1
i 3 190.72305593451568 2 10.33333333333333 68 -1 -0.30367874311802 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 8 68 -1 0.27729943033564 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 8.33333333333333 68 -1 0.18832853318043 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 8 68 -1 -0.01373296214539 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 10.33333333333333 68 -1 0.08094222912534 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 10.58333333333333 68 -1 -0.3488777821564 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 10.33333333333333 68 -1 -0.29826662044445 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 8 68 -1 0.33068002462939 -0.5 -0.5 2869 1
i 2 191.26875852660302 2 11.75 68 -1 -0.19292184848497 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 12 68 -1 0.07475204963083 -0.5 -0.5 367232 1
i 2 191.26875852660302 2 11.75 68 -1 0.19265576518698 -0.5 -0.5 367232 1
i 4 191.26875852660302 2 10.33333333333333 68 -1 0.35888569760457 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 10.33333333333333 68 -1 0.17002976336995 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 10.91666666666667 68 -1 -0.26259744628051 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 11.5 68 -1 -0.43250919020039 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 12 68 -1 0.48713177430216 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 10.58333333333333 68 -1 -0.25579272277964 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 8 68 -1 0.0942915932038 -0.5 -0.5 2869 1
i 2 191.54160982264668 2 11.75 68 -1 0.42584404834689 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.58333333333333 68 -1 0.10822506369978 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.91666666666667 68 -1 -0.383312274449 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.58333333333333 68 -1 0.36743350572168 -0.5 -0.5 367232 1
i 3 191.81446111869033 2 8 68 -1 0.4324582671437 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 8.33333333333333 68 -1 0.20627330134921 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 8 68 -1 0.07881922217656 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 10.58333333333333 68 -1 -0.29836909551391 -0.5 -0.5 367232 1
i 4 191.81446111869033 2 10.33333333333333 68 -1 -0.25845611361509 -0.5 -0.5 367232 1
i 4 192.087312414734 2 8 68 -1 -0.47770493498596 -0.5 -0.5 2869 1
i 5 192.087312414734 2 8 68 -1 -0.09307398201712 -0.5 -0.5 2869 1
i 5 192.087312414734 2 8.66666666666667 68 -1 -0.09965169197489 -0.5 -0.5 2869 1
i 5 192.087312414734 2 9.16666666666667 68 -1 0.45953927542173 -0.5 -0.5 2869 1
i 5 192.087312414734 2 9.66666666666667 68 -1 -0.46224270955158 -0.5 -0.5 2869 1
i 3 192.087312414734 2 7.66666666666667 68 -1 -0.10434426340712 -0.5 -0.5 2869 1
i 3 192.087312414734 2 10.33333333333333 68 -1 0.07803983910395 -0.5 -0.5 367232 1
i 3 192.087312414734 2 10.58333333333333 68 -1 0.48410822389008 -0.5 -0.5 367232 1
i 3 192.087312414734 2 10.33333333333333 68 -1 0.43176316373545 -0.5 -0.5 367232 1
i 3 192.36016371077764 2 7.66666666666667 68 -1 -0.08750740369173 -0.5 -0.5 2869 1
i 3 192.36016371077764 2 10.33333333333333 68 -1 0.29396482653109 -0.5 -0.5 367232 1
i 3 192.6330150068213 2 7.66666666666667 68 -1 -0.48955601051505 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 8 68 -1 0.37721563157481 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 7.66666666666667 68 -1 0.48641465675761 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 10.33333333333333 68 -1 -0.36122099621839 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 7.66666666666667 68 -1 -0.25316888476873 -0.5 -0.5 2869 1
i 4 192.90586630286495 2 7.66666666666667 68 -1 -0.15737412391033 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 8.33333333333333 68 -1 -0.07808890393639 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 8.75 68 -1 0.25882923422655 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 9.41666666666667 68 -1 -0.21334428635625 -0.5 -0.5 2869 1
i 3 192.90586630286495 2 8 68 -1 -0.10225565286912 -0.5 -0.5 2869 1
i 3 192.90586630286495 2 10.33333333333333 68 -1 -0.15208169454855 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 10.58333333333333 68 -1 0.35172423121762 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 10.33333333333333 68 -1 0.16537493472898 -0.5 -0.5 367232 1
i 3 193.1787175989086 2 8 68 -1 0.17945824279244 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 8.33333333333333 68 -1 0.49558957964664 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 8 68 -1 0.12288074067936 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 10.33333333333333 68 -1 -0.13483103295862 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 10.33333333333333 68 -1 -0.13229326913655 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 10.91666666666667 68 -1 -0.03350994014685 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 11.5 68 -1 0.29141620908002 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 12 68 -1 0.1099343576644 -0.5 -0.5 367232 1
i 3 193.1787175989086 2 10 68 -1 0.10603150767906 -0.5 -0.5 367232 1
i 3 193.45156889495226 2 8 68 -1 -0.45456935007389 -0.5 -0.5 2869 1
i 3 193.45156889495226 2 7.66666666666667 68 -1 0.00626238959655 -0.5 -0.5 2869 1
i 3 193.45156889495226 2 10 68 -1 -0.06796949723896 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 7.66666666666667 68 -1 0.07830574171455 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 8 68 -1 0.21498723656839 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 7.66666666666667 68 -1 0.2124456596267 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 10 68 -1 0.06630698307247 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 10.33333333333333 68 -1 0.3626009307604 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 10 68 -1 0.04224959136328 -0.5 -0.5 367232 1
i 3 193.99727148703957 2 7.66666666666667 68 -1 -0.20266980851813 -0.5 -0.5 2869 1
i 3 193.99727148703957 2 10 68 -1 -0.47155035781315 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 10 68 -1 -0.00963882889958 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 10.58333333333333 68 -1 -0.4655202658748 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 11.25 68 -1 0.02194243129883 -0.5 -0.5 367232 1
i 4 193.99727148703957 2 11.75 68 -1 0.33443213288982 -0.5 -0.5 367232 1
i 4 193.99727148703957 2 10.33333333333333 68 -1 0.38879413276866 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 7.66666666666667 68 -1 -0.43034611522061 -0.5 -0.5 2869 1
i 4 194.27012278308322 2 10.33333333333333 68 -1 0.10532133222264 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 10.58333333333333 68 -1 0.07758894472981 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 10.33333333333333 68 -1 -0.4611446633353 -0.5 -0.5 367232 1
i 3 194.54297407912688 2 7.66666666666667 68 -1 -0.26878376399412 -0.5 -0.5 2869 1
i 3 194.54297407912688 2 8 68 -1 -0.39493176969277 -0.5 -0.5 2869 1
i 4 194.54297407912688 2 7.66666666666667 68 -1 0.24284432845906 -0.5 -0.5 2869 1
i 4 194.54297407912688 2 10.33333333333333 68 -1 -0.09338377185537 -0.5 -0.5 367232 1
i 3 194.54297407912688 2 10 68 -1 0.3221222655456 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 7.66666666666667 68 -1 0.01732723846718 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 7.66666666666667 68 -1 -0.17585871084769 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 8.33333333333333 68 -1 -0.16356814749646 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 8.75 68 -1 0.16070006170656 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 9.41666666666667 68 -1 0.20101003910513 -0.5 -0.5 2869 1
i 3 194.81582537517053 2 10 68 -1 0.08584868250834 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 10.33333333333333 68 -1 -0.00986287676153 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 10 68 -1 -0.4326152780032 -0.5 -0.5 367232 1
i 3 195.0886766712142 2 7.66666666666667 68 -1 0.45958493276578 -0.5 -0.5 2869 1
i 3 195.0886766712142 2 10 68 -1 -0.21351476019298 -0.5 -0.5 367232 1
i 3 195.36152796725784 2 7.66666666666667 68 -1 0.40784566448174 -0.5 -0.5 2869 1
i 3 195.36152796725784 2 10 68 -1 -0.28675268848068 -0.5 -0.5 367232 1
i 3 195.6343792633015 2 7.66666666666667 68 -1 -0.33079295192257 -0.5 -0.5 2869 1
i 4 195.6343792633015 2 8 68 -1 0.38244468011003 -0.5 -0.5 2869 1
i 3 195.6343792633015 2 7.66666666666667 68 -1 -0.29038014677965 -0.5 -0.5 2869 1
i 3 195.6343792633015 2 10 68 -1 -0.47206020841339 -0.5 -0.5 367232 1
i 3 195.6343792633015 2 10.33333333333333 68 -1 0.40002747697689 -0.5 -0.5 367232 1
i 4 195.6343792633015 2 10 68 -1 0.33716495825318 -0.5 -0.5 367232 1
i 3 195.90723055934515 2 7.66666666666667 68 -1 0.31302322475192 -0.5 -0.5 2869 1
i 4 195.90723055934515 2 7.66666666666667 68 -1 -0.24077337256757 -0.5 -0.5 2869 1
i 4 195.90723055934515 2 8.33333333333333 68 -1 0.01669610061571 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 8.75 68 -1 -0.22087196115931 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 9.41666666666667 68 -1 0.4171687788222 -0.5 -0.5 2869 1
i 3 195.90723055934515 2 8 68 -1 -0.35634200032438 -0.5 -0.5 2869 1
i 3 195.90723055934515 2 10 68 -1 0.30201145525678 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 10 68 -1 0.01124481886357 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 10.58333333333333 68 -1 -0.47127420822683 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 11.25 68 -1 -0.0717639541762 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 11.75 68 -1 -0.34241782567079 -0.5 -0.5 367232 1
i 3 196.1800818553888 2 8 68 -1 0.23456804037596 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 8.33333333333333 68 -1 0.46767228548833 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 8 68 -1 0.14753539880191 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 10 68 -1 -0.49430652099887 -0.5 -0.5 367232 1
i 3 196.45293315143246 2 8 68 -1 -0.30117655498895 -0.5 -0.5 2869 1
i 3 196.45293315143246 2 7.66666666666667 68 -1 0.2919797689775 -0.5 -0.5 2869 1
i 3 196.45293315143246 2 10 68 -1 -0.25258232933703 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 7.66666666666667 68 -1 0.31721995524968 -0.5 -0.5 2869 1
i 3 196.72578444747612 2 8 68 -1 -0.47688909381167 -0.5 -0.5 2869 1
i 3 196.72578444747612 2 7.66666666666667 68 -1 0.01036461015962 -0.5 -0.5 2869 1
i 4 196.72578444747612 2 10 68 -1 -0.40096640818528 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 10.33333333333333 68 -1 0.34287719268712 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 10 68 -1 -0.00987567122995 -0.5 -0.5 367232 1
i 3 196.99863574351977 2 7.66666666666667 68 -1 0.45562047915352 -0.5 -0.5 2869 1
i 3 196.99863574351977 2 10 68 -1 -0.07901197753386 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 10 68 -1 0.24203988703565 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 10.58333333333333 68 -1 -0.16951053545094 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 11.25 68 -1 -0.00886728162524 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 11.75 68 -1 0.18969115636353 -0.5 -0.5 367232 1
i 3 196.99863574351977 2 10.33333333333333 68 -1 -0.38153150609828 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 7.66666666666667 68 -1 -0.36894613245145 -0.5 -0.5 2869 1
i 3 197.27148703956343 2 10.33333333333333 68 -1 -0.4641940856464 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 10.58333333333333 68 -1 0.2310282121735 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 10.33333333333333 68 -1 -0.13312058266728 -0.5 -0.5 367232 1
i 3 197.54433833560708 2 7.66666666666667 68 -1 0.31035513589284 -0.5 -0.5 2869 1
i 3 197.54433833560708 2 8 68 -1 0.29607711474946 -0.5 -0.5 2869 1
i 3 197.54433833560708 2 7.66666666666667 68 -1 -0.24405893012141 -0.5 -0.5 2869 1
i 3 197.54433833560708 2 10.33333333333333 68 -1 -0.44575133905241 -0.5 -0.5 367232 1
i 3 197.54433833560708 2 10 68 -1 -0.35796983436183 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 7.66666666666667 68 -1 0.28548459585299 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 7.66666666666667 68 -1 -0.45169414748716 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.33333333333333 68 -1 -0.1587444722624 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.75 68 -1 -0.40066357779566 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 9.41666666666667 68 -1 -0.31759768675844 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 7.66666666666667 68 -1 0.12329247759969 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.33333333333333 68 -1 0.06634051115375 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.75 68 -1 -0.34625125430207 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 9.41666666666667 68 -1 -0.23230210562334 -0.5 -0.5 2869 1
i 3 197.81718963165073 2 10 68 -1 0.01487579443168 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 10.33333333333333 68 -1 -0.38968764873999 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 10 68 -1 0.17748257998213 -0.5 -0.5 367232 1
i 3 198.0900409276944 2 10 68 -1 -0.46707625601876 -0.5 -0.5 367232 1
i 4 198.36289222373804 2 10 68 -1 -0.479884912117 -0.5 -0.5 367232 1
i 2 198.6357435197817 2 9.41666666666667 68 -1 -0.43837621901145 -0.5 -0.5 2869 1
i 2 198.6357435197817 2 9.66666666666667 68 -1 0.41221551345516 -0.5 -0.5 2869 1
i 2 198.6357435197817 2 9.41666666666667 68 -1 -0.23875915708066 -0.5 -0.5 2869 1
i 3 198.6357435197817 2 10 68 -1 -0.32308715203428 -0.5 -0.5 367232 1
i 3 198.6357435197817 2 10.33333333333333 68 -1 0.08085645051478 -0.5 -0.5 367232 1
i 3 198.6357435197817 2 10 68 -1 0.33025431627185 -0.5 -0.5 367232 1
i 2 198.90859481582535 2 9.41666666666667 68 -1 0.07537391621299 -0.5 -0.5 2869 1
i 3 198.90859481582535 2 10 68 -1 -0.02794648696315 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10 68 -1 -0.38930020225148 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10.58333333333333 68 -1 -0.34146800723793 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.25 68 -1 -0.12263542651901 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.75 68 -1 -0.46590409847828 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10 68 -1 0.30523238184487 -0.5 -0.5 367232 1
i 4 198.90859481582535 2 10.58333333333333 68 -1 -0.18554117035263 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.25 68 -1 -0.14221269738904 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.75 68 -1 0.09558487664478 -0.5 -0.5 367232 1
i 2 199.72714870395635 2 11.75 68 -1 -0.13350871814366 -0.5 -0.5 367232 1
i 2 199.72714870395635 2 12 68 -1 -0.34690967094901 -0.5 -0.5 367232 1
i 3 199.72714870395635 2 11.75 68 -1 -0.17820379329572 -0.5 -0.5 367232 1
i 2 200 2 11.75 68 -1 0.29499093790627 -0.5 -0.5 367232 1
</CsScore>
</CsoundSynthesizer>
