<CsoundSynthesizer>
<CsOptions>
csound -RWdo C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-11--19-04-28.028.mml.wav C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-11--19-04-28.028.mml.orc C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-11--19-04-28.028.mml.sco
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
Guitar, Michael Gogins
Guitar, Michael Gogins
Plucked string chorused pitch-shifted delayed, Thomas Kung
Guitar, Michael Gogins
Xing by Andrew Horner
Guitar, Michael Gogins
Guitar, Michael Gogins
Guitar, Michael Gogins
Guitar, Michael Gogins
</CsArrangement>
<CsScore>
i 4 0 2 6 68 -1 0.2906036766256 -0.5 -0.5 2869 1
i 4 0.27285129604366 2 6 68 -1 0.3738245260096 -0.5 -0.5 2869 1
i 4 0.54570259208731 2 6 68 -1 -0.20522859790134 -0.5 -0.5 2869 1
i 4 0.81855388813097 2 6 68 -1 0.24549813130183 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6 68 -1 -0.04648212249324 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6.33333333333333 68 -1 -0.11747503840024 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 6 68 -1 -0.05378579076589 -0.5 -0.5 2869 1
i 4 1.09140518417462 2 8.33333333333333 68 -1 -0.18804541464192 -0.5 -0.5 367232 1
i 4 1.36425648021828 2 6 68 -1 -0.33305636596369 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 6 68 -1 -0.23285012757273 -0.5 -0.5 2869 1
i 5 1.36425648021828 2 6.66666666666667 68 -1 -0.33653994806345 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 7.16666666666667 68 -1 0.10753337313443 -0.5 -0.5 2869 1
i 6 1.36425648021828 2 7.66666666666667 68 -1 -0.4421626854619 -0.5 -0.5 2869 1
i 4 1.36425648021828 2 6.33333333333333 68 -1 -0.12144193937057 -0.5 -0.5 2869 1
i 4 1.36425648021828 2 8.33333333333333 68 -1 0.22132468545023 -0.5 -0.5 367232 1
i 4 1.63710777626194 2 6.33333333333333 68 -1 0.33665695107672 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 6.66666666666667 68 -1 0.17636274178378 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 6.33333333333333 68 -1 0.10293675142288 -0.5 -0.5 2869 1
i 4 1.63710777626194 2 8.33333333333333 68 -1 -0.25166644110126 -0.5 -0.5 367232 1
i 4 1.90995907230559 2 6.33333333333333 68 -1 0.32402500120766 -0.5 -0.5 2869 1
i 4 1.90995907230559 2 6 68 -1 0.2992012221355 -0.5 -0.5 2869 1
i 4 1.90995907230559 2 8.33333333333333 68 -1 0.36715584046284 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 6 68 -1 -0.08716462060983 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 6.33333333333333 68 -1 0.38785854185536 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 6 68 -1 -0.24827386683173 -0.5 -0.5 2869 1
i 4 2.18281036834925 2 8.33333333333333 68 -1 0.44337732561216 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 8.58333333333333 68 -1 0.35828736954733 -0.5 -0.5 367232 1
i 4 2.18281036834925 2 8.33333333333333 68 -1 0.41766782324627 -0.5 -0.5 367232 1
i 4 2.45566166439291 2 6 68 -1 -0.37890600155199 -0.5 -0.5 2869 1
i 4 2.45566166439291 2 8.33333333333333 68 -1 -0.22047602476423 -0.5 -0.5 367232 1
i 6 2.45566166439291 2 8.33333333333333 68 -1 -0.18027832947827 -0.5 -0.5 367232 1
i 6 2.45566166439291 2 8.91666666666667 68 -1 -0.24440196589702 -0.5 -0.5 367232 1
i 6 2.45566166439291 2 9.5 68 -1 -0.05796667002657 -0.5 -0.5 367232 1
i 6 2.45566166439291 2 10 68 -1 -0.05953149614064 -0.5 -0.5 367232 1
i 4 2.45566166439291 2 8.58333333333333 68 -1 0.23367223311719 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 6 68 -1 -0.01248057224729 -0.5 -0.5 2869 1
i 4 2.72851296043656 2 8.58333333333333 68 -1 0.10154957750047 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 8.91666666666667 68 -1 -0.20685499913622 -0.5 -0.5 367232 1
i 4 2.72851296043656 2 8.58333333333333 68 -1 -0.47800196698421 -0.5 -0.5 367232 1
i 4 3.00136425648022 2 6 68 -1 -0.48143092059993 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 6.33333333333333 68 -1 -0.01561842378069 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 6 68 -1 0.05532882621468 -0.5 -0.5 2869 1
i 4 3.00136425648022 2 8.58333333333333 68 -1 -0.49185734409457 -0.5 -0.5 367232 1
i 4 3.00136425648022 2 8.33333333333333 68 -1 -0.34857908237542 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 6 68 -1 -0.05221008168669 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 6 68 -1 0.46848191854175 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 6.66666666666667 68 -1 -0.36439947783676 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 7.16666666666667 68 -1 -0.02923225067406 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 7.66666666666667 68 -1 0.28925308651482 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 6 68 -1 0.11503449989224 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 6.66666666666667 68 -1 -0.32296189951343 -0.5 -0.5 2869 1
i 5 3.27421555252387 2 7.16666666666667 68 -1 -0.36270493011387 -0.5 -0.5 2869 1
i 6 3.27421555252387 2 7.66666666666667 68 -1 0.32003810932624 -0.5 -0.5 2869 1
i 4 3.27421555252387 2 6.33333333333333 68 -1 0.07460030291263 -0.5 -0.5 2869 1
i 4 3.27421555252387 2 8.33333333333333 68 -1 -0.08471878067393 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 8.58333333333333 68 -1 -0.01451850139948 -0.5 -0.5 367232 1
i 4 3.27421555252387 2 8.33333333333333 68 -1 -0.09796235393376 -0.5 -0.5 367232 1
i 4 3.54706684856753 2 6.33333333333333 68 -1 0.09221496980659 -0.5 -0.5 2869 1
i 4 3.54706684856753 2 8.33333333333333 68 -1 -0.44179629030337 -0.5 -0.5 367232 1
i 4 3.81991814461119 2 6.33333333333333 68 -1 0.00283952283133 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 6.66666666666667 68 -1 0.46501650026698 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 6.33333333333333 68 -1 -0.1270213917969 -0.5 -0.5 2869 1
i 4 3.81991814461119 2 8.33333333333333 68 -1 -0.13737935570298 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 7.66666666666667 68 -1 -0.28781726580654 -0.5 -0.5 2869 1
i 3 4.09276944065484 2 8 68 -1 -0.4743794160665 -0.5 -0.5 2869 1
i 3 4.09276944065484 2 7.66666666666667 68 -1 0.28438899361298 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 6.33333333333333 68 -1 0.38291084728358 -0.5 -0.5 2869 1
i 5 4.09276944065484 2 6.33333333333333 68 -1 -0.10711670263639 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 6.91666666666667 68 -1 -0.46865462623204 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 7.41666666666667 68 -1 0.11014023677093 -0.5 -0.5 2869 1
i 6 4.09276944065484 2 8 68 -1 -0.37396279376315 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 6.66666666666667 68 -1 0.43996306623316 -0.5 -0.5 2869 1
i 4 4.09276944065484 2 8.33333333333333 68 -1 -0.07838288181139 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 8.58333333333333 68 -1 0.11956130591605 -0.5 -0.5 367232 1
i 4 4.09276944065484 2 8.33333333333333 68 -1 0.18066439340259 -0.5 -0.5 367232 1
i 3 4.3656207366985 2 7.66666666666667 68 -1 -0.24626284912864 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.66666666666667 68 -1 0.36542334304173 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.91666666666667 68 -1 -0.3544459114594 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 6.66666666666667 68 -1 0.0195038107113 -0.5 -0.5 2869 1
i 4 4.3656207366985 2 8.33333333333333 68 -1 0.25760549038974 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 8.33333333333333 68 -1 -0.30133718585208 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 8.91666666666667 68 -1 -0.49582614434574 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 9.5 68 -1 -0.20490359414964 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 10 68 -1 -0.1800315778846 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 8.33333333333333 68 -1 -0.0015904170258 -0.5 -0.5 367232 1
i 5 4.3656207366985 2 8.91666666666667 68 -1 0.45164389696569 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 9.5 68 -1 0.27221389306098 -0.5 -0.5 367232 1
i 6 4.3656207366985 2 10 68 -1 -0.07719813358674 -0.5 -0.5 367232 1
i 4 4.3656207366985 2 8.58333333333333 68 -1 -0.26002902228069 -0.5 -0.5 367232 1
i 4 4.63847203274216 2 6.66666666666667 68 -1 -0.08056365662899 -0.5 -0.5 2869 1
i 4 4.63847203274216 2 6.33333333333333 68 -1 0.22974772585676 -0.5 -0.5 2869 1
i 4 4.63847203274216 2 8.58333333333333 68 -1 -0.35343039134663 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 6.33333333333333 68 -1 -0.20105048825245 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 6.66666666666667 68 -1 -0.4300480224943 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 6.33333333333333 68 -1 -0.42482835566227 -0.5 -0.5 2869 1
i 4 4.91132332878581 2 8.58333333333333 68 -1 -0.24080254904605 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 8.91666666666667 68 -1 0.04581420584532 -0.5 -0.5 367232 1
i 4 4.91132332878581 2 8.58333333333333 68 -1 0.21300779842779 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 6.33333333333333 68 -1 0.24051588721813 -0.5 -0.5 2869 1
i 3 5.18417462482947 2 10 68 -1 0.21597134821379 -0.5 -0.5 367232 1
i 3 5.18417462482947 2 10.33333333333333 68 -1 -0.38989447796931 -0.5 -0.5 367232 1
i 3 5.18417462482947 2 10 68 -1 0.47538057285071 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 8.58333333333333 68 -1 -0.02612659736283 -0.5 -0.5 367232 1
i 5 5.18417462482947 2 8.58333333333333 68 -1 -0.42540029221631 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 9.25 68 -1 0.0994477143691 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 9.75 68 -1 0.06289715360015 -0.5 -0.5 367232 1
i 6 5.18417462482947 2 10.33333333333333 68 -1 -0.2779485146181 -0.5 -0.5 367232 1
i 4 5.18417462482947 2 8.91666666666667 68 -1 -0.27170832418723 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 6.33333333333333 68 -1 0.02435715260152 -0.5 -0.5 2869 1
i 3 5.45702592087312 2 10 68 -1 0.35716209352085 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 8.91666666666667 68 -1 -0.13013802569231 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 9.25 68 -1 0.13138386863883 -0.5 -0.5 367232 1
i 4 5.45702592087312 2 8.91666666666667 68 -1 -0.00719802547512 -0.5 -0.5 367232 1
i 4 5.72987721691678 2 6.33333333333333 68 -1 0.17143603105058 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 6.66666666666667 68 -1 0.42137108059241 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 6.33333333333333 68 -1 -0.37045092908847 -0.5 -0.5 2869 1
i 4 5.72987721691678 2 8.91666666666667 68 -1 0.15202399361619 -0.5 -0.5 367232 1
i 4 5.72987721691678 2 8.58333333333333 68 -1 -0.17999766440928 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 6.33333333333333 68 -1 -0.04685172406406 -0.5 -0.5 2869 1
i 5 6.00272851296044 2 6.33333333333333 68 -1 0.4619418106312 -0.5 -0.5 2869 1
i 5 6.00272851296044 2 6.91666666666667 68 -1 0.44357451044625 -0.5 -0.5 2869 1
i 6 6.00272851296044 2 7.41666666666667 68 -1 0.34900955730632 -0.5 -0.5 2869 1
i 6 6.00272851296044 2 8 68 -1 -0.29223045529617 -0.5 -0.5 2869 1
i 4 6.00272851296044 2 6 68 -1 0.31895560716019 -0.5 -0.5 2869 1
i 4 6.00272851296044 2 8.58333333333333 68 -1 0.06977782153522 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 8.91666666666667 68 -1 -0.29548766712903 -0.5 -0.5 367232 1
i 4 6.00272851296044 2 8.58333333333333 68 -1 -0.29607401394919 -0.5 -0.5 367232 1
i 4 6.27557980900409 2 6 68 -1 0.41244512938067 -0.5 -0.5 2869 1
i 4 6.27557980900409 2 8.58333333333333 68 -1 -0.25419225406721 -0.5 -0.5 367232 1
i 4 6.54843110504775 2 6 68 -1 0.48954409500149 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 6.33333333333333 68 -1 0.15617574379778 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 6 68 -1 0.28424437131275 -0.5 -0.5 2869 1
i 4 6.54843110504775 2 8.58333333333333 68 -1 -0.03422806840322 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 6 68 -1 0.17743930232672 -0.5 -0.5 2869 1
i 5 6.82128240109141 2 6 68 -1 0.39051140076324 -0.5 -0.5 2869 1
i 6 6.82128240109141 2 6.66666666666667 68 -1 -0.35958396239199 -0.5 -0.5 2869 1
i 6 6.82128240109141 2 7.16666666666667 68 -1 -0.32403984639007 -0.5 -0.5 2869 1
i 5 6.82128240109141 2 7.66666666666667 68 -1 -0.27743098952579 -0.5 -0.5 2869 1
i 4 6.82128240109141 2 6.33333333333333 68 -1 0.23461598486145 -0.5 -0.5 2869 1
i 4 6.82128240109141 2 8.58333333333333 68 -1 -0.26542657382249 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 8.91666666666667 68 -1 0.33399113938374 -0.5 -0.5 367232 1
i 4 6.82128240109141 2 8.58333333333333 68 -1 0.12729731247808 -0.5 -0.5 367232 1
i 4 7.09413369713506 2 6.33333333333333 68 -1 -0.48867583601142 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 6.66666666666667 68 -1 -0.44403472684939 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 6.33333333333333 68 -1 -0.48072964656783 -0.5 -0.5 2869 1
i 4 7.09413369713506 2 8.58333333333333 68 -1 0.14308227399143 -0.5 -0.5 367232 1
i 5 7.09413369713506 2 8.58333333333333 68 -1 -0.16173757814946 -0.5 -0.5 367232 1
i 6 7.09413369713506 2 9.25 68 -1 -0.45736828584617 -0.5 -0.5 367232 1
i 5 7.09413369713506 2 9.75 68 -1 -0.30446004132904 -0.5 -0.5 367232 1
i 5 7.09413369713506 2 10.33333333333333 68 -1 0.44818053578986 -0.5 -0.5 367232 1
i 4 7.09413369713506 2 8.33333333333333 68 -1 0.05449553678191 -0.5 -0.5 367232 1
i 4 7.36698499317872 2 6.33333333333333 68 -1 -0.35876444844106 -0.5 -0.5 2869 1
i 4 7.36698499317872 2 6 68 -1 0.23047760425513 -0.5 -0.5 2869 1
i 4 7.36698499317872 2 8.33333333333333 68 -1 -0.02021482827388 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 6 68 -1 -0.3412498909809 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 6.33333333333333 68 -1 0.48283778612083 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 6 68 -1 0.47588250392508 -0.5 -0.5 2869 1
i 4 7.63983628922237 2 8.33333333333333 68 -1 -0.01601262530921 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 8.58333333333333 68 -1 0.25776537578471 -0.5 -0.5 367232 1
i 4 7.63983628922237 2 8.33333333333333 68 -1 -0.44992039322629 -0.5 -0.5 367232 1
i 4 7.91268758526603 2 6 68 -1 -0.33972237297183 -0.5 -0.5 2869 1
i 4 7.91268758526603 2 8.33333333333333 68 -1 0.29041239851859 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 8.33333333333333 68 -1 0.44279220690401 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 8.91666666666667 68 -1 -0.14022912722958 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 9.5 68 -1 -0.06361211959464 -0.5 -0.5 367232 1
i 6 7.91268758526603 2 10 68 -1 0.49299427334118 -0.5 -0.5 367232 1
i 4 7.91268758526603 2 8.58333333333333 68 -1 -0.25266980620721 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 6 68 -1 0.4497074417905 -0.5 -0.5 2869 1
i 4 8.18553888130969 2 8.58333333333333 68 -1 0.18499659090834 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 8.91666666666667 68 -1 0.13548541861372 -0.5 -0.5 367232 1
i 4 8.18553888130969 2 8.58333333333333 68 -1 -0.45501535951665 -0.5 -0.5 367232 1
i 4 8.45839017735334 2 6 68 -1 -0.12456993854246 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 6.33333333333333 68 -1 0.11280671449844 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 6 68 -1 0.16439878357848 -0.5 -0.5 2869 1
i 4 8.45839017735334 2 8.58333333333333 68 -1 0.48732516981196 -0.5 -0.5 367232 1
i 4 8.45839017735334 2 8.33333333333333 68 -1 -0.27611068748882 -0.5 -0.5 367232 1
i 4 8.731241473397 2 6 68 -1 0.18192897825887 -0.5 -0.5 2869 1
i 6 8.731241473397 2 6 68 -1 -0.25985194198893 -0.5 -0.5 2869 1
i 6 8.731241473397 2 6.66666666666667 68 -1 0.2391218985775 -0.5 -0.5 2869 1
i 6 8.731241473397 2 7.16666666666667 68 -1 0.28125309488866 -0.5 -0.5 2869 1
i 6 8.731241473397 2 7.66666666666667 68 -1 0.15210823853822 -0.5 -0.5 2869 1
i 4 8.731241473397 2 8.33333333333333 68 -1 -0.3121826127393 -0.5 -0.5 367232 1
i 4 8.731241473397 2 8.58333333333333 68 -1 0.04205342999956 -0.5 -0.5 367232 1
i 4 8.731241473397 2 8.33333333333333 68 -1 -0.15142108131591 -0.5 -0.5 367232 1
i 4 9.00409276944066 2 6 68 -1 -0.35242220489835 -0.5 -0.5 2869 1
i 4 9.00409276944066 2 8.33333333333333 68 -1 0.3913718058936 -0.5 -0.5 367232 1
i 4 9.27694406548431 2 6 68 -1 0.0724707647261 -0.5 -0.5 2869 1
i 4 9.27694406548431 2 8.33333333333333 68 -1 -0.19820390130181 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 6 68 -1 -0.16235741202255 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 6.33333333333333 68 -1 0.07348237623688 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 6 68 -1 -0.47499359563935 -0.5 -0.5 2869 1
i 4 9.54979536152797 2 8.33333333333333 68 -1 -0.44442838404251 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 8.58333333333333 68 -1 0.34218136317221 -0.5 -0.5 367232 1
i 4 9.54979536152797 2 8.33333333333333 68 -1 0.02471737893079 -0.5 -0.5 367232 1
i 4 9.82264665757162 2 6 68 -1 -0.04216387586816 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 6 68 -1 0.14460732817738 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 6.66666666666667 68 -1 -0.03578257309696 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 7.16666666666667 68 -1 0.22638579572586 -0.5 -0.5 2869 1
i 6 9.82264665757162 2 7.66666666666667 68 -1 -0.42595436253485 -0.5 -0.5 2869 1
i 4 9.82264665757162 2 6.33333333333333 68 -1 -0.48314694355053 -0.5 -0.5 2869 1
i 4 9.82264665757162 2 8.33333333333333 68 -1 -0.30644443841867 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 8.33333333333333 68 -1 -0.10311826921858 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 8.91666666666667 68 -1 0.38856270008845 -0.5 -0.5 367232 1
i 6 9.82264665757162 2 9.5 68 -1 0.38946709461538 -0.5 -0.5 367232 1
i 5 9.82264665757162 2 10 68 -1 -0.24691912188002 -0.5 -0.5 367232 1
i 4 10.09549795361528 2 6.33333333333333 68 -1 -0.48943908589981 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 6.66666666666667 68 -1 0.44261583399539 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 6.33333333333333 68 -1 0.18646583868548 -0.5 -0.5 2869 1
i 4 10.09549795361528 2 8.33333333333333 68 -1 0.24386513843633 -0.5 -0.5 367232 1
i 4 10.36834924965894 2 6.33333333333333 68 -1 0.05980609460574 -0.5 -0.5 2869 1
i 4 10.36834924965894 2 6 68 -1 0.35711424058727 -0.5 -0.5 2869 1
i 4 10.36834924965894 2 8.33333333333333 68 -1 0.4435604230911 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 6 68 -1 0.48518232425768 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 6.33333333333333 68 -1 0.48105770353538 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 6 68 -1 -0.12813502414481 -0.5 -0.5 2869 1
i 4 10.64120054570259 2 8.33333333333333 68 -1 -0.29770101463002 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 8.58333333333333 68 -1 0.48446535348534 -0.5 -0.5 367232 1
i 4 10.64120054570259 2 8.33333333333333 68 -1 0.09056679866408 -0.5 -0.5 367232 1
i 4 10.91405184174625 2 6 68 -1 -0.34679631710705 -0.5 -0.5 2869 1
i 4 10.91405184174625 2 8.33333333333333 68 -1 -0.29027184709745 -0.5 -0.5 367232 1
i 6 10.91405184174625 2 8.33333333333333 68 -1 -0.34204010493128 -0.5 -0.5 367232 1
i 5 10.91405184174625 2 8.91666666666667 68 -1 -0.27089490986074 -0.5 -0.5 367232 1
i 5 10.91405184174625 2 9.5 68 -1 -0.2244066354558 -0.5 -0.5 367232 1
i 6 10.91405184174625 2 10 68 -1 0.3392030444215 -0.5 -0.5 367232 1
i 4 10.91405184174625 2 8.58333333333333 68 -1 0.13872450345832 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 6 68 -1 0.06313381118637 -0.5 -0.5 2869 1
i 4 11.1869031377899 2 8.58333333333333 68 -1 0.14954680127145 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 8.91666666666667 68 -1 0.03463037743025 -0.5 -0.5 367232 1
i 4 11.1869031377899 2 8.58333333333333 68 -1 0.07187843911232 -0.5 -0.5 367232 1
i 4 11.45975443383356 2 6 68 -1 0.33148327581339 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 6.33333333333333 68 -1 -0.31583589917885 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 6 68 -1 -0.39568702233494 -0.5 -0.5 2869 1
i 4 11.45975443383356 2 8.58333333333333 68 -1 0.03503274919855 -0.5 -0.5 367232 1
i 4 11.45975443383356 2 8.33333333333333 68 -1 0.27381541681874 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 6 68 -1 -0.13855322496482 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 6 68 -1 -0.31694024332965 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6.66666666666667 68 -1 -0.07831237883957 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.16666666666667 68 -1 0.0726952493142 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 7.66666666666667 68 -1 0.48230358496174 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6 68 -1 0.19054314038068 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 6.66666666666667 68 -1 -0.35059324822635 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.16666666666667 68 -1 0.37034170315173 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 7.66666666666667 68 -1 0.33700955325613 -0.5 -0.5 2869 1
i 5 11.73260572987722 2 6 68 -1 0.31652034502397 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 6.66666666666667 68 -1 -0.17656004500901 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.16666666666667 68 -1 0.4996270425447 -0.5 -0.5 2869 1
i 6 11.73260572987722 2 7.66666666666667 68 -1 -0.02798369207919 -0.5 -0.5 2869 1
i 4 11.73260572987722 2 6.33333333333333 68 -1 0.37605351167184 -0.5 -0.5 2869 1
i 4 11.73260572987722 2 8.33333333333333 68 -1 0.02838584376623 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 8.58333333333333 68 -1 -0.4067146288735 -0.5 -0.5 367232 1
i 4 11.73260572987722 2 8.33333333333333 68 -1 -0.15372094669193 -0.5 -0.5 367232 1
i 4 12.00545702592087 2 6.33333333333333 68 -1 -0.30986477608394 -0.5 -0.5 2869 1
i 4 12.00545702592087 2 8.33333333333333 68 -1 0.43163351887104 -0.5 -0.5 367232 1
i 4 12.27830832196453 2 6.33333333333333 68 -1 0.04024783875514 -0.5 -0.5 2869 1
i 4 12.27830832196453 2 8.33333333333333 68 -1 0.32439085900384 -0.5 -0.5 367232 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 -0.06326269239199 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 8 68 -1 -0.31362534644596 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 -0.46444004217496 -0.5 -0.5 2869 1
i 3 12.55115961800818 2 7.66666666666667 68 -1 0.47087820689292 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.33333333333333 68 -1 -0.30735298000373 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.66666666666667 68 -1 -0.36268090506122 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 6.33333333333333 68 -1 0.48455486476131 -0.5 -0.5 2869 1
i 4 12.55115961800818 2 8.33333333333333 68 -1 0.42903439901464 -0.5 -0.5 367232 1
i 4 12.55115961800818 2 8.58333333333333 68 -1 0.13548640253835 -0.5 -0.5 367232 1
i 4 12.55115961800818 2 8.33333333333333 68 -1 0.278174187064 -0.5 -0.5 367232 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 0.40758333468284 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 0.44542441325406 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 8 68 -1 -0.26788008180982 -0.5 -0.5 2869 1
i 3 12.82401091405184 2 7.66666666666667 68 -1 0.16357964520299 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 6.33333333333333 68 -1 0.30455308336747 -0.5 -0.5 2869 1
i 5 12.82401091405184 2 6.33333333333333 68 -1 -0.35925816947291 -0.5 -0.5 2869 1
i 6 12.82401091405184 2 6.91666666666667 68 -1 0.4960135536856 -0.5 -0.5 2869 1
i 6 12.82401091405184 2 7.41666666666667 68 -1 0.41576011027156 -0.5 -0.5 2869 1
i 5 12.82401091405184 2 8 68 -1 -0.41335629829902 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 6.66666666666667 68 -1 -0.35100372030935 -0.5 -0.5 2869 1
i 4 12.82401091405184 2 8.33333333333333 68 -1 -0.44761438840228 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 8.33333333333333 68 -1 0.17185098599405 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 8.91666666666667 68 -1 -0.40338331084721 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 9.5 68 -1 0.33517164775233 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 -0.44076056806482 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 8.33333333333333 68 -1 0.0066834172711 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.91666666666667 68 -1 0.08288421530096 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 9.5 68 -1 -0.46951703201649 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 0.38984515408235 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 8.33333333333333 68 -1 -0.39951061901873 -0.5 -0.5 367232 1
i 5 12.82401091405184 2 8.91666666666667 68 -1 -0.47773499391384 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 9.5 68 -1 -0.01332401039245 -0.5 -0.5 367232 1
i 6 12.82401091405184 2 10 68 -1 -0.1334272334859 -0.5 -0.5 367232 1
i 4 12.82401091405184 2 8.58333333333333 68 -1 -0.47393302913694 -0.5 -0.5 367232 1
i 3 13.0968622100955 2 7.66666666666667 68 -1 0.27051052863755 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 7.66666666666667 68 -1 0.13438057115873 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 8.33333333333333 68 -1 -0.26591223327425 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 8.75 68 -1 -0.23397734885798 -0.5 -0.5 2869 1
i 5 13.0968622100955 2 9.41666666666667 68 -1 -0.1007815075865 -0.5 -0.5 2869 1
i 3 13.0968622100955 2 8 68 -1 -0.48799211123257 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.66666666666667 68 -1 0.03799596774237 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.91666666666667 68 -1 -0.33185992123697 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 6.66666666666667 68 -1 0.25986295644622 -0.5 -0.5 2869 1
i 4 13.0968622100955 2 8.58333333333333 68 -1 -0.21226732949283 -0.5 -0.5 367232 1
i 3 13.36971350613916 2 8 68 -1 0.42083628976006 -0.5 -0.5 2869 1
i 3 13.36971350613916 2 8.33333333333333 68 -1 0.38782849692815 -0.5 -0.5 2869 1
i 3 13.36971350613916 2 8 68 -1 0.27887377972497 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 6.66666666666667 68 -1 -0.47290734243913 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 6.33333333333333 68 -1 0.18623807040559 -0.5 -0.5 2869 1
i 4 13.36971350613916 2 8.58333333333333 68 -1 -0.04993674257785 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 8 68 -1 0.42633017549703 -0.5 -0.5 2869 1
i 3 13.64256480218281 2 7.66666666666667 68 -1 -0.30625271976406 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.33333333333333 68 -1 -0.18865798742713 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.66666666666667 68 -1 0.15064759863401 -0.5 -0.5 2869 1
i 4 13.64256480218281 2 6.33333333333333 68 -1 -0.133406385918 -0.5 -0.5 2869 1
i 3 13.64256480218281 2 10 68 -1 0.32099306268784 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 10.33333333333333 68 -1 -0.21084906458681 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 10 68 -1 0.35279195837457 -0.5 -0.5 367232 1
i 3 13.64256480218281 2 10 68 -1 0.3157388081128 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.58333333333333 68 -1 0.4714730559706 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.91666666666667 68 -1 -0.21554040133475 -0.5 -0.5 367232 1
i 4 13.64256480218281 2 8.58333333333333 68 -1 0.29724518550789 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 7.66666666666667 68 -1 -0.29577728455365 -0.5 -0.5 2869 1
i 3 13.91541609822647 2 8 68 -1 -0.23872110469291 -0.5 -0.5 2869 1
i 4 13.91541609822647 2 7.66666666666667 68 -1 0.18953833871241 -0.5 -0.5 2869 1
i 4 13.91541609822647 2 6.33333333333333 68 -1 0.08057549767102 -0.5 -0.5 2869 1
i 3 13.91541609822647 2 10 68 -1 0.3617604302403 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 10 68 -1 0.28046512796143 -0.5 -0.5 367232 1
i 3 13.91541609822647 2 10.33333333333333 68 -1 -0.0935438174138 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 10 68 -1 -0.30915098479289 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 8.58333333333333 68 -1 0.34382284311895 -0.5 -0.5 367232 1
i 5 13.91541609822647 2 8.58333333333333 68 -1 0.01640145016515 -0.5 -0.5 367232 1
i 6 13.91541609822647 2 9.25 68 -1 -0.0556116088538 -0.5 -0.5 367232 1
i 6 13.91541609822647 2 9.75 68 -1 -0.10518438077723 -0.5 -0.5 367232 1
i 5 13.91541609822647 2 10.33333333333333 68 -1 0.31647836661671 -0.5 -0.5 367232 1
i 4 13.91541609822647 2 8.91666666666667 68 -1 -0.33159557911819 -0.5 -0.5 367232 1
i 3 14.18826739427012 2 7.66666666666667 68 -1 0.4893873451474 -0.5 -0.5 2869 1
i 4 14.18826739427012 2 6.33333333333333 68 -1 -0.0494554945091 -0.5 -0.5 2869 1
i 3 14.18826739427012 2 10 68 -1 0.30608129888032 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 10 68 -1 -0.01036204958183 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 10.58333333333333 68 -1 -0.17261518719701 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 11.25 68 -1 -0.15429766471185 -0.5 -0.5 367232 1
i 5 14.18826739427012 2 11.75 68 -1 -0.31088453632391 -0.5 -0.5 367232 1
i 3 14.18826739427012 2 10.33333333333333 68 -1 -0.29764574897944 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 8.91666666666667 68 -1 -0.17181409631846 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 9.25 68 -1 -0.23465271892645 -0.5 -0.5 367232 1
i 4 14.18826739427012 2 8.91666666666667 68 -1 -0.37728156297054 -0.5 -0.5 367232 1
i 3 14.46111869031378 2 7.66666666666667 68 -1 0.39704868687136 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.33333333333333 68 -1 0.01743036045949 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.66666666666667 68 -1 -0.02085055395177 -0.5 -0.5 2869 1
i 4 14.46111869031378 2 6.33333333333333 68 -1 0.06872554069044 -0.5 -0.5 2869 1
i 3 14.46111869031378 2 10.33333333333333 68 -1 -0.02582895166698 -0.5 -0.5 367232 1
i 4 14.46111869031378 2 10.58333333333333 68 -1 -0.46470407198187 -0.5 -0.5 367232 1
i 3 14.46111869031378 2 10.33333333333333 68 -1 0.22048491381524 -0.5 -0.5 367232 1
i 4 14.46111869031378 2 8.91666666666667 68 -1 -0.43365532637229 -0.5 -0.5 367232 1
i 4 14.46111869031378 2 8.58333333333333 68 -1 -0.38569014816603 -0.5 -0.5 367232 1
i 3 14.73396998635744 2 7.66666666666667 68 -1 -0.00904495390604 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 8 68 -1 -0.40198832959022 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 7.66666666666667 68 -1 -0.23979189227411 -0.5 -0.5 2869 1
i 4 14.73396998635744 2 6.33333333333333 68 -1 -0.26786902018839 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 6.33333333333333 68 -1 0.46436623869565 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 6.91666666666667 68 -1 -0.37918707277336 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 7.41666666666667 68 -1 0.0412216756652 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 8 68 -1 0.43819766385532 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 6.33333333333333 68 -1 -0.45339704885056 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 6.91666666666667 68 -1 0.43931298247067 -0.5 -0.5 2869 1
i 5 14.73396998635744 2 7.41666666666667 68 -1 0.02964292316769 -0.5 -0.5 2869 1
i 6 14.73396998635744 2 8 68 -1 0.39459382315727 -0.5 -0.5 2869 1
i 4 14.73396998635744 2 6.66666666666667 68 -1 -0.21988440548005 -0.5 -0.5 2869 1
i 3 14.73396998635744 2 10.33333333333333 68 -1 -0.22651425730177 -0.5 -0.5 367232 1
i 3 14.73396998635744 2 10 68 -1 -0.30645411763173 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.58333333333333 68 -1 -0.08502876948977 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.91666666666667 68 -1 -0.45847443268345 -0.5 -0.5 367232 1
i 4 14.73396998635744 2 8.58333333333333 68 -1 -0.30509297786547 -0.5 -0.5 367232 1
i 4 15.00682128240109 2 7.66666666666667 68 -1 -0.39759192131895 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 7.66666666666667 68 -1 0.34569183966789 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 8.33333333333333 68 -1 -0.05444804944552 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 8.75 68 -1 0.43326673196303 -0.5 -0.5 2869 1
i 5 15.00682128240109 2 9.41666666666667 68 -1 0.39629700103862 -0.5 -0.5 2869 1
i 4 15.00682128240109 2 6.66666666666667 68 -1 -0.21020802854413 -0.5 -0.5 2869 1
i 4 15.00682128240109 2 10 68 -1 0.41854277865227 -0.5 -0.5 367232 1
i 3 15.00682128240109 2 10.33333333333333 68 -1 0.47309614046144 -0.5 -0.5 367232 1
i 3 15.00682128240109 2 10 68 -1 0.44196495189665 -0.5 -0.5 367232 1
i 4 15.00682128240109 2 8.58333333333333 68 -1 -0.10160049318422 -0.5 -0.5 367232 1
i 4 15.27967257844475 2 6.66666666666667 68 -1 -0.40053968554569 -0.5 -0.5 2869 1
i 4 15.27967257844475 2 6.91666666666667 68 -1 0.02853636728902 -0.5 -0.5 2869 1
i 4 15.27967257844475 2 6.66666666666667 68 -1 0.07828240214825 -0.5 -0.5 2869 1
i 4 15.27967257844475 2 10 68 -1 -0.25628499597448 -0.5 -0.5 367232 1
i 4 15.27967257844475 2 8.58333333333333 68 -1 -0.02370386165878 -0.5 -0.5 367232 1
i 3 15.5525238744884 2 8 68 -1 -0.28467349689397 -0.5 -0.5 2869 1
i 3 15.5525238744884 2 8.33333333333333 68 -1 0.04085120871435 -0.5 -0.5 2869 1
i 3 15.5525238744884 2 8 68 -1 0.06367275785853 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 6.66666666666667 68 -1 -0.39312548895592 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 6.66666666666667 68 -1 -0.17341648113802 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 7.33333333333333 68 -1 -0.35677393727271 -0.5 -0.5 2869 1
i 6 15.5525238744884 2 7.66666666666667 68 -1 -0.16902393467727 -0.5 -0.5 2869 1
i 5 15.5525238744884 2 8.33333333333333 68 -1 -0.15237753307244 -0.5 -0.5 2869 1
i 4 15.5525238744884 2 6.91666666666667 68 -1 0.3482248178524 -0.5 -0.5 2869 1
i 3 15.5525238744884 2 10 68 -1 0.10557139590284 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.58333333333333 68 -1 0.08831707000062 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.91666666666667 68 -1 -0.33004671260121 -0.5 -0.5 367232 1
i 4 15.5525238744884 2 8.58333333333333 68 -1 0.39979779079931 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 8 68 -1 0.48824028026428 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 6.91666666666667 68 -1 0.09357436555122 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 7.33333333333333 68 -1 0.21990885641005 -0.5 -0.5 2869 1
i 4 15.82537517053206 2 6.91666666666667 68 -1 -0.43865023690975 -0.5 -0.5 2869 1
i 3 15.82537517053206 2 10 68 -1 0.00147243506333 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 10.33333333333333 68 -1 0.18297741785624 -0.5 -0.5 367232 1
i 3 15.82537517053206 2 10 68 -1 0.05337524653712 -0.5 -0.5 367232 1
i 4 15.82537517053206 2 8.58333333333333 68 -1 -0.25425516108847 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 8.58333333333333 68 -1 -0.03450999956587 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.25 68 -1 -0.11522804611529 -0.5 -0.5 367232 1
i 5 15.82537517053206 2 9.75 68 -1 0.22985212506066 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 10.33333333333333 68 -1 -0.1941162875 -0.5 -0.5 367232 1
i 5 15.82537517053206 2 8.58333333333333 68 -1 -0.24614556550131 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.25 68 -1 0.24715499136001 -0.5 -0.5 367232 1
i 6 15.82537517053206 2 9.75 68 -1 0.20880002070516 -0.5 -0.5 367232 1
i 5 15.82537517053206 2 10.33333333333333 68 -1 0.0294272618916 -0.5 -0.5 367232 1
i 4 15.82537517053206 2 8.91666666666667 68 -1 0.24503339784646 -0.5 -0.5 367232 1
i 4 16.09822646657571 2 6.91666666666667 68 -1 0.1893081212282 -0.5 -0.5 2869 1
i 4 16.09822646657571 2 6.66666666666667 68 -1 -0.02634633173443 -0.5 -0.5 2869 1
i 3 16.09822646657571 2 10 68 -1 0.24931316087369 -0.5 -0.5 367232 1
i 4 16.09822646657571 2 10 68 -1 0.46142213043367 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 10.58333333333333 68 -1 0.10640331837189 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 11.25 68 -1 -0.43881377707515 -0.5 -0.5 367232 1
i 5 16.09822646657571 2 11.75 68 -1 0.22858812118956 -0.5 -0.5 367232 1
i 4 16.09822646657571 2 8.91666666666667 68 -1 0.25175595955355 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 6.66666666666667 68 -1 0.44124213311745 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 6.91666666666667 68 -1 -0.00823548003278 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 6.66666666666667 68 -1 0.08112405711933 -0.5 -0.5 2869 1
i 4 16.37107776261937 2 8.91666666666667 68 -1 0.11523162017958 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 9.25 68 -1 0.31602200398322 -0.5 -0.5 367232 1
i 4 16.37107776261937 2 8.91666666666667 68 -1 0.16767758142034 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 6.66666666666667 68 -1 0.31442114399172 -0.5 -0.5 2869 1
i 4 16.64392905866303 2 10.33333333333333 68 -1 -0.10705086371265 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 10.58333333333333 68 -1 0.29605236914873 -0.5 -0.5 367232 1
i 3 16.64392905866303 2 10.33333333333333 68 -1 -0.27979032898166 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 8.91666666666667 68 -1 0.0224019845463 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 8.91666666666667 68 -1 -0.06966514367102 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 9.5 68 -1 0.46199539306156 -0.5 -0.5 367232 1
i 6 16.64392905866303 2 10 68 -1 -0.34536310327729 -0.5 -0.5 367232 1
i 5 16.64392905866303 2 10.58333333333333 68 -1 0.22083140324129 -0.5 -0.5 367232 1
i 4 16.64392905866303 2 9.25 68 -1 -0.44574906576293 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 6.66666666666667 68 -1 -0.18042521926498 -0.5 -0.5 2869 1
i 3 16.91678035470668 2 10.33333333333333 68 -1 -0.35026741246124 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.25 68 -1 -0.38261869537478 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.5 68 -1 -0.17234149379972 -0.5 -0.5 367232 1
i 4 16.91678035470668 2 9.25 68 -1 -0.28865020074636 -0.5 -0.5 367232 1
i 4 17.18963165075034 2 6.66666666666667 68 -1 -0.10993795763363 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 6.91666666666667 68 -1 -0.31525881327761 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 6.66666666666667 68 -1 -0.41341745761257 -0.5 -0.5 2869 1
i 4 17.18963165075034 2 9.25 68 -1 0.09564922503791 -0.5 -0.5 367232 1
i 4 17.18963165075034 2 8.91666666666667 68 -1 0.13191076923474 -0.5 -0.5 367232 1
i 4 17.462482946794 2 6.66666666666667 68 -1 0.16621860438629 -0.5 -0.5 2869 1
i 5 17.462482946794 2 6.66666666666667 68 -1 -0.21881375008169 -0.5 -0.5 2869 1
i 5 17.462482946794 2 7.33333333333333 68 -1 -0.43772985069136 -0.5 -0.5 2869 1
i 6 17.462482946794 2 7.66666666666667 68 -1 -0.4017569605367 -0.5 -0.5 2869 1
i 5 17.462482946794 2 8.33333333333333 68 -1 0.43271986606596 -0.5 -0.5 2869 1
i 4 17.462482946794 2 6.33333333333333 68 -1 0.40967842165265 -0.5 -0.5 2869 1
i 4 17.462482946794 2 8.91666666666667 68 -1 0.10336906415282 -0.5 -0.5 367232 1
i 4 17.462482946794 2 9.25 68 -1 -0.34299226874482 -0.5 -0.5 367232 1
i 4 17.462482946794 2 8.91666666666667 68 -1 -0.00533306871897 -0.5 -0.5 367232 1
i 4 17.73533424283766 2 6.33333333333333 68 -1 -0.13883746056562 -0.5 -0.5 2869 1
i 4 17.73533424283766 2 8.91666666666667 68 -1 0.46505630363348 -0.5 -0.5 367232 1
i 4 18.00818553888131 2 6.33333333333333 68 -1 -0.05672605208044 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 6.66666666666667 68 -1 0.06827963481694 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 6.33333333333333 68 -1 -0.26536530425942 -0.5 -0.5 2869 1
i 4 18.00818553888131 2 8.91666666666667 68 -1 0.24109976906311 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 6.33333333333333 68 -1 0.06379233370681 -0.5 -0.5 2869 1
i 6 18.28103683492497 2 6.33333333333333 68 -1 0.33385756678076 -0.5 -0.5 2869 1
i 5 18.28103683492497 2 6.91666666666667 68 -1 -0.3994499467916 -0.5 -0.5 2869 1
i 6 18.28103683492497 2 7.41666666666667 68 -1 -0.20164130008978 -0.5 -0.5 2869 1
i 6 18.28103683492497 2 8 68 -1 -0.10447755066513 -0.5 -0.5 2869 1
i 4 18.28103683492497 2 6.66666666666667 68 -1 -0.06240489745011 -0.5 -0.5 2869 1
i 4 18.28103683492497 2 8.91666666666667 68 -1 -0.07981591468842 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 9.25 68 -1 0.3539332649918 -0.5 -0.5 367232 1
i 4 18.28103683492497 2 8.91666666666667 68 -1 -0.48967603204396 -0.5 -0.5 367232 1
i 4 18.55388813096862 2 6.66666666666667 68 -1 0.40186298720937 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 6.91666666666667 68 -1 -0.03613621468453 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 6.66666666666667 68 -1 -0.06567958612111 -0.5 -0.5 2869 1
i 4 18.55388813096862 2 8.91666666666667 68 -1 0.47599615924503 -0.5 -0.5 367232 1
i 6 18.55388813096862 2 8.91666666666667 68 -1 0.40376532548284 -0.5 -0.5 367232 1
i 6 18.55388813096862 2 9.5 68 -1 0.14179169999762 -0.5 -0.5 367232 1
i 5 18.55388813096862 2 10 68 -1 0.05108931495014 -0.5 -0.5 367232 1
i 5 18.55388813096862 2 10.58333333333333 68 -1 -0.48726103525163 -0.5 -0.5 367232 1
i 4 18.55388813096862 2 8.58333333333333 68 -1 -0.42819638499148 -0.5 -0.5 367232 1
i 4 18.82673942701228 2 6.66666666666667 68 -1 0.34749722032426 -0.5 -0.5 2869 1
i 4 18.82673942701228 2 6.33333333333333 68 -1 0.01336120695059 -0.5 -0.5 2869 1
i 4 18.82673942701228 2 8.58333333333333 68 -1 0.20534893290732 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 6.33333333333333 68 -1 -0.37194106655298 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 6.66666666666667 68 -1 0.17703079536418 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 6.33333333333333 68 -1 -0.43159307808775 -0.5 -0.5 2869 1
i 4 19.09959072305593 2 8.58333333333333 68 -1 -0.34602989606393 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 8.91666666666667 68 -1 -0.24654398970113 -0.5 -0.5 367232 1
i 4 19.09959072305593 2 8.58333333333333 68 -1 -0.19928253690244 -0.5 -0.5 367232 1
i 4 19.37244201909959 2 6.33333333333333 68 -1 0.40407871224686 -0.5 -0.5 2869 1
i 4 19.37244201909959 2 8.58333333333333 68 -1 0.21138665293715 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 8.58333333333333 68 -1 -0.14030158058267 -0.5 -0.5 367232 1
i 5 19.37244201909959 2 9.25 68 -1 0.44882120803868 -0.5 -0.5 367232 1
i 6 19.37244201909959 2 9.75 68 -1 -0.40740493613269 -0.5 -0.5 367232 1
i 5 19.37244201909959 2 10.33333333333333 68 -1 0.10000272276882 -0.5 -0.5 367232 1
i 4 19.37244201909959 2 8.91666666666667 68 -1 0.10557646290883 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 6.33333333333333 68 -1 0.48425817246469 -0.5 -0.5 2869 1
i 4 19.64529331514324 2 8.91666666666667 68 -1 0.44631239604855 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 9.25 68 -1 0.1025134310258 -0.5 -0.5 367232 1
i 4 19.64529331514324 2 8.91666666666667 68 -1 0.40304840516513 -0.5 -0.5 367232 1
i 4 19.9181446111869 2 6.33333333333333 68 -1 0.39040868087486 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 6.66666666666667 68 -1 0.40677208106046 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 6.33333333333333 68 -1 -0.37022399502711 -0.5 -0.5 2869 1
i 4 19.9181446111869 2 8.91666666666667 68 -1 -0.41093820130072 -0.5 -0.5 367232 1
i 4 19.9181446111869 2 8.58333333333333 68 -1 0.30118430873728 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 6.33333333333333 68 -1 0.17560319019067 -0.5 -0.5 2869 1
i 6 20.19099590723056 2 6.33333333333333 68 -1 -0.33200470590746 -0.5 -0.5 2869 1
i 6 20.19099590723056 2 6.91666666666667 68 -1 -0.08860952899032 -0.5 -0.5 2869 1
i 5 20.19099590723056 2 7.41666666666667 68 -1 0.43460998900102 -0.5 -0.5 2869 1
i 6 20.19099590723056 2 8 68 -1 -0.19316782489193 -0.5 -0.5 2869 1
i 4 20.19099590723056 2 8.58333333333333 68 -1 0.14862793797913 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 8.91666666666667 68 -1 -0.35714909171861 -0.5 -0.5 367232 1
i 4 20.19099590723056 2 8.58333333333333 68 -1 -0.29572541403542 -0.5 -0.5 367232 1
i 4 20.46384720327422 2 6.33333333333333 68 -1 0.24618424955936 -0.5 -0.5 2869 1
i 4 20.46384720327422 2 8.58333333333333 68 -1 0.42516650921619 -0.5 -0.5 367232 1
i 4 20.73669849931787 2 6.33333333333333 68 -1 0.09148754371104 -0.5 -0.5 2869 1
i 4 20.73669849931787 2 8.58333333333333 68 -1 0.19818770222512 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 6.33333333333333 68 -1 0.0268428098307 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 6.66666666666667 68 -1 -0.39539961468118 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 6.33333333333333 68 -1 0.31090955827712 -0.5 -0.5 2869 1
i 4 21.00954979536153 2 8.58333333333333 68 -1 0.08225501860197 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 8.91666666666667 68 -1 0.06793128207054 -0.5 -0.5 367232 1
i 4 21.00954979536153 2 8.58333333333333 68 -1 0.3483986534985 -0.5 -0.5 367232 1
i 4 21.28240109140518 2 6.33333333333333 68 -1 0.18847084920891 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 6.33333333333333 68 -1 0.27453009660823 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 6.91666666666667 68 -1 0.0653769890854 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 7.41666666666667 68 -1 0.37220386423744 -0.5 -0.5 2869 1
i 6 21.28240109140518 2 8 68 -1 0.30540797951563 -0.5 -0.5 2869 1
i 4 21.28240109140518 2 6.66666666666667 68 -1 0.08978069579441 -0.5 -0.5 2869 1
i 4 21.28240109140518 2 8.58333333333333 68 -1 -0.40109791262815 -0.5 -0.5 367232 1
i 6 21.28240109140518 2 8.58333333333333 68 -1 0.49985436307029 -0.5 -0.5 367232 1
i 5 21.28240109140518 2 9.25 68 -1 -0.21871012750118 -0.5 -0.5 367232 1
i 6 21.28240109140518 2 9.75 68 -1 0.30945960046727 -0.5 -0.5 367232 1
i 6 21.28240109140518 2 10.33333333333333 68 -1 -0.44231452042281 -0.5 -0.5 367232 1
i 4 21.55525238744884 2 6.66666666666667 68 -1 -0.094339212274 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 6.91666666666667 68 -1 -0.08663498564975 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 6.66666666666667 68 -1 -0.11373246460638 -0.5 -0.5 2869 1
i 4 21.55525238744884 2 8.58333333333333 68 -1 0.45380939022297 -0.5 -0.5 367232 1
i 4 21.82810368349249 2 6.66666666666667 68 -1 0.38592825988128 -0.5 -0.5 2869 1
i 4 21.82810368349249 2 6.33333333333333 68 -1 -0.41995280673441 -0.5 -0.5 2869 1
i 4 21.82810368349249 2 8.58333333333333 68 -1 -0.05785570279445 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 6.33333333333333 68 -1 0.05099413079237 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 6.66666666666667 68 -1 -0.2046996022001 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 6.33333333333333 68 -1 0.13674212095657 -0.5 -0.5 2869 1
i 4 22.10095497953615 2 8.58333333333333 68 -1 -0.36276179811393 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 8.91666666666667 68 -1 -0.13033815572744 -0.5 -0.5 367232 1
i 4 22.10095497953615 2 8.58333333333333 68 -1 -0.10196816805675 -0.5 -0.5 367232 1
i 4 22.37380627557981 2 6.33333333333333 68 -1 -0.15157846391075 -0.5 -0.5 2869 1
i 4 22.37380627557981 2 8.58333333333333 68 -1 -0.26570377644603 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 8.58333333333333 68 -1 0.13458395144693 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 9.25 68 -1 -0.22445872286277 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 9.75 68 -1 0.16162705209094 -0.5 -0.5 367232 1
i 6 22.37380627557981 2 10.33333333333333 68 -1 0.07575295538711 -0.5 -0.5 367232 1
i 4 22.37380627557981 2 8.91666666666667 68 -1 0.19087354089764 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 6.33333333333333 68 -1 0.07042505150754 -0.5 -0.5 2869 1
i 4 22.64665757162346 2 8.91666666666667 68 -1 -0.32197223033894 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 9.25 68 -1 0.1928834140255 -0.5 -0.5 367232 1
i 4 22.64665757162346 2 8.91666666666667 68 -1 0.19301587381784 -0.5 -0.5 367232 1
i 4 22.91950886766712 2 6.33333333333333 68 -1 -0.17830912906837 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 6.66666666666667 68 -1 0.13993543411987 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 6.33333333333333 68 -1 -0.38592291788563 -0.5 -0.5 2869 1
i 4 22.91950886766712 2 8.91666666666667 68 -1 -0.07814771416044 -0.5 -0.5 367232 1
i 4 22.91950886766712 2 8.58333333333333 68 -1 -0.40600642373028 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 6.33333333333333 68 -1 -0.08736900667909 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 6.33333333333333 68 -1 0.35109527163105 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 6.91666666666667 68 -1 -0.06621285985614 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 7.41666666666667 68 -1 0.14398085367346 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 8 68 -1 -0.18169697435473 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 6.33333333333333 68 -1 0.27156363488188 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 6.91666666666667 68 -1 0.32130343708916 -0.5 -0.5 2869 1
i 5 23.19236016371078 2 7.41666666666667 68 -1 0.48604442018824 -0.5 -0.5 2869 1
i 6 23.19236016371078 2 8 68 -1 0.08991333054291 -0.5 -0.5 2869 1
i 4 23.19236016371078 2 6 68 -1 0.21336825002841 -0.5 -0.5 2869 1
i 4 23.19236016371078 2 8.58333333333333 68 -1 -0.46963634000172 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 8.91666666666667 68 -1 0.06149780164745 -0.5 -0.5 367232 1
i 4 23.19236016371078 2 8.58333333333333 68 -1 -0.22312244532675 -0.5 -0.5 367232 1
i 4 23.46521145975444 2 6 68 -1 -0.28301378930885 -0.5 -0.5 2869 1
i 4 23.46521145975444 2 8.58333333333333 68 -1 0.43282047279805 -0.5 -0.5 367232 1
i 4 23.73806275579809 2 6 68 -1 0.13743969191546 -0.5 -0.5 2869 1
i 4 23.73806275579809 2 8.58333333333333 68 -1 0.07989097514977 -0.5 -0.5 367232 1
i 3 24.01091405184175 2 8 68 -1 -0.23026502253188 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 8.33333333333333 68 -1 0.31209909163623 -0.5 -0.5 2869 1
i 3 24.01091405184175 2 8 68 -1 -0.36137148259016 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6 68 -1 -0.29484433682122 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6.33333333333333 68 -1 0.37131243832241 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 6 68 -1 0.13809928098249 -0.5 -0.5 2869 1
i 4 24.01091405184175 2 8.58333333333333 68 -1 -0.35431529198638 -0.5 -0.5 367232 1
i 4 24.01091405184175 2 8.91666666666667 68 -1 0.21863645685032 -0.5 -0.5 367232 1
i 4 24.01091405184175 2 8.58333333333333 68 -1 -0.47992519233455 -0.5 -0.5 367232 1
i 3 24.2837653478854 2 8 68 -1 -0.30547940208296 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 6 68 -1 0.19731545802915 -0.5 -0.5 2869 1
i 5 24.2837653478854 2 6 68 -1 -0.0505065192854 -0.5 -0.5 2869 1
i 5 24.2837653478854 2 6.66666666666667 68 -1 0.23516876786559 -0.5 -0.5 2869 1
i 5 24.2837653478854 2 7.16666666666667 68 -1 -0.4158339983433 -0.5 -0.5 2869 1
i 5 24.2837653478854 2 7.66666666666667 68 -1 -0.42174207116758 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 6.33333333333333 68 -1 0.07452208332921 -0.5 -0.5 2869 1
i 4 24.2837653478854 2 8.58333333333333 68 -1 -0.08776117921799 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 8.58333333333333 68 -1 0.09450167040617 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 9.25 68 -1 0.13323916506345 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 9.75 68 -1 0.48539120967377 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 10.33333333333333 68 -1 -0.30783079074771 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 8.58333333333333 68 -1 -0.2501631780325 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 9.25 68 -1 -0.22111017837303 -0.5 -0.5 367232 1
i 5 24.2837653478854 2 9.75 68 -1 -0.10211438111866 -0.5 -0.5 367232 1
i 6 24.2837653478854 2 10.33333333333333 68 -1 0.14299260580405 -0.5 -0.5 367232 1
i 4 24.2837653478854 2 8.33333333333333 68 -1 -0.29712433130191 -0.5 -0.5 367232 1
i 4 24.55661664392906 2 6.33333333333333 68 -1 -0.33681203107082 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 6.66666666666667 68 -1 -0.16964772557174 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 6.33333333333333 68 -1 0.08970340018428 -0.5 -0.5 2869 1
i 4 24.55661664392906 2 8.33333333333333 68 -1 -0.4738717214348 -0.5 -0.5 367232 1
i 4 24.82946793997271 2 6.33333333333333 68 -1 -0.18829251819868 -0.5 -0.5 2869 1
i 4 24.82946793997271 2 6 68 -1 -0.39549576080789 -0.5 -0.5 2869 1
i 4 24.82946793997271 2 8.33333333333333 68 -1 0.17371753375455 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 6 68 -1 -0.0335216335829 -0.5 -0.5 2869 1
i 4 25.10231923601637 2 6.33333333333333 68 -1 -0.00823146739473 -0.5 -0.5 2869 1
i 4 25.10231923601637 2 6 68 -1 0.19598217902153 -0.5 -0.5 2869 1
i 3 25.10231923601637 2 10.33333333333333 68 -1 -0.48202009962327 -0.5 -0.5 367232 1
i 3 25.10231923601637 2 10.58333333333333 68 -1 -0.32107809789778 -0.5 -0.5 367232 1
i 3 25.10231923601637 2 10.33333333333333 68 -1 -0.21590729307513 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.33333333333333 68 -1 0.25792120467124 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.58333333333333 68 -1 -0.45439500054422 -0.5 -0.5 367232 1
i 4 25.10231923601637 2 8.33333333333333 68 -1 0.26546604776536 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 6 68 -1 0.14754474009298 -0.5 -0.5 2869 1
i 3 25.37517053206002 2 10.33333333333333 68 -1 0.05435336773312 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 8.33333333333333 68 -1 -0.31381973449137 -0.5 -0.5 367232 1
i 5 25.37517053206002 2 8.33333333333333 68 -1 -0.08431922948241 -0.5 -0.5 367232 1
i 6 25.37517053206002 2 8.91666666666667 68 -1 0.28951186042412 -0.5 -0.5 367232 1
i 6 25.37517053206002 2 9.5 68 -1 0.03424205948919 -0.5 -0.5 367232 1
i 6 25.37517053206002 2 10 68 -1 0.36918520842168 -0.5 -0.5 367232 1
i 4 25.37517053206002 2 8.58333333333333 68 -1 -0.14544454216761 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 6 68 -1 0.18572174664216 -0.5 -0.5 2869 1
i 4 25.64802182810368 2 8.58333333333333 68 -1 -0.2596021985172 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 8.91666666666667 68 -1 -0.18168133722678 -0.5 -0.5 367232 1
i 4 25.64802182810368 2 8.58333333333333 68 -1 0.11794469341516 -0.5 -0.5 367232 1
i 4 25.92087312414734 2 6 68 -1 0.09691199947274 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 6.33333333333333 68 -1 -0.33203460866489 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 6 68 -1 -0.19650773420341 -0.5 -0.5 2869 1
i 4 25.92087312414734 2 8.58333333333333 68 -1 -0.39548364054438 -0.5 -0.5 367232 1
i 4 25.92087312414734 2 8.33333333333333 68 -1 -0.47592121308859 -0.5 -0.5 367232 1
i 4 26.193724420191 2 6 68 -1 -0.34751934859929 -0.5 -0.5 2869 1
i 5 26.193724420191 2 6 68 -1 0.12534872330913 -0.5 -0.5 2869 1
i 6 26.193724420191 2 6.66666666666667 68 -1 0.27426528567489 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.16666666666667 68 -1 -0.44856119341723 -0.5 -0.5 2869 1
i 5 26.193724420191 2 7.66666666666667 68 -1 0.38837587173337 -0.5 -0.5 2869 1
i 5 26.193724420191 2 6 68 -1 0.42283320748946 -0.5 -0.5 2869 1
i 6 26.193724420191 2 6.66666666666667 68 -1 0.25279892693629 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.16666666666667 68 -1 -0.47845789073032 -0.5 -0.5 2869 1
i 6 26.193724420191 2 7.66666666666667 68 -1 0.36925459240984 -0.5 -0.5 2869 1
i 4 26.193724420191 2 6.33333333333333 68 -1 0.14244421053897 -0.5 -0.5 2869 1
i 4 26.193724420191 2 8.33333333333333 68 -1 -0.19092948251248 -0.5 -0.5 367232 1
i 4 26.193724420191 2 8.58333333333333 68 -1 -0.18640772026932 -0.5 -0.5 367232 1
i 4 26.193724420191 2 8.33333333333333 68 -1 0.39861172006619 -0.5 -0.5 367232 1
i 4 26.46657571623465 2 6.33333333333333 68 -1 -0.11258281945984 -0.5 -0.5 2869 1
i 4 26.46657571623465 2 8.33333333333333 68 -1 -0.16753888378232 -0.5 -0.5 367232 1
i 4 26.73942701227831 2 6.33333333333333 68 -1 -0.28057635168141 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 6.66666666666667 68 -1 0.17183624714586 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 6.33333333333333 68 -1 0.49350547541467 -0.5 -0.5 2869 1
i 4 26.73942701227831 2 8.33333333333333 68 -1 -0.39296800514149 -0.5 -0.5 367232 1
i 3 27.01227830832196 2 7.66666666666667 68 -1 -0.02780006019953 -0.5 -0.5 2869 1
i 3 27.01227830832196 2 8 68 -1 0.37144934580902 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 7.66666666666667 68 -1 0.35169052079013 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 6.33333333333333 68 -1 -0.38862569482365 -0.5 -0.5 2869 1
i 5 27.01227830832196 2 6.33333333333333 68 -1 -0.14197340495314 -0.5 -0.5 2869 1
i 6 27.01227830832196 2 6.91666666666667 68 -1 -0.17039752233104 -0.5 -0.5 2869 1
i 6 27.01227830832196 2 7.41666666666667 68 -1 -0.25968892906764 -0.5 -0.5 2869 1
i 5 27.01227830832196 2 8 68 -1 0.48922232820812 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 6.66666666666667 68 -1 -0.21931173958532 -0.5 -0.5 2869 1
i 4 27.01227830832196 2 8.33333333333333 68 -1 0.09564862395028 -0.5 -0.5 367232 1
i 4 27.01227830832196 2 8.58333333333333 68 -1 -0.29758211149842 -0.5 -0.5 367232 1
i 4 27.01227830832196 2 8.33333333333333 68 -1 -0.48099586010722 -0.5 -0.5 367232 1
i 3 27.28512960436562 2 7.66666666666667 68 -1 -0.49148313223876 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.66666666666667 68 -1 0.36842548034557 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.91666666666667 68 -1 0.31484210176431 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 6.66666666666667 68 -1 0.12469844803715 -0.5 -0.5 2869 1
i 4 27.28512960436562 2 8.33333333333333 68 -1 -0.08654847608621 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 8.33333333333333 68 -1 -0.19205944531364 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 8.91666666666667 68 -1 0.36969807070279 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 9.5 68 -1 -0.03155157184114 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 10 68 -1 0.35003891778796 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 8.33333333333333 68 -1 -0.48620866426623 -0.5 -0.5 367232 1
i 6 27.28512960436562 2 8.91666666666667 68 -1 -0.46082628414134 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 9.5 68 -1 -0.22762957534342 -0.5 -0.5 367232 1
i 5 27.28512960436562 2 10 68 -1 -0.29266204945329 -0.5 -0.5 367232 1
i 4 27.28512960436562 2 8.58333333333333 68 -1 0.17898539373895 -0.5 -0.5 367232 1
i 4 27.55798090040928 2 6.66666666666667 68 -1 -0.37401162120171 -0.5 -0.5 2869 1
i 4 27.55798090040928 2 6.33333333333333 68 -1 -0.46032529660202 -0.5 -0.5 2869 1
i 4 27.55798090040928 2 8.58333333333333 68 -1 0.46506465778939 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 6.33333333333333 68 -1 -0.45002951766467 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 6.66666666666667 68 -1 -0.39584528704532 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 6.33333333333333 68 -1 0.33243556787905 -0.5 -0.5 2869 1
i 4 27.83083219645293 2 8.58333333333333 68 -1 0.14605683310553 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 8.91666666666667 68 -1 -0.47135431504209 -0.5 -0.5 367232 1
i 4 27.83083219645293 2 8.58333333333333 68 -1 -0.22252042523218 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 6.33333333333333 68 -1 0.19450724631269 -0.5 -0.5 2869 1
i 3 28.10368349249659 2 10 68 -1 -0.25024219009694 -0.5 -0.5 367232 1
i 3 28.10368349249659 2 10.33333333333333 68 -1 -0.23671855575318 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 10 68 -1 0.17882710580105 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 8.58333333333333 68 -1 -0.45773147212356 -0.5 -0.5 367232 1
i 6 28.10368349249659 2 8.58333333333333 68 -1 0.32518890655427 -0.5 -0.5 367232 1
i 6 28.10368349249659 2 9.25 68 -1 0.26301879409731 -0.5 -0.5 367232 1
i 6 28.10368349249659 2 9.75 68 -1 0.10000207543382 -0.5 -0.5 367232 1
i 5 28.10368349249659 2 10.33333333333333 68 -1 -0.475421430022 -0.5 -0.5 367232 1
i 4 28.10368349249659 2 8.91666666666667 68 -1 0.47258287552559 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 6.33333333333333 68 -1 -0.31576745375827 -0.5 -0.5 2869 1
i 3 28.37653478854025 2 10 68 -1 0.28027778813522 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 8.91666666666667 68 -1 -0.41788116556429 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 9.25 68 -1 -0.40783011946883 -0.5 -0.5 367232 1
i 4 28.37653478854025 2 8.91666666666667 68 -1 0.2235387354004 -0.5 -0.5 367232 1
i 4 28.6493860845839 2 6.33333333333333 68 -1 0.19602945697133 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 6.66666666666667 68 -1 -0.40543426205318 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 6.33333333333333 68 -1 -0.26462746275467 -0.5 -0.5 2869 1
i 4 28.6493860845839 2 8.91666666666667 68 -1 0.29600538783424 -0.5 -0.5 367232 1
i 4 28.6493860845839 2 8.58333333333333 68 -1 -0.30261403067612 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 6.33333333333333 68 -1 0.01337863009185 -0.5 -0.5 2869 1
i 5 28.92223738062756 2 6.33333333333333 68 -1 0.03843432133343 -0.5 -0.5 2869 1
i 6 28.92223738062756 2 6.91666666666667 68 -1 0.24511648018179 -0.5 -0.5 2869 1
i 6 28.92223738062756 2 7.41666666666667 68 -1 0.20731225341908 -0.5 -0.5 2869 1
i 5 28.92223738062756 2 8 68 -1 -0.29047287802074 -0.5 -0.5 2869 1
i 4 28.92223738062756 2 6 68 -1 -0.31014242236561 -0.5 -0.5 2869 1
i 4 28.92223738062756 2 8.58333333333333 68 -1 -0.14263776356405 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 8.91666666666667 68 -1 0.13277707484967 -0.5 -0.5 367232 1
i 4 28.92223738062756 2 8.58333333333333 68 -1 -0.17262813191798 -0.5 -0.5 367232 1
i 4 29.19508867667121 2 6 68 -1 0.33739313980366 -0.5 -0.5 2869 1
i 4 29.19508867667121 2 8.58333333333333 68 -1 0.08170442000122 -0.5 -0.5 367232 1
i 4 29.46793997271487 2 6 68 -1 0.24878520605007 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 6.33333333333333 68 -1 0.44727616002909 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 6 68 -1 -0.45870916798427 -0.5 -0.5 2869 1
i 4 29.46793997271487 2 8.58333333333333 68 -1 -0.2454023758874 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 6 68 -1 -0.32841174667166 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 6 68 -1 0.42557866709979 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 6.66666666666667 68 -1 -0.46441046129251 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 7.16666666666667 68 -1 0.43765316364245 -0.5 -0.5 2869 1
i 6 29.74079126875853 2 7.66666666666667 68 -1 0.32048413777 -0.5 -0.5 2869 1
i 4 29.74079126875853 2 6.33333333333333 68 -1 -0.46219218128629 -0.5 -0.5 2869 1
i 4 29.74079126875853 2 8.58333333333333 68 -1 -0.30194985957192 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 8.91666666666667 68 -1 -0.04554941446044 -0.5 -0.5 367232 1
i 4 29.74079126875853 2 8.58333333333333 68 -1 0.13006049670818 -0.5 -0.5 367232 1
i 4 30.01364256480218 2 6.33333333333333 68 -1 0.27936733268951 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 6.66666666666667 68 -1 -0.13865742124364 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 6.33333333333333 68 -1 0.14169000876682 -0.5 -0.5 2869 1
i 4 30.01364256480218 2 8.58333333333333 68 -1 0.19789178146992 -0.5 -0.5 367232 1
i 6 30.01364256480218 2 8.58333333333333 68 -1 0.01085864849022 -0.5 -0.5 367232 1
i 6 30.01364256480218 2 9.25 68 -1 -0.01567570538937 -0.5 -0.5 367232 1
i 5 30.01364256480218 2 9.75 68 -1 -0.26989347238059 -0.5 -0.5 367232 1
i 6 30.01364256480218 2 10.33333333333333 68 -1 -0.26289242785066 -0.5 -0.5 367232 1
i 4 30.01364256480218 2 8.33333333333333 68 -1 0.16255376566629 -0.5 -0.5 367232 1
i 4 30.28649386084584 2 6.33333333333333 68 -1 -0.25025401966783 -0.5 -0.5 2869 1
i 4 30.28649386084584 2 6 68 -1 -0.16155791272384 -0.5 -0.5 2869 1
i 4 30.28649386084584 2 8.33333333333333 68 -1 -0.22949040619531 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 6 68 -1 0.28460417909389 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 6.33333333333333 68 -1 0.37532087532638 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 6 68 -1 0.0124159052851 -0.5 -0.5 2869 1
i 4 30.5593451568895 2 8.33333333333333 68 -1 0.06476240123968 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 8.58333333333333 68 -1 0.44136342924819 -0.5 -0.5 367232 1
i 4 30.5593451568895 2 8.33333333333333 68 -1 -0.11484311715133 -0.5 -0.5 367232 1
i 4 30.83219645293315 2 6 68 -1 0.46637110869402 -0.5 -0.5 2869 1
i 4 30.83219645293315 2 8.33333333333333 68 -1 -0.36858358619157 -0.5 -0.5 367232 1
i 6 30.83219645293315 2 8.33333333333333 68 -1 -0.43230310669715 -0.5 -0.5 367232 1
i 6 30.83219645293315 2 8.91666666666667 68 -1 0.10430556303019 -0.5 -0.5 367232 1
i 5 30.83219645293315 2 9.5 68 -1 -0.29762427618154 -0.5 -0.5 367232 1
i 5 30.83219645293315 2 10 68 -1 -0.00116015539702 -0.5 -0.5 367232 1
i 4 30.83219645293315 2 8.58333333333333 68 -1 -0.01432268227576 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 6 68 -1 -0.37071291304982 -0.5 -0.5 2869 1
i 4 31.1050477489768 2 8.58333333333333 68 -1 0.25451546163296 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 8.91666666666667 68 -1 -0.14483972405276 -0.5 -0.5 367232 1
i 4 31.1050477489768 2 8.58333333333333 68 -1 -0.09880724143813 -0.5 -0.5 367232 1
i 4 31.37789904502047 2 6 68 -1 0.46422289404498 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 6.33333333333333 68 -1 -0.04402079510969 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 6 68 -1 0.14154215177664 -0.5 -0.5 2869 1
i 4 31.37789904502047 2 8.58333333333333 68 -1 0.35449327206733 -0.5 -0.5 367232 1
i 4 31.37789904502047 2 8.33333333333333 68 -1 0.48382190078852 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 6 68 -1 0.14788544810338 -0.5 -0.5 2869 1
i 5 31.65075034106412 2 6 68 -1 -0.08714736048246 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 6.66666666666667 68 -1 -0.10888874876113 -0.5 -0.5 2869 1
i 6 31.65075034106412 2 7.16666666666667 68 -1 -0.18212257008847 -0.5 -0.5 2869 1
i 5 31.65075034106412 2 7.66666666666667 68 -1 0.32771348906478 -0.5 -0.5 2869 1
i 4 31.65075034106412 2 8.33333333333333 68 -1 0.22507778265095 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 8.58333333333333 68 -1 -0.18697902654037 -0.5 -0.5 367232 1
i 4 31.65075034106412 2 8.33333333333333 68 -1 -0.36945962122276 -0.5 -0.5 367232 1
i 4 31.92360163710778 2 6 68 -1 -0.47880414393501 -0.5 -0.5 2869 1
i 4 31.92360163710778 2 8.33333333333333 68 -1 0.14439993339192 -0.5 -0.5 367232 1
i 4 32.19645293315143 2 6 68 -1 -0.16931726168548 -0.5 -0.5 2869 1
i 4 32.19645293315143 2 8.33333333333333 68 -1 0.10785189354171 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 6 68 -1 -0.35398435722149 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 6.33333333333333 68 -1 -0.13039681924344 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 6 68 -1 -0.00085319558177 -0.5 -0.5 2869 1
i 4 32.46930422919509 2 8.33333333333333 68 -1 0.01015846319572 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 8.58333333333333 68 -1 0.32570809990623 -0.5 -0.5 367232 1
i 4 32.46930422919509 2 8.33333333333333 68 -1 -0.31279754400964 -0.5 -0.5 367232 1
i 4 32.74215552523874 2 6 68 -1 -0.30155991428586 -0.5 -0.5 2869 1
i 6 32.74215552523874 2 6 68 -1 -0.07666080876307 -0.5 -0.5 2869 1
i 5 32.74215552523874 2 6.66666666666667 68 -1 0.18893771058852 -0.5 -0.5 2869 1
i 6 32.74215552523874 2 7.16666666666667 68 -1 0.14768919418654 -0.5 -0.5 2869 1
i 6 32.74215552523874 2 7.66666666666667 68 -1 -0.14494852516447 -0.5 -0.5 2869 1
i 4 32.74215552523874 2 6.33333333333333 68 -1 0.28744325659067 -0.5 -0.5 2869 1
i 4 32.74215552523874 2 8.33333333333333 68 -1 -0.46958265484271 -0.5 -0.5 367232 1
i 6 32.74215552523874 2 8.33333333333333 68 -1 -0.48234484475259 -0.5 -0.5 367232 1
i 5 32.74215552523874 2 8.91666666666667 68 -1 -0.16046625227883 -0.5 -0.5 367232 1
i 6 32.74215552523874 2 9.5 68 -1 -0.35520646238926 -0.5 -0.5 367232 1
i 5 32.74215552523874 2 10 68 -1 -0.20705531734801 -0.5 -0.5 367232 1
i 4 33.0150068212824 2 6.33333333333333 68 -1 0.46103067162971 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 6.66666666666667 68 -1 0.46647584001947 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 6.33333333333333 68 -1 -0.22529579125257 -0.5 -0.5 2869 1
i 4 33.0150068212824 2 8.33333333333333 68 -1 0.02197374145163 -0.5 -0.5 367232 1
i 4 33.28785811732605 2 6.33333333333333 68 -1 -0.32074499347038 -0.5 -0.5 2869 1
i 4 33.28785811732605 2 6 68 -1 0.16343156507182 -0.5 -0.5 2869 1
i 4 33.28785811732605 2 8.33333333333333 68 -1 -0.26116793553942 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 6 68 -1 0.11591310316131 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 6.33333333333333 68 -1 -0.14443735653001 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 6 68 -1 0.31256707016035 -0.5 -0.5 2869 1
i 4 33.56070941336972 2 8.33333333333333 68 -1 -0.01014777622652 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 8.58333333333333 68 -1 -0.29948029510457 -0.5 -0.5 367232 1
i 4 33.56070941336972 2 8.33333333333333 68 -1 0.19439154213166 -0.5 -0.5 367232 1
i 4 33.83356070941337 2 6 68 -1 0.12985909243421 -0.5 -0.5 2869 1
i 4 33.83356070941337 2 8.33333333333333 68 -1 0.10449661772026 -0.5 -0.5 367232 1
i 5 33.83356070941337 2 8.33333333333333 68 -1 -0.28521943619175 -0.5 -0.5 367232 1
i 5 33.83356070941337 2 8.91666666666667 68 -1 0.04889224302356 -0.5 -0.5 367232 1
i 5 33.83356070941337 2 9.5 68 -1 0.40325841440103 -0.5 -0.5 367232 1
i 6 33.83356070941337 2 10 68 -1 0.41469312179763 -0.5 -0.5 367232 1
i 4 33.83356070941337 2 8.58333333333333 68 -1 -0.17464543824763 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 6 68 -1 -0.42229191092219 -0.5 -0.5 2869 1
i 4 34.10641200545702 2 8.58333333333333 68 -1 -0.12306472941733 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 8.91666666666667 68 -1 0.21862485358291 -0.5 -0.5 367232 1
i 4 34.10641200545702 2 8.58333333333333 68 -1 -0.35830905683385 -0.5 -0.5 367232 1
i 4 34.37926330150068 2 6 68 -1 0.13970779012196 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 6.33333333333333 68 -1 0.08655337986626 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 6 68 -1 -0.49815542925268 -0.5 -0.5 2869 1
i 4 34.37926330150068 2 8.58333333333333 68 -1 -0.42096100557256 -0.5 -0.5 367232 1
i 4 34.37926330150068 2 8.33333333333333 68 -1 0.46519341382031 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 6 68 -1 0.29470647683728 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6 68 -1 0.02936866815312 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6.66666666666667 68 -1 -0.05952583886166 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 7.16666666666667 68 -1 -0.2013213125915 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 7.66666666666667 68 -1 0.04305237274421 -0.5 -0.5 2869 1
i 6 34.65211459754434 2 6 68 -1 -0.15863528891725 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 6.66666666666667 68 -1 0.40984413570617 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 7.16666666666667 68 -1 -0.27589324571621 -0.5 -0.5 2869 1
i 5 34.65211459754434 2 7.66666666666667 68 -1 0.04606701527651 -0.5 -0.5 2869 1
i 4 34.65211459754434 2 8.33333333333333 68 -1 -0.08364295480494 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 8.58333333333333 68 -1 -0.44529587356987 -0.5 -0.5 367232 1
i 4 34.65211459754434 2 8.33333333333333 68 -1 0.33815354843145 -0.5 -0.5 367232 1
i 4 34.924965893588 2 6 68 -1 0.13937958631975 -0.5 -0.5 2869 1
i 4 34.924965893588 2 8.33333333333333 68 -1 0.11147664274197 -0.5 -0.5 367232 1
i 4 35.19781718963165 2 6 68 -1 -0.07856289872252 -0.5 -0.5 2869 1
i 4 35.19781718963165 2 8.33333333333333 68 -1 -0.35069571369499 -0.5 -0.5 367232 1
i 3 35.47066848567531 2 7.66666666666667 68 -1 0.12099907334785 -0.5 -0.5 2869 1
i 3 35.47066848567531 2 8 68 -1 -0.24006485087513 -0.5 -0.5 2869 1
i 4 35.47066848567531 2 7.66666666666667 68 -1 -0.29716439826337 -0.5 -0.5 2869 1
i 4 35.47066848567531 2 6 68 -1 0.28590548303417 -0.5 -0.5 2869 1
i 4 35.47066848567531 2 8.33333333333333 68 -1 0.07688720468594 -0.5 -0.5 367232 1
i 4 35.47066848567531 2 8.58333333333333 68 -1 0.14608995151927 -0.5 -0.5 367232 1
i 4 35.47066848567531 2 8.33333333333333 68 -1 -0.47296368239816 -0.5 -0.5 367232 1
i 3 35.74351978171897 2 7.66666666666667 68 -1 0.27871089324159 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6 68 -1 0.17469216233471 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6.33333333333333 68 -1 0.32629366253285 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 6 68 -1 0.07321464153641 -0.5 -0.5 2869 1
i 4 35.74351978171897 2 8.33333333333333 68 -1 -0.44202804241019 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 8.33333333333333 68 -1 0.10526910463058 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 8.91666666666667 68 -1 0.34458431822776 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 9.5 68 -1 0.15397697473543 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 10 68 -1 0.1890688351211 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 8.33333333333333 68 -1 -0.432707855506 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 8.91666666666667 68 -1 -0.13368794351837 -0.5 -0.5 367232 1
i 6 35.74351978171897 2 9.5 68 -1 -0.24091648991862 -0.5 -0.5 367232 1
i 5 35.74351978171897 2 10 68 -1 -0.47986634239206 -0.5 -0.5 367232 1
i 4 36.01637107776262 2 6 68 -1 -0.37792416620887 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 6 68 -1 -0.10451345790457 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 6.66666666666667 68 -1 0.44726673816939 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 7.16666666666667 68 -1 -0.34727652236288 -0.5 -0.5 2869 1
i 6 36.01637107776262 2 7.66666666666667 68 -1 -0.40884229294088 -0.5 -0.5 2869 1
i 4 36.01637107776262 2 6.33333333333333 68 -1 0.18229413380185 -0.5 -0.5 2869 1
i 4 36.01637107776262 2 8.33333333333333 68 -1 -0.47471509722295 -0.5 -0.5 367232 1
i 4 36.28922237380628 2 6.33333333333333 68 -1 -0.25920517758692 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 6.66666666666667 68 -1 -0.14957862158774 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 6.33333333333333 68 -1 -0.31804387591765 -0.5 -0.5 2869 1
i 4 36.28922237380628 2 8.33333333333333 68 -1 0.09754957422903 -0.5 -0.5 367232 1
i 4 36.56207366984994 2 6.33333333333333 68 -1 -0.37750331045635 -0.5 -0.5 2869 1
i 4 36.56207366984994 2 6 68 -1 -0.42302392734983 -0.5 -0.5 2869 1
i 3 36.56207366984994 2 10 68 -1 -0.39220606969822 -0.5 -0.5 367232 1
i 3 36.56207366984994 2 10.33333333333333 68 -1 -0.15529814100689 -0.5 -0.5 367232 1
i 3 36.56207366984994 2 10 68 -1 0.15633364043378 -0.5 -0.5 367232 1
i 4 36.56207366984994 2 8.33333333333333 68 -1 -0.43666176330798 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 6 68 -1 0.28579988871719 -0.5 -0.5 2869 1
i 4 36.83492496589359 2 6.33333333333333 68 -1 -0.25702988110251 -0.5 -0.5 2869 1
i 4 36.83492496589359 2 6 68 -1 -0.10801876038463 -0.5 -0.5 2869 1
i 3 36.83492496589359 2 10 68 -1 -0.3538541003921 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.33333333333333 68 -1 0.22234278107664 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.58333333333333 68 -1 0.39411652535018 -0.5 -0.5 367232 1
i 4 36.83492496589359 2 8.33333333333333 68 -1 -0.4768130498406 -0.5 -0.5 367232 1
i 4 37.10777626193725 2 6 68 -1 -0.13947132730991 -0.5 -0.5 2869 1
i 4 37.10777626193725 2 8.33333333333333 68 -1 -0.05477700541412 -0.5 -0.5 367232 1
i 6 37.10777626193725 2 8.33333333333333 68 -1 0.1000999965684 -0.5 -0.5 367232 1
i 6 37.10777626193725 2 8.91666666666667 68 -1 0.24922724749811 -0.5 -0.5 367232 1
i 6 37.10777626193725 2 9.5 68 -1 -0.39537374071703 -0.5 -0.5 367232 1
i 5 37.10777626193725 2 10 68 -1 0.16035285900197 -0.5 -0.5 367232 1
i 4 37.10777626193725 2 8.58333333333333 68 -1 0.36918490662362 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 6 68 -1 0.04053629315126 -0.5 -0.5 2869 1
i 4 37.3806275579809 2 8.58333333333333 68 -1 -0.15519311236422 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 8.91666666666667 68 -1 0.05941914725279 -0.5 -0.5 367232 1
i 4 37.3806275579809 2 8.58333333333333 68 -1 -0.39873605066559 -0.5 -0.5 367232 1
i 4 37.65347885402456 2 6 68 -1 -0.00807211095538 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 6.33333333333333 68 -1 -0.2019071505386 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 6 68 -1 -0.10520213868441 -0.5 -0.5 2869 1
i 4 37.65347885402456 2 8.58333333333333 68 -1 -0.23828991466213 -0.5 -0.5 367232 1
i 4 37.65347885402456 2 8.33333333333333 68 -1 -0.19233079411443 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 6 68 -1 -0.14179111132353 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6 68 -1 -0.0410799124406 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6.66666666666667 68 -1 0.06830387371361 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 7.16666666666667 68 -1 0.36457963294378 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 7.66666666666667 68 -1 -0.30066187690408 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 6 68 -1 -0.4078609029057 -0.5 -0.5 2869 1
i 5 37.92633015006821 2 6.66666666666667 68 -1 0.13211615272932 -0.5 -0.5 2869 1
i 5 37.92633015006821 2 7.16666666666667 68 -1 -0.45928870622569 -0.5 -0.5 2869 1
i 6 37.92633015006821 2 7.66666666666667 68 -1 0.24255972781419 -0.5 -0.5 2869 1
i 4 37.92633015006821 2 6.33333333333333 68 -1 0.39255306124172 -0.5 -0.5 2869 1
i 4 37.92633015006821 2 8.33333333333333 68 -1 -0.48120573753719 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 8.58333333333333 68 -1 0.23704766328679 -0.5 -0.5 367232 1
i 4 37.92633015006821 2 8.33333333333333 68 -1 -0.33885098909453 -0.5 -0.5 367232 1
i 4 38.19918144611186 2 6.33333333333333 68 -1 -0.27235344512979 -0.5 -0.5 2869 1
i 4 38.19918144611186 2 8.33333333333333 68 -1 -0.08419404693098 -0.5 -0.5 367232 1
i 4 38.47203274215552 2 6.33333333333333 68 -1 -0.36489548562573 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 6.66666666666667 68 -1 -0.22378890372832 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 6.33333333333333 68 -1 0.29084663228543 -0.5 -0.5 2869 1
i 4 38.47203274215552 2 8.33333333333333 68 -1 -0.0593228905818 -0.5 -0.5 367232 1
i 3 38.74488403819918 2 7.66666666666667 68 -1 -0.0315171356555 -0.5 -0.5 2869 1
i 3 38.74488403819918 2 8 68 -1 0.19232933562836 -0.5 -0.5 2869 1
i 3 38.74488403819918 2 7.66666666666667 68 -1 0.19541941057878 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 6.33333333333333 68 -1 -0.39160715075963 -0.5 -0.5 2869 1
i 5 38.74488403819918 2 6.33333333333333 68 -1 -0.16620118093172 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 6.91666666666667 68 -1 0.43078856278777 -0.5 -0.5 2869 1
i 6 38.74488403819918 2 7.41666666666667 68 -1 0.32063330718823 -0.5 -0.5 2869 1
i 5 38.74488403819918 2 8 68 -1 0.2716364855627 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 6.66666666666667 68 -1 0.15707322432846 -0.5 -0.5 2869 1
i 4 38.74488403819918 2 8.33333333333333 68 -1 0.09684864734788 -0.5 -0.5 367232 1
i 4 38.74488403819918 2 8.58333333333333 68 -1 0.37178752109235 -0.5 -0.5 367232 1
i 4 38.74488403819918 2 8.33333333333333 68 -1 -0.46851489485015 -0.5 -0.5 367232 1
i 3 39.01773533424284 2 7.66666666666667 68 -1 0.15526930802484 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.66666666666667 68 -1 -0.47409924864702 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.91666666666667 68 -1 0.19284674279142 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 6.66666666666667 68 -1 0.39933247915429 -0.5 -0.5 2869 1
i 4 39.01773533424284 2 8.33333333333333 68 -1 0.45974870467022 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 8.33333333333333 68 -1 0.42188218778089 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 8.91666666666667 68 -1 0.38159003616964 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 9.5 68 -1 0.03770553858081 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 10 68 -1 -0.00719001994298 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 8.33333333333333 68 -1 0.25362769829275 -0.5 -0.5 367232 1
i 6 39.01773533424284 2 8.91666666666667 68 -1 -0.30034781227576 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 9.5 68 -1 -0.10026101260384 -0.5 -0.5 367232 1
i 5 39.01773533424284 2 10 68 -1 0.09708096355961 -0.5 -0.5 367232 1
i 4 39.01773533424284 2 8.58333333333333 68 -1 0.29392342445884 -0.5 -0.5 367232 1
i 4 39.29058663028649 2 6.66666666666667 68 -1 -0.14759169897824 -0.5 -0.5 2869 1
i 4 39.29058663028649 2 6.33333333333333 68 -1 0.08906407360332 -0.5 -0.5 2869 1
i 4 39.29058663028649 2 8.58333333333333 68 -1 0.47965147610084 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 6.33333333333333 68 -1 0.49660613673025 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 6.66666666666667 68 -1 -0.24938476941612 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 6.33333333333333 68 -1 0.37219972393002 -0.5 -0.5 2869 1
i 4 39.56343792633015 2 8.58333333333333 68 -1 -0.36263127909307 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 8.91666666666667 68 -1 -0.34127724582734 -0.5 -0.5 367232 1
i 4 39.56343792633015 2 8.58333333333333 68 -1 -0.42650631703049 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 6.33333333333333 68 -1 0.00388546228954 -0.5 -0.5 2869 1
i 3 39.83628922237381 2 10 68 -1 -0.04069365162602 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 10.33333333333333 68 -1 0.31941151485189 -0.5 -0.5 367232 1
i 3 39.83628922237381 2 10 68 -1 -0.10469495780823 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 8.58333333333333 68 -1 0.41074471213214 -0.5 -0.5 367232 1
i 6 39.83628922237381 2 8.58333333333333 68 -1 -0.27140502803368 -0.5 -0.5 367232 1
i 6 39.83628922237381 2 9.25 68 -1 0.36512449723266 -0.5 -0.5 367232 1
i 6 39.83628922237381 2 9.75 68 -1 -0.48422391431787 -0.5 -0.5 367232 1
i 5 39.83628922237381 2 10.33333333333333 68 -1 0.03528583922696 -0.5 -0.5 367232 1
i 4 39.83628922237381 2 8.91666666666667 68 -1 0.27341589508479 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 6.33333333333333 68 -1 0.15593981174025 -0.5 -0.5 2869 1
i 3 40.10914051841746 2 10 68 -1 -0.23062810747627 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 8.91666666666667 68 -1 0.27791672141154 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 9.25 68 -1 -0.19331905600451 -0.5 -0.5 367232 1
i 4 40.10914051841746 2 8.91666666666667 68 -1 -0.32351099779966 -0.5 -0.5 367232 1
i 4 40.38199181446112 2 6.33333333333333 68 -1 -0.28148084279409 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 6.66666666666667 68 -1 -0.37920766821634 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 6.33333333333333 68 -1 -0.27834521763942 -0.5 -0.5 2869 1
i 4 40.38199181446112 2 8.91666666666667 68 -1 -0.37853214165458 -0.5 -0.5 367232 1
i 4 40.38199181446112 2 8.58333333333333 68 -1 0.27176900230752 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 6.33333333333333 68 -1 0.09714079637903 -0.5 -0.5 2869 1
i 5 40.65484311050478 2 6.33333333333333 68 -1 -0.20255839361566 -0.5 -0.5 2869 1
i 6 40.65484311050478 2 6.91666666666667 68 -1 -0.23311456414275 -0.5 -0.5 2869 1
i 6 40.65484311050478 2 7.41666666666667 68 -1 -0.04283290537383 -0.5 -0.5 2869 1
i 6 40.65484311050478 2 8 68 -1 -0.07156395082539 -0.5 -0.5 2869 1
i 4 40.65484311050478 2 6 68 -1 0.27986214917431 -0.5 -0.5 2869 1
i 4 40.65484311050478 2 8.58333333333333 68 -1 -0.05986827167943 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 8.91666666666667 68 -1 0.04172916121752 -0.5 -0.5 367232 1
i 4 40.65484311050478 2 8.58333333333333 68 -1 0.20152560055587 -0.5 -0.5 367232 1
i 4 40.92769440654843 2 6 68 -1 0.31390344685698 -0.5 -0.5 2869 1
i 4 40.92769440654843 2 8.58333333333333 68 -1 -0.25004207643359 -0.5 -0.5 367232 1
i 4 41.20054570259209 2 6 68 -1 -0.386979146551 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 6.33333333333333 68 -1 -0.30826208249886 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 6 68 -1 -0.25977692793474 -0.5 -0.5 2869 1
i 4 41.20054570259209 2 8.58333333333333 68 -1 0.13763547083743 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 6 68 -1 -0.2493465559153 -0.5 -0.5 2869 1
i 6 41.47339699863574 2 6 68 -1 -0.32890391592614 -0.5 -0.5 2869 1
i 6 41.47339699863574 2 6.66666666666667 68 -1 0.30280087336734 -0.5 -0.5 2869 1
i 6 41.47339699863574 2 7.16666666666667 68 -1 -0.45913902105795 -0.5 -0.5 2869 1
i 5 41.47339699863574 2 7.66666666666667 68 -1 -0.11978038270977 -0.5 -0.5 2869 1
i 4 41.47339699863574 2 6.33333333333333 68 -1 -0.49547784198718 -0.5 -0.5 2869 1
i 4 41.47339699863574 2 8.58333333333333 68 -1 0.30715152980845 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 8.91666666666667 68 -1 0.06871651322473 -0.5 -0.5 367232 1
i 4 41.47339699863574 2 8.58333333333333 68 -1 -0.06593822251777 -0.5 -0.5 367232 1
i 4 41.7462482946794 2 6.33333333333333 68 -1 -0.04875780130053 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 6.66666666666667 68 -1 0.45125197680599 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 6.33333333333333 68 -1 0.45951399918102 -0.5 -0.5 2869 1
i 4 41.7462482946794 2 8.58333333333333 68 -1 0.15065520674954 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 8.58333333333333 68 -1 0.01271484703385 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 9.25 68 -1 0.27968008209556 -0.5 -0.5 367232 1
i 6 41.7462482946794 2 9.75 68 -1 0.31192312928281 -0.5 -0.5 367232 1
i 5 41.7462482946794 2 10.33333333333333 68 -1 0.03383843171341 -0.5 -0.5 367232 1
i 4 41.7462482946794 2 8.33333333333333 68 -1 -0.34386642312106 -0.5 -0.5 367232 1
i 4 42.01909959072306 2 6.33333333333333 68 -1 0.44403869256896 -0.5 -0.5 2869 1
i 4 42.01909959072306 2 6 68 -1 -0.15893750100638 -0.5 -0.5 2869 1
i 4 42.01909959072306 2 8.33333333333333 68 -1 0.05561112516582 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 6 68 -1 -0.34418715199965 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 6.33333333333333 68 -1 0.10747040568347 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 6 68 -1 -0.38236056913236 -0.5 -0.5 2869 1
i 4 42.29195088676671 2 8.33333333333333 68 -1 -0.05415176383626 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 8.58333333333333 68 -1 -0.07475030273743 -0.5 -0.5 367232 1
i 4 42.29195088676671 2 8.33333333333333 68 -1 0.06791243382735 -0.5 -0.5 367232 1
i 4 42.56480218281037 2 6 68 -1 0.21519797210866 -0.5 -0.5 2869 1
i 4 42.56480218281037 2 8.33333333333333 68 -1 -0.28335517480419 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 8.33333333333333 68 -1 -0.42346912512132 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 8.91666666666667 68 -1 -0.34831425384021 -0.5 -0.5 367232 1
i 6 42.56480218281037 2 9.5 68 -1 0.15141855425425 -0.5 -0.5 367232 1
i 5 42.56480218281037 2 10 68 -1 0.11123153833622 -0.5 -0.5 367232 1
i 4 42.56480218281037 2 8.58333333333333 68 -1 0.00327343750655 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 6 68 -1 -0.44062129744299 -0.5 -0.5 2869 1
i 4 42.83765347885402 2 8.58333333333333 68 -1 0.0808458479272 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 8.91666666666667 68 -1 -0.39236470858734 -0.5 -0.5 367232 1
i 4 42.83765347885402 2 8.58333333333333 68 -1 0.1255412423622 -0.5 -0.5 367232 1
i 4 43.11050477489768 2 6 68 -1 0.07284086226168 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 6.33333333333333 68 -1 -0.03699689142689 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 6 68 -1 0.29318761481974 -0.5 -0.5 2869 1
i 4 43.11050477489768 2 8.58333333333333 68 -1 -0.28723000238619 -0.5 -0.5 367232 1
i 4 43.11050477489768 2 8.33333333333333 68 -1 0.28379508899814 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 6 68 -1 0.30323808447642 -0.5 -0.5 2869 1
i 6 43.38335607094133 2 6 68 -1 0.01547659434774 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 6.66666666666667 68 -1 -0.06061756747239 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 7.16666666666667 68 -1 0.05744565777768 -0.5 -0.5 2869 1
i 5 43.38335607094133 2 7.66666666666667 68 -1 -0.17724865645384 -0.5 -0.5 2869 1
i 4 43.38335607094133 2 8.33333333333333 68 -1 -0.34867908961939 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 8.58333333333333 68 -1 -0.2868960719737 -0.5 -0.5 367232 1
i 4 43.38335607094133 2 8.33333333333333 68 -1 0.1597089054932 -0.5 -0.5 367232 1
i 4 43.65620736698499 2 6 68 -1 0.37803767581105 -0.5 -0.5 2869 1
i 4 43.65620736698499 2 8.33333333333333 68 -1 -0.26032941822504 -0.5 -0.5 367232 1
i 4 43.92905866302865 2 6 68 -1 0.35680314560859 -0.5 -0.5 2869 1
i 4 43.92905866302865 2 8.33333333333333 68 -1 0.0121948822454 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 6 68 -1 -0.11336276365626 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 6.33333333333333 68 -1 0.04481234147132 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 6 68 -1 0.1582714661546 -0.5 -0.5 2869 1
i 4 44.2019099590723 2 8.33333333333333 68 -1 0.01091817190886 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 8.58333333333333 68 -1 -0.41372249684582 -0.5 -0.5 367232 1
i 4 44.2019099590723 2 8.33333333333333 68 -1 0.11307618544168 -0.5 -0.5 367232 1
i 4 44.47476125511596 2 6 68 -1 -0.08251792715904 -0.5 -0.5 2869 1
i 6 44.47476125511596 2 6 68 -1 -0.18611869381915 -0.5 -0.5 2869 1
i 6 44.47476125511596 2 6.66666666666667 68 -1 0.03418571185272 -0.5 -0.5 2869 1
i 5 44.47476125511596 2 7.16666666666667 68 -1 0.27790666876909 -0.5 -0.5 2869 1
i 6 44.47476125511596 2 7.66666666666667 68 -1 0.11621050957191 -0.5 -0.5 2869 1
i 4 44.47476125511596 2 6.33333333333333 68 -1 0.13155954921672 -0.5 -0.5 2869 1
i 4 44.47476125511596 2 8.33333333333333 68 -1 -0.36584605081799 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 8.33333333333333 68 -1 0.30905052168683 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 8.91666666666667 68 -1 0.20881211323405 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 9.5 68 -1 -0.36870321552355 -0.5 -0.5 367232 1
i 6 44.47476125511596 2 10 68 -1 -0.07492237088509 -0.5 -0.5 367232 1
i 4 44.74761255115962 2 6.33333333333333 68 -1 0.12900942862581 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 6.66666666666667 68 -1 -0.46729372129634 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 6.33333333333333 68 -1 -0.25723767306281 -0.5 -0.5 2869 1
i 4 44.74761255115962 2 8.33333333333333 68 -1 0.25012053105276 -0.5 -0.5 367232 1
i 4 45.02046384720327 2 6.33333333333333 68 -1 -0.4896025682964 -0.5 -0.5 2869 1
i 4 45.02046384720327 2 6 68 -1 0.31105492022519 -0.5 -0.5 2869 1
i 4 45.02046384720327 2 8.33333333333333 68 -1 -0.03681719098059 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 6 68 -1 -0.14729371168497 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 6.33333333333333 68 -1 -0.2069292605409 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 6 68 -1 0.00633156759495 -0.5 -0.5 2869 1
i 4 45.29331514324693 2 8.33333333333333 68 -1 -0.29022019157911 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 8.58333333333333 68 -1 -0.08494906540445 -0.5 -0.5 367232 1
i 4 45.29331514324693 2 8.33333333333333 68 -1 0.08482674436785 -0.5 -0.5 367232 1
i 4 45.56616643929058 2 6 68 -1 -0.25670957569095 -0.5 -0.5 2869 1
i 4 45.56616643929058 2 8.33333333333333 68 -1 -0.07306233815348 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 8.33333333333333 68 -1 0.34176310800746 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 8.91666666666667 68 -1 -0.18257964797984 -0.5 -0.5 367232 1
i 6 45.56616643929058 2 9.5 68 -1 0.40628902493591 -0.5 -0.5 367232 1
i 5 45.56616643929058 2 10 68 -1 -0.3924611665396 -0.5 -0.5 367232 1
i 4 45.56616643929058 2 8.58333333333333 68 -1 0.13697698756423 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 6 68 -1 0.48509369851321 -0.5 -0.5 2869 1
i 4 45.83901773533424 2 8.58333333333333 68 -1 0.11320777133624 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 8.91666666666667 68 -1 0.32668853329268 -0.5 -0.5 367232 1
i 4 45.83901773533424 2 8.58333333333333 68 -1 0.22426512252091 -0.5 -0.5 367232 1
i 4 46.1118690313779 2 6 68 -1 -0.09638934857086 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 6.33333333333333 68 -1 -0.11801718574045 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 6 68 -1 0.04879309863126 -0.5 -0.5 2869 1
i 4 46.1118690313779 2 8.58333333333333 68 -1 0.23358093868087 -0.5 -0.5 367232 1
i 4 46.1118690313779 2 8.33333333333333 68 -1 -0.46961773464293 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 6 68 -1 0.46496801828693 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6 68 -1 0.37237154652797 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6.66666666666667 68 -1 -0.42258161621186 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.16666666666667 68 -1 -0.18447759534508 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 0.40194055203338 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6 68 -1 0.0243089586677 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6.66666666666667 68 -1 0.31244448168408 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.16666666666667 68 -1 -0.37827202315512 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.66666666666667 68 -1 -0.19556986531604 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6 68 -1 -0.12265502434678 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 6.66666666666667 68 -1 0.33074388835281 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.16666666666667 68 -1 -0.40872425200435 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 -0.47502822009973 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6 68 -1 0.33402979553505 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 6.66666666666667 68 -1 0.28700168394375 -0.5 -0.5 2869 1
i 5 46.38472032742155 2 7.16666666666667 68 -1 -0.06104800092424 -0.5 -0.5 2869 1
i 6 46.38472032742155 2 7.66666666666667 68 -1 -0.15587993184525 -0.5 -0.5 2869 1
i 4 46.38472032742155 2 6.33333333333333 68 -1 -0.3355752307838 -0.5 -0.5 2869 1
i 4 46.38472032742155 2 8.33333333333333 68 -1 -0.33023469861129 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 8.58333333333333 68 -1 0.2506404789368 -0.5 -0.5 367232 1
i 4 46.38472032742155 2 8.33333333333333 68 -1 -0.05117342163686 -0.5 -0.5 367232 1
i 4 46.65757162346521 2 6.33333333333333 68 -1 0.36023268487817 -0.5 -0.5 2869 1
i 4 46.65757162346521 2 8.33333333333333 68 -1 -0.30165783646884 -0.5 -0.5 367232 1
i 4 46.93042291950887 2 6.33333333333333 68 -1 -0.19896715257741 -0.5 -0.5 2869 1
i 4 46.93042291950887 2 8.33333333333333 68 -1 0.38167369633254 -0.5 -0.5 367232 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 0.27968302899341 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 8 68 -1 -0.16169043930389 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 0.19897130718552 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 0.25928956672824 -0.5 -0.5 2869 1
i 3 47.20327421555253 2 7.66666666666667 68 -1 -0.01391845350239 -0.5 -0.5 2869 1
i 4 47.20327421555253 2 6.33333333333333 68 -1 0.03897479998319 -0.5 -0.5 2869 1
i 4 47.20327421555253 2 8.33333333333333 68 -1 -0.06575660399642 -0.5 -0.5 367232 1
i 4 47.20327421555253 2 8.58333333333333 68 -1 -0.04739720221799 -0.5 -0.5 367232 1
i 4 47.20327421555253 2 8.33333333333333 68 -1 -0.17805427134552 -0.5 -0.5 367232 1
i 3 47.47612551159618 2 7.66666666666667 68 -1 0.14364903361616 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 7.66666666666667 68 -1 0.39661955554371 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 8 68 -1 -0.49129558957252 -0.5 -0.5 2869 1
i 3 47.47612551159618 2 7.66666666666667 68 -1 -0.20900647835301 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 7.66666666666667 68 -1 0.34261764477362 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.33333333333333 68 -1 -0.38727540631003 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.66666666666667 68 -1 -0.26517284420047 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 6.33333333333333 68 -1 0.27476000228102 -0.5 -0.5 2869 1
i 4 47.47612551159618 2 8.33333333333333 68 -1 -0.08064866221911 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.33333333333333 68 -1 -0.19707178139254 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.91666666666667 68 -1 -0.0489961710938 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 9.5 68 -1 -0.46578331546461 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 10 68 -1 0.31373710792841 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.33333333333333 68 -1 -0.21365482504395 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.91666666666667 68 -1 0.28709622882526 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 9.5 68 -1 -0.38242140323924 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 10 68 -1 0.15190313707431 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.33333333333333 68 -1 -0.05762913781376 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 8.91666666666667 68 -1 0.06396813780031 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 9.5 68 -1 -0.44436003205891 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 10 68 -1 0.45674496270364 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.33333333333333 68 -1 -0.38501178058107 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 8.91666666666667 68 -1 0.48643772501328 -0.5 -0.5 367232 1
i 5 47.47612551159618 2 9.5 68 -1 0.39075890890639 -0.5 -0.5 367232 1
i 6 47.47612551159618 2 10 68 -1 0.42298316320371 -0.5 -0.5 367232 1
i 4 47.47612551159618 2 8.58333333333333 68 -1 -0.34481875017823 -0.5 -0.5 367232 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 0.38772092218908 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 7.66666666666667 68 -1 -0.30003872447204 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 8.33333333333333 68 -1 0.17490247926693 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 8.75 68 -1 0.27129114136405 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 9.41666666666667 68 -1 0.03449273679483 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 8 68 -1 -0.06736607117349 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 0.15055731590572 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 8 68 -1 0.44335397385943 -0.5 -0.5 2869 1
i 3 47.74897680763984 2 7.66666666666667 68 -1 -0.34979318887773 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 6.33333333333333 68 -1 -0.17547893313048 -0.5 -0.5 2869 1
i 6 47.74897680763984 2 6.33333333333333 68 -1 -0.25140003404936 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 6.91666666666667 68 -1 0.28469385169033 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 7.41666666666667 68 -1 0.24224009109245 -0.5 -0.5 2869 1
i 5 47.74897680763984 2 8 68 -1 -0.25174893939346 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 6.66666666666667 68 -1 0.38944489228402 -0.5 -0.5 2869 1
i 4 47.74897680763984 2 8.58333333333333 68 -1 0.34015509313519 -0.5 -0.5 367232 1
i 3 48.0218281036835 2 8 68 -1 0.49548856454229 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8.33333333333333 68 -1 -0.301612962055 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8 68 -1 -0.42321583173828 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 7.66666666666667 68 -1 0.3880033505795 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 7.66666666666667 68 -1 -0.3618443244257 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 8.33333333333333 68 -1 -0.10196190319063 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 8.75 68 -1 -0.04032571840939 -0.5 -0.5 2869 1
i 5 48.0218281036835 2 9.41666666666667 68 -1 0.2843866270204 -0.5 -0.5 2869 1
i 3 48.0218281036835 2 8 68 -1 -0.31214346784498 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.66666666666667 68 -1 0.43175147947157 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.91666666666667 68 -1 -0.07873800201088 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 6.66666666666667 68 -1 0.15974864915993 -0.5 -0.5 2869 1
i 4 48.0218281036835 2 8.58333333333333 68 -1 -0.27066992623209 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 8 68 -1 0.00547236058993 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 7.66666666666667 68 -1 -0.34375750421027 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 8 68 -1 -0.32680782738423 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 8.33333333333333 68 -1 -0.38065177392649 -0.5 -0.5 2869 1
i 3 48.29467939972715 2 8 68 -1 0.32069289191481 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 6.66666666666667 68 -1 -0.12094843105062 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 6.33333333333333 68 -1 0.06759350943502 -0.5 -0.5 2869 1
i 4 48.29467939972715 2 10 68 -1 0.17132102766812 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10.33333333333333 68 -1 0.19787587765072 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 0.27960814692719 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 -0.33793278208809 -0.5 -0.5 367232 1
i 3 48.29467939972715 2 10 68 -1 0.32654481340518 -0.5 -0.5 367232 1
i 4 48.29467939972715 2 8.58333333333333 68 -1 0.07369540031445 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 -0.05839337895265 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 8 68 -1 -0.16048504770074 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 -0.37170474829815 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 8 68 -1 0.12882274890161 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 7.66666666666667 68 -1 0.16315125712367 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.33333333333333 68 -1 -0.07220280925 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.66666666666667 68 -1 -0.06214248142851 -0.5 -0.5 2869 1
i 4 48.56753069577081 2 6.33333333333333 68 -1 0.32573846121433 -0.5 -0.5 2869 1
i 3 48.56753069577081 2 10 68 -1 -0.0669966596197 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 0.18053058498693 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 10.33333333333333 68 -1 0.08471245944338 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 -0.05538764538475 -0.5 -0.5 367232 1
i 3 48.56753069577081 2 10 68 -1 0.3774071977585 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.58333333333333 68 -1 -0.41905315044006 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.91666666666667 68 -1 -0.36640046890616 -0.5 -0.5 367232 1
i 4 48.56753069577081 2 8.58333333333333 68 -1 0.29946244495693 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 7.66666666666667 68 -1 0.33765284173941 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 7.66666666666667 68 -1 -0.0041259773884 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 8 68 -1 -0.4910349043487 -0.5 -0.5 2869 1
i 4 48.84038199181446 2 7.66666666666667 68 -1 0.43657366013616 -0.5 -0.5 2869 1
i 4 48.84038199181446 2 6.33333333333333 68 -1 0.45098353422601 -0.5 -0.5 2869 1
i 3 48.84038199181446 2 10 68 -1 -0.19779911787942 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 10 68 -1 -0.25482933032376 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 10.58333333333333 68 -1 0.26209747645762 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 11.25 68 -1 -0.21189466771528 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 11.75 68 -1 -0.0554739446137 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10.33333333333333 68 -1 -0.21967000315394 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10 68 -1 0.42524566901293 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 10.33333333333333 68 -1 0.12119542378097 -0.5 -0.5 367232 1
i 3 48.84038199181446 2 10 68 -1 0.12750673542903 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 8.58333333333333 68 -1 0.49980071644137 -0.5 -0.5 367232 1
i 6 48.84038199181446 2 8.58333333333333 68 -1 0.39748218281805 -0.5 -0.5 367232 1
i 5 48.84038199181446 2 9.25 68 -1 0.27875136420313 -0.5 -0.5 367232 1
i 6 48.84038199181446 2 9.75 68 -1 0.35703101316521 -0.5 -0.5 367232 1
i 6 48.84038199181446 2 10.33333333333333 68 -1 0.03524492961057 -0.5 -0.5 367232 1
i 4 48.84038199181446 2 8.91666666666667 68 -1 0.30474644267007 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 7.66666666666667 68 -1 -0.47595177774756 -0.5 -0.5 2869 1
i 3 49.11323328785812 2 7.66666666666667 68 -1 -0.20677757807131 -0.5 -0.5 2869 1
i 4 49.11323328785812 2 6.33333333333333 68 -1 0.36315069906247 -0.5 -0.5 2869 1
i 3 49.11323328785812 2 10.33333333333333 68 -1 0.04374379063537 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10.58333333333333 68 -1 0.38728112741679 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10.33333333333333 68 -1 0.20002283774738 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10 68 -1 0.45465102341967 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 10 68 -1 -0.23524596447211 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 10.58333333333333 68 -1 -0.25276446301513 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 11.25 68 -1 0.33715719631158 -0.5 -0.5 367232 1
i 5 49.11323328785812 2 11.75 68 -1 -0.29900266034308 -0.5 -0.5 367232 1
i 3 49.11323328785812 2 10.33333333333333 68 -1 -0.20727299766816 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 8.91666666666667 68 -1 -0.38693379334431 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 9.25 68 -1 -0.37976245644471 -0.5 -0.5 367232 1
i 4 49.11323328785812 2 8.91666666666667 68 -1 0.42022601130103 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 -0.39027591107312 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 8 68 -1 -0.30491193824379 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 0.2900311509801 -0.5 -0.5 2869 1
i 3 49.38608458390177 2 7.66666666666667 68 -1 -0.14447403303648 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.33333333333333 68 -1 -0.3038894586325 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.66666666666667 68 -1 -0.38576994729393 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 6.33333333333333 68 -1 -0.23592902314039 -0.5 -0.5 2869 1
i 4 49.38608458390177 2 10.33333333333333 68 -1 -0.43856989832091 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10 68 -1 -0.05285950612512 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10.33333333333333 68 -1 -0.22901856697963 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10.58333333333333 68 -1 -0.07722103590735 -0.5 -0.5 367232 1
i 3 49.38608458390177 2 10.33333333333333 68 -1 0.11630882938845 -0.5 -0.5 367232 1
i 4 49.38608458390177 2 8.91666666666667 68 -1 0.05133367723503 -0.5 -0.5 367232 1
i 4 49.38608458390177 2 8.58333333333333 68 -1 0.2316030675649 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 7.66666666666667 68 -1 0.1640656526093 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 7.66666666666667 68 -1 0.00877896931236 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 8.33333333333333 68 -1 -0.30017442202637 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 8.75 68 -1 0.23197258810633 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 9.41666666666667 68 -1 0.11181836013721 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 7.66666666666667 68 -1 0.38485788621362 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 8 68 -1 0.25728950375792 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 7.66666666666667 68 -1 -0.36288479718003 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 6.33333333333333 68 -1 -0.15727696884249 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 6.33333333333333 68 -1 -0.02186227598959 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 6.91666666666667 68 -1 0.11952834997427 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 7.41666666666667 68 -1 0.41634953430786 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 8 68 -1 -0.13157746073279 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 6.33333333333333 68 -1 -0.35259774755655 -0.5 -0.5 2869 1
i 6 49.65893587994542 2 6.91666666666667 68 -1 -0.37825409209843 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 7.41666666666667 68 -1 0.40491092323046 -0.5 -0.5 2869 1
i 5 49.65893587994542 2 8 68 -1 -0.23094634773548 -0.5 -0.5 2869 1
i 4 49.65893587994542 2 6.66666666666667 68 -1 0.01858317968518 -0.5 -0.5 2869 1
i 3 49.65893587994542 2 10 68 -1 -0.44742763671758 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10.33333333333333 68 -1 -0.03493945325247 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10 68 -1 0.28789072385238 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10.33333333333333 68 -1 0.39447103265531 -0.5 -0.5 367232 1
i 3 49.65893587994542 2 10 68 -1 0.28079013577418 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.58333333333333 68 -1 -0.45226037384193 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.91666666666667 68 -1 -0.00956487185687 -0.5 -0.5 367232 1
i 4 49.65893587994542 2 8.58333333333333 68 -1 -0.42408053303627 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 7.66666666666667 68 -1 -0.32378784767377 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 7.66666666666667 68 -1 -0.13788711029517 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.33333333333333 68 -1 -0.01017651559917 -0.5 -0.5 2869 1
i 4 49.93178717598909 2 8.75 68 -1 -0.27201831422351 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 9.41666666666667 68 -1 -0.2022377307617 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 7.66666666666667 68 -1 -0.2981168739713 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.33333333333333 68 -1 -0.26183601623971 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 8.75 68 -1 0.25568120288452 -0.5 -0.5 2869 1
i 5 49.93178717598909 2 9.41666666666667 68 -1 0.17128037042369 -0.5 -0.5 2869 1
i 3 49.93178717598909 2 8 68 -1 0.33459468809912 -0.5 -0.5 2869 1
i 4 49.93178717598909 2 6.66666666666667 68 -1 0.4553000966669 -0.5 -0.5 2869 1
i 3 49.93178717598909 2 10 68 -1 0.16184652985227 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10 68 -1 -0.49149339723713 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10.33333333333333 68 -1 0.00317985356362 -0.5 -0.5 367232 1
i 3 49.93178717598909 2 10 68 -1 -0.13745578158145 -0.5 -0.5 367232 1
i 4 49.93178717598909 2 8.58333333333333 68 -1 0.30365974481885 -0.5 -0.5 367232 1
i 3 50.20463847203274 2 8 68 -1 -0.09330014128417 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.66666666666667 68 -1 -0.22164118905792 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.91666666666667 68 -1 0.45330214827413 -0.5 -0.5 2869 1
i 4 50.20463847203274 2 6.66666666666667 68 -1 -0.33066535081273 -0.5 -0.5 2869 1
i 3 50.20463847203274 2 10 68 -1 0.23933604355559 -0.5 -0.5 367232 1
i 3 50.20463847203274 2 10 68 -1 0.06490869197153 -0.5 -0.5 367232 1
i 4 50.20463847203274 2 8.58333333333333 68 -1 0.34305882279253 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 8 68 -1 -0.05497662807164 -0.5 -0.5 2869 1
i 4 50.4774897680764 2 8.33333333333333 68 -1 -0.23225140324355 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 0.3081249020681 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 -0.28333814569244 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8.33333333333333 68 -1 0.24395731867206 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 8 68 -1 0.31940726507423 -0.5 -0.5 2869 1
i 4 50.4774897680764 2 6.66666666666667 68 -1 -0.31323051167527 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 6.66666666666667 68 -1 -0.38796207902762 -0.5 -0.5 2869 1
i 5 50.4774897680764 2 7.33333333333333 68 -1 0.24456470556534 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 7.66666666666667 68 -1 0.03751056177807 -0.5 -0.5 2869 1
i 6 50.4774897680764 2 8.33333333333333 68 -1 -0.0949005765928 -0.5 -0.5 2869 1
i 4 50.4774897680764 2 6.91666666666667 68 -1 -0.24752737356584 -0.5 -0.5 2869 1
i 3 50.4774897680764 2 10 68 -1 -0.03797642478626 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 10.33333333333333 68 -1 -0.46131085609167 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 10 68 -1 0.43803306035764 -0.5 -0.5 367232 1
i 3 50.4774897680764 2 10 68 -1 -0.44811838617393 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.58333333333333 68 -1 0.263451997054 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.91666666666667 68 -1 -0.06926912256225 -0.5 -0.5 367232 1
i 4 50.4774897680764 2 8.58333333333333 68 -1 -0.32231012398632 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 9.41666666666667 68 -1 -0.13496760634777 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 9.66666666666667 68 -1 0.41194625742209 -0.5 -0.5 2869 1
i 2 50.75034106412005 2 9.41666666666667 68 -1 -0.31194443620707 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 8 68 -1 -0.25108771914974 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 8 68 -1 -0.20689694383175 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 8.66666666666667 68 -1 0.42342124289042 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 9.16666666666667 68 -1 0.05012762041225 -0.5 -0.5 2869 1
i 5 50.75034106412005 2 9.66666666666667 68 -1 0.08020534451714 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 8.33333333333333 68 -1 0.36723812973216 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 8 68 -1 -0.1193789849866 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 6.91666666666667 68 -1 0.33042721506063 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 7.33333333333333 68 -1 -0.25783651767156 -0.5 -0.5 2869 1
i 4 50.75034106412005 2 6.91666666666667 68 -1 -0.28890023010316 -0.5 -0.5 2869 1
i 3 50.75034106412005 2 10 68 -1 0.49531871803756 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 10 68 -1 -0.13750277823309 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 10.58333333333333 68 -1 -0.47856994696531 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 11.25 68 -1 0.2000903457899 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 11.75 68 -1 -0.16947026835635 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10 68 -1 0.43210509878714 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10.33333333333333 68 -1 0.29751184994357 -0.5 -0.5 367232 1
i 3 50.75034106412005 2 10 68 -1 0.05301109002508 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 8.58333333333333 68 -1 0.06579570648337 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 8.58333333333333 68 -1 -0.45582849755112 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 9.25 68 -1 -0.15582124991204 -0.5 -0.5 367232 1
i 5 50.75034106412005 2 9.75 68 -1 -0.16639274609148 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 10.33333333333333 68 -1 -0.05798441683563 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 8.58333333333333 68 -1 0.19370566520675 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 9.25 68 -1 0.23345520795283 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 9.75 68 -1 0.15370874824367 -0.5 -0.5 367232 1
i 6 50.75034106412005 2 10.33333333333333 68 -1 0.32278483854648 -0.5 -0.5 367232 1
i 4 50.75034106412005 2 8.91666666666667 68 -1 0.31863518023246 -0.5 -0.5 367232 1
i 3 51.02319236016371 2 9.41666666666667 68 -1 0.45324996715454 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.33333333333333 68 -1 -0.02969976968323 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.66666666666667 68 -1 -0.01848831482659 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 8.33333333333333 68 -1 0.24206747980835 -0.5 -0.5 2869 1
i 4 51.02319236016371 2 6.91666666666667 68 -1 0.11235263365876 -0.5 -0.5 2869 1
i 4 51.02319236016371 2 6.66666666666667 68 -1 0.08638170655585 -0.5 -0.5 2869 1
i 3 51.02319236016371 2 10 68 -1 -0.14287185125406 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 10 68 -1 -0.17016770878834 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 10.58333333333333 68 -1 -0.32645182096848 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.25 68 -1 0.07189025466232 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.75 68 -1 -0.04993314760111 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 10 68 -1 -0.15169479422594 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 10.58333333333333 68 -1 0.27704128131147 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.25 68 -1 -0.42055810664515 -0.5 -0.5 367232 1
i 5 51.02319236016371 2 11.75 68 -1 -0.33204794267528 -0.5 -0.5 367232 1
i 3 51.02319236016371 2 10.33333333333333 68 -1 -0.03150144291789 -0.5 -0.5 367232 1
i 4 51.02319236016371 2 8.91666666666667 68 -1 0.04459854008704 -0.5 -0.5 367232 1
i 3 51.29604365620737 2 8.33333333333333 68 -1 0.40721072757397 -0.5 -0.5 2869 1
i 3 51.29604365620737 2 8 68 -1 -0.09028630827507 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.66666666666667 68 -1 -0.07972085856958 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.91666666666667 68 -1 -0.28188080093043 -0.5 -0.5 2869 1
i 4 51.29604365620737 2 6.66666666666667 68 -1 -0.05058715693722 -0.5 -0.5 2869 1
i 3 51.29604365620737 2 10.33333333333333 68 -1 -0.1686855176194 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 8.91666666666667 68 -1 -0.35218206600215 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 9.25 68 -1 0.29436469548216 -0.5 -0.5 367232 1
i 4 51.29604365620737 2 8.91666666666667 68 -1 0.04784748299215 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 8 68 -1 -0.37725266015738 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 8.33333333333333 68 -1 -0.32261380102499 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 8 68 -1 0.1160140936441 -0.5 -0.5 2869 1
i 4 51.56889495225102 2 6.66666666666667 68 -1 0.05453416989281 -0.5 -0.5 2869 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 0.07668300984095 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.58333333333333 68 -1 -0.34428009247255 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 0.19082666638903 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 0.07377055265576 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.58333333333333 68 -1 -0.48646176227467 -0.5 -0.5 367232 1
i 3 51.56889495225102 2 10.33333333333333 68 -1 -0.39977463185917 -0.5 -0.5 367232 1
i 4 51.56889495225102 2 8.91666666666667 68 -1 -0.15421645086235 -0.5 -0.5 367232 1
i 5 51.56889495225102 2 8.91666666666667 68 -1 0.0537933709484 -0.5 -0.5 367232 1
i 5 51.56889495225102 2 9.5 68 -1 0.17459345128835 -0.5 -0.5 367232 1
i 5 51.56889495225102 2 10 68 -1 0.19653609281201 -0.5 -0.5 367232 1
i 5 51.56889495225102 2 10.58333333333333 68 -1 -0.47524396951996 -0.5 -0.5 367232 1
i 4 51.56889495225102 2 9.25 68 -1 0.41543270510863 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 8 68 -1 0.27888537332808 -0.5 -0.5 2869 1
i 4 51.84174624829468 2 6.66666666666667 68 -1 -0.45070033464628 -0.5 -0.5 2869 1
i 2 51.84174624829468 2 11.75 68 -1 -0.17146268299457 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 12 68 -1 -0.42831954111778 -0.5 -0.5 367232 1
i 2 51.84174624829468 2 11.75 68 -1 0.06279544832373 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.33333333333333 68 -1 -0.38953787721469 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 10.33333333333333 68 -1 -0.07321223629883 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 10.91666666666667 68 -1 -0.04940087295119 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 11.5 68 -1 -0.0312349822265 -0.5 -0.5 367232 1
i 5 51.84174624829468 2 12 68 -1 -0.18695769565989 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.58333333333333 68 -1 0.30031978303845 -0.5 -0.5 367232 1
i 3 51.84174624829468 2 10.33333333333333 68 -1 0.45245852227727 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.25 68 -1 0.33726857333193 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.5 68 -1 0.01512367608506 -0.5 -0.5 367232 1
i 4 51.84174624829468 2 9.25 68 -1 -0.14311195152151 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 8 68 -1 -0.34406099062449 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.66666666666667 68 -1 0.49318746352973 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.91666666666667 68 -1 0.00587155197394 -0.5 -0.5 2869 1
i 4 52.11459754433834 2 6.66666666666667 68 -1 -0.01952193434732 -0.5 -0.5 2869 1
i 2 52.11459754433834 2 11.75 68 -1 0.39011730310069 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.58333333333333 68 -1 0.24428058743439 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.91666666666667 68 -1 0.02338946765652 -0.5 -0.5 367232 1
i 3 52.11459754433834 2 10.58333333333333 68 -1 0.44681317871886 -0.5 -0.5 367232 1
i 4 52.11459754433834 2 9.25 68 -1 0.49994745839263 -0.5 -0.5 367232 1
i 4 52.11459754433834 2 8.91666666666667 68 -1 -0.31567725164608 -0.5 -0.5 367232 1
i 3 52.38744884038199 2 8 68 -1 -0.38366785124893 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 8.33333333333333 68 -1 -0.06523882377455 -0.5 -0.5 2869 1
i 3 52.38744884038199 2 8 68 -1 -0.43655515059365 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 6.66666666666667 68 -1 0.44684268209927 -0.5 -0.5 2869 1
i 5 52.38744884038199 2 6.66666666666667 68 -1 -0.20197711840238 -0.5 -0.5 2869 1
i 6 52.38744884038199 2 7.33333333333333 68 -1 -0.0563567269042 -0.5 -0.5 2869 1
i 6 52.38744884038199 2 7.66666666666667 68 -1 -0.179001475186 -0.5 -0.5 2869 1
i 5 52.38744884038199 2 8.33333333333333 68 -1 -0.24201880362147 -0.5 -0.5 2869 1
i 4 52.38744884038199 2 6.33333333333333 68 -1 -0.3910479808563 -0.5 -0.5 2869 1
i 3 52.38744884038199 2 10.58333333333333 68 -1 0.09203219630116 -0.5 -0.5 367232 1
i 3 52.38744884038199 2 10.33333333333333 68 -1 -0.11488295296487 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 8.91666666666667 68 -1 0.0056167356032 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 9.25 68 -1 -0.01572731233372 -0.5 -0.5 367232 1
i 4 52.38744884038199 2 8.91666666666667 68 -1 -0.22130597473391 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 8 68 -1 -0.36892645634725 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 8 68 -1 0.29135197177385 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 8.66666666666667 68 -1 0.26840310105769 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 9.16666666666667 68 -1 -0.03071769494504 -0.5 -0.5 2869 1
i 5 52.66030013642565 2 9.66666666666667 68 -1 -0.00083901591659 -0.5 -0.5 2869 1
i 4 52.66030013642565 2 7.66666666666667 68 -1 -0.39447259055236 -0.5 -0.5 2869 1
i 4 52.66030013642565 2 6.33333333333333 68 -1 -0.19608944365355 -0.5 -0.5 2869 1
i 3 52.66030013642565 2 10.33333333333333 68 -1 -0.39023946319243 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 10.58333333333333 68 -1 0.3601704969813 -0.5 -0.5 367232 1
i 3 52.66030013642565 2 10.33333333333333 68 -1 0.4944925801345 -0.5 -0.5 367232 1
i 4 52.66030013642565 2 8.91666666666667 68 -1 -0.173525882408 -0.5 -0.5 367232 1
i 3 52.93315143246931 2 7.66666666666667 68 -1 0.45484904550889 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.33333333333333 68 -1 0.10915222514199 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.66666666666667 68 -1 0.07654954789728 -0.5 -0.5 2869 1
i 4 52.93315143246931 2 6.33333333333333 68 -1 0.33684928870172 -0.5 -0.5 2869 1
i 3 52.93315143246931 2 10.33333333333333 68 -1 -0.21784819161121 -0.5 -0.5 367232 1
i 4 52.93315143246931 2 8.91666666666667 68 -1 -0.01479763231453 -0.5 -0.5 367232 1
i 3 53.20600272851296 2 7.66666666666667 68 -1 0.14110108503918 -0.5 -0.5 2869 1
i 3 53.20600272851296 2 8 68 -1 0.26393089678347 -0.5 -0.5 2869 1
i 3 53.20600272851296 2 7.66666666666667 68 -1 0.03848765557713 -0.5 -0.5 2869 1
i 4 53.20600272851296 2 6.33333333333333 68 -1 0.40500325293258 -0.5 -0.5 2869 1
i 6 53.20600272851296 2 6.33333333333333 68 -1 -0.21495744580187 -0.5 -0.5 2869 1
i 5 53.20600272851296 2 6.91666666666667 68 -1 -0.26942019491375 -0.5 -0.5 2869 1
i 5 53.20600272851296 2 7.41666666666667 68 -1 0.23745238912872 -0.5 -0.5 2869 1
i 6 53.20600272851296 2 8 68 -1 0.39062513330396 -0.5 -0.5 2869 1
i 4 53.20600272851296 2 6.66666666666667 68 -1 0.1847977762204 -0.5 -0.5 2869 1
i 3 53.20600272851296 2 10.33333333333333 68 -1 -0.21895825054894 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 8.91666666666667 68 -1 0.01527433457735 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 9.25 68 -1 0.0910912972957 -0.5 -0.5 367232 1
i 4 53.20600272851296 2 8.91666666666667 68 -1 0.10708698095769 -0.5 -0.5 367232 1
i 4 53.47885402455662 2 7.66666666666667 68 -1 -0.04247586581536 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 7.66666666666667 68 -1 -0.10893174742132 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 8.33333333333333 68 -1 -0.2566343297824 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 8.75 68 -1 0.01196801348423 -0.5 -0.5 2869 1
i 5 53.47885402455662 2 9.41666666666667 68 -1 -0.17402848547468 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 8 68 -1 -0.49772037089458 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.66666666666667 68 -1 -0.3448570535252 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.91666666666667 68 -1 0.0847191918607 -0.5 -0.5 2869 1
i 4 53.47885402455662 2 6.66666666666667 68 -1 0.00103610738045 -0.5 -0.5 2869 1
i 3 53.47885402455662 2 10.33333333333333 68 -1 -0.48391599869346 -0.5 -0.5 367232 1
i 3 53.47885402455662 2 10.58333333333333 68 -1 0.32024910947568 -0.5 -0.5 367232 1
i 3 53.47885402455662 2 10.33333333333333 68 -1 0.4034610508977 -0.5 -0.5 367232 1
i 4 53.47885402455662 2 8.91666666666667 68 -1 0.08929765865257 -0.5 -0.5 367232 1
i 5 53.47885402455662 2 8.91666666666667 68 -1 0.39664003799687 -0.5 -0.5 367232 1
i 5 53.47885402455662 2 9.5 68 -1 0.13807578042652 -0.5 -0.5 367232 1
i 5 53.47885402455662 2 10 68 -1 0.17189974955272 -0.5 -0.5 367232 1
i 6 53.47885402455662 2 10.58333333333333 68 -1 0.15413206644465 -0.5 -0.5 367232 1
i 4 53.47885402455662 2 8.58333333333333 68 -1 -0.47874338723378 -0.5 -0.5 367232 1
i 3 53.75170532060027 2 8 68 -1 0.27211610760073 -0.5 -0.5 2869 1
i 3 53.75170532060027 2 8.33333333333333 68 -1 0.21222135064487 -0.5 -0.5 2869 1
i 3 53.75170532060027 2 8 68 -1 -0.24804997091627 -0.5 -0.5 2869 1
i 4 53.75170532060027 2 6.66666666666667 68 -1 0.17331855197821 -0.5 -0.5 2869 1
i 4 53.75170532060027 2 6.33333333333333 68 -1 0.14013584665966 -0.5 -0.5 2869 1
i 3 53.75170532060027 2 10.33333333333333 68 -1 -0.09220212442842 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 10.33333333333333 68 -1 0.01557293510393 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 10.91666666666667 68 -1 -0.4975383970477 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 11.5 68 -1 -0.24007223280851 -0.5 -0.5 367232 1
i 5 53.75170532060027 2 12 68 -1 -0.42683152830577 -0.5 -0.5 367232 1
i 3 53.75170532060027 2 10 68 -1 0.35306116070782 -0.5 -0.5 367232 1
i 4 53.75170532060027 2 8.58333333333333 68 -1 -0.39750113659645 -0.5 -0.5 367232 1
i 3 54.02455661664393 2 8 68 -1 -0.28003334965987 -0.5 -0.5 2869 1
i 3 54.02455661664393 2 7.66666666666667 68 -1 0.23285483629411 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.33333333333333 68 -1 -0.23921184475196 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.66666666666667 68 -1 -0.30625770991846 -0.5 -0.5 2869 1
i 4 54.02455661664393 2 6.33333333333333 68 -1 -0.01004580663805 -0.5 -0.5 2869 1
i 3 54.02455661664393 2 10 68 -1 0.33479618537123 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.58333333333333 68 -1 -0.22766085851425 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.91666666666667 68 -1 0.35635086598197 -0.5 -0.5 367232 1
i 4 54.02455661664393 2 8.58333333333333 68 -1 -0.42902758832084 -0.5 -0.5 367232 1
i 3 54.29740791268758 2 7.66666666666667 68 -1 -0.02648784986091 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 8 68 -1 0.25873174926018 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 7.66666666666667 68 -1 -0.3239368731146 -0.5 -0.5 2869 1
i 4 54.29740791268758 2 6.33333333333333 68 -1 -0.47117726350283 -0.5 -0.5 2869 1
i 3 54.29740791268758 2 10 68 -1 0.00496568687872 -0.5 -0.5 367232 1
i 3 54.29740791268758 2 10.33333333333333 68 -1 0.20274256805042 -0.5 -0.5 367232 1
i 3 54.29740791268758 2 10 68 -1 -0.41162266458154 -0.5 -0.5 367232 1
i 4 54.29740791268758 2 8.58333333333333 68 -1 -0.28383046584817 -0.5 -0.5 367232 1
i 5 54.29740791268758 2 8.58333333333333 68 -1 -0.10060315469811 -0.5 -0.5 367232 1
i 6 54.29740791268758 2 9.25 68 -1 -0.05485718825739 -0.5 -0.5 367232 1
i 5 54.29740791268758 2 9.75 68 -1 0.40714351308369 -0.5 -0.5 367232 1
i 5 54.29740791268758 2 10.33333333333333 68 -1 -0.46744037981109 -0.5 -0.5 367232 1
i 4 54.29740791268758 2 8.91666666666667 68 -1 -0.30577986088115 -0.5 -0.5 367232 1
i 3 54.57025920873124 2 7.66666666666667 68 -1 -0.06246924883528 -0.5 -0.5 2869 1
i 4 54.57025920873124 2 6.33333333333333 68 -1 0.36985346841846 -0.5 -0.5 2869 1
i 3 54.57025920873124 2 10 68 -1 0.36019731649143 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 10 68 -1 -0.0136062812858 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 10.58333333333333 68 -1 0.02920043766906 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 11.25 68 -1 0.23914601523496 -0.5 -0.5 367232 1
i 5 54.57025920873124 2 11.75 68 -1 0.21082907723069 -0.5 -0.5 367232 1
i 3 54.57025920873124 2 10.33333333333333 68 -1 0.37626297371657 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 8.91666666666667 68 -1 0.36125878466722 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 9.25 68 -1 0.16998235944281 -0.5 -0.5 367232 1
i 4 54.57025920873124 2 8.91666666666667 68 -1 -0.04632487083519 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 7.66666666666667 68 -1 0.02621556922046 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.33333333333333 68 -1 0.31917419620594 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.66666666666667 68 -1 0.13318377242463 -0.5 -0.5 2869 1
i 4 54.8431105047749 2 6.33333333333333 68 -1 -0.1567857231237 -0.5 -0.5 2869 1
i 3 54.8431105047749 2 10.33333333333333 68 -1 -0.33908338198952 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 10.58333333333333 68 -1 0.17111977048274 -0.5 -0.5 367232 1
i 3 54.8431105047749 2 10.33333333333333 68 -1 -0.43352928467826 -0.5 -0.5 367232 1
i 4 54.8431105047749 2 8.91666666666667 68 -1 0.39153912635869 -0.5 -0.5 367232 1
i 4 54.8431105047749 2 8.58333333333333 68 -1 0.09404357618573 -0.5 -0.5 367232 1
i 3 55.11596180081855 2 7.66666666666667 68 -1 0.34562281359092 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 8 68 -1 0.00986196958616 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 7.66666666666667 68 -1 -0.08832837925853 -0.5 -0.5 2869 1
i 4 55.11596180081855 2 6.33333333333333 68 -1 -0.29229547633024 -0.5 -0.5 2869 1
i 6 55.11596180081855 2 6.33333333333333 68 -1 -0.31965933516275 -0.5 -0.5 2869 1
i 5 55.11596180081855 2 6.91666666666667 68 -1 0.23868157530089 -0.5 -0.5 2869 1
i 6 55.11596180081855 2 7.41666666666667 68 -1 0.05997320373395 -0.5 -0.5 2869 1
i 5 55.11596180081855 2 8 68 -1 -0.33428881759335 -0.5 -0.5 2869 1
i 3 55.11596180081855 2 10.33333333333333 68 -1 0.41433980694521 -0.5 -0.5 367232 1
i 3 55.11596180081855 2 10 68 -1 -0.27703374699062 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.58333333333333 68 -1 -0.37315321937951 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.91666666666667 68 -1 0.26475688291437 -0.5 -0.5 367232 1
i 4 55.11596180081855 2 8.58333333333333 68 -1 -0.29400352630245 -0.5 -0.5 367232 1
i 3 55.38881309686221 2 7.66666666666667 68 -1 -0.10033372334405 -0.5 -0.5 2869 1
i 5 55.38881309686221 2 7.66666666666667 68 -1 -0.40405915031756 -0.5 -0.5 2869 1
i 4 55.38881309686221 2 8.33333333333333 68 -1 -0.34487985461477 -0.5 -0.5 2869 1
i 5 55.38881309686221 2 8.75 68 -1 0.33982636576335 -0.5 -0.5 2869 1
i 5 55.38881309686221 2 9.41666666666667 68 -1 0.18732332957327 -0.5 -0.5 2869 1
i 4 55.38881309686221 2 6.33333333333333 68 -1 0.2811595500144 -0.5 -0.5 2869 1
i 3 55.38881309686221 2 10 68 -1 -0.27289601208279 -0.5 -0.5 367232 1
i 4 55.38881309686221 2 10.33333333333333 68 -1 0.00139608611834 -0.5 -0.5 367232 1
i 3 55.38881309686221 2 10 68 -1 -0.44167223243704 -0.5 -0.5 367232 1
i 4 55.38881309686221 2 8.58333333333333 68 -1 0.2292811753954 -0.5 -0.5 367232 1
i 3 55.66166439290586 2 7.66666666666667 68 -1 0.43458998808064 -0.5 -0.5 2869 1
i 4 55.66166439290586 2 6.33333333333333 68 -1 0.39243864475259 -0.5 -0.5 2869 1
i 3 55.66166439290586 2 10 68 -1 0.17758674221633 -0.5 -0.5 367232 1
i 4 55.66166439290586 2 8.58333333333333 68 -1 -0.3206294841387 -0.5 -0.5 367232 1
i 3 55.93451568894952 2 7.66666666666667 68 -1 -0.33359672998091 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.33333333333333 68 -1 0.06030941240425 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.66666666666667 68 -1 0.14861981517456 -0.5 -0.5 2869 1
i 4 55.93451568894952 2 6.33333333333333 68 -1 -0.47071236181962 -0.5 -0.5 2869 1
i 3 55.93451568894952 2 10 68 -1 -0.25659070866892 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.58333333333333 68 -1 0.37926658722797 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.91666666666667 68 -1 -0.14945938234584 -0.5 -0.5 367232 1
i 4 55.93451568894952 2 8.58333333333333 68 -1 0.41711745255951 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 7.66666666666667 68 -1 0.14509480173211 -0.5 -0.5 2869 1
i 3 56.20736698499317 2 8 68 -1 -0.03061088957695 -0.5 -0.5 2869 1
i 3 56.20736698499317 2 7.66666666666667 68 -1 0.49145689355919 -0.5 -0.5 2869 1
i 4 56.20736698499317 2 6.33333333333333 68 -1 -0.48602806452224 -0.5 -0.5 2869 1
i 6 56.20736698499317 2 6.33333333333333 68 -1 -0.41271736400192 -0.5 -0.5 2869 1
i 5 56.20736698499317 2 6.91666666666667 68 -1 -0.26810685912807 -0.5 -0.5 2869 1
i 6 56.20736698499317 2 7.41666666666667 68 -1 0.4466504851124 -0.5 -0.5 2869 1
i 5 56.20736698499317 2 8 68 -1 -0.1875186153987 -0.5 -0.5 2869 1
i 4 56.20736698499317 2 6.66666666666667 68 -1 0.47974440702496 -0.5 -0.5 2869 1
i 3 56.20736698499317 2 10 68 -1 0.45819109090226 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 10.33333333333333 68 -1 -0.44755922430429 -0.5 -0.5 367232 1
i 3 56.20736698499317 2 10 68 -1 0.16416531252718 -0.5 -0.5 367232 1
i 4 56.20736698499317 2 8.58333333333333 68 -1 0.18319627862074 -0.5 -0.5 367232 1
i 5 56.20736698499317 2 8.58333333333333 68 -1 -0.44898707559926 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 9.25 68 -1 0.04311115185841 -0.5 -0.5 367232 1
i 6 56.20736698499317 2 9.75 68 -1 -0.09938069740312 -0.5 -0.5 367232 1
i 5 56.20736698499317 2 10.33333333333333 68 -1 0.47918951008628 -0.5 -0.5 367232 1
i 3 56.48021828103683 2 7.66666666666667 68 -1 -0.2565421233081 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 7.66666666666667 68 -1 0.4487879581385 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 8.33333333333333 68 -1 -0.17730668131364 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 8.75 68 -1 -0.10755369397595 -0.5 -0.5 2869 1
i 5 56.48021828103683 2 9.41666666666667 68 -1 0.3101225635615 -0.5 -0.5 2869 1
i 3 56.48021828103683 2 8 68 -1 0.14165392754108 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.66666666666667 68 -1 0.47598512050888 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.91666666666667 68 -1 -0.31356860339346 -0.5 -0.5 2869 1
i 4 56.48021828103683 2 6.66666666666667 68 -1 -0.01796825918579 -0.5 -0.5 2869 1
i 3 56.48021828103683 2 10 68 -1 -0.09995637276472 -0.5 -0.5 367232 1
i 4 56.48021828103683 2 10 68 -1 -0.43857365274126 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 10.58333333333333 68 -1 0.47515675801007 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 11.25 68 -1 -0.20635062484628 -0.5 -0.5 367232 1
i 5 56.48021828103683 2 11.75 68 -1 0.12683336444242 -0.5 -0.5 367232 1
i 4 56.48021828103683 2 8.58333333333333 68 -1 -0.30627093960399 -0.5 -0.5 367232 1
i 3 56.7530695770805 2 8 68 -1 -0.26644329695364 -0.5 -0.5 2869 1
i 3 56.7530695770805 2 8.33333333333333 68 -1 -0.30898112870261 -0.5 -0.5 2869 1
i 3 56.7530695770805 2 8 68 -1 -0.36196945039021 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 6.66666666666667 68 -1 -0.16493324396943 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 6.33333333333333 68 -1 -0.20086314311138 -0.5 -0.5 2869 1
i 4 56.7530695770805 2 10 68 -1 0.38594762648599 -0.5 -0.5 367232 1
i 4 56.7530695770805 2 8.58333333333333 68 -1 0.20625371143809 -0.5 -0.5 367232 1
i 3 57.02592087312415 2 8 68 -1 0.18272379851161 -0.5 -0.5 2869 1
i 3 57.02592087312415 2 7.66666666666667 68 -1 0.1329000433371 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.33333333333333 68 -1 -0.05387533742913 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.66666666666667 68 -1 -0.30759178400181 -0.5 -0.5 2869 1
i 4 57.02592087312415 2 6.33333333333333 68 -1 -0.34120087282767 -0.5 -0.5 2869 1
i 3 57.02592087312415 2 10 68 -1 -0.13115738305926 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.58333333333333 68 -1 -0.43240624570495 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.91666666666667 68 -1 0.30058131407346 -0.5 -0.5 367232 1
i 4 57.02592087312415 2 8.58333333333333 68 -1 0.34852942205416 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 7.66666666666667 68 -1 0.1910306129205 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 8 68 -1 -0.40039780742143 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 7.66666666666667 68 -1 -0.03678133478418 -0.5 -0.5 2869 1
i 4 57.2987721691678 2 6.33333333333333 68 -1 -0.42568124631617 -0.5 -0.5 2869 1
i 3 57.2987721691678 2 10 68 -1 -0.25193422192045 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 10.33333333333333 68 -1 -0.44510900632062 -0.5 -0.5 367232 1
i 3 57.2987721691678 2 10 68 -1 0.29788758438378 -0.5 -0.5 367232 1
i 4 57.2987721691678 2 8.58333333333333 68 -1 0.22594887612417 -0.5 -0.5 367232 1
i 6 57.2987721691678 2 8.58333333333333 68 -1 0.3785236636302 -0.5 -0.5 367232 1
i 5 57.2987721691678 2 9.25 68 -1 -0.1189203266495 -0.5 -0.5 367232 1
i 6 57.2987721691678 2 9.75 68 -1 -0.08209506474601 -0.5 -0.5 367232 1
i 5 57.2987721691678 2 10.33333333333333 68 -1 0.03801277853736 -0.5 -0.5 367232 1
i 4 57.2987721691678 2 8.91666666666667 68 -1 0.28462864227846 -0.5 -0.5 367232 1
i 3 57.57162346521146 2 7.66666666666667 68 -1 0.04672103662832 -0.5 -0.5 2869 1
i 4 57.57162346521146 2 6.33333333333333 68 -1 -0.00399138468532 -0.5 -0.5 2869 1
i 4 57.57162346521146 2 10 68 -1 -0.48189364573201 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 10 68 -1 -0.39894185010862 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 10.58333333333333 68 -1 -0.43439068012502 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 11.25 68 -1 -0.08623580113096 -0.5 -0.5 367232 1
i 5 57.57162346521146 2 11.75 68 -1 0.19421433296951 -0.5 -0.5 367232 1
i 3 57.57162346521146 2 10.33333333333333 68 -1 0.17056804356476 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 8.91666666666667 68 -1 0.08581784180606 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 9.25 68 -1 -0.49497293563297 -0.5 -0.5 367232 1
i 4 57.57162346521146 2 8.91666666666667 68 -1 -0.35361643644654 -0.5 -0.5 367232 1
i 3 57.84447476125511 2 7.66666666666667 68 -1 -0.20970699298253 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.33333333333333 68 -1 0.41599982970678 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.66666666666667 68 -1 -0.24129872234764 -0.5 -0.5 2869 1
i 4 57.84447476125511 2 6.33333333333333 68 -1 -0.39135313333119 -0.5 -0.5 2869 1
i 3 57.84447476125511 2 10.33333333333333 68 -1 -0.21224041256855 -0.5 -0.5 367232 1
i 4 57.84447476125511 2 10.58333333333333 68 -1 -0.27430165154977 -0.5 -0.5 367232 1
i 3 57.84447476125511 2 10.33333333333333 68 -1 -0.16409785393337 -0.5 -0.5 367232 1
i 4 57.84447476125511 2 8.91666666666667 68 -1 -0.32004314509736 -0.5 -0.5 367232 1
i 4 57.84447476125511 2 8.58333333333333 68 -1 -0.17904475056406 -0.5 -0.5 367232 1
i 3 58.11732605729877 2 7.66666666666667 68 -1 -0.09922450172845 -0.5 -0.5 2869 1
i 3 58.11732605729877 2 8 68 -1 0.15856537950948 -0.5 -0.5 2869 1
i 3 58.11732605729877 2 7.66666666666667 68 -1 0.134139450542 -0.5 -0.5 2869 1
i 4 58.11732605729877 2 6.33333333333333 68 -1 0.03965111253642 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.33333333333333 68 -1 -0.0029757041113 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.91666666666667 68 -1 0.26651063167362 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 7.41666666666667 68 -1 -0.13693765751768 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 8 68 -1 -0.27139351027052 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 6.33333333333333 68 -1 -0.4059184513701 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.91666666666667 68 -1 -0.09352273059122 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 7.41666666666667 68 -1 0.13217635222886 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 8 68 -1 0.19334299476203 -0.5 -0.5 2869 1
i 5 58.11732605729877 2 6.33333333333333 68 -1 -0.12278818886057 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 6.91666666666667 68 -1 0.05663723860855 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 7.41666666666667 68 -1 0.22069941510467 -0.5 -0.5 2869 1
i 6 58.11732605729877 2 8 68 -1 -0.22114737901379 -0.5 -0.5 2869 1
i 4 58.11732605729877 2 6.66666666666667 68 -1 0.46868772801894 -0.5 -0.5 2869 1
i 3 58.11732605729877 2 10.33333333333333 68 -1 0.5 -0.5 -0.5 367232 1
i 3 58.11732605729877 2 10 68 -1 0.35677646364981 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.58333333333333 68 -1 -0.39572338841522 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.91666666666667 68 -1 0.23226290340862 -0.5 -0.5 367232 1
i 4 58.11732605729877 2 8.58333333333333 68 -1 -0.16184043881478 -0.5 -0.5 367232 1
i 3 58.39017735334242 2 7.66666666666667 68 -1 0.48352143105184 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 7.66666666666667 68 -1 -0.2945202799308 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.33333333333333 68 -1 -0.08793173783303 -0.5 -0.5 2869 1
i 4 58.39017735334242 2 8.75 68 -1 -0.39061766443138 -0.5 -0.5 2869 1
i 4 58.39017735334242 2 9.41666666666667 68 -1 0.35679221598872 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 7.66666666666667 68 -1 -0.32195394520919 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.33333333333333 68 -1 0.37164980579923 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 8.75 68 -1 -0.30610490917207 -0.5 -0.5 2869 1
i 5 58.39017735334242 2 9.41666666666667 68 -1 -0.26375981509557 -0.5 -0.5 2869 1
i 4 58.39017735334242 2 6.66666666666667 68 -1 -0.36723493337623 -0.5 -0.5 2869 1
i 3 58.39017735334242 2 10 68 -1 0.49297358675666 -0.5 -0.5 367232 1
i 3 58.39017735334242 2 10.33333333333333 68 -1 -0.26434865289163 -0.5 -0.5 367232 1
i 4 58.39017735334242 2 10 68 -1 -0.18527687801661 -0.5 -0.5 367232 1
i 4 58.39017735334242 2 8.58333333333333 68 -1 0.34612498330299 -0.5 -0.5 367232 1
i 4 58.66302864938609 2 6.66666666666667 68 -1 0.35238786306547 -0.5 -0.5 2869 1
i 3 58.66302864938609 2 10 68 -1 0.02658998029799 -0.5 -0.5 367232 1
i 4 58.66302864938609 2 8.58333333333333 68 -1 -0.46456265493535 -0.5 -0.5 367232 1
i 3 58.93587994542975 2 8 68 -1 -0.43231490671476 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 8.33333333333333 68 -1 -0.0923893208696 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 8 68 -1 0.35252228911982 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 8 68 -1 -0.25029525213562 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.66666666666667 68 -1 0.03723554797607 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.91666666666667 68 -1 0.47796560398737 -0.5 -0.5 2869 1
i 4 58.93587994542975 2 6.66666666666667 68 -1 -0.08377797900546 -0.5 -0.5 2869 1
i 3 58.93587994542975 2 10 68 -1 -0.22292080275016 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.58333333333333 68 -1 0.30857251689402 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.91666666666667 68 -1 0.18814912242869 -0.5 -0.5 367232 1
i 4 58.93587994542975 2 8.58333333333333 68 -1 0.23633611222921 -0.5 -0.5 367232 1
i 2 59.2087312414734 2 9.41666666666667 68 -1 -0.00213697341669 -0.5 -0.5 2869 1
i 2 59.2087312414734 2 9.66666666666667 68 -1 -0.31136991503902 -0.5 -0.5 2869 1
i 2 59.2087312414734 2 9.41666666666667 68 -1 0.46688267910665 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 0.16354620140862 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 -0.01050571338594 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8.33333333333333 68 -1 0.4478587385017 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 8 68 -1 0.09664590781883 -0.5 -0.5 2869 1
i 4 59.2087312414734 2 6.66666666666667 68 -1 0.12793789575634 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 6.66666666666667 68 -1 0.39095145344559 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 7.33333333333333 68 -1 0.250203529053 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 7.66666666666667 68 -1 -0.19150511273123 -0.5 -0.5 2869 1
i 6 59.2087312414734 2 8.33333333333333 68 -1 0.45767028414847 -0.5 -0.5 2869 1
i 4 59.2087312414734 2 6.91666666666667 68 -1 0.04073847245884 -0.5 -0.5 2869 1
i 3 59.2087312414734 2 10 68 -1 -0.13372537082871 -0.5 -0.5 367232 1
i 3 59.2087312414734 2 10.33333333333333 68 -1 0.20520806032596 -0.5 -0.5 367232 1
i 3 59.2087312414734 2 10 68 -1 -0.19267441187052 -0.5 -0.5 367232 1
i 4 59.2087312414734 2 8.58333333333333 68 -1 -0.39377836727869 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 8.58333333333333 68 -1 -0.30005988081781 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 9.25 68 -1 0.40631898767674 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.75 68 -1 -0.05712760740594 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 10.33333333333333 68 -1 0.1838867232605 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 8.58333333333333 68 -1 0.47066029040239 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 9.25 68 -1 0.27017343161789 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.75 68 -1 -0.36616117188035 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 10.33333333333333 68 -1 0.42244146991271 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 8.58333333333333 68 -1 0.21276010541097 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.25 68 -1 -0.27207384828019 -0.5 -0.5 367232 1
i 5 59.2087312414734 2 9.75 68 -1 -0.09718331578197 -0.5 -0.5 367232 1
i 6 59.2087312414734 2 10.33333333333333 68 -1 0.30678445835096 -0.5 -0.5 367232 1
i 4 59.2087312414734 2 8.91666666666667 68 -1 -0.19997551659389 -0.5 -0.5 367232 1
i 3 59.48158253751706 2 9.41666666666667 68 -1 0.2965584822979 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 8 68 -1 -0.17869311743549 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 8 68 -1 -0.16192051231597 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 8.66666666666667 68 -1 0.19910994105099 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 9.16666666666667 68 -1 0.44897708062299 -0.5 -0.5 2869 1
i 5 59.48158253751706 2 9.66666666666667 68 -1 0.04967226482347 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 8.33333333333333 68 -1 0.35300441748798 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 6.91666666666667 68 -1 -0.31725826948588 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 7.33333333333333 68 -1 0.20132276140266 -0.5 -0.5 2869 1
i 4 59.48158253751706 2 6.91666666666667 68 -1 0.41658857465723 -0.5 -0.5 2869 1
i 3 59.48158253751706 2 10 68 -1 -0.42040091717139 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 10 68 -1 -0.0499006670242 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 10.58333333333333 68 -1 0.42328526427321 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.25 68 -1 -0.32797077224477 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.75 68 -1 0.07600584471816 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 10 68 -1 -0.37643339994953 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 10.58333333333333 68 -1 0.19584289663218 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.25 68 -1 0.08999080948677 -0.5 -0.5 367232 1
i 5 59.48158253751706 2 11.75 68 -1 0.36221612696161 -0.5 -0.5 367232 1
i 4 59.48158253751706 2 8.91666666666667 68 -1 0.24842161208975 -0.5 -0.5 367232 1
i 3 59.75443383356071 2 8.33333333333333 68 -1 -0.45849367827006 -0.5 -0.5 2869 1
i 3 59.75443383356071 2 8.66666666666667 68 -1 0.17622899207317 -0.5 -0.5 2869 1
i 3 59.75443383356071 2 8.33333333333333 68 -1 0.25191299142503 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 6.91666666666667 68 -1 -0.46163598213981 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 6.66666666666667 68 -1 0.42705332027813 -0.5 -0.5 2869 1
i 4 59.75443383356071 2 8.91666666666667 68 -1 0.19831500421254 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 8.33333333333333 68 -1 0.1164977238546 -0.5 -0.5 2869 1
i 3 60.02728512960436 2 8 68 -1 0.07655141310366 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.66666666666667 68 -1 0.03946408523507 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.91666666666667 68 -1 -0.15231936382522 -0.5 -0.5 2869 1
i 4 60.02728512960436 2 6.66666666666667 68 -1 0.25316884948657 -0.5 -0.5 2869 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 -0.21964170588913 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.58333333333333 68 -1 0.3884328372114 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 0.09428306301576 -0.5 -0.5 367232 1
i 3 60.02728512960436 2 10.33333333333333 68 -1 -0.46879961118587 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 8.91666666666667 68 -1 0.16348654746233 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 9.25 68 -1 -0.18665575867415 -0.5 -0.5 367232 1
i 4 60.02728512960436 2 8.91666666666667 68 -1 -0.17845079251409 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 8 68 -1 -0.39269641175208 -0.5 -0.5 2869 1
i 3 60.30013642564802 2 8.33333333333333 68 -1 0.19613427515852 -0.5 -0.5 2869 1
i 4 60.30013642564802 2 8 68 -1 -0.41390071459079 -0.5 -0.5 2869 1
i 4 60.30013642564802 2 6.66666666666667 68 -1 -0.37879539719064 -0.5 -0.5 2869 1
i 2 60.30013642564802 2 11.75 68 -1 0.13453250026556 -0.5 -0.5 367232 1
i 2 60.30013642564802 2 12 68 -1 -0.36684300750255 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 11.75 68 -1 0.43405035705294 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.33333333333333 68 -1 0.19639696754054 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.33333333333333 68 -1 0.41558686458604 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.58333333333333 68 -1 0.2306792395 -0.5 -0.5 367232 1
i 3 60.30013642564802 2 10.33333333333333 68 -1 0.26745882737669 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 8.91666666666667 68 -1 0.12811016563622 -0.5 -0.5 367232 1
i 5 60.30013642564802 2 8.91666666666667 68 -1 -0.07903096657024 -0.5 -0.5 367232 1
i 5 60.30013642564802 2 9.5 68 -1 -0.48189525425627 -0.5 -0.5 367232 1
i 5 60.30013642564802 2 10 68 -1 -0.04254401941239 -0.5 -0.5 367232 1
i 6 60.30013642564802 2 10.58333333333333 68 -1 -0.41902270738379 -0.5 -0.5 367232 1
i 4 60.30013642564802 2 9.25 68 -1 0.35461461622609 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 8 68 -1 0.27311561473257 -0.5 -0.5 2869 1
i 4 60.57298772169168 2 6.66666666666667 68 -1 0.41248126244918 -0.5 -0.5 2869 1
i 2 60.57298772169168 2 11.75 68 -1 0.45138788875568 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 10.33333333333333 68 -1 -0.05092548389532 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 10.33333333333333 68 -1 -0.44409260174785 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 10.91666666666667 68 -1 0.07677672639603 -0.5 -0.5 367232 1
i 5 60.57298772169168 2 11.5 68 -1 -0.33608158898102 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 12 68 -1 0.21418474747587 -0.5 -0.5 367232 1
i 3 60.57298772169168 2 10.58333333333333 68 -1 0.33385809116433 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.25 68 -1 0.08665123677154 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.5 68 -1 0.46672338907849 -0.5 -0.5 367232 1
i 4 60.57298772169168 2 9.25 68 -1 0.34948205866908 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 8 68 -1 0.24769768139966 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.66666666666667 68 -1 -0.06703498927618 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.91666666666667 68 -1 -0.38693821614124 -0.5 -0.5 2869 1
i 4 60.84583901773534 2 6.66666666666667 68 -1 -0.17184976474913 -0.5 -0.5 2869 1
i 3 60.84583901773534 2 10.58333333333333 68 -1 0.08375932953167 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 10.91666666666667 68 -1 0.42688101782805 -0.5 -0.5 367232 1
i 3 60.84583901773534 2 10.58333333333333 68 -1 0.45487725732578 -0.5 -0.5 367232 1
i 4 60.84583901773534 2 9.25 68 -1 0.34324135928945 -0.5 -0.5 367232 1
i 4 60.84583901773534 2 8.91666666666667 68 -1 -0.38261798592781 -0.5 -0.5 367232 1
i 3 61.11869031377899 2 8 68 -1 -0.3515372925753 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 8.33333333333333 68 -1 0.08173103855262 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 8 68 -1 0.11096802950906 -0.5 -0.5 2869 1
i 4 61.11869031377899 2 6.66666666666667 68 -1 0.21097202546945 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 6.66666666666667 68 -1 0.41584402162869 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 7.33333333333333 68 -1 -0.08922225218298 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 7.66666666666667 68 -1 -0.2266505002052 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 8.33333333333333 68 -1 -0.24294148160311 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 6.66666666666667 68 -1 -0.23890551482071 -0.5 -0.5 2869 1
i 6 61.11869031377899 2 7.33333333333333 68 -1 -0.04932310300407 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 7.66666666666667 68 -1 -0.29090726847377 -0.5 -0.5 2869 1
i 5 61.11869031377899 2 8.33333333333333 68 -1 0.4201833390038 -0.5 -0.5 2869 1
i 4 61.11869031377899 2 6.91666666666667 68 -1 -0.1987704607783 -0.5 -0.5 2869 1
i 3 61.11869031377899 2 10.58333333333333 68 -1 0.15520421217985 -0.5 -0.5 367232 1
i 3 61.11869031377899 2 10.33333333333333 68 -1 0.30110089203147 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 8.91666666666667 68 -1 0.06090192207295 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 9.25 68 -1 0.130725492562 -0.5 -0.5 367232 1
i 4 61.11869031377899 2 8.91666666666667 68 -1 -0.40268009996017 -0.5 -0.5 367232 1
i 3 61.39154160982265 2 8 68 -1 0.41944309295856 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 8 68 -1 -0.23014396186267 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 8.66666666666667 68 -1 -0.0495545507608 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 9.16666666666667 68 -1 0.17304349236427 -0.5 -0.5 2869 1
i 5 61.39154160982265 2 9.66666666666667 68 -1 -0.17452830309163 -0.5 -0.5 2869 1
i 4 61.39154160982265 2 6.91666666666667 68 -1 0.11768012191474 -0.5 -0.5 2869 1
i 3 61.39154160982265 2 10.33333333333333 68 -1 0.24066150022588 -0.5 -0.5 367232 1
i 3 61.39154160982265 2 10.58333333333333 68 -1 0.19758933439811 -0.5 -0.5 367232 1
i 3 61.39154160982265 2 10.33333333333333 68 -1 0.2752849194743 -0.5 -0.5 367232 1
i 4 61.39154160982265 2 8.91666666666667 68 -1 -0.10918423060084 -0.5 -0.5 367232 1
i 4 61.6643929058663 2 6.91666666666667 68 -1 -0.093090516207 -0.5 -0.5 2869 1
i 4 61.6643929058663 2 7.33333333333333 68 -1 -0.04719109972578 -0.5 -0.5 2869 1
i 4 61.6643929058663 2 6.91666666666667 68 -1 0.4059607588575 -0.5 -0.5 2869 1
i 3 61.6643929058663 2 10.33333333333333 68 -1 0.37528860681789 -0.5 -0.5 367232 1
i 4 61.6643929058663 2 8.91666666666667 68 -1 0.26514117389311 -0.5 -0.5 367232 1
i 3 61.93724420190996 2 8.33333333333333 68 -1 -0.16153089370291 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 8.66666666666667 68 -1 0.08713877740809 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 8.33333333333333 68 -1 -0.3393476394398 -0.5 -0.5 2869 1
i 4 61.93724420190996 2 6.91666666666667 68 -1 -0.2879749272915 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 6.91666666666667 68 -1 -0.24490672171481 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 7.66666666666667 68 -1 0.29546209548957 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 8 68 -1 -0.49618390615157 -0.5 -0.5 2869 1
i 6 61.93724420190996 2 8.66666666666667 68 -1 0.24781444425837 -0.5 -0.5 2869 1
i 4 61.93724420190996 2 7.33333333333333 68 -1 0.16463179923038 -0.5 -0.5 2869 1
i 3 61.93724420190996 2 10.33333333333333 68 -1 0.44977021321173 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 8.91666666666667 68 -1 0.09104256122315 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 9.25 68 -1 -0.26333854961035 -0.5 -0.5 367232 1
i 4 61.93724420190996 2 8.91666666666667 68 -1 0.06341510503754 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 8.33333333333333 68 -1 -0.3556360473249 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.33333333333333 68 -1 -0.12957252107398 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.66666666666667 68 -1 -0.39993127182417 -0.5 -0.5 2869 1
i 4 62.21009549795361 2 7.33333333333333 68 -1 0.25775473664623 -0.5 -0.5 2869 1
i 3 62.21009549795361 2 10.33333333333333 68 -1 -0.30659663517206 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 10.58333333333333 68 -1 0.24746640622378 -0.5 -0.5 367232 1
i 3 62.21009549795361 2 10.33333333333333 68 -1 -0.29451503380777 -0.5 -0.5 367232 1
i 4 62.21009549795361 2 8.91666666666667 68 -1 -0.04619012855498 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 8.91666666666667 68 -1 0.44241132865522 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 9.5 68 -1 -0.29981160912144 -0.5 -0.5 367232 1
i 5 62.21009549795361 2 10 68 -1 0.49471941453456 -0.5 -0.5 367232 1
i 5 62.21009549795361 2 10.58333333333333 68 -1 -0.30315606352595 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 8.91666666666667 68 -1 0.25520643421224 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 9.5 68 -1 0.00878413453746 -0.5 -0.5 367232 1
i 5 62.21009549795361 2 10 68 -1 -0.10064736227152 -0.5 -0.5 367232 1
i 6 62.21009549795361 2 10.58333333333333 68 -1 0.39961078234699 -0.5 -0.5 367232 1
i 4 62.21009549795361 2 9.25 68 -1 0.49666879714598 -0.5 -0.5 367232 1
i 4 62.48294679399726 2 7.33333333333333 68 -1 -0.17089265607987 -0.5 -0.5 2869 1
i 4 62.48294679399726 2 6.91666666666667 68 -1 0.12302428014804 -0.5 -0.5 2869 1
i 3 62.48294679399726 2 10.33333333333333 68 -1 0.29929403348392 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 10.33333333333333 68 -1 0.00232576709022 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 10.91666666666667 68 -1 0.41058889563356 -0.5 -0.5 367232 1
i 5 62.48294679399726 2 11.5 68 -1 0.47108221826788 -0.5 -0.5 367232 1
i 4 62.48294679399726 2 12 68 -1 0.39180785619625 -0.5 -0.5 367232 1
i 4 62.48294679399726 2 9.25 68 -1 -0.16001917683849 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 6.91666666666667 68 -1 0.27899080520716 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 7.33333333333333 68 -1 -0.46650814365658 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 6.91666666666667 68 -1 0.01880967960913 -0.5 -0.5 2869 1
i 4 62.75579809004093 2 9.25 68 -1 -0.29223185777286 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 9.5 68 -1 -0.14279005947211 -0.5 -0.5 367232 1
i 4 62.75579809004093 2 9.25 68 -1 0.11277608691042 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 6.91666666666667 68 -1 -0.41978466194053 -0.5 -0.5 2869 1
i 3 63.02864938608459 2 10.58333333333333 68 -1 -0.42918179930138 -0.5 -0.5 367232 1
i 3 63.02864938608459 2 10.91666666666667 68 -1 0.26951113019772 -0.5 -0.5 367232 1
i 3 63.02864938608459 2 10.58333333333333 68 -1 -0.40542421040561 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 9.25 68 -1 0.2488643680631 -0.5 -0.5 367232 1
i 5 63.02864938608459 2 9.25 68 -1 0.07552435740659 -0.5 -0.5 367232 1
i 6 63.02864938608459 2 9.91666666666667 68 -1 0.13346432527314 -0.5 -0.5 367232 1
i 6 63.02864938608459 2 10.33333333333333 68 -1 -0.07066375649213 -0.5 -0.5 367232 1
i 5 63.02864938608459 2 10.91666666666667 68 -1 -0.31497436545562 -0.5 -0.5 367232 1
i 4 63.02864938608459 2 9.5 68 -1 -0.07514647089832 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 6.91666666666667 68 -1 0.30618809088521 -0.5 -0.5 2869 1
i 4 63.30150068212824 2 10.58333333333333 68 -1 -0.39377681218184 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.5 68 -1 0.32570498991776 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.91666666666667 68 -1 -0.05886469018828 -0.5 -0.5 367232 1
i 4 63.30150068212824 2 9.5 68 -1 -0.05171475689391 -0.5 -0.5 367232 1
i 4 63.5743519781719 2 6.91666666666667 68 -1 -0.32168050628249 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 7.33333333333333 68 -1 -0.41075394456566 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 6.91666666666667 68 -1 -0.25870586799538 -0.5 -0.5 2869 1
i 4 63.5743519781719 2 9.5 68 -1 0.42250446098212 -0.5 -0.5 367232 1
i 4 63.5743519781719 2 9.25 68 -1 -0.47804695362602 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 6.91666666666667 68 -1 -0.03990867116874 -0.5 -0.5 2869 1
i 5 63.84720327421555 2 6.91666666666667 68 -1 0.18247763035717 -0.5 -0.5 2869 1
i 6 63.84720327421555 2 7.66666666666667 68 -1 -0.33603174788873 -0.5 -0.5 2869 1
i 5 63.84720327421555 2 8 68 -1 -0.20022429559715 -0.5 -0.5 2869 1
i 5 63.84720327421555 2 8.66666666666667 68 -1 -0.08019603206208 -0.5 -0.5 2869 1
i 4 63.84720327421555 2 6.66666666666667 68 -1 -0.42026783047034 -0.5 -0.5 2869 1
i 4 63.84720327421555 2 9.25 68 -1 -0.37243066025059 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 9.5 68 -1 -0.23565773084296 -0.5 -0.5 367232 1
i 4 63.84720327421555 2 9.25 68 -1 0.25367313620608 -0.5 -0.5 367232 1
i 4 64.1200545702592 2 6.66666666666667 68 -1 -0.04346886320756 -0.5 -0.5 2869 1
i 4 64.1200545702592 2 9.25 68 -1 -0.46632690226547 -0.5 -0.5 367232 1
i 4 64.39290586630285 2 6.66666666666667 68 -1 0.267779999919 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 6.91666666666667 68 -1 -0.34442284835957 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 6.66666666666667 68 -1 -0.120826545626 -0.5 -0.5 2869 1
i 4 64.39290586630285 2 9.25 68 -1 -0.41753877139756 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 6.66666666666667 68 -1 -0.06129066557318 -0.5 -0.5 2869 1
i 6 64.66575716234651 2 6.66666666666667 68 -1 -0.47508904338867 -0.5 -0.5 2869 1
i 6 64.66575716234651 2 7.33333333333333 68 -1 0.37975381432437 -0.5 -0.5 2869 1
i 5 64.66575716234651 2 7.66666666666667 68 -1 -0.15682955986157 -0.5 -0.5 2869 1
i 6 64.66575716234651 2 8.33333333333333 68 -1 -0.35591155513949 -0.5 -0.5 2869 1
i 4 64.66575716234651 2 6.91666666666667 68 -1 -0.42498347774642 -0.5 -0.5 2869 1
i 4 64.66575716234651 2 9.25 68 -1 0.08493030100494 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 9.5 68 -1 -0.4912313956467 -0.5 -0.5 367232 1
i 4 64.66575716234651 2 9.25 68 -1 -0.31519380951546 -0.5 -0.5 367232 1
i 4 64.93860845839018 2 6.91666666666667 68 -1 0.31329785539937 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 7.33333333333333 68 -1 0.44583103794034 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 6.91666666666667 68 -1 0.08993812867434 -0.5 -0.5 2869 1
i 4 64.93860845839018 2 9.25 68 -1 0.02771665319132 -0.5 -0.5 367232 1
i 5 64.93860845839018 2 9.25 68 -1 0.43891593773175 -0.5 -0.5 367232 1
i 6 64.93860845839018 2 9.91666666666667 68 -1 -0.16149362008298 -0.5 -0.5 367232 1
i 5 64.93860845839018 2 10.33333333333333 68 -1 0.39321595298436 -0.5 -0.5 367232 1
i 5 64.93860845839018 2 10.91666666666667 68 -1 0.33995203244377 -0.5 -0.5 367232 1
i 4 64.93860845839018 2 8.91666666666667 68 -1 0.35166296178616 -0.5 -0.5 367232 1
i 4 65.21145975443383 2 6.91666666666667 68 -1 -0.47091218843742 -0.5 -0.5 2869 1
i 4 65.21145975443383 2 6.66666666666667 68 -1 0.19041739164715 -0.5 -0.5 2869 1
i 4 65.21145975443383 2 8.91666666666667 68 -1 -0.24071803607452 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 6.66666666666667 68 -1 0.26248178591618 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 6.91666666666667 68 -1 -0.35124689653538 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 6.66666666666667 68 -1 -0.30159290429577 -0.5 -0.5 2869 1
i 4 65.48431105047749 2 8.91666666666667 68 -1 0.05356709824833 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 9.25 68 -1 0.06097282131397 -0.5 -0.5 367232 1
i 4 65.48431105047749 2 8.91666666666667 68 -1 0.16209860112193 -0.5 -0.5 367232 1
i 4 65.75716234652114 2 6.66666666666667 68 -1 0.3001158775339 -0.5 -0.5 2869 1
i 4 65.75716234652114 2 8.91666666666667 68 -1 -0.3579544833311 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 8.91666666666667 68 -1 -0.02840747712902 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 9.5 68 -1 -0.4455116625072 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 10 68 -1 -0.10246205149717 -0.5 -0.5 367232 1
i 6 65.75716234652114 2 10.58333333333333 68 -1 -0.49500391716129 -0.5 -0.5 367232 1
i 4 65.75716234652114 2 9.25 68 -1 -0.26095623060778 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 6.66666666666667 68 -1 -0.21398274385476 -0.5 -0.5 2869 1
i 4 66.0300136425648 2 9.25 68 -1 -0.23335467688664 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 9.5 68 -1 -0.05270109390958 -0.5 -0.5 367232 1
i 4 66.0300136425648 2 9.25 68 -1 -0.23256794958215 -0.5 -0.5 367232 1
i 4 66.30286493860845 2 6.66666666666667 68 -1 0.39795631762775 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 6.91666666666667 68 -1 0.13308928272072 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 6.66666666666667 68 -1 0.36216195026875 -0.5 -0.5 2869 1
i 4 66.30286493860845 2 9.25 68 -1 0.27015825535168 -0.5 -0.5 367232 1
i 4 66.30286493860845 2 8.91666666666667 68 -1 -0.37063614330392 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 6.66666666666667 68 -1 -0.34974236831025 -0.5 -0.5 2869 1
i 5 66.5757162346521 2 6.66666666666667 68 -1 -0.39272944718684 -0.5 -0.5 2869 1
i 5 66.5757162346521 2 7.33333333333333 68 -1 -0.02664541797579 -0.5 -0.5 2869 1
i 5 66.5757162346521 2 7.66666666666667 68 -1 0.20919498411407 -0.5 -0.5 2869 1
i 6 66.5757162346521 2 8.33333333333333 68 -1 0.11414196465717 -0.5 -0.5 2869 1
i 4 66.5757162346521 2 8.91666666666667 68 -1 -0.12479801389203 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 9.25 68 -1 -0.47514667003922 -0.5 -0.5 367232 1
i 4 66.5757162346521 2 8.91666666666667 68 -1 0.09462537668816 -0.5 -0.5 367232 1
i 4 66.84856753069577 2 6.66666666666667 68 -1 -0.08223409856349 -0.5 -0.5 2869 1
i 4 66.84856753069577 2 8.91666666666667 68 -1 -0.35243465892174 -0.5 -0.5 367232 1
i 4 67.12141882673943 2 6.66666666666667 68 -1 -0.14069767771504 -0.5 -0.5 2869 1
i 4 67.12141882673943 2 8.91666666666667 68 -1 -0.39881656220972 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 6.66666666666667 68 -1 -0.05037414388419 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 6.91666666666667 68 -1 -0.2904639055431 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 6.66666666666667 68 -1 -0.34768757083577 -0.5 -0.5 2869 1
i 4 67.39427012278308 2 8.91666666666667 68 -1 0.08442900120918 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 9.25 68 -1 0.35989480651308 -0.5 -0.5 367232 1
i 4 67.39427012278308 2 8.91666666666667 68 -1 0.16522838329864 -0.5 -0.5 367232 1
i 4 67.66712141882674 2 6.66666666666667 68 -1 0.48217440960909 -0.5 -0.5 2869 1
i 6 67.66712141882674 2 6.66666666666667 68 -1 0.39257366573111 -0.5 -0.5 2869 1
i 5 67.66712141882674 2 7.33333333333333 68 -1 0.2369536047436 -0.5 -0.5 2869 1
i 6 67.66712141882674 2 7.66666666666667 68 -1 -0.4533139762085 -0.5 -0.5 2869 1
i 5 67.66712141882674 2 8.33333333333333 68 -1 0.22393754926823 -0.5 -0.5 2869 1
i 4 67.66712141882674 2 6.91666666666667 68 -1 -0.3023678912259 -0.5 -0.5 2869 1
i 4 67.66712141882674 2 8.91666666666667 68 -1 -0.07497388278108 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 8.91666666666667 68 -1 -0.04346914217076 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 9.5 68 -1 0.4515179325034 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 10 68 -1 -0.32781522619273 -0.5 -0.5 367232 1
i 6 67.66712141882674 2 10.58333333333333 68 -1 0.16724145814354 -0.5 -0.5 367232 1
i 4 67.9399727148704 2 6.91666666666667 68 -1 -0.16725259525918 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 7.33333333333333 68 -1 -0.30615408904065 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 6.91666666666667 68 -1 -0.06064328990832 -0.5 -0.5 2869 1
i 4 67.9399727148704 2 8.91666666666667 68 -1 -0.08701591245716 -0.5 -0.5 367232 1
i 4 68.21282401091405 2 6.91666666666667 68 -1 -0.35968546199721 -0.5 -0.5 2869 1
i 4 68.21282401091405 2 6.66666666666667 68 -1 0.22024412557396 -0.5 -0.5 2869 1
i 4 68.21282401091405 2 8.91666666666667 68 -1 0.15299506696902 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 6.66666666666667 68 -1 0.05159764403482 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 6.91666666666667 68 -1 0.22397997580701 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 6.66666666666667 68 -1 0.31527441051096 -0.5 -0.5 2869 1
i 4 68.4856753069577 2 8.91666666666667 68 -1 0.20909552625429 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 9.25 68 -1 0.35614615925719 -0.5 -0.5 367232 1
i 4 68.4856753069577 2 8.91666666666667 68 -1 -0.28477641067223 -0.5 -0.5 367232 1
i 4 68.75852660300136 2 6.66666666666667 68 -1 -0.20265800483235 -0.5 -0.5 2869 1
i 4 68.75852660300136 2 8.91666666666667 68 -1 0.34001906455968 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 8.91666666666667 68 -1 -0.32915795208754 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 9.5 68 -1 0.03790772436498 -0.5 -0.5 367232 1
i 5 68.75852660300136 2 10 68 -1 -0.21184393134731 -0.5 -0.5 367232 1
i 6 68.75852660300136 2 10.58333333333333 68 -1 0.18091528053463 -0.5 -0.5 367232 1
i 4 68.75852660300136 2 9.25 68 -1 -0.41758365293795 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 6.66666666666667 68 -1 0.46215035006235 -0.5 -0.5 2869 1
i 4 69.03137789904503 2 9.25 68 -1 0.10262899431725 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 9.5 68 -1 0.3890379225793 -0.5 -0.5 367232 1
i 4 69.03137789904503 2 9.25 68 -1 -0.14785168514864 -0.5 -0.5 367232 1
i 4 69.30422919508868 2 6.66666666666667 68 -1 0.2853968285274 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 6.91666666666667 68 -1 0.32697420462627 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 6.66666666666667 68 -1 -0.15662091684323 -0.5 -0.5 2869 1
i 4 69.30422919508868 2 9.25 68 -1 0.44599782234231 -0.5 -0.5 367232 1
i 4 69.30422919508868 2 8.91666666666667 68 -1 -0.34728658911347 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 6.66666666666667 68 -1 -0.45213655994331 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 6.66666666666667 68 -1 -0.34063912969038 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.33333333333333 68 -1 -0.45889433885573 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 7.66666666666667 68 -1 0.36018807248617 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 8.33333333333333 68 -1 0.45687869119466 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 6.66666666666667 68 -1 0.04577984664165 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.33333333333333 68 -1 0.48860036842676 -0.5 -0.5 2869 1
i 5 69.57708049113234 2 7.66666666666667 68 -1 -0.29926034913557 -0.5 -0.5 2869 1
i 6 69.57708049113234 2 8.33333333333333 68 -1 0.27264253185813 -0.5 -0.5 2869 1
i 4 69.57708049113234 2 6.33333333333333 68 -1 0.40358852639687 -0.5 -0.5 2869 1
i 4 69.57708049113234 2 8.91666666666667 68 -1 0.17320971338908 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 9.25 68 -1 0.03127335324302 -0.5 -0.5 367232 1
i 4 69.57708049113234 2 8.91666666666667 68 -1 0.33756247414972 -0.5 -0.5 367232 1
i 4 69.84993178717599 2 6.33333333333333 68 -1 -0.31031813148477 -0.5 -0.5 2869 1
i 4 69.84993178717599 2 8.91666666666667 68 -1 0.25244064320862 -0.5 -0.5 367232 1
i 4 70.12278308321964 2 6.33333333333333 68 -1 0.3930238697693 -0.5 -0.5 2869 1
i 4 70.12278308321964 2 8.91666666666667 68 -1 0.34225826690471 -0.5 -0.5 367232 1
i 3 70.3956343792633 2 8.33333333333333 68 -1 -0.27837356941782 -0.5 -0.5 2869 1
i 3 70.3956343792633 2 8.66666666666667 68 -1 0.47693899622821 -0.5 -0.5 2869 1
i 3 70.3956343792633 2 8.33333333333333 68 -1 -0.19159338799702 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.33333333333333 68 -1 0.29127266132587 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.66666666666667 68 -1 -0.05787990661391 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 6.33333333333333 68 -1 0.02753859945092 -0.5 -0.5 2869 1
i 4 70.3956343792633 2 8.91666666666667 68 -1 -0.11415420570968 -0.5 -0.5 367232 1
i 4 70.3956343792633 2 9.25 68 -1 -0.32257232500339 -0.5 -0.5 367232 1
i 4 70.3956343792633 2 8.91666666666667 68 -1 0.20873233073956 -0.5 -0.5 367232 1
i 3 70.66848567530695 2 8.33333333333333 68 -1 -0.05500380820274 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 6.33333333333333 68 -1 -0.11868478701459 -0.5 -0.5 2869 1
i 5 70.66848567530695 2 6.33333333333333 68 -1 0.14303780687532 -0.5 -0.5 2869 1
i 5 70.66848567530695 2 6.91666666666667 68 -1 -0.09845327405012 -0.5 -0.5 2869 1
i 6 70.66848567530695 2 7.41666666666667 68 -1 -0.1759512487984 -0.5 -0.5 2869 1
i 5 70.66848567530695 2 8 68 -1 0.39817696477501 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 6.66666666666667 68 -1 -0.04869306116738 -0.5 -0.5 2869 1
i 4 70.66848567530695 2 8.91666666666667 68 -1 -0.40724903698806 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 8.91666666666667 68 -1 0.29282472278214 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 9.5 68 -1 -0.42108923579206 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10 68 -1 -0.02163208836284 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 10.58333333333333 68 -1 0.49315785950411 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 8.91666666666667 68 -1 -0.30667194824259 -0.5 -0.5 367232 1
i 6 70.66848567530695 2 9.5 68 -1 -0.02964079576028 -0.5 -0.5 367232 1
i 5 70.66848567530695 2 10 68 -1 -0.06180705285542 -0.5 -0.5 367232 1
i 5 70.66848567530695 2 10.58333333333333 68 -1 0.45598018720398 -0.5 -0.5 367232 1
i 4 70.66848567530695 2 8.58333333333333 68 -1 0.41752893195002 -0.5 -0.5 367232 1
i 4 70.94133697135062 2 6.66666666666667 68 -1 0.01442046326742 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 6.91666666666667 68 -1 0.24933416957193 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 6.66666666666667 68 -1 0.14956889554688 -0.5 -0.5 2869 1
i 4 70.94133697135062 2 8.58333333333333 68 -1 0.26864452366878 -0.5 -0.5 367232 1
i 4 71.21418826739428 2 6.66666666666667 68 -1 0.12036894140882 -0.5 -0.5 2869 1
i 4 71.21418826739428 2 6.33333333333333 68 -1 -0.16400533269702 -0.5 -0.5 2869 1
i 4 71.21418826739428 2 8.58333333333333 68 -1 -0.45108279274644 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 6.33333333333333 68 -1 -0.13809376782062 -0.5 -0.5 2869 1
i 4 71.48703956343793 2 6.66666666666667 68 -1 0.10738840400744 -0.5 -0.5 2869 1
i 4 71.48703956343793 2 6.33333333333333 68 -1 -0.24114948295339 -0.5 -0.5 2869 1
i 3 71.48703956343793 2 10.58333333333333 68 -1 0.07460054817557 -0.5 -0.5 367232 1
i 3 71.48703956343793 2 10.91666666666667 68 -1 0.32562894918984 -0.5 -0.5 367232 1
i 3 71.48703956343793 2 10.58333333333333 68 -1 -0.32029042012856 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.58333333333333 68 -1 -0.32911256956919 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.91666666666667 68 -1 -0.12923491259445 -0.5 -0.5 367232 1
i 4 71.48703956343793 2 8.58333333333333 68 -1 0.21989991911664 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 6.33333333333333 68 -1 0.31111089479767 -0.5 -0.5 2869 1
i 3 71.75989085948159 2 10.58333333333333 68 -1 0.18920115505797 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 8.58333333333333 68 -1 0.0971808756719 -0.5 -0.5 367232 1
i 6 71.75989085948159 2 8.58333333333333 68 -1 0.39817040413855 -0.5 -0.5 367232 1
i 5 71.75989085948159 2 9.25 68 -1 0.21307143058517 -0.5 -0.5 367232 1
i 6 71.75989085948159 2 9.75 68 -1 -0.28891613551886 -0.5 -0.5 367232 1
i 6 71.75989085948159 2 10.33333333333333 68 -1 0.40993549270638 -0.5 -0.5 367232 1
i 4 71.75989085948159 2 8.91666666666667 68 -1 0.32787863615452 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 6.33333333333333 68 -1 -0.32039846777371 -0.5 -0.5 2869 1
i 4 72.03274215552524 2 8.91666666666667 68 -1 -0.19175000762805 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 9.25 68 -1 -0.31576370333223 -0.5 -0.5 367232 1
i 4 72.03274215552524 2 8.91666666666667 68 -1 -0.04453536940614 -0.5 -0.5 367232 1
i 4 72.3055934515689 2 6.33333333333333 68 -1 0.45246243410305 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 6.66666666666667 68 -1 0.46502804211081 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 6.33333333333333 68 -1 0.33483973223146 -0.5 -0.5 2869 1
i 4 72.3055934515689 2 8.91666666666667 68 -1 -0.09442082109751 -0.5 -0.5 367232 1
i 4 72.3055934515689 2 8.58333333333333 68 -1 -0.01743784267753 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 6.33333333333333 68 -1 0.13310759397552 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 6.33333333333333 68 -1 0.45910561244396 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 6.91666666666667 68 -1 -0.44623061022259 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 7.41666666666667 68 -1 -0.46689716529972 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 8 68 -1 0.1245219591204 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 6.33333333333333 68 -1 0.41428685041414 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 6.91666666666667 68 -1 -0.23987410807744 -0.5 -0.5 2869 1
i 6 72.57844474761255 2 7.41666666666667 68 -1 0.14489891231035 -0.5 -0.5 2869 1
i 5 72.57844474761255 2 8 68 -1 -0.10086889625314 -0.5 -0.5 2869 1
i 4 72.57844474761255 2 6.66666666666667 68 -1 -0.21052938327418 -0.5 -0.5 2869 1
i 4 72.57844474761255 2 8.58333333333333 68 -1 0.41367358633968 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 8.91666666666667 68 -1 -0.18206380270562 -0.5 -0.5 367232 1
i 4 72.57844474761255 2 8.58333333333333 68 -1 -0.248199915348 -0.5 -0.5 367232 1
i 4 72.8512960436562 2 6.66666666666667 68 -1 -0.06298436107828 -0.5 -0.5 2869 1
i 4 72.8512960436562 2 8.58333333333333 68 -1 0.44501815340222 -0.5 -0.5 367232 1
i 4 73.12414733969987 2 6.66666666666667 68 -1 -0.42490337302499 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 6.91666666666667 68 -1 -0.02748303211641 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 6.66666666666667 68 -1 -0.25717444646506 -0.5 -0.5 2869 1
i 4 73.12414733969987 2 8.58333333333333 68 -1 0.17190287873148 -0.5 -0.5 367232 1
i 3 73.39699863574353 2 8 68 -1 -0.3571006697018 -0.5 -0.5 2869 1
i 3 73.39699863574353 2 8.33333333333333 68 -1 0.02118840488973 -0.5 -0.5 2869 1
i 3 73.39699863574353 2 8 68 -1 -0.2524559961923 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 6.66666666666667 68 -1 0.27369884817413 -0.5 -0.5 2869 1
i 6 73.39699863574353 2 6.66666666666667 68 -1 -0.06003559010977 -0.5 -0.5 2869 1
i 5 73.39699863574353 2 7.33333333333333 68 -1 0.07472374349648 -0.5 -0.5 2869 1
i 6 73.39699863574353 2 7.66666666666667 68 -1 0.04511861436128 -0.5 -0.5 2869 1
i 5 73.39699863574353 2 8.33333333333333 68 -1 0.35217921343168 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 6.91666666666667 68 -1 0.05809678230043 -0.5 -0.5 2869 1
i 4 73.39699863574353 2 8.58333333333333 68 -1 0.02177916653535 -0.5 -0.5 367232 1
i 4 73.39699863574353 2 8.91666666666667 68 -1 0.09014808302141 -0.5 -0.5 367232 1
i 4 73.39699863574353 2 8.58333333333333 68 -1 0.03433909840879 -0.5 -0.5 367232 1
i 3 73.66984993178718 2 8 68 -1 0.1319102983077 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 6.91666666666667 68 -1 0.43648691705799 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 7.33333333333333 68 -1 0.47402503626008 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 6.91666666666667 68 -1 -0.2043571036337 -0.5 -0.5 2869 1
i 4 73.66984993178718 2 8.58333333333333 68 -1 0.16520647188957 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 8.58333333333333 68 -1 -0.36331143108081 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 9.25 68 -1 -0.04782001903475 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 9.75 68 -1 0.19344575310547 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 10.33333333333333 68 -1 -0.09367041289318 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 8.58333333333333 68 -1 -0.27080274000117 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 9.25 68 -1 0.42321520493347 -0.5 -0.5 367232 1
i 6 73.66984993178718 2 9.75 68 -1 0.18601216696025 -0.5 -0.5 367232 1
i 5 73.66984993178718 2 10.33333333333333 68 -1 -0.36214130704917 -0.5 -0.5 367232 1
i 4 73.66984993178718 2 8.91666666666667 68 -1 0.24048498494815 -0.5 -0.5 367232 1
i 4 73.94270122783084 2 6.91666666666667 68 -1 0.20034353955588 -0.5 -0.5 2869 1
i 4 73.94270122783084 2 6.66666666666667 68 -1 -0.0401312260255 -0.5 -0.5 2869 1
i 4 73.94270122783084 2 8.91666666666667 68 -1 -0.05556515878884 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 6.66666666666667 68 -1 0.36284006647399 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 6.91666666666667 68 -1 0.0375422592537 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 6.66666666666667 68 -1 -0.05127223678711 -0.5 -0.5 2869 1
i 4 74.21555252387449 2 8.91666666666667 68 -1 -0.07981737433972 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 9.25 68 -1 0.13825389038517 -0.5 -0.5 367232 1
i 4 74.21555252387449 2 8.91666666666667 68 -1 0.26905513109224 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 6.66666666666667 68 -1 -0.30932090021767 -0.5 -0.5 2869 1
i 3 74.48840381991815 2 10.33333333333333 68 -1 0.16170343354786 -0.5 -0.5 367232 1
i 3 74.48840381991815 2 10.58333333333333 68 -1 0.30615917678573 -0.5 -0.5 367232 1
i 3 74.48840381991815 2 10.33333333333333 68 -1 -0.40601935388228 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 8.91666666666667 68 -1 -0.25277151653597 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 8.91666666666667 68 -1 -0.19985348922377 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 9.5 68 -1 -0.38854882485204 -0.5 -0.5 367232 1
i 6 74.48840381991815 2 10 68 -1 0.09761869633326 -0.5 -0.5 367232 1
i 5 74.48840381991815 2 10.58333333333333 68 -1 0.42200519950338 -0.5 -0.5 367232 1
i 4 74.48840381991815 2 9.25 68 -1 -0.14153492269669 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 6.66666666666667 68 -1 0.1792627492775 -0.5 -0.5 2869 1
i 3 74.7612551159618 2 10.33333333333333 68 -1 -0.03470417795035 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.25 68 -1 0.17454558064574 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.5 68 -1 -0.07034549077489 -0.5 -0.5 367232 1
i 4 74.7612551159618 2 9.25 68 -1 0.23211711261342 -0.5 -0.5 367232 1
i 4 75.03410641200546 2 6.66666666666667 68 -1 -0.17000143877762 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 6.91666666666667 68 -1 -0.29777181256088 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 6.66666666666667 68 -1 0.31551165767779 -0.5 -0.5 2869 1
i 4 75.03410641200546 2 9.25 68 -1 0.06448930307124 -0.5 -0.5 367232 1
i 4 75.03410641200546 2 8.91666666666667 68 -1 -0.36383681253381 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 6.66666666666667 68 -1 -0.24143647906604 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 6.66666666666667 68 -1 0.41922650858939 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 7.33333333333333 68 -1 0.30996834664321 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 7.66666666666667 68 -1 0.46073676694193 -0.5 -0.5 2869 1
i 6 75.30695770804911 2 8.33333333333333 68 -1 -0.42533243178746 -0.5 -0.5 2869 1
i 4 75.30695770804911 2 6.33333333333333 68 -1 0.42742190616586 -0.5 -0.5 2869 1
i 4 75.30695770804911 2 8.91666666666667 68 -1 -0.4122733918536 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 9.25 68 -1 0.43381454945399 -0.5 -0.5 367232 1
i 4 75.30695770804911 2 8.91666666666667 68 -1 -0.12531859975324 -0.5 -0.5 367232 1
i 4 75.57980900409277 2 6.33333333333333 68 -1 -0.39176650960721 -0.5 -0.5 2869 1
i 4 75.57980900409277 2 8.91666666666667 68 -1 0.09593843904598 -0.5 -0.5 367232 1
i 4 75.85266030013642 2 6.33333333333333 68 -1 0.24184404359874 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 6.66666666666667 68 -1 0.43865513032252 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 6.33333333333333 68 -1 0.12410161580092 -0.5 -0.5 2869 1
i 4 75.85266030013642 2 8.91666666666667 68 -1 -0.41342261990209 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 6.33333333333333 68 -1 0.14660195707157 -0.5 -0.5 2869 1
i 5 76.12551159618008 2 6.33333333333333 68 -1 0.33847458679581 -0.5 -0.5 2869 1
i 6 76.12551159618008 2 6.91666666666667 68 -1 -0.35913055185387 -0.5 -0.5 2869 1
i 6 76.12551159618008 2 7.41666666666667 68 -1 0.0430807825962 -0.5 -0.5 2869 1
i 5 76.12551159618008 2 8 68 -1 0.17172262327358 -0.5 -0.5 2869 1
i 4 76.12551159618008 2 6.66666666666667 68 -1 -0.22258354332534 -0.5 -0.5 2869 1
i 4 76.12551159618008 2 8.91666666666667 68 -1 0.25278413556491 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 9.25 68 -1 -0.22024440880302 -0.5 -0.5 367232 1
i 4 76.12551159618008 2 8.91666666666667 68 -1 -0.06676177776577 -0.5 -0.5 367232 1
i 4 76.39836289222373 2 6.66666666666667 68 -1 0.479856878249 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 6.91666666666667 68 -1 -0.26453280524511 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 6.66666666666667 68 -1 0.26069472765481 -0.5 -0.5 2869 1
i 4 76.39836289222373 2 8.91666666666667 68 -1 -0.38913528175732 -0.5 -0.5 367232 1
i 5 76.39836289222373 2 8.91666666666667 68 -1 -0.07413821160619 -0.5 -0.5 367232 1
i 6 76.39836289222373 2 9.5 68 -1 -0.03937539647479 -0.5 -0.5 367232 1
i 6 76.39836289222373 2 10 68 -1 0.41000866846616 -0.5 -0.5 367232 1
i 6 76.39836289222373 2 10.58333333333333 68 -1 0.42597757719199 -0.5 -0.5 367232 1
i 4 76.39836289222373 2 8.58333333333333 68 -1 -0.16495088133788 -0.5 -0.5 367232 1
i 4 76.67121418826738 2 6.66666666666667 68 -1 0.41671900161952 -0.5 -0.5 2869 1
i 4 76.67121418826738 2 6.33333333333333 68 -1 0.39318003846088 -0.5 -0.5 2869 1
i 4 76.67121418826738 2 8.58333333333333 68 -1 0.39740199377751 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 6.33333333333333 68 -1 -0.27144050213564 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 6.66666666666667 68 -1 0.11754036405987 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 6.33333333333333 68 -1 -0.18063949656629 -0.5 -0.5 2869 1
i 4 76.94406548431104 2 8.58333333333333 68 -1 0.12142313231889 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 8.91666666666667 68 -1 0.38279798893042 -0.5 -0.5 367232 1
i 4 76.94406548431104 2 8.58333333333333 68 -1 -0.41328287303 -0.5 -0.5 367232 1
i 4 77.21691678035471 2 6.33333333333333 68 -1 0.19407544383128 -0.5 -0.5 2869 1
i 4 77.21691678035471 2 8.58333333333333 68 -1 0.07825405264611 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 8.58333333333333 68 -1 0.02242933362749 -0.5 -0.5 367232 1
i 5 77.21691678035471 2 9.25 68 -1 0.20509323272067 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 9.75 68 -1 -0.36089902058404 -0.5 -0.5 367232 1
i 6 77.21691678035471 2 10.33333333333333 68 -1 -0.2993014852922 -0.5 -0.5 367232 1
i 4 77.21691678035471 2 8.91666666666667 68 -1 0.0157243195729 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 6.33333333333333 68 -1 0.43890573582539 -0.5 -0.5 2869 1
i 4 77.48976807639836 2 8.91666666666667 68 -1 -0.15795174664897 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 9.25 68 -1 0.36790377366964 -0.5 -0.5 367232 1
i 4 77.48976807639836 2 8.91666666666667 68 -1 -0.33372670197303 -0.5 -0.5 367232 1
i 4 77.76261937244202 2 6.33333333333333 68 -1 -0.05474185985679 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 6.66666666666667 68 -1 0.18145526078418 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 6.33333333333333 68 -1 -0.26792198848323 -0.5 -0.5 2869 1
i 4 77.76261937244202 2 8.91666666666667 68 -1 -0.35234111250604 -0.5 -0.5 367232 1
i 4 77.76261937244202 2 8.58333333333333 68 -1 0.46383634938172 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 6.33333333333333 68 -1 0.19373406517576 -0.5 -0.5 2869 1
i 5 78.03547066848567 2 6.33333333333333 68 -1 0.05259292504993 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 6.91666666666667 68 -1 -0.38281768026349 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 7.41666666666667 68 -1 0.31243018018042 -0.5 -0.5 2869 1
i 6 78.03547066848567 2 8 68 -1 0.3798298785358 -0.5 -0.5 2869 1
i 4 78.03547066848567 2 8.58333333333333 68 -1 -0.07739184873038 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 8.91666666666667 68 -1 0.28255393085645 -0.5 -0.5 367232 1
i 4 78.03547066848567 2 8.58333333333333 68 -1 0.02075620562979 -0.5 -0.5 367232 1
i 4 78.30832196452933 2 6.33333333333333 68 -1 0.21268933354154 -0.5 -0.5 2869 1
i 4 78.30832196452933 2 8.58333333333333 68 -1 -0.03065520348405 -0.5 -0.5 367232 1
i 4 78.58117326057298 2 6.33333333333333 68 -1 -0.11451216602093 -0.5 -0.5 2869 1
i 4 78.58117326057298 2 8.58333333333333 68 -1 -0.02224530649214 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 6.33333333333333 68 -1 -0.23492150015042 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 6.66666666666667 68 -1 -0.187430032389 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 6.33333333333333 68 -1 0.05424523214741 -0.5 -0.5 2869 1
i 4 78.85402455661664 2 8.58333333333333 68 -1 0.23891445751001 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 8.91666666666667 68 -1 0.01323180434024 -0.5 -0.5 367232 1
i 4 78.85402455661664 2 8.58333333333333 68 -1 -0.02911228010807 -0.5 -0.5 367232 1
i 4 79.1268758526603 2 6.33333333333333 68 -1 0.33636586059446 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 6.33333333333333 68 -1 -0.3544932711645 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 6.91666666666667 68 -1 -0.26373287109339 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 7.41666666666667 68 -1 -0.02726167022816 -0.5 -0.5 2869 1
i 5 79.1268758526603 2 8 68 -1 0.06691851347219 -0.5 -0.5 2869 1
i 4 79.1268758526603 2 6.66666666666667 68 -1 0.31632860371196 -0.5 -0.5 2869 1
i 4 79.1268758526603 2 8.58333333333333 68 -1 -0.20058041203308 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 8.58333333333333 68 -1 -0.03188260937304 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 9.25 68 -1 -0.35639359755527 -0.5 -0.5 367232 1
i 5 79.1268758526603 2 9.75 68 -1 0.1921681137004 -0.5 -0.5 367232 1
i 6 79.1268758526603 2 10.33333333333333 68 -1 -0.19255865731661 -0.5 -0.5 367232 1
i 4 79.39972714870396 2 6.66666666666667 68 -1 -0.37207396930078 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 6.91666666666667 68 -1 -0.12808891967266 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 6.66666666666667 68 -1 -0.02887637117366 -0.5 -0.5 2869 1
i 4 79.39972714870396 2 8.58333333333333 68 -1 -0.31587561333623 -0.5 -0.5 367232 1
i 4 79.67257844474761 2 6.66666666666667 68 -1 -0.48198740162062 -0.5 -0.5 2869 1
i 4 79.67257844474761 2 6.33333333333333 68 -1 -0.11488853353324 -0.5 -0.5 2869 1
i 4 79.67257844474761 2 8.58333333333333 68 -1 0.27610982893505 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 6.33333333333333 68 -1 0.38246410239166 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 6.66666666666667 68 -1 0.03371036223814 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 6.33333333333333 68 -1 0.48513791945668 -0.5 -0.5 2869 1
i 4 79.94542974079127 2 8.58333333333333 68 -1 0.40207724112395 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 8.91666666666667 68 -1 0.44112028224127 -0.5 -0.5 367232 1
i 4 79.94542974079127 2 8.58333333333333 68 -1 -0.36388534376555 -0.5 -0.5 367232 1
i 4 80.21828103683492 2 6.33333333333333 68 -1 -0.42435010277585 -0.5 -0.5 2869 1
i 4 80.21828103683492 2 8.58333333333333 68 -1 -0.14498052376932 -0.5 -0.5 367232 1
i 6 80.21828103683492 2 8.58333333333333 68 -1 0.26479641795831 -0.5 -0.5 367232 1
i 5 80.21828103683492 2 9.25 68 -1 0.28390069500034 -0.5 -0.5 367232 1
i 5 80.21828103683492 2 9.75 68 -1 0.27796710952324 -0.5 -0.5 367232 1
i 6 80.21828103683492 2 10.33333333333333 68 -1 -0.47198134399435 -0.5 -0.5 367232 1
i 4 80.21828103683492 2 8.91666666666667 68 -1 0.33801100583987 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 6.33333333333333 68 -1 0.0182607007801 -0.5 -0.5 2869 1
i 4 80.49113233287858 2 8.91666666666667 68 -1 -0.3334010441307 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 9.25 68 -1 0.29768207458773 -0.5 -0.5 367232 1
i 4 80.49113233287858 2 8.91666666666667 68 -1 0.28336966653829 -0.5 -0.5 367232 1
i 4 80.76398362892223 2 6.33333333333333 68 -1 0.25048875299273 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 6.66666666666667 68 -1 -0.21218188862189 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 6.33333333333333 68 -1 0.07689977346526 -0.5 -0.5 2869 1
i 4 80.76398362892223 2 8.91666666666667 68 -1 -0.38775033745328 -0.5 -0.5 367232 1
i 4 80.76398362892223 2 8.58333333333333 68 -1 0.16682180459215 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 6.33333333333333 68 -1 -0.09334032242731 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 6.33333333333333 68 -1 -0.06934483641385 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 6.91666666666667 68 -1 0.35688526653504 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 7.41666666666667 68 -1 -0.47518652934582 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 8 68 -1 0.01996375059266 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 6.33333333333333 68 -1 0.37886250105784 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 6.91666666666667 68 -1 -0.00666794702823 -0.5 -0.5 2869 1
i 6 81.03683492496589 2 7.41666666666667 68 -1 0.22786626460694 -0.5 -0.5 2869 1
i 5 81.03683492496589 2 8 68 -1 -0.2540229515902 -0.5 -0.5 2869 1
i 4 81.03683492496589 2 8.58333333333333 68 -1 0.25287025568489 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 8.91666666666667 68 -1 0.34748590124264 -0.5 -0.5 367232 1
i 4 81.03683492496589 2 8.58333333333333 68 -1 0.30466779330816 -0.5 -0.5 367232 1
i 4 81.30968622100956 2 6.33333333333333 68 -1 -0.1446015526275 -0.5 -0.5 2869 1
i 4 81.30968622100956 2 8.58333333333333 68 -1 -0.12081641414617 -0.5 -0.5 367232 1
i 4 81.58253751705321 2 6.33333333333333 68 -1 0.38929973107747 -0.5 -0.5 2869 1
i 4 81.58253751705321 2 8.58333333333333 68 -1 0.3826258225349 -0.5 -0.5 367232 1
i 3 81.85538881309687 2 8 68 -1 -0.39347826970376 -0.5 -0.5 2869 1
i 3 81.85538881309687 2 8.33333333333333 68 -1 -0.45447230423108 -0.5 -0.5 2869 1
i 3 81.85538881309687 2 8 68 -1 0.30499960532087 -0.5 -0.5 2869 1
i 4 81.85538881309687 2 6.33333333333333 68 -1 0.3945604996595 -0.5 -0.5 2869 1
i 4 81.85538881309687 2 8.58333333333333 68 -1 -0.38307412674971 -0.5 -0.5 367232 1
i 4 81.85538881309687 2 8.91666666666667 68 -1 -0.3149780942855 -0.5 -0.5 367232 1
i 4 81.85538881309687 2 8.58333333333333 68 -1 -0.25749011337442 -0.5 -0.5 367232 1
i 4 82.12824010914052 2 8 68 -1 0.31166474005955 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.33333333333333 68 -1 -0.14581631616462 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.66666666666667 68 -1 0.2872084901111 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 6.33333333333333 68 -1 0.20501645386865 -0.5 -0.5 2869 1
i 4 82.12824010914052 2 8.58333333333333 68 -1 0.0976303360822 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 8.58333333333333 68 -1 0.13514893044091 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 9.25 68 -1 0.34682338020987 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 9.75 68 -1 0.35402461393254 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 10.33333333333333 68 -1 0.03493743690727 -0.5 -0.5 367232 1
i 5 82.12824010914052 2 8.58333333333333 68 -1 0.18296917474502 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 9.25 68 -1 0.44346260964856 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 9.75 68 -1 0.35453480504544 -0.5 -0.5 367232 1
i 6 82.12824010914052 2 10.33333333333333 68 -1 -0.10955877452265 -0.5 -0.5 367232 1
i 4 82.40109140518418 2 6.33333333333333 68 -1 0.151500521189 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 6.33333333333333 68 -1 -0.17525261943929 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 6.91666666666667 68 -1 -0.13511445284825 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 7.41666666666667 68 -1 -0.06417883108214 -0.5 -0.5 2869 1
i 6 82.40109140518418 2 8 68 -1 0.3545643019486 -0.5 -0.5 2869 1
i 4 82.40109140518418 2 6.66666666666667 68 -1 -0.15150164743847 -0.5 -0.5 2869 1
i 4 82.40109140518418 2 8.58333333333333 68 -1 0.23472132794263 -0.5 -0.5 367232 1
i 4 82.67394270122783 2 6.66666666666667 68 -1 -0.42267851901981 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 6.91666666666667 68 -1 0.251243316789 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 6.66666666666667 68 -1 -0.04034162731467 -0.5 -0.5 2869 1
i 4 82.67394270122783 2 8.58333333333333 68 -1 0.17672782563527 -0.5 -0.5 367232 1
i 4 82.94679399727148 2 6.66666666666667 68 -1 -0.03022360614901 -0.5 -0.5 2869 1
i 4 82.94679399727148 2 6.33333333333333 68 -1 0.46328442071897 -0.5 -0.5 2869 1
i 4 82.94679399727148 2 10.33333333333333 68 -1 0.23278214428201 -0.5 -0.5 367232 1
i 3 82.94679399727148 2 10.58333333333333 68 -1 0.08462415320865 -0.5 -0.5 367232 1
i 3 82.94679399727148 2 10.33333333333333 68 -1 -0.10820455174902 -0.5 -0.5 367232 1
i 4 82.94679399727148 2 8.58333333333333 68 -1 0.44316606956632 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 6.33333333333333 68 -1 -0.48792187413502 -0.5 -0.5 2869 1
i 4 83.21964529331515 2 6.66666666666667 68 -1 0.38796504420172 -0.5 -0.5 2869 1
i 4 83.21964529331515 2 6.33333333333333 68 -1 -0.12227060684055 -0.5 -0.5 2869 1
i 4 83.21964529331515 2 10.33333333333333 68 -1 -0.09670890912872 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.58333333333333 68 -1 0.24010701029564 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.91666666666667 68 -1 -0.10852271920757 -0.5 -0.5 367232 1
i 4 83.21964529331515 2 8.58333333333333 68 -1 -0.08594897733867 -0.5 -0.5 367232 1
i 4 83.49249658935881 2 6.33333333333333 68 -1 0.24120118972426 -0.5 -0.5 2869 1
i 4 83.49249658935881 2 8.58333333333333 68 -1 0.2767133218627 -0.5 -0.5 367232 1
i 5 83.49249658935881 2 8.58333333333333 68 -1 0.37550673995718 -0.5 -0.5 367232 1
i 5 83.49249658935881 2 9.25 68 -1 -0.39646048126673 -0.5 -0.5 367232 1
i 5 83.49249658935881 2 9.75 68 -1 0.49608939258161 -0.5 -0.5 367232 1
i 6 83.49249658935881 2 10.33333333333333 68 -1 0.19483844213513 -0.5 -0.5 367232 1
i 4 83.49249658935881 2 8.91666666666667 68 -1 0.01385168643935 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 6.33333333333333 68 -1 -0.15703005549362 -0.5 -0.5 2869 1
i 4 83.76534788540246 2 8.91666666666667 68 -1 0.19539352824461 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 9.25 68 -1 0.20521911609881 -0.5 -0.5 367232 1
i 4 83.76534788540246 2 8.91666666666667 68 -1 -0.5 -0.5 -0.5 367232 1
i 4 84.03819918144612 2 6.33333333333333 68 -1 -0.18919446467025 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 6.66666666666667 68 -1 -0.22466734359012 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 6.33333333333333 68 -1 -0.05609844629207 -0.5 -0.5 2869 1
i 4 84.03819918144612 2 8.91666666666667 68 -1 -0.45824389985897 -0.5 -0.5 367232 1
i 4 84.03819918144612 2 8.58333333333333 68 -1 0.41271997981353 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 6.33333333333333 68 -1 0.38218170757769 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 6.33333333333333 68 -1 -0.05920484640935 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 6.91666666666667 68 -1 0.3596271667259 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 7.41666666666667 68 -1 0.28067332827471 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 8 68 -1 0.48901879761488 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 6.33333333333333 68 -1 -0.14515951604119 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 6.91666666666667 68 -1 -0.36801393339153 -0.5 -0.5 2869 1
i 5 84.31105047748977 2 7.41666666666667 68 -1 -0.40379106843804 -0.5 -0.5 2869 1
i 6 84.31105047748977 2 8 68 -1 0.46843378198761 -0.5 -0.5 2869 1
i 4 84.31105047748977 2 6.66666666666667 68 -1 0.2552169274049 -0.5 -0.5 2869 1
i 4 84.31105047748977 2 8.58333333333333 68 -1 0.25724251086778 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 8.91666666666667 68 -1 0.04971464567117 -0.5 -0.5 367232 1
i 4 84.31105047748977 2 8.58333333333333 68 -1 0.20347117928581 -0.5 -0.5 367232 1
i 4 84.58390177353343 2 6.66666666666667 68 -1 -0.05768892941594 -0.5 -0.5 2869 1
i 4 84.58390177353343 2 8.58333333333333 68 -1 -0.05996939140405 -0.5 -0.5 367232 1
i 4 84.85675306957708 2 6.66666666666667 68 -1 -0.48982276685932 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 6.91666666666667 68 -1 0.05851032767159 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 6.66666666666667 68 -1 0.04836277777997 -0.5 -0.5 2869 1
i 4 84.85675306957708 2 8.58333333333333 68 -1 0.26192985453874 -0.5 -0.5 367232 1
i 3 85.12960436562074 2 8 68 -1 -0.40290973029135 -0.5 -0.5 2869 1
i 3 85.12960436562074 2 8.33333333333333 68 -1 -0.03057290188173 -0.5 -0.5 2869 1
i 3 85.12960436562074 2 8 68 -1 0.09393130922262 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 6.66666666666667 68 -1 -0.18770341429268 -0.5 -0.5 2869 1
i 5 85.12960436562074 2 6.66666666666667 68 -1 0.29533140827167 -0.5 -0.5 2869 1
i 5 85.12960436562074 2 7.33333333333333 68 -1 -0.40997464333782 -0.5 -0.5 2869 1
i 6 85.12960436562074 2 7.66666666666667 68 -1 0.48890581186407 -0.5 -0.5 2869 1
i 5 85.12960436562074 2 8.33333333333333 68 -1 -0.16192711887346 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 6.91666666666667 68 -1 -0.04099789192347 -0.5 -0.5 2869 1
i 4 85.12960436562074 2 8.58333333333333 68 -1 -0.10692969396978 -0.5 -0.5 367232 1
i 4 85.12960436562074 2 8.91666666666667 68 -1 -0.22449350699574 -0.5 -0.5 367232 1
i 4 85.12960436562074 2 8.58333333333333 68 -1 -0.47530656334671 -0.5 -0.5 367232 1
i 3 85.40245566166439 2 8 68 -1 0.20321835800672 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 6.91666666666667 68 -1 -0.04468136888494 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 7.33333333333333 68 -1 0.47639561738769 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 6.91666666666667 68 -1 0.11002940186938 -0.5 -0.5 2869 1
i 4 85.40245566166439 2 8.58333333333333 68 -1 0.48591817242718 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 8.58333333333333 68 -1 -0.44693022162693 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 9.25 68 -1 -0.30024686128649 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 9.75 68 -1 0.30825586524177 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 10.33333333333333 68 -1 0.14758346843067 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 8.58333333333333 68 -1 0.10924067406112 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 9.25 68 -1 -0.29509855650587 -0.5 -0.5 367232 1
i 5 85.40245566166439 2 9.75 68 -1 0.40740980298898 -0.5 -0.5 367232 1
i 6 85.40245566166439 2 10.33333333333333 68 -1 0.37965254601789 -0.5 -0.5 367232 1
i 4 85.40245566166439 2 8.91666666666667 68 -1 -0.32698974615089 -0.5 -0.5 367232 1
i 4 85.67530695770805 2 6.91666666666667 68 -1 -0.19281558695272 -0.5 -0.5 2869 1
i 4 85.67530695770805 2 6.66666666666667 68 -1 0.33211310067983 -0.5 -0.5 2869 1
i 4 85.67530695770805 2 8.91666666666667 68 -1 -0.13498003005978 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 6.66666666666667 68 -1 0.38747317333348 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 6.91666666666667 68 -1 0.01891902939645 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 6.66666666666667 68 -1 -0.26151126713465 -0.5 -0.5 2869 1
i 4 85.9481582537517 2 8.91666666666667 68 -1 -0.18580046687919 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 9.25 68 -1 -0.20810586692397 -0.5 -0.5 367232 1
i 4 85.9481582537517 2 8.91666666666667 68 -1 0.16917198985207 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 6.66666666666667 68 -1 -0.03764410791773 -0.5 -0.5 2869 1
i 3 86.22100954979535 2 10.33333333333333 68 -1 -0.38023583275722 -0.5 -0.5 367232 1
i 3 86.22100954979535 2 10.58333333333333 68 -1 0.25878272189237 -0.5 -0.5 367232 1
i 3 86.22100954979535 2 10.33333333333333 68 -1 -0.09227726993496 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 8.91666666666667 68 -1 0.21876560919645 -0.5 -0.5 367232 1
i 5 86.22100954979535 2 8.91666666666667 68 -1 0.21402472853536 -0.5 -0.5 367232 1
i 6 86.22100954979535 2 9.5 68 -1 0.23755604035607 -0.5 -0.5 367232 1
i 6 86.22100954979535 2 10 68 -1 -0.24864515505496 -0.5 -0.5 367232 1
i 6 86.22100954979535 2 10.58333333333333 68 -1 -0.27126209163682 -0.5 -0.5 367232 1
i 4 86.22100954979535 2 9.25 68 -1 0.19370582723931 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 6.66666666666667 68 -1 -0.02904923215094 -0.5 -0.5 2869 1
i 3 86.49386084583901 2 10.33333333333333 68 -1 0.36704053664337 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.25 68 -1 -0.20146115314117 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.5 68 -1 0.03103071856986 -0.5 -0.5 367232 1
i 4 86.49386084583901 2 9.25 68 -1 0.13141590963477 -0.5 -0.5 367232 1
i 4 86.76671214188266 2 6.66666666666667 68 -1 0.01008459001892 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 6.91666666666667 68 -1 0.04440634443991 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 6.66666666666667 68 -1 -0.19549900517364 -0.5 -0.5 2869 1
i 4 86.76671214188266 2 9.25 68 -1 0.09949059770054 -0.5 -0.5 367232 1
i 4 86.76671214188266 2 8.91666666666667 68 -1 0.48641128148171 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 6.66666666666667 68 -1 -0.18458561084174 -0.5 -0.5 2869 1
i 6 87.03956343792632 2 6.66666666666667 68 -1 -0.49284821105787 -0.5 -0.5 2869 1
i 5 87.03956343792632 2 7.33333333333333 68 -1 0.2872554419494 -0.5 -0.5 2869 1
i 6 87.03956343792632 2 7.66666666666667 68 -1 0.30969488136843 -0.5 -0.5 2869 1
i 5 87.03956343792632 2 8.33333333333333 68 -1 -0.25800643558781 -0.5 -0.5 2869 1
i 4 87.03956343792632 2 6.33333333333333 68 -1 -0.21737222217989 -0.5 -0.5 2869 1
i 4 87.03956343792632 2 8.91666666666667 68 -1 -0.10637198460781 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 9.25 68 -1 -0.42538194329844 -0.5 -0.5 367232 1
i 4 87.03956343792632 2 8.91666666666667 68 -1 0.29835653420357 -0.5 -0.5 367232 1
i 4 87.31241473396997 2 6.33333333333333 68 -1 -0.02808646245451 -0.5 -0.5 2869 1
i 4 87.31241473396997 2 8.91666666666667 68 -1 0.12141307835288 -0.5 -0.5 367232 1
i 4 87.58526603001364 2 6.33333333333333 68 -1 -0.28182908430225 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 6.66666666666667 68 -1 -0.2813951708229 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 6.33333333333333 68 -1 0.16489197523366 -0.5 -0.5 2869 1
i 4 87.58526603001364 2 8.91666666666667 68 -1 0.24541780296119 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 6.33333333333333 68 -1 0.13016071039408 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 6.33333333333333 68 -1 0.04251779221208 -0.5 -0.5 2869 1
i 5 87.8581173260573 2 6.91666666666667 68 -1 -0.41747758752724 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 7.41666666666667 68 -1 -0.17720813983009 -0.5 -0.5 2869 1
i 6 87.8581173260573 2 8 68 -1 -0.10743915973292 -0.5 -0.5 2869 1
i 4 87.8581173260573 2 6.66666666666667 68 -1 0.29870699644295 -0.5 -0.5 2869 1
i 4 87.8581173260573 2 8.91666666666667 68 -1 -0.24308563432987 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 9.25 68 -1 0.10405350343011 -0.5 -0.5 367232 1
i 4 87.8581173260573 2 8.91666666666667 68 -1 0.30772753936565 -0.5 -0.5 367232 1
i 4 88.13096862210095 2 6.66666666666667 68 -1 0.44831911855637 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 6.91666666666667 68 -1 -0.47256360166028 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 6.66666666666667 68 -1 -0.37268489220466 -0.5 -0.5 2869 1
i 4 88.13096862210095 2 8.91666666666667 68 -1 -0.22110328521198 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 8.91666666666667 68 -1 -0.2206231512987 -0.5 -0.5 367232 1
i 6 88.13096862210095 2 9.5 68 -1 0.4725410365998 -0.5 -0.5 367232 1
i 5 88.13096862210095 2 10 68 -1 0.46789399886742 -0.5 -0.5 367232 1
i 5 88.13096862210095 2 10.58333333333333 68 -1 0.43940746021882 -0.5 -0.5 367232 1
i 4 88.13096862210095 2 8.58333333333333 68 -1 0.40234888112185 -0.5 -0.5 367232 1
i 4 88.4038199181446 2 6.66666666666667 68 -1 0.20164689050833 -0.5 -0.5 2869 1
i 4 88.4038199181446 2 6.33333333333333 68 -1 -0.09637230282124 -0.5 -0.5 2869 1
i 4 88.4038199181446 2 8.58333333333333 68 -1 -0.4331907956411 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 6.33333333333333 68 -1 -0.05841003636866 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 6.66666666666667 68 -1 -0.25042624429508 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 6.33333333333333 68 -1 0.26949039011398 -0.5 -0.5 2869 1
i 4 88.67667121418826 2 8.58333333333333 68 -1 -0.05032043675986 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 8.91666666666667 68 -1 0.41644535259418 -0.5 -0.5 367232 1
i 4 88.67667121418826 2 8.58333333333333 68 -1 0.20232468346724 -0.5 -0.5 367232 1
i 4 88.94952251023192 2 6.33333333333333 68 -1 0.1889783110881 -0.5 -0.5 2869 1
i 4 88.94952251023192 2 8.58333333333333 68 -1 -0.02071224334151 -0.5 -0.5 367232 1
i 6 88.94952251023192 2 8.58333333333333 68 -1 -0.33425624946722 -0.5 -0.5 367232 1
i 5 88.94952251023192 2 9.25 68 -1 -0.37911601814473 -0.5 -0.5 367232 1
i 6 88.94952251023192 2 9.75 68 -1 -0.17597490601348 -0.5 -0.5 367232 1
i 6 88.94952251023192 2 10.33333333333333 68 -1 -0.18000927556243 -0.5 -0.5 367232 1
i 4 88.94952251023192 2 8.91666666666667 68 -1 -0.47087881603788 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 6.33333333333333 68 -1 0.11138794899022 -0.5 -0.5 2869 1
i 4 89.22237380627557 2 8.91666666666667 68 -1 0.23956201549693 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 9.25 68 -1 -0.32505768885551 -0.5 -0.5 367232 1
i 4 89.22237380627557 2 8.91666666666667 68 -1 0.14067388238847 -0.5 -0.5 367232 1
i 4 89.49522510231924 2 6.33333333333333 68 -1 0.18533854619753 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 6.66666666666667 68 -1 -0.16828419121918 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 6.33333333333333 68 -1 -0.44380818497157 -0.5 -0.5 2869 1
i 4 89.49522510231924 2 8.91666666666667 68 -1 -0.49948388906326 -0.5 -0.5 367232 1
i 4 89.49522510231924 2 8.58333333333333 68 -1 0.23627839718548 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 6.33333333333333 68 -1 -0.42826086382628 -0.5 -0.5 2869 1
i 6 89.7680763983629 2 6.33333333333333 68 -1 -0.14706633039152 -0.5 -0.5 2869 1
i 6 89.7680763983629 2 6.91666666666667 68 -1 0.43937627027226 -0.5 -0.5 2869 1
i 6 89.7680763983629 2 7.41666666666667 68 -1 0.4020067112228 -0.5 -0.5 2869 1
i 6 89.7680763983629 2 8 68 -1 -0.42112350298686 -0.5 -0.5 2869 1
i 4 89.7680763983629 2 8.58333333333333 68 -1 -0.04001142580083 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 8.91666666666667 68 -1 0.49095307253621 -0.5 -0.5 367232 1
i 4 89.7680763983629 2 8.58333333333333 68 -1 0.32344713049823 -0.5 -0.5 367232 1
i 4 90.04092769440655 2 6.33333333333333 68 -1 -0.49490217622659 -0.5 -0.5 2869 1
i 4 90.04092769440655 2 8.58333333333333 68 -1 0.23062566396185 -0.5 -0.5 367232 1
i 4 90.3137789904502 2 6.33333333333333 68 -1 0.38437049367147 -0.5 -0.5 2869 1
i 4 90.3137789904502 2 8.58333333333333 68 -1 0.28736626588225 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 6.33333333333333 68 -1 -0.37172479169093 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 6.66666666666667 68 -1 -0.32881371800341 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 6.33333333333333 68 -1 0.42182718720665 -0.5 -0.5 2869 1
i 4 90.58663028649386 2 8.58333333333333 68 -1 -0.28945165163729 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 8.91666666666667 68 -1 0.16075378150282 -0.5 -0.5 367232 1
i 4 90.58663028649386 2 8.58333333333333 68 -1 -0.49877005866802 -0.5 -0.5 367232 1
i 4 90.85948158253751 2 6.33333333333333 68 -1 -0.48985789966219 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 6.33333333333333 68 -1 0.39530868360365 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 6.91666666666667 68 -1 -0.18460873502377 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 7.41666666666667 68 -1 0.10092767957867 -0.5 -0.5 2869 1
i 6 90.85948158253751 2 8 68 -1 -0.3980006541996 -0.5 -0.5 2869 1
i 4 90.85948158253751 2 6.66666666666667 68 -1 -0.27569625548429 -0.5 -0.5 2869 1
i 4 90.85948158253751 2 8.58333333333333 68 -1 0.49269195056273 -0.5 -0.5 367232 1
i 6 90.85948158253751 2 8.58333333333333 68 -1 -0.34222725272067 -0.5 -0.5 367232 1
i 6 90.85948158253751 2 9.25 68 -1 -0.24534341294265 -0.5 -0.5 367232 1
i 6 90.85948158253751 2 9.75 68 -1 -0.47464550740201 -0.5 -0.5 367232 1
i 5 90.85948158253751 2 10.33333333333333 68 -1 -0.08160872410796 -0.5 -0.5 367232 1
i 4 91.13233287858117 2 6.66666666666667 68 -1 -0.48201532219307 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 6.91666666666667 68 -1 0.08663335578135 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 6.66666666666667 68 -1 -0.42114664047298 -0.5 -0.5 2869 1
i 4 91.13233287858117 2 8.58333333333333 68 -1 0.22684475949074 -0.5 -0.5 367232 1
i 4 91.40518417462482 2 6.66666666666667 68 -1 0.40154410648875 -0.5 -0.5 2869 1
i 4 91.40518417462482 2 6.33333333333333 68 -1 0.14364209467951 -0.5 -0.5 2869 1
i 4 91.40518417462482 2 8.58333333333333 68 -1 0.13928866928719 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 6.33333333333333 68 -1 0.31762127775582 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 6.66666666666667 68 -1 0.34414262915935 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 6.33333333333333 68 -1 -0.0322100280096 -0.5 -0.5 2869 1
i 4 91.67803547066849 2 8.58333333333333 68 -1 -0.10660780561475 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 8.91666666666667 68 -1 0.48083783513482 -0.5 -0.5 367232 1
i 4 91.67803547066849 2 8.58333333333333 68 -1 -0.41678554040673 -0.5 -0.5 367232 1
i 4 91.95088676671215 2 6.33333333333333 68 -1 0.05395200144959 -0.5 -0.5 2869 1
i 4 91.95088676671215 2 8.58333333333333 68 -1 0.09348101372822 -0.5 -0.5 367232 1
i 6 91.95088676671215 2 8.58333333333333 68 -1 -0.09323777091725 -0.5 -0.5 367232 1
i 5 91.95088676671215 2 9.25 68 -1 -0.29949759729333 -0.5 -0.5 367232 1
i 5 91.95088676671215 2 9.75 68 -1 0.40673088305472 -0.5 -0.5 367232 1
i 6 91.95088676671215 2 10.33333333333333 68 -1 0.2325952083241 -0.5 -0.5 367232 1
i 4 91.95088676671215 2 8.91666666666667 68 -1 0.01831476319924 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 6.33333333333333 68 -1 -0.18594850437762 -0.5 -0.5 2869 1
i 4 92.2237380627558 2 8.91666666666667 68 -1 -0.0599082651698 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 9.25 68 -1 -0.2908174908094 -0.5 -0.5 367232 1
i 4 92.2237380627558 2 8.91666666666667 68 -1 -0.30466374203967 -0.5 -0.5 367232 1
i 4 92.49658935879945 2 6.33333333333333 68 -1 -0.38860713559935 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 6.66666666666667 68 -1 -0.47051540771476 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 6.33333333333333 68 -1 0.32166412858838 -0.5 -0.5 2869 1
i 4 92.49658935879945 2 8.91666666666667 68 -1 0.1577779101746 -0.5 -0.5 367232 1
i 4 92.49658935879945 2 8.58333333333333 68 -1 -0.29831603786535 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 6.33333333333333 68 -1 -0.08829706406933 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.33333333333333 68 -1 -0.30842564057986 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 6.91666666666667 68 -1 -0.31767564993077 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 -0.48538125871814 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 8 68 -1 -0.17759203001588 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.33333333333333 68 -1 0.18578113320661 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.91666666666667 68 -1 -0.19198815793104 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 -0.44784874157699 -0.5 -0.5 2869 1
i 5 92.76944065484311 2 8 68 -1 0.04010645008455 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.33333333333333 68 -1 0.33232950878711 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 6.91666666666667 68 -1 0.47896748848279 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 7.41666666666667 68 -1 0.29423662960133 -0.5 -0.5 2869 1
i 6 92.76944065484311 2 8 68 -1 -0.36229468120123 -0.5 -0.5 2869 1
i 4 92.76944065484311 2 6 68 -1 -0.34571346606356 -0.5 -0.5 2869 1
i 4 92.76944065484311 2 8.58333333333333 68 -1 0.15463652190579 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 8.91666666666667 68 -1 -0.49752105889608 -0.5 -0.5 367232 1
i 4 92.76944065484311 2 8.58333333333333 68 -1 -0.49272195517715 -0.5 -0.5 367232 1
i 4 93.04229195088676 2 6 68 -1 -0.42810637257025 -0.5 -0.5 2869 1
i 4 93.04229195088676 2 8.58333333333333 68 -1 0.14977385250728 -0.5 -0.5 367232 1
i 4 93.31514324693042 2 6 68 -1 -0.18085470404377 -0.5 -0.5 2869 1
i 4 93.31514324693042 2 8.58333333333333 68 -1 0.46157022325178 -0.5 -0.5 367232 1
i 3 93.58799454297409 2 8 68 -1 0.30974288071319 -0.5 -0.5 2869 1
i 3 93.58799454297409 2 8.33333333333333 68 -1 0.27975267652173 -0.5 -0.5 2869 1
i 4 93.58799454297409 2 8 68 -1 -0.12179583150943 -0.5 -0.5 2869 1
i 3 93.58799454297409 2 8 68 -1 -0.11598235171178 -0.5 -0.5 2869 1
i 4 93.58799454297409 2 6 68 -1 0.49991895546856 -0.5 -0.5 2869 1
i 4 93.58799454297409 2 8.58333333333333 68 -1 0.03251600778847 -0.5 -0.5 367232 1
i 4 93.58799454297409 2 8.91666666666667 68 -1 0.05525622113998 -0.5 -0.5 367232 1
i 4 93.58799454297409 2 8.58333333333333 68 -1 -0.05224032851029 -0.5 -0.5 367232 1
i 3 93.86084583901774 2 8 68 -1 0.31077939391967 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8 68 -1 -0.23825728728273 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8.33333333333333 68 -1 0.4796424481948 -0.5 -0.5 2869 1
i 3 93.86084583901774 2 8 68 -1 -0.35259040389761 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6 68 -1 0.16301932008519 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6.33333333333333 68 -1 -0.36547386194936 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 6 68 -1 -0.20452875884076 -0.5 -0.5 2869 1
i 4 93.86084583901774 2 8.58333333333333 68 -1 -0.10709495924969 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 8.58333333333333 68 -1 0.36038072591868 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 0.17357192134979 -0.5 -0.5 367232 1
i 5 93.86084583901774 2 9.75 68 -1 0.15608531470382 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 10.33333333333333 68 -1 -0.41126154009245 -0.5 -0.5 367232 1
i 5 93.86084583901774 2 8.58333333333333 68 -1 -0.29284906403075 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 -0.00635542408905 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.75 68 -1 0.08695229463084 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 10.33333333333333 68 -1 0.42989524025901 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 8.58333333333333 68 -1 -0.12852168425574 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.25 68 -1 0.44377008060781 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 9.75 68 -1 0.41806331857112 -0.5 -0.5 367232 1
i 6 93.86084583901774 2 10.33333333333333 68 -1 -0.21218482334664 -0.5 -0.5 367232 1
i 4 93.86084583901774 2 8.33333333333333 68 -1 0.25724796078458 -0.5 -0.5 367232 1
i 4 94.1336971350614 2 8 68 -1 -0.20704931281946 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 8 68 -1 -0.36291917723223 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 8.66666666666667 68 -1 -0.1424504636171 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 9.16666666666667 68 -1 0.40112272198374 -0.5 -0.5 2869 1
i 5 94.1336971350614 2 9.66666666666667 68 -1 0.25187665163861 -0.5 -0.5 2869 1
i 3 94.1336971350614 2 8.33333333333333 68 -1 0.3032916826004 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 6 68 -1 -0.2094799884618 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 6 68 -1 -0.01787286500336 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 6.66666666666667 68 -1 -0.06932691162974 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 7.16666666666667 68 -1 0.48494355105637 -0.5 -0.5 2869 1
i 6 94.1336971350614 2 7.66666666666667 68 -1 0.26188521046975 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 6.33333333333333 68 -1 -0.11685502193799 -0.5 -0.5 2869 1
i 4 94.1336971350614 2 8.33333333333333 68 -1 -0.48520122355113 -0.5 -0.5 367232 1
i 3 94.40654843110505 2 8.33333333333333 68 -1 0.43091214301711 -0.5 -0.5 2869 1
i 3 94.40654843110505 2 8.66666666666667 68 -1 -0.19363834115808 -0.5 -0.5 2869 1
i 3 94.40654843110505 2 8.33333333333333 68 -1 0.09597055436855 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.33333333333333 68 -1 0.38816401215288 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.66666666666667 68 -1 -0.31610189622245 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 6.33333333333333 68 -1 -0.19334160061333 -0.5 -0.5 2869 1
i 4 94.40654843110505 2 8.33333333333333 68 -1 0.28634370333498 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 8.33333333333333 68 -1 -0.0731450636482 -0.5 -0.5 2869 1
i 3 94.6793997271487 2 8 68 -1 -0.29109551434311 -0.5 -0.5 2869 1
i 4 94.6793997271487 2 6.33333333333333 68 -1 -0.31606081962416 -0.5 -0.5 2869 1
i 4 94.6793997271487 2 6 68 -1 0.04133891666902 -0.5 -0.5 2869 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 0.0843568807824 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 10.58333333333333 68 -1 0.39903468922811 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 -0.43705192259404 -0.5 -0.5 367232 1
i 3 94.6793997271487 2 10.33333333333333 68 -1 -0.1813175526403 -0.5 -0.5 367232 1
i 4 94.6793997271487 2 8.33333333333333 68 -1 0.04318419895781 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 8 68 -1 -0.15556742972344 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 8.33333333333333 68 -1 -0.05280166222696 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 8 68 -1 -0.40450211991202 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6 68 -1 0.00846269926019 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6.33333333333333 68 -1 0.08525124228945 -0.5 -0.5 2869 1
i 4 94.95225102319236 2 6 68 -1 0.06708780891868 -0.5 -0.5 2869 1
i 3 94.95225102319236 2 10.33333333333333 68 -1 -0.24954586064439 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 10.33333333333333 68 -1 0.10683137805589 -0.5 -0.5 367232 1
i 3 94.95225102319236 2 10.58333333333333 68 -1 -0.04544296412485 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 10.33333333333333 68 -1 0.34824979464365 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.33333333333333 68 -1 0.20200940919738 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.58333333333333 68 -1 0.21705392402991 -0.5 -0.5 367232 1
i 4 94.95225102319236 2 8.33333333333333 68 -1 0.23104589109968 -0.5 -0.5 367232 1
i 3 95.22510231923602 2 8 68 -1 -0.13270952342426 -0.5 -0.5 2869 1
i 4 95.22510231923602 2 6 68 -1 -0.05549487137024 -0.5 -0.5 2869 1
i 3 95.22510231923602 2 10.33333333333333 68 -1 0.40969672026848 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 10.33333333333333 68 -1 0.02599300118179 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 10.91666666666667 68 -1 -0.15693435741803 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 11.5 68 -1 -0.4243575986185 -0.5 -0.5 367232 1
i 5 95.22510231923602 2 12 68 -1 -0.09025831637969 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 10.58333333333333 68 -1 -0.4767506848253 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 8.33333333333333 68 -1 -0.43694086176603 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 8.33333333333333 68 -1 0.35015260899437 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 8.91666666666667 68 -1 0.30919099106694 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 9.5 68 -1 0.06084171771633 -0.5 -0.5 367232 1
i 6 95.22510231923602 2 10 68 -1 0.13045956922554 -0.5 -0.5 367232 1
i 4 95.22510231923602 2 8.58333333333333 68 -1 0.49840056272131 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 8 68 -1 -0.4724164613511 -0.5 -0.5 2869 1
i 4 95.49795361527967 2 6 68 -1 0.21074698633874 -0.5 -0.5 2869 1
i 3 95.49795361527967 2 10.58333333333333 68 -1 0.4706687114182 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 10.91666666666667 68 -1 0.34404044891198 -0.5 -0.5 367232 1
i 3 95.49795361527967 2 10.58333333333333 68 -1 0.22072509444669 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.58333333333333 68 -1 -0.34494279234639 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.91666666666667 68 -1 0.17474990895256 -0.5 -0.5 367232 1
i 4 95.49795361527967 2 8.58333333333333 68 -1 -0.41534196397314 -0.5 -0.5 367232 1
i 3 95.77080491132334 2 8 68 -1 0.18609135626502 -0.5 -0.5 2869 1
i 3 95.77080491132334 2 8.33333333333333 68 -1 0.3820696445933 -0.5 -0.5 2869 1
i 3 95.77080491132334 2 8 68 -1 -0.1142268946168 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6 68 -1 -0.01641842662254 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6.33333333333333 68 -1 -0.42295317455665 -0.5 -0.5 2869 1
i 4 95.77080491132334 2 6 68 -1 -0.41145403819928 -0.5 -0.5 2869 1
i 3 95.77080491132334 2 10.58333333333333 68 -1 -0.01434166294354 -0.5 -0.5 367232 1
i 3 95.77080491132334 2 10.33333333333333 68 -1 0.14086182729623 -0.5 -0.5 367232 1
i 4 95.77080491132334 2 8.58333333333333 68 -1 0.44334524655567 -0.5 -0.5 367232 1
i 4 95.77080491132334 2 8.33333333333333 68 -1 0.48570784901747 -0.5 -0.5 367232 1
i 3 96.043656207367 2 8 68 -1 -0.1418853572514 -0.5 -0.5 2869 1
i 5 96.043656207367 2 8 68 -1 0.33259765604132 -0.5 -0.5 2869 1
i 5 96.043656207367 2 8.66666666666667 68 -1 0.20340756338718 -0.5 -0.5 2869 1
i 5 96.043656207367 2 9.16666666666667 68 -1 0.09140094877161 -0.5 -0.5 2869 1
i 5 96.043656207367 2 9.66666666666667 68 -1 -0.12571396029459 -0.5 -0.5 2869 1
i 4 96.043656207367 2 6 68 -1 -0.49381690876511 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6 68 -1 0.19904629372012 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6.66666666666667 68 -1 0.18597813756648 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.16666666666667 68 -1 -0.46864928252908 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.66666666666667 68 -1 -0.09937080682182 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6 68 -1 -0.22416530928042 -0.5 -0.5 2869 1
i 6 96.043656207367 2 6.66666666666667 68 -1 0.41802767746617 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.16666666666667 68 -1 -0.16508132073034 -0.5 -0.5 2869 1
i 6 96.043656207367 2 7.66666666666667 68 -1 0.22468334993991 -0.5 -0.5 2869 1
i 4 96.043656207367 2 6.33333333333333 68 -1 0.31672598435366 -0.5 -0.5 2869 1
i 3 96.043656207367 2 10.33333333333333 68 -1 -0.49910036044647 -0.5 -0.5 367232 1
i 3 96.043656207367 2 10.58333333333333 68 -1 0.14034475523788 -0.5 -0.5 367232 1
i 3 96.043656207367 2 10.33333333333333 68 -1 0.43633768523031 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.33333333333333 68 -1 -0.43925097581704 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.58333333333333 68 -1 0.21729135032982 -0.5 -0.5 367232 1
i 4 96.043656207367 2 8.33333333333333 68 -1 -0.12557410369149 -0.5 -0.5 367232 1
i 4 96.31650750341065 2 6.33333333333333 68 -1 0.42538126250801 -0.5 -0.5 2869 1
i 3 96.31650750341065 2 10.33333333333333 68 -1 0.05907991714865 -0.5 -0.5 367232 1
i 4 96.31650750341065 2 8.33333333333333 68 -1 -0.35467085783524 -0.5 -0.5 367232 1
i 4 96.5893587994543 2 6.33333333333333 68 -1 -0.1615098917291 -0.5 -0.5 2869 1
i 4 96.5893587994543 2 6.66666666666667 68 -1 -0.46639244367809 -0.5 -0.5 2869 1
i 4 96.5893587994543 2 6.33333333333333 68 -1 -0.45139753795348 -0.5 -0.5 2869 1
i 4 96.5893587994543 2 10.33333333333333 68 -1 0.09973746307018 -0.5 -0.5 367232 1
i 4 96.5893587994543 2 8.33333333333333 68 -1 -0.28436911873561 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 7.66666666666667 68 -1 -0.01381679840712 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 8 68 -1 0.39200549504828 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 7.66666666666667 68 -1 0.14588994035552 -0.5 -0.5 2869 1
i 4 96.86221009549796 2 6.33333333333333 68 -1 -0.35982893842138 -0.5 -0.5 2869 1
i 6 96.86221009549796 2 6.33333333333333 68 -1 -0.20688473799754 -0.5 -0.5 2869 1
i 5 96.86221009549796 2 6.91666666666667 68 -1 0.34209126381943 -0.5 -0.5 2869 1
i 6 96.86221009549796 2 7.41666666666667 68 -1 0.12257382921251 -0.5 -0.5 2869 1
i 5 96.86221009549796 2 8 68 -1 -0.29381835981054 -0.5 -0.5 2869 1
i 4 96.86221009549796 2 6.66666666666667 68 -1 -0.38334919598228 -0.5 -0.5 2869 1
i 3 96.86221009549796 2 10.33333333333333 68 -1 -0.40651754498529 -0.5 -0.5 367232 1
i 3 96.86221009549796 2 10.58333333333333 68 -1 0.13745127059581 -0.5 -0.5 367232 1
i 3 96.86221009549796 2 10.33333333333333 68 -1 -0.33402553940384 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.33333333333333 68 -1 0.45510490533002 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.58333333333333 68 -1 0.22631331455787 -0.5 -0.5 367232 1
i 4 96.86221009549796 2 8.33333333333333 68 -1 -0.24569242227844 -0.5 -0.5 367232 1
i 3 97.13506139154161 2 7.66666666666667 68 -1 -0.00728267488718 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.66666666666667 68 -1 -0.11558726078221 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.91666666666667 68 -1 -0.37931734418572 -0.5 -0.5 2869 1
i 4 97.13506139154161 2 6.66666666666667 68 -1 0.29464361518245 -0.5 -0.5 2869 1
i 3 97.13506139154161 2 10.33333333333333 68 -1 0.02128529225242 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 10.33333333333333 68 -1 -0.23001890738882 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 10.91666666666667 68 -1 -0.23992341674972 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 11.5 68 -1 -0.05799674321418 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 12 68 -1 -0.33265259201823 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 8.33333333333333 68 -1 -0.20418110712165 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 8.33333333333333 68 -1 -0.47682720166368 -0.5 -0.5 367232 1
i 5 97.13506139154161 2 8.91666666666667 68 -1 0.31108550087645 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 9.5 68 -1 -0.47317918882241 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 10 68 -1 0.26666032614446 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 8.33333333333333 68 -1 -0.29750753979997 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 8.91666666666667 68 -1 0.20867953303709 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 9.5 68 -1 -0.30311980155776 -0.5 -0.5 367232 1
i 6 97.13506139154161 2 10 68 -1 0.1922207437818 -0.5 -0.5 367232 1
i 4 97.13506139154161 2 8.58333333333333 68 -1 -0.07366907149493 -0.5 -0.5 367232 1
i 4 97.40791268758527 2 6.66666666666667 68 -1 -0.32343834439448 -0.5 -0.5 2869 1
i 4 97.40791268758527 2 6.33333333333333 68 -1 0.42011305501588 -0.5 -0.5 2869 1
i 4 97.40791268758527 2 8.58333333333333 68 -1 -0.16895608265632 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 6.33333333333333 68 -1 -0.14054955306083 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 6.66666666666667 68 -1 0.14121523447119 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 6.33333333333333 68 -1 -0.01148723561342 -0.5 -0.5 2869 1
i 4 97.68076398362892 2 8.58333333333333 68 -1 0.38813713391481 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 8.91666666666667 68 -1 -0.26345577023363 -0.5 -0.5 367232 1
i 4 97.68076398362892 2 8.58333333333333 68 -1 -0.19897670197451 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 6.33333333333333 68 -1 0.13998725622489 -0.5 -0.5 2869 1
i 3 97.95361527967258 2 10 68 -1 0.33198497699715 -0.5 -0.5 367232 1
i 3 97.95361527967258 2 10.33333333333333 68 -1 -0.49359817141152 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 10 68 -1 0.0046257933034 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 8.58333333333333 68 -1 -0.01725575362815 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 8.58333333333333 68 -1 -0.36752461449024 -0.5 -0.5 367232 1
i 5 97.95361527967258 2 9.25 68 -1 -0.2423907308621 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 9.75 68 -1 0.20520779485425 -0.5 -0.5 367232 1
i 6 97.95361527967258 2 10.33333333333333 68 -1 -0.11821748668192 -0.5 -0.5 367232 1
i 4 97.95361527967258 2 8.91666666666667 68 -1 0.22295088751116 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 6.33333333333333 68 -1 -0.21684558232859 -0.5 -0.5 2869 1
i 3 98.22646657571623 2 10 68 -1 -0.29212584856046 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 8.91666666666667 68 -1 -0.16673544804273 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 9.25 68 -1 0.32165261448862 -0.5 -0.5 367232 1
i 4 98.22646657571623 2 8.91666666666667 68 -1 0.29909143402256 -0.5 -0.5 367232 1
i 4 98.49931787175989 2 6.33333333333333 68 -1 -0.43123972625428 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 6.66666666666667 68 -1 0.484253678254 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 6.33333333333333 68 -1 -0.31789927899475 -0.5 -0.5 2869 1
i 4 98.49931787175989 2 8.91666666666667 68 -1 0.42391389878604 -0.5 -0.5 367232 1
i 4 98.49931787175989 2 8.58333333333333 68 -1 0.3918134921681 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 6.33333333333333 68 -1 0.42254440581739 -0.5 -0.5 2869 1
i 6 98.77216916780354 2 6.33333333333333 68 -1 -0.07215604298741 -0.5 -0.5 2869 1
i 6 98.77216916780354 2 6.91666666666667 68 -1 -0.18490399014831 -0.5 -0.5 2869 1
i 5 98.77216916780354 2 7.41666666666667 68 -1 0.15889631427344 -0.5 -0.5 2869 1
i 6 98.77216916780354 2 8 68 -1 -0.198047958247 -0.5 -0.5 2869 1
i 4 98.77216916780354 2 6 68 -1 -0.41763125586541 -0.5 -0.5 2869 1
i 4 98.77216916780354 2 8.58333333333333 68 -1 -0.37140222920649 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 8.91666666666667 68 -1 0.309495801671 -0.5 -0.5 367232 1
i 4 98.77216916780354 2 8.58333333333333 68 -1 0.36114218778186 -0.5 -0.5 367232 1
i 4 99.0450204638472 2 6 68 -1 0.38875630215617 -0.5 -0.5 2869 1
i 4 99.0450204638472 2 8.58333333333333 68 -1 -0.36589773295172 -0.5 -0.5 367232 1
i 4 99.31787175989085 2 6 68 -1 -0.1859054933441 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 6.33333333333333 68 -1 -0.12965889578548 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 6 68 -1 0.22001461418107 -0.5 -0.5 2869 1
i 4 99.31787175989085 2 8.58333333333333 68 -1 0.41722522076713 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 6 68 -1 -0.32779719801329 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 6 68 -1 0.06429391655158 -0.5 -0.5 2869 1
i 5 99.5907230559345 2 6.66666666666667 68 -1 0.32384996585458 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 7.16666666666667 68 -1 -0.22619378832496 -0.5 -0.5 2869 1
i 6 99.5907230559345 2 7.66666666666667 68 -1 0.00348734900487 -0.5 -0.5 2869 1
i 4 99.5907230559345 2 6.33333333333333 68 -1 -0.49803001142733 -0.5 -0.5 2869 1
i 4 99.5907230559345 2 8.58333333333333 68 -1 -0.34370226348627 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 8.91666666666667 68 -1 0.20914870079646 -0.5 -0.5 367232 1
i 4 99.5907230559345 2 8.58333333333333 68 -1 0.34961299422042 -0.5 -0.5 367232 1
i 4 99.86357435197817 2 6.33333333333333 68 -1 0.4301862444689 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 6.66666666666667 68 -1 0.18195095590392 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 6.33333333333333 68 -1 -0.01997340023347 -0.5 -0.5 2869 1
i 4 99.86357435197817 2 8.58333333333333 68 -1 -0.15520409212839 -0.5 -0.5 367232 1
i 5 99.86357435197817 2 8.58333333333333 68 -1 0.21822131099114 -0.5 -0.5 367232 1
i 6 99.86357435197817 2 9.25 68 -1 -0.17048680369392 -0.5 -0.5 367232 1
i 5 99.86357435197817 2 9.75 68 -1 0.21750187001093 -0.5 -0.5 367232 1
i 6 99.86357435197817 2 10.33333333333333 68 -1 -0.2990964244801 -0.5 -0.5 367232 1
i 4 99.86357435197817 2 8.33333333333333 68 -1 -0.01001849340597 -0.5 -0.5 367232 1
i 4 100.13642564802183 2 6.33333333333333 68 -1 -0.35324715473394 -0.5 -0.5 2869 1
i 4 100.13642564802183 2 6 68 -1 -0.39612000878015 -0.5 -0.5 2869 1
i 4 100.13642564802183 2 8.33333333333333 68 -1 -0.4134182628402 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 6 68 -1 0.42763996881498 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 6.33333333333333 68 -1 -0.12646039759518 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 6 68 -1 0.16074895328902 -0.5 -0.5 2869 1
i 4 100.40927694406548 2 8.33333333333333 68 -1 -0.21190080793506 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 8.58333333333333 68 -1 -0.16653901465967 -0.5 -0.5 367232 1
i 4 100.40927694406548 2 8.33333333333333 68 -1 0.34494773093304 -0.5 -0.5 367232 1
i 4 100.68212824010914 2 6 68 -1 -0.44870659402566 -0.5 -0.5 2869 1
i 4 100.68212824010914 2 8.33333333333333 68 -1 0.12644784420684 -0.5 -0.5 367232 1
i 6 100.68212824010914 2 8.33333333333333 68 -1 -0.02172909192653 -0.5 -0.5 367232 1
i 6 100.68212824010914 2 8.91666666666667 68 -1 0.22191745190545 -0.5 -0.5 367232 1
i 6 100.68212824010914 2 9.5 68 -1 0.23347375502742 -0.5 -0.5 367232 1
i 5 100.68212824010914 2 10 68 -1 -0.44284550720452 -0.5 -0.5 367232 1
i 4 100.68212824010914 2 8.58333333333333 68 -1 0.38637829568039 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 6 68 -1 -0.27872740238309 -0.5 -0.5 2869 1
i 4 100.95497953615279 2 8.58333333333333 68 -1 -0.38338626664775 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 8.91666666666667 68 -1 0.17940623008616 -0.5 -0.5 367232 1
i 4 100.95497953615279 2 8.58333333333333 68 -1 -0.05099312281154 -0.5 -0.5 367232 1
i 4 101.22783083219645 2 6 68 -1 0.09670463375139 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 6.33333333333333 68 -1 -0.32587037468862 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 6 68 -1 -0.42157272954718 -0.5 -0.5 2869 1
i 4 101.22783083219645 2 8.58333333333333 68 -1 0.04975024881399 -0.5 -0.5 367232 1
i 4 101.22783083219645 2 8.33333333333333 68 -1 -0.3847680868729 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 6 68 -1 0.03875975309168 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 6 68 -1 0.20013885447528 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 6.66666666666667 68 -1 -0.17900129111953 -0.5 -0.5 2869 1
i 6 101.5006821282401 2 7.16666666666667 68 -1 0.04225373185337 -0.5 -0.5 2869 1
i 5 101.5006821282401 2 7.66666666666667 68 -1 -0.0953592303973 -0.5 -0.5 2869 1
i 4 101.5006821282401 2 8.33333333333333 68 -1 0.13604822437844 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 8.58333333333333 68 -1 -0.30391825608186 -0.5 -0.5 367232 1
i 4 101.5006821282401 2 8.33333333333333 68 -1 0.08120061896255 -0.5 -0.5 367232 1
i 4 101.77353342428377 2 6 68 -1 -0.29525047565271 -0.5 -0.5 2869 1
i 4 101.77353342428377 2 8.33333333333333 68 -1 -0.38174660302871 -0.5 -0.5 367232 1
i 4 102.04638472032742 2 6 68 -1 0.02478336592705 -0.5 -0.5 2869 1
i 4 102.04638472032742 2 8.33333333333333 68 -1 0.43137509141438 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 6 68 -1 0.44614766687614 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 6.33333333333333 68 -1 0.32399414017714 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 6 68 -1 0.35102754952193 -0.5 -0.5 2869 1
i 4 102.31923601637108 2 8.33333333333333 68 -1 0.32141764213266 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 8.58333333333333 68 -1 0.30850030803784 -0.5 -0.5 367232 1
i 4 102.31923601637108 2 8.33333333333333 68 -1 0.48963828501154 -0.5 -0.5 367232 1
i 4 102.59208731241473 2 6 68 -1 0.02488257072423 -0.5 -0.5 2869 1
i 6 102.59208731241473 2 6 68 -1 -0.45779054117797 -0.5 -0.5 2869 1
i 5 102.59208731241473 2 6.66666666666667 68 -1 0.37422114904337 -0.5 -0.5 2869 1
i 6 102.59208731241473 2 7.16666666666667 68 -1 0.10318606843771 -0.5 -0.5 2869 1
i 5 102.59208731241473 2 7.66666666666667 68 -1 0.25340529103817 -0.5 -0.5 2869 1
i 4 102.59208731241473 2 6.33333333333333 68 -1 0.42958920474545 -0.5 -0.5 2869 1
i 4 102.59208731241473 2 8.33333333333333 68 -1 0.08586605236988 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 8.33333333333333 68 -1 0.00730670990334 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 8.91666666666667 68 -1 -0.03856791727485 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 9.5 68 -1 0.20411288711876 -0.5 -0.5 367232 1
i 6 102.59208731241473 2 10 68 -1 -0.39510480357662 -0.5 -0.5 367232 1
i 4 102.86493860845839 2 6.33333333333333 68 -1 -0.0578276308798 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 6.66666666666667 68 -1 -0.31640671559671 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 6.33333333333333 68 -1 0.21997084907271 -0.5 -0.5 2869 1
i 4 102.86493860845839 2 8.33333333333333 68 -1 -0.46053887698736 -0.5 -0.5 367232 1
i 4 103.13778990450204 2 6.33333333333333 68 -1 0.42112357719082 -0.5 -0.5 2869 1
i 4 103.13778990450204 2 6 68 -1 -0.12218974132894 -0.5 -0.5 2869 1
i 4 103.13778990450204 2 8.33333333333333 68 -1 0.03221458383432 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 6 68 -1 -0.27745958596616 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 6.33333333333333 68 -1 -0.09017917834634 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 6 68 -1 -0.32908799219241 -0.5 -0.5 2869 1
i 4 103.4106412005457 2 8.33333333333333 68 -1 -0.30935928468222 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 8.58333333333333 68 -1 -0.26032177165986 -0.5 -0.5 367232 1
i 4 103.4106412005457 2 8.33333333333333 68 -1 0.19038160497038 -0.5 -0.5 367232 1
i 4 103.68349249658935 2 6 68 -1 -0.23533504515086 -0.5 -0.5 2869 1
i 4 103.68349249658935 2 8.33333333333333 68 -1 -0.1340812759464 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 8.33333333333333 68 -1 -0.31342490886484 -0.5 -0.5 367232 1
i 5 103.68349249658935 2 8.91666666666667 68 -1 -0.11677398127432 -0.5 -0.5 367232 1
i 6 103.68349249658935 2 9.5 68 -1 0.37400767522964 -0.5 -0.5 367232 1
i 6 103.68349249658935 2 10 68 -1 -0.36054926219913 -0.5 -0.5 367232 1
i 4 103.68349249658935 2 8.58333333333333 68 -1 0.03585904866276 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 6 68 -1 -0.09669391151521 -0.5 -0.5 2869 1
i 4 103.95634379263302 2 8.58333333333333 68 -1 -0.21226690272998 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 8.91666666666667 68 -1 -0.48568683607038 -0.5 -0.5 367232 1
i 4 103.95634379263302 2 8.58333333333333 68 -1 0.40233821753876 -0.5 -0.5 367232 1
i 4 104.22919508867668 2 6 68 -1 0.3666209523428 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 6.33333333333333 68 -1 0.1269944537889 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 6 68 -1 -0.22646516443529 -0.5 -0.5 2869 1
i 4 104.22919508867668 2 8.58333333333333 68 -1 -0.10617930769089 -0.5 -0.5 367232 1
i 4 104.22919508867668 2 8.33333333333333 68 -1 -0.03601556280015 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 6 68 -1 0.27488745206242 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6 68 -1 -0.23648095656087 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6.66666666666667 68 -1 -0.11762773215434 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.16666666666667 68 -1 -0.37071192324434 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.66666666666667 68 -1 -0.4886287506246 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6 68 -1 0.19149756864097 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6.66666666666667 68 -1 0.46857728660744 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.16666666666667 68 -1 0.15631436834138 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 7.66666666666667 68 -1 -0.27708375330702 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6 68 -1 -0.25973284976228 -0.5 -0.5 2869 1
i 6 104.50204638472033 2 6.66666666666667 68 -1 -0.04558252889928 -0.5 -0.5 2869 1
i 5 104.50204638472033 2 7.16666666666667 68 -1 0.36924417418402 -0.5 -0.5 2869 1
i 5 104.50204638472033 2 7.66666666666667 68 -1 0.41736165226351 -0.5 -0.5 2869 1
i 4 104.50204638472033 2 6.33333333333333 68 -1 -0.24134511951463 -0.5 -0.5 2869 1
i 4 104.50204638472033 2 8.33333333333333 68 -1 0.42818867757569 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 8.58333333333333 68 -1 -0.22361145454403 -0.5 -0.5 367232 1
i 4 104.50204638472033 2 8.33333333333333 68 -1 0.37753944802778 -0.5 -0.5 367232 1
i 4 104.77489768076398 2 6.33333333333333 68 -1 -0.19479213305086 -0.5 -0.5 2869 1
i 4 104.77489768076398 2 8.33333333333333 68 -1 0.24227744567407 -0.5 -0.5 367232 1
i 4 105.04774897680764 2 6.33333333333333 68 -1 0.06333378857984 -0.5 -0.5 2869 1
i 4 105.04774897680764 2 8.33333333333333 68 -1 -0.18824367027669 -0.5 -0.5 367232 1
i 3 105.3206002728513 2 7.66666666666667 68 -1 -0.15712256313628 -0.5 -0.5 2869 1
i 3 105.3206002728513 2 8 68 -1 -0.40672711764325 -0.5 -0.5 2869 1
i 3 105.3206002728513 2 7.66666666666667 68 -1 0.161646086636 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 7.66666666666667 68 -1 -0.18096453520759 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.33333333333333 68 -1 -0.07883850958131 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.66666666666667 68 -1 -0.36343530667768 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 6.33333333333333 68 -1 -0.05192386023591 -0.5 -0.5 2869 1
i 4 105.3206002728513 2 8.33333333333333 68 -1 -0.44010265159713 -0.5 -0.5 367232 1
i 4 105.3206002728513 2 8.58333333333333 68 -1 -0.37961111099468 -0.5 -0.5 367232 1
i 4 105.3206002728513 2 8.33333333333333 68 -1 0.49055798124284 -0.5 -0.5 367232 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 0.17282655837602 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 0.16706787971177 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 8 68 -1 0.19721285527057 -0.5 -0.5 2869 1
i 3 105.59345156889495 2 7.66666666666667 68 -1 -0.47145249447309 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 6.33333333333333 68 -1 0.1998105900551 -0.5 -0.5 2869 1
i 6 105.59345156889495 2 6.33333333333333 68 -1 -0.48948255202979 -0.5 -0.5 2869 1
i 5 105.59345156889495 2 6.91666666666667 68 -1 0.48398403288359 -0.5 -0.5 2869 1
i 5 105.59345156889495 2 7.41666666666667 68 -1 -0.42614845668889 -0.5 -0.5 2869 1
i 5 105.59345156889495 2 8 68 -1 0.42614085343065 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 6.66666666666667 68 -1 -0.15173506922975 -0.5 -0.5 2869 1
i 4 105.59345156889495 2 8.33333333333333 68 -1 -0.39499362830515 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 -0.34120319449636 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.91666666666667 68 -1 -0.18179228153278 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 9.5 68 -1 -0.49398398072216 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 10 68 -1 -0.05627596658612 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 -0.47526756289751 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.91666666666667 68 -1 0.40413061508203 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 9.5 68 -1 0.35947389195374 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 10 68 -1 0.04760923821824 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 8.33333333333333 68 -1 0.08028731735759 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 8.91666666666667 68 -1 -0.4265211956409 -0.5 -0.5 367232 1
i 5 105.59345156889495 2 9.5 68 -1 0.39404110574029 -0.5 -0.5 367232 1
i 6 105.59345156889495 2 10 68 -1 -0.33402871683369 -0.5 -0.5 367232 1
i 4 105.59345156889495 2 8.58333333333333 68 -1 -0.30072699840389 -0.5 -0.5 367232 1
i 3 105.86630286493862 2 7.66666666666667 68 -1 0.23926482128743 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 7.66666666666667 68 -1 -0.34974871793772 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 8.33333333333333 68 -1 0.41121033061213 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 8.75 68 -1 -0.22019524189073 -0.5 -0.5 2869 1
i 5 105.86630286493862 2 9.41666666666667 68 -1 0.16337211178058 -0.5 -0.5 2869 1
i 3 105.86630286493862 2 8 68 -1 0.23754343536073 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.66666666666667 68 -1 -0.408234453308 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.91666666666667 68 -1 0.05264440005534 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 6.66666666666667 68 -1 -0.39445611587098 -0.5 -0.5 2869 1
i 4 105.86630286493862 2 8.58333333333333 68 -1 0.37419094793931 -0.5 -0.5 367232 1
i 3 106.13915416098227 2 8 68 -1 0.41245135865726 -0.5 -0.5 2869 1
i 3 106.13915416098227 2 8.33333333333333 68 -1 0.06023698812569 -0.5 -0.5 2869 1
i 3 106.13915416098227 2 8 68 -1 0.08632041181465 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 6.66666666666667 68 -1 -0.42382169576575 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 6.33333333333333 68 -1 -0.06895171702021 -0.5 -0.5 2869 1
i 4 106.13915416098227 2 8.58333333333333 68 -1 -0.18479658277583 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 8 68 -1 0.06132547586292 -0.5 -0.5 2869 1
i 3 106.41200545702593 2 7.66666666666667 68 -1 -0.25190951291179 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.33333333333333 68 -1 -0.41659890870357 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.66666666666667 68 -1 -0.38899818915007 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 6.33333333333333 68 -1 0.45684324424751 -0.5 -0.5 2869 1
i 4 106.41200545702593 2 10 68 -1 -0.00500747406127 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 10.33333333333333 68 -1 0.46970599854529 -0.5 -0.5 367232 1
i 3 106.41200545702593 2 10 68 -1 0.48204879493293 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 10 68 -1 -0.45460703702963 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.58333333333333 68 -1 -0.33656804537154 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.91666666666667 68 -1 0.08742052577265 -0.5 -0.5 367232 1
i 4 106.41200545702593 2 8.58333333333333 68 -1 0.01520276960047 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 7.66666666666667 68 -1 0.46147785553017 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 8 68 -1 -0.03777055642459 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 7.66666666666667 68 -1 -0.12642065467908 -0.5 -0.5 2869 1
i 4 106.68485675306958 2 6.33333333333333 68 -1 0.33094708280653 -0.5 -0.5 2869 1
i 3 106.68485675306958 2 10 68 -1 0.42078382476021 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10 68 -1 -0.02127594612164 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10.33333333333333 68 -1 -0.4931166948226 -0.5 -0.5 367232 1
i 3 106.68485675306958 2 10 68 -1 0.06988605603596 -0.5 -0.5 367232 1
i 4 106.68485675306958 2 8.58333333333333 68 -1 -0.25463417179258 -0.5 -0.5 367232 1
i 6 106.68485675306958 2 8.58333333333333 68 -1 0.1693124462095 -0.5 -0.5 367232 1
i 6 106.68485675306958 2 9.25 68 -1 -0.38133515377672 -0.5 -0.5 367232 1
i 5 106.68485675306958 2 9.75 68 -1 0.20808192167081 -0.5 -0.5 367232 1
i 6 106.68485675306958 2 10.33333333333333 68 -1 -0.38950824804569 -0.5 -0.5 367232 1
i 4 106.68485675306958 2 8.91666666666667 68 -1 0.08659074144136 -0.5 -0.5 367232 1
i 3 106.95770804911324 2 7.66666666666667 68 -1 -0.08308036691108 -0.5 -0.5 2869 1
i 4 106.95770804911324 2 6.33333333333333 68 -1 -0.32700889019189 -0.5 -0.5 2869 1
i 3 106.95770804911324 2 10 68 -1 -0.03492394447681 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 10 68 -1 -0.18306058988589 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 10.58333333333333 68 -1 0.12379565516511 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 11.25 68 -1 -0.47861595139088 -0.5 -0.5 367232 1
i 5 106.95770804911324 2 11.75 68 -1 0.14131710867433 -0.5 -0.5 367232 1
i 3 106.95770804911324 2 10.33333333333333 68 -1 -0.01689042931536 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 8.91666666666667 68 -1 0.10763405242412 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 9.25 68 -1 -0.40266965461954 -0.5 -0.5 367232 1
i 4 106.95770804911324 2 8.91666666666667 68 -1 -0.02568249921359 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 7.66666666666667 68 -1 -0.43706042247887 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.33333333333333 68 -1 0.13752233238172 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.66666666666667 68 -1 -0.22053326900567 -0.5 -0.5 2869 1
i 4 107.23055934515689 2 6.33333333333333 68 -1 0.20436827711301 -0.5 -0.5 2869 1
i 3 107.23055934515689 2 10.33333333333333 68 -1 -0.40210967179932 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 10.58333333333333 68 -1 -0.18932093624035 -0.5 -0.5 367232 1
i 3 107.23055934515689 2 10.33333333333333 68 -1 -0.20984722184815 -0.5 -0.5 367232 1
i 4 107.23055934515689 2 8.91666666666667 68 -1 0.02238070715602 -0.5 -0.5 367232 1
i 4 107.23055934515689 2 8.58333333333333 68 -1 0.21436214446353 -0.5 -0.5 367232 1
i 3 107.50341064120055 2 7.66666666666667 68 -1 -0.26447623184885 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 8 68 -1 0.37943942616348 -0.5 -0.5 2869 1
i 3 107.50341064120055 2 7.66666666666667 68 -1 0.25087358388792 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 6.33333333333333 68 -1 0.28169415492632 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 6.33333333333333 68 -1 0.35014034119491 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.91666666666667 68 -1 0.008425454348 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 7.41666666666667 68 -1 0.11581003979351 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 8 68 -1 0.3716975125189 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.33333333333333 68 -1 0.25355073322515 -0.5 -0.5 2869 1
i 6 107.50341064120055 2 6.91666666666667 68 -1 -0.02177097964761 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 7.41666666666667 68 -1 -0.48564025987547 -0.5 -0.5 2869 1
i 5 107.50341064120055 2 8 68 -1 -0.12504793142038 -0.5 -0.5 2869 1
i 4 107.50341064120055 2 6.66666666666667 68 -1 0.25152194299831 -0.5 -0.5 2869 1
i 3 107.50341064120055 2 10.33333333333333 68 -1 0.18323381596652 -0.5 -0.5 367232 1
i 3 107.50341064120055 2 10 68 -1 -0.18984106586543 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.58333333333333 68 -1 0.17038676059623 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.91666666666667 68 -1 0.14529962882338 -0.5 -0.5 367232 1
i 4 107.50341064120055 2 8.58333333333333 68 -1 0.37407345766706 -0.5 -0.5 367232 1
i 4 107.7762619372442 2 7.66666666666667 68 -1 0.28874222560836 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 7.66666666666667 68 -1 -0.36598278491015 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 8.33333333333333 68 -1 0.12137633986343 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 8.75 68 -1 0.22615107379029 -0.5 -0.5 2869 1
i 5 107.7762619372442 2 9.41666666666667 68 -1 -0.15198352489829 -0.5 -0.5 2869 1
i 4 107.7762619372442 2 6.66666666666667 68 -1 -0.1092470346399 -0.5 -0.5 2869 1
i 3 107.7762619372442 2 10 68 -1 -0.01219541889161 -0.5 -0.5 367232 1
i 3 107.7762619372442 2 10.33333333333333 68 -1 -0.48587976970318 -0.5 -0.5 367232 1
i 3 107.7762619372442 2 10 68 -1 0.31171068354846 -0.5 -0.5 367232 1
i 4 107.7762619372442 2 8.58333333333333 68 -1 -0.36571331785868 -0.5 -0.5 367232 1
i 4 108.04911323328785 2 6.66666666666667 68 -1 -0.37396392901669 -0.5 -0.5 2869 1
i 4 108.04911323328785 2 6.91666666666667 68 -1 -0.39865575496247 -0.5 -0.5 2869 1
i 4 108.04911323328785 2 6.66666666666667 68 -1 0.29167938919964 -0.5 -0.5 2869 1
i 3 108.04911323328785 2 10 68 -1 -0.12939575129213 -0.5 -0.5 367232 1
i 4 108.04911323328785 2 8.58333333333333 68 -1 0.27307154029908 -0.5 -0.5 367232 1
i 3 108.32196452933151 2 8 68 -1 0.07835142237458 -0.5 -0.5 2869 1
i 3 108.32196452933151 2 8.33333333333333 68 -1 0.06204011804579 -0.5 -0.5 2869 1
i 4 108.32196452933151 2 8 68 -1 0.41563190684235 -0.5 -0.5 2869 1
i 4 108.32196452933151 2 6.66666666666667 68 -1 -0.37501574166892 -0.5 -0.5 2869 1
i 5 108.32196452933151 2 6.66666666666667 68 -1 0.000180014063 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 7.33333333333333 68 -1 0.15117141024067 -0.5 -0.5 2869 1
i 6 108.32196452933151 2 7.66666666666667 68 -1 0.13669407444865 -0.5 -0.5 2869 1
i 5 108.32196452933151 2 8.33333333333333 68 -1 -0.22604889105694 -0.5 -0.5 2869 1
i 4 108.32196452933151 2 6.91666666666667 68 -1 0.31391236973982 -0.5 -0.5 2869 1
i 3 108.32196452933151 2 10 68 -1 -0.156624520793 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.58333333333333 68 -1 -0.18780911988862 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.91666666666667 68 -1 0.15311746603262 -0.5 -0.5 367232 1
i 4 108.32196452933151 2 8.58333333333333 68 -1 -0.46780889521931 -0.5 -0.5 367232 1
i 4 108.59481582537516 2 8 68 -1 0.27240061036768 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 6.91666666666667 68 -1 0.1835080435731 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 7.33333333333333 68 -1 0.09879148354855 -0.5 -0.5 2869 1
i 4 108.59481582537516 2 6.91666666666667 68 -1 0.02309251910965 -0.5 -0.5 2869 1
i 3 108.59481582537516 2 10 68 -1 -0.32598456436707 -0.5 -0.5 367232 1
i 3 108.59481582537516 2 10.33333333333333 68 -1 -0.40908176429172 -0.5 -0.5 367232 1
i 3 108.59481582537516 2 10 68 -1 0.34005978915328 -0.5 -0.5 367232 1
i 4 108.59481582537516 2 8.58333333333333 68 -1 0.36776301028766 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 8.58333333333333 68 -1 0.14999375850837 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.25 68 -1 0.05711785892394 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.75 68 -1 -0.30367791996101 -0.5 -0.5 367232 1
i 5 108.59481582537516 2 10.33333333333333 68 -1 -0.41076985977425 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 8.58333333333333 68 -1 -0.36763757223859 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.25 68 -1 0.3158862529684 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 9.75 68 -1 0.09013277425908 -0.5 -0.5 367232 1
i 6 108.59481582537516 2 10.33333333333333 68 -1 0.29920242556991 -0.5 -0.5 367232 1
i 4 108.59481582537516 2 8.91666666666667 68 -1 0.07550651628763 -0.5 -0.5 367232 1
i 4 108.86766712141882 2 6.91666666666667 68 -1 -0.15123306001223 -0.5 -0.5 2869 1
i 4 108.86766712141882 2 6.66666666666667 68 -1 0.01348078089738 -0.5 -0.5 2869 1
i 3 108.86766712141882 2 10 68 -1 -0.19676836670419 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 10 68 -1 -0.21723424797991 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 10.58333333333333 68 -1 -0.24761362542745 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 11.25 68 -1 -0.16344751934116 -0.5 -0.5 367232 1
i 5 108.86766712141882 2 11.75 68 -1 0.06510877683382 -0.5 -0.5 367232 1
i 4 108.86766712141882 2 8.91666666666667 68 -1 0.24688499685589 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 6.66666666666667 68 -1 0.03474980019704 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 6.91666666666667 68 -1 -0.33842341158282 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 6.66666666666667 68 -1 -0.31733842303552 -0.5 -0.5 2869 1
i 4 109.14051841746249 2 8.91666666666667 68 -1 0.48137298200523 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 9.25 68 -1 0.30638539974522 -0.5 -0.5 367232 1
i 4 109.14051841746249 2 8.91666666666667 68 -1 -0.17262833505283 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 6.66666666666667 68 -1 -0.24756622902119 -0.5 -0.5 2869 1
i 3 109.41336971350614 2 10.33333333333333 68 -1 0.40836559630061 -0.5 -0.5 367232 1
i 3 109.41336971350614 2 10.58333333333333 68 -1 -0.34277631173573 -0.5 -0.5 367232 1
i 3 109.41336971350614 2 10.33333333333333 68 -1 -0.31497046543551 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 8.91666666666667 68 -1 -0.36083713495084 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 8.91666666666667 68 -1 0.31773513028861 -0.5 -0.5 367232 1
i 5 109.41336971350614 2 9.5 68 -1 -0.09623232193445 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 10 68 -1 0.14115982284933 -0.5 -0.5 367232 1
i 6 109.41336971350614 2 10.58333333333333 68 -1 -0.19282159615092 -0.5 -0.5 367232 1
i 4 109.41336971350614 2 9.25 68 -1 0.32012109073617 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 6.66666666666667 68 -1 -0.48277717802432 -0.5 -0.5 2869 1
i 3 109.6862210095498 2 10.33333333333333 68 -1 -0.12406783589929 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.25 68 -1 0.42986717540679 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.5 68 -1 0.00085225303057 -0.5 -0.5 367232 1
i 4 109.6862210095498 2 9.25 68 -1 0.05449573512646 -0.5 -0.5 367232 1
i 4 109.95907230559345 2 6.66666666666667 68 -1 0.29001387834091 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 6.91666666666667 68 -1 -0.10308440790621 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 6.66666666666667 68 -1 -0.13905797393691 -0.5 -0.5 2869 1
i 4 109.95907230559345 2 9.25 68 -1 -0.42460940432468 -0.5 -0.5 367232 1
i 4 109.95907230559345 2 8.91666666666667 68 -1 -0.21427528398632 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 6.66666666666667 68 -1 0.0191749617487 -0.5 -0.5 2869 1
i 6 110.2319236016371 2 6.66666666666667 68 -1 -0.13540055431373 -0.5 -0.5 2869 1
i 6 110.2319236016371 2 7.33333333333333 68 -1 0.47548729534289 -0.5 -0.5 2869 1
i 6 110.2319236016371 2 7.66666666666667 68 -1 0.19551321969863 -0.5 -0.5 2869 1
i 6 110.2319236016371 2 8.33333333333333 68 -1 -0.36700738267316 -0.5 -0.5 2869 1
i 4 110.2319236016371 2 6.33333333333333 68 -1 -0.4410360488326 -0.5 -0.5 2869 1
i 4 110.2319236016371 2 8.91666666666667 68 -1 -0.49083964841254 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 9.25 68 -1 0.49178788034634 -0.5 -0.5 367232 1
i 4 110.2319236016371 2 8.91666666666667 68 -1 0.03140696553008 -0.5 -0.5 367232 1
i 4 110.50477489768076 2 6.33333333333333 68 -1 -0.47095790473675 -0.5 -0.5 2869 1
i 4 110.50477489768076 2 8.91666666666667 68 -1 -0.43930223579525 -0.5 -0.5 367232 1
i 4 110.77762619372442 2 6.33333333333333 68 -1 0.0539344181944 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 6.66666666666667 68 -1 -0.00586853808251 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 6.33333333333333 68 -1 -0.05590842006489 -0.5 -0.5 2869 1
i 4 110.77762619372442 2 8.91666666666667 68 -1 -0.10864098929089 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 6.33333333333333 68 -1 0.09164817534512 -0.5 -0.5 2869 1
i 5 111.05047748976807 2 6.33333333333333 68 -1 -0.31822982074928 -0.5 -0.5 2869 1
i 5 111.05047748976807 2 6.91666666666667 68 -1 -0.06781742259481 -0.5 -0.5 2869 1
i 6 111.05047748976807 2 7.41666666666667 68 -1 -0.34038694738985 -0.5 -0.5 2869 1
i 6 111.05047748976807 2 8 68 -1 -0.37760186145086 -0.5 -0.5 2869 1
i 4 111.05047748976807 2 6.66666666666667 68 -1 0.30680513802135 -0.5 -0.5 2869 1
i 4 111.05047748976807 2 8.91666666666667 68 -1 -0.40805302647682 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 9.25 68 -1 -0.27756787339511 -0.5 -0.5 367232 1
i 4 111.05047748976807 2 8.91666666666667 68 -1 0.4357816068968 -0.5 -0.5 367232 1
i 4 111.32332878581173 2 6.66666666666667 68 -1 0.4878624104804 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 6.91666666666667 68 -1 0.12213674437767 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 6.66666666666667 68 -1 -0.40356766225703 -0.5 -0.5 2869 1
i 4 111.32332878581173 2 8.91666666666667 68 -1 -0.36843044577891 -0.5 -0.5 367232 1
i 5 111.32332878581173 2 8.91666666666667 68 -1 0.21905853533375 -0.5 -0.5 367232 1
i 5 111.32332878581173 2 9.5 68 -1 -0.42571243377612 -0.5 -0.5 367232 1
i 6 111.32332878581173 2 10 68 -1 -0.3242012281245 -0.5 -0.5 367232 1
i 6 111.32332878581173 2 10.58333333333333 68 -1 0.41562907471017 -0.5 -0.5 367232 1
i 4 111.32332878581173 2 8.58333333333333 68 -1 -0.39541151431803 -0.5 -0.5 367232 1
i 4 111.59618008185538 2 6.66666666666667 68 -1 -0.13313767232604 -0.5 -0.5 2869 1
i 4 111.59618008185538 2 6.33333333333333 68 -1 -0.38085563104725 -0.5 -0.5 2869 1
i 4 111.59618008185538 2 8.58333333333333 68 -1 0.29390856933809 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 6.33333333333333 68 -1 -0.27950741401314 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 6.66666666666667 68 -1 -0.16335258599394 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 6.33333333333333 68 -1 -0.09348642058612 -0.5 -0.5 2869 1
i 4 111.86903137789903 2 8.58333333333333 68 -1 -0.35048673673948 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 8.91666666666667 68 -1 0.09816192877984 -0.5 -0.5 367232 1
i 4 111.86903137789903 2 8.58333333333333 68 -1 -0.28974634002004 -0.5 -0.5 367232 1
i 4 112.14188267394269 2 6.33333333333333 68 -1 -0.0687205827612 -0.5 -0.5 2869 1
i 4 112.14188267394269 2 8.58333333333333 68 -1 -0.37815096744922 -0.5 -0.5 367232 1
i 5 112.14188267394269 2 8.58333333333333 68 -1 0.05295442974039 -0.5 -0.5 367232 1
i 6 112.14188267394269 2 9.25 68 -1 0.08982137291957 -0.5 -0.5 367232 1
i 6 112.14188267394269 2 9.75 68 -1 0.49463547795341 -0.5 -0.5 367232 1
i 5 112.14188267394269 2 10.33333333333333 68 -1 -0.47344703943486 -0.5 -0.5 367232 1
i 4 112.14188267394269 2 8.91666666666667 68 -1 -0.35972034011634 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 6.33333333333333 68 -1 -0.33646656104074 -0.5 -0.5 2869 1
i 4 112.41473396998634 2 8.91666666666667 68 -1 0.49965374883503 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 9.25 68 -1 -0.27727823136603 -0.5 -0.5 367232 1
i 4 112.41473396998634 2 8.91666666666667 68 -1 0.32708866247576 -0.5 -0.5 367232 1
i 4 112.68758526603 2 6.33333333333333 68 -1 0.17050105725432 -0.5 -0.5 2869 1
i 4 112.68758526603 2 6.66666666666667 68 -1 0.09014657150129 -0.5 -0.5 2869 1
i 4 112.68758526603 2 6.33333333333333 68 -1 0.43401376364309 -0.5 -0.5 2869 1
i 4 112.68758526603 2 8.91666666666667 68 -1 0.1412055336859 -0.5 -0.5 367232 1
i 4 112.68758526603 2 8.58333333333333 68 -1 0.11072619002008 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 6.33333333333333 68 -1 0.03816959396263 -0.5 -0.5 2869 1
i 6 112.96043656207365 2 6.33333333333333 68 -1 0.49157664801817 -0.5 -0.5 2869 1
i 6 112.96043656207365 2 6.91666666666667 68 -1 -0.14067274209954 -0.5 -0.5 2869 1
i 6 112.96043656207365 2 7.41666666666667 68 -1 -0.00951680298709 -0.5 -0.5 2869 1
i 5 112.96043656207365 2 8 68 -1 -0.21336191640924 -0.5 -0.5 2869 1
i 4 112.96043656207365 2 8.58333333333333 68 -1 0.23140211529646 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 8.91666666666667 68 -1 -0.32149101781135 -0.5 -0.5 367232 1
i 4 112.96043656207365 2 8.58333333333333 68 -1 -0.44277719004475 -0.5 -0.5 367232 1
i 4 113.23328785811734 2 6.33333333333333 68 -1 -0.35819531214839 -0.5 -0.5 2869 1
i 4 113.23328785811734 2 8.58333333333333 68 -1 -0.438836367026 -0.5 -0.5 367232 1
i 4 113.50613915416099 2 6.33333333333333 68 -1 0.20658670638205 -0.5 -0.5 2869 1
i 4 113.50613915416099 2 8.58333333333333 68 -1 0.08537499307439 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 6.33333333333333 68 -1 0.23194180749301 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 6.66666666666667 68 -1 -0.36414075062196 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 6.33333333333333 68 -1 0.48169451782147 -0.5 -0.5 2869 1
i 4 113.77899045020465 2 8.58333333333333 68 -1 0.29830304330629 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 8.91666666666667 68 -1 0.06913231925599 -0.5 -0.5 367232 1
i 4 113.77899045020465 2 8.58333333333333 68 -1 -0.1738914833113 -0.5 -0.5 367232 1
i 4 114.0518417462483 2 6.33333333333333 68 -1 0.35175353026924 -0.5 -0.5 2869 1
i 5 114.0518417462483 2 6.33333333333333 68 -1 -0.44378351685546 -0.5 -0.5 2869 1
i 6 114.0518417462483 2 6.91666666666667 68 -1 0.06119026573271 -0.5 -0.5 2869 1
i 6 114.0518417462483 2 7.41666666666667 68 -1 -0.40604641522168 -0.5 -0.5 2869 1
i 6 114.0518417462483 2 8 68 -1 -0.1572010154981 -0.5 -0.5 2869 1
i 4 114.0518417462483 2 6.66666666666667 68 -1 -0.46301941306556 -0.5 -0.5 2869 1
i 4 114.0518417462483 2 8.58333333333333 68 -1 0.37733758006798 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 8.58333333333333 68 -1 -0.0628908695397 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 9.25 68 -1 0.44828234099987 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 9.75 68 -1 -0.49577673947174 -0.5 -0.5 367232 1
i 6 114.0518417462483 2 10.33333333333333 68 -1 -0.46070223729559 -0.5 -0.5 367232 1
i 4 114.32469304229195 2 6.66666666666667 68 -1 -0.02277576472842 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 6.91666666666667 68 -1 -0.03805306371735 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 6.66666666666667 68 -1 0.05896687568629 -0.5 -0.5 2869 1
i 4 114.32469304229195 2 8.58333333333333 68 -1 0.36770809058553 -0.5 -0.5 367232 1
i 4 114.59754433833561 2 6.66666666666667 68 -1 0.33501601489363 -0.5 -0.5 2869 1
i 4 114.59754433833561 2 6.33333333333333 68 -1 0.27343330722753 -0.5 -0.5 2869 1
i 4 114.59754433833561 2 8.58333333333333 68 -1 -0.40506120307911 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 6.33333333333333 68 -1 0.48769084550851 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 6.66666666666667 68 -1 -0.14742570945201 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 6.33333333333333 68 -1 0.38630428580478 -0.5 -0.5 2869 1
i 4 114.87039563437926 2 8.58333333333333 68 -1 0.15622399465964 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 8.91666666666667 68 -1 0.04327473905085 -0.5 -0.5 367232 1
i 4 114.87039563437926 2 8.58333333333333 68 -1 -0.34404522061195 -0.5 -0.5 367232 1
i 4 115.14324693042292 2 6.33333333333333 68 -1 0.3219386541507 -0.5 -0.5 2869 1
i 4 115.14324693042292 2 8.58333333333333 68 -1 0.22179713007831 -0.5 -0.5 367232 1
i 5 115.14324693042292 2 8.58333333333333 68 -1 0.49540884533204 -0.5 -0.5 367232 1
i 5 115.14324693042292 2 9.25 68 -1 -0.42981183270296 -0.5 -0.5 367232 1
i 6 115.14324693042292 2 9.75 68 -1 -0.354970659278 -0.5 -0.5 367232 1
i 5 115.14324693042292 2 10.33333333333333 68 -1 0.05981499541456 -0.5 -0.5 367232 1
i 4 115.14324693042292 2 8.91666666666667 68 -1 -0.49774137684568 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 6.33333333333333 68 -1 -0.41008232597842 -0.5 -0.5 2869 1
i 4 115.41609822646657 2 8.91666666666667 68 -1 0.03555648270036 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 9.25 68 -1 0.4679755901967 -0.5 -0.5 367232 1
i 4 115.41609822646657 2 8.91666666666667 68 -1 -0.24996612355682 -0.5 -0.5 367232 1
i 4 115.68894952251023 2 6.33333333333333 68 -1 -0.46261215471126 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 6.66666666666667 68 -1 0.22226777767891 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 6.33333333333333 68 -1 -0.48796437866463 -0.5 -0.5 2869 1
i 4 115.68894952251023 2 8.91666666666667 68 -1 -0.48102994264579 -0.5 -0.5 367232 1
i 4 115.68894952251023 2 8.58333333333333 68 -1 -0.26246942796899 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 6.33333333333333 68 -1 0.24599966758889 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 6.33333333333333 68 -1 0.33053294304888 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 6.91666666666667 68 -1 -0.38292217519934 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 7.41666666666667 68 -1 -0.08770715203949 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 8 68 -1 -0.40223826877015 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 6.33333333333333 68 -1 0.35889858352676 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 6.91666666666667 68 -1 -0.43288552537917 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 7.41666666666667 68 -1 0.39071839845761 -0.5 -0.5 2869 1
i 6 115.96180081855388 2 8 68 -1 0.07702899734833 -0.5 -0.5 2869 1
i 4 115.96180081855388 2 6 68 -1 0.19676078218043 -0.5 -0.5 2869 1
i 4 115.96180081855388 2 8.58333333333333 68 -1 -0.1657916995088 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 8.91666666666667 68 -1 -0.23627731136747 -0.5 -0.5 367232 1
i 4 115.96180081855388 2 8.58333333333333 68 -1 0.38212226222531 -0.5 -0.5 367232 1
i 4 116.23465211459754 2 6 68 -1 0.1339469092255 -0.5 -0.5 2869 1
i 4 116.23465211459754 2 8.58333333333333 68 -1 -0.09959173063594 -0.5 -0.5 367232 1
i 4 116.50750341064119 2 6 68 -1 0.44900337348853 -0.5 -0.5 2869 1
i 4 116.50750341064119 2 8.58333333333333 68 -1 0.16166972889543 -0.5 -0.5 367232 1
i 3 116.78035470668485 2 8 68 -1 0.27361352676225 -0.5 -0.5 2869 1
i 3 116.78035470668485 2 8.33333333333333 68 -1 -0.24679603634619 -0.5 -0.5 2869 1
i 3 116.78035470668485 2 8 68 -1 0.46273092481541 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6 68 -1 -0.35188236305308 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6.33333333333333 68 -1 -0.49439042635615 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 6 68 -1 -0.4088741781037 -0.5 -0.5 2869 1
i 4 116.78035470668485 2 8.58333333333333 68 -1 0.30017351706802 -0.5 -0.5 367232 1
i 4 116.78035470668485 2 8.91666666666667 68 -1 0.25573457081121 -0.5 -0.5 367232 1
i 4 116.78035470668485 2 8.58333333333333 68 -1 0.3298310328787 -0.5 -0.5 367232 1
i 3 117.0532060027285 2 8 68 -1 0.36871896706937 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 6 68 -1 0.29961690893032 -0.5 -0.5 2869 1
i 5 117.0532060027285 2 6 68 -1 -0.269127257845 -0.5 -0.5 2869 1
i 5 117.0532060027285 2 6.66666666666667 68 -1 0.2002966030625 -0.5 -0.5 2869 1
i 5 117.0532060027285 2 7.16666666666667 68 -1 0.37928304944039 -0.5 -0.5 2869 1
i 6 117.0532060027285 2 7.66666666666667 68 -1 0.37815417760956 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 6.33333333333333 68 -1 0.20971451363325 -0.5 -0.5 2869 1
i 4 117.0532060027285 2 8.58333333333333 68 -1 -0.32483356009689 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 8.58333333333333 68 -1 -0.49777617874277 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 9.25 68 -1 -0.2351199626171 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 9.75 68 -1 -0.26737509938891 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 10.33333333333333 68 -1 0.19333763216573 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 8.58333333333333 68 -1 0.44512133983385 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.25 68 -1 -0.35735879154847 -0.5 -0.5 367232 1
i 6 117.0532060027285 2 9.75 68 -1 -0.18588116255188 -0.5 -0.5 367232 1
i 5 117.0532060027285 2 10.33333333333333 68 -1 -0.46178174124404 -0.5 -0.5 367232 1
i 4 117.0532060027285 2 8.33333333333333 68 -1 0.16327225627502 -0.5 -0.5 367232 1
i 4 117.32605729877218 2 6.33333333333333 68 -1 -0.02643486707552 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 6.66666666666667 68 -1 0.35404848201643 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 6.33333333333333 68 -1 0.31451947601387 -0.5 -0.5 2869 1
i 4 117.32605729877218 2 8.33333333333333 68 -1 -0.25237383775074 -0.5 -0.5 367232 1
i 4 117.59890859481584 2 6.33333333333333 68 -1 0.42134706916073 -0.5 -0.5 2869 1
i 4 117.59890859481584 2 6 68 -1 -0.40866780036052 -0.5 -0.5 2869 1
i 4 117.59890859481584 2 8.33333333333333 68 -1 -0.38672205271666 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 6 68 -1 -0.29802081291789 -0.5 -0.5 2869 1
i 4 117.8717598908595 2 6.33333333333333 68 -1 0.28939551202838 -0.5 -0.5 2869 1
i 4 117.8717598908595 2 6 68 -1 -0.06634807051401 -0.5 -0.5 2869 1
i 3 117.8717598908595 2 10.33333333333333 68 -1 0.3016258205868 -0.5 -0.5 367232 1
i 3 117.8717598908595 2 10.58333333333333 68 -1 0.12746729350285 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 10.33333333333333 68 -1 -0.14811235792186 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.33333333333333 68 -1 -0.38420375144071 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.58333333333333 68 -1 0.40216065079792 -0.5 -0.5 367232 1
i 4 117.8717598908595 2 8.33333333333333 68 -1 -0.17993656391186 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 6 68 -1 0.02570767459002 -0.5 -0.5 2869 1
i 3 118.14461118690315 2 10.33333333333333 68 -1 0.01608288737468 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 8.33333333333333 68 -1 0.24730717598629 -0.5 -0.5 367232 1
i 5 118.14461118690315 2 8.33333333333333 68 -1 0.47584302742126 -0.5 -0.5 367232 1
i 6 118.14461118690315 2 8.91666666666667 68 -1 0.12835497622582 -0.5 -0.5 367232 1
i 6 118.14461118690315 2 9.5 68 -1 -0.21652951951112 -0.5 -0.5 367232 1
i 5 118.14461118690315 2 10 68 -1 0.2571708473963 -0.5 -0.5 367232 1
i 4 118.14461118690315 2 8.58333333333333 68 -1 0.46791994613877 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 6 68 -1 0.38087226921233 -0.5 -0.5 2869 1
i 4 118.4174624829468 2 8.58333333333333 68 -1 0.37983267197881 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 8.91666666666667 68 -1 -0.18823649636087 -0.5 -0.5 367232 1
i 4 118.4174624829468 2 8.58333333333333 68 -1 -0.32447778850775 -0.5 -0.5 367232 1
i 4 118.69031377899046 2 6 68 -1 -0.48870060733486 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 6.33333333333333 68 -1 -0.29960248908467 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 6 68 -1 0.46263171024301 -0.5 -0.5 2869 1
i 4 118.69031377899046 2 8.58333333333333 68 -1 -0.04581908632428 -0.5 -0.5 367232 1
i 4 118.69031377899046 2 8.33333333333333 68 -1 -0.12549352502633 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 6 68 -1 0.43683521279462 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6 68 -1 -0.08447344681912 -0.5 -0.5 2869 1
i 5 118.96316507503411 2 6.66666666666667 68 -1 0.26473764465741 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.16666666666667 68 -1 0.35340978979571 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.66666666666667 68 -1 -0.25249601002022 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6 68 -1 0.44665198613901 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 6.66666666666667 68 -1 0.00995867622349 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.16666666666667 68 -1 0.48172139824959 -0.5 -0.5 2869 1
i 6 118.96316507503411 2 7.66666666666667 68 -1 0.18289991716446 -0.5 -0.5 2869 1
i 4 118.96316507503411 2 6.33333333333333 68 -1 -0.08728497042458 -0.5 -0.5 2869 1
i 4 118.96316507503411 2 8.33333333333333 68 -1 0.23041730262445 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 8.58333333333333 68 -1 0.48512832690437 -0.5 -0.5 367232 1
i 4 118.96316507503411 2 8.33333333333333 68 -1 -0.46379072659081 -0.5 -0.5 367232 1
i 4 119.23601637107777 2 6.33333333333333 68 -1 0.027830660309 -0.5 -0.5 2869 1
i 4 119.23601637107777 2 8.33333333333333 68 -1 -0.47842697061864 -0.5 -0.5 367232 1
i 4 119.50886766712142 2 6.33333333333333 68 -1 -0.26903396852532 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 6.66666666666667 68 -1 0.11309777121815 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 6.33333333333333 68 -1 -0.41319337849332 -0.5 -0.5 2869 1
i 4 119.50886766712142 2 8.33333333333333 68 -1 0.30830494104432 -0.5 -0.5 367232 1
i 4 119.78171896316508 2 7.66666666666667 68 -1 0.01666390368194 -0.5 -0.5 2869 1
i 3 119.78171896316508 2 8 68 -1 0.31330611576803 -0.5 -0.5 2869 1
i 3 119.78171896316508 2 7.66666666666667 68 -1 -0.16230900878402 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 6.33333333333333 68 -1 -0.04468305353437 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 6.33333333333333 68 -1 -0.36523316136851 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 6.91666666666667 68 -1 -0.32396121000686 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 7.41666666666667 68 -1 0.21132130747549 -0.5 -0.5 2869 1
i 6 119.78171896316508 2 8 68 -1 0.42976502744618 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 6.66666666666667 68 -1 -0.00492898998287 -0.5 -0.5 2869 1
i 4 119.78171896316508 2 8.33333333333333 68 -1 0.24906210426388 -0.5 -0.5 367232 1
i 4 119.78171896316508 2 8.58333333333333 68 -1 0.07510002698631 -0.5 -0.5 367232 1
i 4 119.78171896316508 2 8.33333333333333 68 -1 -0.09487451610588 -0.5 -0.5 367232 1
i 4 120.05457025920873 2 7.66666666666667 68 -1 -0.46660711465064 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.66666666666667 68 -1 -0.18477008002516 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.91666666666667 68 -1 -0.05236619858166 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 6.66666666666667 68 -1 -0.06841732931632 -0.5 -0.5 2869 1
i 4 120.05457025920873 2 8.33333333333333 68 -1 0.00900600133208 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.33333333333333 68 -1 0.07799480915912 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.91666666666667 68 -1 0.15180664815075 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 9.5 68 -1 -0.44358191699169 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 10 68 -1 0.23239068051987 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.33333333333333 68 -1 -0.36714856173446 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 8.91666666666667 68 -1 0.41963798228152 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 9.5 68 -1 0.26868012363361 -0.5 -0.5 367232 1
i 6 120.05457025920873 2 10 68 -1 0.42166650904526 -0.5 -0.5 367232 1
i 4 120.05457025920873 2 8.58333333333333 68 -1 -0.42836883452649 -0.5 -0.5 367232 1
i 4 120.32742155525239 2 6.66666666666667 68 -1 -0.4017682484909 -0.5 -0.5 2869 1
i 4 120.32742155525239 2 6.33333333333333 68 -1 0.20772264385695 -0.5 -0.5 2869 1
i 4 120.32742155525239 2 8.58333333333333 68 -1 0.15471927333682 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 6.33333333333333 68 -1 -0.41349618649746 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 6.66666666666667 68 -1 0.29562823464002 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 6.33333333333333 68 -1 0.19280392660521 -0.5 -0.5 2869 1
i 4 120.60027285129604 2 8.58333333333333 68 -1 -0.12066933822401 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 8.91666666666667 68 -1 0.07771636002253 -0.5 -0.5 367232 1
i 4 120.60027285129604 2 8.58333333333333 68 -1 -0.48893726202044 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 6.33333333333333 68 -1 -0.26002192530649 -0.5 -0.5 2869 1
i 3 120.8731241473397 2 10 68 -1 -0.08166500881242 -0.5 -0.5 367232 1
i 3 120.8731241473397 2 10.33333333333333 68 -1 0.41182003664879 -0.5 -0.5 367232 1
i 3 120.8731241473397 2 10 68 -1 0.20824826951375 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 8.58333333333333 68 -1 -0.4761493467743 -0.5 -0.5 367232 1
i 6 120.8731241473397 2 8.58333333333333 68 -1 0.16104755646717 -0.5 -0.5 367232 1
i 5 120.8731241473397 2 9.25 68 -1 0.33295741143853 -0.5 -0.5 367232 1
i 6 120.8731241473397 2 9.75 68 -1 -0.25213201845272 -0.5 -0.5 367232 1
i 5 120.8731241473397 2 10.33333333333333 68 -1 -0.10704279985192 -0.5 -0.5 367232 1
i 4 120.8731241473397 2 8.91666666666667 68 -1 0.33128502888687 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 6.33333333333333 68 -1 0.11051259983149 -0.5 -0.5 2869 1
i 3 121.14597544338335 2 10 68 -1 0.43931502926256 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 8.91666666666667 68 -1 -0.30788753600409 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 9.25 68 -1 0.35206711780099 -0.5 -0.5 367232 1
i 4 121.14597544338335 2 8.91666666666667 68 -1 0.15029078923088 -0.5 -0.5 367232 1
i 4 121.41882673942702 2 6.33333333333333 68 -1 -0.34940033149023 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 6.66666666666667 68 -1 -0.49529033758463 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 6.33333333333333 68 -1 -0.19069869186721 -0.5 -0.5 2869 1
i 4 121.41882673942702 2 8.91666666666667 68 -1 0.21105334827188 -0.5 -0.5 367232 1
i 4 121.41882673942702 2 8.58333333333333 68 -1 0.34453679067843 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 6.33333333333333 68 -1 0.0237833615444 -0.5 -0.5 2869 1
i 6 121.69167803547067 2 6.33333333333333 68 -1 0.12100799193032 -0.5 -0.5 2869 1
i 6 121.69167803547067 2 6.91666666666667 68 -1 0.27648744804778 -0.5 -0.5 2869 1
i 5 121.69167803547067 2 7.41666666666667 68 -1 -0.18403467356829 -0.5 -0.5 2869 1
i 6 121.69167803547067 2 8 68 -1 -0.06834883838093 -0.5 -0.5 2869 1
i 4 121.69167803547067 2 6 68 -1 -0.13535717920755 -0.5 -0.5 2869 1
i 4 121.69167803547067 2 8.58333333333333 68 -1 -0.39484990299249 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 8.91666666666667 68 -1 -0.21431128808874 -0.5 -0.5 367232 1
i 4 121.69167803547067 2 8.58333333333333 68 -1 -0.22680339335932 -0.5 -0.5 367232 1
i 4 121.96452933151433 2 6 68 -1 -0.17301901089952 -0.5 -0.5 2869 1
i 4 121.96452933151433 2 8.58333333333333 68 -1 0.37088656794948 -0.5 -0.5 367232 1
i 4 122.23738062755798 2 6 68 -1 -0.26568695107506 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 6.33333333333333 68 -1 -0.08305694237299 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 6 68 -1 0.17547442859261 -0.5 -0.5 2869 1
i 4 122.23738062755798 2 8.58333333333333 68 -1 0.2746057544297 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 6 68 -1 -0.06357314323898 -0.5 -0.5 2869 1
i 5 122.51023192360164 2 6 68 -1 0.49224045859735 -0.5 -0.5 2869 1
i 6 122.51023192360164 2 6.66666666666667 68 -1 0.02942171912125 -0.5 -0.5 2869 1
i 6 122.51023192360164 2 7.16666666666667 68 -1 -0.15759185775525 -0.5 -0.5 2869 1
i 6 122.51023192360164 2 7.66666666666667 68 -1 0.49005928103555 -0.5 -0.5 2869 1
i 4 122.51023192360164 2 6.33333333333333 68 -1 0.01008340751595 -0.5 -0.5 2869 1
i 4 122.51023192360164 2 8.58333333333333 68 -1 0.38267028068097 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 8.91666666666667 68 -1 -0.35800370703682 -0.5 -0.5 367232 1
i 4 122.51023192360164 2 8.58333333333333 68 -1 0.39299478308006 -0.5 -0.5 367232 1
i 4 122.78308321964529 2 6.33333333333333 68 -1 -0.0609359415513 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 6.66666666666667 68 -1 -0.00731869951276 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 6.33333333333333 68 -1 0.33274069889705 -0.5 -0.5 2869 1
i 4 122.78308321964529 2 8.58333333333333 68 -1 -0.28406143593487 -0.5 -0.5 367232 1
i 6 122.78308321964529 2 8.58333333333333 68 -1 0.46949689967058 -0.5 -0.5 367232 1
i 6 122.78308321964529 2 9.25 68 -1 0.17066327408821 -0.5 -0.5 367232 1
i 5 122.78308321964529 2 9.75 68 -1 0.06448838716908 -0.5 -0.5 367232 1
i 6 122.78308321964529 2 10.33333333333333 68 -1 0.00127669718186 -0.5 -0.5 367232 1
i 4 122.78308321964529 2 8.33333333333333 68 -1 0.2663570677169 -0.5 -0.5 367232 1
i 4 123.05593451568895 2 6.33333333333333 68 -1 0.15000637165873 -0.5 -0.5 2869 1
i 4 123.05593451568895 2 6 68 -1 -0.00774552582623 -0.5 -0.5 2869 1
i 4 123.05593451568895 2 8.33333333333333 68 -1 0.03059256379336 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 6 68 -1 0.43863568653781 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 6.33333333333333 68 -1 0.2318809001062 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 6 68 -1 0.3658447776275 -0.5 -0.5 2869 1
i 4 123.3287858117326 2 8.33333333333333 68 -1 0.18023785811593 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 8.58333333333333 68 -1 -0.24564397984204 -0.5 -0.5 367232 1
i 4 123.3287858117326 2 8.33333333333333 68 -1 0.13796742773217 -0.5 -0.5 367232 1
i 4 123.60163710777626 2 6 68 -1 -0.43387227157199 -0.5 -0.5 2869 1
i 4 123.60163710777626 2 8.33333333333333 68 -1 -0.26496359846755 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 8.33333333333333 68 -1 -0.3059798023514 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 8.91666666666667 68 -1 0.05377764820185 -0.5 -0.5 367232 1
i 6 123.60163710777626 2 9.5 68 -1 -0.00964022512318 -0.5 -0.5 367232 1
i 5 123.60163710777626 2 10 68 -1 0.08901664245056 -0.5 -0.5 367232 1
i 4 123.60163710777626 2 8.58333333333333 68 -1 0.13493391761498 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 6 68 -1 0.01894170475963 -0.5 -0.5 2869 1
i 4 123.87448840381991 2 8.58333333333333 68 -1 0.42377903641985 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 8.91666666666667 68 -1 0.10173242839935 -0.5 -0.5 367232 1
i 4 123.87448840381991 2 8.58333333333333 68 -1 -0.27140467681695 -0.5 -0.5 367232 1
i 4 124.14733969986356 2 6 68 -1 0.42276189456368 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 6.33333333333333 68 -1 0.25489137628394 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 6 68 -1 -0.43281824926026 -0.5 -0.5 2869 1
i 4 124.14733969986356 2 8.58333333333333 68 -1 -0.15952575986237 -0.5 -0.5 367232 1
i 4 124.14733969986356 2 8.33333333333333 68 -1 0.09106930680361 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 6 68 -1 -0.18057167028569 -0.5 -0.5 2869 1
i 6 124.42019099590722 2 6 68 -1 -0.35286334405201 -0.5 -0.5 2869 1
i 5 124.42019099590722 2 6.66666666666667 68 -1 -0.16128897716164 -0.5 -0.5 2869 1
i 5 124.42019099590722 2 7.16666666666667 68 -1 -0.04365895868581 -0.5 -0.5 2869 1
i 6 124.42019099590722 2 7.66666666666667 68 -1 0.11520665848325 -0.5 -0.5 2869 1
i 4 124.42019099590722 2 8.33333333333333 68 -1 0.15841618176866 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 8.58333333333333 68 -1 -0.24934701950451 -0.5 -0.5 367232 1
i 4 124.42019099590722 2 8.33333333333333 68 -1 0.3744999485645 -0.5 -0.5 367232 1
i 4 124.69304229195087 2 6 68 -1 0.12972806828805 -0.5 -0.5 2869 1
i 4 124.69304229195087 2 8.33333333333333 68 -1 0.02374695239716 -0.5 -0.5 367232 1
i 4 124.96589358799453 2 6 68 -1 -0.35151488594464 -0.5 -0.5 2869 1
i 4 124.96589358799453 2 8.33333333333333 68 -1 0.45807874744805 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 6 68 -1 -0.08392905075054 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 6.33333333333333 68 -1 -0.40812273860015 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 6 68 -1 -0.23815129771769 -0.5 -0.5 2869 1
i 4 125.23874488403818 2 8.33333333333333 68 -1 0.32991325634561 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 8.58333333333333 68 -1 -0.19614676574388 -0.5 -0.5 367232 1
i 4 125.23874488403818 2 8.33333333333333 68 -1 -0.3333164011856 -0.5 -0.5 367232 1
i 4 125.51159618008187 2 6 68 -1 0.47031714459595 -0.5 -0.5 2869 1
i 5 125.51159618008187 2 6 68 -1 0.40379912147605 -0.5 -0.5 2869 1
i 6 125.51159618008187 2 6.66666666666667 68 -1 0.28130658236449 -0.5 -0.5 2869 1
i 6 125.51159618008187 2 7.16666666666667 68 -1 -0.11218547717273 -0.5 -0.5 2869 1
i 5 125.51159618008187 2 7.66666666666667 68 -1 0.4710587695892 -0.5 -0.5 2869 1
i 4 125.51159618008187 2 6.33333333333333 68 -1 0.4103711824898 -0.5 -0.5 2869 1
i 4 125.51159618008187 2 8.33333333333333 68 -1 -0.01318989945362 -0.5 -0.5 367232 1
i 6 125.51159618008187 2 8.33333333333333 68 -1 0.47044809317493 -0.5 -0.5 367232 1
i 5 125.51159618008187 2 8.91666666666667 68 -1 -0.40509217510507 -0.5 -0.5 367232 1
i 6 125.51159618008187 2 9.5 68 -1 -0.04423349372058 -0.5 -0.5 367232 1
i 5 125.51159618008187 2 10 68 -1 0.04354191050912 -0.5 -0.5 367232 1
i 4 125.78444747612552 2 6.33333333333333 68 -1 0.0538091648345 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 6.66666666666667 68 -1 -0.44261251588672 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 6.33333333333333 68 -1 -0.4313950808754 -0.5 -0.5 2869 1
i 4 125.78444747612552 2 8.33333333333333 68 -1 0.42928751310225 -0.5 -0.5 367232 1
i 4 126.05729877216918 2 6.33333333333333 68 -1 0.3066939157266 -0.5 -0.5 2869 1
i 4 126.05729877216918 2 6 68 -1 -0.34599161806213 -0.5 -0.5 2869 1
i 4 126.05729877216918 2 8.33333333333333 68 -1 -0.24386141097254 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 6 68 -1 0.37735151537551 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 6.33333333333333 68 -1 0.23769703773184 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 6 68 -1 -0.39104509351306 -0.5 -0.5 2869 1
i 4 126.33015006821283 2 8.33333333333333 68 -1 -0.16490357844759 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 8.58333333333333 68 -1 0.09978651538784 -0.5 -0.5 367232 1
i 4 126.33015006821283 2 8.33333333333333 68 -1 -0.23113534106831 -0.5 -0.5 367232 1
i 4 126.60300136425649 2 6 68 -1 -0.34476002959872 -0.5 -0.5 2869 1
i 4 126.60300136425649 2 8.33333333333333 68 -1 -0.43931495493943 -0.5 -0.5 367232 1
i 6 126.60300136425649 2 8.33333333333333 68 -1 0.3736472875201 -0.5 -0.5 367232 1
i 5 126.60300136425649 2 8.91666666666667 68 -1 0.04167653005809 -0.5 -0.5 367232 1
i 5 126.60300136425649 2 9.5 68 -1 -0.33912200587303 -0.5 -0.5 367232 1
i 6 126.60300136425649 2 10 68 -1 0.32683294500289 -0.5 -0.5 367232 1
i 4 126.60300136425649 2 8.58333333333333 68 -1 -0.41421887789613 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 6 68 -1 0.079052969302 -0.5 -0.5 2869 1
i 4 126.87585266030014 2 8.58333333333333 68 -1 -0.45631148953215 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 8.91666666666667 68 -1 -0.14256526597653 -0.5 -0.5 367232 1
i 4 126.87585266030014 2 8.58333333333333 68 -1 0.17814491772066 -0.5 -0.5 367232 1
i 4 127.1487039563438 2 6 68 -1 -0.18836875673089 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 6.33333333333333 68 -1 0.38688080917781 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 6 68 -1 -0.1649016134002 -0.5 -0.5 2869 1
i 4 127.1487039563438 2 8.58333333333333 68 -1 -0.04227518101628 -0.5 -0.5 367232 1
i 4 127.1487039563438 2 8.33333333333333 68 -1 -0.46994430802421 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 6 68 -1 -0.41611310473981 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 6 68 -1 0.39577769294219 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 6.66666666666667 68 -1 -0.22650978172965 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 7.16666666666667 68 -1 0.42418045109943 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 7.66666666666667 68 -1 0.13243105295089 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 6 68 -1 0.15832285711165 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 6.66666666666667 68 -1 0.19774040914617 -0.5 -0.5 2869 1
i 5 127.42155525238745 2 7.16666666666667 68 -1 -0.44072708677688 -0.5 -0.5 2869 1
i 6 127.42155525238745 2 7.66666666666667 68 -1 0.37173253122982 -0.5 -0.5 2869 1
i 4 127.42155525238745 2 8.33333333333333 68 -1 0.31611740666252 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 8.58333333333333 68 -1 0.20436946064348 -0.5 -0.5 367232 1
i 4 127.42155525238745 2 8.33333333333333 68 -1 0.15264142080388 -0.5 -0.5 367232 1
i 4 127.6944065484311 2 6 68 -1 0.43515440009255 -0.5 -0.5 2869 1
i 4 127.6944065484311 2 8.33333333333333 68 -1 0.38629254578743 -0.5 -0.5 367232 1
i 4 127.96725784447476 2 6 68 -1 -0.35213927895239 -0.5 -0.5 2869 1
i 4 127.96725784447476 2 8.33333333333333 68 -1 0.32960782973404 -0.5 -0.5 367232 1
i 3 128.2401091405184 2 7.66666666666667 68 -1 0.07260672087912 -0.5 -0.5 2869 1
i 4 128.2401091405184 2 8 68 -1 0.19669687473173 -0.5 -0.5 2869 1
i 3 128.2401091405184 2 7.66666666666667 68 -1 -0.37618202347569 -0.5 -0.5 2869 1
i 4 128.2401091405184 2 6 68 -1 -0.05462585340168 -0.5 -0.5 2869 1
i 4 128.2401091405184 2 8.33333333333333 68 -1 0.21645716740778 -0.5 -0.5 367232 1
i 4 128.2401091405184 2 8.58333333333333 68 -1 0.14893119643983 -0.5 -0.5 367232 1
i 4 128.2401091405184 2 8.33333333333333 68 -1 -0.32026567174105 -0.5 -0.5 367232 1
i 3 128.51296043656205 2 7.66666666666667 68 -1 0.02437075806335 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6 68 -1 0.02984781196972 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6.33333333333333 68 -1 0.07096710858654 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 6 68 -1 -0.21568322981874 -0.5 -0.5 2869 1
i 4 128.51296043656205 2 8.33333333333333 68 -1 -0.37542114521929 -0.5 -0.5 367232 1
i 5 128.51296043656205 2 8.33333333333333 68 -1 0.17377811122079 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 8.91666666666667 68 -1 0.18460540900461 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 9.5 68 -1 0.45828470101531 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 10 68 -1 -0.04540512178659 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 8.33333333333333 68 -1 0.26206816568324 -0.5 -0.5 367232 1
i 5 128.51296043656205 2 8.91666666666667 68 -1 -0.34692361190481 -0.5 -0.5 367232 1
i 5 128.51296043656205 2 9.5 68 -1 0.46499183212357 -0.5 -0.5 367232 1
i 6 128.51296043656205 2 10 68 -1 0.08469674834618 -0.5 -0.5 367232 1
i 4 128.7858117326057 2 6 68 -1 -0.27570308651495 -0.5 -0.5 2869 1
i 6 128.7858117326057 2 6 68 -1 0.28706439200046 -0.5 -0.5 2869 1
i 5 128.7858117326057 2 6.66666666666667 68 -1 0.29154568224659 -0.5 -0.5 2869 1
i 5 128.7858117326057 2 7.16666666666667 68 -1 0.23196065852016 -0.5 -0.5 2869 1
i 5 128.7858117326057 2 7.66666666666667 68 -1 0.10494866359193 -0.5 -0.5 2869 1
i 4 128.7858117326057 2 6.33333333333333 68 -1 0.36377233579619 -0.5 -0.5 2869 1
i 4 128.7858117326057 2 8.33333333333333 68 -1 0.28675243342934 -0.5 -0.5 367232 1
i 4 129.05866302864936 2 6.33333333333333 68 -1 0.439859108186 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 6.66666666666667 68 -1 0.39386571849887 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 6.33333333333333 68 -1 -0.20380866601666 -0.5 -0.5 2869 1
i 4 129.05866302864936 2 8.33333333333333 68 -1 -0.44584325536859 -0.5 -0.5 367232 1
i 4 129.33151432469302 2 6.33333333333333 68 -1 -0.13642524294468 -0.5 -0.5 2869 1
i 4 129.33151432469302 2 6 68 -1 0.18579013979755 -0.5 -0.5 2869 1
i 4 129.33151432469302 2 10 68 -1 0.05766287310293 -0.5 -0.5 367232 1
i 3 129.33151432469302 2 10.33333333333333 68 -1 -0.1985325943813 -0.5 -0.5 367232 1
i 3 129.33151432469302 2 10 68 -1 -0.30653281312873 -0.5 -0.5 367232 1
i 4 129.33151432469302 2 8.33333333333333 68 -1 0.49996591923709 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 6 68 -1 0.21763779044215 -0.5 -0.5 2869 1
i 4 129.6043656207367 2 6.33333333333333 68 -1 0.34164520796148 -0.5 -0.5 2869 1
i 4 129.6043656207367 2 6 68 -1 0.0606220284508 -0.5 -0.5 2869 1
i 3 129.6043656207367 2 10 68 -1 0.39307611892798 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.33333333333333 68 -1 0.0263047426547 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.58333333333333 68 -1 0.0919755816294 -0.5 -0.5 367232 1
i 4 129.6043656207367 2 8.33333333333333 68 -1 0.27261598219307 -0.5 -0.5 367232 1
i 4 129.87721691678036 2 6 68 -1 -0.21459427645182 -0.5 -0.5 2869 1
i 4 129.87721691678036 2 8.33333333333333 68 -1 0.16283563682214 -0.5 -0.5 367232 1
i 6 129.87721691678036 2 8.33333333333333 68 -1 0.05838643232924 -0.5 -0.5 367232 1
i 5 129.87721691678036 2 8.91666666666667 68 -1 -0.18238984328864 -0.5 -0.5 367232 1
i 6 129.87721691678036 2 9.5 68 -1 -0.18694621704476 -0.5 -0.5 367232 1
i 6 129.87721691678036 2 10 68 -1 -0.25853132892841 -0.5 -0.5 367232 1
i 4 129.87721691678036 2 8.58333333333333 68 -1 0.08430884398778 -0.5 -0.5 367232 1
i 4 130.150068212824 2 6 68 -1 0.40860151210242 -0.5 -0.5 2869 1
i 4 130.150068212824 2 8.58333333333333 68 -1 0.15518018660893 -0.5 -0.5 367232 1
i 4 130.150068212824 2 8.91666666666667 68 -1 0.10734424681744 -0.5 -0.5 367232 1
i 4 130.150068212824 2 8.58333333333333 68 -1 -0.49983686669717 -0.5 -0.5 367232 1
i 4 130.42291950886766 2 6 68 -1 0.27033766369823 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 6.33333333333333 68 -1 -0.36164948906391 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 6 68 -1 -0.24422952295218 -0.5 -0.5 2869 1
i 4 130.42291950886766 2 8.58333333333333 68 -1 -0.26302230102085 -0.5 -0.5 367232 1
i 4 130.42291950886766 2 8.33333333333333 68 -1 0.02942390365587 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 6 68 -1 0.48078561299219 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6 68 -1 -0.31831014708959 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6.66666666666667 68 -1 -0.31064983248358 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 7.16666666666667 68 -1 -0.00494476694457 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 7.66666666666667 68 -1 0.1254686527135 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 6 68 -1 0.32767791691012 -0.5 -0.5 2869 1
i 6 130.69577080491132 2 6.66666666666667 68 -1 -0.10123142811981 -0.5 -0.5 2869 1
i 5 130.69577080491132 2 7.16666666666667 68 -1 -0.17640113916877 -0.5 -0.5 2869 1
i 6 130.69577080491132 2 7.66666666666667 68 -1 -0.15561696793432 -0.5 -0.5 2869 1
i 4 130.69577080491132 2 6.33333333333333 68 -1 -0.47485111972257 -0.5 -0.5 2869 1
i 4 130.69577080491132 2 8.33333333333333 68 -1 0.10903982498032 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 8.58333333333333 68 -1 -0.31315544874246 -0.5 -0.5 367232 1
i 4 130.69577080491132 2 8.33333333333333 68 -1 0.40258539697161 -0.5 -0.5 367232 1
i 4 130.96862210095497 2 6.33333333333333 68 -1 -0.01683803943383 -0.5 -0.5 2869 1
i 4 130.96862210095497 2 8.33333333333333 68 -1 -0.14169770075516 -0.5 -0.5 367232 1
i 4 131.24147339699863 2 6.33333333333333 68 -1 -0.15158588335122 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 6.66666666666667 68 -1 0.03763989004857 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 6.33333333333333 68 -1 0.03625270250196 -0.5 -0.5 2869 1
i 4 131.24147339699863 2 8.33333333333333 68 -1 -0.22188013170291 -0.5 -0.5 367232 1
i 3 131.51432469304228 2 7.66666666666667 68 -1 0.38904595443684 -0.5 -0.5 2869 1
i 3 131.51432469304228 2 8 68 -1 -0.131108506812 -0.5 -0.5 2869 1
i 3 131.51432469304228 2 7.66666666666667 68 -1 0.43506691168629 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 6.33333333333333 68 -1 -0.4715222275788 -0.5 -0.5 2869 1
i 5 131.51432469304228 2 6.33333333333333 68 -1 -0.25704009909149 -0.5 -0.5 2869 1
i 6 131.51432469304228 2 6.91666666666667 68 -1 -0.25577168498296 -0.5 -0.5 2869 1
i 5 131.51432469304228 2 7.41666666666667 68 -1 -0.20618058461726 -0.5 -0.5 2869 1
i 6 131.51432469304228 2 8 68 -1 0.32118937850792 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 6.66666666666667 68 -1 -0.48912578714786 -0.5 -0.5 2869 1
i 4 131.51432469304228 2 8.33333333333333 68 -1 -0.06068911432768 -0.5 -0.5 367232 1
i 4 131.51432469304228 2 8.58333333333333 68 -1 -0.03862586711829 -0.5 -0.5 367232 1
i 4 131.51432469304228 2 8.33333333333333 68 -1 0.22261784128276 -0.5 -0.5 367232 1
i 4 131.78717598908594 2 7.66666666666667 68 -1 -0.07703275321669 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.66666666666667 68 -1 -0.01035720026722 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.91666666666667 68 -1 -0.28710928059848 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 6.66666666666667 68 -1 -0.20726260855737 -0.5 -0.5 2869 1
i 4 131.78717598908594 2 8.33333333333333 68 -1 -0.17788576344212 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 8.33333333333333 68 -1 -0.25497430256259 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 8.91666666666667 68 -1 -0.48987737689421 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 9.5 68 -1 0.40568626321912 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 10 68 -1 -0.4978834886786 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 8.33333333333333 68 -1 -0.34660536355069 -0.5 -0.5 367232 1
i 5 131.78717598908594 2 8.91666666666667 68 -1 -0.3858717295981 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 9.5 68 -1 0.26449437522189 -0.5 -0.5 367232 1
i 6 131.78717598908594 2 10 68 -1 -0.17601998712179 -0.5 -0.5 367232 1
i 4 131.78717598908594 2 8.58333333333333 68 -1 -0.02326316767377 -0.5 -0.5 367232 1
i 4 132.0600272851296 2 6.66666666666667 68 -1 -0.29768049039349 -0.5 -0.5 2869 1
i 4 132.0600272851296 2 6.33333333333333 68 -1 -0.26029464043927 -0.5 -0.5 2869 1
i 4 132.0600272851296 2 8.58333333333333 68 -1 0.14877041766968 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 6.33333333333333 68 -1 0.02981927070042 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 6.66666666666667 68 -1 0.34037716894239 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 6.33333333333333 68 -1 0.19185220640182 -0.5 -0.5 2869 1
i 4 132.33287858117325 2 8.58333333333333 68 -1 0.1142201493301 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 8.91666666666667 68 -1 -0.26474211605433 -0.5 -0.5 367232 1
i 4 132.33287858117325 2 8.58333333333333 68 -1 -0.3233494680277 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 6.33333333333333 68 -1 -0.00078610521158 -0.5 -0.5 2869 1
i 3 132.6057298772169 2 10 68 -1 -0.07787071546359 -0.5 -0.5 367232 1
i 3 132.6057298772169 2 10.33333333333333 68 -1 -0.14621460569352 -0.5 -0.5 367232 1
i 3 132.6057298772169 2 10 68 -1 0.0758238631302 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 8.58333333333333 68 -1 -0.07435287789875 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 8.58333333333333 68 -1 -0.38298666301826 -0.5 -0.5 367232 1
i 5 132.6057298772169 2 9.25 68 -1 -0.19143832018078 -0.5 -0.5 367232 1
i 5 132.6057298772169 2 9.75 68 -1 -0.14204498985218 -0.5 -0.5 367232 1
i 6 132.6057298772169 2 10.33333333333333 68 -1 0.0102560246602 -0.5 -0.5 367232 1
i 4 132.6057298772169 2 8.91666666666667 68 -1 0.49286500673705 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 6.33333333333333 68 -1 0.19696180796963 -0.5 -0.5 2869 1
i 3 132.87858117326056 2 10 68 -1 -0.05521019928314 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 8.91666666666667 68 -1 -0.38857451356808 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 9.25 68 -1 -0.42791841386761 -0.5 -0.5 367232 1
i 4 132.87858117326056 2 8.91666666666667 68 -1 0.15111177863025 -0.5 -0.5 367232 1
i 4 133.1514324693042 2 6.33333333333333 68 -1 0.02192229820206 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 6.66666666666667 68 -1 -0.31261094572318 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 6.33333333333333 68 -1 0.3927416298151 -0.5 -0.5 2869 1
i 4 133.1514324693042 2 8.91666666666667 68 -1 -0.40721920278928 -0.5 -0.5 367232 1
i 4 133.1514324693042 2 8.58333333333333 68 -1 -0.21941909234427 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 6.33333333333333 68 -1 0.29211351059778 -0.5 -0.5 2869 1
i 6 133.42428376534787 2 6.33333333333333 68 -1 -0.2530270955502 -0.5 -0.5 2869 1
i 5 133.42428376534787 2 6.91666666666667 68 -1 0.03376091246166 -0.5 -0.5 2869 1
i 5 133.42428376534787 2 7.41666666666667 68 -1 -0.38771619731708 -0.5 -0.5 2869 1
i 5 133.42428376534787 2 8 68 -1 -0.32533213096265 -0.5 -0.5 2869 1
i 4 133.42428376534787 2 6 68 -1 0.27151289790069 -0.5 -0.5 2869 1
i 4 133.42428376534787 2 8.58333333333333 68 -1 -0.30533548805428 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 8.91666666666667 68 -1 0.35741402504038 -0.5 -0.5 367232 1
i 4 133.42428376534787 2 8.58333333333333 68 -1 -0.04022928948881 -0.5 -0.5 367232 1
i 4 133.69713506139155 2 6 68 -1 0.45448680438393 -0.5 -0.5 2869 1
i 4 133.69713506139155 2 8.58333333333333 68 -1 -0.43706797411976 -0.5 -0.5 367232 1
i 4 133.9699863574352 2 6 68 -1 -0.12544024947143 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 6.33333333333333 68 -1 -0.05811018439158 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 6 68 -1 0.4282383709054 -0.5 -0.5 2869 1
i 4 133.9699863574352 2 8.58333333333333 68 -1 -0.19677327694437 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 6 68 -1 -0.20500048791318 -0.5 -0.5 2869 1
i 6 134.24283765347886 2 6 68 -1 -0.44001213319907 -0.5 -0.5 2869 1
i 5 134.24283765347886 2 6.66666666666667 68 -1 0.36190267607951 -0.5 -0.5 2869 1
i 5 134.24283765347886 2 7.16666666666667 68 -1 -0.16892727382874 -0.5 -0.5 2869 1
i 6 134.24283765347886 2 7.66666666666667 68 -1 -0.08593386692369 -0.5 -0.5 2869 1
i 4 134.24283765347886 2 6.33333333333333 68 -1 0.05428224188674 -0.5 -0.5 2869 1
i 4 134.24283765347886 2 8.58333333333333 68 -1 0.07863808608816 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 8.91666666666667 68 -1 -0.357914511141 -0.5 -0.5 367232 1
i 4 134.24283765347886 2 8.58333333333333 68 -1 0.35057712983621 -0.5 -0.5 367232 1
i 4 134.5156889495225 2 6.33333333333333 68 -1 -0.3315756711259 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 6.66666666666667 68 -1 -0.09938579946871 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 6.33333333333333 68 -1 0.33198948771961 -0.5 -0.5 2869 1
i 4 134.5156889495225 2 8.58333333333333 68 -1 -0.00655154032852 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 8.58333333333333 68 -1 0.11775571947143 -0.5 -0.5 367232 1
i 5 134.5156889495225 2 9.25 68 -1 -0.22146368520037 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 9.75 68 -1 -0.43164045949615 -0.5 -0.5 367232 1
i 6 134.5156889495225 2 10.33333333333333 68 -1 -0.21427098537182 -0.5 -0.5 367232 1
i 4 134.5156889495225 2 8.33333333333333 68 -1 -0.07227331820801 -0.5 -0.5 367232 1
i 4 134.78854024556617 2 6.33333333333333 68 -1 0.47252477270461 -0.5 -0.5 2869 1
i 4 134.78854024556617 2 6 68 -1 0.33590829430804 -0.5 -0.5 2869 1
i 4 134.78854024556617 2 8.33333333333333 68 -1 0.26171194739187 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 6 68 -1 0.07702181027158 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 6.33333333333333 68 -1 -0.41487797188517 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 6 68 -1 -0.15323216283877 -0.5 -0.5 2869 1
i 4 135.06139154160982 2 8.33333333333333 68 -1 0.25185234087227 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 8.58333333333333 68 -1 -0.42834368541548 -0.5 -0.5 367232 1
i 4 135.06139154160982 2 8.33333333333333 68 -1 -0.2896001850742 -0.5 -0.5 367232 1
i 4 135.33424283765348 2 6 68 -1 -0.49599476346927 -0.5 -0.5 2869 1
i 4 135.33424283765348 2 8.33333333333333 68 -1 0.26449821988647 -0.5 -0.5 367232 1
i 5 135.33424283765348 2 8.33333333333333 68 -1 0.23792058334752 -0.5 -0.5 367232 1
i 6 135.33424283765348 2 8.91666666666667 68 -1 -0.45033333269321 -0.5 -0.5 367232 1
i 6 135.33424283765348 2 9.5 68 -1 0.14806750422725 -0.5 -0.5 367232 1
i 5 135.33424283765348 2 10 68 -1 -0.31812836070482 -0.5 -0.5 367232 1
i 4 135.33424283765348 2 8.58333333333333 68 -1 0.4585136866438 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 6 68 -1 0.36266446009553 -0.5 -0.5 2869 1
i 4 135.60709413369713 2 8.58333333333333 68 -1 -0.01699094747177 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 8.91666666666667 68 -1 -0.27683387248484 -0.5 -0.5 367232 1
i 4 135.60709413369713 2 8.58333333333333 68 -1 0.21922386020722 -0.5 -0.5 367232 1
i 4 135.8799454297408 2 6 68 -1 -0.45514094537082 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 6.33333333333333 68 -1 -0.0671234038699 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 6 68 -1 0.3798575456926 -0.5 -0.5 2869 1
i 4 135.8799454297408 2 8.58333333333333 68 -1 0.46813872180837 -0.5 -0.5 367232 1
i 4 135.8799454297408 2 8.33333333333333 68 -1 0.28301407449876 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 6 68 -1 0.17315790400973 -0.5 -0.5 2869 1
i 5 136.15279672578444 2 6 68 -1 0.24893166152259 -0.5 -0.5 2869 1
i 6 136.15279672578444 2 6.66666666666667 68 -1 -0.424708238563 -0.5 -0.5 2869 1
i 6 136.15279672578444 2 7.16666666666667 68 -1 0.47994127497052 -0.5 -0.5 2869 1
i 5 136.15279672578444 2 7.66666666666667 68 -1 0.04225339656128 -0.5 -0.5 2869 1
i 4 136.15279672578444 2 8.33333333333333 68 -1 0.4600870478487 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 8.58333333333333 68 -1 0.4091456342859 -0.5 -0.5 367232 1
i 4 136.15279672578444 2 8.33333333333333 68 -1 -0.45794569711818 -0.5 -0.5 367232 1
i 4 136.4256480218281 2 6 68 -1 0.18348244803507 -0.5 -0.5 2869 1
i 4 136.4256480218281 2 8.33333333333333 68 -1 -0.25095643606459 -0.5 -0.5 367232 1
i 4 136.69849931787175 2 6 68 -1 0.45401693760167 -0.5 -0.5 2869 1
i 4 136.69849931787175 2 8.33333333333333 68 -1 -0.38932447705418 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 6 68 -1 -0.48431476419739 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 6.33333333333333 68 -1 -0.39099778663549 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 6 68 -1 0.06433899965662 -0.5 -0.5 2869 1
i 4 136.9713506139154 2 8.33333333333333 68 -1 -0.4748206490966 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 8.58333333333333 68 -1 -0.32807294201754 -0.5 -0.5 367232 1
i 4 136.9713506139154 2 8.33333333333333 68 -1 0.35043918830125 -0.5 -0.5 367232 1
i 4 137.24420190995906 2 6 68 -1 -0.30267576749527 -0.5 -0.5 2869 1
i 5 137.24420190995906 2 6 68 -1 0.00548155530009 -0.5 -0.5 2869 1
i 6 137.24420190995906 2 6.66666666666667 68 -1 -0.41407898783735 -0.5 -0.5 2869 1
i 5 137.24420190995906 2 7.16666666666667 68 -1 -0.02667521980187 -0.5 -0.5 2869 1
i 6 137.24420190995906 2 7.66666666666667 68 -1 0.02436308398986 -0.5 -0.5 2869 1
i 4 137.24420190995906 2 6.33333333333333 68 -1 -0.21728079589627 -0.5 -0.5 2869 1
i 4 137.24420190995906 2 8.33333333333333 68 -1 0.48438804739542 -0.5 -0.5 367232 1
i 5 137.24420190995906 2 8.33333333333333 68 -1 -0.21820241281838 -0.5 -0.5 367232 1
i 6 137.24420190995906 2 8.91666666666667 68 -1 -0.13560162747577 -0.5 -0.5 367232 1
i 5 137.24420190995906 2 9.5 68 -1 0.44970340681389 -0.5 -0.5 367232 1
i 5 137.24420190995906 2 10 68 -1 0.03370860520091 -0.5 -0.5 367232 1
i 4 137.5170532060027 2 6.33333333333333 68 -1 -0.35617276866874 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 6.66666666666667 68 -1 0.22202508483875 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 6.33333333333333 68 -1 -0.26412396682328 -0.5 -0.5 2869 1
i 4 137.5170532060027 2 8.33333333333333 68 -1 -0.41699890417959 -0.5 -0.5 367232 1
i 4 137.7899045020464 2 6.33333333333333 68 -1 0.48152704304594 -0.5 -0.5 2869 1
i 4 137.7899045020464 2 6 68 -1 0.42632910133837 -0.5 -0.5 2869 1
i 4 137.7899045020464 2 8.33333333333333 68 -1 0.06484413327336 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 6 68 -1 0.24629119290124 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 6.33333333333333 68 -1 0.07823280285921 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 6 68 -1 -0.32560028063303 -0.5 -0.5 2869 1
i 4 138.06275579809005 2 8.33333333333333 68 -1 0.29942616623715 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 8.58333333333333 68 -1 -0.08146542234564 -0.5 -0.5 367232 1
i 4 138.06275579809005 2 8.33333333333333 68 -1 0.05560706101716 -0.5 -0.5 367232 1
i 4 138.3356070941337 2 6 68 -1 0.00199426074859 -0.5 -0.5 2869 1
i 4 138.3356070941337 2 8.33333333333333 68 -1 0.33443490810947 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 8.33333333333333 68 -1 -0.38084568912876 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 8.91666666666667 68 -1 -0.21396159653844 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 9.5 68 -1 0.37691571333595 -0.5 -0.5 367232 1
i 6 138.3356070941337 2 10 68 -1 -0.06510868369279 -0.5 -0.5 367232 1
i 4 138.3356070941337 2 8.58333333333333 68 -1 0.45840686949234 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 6 68 -1 -0.29031178517174 -0.5 -0.5 2869 1
i 4 138.60845839017736 2 8.58333333333333 68 -1 -0.30708435243203 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 8.91666666666667 68 -1 0.47347359009724 -0.5 -0.5 367232 1
i 4 138.60845839017736 2 8.58333333333333 68 -1 -0.08821599499643 -0.5 -0.5 367232 1
i 4 138.88130968622102 2 6 68 -1 -0.18576172352192 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 6.33333333333333 68 -1 0.47153973496069 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 6 68 -1 -0.47881446830732 -0.5 -0.5 2869 1
i 4 138.88130968622102 2 8.58333333333333 68 -1 0.40161780380607 -0.5 -0.5 367232 1
i 4 138.88130968622102 2 8.33333333333333 68 -1 -0.40646110629974 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 6 68 -1 -0.45902621821759 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6 68 -1 0.06960038624962 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6.66666666666667 68 -1 -0.12828073161524 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.16666666666667 68 -1 0.4944352379238 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.66666666666667 68 -1 -0.0936493236544 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6 68 -1 0.30247732801441 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6.66666666666667 68 -1 -0.1480923737463 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 7.16666666666667 68 -1 -0.05083538465037 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 7.66666666666667 68 -1 0.31305365511155 -0.5 -0.5 2869 1
i 6 139.15416098226467 2 6 68 -1 -0.21369888719967 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 6.66666666666667 68 -1 0.46810410075166 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 7.16666666666667 68 -1 0.06845759544386 -0.5 -0.5 2869 1
i 5 139.15416098226467 2 7.66666666666667 68 -1 0.23771871629212 -0.5 -0.5 2869 1
i 4 139.15416098226467 2 8.33333333333333 68 -1 0.13028888570262 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 8.58333333333333 68 -1 0.26958192395528 -0.5 -0.5 367232 1
i 4 139.15416098226467 2 8.33333333333333 68 -1 0.10158221679215 -0.5 -0.5 367232 1
i 4 139.42701227830833 2 6 68 -1 0.41662804170818 -0.5 -0.5 2869 1
i 4 139.42701227830833 2 8.33333333333333 68 -1 0.29922426153798 -0.5 -0.5 367232 1
i 4 139.69986357435198 2 6 68 -1 -0.00644926978095 -0.5 -0.5 2869 1
i 4 139.69986357435198 2 8.33333333333333 68 -1 0.01488522386434 -0.5 -0.5 367232 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 -0.41638349809809 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 8 68 -1 0.3687871181944 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 0.37581733706061 -0.5 -0.5 2869 1
i 3 139.97271487039563 2 7.66666666666667 68 -1 0.108863669822 -0.5 -0.5 2869 1
i 4 139.97271487039563 2 6 68 -1 -0.23723726649089 -0.5 -0.5 2869 1
i 4 139.97271487039563 2 8.33333333333333 68 -1 0.03826619247298 -0.5 -0.5 367232 1
i 4 139.97271487039563 2 8.58333333333333 68 -1 0.30160205606323 -0.5 -0.5 367232 1
i 4 139.97271487039563 2 8.33333333333333 68 -1 0.27327807253629 -0.5 -0.5 367232 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 0.31808283456812 -0.5 -0.5 2869 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 -0.40657508001407 -0.5 -0.5 2869 1
i 3 140.2455661664393 2 8 68 -1 -0.16666552136893 -0.5 -0.5 2869 1
i 3 140.2455661664393 2 7.66666666666667 68 -1 -0.25291119031942 -0.5 -0.5 2869 1
i 4 140.2455661664393 2 6 68 -1 0.00413560343756 -0.5 -0.5 2869 1
i 4 140.2455661664393 2 8.33333333333333 68 -1 0.40765940505919 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.33333333333333 68 -1 0.14821895345895 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 8.91666666666667 68 -1 -0.48682233005694 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 9.5 68 -1 0.42537209840492 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 10 68 -1 0.45018431196349 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 8.33333333333333 68 -1 0.27207192732334 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 8.91666666666667 68 -1 0.28249156337061 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 9.5 68 -1 0.08964539944919 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 10 68 -1 0.17698149580535 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 8.33333333333333 68 -1 -0.07726895327956 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 8.91666666666667 68 -1 -0.22564074049458 -0.5 -0.5 367232 1
i 5 140.2455661664393 2 9.5 68 -1 -0.3286107389381 -0.5 -0.5 367232 1
i 6 140.2455661664393 2 10 68 -1 -0.1354931168893 -0.5 -0.5 367232 1
i 3 140.51841746248294 2 7.66666666666667 68 -1 -0.06767781514126 -0.5 -0.5 2869 1
i 5 140.51841746248294 2 7.66666666666667 68 -1 -0.19850968994004 -0.5 -0.5 2869 1
i 5 140.51841746248294 2 8.33333333333333 68 -1 -0.40198972339106 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 8.75 68 -1 0.01210516589888 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 9.41666666666667 68 -1 0.28353978097829 -0.5 -0.5 2869 1
i 3 140.51841746248294 2 8 68 -1 0.27984392934687 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6 68 -1 -0.32818438294479 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6.33333333333333 68 -1 0.35158825125617 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 6 68 -1 -0.33344378309793 -0.5 -0.5 2869 1
i 4 140.51841746248294 2 8.33333333333333 68 -1 0.15249376287385 -0.5 -0.5 367232 1
i 3 140.7912687585266 2 8 68 -1 -0.2690605009155 -0.5 -0.5 2869 1
i 3 140.7912687585266 2 8.33333333333333 68 -1 0.10867863653751 -0.5 -0.5 2869 1
i 3 140.7912687585266 2 8 68 -1 -0.24541295771713 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 6 68 -1 0.4211264121887 -0.5 -0.5 2869 1
i 6 140.7912687585266 2 6 68 -1 0.12430656658426 -0.5 -0.5 2869 1
i 6 140.7912687585266 2 6.66666666666667 68 -1 -0.09989632722994 -0.5 -0.5 2869 1
i 6 140.7912687585266 2 7.16666666666667 68 -1 0.36659842153093 -0.5 -0.5 2869 1
i 5 140.7912687585266 2 7.66666666666667 68 -1 -0.32963554079843 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 6.33333333333333 68 -1 0.09387025870616 -0.5 -0.5 2869 1
i 4 140.7912687585266 2 8.33333333333333 68 -1 -0.10661462830806 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 8 68 -1 -0.40600439092074 -0.5 -0.5 2869 1
i 3 141.06412005457025 2 7.66666666666667 68 -1 -0.35794397011558 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.33333333333333 68 -1 0.15460802537456 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.66666666666667 68 -1 -0.25492925641128 -0.5 -0.5 2869 1
i 4 141.06412005457025 2 6.33333333333333 68 -1 -0.10738310013878 -0.5 -0.5 2869 1
i 3 141.06412005457025 2 10 68 -1 0.3625268556567 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10.33333333333333 68 -1 0.44084576277406 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10 68 -1 -0.04741419462113 -0.5 -0.5 367232 1
i 3 141.06412005457025 2 10 68 -1 -0.1660878532581 -0.5 -0.5 367232 1
i 4 141.06412005457025 2 8.33333333333333 68 -1 0.38293364700576 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 7.66666666666667 68 -1 -0.3760771742685 -0.5 -0.5 2869 1
i 3 141.3369713506139 2 8 68 -1 0.15352255564671 -0.5 -0.5 2869 1
i 3 141.3369713506139 2 7.66666666666667 68 -1 -0.49548097077421 -0.5 -0.5 2869 1
i 4 141.3369713506139 2 6.33333333333333 68 -1 -0.45121042541949 -0.5 -0.5 2869 1
i 4 141.3369713506139 2 6 68 -1 0.12700701815827 -0.5 -0.5 2869 1
i 4 141.3369713506139 2 10 68 -1 -0.15438381096031 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10 68 -1 -0.13791443947202 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10.33333333333333 68 -1 0.16880135435408 -0.5 -0.5 367232 1
i 3 141.3369713506139 2 10 68 -1 -0.04724104505441 -0.5 -0.5 367232 1
i 4 141.3369713506139 2 8.33333333333333 68 -1 -0.2199556604636 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 7.66666666666667 68 -1 -0.35703670940127 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6 68 -1 -0.432163430318 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6.33333333333333 68 -1 -0.38250193761265 -0.5 -0.5 2869 1
i 4 141.60982264665756 2 6 68 -1 -0.08183494640957 -0.5 -0.5 2869 1
i 3 141.60982264665756 2 10 68 -1 0.12395895869081 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 10 68 -1 -0.28750024579043 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 10.58333333333333 68 -1 -0.32147049389207 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 11.25 68 -1 0.03970652770301 -0.5 -0.5 367232 1
i 5 141.60982264665756 2 11.75 68 -1 -0.03288630878093 -0.5 -0.5 367232 1
i 3 141.60982264665756 2 10.33333333333333 68 -1 -0.49636653095557 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.33333333333333 68 -1 0.37822139464515 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.58333333333333 68 -1 0.43429304861807 -0.5 -0.5 367232 1
i 4 141.60982264665756 2 8.33333333333333 68 -1 -0.22443891082763 -0.5 -0.5 367232 1
i 3 141.88267394270125 2 7.66666666666667 68 -1 -0.4115394454513 -0.5 -0.5 2869 1
i 4 141.88267394270125 2 6 68 -1 0.3295758593853 -0.5 -0.5 2869 1
i 3 141.88267394270125 2 10.33333333333333 68 -1 -0.05430190511145 -0.5 -0.5 367232 1
i 3 141.88267394270125 2 10.58333333333333 68 -1 0.37119479803582 -0.5 -0.5 367232 1
i 3 141.88267394270125 2 10.33333333333333 68 -1 0.32662172632137 -0.5 -0.5 367232 1
i 4 141.88267394270125 2 8.33333333333333 68 -1 0.40651156070983 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 8.33333333333333 68 -1 -0.37841119406283 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 8.91666666666667 68 -1 -0.28801919625444 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 9.5 68 -1 0.18985690231349 -0.5 -0.5 367232 1
i 6 141.88267394270125 2 10 68 -1 0.42277259915653 -0.5 -0.5 367232 1
i 4 141.88267394270125 2 8.58333333333333 68 -1 -0.24429446326176 -0.5 -0.5 367232 1
i 3 142.1555252387449 2 7.66666666666667 68 -1 -0.22833911426665 -0.5 -0.5 2869 1
i 3 142.1555252387449 2 8 68 -1 -0.33595822939147 -0.5 -0.5 2869 1
i 3 142.1555252387449 2 7.66666666666667 68 -1 0.27353423037103 -0.5 -0.5 2869 1
i 4 142.1555252387449 2 6 68 -1 -0.16982932277921 -0.5 -0.5 2869 1
i 3 142.1555252387449 2 10.33333333333333 68 -1 -0.37408144196387 -0.5 -0.5 367232 1
i 3 142.1555252387449 2 10 68 -1 0.34973109015365 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.58333333333333 68 -1 -0.34695069895373 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.91666666666667 68 -1 -0.14200254437653 -0.5 -0.5 367232 1
i 4 142.1555252387449 2 8.58333333333333 68 -1 0.08368917195756 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 7.66666666666667 68 -1 0.2432123684961 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 7.66666666666667 68 -1 -0.16196070430057 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 8.33333333333333 68 -1 -0.18842803626523 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 8.75 68 -1 -0.27471459758125 -0.5 -0.5 2869 1
i 5 142.42837653478855 2 9.41666666666667 68 -1 0.00251489331233 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6 68 -1 -0.25138068335623 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6.33333333333333 68 -1 0.46392184587869 -0.5 -0.5 2869 1
i 4 142.42837653478855 2 6 68 -1 0.01224663080834 -0.5 -0.5 2869 1
i 3 142.42837653478855 2 10 68 -1 0.19167077855856 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 10.33333333333333 68 -1 -0.33506340675952 -0.5 -0.5 367232 1
i 3 142.42837653478855 2 10 68 -1 -0.14629232123631 -0.5 -0.5 367232 1
i 4 142.42837653478855 2 8.58333333333333 68 -1 -0.08323233020944 -0.5 -0.5 367232 1
i 4 142.42837653478855 2 8.33333333333333 68 -1 -0.3795963656627 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 6 68 -1 0.29116414690326 -0.5 -0.5 2869 1
i 6 142.7012278308322 2 6 68 -1 -0.18530607554075 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6.66666666666667 68 -1 0.21310266167235 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 7.16666666666667 68 -1 -0.41018073784509 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 7.66666666666667 68 -1 0.09464187468603 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6 68 -1 0.00002449518995 -0.5 -0.5 2869 1
i 5 142.7012278308322 2 6.66666666666667 68 -1 0.29949142338525 -0.5 -0.5 2869 1
i 6 142.7012278308322 2 7.16666666666667 68 -1 -0.07639485895203 -0.5 -0.5 2869 1
i 6 142.7012278308322 2 7.66666666666667 68 -1 -0.27362735965104 -0.5 -0.5 2869 1
i 4 142.7012278308322 2 6.33333333333333 68 -1 -0.39030511991858 -0.5 -0.5 2869 1
i 4 142.7012278308322 2 10 68 -1 0.17097753236933 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.33333333333333 68 -1 0.19701127074281 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.58333333333333 68 -1 0.38950535445899 -0.5 -0.5 367232 1
i 4 142.7012278308322 2 8.33333333333333 68 -1 -0.06746342964656 -0.5 -0.5 367232 1
i 4 142.97407912687586 2 6.33333333333333 68 -1 -0.20851715427694 -0.5 -0.5 2869 1
i 3 142.97407912687586 2 10 68 -1 -0.20707020002718 -0.5 -0.5 367232 1
i 4 142.97407912687586 2 8.33333333333333 68 -1 0.20725796159557 -0.5 -0.5 367232 1
i 4 143.24693042291952 2 6.33333333333333 68 -1 -0.44575742284805 -0.5 -0.5 2869 1
i 4 143.24693042291952 2 6.66666666666667 68 -1 0.43233815830245 -0.5 -0.5 2869 1
i 4 143.24693042291952 2 6.33333333333333 68 -1 0.09773912708936 -0.5 -0.5 2869 1
i 3 143.24693042291952 2 10 68 -1 0.19443508115055 -0.5 -0.5 367232 1
i 3 143.24693042291952 2 10.33333333333333 68 -1 -0.15326366498915 -0.5 -0.5 367232 1
i 3 143.24693042291952 2 10 68 -1 0.3697281939887 -0.5 -0.5 367232 1
i 4 143.24693042291952 2 8.33333333333333 68 -1 0.4541018672214 -0.5 -0.5 367232 1
i 3 143.51978171896317 2 7.66666666666667 68 -1 -0.26365488610931 -0.5 -0.5 2869 1
i 3 143.51978171896317 2 8 68 -1 0.30409054947762 -0.5 -0.5 2869 1
i 3 143.51978171896317 2 7.66666666666667 68 -1 0.18021399162449 -0.5 -0.5 2869 1
i 4 143.51978171896317 2 6.33333333333333 68 -1 0.07067435794284 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 6.33333333333333 68 -1 -0.21097886824674 -0.5 -0.5 2869 1
i 5 143.51978171896317 2 6.91666666666667 68 -1 -0.06623437100913 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 7.41666666666667 68 -1 -0.41855062789428 -0.5 -0.5 2869 1
i 6 143.51978171896317 2 8 68 -1 0.45018996792904 -0.5 -0.5 2869 1
i 4 143.51978171896317 2 6.66666666666667 68 -1 0.07214327409794 -0.5 -0.5 2869 1
i 3 143.51978171896317 2 10 68 -1 -0.33469794230742 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 10 68 -1 0.186605719064 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 10.58333333333333 68 -1 -0.13248247625419 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 11.25 68 -1 0.16407894746539 -0.5 -0.5 367232 1
i 5 143.51978171896317 2 11.75 68 -1 -0.37499794708363 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.33333333333333 68 -1 0.14224311748771 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.58333333333333 68 -1 0.25511653816355 -0.5 -0.5 367232 1
i 4 143.51978171896317 2 8.33333333333333 68 -1 0.07599252259137 -0.5 -0.5 367232 1
i 4 143.79263301500683 2 7.66666666666667 68 -1 -0.30979406950317 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.66666666666667 68 -1 -0.47576993507356 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.91666666666667 68 -1 0.24144200013484 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 6.66666666666667 68 -1 0.12125385717261 -0.5 -0.5 2869 1
i 4 143.79263301500683 2 8.33333333333333 68 -1 0.21434542343123 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 8.33333333333333 68 -1 -0.19667822691415 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 8.91666666666667 68 -1 0.36225085320708 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 9.5 68 -1 -0.29187212446786 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 10 68 -1 -0.3626429111981 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 8.33333333333333 68 -1 0.04893755019817 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 8.91666666666667 68 -1 0.30361619096331 -0.5 -0.5 367232 1
i 6 143.79263301500683 2 9.5 68 -1 -0.26845681373759 -0.5 -0.5 367232 1
i 5 143.79263301500683 2 10 68 -1 -0.15733783887485 -0.5 -0.5 367232 1
i 4 143.79263301500683 2 8.58333333333333 68 -1 0.46355502766506 -0.5 -0.5 367232 1
i 4 144.06548431105048 2 6.66666666666667 68 -1 0.443357078976 -0.5 -0.5 2869 1
i 4 144.06548431105048 2 6.33333333333333 68 -1 -0.28975200144038 -0.5 -0.5 2869 1
i 4 144.06548431105048 2 8.58333333333333 68 -1 0.42435352587949 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 6.33333333333333 68 -1 0.39865885876207 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 6.66666666666667 68 -1 -0.39009627112611 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 6.33333333333333 68 -1 -0.11680815959632 -0.5 -0.5 2869 1
i 4 144.33833560709414 2 8.58333333333333 68 -1 0.43951710769079 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 8.91666666666667 68 -1 -0.19072107347384 -0.5 -0.5 367232 1
i 4 144.33833560709414 2 8.58333333333333 68 -1 -0.13649463789672 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 6.33333333333333 68 -1 0.30247320530592 -0.5 -0.5 2869 1
i 4 144.6111869031378 2 10 68 -1 0.44944249646235 -0.5 -0.5 367232 1
i 3 144.6111869031378 2 10.33333333333333 68 -1 -0.49127265853857 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 10 68 -1 0.20513595494256 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 8.58333333333333 68 -1 0.42549385791419 -0.5 -0.5 367232 1
i 6 144.6111869031378 2 8.58333333333333 68 -1 -0.4081721341122 -0.5 -0.5 367232 1
i 5 144.6111869031378 2 9.25 68 -1 0.09561140417606 -0.5 -0.5 367232 1
i 5 144.6111869031378 2 9.75 68 -1 -0.17353061302115 -0.5 -0.5 367232 1
i 6 144.6111869031378 2 10.33333333333333 68 -1 0.38583641235828 -0.5 -0.5 367232 1
i 4 144.6111869031378 2 8.91666666666667 68 -1 -0.2462775968736 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 6.33333333333333 68 -1 -0.32700017000465 -0.5 -0.5 2869 1
i 3 144.88403819918145 2 10 68 -1 0.38157723210158 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 8.91666666666667 68 -1 0.22946311626567 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 9.25 68 -1 -0.20427760080019 -0.5 -0.5 367232 1
i 4 144.88403819918145 2 8.91666666666667 68 -1 -0.1642354493046 -0.5 -0.5 367232 1
i 4 145.1568894952251 2 6.33333333333333 68 -1 -0.2143982339724 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 6.66666666666667 68 -1 0.11397433247154 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 6.33333333333333 68 -1 -0.04321281462089 -0.5 -0.5 2869 1
i 4 145.1568894952251 2 8.91666666666667 68 -1 -0.19472967612143 -0.5 -0.5 367232 1
i 4 145.1568894952251 2 8.58333333333333 68 -1 0.14436167153487 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 6.33333333333333 68 -1 -0.35201548182326 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 6.33333333333333 68 -1 -0.1250054194938 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 6.91666666666667 68 -1 0.49281374926911 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 7.41666666666667 68 -1 0.43271441448825 -0.5 -0.5 2869 1
i 6 145.42974079126876 2 8 68 -1 -0.0525240308587 -0.5 -0.5 2869 1
i 4 145.42974079126876 2 6 68 -1 -0.41737703906326 -0.5 -0.5 2869 1
i 4 145.42974079126876 2 8.58333333333333 68 -1 0.02363488349789 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 8.91666666666667 68 -1 -0.34470639784559 -0.5 -0.5 367232 1
i 4 145.42974079126876 2 8.58333333333333 68 -1 -0.36719017835595 -0.5 -0.5 367232 1
i 4 145.7025920873124 2 6 68 -1 -0.05652432236555 -0.5 -0.5 2869 1
i 4 145.7025920873124 2 8.58333333333333 68 -1 -0.3686371908248 -0.5 -0.5 367232 1
i 4 145.9754433833561 2 6 68 -1 0.08598290122903 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 6.33333333333333 68 -1 0.32673338972339 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 6 68 -1 0.10361124845918 -0.5 -0.5 2869 1
i 4 145.9754433833561 2 8.58333333333333 68 -1 -0.42198950415145 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 6 68 -1 -0.07401726799632 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 6 68 -1 0.17430417366881 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 6.66666666666667 68 -1 -0.11802223645032 -0.5 -0.5 2869 1
i 5 146.24829467939975 2 7.16666666666667 68 -1 0.39412935356568 -0.5 -0.5 2869 1
i 6 146.24829467939975 2 7.66666666666667 68 -1 0.11739988359831 -0.5 -0.5 2869 1
i 4 146.24829467939975 2 6.33333333333333 68 -1 0.29067348788778 -0.5 -0.5 2869 1
i 4 146.24829467939975 2 8.58333333333333 68 -1 -0.46501275807789 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 8.91666666666667 68 -1 -0.19383032232784 -0.5 -0.5 367232 1
i 4 146.24829467939975 2 8.58333333333333 68 -1 -0.13503903847421 -0.5 -0.5 367232 1
i 4 146.5211459754434 2 6.33333333333333 68 -1 -0.49921836276759 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 6.66666666666667 68 -1 0.41223236212423 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 6.33333333333333 68 -1 0.45400397816192 -0.5 -0.5 2869 1
i 4 146.5211459754434 2 8.58333333333333 68 -1 0.25903163789104 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 8.58333333333333 68 -1 -0.1705758718435 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 9.25 68 -1 0.07912067758618 -0.5 -0.5 367232 1
i 5 146.5211459754434 2 9.75 68 -1 0.36497532169143 -0.5 -0.5 367232 1
i 6 146.5211459754434 2 10.33333333333333 68 -1 0.12518709304307 -0.5 -0.5 367232 1
i 4 146.5211459754434 2 8.33333333333333 68 -1 -0.43783983461033 -0.5 -0.5 367232 1
i 4 146.79399727148706 2 6.33333333333333 68 -1 -0.27709138837259 -0.5 -0.5 2869 1
i 4 146.79399727148706 2 6 68 -1 0.47147194645393 -0.5 -0.5 2869 1
i 4 146.79399727148706 2 8.33333333333333 68 -1 0.24821389643222 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 6 68 -1 -0.27859282291186 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 6.33333333333333 68 -1 -0.0462455469873 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 6 68 -1 -0.24779285928233 -0.5 -0.5 2869 1
i 4 147.0668485675307 2 8.33333333333333 68 -1 -0.27113753084755 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 8.58333333333333 68 -1 0.07873249368188 -0.5 -0.5 367232 1
i 4 147.0668485675307 2 8.33333333333333 68 -1 -0.13639272868482 -0.5 -0.5 367232 1
i 4 147.33969986357437 2 6 68 -1 0.14653178787312 -0.5 -0.5 2869 1
i 4 147.33969986357437 2 8.33333333333333 68 -1 -0.33649957434479 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 8.33333333333333 68 -1 0.44510896615698 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 8.91666666666667 68 -1 0.42911157291835 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 9.5 68 -1 0.23370352461235 -0.5 -0.5 367232 1
i 6 147.33969986357437 2 10 68 -1 0.30338978709448 -0.5 -0.5 367232 1
i 4 147.33969986357437 2 8.58333333333333 68 -1 -0.11549082916551 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 6 68 -1 -0.08725719123665 -0.5 -0.5 2869 1
i 4 147.61255115961802 2 8.58333333333333 68 -1 -0.24284630897307 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 8.91666666666667 68 -1 0.39122483258104 -0.5 -0.5 367232 1
i 4 147.61255115961802 2 8.58333333333333 68 -1 0.24774792113341 -0.5 -0.5 367232 1
i 4 147.88540245566168 2 6 68 -1 -0.28609822084044 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 6.33333333333333 68 -1 0.33548204967438 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 6 68 -1 0.2607432571269 -0.5 -0.5 2869 1
i 4 147.88540245566168 2 8.58333333333333 68 -1 -0.24836118017502 -0.5 -0.5 367232 1
i 4 147.88540245566168 2 8.33333333333333 68 -1 -0.27823049284585 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 6 68 -1 0.35949666207998 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 6 68 -1 0.36264999693507 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 6.66666666666667 68 -1 -0.18229960426565 -0.5 -0.5 2869 1
i 6 148.15825375170533 2 7.16666666666667 68 -1 0.23946094060304 -0.5 -0.5 2869 1
i 5 148.15825375170533 2 7.66666666666667 68 -1 0.22174656303583 -0.5 -0.5 2869 1
i 4 148.15825375170533 2 8.33333333333333 68 -1 0.44222535124276 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 8.58333333333333 68 -1 -0.07098790325844 -0.5 -0.5 367232 1
i 4 148.15825375170533 2 8.33333333333333 68 -1 0.0542375541709 -0.5 -0.5 367232 1
i 4 148.43110504774899 2 6 68 -1 0.33323999808973 -0.5 -0.5 2869 1
i 4 148.43110504774899 2 8.33333333333333 68 -1 -0.08643578513051 -0.5 -0.5 367232 1
i 4 148.70395634379264 2 6 68 -1 -0.15954436271166 -0.5 -0.5 2869 1
i 4 148.70395634379264 2 8.33333333333333 68 -1 0.29723650051851 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 6 68 -1 0.00737893532863 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 6.33333333333333 68 -1 0.24784331492357 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 6 68 -1 0.48456143899943 -0.5 -0.5 2869 1
i 4 148.9768076398363 2 8.33333333333333 68 -1 0.20385801002991 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 8.58333333333333 68 -1 -0.36539407446912 -0.5 -0.5 367232 1
i 4 148.9768076398363 2 8.33333333333333 68 -1 0.10033769029518 -0.5 -0.5 367232 1
i 4 149.24965893587995 2 6 68 -1 -0.46713578696005 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 6 68 -1 0.36456449834831 -0.5 -0.5 2869 1
i 5 149.24965893587995 2 6.66666666666667 68 -1 0.34418671820541 -0.5 -0.5 2869 1
i 5 149.24965893587995 2 7.16666666666667 68 -1 -0.39384065085421 -0.5 -0.5 2869 1
i 6 149.24965893587995 2 7.66666666666667 68 -1 -0.02784658278448 -0.5 -0.5 2869 1
i 4 149.24965893587995 2 6.33333333333333 68 -1 -0.16325197908812 -0.5 -0.5 2869 1
i 4 149.24965893587995 2 8.33333333333333 68 -1 0.34003233889001 -0.5 -0.5 367232 1
i 5 149.24965893587995 2 8.33333333333333 68 -1 0.16471466961634 -0.5 -0.5 367232 1
i 6 149.24965893587995 2 8.91666666666667 68 -1 -0.26176827957213 -0.5 -0.5 367232 1
i 5 149.24965893587995 2 9.5 68 -1 0.2845402197799 -0.5 -0.5 367232 1
i 5 149.24965893587995 2 10 68 -1 -0.46201046994828 -0.5 -0.5 367232 1
i 4 149.5225102319236 2 6.33333333333333 68 -1 0.48191785256465 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 6.66666666666667 68 -1 0.27694420435479 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 6.33333333333333 68 -1 0.12562944242161 -0.5 -0.5 2869 1
i 4 149.5225102319236 2 8.33333333333333 68 -1 -0.26788171781213 -0.5 -0.5 367232 1
i 4 149.79536152796726 2 6.33333333333333 68 -1 -0.00258790606487 -0.5 -0.5 2869 1
i 4 149.79536152796726 2 6 68 -1 0.38442158446167 -0.5 -0.5 2869 1
i 4 149.79536152796726 2 8.33333333333333 68 -1 -0.27306339939351 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 6 68 -1 -0.24245694284187 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 6.33333333333333 68 -1 0.14658320455343 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 6 68 -1 -0.15563745574196 -0.5 -0.5 2869 1
i 4 150.0682128240109 2 8.33333333333333 68 -1 0.02108974608691 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 8.58333333333333 68 -1 0.49939975739094 -0.5 -0.5 367232 1
i 4 150.0682128240109 2 8.33333333333333 68 -1 0.18029647681703 -0.5 -0.5 367232 1
i 4 150.34106412005457 2 6 68 -1 -0.20628456488444 -0.5 -0.5 2869 1
i 4 150.34106412005457 2 8.33333333333333 68 -1 0.35757938832203 -0.5 -0.5 367232 1
i 5 150.34106412005457 2 8.33333333333333 68 -1 -0.16157996265042 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 8.91666666666667 68 -1 0.29926866460409 -0.5 -0.5 367232 1
i 6 150.34106412005457 2 9.5 68 -1 0.31440852425154 -0.5 -0.5 367232 1
i 5 150.34106412005457 2 10 68 -1 -0.03583003820166 -0.5 -0.5 367232 1
i 4 150.34106412005457 2 8.58333333333333 68 -1 0.2994102224619 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 6 68 -1 0.33904385417008 -0.5 -0.5 2869 1
i 4 150.61391541609822 2 8.58333333333333 68 -1 -0.29884073028581 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 8.91666666666667 68 -1 0.20401581664346 -0.5 -0.5 367232 1
i 4 150.61391541609822 2 8.58333333333333 68 -1 -0.16975386172579 -0.5 -0.5 367232 1
i 4 150.88676671214188 2 6 68 -1 0.02639292796308 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 6.33333333333333 68 -1 0.30437506933321 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 6 68 -1 0.14506573074412 -0.5 -0.5 2869 1
i 4 150.88676671214188 2 8.58333333333333 68 -1 0.15329559532909 -0.5 -0.5 367232 1
i 4 150.88676671214188 2 8.33333333333333 68 -1 -0.31392594212481 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 6 68 -1 -0.08482727252154 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6 68 -1 0.19118655189852 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6.66666666666667 68 -1 -0.34834274992839 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.16666666666667 68 -1 0.09063358850584 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.66666666666667 68 -1 0.02844194034065 -0.5 -0.5 2869 1
i 5 151.15961800818553 2 6 68 -1 0.0879862763812 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6.66666666666667 68 -1 -0.26703832704444 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.16666666666667 68 -1 0.403229751483 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.66666666666667 68 -1 -0.0047844191705 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 6 68 -1 0.28490538085368 -0.5 -0.5 2869 1
i 5 151.15961800818553 2 6.66666666666667 68 -1 -0.39828655509455 -0.5 -0.5 2869 1
i 6 151.15961800818553 2 7.16666666666667 68 -1 0.27266090503513 -0.5 -0.5 2869 1
i 5 151.15961800818553 2 7.66666666666667 68 -1 -0.15601871996846 -0.5 -0.5 2869 1
i 4 151.15961800818553 2 6.33333333333333 68 -1 -0.48080785352425 -0.5 -0.5 2869 1
i 4 151.15961800818553 2 8.33333333333333 68 -1 -0.26763586030981 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 8.58333333333333 68 -1 0.41090369612452 -0.5 -0.5 367232 1
i 4 151.15961800818553 2 8.33333333333333 68 -1 -0.25058011393074 -0.5 -0.5 367232 1
i 4 151.4324693042292 2 6.33333333333333 68 -1 -0.23675285284388 -0.5 -0.5 2869 1
i 4 151.4324693042292 2 8.33333333333333 68 -1 -0.21022892029671 -0.5 -0.5 367232 1
i 4 151.70532060027284 2 6.33333333333333 68 -1 0.4537560076 -0.5 -0.5 2869 1
i 4 151.70532060027284 2 8.33333333333333 68 -1 0.2195296126805 -0.5 -0.5 367232 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 -0.4484395235575 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 8 68 -1 0.26530404810465 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 -0.32913358266871 -0.5 -0.5 2869 1
i 3 151.9781718963165 2 7.66666666666667 68 -1 0.28350857773517 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.33333333333333 68 -1 0.13497743025786 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.66666666666667 68 -1 0.41672051580218 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 6.33333333333333 68 -1 -0.2299766449793 -0.5 -0.5 2869 1
i 4 151.9781718963165 2 8.33333333333333 68 -1 0.49523363594037 -0.5 -0.5 367232 1
i 4 151.9781718963165 2 8.58333333333333 68 -1 0.37172250798238 -0.5 -0.5 367232 1
i 4 151.9781718963165 2 8.33333333333333 68 -1 -0.18861164859103 -0.5 -0.5 367232 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 0.27472355806852 -0.5 -0.5 2869 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 0.12395665029059 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 8 68 -1 -0.34699928098441 -0.5 -0.5 2869 1
i 3 152.25102319236015 2 7.66666666666667 68 -1 -0.24897472405158 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 6.33333333333333 68 -1 -0.31852132146303 -0.5 -0.5 2869 1
i 6 152.25102319236015 2 6.33333333333333 68 -1 0.35890103384265 -0.5 -0.5 2869 1
i 5 152.25102319236015 2 6.91666666666667 68 -1 0.31311277764307 -0.5 -0.5 2869 1
i 6 152.25102319236015 2 7.41666666666667 68 -1 0.32132869387276 -0.5 -0.5 2869 1
i 6 152.25102319236015 2 8 68 -1 -0.44736150470607 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 6.66666666666667 68 -1 0.10339652006495 -0.5 -0.5 2869 1
i 4 152.25102319236015 2 8.33333333333333 68 -1 -0.08717937965736 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.33333333333333 68 -1 -0.03620285935768 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 8.91666666666667 68 -1 0.3266986122873 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 9.5 68 -1 -0.19016749384949 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 10 68 -1 0.37401922355092 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.33333333333333 68 -1 -0.19706226766178 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.91666666666667 68 -1 -0.0728969464051 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 9.5 68 -1 0.18571698490075 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 10 68 -1 -0.37412142011611 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 8.33333333333333 68 -1 -0.05310039434407 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 8.91666666666667 68 -1 -0.28037409563168 -0.5 -0.5 367232 1
i 5 152.25102319236015 2 9.5 68 -1 0.27435102191494 -0.5 -0.5 367232 1
i 6 152.25102319236015 2 10 68 -1 0.08737655492241 -0.5 -0.5 367232 1
i 4 152.25102319236015 2 8.58333333333333 68 -1 -0.23138042880885 -0.5 -0.5 367232 1
i 3 152.5238744884038 2 7.66666666666667 68 -1 0.47444397614878 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 7.66666666666667 68 -1 -0.42747176155854 -0.5 -0.5 2869 1
i 5 152.5238744884038 2 8.33333333333333 68 -1 -0.20935825423892 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 8.75 68 -1 0.04689541831285 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 9.41666666666667 68 -1 0.08499056860481 -0.5 -0.5 2869 1
i 3 152.5238744884038 2 8 68 -1 -0.00592319333079 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.66666666666667 68 -1 0.30992522797937 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.91666666666667 68 -1 0.00149217555433 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 6.66666666666667 68 -1 0.07903888819952 -0.5 -0.5 2869 1
i 4 152.5238744884038 2 8.58333333333333 68 -1 0.16943912598997 -0.5 -0.5 367232 1
i 3 152.79672578444746 2 8 68 -1 0.09358701936985 -0.5 -0.5 2869 1
i 3 152.79672578444746 2 8.33333333333333 68 -1 -0.25332897678297 -0.5 -0.5 2869 1
i 3 152.79672578444746 2 8 68 -1 0.37673720632623 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 6.66666666666667 68 -1 -0.05998844798071 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 6.33333333333333 68 -1 0.01031650106544 -0.5 -0.5 2869 1
i 4 152.79672578444746 2 8.58333333333333 68 -1 -0.48277056632182 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 8 68 -1 0.07902210192166 -0.5 -0.5 2869 1
i 3 153.06957708049111 2 7.66666666666667 68 -1 -0.43309690754209 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.33333333333333 68 -1 -0.26718775344206 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.66666666666667 68 -1 0.00573009770878 -0.5 -0.5 2869 1
i 4 153.06957708049111 2 6.33333333333333 68 -1 0.03744547582069 -0.5 -0.5 2869 1
i 3 153.06957708049111 2 10 68 -1 -0.29786760427934 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10.33333333333333 68 -1 -0.49781814080822 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10 68 -1 -0.08053114886848 -0.5 -0.5 367232 1
i 3 153.06957708049111 2 10 68 -1 -0.25465192258338 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.58333333333333 68 -1 0.15335170987087 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.91666666666667 68 -1 -0.20813926334282 -0.5 -0.5 367232 1
i 4 153.06957708049111 2 8.58333333333333 68 -1 -0.06849716904702 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 7.66666666666667 68 -1 -0.14487982856896 -0.5 -0.5 2869 1
i 4 153.34242837653477 2 8 68 -1 -0.04452112890089 -0.5 -0.5 2869 1
i 3 153.34242837653477 2 7.66666666666667 68 -1 0.11254370968722 -0.5 -0.5 2869 1
i 4 153.34242837653477 2 6.33333333333333 68 -1 -0.4196093683075 -0.5 -0.5 2869 1
i 3 153.34242837653477 2 10 68 -1 0.05795636838508 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10 68 -1 -0.27203871563491 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10.33333333333333 68 -1 -0.4287464124819 -0.5 -0.5 367232 1
i 3 153.34242837653477 2 10 68 -1 -0.12915757452748 -0.5 -0.5 367232 1
i 4 153.34242837653477 2 8.58333333333333 68 -1 -0.40318179249351 -0.5 -0.5 367232 1
i 5 153.34242837653477 2 8.58333333333333 68 -1 -0.23815152135737 -0.5 -0.5 367232 1
i 6 153.34242837653477 2 9.25 68 -1 0.09107407492289 -0.5 -0.5 367232 1
i 5 153.34242837653477 2 9.75 68 -1 -0.41411551025646 -0.5 -0.5 367232 1
i 6 153.34242837653477 2 10.33333333333333 68 -1 0.3219622204711 -0.5 -0.5 367232 1
i 4 153.34242837653477 2 8.91666666666667 68 -1 -0.32104837151709 -0.5 -0.5 367232 1
i 3 153.61527967257842 2 7.66666666666667 68 -1 -0.48851652180521 -0.5 -0.5 2869 1
i 4 153.61527967257842 2 6.33333333333333 68 -1 -0.02964377574778 -0.5 -0.5 2869 1
i 3 153.61527967257842 2 10 68 -1 -0.04372970161013 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 10 68 -1 -0.29728546482583 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 10.58333333333333 68 -1 0.18286715972028 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 11.25 68 -1 0.21647125039938 -0.5 -0.5 367232 1
i 5 153.61527967257842 2 11.75 68 -1 0.13379474884192 -0.5 -0.5 367232 1
i 3 153.61527967257842 2 10.33333333333333 68 -1 -0.2059253191317 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 8.91666666666667 68 -1 -0.04132019967095 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 9.25 68 -1 -0.10767201401772 -0.5 -0.5 367232 1
i 4 153.61527967257842 2 8.91666666666667 68 -1 -0.36007177639164 -0.5 -0.5 367232 1
i 3 153.88813096862208 2 7.66666666666667 68 -1 -0.47019592980657 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.33333333333333 68 -1 0.47069742338072 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.66666666666667 68 -1 -0.26785470614504 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 6.33333333333333 68 -1 0.28277317683982 -0.5 -0.5 2869 1
i 4 153.88813096862208 2 10.33333333333333 68 -1 -0.41791596689603 -0.5 -0.5 367232 1
i 3 153.88813096862208 2 10.58333333333333 68 -1 0.26423011220206 -0.5 -0.5 367232 1
i 3 153.88813096862208 2 10.33333333333333 68 -1 0.48912378635368 -0.5 -0.5 367232 1
i 4 153.88813096862208 2 8.91666666666667 68 -1 0.4160755024605 -0.5 -0.5 367232 1
i 4 153.88813096862208 2 8.58333333333333 68 -1 0.25280786514126 -0.5 -0.5 367232 1
i 3 154.16098226466576 2 7.66666666666667 68 -1 -0.3713352888982 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 8 68 -1 0.26547909968909 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 7.66666666666667 68 -1 -0.39752886291753 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 6.33333333333333 68 -1 -0.07333467910407 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 6.33333333333333 68 -1 -0.11332112537385 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 6.91666666666667 68 -1 0.125479948437 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 7.41666666666667 68 -1 0.04077640941894 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 8 68 -1 0.23368180070707 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 6.33333333333333 68 -1 0.35642777482239 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 6.91666666666667 68 -1 -0.33707899131952 -0.5 -0.5 2869 1
i 6 154.16098226466576 2 7.41666666666667 68 -1 0.47741723288753 -0.5 -0.5 2869 1
i 5 154.16098226466576 2 8 68 -1 -0.49464933071522 -0.5 -0.5 2869 1
i 4 154.16098226466576 2 6.66666666666667 68 -1 -0.3928626357986 -0.5 -0.5 2869 1
i 3 154.16098226466576 2 10.33333333333333 68 -1 -0.24548904800456 -0.5 -0.5 367232 1
i 3 154.16098226466576 2 10 68 -1 0.37500987047641 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.58333333333333 68 -1 0.38695713684719 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.91666666666667 68 -1 0.05105578223406 -0.5 -0.5 367232 1
i 4 154.16098226466576 2 8.58333333333333 68 -1 -0.48675951843779 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 7.66666666666667 68 -1 0.45281784381795 -0.5 -0.5 2869 1
i 5 154.43383356070942 2 7.66666666666667 68 -1 -0.19908486597739 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 8.33333333333333 68 -1 -0.49469364485102 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 8.75 68 -1 -0.12743574900008 -0.5 -0.5 2869 1
i 5 154.43383356070942 2 9.41666666666667 68 -1 -0.29021469673256 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 6.66666666666667 68 -1 -0.15844360149514 -0.5 -0.5 2869 1
i 4 154.43383356070942 2 10 68 -1 0.02078184941176 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 10.33333333333333 68 -1 -0.22397781739137 -0.5 -0.5 367232 1
i 3 154.43383356070942 2 10 68 -1 -0.43445781775432 -0.5 -0.5 367232 1
i 4 154.43383356070942 2 8.58333333333333 68 -1 0.19993886208838 -0.5 -0.5 367232 1
i 4 154.70668485675307 2 6.66666666666667 68 -1 0.18606024088277 -0.5 -0.5 2869 1
i 4 154.70668485675307 2 6.91666666666667 68 -1 0.21112474712307 -0.5 -0.5 2869 1
i 4 154.70668485675307 2 6.66666666666667 68 -1 0.39944540433167 -0.5 -0.5 2869 1
i 3 154.70668485675307 2 10 68 -1 0.37163194829557 -0.5 -0.5 367232 1
i 4 154.70668485675307 2 8.58333333333333 68 -1 -0.11001562919326 -0.5 -0.5 367232 1
i 3 154.97953615279673 2 8 68 -1 0.33711549483141 -0.5 -0.5 2869 1
i 3 154.97953615279673 2 8.33333333333333 68 -1 -0.2958028107638 -0.5 -0.5 2869 1
i 4 154.97953615279673 2 8 68 -1 0.14731796202136 -0.5 -0.5 2869 1
i 4 154.97953615279673 2 6.66666666666667 68 -1 -0.39058115027947 -0.5 -0.5 2869 1
i 5 154.97953615279673 2 6.66666666666667 68 -1 -0.29023446545098 -0.5 -0.5 2869 1
i 5 154.97953615279673 2 7.33333333333333 68 -1 -0.1198645817388 -0.5 -0.5 2869 1
i 5 154.97953615279673 2 7.66666666666667 68 -1 -0.05681999125861 -0.5 -0.5 2869 1
i 6 154.97953615279673 2 8.33333333333333 68 -1 -0.1307231923297 -0.5 -0.5 2869 1
i 4 154.97953615279673 2 6.91666666666667 68 -1 0.41527507072979 -0.5 -0.5 2869 1
i 3 154.97953615279673 2 10 68 -1 -0.42939370770177 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.58333333333333 68 -1 0.04278690713005 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.91666666666667 68 -1 -0.05768027698055 -0.5 -0.5 367232 1
i 4 154.97953615279673 2 8.58333333333333 68 -1 -0.44576437014786 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 8 68 -1 0.15252537539785 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 6.91666666666667 68 -1 -0.34315034248025 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 7.33333333333333 68 -1 -0.30138373400206 -0.5 -0.5 2869 1
i 4 155.25238744884038 2 6.91666666666667 68 -1 0.48785892849078 -0.5 -0.5 2869 1
i 3 155.25238744884038 2 10 68 -1 0.07322225230007 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 10.33333333333333 68 -1 0.09718526682932 -0.5 -0.5 367232 1
i 3 155.25238744884038 2 10 68 -1 0.41716965767856 -0.5 -0.5 367232 1
i 4 155.25238744884038 2 8.58333333333333 68 -1 0.37831812551382 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 8.58333333333333 68 -1 -0.1915364741094 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 9.25 68 -1 -0.09205053392569 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 9.75 68 -1 -0.33842050230871 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 10.33333333333333 68 -1 -0.15766185038002 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 8.58333333333333 68 -1 -0.13744147118739 -0.5 -0.5 367232 1
i 5 155.25238744884038 2 9.25 68 -1 -0.48773348159284 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 9.75 68 -1 0.39381660181042 -0.5 -0.5 367232 1
i 6 155.25238744884038 2 10.33333333333333 68 -1 -0.35812904650565 -0.5 -0.5 367232 1
i 4 155.25238744884038 2 8.91666666666667 68 -1 -0.23354264378263 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 6.91666666666667 68 -1 0.39310566080778 -0.5 -0.5 2869 1
i 4 155.52523874488404 2 6.66666666666667 68 -1 0.27387605655414 -0.5 -0.5 2869 1
i 3 155.52523874488404 2 10 68 -1 0.13565582899921 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 10 68 -1 -0.27437281051446 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 10.58333333333333 68 -1 0.13232211663587 -0.5 -0.5 367232 1
i 5 155.52523874488404 2 11.25 68 -1 0.45990447239934 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 11.75 68 -1 0.11778761661872 -0.5 -0.5 367232 1
i 4 155.52523874488404 2 8.91666666666667 68 -1 0.25240535110115 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 6.66666666666667 68 -1 -0.44263705601221 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 6.91666666666667 68 -1 -0.0747177731692 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 6.66666666666667 68 -1 -0.33403082428698 -0.5 -0.5 2869 1
i 4 155.7980900409277 2 8.91666666666667 68 -1 0.32118506919255 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 9.25 68 -1 0.23352601430963 -0.5 -0.5 367232 1
i 4 155.7980900409277 2 8.91666666666667 68 -1 0.45360132979144 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 6.66666666666667 68 -1 -0.0928036541122 -0.5 -0.5 2869 1
i 4 156.07094133697134 2 10.33333333333333 68 -1 0.04871765350369 -0.5 -0.5 367232 1
i 3 156.07094133697134 2 10.58333333333333 68 -1 -0.39290403135748 -0.5 -0.5 367232 1
i 3 156.07094133697134 2 10.33333333333333 68 -1 0.48844432956998 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 8.91666666666667 68 -1 -0.3066134766505 -0.5 -0.5 367232 1
i 5 156.07094133697134 2 8.91666666666667 68 -1 -0.39709910687379 -0.5 -0.5 367232 1
i 6 156.07094133697134 2 9.5 68 -1 0.32855518342035 -0.5 -0.5 367232 1
i 5 156.07094133697134 2 10 68 -1 -0.05290658117827 -0.5 -0.5 367232 1
i 6 156.07094133697134 2 10.58333333333333 68 -1 -0.35974193974837 -0.5 -0.5 367232 1
i 4 156.07094133697134 2 9.25 68 -1 -0.08050687770493 -0.5 -0.5 367232 1
i 4 156.343792633015 2 6.66666666666667 68 -1 0.22267792914218 -0.5 -0.5 2869 1
i 3 156.343792633015 2 10.33333333333333 68 -1 0.05865006656894 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.25 68 -1 0.31297781462746 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.5 68 -1 -0.31626453718223 -0.5 -0.5 367232 1
i 4 156.343792633015 2 9.25 68 -1 0.22932125151967 -0.5 -0.5 367232 1
i 4 156.61664392905865 2 6.66666666666667 68 -1 0.42592085591257 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 6.91666666666667 68 -1 0.17098183745171 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 6.66666666666667 68 -1 0.21815741111744 -0.5 -0.5 2869 1
i 4 156.61664392905865 2 9.25 68 -1 0.21958651574768 -0.5 -0.5 367232 1
i 4 156.61664392905865 2 8.91666666666667 68 -1 -0.29644183374078 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 6.66666666666667 68 -1 0.3613569546201 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 6.66666666666667 68 -1 0.21896268337719 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 7.33333333333333 68 -1 0.29458787171164 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 7.66666666666667 68 -1 0.16432862774952 -0.5 -0.5 2869 1
i 6 156.8894952251023 2 8.33333333333333 68 -1 0.19288711082925 -0.5 -0.5 2869 1
i 4 156.8894952251023 2 6.33333333333333 68 -1 -0.16197541768684 -0.5 -0.5 2869 1
i 4 156.8894952251023 2 8.91666666666667 68 -1 -0.3383294076045 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 9.25 68 -1 0.38707395656027 -0.5 -0.5 367232 1
i 4 156.8894952251023 2 8.91666666666667 68 -1 -0.41227756338098 -0.5 -0.5 367232 1
i 4 157.16234652114596 2 6.33333333333333 68 -1 0.08699767541731 -0.5 -0.5 2869 1
i 4 157.16234652114596 2 8.91666666666667 68 -1 -0.32037208705358 -0.5 -0.5 367232 1
i 4 157.43519781718962 2 6.33333333333333 68 -1 0.28295568091761 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 6.66666666666667 68 -1 -0.13827874562718 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 6.33333333333333 68 -1 0.32012971535398 -0.5 -0.5 2869 1
i 4 157.43519781718962 2 8.91666666666667 68 -1 -0.23008624604275 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 6.33333333333333 68 -1 -0.36368009134887 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 6.33333333333333 68 -1 0.44832427502695 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 6.91666666666667 68 -1 -0.06730321574338 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 7.41666666666667 68 -1 0.16620382821693 -0.5 -0.5 2869 1
i 6 157.70804911323327 2 8 68 -1 0.20595987980421 -0.5 -0.5 2869 1
i 4 157.70804911323327 2 6.66666666666667 68 -1 -0.1375566104344 -0.5 -0.5 2869 1
i 4 157.70804911323327 2 8.91666666666667 68 -1 0.02768035829264 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 9.25 68 -1 -0.44681963157754 -0.5 -0.5 367232 1
i 4 157.70804911323327 2 8.91666666666667 68 -1 -0.41197870902682 -0.5 -0.5 367232 1
i 4 157.98090040927693 2 6.66666666666667 68 -1 0.36783446238984 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 6.91666666666667 68 -1 0.03878316699351 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 6.66666666666667 68 -1 0.41797356114195 -0.5 -0.5 2869 1
i 4 157.98090040927693 2 8.91666666666667 68 -1 -0.44943438346896 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 8.91666666666667 68 -1 -0.46553236682826 -0.5 -0.5 367232 1
i 6 157.98090040927693 2 9.5 68 -1 0.33227034491153 -0.5 -0.5 367232 1
i 5 157.98090040927693 2 10 68 -1 0.13843064053014 -0.5 -0.5 367232 1
i 5 157.98090040927693 2 10.58333333333333 68 -1 -0.4568752928156 -0.5 -0.5 367232 1
i 4 157.98090040927693 2 8.58333333333333 68 -1 -0.1038942744544 -0.5 -0.5 367232 1
i 4 158.2537517053206 2 6.66666666666667 68 -1 -0.43796820080409 -0.5 -0.5 2869 1
i 4 158.2537517053206 2 6.33333333333333 68 -1 0.36530438941958 -0.5 -0.5 2869 1
i 4 158.2537517053206 2 8.58333333333333 68 -1 0.08071420739808 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 6.33333333333333 68 -1 -0.2197881456887 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 6.66666666666667 68 -1 -0.14307334582679 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 6.33333333333333 68 -1 -0.24055469353651 -0.5 -0.5 2869 1
i 4 158.52660300136426 2 8.58333333333333 68 -1 -0.08607486626359 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 8.91666666666667 68 -1 0.09422576720871 -0.5 -0.5 367232 1
i 4 158.52660300136426 2 8.58333333333333 68 -1 0.15723621157594 -0.5 -0.5 367232 1
i 4 158.79945429740792 2 6.33333333333333 68 -1 -0.19101090573782 -0.5 -0.5 2869 1
i 4 158.79945429740792 2 8.58333333333333 68 -1 0.24388376056902 -0.5 -0.5 367232 1
i 6 158.79945429740792 2 8.58333333333333 68 -1 0.47145704204049 -0.5 -0.5 367232 1
i 5 158.79945429740792 2 9.25 68 -1 0.02821967948189 -0.5 -0.5 367232 1
i 6 158.79945429740792 2 9.75 68 -1 -0.30809584168917 -0.5 -0.5 367232 1
i 5 158.79945429740792 2 10.33333333333333 68 -1 0.09366993373658 -0.5 -0.5 367232 1
i 4 158.79945429740792 2 8.91666666666667 68 -1 0.00242301039643 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 6.33333333333333 68 -1 0.07131808538307 -0.5 -0.5 2869 1
i 4 159.07230559345157 2 8.91666666666667 68 -1 0.04884235646555 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 9.25 68 -1 0.23633854913832 -0.5 -0.5 367232 1
i 4 159.07230559345157 2 8.91666666666667 68 -1 0.10348829343801 -0.5 -0.5 367232 1
i 4 159.34515688949523 2 6.33333333333333 68 -1 -0.03494065903179 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 6.66666666666667 68 -1 0.16432716736075 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 6.33333333333333 68 -1 0.27302815283574 -0.5 -0.5 2869 1
i 4 159.34515688949523 2 8.91666666666667 68 -1 -0.17508843438464 -0.5 -0.5 367232 1
i 4 159.34515688949523 2 8.58333333333333 68 -1 0.1477141930499 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 6.33333333333333 68 -1 0.30617241735745 -0.5 -0.5 2869 1
i 5 159.61800818553888 2 6.33333333333333 68 -1 -0.28707274794543 -0.5 -0.5 2869 1
i 6 159.61800818553888 2 6.91666666666667 68 -1 -0.33630974373576 -0.5 -0.5 2869 1
i 6 159.61800818553888 2 7.41666666666667 68 -1 -0.2325840012984 -0.5 -0.5 2869 1
i 5 159.61800818553888 2 8 68 -1 -0.0611443891491 -0.5 -0.5 2869 1
i 4 159.61800818553888 2 8.58333333333333 68 -1 0.11225249654449 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 8.91666666666667 68 -1 -0.43975816674232 -0.5 -0.5 367232 1
i 4 159.61800818553888 2 8.58333333333333 68 -1 0.12942623018589 -0.5 -0.5 367232 1
i 4 159.89085948158254 2 6.33333333333333 68 -1 0.23152930432665 -0.5 -0.5 2869 1
i 4 159.89085948158254 2 8.58333333333333 68 -1 -0.03371870635636 -0.5 -0.5 367232 1
i 4 160.1637107776262 2 6.33333333333333 68 -1 0.42365455854537 -0.5 -0.5 2869 1
i 4 160.1637107776262 2 8.58333333333333 68 -1 -0.3762580694196 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 6.33333333333333 68 -1 -0.28630305191865 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 6.66666666666667 68 -1 0.31847410314603 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 6.33333333333333 68 -1 0.30081757542372 -0.5 -0.5 2869 1
i 4 160.43656207366985 2 8.58333333333333 68 -1 -0.27703917890793 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 8.91666666666667 68 -1 -0.09316612147924 -0.5 -0.5 367232 1
i 4 160.43656207366985 2 8.58333333333333 68 -1 0.09511675966957 -0.5 -0.5 367232 1
i 4 160.7094133697135 2 6.33333333333333 68 -1 0.11480496601661 -0.5 -0.5 2869 1
i 5 160.7094133697135 2 6.33333333333333 68 -1 0.46065632195788 -0.5 -0.5 2869 1
i 6 160.7094133697135 2 6.91666666666667 68 -1 -0.13456349873936 -0.5 -0.5 2869 1
i 6 160.7094133697135 2 7.41666666666667 68 -1 -0.36242177662863 -0.5 -0.5 2869 1
i 6 160.7094133697135 2 8 68 -1 0.49183385145827 -0.5 -0.5 2869 1
i 4 160.7094133697135 2 6.66666666666667 68 -1 0.32715595388403 -0.5 -0.5 2869 1
i 4 160.7094133697135 2 8.58333333333333 68 -1 0.12182582112595 -0.5 -0.5 367232 1
i 6 160.7094133697135 2 8.58333333333333 68 -1 0.18549138410062 -0.5 -0.5 367232 1
i 6 160.7094133697135 2 9.25 68 -1 0.35376957978622 -0.5 -0.5 367232 1
i 5 160.7094133697135 2 9.75 68 -1 -0.15027737118819 -0.5 -0.5 367232 1
i 5 160.7094133697135 2 10.33333333333333 68 -1 0.47978675693409 -0.5 -0.5 367232 1
i 4 160.98226466575716 2 6.66666666666667 68 -1 -0.37476651561321 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 6.91666666666667 68 -1 -0.32387248231564 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 6.66666666666667 68 -1 0.28983144389683 -0.5 -0.5 2869 1
i 4 160.98226466575716 2 8.58333333333333 68 -1 0.12234058509018 -0.5 -0.5 367232 1
i 4 161.2551159618008 2 6.66666666666667 68 -1 -0.22302020134083 -0.5 -0.5 2869 1
i 4 161.2551159618008 2 6.33333333333333 68 -1 -0.1985999678974 -0.5 -0.5 2869 1
i 4 161.2551159618008 2 8.58333333333333 68 -1 -0.41192401635157 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 6.33333333333333 68 -1 -0.25301764532883 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 6.66666666666667 68 -1 -0.10747617746941 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 6.33333333333333 68 -1 0.29244819416339 -0.5 -0.5 2869 1
i 4 161.52796725784447 2 8.58333333333333 68 -1 0.05651698312833 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 8.91666666666667 68 -1 -0.04650546393747 -0.5 -0.5 367232 1
i 4 161.52796725784447 2 8.58333333333333 68 -1 0.08105048282385 -0.5 -0.5 367232 1
i 4 161.80081855388812 2 6.33333333333333 68 -1 -0.21530878195009 -0.5 -0.5 2869 1
i 4 161.80081855388812 2 8.58333333333333 68 -1 0.38031349429126 -0.5 -0.5 367232 1
i 5 161.80081855388812 2 8.58333333333333 68 -1 0.13808300604733 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 9.25 68 -1 0.29842419415037 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 9.75 68 -1 -0.39628201492322 -0.5 -0.5 367232 1
i 6 161.80081855388812 2 10.33333333333333 68 -1 -0.01095659126918 -0.5 -0.5 367232 1
i 4 161.80081855388812 2 8.91666666666667 68 -1 -0.15698548600962 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 6.33333333333333 68 -1 -0.42278284909801 -0.5 -0.5 2869 1
i 4 162.07366984993178 2 8.91666666666667 68 -1 0.22182897830677 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 9.25 68 -1 0.04295630186162 -0.5 -0.5 367232 1
i 4 162.07366984993178 2 8.91666666666667 68 -1 -0.21845537609931 -0.5 -0.5 367232 1
i 4 162.34652114597546 2 6.33333333333333 68 -1 0.49137715720956 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 6.66666666666667 68 -1 -0.47456324049209 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 6.33333333333333 68 -1 -0.00315168236941 -0.5 -0.5 2869 1
i 4 162.34652114597546 2 8.91666666666667 68 -1 0.36096721552929 -0.5 -0.5 367232 1
i 4 162.34652114597546 2 8.58333333333333 68 -1 0.19324497247772 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 6.33333333333333 68 -1 0.44183216960253 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 6.33333333333333 68 -1 -0.26654399971518 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 6.91666666666667 68 -1 -0.45157965335516 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 7.41666666666667 68 -1 0.00835059073166 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 8 68 -1 0.33041518885067 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 6.33333333333333 68 -1 -0.02784090203613 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 6.91666666666667 68 -1 0.49632651078185 -0.5 -0.5 2869 1
i 5 162.6193724420191 2 7.41666666666667 68 -1 0.37663376680018 -0.5 -0.5 2869 1
i 6 162.6193724420191 2 8 68 -1 -0.27267524195483 -0.5 -0.5 2869 1
i 4 162.6193724420191 2 6 68 -1 -0.13869615608981 -0.5 -0.5 2869 1
i 4 162.6193724420191 2 8.58333333333333 68 -1 -0.26604805865214 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 8.91666666666667 68 -1 -0.36138848035685 -0.5 -0.5 367232 1
i 4 162.6193724420191 2 8.58333333333333 68 -1 -0.23349339034335 -0.5 -0.5 367232 1
i 4 162.89222373806277 2 6 68 -1 0.18569223200085 -0.5 -0.5 2869 1
i 4 162.89222373806277 2 8.58333333333333 68 -1 -0.19819049157795 -0.5 -0.5 367232 1
i 4 163.16507503410642 2 6 68 -1 0.04802792971656 -0.5 -0.5 2869 1
i 4 163.16507503410642 2 8.58333333333333 68 -1 -0.07306153563335 -0.5 -0.5 367232 1
i 3 163.43792633015008 2 8 68 -1 0.03207734666511 -0.5 -0.5 2869 1
i 3 163.43792633015008 2 8.33333333333333 68 -1 -0.29475687946796 -0.5 -0.5 2869 1
i 3 163.43792633015008 2 8 68 -1 0.10968565696205 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6 68 -1 -0.43630044836836 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6.33333333333333 68 -1 0.36453147769243 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 6 68 -1 0.29240534140373 -0.5 -0.5 2869 1
i 4 163.43792633015008 2 8.58333333333333 68 -1 -0.20860502818332 -0.5 -0.5 367232 1
i 4 163.43792633015008 2 8.91666666666667 68 -1 0.2064854924213 -0.5 -0.5 367232 1
i 4 163.43792633015008 2 8.58333333333333 68 -1 -0.37019947167864 -0.5 -0.5 367232 1
i 3 163.71077762619373 2 8 68 -1 0.2218871146298 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 6 68 -1 -0.38296395048487 -0.5 -0.5 2869 1
i 5 163.71077762619373 2 6 68 -1 -0.26871520223656 -0.5 -0.5 2869 1
i 5 163.71077762619373 2 6.66666666666667 68 -1 0.43421213657632 -0.5 -0.5 2869 1
i 6 163.71077762619373 2 7.16666666666667 68 -1 -0.17187575322649 -0.5 -0.5 2869 1
i 6 163.71077762619373 2 7.66666666666667 68 -1 0.23959466972647 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 6.33333333333333 68 -1 -0.48626693291882 -0.5 -0.5 2869 1
i 4 163.71077762619373 2 8.58333333333333 68 -1 0.25030357128181 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 8.58333333333333 68 -1 0.18845838166601 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 9.25 68 -1 -0.36448021857071 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 9.75 68 -1 -0.10635579745543 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 10.33333333333333 68 -1 0.08955053502663 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 8.58333333333333 68 -1 -0.25689094232824 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 9.25 68 -1 0.0975409917947 -0.5 -0.5 367232 1
i 6 163.71077762619373 2 9.75 68 -1 0.27223010647797 -0.5 -0.5 367232 1
i 5 163.71077762619373 2 10.33333333333333 68 -1 -0.48772842271686 -0.5 -0.5 367232 1
i 4 163.71077762619373 2 8.33333333333333 68 -1 -0.34689991652306 -0.5 -0.5 367232 1
i 4 163.9836289222374 2 6.33333333333333 68 -1 -0.31408394888863 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 6.66666666666667 68 -1 0.15240752660215 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 6.33333333333333 68 -1 -0.02139009514741 -0.5 -0.5 2869 1
i 4 163.9836289222374 2 8.33333333333333 68 -1 -0.01421376919983 -0.5 -0.5 367232 1
i 4 164.25648021828104 2 6.33333333333333 68 -1 -0.34900939704498 -0.5 -0.5 2869 1
i 4 164.25648021828104 2 6 68 -1 -0.43260652643696 -0.5 -0.5 2869 1
i 4 164.25648021828104 2 8.33333333333333 68 -1 -0.12227424233811 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 6 68 -1 -0.35030250957622 -0.5 -0.5 2869 1
i 4 164.5293315143247 2 6.33333333333333 68 -1 -0.07297279431129 -0.5 -0.5 2869 1
i 4 164.5293315143247 2 6 68 -1 0.19594237358279 -0.5 -0.5 2869 1
i 3 164.5293315143247 2 10.33333333333333 68 -1 0.4698268243772 -0.5 -0.5 367232 1
i 3 164.5293315143247 2 10.58333333333333 68 -1 0.28384123598158 -0.5 -0.5 367232 1
i 3 164.5293315143247 2 10.33333333333333 68 -1 -0.11828445715196 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.33333333333333 68 -1 -0.36770435945332 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.58333333333333 68 -1 -0.30989013884932 -0.5 -0.5 367232 1
i 4 164.5293315143247 2 8.33333333333333 68 -1 -0.16945361874921 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 6 68 -1 -0.4077108540249 -0.5 -0.5 2869 1
i 3 164.80218281036835 2 10.33333333333333 68 -1 0.24939085497382 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 8.33333333333333 68 -1 0.12164273076867 -0.5 -0.5 367232 1
i 6 164.80218281036835 2 8.33333333333333 68 -1 -0.49951558706969 -0.5 -0.5 367232 1
i 5 164.80218281036835 2 8.91666666666667 68 -1 0.11664484954673 -0.5 -0.5 367232 1
i 6 164.80218281036835 2 9.5 68 -1 0.20687452574686 -0.5 -0.5 367232 1
i 6 164.80218281036835 2 10 68 -1 -0.28720692128966 -0.5 -0.5 367232 1
i 4 164.80218281036835 2 8.58333333333333 68 -1 -0.40588404462222 -0.5 -0.5 367232 1
i 4 165.075034106412 2 6 68 -1 0.19074449290327 -0.5 -0.5 2869 1
i 4 165.075034106412 2 8.58333333333333 68 -1 0.39066750889122 -0.5 -0.5 367232 1
i 4 165.075034106412 2 8.91666666666667 68 -1 0.02046853626201 -0.5 -0.5 367232 1
i 4 165.075034106412 2 8.58333333333333 68 -1 0.31460039551279 -0.5 -0.5 367232 1
i 4 165.34788540245566 2 6 68 -1 -0.11568996393817 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 6.33333333333333 68 -1 -0.05284387975873 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 6 68 -1 0.28923895369943 -0.5 -0.5 2869 1
i 4 165.34788540245566 2 8.58333333333333 68 -1 -0.34311965548617 -0.5 -0.5 367232 1
i 4 165.34788540245566 2 8.33333333333333 68 -1 0.15668444102984 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 6 68 -1 0.12755239698656 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 6 68 -1 0.46378045684214 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 6.66666666666667 68 -1 0.37026693080309 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.16666666666667 68 -1 0.15735077114274 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.66666666666667 68 -1 -0.12211231955853 -0.5 -0.5 2869 1
i 5 165.62073669849931 2 6 68 -1 0.35679640143988 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 6.66666666666667 68 -1 0.47398348671395 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.16666666666667 68 -1 -0.11000844929432 -0.5 -0.5 2869 1
i 6 165.62073669849931 2 7.66666666666667 68 -1 0.1927823497689 -0.5 -0.5 2869 1
i 4 165.62073669849931 2 6.33333333333333 68 -1 0.33036369562379 -0.5 -0.5 2869 1
i 4 165.62073669849931 2 8.33333333333333 68 -1 0.41587786995178 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 8.58333333333333 68 -1 -0.41142937073978 -0.5 -0.5 367232 1
i 4 165.62073669849931 2 8.33333333333333 68 -1 0.4628368565772 -0.5 -0.5 367232 1
i 4 165.89358799454297 2 6.33333333333333 68 -1 -0.32974548939962 -0.5 -0.5 2869 1
i 4 165.89358799454297 2 8.33333333333333 68 -1 0.04137543467673 -0.5 -0.5 367232 1
i 4 166.16643929058662 2 6.33333333333333 68 -1 -0.28859964884836 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 6.66666666666667 68 -1 -0.37830481668613 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 6.33333333333333 68 -1 0.26422258625027 -0.5 -0.5 2869 1
i 4 166.16643929058662 2 8.33333333333333 68 -1 -0.3257133981302 -0.5 -0.5 367232 1
i 3 166.4392905866303 2 7.66666666666667 68 -1 0.47832073659347 -0.5 -0.5 2869 1
i 3 166.4392905866303 2 8 68 -1 0.12614652049991 -0.5 -0.5 2869 1
i 3 166.4392905866303 2 7.66666666666667 68 -1 -0.17005791004776 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 6.33333333333333 68 -1 0.37584743604881 -0.5 -0.5 2869 1
i 6 166.4392905866303 2 6.33333333333333 68 -1 0.37197017947721 -0.5 -0.5 2869 1
i 6 166.4392905866303 2 6.91666666666667 68 -1 -0.04405532099627 -0.5 -0.5 2869 1
i 6 166.4392905866303 2 7.41666666666667 68 -1 0.30524527381641 -0.5 -0.5 2869 1
i 5 166.4392905866303 2 8 68 -1 -0.42728193228612 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 6.66666666666667 68 -1 -0.39645638759337 -0.5 -0.5 2869 1
i 4 166.4392905866303 2 8.33333333333333 68 -1 0.36476453778741 -0.5 -0.5 367232 1
i 4 166.4392905866303 2 8.58333333333333 68 -1 -0.28363312626637 -0.5 -0.5 367232 1
i 4 166.4392905866303 2 8.33333333333333 68 -1 0.25836925953438 -0.5 -0.5 367232 1
i 3 166.71214188267396 2 7.66666666666667 68 -1 -0.25991205866798 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.66666666666667 68 -1 -0.48366199412345 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.91666666666667 68 -1 -0.26882228414796 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 6.66666666666667 68 -1 0.40907561179993 -0.5 -0.5 2869 1
i 4 166.71214188267396 2 8.33333333333333 68 -1 -0.24127820627035 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 8.33333333333333 68 -1 -0.4526102768191 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 8.91666666666667 68 -1 0.23001846201869 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 9.5 68 -1 0.31660648143384 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 10 68 -1 -0.4856282799545 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 8.33333333333333 68 -1 -0.17979579643253 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 8.91666666666667 68 -1 0.36994261455093 -0.5 -0.5 367232 1
i 6 166.71214188267396 2 9.5 68 -1 -0.10851068323762 -0.5 -0.5 367232 1
i 5 166.71214188267396 2 10 68 -1 0.16933201017865 -0.5 -0.5 367232 1
i 4 166.71214188267396 2 8.58333333333333 68 -1 0.09842675238604 -0.5 -0.5 367232 1
i 4 166.98499317871762 2 6.66666666666667 68 -1 -0.32880950378796 -0.5 -0.5 2869 1
i 4 166.98499317871762 2 6.33333333333333 68 -1 0.47134733632691 -0.5 -0.5 2869 1
i 4 166.98499317871762 2 8.58333333333333 68 -1 0.28261548471682 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 6.33333333333333 68 -1 0.13184755510486 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 6.66666666666667 68 -1 0.14987459735431 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 6.33333333333333 68 -1 0.15244898348114 -0.5 -0.5 2869 1
i 4 167.25784447476127 2 8.58333333333333 68 -1 0.26162143352152 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 8.91666666666667 68 -1 0.17512698420553 -0.5 -0.5 367232 1
i 4 167.25784447476127 2 8.58333333333333 68 -1 0.41955994228522 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 6.33333333333333 68 -1 0.40640040989672 -0.5 -0.5 2869 1
i 3 167.53069577080493 2 10 68 -1 -0.0457200057444 -0.5 -0.5 367232 1
i 3 167.53069577080493 2 10.33333333333333 68 -1 -0.2391903571652 -0.5 -0.5 367232 1
i 3 167.53069577080493 2 10 68 -1 -0.16342972298333 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 8.58333333333333 68 -1 0.09668525678672 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 8.58333333333333 68 -1 -0.2833811103793 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 9.25 68 -1 -0.17614052050514 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 9.75 68 -1 -0.1825579264058 -0.5 -0.5 367232 1
i 6 167.53069577080493 2 10.33333333333333 68 -1 0.32989715812728 -0.5 -0.5 367232 1
i 4 167.53069577080493 2 8.91666666666667 68 -1 -0.48506637563328 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 6.33333333333333 68 -1 -0.34858754382001 -0.5 -0.5 2869 1
i 3 167.80354706684858 2 10 68 -1 -0.14169786658126 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 8.91666666666667 68 -1 0.03405886743237 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 9.25 68 -1 -0.14881724642624 -0.5 -0.5 367232 1
i 4 167.80354706684858 2 8.91666666666667 68 -1 -0.40670142896446 -0.5 -0.5 367232 1
i 4 168.07639836289223 2 6.33333333333333 68 -1 -0.35387622103906 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 6.66666666666667 68 -1 0.31202417520218 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 6.33333333333333 68 -1 0.49773651514742 -0.5 -0.5 2869 1
i 4 168.07639836289223 2 8.91666666666667 68 -1 0.04201630443608 -0.5 -0.5 367232 1
i 4 168.07639836289223 2 8.58333333333333 68 -1 -0.09574612487313 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 6.33333333333333 68 -1 -0.255531558055 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 6.33333333333333 68 -1 0.49042059734543 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 6.91666666666667 68 -1 0.04663049351827 -0.5 -0.5 2869 1
i 6 168.3492496589359 2 7.41666666666667 68 -1 0.45934385845919 -0.5 -0.5 2869 1
i 5 168.3492496589359 2 8 68 -1 0.28225865591813 -0.5 -0.5 2869 1
i 4 168.3492496589359 2 6 68 -1 0.03827083389739 -0.5 -0.5 2869 1
i 4 168.3492496589359 2 8.58333333333333 68 -1 0.07293290548859 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 8.91666666666667 68 -1 0.47408568562035 -0.5 -0.5 367232 1
i 4 168.3492496589359 2 8.58333333333333 68 -1 -0.40393406896635 -0.5 -0.5 367232 1
i 4 168.62210095497954 2 6 68 -1 0.25252927863579 -0.5 -0.5 2869 1
i 4 168.62210095497954 2 8.58333333333333 68 -1 -0.40778175738025 -0.5 -0.5 367232 1
i 4 168.8949522510232 2 6 68 -1 0.43712989589333 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 6.33333333333333 68 -1 -0.29633484319579 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 6 68 -1 -0.33309131422907 -0.5 -0.5 2869 1
i 4 168.8949522510232 2 8.58333333333333 68 -1 0.24579797082062 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 6 68 -1 -0.06224550765361 -0.5 -0.5 2869 1
i 5 169.16780354706685 2 6 68 -1 0.29009841298236 -0.5 -0.5 2869 1
i 6 169.16780354706685 2 6.66666666666667 68 -1 -0.42662461793381 -0.5 -0.5 2869 1
i 6 169.16780354706685 2 7.16666666666667 68 -1 0.20014714040639 -0.5 -0.5 2869 1
i 6 169.16780354706685 2 7.66666666666667 68 -1 0.31868044779527 -0.5 -0.5 2869 1
i 4 169.16780354706685 2 6.33333333333333 68 -1 0.2381860375459 -0.5 -0.5 2869 1
i 4 169.16780354706685 2 8.58333333333333 68 -1 -0.07737594912345 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 8.91666666666667 68 -1 0.42128305270766 -0.5 -0.5 367232 1
i 4 169.16780354706685 2 8.58333333333333 68 -1 -0.29277675495604 -0.5 -0.5 367232 1
i 4 169.4406548431105 2 6.33333333333333 68 -1 -0.46940424005904 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 6.66666666666667 68 -1 0.2683757196465 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 6.33333333333333 68 -1 0.1501943177692 -0.5 -0.5 2869 1
i 4 169.4406548431105 2 8.58333333333333 68 -1 0.4696448784849 -0.5 -0.5 367232 1
i 5 169.4406548431105 2 8.58333333333333 68 -1 0.46474064117708 -0.5 -0.5 367232 1
i 5 169.4406548431105 2 9.25 68 -1 -0.2856397147789 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 9.75 68 -1 0.49767183014878 -0.5 -0.5 367232 1
i 6 169.4406548431105 2 10.33333333333333 68 -1 0.10150070726283 -0.5 -0.5 367232 1
i 4 169.4406548431105 2 8.33333333333333 68 -1 -0.44262370388759 -0.5 -0.5 367232 1
i 4 169.71350613915416 2 6.33333333333333 68 -1 -0.40025208394938 -0.5 -0.5 2869 1
i 4 169.71350613915416 2 6 68 -1 0.38095336660318 -0.5 -0.5 2869 1
i 4 169.71350613915416 2 8.33333333333333 68 -1 0.05851934674096 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 6 68 -1 0.41044333510442 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 6.33333333333333 68 -1 0.34965948742909 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 6 68 -1 -0.14096128612708 -0.5 -0.5 2869 1
i 4 169.98635743519782 2 8.33333333333333 68 -1 -0.2740866851189 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 8.58333333333333 68 -1 -0.48908323346864 -0.5 -0.5 367232 1
i 4 169.98635743519782 2 8.33333333333333 68 -1 -0.08877481982774 -0.5 -0.5 367232 1
i 4 170.25920873124147 2 6 68 -1 -0.29266262791265 -0.5 -0.5 2869 1
i 4 170.25920873124147 2 8.33333333333333 68 -1 -0.34832905030388 -0.5 -0.5 367232 1
i 5 170.25920873124147 2 8.33333333333333 68 -1 -0.46303173906094 -0.5 -0.5 367232 1
i 6 170.25920873124147 2 8.91666666666667 68 -1 0.21642051438973 -0.5 -0.5 367232 1
i 6 170.25920873124147 2 9.5 68 -1 -0.41622220186606 -0.5 -0.5 367232 1
i 6 170.25920873124147 2 10 68 -1 -0.0485134877374 -0.5 -0.5 367232 1
i 4 170.25920873124147 2 8.58333333333333 68 -1 -0.39809171160568 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 6 68 -1 0.16950318950084 -0.5 -0.5 2869 1
i 4 170.53206002728513 2 8.58333333333333 68 -1 0.22731579800967 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 8.91666666666667 68 -1 -0.42330173570852 -0.5 -0.5 367232 1
i 4 170.53206002728513 2 8.58333333333333 68 -1 0.05206478604357 -0.5 -0.5 367232 1
i 4 170.80491132332878 2 6 68 -1 0.31157851745905 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 6.33333333333333 68 -1 0.3018974375243 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 6 68 -1 0.20471049170815 -0.5 -0.5 2869 1
i 4 170.80491132332878 2 8.58333333333333 68 -1 -0.48293163406822 -0.5 -0.5 367232 1
i 4 170.80491132332878 2 8.33333333333333 68 -1 -0.42189637563865 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 6 68 -1 -0.2784822523393 -0.5 -0.5 2869 1
i 6 171.07776261937244 2 6 68 -1 -0.44689730589823 -0.5 -0.5 2869 1
i 5 171.07776261937244 2 6.66666666666667 68 -1 0.20331802113176 -0.5 -0.5 2869 1
i 6 171.07776261937244 2 7.16666666666667 68 -1 -0.22896746133274 -0.5 -0.5 2869 1
i 5 171.07776261937244 2 7.66666666666667 68 -1 0.45241657226785 -0.5 -0.5 2869 1
i 4 171.07776261937244 2 8.33333333333333 68 -1 -0.30167943281024 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 8.58333333333333 68 -1 0.31797660367507 -0.5 -0.5 367232 1
i 4 171.07776261937244 2 8.33333333333333 68 -1 -0.35335465751793 -0.5 -0.5 367232 1
i 4 171.3506139154161 2 6 68 -1 -0.30285303769417 -0.5 -0.5 2869 1
i 4 171.3506139154161 2 8.33333333333333 68 -1 0.49495867651702 -0.5 -0.5 367232 1
i 4 171.62346521145975 2 6 68 -1 -0.05743335028646 -0.5 -0.5 2869 1
i 4 171.62346521145975 2 8.33333333333333 68 -1 -0.27861348605585 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 6 68 -1 0.27626961846916 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 6.33333333333333 68 -1 0.46759421346355 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 6 68 -1 -0.23442319793925 -0.5 -0.5 2869 1
i 4 171.8963165075034 2 8.33333333333333 68 -1 -0.31264318526084 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 8.58333333333333 68 -1 0.13524966377247 -0.5 -0.5 367232 1
i 4 171.8963165075034 2 8.33333333333333 68 -1 -0.00345160695939 -0.5 -0.5 367232 1
i 4 172.16916780354705 2 6 68 -1 -0.08554631397281 -0.5 -0.5 2869 1
i 5 172.16916780354705 2 6 68 -1 0.09398796124938 -0.5 -0.5 2869 1
i 5 172.16916780354705 2 6.66666666666667 68 -1 -0.36967771060072 -0.5 -0.5 2869 1
i 6 172.16916780354705 2 7.16666666666667 68 -1 0.08227216769014 -0.5 -0.5 2869 1
i 5 172.16916780354705 2 7.66666666666667 68 -1 -0.24171117653203 -0.5 -0.5 2869 1
i 4 172.16916780354705 2 6.33333333333333 68 -1 -0.39484222147741 -0.5 -0.5 2869 1
i 4 172.16916780354705 2 8.33333333333333 68 -1 0.29406267356515 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 8.33333333333333 68 -1 -0.03912705298448 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 8.91666666666667 68 -1 0.43919324756646 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 9.5 68 -1 0.02463784598493 -0.5 -0.5 367232 1
i 5 172.16916780354705 2 10 68 -1 0.3352494825031 -0.5 -0.5 367232 1
i 4 172.4420190995907 2 6.33333333333333 68 -1 0.35659337530407 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 6.66666666666667 68 -1 0.49408931358387 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 6.33333333333333 68 -1 -0.3518007257486 -0.5 -0.5 2869 1
i 4 172.4420190995907 2 8.33333333333333 68 -1 -0.08852393867873 -0.5 -0.5 367232 1
i 4 172.71487039563436 2 6.33333333333333 68 -1 0.32374992269918 -0.5 -0.5 2869 1
i 4 172.71487039563436 2 6 68 -1 -0.16728274095117 -0.5 -0.5 2869 1
i 4 172.71487039563436 2 8.33333333333333 68 -1 0.07284922012692 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 6 68 -1 -0.35169926753376 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 6.33333333333333 68 -1 0.04894963095125 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 6 68 -1 -0.39353216389222 -0.5 -0.5 2869 1
i 4 172.98772169167802 2 8.33333333333333 68 -1 0.44085849458391 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 8.58333333333333 68 -1 -0.10970280102658 -0.5 -0.5 367232 1
i 4 172.98772169167802 2 8.33333333333333 68 -1 -0.08389193880072 -0.5 -0.5 367232 1
i 4 173.26057298772167 2 6 68 -1 -0.1989528317131 -0.5 -0.5 2869 1
i 4 173.26057298772167 2 8.33333333333333 68 -1 0.34616039206733 -0.5 -0.5 367232 1
i 6 173.26057298772167 2 8.33333333333333 68 -1 -0.02421104220116 -0.5 -0.5 367232 1
i 5 173.26057298772167 2 8.91666666666667 68 -1 -0.11584456858587 -0.5 -0.5 367232 1
i 5 173.26057298772167 2 9.5 68 -1 0.35921785774538 -0.5 -0.5 367232 1
i 6 173.26057298772167 2 10 68 -1 -0.21991907560259 -0.5 -0.5 367232 1
i 4 173.26057298772167 2 8.58333333333333 68 -1 -0.47234372132706 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 6 68 -1 -0.35140783344371 -0.5 -0.5 2869 1
i 4 173.53342428376533 2 8.58333333333333 68 -1 0.32738680594974 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 8.91666666666667 68 -1 -0.08332898967385 -0.5 -0.5 367232 1
i 4 173.53342428376533 2 8.58333333333333 68 -1 0.42026143196856 -0.5 -0.5 367232 1
i 4 173.80627557980898 2 6 68 -1 -0.3145807674149 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 6.33333333333333 68 -1 0.34732353465586 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 6 68 -1 0.04027248589658 -0.5 -0.5 2869 1
i 4 173.80627557980898 2 8.58333333333333 68 -1 0.18319983783984 -0.5 -0.5 367232 1
i 4 173.80627557980898 2 8.33333333333333 68 -1 -0.27271311825286 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 6 68 -1 0.42866135466871 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 6 68 -1 0.28423505884902 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 6.66666666666667 68 -1 -0.08172030421861 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.16666666666667 68 -1 0.25594462370621 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.66666666666667 68 -1 0.37887196285757 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 6 68 -1 -0.40355645065433 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 6.66666666666667 68 -1 0.1385092304764 -0.5 -0.5 2869 1
i 6 174.07912687585264 2 7.16666666666667 68 -1 0.20312630401319 -0.5 -0.5 2869 1
i 5 174.07912687585264 2 7.66666666666667 68 -1 -0.3752618834376 -0.5 -0.5 2869 1
i 4 174.07912687585264 2 8.33333333333333 68 -1 -0.05624146890671 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 8.58333333333333 68 -1 0.1821441633266 -0.5 -0.5 367232 1
i 4 174.07912687585264 2 8.33333333333333 68 -1 -0.18185068411019 -0.5 -0.5 367232 1
i 4 174.3519781718963 2 6 68 -1 -0.18371412316293 -0.5 -0.5 2869 1
i 4 174.3519781718963 2 8.33333333333333 68 -1 0.18558522733817 -0.5 -0.5 367232 1
i 4 174.62482946793995 2 6 68 -1 0.4855859905269 -0.5 -0.5 2869 1
i 4 174.62482946793995 2 8.33333333333333 68 -1 0.32142335350959 -0.5 -0.5 367232 1
i 3 174.89768076398363 2 7.66666666666667 68 -1 -0.3578020016907 -0.5 -0.5 2869 1
i 3 174.89768076398363 2 8 68 -1 -0.15636407774319 -0.5 -0.5 2869 1
i 3 174.89768076398363 2 7.66666666666667 68 -1 0.06194553064468 -0.5 -0.5 2869 1
i 4 174.89768076398363 2 6 68 -1 -0.2466877437152 -0.5 -0.5 2869 1
i 4 174.89768076398363 2 8.33333333333333 68 -1 -0.33816076982311 -0.5 -0.5 367232 1
i 4 174.89768076398363 2 8.58333333333333 68 -1 -0.32283511760593 -0.5 -0.5 367232 1
i 4 174.89768076398363 2 8.33333333333333 68 -1 -0.42919190692152 -0.5 -0.5 367232 1
i 4 175.17053206002728 2 7.66666666666667 68 -1 0.37908046714156 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6 68 -1 0.17879753577825 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6.33333333333333 68 -1 0.49481467226364 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 6 68 -1 -0.49477963002432 -0.5 -0.5 2869 1
i 4 175.17053206002728 2 8.33333333333333 68 -1 0.28492090804763 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.33333333333333 68 -1 -0.41799809604764 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.91666666666667 68 -1 -0.18800431578312 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 9.5 68 -1 0.26045031169447 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 10 68 -1 -0.39548020781974 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.33333333333333 68 -1 -0.466548463669 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 8.91666666666667 68 -1 -0.14914826432257 -0.5 -0.5 367232 1
i 6 175.17053206002728 2 9.5 68 -1 -0.29644739276428 -0.5 -0.5 367232 1
i 5 175.17053206002728 2 10 68 -1 -0.4998219913389 -0.5 -0.5 367232 1
i 4 175.44338335607094 2 6 68 -1 -0.12493866526757 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 6 68 -1 0.0494088376609 -0.5 -0.5 2869 1
i 5 175.44338335607094 2 6.66666666666667 68 -1 0.21017647603608 -0.5 -0.5 2869 1
i 5 175.44338335607094 2 7.16666666666667 68 -1 -0.17077014711667 -0.5 -0.5 2869 1
i 6 175.44338335607094 2 7.66666666666667 68 -1 -0.31475275284911 -0.5 -0.5 2869 1
i 4 175.44338335607094 2 6.33333333333333 68 -1 -0.44332329591912 -0.5 -0.5 2869 1
i 4 175.44338335607094 2 8.33333333333333 68 -1 0.43917607406601 -0.5 -0.5 367232 1
i 4 175.7162346521146 2 6.33333333333333 68 -1 0.28816655803269 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 6.66666666666667 68 -1 -0.15090075351456 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 6.33333333333333 68 -1 -0.27932168854877 -0.5 -0.5 2869 1
i 4 175.7162346521146 2 8.33333333333333 68 -1 -0.47925888801983 -0.5 -0.5 367232 1
i 4 175.98908594815825 2 6.33333333333333 68 -1 -0.00825219847548 -0.5 -0.5 2869 1
i 4 175.98908594815825 2 6 68 -1 0.39472189413059 -0.5 -0.5 2869 1
i 3 175.98908594815825 2 10 68 -1 -0.44253776572212 -0.5 -0.5 367232 1
i 3 175.98908594815825 2 10.33333333333333 68 -1 -0.08063694494954 -0.5 -0.5 367232 1
i 3 175.98908594815825 2 10 68 -1 0.24489892238278 -0.5 -0.5 367232 1
i 4 175.98908594815825 2 8.33333333333333 68 -1 -0.39310276374271 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 6 68 -1 0.1327536282425 -0.5 -0.5 2869 1
i 4 176.2619372442019 2 6.33333333333333 68 -1 -0.30492848972499 -0.5 -0.5 2869 1
i 4 176.2619372442019 2 6 68 -1 0.17343270685284 -0.5 -0.5 2869 1
i 3 176.2619372442019 2 10 68 -1 -0.24577992429201 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.33333333333333 68 -1 -0.19644290890017 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.58333333333333 68 -1 0.20932713988124 -0.5 -0.5 367232 1
i 4 176.2619372442019 2 8.33333333333333 68 -1 -0.15426150757854 -0.5 -0.5 367232 1
i 4 176.53478854024556 2 6 68 -1 0.42125481149334 -0.5 -0.5 2869 1
i 4 176.53478854024556 2 8.33333333333333 68 -1 0.11505890867733 -0.5 -0.5 367232 1
i 6 176.53478854024556 2 8.33333333333333 68 -1 0.35964897599291 -0.5 -0.5 367232 1
i 6 176.53478854024556 2 8.91666666666667 68 -1 -0.15310838231733 -0.5 -0.5 367232 1
i 6 176.53478854024556 2 9.5 68 -1 -0.17070601579414 -0.5 -0.5 367232 1
i 5 176.53478854024556 2 10 68 -1 -0.02903643068896 -0.5 -0.5 367232 1
i 4 176.53478854024556 2 8.58333333333333 68 -1 -0.09965340023171 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 6 68 -1 -0.10156136484737 -0.5 -0.5 2869 1
i 4 176.8076398362892 2 8.58333333333333 68 -1 0.45965055894918 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 8.91666666666667 68 -1 0.05887297850862 -0.5 -0.5 367232 1
i 4 176.8076398362892 2 8.58333333333333 68 -1 0.46209150041891 -0.5 -0.5 367232 1
i 4 177.08049113233287 2 6 68 -1 0.41602373086727 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 6.33333333333333 68 -1 -0.35231670482864 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 6 68 -1 -0.28724608439479 -0.5 -0.5 2869 1
i 4 177.08049113233287 2 8.58333333333333 68 -1 -0.27567882181109 -0.5 -0.5 367232 1
i 4 177.08049113233287 2 8.33333333333333 68 -1 0.39730463177554 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 6 68 -1 -0.29825760165262 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 6 68 -1 -0.49448249790038 -0.5 -0.5 2869 1
i 5 177.35334242837652 2 6.66666666666667 68 -1 0.18306974414946 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.16666666666667 68 -1 0.46113242481015 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.66666666666667 68 -1 -0.10782681734017 -0.5 -0.5 2869 1
i 5 177.35334242837652 2 6 68 -1 0.03640454137428 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 6.66666666666667 68 -1 -0.13946452479241 -0.5 -0.5 2869 1
i 5 177.35334242837652 2 7.16666666666667 68 -1 0.00611699944617 -0.5 -0.5 2869 1
i 6 177.35334242837652 2 7.66666666666667 68 -1 -0.46323541124219 -0.5 -0.5 2869 1
i 4 177.35334242837652 2 6.33333333333333 68 -1 -0.04390526649421 -0.5 -0.5 2869 1
i 4 177.35334242837652 2 8.33333333333333 68 -1 -0.14633734675017 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 8.58333333333333 68 -1 0.41859618476282 -0.5 -0.5 367232 1
i 4 177.35334242837652 2 8.33333333333333 68 -1 -0.37728099030843 -0.5 -0.5 367232 1
i 4 177.62619372442018 2 6.33333333333333 68 -1 -0.28865900871023 -0.5 -0.5 2869 1
i 4 177.62619372442018 2 8.33333333333333 68 -1 -0.47555044447396 -0.5 -0.5 367232 1
i 4 177.89904502046383 2 6.33333333333333 68 -1 -0.22789231225864 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 6.66666666666667 68 -1 0.48706085382186 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 6.33333333333333 68 -1 0.41119549007485 -0.5 -0.5 2869 1
i 4 177.89904502046383 2 8.33333333333333 68 -1 -0.3572715145609 -0.5 -0.5 367232 1
i 3 178.17189631650749 2 7.66666666666667 68 -1 -0.26264253013526 -0.5 -0.5 2869 1
i 3 178.17189631650749 2 8 68 -1 -0.42186018529847 -0.5 -0.5 2869 1
i 3 178.17189631650749 2 7.66666666666667 68 -1 0.43874019299413 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 6.33333333333333 68 -1 0.11629122121111 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 6.33333333333333 68 -1 -0.11529080246465 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 6.91666666666667 68 -1 0.39307661345643 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 7.41666666666667 68 -1 0.37156350339701 -0.5 -0.5 2869 1
i 5 178.17189631650749 2 8 68 -1 -0.38091051921633 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 6.66666666666667 68 -1 0.08838533537428 -0.5 -0.5 2869 1
i 4 178.17189631650749 2 8.33333333333333 68 -1 0.44893224068482 -0.5 -0.5 367232 1
i 4 178.17189631650749 2 8.58333333333333 68 -1 0.11705867446546 -0.5 -0.5 367232 1
i 4 178.17189631650749 2 8.33333333333333 68 -1 0.26123036670313 -0.5 -0.5 367232 1
i 3 178.44474761255114 2 7.66666666666667 68 -1 -0.32668797346628 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.66666666666667 68 -1 -0.17388574418862 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.91666666666667 68 -1 0.41913845954491 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 6.66666666666667 68 -1 0.49245251642984 -0.5 -0.5 2869 1
i 4 178.44474761255114 2 8.33333333333333 68 -1 -0.19826707836986 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 8.33333333333333 68 -1 0.30203815454708 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 8.91666666666667 68 -1 -0.44137106038516 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 9.5 68 -1 0.0865647663812 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 10 68 -1 0.33576930924142 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 8.33333333333333 68 -1 -0.30088028041485 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 8.91666666666667 68 -1 0.10449867982936 -0.5 -0.5 367232 1
i 5 178.44474761255114 2 9.5 68 -1 -0.24371569586677 -0.5 -0.5 367232 1
i 6 178.44474761255114 2 10 68 -1 -0.02519692117148 -0.5 -0.5 367232 1
i 4 178.44474761255114 2 8.58333333333333 68 -1 0.41554734457574 -0.5 -0.5 367232 1
i 4 178.7175989085948 2 6.66666666666667 68 -1 0.21136864817022 -0.5 -0.5 2869 1
i 4 178.7175989085948 2 6.33333333333333 68 -1 0.44286513741219 -0.5 -0.5 2869 1
i 4 178.7175989085948 2 8.58333333333333 68 -1 -0.39896226978441 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 6.33333333333333 68 -1 0.00746362093927 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 6.66666666666667 68 -1 -0.48165139953104 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 6.33333333333333 68 -1 -0.4036500032817 -0.5 -0.5 2869 1
i 4 178.99045020463848 2 8.58333333333333 68 -1 0.06525578278168 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 8.91666666666667 68 -1 0.03745884596318 -0.5 -0.5 367232 1
i 4 178.99045020463848 2 8.58333333333333 68 -1 0.41233478868567 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 6.33333333333333 68 -1 -0.49662636853296 -0.5 -0.5 2869 1
i 4 179.26330150068213 2 10 68 -1 0.38988498627174 -0.5 -0.5 367232 1
i 3 179.26330150068213 2 10.33333333333333 68 -1 -0.33027875226943 -0.5 -0.5 367232 1
i 3 179.26330150068213 2 10 68 -1 0.05315895361276 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 8.58333333333333 68 -1 -0.32751787739212 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 8.58333333333333 68 -1 0.36846285248061 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 9.25 68 -1 -0.06298466012446 -0.5 -0.5 367232 1
i 6 179.26330150068213 2 9.75 68 -1 0.24264721815423 -0.5 -0.5 367232 1
i 5 179.26330150068213 2 10.33333333333333 68 -1 0.33952896422433 -0.5 -0.5 367232 1
i 4 179.26330150068213 2 8.91666666666667 68 -1 -0.34425122304542 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 6.33333333333333 68 -1 0.40078296892345 -0.5 -0.5 2869 1
i 3 179.5361527967258 2 10 68 -1 0.20712044991035 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 8.91666666666667 68 -1 0.27028423065605 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 9.25 68 -1 0.11521031479124 -0.5 -0.5 367232 1
i 4 179.5361527967258 2 8.91666666666667 68 -1 -0.38245352469811 -0.5 -0.5 367232 1
i 4 179.80900409276944 2 6.33333333333333 68 -1 -0.26473490633317 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 6.66666666666667 68 -1 -0.40716637847151 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 6.33333333333333 68 -1 0.06604214725155 -0.5 -0.5 2869 1
i 4 179.80900409276944 2 8.91666666666667 68 -1 0.33506468335108 -0.5 -0.5 367232 1
i 4 179.80900409276944 2 8.58333333333333 68 -1 -0.35725246096888 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 6.33333333333333 68 -1 0.19787370405547 -0.5 -0.5 2869 1
i 6 180.0818553888131 2 6.33333333333333 68 -1 -0.2013081368763 -0.5 -0.5 2869 1
i 5 180.0818553888131 2 6.91666666666667 68 -1 0.21551108774301 -0.5 -0.5 2869 1
i 5 180.0818553888131 2 7.41666666666667 68 -1 -0.38862288125287 -0.5 -0.5 2869 1
i 6 180.0818553888131 2 8 68 -1 -0.09889051192671 -0.5 -0.5 2869 1
i 4 180.0818553888131 2 6 68 -1 0.09954920210381 -0.5 -0.5 2869 1
i 4 180.0818553888131 2 8.58333333333333 68 -1 -0.27518270473772 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 8.91666666666667 68 -1 0.31609902875224 -0.5 -0.5 367232 1
i 4 180.0818553888131 2 8.58333333333333 68 -1 -0.18151419006351 -0.5 -0.5 367232 1
i 4 180.35470668485675 2 6 68 -1 -0.17852533999507 -0.5 -0.5 2869 1
i 4 180.35470668485675 2 8.58333333333333 68 -1 -0.06830420595465 -0.5 -0.5 367232 1
i 4 180.6275579809004 2 6 68 -1 -0.09703484798815 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 6.33333333333333 68 -1 0.44806417631033 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 6 68 -1 -0.26290070380754 -0.5 -0.5 2869 1
i 4 180.6275579809004 2 8.58333333333333 68 -1 0.10192168472658 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 6 68 -1 -0.38949428639201 -0.5 -0.5 2869 1
i 6 180.90040927694406 2 6 68 -1 -0.28693130099723 -0.5 -0.5 2869 1
i 6 180.90040927694406 2 6.66666666666667 68 -1 0.01865657980428 -0.5 -0.5 2869 1
i 6 180.90040927694406 2 7.16666666666667 68 -1 0.28960904252183 -0.5 -0.5 2869 1
i 5 180.90040927694406 2 7.66666666666667 68 -1 0.26551762333581 -0.5 -0.5 2869 1
i 4 180.90040927694406 2 6.33333333333333 68 -1 -0.49309353920643 -0.5 -0.5 2869 1
i 4 180.90040927694406 2 8.58333333333333 68 -1 0.09615555532924 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 8.91666666666667 68 -1 0.41341518111829 -0.5 -0.5 367232 1
i 4 180.90040927694406 2 8.58333333333333 68 -1 0.24110042913673 -0.5 -0.5 367232 1
i 4 181.17326057298772 2 6.33333333333333 68 -1 -0.08594563755863 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 6.66666666666667 68 -1 0.28226917325049 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 6.33333333333333 68 -1 -0.40241198671809 -0.5 -0.5 2869 1
i 4 181.17326057298772 2 8.58333333333333 68 -1 0.02661419018037 -0.5 -0.5 367232 1
i 6 181.17326057298772 2 8.58333333333333 68 -1 -0.22107487371057 -0.5 -0.5 367232 1
i 6 181.17326057298772 2 9.25 68 -1 0.40399623914059 -0.5 -0.5 367232 1
i 5 181.17326057298772 2 9.75 68 -1 -0.44842893265533 -0.5 -0.5 367232 1
i 5 181.17326057298772 2 10.33333333333333 68 -1 0.07204072673725 -0.5 -0.5 367232 1
i 4 181.17326057298772 2 8.33333333333333 68 -1 -0.34490835782831 -0.5 -0.5 367232 1
i 4 181.44611186903137 2 6.33333333333333 68 -1 -0.07234574192126 -0.5 -0.5 2869 1
i 4 181.44611186903137 2 6 68 -1 -0.11502773474422 -0.5 -0.5 2869 1
i 4 181.44611186903137 2 8.33333333333333 68 -1 0.37634735081107 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 6 68 -1 0.24572325397811 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 6.33333333333333 68 -1 -0.24763394830047 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 6 68 -1 0.39504020407456 -0.5 -0.5 2869 1
i 4 181.71896316507502 2 8.33333333333333 68 -1 -0.40705584443077 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 8.58333333333333 68 -1 -0.22682570204579 -0.5 -0.5 367232 1
i 4 181.71896316507502 2 8.33333333333333 68 -1 -0.37476380531336 -0.5 -0.5 367232 1
i 4 181.99181446111868 2 6 68 -1 0.36773385780968 -0.5 -0.5 2869 1
i 4 181.99181446111868 2 8.33333333333333 68 -1 0.29203860118302 -0.5 -0.5 367232 1
i 5 181.99181446111868 2 8.33333333333333 68 -1 -0.1936740785338 -0.5 -0.5 367232 1
i 6 181.99181446111868 2 8.91666666666667 68 -1 0.13347063139687 -0.5 -0.5 367232 1
i 6 181.99181446111868 2 9.5 68 -1 0.35670995224812 -0.5 -0.5 367232 1
i 5 181.99181446111868 2 10 68 -1 -0.32636081193518 -0.5 -0.5 367232 1
i 4 181.99181446111868 2 8.58333333333333 68 -1 -0.12595419867965 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 6 68 -1 -0.42075746977693 -0.5 -0.5 2869 1
i 4 182.26466575716233 2 8.58333333333333 68 -1 0.24642887146017 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 8.91666666666667 68 -1 -0.19233146754607 -0.5 -0.5 367232 1
i 4 182.26466575716233 2 8.58333333333333 68 -1 0.38556533994383 -0.5 -0.5 367232 1
i 4 182.537517053206 2 6 68 -1 0.25207161577705 -0.5 -0.5 2869 1
i 4 182.537517053206 2 6.33333333333333 68 -1 0.48820330712665 -0.5 -0.5 2869 1
i 4 182.537517053206 2 6 68 -1 -0.22380812429639 -0.5 -0.5 2869 1
i 4 182.537517053206 2 8.58333333333333 68 -1 0.43940840530674 -0.5 -0.5 367232 1
i 4 182.537517053206 2 8.33333333333333 68 -1 0.32678953666256 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 6 68 -1 -0.04111881080577 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 6 68 -1 -0.23861374668991 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 6.66666666666667 68 -1 0.26847208288549 -0.5 -0.5 2869 1
i 5 182.81036834924964 2 7.16666666666667 68 -1 0.37053918475793 -0.5 -0.5 2869 1
i 6 182.81036834924964 2 7.66666666666667 68 -1 0.08752482507691 -0.5 -0.5 2869 1
i 4 182.81036834924964 2 8.33333333333333 68 -1 -0.10049857739276 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 8.58333333333333 68 -1 -0.05123898644008 -0.5 -0.5 367232 1
i 4 182.81036834924964 2 8.33333333333333 68 -1 -0.0915654923613 -0.5 -0.5 367232 1
i 4 183.08321964529333 2 6 68 -1 -0.4404707809905 -0.5 -0.5 2869 1
i 4 183.08321964529333 2 8.33333333333333 68 -1 -0.04314393274613 -0.5 -0.5 367232 1
i 4 183.35607094133698 2 6 68 -1 -0.28339226644505 -0.5 -0.5 2869 1
i 4 183.35607094133698 2 8.33333333333333 68 -1 0.10339874410883 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 6 68 -1 -0.42753880053307 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 6.33333333333333 68 -1 0.20005344473821 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 6 68 -1 0.21080701248612 -0.5 -0.5 2869 1
i 4 183.62892223738064 2 8.33333333333333 68 -1 0.0881966803943 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 8.58333333333333 68 -1 0.14449439827473 -0.5 -0.5 367232 1
i 4 183.62892223738064 2 8.33333333333333 68 -1 -0.22667010362841 -0.5 -0.5 367232 1
i 4 183.9017735334243 2 6 68 -1 -0.18306911738256 -0.5 -0.5 2869 1
i 5 183.9017735334243 2 6 68 -1 0.2286570555532 -0.5 -0.5 2869 1
i 6 183.9017735334243 2 6.66666666666667 68 -1 0.2571013048325 -0.5 -0.5 2869 1
i 5 183.9017735334243 2 7.16666666666667 68 -1 0.19936558404861 -0.5 -0.5 2869 1
i 5 183.9017735334243 2 7.66666666666667 68 -1 0.11438058733896 -0.5 -0.5 2869 1
i 4 183.9017735334243 2 6.33333333333333 68 -1 -0.27081299811628 -0.5 -0.5 2869 1
i 4 183.9017735334243 2 8.33333333333333 68 -1 0.2418542282362 -0.5 -0.5 367232 1
i 6 183.9017735334243 2 8.33333333333333 68 -1 0.2967735788793 -0.5 -0.5 367232 1
i 6 183.9017735334243 2 8.91666666666667 68 -1 -0.13774430126369 -0.5 -0.5 367232 1
i 6 183.9017735334243 2 9.5 68 -1 0.03630570682168 -0.5 -0.5 367232 1
i 6 183.9017735334243 2 10 68 -1 0.25733549066726 -0.5 -0.5 367232 1
i 4 184.17462482946794 2 6.33333333333333 68 -1 -0.00560851784343 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 6.66666666666667 68 -1 -0.38677445298843 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 6.33333333333333 68 -1 0.48114362662023 -0.5 -0.5 2869 1
i 4 184.17462482946794 2 8.33333333333333 68 -1 0.09607825291662 -0.5 -0.5 367232 1
i 4 184.4474761255116 2 6.33333333333333 68 -1 0.42420081492892 -0.5 -0.5 2869 1
i 4 184.4474761255116 2 6 68 -1 0.08858000925481 -0.5 -0.5 2869 1
i 4 184.4474761255116 2 8.33333333333333 68 -1 0.41128039477889 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 6 68 -1 -0.24024411578327 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 6.33333333333333 68 -1 0.19563511371225 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 6 68 -1 0.4374922806875 -0.5 -0.5 2869 1
i 4 184.72032742155525 2 8.33333333333333 68 -1 -0.14362110076288 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 8.58333333333333 68 -1 0.00101660329237 -0.5 -0.5 367232 1
i 4 184.72032742155525 2 8.33333333333333 68 -1 -0.45932429370393 -0.5 -0.5 367232 1
i 4 184.9931787175989 2 6 68 -1 -0.40137503710354 -0.5 -0.5 2869 1
i 4 184.9931787175989 2 8.33333333333333 68 -1 0.10987580480559 -0.5 -0.5 367232 1
i 5 184.9931787175989 2 8.33333333333333 68 -1 -0.1657866989816 -0.5 -0.5 367232 1
i 5 184.9931787175989 2 8.91666666666667 68 -1 0.47992296929482 -0.5 -0.5 367232 1
i 5 184.9931787175989 2 9.5 68 -1 -0.29321396011335 -0.5 -0.5 367232 1
i 6 184.9931787175989 2 10 68 -1 -0.43652385599403 -0.5 -0.5 367232 1
i 4 184.9931787175989 2 8.58333333333333 68 -1 0.09914224993176 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 6 68 -1 0.49806768894228 -0.5 -0.5 2869 1
i 4 185.26603001364256 2 8.58333333333333 68 -1 0.12661156188526 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 8.91666666666667 68 -1 -0.06219175132907 -0.5 -0.5 367232 1
i 4 185.26603001364256 2 8.58333333333333 68 -1 0.04080770456315 -0.5 -0.5 367232 1
i 4 185.53888130968622 2 6 68 -1 -0.40663124741517 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 6.33333333333333 68 -1 0.13217516798551 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 6 68 -1 -0.49936303139839 -0.5 -0.5 2869 1
i 4 185.53888130968622 2 8.58333333333333 68 -1 -0.06211528132788 -0.5 -0.5 367232 1
i 4 185.53888130968622 2 8.33333333333333 68 -1 -0.2321091504027 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 6 68 -1 -0.39088671602324 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6 68 -1 -0.33527263442595 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6.66666666666667 68 -1 0.07847753074872 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 0.15738295165052 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.66666666666667 68 -1 -0.47943343509563 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6 68 -1 0.38775322543564 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6.66666666666667 68 -1 -0.08461781789511 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 -0.08339396259731 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 7.66666666666667 68 -1 0.39329494097616 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6 68 -1 0.4068014608349 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6.66666666666667 68 -1 0.16047507065485 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.16666666666667 68 -1 0.28013894497574 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 7.66666666666667 68 -1 -0.10605345043105 -0.5 -0.5 2869 1
i 5 185.81173260572987 2 6 68 -1 -0.08830415189876 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 6.66666666666667 68 -1 0.23277274698219 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 7.16666666666667 68 -1 -0.41714097186408 -0.5 -0.5 2869 1
i 6 185.81173260572987 2 7.66666666666667 68 -1 -0.49854526706727 -0.5 -0.5 2869 1
i 4 185.81173260572987 2 8.33333333333333 68 -1 -0.28577980737881 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 8.58333333333333 68 -1 -0.49881630702104 -0.5 -0.5 367232 1
i 4 185.81173260572987 2 8.33333333333333 68 -1 0.00773937964025 -0.5 -0.5 367232 1
i 4 186.08458390177353 2 8.33333333333333 68 -1 0.2194696390435 -0.5 -0.5 367232 1
i 4 186.35743519781718 2 8.33333333333333 68 -1 -0.44865035478301 -0.5 -0.5 367232 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 -0.06692194387562 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 8 68 -1 -0.00793354704977 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 0.4199530273245 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 -0.42747319725234 -0.5 -0.5 2869 1
i 3 186.63028649386084 2 7.66666666666667 68 -1 -0.31052159620109 -0.5 -0.5 2869 1
i 4 186.63028649386084 2 8.33333333333333 68 -1 0.16803307972091 -0.5 -0.5 367232 1
i 4 186.63028649386084 2 8.58333333333333 68 -1 0.10989808684729 -0.5 -0.5 367232 1
i 4 186.63028649386084 2 8.33333333333333 68 -1 0.10970191702505 -0.5 -0.5 367232 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 0.05484423485467 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 0.24563011663025 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 8 68 -1 0.4282242583421 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 -0.0315353520083 -0.5 -0.5 2869 1
i 3 186.9031377899045 2 7.66666666666667 68 -1 0.49015604065511 -0.5 -0.5 2869 1
i 4 186.9031377899045 2 8.33333333333333 68 -1 -0.02592243502457 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.33333333333333 68 -1 0.27696257243346 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.91666666666667 68 -1 0.37112991551536 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 9.5 68 -1 -0.06330418800579 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 10 68 -1 -0.20547626964185 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.33333333333333 68 -1 -0.42714697134927 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.91666666666667 68 -1 -0.17494971207504 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 9.5 68 -1 0.0324188013951 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 10 68 -1 -0.31865455260239 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.33333333333333 68 -1 0.21715461429714 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.91666666666667 68 -1 -0.10116065285759 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 9.5 68 -1 0.15435854264448 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 10 68 -1 -0.13151501936028 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 8.33333333333333 68 -1 -0.11169074252855 -0.5 -0.5 367232 1
i 6 186.9031377899045 2 8.91666666666667 68 -1 -0.4364743012207 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 9.5 68 -1 0.02239726787879 -0.5 -0.5 367232 1
i 5 186.9031377899045 2 10 68 -1 0.28566639944497 -0.5 -0.5 367232 1
i 3 187.17598908594817 2 7.66666666666667 68 -1 0.05490013645052 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 7.66666666666667 68 -1 0.07144277778169 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 8.33333333333333 68 -1 -0.2177640710358 -0.5 -0.5 2869 1
i 4 187.17598908594817 2 8.75 68 -1 -0.38265240183227 -0.5 -0.5 2869 1
i 5 187.17598908594817 2 9.41666666666667 68 -1 0.09578689007554 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 8 68 -1 -0.22418258189353 -0.5 -0.5 2869 1
i 4 187.17598908594817 2 7.66666666666667 68 -1 0.1728715627854 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 8 68 -1 0.06889143216123 -0.5 -0.5 2869 1
i 3 187.17598908594817 2 7.66666666666667 68 -1 -0.11447531535288 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.24731778415207 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8.33333333333333 68 -1 -0.19939311169386 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.2725299318404 -0.5 -0.5 2869 1
i 4 187.44884038199183 2 7.66666666666667 68 -1 0.01393330202587 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 7.66666666666667 68 -1 0.18166665396602 -0.5 -0.5 2869 1
i 4 187.44884038199183 2 8.33333333333333 68 -1 0.10248413108728 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 8.75 68 -1 0.21340733726725 -0.5 -0.5 2869 1
i 5 187.44884038199183 2 9.41666666666667 68 -1 -0.46889372994092 -0.5 -0.5 2869 1
i 3 187.44884038199183 2 8 68 -1 -0.02643530659577 -0.5 -0.5 2869 1
i 4 187.72169167803548 2 8 68 -1 -0.0834344037139 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 7.66666666666667 68 -1 -0.15361164864332 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8 68 -1 0.05603428864516 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8.33333333333333 68 -1 -0.05771689855075 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 8 68 -1 0.18607593889969 -0.5 -0.5 2869 1
i 3 187.72169167803548 2 10 68 -1 0.04961205075578 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10.33333333333333 68 -1 -0.00998324172235 -0.5 -0.5 367232 1
i 3 187.72169167803548 2 10 68 -1 0.01500368544965 -0.5 -0.5 367232 1
i 4 187.72169167803548 2 10 68 -1 0.21647472869863 -0.5 -0.5 367232 1
i 4 187.72169167803548 2 10 68 -1 0.28339553595241 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 -0.20816607480682 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 8 68 -1 -0.37174818811494 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 -0.1705564937576 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 8 68 -1 0.03056828975256 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 7.66666666666667 68 -1 0.11333827642744 -0.5 -0.5 2869 1
i 3 187.99454297407914 2 10 68 -1 -0.21808363654436 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 10 68 -1 0.4663201180397 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 10.33333333333333 68 -1 0.09892708158538 -0.5 -0.5 367232 1
i 4 187.99454297407914 2 10 68 -1 -0.10555431425147 -0.5 -0.5 367232 1
i 3 187.99454297407914 2 10 68 -1 0.02264272420618 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 7.66666666666667 68 -1 -0.39760330348654 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 7.66666666666667 68 -1 -0.28114668251024 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 8 68 -1 -0.04363591012637 -0.5 -0.5 2869 1
i 3 188.2673942701228 2 7.66666666666667 68 -1 -0.22322593151188 -0.5 -0.5 2869 1
i 4 188.2673942701228 2 10 68 -1 -0.19157912366149 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 10 68 -1 0.30718242602012 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 10.58333333333333 68 -1 -0.44157739911588 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 11.25 68 -1 -0.25862150082938 -0.5 -0.5 367232 1
i 5 188.2673942701228 2 11.75 68 -1 0.27047485592842 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10.33333333333333 68 -1 0.21072270865002 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10 68 -1 -0.19579093663031 -0.5 -0.5 367232 1
i 4 188.2673942701228 2 10.33333333333333 68 -1 -0.4070977181458 -0.5 -0.5 367232 1
i 3 188.2673942701228 2 10 68 -1 -0.07227811170376 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 7.66666666666667 68 -1 0.15018769548189 -0.5 -0.5 2869 1
i 3 188.54024556616645 2 7.66666666666667 68 -1 0.3424437443725 -0.5 -0.5 2869 1
i 3 188.54024556616645 2 10.33333333333333 68 -1 0.47765107666498 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 10.58333333333333 68 -1 0.1400764850356 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 10.33333333333333 68 -1 0.38059305450918 -0.5 -0.5 367232 1
i 4 188.54024556616645 2 10 68 -1 -0.21789168858678 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 10 68 -1 -0.02681321512689 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 10.58333333333333 68 -1 -0.17560725369207 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 11.25 68 -1 -0.1193532417827 -0.5 -0.5 367232 1
i 5 188.54024556616645 2 11.75 68 -1 0.19914530323898 -0.5 -0.5 367232 1
i 3 188.54024556616645 2 10.33333333333333 68 -1 0.02774542084143 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 7.66666666666667 68 -1 0.36704858150896 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 8 68 -1 -0.08329972947401 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 7.66666666666667 68 -1 0.35733616304957 -0.5 -0.5 2869 1
i 4 188.8130968622101 2 7.66666666666667 68 -1 -0.12933411431074 -0.5 -0.5 2869 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 0.19252269315869 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10 68 -1 -0.05608585177433 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 0.12070442512446 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.58333333333333 68 -1 0.4501562954474 -0.5 -0.5 367232 1
i 3 188.8130968622101 2 10.33333333333333 68 -1 0.30320734352637 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 7.66666666666667 68 -1 -0.02887682131162 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 7.66666666666667 68 -1 0.29033776331662 -0.5 -0.5 2869 1
i 5 189.08594815825376 2 8.33333333333333 68 -1 -0.25221607636149 -0.5 -0.5 2869 1
i 4 189.08594815825376 2 8.75 68 -1 0.20690539573977 -0.5 -0.5 2869 1
i 4 189.08594815825376 2 9.41666666666667 68 -1 0.37587550175217 -0.5 -0.5 2869 1
i 4 189.08594815825376 2 7.66666666666667 68 -1 0.43510180999185 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 8 68 -1 -0.28843880550318 -0.5 -0.5 2869 1
i 3 189.08594815825376 2 7.66666666666667 68 -1 -0.45013598898866 -0.5 -0.5 2869 1
i 4 189.08594815825376 2 10 68 -1 -0.41377549754095 -0.5 -0.5 367232 1
i 4 189.08594815825376 2 10.33333333333333 68 -1 0.05553140485957 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10 68 -1 -0.35153942037042 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10.33333333333333 68 -1 -0.34505248169335 -0.5 -0.5 367232 1
i 3 189.08594815825376 2 10 68 -1 -0.46881125631105 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 7.66666666666667 68 -1 -0.13221937328424 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 7.66666666666667 68 -1 0.21309500729769 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.33333333333333 68 -1 0.34270970332445 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.75 68 -1 -0.07822972403927 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 9.41666666666667 68 -1 -0.33555717662627 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 7.66666666666667 68 -1 -0.31721150942039 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.33333333333333 68 -1 -0.16872537931159 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 8.75 68 -1 0.11828494269042 -0.5 -0.5 2869 1
i 5 189.3587994542974 2 9.41666666666667 68 -1 -0.46956551300915 -0.5 -0.5 2869 1
i 3 189.3587994542974 2 8 68 -1 0.07110863354626 -0.5 -0.5 2869 1
i 3 189.3587994542974 2 10 68 -1 -0.35250383915614 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10 68 -1 0.31278062834612 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10.33333333333333 68 -1 -0.42164072175427 -0.5 -0.5 367232 1
i 3 189.3587994542974 2 10 68 -1 0.19270009882388 -0.5 -0.5 367232 1
i 3 189.63165075034107 2 8 68 -1 -0.01903756640731 -0.5 -0.5 2869 1
i 3 189.63165075034107 2 10 68 -1 0.35851051280402 -0.5 -0.5 367232 1
i 3 189.63165075034107 2 10 68 -1 0.30965171019094 -0.5 -0.5 367232 1
i 4 189.90450204638472 2 8 68 -1 0.08706017026813 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 8.33333333333333 68 -1 -0.04223330452285 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 8 68 -1 -0.45812799540716 -0.5 -0.5 2869 1
i 3 189.90450204638472 2 10 68 -1 -0.46245708607607 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10.33333333333333 68 -1 0.29222451644798 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10 68 -1 0.3858555194795 -0.5 -0.5 367232 1
i 3 189.90450204638472 2 10 68 -1 -0.43225025541344 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 9.41666666666667 68 -1 -0.10365036190372 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 9.66666666666667 68 -1 0.1970244199788 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 9.41666666666667 68 -1 0.47015349940504 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 8 68 -1 0.38934566113551 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 8 68 -1 0.19393526100022 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 8.66666666666667 68 -1 -0.00152887325738 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 9.16666666666667 68 -1 -0.02842775635586 -0.5 -0.5 2869 1
i 5 190.17735334242838 2 9.66666666666667 68 -1 -0.49306285438048 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 8.33333333333333 68 -1 -0.30959271193179 -0.5 -0.5 2869 1
i 3 190.17735334242838 2 10 68 -1 -0.12129224191368 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 10 68 -1 0.20592394362789 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 10.58333333333333 68 -1 0.4761613511563 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 11.25 68 -1 0.17854009472792 -0.5 -0.5 367232 1
i 5 190.17735334242838 2 11.75 68 -1 0.3991663648287 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 10 68 -1 -0.11859938319854 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 10.33333333333333 68 -1 -0.0773011911068 -0.5 -0.5 367232 1
i 3 190.17735334242838 2 10 68 -1 -0.4867165194699 -0.5 -0.5 367232 1
i 3 190.45020463847203 2 9.41666666666667 68 -1 0.30158755273121 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.33333333333333 68 -1 0.49340092315288 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.66666666666667 68 -1 -0.4556590810469 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 8.33333333333333 68 -1 0.12674874540356 -0.5 -0.5 2869 1
i 3 190.45020463847203 2 10 68 -1 -0.12683641325557 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10 68 -1 0.23085342737163 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10.58333333333333 68 -1 -0.3673466213852 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.25 68 -1 -0.36186215443185 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.75 68 -1 -0.06066750377485 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10 68 -1 -0.02265525822699 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 10.58333333333333 68 -1 -0.04465033305109 -0.5 -0.5 367232 1
i 4 190.45020463847203 2 11.25 68 -1 0.09698053668921 -0.5 -0.5 367232 1
i 5 190.45020463847203 2 11.75 68 -1 -0.0034532082165 -0.5 -0.5 367232 1
i 4 190.45020463847203 2 10.33333333333333 68 -1 0.10631372800834 -0.5 -0.5 367232 1
i 3 190.72305593451568 2 8.33333333333333 68 -1 0.37625349854981 -0.5 -0.5 2869 1
i 3 190.72305593451568 2 8 68 -1 0.01964121849885 -0.5 -0.5 2869 1
i 3 190.72305593451568 2 10.33333333333333 68 -1 -0.07134788919371 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 8 68 -1 0.41462763422691 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 8.33333333333333 68 -1 0.08501772613543 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 8 68 -1 0.3958607976256 -0.5 -0.5 2869 1
i 3 190.99590723055934 2 10.33333333333333 68 -1 -0.45512201403764 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 10.58333333333333 68 -1 0.27166301420291 -0.5 -0.5 367232 1
i 3 190.99590723055934 2 10.33333333333333 68 -1 0.38746202754833 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 8 68 -1 0.32953344636843 -0.5 -0.5 2869 1
i 2 191.26875852660302 2 11.75 68 -1 0.30371319294842 -0.5 -0.5 367232 1
i 2 191.26875852660302 2 12 68 -1 -0.131185789421 -0.5 -0.5 367232 1
i 2 191.26875852660302 2 11.75 68 -1 0.33132438455335 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 10.33333333333333 68 -1 0.46896734558993 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 10.33333333333333 68 -1 0.27294443879882 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 10.91666666666667 68 -1 -0.39221711754583 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 11.5 68 -1 -0.23118246795129 -0.5 -0.5 367232 1
i 5 191.26875852660302 2 12 68 -1 0.32845923535313 -0.5 -0.5 367232 1
i 3 191.26875852660302 2 10.58333333333333 68 -1 0.23120680576782 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 8 68 -1 -0.01901477258237 -0.5 -0.5 2869 1
i 2 191.54160982264668 2 11.75 68 -1 -0.02153272355077 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.58333333333333 68 -1 0.13512091503579 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.91666666666667 68 -1 -0.23907536187843 -0.5 -0.5 367232 1
i 3 191.54160982264668 2 10.58333333333333 68 -1 0.09016950151938 -0.5 -0.5 367232 1
i 4 191.81446111869033 2 8 68 -1 0.20598112666722 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 8.33333333333333 68 -1 -0.02439021777251 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 8 68 -1 0.02962452392076 -0.5 -0.5 2869 1
i 3 191.81446111869033 2 10.58333333333333 68 -1 -0.292108018597 -0.5 -0.5 367232 1
i 3 191.81446111869033 2 10.33333333333333 68 -1 -0.29163105645324 -0.5 -0.5 367232 1
i 3 192.087312414734 2 8 68 -1 -0.24598723309276 -0.5 -0.5 2869 1
i 5 192.087312414734 2 8 68 -1 0.19924636619189 -0.5 -0.5 2869 1
i 5 192.087312414734 2 8.66666666666667 68 -1 -0.07234868627055 -0.5 -0.5 2869 1
i 5 192.087312414734 2 9.16666666666667 68 -1 0.46053709174671 -0.5 -0.5 2869 1
i 5 192.087312414734 2 9.66666666666667 68 -1 -0.33418982887353 -0.5 -0.5 2869 1
i 3 192.087312414734 2 7.66666666666667 68 -1 -0.07551488639594 -0.5 -0.5 2869 1
i 3 192.087312414734 2 10.33333333333333 68 -1 0.3446717154375 -0.5 -0.5 367232 1
i 3 192.087312414734 2 10.58333333333333 68 -1 0.00970053922026 -0.5 -0.5 367232 1
i 3 192.087312414734 2 10.33333333333333 68 -1 0.19251904064728 -0.5 -0.5 367232 1
i 3 192.36016371077764 2 7.66666666666667 68 -1 -0.10129507639432 -0.5 -0.5 2869 1
i 3 192.36016371077764 2 10.33333333333333 68 -1 -0.20056198282954 -0.5 -0.5 367232 1
i 3 192.6330150068213 2 7.66666666666667 68 -1 -0.13442783307629 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 8 68 -1 0.29825977348794 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 7.66666666666667 68 -1 -0.05211222307513 -0.5 -0.5 2869 1
i 3 192.6330150068213 2 10.33333333333333 68 -1 -0.14884143286933 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 7.66666666666667 68 -1 0.10139550677771 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 7.66666666666667 68 -1 0.35021613256118 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 8.33333333333333 68 -1 0.22797296836504 -0.5 -0.5 2869 1
i 5 192.90586630286495 2 8.75 68 -1 -0.23084140965373 -0.5 -0.5 2869 1
i 4 192.90586630286495 2 9.41666666666667 68 -1 -0.3722336990517 -0.5 -0.5 2869 1
i 3 192.90586630286495 2 8 68 -1 0.24318695044273 -0.5 -0.5 2869 1
i 3 192.90586630286495 2 10.33333333333333 68 -1 -0.31176758631645 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 10.58333333333333 68 -1 0.23815283611189 -0.5 -0.5 367232 1
i 3 192.90586630286495 2 10.33333333333333 68 -1 0.04607033461297 -0.5 -0.5 367232 1
i 3 193.1787175989086 2 8 68 -1 0.41868772279687 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 8.33333333333333 68 -1 -0.07745902198534 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 8 68 -1 0.04915171860633 -0.5 -0.5 2869 1
i 3 193.1787175989086 2 10.33333333333333 68 -1 0.24773639048513 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 10.33333333333333 68 -1 -0.03394147989787 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 10.91666666666667 68 -1 0.28468920979598 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 11.5 68 -1 -0.46844498483579 -0.5 -0.5 367232 1
i 5 193.1787175989086 2 12 68 -1 0.30096050283273 -0.5 -0.5 367232 1
i 3 193.1787175989086 2 10 68 -1 -0.04636097916607 -0.5 -0.5 367232 1
i 3 193.45156889495226 2 8 68 -1 -0.23526797841579 -0.5 -0.5 2869 1
i 4 193.45156889495226 2 7.66666666666667 68 -1 0.03025061549533 -0.5 -0.5 2869 1
i 3 193.45156889495226 2 10 68 -1 -0.19341672360465 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 7.66666666666667 68 -1 -0.23561674039872 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 8 68 -1 0.35213158934093 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 7.66666666666667 68 -1 0.11313584829065 -0.5 -0.5 2869 1
i 3 193.72442019099591 2 10 68 -1 -0.10155072268959 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 10.33333333333333 68 -1 -0.05161973995882 -0.5 -0.5 367232 1
i 3 193.72442019099591 2 10 68 -1 0.41498647037883 -0.5 -0.5 367232 1
i 3 193.99727148703957 2 7.66666666666667 68 -1 0.15071464804984 -0.5 -0.5 2869 1
i 3 193.99727148703957 2 10 68 -1 -0.42222228319644 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 10 68 -1 -0.40633949711411 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 10.58333333333333 68 -1 0.17944806956747 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 11.25 68 -1 0.24574357049869 -0.5 -0.5 367232 1
i 5 193.99727148703957 2 11.75 68 -1 0.30630740899985 -0.5 -0.5 367232 1
i 3 193.99727148703957 2 10.33333333333333 68 -1 -0.17722918245933 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 7.66666666666667 68 -1 -0.06764270546612 -0.5 -0.5 2869 1
i 3 194.27012278308322 2 10.33333333333333 68 -1 -0.25014825339614 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 10.58333333333333 68 -1 -0.36461645766514 -0.5 -0.5 367232 1
i 3 194.27012278308322 2 10.33333333333333 68 -1 0.26163033433059 -0.5 -0.5 367232 1
i 3 194.54297407912688 2 7.66666666666667 68 -1 0.17932719911498 -0.5 -0.5 2869 1
i 3 194.54297407912688 2 8 68 -1 -0.13151642467775 -0.5 -0.5 2869 1
i 3 194.54297407912688 2 7.66666666666667 68 -1 0.13351418228663 -0.5 -0.5 2869 1
i 3 194.54297407912688 2 10.33333333333333 68 -1 -0.10751958744299 -0.5 -0.5 367232 1
i 3 194.54297407912688 2 10 68 -1 -0.27811098640868 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 7.66666666666667 68 -1 0.25990353145353 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 7.66666666666667 68 -1 -0.18995056556949 -0.5 -0.5 2869 1
i 4 194.81582537517053 2 8.33333333333333 68 -1 0.02997968120906 -0.5 -0.5 2869 1
i 5 194.81582537517053 2 8.75 68 -1 -0.02276083533636 -0.5 -0.5 2869 1
i 4 194.81582537517053 2 9.41666666666667 68 -1 -0.44258523241989 -0.5 -0.5 2869 1
i 3 194.81582537517053 2 10 68 -1 -0.07288992400228 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 10.33333333333333 68 -1 0.12235762766869 -0.5 -0.5 367232 1
i 3 194.81582537517053 2 10 68 -1 0.38061751490027 -0.5 -0.5 367232 1
i 3 195.0886766712142 2 7.66666666666667 68 -1 -0.29142624440708 -0.5 -0.5 2869 1
i 4 195.0886766712142 2 10 68 -1 0.38194565082602 -0.5 -0.5 367232 1
i 3 195.36152796725784 2 7.66666666666667 68 -1 -0.37895965786794 -0.5 -0.5 2869 1
i 3 195.36152796725784 2 10 68 -1 -0.33282322716528 -0.5 -0.5 367232 1
i 3 195.6343792633015 2 7.66666666666667 68 -1 -0.11869467367545 -0.5 -0.5 2869 1
i 3 195.6343792633015 2 8 68 -1 -0.45608082060773 -0.5 -0.5 2869 1
i 3 195.6343792633015 2 7.66666666666667 68 -1 -0.13532185849516 -0.5 -0.5 2869 1
i 3 195.6343792633015 2 10 68 -1 -0.48186994332551 -0.5 -0.5 367232 1
i 3 195.6343792633015 2 10.33333333333333 68 -1 0.46380676905558 -0.5 -0.5 367232 1
i 3 195.6343792633015 2 10 68 -1 -0.12752562310273 -0.5 -0.5 367232 1
i 3 195.90723055934515 2 7.66666666666667 68 -1 -0.00547259273854 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 7.66666666666667 68 -1 0.17415187487175 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 8.33333333333333 68 -1 -0.41799726416351 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 8.75 68 -1 0.3629978832834 -0.5 -0.5 2869 1
i 5 195.90723055934515 2 9.41666666666667 68 -1 -0.22393998953775 -0.5 -0.5 2869 1
i 3 195.90723055934515 2 8 68 -1 0.09543897665323 -0.5 -0.5 2869 1
i 3 195.90723055934515 2 10 68 -1 -0.32176606655403 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 10 68 -1 0.29310127275724 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 10.58333333333333 68 -1 0.00570169626664 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 11.25 68 -1 0.1493765508534 -0.5 -0.5 367232 1
i 5 195.90723055934515 2 11.75 68 -1 -0.04586284346129 -0.5 -0.5 367232 1
i 3 196.1800818553888 2 8 68 -1 -0.21220944784206 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 8.33333333333333 68 -1 -0.16745684446695 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 8 68 -1 0.39364899534605 -0.5 -0.5 2869 1
i 3 196.1800818553888 2 10 68 -1 -0.38337576984285 -0.5 -0.5 367232 1
i 3 196.45293315143246 2 8 68 -1 -0.42837781740966 -0.5 -0.5 2869 1
i 4 196.45293315143246 2 7.66666666666667 68 -1 0.0585495774629 -0.5 -0.5 2869 1
i 4 196.45293315143246 2 10 68 -1 -0.31455065166018 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 7.66666666666667 68 -1 -0.35419903031796 -0.5 -0.5 2869 1
i 3 196.72578444747612 2 8 68 -1 -0.21867659940841 -0.5 -0.5 2869 1
i 4 196.72578444747612 2 7.66666666666667 68 -1 -0.44919777496742 -0.5 -0.5 2869 1
i 3 196.72578444747612 2 10 68 -1 -0.36515409324506 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 10.33333333333333 68 -1 0.39670595130517 -0.5 -0.5 367232 1
i 3 196.72578444747612 2 10 68 -1 -0.35708992809435 -0.5 -0.5 367232 1
i 4 196.99863574351977 2 7.66666666666667 68 -1 -0.29732084789976 -0.5 -0.5 2869 1
i 3 196.99863574351977 2 10 68 -1 -0.43945657839863 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 10 68 -1 0.20879156792301 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 10.58333333333333 68 -1 -0.42647107633201 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 11.25 68 -1 0.10397514283706 -0.5 -0.5 367232 1
i 5 196.99863574351977 2 11.75 68 -1 -0.27574645739386 -0.5 -0.5 367232 1
i 3 196.99863574351977 2 10.33333333333333 68 -1 0.47899416499525 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 7.66666666666667 68 -1 -0.39894571915534 -0.5 -0.5 2869 1
i 3 197.27148703956343 2 10.33333333333333 68 -1 -0.15627722635446 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 10.58333333333333 68 -1 -0.27514640442265 -0.5 -0.5 367232 1
i 3 197.27148703956343 2 10.33333333333333 68 -1 -0.28151223630109 -0.5 -0.5 367232 1
i 3 197.54433833560708 2 7.66666666666667 68 -1 -0.26887766691929 -0.5 -0.5 2869 1
i 4 197.54433833560708 2 8 68 -1 0.43032059296906 -0.5 -0.5 2869 1
i 3 197.54433833560708 2 7.66666666666667 68 -1 0.26968122560543 -0.5 -0.5 2869 1
i 3 197.54433833560708 2 10.33333333333333 68 -1 0.47346681294677 -0.5 -0.5 367232 1
i 4 197.54433833560708 2 10 68 -1 0.22904179923743 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 7.66666666666667 68 -1 -0.26589601313798 -0.5 -0.5 2869 1
i 4 197.81718963165073 2 7.66666666666667 68 -1 0.36454817708617 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.33333333333333 68 -1 -0.19492284449459 -0.5 -0.5 2869 1
i 4 197.81718963165073 2 8.75 68 -1 0.48452623262484 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 9.41666666666667 68 -1 0.21352918204935 -0.5 -0.5 2869 1
i 4 197.81718963165073 2 7.66666666666667 68 -1 0.27918175465127 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.33333333333333 68 -1 -0.1444413365263 -0.5 -0.5 2869 1
i 5 197.81718963165073 2 8.75 68 -1 0.0145566949664 -0.5 -0.5 2869 1
i 4 197.81718963165073 2 9.41666666666667 68 -1 0.0980067630488 -0.5 -0.5 2869 1
i 3 197.81718963165073 2 10 68 -1 -0.41340662505064 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 10.33333333333333 68 -1 -0.04461695181296 -0.5 -0.5 367232 1
i 3 197.81718963165073 2 10 68 -1 0.11136707825036 -0.5 -0.5 367232 1
i 3 198.0900409276944 2 10 68 -1 -0.32552527710817 -0.5 -0.5 367232 1
i 3 198.36289222373804 2 10 68 -1 0.40665971892371 -0.5 -0.5 367232 1
i 3 198.6357435197817 2 9.41666666666667 68 -1 -0.2890239081636 -0.5 -0.5 2869 1
i 3 198.6357435197817 2 9.66666666666667 68 -1 -0.10613298608158 -0.5 -0.5 2869 1
i 3 198.6357435197817 2 9.41666666666667 68 -1 0.00252868088664 -0.5 -0.5 2869 1
i 4 198.6357435197817 2 10 68 -1 -0.08587145105446 -0.5 -0.5 367232 1
i 3 198.6357435197817 2 10.33333333333333 68 -1 -0.10609416181758 -0.5 -0.5 367232 1
i 3 198.6357435197817 2 10 68 -1 -0.10966739734702 -0.5 -0.5 367232 1
i 2 198.90859481582535 2 9.41666666666667 68 -1 -0.32036063275727 -0.5 -0.5 2869 1
i 3 198.90859481582535 2 10 68 -1 0.27837260868874 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10 68 -1 0.34029147407212 -0.5 -0.5 367232 1
i 4 198.90859481582535 2 10.58333333333333 68 -1 -0.00005336988796 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.25 68 -1 -0.38760551405405 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.75 68 -1 0.17652661079168 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10 68 -1 -0.40366786894877 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 10.58333333333333 68 -1 0.00480515204777 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.25 68 -1 0.05114739643806 -0.5 -0.5 367232 1
i 5 198.90859481582535 2 11.75 68 -1 -0.36327968372064 -0.5 -0.5 367232 1
i 2 199.72714870395635 2 11.75 68 -1 -0.34388751258462 -0.5 -0.5 367232 1
i 3 199.72714870395635 2 12 68 -1 0.35508967984089 -0.5 -0.5 367232 1
i 3 199.72714870395635 2 11.75 68 -1 -0.30276911419848 -0.5 -0.5 367232 1
i 2 200 2 11.75 68 -1 -0.24176271569291 -0.5 -0.5 367232 1
</CsScore>
</CsoundSynthesizer>
