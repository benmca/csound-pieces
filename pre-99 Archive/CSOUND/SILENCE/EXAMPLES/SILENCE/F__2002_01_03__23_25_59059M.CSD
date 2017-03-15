<CsoundSynthesizer>
<CsOptions>
csound -RWdo C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-03--23-25-59.059.mml.wav C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-03--23-25-59.059.mml.orc C:\Cygwin\home\mkg\Silence\examples\Silence\f--2002-01-03--23-25-59.059.mml.sco
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
SoundFont bright guitar
Flute, James Kelley
Harpsichord, James Kelley
Xing by Andrew Horner
Heavy metal model, Perry Cook
FM moderate index 2, Michael Gogins
</CsArrangement>
<CsScore>
i 5 0 2 10.66666666666667 71.94165215496274 -1 0.19565217391304 -0.5 -0.5 850 1
i 4 0.08002667555852 2 7 61.40386154452037 -1 -0.15217391304348 -0.5 -0.5 850 1
i 5 0.16005335111704 2 7 79.24928276827818 -1 -0.28260869565217 -0.5 -0.5 850.0000000000011 1
i 2 0.24008002667556 2 11.08333333333333 66.09865303795812 -1 0.02173913043478 -0.5 -0.5 850.0000000001012 1
i 6 0.32010670223408 2 6.08333333333333 62.96495464369059 -1 -0.45652173913043 -0.5 -0.5 850.0000000023883 1
i 6 0.4001333777926 2 9 74.69504630725206 -1 0.10869565217391 -0.5 -0.5 850.0000000277088 1
i 3 0.48016005335112 2 9.08333333333333 63.31486558006712 -1 0.02173913043478 -0.5 -0.5 850.0000002050267 1
i 5 0.56018672890964 2 7.33333333333333 75.69685368431226 -1 0.10869565217391 -0.5 -0.5 850.0000011119773 1
i 3 0.64021340446816 2 11.08333333333333 68.37914897431708 -1 0.06521739130435 -0.5 -0.5 850.0000048034158 1
i 5 0.72024008002668 2 6.66666666666667 60.72940478141828 -1 -0.10869565217391 -0.5 -0.5 850.0000174358254 1
i 6 0.8002667555852 2 8 78.23708803340276 -1 -0.23913043478261 -0.5 -0.5 850.0000551646693 1
i 2 0.88029343114371 2 10.33333333333333 64.46172091228968 -1 -0.28260869565217 -0.5 -0.5 850.0001561485473 1
i 5 0.96032010670223 2 6.5 69.56838755612588 -1 0.02173913043478 -0.5 -0.5 850.0004031257139 1
i 4 1.04034678226075 2 10.75 71.07500118162868 -1 -0.02173913043478 -0.5 -0.5 850.0009632138809 1
i 5 1.12037345781927 2 7.5 60.59589351207846 -1 0.06521739130435 -0.5 -0.5 850.0021543866648 1
i 5 1.20040013337779 2 8.08333333333333 79.89900956369196 -1 0.19565217391304 -0.5 -0.5 850.0045515412565 1
i 2 1.28042680893631 2 10 65.57375722856258 -1 0.02173913043478 -0.5 -0.5 850.0091492057373 1
i 6 1.36045348449483 2 6.08333333333333 63.74940706661501 -1 -0.06521739130435 -0.5 -0.5 850.0176027216734 1
i 6 1.44048016005335 2 10.08333333333333 73.74552505353823 -1 -0.10869565217391 -0.5 -0.5 850.0325751216081 1
i 4 1.52050683561187 2 8.66666666666667 62.96475883143263 -1 0.15217391304348 -0.5 -0.5 850.058222804633 1
i 5 1.60053351117039 2 7.5 76.85754351056077 -1 0.02173913043478 -0.5 -0.5 850.1008593570928 1
i 3 1.68056018672891 2 10 67.64763793646873 -1 -0.15217391304348 -0.5 -0.5 850.1698432880295 1
i 6 1.76058686228743 2 6.5 61.56838795934345 -1 -0.19565217391304 -0.5 -0.5 850.2787418279619 1
i 6 1.84061353784595 2 9.33333333333333 77.09560808364087 -1 -0.06521739130435 -0.5 -0.5 850.446829015268 1
i 3 1.92064021340447 2 9 64.06910745440887 -1 -0.15217391304348 -0.5 -0.5 850.7009817748068 1
i 5 2.00066688896299 2 6.75 71.90838872688595 -1 -0.06521739130435 -0.5 -0.5 851.0780422607595 1
i 4 2.08069356452151 2 10 70.148649713453 -1 -0.10869565217391 -0.5 -0.5 851.6277180549235 1
i 5 2.16072024008003 2 7.16666666666667 60.08056994764024 -1 0.32608695652174 -0.5 -0.5 852.4160935401204 1
i 5 2.24074691563855 2 8.33333333333333 79.93539749831439 -1 -0.10869565217391 -0.5 -0.5 853.529825566271 1
i 2 2.32077359119707 2 10 65.17061618351923 -1 -0.23913043478261 -0.5 -0.5 855.0810940692462 1
i 6 2.40080026675559 2 6 65.07544730870174 -1 -0.23913043478261 -0.5 -0.5 857.2133732920113 1
i 6 2.4808269423141 2 10.33333333333333 72.87901317559867 -1 -0.10869565217391 -0.5 -0.5 860.1080814356912 1
i 4 2.56085361787262 2 8.41666666666667 62.36303787373021 -1 -0.19565217391304 -0.5 -0.5 863.9921557287369 1
i 5 2.64088029343114 2 7.75 78.02532151303727 -1 -0.10869565217391 -0.5 -0.5 869.146585902811 1
i 2 2.72090696898966 2 10 66.87903716149184 -1 0.15217391304348 -0.5 -0.5 875.9159218364409 1
i 6 2.80093364454818 2 6.33333333333333 62.30928180800166 -1 0.06521739130435 -0.5 -0.5 884.7187506880576 1
i 6 2.8809603201067 2 9.58333333333333 75.92040851363865 -1 -0.10869565217391 -0.5 -0.5 896.0591152969927 1
i 3 2.96098699566522 2 9.58333333333333 63.66751606062286 -1 -0.02173913043478 -0.5 -0.5 910.5388191903535 1
i 5 3.04101367122374 2 7 73.9952810415424 -1 -0.19565217391304 -0.5 -0.5 928.870534502826 1
i 3 3.12104034678226 2 11 69.2481729372389 -1 -0.06521739130435 -0.5 -0.5 951.8915979050969 1
i 5 3.20106702234078 2 6 60.06948907505019 -1 -0.23913043478261 -0.5 -0.5 980.5783467549171 1
i 6 3.2810936978993 2 8.5 79.35427242068552 -1 -0.15217391304348 -0.5 -0.5 1016.0608137389457 1
i 2 3.36112037345782 2 10.83333333333333 64.83916712816259 -1 -0.15217391304348 -0.5 -0.5 1059.6375639577518 1
i 6 3.44114704901634 2 6.25 66.98900406070327 -1 0.15217391304348 -0.5 -0.5 1112.7904244928322 1
i 5 3.52117372457486 2 10.58333333333333 72.05172359805823 -1 -0.15217391304348 -0.5 -0.5 1177.1988238199701 1
i 4 3.60120040013338 2 7.83333333333333 61.52077421678374 -1 -0.02173913043478 -0.5 -0.5 1254.753427883093 1
i 5 3.6812270756919 2 7.83333333333333 79.12554130169295 -1 -0.23913043478261 -0.5 -0.5 1347.568732133064 1
i 2 3.76125375125042 2 11.08333333333333 66.17969475356179 -1 -0.06521739130435 -0.5 -0.5 1457.9942452929502 1
i 6 3.84128042680894 2 6.16666666666667 62.8869759533406 -1 -0.23913043478261 -0.5 -0.5 1588.623881950435 1
i 6 3.92130710236746 2 9.75 74.82910837666518 -1 -0.19565217391304 -0.5 -0.5 1742.3031681803025 1
i 3 4.00133377792598 2 9.08333333333333 63.35237768482635 -1 -0.19565217391304 -0.5 -0.5 1922.1338580887389 1
i 5 4.0813604534845 2 7.33333333333333 75.5306318328112 -1 0.23913043478261 -0.5 -0.5 2131.4755601890847 1
i 3 4.16138712904302 2 11.08333333333333 68.47440466505365 -1 -0.32608695652174 -0.5 -0.5 2373.9439815044293 1
i 5 4.24141380460153 2 6.75 60.62639587122808 -1 -0.23913043478261 -0.5 -0.5 2653.405414758138 1
i 6 4.32144048016005 2 8.91666666666667 78.38040043215406 -1 0.06521739130435 -0.5 -0.5 2973.9671203269713 1
i 2 4.40146715571857 2 10.25 64.50902384223966 -1 -0.19565217391304 -0.5 -0.5 3339.9632899945764 1
i 5 4.48149383127709 2 6.41666666666667 69.25793355520443 -1 0.28260869565217 -0.5 -0.5 3755.936323981408 1
i 5 4.56152050683561 2 10 71.19344596588547 -1 -0.19565217391304 -0.5 -0.5 4226.613206073226 1
i 5 4.64154718239413 2 7.58333333333333 60.69026251134419 -1 -0.15217391304348 -0.5 -0.5 4756.876823559967 1
i 5 4.72157385795265 2 8 79.84608464758138 -1 -0.19565217391304 -0.5 -0.5 5351.732148562481 1
i 2 4.80160053351117 2 10 65.63500248022429 -1 -0.28260869565217 -0.5 -0.5 6016.26727439682 1
i 6 4.88162720906969 2 6 63.61914016922103 -1 -0.23913043478261 -0.5 -0.5 6755.60938393863 1
i 6 4.96165388462821 2 10 73.86530887748495 -1 -0.02173913043478 -0.5 -0.5 7574.875815348866 1
i 4 5.04168056018673 2 8.66666666666667 63.02242562093374 -1 -0.15217391304348 -0.5 -0.5 8479.120482680692 1
i 5 5.12170723574525 2 7.66666666666667 76.70685710436233 -1 -0.06521739130435 -0.5 -0.5 9473.276003323284 1
i 3 5.20173391130377 2 11.16666666666667 67.74711811975848 -1 0.06521739130435 -0.5 -0.5 10562.091979338873 1
i 6 5.28176058686229 2 6.5 61.4582044335048 -1 -0.32608695652174 -0.5 -0.5 11750.069973795726 1
i 6 5.36178726242081 2 9.16666666666667 77.25056267271597 -1 0.02173913043478 -0.5 -0.5 13041.395814400608 1
i 3 5.44181393797933 2 9.91666666666667 64.1237088652005 -1 0.06521739130435 -0.5 -0.5 14439.869943252685 1
i 5 5.52184061353785 2 6.75 71.60555181897588 -1 -0.23913043478261 -0.5 -0.5 15948.836611540011 1
i 4 5.60186728909637 2 10 70.27243824808315 -1 0.06521739130435 -0.5 -0.5 17571.112789665698 1
i 5 5.68189396465488 2 7.33333333333333 60.12429331365662 -1 -0.02173913043478 -0.5 -0.5 19308.91772488727 1
i 5 5.7619206402134 2 8.33333333333333 79.96811945386527 -1 -0.15217391304348 -0.5 -0.5 21163.804128441036 1
i 2 5.84194731577192 2 10.91666666666667 65.2185959624351 -1 0.02173913043478 -0.5 -0.5 23136.592010814707 1
i 6 5.92197399133044 2 6 64.86452571161257 -1 -0.15217391304348 -0.5 -0.5 25227.30620601445 1
i 6 6.00200066688896 2 10.33333333333333 72.9900369450192 -1 -0.06521739130435 -0.5 -0.5 27435.118632245183 1
i 4 6.08202734244748 2 8.5 62.45955385764148 -1 -0.23913043478261 -0.5 -0.5 29758.296326528485 1
i 5 6.162054018006 2 7.66666666666667 77.86958529236566 -1 -0.10869565217391 -0.5 -0.5 32194.15626383122 1
i 2 6.24208069356452 2 10 66.97973658408633 -1 0.02173913043478 -0.5 -0.5 34739.02792696754 1
i 6 6.32210736912304 2 6.33333333333333 62.22310102143959 -1 -0.10869565217391 -0.5 -0.5 37388.224531872496 1
i 6 6.40213404468156 2 9.5 76.07329308209523 -1 0.10869565217391 -0.5 -0.5 40136.02373414787 1
i 3 6.48216072024008 2 9.41666666666667 63.71679498553483 -1 -0.06521739130435 -0.5 -0.5 42975.65854768784 1
i 5 6.5621873957986 2 6 73.74813414965006 -1 0.19565217391304 -0.5 -0.5 45899.319095669896 1
i 3 6.64221407135712 2 11 69.36069891833706 -1 -0.10869565217391 -0.5 -0.5 48898.16568950433 1
i 5 6.72224074691564 2 6.91666666666667 60.03611674027786 -1 -0.06521739130435 -0.5 -0.5 51962.353594049695 1
i 6 6.80226742247416 2 8.66666666666667 79.46023855407364 -1 -0.06521739130435 -0.5 -0.5 55081.069689357755 1
i 2 6.88229409803268 2 10.58333333333333 64.88111082904635 -1 -0.02173913043478 -0.5 -0.5 58242.58108249744 1
i 6 6.9623207735912 2 6.25 66.70889940005749 -1 -0.10869565217391 -0.5 -0.5 61434.29555993408 1
i 5 7.04234744914972 2 10.58333333333333 72.1611801760011 -1 -0.10869565217391 -0.5 -0.5 64642.83360398494 1
i 4 7.12237412470824 2 7.91666666666667 61.63798611197934 -1 -0.28260869565217 -0.5 -0.5 67854.1115286644 1
i 5 7.20240080026676 2 7.83333333333333 78.99493571481597 -1 0.15217391304348 -0.5 -0.5 71053.43512347364 1
i 2 7.28242747582528 2 11.16666666666667 66.26364895860597 -1 0.02173913043478 -0.5 -0.5 74225.60303115271 1
i 6 7.3624541513838 2 6.16666666666667 62.81170134627418 -1 -0.10869565217391 -0.5 -0.5 77355.01892983093 1
i 6 7.44248082694232 2 9.75 74.96553214129456 -1 -0.23913043478261 -0.5 -0.5 80425.81144409471 1
i 3 7.52250750250084 2 9.08333333333333 63.38984407567155 -1 0.02173913043478 -0.5 -0.5 83421.96057581532 1
i 5 7.60253417805935 2 7.25 75.35794344327178 -1 -0.06521739130435 -0.5 -0.5 86327.42932657979 1
i 3 7.68256085361787 2 11 68.57046014885655 -1 0.15217391304348 -0.5 -0.5 89126.29908147086 1
i 5 7.76258752917639 2 6.75 60.52817464524033 -1 -0.10869565217391 -0.5 -0.5 91802.90724072364 1
i 6 7.84261420473491 2 8 78.52126008308197 -1 -0.06521739130435 -0.5 -0.5 94341.98552313818 1
i 2 7.92264088029343 2 10.33333333333333 64.55522586213462 -1 0.02173913043478 -0.5 -0.5 96728.79732442259 1
i 5 8.00266755585195 2 6.58333333333333 68.94880521541373 -1 0.10869565217391 -0.5 -0.5 98949.27249587764 1
i 5 8.08269423141047 2 10.75 71.31063708541927 -1 -0.3695652173913 -0.5 -0.5 100990.13791467818 1
i 5 8.16272090696899 2 7.5 60.78928370246922 -1 -0.15217391304348 -0.5 -0.5 102839.04224667755 1
i 5 8.24274758252751 2 8.08333333333333 79.78249542463846 -1 -0.10869565217391 -0.5 -0.5 104484.67335602375 1
i 2 8.32277425808603 2 11.08333333333333 65.69847529187673 -1 0.10869565217391 -0.5 -0.5 105916.86689236786 1
i 6 8.40280093364455 2 6 63.49825231934364 -1 -0.10869565217391 -0.5 -0.5 107126.70468511526 1
i 6 8.48282760920307 2 10 73.9865977358968 -1 0.10869565217391 -0.5 -0.5 108106.60169367662 1
i 3 8.56285428476159 2 8.91666666666667 63.07570485458555 -1 -0.19565217391304 -0.5 -0.5 108850.38040133122 1
i 5 8.64288096032011 2 7.5 76.55659938144524 -1 -0.28260869565217 -0.5 -0.5 109353.33169607795 1
i 3 8.72290763587863 2 11.08333333333333 67.84555479479238 -1 -0.28260869565217 -0.5 -0.5 109612.26145239235 1
i 6 8.80293431143715 2 6.5 61.34655052823432 -1 -0.15217391304348 -0.5 -0.5 109625.52221053527 1
i 6 8.88296098699567 2 9.08333333333333 77.4045953209048 -1 -0.15217391304348 -0.5 -0.5 109393.02954216315 1
i 3 8.96298766255419 2 9.91666666666667 64.17776502189663 -1 -0.10869565217391 -0.5 -0.5 108916.26288950343 1
i 5 9.0430143381127 2 6.75 71.29942580363583 -1 0.02173913043478 -0.5 -0.5 108198.25086717759 1
i 4 9.12304101367122 2 10 70.39626406220592 -1 -0.02173913043478 -0.5 -0.5 107243.54121775688 1
i 5 9.20306768922974 2 7.41666666666667 60.17641874042539 -1 0.15217391304348 -0.5 -0.5 106058.15581114811 1
i 5 9.28309436478826 2 8.41666666666667 79.9894526609018 -1 -0.19565217391304 -0.5 -0.5 104649.53127085016 1
i 2 9.36312104034678 2 10 65.2679906388341 -1 -0.15217391304348 -0.5 -0.5 103026.44599399924 1
i 6 9.4431477159053 2 6 64.66452590641732 -1 -0.06521739130435 -0.5 -0.5 101198.93450410558 1
i 6 9.52317439146382 2 10.58333333333333 73.1019433505437 -1 0.32608695652174 -0.5 -0.5 99178.19023285854 1
i 4 9.60320106702234 2 8.41666666666667 62.55109797397912 -1 0.02173913043478 -0.5 -0.5 96976.45796798058 1
i 5 9.68322774258086 2 7.66666666666667 77.71365499560689 -1 0.15217391304348 -0.5 -0.5 94606.91732576732 1
i 2 9.76325441813938 2 10 67.08133120263216 -1 -0.15217391304348 -0.5 -0.5 92083.55870794441 1
i 6 9.8432810936979 2 6.41666666666667 62.13316837984716 -1 -0.06521739130435 -0.5 -0.5 89421.05328139944 1
i 6 9.92330776925642 2 9.58333333333333 76.22748897411616 -1 -0.06521739130435 -0.5 -0.5 86634.61857524405 1
i 3 10.00333444481494 2 9.66666666666667 63.76776683486713 -1 -0.41304347826087 -0.5 -0.5 83739.88132189956 1
i 5 10.08336112037346 2 6.91666666666667 73.49082127720364 -1 -0.06521739130435 -0.5 -0.5 80752.7391773063 1
i 3 10.16338779593198 2 11 69.47568649653762 -1 0.02173913043478 -0.5 -0.5 77689.22294011558 1
i 5 10.2434144714905 2 6 60.01355833172609 -1 0.06521739130435 -0.5 -0.5 74565.3608514516 1
i 6 10.32344114704902 2 8.41666666666667 79.55858099532504 -1 0.23913043478261 -0.5 -0.5 71397.04649648655 1
i 2 10.40346782260754 2 10.75 64.92326463486891 -1 -0.06521739130435 -0.5 -0.5 68199.91174799559 1
i 6 10.48349449816606 2 6.16666666666667 66.4358113103141 -1 -0.15217391304348 -0.5 -0.5 64989.206091908956 1
i 5 10.56352117372458 2 10.5 72.27021190578073 -1 -0.15217391304348 -0.5 -0.5 61779.6835575945 1
i 4 10.6435478492831 2 8 61.75473970189286 -1 -0.23913043478261 -0.5 -0.5 58585.498343401145 1
i 5 10.72357452484162 2 7.91666666666667 78.8582722470675 -1 -0.02173913043478 -0.5 -0.5 55420.11008326974 1
i 2 10.80360120040013 2 11.16666666666667 66.35046959371562 -1 -0.02173913043478 -0.5 -0.5 52296.19954555335 1
i 6 10.88362787595865 2 6.16666666666667 62.73797804842937 -1 0.06521739130435 -0.5 -0.5 49225.595393268166 1
i 6 10.96365455151717 2 9.83333333333333 75.10437691486733 -1 -0.02173913043478 -0.5 -0.5 46219.21246856255 1
i 3 11.04368122707569 2 9 63.42785011163427 -1 0.02173913043478 -0.5 -0.5 43287.00189600426 1
i 5 11.12370790263421 2 7.16666666666667 75.17764071633394 -1 0.15217391304348 -0.5 -0.5 40437.913132072215 1
i 3 11.20373457819273 2 11 68.66775095162046 -1 -0.02173913043478 -0.5 -0.5 37679.86792462222 1
i 5 11.28376125375125 2 6.91666666666667 60.43576177535391 -1 -0.10869565217391 -0.5 -0.5 35019.7459885828 1
i 6 11.36378792930977 2 8.75 78.65933160552058 -1 -0.02173913043478 -0.5 -0.5 32463.382055054164 1
i 2 11.44381460486829 2 10.5 64.60040159550199 -1 0.02173913043478 -0.5 -0.5 30015.57381244306 1
i 6 11.52384128042681 2 6.41666666666667 68.64147421474897 -1 -0.10869565217391 -0.5 -0.5 27680.100132138865 1
i 5 11.60386795598533 2 10.66666666666667 71.42656453215382 -1 0.06521739130435 -0.5 -0.5 25459.74885911511 1
i 4 11.68389463154385 2 7.66666666666667 60.89251075331342 -1 -0.02173913043478 -0.5 -0.5 23356.353351037666 1
i 5 11.76392130710237 2 8 79.70852690724895 -1 -0.06521739130435 -0.5 -0.5 21370.836868953036 1
i 2 11.84394798266089 2 11 65.76430556179344 -1 0.02173913043478 -0.5 -0.5 19503.26385911432 1
i 6 11.92397465821941 2 6 63.38617313295126 -1 -0.02173913043478 -0.5 -0.5 17752.897119309815 1
i 6 12.00400133377793 2 10 74.10949602888816 -1 -0.23913043478261 -0.5 -0.5 16118.259814248131 1
i 3 12.08402800933645 2 8.91666666666667 63.12501846438916 -1 -0.32608695652174 -0.5 -0.5 14597.201292843723 1
i 5 12.16405468489497 2 7.58333333333333 76.40627379740366 -1 -0.19565217391304 -0.5 -0.5 13186.965665078334 1
i 3 12.24408136045349 2 11.08333333333333 67.94295055129714 -1 -0.06521739130435 -0.5 -0.5 11884.262116665595 1
i 6 12.32410803601201 2 6.58333333333333 61.23403716197859 -1 0.02173913043478 -0.5 -0.5 10685.335974929998 1
i 6 12.40413471157053 2 9.16666666666667 77.55750301139562 -1 -0.06521739130435 -0.5 -0.5 9586.039587847268 1
i 2 12.48416138712905 2 9 64.23107331698037 -1 -0.23913043478261 -0.5 -0.5 8581.902138602798 1
i 5 12.56418806268756 2 6.58333333333333 70.99084966044268 -1 0.02173913043478 -0.5 -0.5 7668.197588687799 1
i 4 12.64421473824608 2 10.91666666666667 70.51982980022902 -1 -0.10869565217391 -0.5 -0.5 6840.010021738747 1
i 5 12.7242414138046 2 7.16666666666667 60.2363975399259 -1 0.02173913043478 -0.5 -0.5 6092.295746230847 1
i 5 12.80426808936312 2 8.16666666666667 79.99929921288012 -1 -0.41304347826087 -0.5 -0.5 5419.941605919168 1
i 2 12.88429476492164 2 10 65.31890528053967 -1 0.02173913043478 -0.5 -0.5 4817.819040749461 1
i 6 12.96432144048016 2 6.08333333333333 64.47553533488613 -1 -0.10869565217391 -0.5 -0.5 4280.83353603074 1
i 6 13.04434811603868 2 10.25 73.21483219223501 -1 -0.23913043478261 -0.5 -0.5 3803.969192249709 1
i 4 13.1243747915972 2 8.41666666666667 62.63744294376417 -1 0.10869565217391 -0.5 -0.5 3382.328240384453 1
i 5 13.20440146715572 2 7.66666666666667 77.5580087905599 -1 0.06521739130435 -0.5 -0.5 3011.1654164461484 1
i 2 13.28442814271424 2 10.91666666666667 67.18344833672221 -1 -0.15217391304348 -0.5 -0.5 2685.9171928973037 1
i 6 13.36445481827276 2 6.41666666666667 62.03945277026392 -1 -0.32608695652174 -0.5 -0.5 2402.225942389833 1
i 6 13.44448149383128 2 9.41666666666667 76.38267740784366 -1 -0.28260869565217 -0.5 -0.5 2155.9591799499435 1
i 3 13.5245081693898 2 9.58333333333333 63.82017132725487 -1 -0.28260869565217 -0.5 -0.5 1943.2240925168999 1
i 5 13.60453484494832 2 6 73.22400211889546 -1 -0.06521739130435 -0.5 -0.5 1760.3776190317371 1
i 4 13.68456152050684 2 11.16666666666667 69.59291983000989 -1 -0.23913043478261 -0.5 -0.5 1604.0323896814293 1
i 5 13.76458819606536 2 6 60.00185283189552 -1 -0.19565217391304 -0.5 -0.5 1471.058869248536 1
i 6 13.84461487162388 2 8.5 79.6485451605883 -1 -0.10869565217391 -0.5 -0.5 1358.584076798413 1
i 2 13.9246415471824 2 10.83333333333333 64.96582815333774 -1 -0.23913043478261 -0.5 -0.5 1263.987272341211 1
i 6 14.00466822274092 2 6 66.1705166627114 -1 -0.15217391304348 -0.5 -0.5 1184.8930109835976 1
i 5 14.08469489829944 2 10.5 72.37902055884214 -1 0.06521739130435 -0.5 -0.5 1119.1619669334889 1
i 4 14.16472157385796 2 8 61.87027056126675 -1 -0.02173913043478 -0.5 -0.5 1064.879924166174 1
i 5 14.24474824941648 2 7 78.71639723571447 -1 0.23913043478261 -0.5 -0.5 1020.3453183341553 1
i 2 14.32477492497499 2 11 66.44005673402279 -1 -0.06521739130435 -0.5 -0.5 984.0556964220988 1
i 6 14.40480160053351 2 6.25 62.66468614510904 -1 0.15217391304348 -0.5 -0.5 954.6934375881293 1
i 6 14.48482827609203 2 9.66666666666667 75.24566331159852 -1 -0.19565217391304 -0.5 -0.5 931.1110515061623 1
i 3 14.56485495165055 2 9.33333333333333 63.466907675069 -1 -0.15217391304348 -0.5 -0.5 912.316340257203 1
i 5 14.64488162720907 2 7.58333333333333 74.98867323633915 -1 -0.10869565217391 -0.5 -0.5 897.4576773287772 1
i 3 14.72490830276759 2 11.08333333333333 68.76669130770004 -1 -0.41304347826087 -0.5 -0.5 885.8096234604718 1
i 5 14.80493497832611 2 6.66666666666667 60.35015689623991 -1 -0.10869565217391 -0.5 -0.5 876.7590647627801 1
i 6 14.88496165388463 2 8.66666666666667 78.79420599013133 -1 0.23913043478261 -0.5 -0.5 869.7920245157779 1
i 2 14.96498832944315 2 10.41666666666667 64.64465276447336 -1 -0.10869565217391 -0.5 -0.5 864.4812670269855 1
i 6 15.04501500500167 2 6.33333333333333 68.33644859834726 -1 -0.02173913043478 -0.5 -0.5 860.4747805099893 1
i 5 15.12504168056019 2 10.66666666666667 71.54124969469494 -1 -0.19565217391304 -0.5 -0.5 857.4851966579247 1
i 4 15.20506835611871 2 7.66666666666667 60.99947748727078 -1 0.15217391304348 -0.5 -0.5 855.2801778493771 1
i 5 15.28509503167723 2 7 79.62451393630867 -1 -0.28260869565217 -0.5 -0.5 853.6737790570868 1
i 2 15.36512170723575 2 11 65.83262463605537 -1 -0.06521739130435 -0.5 -0.5 852.5187707488893 1
i 6 15.44514838279427 2 6.16666666666667 63.28223671512238 -1 -0.19565217391304 -0.5 -0.5 851.6998914940738 1
i 6 15.52517505835279 2 9 74.23411864608701 -1 -0.06521739130435 -0.5 -0.5 851.1279846425826 1
i 3 15.60520173391131 2 8 63.17085401733873 -1 0.15217391304348 -0.5 -0.5 850.7349622699185 1
i 5 15.68522840946983 2 7.5 76.2552350516626 -1 0.02173913043478 -0.5 -0.5 850.4695314422462 1
i 3 15.76525508502834 2 11.08333333333333 68.03938861306223 -1 -0.06521739130435 -0.5 -0.5 850.2936125540804 1
i 6 15.84528176058686 2 6.66666666666667 61.12133942023743 -1 0.02173913043478 -0.5 -0.5 850.179376771928 1
i 6 15.92530843614538 2 9.08333333333333 77.70910228868846 -1 0.15217391304348 -0.5 -0.5 850.106829187228 1
i 2 16.0053351117039 2 10.08333333333333 64.28347268723594 -1 -0.02173913043478 -0.5 -0.5 850.061865818371 1
i 5 16.08536178726242 2 6.66666666666667 70.6805788240391 -1 -0.02173913043478 -0.5 -0.5 850.0347357658436 1
i 4 16.16538846282094 2 10 70.64287451528948 -1 -0.02173913043478 -0.5 -0.5 850.0188442736436 1
i 5 16.24541513837946 2 7.33333333333333 60.30368804591363 -1 -0.15217391304348 -0.5 -0.5 850.0098378476999 1
i 5 16.32544181393798 2 8.08333333333333 79.99763890137118 -1 -0.10869565217391 -0.5 -0.5 850.0049186080902 1
i 2 16.4054684894965 2 10 65.37143976956155 -1 0.10869565217391 -0.5 -0.5 850.0023414112367 1
i 6 16.48549516505502 2 6.08333333333333 64.29754391892364 -1 -0.15217391304348 -0.5 -0.5 850.0010537075111 1
i 6 16.56552184061354 2 10.33333333333333 73.32878911901102 -1 0.32608695652174 -0.5 -0.5 850.0004443722945 1
i 4 16.64554851617206 2 8.5 62.71846312024972 -1 -0.15217391304348 -0.5 -0.5 850.0001736784066 1
i 5 16.72557519173058 2 7.66666666666667 77.4030150497315 -1 0.02173913043478 -0.5 -0.5 850.0000620210803 1
i 3 16.8056018672891 2 10 67.28572891001293 -1 -0.28260869565217 -0.5 -0.5 850.0000198616402 1
i 6 16.88562854284762 2 6.5 61.94205601879257 -1 0.10869565217391 -0.5 -0.5 850.0000055618895 1
i 6 16.96565521840614 2 9.33333333333333 76.53852975870075 -1 -0.10869565217391 -0.5 -0.5 850.0000013148333 1
i 3 17.04568189396466 2 9.66666666666667 63.87370439063537 -1 -0.15217391304348 -0.5 -0.5 850.0000002492777 1
i 5 17.12570856952318 2 6 72.94849263826018 -1 0.02173913043478 -0.5 -0.5 850.0000000350237 1
i 4 17.20573524508169 2 10 69.71212019376588 -1 0.06521739130435 -0.5 -0.5 850.0000000031989 1
i 5 17.28576192064022 2 6 60.00089240458306 -1 -0.10869565217391 -0.5 -0.5 850.0000000001492 1
i 6 17.36578859619874 2 8.33333333333333 79.72942628061908 -1 -0.15217391304348 -0.5 -0.5 850.000000000002 1
i 2 17.44581527175726 2 10.66666666666667 65.00899348511973 -1 -0.02173913043478 -0.5 -0.5 850 1
i 6 17.52584194731577 2 6.08333333333333 65.91374144170649 -1 -0.10869565217391 -0.5 -0.5 850 1
i 5 17.60586862287429 2 10.5 72.48781130328493 -1 -0.23913043478261 -0.5 -0.5 850 1
i 4 17.68589529843282 2 8.08333333333333 61.98382923540369 -1 -0.23913043478261 -0.5 -0.5 849.9999999999993 1
i 5 17.76592197399133 2 7 78.57017567246233 -1 0.23913043478261 -0.5 -0.5 849.9999999999324 1
i 2 17.84594864954985 2 11.08333333333333 66.53225376199913 -1 0.15217391304348 -0.5 -0.5 849.9999999982311 1
i 6 17.92597532510837 2 6.33333333333333 62.59078155749235 -1 -0.19565217391304 -0.5 -0.5 849.9999999781904 1
i 6 18.00600200066689 2 9.66666666666667 75.38936448402988 -1 -0.10869565217391 -0.5 -0.5 849.9999998319685 1
i 3 18.08602867622541 2 9.33333333333333 63.50743234952012 -1 0.02173913043478 -0.5 -0.5 849.9999990620411 1
i 5 18.16605535178393 2 7.33333333333333 74.79014659721925 -1 -0.06521739130435 -0.5 -0.5 849.9999958599429 1
i 3 18.24608202734245 2 11.08333333333333 68.86764775045755 -1 -0.19565217391304 -0.5 -0.5 849.9999847179936 1
i 5 18.32610870290097 2 6.66666666666667 60.27230669676207 -1 -0.32608695652174 -0.5 -0.5 849.9999509969093 1
i 6 18.40613537845949 2 8.66666666666667 78.92539205191042 -1 -0.10869565217391 -0.5 -0.5 849.9998597615105 1
i 2 18.48616205401801 2 10.5 64.68810566103001 -1 0.02173913043478 -0.5 -0.5 849.9996346202298 1
i 6 18.56618872957653 2 6.33333333333333 68.03429232803204 -1 0.19565217391304 -0.5 -0.5 849.9991201818557 1
i 5 18.64621540513505 2 10.66666666666667 71.65474327078934 -1 -0.02173913043478 -0.5 -0.5 849.9980190094668 1
i 4 18.72624208069357 2 7.66666666666667 61.10968292979884 -1 -0.06521739130435 -0.5 -0.5 849.9957905625455 1
i 5 18.80626875625208 2 7 79.53085202293549 -1 0.02173913043478 -0.5 -0.5 849.9914955566421 1
i 2 18.88629543181061 2 11.08333333333333 65.90355924905563 -1 -0.06521739130435 -0.5 -0.5 849.9835644511617 1
i 6 18.96632210736913 2 6.08333333333333 63.18567636796743 -1 0.10869565217391 -0.5 -0.5 849.9694634522768 1
i 6 19.04634878292764 2 9 74.36058811024132 -1 -0.10869565217391 -0.5 -0.5 849.945225582329 1
i 3 19.12637545848616 2 8 63.21375834711752 -1 -0.19565217391304 -0.5 -0.5 849.9048081540642 1
i 5 19.20640213404468 2 7.5 76.10269193955013 -1 -0.23913043478261 -0.5 -0.5 849.839231574769 1
i 3 19.2864288096032 2 11.08333333333333 68.13503328000998 -1 0.19565217391304 -0.5 -0.5 849.7354480098361 1
i 6 19.36645548516172 2 6.66666666666667 61.00920160803832 -1 0.02173913043478 -0.5 -0.5 849.5748823133727 1
i 6 19.44648216072024 2 8 77.85922067976894 -1 0.02173913043478 -0.5 -0.5 849.3315820740313 1
i 2 19.52650883627876 2 10.33333333333333 64.33484326772474 -1 -0.28260869565217 -0.5 -0.5 848.9699089425685 1
i 5 19.60653551183728 2 6.5 70.36928627001643 -1 -0.23913043478261 -0.5 -0.5 848.4416999373699 1
i 4 19.6865621873958 2 10 70.76517635550987 -1 0.10869565217391 -0.5 -0.5 847.6828255077447 1
i 5 19.76658886295432 2 7.5 60.37776557039688 -1 0.02173913043478 -0.5 -0.5 846.6090711127465 1
i 5 19.84661553851284 2 8.16666666666667 79.98451728465095 -1 -0.15217391304348 -0.5 -0.5 845.1112712726479 1
i 2 19.92664221407136 2 10 65.42569243673974 -1 0.06521739130435 -0.5 -0.5 843.0496297722675 1
i 6 20.00666888962988 2 6 64.13045090113202 -1 -0.10869565217391 -0.5 -0.5 840.2471672031751 1
i 6 20.0866955651884 2 10.16666666666667 73.44389004376458 -1 -0.02173913043478 -0.5 -0.5 836.4822475378028 1
i 4 20.16672224074692 2 8.66666666666667 62.79413022726521 -1 -0.02173913043478 -0.5 -0.5 831.480149082644 1
i 5 20.24674891630544 2 7.66666666666667 77.24892645749458 -1 -0.15217391304348 -0.5 -0.5 824.9036620364573 1
i 3 20.32677559186396 2 10 67.38784026344379 -1 -0.28260869565217 -0.5 -0.5 816.3427149760086 1
i 6 20.40680226742247 2 6.41666666666667 61.84119341753062 -1 -0.10869565217391 -0.5 -0.5 805.3030558084449 1
i 6 20.486828942981 2 9.33333333333333 76.6947184687987 -1 0.02173913043478 -0.5 -0.5 791.1940388705771 1
i 3 20.56685561853952 2 9.66666666666667 63.92803886543565 -1 -0.15217391304348 -0.5 -0.5 773.3155986248183 1
i 5 20.64688229409804 2 6 72.66521994018527 -1 0.15217391304348 -0.5 -0.5 750.8445214005916 1
i 4 20.72690896965655 2 10 69.83296295980219 -1 -0.10869565217391 -0.5 -0.5 722.8201593590443 1
i 5 20.80693564521507 2 7 60.01043994085372 -1 -0.02173913043478 -0.5 -0.5 688.1297647220148 1
i 6 20.8869623207736 2 8.58333333333333 79.80059101295285 -1 -0.06521739130435 -0.5 -0.5 645.4936566178922 1
i 2 20.96698899633211 2 10.75 65.05294086434665 -1 0.02173913043478 -0.5 -0.5 593.450466893101 1
i 6 21.04701567189063 2 6.08333333333333 65.66614065400418 -1 0.10869565217391 -0.5 -0.5 530.3427440879991 1
i 5 21.12704234744915 2 10.5 72.5967841981275 -1 -0.28260869565217 -0.5 -0.5 454.3032255988547 1
i 4 21.20706902300767 2 8.08333333333333 62.09470336962008 -1 -0.06521739130435 -0.5 -0.5 363.2421159295933 1
i 5 21.28709569856619 2 7 78.42046850863369 -1 -0.06521739130435 -0.5 -0.5 254.83573295219398 1
i 2 21.36712237412471 2 11 66.62684761735729 -1 -0.02173913043478 -0.5 -0.5 126.51690332479139 1
i 6 21.44714904968323 2 6.25 62.51533480541652 -1 -0.19565217391304 -0.5 -0.5 -24.53249822317811 1
i 6 21.52717572524175 2 9.58333333333333 75.53539971471326 -1 -0.10869565217391 -0.5 -0.5 -201.3864639708958 1
i 3 21.60720240080027 2 9.33333333333333 63.54972694985894 -1 0.10869565217391 -0.5 -0.5 -407.37682107836724 1
i 5 21.68722907635879 2 7.08333333333333 74.58137304146251 -1 -0.06521739130435 -0.5 -0.5 -646.0918587772582 1
i 3 21.76725575191731 2 11 68.97091600328564 -1 0.15217391304348 -0.5 -0.5 -921.3712379379444 1
i 5 21.84728242747583 2 6.83333333333333 60.20307312806733 -1 0.06521739130435 -0.5 -0.5 -1237.2968314172747 1
i 6 21.92730910303435 2 8.75 79.05231424758279 -1 -0.28260869565217 -0.5 -0.5 -1598.1791779740654 1
i 2 22.00733577859286 2 10.5 64.73090851851154 -1 -0.19565217391304 -0.5 -0.5 -2008.5392760039592 1
i 6 22.08736245415139 2 6.25 67.73563660468011 -1 0.02173913043478 -0.5 -0.5 -2473.0854957449073 1
i 5 22.16738912970991 2 10.58333333333333 71.76712400341322 -1 -0.32608695652174 -0.5 -0.5 -2996.6854495961466 1
i 4 22.24741580526842 2 7.75 61.22257883229423 -1 -0.19565217391304 -0.5 -0.5 -3584.332729233645 1
i 5 22.32744248082694 2 7 79.42800824747536 -1 -0.06521739130435 -0.5 -0.5 -4241.10849454239 1
i 2 22.40746915638546 2 11 65.97722399407127 -1 0.15217391304348 -0.5 -0.5 -4972.13798207817 1
i 6 22.48749583194398 2 6.25 63.09562228208784 -1 -0.19565217391304 -0.5 -0.5 -5782.542088683381 1
i 6 22.5675225075025 2 9.91666666666667 74.4890303891267 -1 -0.10869565217391 -0.5 -0.5 -6677.384277702656 1
i 3 22.64754918306102 2 8.91666666666667 63.25432829714691 -1 0.19565217391304 -0.5 -0.5 -7661.613149510018 1
i 5 22.72757585861954 2 7.41666666666667 75.94771692520257 -1 -0.02173913043478 -0.5 -0.5 -8740.001113169834 1
i 3 22.80760253417806 2 11 68.2301271164893 -1 0.02173913043478 -0.5 -0.5 -9917.079690297674 1
i 5 22.88762920973658 2 6.58333333333333 60.89844023218477 -1 -0.15217391304348 -0.5 -0.5 -11197.07207378404 1
i 6 22.9676558852951 2 8 78.0076862334347 -1 0.28260869565217 -0.5 -0.5 -12583.82365115642 1
i 2 23.04768256085362 2 10.16666666666667 64.38510500574769 -1 0.06521739130435 -0.5 -0.5 -14080.731283141222 1
i 5 23.12770923641214 2 6.5 70.05756987934411 -1 0.10869565217391 -0.5 -0.5 -15690.67220064321 1
i 4 23.20773591197066 2 10.83333333333333 70.88655362123356 -1 -0.06521739130435 -0.5 -0.5 -17415.933446117106 1
i 5 23.28776258752918 2 7.33333333333333 60.45812788000691 -1 -0.02173913043478 -0.5 -0.5 -19258.14283653433 1
i 5 23.3677892630877 2 8.08333333333333 79.96003462249443 -1 -0.10869565217391 -0.5 -0.5 -21218.202463329995 1
i 2 23.44781593864622 2 10.91666666666667 65.48176350932138 -1 -0.06521739130435 -0.5 -0.5 -23296.22576851426 1
i 6 23.52784261420474 2 6 63.97407038371313 -1 -0.02173913043478 -0.5 -0.5 -25491.47924443966 1
i 6 23.60786928976325 2 10 73.56020617533501 -1 -0.06521739130435 -0.5 -0.5 -27802.329796628714 1
i 4 23.68789596532178 2 8.75 62.86450809245019 -1 -0.19565217391304 -0.5 -0.5 -30226.198783969994 1
i 5 23.7679226408803 2 7.58333333333333 77.09587461676797 -1 -0.06521739130435 -0.5 -0.5 -32759.52370816143 1
i 3 23.84794931643882 2 10.91666666666667 67.48948818840421 -1 -0.15217391304348 -0.5 -0.5 -35397.72846447868 1
i 6 23.92797599199733 2 6.66666666666667 61.73717521395021 -1 0.15217391304348 -0.5 -0.5 -38135.20298905231 1
i 6 24.00800266755586 2 9.25 76.85092685544244 -1 0.06521739130435 -0.5 -0.5 -40965.29304447977 1
i 3 24.08802934311438 2 9.75 63.98284310142745 -1 -0.15217391304348 -0.5 -0.5 -43880.30077667907 1
i 5 24.1680560186729 2 6.75 72.37517680619281 -1 -0.19565217391304 -0.5 -0.5 -46871.496552659744 1
i 4 24.24808269423141 2 10 69.95509509137375 -1 -0.10869565217391 -0.5 -0.5 -49929.142452873355 1
i 5 24.32810936978994 2 7 60.03015025681185 -1 -0.15217391304348 -0.5 -0.5 -53042.52764482195 1
i 5 24.40813604534846 2 8.33333333333333 79.86149406644535 -1 -0.15217391304348 -0.5 -0.5 -56200.01570872553 1
i 2 24.48816272090697 2 10.91666666666667 65.0978357346953 -1 -0.06521739130435 -0.5 -0.5 -59389.103823534846 1
i 6 24.56818939646549 2 6.08333333333333 65.42828208129649 -1 0.15217391304348 -0.5 -0.5 -62596.493554923385 1
i 5 24.64821607202401 2 10.41666666666667 72.70612684567486 -1 -0.3695652173913 -0.5 -0.5 -65808.17281868473 1
i 4 24.72824274758253 2 8.41666666666667 62.20223851508708 -1 -0.23913043478261 -0.5 -0.5 -69009.50842591876 1
i 5 24.80826942314105 2 7.75 78.26810994664835 -1 -0.28260869565217 -0.5 -0.5 -72185.34845326252 1
i 2 24.88829609869957 2 11.08333333333333 66.72357265649684 -1 -0.19565217391304 -0.5 -0.5 -75320.13352495883 1
i 6 24.96832277425809 2 6.33333333333333 62.43756156364684 -1 -0.3695652173913 -0.5 -0.5 -78398.01594647343 1
i 6 25.04834944981661 2 9.75 75.6836317561547 -1 0.15217391304348 -0.5 -0.5 -81402.98549424647 1
i 3 25.12837612537513 2 9.33333333333333 63.59397318363865 -1 0.15217391304348 -0.5 -0.5 -84319.00054548583 1
i 5 25.20840280093365 2 7.08333333333333 74.36190847330067 -1 -0.15217391304348 -0.5 -0.5 -87130.12312787319 1
i 3 25.28842947649217 2 11.08333333333333 69.07670363859184 -1 -0.41304347826087 -0.5 -0.5 -89820.65638372398 1
i 5 25.36845615205069 2 6.91666666666667 60.14320418430398 -1 0.02173913043478 -0.5 -0.5 -92375.28287820502 1
i 6 25.44848282760921 2 8.75 79.17431842742818 -1 0.19565217391304 -0.5 -0.5 -94779.20213807799 1
i 2 25.52850950316773 2 10.66666666666667 64.77322859362621 -1 -0.02173913043478 -0.5 -0.5 -97018.2657871745 1
i 6 25.60853617872625 2 6.25 67.44118049041553 -1 -0.10869565217391 -0.5 -0.5 -99079.10864807758 1
i 5 25.68856285428477 2 10.75 71.87849809260993 -1 -0.19565217391304 -0.5 -0.5 -100949.27420659407 1
i 4 25.76858952984329 2 7 61.33756214192381 -1 0.02173913043478 -0.5 -0.5 -102617.33288642603 1
i 5 25.8486162054018 2 7 79.31652930955129 -1 -0.15217391304348 -0.5 -0.5 -104072.99165548784 1
i 2 25.92864288096032 2 11.16666666666667 66.05371293303945 -1 0.06521739130435 -0.5 -0.5 -105307.19358165108 1
i 6 26.00866955651885 2 6 63.01110521034451 -1 -0.02173913043478 -0.5 -0.5 -106312.20607303389 1
i 6 26.08869623207736 2 9 74.61956968096509 -1 0.15217391304348 -0.5 -0.5 -107081.69667463806 1
i 3 26.16872290763588 2 8 63.29319728980873 -1 -0.15217391304348 -0.5 -0.5 -107610.795447157 1
i 5 26.2487495831944 2 7.33333333333333 75.7892647537961 -1 -0.15217391304348 -0.5 -0.5 -107896.14312285213 1
i 3 26.32877625875292 2 11.08333333333333 68.32498403757957 -1 -0.28260869565217 -0.5 -0.5 -107935.92441493768 1
i 5 26.40880293431144 2 6.58333333333333 60.78994220018124 -1 -0.02173913043478 -0.5 -0.5 -107729.88604815007 1
i 6 26.48882960986996 2 8 78.15431568607089 -1 0.28260869565217 -0.5 -0.5 -107279.33927614451 1
i 2 26.56885628542848 2 10.16666666666667 64.43421574915135 -1 0.19565217391304 -0.5 -0.5 -106587.14685297811 1
i 5 26.648882960987 2 6.5 69.74596475989014 -1 -0.06521739130435 -0.5 -0.5 -105657.69462806937 1
i 4 26.72890963654552 2 10.91666666666667 71.00686475534675 -1 -0.15217391304348 -0.5 -0.5 -104496.84813351426 1
i 5 26.80893631210404 2 7.41666666666667 60.5442963698375 -1 -0.10869565217391 -0.5 -0.5 -103111.89472637771 1
i 5 26.88896298766256 2 8.08333333333333 79.92433677340823 -1 -0.10869565217391 -0.5 -0.5 -101511.4720335765 1
i 2 26.96898966322108 2 10 65.53975810312033 -1 -0.23913043478261 -0.5 -0.5 -99705.48362036597 1
i 6 27.0490163387796 2 6 63.82813460077024 -1 -0.06521739130435 -0.5 -0.5 -97705.00296260162 1
i 6 27.12904301433812 2 10.25 73.67780928181145 -1 -0.19565217391304 -0.5 -0.5 -95522.16694546783 1
i 4 27.20906968989664 2 8.83333333333333 62.92974726988912 -1 -0.23913043478261 -0.5 -0.5 -93170.0602351672 1
i 5 27.28909636545516 2 7.75 76.94386433425768 -1 -0.10869565217391 -0.5 -0.5 -90662.59197334589 1
i 3 27.36912304101368 2 10 67.59042807534877 -1 -0.06521739130435 -0.5 -0.5 -88014.36632539904 1
i 6 27.44914971657219 2 6.66666666666667 61.63039080747824 -1 -0.19565217391304 -0.5 -0.5 -85240.54847221378 1
i 6 27.52917639213072 2 9.25 77.006857338163 -1 0.02173913043478 -0.5 -0.5 -82356.72766971501 1
i 3 27.60920306768924 2 9.75 64.03779669354324 -1 -0.19565217391304 -0.5 -0.5 -79378.77901155139 1
i 5 27.68922974324775 2 6.75 72.07937850189921 -1 -0.28260869565217 -0.5 -0.5 -76322.7255175437 1
i 4 27.76925641880627 2 10.91666666666667 70.07815215515633 -1 0.23913043478261 -0.5 -0.5 -73204.60213469456 1
i 5 27.84928309436479 2 7.25 60.05959337498457 -1 -0.19565217391304 -0.5 -0.5 -70040.32317952934 1
i 5 27.92930976992331 2 8.25 79.91168891401145 -1 -0.19565217391304 -0.5 -0.5 -66845.55467163127 1
i 2 28.00933644548183 2 10.91666666666667 65.14382754276727 -1 -0.3695652173913 -0.5 -0.5 -63635.592910040905 1
i 6 28.08936312104035 2 6 65.20063425135702 -1 -0.19565217391304 -0.5 -0.5 -60425.25052866239 1
i 6 28.16938979659887 2 10.33333333333333 72.81600916321113 -1 -0.23913043478261 -0.5 -0.5 -57228.7511361083 1
i 4 28.24941647215739 2 8.25 62.30585614793635 -1 -0.10869565217391 -0.5 -0.5 -54059.633501914424 1
i 5 28.32944314771591 2 7.75 78.11388583548654 -1 -0.15217391304348 -0.5 -0.5 -50930.66609734625 1
i 2 28.40946982327443 2 10.91666666666667 66.82211818711075 -1 -0.15217391304348 -0.5 -0.5 -47853.7726377372 1
i 6 28.48949649883295 2 6.33333333333333 62.35684245796318 -1 -0.10869565217391 -0.5 -0.5 -44839.96910723006 1
i 6 28.56952317439147 2 9.58333333333333 75.83386864696897 -1 -0.23913043478261 -0.5 -0.5 -41899.31257865345 1
i 3 28.64954984994999 2 9.58333333333333 63.64023207130731 -1 -0.10869565217391 -0.5 -0.5 -39040.861973822815 1
i 5 28.72957652550851 2 7 74.13157208418916 -1 -0.23913043478261 -0.5 -0.5 -36272.650745426974 1
i 3 28.80960320106703 2 11.08333333333333 69.1851200494217 -1 -0.28260869565217 -0.5 -0.5 -33601.671303373354 1
i 5 28.88962987662555 2 6.91666666666667 60.09330975647558 -1 -0.23913043478261 -0.5 -0.5 -31033.870858368584 1
i 6 28.96965655218407 2 8.58333333333333 79.29068576486077 -1 -0.15217391304348 -0.5 -0.5 -28574.158215738844 1
i 2 29.04968322774258 2 10.75 64.81524870806314 -1 0.02173913043478 -0.5 -0.5 -26226.42092494569 1
i 6 29.1297099033011 2 6.16666666666667 67.15168056446387 -1 -0.23913043478261 -0.5 -0.5 -23993.552076556556 1
i 5 29.20973657885963 2 10.5 71.9889985978754 -1 0.02173913043478 -0.5 -0.5 -21877.48593991911 1
i 4 29.28976325441814 2 7.83333333333333 61.45397414026532 -1 0.02173913043478 -0.5 -0.5 -19879.2415524846 1
i 5 29.36978992997666 2 7.83333333333333 79.19704421709051 -1 -0.15217391304348 -0.5 -0.5 -17998.973306357002 1
i 2 29.44981660553518 2 11 66.13309097208362 -1 -0.23913043478261 -0.5 -0.5 -16236.02752957743 1
i 6 29.5298432810937 2 6 62.93106888822109 -1 -0.06521739130435 -0.5 -0.5 -14589.004028971385 1
i 6 29.60986995665222 2 9 74.75232221767062 -1 0.06521739130435 -0.5 -0.5 -13055.821547858905 1
i 3 29.68989663221074 2 9.16666666666667 63.33101696257894 -1 -0.3695652173913 -0.5 -0.5 -11633.786095009888 1
i 5 29.76992330776926 2 7.33333333333333 75.62620197595884 -1 -0.28260869565217 -0.5 -0.5 -10319.661120129682 1
i 3 29.84994998332778 2 11 68.41997743749853 -1 -0.28260869565217 -0.5 -0.5 -9109.738544826148 1
i 5 29.9299766588863 2 6.66666666666667 60.68465638982917 -1 0.02173913043478 -0.5 -0.5 -7999.909705174065 1
i 6 30.01000333444482 2 8.91666666666667 78.29890145654451 -1 0.02173913043478 -0.5 -0.5 -6985.735321195981 1
i 2 30.09003001000334 2 10.33333333333333 64.48216908546149 -1 -0.10869565217391 -0.5 -0.5 -6062.513678219119 1
i 5 30.17005668556186 2 6.41666666666667 69.43495987614642 -1 -0.02173913043478 -0.5 -0.5 -5225.34628342076 1
i 4 30.25008336112038 2 10 71.12600751521929 -1 -0.15217391304348 -0.5 -0.5 -4469.200346142095 1
i 5 30.3301100366789 2 7.5 60.63581306550941 -1 -0.19565217391304 -0.5 -0.5 -3788.967520896364 1
i 5 30.41013671223742 2 8.16666666666667 79.87760895226899 -1 0.02173913043478 -0.5 -0.5 -3179.5184455877375 1
i 2 30.49016338779594 2 10.91666666666667 65.59978838297462 -1 -0.06521739130435 -0.5 -0.5 -2635.752702472621 1
i 6 30.57019006335446 2 6 63.69229462926154 -1 0.15217391304348 -0.5 -0.5 -2152.6439241201897 1
i 6 30.65021673891297 2 10.16666666666667 73.79677658414023 -1 -0.23913043478261 -0.5 -0.5 -1725.2798594059352 1
i 4 30.7302434144715 2 8.66666666666667 62.99008001415224 -1 0.10869565217391 -0.5 -0.5 -1348.8973039004102 1
i 5 30.81027009003002 2 7.5 76.79276741222613 -1 -0.10869565217391 -0.5 -0.5 -1018.911883528368 1
i 3 30.89029676558853 2 10 67.69047492181964 -1 -0.10869565217391 -0.5 -0.5 -730.9427588799316 1
i 6 30.97032344114705 2 6.5 61.52129700827771 -1 -0.28260869565217 -0.5 -0.5 -480.8323890470688 1
i 6 31.05035011670557 2 9.25 77.16223740402081 -1 0.15217391304348 -0.5 -0.5 -264.6615575230506 1
i 3 31.13037679226409 2 9 64.09260291368363 -1 -0.19565217391304 -0.5 -0.5 -78.75991792945182 1
i 5 31.21040346782261 2 6 71.77882447468083 -1 -0.32608695652174 -0.5 -0.5 80.28763628609032 1
i 4 31.29043014338113 2 10 70.20177382992647 -1 -0.02173913043478 -0.5 -0.5 215.6384367119327 1
i 5 31.37045681893965 2 7.08333333333333 60.09827838147953 -1 -0.10869565217391 -0.5 -0.5 330.1929696726951 1
i 5 31.45048349449817 2 8.25 79.95083215307363 -1 -0.06521739130435 -0.5 -0.5 426.5988816969173 1
i 2 31.53051017005669 2 10 65.19105023106005 -1 -0.06521739130435 -0.5 -0.5 507.2576609063038 1
i 6 31.61053684561521 2 6.08333333333333 64.98355909751493 -1 -0.02173913043478 -0.5 -0.5 574.3335917943367 1
i 6 31.69056352117373 2 10.33333333333333 72.92658066541271 -1 -0.06521739130435 -0.5 -0.5 629.7645856520323 1
i 4 31.77059019673225 2 8.41666666666667 62.40506764562842 -1 0.10869565217391 -0.5 -0.5 675.2745004438967 1
i 5 31.85061687229077 2 7.75 77.95851427622527 -1 0.02173913043478 -0.5 -0.5 712.3865814275267 1
i 2 31.93064354784929 2 10 66.92213914543795 -1 0.10869565217391 -0.5 -0.5 742.4376763772667 1
i 6 32.01067022340781 2 6.33333333333333 62.27273131309214 -1 -0.02173913043478 -0.5 -0.5 766.5929060049126 1
i 6 32.09069689896633 2 9.66666666666667 75.98586979987275 -1 -0.06521739130435 -0.5 -0.5 785.8605001430296 1
i 3 32.17072357452485 2 9.41666666666667 63.68845253118673 -1 -0.06521739130435 -0.5 -0.5 801.1065425491836 1
i 5 32.25075025008336 2 7 73.8904474650571 -1 0.02173913043478 -0.5 -0.5 813.0694009083578 1
i 3 32.33077692564188 2 11.08333333333333 69.29617410044828 -1 -0.19565217391304 -0.5 -0.5 822.3736529076123 1
i 5 32.41080360120041 2 6 60.05384472392839 -1 -0.32608695652174 -0.5 -0.5 829.5433533442177 1
i 6 32.49083027675892 2 8.5 79.40065363769601 -1 -0.06521739130435 -0.5 -0.5 835.0145203941385 1
i 2 32.57085695231744 2 10.66666666666667 64.85716305319828 -1 -0.02173913043478 -0.5 -0.5 839.1467507857395 1
i 6 32.65088362787596 2 6.25 66.86793164029109 -1 0.02173913043478 -0.5 -0.5 842.2339031628695 1
i 5 32.73091030343448 2 10.5 72.0987838324851 -1 -0.10869565217391 -0.5 -0.5 844.513815950181 1
i 4 32.81093697899301 2 7 61.5711067882212 -1 -0.06521739130435 -0.5 -0.5 846.177050222305 1
i 5 32.89096365455152 2 7 79.07026022963117 -1 0.10869565217391 -0.5 -0.5 847.3746691996424 1
i 2 32.97099033011004 2 11 66.21538555569514 -1 -0.10869565217391 -0.5 -0.5 848.2250839181389 1
i 6 33.05101700566856 2 6.33333333333333 62.85439274566276 -1 -0.10869565217391 -0.5 -0.5 848.8200093130756 1
i 6 33.13104368122708 2 9.75 74.88738893708835 -1 -0.10869565217391 -0.5 -0.5 849.2295864681682 1
i 3 33.2110703567856 2 9.08333333333333 63.36843408934212 -1 -0.28260869565217 -0.5 -0.5 849.5067352384411 1
i 5 33.29109703234412 2 7.33333333333333 75.45734803755524 -1 0.23913043478261 -0.5 -0.5 849.6908070519274 1
i 3 33.37112370790264 2 11.08333333333333 68.51552292419476 -1 0.06521739130435 -0.5 -0.5 849.8106106792635 1
i 5 33.45115038346116 2 6.66666666666667 60.58357797262246 -1 -0.23913043478261 -0.5 -0.5 849.8868844219526 1
i 6 33.53117705901968 2 8.75 78.44119760985714 -1 -0.06521739130435 -0.5 -0.5 849.9342868295686 1
i 2 33.6112037345782 2 10.33333333333333 64.52899203484904 -1 0.10869565217391 -0.5 -0.5 849.9629750509083 1
i 5 33.69123041013672 2 6.5 69.12501863786711 -1 -0.15217391304348 -0.5 -0.5 849.9798355971441 1
i 5 33.77125708569523 2 10.75 71.24391737724395 -1 -0.23913043478261 -0.5 -0.5 849.9894269839581 1
i 5 33.85128376125375 2 7.5 60.73223353807717 -1 -0.15217391304348 -0.5 -0.5 849.9946877466413 1
i 5 33.93131043681228 2 8.08333333333333 79.82007316625042 -1 -0.06521739130435 -0.5 -0.5 849.9974569854045 1
i 2 34.0113371123708 2 10 65.66197442182225 -1 -0.02173913043478 -0.5 -0.5 849.9988481648488 1
i 6 34.09136378792932 2 6.08333333333333 63.56611866137708 -1 -0.23913043478261 -0.5 -0.5 849.9995105923474 1
i 6 34.17139046348783 2 10.08333333333333 73.91719455305488 -1 -0.28260869565217 -0.5 -0.5 849.9998070255876 1
i 4 34.25141713904635 2 8.66666666666667 63.04581571734336 -1 -0.06521739130435 -0.5 -0.5 849.9999303581692 1
i 5 34.33144381460487 2 7.5 76.64231638102706 -1 0.02173913043478 -0.5 -0.5 849.9999774100995 1
i 3 34.41147049016339 2 11.08333333333333 67.78951182553803 -1 -0.02173913043478 -0.5 -0.5 849.9999935724455 1
i 6 34.49149716572191 2 6.5 61.41041124177814 -1 -0.10869565217391 -0.5 -0.5 849.9999984492488 1
i 6 34.57152384128043 2 9.08333333333333 77.31682256065164 -1 0.10869565217391 -0.5 -0.5 849.9999996979607 1
i 3 34.65155051683895 2 9 64.14699767043463 -1 -0.02173913043478 -0.5 -0.5 849.9999999559469 1
i 5 34.73157719239747 2 6.66666666666667 71.47446741645766 -1 -0.10869565217391 -0.5 -0.5 849.9999999957475 1
i 4 34.81160386795599 2 10 70.32561695760155 -1 -0.19565217391304 -0.5 -0.5 849.9999999997831 1
i 5 34.89163054351451 2 7.33333333333333 60.14567633047938 -1 -0.06521739130435 -0.5 -0.5 849.9999999999964 1
i 5 34.97165721907303 2 8.33333333333333 79.97868176555075 -1 -0.02173913043478 -0.5 -0.5 850 1
i 2 35.05168389463154 2 10 65.23962414795422 -1 0.10869565217391 -0.5 -0.5 850 1
i 6 35.13171057019007 2 6.08333333333333 64.77730956517948 -1 -0.15217391304348 -0.5 -0.5 850 1
i 6 35.21173724574859 2 10.33333333333333 73.03797010666693 -1 -0.10869565217391 -0.5 -0.5 850.0000000000003 1
i 4 35.29176392130711 2 8.33333333333333 62.49948341717312 -1 -0.06521739130435 -0.5 -0.5 850.0000000000446 1
i 5 35.37179059686563 2 7.66666666666667 77.80262939330254 -1 -0.41304347826087 -0.5 -0.5 850.0000000012991 1
i 2 35.45181727242414 2 10 67.02326890200374 -1 -0.15217391304348 -0.5 -0.5 850.0000000170745 1
i 6 35.53184394798266 2 6.33333333333333 62.18495277367265 -1 0.06521739130435 -0.5 -0.5 850.0000001372042 1
i 6 35.61187062354119 2 9.5 76.13935533825716 -1 -0.10869565217391 -0.5 -0.5 850.0000007890392 1
i 3 35.6918972990997 2 9.5 63.73848650613378 -1 -0.02173913043478 -0.5 -0.5 850.0000035609585 1
i 5 35.77192397465822 2 6 73.63886676162815 -1 0.19565217391304 -0.5 -0.5 850.000013372481 1
i 3 35.85195065021674 2 11.08333333333333 69.4097787254641 -1 0.19565217391304 -0.5 -0.5 850.0000434724892 1
i 5 35.93197732577526 2 6 60.02510062372329 -1 -0.28260869565217 -0.5 -0.5 850.0001258127124 1
i 6 36.01200400133379 2 8.5 79.50344113151054 -1 -0.28260869565217 -0.5 -0.5 850.0003308658471 1
i 2 36.0920306768923 2 10.66666666666667 64.8991722401774 -1 -0.15217391304348 -0.5 -0.5 850.0008030176673 1
i 6 36.17205735245082 2 6.33333333333333 66.59074207328985 -1 0.02173913043478 -0.5 -0.5 850.0018203274853 1
i 5 36.25208402800934 2 10.5 72.20803385576515 -1 -0.10869565217391 -0.5 -0.5 850.0038907682645 1
i 4 36.33211070356786 2 7 61.68821559765357 -1 -0.06521739130435 -0.5 -0.5 850.0079010468957 1
i 5 36.41213737912638 2 7 78.93695209094633 -1 0.02173913043478 -0.5 -0.5 850.0153387549291 1
i 2 36.4921640546849 2 11.08333333333333 66.30057916497185 -1 -0.10869565217391 -0.5 -0.5 850.0286138621259 1
i 6 36.57219073024342 2 6.33333333333333 62.77992450379861 -1 -0.19565217391304 -0.5 -0.5 850.0515113513569 1
i 6 36.65221740580194 2 9.75 75.0248469473908 -1 -0.15217391304348 -0.5 -0.5 850.0898129734672 1
i 3 36.73224408136046 2 9.08333333333333 63.40606417761757 -1 0.10869565217391 -0.5 -0.5 850.152132502194 1
i 5 36.81227075691898 2 7.33333333333333 75.28152672011717 -1 -0.10869565217391 -0.5 -0.5 850.2510152783466 1
i 3 36.8922974324775 2 11.08333333333333 68.61205606208966 -1 -0.10869565217391 -0.5 -0.5 850.4043589972272 1
i 5 36.97232410803601 2 6.66666666666667 60.48772606328926 -1 -0.19565217391304 -0.5 -0.5 850.6372183281178 1
i 6 37.05235078359453 2 8.75 78.58090529389268 -1 -0.19565217391304 -0.5 -0.5 850.9840607467665 1
i 2 37.13237745915306 2 10.33333333333333 64.57474263332799 -1 -0.10869565217391 -0.5 -0.5 851.4915445790931 1
i 5 37.21240413471158 2 6.33333333333333 68.81660260774737 -1 0.10869565217391 -0.5 -0.5 852.2218923548161 1
i 5 37.2924308102701 2 10.66666666666667 71.36056527097675 -1 0.10869565217391 -0.5 -0.5 853.2569328120783 1
i 4 37.37245748582861 2 7.66666666666667 60.83311601546674 -1 0.10869565217391 -0.5 -0.5 854.7028829493456 1
i 5 37.45248416138713 2 8 79.75198995442089 -1 0.10869565217391 -0.5 -0.5 856.6959370842301 1
i 2 37.53251083694565 2 11 65.72644330261488 -1 -0.15217391304348 -0.5 -0.5 859.4087226826414 1
i 6 37.61253751250417 2 6 63.44908816024173 -1 -0.23913043478261 -0.5 -0.5 863.057672547357 1
i 6 37.69256418806269 2 10.16666666666667 74.03916098045087 -1 0.19565217391304 -0.5 -0.5 867.9113496454676 1
i 3 37.77259086362121 2 8.75 63.09733665253967 -1 -0.10869565217391 -0.5 -0.5 874.2997443243196 1
i 5 37.85261753917973 2 7.5 76.49209903542749 -1 -0.06521739130435 -0.5 -0.5 882.6245439128899 1
i 3 37.93264421473825 2 11 67.88749659773882 -1 0.10869565217391 -0.5 -0.5 893.3703518177539 1
i 6 38.01267089029677 2 6.58333333333333 61.29830985691899 -1 -0.15217391304348 -0.5 -0.5 907.1168073845107 1
i 6 38.09269756585529 2 9.16666666666667 77.4703957628555 -1 -0.02173913043478 -0.5 -0.5 924.5515292921 1
i 2 38.17272424141381 2 9 64.20075513411649 -1 -0.10869565217391 -0.5 -0.5 946.4837744665003 1
i 5 38.25275091697232 2 6.66666666666667 71.16719146483425 -1 -0.15217391304348 -0.5 -0.5 973.8586719308108 1
i 4 38.33277759253085 2 10 70.44936549525671 -1 -0.02173913043478 -0.5 -0.5 1007.7718572364473 1
i 5 38.41280426808937 2 7.25 60.20124072458289 -1 0.32608695652174 -0.5 -0.5 1049.484298821365 1
i 5 38.49283094364789 2 8.16666666666667 79.99509031356789 -1 0.02173913043478 -0.5 -0.5 1100.4370735722368 1
i 2 38.57285761920641 2 10.83333333333333 65.28965894316238 -1 0.28260869565217 -0.5 -0.5 1162.265815852247 1
i 6 38.65288429476492 2 6 64.58203176253936 -1 -0.15217391304348 -0.5 -0.5 1236.8145331712606 1
i 6 38.73291097032344 2 10.25 73.15028701733837 -1 -0.06521739130435 -0.5 -0.5 1326.1484534313556 1
i 4 38.81293764588197 2 8.33333333333333 62.58881709124597 -1 -0.15217391304348 -0.5 -0.5 1432.5655442042546 1
i 5 38.89296432144048 2 7.75 77.64676875405843 -1 -0.02173913043478 -0.5 -0.5 1558.6063247076145 1
i 2 38.972990996999 2 10 67.12513302831798 -1 -0.19565217391304 -0.5 -0.5 1707.0615769345106 1
i 6 39.05301767255752 2 6.33333333333333 62.09339150761653 -1 -0.02173913043478 -0.5 -0.5 1880.9775545928721 1
i 6 39.13304434811604 2 9.41666666666667 76.29401726925472 -1 -0.10869565217391 -0.5 -0.5 2083.6582878915865 1
i 3 39.21307102367457 2 9.66666666666667 63.79010840063265 -1 -0.23913043478261 -0.5 -0.5 2318.6645894288486 1
i 5 39.29309769923308 2 6.91666666666667 73.37738137754492 -1 -0.02173913043478 -0.5 -0.5 2589.8093820396534 1
i 3 39.3731243747916 2 11 69.52576101606917 -1 0.06521739130435 -0.5 -0.5 2901.1489938416066 1
i 5 39.45315105035012 2 6.83333333333333 60.0072060983958 -1 -0.28260869565217 -0.5 -0.5 3256.9700991212126 1
i 6 39.53317772590864 2 8.5 79.59827640317218 -1 0.06521739130435 -0.5 -0.5 3661.7720261922705 1
i 2 39.61320440146716 2 10 64.94147782954572 -1 0.15217391304348 -0.5 -0.5 4120.244204806142 1
i 6 39.69323107702568 2 6.08333333333333 66.32090742693158 -1 0.02173913043478 -0.5 -0.5 4637.238585782427 1
i 5 39.7732577525842 2 10.41666666666667 72.31694469068209 -1 -0.06521739130435 -0.5 -0.5 5217.736933732775 1
i 4 39.85328442814272 2 8.16666666666667 61.80453748687937 -1 -0.10869565217391 -0.5 -0.5 5866.812969343246 1
i 5 39.93331110370124 2 7.91666666666667 78.79794574420657 -1 0.02173913043478 -0.5 -0.5 6589.589419738792 1
i 2 40.01333777925976 2 11 66.3886031270963 -1 -0.23913043478261 -0.5 -0.5 7391.190122864334 1
i 6 40.09336445481828 2 6.16666666666667 62.70652015516821 -1 -0.28260869565217 -0.5 -0.5 8276.687423279951 1
i 6 40.17339113037679 2 9.83333333333333 75.16474010475191 -1 0.19565217391304 -0.5 -0.5 9251.045190851206 1
i 3 40.25341780593531 2 9.33333333333333 63.44446414079928 -1 -0.02173913043478 -0.5 -0.5 10319.05788891021 1
i 5 40.33344448149384 2 7.16666666666667 75.09762460461548 -1 0.02173913043478 -0.5 -0.5 11485.286212887437 1
i 3 40.41347115705236 2 11 68.7100065641394 -1 -0.19565217391304 -0.5 -0.5 12753.989912385501 1
i 5 40.49349783261088 2 6.66666666666667 60.39811612198366 -1 -0.02173913043478 -0.5 -0.5 14129.05849734598 1
i 6 40.57352450816939 2 8.83333333333333 78.71765887861605 -1 -0.06521739130435 -0.5 -0.5 15613.940610523707 1
i 2 40.65355118372791 2 10.5 64.61950744715939 -1 -0.02173913043478 -0.5 -0.5 17211.572922094678 1
i 6 40.73357785928643 2 6.33333333333333 68.51019630458237 -1 0.15217391304348 -0.5 -0.5 18924.30946613323 1
i 5 40.81360453484495 2 10.66666666666667 71.47595496753728 -1 -0.15217391304348 -0.5 -0.5 20753.852391239532 1
i 4 40.89363121040347 2 7.58333333333333 60.93800752694099 -1 0.06521739130435 -0.5 -0.5 22701.1851372571 1
i 5 40.97365788596199 2 7 79.67366451078162 -1 -0.02173913043478 -0.5 -0.5 24766.509075421673 1
i 2 41.05368456152051 2 11 65.79332617187394 -1 -0.32608695652174 -0.5 -0.5 26949.18465931701 1
i 6 41.13371123707903 2 6 63.34059246286112 -1 -0.02173913043478 -0.5 -0.5 29247.67812771894 1
i 6 41.21373791263755 2 10 74.16278501696402 -1 -0.06521739130435 -0.5 -0.5 31659.514777173812 1
i 3 41.29376458819607 2 8.83333333333333 63.14509358416625 -1 -0.15217391304348 -0.5 -0.5 34181.23978160785 1
i 5 41.37379126375459 2 7.5 76.3415549498096 -1 -0.02173913043478 -0.5 -0.5 36808.38747830993 1
i 3 41.4538179393131 2 11 67.98446621393592 -1 0.02173913043478 -0.5 -0.5 39535.459964581874 1
i 6 41.53384461487163 2 6.5 61.18563069401019 -1 0.23913043478261 -0.5 -0.5 42355.91575770845 1
i 6 41.61387129043015 2 9 77.6227632929578 -1 -0.28260869565217 -0.5 -0.5 45262.16916361193 1
i 2 41.69389796598867 2 10 64.25369048230428 -1 0.06521739130435 -0.5 -0.5 48245.60087779785 1
i 5 41.77392464154719 2 6.91666666666667 70.85780006941889 -1 -0.3695652173913 -0.5 -0.5 51296.58020748416 1
i 4 41.8539513171057 2 10.83333333333333 70.57273725521407 -1 0.15217391304348 -0.5 -0.5 54404.4991579044 1
i 5 41.93397799266422 2 7.41666666666667 60.26442437910995 -1 0.10869565217391 -0.5 -0.5 57557.81847075574 1
i 5 42.01400466822275 2 8.16666666666667 79.99999471264778 -1 0.28260869565217 -0.5 -0.5 60744.12554084282 1
i 2 42.09403134378126 2 10.91666666666667 65.34125700994235 -1 0.19565217391304 -0.5 -0.5 63950.2039706443 1
i 6 42.17405801933978 2 6.08333333333333 64.39777040063468 -1 -0.06521739130435 -0.5 -0.5 67162.11435436184 1
i 6 42.2540846948983 2 10.16666666666667 73.26362463113091 -1 0.06521739130435 -0.5 -0.5 70365.28571569444 1
i 4 42.33411137045682 2 8.5 62.67288543351428 -1 -0.23913043478261 -0.5 -0.5 73544.61685992395 1
i 5 42.41413804601535 2 7.66666666666667 77.49136418820214 -1 -0.15217391304348 -0.5 -0.5 76684.5867435653 1
i 2 42.49416472157386 2 10 67.2273630675126 -1 -0.19565217391304 -0.5 -0.5 79769.37281661671 1
i 6 42.57419139713238 2 6.41666666666667 61.99807584253199 -1 -0.28260869565217 -0.5 -0.5 82782.97615592668 1
i 6 42.6542180726909 2 9.41666666666667 76.44953119398293 -1 0.19565217391304 -0.5 -0.5 85709.35208581414 1
i 3 42.73424474824942 2 9.58333333333333 63.84303650302036 -1 0.19565217391304 -0.5 -0.5 88532.54487618162 1
i 5 42.81427142380794 2 6.83333333333333 73.10672349588685 -1 -0.32608695652174 -0.5 -0.5 91236.82502090317 1
i 4 42.89429809936646 2 11 69.64387612621813 -1 0.32608695652174 -0.5 -0.5 93806.82753206295 1
i 5 42.97432477492498 2 6 60.00013524686774 -1 -0.02173913043478 -0.5 -0.5 96227.68964008386 1
i 6 43.0543514504835 2 8.5 79.68442333844952 -1 -0.06521739130435 -0.5 -0.5 98485.18626701507 1
i 2 43.13437812604202 2 10.91666666666667 64.9842768125291 -1 -0.02173913043478 -0.5 -0.5 100565.8616409486 1
i 6 43.21440480160054 2 6.08333333333333 66.05918541809646 -1 -0.02173913043478 -0.5 -0.5 102457.15544408941 1
i 5 43.29443147715906 2 10.41666666666667 72.42572063094359 -1 -0.23913043478261 -0.5 -0.5 104147.52193526928 1
i 4 43.37445815271757 2 8.16666666666667 61.9193117261574 -1 -0.32608695652174 -0.5 -0.5 105626.54055928411 1
i 5 43.45448482827609 2 7 78.65409826724724 -1 -0.15217391304348 -0.5 -0.5 106885.01664940843 1
i 2 43.53451150383462 2 11 66.47933335863027 -1 -0.23913043478261 -0.5 -0.5 107915.07094459163 1
i 6 43.61453817939314 2 6.5 62.6330872221104 -1 -0.02173913043478 -0.5 -0.5 108710.21677752738 1
i 6 43.69456485495166 2 9.75 75.30706961806679 -1 -0.23913043478261 -0.5 -0.5 109265.42394204748 1
i 3 43.77459153051017 2 9.41666666666667 63.48410699270973 -1 -0.15217391304348 -0.5 -0.5 109577.16841585841 1
i 5 43.85461820606869 2 7.16666666666667 74.90465139930292 -1 -0.19565217391304 -0.5 -0.5 109643.467294971 1
i 3 43.93464488162721 2 11.08333333333333 68.80977129103053 -1 -0.10869565217391 -0.5 -0.5 109463.8984864994 1
i 5 44.01467155718573 2 6.75 60.315729007219 -1 -0.06521739130435 -0.5 -0.5 109039.60490389873 1
i 6 44.09469823274425 2 8.66666666666667 78.85101479605538 -1 -0.10869565217391 -0.5 -0.5 108373.28311007905 1
i 2 44.17472490830277 2 10.41666666666667 64.66339906019306 -1 -0.10869565217391 -0.5 -0.5 107469.1565560638 1
i 6 44.25475158386129 2 6.33333333333333 68.20632978905395 -1 -0.19565217391304 -0.5 -0.5 106332.93376278471 1
i 5 44.33477825941981 2 10.75 71.59012065041082 -1 0.02173913043478 -0.5 -0.5 104971.75198811105 1
i 4 44.41480493497833 2 7.66666666666667 61.04642870341874 -1 -0.06521739130435 -0.5 -0.5 103394.1071072915 1
i 5 44.49483161053685 2 7.91666666666667 79.58545632862229 -1 -0.15217391304348 -0.5 -0.5 101609.77060976441 1
i 2 44.57485828609537 2 11.08333333333333 65.86275323652947 -1 -0.10869565217391 -0.5 -0.5 99629.69477610724 1
i 6 44.65488496165388 2 6.33333333333333 63.23992293319829 -1 0.06521739130435 -0.5 -0.5 97465.90724331661 1
i 6 44.73491163721241 2 9 74.2881852666552 -1 -0.19565217391304 -0.5 -0.5 95131.39629252034 1
i 3 44.81493831277093 2 8.91666666666667 63.18960044239537 -1 0.06521739130435 -0.5 -0.5 92639.98829879351 1
i 5 44.89496498832945 2 7.41666666666667 76.18997549082658 -1 0.06521739130435 -0.5 -0.5 90006.21886654156 1
i 3 44.97499166388797 2 11.08333333333333 68.08053882704799 -1 0.06521739130435 -0.5 -0.5 87245.19923482985 1
i 6 45.05501833944648 2 6.58333333333333 61.07307799193706 -1 -0.28260869565217 -0.5 -0.5 84372.47957442673 1
i 6 45.135045015005 2 9 77.77374758716928 -1 0.10869565217391 -0.5 -0.5 81403.91081184776 1
i 2 45.21507169056353 2 10 64.30566045812597 -1 -0.32608695652174 -0.5 -0.5 78355.50660553487 1
i 5 45.29509836612204 2 6.58333333333333 70.54701272342453 -1 0.06521739130435 -0.5 -0.5 75243.3070659028 1
i 4 45.37512504168056 2 10.91666666666667 70.69548785853988 -1 0.06521739130435 -0.5 -0.5 72083.2457553229 1
i 5 45.45515171723908 2 7.25 60.33469196273877 -1 0.06521739130435 -0.5 -0.5 68891.02142736717 1
i 5 45.5351783927976 2 8.08333333333333 79.993404431483 -1 -0.19565217391304 -0.5 -0.5 65681.97586843965 1
i 2 45.61520506835613 2 10 65.39451712472982 -1 0.02173913043478 -0.5 -0.5 62470.97909117617 1
i 6 45.69523174391464 2 6.08333333333333 64.22447567485902 -1 0.10869565217391 -0.5 -0.5 59272.32299977479 1
i 6 45.77525841947316 2 10.33333333333333 73.3780638333628 -1 -0.10869565217391 -0.5 -0.5 56099.624505224136 1
i 4 45.85528509503168 2 8.5 62.751605210111 -1 -0.06521739130435 -0.5 -0.5 52965.738915618036 1
i 5 45.9353117705902 2 7.58333333333333 77.33673506424162 -1 -0.10869565217391 -0.5 -0.5 49882.68426617822 1
i 3 46.01533844614872 2 10 67.32960976028305 -1 0.15217391304348 -0.5 -0.5 46861.57708789787 1
i 6 46.09536512170724 2 6.58333333333333 61.89915869585874 -1 0.10869565217391 -0.5 -0.5 43912.57994569709 1
i 6 46.17539179726576 2 9.33333333333333 76.6055676646121 -1 0.10869565217391 -0.5 -0.5 41044.860909305855 1
i 3 46.25541847282428 2 9.66666666666667 63.89695439354774 -1 0.02173913043478 -0.5 -0.5 38266.56495550659 1
i 5 46.3354451483828 2 6.91666666666667 72.82776240827945 -1 -0.02173913043478 -0.5 -0.5 35584.79714131293 1
i 4 46.41547182394132 2 10 69.76382348921376 -1 -0.06521739130435 -0.5 -0.5 33005.61723659134 1
i 5 46.49549849949984 2 6 60.00372232901361 -1 -0.06521739130435 -0.5 -0.5 30534.045363643454 1
i 6 46.57552517505835 2 8.33333333333333 79.76120545336454 -1 -0.15217391304348 -0.5 -0.5 28174.07806231041 1
i 2 46.65555185061687 2 10.83333333333333 65.02775665488512 -1 -0.19565217391304 -0.5 -0.5 25928.714083920313 1
i 6 46.7355785261754 2 6.16666666666667 65.8062738007645 -1 0.10869565217391 -0.5 -0.5 23799.989117174133 1
i 5 46.81560520173392 2 10.41666666666667 72.53456565318461 -1 -0.15217391304348 -0.5 -0.5 21789.018564993807 1
i 4 46.89563187729244 2 8.16666666666667 62.03180212121188 -1 -0.10869565217391 -0.5 -0.5 19896.04742412307 1
i 5 46.97565855285095 2 7.75 78.50627572409378 -1 -0.28260869565217 -0.5 -0.5 18120.506269338723 1
i 2 47.05568522840947 2 11 66.57258877495359 -1 -0.06521739130435 -0.5 -0.5 16461.0723115748 1
i 6 47.13571190396799 2 6.5 62.55862648166548 -1 0.10869565217391 -0.5 -0.5 14915.73448391223 1
i 6 47.21573857952651 2 9.83333333333333 75.45178610346198 -1 -0.06521739130435 -0.5 -0.5 13481.8615106989 1
i 3 47.29576525508503 2 9.25 63.52536147112589 -1 -0.23913043478261 -0.5 -0.5 12156.271932320506 1
i 5 47.37579193064355 2 7.25 74.70179590201978 -1 -0.19565217391304 -0.5 -0.5 10935.305090274302 1
i 3 47.45581860620207 2 11 68.91168891609311 -1 -0.15217391304348 -0.5 -0.5 9814.892122958905 1
i 5 47.53584528176059 2 6.75 60.2414788278903 -1 0.02173913043478 -0.5 -0.5 8790.626080596187 1
i 6 47.61587195731911 2 8.75 78.98044546908122 -1 0.02173913043478 -0.5 -0.5 7857.83033627684 1
i 2 47.69589863287763 2 10.41666666666667 64.70655351845306 -1 -0.10869565217391 -0.5 -0.5 7011.624547633644 1
i 6 47.77592530843615 2 6.25 67.90559509501334 -1 0.02173913043478 -0.5 -0.5 6246.987508249187 1
i 5 47.85595198399466 2 10.58333333333333 71.70312516430566 -1 0.02173913043478 -0.5 -0.5 5558.816317797152 1
i 4 47.93597865955319 2 7.66666666666667 61.15785956392658 -1 -0.28260869565217 -0.5 -0.5 4941.981393236116 1
i 5 48.01600533511171 2 7 79.48779041234609 -1 -0.06521739130435 -0.5 -0.5 4391.376938334845 1
i 2 48.09603201067024 2 11.08333333333333 65.93484700555231 -1 -0.10869565217391 -0.5 -0.5 3901.9665836309414 1
i 6 48.17605868622876 2 6.16666666666667 63.14626860643179 -1 0.15217391304348 -0.5 -0.5 3468.8240019972263 1
i 6 48.25608536178727 2 9.91666666666667 74.4154863087257 -1 -0.3695652173913 -0.5 -0.5 3087.16839475396 1
i 3 48.33611203734579 2 8.91666666666667 63.23142688433406 -1 0.06521739130435 -0.5 -0.5 2752.3948283588898 1
i 5 48.41613871290431 2 7.33333333333333 76.03650927082046 -1 -0.02173913043478 -0.5 -0.5 2460.099480913632 1
i 3 48.49616538846283 2 11.08333333333333 68.1759129027526 -1 -0.06521739130435 -0.5 -0.5 2206.0999300145368 1
i 6 48.57619206402135 2 6.58333333333333 60.96142691452357 -1 -0.15217391304348 -0.5 -0.5 1986.4506780179177 1
i 6 48.65621873957987 2 8 77.9231777659771 -1 0.06521739130435 -0.5 -0.5 1797.4541669498467 1
i 2 48.73624541513839 2 10.16666666666667 64.35656249972236 -1 -0.06521739130435 -0.5 -0.5 1635.6675826362114 1
i 5 48.81627209069691 2 6.5 70.23546894616416 -1 0.02173913043478 -0.5 -0.5 1497.905785935693 1
i 4 48.89629876625543 2 10.83333333333333 70.81741263501358 -1 -0.02173913043478 -0.5 -0.5 1381.240738183493 1
i 5 48.97632544181395 2 7.66666666666667 60.41152801290163 -1 0.02173913043478 -0.5 -0.5 1282.9978082501668 1
i 5 49.05635211737247 2 8.33333333333333 79.97538977766011 -1 -0.32608695652174 -0.5 -0.5 1200.7493602983523 1
i 2 49.13637879293098 2 10 65.44953802966019 -1 0.06521739130435 -0.5 -0.5 1132.3060248514548 1
i 6 49.2164054684895 2 6.16666666666667 64.06200971238202 -1 -0.02173913043478 -0.5 -0.5 1075.7060517713085 1
i 6 49.29643214404803 2 10.16666666666667 73.49367787606762 -1 0.15217391304348 -0.5 -0.5 1029.2031328878797 1
i 4 49.37645881960655 2 8.5 62.82498835718876 -1 -0.10869565217391 -0.5 -0.5 991.2530651332177 1
i 5 49.45648549516507 2 7.58333333333333 77.18308274719972 -1 -0.02173913043478 -0.5 -0.5 960.4996029692182 1
i 3 49.53651217072358 2 10 67.43155553011285 -1 -0.23913043478261 -0.5 -0.5 935.759822571045 1
i 6 49.6165388462821 2 6.58333333333333 61.79689827435774 -1 0.06521739130435 -0.5 -0.5 916.0092905599556 1
i 6 49.69656552184062 2 9.58333333333333 76.76180267009856 -1 0.02173913043478 -0.5 -0.5 900.367297993429 1
i 3 49.77659219739914 2 9.66666666666667 63.95153085994201 -1 -0.19565217391304 -0.5 -0.5 888.0823867132766 1
i 5 49.85661887295766 2 6 72.54145891447027 -1 -0.15217391304348 -0.5 -0.5 878.5183608790458 1
i 4 49.93664554851618 2 10 69.8852641416369 -1 0.02173913043478 -0.5 -0.5 871.140942368412 1
i 5 50.0166722240747 2 7.08333333333333 60.01768108036835 -1 -0.02173913043478 -0.5 -0.5 865.50519542965 1
i 6 50.09669889963322 2 8.33333333333333 79.82802550239062 -1 -0.28260869565217 -0.5 -0.5 861.2438141590345 1
i 2 50.17672557519174 2 10.75 65.07209150156054 -1 -0.10869565217391 -0.5 -0.5 858.0563365900954 1
i 6 50.25675225075026 2 6.25 65.56279188554394 -1 0.10869565217391 -0.5 -0.5 855.6993218645537 1
i 5 50.33677892630878 2 10.33333333333333 72.64367526067961 -1 0.32608695652174 -0.5 -0.5 853.9775024470696 1
i 4 50.4168056018673 2 8.16666666666667 62.14131876124219 -1 0.3695652173913 -0.5 -0.5 852.7359018861085 1
i 5 50.49683227742582 2 7.75 78.35533032424765 -1 -0.02173913043478 -0.5 -0.5 851.8528903506545 1
i 2 50.57685895298434 2 11 66.66813304654767 -1 -0.10869565217391 -0.5 -0.5 851.2341351323462 1
i 6 50.65688562854286 2 6.33333333333333 62.48226762175273 -1 -0.10869565217391 -0.5 -0.5 850.8073914531599 1
i 6 50.73691230410138 2 9.66666666666667 75.59878464342052 -1 0.06521739130435 -0.5 -0.5 850.5180701405212 1
i 3 50.8169389796599 2 9.33333333333333 63.56847890378799 -1 0.15217391304348 -0.5 -0.5 850.3255128377625 1
i 5 50.89696565521842 2 7.08333333333333 74.48847139396246 -1 -0.10869565217391 -0.5 -0.5 850.1999021654597 1
i 3 50.97699233077694 2 11.08333333333333 69.01601903502205 -1 -0.28260869565217 -0.5 -0.5 850.1197333520369 1
i 5 51.05701900633545 2 6.75 60.17618194650873 -1 0.06521739130435 -0.5 -0.5 850.0697749926791 1
i 6 51.13704568189397 2 8.66666666666667 79.10534041109948 -1 -0.06521739130435 -0.5 -0.5 850.039449437856 1
i 2 51.21707235745249 2 10.5 64.7491276062666 -1 -0.15217391304348 -0.5 -0.5 850.0215675136246 1
i 6 51.29709903301102 2 6.33333333333333 67.60865314498615 -1 -0.15217391304348 -0.5 -0.5 850.0113574966906 1
i 5 51.37712570856954 2 10.66666666666667 71.81505909272799 -1 -0.02173913043478 -0.5 -0.5 850.0057341836708 1
i 4 51.45715238412805 2 7.75 61.27172889020982 -1 -0.19565217391304 -0.5 -0.5 850.0027602049639 1
i 5 51.53717905968657 2 7 79.3811673061383 -1 -0.10869565217391 -0.5 -0.5 850.0012581683092 1
i 2 51.61720573524509 2 11.08333333333333 66.00971431228605 -1 0.15217391304348 -0.5 -0.5 850.0005385406689 1
i 6 51.69723241080361 2 6.08333333333333 63.05871607293406 -1 -0.3695652173913 -0.5 -0.5 850.0002141944755 1
i 6 51.77725908636213 2 9 74.54481404531596 -1 -0.06521739130435 -0.5 -0.5 850.0000781025103 1
i 3 51.85728576192065 2 8 63.27118738373358 -1 -0.06521739130435 -0.5 -0.5 850.0000256540368 1
i 5 51.93731243747917 2 7.33333333333333 75.88017532688482 -1 -0.06521739130435 -0.5 -0.5 850.000007413827 1
i 3 52.01733911303769 2 11.08333333333333 68.27086275927599 -1 -0.02173913043478 -0.5 -0.5 850.0000018244962 1
i 5 52.09736578859621 2 6.66666666666667 60.85152477357548 -1 0.02173913043478 -0.5 -0.5 850.0000003647557 1
i 6 52.17739246415473 2 8 78.07087854136813 -1 -0.10869565217391 -0.5 -0.5 850.0000000551496 1
i 2 52.25741913971325 2 10.33333333333333 64.40633307979728 -1 0.19565217391304 -0.5 -0.5 850.0000000056123 1
i 5 52.33744581527176 2 6.5 69.9237378974794 -1 -0.10869565217391 -0.5 -0.5 850.0000000003118 1
i 4 52.41747249083028 2 10.75 70.93834717176148 -1 -0.19565217391304 -0.5 -0.5 850.000000000006 1
i 5 52.49749916638881 2 7.33333333333333 60.49444054275311 -1 -0.19565217391304 -0.5 -0.5 850 1
i 5 52.57752584194733 2 8.08333333333333 79.94607155666881 -1 -0.19565217391304 -0.5 -0.5 850 1
i 2 52.65755251750585 2 10 65.50642172292314 -1 -0.15217391304348 -0.5 -0.5 850 1
i 6 52.73757919306436 2 6.08333333333333 63.91015121296387 -1 0.06521739130435 -0.5 -0.5 849.9999999999998 1
i 6 52.81760586862288 2 10.08333333333333 73.61053756897523 -1 0.02173913043478 -0.5 -0.5 849.9999999999711 1
i 4 52.8976325441814 2 8.66666666666667 62.89313658313003 -1 -0.23913043478261 -0.5 -0.5 849.9999999990545 1
i 5 52.97765921973992 2 7.66666666666667 77.03048513193907 -1 0.19565217391304 -0.5 -0.5 849.999999986707 1
i 3 53.05768589529844 2 10 67.53292615706202 -1 -0.23913043478261 -0.5 -0.5 849.999999888396 1
i 6 53.13771257085696 2 6.5 61.69164053528728 -1 -0.06521739130435 -0.5 -0.5 849.9999993380842 1
i 6 53.21773924641548 2 9.33333333333333 76.91792683592656 -1 -0.02173913043478 -0.5 -0.5 849.9999969436223 1
i 3 53.297765921974 2 9.75 64.0064373381279 -1 -0.15217391304348 -0.5 -0.5 849.9999883179253 1
i 5 53.37779259753252 2 6.75 72.24882051585887 -1 -0.06521739130435 -0.5 -0.5 849.9999614857406 1
i 4 53.45781927309104 2 10 70.00783813365683 -1 -0.02173913043478 -0.5 -0.5 849.9998872541825 1
i 5 53.53784594864956 2 7.08333333333333 60.04162699019832 -1 -0.41304347826087 -0.5 -0.5 849.9997006663043 1
i 5 53.61787262420808 2 8.33333333333333 79.88437965420027 -1 -0.28260869565217 -0.5 -0.5 849.9992676585235 1
i 2 53.6978992997666 2 10.75 65.11743997268749 -1 0.02173913043478 -0.5 -0.5 849.9983284456109 1
i 6 53.77792597532512 2 6.08333333333333 65.32926604965958 -1 -0.06521739130435 -0.5 -0.5 849.9964059118093 1
i 5 53.85795265088364 2 10.33333333333333 72.75322995875865 -1 -0.02173913043478 -0.5 -0.5 849.99266336997 1
i 4 53.93797932644216 2 8.33333333333333 62.24723779949264 -1 -0.10869565217391 -0.5 -0.5 849.9856914703993 1
i 5 54.01800600200068 2 7.75 78.2020780520022 -1 -0.06521739130435 -0.5 -0.5 849.9731988415443 1
i 2 54.0980326775592 2 11.08333333333333 66.76568006276419 -1 -0.15217391304348 -0.5 -0.5 849.951575309484 1
i 6 54.17805935311772 2 6.33333333333333 62.40329539063824 -1 -0.10869565217391 -0.5 -0.5 849.9152903980273 1
i 6 54.25808602867623 2 9.66666666666667 75.74790401172024 -1 -0.15217391304348 -0.5 -0.5 849.8560834240509 1
i 3 54.33811270423475 2 9.33333333333333 63.61358862608553 -1 -0.19565217391304 -0.5 -0.5 849.7618950829417 1
i 5 54.41813937979327 2 7.08333333333333 74.26434550499569 -1 0.06521739130435 -0.5 -0.5 849.6154842147022 1
i 3 54.4981660553518 2 11 69.12292784177629 -1 -0.02173913043478 -0.5 -0.5 849.3926677346734 1
i 5 54.57819273091032 2 6.75 60.12052964029819 -1 -0.02173913043478 -0.5 -0.5 849.0601168141475 1
i 6 54.65821940646883 2 8.66666666666667 79.22501554773464 -1 -0.06521739130435 -0.5 -0.5 848.5726386358264 1
i 2 54.73824608202735 2 10.5 64.79129572686901 -1 0.32608695652174 -0.5 -0.5 847.8698707685352 1
i 6 54.81827275758587 2 6.25 67.31622955394539 -1 -0.06521739130435 -0.5 -0.5 846.8723147467294 1
i 5 54.89829943314439 2 10.66666666666667 71.92604027604004 -1 -0.02173913043478 -0.5 -0.5 845.4766371341201 1
i 4 54.97832610870291 2 7 61.38740941195599 -1 0.10869565217391 -0.5 -0.5 843.5501705050502 1
i 5 55.05835278426143 2 7 79.26616909737358 -1 -0.45652173913043 -0.5 -0.5 840.9245536644698 1
i 2 55.13837945981995 2 11 66.08743775008026 -1 -0.32608695652174 -0.5 -0.5 837.3884602718132 1
i 6 55.21840613537847 2 6 62.97625661806792 -1 -0.06521739130435 -0.5 -0.5 832.6793780002098 1
i 6 55.29843281093699 2 9 74.67629007521607 -1 0.19565217391304 -0.5 -0.5 826.4744165434198 1
i 3 55.37845948649551 2 9.08333333333333 63.30952572650052 -1 -0.06521739130435 -0.5 -0.5 818.3801421906185 1
i 5 55.45848616205403 2 7.41666666666667 75.7198862421263 -1 -0.06521739130435 -0.5 -0.5 807.9214592460414 1
i 3 55.53851283761254 2 11 68.36572961612985 -1 -0.02173913043478 -0.5 -0.5 794.5295841025296 1
i 5 55.61853951317106 2 6.66666666666667 60.74428653971265 -1 -0.06521739130435 -0.5 -0.5 777.5291860109734 1
i 6 55.69856618872959 2 8 78.21665786735562 -1 -0.23913043478261 -0.5 -0.5 756.1247991447146 1
i 2 55.77859286428811 2 10.25 64.4549456655468 -1 -0.15217391304348 -0.5 -0.5 729.386642961155 1
i 5 55.85861953984663 2 6.41666666666667 69.61233259577514 -1 -0.10869565217391 -0.5 -0.5 696.2360215363572 1
i 4 55.93864621540514 2 10.75 71.05816693819975 -1 -0.19565217391304 -0.5 -0.5 655.4305068255834 1
i 5 56.01867289096366 2 7.5 60.58296041352351 -1 -0.10869565217391 -0.5 -0.5 605.5491449349234 1
i 5 56.09869956652218 2 8 79.90561309267213 -1 0.19565217391304 -0.5 -0.5 544.9779576595414 1
i 2 56.1787262420807 2 10 65.56527614685477 -1 -0.28260869565217 -0.5 -0.5 471.8960428804262 1
i 6 56.25875291763922 2 6 63.76859762639104 -1 -0.19565217391304 -0.5 -0.5 384.2626060059455 1
i 6 56.33877959319774 2 10.25 73.7287164690973 -1 0.28260869565217 -0.5 -0.5 279.80527957200917 1
i 4 56.41880626875626 2 8.58333333333333 62.95623610850583 -1 -0.06521739130435 -0.5 -0.5 156.01010845266677 1
i 5 56.49883294431478 2 7 76.87889069875871 -1 -0.19565217391304 -0.5 -0.5 10.11359298893468 1
i 3 56.5788596198733 2 10 67.63350147742179 -1 0.15217391304348 -0.5 -0.5 -160.9028091296644 1
i 6 56.65888629543182 2 6.5 61.58380498450403 -1 -0.06521739130435 -0.5 -0.5 -360.3153199678254 1
i 6 56.73891297099034 2 9.33333333333333 77.07365277333739 -1 0.02173913043478 -0.5 -0.5 -591.6572215141618 1
i 3 56.81893964654886 2 9.75 64.06136226788846 -1 -0.02173913043478 -0.5 -0.5 -858.7145976759758 1
i 5 56.89896632210738 2 6.83333333333333 71.95086000085638 -1 -0.10869565217391 -0.5 -0.5 -1165.5180802784682 1
i 4 56.9789929976659 2 10 70.13118102134466 -1 -0.06521739130435 -0.5 -0.5 -1516.3302736714131 1
i 5 57.05901967322442 2 7.16666666666667 60.07510101549505 -1 -0.10869565217391 -0.5 -0.5 -1915.6285740584688 1
i 5 57.13904634878294 2 8.5 79.92986549517072 -1 -0.15217391304348 -0.5 -0.5 -2368.083150159231 1
i 2 57.21907302434146 2 10.91666666666667 65.16394470619295 -1 0.02173913043478 -0.5 -0.5 -2878.5299109922735 1
i 6 57.29909969989998 2 6.16666666666667 65.10611966508671 -1 0.23913043478261 -0.5 -0.5 -3451.9383539273404 1
i 6 57.3791263754585 2 10.33333333333333 72.8633910915823 -1 -0.15217391304348 -0.5 -0.5 -4093.3742609928263 1
i 4 57.45915305101701 2 8.25 62.34901787081314 -1 0.06521739130435 -0.5 -0.5 -4807.957292836453 1
i 5 57.53917972657553 2 7.83333333333333 78.0472778779527 -1 0.32608695652174 -0.5 -0.5 -5600.813616627483 1
i 2 57.61920640213405 2 10.91666666666667 66.8649029146879 -1 -0.19565217391304 -0.5 -0.5 -6477.023795285923 1
i 6 57.69923307769258 2 6.33333333333333 62.32116442586462 -1 -0.10869565217391 -0.5 -0.5 -7441.566259294531 1
i 6 57.7792597532511 2 9.66666666666667 75.89893040350523 -1 -0.15217391304348 -0.5 -0.5 -8499.256777420054 1
i 3 57.85928642880961 2 9.41666666666667 63.66070204704113 -1 -0.23913043478261 -0.5 -0.5 -9654.684437246311 1
i 5 57.93931310436813 2 7.08333333333333 74.02935186353457 -1 0.06521739130435 -0.5 -0.5 -10912.144738748932 1
i 3 58.01933977992665 2 11.08333333333333 69.23248142226167 -1 -0.23913043478261 -0.5 -0.5 -12275.570492368806 1
i 5 58.09936645548517 2 6.83333333333333 60.07506683481044 -1 -0.19565217391304 -0.5 -0.5 -13748.461295357622 1
i 6 58.17939313104369 2 8.5 79.33873035906139 -1 -0.02173913043478 -0.5 -0.5 -15333.812434717403 1
i 2 58.25941980660221 2 10.58333333333333 64.83324614379553 -1 0.10869565217391 -0.5 -0.5 -17034.04413009887 1
i 6 58.33944648216073 2 6.16666666666667 67.02910008497271 -1 -0.10869565217391 -0.5 -0.5 -18850.932083869302 1
i 5 58.41947315771925 2 10.66666666666667 72.03621290789589 -1 0.19565217391304 -0.5 -0.5 -20785.54034667291 1
i 4 58.49949983327777 2 7.91666666666667 61.50422004891701 -1 0.06521739130435 -0.5 -0.5 -22838.157533810838 1
i 5 58.57952650883629 2 7 79.14345929641524 -1 -0.15217391304348 -0.5 -0.5 -25008.23743950463 1
i 2 58.65955318439481 2 11.16666666666667 66.16806712214111 -1 0.06521739130435 -0.5 -0.5 -27294.34509160668 1
i 6 58.73957985995332 2 6.16666666666667 62.89780297463793 -1 -0.32608695652174 -0.5 -0.5 -29694.109267940756 1
i 6 58.81960653551184 2 9.83333333333333 74.81002503317046 -1 -0.23913043478261 -0.5 -0.5 -32204.182456777497 1
i 3 58.89963321107037 2 9.16666666666667 63.34709452789292 -1 -0.06521739130435 -0.5 -0.5 -34820.209187867564 1
i 5 58.97965988662889 2 7.25 75.55448265332143 -1 -0.19565217391304 -0.5 -0.5 -37536.803587229435 1
i 3 59.05968656218741 2 11 68.46090741916977 -1 -0.15217391304348 -0.5 -0.5 -40347.53691899138 1
i 5 59.13971323774592 2 6.58333333333333 60.64068330174476 -1 0.15217391304348 -0.5 -0.5 -43244.93577194954 1
i 6 59.21973991330444 2 8.83333333333333 78.36029346412235 -1 0.02173913043478 -0.5 -0.5 -46220.49142821946 1
i 2 59.29976658886296 2 10.25 64.50240848868313 -1 0.06521739130435 -0.5 -0.5 -49264.68081797813 1
i 5 59.37979326442148 2 6.58333333333333 69.30172829916646 -1 0.15217391304348 -0.5 -0.5 -52366.999319489216 1
i 4 59.45981993998 2 10.91666666666667 71.1767861253803 -1 -0.19565217391304 -0.5 -0.5 -55516.00550947744 1
i 5 59.53984661553852 2 7.5 60.67663656757668 -1 -0.02173913043478 -0.5 -0.5 -58699.37780761273 1
i 5 59.61987329109704 2 8 79.85421547072696 -1 -0.19565217391304 -0.5 -0.5 -61903.98279290348 1
i 2 59.69989996665556 2 10.91666666666667 65.62621684965293 -1 -0.10869565217391 -0.5 -0.5 -65115.954801693115 1
i 6 59.77992664221408 2 6 63.63696478700567 -1 -0.10869565217391 -0.5 -0.5 -68320.78624942912 1
i 6 59.8599533177726 2 10 73.84829539270112 -1 -0.06521739130435 -0.5 -0.5 -71503.42795416461 1
i 4 59.93997999333112 2 8.66666666666667 63.01455284189822 -1 -0.15217391304348 -0.5 -0.5 -74648.39858162859 1
i 5 60.02000666888964 2 7.58333333333333 76.72811219728347 -1 -0.19565217391304 -0.5 -0.5 -77739.90218236785 1
i 3 60.10003334444816 2 11 67.73312478962367 -1 -0.10869565217391 -0.5 -0.5 -80761.95265354501 1
i 6 60.18006002000668 2 6.66666666666667 61.47387498571224 -1 0.06521739130435 -0.5 -0.5 -83698.5038339854 1
i 6 60.2600866955652 2 9.25 77.22871983712963 -1 -0.15217391304348 -0.5 -0.5 -86533.58383327113 1
i 3 60.34011337112372 2 9.83333333333333 64.11602203765112 -1 -0.06521739130435 -0.5 -0.5 -89251.43210614478 1
i 5 60.42014004668224 2 6.75 71.64856002739798 -1 -0.15217391304348 -0.5 -0.5 -91836.63771403208 1
i 4 60.50016672224076 2 10 70.25493842511757 -1 -0.10869565217391 -0.5 -0.5 -94274.27716755713 1
i 5 60.58019339779928 2 7.16666666666667 60.11759321694196 -1 0.02173913043478 -0.5 -0.5 -96550.05021863698 1
i 5 60.66022007335779 2 8.33333333333333 79.96418369336061 -1 -0.06521739130435 -0.5 -0.5 -98650.41196892787 1
i 2 60.74024674891631 2 10.91666666666667 65.21173350576987 -1 -0.15217391304348 -0.5 -0.5 -100562.6996833411 1
i 6 60.82027342447483 2 6 64.89366787987565 -1 0.23913043478261 -0.5 -0.5 -102275.25274308592 1
i 6 60.90030010003336 2 10.25 72.97429918127519 -1 0.10869565217391 -0.5 -0.5 -103777.52424180371 1
i 4 60.98032677559188 2 8.33333333333333 62.44621204896497 -1 -0.15217391304348 -0.5 -0.5 -105060.18281996885 1
i 5 61.06035345115039 2 7.75 77.8916136262359 -1 0.06521739130435 -0.5 -0.5 -106115.20344567833 1
i 2 61.14038012670891 2 10 66.96544562843555 -1 0.02173913043478 -0.5 -0.5 -106935.94598261117 1
i 6 61.22040680226743 2 6.33333333333333 62.23550273826766 -1 0.19565217391304 -0.5 -0.5 -107517.22053641635 1
i 6 61.30043347782595 2 9.5 76.05160507822131 -1 0.10869565217391 -0.5 -0.5 -107855.33873681766 1
i 3 61.38046015338447 2 9.5 63.70972428886773 -1 -0.19565217391304 -0.5 -0.5 -107948.1502918102 1
i 5 61.46048682894299 2 7 73.78368359959572 -1 0.10869565217391 -0.5 -0.5 -107795.06433971088 1
i 3 61.54051350450151 2 11 69.3446465309214 -1 -0.10869565217391 -0.5 -0.5 -107397.05532160136 1
i 5 61.62054018006003 2 6 60.0401787771961 -1 0.06521739130435 -0.5 -0.5 -106756.65329779217 1
i 6 61.70056685561855 2 8.58333333333333 79.44571107263002 -1 0.06521739130435 -0.5 -0.5 -105877.91883422568 1
i 2 61.78059353117707 2 10.66666666666667 64.8751764498455 -1 0.02173913043478 -0.5 -0.5 -104766.40278506087 1
i 6 61.86062020673559 2 6.16666666666667 66.748068567408 -1 -0.02173913043478 -0.5 -0.5 -103429.09149291621 1
i 5 61.9406468822941 2 10.75 72.14574520011928 -1 -0.19565217391304 -0.5 -0.5 -101874.33811538159 1
i 4 62.02067355785262 2 7 61.6214352030261 -1 0.19565217391304 -0.5 -0.5 -100111.78096253565 1
i 5 62.10070023341115 2 7.83333333333333 79.01377581522361 -1 0.06521739130435 -0.5 -0.5 -98152.24989264566 1
i 2 62.18072690896967 2 11 66.25161142279683 -1 -0.15217391304348 -0.5 -0.5 -96007.66195953007 1
i 6 62.26075358452819 2 6.33333333333333 62.82221645525313 -1 0.19565217391304 -0.5 -0.5 -93690.90763304716 1
i 6 62.3407802600867 2 9.83333333333333 74.94611073664028 -1 -0.28260869565217 -0.5 -0.5 -91215.72902204293 1
i 3 62.42080693564522 2 9.08333333333333 63.38453048968216 -1 -0.19565217391304 -0.5 -0.5 -88596.5916152433 1
i 5 62.50083361120374 2 7.25 75.38277905701331 -1 -0.32608695652174 -0.5 -0.5 -85848.55111905934 1
i 3 62.58086028676226 2 11 68.55682332320511 -1 -0.23913043478261 -0.5 -0.5 -82987.11701114918 1
i 5 62.66088696232078 2 6.91666666666667 60.54172359513635 -1 0.10869565217391 -0.5 -0.5 -80028.11444474761 1
i 6 62.7409136378793 2 8.83333333333333 78.50151845705886 -1 -0.06521739130435 -0.5 -0.5 -76987.546131094 1
i 2 62.82094031343782 2 10.25 64.54876218738772 -1 -0.19565217391304 -0.5 -0.5 -73881.45579639781 1
i 5 62.90096698899634 2 6.5 68.99238459406982 -1 -0.23913043478261 -0.5 -0.5 -70725.79475644896 1
i 5 62.98099366455486 2 10.66666666666667 71.29415573981254 -1 0.10869565217391 -0.5 -0.5 -67536.29307743376 1
i 5 63.06102034011338 2 7.5 60.77502725117884 -1 -0.15217391304348 -0.5 -0.5 -64328.33669734157 1
i 5 63.1410470156719 2 8 79.79211676583219 -1 -0.15217391304348 -0.5 -0.5 -61116.851770382214 1
i 2 63.22107369123042 2 11.08333333333333 65.68936713969504 -1 -0.23913043478261 -0.5 -0.5 -57916.19736919956 1
i 6 63.30110036678894 2 6 63.51478422822988 -1 -0.23913043478261 -0.5 -0.5 -54740.067538697855 1
i 6 63.38112704234746 2 10 73.9693655337406 -1 -0.02173913043478 -0.5 -0.5 -51601.40354360855 1
i 3 63.46115371790598 2 8.66666666666667 63.06842798265168 -1 -0.41304347826087 -0.5 -0.5 -48512.31699198658 1
i 5 63.5411803934645 2 7.58333333333333 76.5778205991541 -1 0.02173913043478 -0.5 -0.5 -45484.02435161817 1
i 3 63.62120706902302 2 11 67.83171058032606 -1 -0.28260869565217 -0.5 -0.5 -42526.79320833489 1
i 6 63.70123374458154 2 6.5 61.36239319030399 -1 -0.10869565217391 -0.5 -0.5 -39649.90044746787 1
i 6 63.78126042014006 2 9.08333333333333 77.38289560258767 -1 -0.06521739130435 -0.5 -0.5 -36861.60237456937 1
i 3 63.86128709569857 2 9 64.17016847653218 -1 0.06521739130435 -0.5 -0.5 -34169.11663179489 1
i 5 63.94131377125709 2 6.66666666666667 71.34284595584799 -1 -0.06521739130435 -0.5 -0.5 -31578.615614294446 1
i 4 64.02134044681561 2 10 70.37877780118518 -1 0.10869565217391 -0.5 -0.5 -29095.23094877869 1
i 5 64.10136712237413 2 7.25 60.16856479240182 -1 0.3695652173913 -0.5 -0.5 -26723.068466109093 1
i 5 64.18139379793266 2 8.16666666666667 79.98713391452648 -1 -0.19565217391304 -0.5 -0.5 -24465.232982930524 1
i 2 64.26142047349117 2 10.83333333333333 65.2609217303321 -1 -0.19565217391304 -0.5 -0.5 -22323.862105520628 1
i 6 64.3414471490497 2 6 64.69211727534193 -1 -0.02173913043478 -0.5 -0.5 -20300.168183112866 1
i 6 64.42147382460821 2 10.25 73.08607444847719 -1 0.02173913043478 -0.5 -0.5 -18394.48746893642 1
i 4 64.50150050016673 2 8.41666666666667 62.53847482010148 -1 -0.19565217391304 -0.5 -0.5 -16606.335495348972 1
i 5 64.58152717572526 2 7.75 77.73567929235652 -1 -0.02173913043478 -0.5 -0.5 -14934.467635067127 1
i 2 64.66155385128377 2 10 67.0669365215394 -1 0.15217391304348 -0.5 -0.5 -13376.943803268428 1
i 6 64.74158052684228 2 6.33333333333333 62.14610539479352 -1 -0.10869565217391 -0.5 -0.5 -11931.196254919972 1
i 6 64.82160720240081 2 9.41666666666667 76.20563466144543 -1 -0.10869565217391 -0.5 -0.5 -10594.099447250694 1
i 3 64.90163387795933 2 9.58333333333333 63.76047145478046 -1 0.06521739130435 -0.5 -0.5 -9362.040967876297 1
i 5 64.98166055351784 2 6 73.52777122175975 -1 0.02173913043478 -0.5 -0.5 -8230.992573444037 1
i 3 65.06168722907637 2 11.08333333333333 69.45929774839942 -1 -0.15217391304348 -0.5 -0.5 -7196.580440414738 1
i 5 65.14171390463488 2 6.91666666666667 60.01608651892749 -1 -0.28260869565217 -0.5 -0.5 -6254.153797127285 1
i 6 65.22174058019341 2 8.66666666666667 79.5451773041505 -1 -0.06521739130435 -0.5 -0.5 -5398.851182907709 1
i 2 65.30176725575193 2 10.75 64.91728834976782 -1 -0.02173913043478 -0.5 -0.5 -4625.663663932824 1
i 6 65.38179393131044 2 6.25 66.47394106870584 -1 -0.06521739130435 -0.5 -0.5 -3929.494424945 1
i 5 65.46182060686897 2 10.5 72.25482490269992 -1 0.06521739130435 -0.5 -0.5 -3305.2142489768403 1
i 4 65.54184728242748 2 7.91666666666667 61.7382999909529 -1 -0.10869565217391 -0.5 -0.5 -2747.7124920917113 1
i 5 65.62187395798601 2 7.91666666666667 78.87791763742823 -1 0.32608695652174 -0.5 -0.5 -2251.9432550797533 1
i 2 65.70190063354453 2 11 66.3380318313609 -1 -0.28260869565217 -0.5 -0.5 -1812.9665473802283 1
i 6 65.78192730910304 2 6.33333333333333 62.74834313654824 -1 -0.10869565217391 -0.5 -0.5 -1425.9843286904388 1
i 6 65.86195398466157 2 9.83333333333333 75.08461119737647 -1 -0.02173913043478 -0.5 -0.5 -1086.3713993824501 1
i 3 65.94198066022008 2 9.08333333333333 63.42242726145729 -1 0.19565217391304 -0.5 -0.5 -789.7011907410393 1
i 5 66.0220073357786 2 7.16666666666667 75.2036187922892 -1 0.06521739130435 -0.5 -0.5 -531.7665791161608 1
i 3 66.10203401133712 2 11 68.65391367367046 -1 -0.19565217391304 -0.5 -0.5 -308.5959134950845 1
i 5 66.18206068689564 2 6 60.44842858868155 -1 0.02173913043478 -0.5 -0.5 -116.46450308654957 1
i 6 66.26208736245415 2 8 78.64000691595548 -1 -0.10869565217391 -0.5 -0.5 48.09814018039372 1
i 2 66.34211403801268 2 10.33333333333333 64.59407735398509 -1 -0.10869565217391 -0.5 -0.5 188.30497005175337 1
i 6 66.4221407135712 2 6.33333333333333 68.68476990264404 -1 -0.15217391304348 -0.5 -0.5 307.11162084867607 1
i 5 66.50216738912972 2 10.66666666666667 71.4102611342477 -1 0.02173913043478 -0.5 -0.5 407.219783234718 1
i 4 66.58219406468824 2 7.58333333333333 60.87768770621591 -1 -0.06521739130435 -0.5 -0.5 491.0833426253396 1
i 5 66.66222074024675 2 8 79.7195957020769 -1 0.02173913043478 -0.5 -0.5 560.9168776313913 1
i 2 66.74224741580528 2 11 65.7548563290283 -1 -0.19565217391304 -0.5 -0.5 618.7061191643159 1
i 6 66.8222740913638 2 6.08333333333333 63.40149857950708 -1 0.02173913043478 -0.5 -0.5 666.2199809845076 1
i 6 66.90230076692232 2 10 74.0920296760309 -1 0.02173913043478 -0.5 -0.5 705.0237887548592 1
i 3 66.98232744248084 2 8.75 63.11827378037837 -1 -0.06521739130435 -0.5 -0.5 736.4933562094061 1
i 5 67.06235411803935 2 7.41666666666667 76.42754032214899 -1 -0.23913043478261 -0.5 -0.5 761.8295829596589 1
i 3 67.14238079359788 2 11.08333333333333 67.92925024005564 -1 -0.06521739130435 -0.5 -0.5 782.0732778131999 1
i 6 67.2224074691564 2 6.66666666666667 61.24996184256025 -1 -0.15217391304348 -0.5 -0.5 798.1199433483815 1
i 6 67.30243414471491 2 9.08333333333333 77.53597373911201 -1 -0.02173913043478 -0.5 -0.5 810.7342909740727 1
i 2 67.38246082027344 2 9 64.22359317036971 -1 0.32608695652174 -0.5 -0.5 820.56428994423 1
i 5 67.46248749583195 2 6.66666666666667 71.0345682180299 -1 0.06521739130435 -0.5 -0.5 828.1545879927196 1
i 4 67.54251417139047 2 10 70.50239699420413 -1 0.10869565217391 -0.5 -0.5 833.9591746740041 1
i 5 67.622540846949 2 7.16666666666667 60.22746712566386 -1 0.10869565217391 -0.5 -0.5 838.3531904954342 1
i 5 67.70256752250751 2 8.25 79.99860632476582 -1 -0.06521739130435 -0.5 -0.5 841.6438149543767 1
i 2 67.78259419806604 2 10 65.31161547404814 -1 -0.19565217391304 -0.5 -0.5 844.0801941948837 1
i 6 67.86262087362455 2 6.08333333333333 64.50156962815198 -1 -0.28260869565217 -0.5 -0.5 845.8623938225029 1
i 6 67.94264754918306 2 10.25 73.19881900163293 -1 -0.5 -0.5 -0.5 847.1493842127121 1
i 4 68.02267422474159 2 8.5 62.62556431514315 -1 0.23913043478261 -0.5 -0.5 848.0660842684814 1
i 5 68.1027009003001 2 7.66666666666667 77.57996799836005 -1 0.02173913043478 -0.5 -0.5 848.7095049706172 1
i 2 68.18272757585864 2 10 67.16900206646278 -1 0.06521739130435 -0.5 -0.5 849.154046253581 1
i 6 68.26275425141715 2 6.33333333333333 62.05292096923894 -1 -0.3695652173913 -0.5 -0.5 849.4560098409601 1
i 6 68.34278092697566 2 9.5 76.36070268704836 -1 -0.15217391304348 -0.5 -0.5 849.657396868955 1
i 3 68.42280760253419 2 9.66666666666667 63.81269119171287 -1 -0.06521739130435 -0.5 -0.5 849.7890626503413 1
i 5 68.5028342780927 2 6 73.26224885268215 -1 -0.19565217391304 -0.5 -0.5 849.8733020676414 1
i 4 68.58286095365122 2 11.08333333333333 69.57622941017405 -1 -0.28260869565217 -0.5 -0.5 849.9259381473639 1
i 5 68.66288762920975 2 6 60.00285091498355 -1 -0.06521739130435 -0.5 -0.5 849.9579836919136 1
i 6 68.74291430476826 2 8.5 79.63636940533104 -1 -0.02173913043478 -0.5 -0.5 849.9769417749332 1
i 2 68.82294098032678 2 10.66666666666667 64.9597821001301 -1 -0.15217391304348 -0.5 -0.5 849.9878057790731 1
i 6 68.9029676558853 2 6.08333333333333 66.20749982511956 -1 0.06521739130435 -0.5 -0.5 849.9938137987675 1
i 5 68.98299433144382 2 10.5 72.363652613122 -1 -0.19565217391304 -0.5 -0.5 849.9970059485474 1
i 4 69.06302100700235 2 8.08333333333333 61.85404966213872 -1 0.06521739130435 -0.5 -0.5 849.9986266841146 1
i 5 69.14304768256086 2 7 78.7367266894412 -1 -0.06521739130435 -0.5 -0.5 849.9994078977562 1
i 2 69.22307435811938 2 11.08333333333333 66.42723626742523 -1 -0.28260869565217 -0.5 -0.5 849.9997624911434 1
i 6 69.3031010336779 2 6.33333333333333 62.67505581405324 -1 -0.23913043478261 -0.5 -0.5 849.999912514752 1
i 6 69.38312770923642 2 9.66666666666667 75.22555306355984 -1 -0.06521739130435 -0.5 -0.5 849.9999709092892 1
i 3 69.46315438479495 2 9.33333333333333 63.46130860871536 -1 -0.19565217391304 -0.5 -0.5 849.9999914644089 1
i 5 69.54318106035346 2 7.33333333333333 75.01593402144682 -1 -0.02173913043478 -0.5 -0.5 849.9999978585678 1
i 3 69.62320773591198 2 11.08333333333333 68.752597356333 -1 -0.06521739130435 -0.5 -0.5 849.999999560916 1
i 5 69.7032344114705 2 6.66666666666667 60.36180279891229 -1 -0.10869565217391 -0.5 -0.5 849.9999999312703 1
i 6 69.78326108702902 2 8.66666666666667 78.77536087300523 -1 -0.15217391304348 -0.5 -0.5 849.9999999926438 1
i 2 69.86328776258753 2 10.33333333333333 64.63845203437099 -1 -0.19565217391304 -0.5 -0.5 849.9999999995572 1
i 6 69.94331443814606 2 6.33333333333333 68.37938579945715 -1 -0.15217391304348 -0.5 -0.5 849.99999999999 1
i 5 70.02334111370457 2 10.66666666666667 71.52511940442749 -1 -0.28260869565217 -0.5 -0.5 850 1
i 4 70.10336778926309 2 7.66666666666667 60.98415549143702 -1 -0.15217391304348 -0.5 -0.5 850 1
i 5 70.18339446482162 2 7 79.63697945792667 -1 -0.15217391304348 -0.5 -0.5 850 1
i 2 70.26342114038013 2 11.08333333333333 65.82281588620485 -1 -0.15217391304348 -0.5 -0.5 850 1
i 6 70.34344781593866 2 6.08333333333333 63.29645579671086 -1 -0.10869565217391 -0.5 -0.5 850.0000000000183 1
i 6 70.42347449149717 2 9 74.2164013644182 -1 0.15217391304348 -0.5 -0.5 850.0000000006817 1
i 3 70.50350116705569 2 8 63.16456886523144 -1 -0.06521739130435 -0.5 -0.5 850.0000000102884 1
i 5 70.58352784261422 2 7.5 76.27664703733699 -1 -0.10869565217391 -0.5 -0.5 850.00000009042 1
i 3 70.66355451817273 2 11.08333333333333 68.02581550651439 -1 0.06521739130435 -0.5 -0.5 850.0000005536776 1
i 6 70.74358119373126 2 6.66666666666667 61.13724664436558 -1 -0.28260869565217 -0.5 -0.5 850.000002617585 1
i 6 70.82360786928977 2 9.08333333333333 77.68776849561637 -1 -0.19565217391304 -0.5 -0.5 850.0000101879396 1
i 2 70.90363454484829 2 10.08333333333333 64.27612917492577 -1 -0.10869565217391 -0.5 -0.5 850.0000340746651 1
i 5 70.98366122040682 2 6.66666666666667 70.72449415273564 -1 -0.02173913043478 -0.5 -0.5 850.0001009218665 1
i 4 71.06368789596533 2 10 70.62552970343545 -1 -0.15217391304348 -0.5 -0.5 850.0002705503373 1
i 5 71.14371457152384 2 7.33333333333333 60.29375684937999 -1 -0.28260869565217 -0.5 -0.5 850.0006673485198 1
i 5 71.22374124708237 2 8.08333333333333 79.99857046526041 -1 -0.10869565217391 -0.5 -0.5 850.0015338776882 1
i 2 71.30376792264089 2 10 65.3639151296102 -1 -0.06521739130435 -0.5 -0.5 850.0033180307618 1
i 6 71.3837945981994 2 6.08333333333333 64.32202821161299 -1 0.10869565217391 -0.5 -0.5 850.0068089282103 1
i 6 71.46382127375793 2 10.33333333333333 73.31262023883224 -1 0.02173913043478 -0.5 -0.5 850.0133412446103 1
i 4 71.54384794931644 2 8.5 62.70734074851487 -1 -0.10869565217391 -0.5 -0.5 850.0250927955001 1
i 5 71.62387462487497 2 7.66666666666667 77.42486401326957 -1 -0.15217391304348 -0.5 -0.5 850.0455058968795 1
i 3 71.70390130043349 2 10 67.27128047005439 -1 -0.10869565217391 -0.5 -0.5 850.0798691179853 1
i 6 71.783927975992 2 6.5 61.95603368320808 -1 0.23913043478261 -0.5 -0.5 850.1361024184066 1
i 6 71.86395465155053 2 9.33333333333333 76.51648123873488 -1 -0.19565217391304 -0.5 -0.5 850.2257950881294 1
i 3 71.94398132710904 2 9.66666666666667 63.86608432262163 -1 0.06521739130435 -0.5 -0.5 850.3655521496559 1
i 5 72.02400800266757 2 6 72.98791307285043 -1 -0.23913043478261 -0.5 -0.5 850.5787106560902 1
i 4 72.10403467822609 2 10 69.6951706703792 -1 -0.02173913043478 -0.5 -0.5 850.8974923204905 1
i 5 72.1840613537846 2 6 60.00038391375178 -1 -0.02173913043478 -0.5 -0.5 851.3656628111513 1
i 6 72.26408802934313 2 8.33333333333333 79.71857415666013 -1 0.28260869565217 -0.5 -0.5 852.0417705041069 1
i 2 72.34411470490164 2 10.66666666666667 65.00285115427882 -1 -0.15217391304348 -0.5 -0.5 853.0030381556561 1
i 6 72.42414138046016 2 6.08333333333333 65.94947931453622 -1 -0.15217391304348 -0.5 -0.5 854.349979511342 1
i 5 72.50416805601868 2 10.5 72.4724335468663 -1 -0.45652173913043 -0.5 -0.5 856.2118089926505 1
i 4 72.5841947315772 2 8.08333333333333 61.9679312926307 -1 -0.02173913043478 -0.5 -0.5 858.7527060218986 1
i 5 72.66422140713571 2 7 78.59106668945988 -1 0.02173913043478 -0.5 -0.5 862.1789860292452 1
i 2 72.74424808269424 2 11 66.51907618677119 -1 -0.23913043478261 -0.5 -0.5 866.7472175620586 1
i 6 72.82427475825276 2 6.25 62.6012971970861 -1 -0.06521739130435 -0.5 -0.5 872.773309084637 1
i 6 72.90430143381128 2 9.66666666666667 75.36891665366613 -1 -0.10869565217391 -0.5 -0.5 880.6425699943893 1
i 3 72.9843281093698 2 9.25 63.5016048907878 -1 -0.23913043478261 -0.5 -0.5 890.8207281566199 1
i 5 73.06435478492831 2 7.25 74.81880497276333 -1 -0.19565217391304 -0.5 -0.5 903.8658610374541 1
i 3 73.14438146048684 2 11 68.85324915202767 -1 -0.28260869565217 -0.5 -0.5 920.4411695563842 1
i 5 73.22440813604535 2 6.66666666666667 60.2828023523731 -1 -0.15217391304348 -0.5 -0.5 941.3284934522396 1
i 6 73.30443481160388 2 8.66666666666667 78.90710105506633 -1 -0.06521739130435 -0.5 -0.5 967.4424347262751 1
i 2 73.3844614871624 2 10.41666666666667 64.68200920462019 -1 0.02173913043478 -0.5 -0.5 999.8449221588767 1
i 6 73.46448816272091 2 6.33333333333333 68.07678743393583 -1 -0.23913043478261 -0.5 -0.5 1039.7600156498859 1
i 5 73.54451483827944 2 10.83333333333333 71.63877720366594 -1 -0.19565217391304 -0.5 -0.5 1088.5887149461814 1
i 4 73.62454151383795 2 7.83333333333333 61.09393539137282 -1 -0.06521739130435 -0.5 -0.5 1147.9235040053147 1
i 5 73.70456818939647 2 7 79.54465428157599 -1 -0.02173913043478 -0.5 -0.5 1219.5623306665154 1
i 2 73.784594864955 2 11.08333333333333 65.89337362617829 -1 -0.41304347826087 -0.5 -0.5 1305.5216923658384 1
i 6 73.86462154051351 2 6 63.19890366439678 -1 -0.02173913043478 -0.5 -0.5 1408.0484732651016 1
i 6 73.94464821607203 2 9 74.34260227078698 -1 0.06521739130435 -0.5 -0.5 1529.630157287375 1
i 3 74.02467489163055 2 8.83333333333333 63.207852176974 -1 -0.10869565217391 -0.5 -0.5 1673.0030260632445 1
i 5 74.10470156718907 2 7.41666666666667 76.12436975461911 -1 -0.28260869565217 -0.5 -0.5 1841.1579415440365 1
i 3 74.1847282427476 2 11 68.12155931150164 -1 -0.23913043478261 -0.5 -0.5 2037.3433108104837 1
i 6 74.26475491830611 2 6.58333333333333 61.02498186024026 -1 -0.19565217391304 -0.5 -0.5 2265.064836083027 1
i 6 74.34478159386462 2 9 77.83810644551879 -1 0.10869565217391 -0.5 -0.5 2528.081666695679 1
i 2 74.42480826942315 2 10.08333333333333 64.32765087100104 -1 0.02173913043478 -0.5 -0.5 2830.3985922565053 1
i 5 74.50483494498167 2 6.83333333333333 70.41330806724477 -1 0.23913043478261 -0.5 -0.5 3176.2539476657294 1
i 4 74.5848616205402 2 10.83333333333333 70.7479484588996 -1 -0.10869565217391 -0.5 -0.5 3570.1029411947675 1
i 5 74.66488829609871 2 7.33333333333333 60.36690644281192 -1 -0.19565217391304 -0.5 -0.5 4016.5961663664916 1
i 5 74.74491497165722 2 8.08333333333333 79.98706330638849 -1 0.10869565217391 -0.5 -0.5 4520.55311664116 1
i 2 74.82494164721575 2 10 65.41791903107348 -1 -0.06521739130435 -0.5 -0.5 5086.930588418605 1
i 6 74.90496832277427 2 6.08333333333333 64.15340470070304 -1 0.02173913043478 -0.5 -0.5 5720.785931939969 1
i 6 74.98499499833278 2 10.16666666666667 73.42755515436839 -1 0.15217391304348 -0.5 -0.5 6427.235190424818 1
i 4 75.06502167389131 2 8.83333333333333 62.7837623943421 -1 -0.15217391304348 -0.5 -0.5 7211.406254135636 1
i 5 75.14504834944982 2 7.58333333333333 77.27063669440892 -1 -0.06521739130435 -0.5 -0.5 8078.38724677366 1
i 3 75.22507502500834 2 10 67.37343459213666 -1 -0.15217391304348 -0.5 -0.5 9033.17045525503 1
i 6 75.30510170056687 2 6.41666666666667 61.85564396272846 -1 -0.06521739130435 -0.5 -0.5 10080.592208931837 1
i 6 75.38512837612538 2 9.25 76.67264198314662 -1 -0.15217391304348 -0.5 -0.5 11225.26920904488 1
i 3 75.46515505168391 2 9 63.9203257634785 -1 0.3695652173913 -0.5 -0.5 12471.531901842793 1
i 5 75.54518172724242 2 6.83333333333333 72.70567806245143 -1 -0.06521739130435 -0.5 -0.5 13823.355577566097 1
i 4 75.62520840280094 2 10.91666666666667 69.81580232665029 -1 0.10869565217391 -0.5 -0.5 15284.28996053441 1
i 5 75.70523507835946 2 7 60.00846545238196 -1 0.19565217391304 -0.5 -0.5 16857.388131047494 1
i 6 75.78526175391798 2 8.33333333333333 79.7911469883633 -1 -0.15217391304348 -0.5 -0.5 18545.135685961486 1
i 2 75.86528842947651 2 10.75 65.04667763783306 -1 0.15217391304348 -0.5 -0.5 20349.381099933253 1
i 6 75.94531510503502 2 6.16666666666667 65.70054564997331 -1 -0.10869565217391 -0.5 -0.5 22271.26829187343 1
i 5 76.02534178059354 2 10.41666666666667 72.5813689699088 -1 -0.23913043478261 -0.5 -0.5 24311.1724297486 1
i 4 76.10536845615206 2 8.08333333333333 62.07922597685847 -1 -0.19565217391304 -0.5 -0.5 26468.640020286777 1
i 5 76.18539513171058 2 7 78.44180054905948 -1 -0.15217391304348 -0.5 -0.5 28742.334327441866 1
i 2 76.26542180726909 2 11 66.61334635651949 -1 -0.19565217391304 -0.5 -0.5 31129.98714393943 1
i 6 76.34544848282762 2 6.41666666666667 62.52611953552086 -1 -0.06521739130435 -0.5 -0.5 33628.35790340158 1
i 6 76.42547515838613 2 9.58333333333333 75.51462912128623 -1 0.06521739130435 -0.5 -0.5 36233.20106636695 1
i 3 76.50550183394465 2 9.41666666666667 63.54363556174906 -1 -0.23913043478261 -0.5 -0.5 38939.2426421034 1
i 5 76.58552850950318 2 7.08333333333333 74.61151207999184 -1 0.10869565217391 -0.5 -0.5 41740.166619985706 1
i 3 76.66555518506169 2 11 68.95617599576076 -1 -0.28260869565217 -0.5 -0.5 44628.6119802109 1
i 5 76.74558186062022 2 6.91666666666667 60.21230303209447 -1 -0.06521739130435 -0.5 -0.5 47596.180834870094 1
i 6 76.82560853617873 2 8.58333333333333 79.03466368170764 -1 -0.15217391304348 -0.5 -0.5 50633.45811831872 1
i 2 76.90563521173725 2 10.41666666666667 64.72489416565733 -1 -0.23913043478261 -0.5 -0.5 53730.04310216 1
i 6 76.98566188729578 2 6.25 67.77759620783048 -1 -0.23913043478261 -0.5 -0.5 56874.59285689042 1
i 5 77.06568856285429 2 10.58333333333333 71.75130935855593 -1 0.19565217391304 -0.5 -0.5 60054.87762164266 1
i 4 77.14571523841282 2 7.75 61.20648643100888 -1 -0.10869565217391 -0.5 -0.5 63257.847877871834 1
i 5 77.22574191397133 2 7 79.44307655650033 -1 -0.06521739130435 -0.5 -0.5 66469.71275481003 1
i 2 77.30576858952985 2 11 65.96664635370388 -1 -0.06521739130435 -0.5 -0.5 69676.02922682647 1
i 6 77.38579526508838 2 6.08333333333333 63.10798689004723 -1 -0.10869565217391 -0.5 -0.5 72861.80139810764 1
i 6 77.46582194064689 2 9.91666666666667 74.47075817056475 -1 -0.28260869565217 -0.5 -0.5 76011.58901116824 1
i 3 77.5458486162054 2 8 63.24871419981216 -1 0.19565217391304 -0.5 -0.5 79109.62416529565 1
i 5 77.62587529176393 2 7.33333333333333 75.96979930388366 -1 0.02173913043478 -0.5 -0.5 82139.93509175467 1
i 3 77.70590196732245 2 11.08333333333333 68.21671347603237 -1 -0.02173913043478 -0.5 -0.5 85086.47570697425 1
i 5 77.78592864288096 2 6.58333333333333 60.91397376939446 -1 0.02173913043478 -0.5 -0.5 87933.25955529515 1
i 6 77.86595531843949 2 8 77.98681625343315 -1 -0.28260869565217 -0.5 -0.5 90664.49666125637 1
i 2 77.945981993998 2 10.08333333333333 64.37807268860166 -1 -0.15217391304348 -0.5 -0.5 93264.73173970728 1
i 5 78.02600866955653 2 6.5 70.1016178098454 -1 -0.23913043478261 -0.5 -0.5 95718.98216171478 1
i 4 78.10603534511505 2 10.75 70.86946586779507 -1 0.06521739130435 -0.5 -0.5 98012.87404646196 1
i 5 78.18606202067356 2 7.33333333333333 60.44641033131386 -1 0.02173913043478 -0.5 -0.5 100132.77484496756 1
i 5 78.26608869623209 2 8.08333333333333 79.96417798668968 -1 -0.02173913043478 -0.5 -0.5 102065.92080082285 1
i 2 78.3461153717906 2 10 65.47372694224131 -1 0.02173913043478 -0.5 -0.5 103800.53771634477 1
i 6 78.42614204734913 2 6 63.99552497061607 -1 0.19565217391304 -0.5 -0.5 105325.95351915495 1
i 6 78.50616872290765 2 10.08333333333333 73.54369530229738 -1 -0.10869565217391 -0.5 -0.5 106632.70121342994 1
i 4 78.58619539846616 2 8.5 62.85488039726826 -1 -0.19565217391304 -0.5 -0.5 107712.61091078904 1
i 5 78.66622207402469 2 7.91666666666667 77.11743508678663 -1 -0.23913043478261 -0.5 -0.5 108558.88976640289 1
i 3 78.7462487495832 2 10.91666666666667 67.47516409267706 -1 -0.15217391304348 -0.5 -0.5 109166.18879456357 1
i 6 78.82627542514172 2 6.41666666666667 61.75204967635469 -1 -0.19565217391304 -0.5 -0.5 109530.65570243612 1
i 6 78.90630210070024 2 9.25 76.82886615903558 -1 -0.10869565217391 -0.5 -0.5 109649.97305849842 1
i 3 78.98632877625876 2 9.66666666666667 63.97508347191366 -1 -0.02173913043478 -0.5 -0.5 109523.38130061439 1
i 5 79.06635545181727 2 6.75 72.41653002396424 -1 0.10869565217391 -0.5 -0.5 109151.68628479372 1
i 4 79.1463821273758 2 10.91666666666667 69.93777430217999 -1 -0.15217391304348 -0.5 -0.5 108537.25127647074 1
i 5 79.22640880293432 2 7.08333333333333 60.0267642366384 -1 -0.10869565217391 -0.5 -0.5 107683.97348845194 1
i 5 79.30643547849284 2 8.33333333333333 79.85352937467358 -1 -0.15217391304348 -0.5 -0.5 106597.24547035768 1
i 2 79.38646215405136 2 10.75 65.09142919827497 -1 0.02173913043478 -0.5 -0.5 105283.90185033015 1
i 6 79.46648882960987 2 6 65.46127976927761 -1 -0.15217391304348 -0.5 -0.5 103752.15211791263 1
i 5 79.5465155051684 2 10.33333333333333 72.69064861766944 -1 -0.06521739130435 -0.5 -0.5 102011.50031446344 1
i 4 79.62654218072691 2 8.66666666666667 62.18726991211494 -1 -0.06521739130435 -0.5 -0.5 100072.65266150101 1
i 5 79.70656885628544 2 7.75 78.28976759810256 -1 -0.10869565217391 -0.5 -0.5 97947.41430552534 1
i 2 79.78659553184396 2 11 66.70978818743278 -1 0.02173913043478 -0.5 -0.5 95648.57648793311 1
i 6 79.86662220740247 2 6.25 62.44871652888348 -1 0.06521739130435 -0.5 -0.5 93189.79555871995 1
i 6 79.946648882961 2 9.58333333333333 75.6625612015107 -1 -0.10869565217391 -0.5 -0.5 90585.46534128046 1
i 3 80.02667555851951 2 9.5 63.58759961633092 -1 0.02173913043478 -0.5 -0.5 87850.58442151433 1
i 5 80.10670223407803 2 7.16666666666667 74.39357520306794 -1 -0.32608695652174 -0.5 -0.5 85000.61997695302 1
i 3 80.18672890963656 2 11 69.06159870157668 -1 -0.10869565217391 -0.5 -0.5 82051.36978030525 1
i 5 80.26675558519507 2 6.83333333333333 60.15107054111665 -1 -0.15217391304348 -0.5 -0.5 79018.82400672011 1
i 6 80.34678226075359 2 8.58333333333333 79.15740504660073 -1 -0.02173913043478 -0.5 -0.5 75919.02844563099 1
i 2 80.42680893631211 2 10.5 64.76727168102522 -1 -0.19565217391304 -0.5 -0.5 72767.95066708211 1
i 6 80.50683561187063 2 6.25 67.48250198165452 -1 -0.23913043478261 -0.5 -0.5 69581.35062011344 1
i 5 80.58686228742916 2 10.66666666666667 71.86281821565146 -1 -0.15217391304348 -0.5 -0.5 66374.65704863374 1
i 4 80.66688896298767 2 7.75 61.32121351877041 -1 -0.23913043478261 -0.5 -0.5 63162.85100006887 1
i 5 80.74691563854618 2 7.91666666666667 79.33278142471138 -1 -0.02173913043478 -0.5 -0.5 59960.35757600185 1
i 2 80.82694231410471 2 11.08333333333333 66.04273155577371 -1 -0.10869565217391 -0.5 -0.5 56780.94693442013 1
i 6 80.90696898966323 2 6.08333333333333 63.02274974885721 -1 -0.23913043478261 -0.5 -0.5 53637.645402450755 1
i 6 80.98699566522176 2 9.83333333333333 74.6009938641124 -1 -0.19565217391304 -0.5 -0.5 50542.65739935975 1
i 3 81.06702234078027 2 8.91666666666667 63.28778418509533 -1 0.02173913043478 -0.5 -0.5 47507.29870476431 1
i 5 81.14704901633878 2 7.75 75.81190553807652 -1 0.06521739130435 -0.5 -0.5 44541.94143922642 1
i 3 81.22707569189731 2 11.08333333333333 68.31158243204843 -1 0.19565217391304 -0.5 -0.5 41655.97095644928 1
i 5 81.30710236745583 2 6.58333333333333 60.805099678169 -1 -0.15217391304348 -0.5 -0.5 38857.75468080361 1
i 6 81.38712904301434 2 8.91666666666667 78.1337170169448 -1 -0.06521739130435 -0.5 -0.5 36154.622763467814 1
i 2 81.46715571857287 2 10.25 64.4273472475503 -1 -0.02173913043478 -0.5 -0.5 33552.86027748716 1
i 5 81.54718239413138 2 6.5 69.78996644472538 -1 0.02173913043478 -0.5 -0.5 31057.7105287107 1
i 4 81.6272090696899 2 10 70.98993473351118 -1 -0.23913043478261 -0.5 -0.5 28673.38892787389 1
i 5 81.70723574524843 2 7.41666666666667 60.53178665785653 -1 -0.02173913043478 -0.5 -0.5 26403.106750772986 1
i 5 81.78726242080694 2 8.08333333333333 79.9300543757571 -1 -0.02173913043478 -0.5 -0.5 24249.104009899725 1
i 2 81.86728909636547 2 10 65.5314431331929 -1 0.02173913043478 -0.5 -0.5 22212.69057328698 1
i 6 81.94731577192398 2 6.08333333333333 63.84813272054511 -1 0.10869565217391 -0.5 -0.5 20294.29459540777 1
i 6 82.0273424474825 2 10.08333333333333 73.66111205866588 -1 -0.02173913043478 -0.5 -0.5 18493.517271272158 1
i 4 82.10736912304102 2 8.58333333333333 62.920833373221 -1 -0.19565217391304 -0.5 -0.5 16809.192888588357 1
i 5 82.18739579859954 2 7.58333333333333 76.96528227980605 -1 0.02173913043478 -0.5 -0.5 15239.453133810552 1
i 3 82.26742247415807 2 10 67.57621671702012 -1 -0.32608695652174 -0.5 -0.5 13781.794605682206 1
i 6 82.34744914971658 2 6.58333333333333 61.64562985809206 -1 -0.19565217391304 -0.5 -0.5 12433.148503781618 1
i 6 82.4274758252751 2 9.25 76.98485306455451 -1 -0.10869565217391 -0.5 -0.5 11189.951488577955 1
i 3 82.50750250083362 2 9.75 64.0300346204978 -1 -0.02173913043478 -0.5 -0.5 10048.216752477043 1
i 5 82.58752917639214 2 6.75 72.12148351079483 -1 -0.19565217391304 -0.5 -0.5 9003.604396799325 1
i 4 82.66755585195065 2 10.91666666666667 70.06072278736909 -1 -0.19565217391304 -0.5 -0.5 8051.490276080402 1
i 5 82.74758252750918 2 7.16666666666667 60.05486081941071 -1 -0.15217391304348 -0.5 -0.5 7187.032546825985 1
i 5 82.8276092030677 2 8.66666666666667 79.90526042194445 -1 0.28260869565217 -0.5 -0.5 6405.235241068351 1
i 2 82.90763587862621 2 10.75 65.13725754977082 -1 -0.10869565217391 -0.5 -0.5 5701.008273986346 1
i 6 82.98766255418474 2 6.08333333333333 65.23216478227341 -1 -0.06521739130435 -0.5 -0.5 5069.223387588149 1
i 6 83.06768922974325 2 10.33333333333333 72.80044512949674 -1 -0.32608695652174 -0.5 -0.5 4504.765627205259 1
i 4 83.14771590530178 2 8.41666666666667 62.29147289445879 -1 0.06521739130435 -0.5 -0.5 4002.5800425485245 1
i 5 83.2277425808603 2 7.83333333333333 78.1357617566191 -1 -0.02173913043478 -0.5 -0.5 3557.7133986596054 1
i 2 83.30776925641881 2 10.91666666666667 66.80809676777453 -1 0.15217391304348 -0.5 -0.5 3165.3507726856737 1
i 6 83.38779593197734 2 6.66666666666667 62.36844473251914 -1 -0.02173913043478 -0.5 -0.5 2820.8469986225805 1
i 6 83.46782260753585 2 9.5 75.81252838490295 -1 -0.06521739130435 -0.5 -0.5 2519.753002734792 1
i 3 83.54784928309438 2 9.33333333333333 63.63357478126777 -1 0.02173913043478 -0.5 -0.5 2257.837146220148 1
i 5 83.6278759586529 2 7 74.16477584372129 -1 0.15217391304348 -0.5 -0.5 2031.1017579648412 1
i 3 83.70790263421141 2 11.16666666666667 69.16964085077443 -1 -0.19565217391304 -0.5 -0.5 1835.7950982377984 1
i 5 83.78792930976994 2 6.75 60.09973549519229 -1 -0.02173913043478 -0.5 -0.5 1668.4190434535403 1
i 6 83.86795598532845 2 8.5 79.27461433390967 -1 0.06521739130435 -0.5 -0.5 1525.7328223927595 1
i 2 83.94798266088696 2 10.5 64.80932260946274 -1 0.06521739130435 -0.5 -0.5 1404.7531654498405 1
i 6 84.02800933644549 2 6.16666666666667 67.19225420498182 -1 0.02173913043478 -0.5 -0.5 1302.7512506772662 1
i 5 84.108036012004 2 10.58333333333333 71.97343310248787 -1 -0.19565217391304 -0.5 -0.5 1217.2468438979759 1
i 4 84.18806268756252 2 7.83333333333333 61.43746558055007 -1 -0.06521739130435 -0.5 -0.5 1146.0000353990279 1
i 5 84.26808936312105 2 7 79.21438634899266 -1 -0.06521739130435 -0.5 -0.5 1087.000973274414 1
i 2 84.34811603867956 2 11.08333333333333 66.12169877457926 -1 -0.23913043478261 -0.5 -0.5 1038.4579840394274 1
i 6 84.42814271423809 2 6.08333333333333 62.94214713644139 -1 -0.15217391304348 -0.5 -0.5 998.7844554788966 1
i 6 84.5081693897966 2 9 74.73342712544996 -1 0.15217391304348 -0.5 -0.5 966.5848356693448 1
i 3 84.58819606535512 2 9 63.3257124974287 -1 -0.19565217391304 -0.5 -0.5 940.6400766279636 1
i 5 84.66822274091365 2 7.25 75.6495652397931 -1 -0.23913043478261 -0.5 -0.5 919.8928220163288 1
i 3 84.74824941647216 2 11 68.40653209250226 -1 -0.02173913043478 -0.5 -0.5 903.4326066844102 1
i 5 84.82827609203069 2 6.66666666666667 60.69930049348072 -1 -0.15217391304348 -0.5 -0.5 890.4813024877659 1
i 6 84.9083027675892 2 8 78.27860542122947 -1 0.10869565217391 -0.5 -0.5 880.3790106114807 1
i 2 84.98832944314772 2 10.25 64.47546322271072 -1 -0.02173913043478 -0.5 -0.5 872.5705663974633 1
i 5 85.06835611870625 2 6.41666666666667 69.47884829355358 -1 -0.23913043478261 -0.5 -0.5 866.5927891354146 1
i 4 85.14838279426476 2 10.75 71.10924733796685 -1 0.10869565217391 -0.5 -0.5 862.0625770961035 1
i 5 85.22840946982328 2 7.5 60.62257486998561 -1 -0.15217391304348 -0.5 -0.5 858.6659178219004 1
i 5 85.3084361453818 2 8 79.88487237636058 -1 0.10869565217391 -0.5 -0.5 856.147855807719 1
i 2 85.38846282094032 2 10 65.59117868537568 -1 -0.02173913043478 -0.5 -0.5 854.3034345683146 1
i 6 85.46848949649883 2 6 63.71089054555733 -1 0.02173913043478 -0.5 -0.5 852.9696079556885 1
i 6 85.54851617205736 2 10.16666666666667 73.77988161056916 -1 0.19565217391304 -0.5 -0.5 852.018096623532 1
i 4 85.62854284761588 2 8.66666666666667 62.98184232014324 -1 -0.10869565217391 -0.5 -0.5 851.3491497990784 1
i 5 85.7085695231744 2 7.5 76.81406925466628 -1 -0.10869565217391 -0.5 -0.5 850.8861599928287 1
i 3 85.78859619873292 2 10 67.67639848629942 -1 -0.45652173913043 -0.5 -0.5 850.5710688497575 1
i 6 85.86862287429143 2 6.5 61.53683232562977 -1 0.02173913043478 -0.5 -0.5 850.3604958484419 1
i 6 85.94864954984996 2 9.33333333333333 77.14032638894041 -1 -0.15217391304348 -0.5 -0.5 850.2225177554561 1
i 3 86.02867622540847 2 9 64.08487851208872 -1 0.02173913043478 -0.5 -0.5 850.1340253632934 1
i 5 86.108702900967 2 6.66666666666667 71.82154227575604 -1 -0.06521739130435 -0.5 -0.5 850.078584769272 1
i 4 86.18872957652552 2 10 70.18428602262097 -1 -0.10869565217391 -0.5 -0.5 850.0447329571463 1
i 5 86.26875625208403 2 7.08333333333333 60.09227146870028 -1 -0.02173913043478 -0.5 -0.5 850.024641379989 1
i 5 86.34878292764256 2 8.33333333333333 79.94598212934585 -1 -0.15217391304348 -0.5 -0.5 850.0130862718355 1
i 2 86.42880960320107 2 10 65.18429873798968 -1 -0.15217391304348 -0.5 -0.5 850.0066702084121 1
i 6 86.50883627875959 2 6.08333333333333 65.01357794211104 -1 -0.28260869565217 -0.5 -0.5 850.0032456872016 1
i 6 86.58886295431812 2 10.33333333333333 72.91091097475356 -1 -0.15217391304348 -0.5 -0.5 850.0014979262655 1
i 4 86.66888962987663 2 8.33333333333333 62.39133292864562 -1 -0.02173913043478 -0.5 -0.5 850.0006504466428 1
i 5 86.74891630543515 2 7.75 77.98051176357222 -1 -0.45652173913043 -0.5 -0.5 850.0002631009953 1
i 2 86.82894298099367 2 10 66.90793114977086 -1 0.06521739130435 -0.5 -0.5 850.0000978791975 1
i 6 86.90896965655219 2 6.33333333333333 62.28483341773519 -1 -0.02173913043478 -0.5 -0.5 850.0000329400843 1
i 6 86.98899633211072 2 9.5 75.96429644865812 -1 -0.23913043478261 -0.5 -0.5 850.0000098093357 1
i 3 87.06902300766923 2 9.5 63.68152502504191 -1 -0.02173913043478 -0.5 -0.5 850.0000025075874 1
i 5 87.14904968322774 2 7.08333333333333 73.92516083635397 -1 -0.06521739130435 -0.5 -0.5 850.0000005269222 1
i 3 87.22907635878627 2 11.08333333333333 69.28032537987755 -1 -0.10869565217391 -0.5 -0.5 850.0000000852824 1
i 5 87.30910303434479 2 6 60.05877538650994 -1 -0.28260869565217 -0.5 -0.5 850.0000000095796 1
i 6 87.38912970990332 2 8.5 79.38553363971265 -1 -0.10869565217391 -0.5 -0.5 850.0000000006221 1
i 2 87.46915638546183 2 10.66666666666667 64.85123982006344 -1 -0.10869565217391 -0.5 -0.5 850.0000000000163 1
i 6 87.54918306102034 2 6.33333333333333 66.90764370436935 -1 0.15217391304348 -0.5 -0.5 850 1
i 5 87.62920973657887 2 10.5 72.08330892595272 -1 -0.10869565217391 -0.5 -0.5 850 1
i 4 87.70923641213739 2 7 61.55454090193936 -1 -0.32608695652174 -0.5 -0.5 850 1
i 5 87.7892630876959 2 7 79.08858803954867 -1 -0.23913043478261 -0.5 -0.5 850 1
i 2 87.86928976325443 2 11.08333333333333 66.20358122635862 -1 0.10869565217391 -0.5 -0.5 849.9999999999886 1
i 6 87.94931643881294 2 6.33333333333333 62.86506580153588 -1 -0.28260869565217 -0.5 -0.5 849.9999999995134 1
i 6 88.02934311437146 2 9.75 74.86816154424656 -1 -0.02173913043478 -0.5 -0.5 849.9999999920857 1
i 3 88.10936978992999 2 9.08333333333333 63.36314814474966 -1 0.45652173913043 -0.5 -0.5 849.9999999270451 1
i 5 88.1893964654885 2 7.33333333333333 75.48160160262456 -1 -0.19565217391304 -0.5 -0.5 849.9999995382361 1
i 3 88.26942314104703 2 11.08333333333333 68.50197334652793 -1 -0.10869565217391 -0.5 -0.5 849.9999977632309 1
i 5 88.34944981660554 2 6.66666666666667 60.59756606005662 -1 -0.19565217391304 -0.5 -0.5 849.9999911306369 1
i 6 88.42947649216406 2 8 78.42124183102847 -1 -0.15217391304348 -0.5 -0.5 849.9999698955149 1
i 2 88.50950316772258 2 10.33333333333333 64.52244305493159 -1 0.19565217391304 -0.5 -0.5 849.9999097662441 1
i 5 88.5895298432811 2 6.5 69.16872899525093 -1 -0.06521739130435 -0.5 -0.5 849.9997557009782 1
i 5 88.66955651883963 2 10.75 71.22733395240661 -1 -0.02173913043478 -0.5 -0.5 849.99939237399 1
i 5 88.74958319439814 2 7.5 60.71832920335584 -1 -0.15217391304348 -0.5 -0.5 849.9985934491319 1
i 5 88.82960986995666 2 8.08333333333333 79.82884879534372 -1 0.02173913043478 -0.5 -0.5 849.996938695215 1
i 2 88.90963654551518 2 10 65.65305256410322 -1 -0.19565217391304 -0.5 -0.5 849.9936842067157 1
i 6 88.9896632210737 2 6.08333333333333 63.58337853758607 -1 0.19565217391304 -0.5 -0.5 849.9875665536824 1
i 6 89.06968989663221 2 10.08333333333333 73.90008895119794 -1 -0.19565217391304 -0.5 -0.5 849.976516613026 1
i 4 89.14971657219074 2 8.66666666666667 63.03820599329175 -1 -0.10869565217391 -0.5 -0.5 849.957253204546 1
i 5 89.22974324774925 2 7.5 76.66354858091225 -1 -0.02173913043478 -0.5 -0.5 849.924720585539 1
i 3 89.30976992330777 2 11.08333333333333 67.77558242827631 -1 -0.10869565217391 -0.5 -0.5 849.871327506531 1
i 6 89.3897965988663 2 6.5 61.42616615639631 -1 0.32608695652174 -0.5 -0.5 849.7859390982265 1
i 6 89.46982327442481 2 9.08333333333333 77.29503763134333 -1 0.02173913043478 -0.5 -0.5 849.652566586217 1
i 3 89.54984994998334 2 9 64.13934602927246 -1 0.15217391304348 -0.5 -0.5 849.4486939906734 1
i 5 89.62987662554185 2 6.66666666666667 71.51766716239436 -1 -0.06521739130435 -0.5 -0.5 849.1431758679605 1
i 4 89.70990330110037 2 10 70.3081177456757 -1 -0.23913043478261 -0.5 -0.5 848.693636116655 1
i 5 89.7899299766589 2 7.33333333333333 60.13847129928574 -1 -0.28260869565217 -0.5 -0.5 848.0432952417343 1
i 5 89.86995665221741 2 8.16666666666667 79.97543846548155 -1 0.06521739130435 -0.5 -0.5 847.1171525904538 1
i 2 89.94998332777594 2 10 65.23267487418066 -1 -0.19565217391304 -0.5 -0.5 845.8174512759726 1
i 6 90.03001000333445 2 6.16666666666667 64.80578755801379 -1 -0.19565217391304 -0.5 -0.5 844.0183571040798 1
i 6 90.11003667889297 2 10.25 73.02217778583108 -1 -0.23913043478261 -0.5 -0.5 841.5597890954101 1
i 4 90.1900633544515 2 8.5 62.48644606712591 -1 -0.15217391304348 -0.5 -0.5 838.2403483861751 1
i 5 90.27009003001001 2 7.66666666666667 77.82466445694655 -1 -0.19565217391304 -0.5 -0.5 833.809304572892 1
i 2 90.35011670556852 2 10 67.0089269261295 -1 -0.02173913043478 -0.5 -0.5 827.957614050337 1
i 6 90.43014338112705 2 6.33333333333333 62.19758358360164 -1 0.19565217391304 -0.5 -0.5 820.3079636072775 1
i 6 90.51017005668557 2 9.41666666666667 76.11759041658759 -1 -0.06521739130435 -0.5 -0.5 810.4038544335933 1
i 3 90.59019673224408 2 9.66666666666667 63.7313148870707 -1 -0.15217391304348 -0.5 -0.5 797.6977666026197 1
i 5 90.67022340780261 2 6 73.67502871979244 -1 0.10869565217391 -0.5 -0.5 781.5384717713644 1
i 3 90.75025008336112 2 11 69.39357827358532 -1 0.15217391304348 -0.5 -0.5 761.1575919341648 1
i 5 90.83027675891965 2 6 60.02850500136955 -1 0.02173913043478 -0.5 -0.5 735.6555341157865 1
i 6 90.91030343447817 2 8.5 79.48938298758026 -1 -0.23913043478261 -0.5 -0.5 703.9869643430854 1
i 2 90.99033011003668 2 10.58333333333333 64.8932233408713 -1 -0.06521739130435 -0.5 -0.5 664.9460184418341 1
i 6 91.07035678559521 2 6.25 66.62947851839964 -1 -0.10869565217391 -0.5 -0.5 617.1514814359052 1
i 5 91.15038346115372 2 10.75 72.19262297152942 -1 -0.06521739130435 -0.5 -0.5 559.0322007759471 1
i 4 91.23041013671225 2 7 61.6716991567879 -1 -0.06521739130435 -0.5 -0.5 488.81303043179724 1
i 5 91.31043681227077 2 7 78.9561525833976 -1 -0.06521739130435 -0.5 -0.5 404.5016321479275 1
i 2 91.39046348782928 2 11 66.28836815698035 -1 -0.19565217391304 -0.5 -0.5 303.87648595593595 1
i 6 91.47049016338781 2 6.25 62.79035565211441 -1 -0.06521739130435 -0.5 -0.5 184.47648344465748 1
i 6 91.55051683894632 2 9 75.00527815368525 -1 0.10869565217391 -0.5 -0.5 43.5924933986925 1
i 3 91.63054351450484 2 9.08333333333333 63.40071271906109 -1 -0.06521739130435 -0.5 -0.5 -121.73870062334127 1
i 5 91.71057019006336 2 7.25 75.30683436277971 -1 -0.23913043478261 -0.5 -0.5 -314.7376881799751 1
i 3 91.79059686562188 2 11 68.59834044428092 -1 -0.10869565217391 -0.5 -0.5 -538.8825473341384 1
i 5 91.8706235411804 2 6.66666666666667 60.50091368163412 -1 0.06521739130435 -0.5 -0.5 -797.9054024029974 1
i 6 91.95065021673892 2 8.83333333333333 78.56133574635066 -1 -0.19565217391304 -0.5 -0.5 -1095.785060442768 1
i 2 92.03067689229744 2 10.33333333333333 64.5683405476893 -1 0.02173913043478 -0.5 -0.5 -1436.7353933116551 1
i 5 92.11070356785596 2 6.41666666666667 68.8600688637805 -1 -0.06521739130435 -0.5 -0.5 -1825.1891717088556 1
i 5 92.19073024341448 2 10.91666666666667 71.34416065267945 -1 -0.19565217391304 -0.5 -0.5 -2265.7771061607627 1
i 4 92.27075691897299 2 7.5 60.81860829615638 -1 -0.23913043478261 -0.5 -0.5 -2763.3019072720804 1
i 5 92.35078359453152 2 8 79.7622384530394 -1 0.10869565217391 -0.5 -0.5 -3322.707243201019 1
i 2 92.43081027009003 2 11 65.71719099178665 -1 0.28260869565217 -0.5 -0.5 -3949.041545619051 1
i 6 92.51083694564856 2 6 63.46509071395293 -1 0.06521739130435 -0.5 -0.5 -4647.416695493147 1
i 6 92.59086362120708 2 10 74.02183022286181 -1 -0.19565217391304 -0.5 -0.5 -5422.961705837219 1
i 3 92.67089029676559 2 8.91666666666667 63.09029662472435 -1 0.10869565217391 -0.5 -0.5 -6280.7716088900725 1
i 5 92.75091697232412 2 7.83333333333333 76.51332877479456 -1 -0.15217391304348 -0.5 -0.5 -7225.851848575477 1
i 3 92.83094364788263 2 11 67.87371547523885 -1 0.06521739130435 -0.5 -0.5 -8263.05857404732 1
i 6 92.91097032344115 2 6.58333333333333 61.31419930058107 -1 0.02173913043478 -0.5 -0.5 -9397.035324965762 1
i 6 92.99099699899968 2 9.08333333333333 77.44876603983104 -1 -0.15217391304348 -0.5 -0.5 -10632.14669209727 1
i 3 93.07102367455819 2 9.91666666666667 64.19320570994232 -1 -0.10869565217391 -0.5 -0.5 -11972.409626110979 1
i 5 93.1510503501167 2 6.83333333333333 71.21075295052134 -1 0.15217391304348 -0.5 -0.5 -13421.423151192552 1
i 4 93.23107702567523 2 10.91666666666667 70.43189760184518 -1 -0.10869565217391 -0.5 -0.5 -14982.297316459064 1
i 5 93.31110370123375 2 7.16666666666667 60.19291517705364 -1 -0.06521739130435 -0.5 -0.5 -16657.58228541009 1
i 5 93.39113037679228 2 8.16666666666667 79.99346919037339 -1 -0.15217391304348 -0.5 -0.5 -18449.19852003844 1
i 2 93.47115705235079 2 10.83333333333333 65.28249691922095 -1 -0.02173913043478 -0.5 -0.5 -20358.36906020366 1
i 6 93.5511837279093 2 6 64.608954561096 -1 -0.19565217391304 -0.5 -0.5 -22385.55492903684 1
i 6 93.63121040346783 2 10.33333333333333 73.13435765907539 -1 -0.10869565217391 -0.5 -0.5 -24530.394710240755 1
i 4 93.71123707902635 2 8.41666666666667 62.57651127229252 -1 0.02173913043478 -0.5 -0.5 -26791.649342235298 1
i 5 93.79126375458488 2 7.66666666666667 77.66877167474095 -1 -0.10869565217391 -0.5 -0.5 -29167.153156401273 1
i 2 93.87129043014339 2 10.91666666666667 67.11070992711997 -1 -0.10869565217391 -0.5 -0.5 -31653.772151723617 1
i 6 93.9513171057019 2 6.5 62.10655818409282 -1 -0.28260869565217 -0.5 -0.5 -34247.37044583626 1
i 6 94.03134378126043 2 9.5 76.27210555874662 -1 0.15217391304348 -0.5 -0.5 -36942.785772870484 1
i 3 94.11137045681895 2 9.66666666666667 63.78272844999672 -1 -0.10869565217391 -0.5 -0.5 -39733.81481216251 1
i 5 94.19139713237746 2 6 73.41490208650774 -1 -0.23913043478261 -0.5 -0.5 -42613.20902955585 1
i 3 94.27142380793599 2 11 69.50923797935562 -1 -0.02173913043478 -0.5 -0.5 -45572.6815957652 1
i 5 94.3514504834945 2 6.83333333333333 60.00907565908324 -1 -0.41304347826087 -0.5 -0.5 -48602.925815590366 1
i 6 94.43147715905302 2 8.41666666666667 79.58538759462836 -1 -0.19565217391304 -0.5 -0.5 -51693.64535928253 1
i 2 94.51150383461155 2 10.75 64.93547493817712 -1 -0.02173913043478 -0.5 -0.5 -54833.59643501623 1
i 6 94.59153051017006 2 6.25 66.3585575908952 -1 -0.19565217391304 -0.5 -0.5 -58010.64188152376 1
i 5 94.67155718572859 2 10.66666666666667 72.30156943769987 -1 0.06521739130435 -0.5 -0.5 -61211.81699473907 1
i 4 94.7515838612871 2 8.08333333333333 61.78817867058689 -1 -0.3695652173913 -0.5 -0.5 -64423.406734441065 1
i 5 94.83161053684562 2 7.91666666666667 78.81789983899057 -1 -0.02173913043478 -0.5 -0.5 -67631.03378900203 1
i 2 94.91163721240414 2 11 66.37599843165151 -1 -0.15217391304348 -0.5 -0.5 -70819.75681120105 1
i 6 94.99166388796266 2 6.25 62.71686891288924 -1 -0.10869565217391 -0.5 -0.5 -73974.17797837597 1
i 6 95.07169056352119 2 9.66666666666667 75.1448260922416 -1 -0.10869565217391 -0.5 -0.5 -77078.5588787568 1
i 3 95.1517172390797 2 9.25 63.43897302708707 -1 -0.10869565217391 -0.5 -0.5 -80116.94358518513 1
i 5 95.23174391463822 2 7.16666666666667 75.12413754743052 -1 -0.28260869565217 -0.5 -0.5 -83073.28765029272 1
i 3 95.31177059019674 2 11 68.69606556547177 -1 -0.06521739130435 -0.5 -0.5 -85931.59164567049 1
i 5 95.39179726575526 2 6.75 60.41036115691793 -1 0.32608695652174 -0.5 -0.5 -88676.03777397664 1
i 6 95.47182394131377 2 8.83333333333333 78.69853173680147 -1 -0.15217391304348 -0.5 -0.5 -91291.12800900049 1
i 2 95.5518506168723 2 10.33333333333333 64.61323838821227 -1 -0.10869565217391 -0.5 -0.5 -93761.82216598092 1
i 6 95.63187729243081 2 6.41666666666667 68.55334771144241 -1 -0.06521739130435 -0.5 -0.5 -96073.67427429493 1
i 5 95.71190396798933 2 10.66666666666667 71.459726727407 -1 0.02173913043478 -0.5 -0.5 -98212.96561765001 1
i 4 95.79193064354786 2 7.66666666666667 60.92296167335373 -1 -0.15217391304348 -0.5 -0.5 -100166.83282375295 1
i 5 95.87195731910637 2 8 79.68533971417719 -1 0.19565217391304 -0.5 -0.5 -101923.38942605071 1
i 2 95.9519839946649 2 11 65.7837247987294 -1 0.15217391304348 -0.5 -0.5 -103471.83938427776 1
i 6 96.03201067022343 2 6.16666666666667 63.35542978919578 -1 -0.15217391304348 -0.5 -0.5 -104802.58113736208 1
i 6 96.11203734578194 2 10.16666666666667 74.14521304521404 -1 -0.10869565217391 -0.5 -0.5 -105907.30087074263 1
i 3 96.19206402134047 2 8 63.13855559200087 -1 -0.02173913043478 -0.5 -0.5 -106779.05380868491 1
i 5 96.27209069689899 2 7.41666666666667 76.36287045174282 -1 -0.19565217391304 -0.5 -0.5 -107412.33248901035 1
i 3 96.35211737245751 2 11 67.97082323550276 -1 -0.28260869565217 -0.5 -0.5 -107803.12114053367 1
i 6 96.43214404801603 2 6.5 61.2015606400215 -1 0.15217391304348 -0.5 -0.5 -107948.93545998709 1
i 6 96.51217072357454 2 9 77.60131497313063 -1 -0.19565217391304 -0.5 -0.5 -107848.84727263622 1
i 2 96.59219739913307 2 10 64.24626686161477 -1 -0.06521739130435 -0.5 -0.5 -107503.49375621126 1
i 5 96.67222407469158 2 6.58333333333333 70.90161487787134 -1 -0.32608695652174 -0.5 -0.5 -106915.07110821593 1
i 4 96.7522507502501 2 10.83333333333333 70.55533832302206 -1 0.06521739130435 -0.5 -0.5 -106087.31273896481 1
i 5 96.83227742580863 2 7.25 60.25505514963348 -1 -0.23913043478261 -0.5 -0.5 -105025.45227371443 1
i 5 96.91230410136714 2 8.33333333333333 80 -1 0.10869565217391 -0.5 -0.5 -103736.17184385366 1
i 2 96.99233077692566 2 10.91666666666667 65.33386807234675 -1 -0.19565217391304 -0.5 -0.5 -102227.5363362358 1
i 6 97.07235745248418 2 6 64.42313758341348 -1 0.02173913043478 -0.5 -0.5 -100508.91444848375 1
i 6 97.1523841280427 2 10.16666666666667 73.24754591181218 -1 -0.19565217391304 -0.5 -0.5 -98590.88756369679 1
i 4 97.23241080360123 2 8.41666666666667 62.66133087209639 -1 -0.19565217391304 -0.5 -0.5 -96485.14760797063 1
i 5 97.31243747915974 2 7 77.51328063784551 -1 0.06521739130435 -0.5 -0.5 -94204.38518623928 1
i 2 97.39246415471825 2 10 67.21291003390834 -1 -0.10869565217391 -0.5 -0.5 -91762.1694042952 1
i 6 97.47249083027678 2 6.41666666666667 62.01176637210418 -1 -0.06521739130435 -0.5 -0.5 -89172.82087579246 1
i 6 97.5525175058353 2 9.5 76.42751909036409 -1 -0.28260869565217 -0.5 -0.5 -86451.27948147235 1
i 3 97.63254418139383 2 9.58333333333333 63.83549061350217 -1 -0.06521739130435 -0.5 -0.5 -83612.96849287079 1
i 5 97.71257085695234 2 6.91666666666667 73.1454901448038 -1 -0.23913043478261 -0.5 -0.5 -80673.65669404842 1
i 4 97.79259753251085 2 11 69.62706887068701 -1 0.02173913043478 -0.5 -0.5 -77649.32013231944 1
i 5 97.87262420806938 2 6 60.0004825301609 -1 -0.15217391304348 -0.5 -0.5 -74556.0051030136 1
i 6 97.9526508836279 2 8.66666666666667 79.67280476629932 -1 -0.06521739130435 -0.5 -0.5 -71409.693924719 1
i 2 98.03267755918641 2 10.75 64.97819256929168 -1 0.10869565217391 -0.5 -0.5 -68226.1749913546 1
i 6 98.11270423474494 2 6.16666666666667 66.0956454062144 -1 -0.19565217391304 -0.5 -0.5 -65020.91849735294 1
i 5 98.19273091030345 2 10.58333333333333 72.41035196365621 -1 -0.06521739130435 -0.5 -0.5 -61808.95912391082 1
i 4 98.27275758586197 2 8 61.90321704534668 -1 -0.32608695652174 -0.5 -0.5 -58604.78684981386 1
i 5 98.3527842614205 2 7.91666666666667 78.6746837970405 -1 0.02173913043478 -0.5 -0.5 -55422.24691208336 1
i 2 98.43281093697901 2 11.08333333333333 66.4663559620834 -1 -0.02173913043478 -0.5 -0.5 -52274.449792030835 1
i 6 98.51283761253754 2 6.41666666666667 62.64350320693023 -1 -0.32608695652174 -0.5 -0.5 -49173.69194397679 1
i 6 98.59286428809605 2 9.83333333333333 75.28681312715578 -1 -0.15217391304348 -0.5 -0.5 -46131.38781954251 1
i 3 98.67289096365457 2 9.41666666666667 63.47841531543733 -1 -0.02173913043478 -0.5 -0.5 -43158.013572829055 1
i 5 98.7529176392131 2 7.33333333333333 74.93249990301129 -1 -0.10869565217391 -0.5 -0.5 -40263.06266374889 1
i 3 98.83294431477161 2 11 68.79555181942733 -1 0.02173913043478 -0.5 -0.5 -37455.013410874206 1
i 5 98.91297099033014 2 6.66666666666667 60.32689618013761 -1 -0.02173913043478 -0.5 -0.5 -34741.3083840756 1
i 6 98.99299766588865 2 8.66666666666667 78.83239775759043 -1 0.06521739130435 -0.5 -0.5 -32128.345373319687 1
i 2 99.07302434144717 2 10.41666666666667 64.6572456375354 -1 -0.41304347826087 -0.5 -0.5 -29621.479525508417 1
i 6 99.1530510170057 2 6.33333333333333 68.2490879837981 -1 0.19565217391304 -0.5 -0.5 -27225.03610822938 1
i 5 99.23307769256421 2 10.66666666666667 71.57406218877362 -1 -0.10869565217391 -0.5 -0.5 -24942.333239414736 1
i 4 99.31310436812272 2 7.91666666666667 61.03091460872338 -1 -0.32608695652174 -0.5 -0.5 -22775.713816703177 1
i 5 99.39313104368125 2 7 79.59850372896614 -1 -0.06521739130435 -0.5 -0.5 -20726.585790918212 1
i 2 99.47315771923977 2 11 65.8527846990421 -1 -0.28260869565217 -0.5 -0.5 -18795.4698553156 1
i 6 99.55318439479828 2 6.08333333333333 63.25370129513243 -1 -0.02173913043478 -0.5 -0.5 -16982.053566707316 1
i 6 99.63321107035681 2 9.91666666666667 74.27035486607839 -1 -0.10869565217391 -0.5 -0.5 -15285.250876399672 1
i 3 99.71323774591532 2 8.83333333333333 63.18348828854314 -1 -0.10869565217391 -0.5 -0.5 -13703.266028006032 1
i 5 99.79326442147385 2 7.5 76.211485737131 -1 -0.28260869565217 -0.5 -0.5 -12233.660775187833 1
i 3 99.87329109703236 2 11 68.06701237195588 -1 -0.02173913043478 -0.5 -0.5 -10873.423884589509 1
i 6 99.95331777259088 2 6.58333333333333 61.08894471667175 -1 -0.10869565217391 -0.5 -0.5 -9619.041916652752 1
i 6 100.0333444481494 2 9 77.75250511484808 -1 -0.06521739130435 -0.5 -0.5 -8466.570318528476 1
i 2 100.11337112370792 2 10 64.29838038213887 -1 -0.10869565217391 -0.5 -0.5 -7411.703917488864 1
i 5 100.19339779926645 2 6.66666666666667 70.59098420663639 -1 -0.02173913043478 -0.5 -0.5 -6449.84596859483 1
i 4 100.27342447482496 2 10.83333333333333 70.67819003395273 -1 0.02173913043478 -0.5 -0.5 -5576.174985184387 1
i 5 100.35345115038348 2 7.33333333333333 60.32435362062658 -1 -0.32608695652174 -0.5 -0.5 -4785.708663252619 1
i 5 100.433477825942 2 8.25 79.99503084008575 -1 -0.06521739130435 -0.5 -0.5 -4073.3642991849742 1
i 2 100.51350450150052 2 10.91666666666667 65.3868873999874 -1 0.02173913043478 -0.5 -0.5 -3434.015192710293 1
i 6 100.59353117705903 2 6 64.24829975559506 -1 0.06521739130435 -0.5 -0.5 -2862.5426215655316 1
i 6 100.67355785261756 2 10.33333333333333 73.36182490319862 -1 0.02173913043478 -0.5 -0.5 -2353.8830694195894 1
i 4 100.75358452817608 2 8.5 62.74080777117851 -1 -0.23913043478261 -0.5 -0.5 -1903.0704824145078 1
i 5 100.83361120373459 2 7.58333333333333 77.35852695436657 -1 -0.28260869565217 -0.5 -0.5 -1505.2734206726934 1
i 3 100.91363787929312 2 10 67.31517449947778 -1 -0.10869565217391 -0.5 -0.5 -1155.8270578689553 1
i 6 100.99366455485163 2 6.5 61.91334465060375 -1 0.06521739130435 -0.5 -0.5 -850.2600631943693 1
i 6 101.07369123041016 2 9.5 76.58350161654305 -1 -0.23913043478261 -0.5 -0.5 -584.316474668006 1
i 3 101.15371790596868 2 9.66666666666667 63.88928860662928 -1 -0.23913043478261 -0.5 -0.5 -353.97273988178875 1
i 5 101.23374458152719 2 6 72.86764556653452 -1 -0.06521739130435 -0.5 -0.5 -155.4501591884224 1
i 4 101.31377125708572 2 10 69.74677721697766 -1 -0.10869565217391 -0.5 -0.5 14.77698342343401 1
i 5 101.39379793264423 2 6 60.0025785488569 -1 -0.06521739130435 -0.5 -0.5 159.97727527997125 1
i 6 101.47382460820276 2 8.33333333333333 79.75094829091238 -1 -0.02173913043478 -0.5 -0.5 283.1616571569718 1
i 2 101.55385128376128 2 10 65.02156530856419 -1 0.06521739130435 -0.5 -0.5 387.08615079754253 1
i 6 101.63387795931979 2 6.08333333333333 65.84144939965442 -1 -0.15217391304348 -0.5 -0.5 474.2574355911022 1
i 5 101.71390463487832 2 10.41666666666667 72.51917508996513 -1 -0.15217391304348 -0.5 -0.5 546.9408720845122 1
i 4 101.79393131043683 2 8.08333333333333 62.01607327382358 -1 -0.02173913043478 -0.5 -0.5 607.1705716441284 1
i 5 101.87395798599535 2 7.75 78.52737063461397 -1 -0.15217391304348 -0.5 -0.5 656.7611203145252 1
i 2 101.95398466155387 2 11 66.55926769410387 -1 -0.28260869565217 -0.5 -0.5 697.320579949153 1
i 6 102.03401133711239 2 6.25 62.56924378867212 -1 0.19565217391304 -0.5 -0.5 730.2644101756979 1
i 6 102.1140380126709 2 9.75 75.43119740738372 -1 -0.19565217391304 -0.5 -0.5 756.8299798081099 1
i 3 102.19406468822943 2 9.25 63.51942403845922 -1 -0.23913043478261 -0.5 -0.5 778.0913650058374 1
i 5 102.27409136378795 2 7.08333333333333 74.73108186431884 -1 -0.10869565217391 -0.5 -0.5 794.9741628848058 1
i 3 102.35411803934647 2 11 68.8971474976419 -1 0.3695652173913 -0.5 -0.5 808.2700824954164 1
i 5 102.43414471490499 2 6.66666666666667 60.25144422476613 -1 -0.10869565217391 -0.5 -0.5 818.6511092309725 1
i 6 102.5141713904635 2 8.66666666666667 78.96241821752983 -1 0.23913043478261 -0.5 -0.5 826.6830729995946 1
i 2 102.59419806602203 2 10.5 64.70049518594115 -1 0.06521739130435 -0.5 -0.5 832.8384841376638 1
i 6 102.67422474158055 2 6.5 67.94787229193187 -1 -0.23913043478261 -0.5 -0.5 837.5085333992907 1
i 5 102.75425141713907 2 10.66666666666667 71.68722590544061 -1 -0.06521739130435 -0.5 -0.5 841.0141828509346 1
i 4 102.83427809269759 2 7.66666666666667 61.14195361388126 -1 -0.23913043478261 -0.5 -0.5 843.6163026581504 1
i 5 102.9143047682561 2 7 79.50214557801098 -1 0.06521739130435 -0.5 -0.5 845.5248341989437 1
i 2 102.99433144381463 2 11 65.92449475183861 -1 0.23913043478261 -0.5 -0.5 846.9069824038372 1
i 6 103.07435811937314 2 6.33333333333333 63.15910886293042 -1 -0.10869565217391 -0.5 -0.5 847.8944595356704 1
i 6 103.15438479493166 2 9 74.39737967895735 -1 -0.19565217391304 -0.5 -0.5 848.5898187073643 1
i 3 103.23441147049019 2 8 63.22565706521858 -1 -0.02173913043478 -0.5 -0.5 849.0719283078868 1
i 5 103.3144381460487 2 7.5 76.05834281749992 -1 -0.32608695652174 -0.5 -0.5 849.4006482609232 1
i 3 103.39446482160722 2 11.08333333333333 68.1624701810249 -1 -0.02173913043478 -0.5 -0.5 849.6207758435764 1
i 6 103.47449149716574 2 6.66666666666667 60.97711649313149 -1 0.02173913043478 -0.5 -0.5 849.7653328697997 1
i 6 103.55451817272426 2 8 77.90216528201846 -1 -0.15217391304348 -0.5 -0.5 849.8582676687641 1
i 2 103.63454484828279 2 10.08333333333333 64.34943804783867 -1 0.02173913043478 -0.5 -0.5 849.9166447707469 1
i 5 103.7145715238413 2 6.5 70.27951128807607 -1 -0.19565217391304 -0.5 -0.5 849.9523928838435 1
i 4 103.79459819939981 2 10 70.80024239557072 -1 -0.02173913043478 -0.5 -0.5 849.973677945926 1
i 5 103.87462487495834 2 7.33333333333333 60.40029200173431 -1 -0.19565217391304 -0.5 -0.5 849.9859631090093 1
i 5 103.95465155051686 2 8.08333333333333 79.97862409279485 -1 -0.02173913043478 -0.5 -0.5 849.9928117875144 1
i 2 104.03467822607539 2 10 65.44165343996538 -1 -0.06521739130435 -0.5 -0.5 849.9964836873432 1
i 6 104.1147049016339 2 6.08333333333333 64.0843153145743 -1 0.23913043478261 -0.5 -0.5 849.9983673104881 1
i 6 104.19473157719241 2 10.33333333333333 73.47726865580807 -1 -0.02173913043478 -0.5 -0.5 849.999286047089 1
i 4 104.27475825275094 2 8.5 62.81494078295373 -1 0.02173913043478 -0.5 -0.5 849.9997088316148 1
i 5 104.35478492830946 2 7.66666666666667 77.20472898660644 -1 -0.10869565217391 -0.5 -0.5 849.9998906189462 1
i 3 104.43481160386797 2 10 67.41718054289865 -1 -0.10869565217391 -0.5 -0.5 849.9999627538945 1
i 6 104.5148382794265 2 6.5 61.81153747311682 -1 -0.10869565217391 -0.5 -0.5 849.9999887466967 1
i 6 104.59486495498501 2 9.33333333333333 76.73972776527208 -1 0.10869565217391 -0.5 -0.5 849.9999970702755 1
i 3 104.67489163054353 2 9.66666666666667 63.9437921840466 -1 0.15217391304348 -0.5 -0.5 849.9999993695618 1
i 5 104.75491830610206 2 6 72.58231898625745 -1 -0.15217391304348 -0.5 -0.5 849.9999998946194 1
i 4 104.83494498166057 2 10 69.86802841517934 -1 -0.06521739130435 -0.5 -0.5 849.9999999876023 1
i 5 104.9149716572191 2 7.08333333333333 60.01509317997781 -1 -0.32608695652174 -0.5 -0.5 849.999999999135 1
i 6 104.99499833277761 2 8.33333333333333 79.81920873186333 -1 -0.06521739130435 -0.5 -0.5 849.9999999999744 1
i 2 105.07502500833613 2 10.75 65.06576935656327 -1 -0.19565217391304 -0.5 -0.5 849.9999999999999 1
i 6 105.15505168389465 2 6.08333333333333 65.59660094022632 -1 -0.10869565217391 -0.5 -0.5 850 1
i 5 105.23507835945317 2 10.33333333333333 72.62823596108527 -1 -0.06521739130435 -0.5 -0.5 850 1
i 4 105.3151050350117 2 8.33333333333333 62.12604964461033 -1 0.06521739130435 -0.5 -0.5 850 1
i 5 105.39513171057021 2 7.75 78.37681589855586 -1 -0.23913043478261 -0.5 -0.5 850.0000000000069 1
i 2 105.47515838612873 2 11.08333333333333 66.65450485876671 -1 0.06521739130435 -0.5 -0.5 850.0000000003437 1
i 6 105.55518506168725 2 6.33333333333333 62.49320029862138 -1 0.06521739130435 -0.5 -0.5 850.000000006049 1
i 6 105.63521173724577 2 9.66666666666667 75.57788201304759 -1 -0.15217391304348 -0.5 -0.5 850.0000000586107 1
i 3 105.71523841280428 2 9.33333333333333 63.56226759506662 -1 -0.23913043478261 -0.5 -0.5 850.0000003839269 1
i 5 105.79526508836281 2 7.08333333333333 74.5192627837938 -1 0.02173913043478 -0.5 -0.5 850.0000019069524 1
i 3 105.87529176392133 2 11.08333333333333 69.00112440609522 -1 0.10869565217391 -0.5 -0.5 850.0000077075937 1
i 5 105.95531843947984 2 6.75 60.18483723413767 -1 0.10869565217391 -0.5 -0.5 850.0000265586783 1
i 6 106.03534511503837 2 8.66666666666667 79.08799397141154 -1 0.02173913043478 -0.5 -0.5 850.0000805826265 1
i 2 106.11537179059688 2 10.5 64.74314106491587 -1 -0.28260869565217 -0.5 -0.5 850.0002203782384 1
i 6 106.19539846615541 2 6.33333333333333 67.65035182020496 -1 -0.19565217391304 -0.5 -0.5 850.0005527878436 1
i 5 106.27542514171392 2 10.66666666666667 71.79930457349047 -1 -0.06521739130435 -0.5 -0.5 850.0012888720295 1
i 4 106.35545181727244 2 7.75 61.255515155023 -1 -0.32608695652174 -0.5 -0.5 850.0028226907482 1
i 5 106.43547849283097 2 7 79.39675464765749 -1 -0.23913043478261 -0.5 -0.5 850.0058551883238 1
i 2 106.51550516838948 2 11.08333333333333 65.99896451811 -1 0.06521739130435 -0.5 -0.5 850.0115818484421 1
i 6 106.59553184394801 2 6.08333333333333 63.07075332243507 -1 -0.02173913043478 -0.5 -0.5 850.0219677916225 1
i 6 106.67555851950652 2 9 74.52641351831076 -1 -0.06521739130435 -0.5 -0.5 850.0401395612921 1
i 3 106.75558519506504 2 8 63.26567088954708 -1 0.02173913043478 -0.5 -0.5 850.0709288734457 1
i 5 106.83561187062357 2 7.33333333333333 75.90247788545257 -1 0.06521739130435 -0.5 -0.5 850.1216099347337 1
i 3 106.91563854618208 2 11.08333333333333 68.25746069340185 -1 0.10869565217391 -0.5 -0.5 850.2028783683842 1
i 5 106.9956652217406 2 6.66666666666667 60.86691320769704 -1 -0.02173913043478 -0.5 -0.5 850.3301260907123 1
i 6 107.07569189729912 2 8 78.05012153161664 -1 -0.32608695652174 -0.5 -0.5 850.5250723812997 1
i 2 107.15571857285764 2 10.08333333333333 64.39937093405507 -1 -0.02173913043478 -0.5 -0.5 850.8178165852989 1
i 5 107.23574524841615 2 6.5 69.96777446037403 -1 -0.10869565217391 -0.5 -0.5 851.2493820518889 1
i 4 107.31577192397468 2 10.75 70.9213253109528 -1 -0.19565217391304 -0.5 -0.5 851.8748237097172 1
i 5 107.3957985995332 2 7.33333333333333 60.48237493093525 -1 -0.02173913043478 -0.5 -0.5 852.7669727652782 1
i 5 107.47582527509172 2 8.08333333333333 79.95089397674741 -1 0.15217391304348 -0.5 -0.5 854.0208910477522 1
i 2 107.55585195065024 2 10 65.49826754939654 -1 0.02173913043478 -0.5 -0.5 855.7591041971887 1
i 6 107.63587862620875 2 6.08333333333333 63.93097455587062 -1 -0.19565217391304 -0.5 -0.5 858.1376769168347 1
i 6 107.71590530176728 2 10.16666666666667 73.59394800305819 -1 -0.19565217391304 -0.5 -0.5 861.3531846436322 1
i 4 107.7959319773258 2 8.66666666666667 62.88381925887205 -1 -0.23913043478261 -0.5 -0.5 865.6506240483864 1
i 5 107.87595865288432 2 7.66666666666667 77.05198242253793 -1 -0.23913043478261 -0.5 -0.5 871.3322896414841 1
i 3 107.95598532844284 2 10 67.5186471439517 -1 -0.19565217391304 -0.5 -0.5 878.7676253919892 1
i 6 108.03601200400135 2 6.41666666666667 61.70667935164805 -1 -0.06521739130435 -0.5 -0.5 888.4040387155051 1
i 6 108.11603867955988 2 9.58333333333333 76.89588559804571 -1 -0.23913043478261 -0.5 -0.5 900.7786395913472 1
i 3 108.19606535511839 2 9.75 63.99867146071901 -1 -0.10869565217391 -0.5 -0.5 916.5308401740111 1
i 5 108.2760920306769 2 6.75 72.29051392571043 -1 -0.28260869565217 -0.5 -0.5 936.4157204112739 1
i 4 108.35611870623543 2 10 69.99046444794168 -1 -0.06521739130435 -0.5 -0.5 961.3180333166811 1
i 5 108.43614538179395 2 7 60.03765437263473 -1 -0.23913043478261 -0.5 -0.5 992.2666902129022 1
i 5 108.51617205735246 2 8.83333333333333 79.8770684262789 -1 -0.23913043478261 -0.5 -0.5 1030.449532102532 1
i 2 108.59619873291099 2 10.83333333333333 65.1109655947762 -1 0.06521739130435 -0.5 -0.5 1077.2281590570078 1
i 6 108.6762254084695 2 6.08333333333333 65.36164025418891 -1 -0.06521739130435 -0.5 -0.5 1134.1525559401264 1
i 5 108.75625208402803 2 10.33333333333333 72.73771751263943 -1 0.06521739130435 -0.5 -0.5 1202.9752207551553 1
i 4 108.83627875958655 2 8.16666666666667 62.23251188938045 -1 -0.10869565217391 -0.5 -0.5 1285.6644723216368 1
i 5 108.91630543514506 2 7.83333333333333 78.22384200110633 -1 0.02173913043478 -0.5 -0.5 1384.4165877738228 1
i 2 108.99633211070359 2 11.08333333333333 66.75178790952785 -1 0.06521739130435 -0.5 -0.5 1501.6663984498216 1
i 6 109.0763587862621 2 6.25 62.41463440710115 -1 -0.06521739130435 -0.5 -0.5 1640.095956016103 1
i 6 109.15638546182063 2 9.66666666666667 75.72671354924478 -1 0.32608695652174 -0.5 -0.5 1802.6408700103561 1
i 3 109.23641213737915 2 9.5 63.60709250351309 -1 -0.45652173913043 -0.5 -0.5 1992.493914180085 1
i 5 109.31643881293766 2 7.16666666666667 74.29667321478061 -1 -0.10869565217391 -0.5 -0.5 2213.105502761668 1
i 3 109.39646548849619 2 11.16666666666667 69.10766252210765 -1 0.10869565217391 -0.5 -0.5 2468.1806497696616 1
i 5 109.4764921640547 2 6.75 60.12778561290197 -1 -0.02173913043478 -0.5 -0.5 2761.6720449238237 1
i 6 109.55651883961322 2 8.83333333333333 79.20845046924242 -1 0.06521739130435 -0.5 -0.5 3097.7689093358636 1
i 2 109.63654551517175 2 10.58333333333333 64.78535539932919 -1 -0.19565217391304 -0.5 -0.5 3480.8813326503 1
i 6 109.71657219073026 2 6.25 67.35724370912318 -1 -0.10869565217391 -0.5 -0.5 3915.6198409475946 1
i 5 109.79659886628878 2 10.66666666666667 71.91041221609885 -1 0.23913043478261 -0.5 -0.5 4406.770001132939 1
i 4 109.8766255418473 2 7 61.37097991413238 -1 -0.15217391304348 -0.5 -0.5 4959.261932313143 1
i 5 109.95665221740582 2 7 79.28290135478625 -1 0.10869565217391 -0.5 -0.5 5578.134667171966 1
i 2 110.03667889296435 2 11 66.07628054104856 -1 -0.28260869565217 -0.5 -0.5 6268.49538575545 1
i 6 110.11670556852286 2 6.16666666666667 62.98763864760451 -1 -0.41304347826087 -0.5 -0.5 7035.473629318767 1
i 6 110.19673224408137 2 9.83333333333333 74.65757896929838 -1 0.28260869565217 -0.5 -0.5 7884.17069178273 1
i 3 110.2767589196399 2 8 63.30417053573001 -1 -0.02173913043478 -0.5 -0.5 8819.60447947962 1
i 5 110.35678559519842 2 7.33333333333333 75.7428167421392 -1 -0.19565217391304 -0.5 -0.5 9846.650224729487 1
i 3 110.43681227075695 2 11.16666666666667 68.35231641030568 -1 0.28260869565217 -0.5 -0.5 10969.977533724581 1
i 5 110.51683894631546 2 6.58333333333333 60.75924080218765 -1 -0.02173913043478 -0.5 -0.5 12193.98434243953 1
i 6 110.59686562187397 2 8.83333333333333 78.19618497801235 -1 0.02173913043478 -0.5 -0.5 13522.728444046703 1
i 2 110.6768922974325 2 10.33333333333333 64.4481474128685 -1 0.10869565217391 -0.5 -0.5 14959.857335745208 1
i 5 110.75691897299102 2 6.58333333333333 69.65629365226992 -1 -0.19565217391304 -0.5 -0.5 16508.537210166884 1
i 4 110.83694564854953 2 10.75 71.04130866706755 -1 -0.15217391304348 -0.5 -0.5 18171.381984836684 1
i 5 110.91697232410806 2 7.41666666666667 60.57013023554259 -1 -0.15217391304348 -0.5 -0.5 19950.38332079459 1
i 5 110.99699899966657 2 8.16666666666667 79.91199818042001 -1 -0.15217391304348 -0.5 -0.5 21846.84262688976 1
i 2 111.07702567522509 2 10.91666666666667 65.55683670112543 -1 0.02173913043478 -0.5 -0.5 23861.306077958663 1
i 6 111.15705235078362 2 6 63.78798637423362 -1 -0.02173913043478 -0.5 -0.5 25993.503691886635 1
i 6 111.23707902634213 2 10.25 73.71193581642642 -1 -0.23913043478261 -0.5 -0.5 28242.293511392567 1
i 4 111.31710570190066 2 8.58333333333333 62.94761778246421 -1 -0.28260869565217 -0.5 -0.5 30605.611920523523 1
i 5 111.39713237745917 2 7.66666666666667 76.90025440708192 -1 -0.23913043478261 -0.5 -0.5 33080.43109276316 1
i 3 111.47715905301769 2 10.91666666666667 67.61934589662819 -1 -0.02173913043478 -0.5 -0.5 35662.724517233444 1
i 6 111.55718572857621 2 6.5 61.59918010196022 -1 -0.19565217391304 -0.5 -0.5 38347.441481706934 1
i 6 111.63721240413473 2 9.33333333333333 77.05168426291871 -1 -0.32608695652174 -0.5 -0.5 41128.491306595446 1
i 3 111.71723907969326 2 9.75 64.05361172941382 -1 -0.06521739130435 -0.5 -0.5 43998.73802340172 1
i 5 111.79726575525177 2 6.75 71.99324474036146 -1 -0.32608695652174 -0.5 -0.5 46950.00607543401 1
i 4 111.87729243081029 2 10 70.11372056803503 -1 -0.02173913043478 -0.5 -0.5 49973.09748926749 1
i 5 111.95731910636881 2 7.08333333333333 60.06981216248226 -1 -0.23913043478261 -0.5 -0.5 53057.82082410103 1
i 5 112.03734578192733 2 8.25 79.92411038642655 -1 -0.23913043478261 -0.5 -0.5 56193.03205483006 1
i 2 112.11737245748584 2 10.83333333333333 65.15729888354724 -1 -0.10869565217391 -0.5 -0.5 59366.68738540682 1
i 6 112.19739913304437 2 6 65.13700569910357 -1 -0.10869565217391 -0.5 -0.5 62565.90782432612 1
i 6 112.27742580860289 2 10.66666666666667 72.84778395276228 -1 -0.15217391304348 -0.5 -0.5 65777.05518638482 1
i 4 112.3574524841614 2 8.25 62.33490615185015 -1 -0.02173913043478 -0.5 -0.5 68985.81901682969 1
i 5 112.43747915971993 2 7.75 78.06921714028117 -1 0.28260869565217 -0.5 -0.5 72177.31376845081 1
i 2 112.51750583527844 2 10 66.8507950424158 -1 -0.23913043478261 -0.5 -0.5 75336.18540176291 1
i 6 112.59753251083697 2 6.58333333333333 62.33297628483504 -1 -0.15217391304348 -0.5 -0.5 78446.7264259651 1
i 6 112.67755918639548 2 9.5 75.87748525529483 -1 -0.19565217391304 -0.5 -0.5 81492.9982564607 1
i 3 112.757585861954 2 9.41666666666667 63.65392628570508 -1 -0.23913043478261 -0.5 -0.5 84458.95963597849 1
i 5 112.83761253751253 2 7.08333333333333 74.06320919507851 -1 -0.06521739130435 -0.5 -0.5 87328.59975305237 1
i 3 112.91763921307104 2 11 69.21684219336805 -1 -0.15217391304348 -0.5 -0.5 90086.07459596948 1
i 5 112.99766588862957 2 6.75 60.08085597122425 -1 -0.19565217391304 -0.5 -0.5 92715.84500417957 1
i 6 113.07769256418808 2 8.5 79.32305387340791 -1 -0.23913043478261 -0.5 -0.5 95202.81482409104 1
i 2 113.1577192397466 2 10.66666666666667 64.82732475116282 -1 -0.15217391304348 -0.5 -0.5 97532.46754351292 1
i 6 113.23774591530513 2 6.58333333333333 67.06931784093861 -1 -0.28260869565217 -0.5 -0.5 99690.99976948678 1
i 5 113.31777259086364 2 10.66666666666667 72.02068940206806 -1 -0.06521739130435 -0.5 -0.5 101665.44992852368 1
i 4 113.39779926642215 2 7.83333333333333 61.48767400521138 -1 -0.06521739130435 -0.5 -0.5 103443.8206063269 1
i 5 113.47782594198068 2 7.91666666666667 79.16123797271203 -1 -0.02173913043478 -0.5 -0.5 105015.19300569438 1
i 2 113.5578526175392 2 11 66.15649776066192 -1 -0.3695652173913 -0.5 -0.5 106369.83208574491 1
i 6 113.63787929309771 2 6.16666666666667 62.90868725938313 -1 0.02173913043478 -0.5 -0.5 107499.28105181686 1
i 6 113.71790596865624 2 9.83333333333333 74.79098866354875 -1 -0.02173913043478 -0.5 -0.5 108396.44399185559 1
i 3 113.79793264421475 2 9.08333333333333 63.34180878928798 -1 -0.06521739130435 -0.5 -0.5 109055.65560006235 1
i 5 113.87795931977328 2 7.25 75.57820765888023 -1 0.06521739130435 -0.5 -0.5 109472.73708983086 1
i 3 113.9579859953318 2 11 68.44742489265023 -1 0.06521739130435 -0.5 -0.5 109645.03757315215 1
i 5 114.03801267089031 2 6.83333333333333 60.65506341098721 -1 0.10869565217391 -0.5 -0.5 109571.46037004246 1
i 6 114.11803934644884 2 8.91666666666667 78.34013846901426 -1 -0.15217391304348 -0.5 -0.5 109252.47390625194 1
i 2 114.19806602200735 2 10.25 64.49577094447383 -1 -0.23913043478261 -0.5 -0.5 108690.1070575607 1
i 5 114.27809269756588 2 6.58333333333333 69.34554819431546 -1 -0.02173913043478 -0.5 -0.5 107887.9290012049 1
i 4 114.3581193731244 2 10 71.16010128322242 -1 -0.02173913043478 -0.5 -0.5 106851.0138362851 1
i 5 114.43814604868291 2 7.58333333333333 60.66310474582561 -1 0.23913043478261 -0.5 -0.5 105585.89043222499 1
i 5 114.51817272424144 2 8 79.86213259939345 -1 -0.02173913043478 -0.5 -0.5 104100.47815442877 1
i 2 114.59819939979995 2 10 65.61747531952635 -1 -0.15217391304348 -0.5 -0.5 102404.00929627317 1
i 6 114.67822607535847 2 6 63.65497824836214 -1 -0.15217391304348 -0.5 -0.5 100506.93921371928 1
i 6 114.758252750917 2 10.16666666666667 73.83131165821618 -1 -0.02173913043478 -0.5 -0.5 98420.84531060577 1
i 4 114.83827942647551 2 8.66666666666667 63.00659127800991 -1 -0.28260869565217 -0.5 -0.5 96158.31615681702 1
i 5 114.91830610203402 2 7.75 76.74937724989813 -1 -0.02173913043478 -0.5 -0.5 93732.83213605495 1
i 3 114.99833277759255 2 11 67.71911062124187 -1 0.02173913043478 -0.5 -0.5 91158.63911329684 1
i 6 115.07835945315107 2 6.58333333333333 61.48951446255458 -1 0.02173913043478 -0.5 -0.5 88450.61668290003 1
i 6 115.1583861287096 2 9.16666666666667 77.2068591649766 -1 0.10869565217391 -0.5 -0.5 85624.14260590963 1
i 3 115.23841280426811 2 9 64.10832489692453 -1 -0.06521739130435 -0.5 -0.5 82694.9550689561 1
i 5 115.31843947982662 2 6.66666666666667 71.6915002033432 -1 0.23913043478261 -0.5 -0.5 79679.01439712809 1
i 4 115.39846615538515 2 10.91666666666667 70.23744018836084 -1 -0.10869565217391 -0.5 -0.5 76592.36582977089 1
i 5 115.47849283094367 2 7.16666666666667 60.11106241180102 -1 -0.32608695652174 -0.5 -0.5 73451.00492193914 1
i 5 115.5585195065022 2 8.33333333333333 79.96002084217578 -1 0.06521739130435 -0.5 -0.5 70270.74706641508 1
i 2 115.63854618206071 2 10.83333333333333 65.204899001457 -1 -0.15217391304348 -0.5 -0.5 67067.1025431885 1
i 6 115.71857285761922 2 6.08333333333333 64.92302784333057 -1 0.19565217391304 -0.5 -0.5 63855.158396841354 1
i 6 115.79859953317775 2 10.33333333333333 72.95857875905912 -1 -0.10869565217391 -0.5 -0.5 60649.46831949461 1
i 4 115.87862620873626 2 8.58333333333333 62.43277162321668 -1 0.06521739130435 -0.5 -0.5 57463.951580042936 1
i 5 115.95865288429478 2 7.83333333333333 77.91363673351813 -1 0.15217391304348 -0.5 -0.5 54311.801891868636 1
i 2 116.0386795598533 2 10.91666666666667 66.95117360452325 -1 -0.19565217391304 -0.5 -0.5 51205.40695371362 1
i 6 116.11870623541182 2 6.41666666666667 62.24782962780215 -1 0.02173913043478 -0.5 -0.5 48156.279234526926 1
i 6 116.19873291097034 2 9.58333333333333 76.02994416047225 -1 -0.23913043478261 -0.5 -0.5 45174.99840575894 1
i 3 116.27875958652886 2 9.41666666666667 63.70268813923717 -1 -0.10869565217391 -0.5 -0.5 42271.16565641572 1
i 5 116.35878626208738 2 7.08333333333333 73.81902820947319 -1 -0.19565217391304 -0.5 -0.5 39453.36995995191 1
i 3 116.4388129376459 2 11 69.32864390598981 -1 -0.32608695652174 -0.5 -0.5 36729.16620032843 1
i 5 116.51883961320442 2 6.83333333333333 60.04445659688517 -1 0.15217391304348 -0.5 -0.5 34105.06490979199 1
i 6 116.59886628876293 2 8.5 79.43103354299205 -1 -0.19565217391304 -0.5 -0.5 31586.533225323772 1
i 2 116.67889296432146 2 10.75 64.86924569826378 -1 -0.06521739130435 -0.5 -0.5 29178.006536346304 1
i 6 116.75891963987998 2 6.25 66.78737560125784 -1 -0.06521739130435 -0.5 -0.5 26882.910174947847 1
i 5 116.8389463154385 2 10.58333333333333 72.13030116774678 -1 0.10869565217391 -0.5 -0.5 24703.690393013494 1
i 4 116.91897299099702 2 7.91666666666667 61.60487731617424 -1 -0.23913043478261 -0.5 -0.5 22641.853779522986 1
i 5 116.99899966655553 2 7 79.03249257753068 -1 -0.06521739130435 -0.5 -0.5 20698.01419669119 1
i 2 117.07902634211406 2 11.16666666666667 66.23963139096566 -1 -0.10869565217391 -0.5 -0.5 18871.94625622115 1
i 6 117.15905301767258 2 6.16666666666667 62.83276572211996 -1 -0.10869565217391 -0.5 -0.5 17162.644316878916 1
i 6 117.23907969323109 2 9.83333333333333 74.92673759958822 -1 -0.32608695652174 -0.5 -0.5 15568.38596188146 1
i 3 117.31910636878962 2 9.08333333333333 63.37922621765543 -1 0.15217391304348 -0.5 -0.5 14086.798908794824 1
i 5 117.39913304434813 2 7.25 75.40746566594548 -1 0.06521739130435 -0.5 -0.5 12714.93031513254 1
i 3 117.47915971990665 2 11 68.54320997186096 -1 0.02173913043478 -0.5 -0.5 11449.317468687568 1
i 5 117.55918639546518 2 6.91666666666667 60.55538565786549 -1 -0.02173913043478 -0.5 -0.5 10286.058891701434 1
i 6 117.63921307102369 2 8.83333333333333 78.48172231897979 -1 -0.19565217391304 -0.5 -0.5 9220.884940866266 1
i 2 117.71923974658222 2 10.25 64.5422777353303 -1 -0.41304347826087 -0.5 -0.5 8249.227049379157 1
i 5 117.79926642214073 2 6.5 69.03599843469176 -1 -0.19565217391304 -0.5 -0.5 7366.284831150386 1
i 5 117.87929309769925 2 10.66666666666667 71.2776491045204 -1 -0.23913043478261 -0.5 -0.5 6567.090349023512 1
i 5 117.95931977325777 2 7.5 60.76085606742069 -1 -0.06521739130435 -0.5 -0.5 5846.568936709815 1
i 5 118.03934644881629 2 8 79.80152996379003 -1 -0.3695652173913 -0.5 -0.5 5199.596056205426 1
i 2 118.11937312437482 2 10 65.68030567575661 -1 -0.19565217391304 -0.5 -0.5 4621.049766924906 1
i 6 118.19939979993333 2 6 63.53149386343037 -1 0.06521739130435 -0.5 -0.5 4105.858477884216 1
i 6 118.27942647549185 2 10 73.95216513519921 -1 -0.02173913043478 -0.5 -0.5 3649.043748281886 1
i 3 118.35945315105037 2 8.83333333333333 63.06107056313758 -1 -0.06521739130435 -0.5 -0.5 3245.757993199386 1
i 5 118.43947982660889 2 7.5 76.59904228629556 -1 -0.19565217391304 -0.5 -0.5 2891.3170384065725 1
i 3 118.5195065021674 2 11 67.81784535006214 -1 -0.23913043478261 -0.5 -0.5 2581.227550143833 1
i 6 118.59953317772593 2 6.66666666666667 61.37821679298538 -1 -0.02173913043478 -0.5 -0.5 2311.209441135722 1
i 6 118.67955985328445 2 9.16666666666667 77.36117393780376 -1 0.06521739130435 -0.5 -0.5 2077.2134220666308 1
i 3 118.75958652884296 2 9 64.16255745472708 -1 -0.3695652173913 -0.5 -0.5 1875.4339275861405 1
i 5 118.83961320440149 2 6.75 71.38621506604156 -1 -0.10869565217391 -0.5 -0.5 1702.317697101617 1
i 4 118.91963987996 2 10.83333333333333 70.36128708557823 -1 -0.15217391304348 -0.5 -0.5 1554.568332833764 1
i 5 118.99966655551853 2 7.16666666666667 60.16086915909186 -1 -0.19565217391304 -0.5 -0.5 1429.1471907468617 1
i 5 119.07969323107704 2 8.25 79.98458590336352 -1 -0.06521739130435 -0.5 -0.5 1323.2709840832997 1
i 2 119.15971990663556 2 10.83333333333333 65.25388288630045 -1 -0.19565217391304 -0.5 -0.5 1234.4064945777825 1
i 6 119.23974658219409 2 6 64.71992846054312 -1 0.10869565217391 -0.5 -0.5 1160.262793406596 1
i 6 119.3197732577526 2 10.25 73.07022492075298 -1 -0.10869565217391 -0.5 -0.5 1098.7813730834264 1
i 4 119.39979993331113 2 8.33333333333333 62.52574822349163 -1 -0.15217391304348 -0.5 -0.5 1048.124583514796 1
i 5 119.47982660886964 2 7.66666666666667 77.7577082196161 -1 -0.10869565217391 -0.5 -0.5 1006.662751038655 1
i 2 119.55985328442816 2 10 67.05255329312018 -1 -0.23913043478261 -0.5 -0.5 972.9603393276611 1
i 6 119.63987995998669 2 6.33333333333333 62.15896658552434 -1 -0.10869565217391 -0.5 -0.5 945.7614864378332 1
i 6 119.7199066355452 2 9.58333333333333 76.18380109805848 -1 -0.32608695652174 -0.5 -0.5 923.9752239421017 1
i 3 119.79993331110371 2 9.58333333333333 63.75320554826733 -1 -0.15217391304348 -0.5 -0.5 906.6606529330979 1
i 5 119.87995998666224 2 6 73.56452905334399 -1 -0.10869565217391 -0.5 -0.5 893.0123186209897 1
i 3 119.95998666222076 2 11.08333333333333 69.44295463214189 -1 -0.10869565217391 -0.5 -0.5 882.345991164579 1
i 5 120.04001333777927 2 6 60.01883168497945 -1 -0.19565217391304 -0.5 -0.5 874.0850260802829 1
i 6 120.1200400133378 2 8.41666666666667 79.53160835740218 -1 -0.28260869565217 -0.5 -0.5 867.7474438276613 1
i 2 120.20006668889631 2 10.66666666666667 64.91131969894374 -1 -0.02173913043478 -0.5 -0.5 862.9338356456143 1
i 6 120.28009336445484 2 6.25 66.51222434887414 -1 -0.15217391304348 -0.5 -0.5 859.316171993313 1
i 5 120.36012004001336 2 10.5 72.23943286141254 -1 -0.02173913043478 -0.5 -0.5 856.6275615203581 1
i 4 120.44014671557187 2 7 61.72183799940002 -1 -0.32608695652174 -0.5 -0.5 854.652982736021 1
i 5 120.5201733911304 2 7 78.89745653216235 -1 -0.15217391304348 -0.5 -0.5 853.2209877503677 1
i 2 120.60020006668891 2 11.16666666666667 66.3256497401455 -1 -0.19565217391304 -0.5 -0.5 852.1963578018785 1
i 6 120.68022674224744 2 6.33333333333333 62.75871980831322 -1 0.10869565217391 -0.5 -0.5 851.4736738521907 1
i 6 120.76025341780596 2 9.75 75.06489429444282 -1 -0.19565217391304 -0.5 -0.5 850.9717523133113 1
i 3 120.84028009336447 2 9.08333333333333 63.4170242202961 -1 0.19565217391304 -0.5 -0.5 850.6288858890816 1
i 5 120.920306768923 2 7.33333333333333 75.22942644784105 -1 -0.10869565217391 -0.5 -0.5 850.398822401513 1
i 3 121.00033344448151 2 11.08333333333333 68.6401082764697 -1 -0.15217391304348 -0.5 -0.5 850.2474101137982 1
i 5 121.08036012004003 2 6.66666666666667 60.46122862055498 -1 0.10869565217391 -0.5 -0.5 850.1498361862558 1
i 6 121.16038679559855 2 8.75 78.6206197852228 -1 -0.28260869565217 -0.5 -0.5 850.0883852036627 1
i 2 121.24041347115707 2 10.33333333333333 64.58773429658194 -1 -0.28260869565217 -0.5 -0.5 850.0506468627227 1
i 5 121.32044014671558 2 6.33333333333333 68.72811003142058 -1 -0.23913043478261 -0.5 -0.5 850.0281055653738 1
i 5 121.40046682227411 2 10.66666666666667 71.39393279160113 -1 0.02173913043478 -0.5 -0.5 850.0150494853815 1
i 4 121.48049349783263 2 7.66666666666667 60.86294071995792 -1 -0.10869565217391 -0.5 -0.5 850.0077423305678 1
i 5 121.56052017339115 2 8.08333333333333 79.73046286740158 -1 -0.15217391304348 -0.5 -0.5 850.0038071989823 1
i 2 121.64054684894967 2 11.08333333333333 65.74545641862223 -1 -0.15217391304348 -0.5 -0.5 850.0017783396552 1
i 6 121.72057352450818 2 6.08333333333333 63.41698874488512 -1 -0.32608695652174 -0.5 -0.5 850.0007830263568 1
i 6 121.80060020006671 2 10.08333333333333 74.07459739791503 -1 -0.45652173913043 -0.5 -0.5 850.0003219234968 1
i 3 121.88062687562523 2 8.75 63.11145811344191 -1 -0.06521739130435 -0.5 -0.5 850.0001220955999 1
i 5 121.96065355118375 2 7.5 76.44879484971327 -1 0.02173913043478 -0.5 -0.5 850.0000420568159 1
i 3 122.04068022674227 2 11.08333333333333 67.91553034364024 -1 0.02173913043478 -0.5 -0.5 850.0000128876516 1
i 6 122.12070690230078 2 6.5 61.26588074439887 -1 -0.15217391304348 -0.5 -0.5 850.0000034154175 1
i 6 122.20073357785931 2 9.08333333333333 77.51441882578979 -1 -0.15217391304348 -0.5 -0.5 850.0000007521032 1
i 2 122.28076025341782 2 9 64.21609521495685 -1 -0.28260869565217 -0.5 -0.5 850.0000001296929 1
i 5 122.36078692897634 2 6.66666666666667 71.07825105172643 -1 -0.02173913043478 -0.5 -0.5 850.0000000159497 1
i 4 122.44081360453487 2 10 70.48495441267083 -1 -0.10869565217391 -0.5 -0.5 850.0000000011917 1
i 5 122.52084028009338 2 7.33333333333333 60.2186841614233 -1 -0.15217391304348 -0.5 -0.5 850.0000000000397 1
i 5 122.6008669556519 2 8.33333333333333 79.99768358360879 -1 0.19565217391304 -0.5 -0.5 850.0000000000002 1
i 2 122.68089363121042 2 10 65.30435773021222 -1 -0.10869565217391 -0.5 -0.5 850 1
i 6 122.76092030676894 2 6.08333333333333 64.5278237913969 -1 0.02173913043478 -0.5 -0.5 850 1
i 6 122.84094698232747 2 10.33333333333333 73.18282692306113 -1 0.06521739130435 -0.5 -0.5 850 1
i 4 122.92097365788598 2 8.5 62.61357946005818 -1 0.06521739130435 -0.5 -0.5 849.9999999999958 1
i 5 123.0010003334445 2 7.66666666666667 77.60193951754215 -1 0.02173913043478 -0.5 -0.5 849.9999999997601 1
i 2 123.08102700900302 2 10 67.154560005208 -1 -0.28260869565217 -0.5 -0.5 849.9999999954078 1
i 6 123.16105368456154 2 6.33333333333333 62.06631505753059 -1 0.06521739130435 -0.5 -0.5 849.9999999531233 1
i 6 123.24108036012007 2 9.5 76.33874215116842 -1 -0.06521739130435 -0.5 -0.5 849.9999996818023 1
i 3 123.32110703567858 2 9.5 63.80523452280735 -1 -0.15217391304348 -0.5 -0.5 849.9999983780876 1
i 5 123.4011337112371 2 6 73.30031944965404 -1 -0.15217391304348 -0.5 -0.5 849.9999933143241 1
i 4 123.48116038679562 2 11.08333333333333 69.55957918757345 -1 0.06521739130435 -0.5 -0.5 849.9999766039261 1
i 5 123.56118706235414 2 6 60.00406419119557 -1 -0.23913043478261 -0.5 -0.5 849.9999281226926 1
i 6 123.64121373791265 2 8.5 79.62401411975299 -1 -0.15217391304348 -0.5 -0.5 849.999801399221 1
i 2 123.72124041347118 2 10.66666666666667 64.95374755066999 -1 0.06521739130435 -0.5 -0.5 849.9994975269028 1
i 6 123.8012670890297 2 6.08333333333333 66.2446512055973 -1 -0.19565217391304 -0.5 -0.5 849.9988198184311 1
i 5 123.88129376458821 2 10.5 72.34828374024812 -1 0.06521739130435 -0.5 -0.5 849.9973989626324 1
i 4 123.96132044014674 2 8.08333333333333 61.83779141501063 -1 -0.10869565217391 -0.5 -0.5 849.9945748173565 1
i 5 124.04134711570525 2 7 78.7569669273357 -1 0.3695652173913 -0.5 -0.5 849.9892166749311 1
i 2 124.12137379126378 2 11.08333333333333 66.41446850703346 -1 -0.19565217391304 -0.5 -0.5 849.979458896358 1
i 6 124.20140046682229 2 6.33333333333333 62.68541589408169 -1 -0.23913043478261 -0.5 -0.5 849.9623232933413 1
i 6 124.2814271423808 2 9.66666666666667 75.20549124864723 -1 0.10869565217391 -0.5 -0.5 849.9331936507757 1
i 3 124.36145381793933 2 9.33333333333333 63.45573797173645 -1 -0.19565217391304 -0.5 -0.5 849.8851014762266 1
i 5 124.44148049349785 2 7.33333333333333 75.04300593814496 -1 0.06521739130435 -0.5 -0.5 849.8077756289831 1
i 3 124.52150716905638 2 11.08333333333333 68.73854280686518 -1 -0.15217391304348 -0.5 -0.5 849.686402151291 1
i 5 124.60153384461489 2 6.66666666666667 60.37360106021671 -1 -0.10869565217391 -0.5 -0.5 849.5000346665489 1
i 6 124.6815605201734 2 8.66666666666667 78.75644375244447 -1 0.02173913043478 -0.5 -0.5 849.2195904225803 1
i 2 124.76158719573193 2 10.33333333333333 64.6322349476014 -1 -0.15217391304348 -0.5 -0.5 848.8053627653557 1
i 6 124.84161387129045 2 6.33333333333333 68.42237850277722 -1 -0.10869565217391 -0.5 -0.5 848.2039778676275 1
i 5 124.92164054684896 2 10.66666666666667 71.50896510302012 -1 0.06521739130435 -0.5 -0.5 847.3447222508973 1
i 4 125.00166722240749 2 7.66666666666667 60.96889969203987 -1 0.19565217391304 -0.5 -0.5 846.1351683651034 1
i 5 125.081693897966 2 7 79.64925104214032 -1 -0.28260869565217 -0.5 -0.5 844.4560285477687 1
i 2 125.16172057352452 2 11.08333333333333 65.81305902245263 -1 -0.10869565217391 -0.5 -0.5 842.1551733622722 1
i 6 125.24174724908305 2 6 63.31082458580904 -1 0.19565217391304 -0.5 -0.5 839.0407588599892 1
i 6 125.32177392464156 2 9 74.19872059310441 -1 -0.23913043478261 -0.5 -0.5 834.873418915023 1
i 3 125.40180060020009 2 8.75 63.15822350321302 -1 -0.3695652173913 -0.5 -0.5 829.3574935681917 1
i 5 125.4818272757586 2 7.41666666666667 76.29803162100414 -1 0.15217391304348 -0.5 -0.5 822.1312823371791 1
i 3 125.56185395131712 2 11 68.01222587139164 -1 -0.02173913043478 -0.5 -0.5 812.7563326639221 1
i 6 125.64188062687565 2 6.66666666666667 61.15316274185167 -1 -0.02173913043478 -0.5 -0.5 800.7057979470225 1
i 6 125.72190730243416 2 9 77.66640561614373 -1 0.02173913043478 -0.5 -0.5 785.351926715063 1
i 2 125.80193397799269 2 10.08333333333333 64.26876534823778 -1 -0.19565217391304 -0.5 -0.5 765.9527741043485 1
i 5 125.8819606535512 2 6.58333333333333 70.76838740755174 -1 -0.28260869565217 -0.5 -0.5 741.6382584764316 1
i 4 125.96198732910972 2 10 70.60817057312096 -1 0.02173913043478 -0.5 -0.5 711.3957192130946 1
i 5 126.04201400466825 2 7.41666666666667 60.28396256190418 -1 -0.23913043478261 -0.5 -0.5 674.0551658307198 1
i 5 126.12204068022676 2 8.16666666666667 79.9992729327583 -1 -0.02173913043478 -0.5 -0.5 628.2744428468291 1
i 2 126.20206735578527 2 10 65.35642450964868 -1 0.10869565217391 -0.5 -0.5 572.5245685212708 1
i 6 126.2820940313438 2 6 64.34673060133478 -1 0.06521739130435 -0.5 -0.5 505.07553783145966 1
i 6 126.36212070690232 2 10.25 73.29647399957958 -1 -0.15217391304348 -0.5 -0.5 423.9829099307576 1
i 4 126.44214738246083 2 8.5 62.69611132599893 -1 -0.3695652173913 -0.5 -0.5 327.0755269619679 1
i 5 126.52217405801936 2 7 77.44673067405647 -1 -0.28260869565217 -0.5 -0.5 211.94473352761676 1
i 3 126.60220073357787 2 10 67.2568294888452 -1 -0.15217391304348 -0.5 -0.5 75.93548344515945 1
i 6 126.6822274091364 2 6.5 61.96994126908474 -1 -0.19565217391304 -0.5 -0.5 -83.86026822823924 1
i 6 126.76225408469492 2 9.66666666666667 76.49444033268209 -1 0.10869565217391 -0.5 -0.5 -270.607485337987 1
i 3 126.84228076025343 2 9.58333333333333 63.85848120042452 -1 -0.19565217391304 -0.5 -0.5 -487.72888329547885 1
i 5 126.92230743581196 2 6 73.02717569555956 -1 -0.02173913043478 -0.5 -0.5 -738.9022856390686 1
i 4 127.00233411137047 2 11.16666666666667 69.67825494317583 -1 0.06521739130435 -0.5 -0.5 -1028.054135478643 1
i 5 127.082360786929 2 6 60.00008618864044 -1 0.06521739130435 -0.5 -0.5 -1359.3488213289045 1
i 6 127.16238746248752 2 8.5 79.70752960605313 -1 -0.10869565217391 -0.5 -0.5 -1737.1735144294948 1
i 2 127.24241413804603 2 10.91666666666667 64.99672396822604 -1 -0.23913043478261 -0.5 -0.5 -2166.1182612980683 1
i 6 127.32244081360456 2 6.08333333333333 65.98539873074014 -1 -0.06521739130435 -0.5 -0.5 -2650.9511307451357 1
i 5 127.40246748916307 2 10.41666666666667 72.45705889382317 -1 -0.23913043478261 -0.5 -0.5 -3196.5882784807295 1
i 4 127.48249416472159 2 8 61.95198161541765 -1 0.3695652173913 -0.5 -0.5 -3808.0588641631625 1
i 5 127.56252084028011 2 7 78.61188575457432 -1 -0.10869565217391 -0.5 -0.5 -4490.464834432824 1
i 2 127.64254751583863 2 11.08333333333333 66.50594721522414 -1 -0.10869565217391 -0.5 -0.5 -5248.9356701486695 1
i 6 127.72257419139714 2 6.25 62.61178427488487 -1 -0.41304347826087 -0.5 -0.5 -6088.578285501485 1
i 6 127.80260086695567 2 9.66666666666667 75.3485158076719 -1 0.02173913043478 -0.5 -0.5 -7014.422359524491 1
i 3 127.88262754251419 2 9.41666666666667 63.4958122545481 -1 -0.06521739130435 -0.5 -0.5 -8031.361475291844 1
i 5 127.96265421807271 2 7.25 74.8472600501062 -1 -0.19565217391304 -0.5 -0.5 -9144.090537084943 1
i 3 128.04268089363123 2 11 68.8388961131126 -1 -0.10869565217391 -0.5 -0.5 -10357.040029328087 1
i 5 128.12270756918974 2 6.66666666666667 60.29346789919128 -1 -0.02173913043478 -0.5 -0.5 -11674.307771324706 1
i 6 128.20273424474826 2 8.66666666666667 78.88872679249496 -1 -0.19565217391304 -0.5 -0.5 -13099.588906906745 1
i 2 128.2827609203068 2 10.41666666666667 64.67589929684071 -1 -0.15217391304348 -0.5 -0.5 -14636.104946228204 1
i 6 128.3627875958653 2 6.41666666666667 68.11935044355499 -1 -0.06521739130435 -0.5 -0.5 -16286.532746300252 1
i 5 128.44281427142383 2 10.75 71.6227886201147 -1 -0.15217391304348 -0.5 -0.5 -18052.93437572629 1
i 4 128.52284094698234 2 7.66666666666667 61.07824326377272 -1 -0.10869565217391 -0.5 -0.5 -19936.68885588275 1
i 5 128.60286762254086 2 7 79.55827169908636 -1 0.32608695652174 -0.5 -0.5 -21938.426804038118 1
i 2 128.6828942980994 2 11 65.88324223489504 -1 -0.06521739130435 -0.5 -0.5 -24057.969022345038 1
i 6 128.7629209736579 2 6.16666666666667 63.21226359020102 -1 0.19565217391304 -0.5 -0.5 -26294.27007925966 1
i 6 128.84294764921643 2 9.91666666666667 74.32465546087946 -1 -0.19565217391304 -0.5 -0.5 -28645.3679158905 1
i 3 128.92297432477494 2 8.91666666666667 63.20189760557156 -1 -0.19565217391304 -0.5 -0.5 -31108.34047859732 1
i 5 129.00300100033346 2 7.58333333333333 76.14600199003658 -1 0.06521739130435 -0.5 -0.5 -33679.27033057131 1
i 3 129.08302767589197 2 11 68.10807345236601 -1 -0.06521739130435 -0.5 -0.5 -36353.21812927404 1
i 6 129.1630543514505 2 6.58333333333333 61.0407870829722 -1 -0.32608695652174 -0.5 -0.5 -39124.20577376731 1
i 6 129.24308102700903 2 9 77.81695972349628 -1 -0.19565217391304 -0.5 -0.5 -41985.20992705739 1
i 2 129.32310770256754 2 10.08333333333333 64.32043645473433 -1 -0.15217391304348 -0.5 -0.5 -44928.16650438386 1
i 5 129.40313437812605 2 6.66666666666667 70.45731990607979 -1 -0.06521739130435 -0.5 -0.5 -47943.986590498156 1
i 4 129.48316105368457 2 10.83333333333333 70.73070250271167 -1 0.10869565217391 -0.5 -0.5 -51022.58410884894 1
i 5 129.5631877292431 2 7.33333333333333 60.35617412848082 -1 -0.19565217391304 -0.5 -0.5 -54152.91541520271 1
i 5 129.64321440480163 2 8.25 79.98938210666707 -1 -0.06521739130435 -0.5 -0.5 -57323.03082978761 1
i 2 129.72324108036014 2 10.91666666666667 65.41018163192007 -1 0.02173913043478 -0.5 -0.5 -60520.13795771496 1
i 6 129.80326775591865 2 6.08333333333333 64.17657311521764 -1 -0.23913043478261 -0.5 -0.5 -63730.676479997426 1
i 6 129.88329443147717 2 10.16666666666667 73.41124432564919 -1 0.02173913043478 -0.5 -0.5 -66940.4039292999 1
i 4 129.96332110703568 2 8.75 62.7732885405667 -1 0.02173913043478 -0.5 -0.5 -70134.49179866847 1
i 5 130.04334778259422 2 7.75 77.2923676131496 -1 -0.10869565217391 -0.5 -0.5 -73297.63117030407 1
i 3 130.12337445815274 2 10.91666666666667 67.35902036534415 -1 -0.06521739130435 -0.5 -0.5 -76414.14689806916 1
i 6 130.20340113371125 2 6.41666666666667 61.87003040267744 -1 0.23913043478261 -0.5 -0.5 -79468.11923422066 1
i 6 130.28342780926977 2 9.41666666666667 76.65056673389215 -1 0.06521739130435 -0.5 -0.5 -82443.51166058242 1
i 3 130.36345448482828 2 9.66666666666667 63.91262295219839 -1 -0.02173913043478 -0.5 -0.5 -85324.30356931752 1
i 5 130.44348116038682 2 6.91666666666667 72.74599813248174 -1 -0.19565217391304 -0.5 -0.5 -88094.62634081297 1
i 4 130.52350783594534 2 10 69.79866847281608 -1 -0.10869565217391 -0.5 -0.5 -90738.9012878951 1
i 5 130.60353451150385 2 6.91666666666667 60.00669507794832 -1 -0.02173913043478 -0.5 -0.5 -93241.97787818253 1
i 6 130.68356118706237 2 8.33333333333333 79.7814993680825 -1 -0.15217391304348 -0.5 -0.5 -95589.270611244 1
i 2 130.76358786262088 2 10.83333333333333 65.04043290528499 -1 -0.15217391304348 -0.5 -0.5 -97766.89291520076 1
i 6 130.84361453817942 2 6.08333333333333 65.73514380750566 -1 0.02173913043478 -0.5 -0.5 -99761.78643911668 1
i 5 130.92364121373794 2 10.5 72.56596064199145 -1 -0.15217391304348 -0.5 -0.5 -101561.84415297834 1
i 4 131.00366788929645 2 8.16666666666667 62.06368356750589 -1 0.19565217391304 -0.5 -0.5 -103156.02572624183 1
i 5 131.08369456485497 2 7.91666666666667 78.46307742924495 -1 -0.23913043478261 -0.5 -0.5 -104534.46373788381 1
i 2 131.16372124041348 2 11.08333333333333 66.59988852549499 -1 -0.19565217391304 -0.5 -0.5 -105688.55937486228 1
i 6 131.24374791597202 2 6.25 62.53685957226985 -1 -0.06521739130435 -0.5 -0.5 -106611.06640025185 1
i 6 131.32377459153054 2 9.66666666666667 75.49390292974049 -1 0.10869565217391 -0.5 -0.5 -107296.16231535171 1
i 3 131.40380126708905 2 9.33333333333333 63.53758296994785 -1 -0.06521739130435 -0.5 -0.5 -107739.50579971471 1
i 5 131.48382794264757 2 7.16666666666667 74.64143819857492 -1 -0.19565217391304 -0.5 -0.5 -107938.27968678417 1
i 3 131.56385461820608 2 11 68.94148597416361 -1 0.41304347826087 -0.5 -0.5 -107891.21891815594 1
i 5 131.6438812937646 2 6.83333333333333 60.22171815457912 -1 -0.19565217391304 -0.5 -0.5 -107598.62311341692 1
i 6 131.72390796932314 2 8.75 79.01691697845969 -1 -0.02173913043478 -0.5 -0.5 -107062.35359213014 1
i 2 131.80393464488165 2 10.5 64.71886965610024 -1 -0.19565217391304 -0.5 -0.5 -106285.81488670177 1
i 6 131.88396132044016 2 6.33333333333333 67.81963750146458 -1 -0.15217391304348 -0.5 -0.5 -105273.92098640522 1
i 5 131.96398799599868 2 10.75 71.73547424110001 -1 -0.10869565217391 -0.5 -0.5 -104033.04675067148 1
i 4 132.0440146715572 2 7 61.19043756374677 -1 -0.28260869565217 -0.5 -0.5 -102570.96512071777 1
i 5 132.12404134711574 2 7.91666666666667 79.45797070144394 -1 -0.15217391304348 -0.5 -0.5 -100896.77093982299 1
i 2 132.20406802267425 2 11 65.95612490528264 -1 -0.15217391304348 -0.5 -0.5 -99020.79236121546 1
i 6 132.28409469823276 2 6.33333333333333 63.12046503033467 -1 -0.02173913043478 -0.5 -0.5 -96954.4909760596 1
i 6 132.36412137379128 2 9 74.45252748280686 -1 0.15217391304348 -0.5 -0.5 -94710.3519302064 1
i 3 132.4441480493498 2 8.91666666666667 63.24306429195107 -1 -0.28260869565217 -0.5 -0.5 -92301.76541506477 1
i 5 132.5241747249083 2 7.41666666666667 75.9918154924736 -1 0.10869565217391 -0.5 -0.5 -89742.9010136865 1
i 3 132.60420140046685 2 11.08333333333333 68.20329404043687 -1 0.06521739130435 -0.5 -0.5 -87048.57645646673 1
i 6 132.68422807602536 2 6.66666666666667 60.92954980301697 -1 0.15217391304348 -0.5 -0.5 -84234.12239106238 1
i 6 132.76425475158388 2 8.91666666666667 77.96591019520046 -1 -0.10869565217391 -0.5 -0.5 -81315.2447974398 1
i 2 132.8442814271424 2 10.08333333333333 64.37101740954947 -1 -0.06521739130435 -0.5 -0.5 -78307.88668163918 1
i 5 132.9243081027009 2 6.5 70.14566659711757 -1 -0.19565217391304 -0.5 -0.5 -75228.09066078658 1
i 4 133.00433477825945 2 10.91666666666667 70.85235711742058 -1 0.06521739130435 -0.5 -0.5 -72091.86400815402 1
i 5 133.08436145381796 2 7.5 60.43480998035221 -1 0.19565217391304 -0.5 -0.5 -68915.04766150888 1
i 5 133.16438812937648 2 8 79.96809693278927 -1 -0.15217391304348 -0.5 -0.5 -65713.1906120031 1
i 2 133.244414804935 2 10 65.46572845938941 -1 -0.28260869565217 -0.5 -0.5 -62501.43098642509 1
i 6 133.3244414804935 2 6.16666666666667 64.01718905412775 -1 -0.41304347826087 -0.5 -0.5 -59294.38501435552 1
i 6 133.40446815605205 2 10.16666666666667 73.52720990654123 -1 0.02173913043478 -0.5 -0.5 -56106.044936380946 1
i 4 133.48449483161056 2 8.5 62.84514945679513 -1 -0.23913043478261 -0.5 -0.5 -52949.68676201436 1
i 5 133.56452150716908 2 7.58333333333333 77.13901670968887 -1 -0.15217391304348 -0.5 -0.5 -49837.78862936 1
i 3 133.6445481827276 2 10 67.46082638892551 -1 -0.19565217391304 -0.5 -0.5 -46781.96035520335 1
i 6 133.7245748582861 2 6.66666666666667 61.76686762069183 -1 -0.15217391304348 -0.5 -0.5 -43792.88459716104 1
i 6 133.80460153384465 2 9.25 76.8068006855205 -1 0.02173913043478 -0.5 -0.5 -40880.26988125128 1
i 3 133.88462820940316 2 9.83333333333333 63.9673276672661 -1 -0.10869565217391 -0.5 -0.5 -38052.815581748306 1
i 5 133.96465488496167 2 6.91666666666667 72.45776550775305 -1 -0.28260869565217 -0.5 -0.5 -35318.18877777561 1
i 4 134.0446815605202 2 10.91666666666667 69.92047300350377 -1 -0.19565217391304 -0.5 -0.5 -32683.01275548871 1
i 5 134.1247082360787 2 7 60.02357391770022 -1 -0.19565217391304 -0.5 -0.5 -30152.866777981082 1
i 5 134.20473491163722 2 8.33333333333333 79.84535187769181 -1 0.06521739130435 -0.5 -0.5 -27732.296609398585 1
i 2 134.28476158719576 2 10.75 65.08504418404854 -1 -0.06521739130435 -0.5 -0.5 -25424.835156931593 1
i 6 134.36478826275427 2 6.08333333333333 65.49448027647516 -1 0.19565217391304 -0.5 -0.5 -23233.032485850435 1
i 5 134.4448149383128 2 10.41666666666667 72.67518074140517 -1 0.06521739130435 -0.5 -0.5 -21158.49436989303 1
i 4 134.5248416138713 2 8.16666666666667 62.17222448609965 -1 -0.19565217391304 -0.5 -0.5 -19201.92846291079 1
i 5 134.60486828942982 2 7.75 78.3113859710584 -1 -0.15217391304348 -0.5 -0.5 -17363.197118384593 1
i 2 134.68489496498836 2 11.16666666666667 66.69604104414053 -1 -0.06521739130435 -0.5 -0.5 -15641.37584151433 1
i 6 134.76492164054687 2 6.33333333333333 62.45981393956202 -1 -0.32608695652174 -0.5 -0.5 -14034.816333989402 1
i 6 134.8449483161054 2 9.66666666666667 75.64153135609295 -1 0.23913043478261 -0.5 -0.5 -12541.213083977162 1
i 3 134.9249749916639 2 9.33333333333333 63.58126638443292 -1 -0.06521739130435 -0.5 -0.5 -11157.67246261349 1
i 5 135.00500166722242 2 7.08333333333333 74.4250246452051 -1 -0.06521739130435 -0.5 -0.5 -9880.783312560176 1
i 3 135.08502834278093 2 11 69.04654622300367 -1 0.02173913043478 -0.5 -0.5 -8706.688052741514 1
i 5 135.16505501833947 2 6.83333333333333 60.15913473531191 -1 -0.23913043478261 -0.5 -0.5 -7631.1533750040935 1
i 6 135.245081693898 2 8.58333333333333 79.14038130501068 -1 -0.15217391304348 -0.5 -0.5 -6649.639671483348 1
i 2 135.3251083694565 2 10.5 64.76130822890832 -1 0.02173913043478 -0.5 -0.5 -5757.368404410582 1
i 6 135.40513504501502 2 6.33333333333333 67.52392015535206 -1 -0.28260869565217 -0.5 -0.5 -4949.386711070482 1
i 5 135.48516172057353 2 10 71.84712044996759 -1 0.06521739130435 -0.5 -0.5 -4220.628623913952 1
i 4 135.56518839613207 2 7.83333333333333 61.30489542320463 -1 -0.19565217391304 -0.5 -0.5 -3565.9723775080524 1
i 5 135.6452150716906 2 7.91666666666667 79.34887170738062 -1 -0.06521739130435 -0.5 -0.5 -2980.293368322244 1
i 2 135.7252417472491 2 11 66.03180777251461 -1 0.10869565217391 -0.5 -0.5 -2458.512428442469 1
i 6 135.80526842280761 2 6.16666666666667 63.03448692131293 -1 -0.15217391304348 -0.5 -0.5 -1995.6391685320643 1
i 6 135.88529509836613 2 9.83333333333333 74.58246194085865 -1 0.06521739130435 -0.5 -0.5 -1586.8102370777342 1
i 3 135.96532177392467 2 8 63.28234829019671 -1 -0.32608695652174 -0.5 -0.5 -1227.3224307365185 1
i 5 136.04534844948319 2 7.33333333333333 75.83445764455914 -1 0.10869565217391 -0.5 -0.5 -912.660673121155 1
i 3 136.1253751250417 2 11 68.29818236317342 -1 -0.19565217391304 -0.5 -0.5 -638.52095548915 1
i 5 136.2054018006002 2 6.58333333333333 60.82031846020458 -1 0.06521739130435 -0.5 -0.5 -400.8284016214554 1
i 6 136.28542847615873 2 8 78.11307823350135 -1 -0.28260869565217 -0.5 -0.5 -195.75067991222323 1
i 2 136.36545515171727 2 10.16666666666667 64.4204555616934 -1 0.02173913043478 -0.5 -0.5 -19.70703783647665 1
i 5 136.44548182727578 2 6.58333333333333 69.83397882180114 -1 0.02173913043478 -0.5 -0.5 130.62672284499845 1
i 4 136.5255085028343 2 10 70.9729815667654 -1 0.10869565217391 -0.5 -0.5 258.31697766799044 1
i 5 136.6055351783928 2 7.41666666666667 60.51938496011243 -1 -0.3695652173913 -0.5 -0.5 366.17434027642406 1
i 5 136.68556185395133 2 8.25 79.9355511567259 -1 -0.15217391304348 -0.5 -0.5 456.75865863342227 1
i 2 136.76558852950984 2 10 65.52316846319286 -1 -0.15217391304348 -0.5 -0.5 532.3865449403534 1
i 6 136.84561520506838 2 6 63.86833360355192 -1 0.06521739130435 -0.5 -0.5 595.1410376059888 1
i 6 136.9256418806269 2 10.08333333333333 73.64444182708417 -1 -0.15217391304348 -0.5 -0.5 646.883000866939 1
i 4 137.0056685561854 2 8.58333333333333 62.91182065062841 -1 -0.32608695652174 -0.5 -0.5 689.2638814036069 1
i 5 137.08569523174393 2 7.58333333333333 76.98671921231923 -1 -0.28260869565217 -0.5 -0.5 723.7394606780923 1
i 3 137.16572190730244 2 10 67.5619878638855 -1 -0.02173913043478 -0.5 -0.5 751.5842658656413 1
i 6 137.24574858286098 2 6.66666666666667 61.66082134290525 -1 -0.41304347826087 -0.5 -0.5 773.9063302318141 1
i 6 137.3257752584195 2 9.25 76.96283849204978 -1 -0.32608695652174 -0.5 -0.5 791.6620247046977 1
i 3 137.405801933978 2 9.75 64.02227035401762 -1 -0.23913043478261 -0.5 -0.5 805.6707152872069 1
i 5 137.48582860953653 2 6.75 72.16349087673305 -1 -0.28260869565217 -0.5 -0.5 816.6290349716581 1
i 4 137.56585528509504 2 10 70.04330566609114 -1 0.19565217391304 -0.5 -0.5 825.1245931281888 1
i 5 137.64588196065355 2 7 60.05031427013081 -1 -0.02173913043478 -0.5 -0.5 831.6489791771693 1
i 5 137.7259086362121 2 8.5 79.89861197949384 -1 0.10869565217391 -0.5 -0.5 836.6099500418919 1
i 2 137.8059353117706 2 10.75 65.13071179196808 -1 -0.23913043478261 -0.5 -0.5 840.3427218174805 1
i 6 137.88596198732913 2 6.08333333333333 65.26390566861281 -1 -0.23913043478261 -0.5 -0.5 843.1203147889672 1
i 5 137.96598866288764 2 10.5 72.7848944922997 -1 0.06521739130435 -0.5 -0.5 845.1629269897335 1
i 4 138.04601533844615 2 8.16666666666667 62.27700278035627 -1 -0.10869565217391 -0.5 -0.5 846.646334618149 1
i 5 138.1260420140047 2 7.75 78.1576129746972 -1 -0.28260869565217 -0.5 -0.5 847.7093376324993 1
i 2 138.2060686895632 2 10 66.79410584698859 -1 0.06521739130435 -0.5 -0.5 848.4602856272754 1
i 6 138.28609536512172 2 6.33333333333333 62.3799800572905 -1 -0.15217391304348 -0.5 -0.5 848.9827326533889 1
i 6 138.36612204068024 2 9.5 75.79122414126992 -1 -0.02173913043478 -0.5 -0.5 849.3402800596381 1
i 3 138.44614871623875 2 9.33333333333333 63.62695708347717 -1 -0.15217391304348 -0.5 -0.5 849.5806738548202 1
i 5 138.5261753917973 2 7.08333333333333 74.19776327356993 -1 -0.15217391304348 -0.5 -0.5 849.73922773327 1
i 3 138.6062020673558 2 11.08333333333333 69.15421456211928 -1 -0.23913043478261 -0.5 -0.5 849.8416450357631 1
i 5 138.68622874291432 2 6.75 60.10636861932305 -1 0.19565217391304 -0.5 -0.5 849.9063128347997 1
i 6 138.76625541847284 2 8.5 79.25841737051404 -1 -0.28260869565217 -0.5 -0.5 849.9461393659466 1
i 2 138.84628209403135 2 10.5 64.80339382960621 -1 -0.10869565217391 -0.5 -0.5 849.9700025158805 1
i 6 138.9263087695899 2 6.33333333333333 67.2329403557482 -1 -0.10869565217391 -0.5 -0.5 849.9838723654132 1
i 5 139.0063354451484 2 10.66666666666667 71.95785281593889 -1 -0.32608695652174 -0.5 -0.5 849.9916652052689 1
i 4 139.08636212070692 2 7 61.4209735199284 -1 0.06521739130435 -0.5 -0.5 849.9958803083811 1
i 5 139.16638879626544 2 7 79.23158057339829 -1 0.10869565217391 -0.5 -0.5 849.9980643429092 1
i 2 139.24641547182395 2 11.08333333333333 66.11036484675479 -1 0.10869565217391 -0.5 -0.5 849.9991418998883 1
i 6 139.32644214738247 2 6.08333333333333 62.95329574287602 -1 -0.19565217391304 -0.5 -0.5 849.9996444052474 1
i 6 139.406468822941 2 9 74.71457800851663 -1 -0.3695652173913 -0.5 -0.5 849.999863863712 1
i 3 139.48649549849952 2 9.08333333333333 63.32039824144218 -1 -0.10869565217391 -0.5 -0.5 849.999952575322 1
i 5 139.56652217405804 2 7.33333333333333 75.67281625046883 -1 -0.06521739130435 -0.5 -0.5 849.999985265376 1
i 3 139.64654884961655 2 11.08333333333333 68.39309652239729 -1 0.06521739130435 -0.5 -0.5 849.9999960268647 1
i 5 139.72657552517506 2 6.66666666666667 60.71402569708894 -1 -0.23913043478261 -0.5 -0.5 849.9999991052716 1
i 6 139.8066022007336 2 8 78.25826451163155 -1 -0.02173913043478 -0.5 -0.5 849.9999998410025 1
i 2 139.88662887629212 2 10.33333333333333 64.46873462762461 -1 0.15217391304348 -0.5 -0.5 849.9999999795965 1
i 5 139.96665555185064 2 6.5 69.52275666042993 -1 -0.06521739130435 -0.5 -0.5 849.9999999983736 1
i 4 140.04668222740915 2 10.75 71.09246262741061 -1 -0.15217391304348 -0.5 -0.5 849.9999999999396 1
i 5 140.12670890296766 2 7.5 60.6094358068444 -1 0.06521739130435 -0.5 -0.5 849.9999999999994 1
i 5 140.20673557852618 2 8.08333333333333 79.8919193055034 -1 0.19565217391304 -0.5 -0.5 850 1
i 2 140.28676225408472 2 10 65.58261166359387 -1 -0.06521739130435 -0.5 -0.5 850 1
i 6 140.36678892964323 2 6.08333333333333 63.72968084824952 -1 0.10869565217391 -0.5 -0.5 850 1
i 6 140.44681560520175 2 10.08333333333333 73.76301532140555 -1 -0.15217391304348 -0.5 -0.5 850.0000000000025 1
i 4 140.52684228076026 2 8.66666666666667 62.97351177125366 -1 -0.10869565217391 -0.5 -0.5 850.0000000001655 1
i 5 140.60686895631878 2 7.5 76.83538515398004 -1 -0.28260869565217 -0.5 -0.5 850.0000000034614 1
i 3 140.68689563187732 2 10 67.66230200987812 -1 -0.02173913043478 -0.5 -0.5 850.0000000373178 1
i 6 140.76692230743583 2 6.5 61.55233024380404 -1 -0.23913043478261 -0.5 -0.5 850.0000002628559 1
i 6 140.84694898299435 2 9.33333333333333 77.11840011413791 -1 -0.19565217391304 -0.5 -0.5 850.0000013761095 1
i 3 140.92697565855286 2 9 64.07714653476792 -1 -0.28260869565217 -0.5 -0.5 850.0000057882995 1
i 5 141.00700233411138 2 6.75 71.86418165341489 -1 -0.02173913043478 -0.5 -0.5 850.000020579076 1
i 4 141.08702900966992 2 10 70.16680353226381 -1 0.19565217391304 -0.5 -0.5 850.0000640337906 1
i 5 141.16705568522843 2 7.08333333333333 60.08644004940264 -1 -0.19565217391304 -0.5 -0.5 850.0001787928496 1
i 5 141.24708236078695 2 8.33333333333333 79.94090705442622 -1 -0.15217391304348 -0.5 -0.5 850.0004563445929 1
i 2 141.32710903634546 2 10 65.17757391321945 -1 -0.06521739130435 -0.5 -0.5 850.0010798599599 1
i 6 141.40713571190398 2 6.08333333333333 65.04381249566588 -1 -0.02173913043478 -0.5 -0.5 850.002395258275 1
i 6 141.48716238746252 2 10.33333333333333 72.89525730619224 -1 -0.32608695652174 -0.5 -0.5 850.0050239470048 1
i 4 141.56718906302103 2 8.33333333333333 62.37750327910668 -1 -0.02173913043478 -0.5 -0.5 850.0100349038995 1
i 5 141.64721573857955 2 7.75 78.00249748222564 -1 -0.15217391304348 -0.5 -0.5 850.01919864341 1
i 2 141.72724241413806 2 10 66.89374635531706 -1 -0.28260869565217 -0.5 -0.5 850.0353510685832 1
i 6 141.80726908969658 2 6.33333333333333 62.29686262010631 -1 0.15217391304348 -0.5 -0.5 850.0629011519436 1
i 6 141.8872957652551 2 9.5 75.9427536082024 -1 0.02173913043478 -0.5 -0.5 850.1085226689871 1
i 3 141.96732244081363 2 9.5 63.6746343754478 -1 0.02173913043478 -0.5 -0.5 850.182076638542 1
i 5 142.04734911637215 2 7.08333333333333 73.9596638838332 -1 0.06521739130435 -0.5 -0.5 850.2978174777351 1
i 3 142.12737579193066 2 11.08333333333333 69.26452807598064 -1 -0.02173913043478 -0.5 -0.5 850.4759418911312 1
i 5 142.20740246748917 2 6 60.06391971975104 -1 0.23913043478261 -0.5 -0.5 850.7445448878262 1
i 6 142.2874291430477 2 8.5 79.3702724933311 -1 -0.02173913043478 -0.5 -0.5 851.1420517362455 1
i 2 142.36745581860623 2 10.66666666666667 64.84531790783325 -1 0.02173913043478 -0.5 -0.5 851.7201977873985 1
i 6 142.44748249416475 2 6.16666666666667 66.94748445340511 -1 -0.15217391304348 -0.5 -0.5 852.5476295804085 1
i 5 142.52750916972326 2 10.5 72.06782277643427 -1 -0.06521739130435 -0.5 -0.5 853.7142001508689 1
i 4 142.60753584528177 2 7 61.53797670681621 -1 -0.15217391304348 -0.5 -0.5 855.3360286711629 1
i 5 142.6875625208403 2 7 79.10678326144418 -1 -0.02173913043478 -0.5 -0.5 857.5613891692443 1
i 2 142.7675891963988 2 11 66.1918349625947 -1 -0.23913043478261 -0.5 -0.5 860.5774848467059 1
i 6 142.84761587195734 2 6 62.87578619124463 -1 -0.02173913043478 -0.5 -0.5 864.6181532501514 1
i 6 142.92764254751586 2 9.75 74.84898175978859 -1 0.02173913043478 -0.5 -0.5 869.9725331089373 1
i 3 143.00766922307437 2 9 63.35786486363332 -1 -0.02173913043478 -0.5 -0.5 876.9947059805052 1
i 5 143.0876958986329 2 7.33333333333333 75.5057192573061 -1 -0.10869565217391 -0.5 -0.5 886.1143049699426 1
i 3 143.1677225741914 2 11.08333333333333 68.48844225479074 -1 -0.10869565217391 -0.5 -0.5 897.8480588348286 1
i 5 143.24774924974994 2 6.66666666666667 60.61165560057854 -1 0.06521739130435 -0.5 -0.5 912.8122129692123 1
i 6 143.32777592530846 2 8 78.40123540192857 -1 0.06521739130435 -0.5 -0.5 931.7357394035078 1
i 2 143.40780260086697 2 10.25 64.51587242082822 -1 0.10869565217391 -0.5 -0.5 955.4742164838154 1
i 5 143.4878292764255 2 6.5 69.21246845032411 -1 -0.02173913043478 -0.5 -0.5 985.0242258280839 1
i 5 143.567855951984 2 10.75 71.21072532137094 -1 -0.02173913043478 -0.5 -0.5 1021.5380801171221 1
i 5 143.64788262754254 2 7.83333333333333 60.70451521233284 -1 -0.06521739130435 -0.5 -0.5 1066.3386609701024 1
i 5 143.72790930310106 2 8 79.83741300738512 -1 -0.15217391304348 -0.5 -0.5 1120.9341123607771 1
i 2 143.80793597865957 2 10 65.64417590632598 -1 -0.15217391304348 -0.5 -0.5 1187.0321025938554 1
i 6 143.8879626542181 2 6 63.6008227078254 -1 0.02173913043478 -0.5 -0.5 1266.5533376748199 1
i 6 143.9679893297766 2 10.08333333333333 73.88301395254464 -1 -0.02173913043478 -0.5 -0.5 1361.6439818857423 1
i 4 144.04801600533514 2 8.66666666666667 63.03051085224926 -1 -0.10869565217391 -0.5 -0.5 1474.686618455696 1
i 5 144.12804268089366 2 7.5 76.68478702894107 -1 0.28260869565217 -0.5 -0.5 1608.3093652918078 1
i 3 144.20806935645217 2 11 67.76163192287552 -1 -0.02173913043478 -0.5 -0.5 1765.3927487005255 1
i 6 144.28809603201069 2 6.58333333333333 61.44189500625917 -1 -0.10869565217391 -0.5 -0.5 1949.073932678543 1
i 6 144.3681227075692 2 9.08333333333333 77.27323304140467 -1 0.02173913043478 -0.5 -0.5 2162.7479034345674 1
i 3 144.4481493831277 2 9.91666666666667 64.1316821867053 -1 -0.15217391304348 -0.5 -0.5 2410.0652189243665 1
i 5 144.52817605868626 2 6.75 71.56080636951194 -1 -0.06521739130435 -0.5 -0.5 2694.925951844743 1
i 4 144.60820273424477 2 10.91666666666667 70.29061744373575 -1 -0.06521739130435 -0.5 -0.5 3021.469482082837 1
i 5 144.68822940980328 2 7.08333333333333 60.13143085029668 -1 -0.02173913043478 -0.5 -0.5 3394.0598312286597 1
i 5 144.7682560853618 2 8.25 79.97196693178232 -1 0.06521739130435 -0.5 -0.5 3817.266277436571 1
i 2 144.8482827609203 2 10 65.2257544782502 -1 -0.15217391304348 -0.5 -0.5 4295.83904346497 1
i 6 144.92830943647886 2 6.16666666666667 64.83448446383596 -1 -0.23913043478261 -0.5 -0.5 4834.67991375229 1
i 6 145.00833611203737 2 10.5 73.00640372032822 -1 0.02173913043478 -0.5 -0.5 5438.80770728702 1
i 4 145.08836278759588 2 8.41666666666667 62.47330777433598 -1 -0.15217391304348 -0.5 -0.5 6113.3186110300785 1
i 5 145.1683894631544 2 7.75 77.84669878389676 -1 -0.02173913043478 -0.5 -0.5 6863.341462718999 1
i 2 145.2484161387129 2 10.91666666666667 66.99460065914687 -1 0.15217391304348 -0.5 -0.5 7693.9881608939195 1
i 6 145.32844281427143 2 6.41666666666667 62.21013878169452 -1 0.19565217391304 -0.5 -0.5 8610.299472543464 1
i 6 145.40846948982997 2 9.58333333333333 76.09584990297559 -1 0.15217391304348 -0.5 -0.5 9617.186603385755 1
i 3 145.48849616538848 2 9.41666666666667 63.72417577899198 -1 -0.19565217391304 -0.5 -0.5 10719.368990877572 1
i 5 145.568522840947 2 6.91666666666667 73.71099084875871 -1 -0.19565217391304 -0.5 -0.5 11921.308873786029 1
i 3 145.6485495165055 2 11.08333333333333 69.37742599096543 -1 -0.10869565217391 -0.5 -0.5 13227.14328284545 1
i 5 145.72857619206403 2 6.91666666666667 60.03212605823946 -1 0.19565217391304 -0.5 -0.5 14640.614182729167 1
i 6 145.80860286762257 2 8.66666666666667 79.4751681837038 -1 -0.15217391304348 -0.5 -0.5 16164.997574556783 1
i 2 145.88862954318108 2 10.58333333333333 64.8872797995741 -1 -0.32608695652174 -0.5 -0.5 17803.032438501374 1
i 6 145.9686562187396 2 6.25 66.66835963977906 -1 -0.19565217391304 -0.5 -0.5 19556.850456192704 1
i 5 146.0486828942981 2 10.58333333333333 72.17720473355187 -1 0.06521739130435 -0.5 -0.5 21427.907500712903 1
i 4 146.12870956985662 2 7.91666666666667 61.65516916749186 -1 -0.10869565217391 -0.5 -0.5 23416.917916809 1
i 5 146.20873624541517 2 7 78.9752368873279 -1 0.32608695652174 -0.5 -0.5 25523.792634009504 1
i 2 146.28876292097368 2 11.08333333333333 66.27621400172498 -1 0.23913043478261 -0.5 -0.5 27747.5821596827 1
i 6 146.3687895965322 2 6.16666666666667 62.80081114955225 -1 -0.10869565217391 -0.5 -0.5 30086.425486911758 1
i 6 146.4488162720907 2 9.75 74.98575796508963 -1 -0.15217391304348 -0.5 -0.5 32537.505922659333 1
i 3 146.52884294764922 2 9 63.39537528200586 -1 -0.19565217391304 -0.5 -0.5 35097.0147950777 1
i 5 146.60886962320777 2 7.25 75.33198351701071 -1 0.02173913043478 -0.5 -0.5 37760.1239347115 1
i 3 146.68889629876628 2 11.08333333333333 68.58465198479512 -1 0.02173913043478 -0.5 -0.5 40520.96774340071 1
i 5 146.7689229743248 2 6.66666666666667 60.51422312205625 -1 -0.10869565217391 -0.5 -0.5 43372.63556738643 1
i 6 146.8489496498833 2 8.83333333333333 78.54170847255399 -1 0.06521739130435 -0.5 -0.5 46307.17497858044 1
i 2 146.92897632544182 2 10.33333333333333 64.56191846267014 -1 -0.23913043478261 -0.5 -0.5 49315.60644142136 1
i 5 147.00900300100034 2 6.41666666666667 68.90357375754004 -1 -0.02173913043478 -0.5 -0.5 52387.949703888524 1
i 5 147.08902967655888 2 10.91666666666667 71.3277308181653 -1 -0.15217391304348 -0.5 -0.5 55513.2621018686 1
i 4 147.1690563521174 2 7.5 60.80418195274896 -1 -0.19565217391304 -0.5 -0.5 58679.6888083062 1
i 5 147.2490830276759 2 8.08333333333333 79.7722814754913 -1 -0.10869565217391 -0.5 -0.5 61874.52489489964 1
i 2 147.32910970323442 2 11 65.7079865004682 -1 -0.02173913043478 -0.5 -0.5 65084.288906695925 1
i 6 147.40913637879294 2 6 63.48126564787016 -1 0.02173913043478 -0.5 -0.5 68294.80748189783 1
i 6 147.48916305435148 2 10.16666666666667 74.00453221969448 -1 -0.10869565217391 -0.5 -0.5 71491.310382736 1
i 3 147.56918972991 2 8.75 63.08317999939307 -1 -0.06521739130435 -0.5 -0.5 74658.53514161073 1
i 5 147.6492164054685 2 7.5 76.53455399576677 -1 -0.06521739130435 -0.5 -0.5 77780.8403722342 1
i 3 147.72924308102702 2 11 67.85991375186659 -1 0.15217391304348 -0.5 -0.5 80842.32665114671 1
i 6 147.80926975658554 2 6.58333333333333 61.3300752257565 -1 -0.32608695652174 -0.5 -0.5 83826.9637431646 1
i 6 147.88929643214405 2 9.16666666666667 77.42711274180138 -1 -0.10869565217391 -0.5 -0.5 86718.72282754371 1
i 3 147.9693231077026 2 9.91666666666667 64.18564027634189 -1 -0.02173913043478 -0.5 -0.5 89501.71228199713 1
i 5 148.0493497832611 2 6.91666666666667 71.25427017910343 -1 -0.15217391304348 -0.5 -0.5 92160.31550121434 1
i 4 148.12937645881962 2 10 70.41442287674012 -1 0.06521739130435 -0.5 -0.5 94679.32916688669 1
i 5 148.20940313437814 2 7.25 60.18474325125034 -1 -0.23913043478261 -0.5 -0.5 97044.10034853633 1
i 5 148.28942980993665 2 8.5 79.99161836962375 -1 -0.02173913043478 -0.5 -0.5 99240.66080000829 1
i 2 148.3694564854952 2 10.91666666666667 65.27536582735095 -1 -0.32608695652174 -0.5 -0.5 101255.8568255036 1
i 6 148.4494831610537 2 6.08333333333333 64.63609743161389 -1 -0.10869565217391 -0.5 -0.5 103077.47312204078 1
i 6 148.52950983661222 2 10.25 73.11844845271506 -1 -0.28260869565217 -0.5 -0.5 104694.34906178596 1
i 4 148.60953651217073 2 8.58333333333333 62.56410056926318 -1 -0.10869565217391 -0.5 -0.5 106096.48595730378 1
i 5 148.68956318772925 2 7.66666666666667 77.69078279785758 -1 -0.10869565217391 -0.5 -0.5 107275.14395439441 1
i 2 148.7695898632878 2 10 67.09629512425248 -1 -0.10869565217391 -0.5 -0.5 108222.92731944633 1
i 6 148.8496165388463 2 6.41666666666667 62.11964946274014 -1 -0.15217391304348 -0.5 -0.5 108933.85702935193 1
i 6 148.92964321440482 2 9.41666666666667 76.2502117936708 -1 -0.10869565217391 -0.5 -0.5 109403.42972997764 1
i 3 149.00966988996333 2 9.5 63.77537548302043 -1 -0.19565217391304 -0.5 -0.5 109628.66230155551 1
i 5 149.08969656552185 2 6.91666666666667 73.45223719550162 -1 0.06521739130435 -0.5 -0.5 109608.12145355143 1
i 3 149.1697232410804 2 11 69.4927583817115 -1 -0.06521739130435 -0.5 -0.5 109341.93796472912 1
i 5 149.2497499166389 2 6.91666666666667 60.01116177951013 -1 -0.19565217391304 -0.5 -0.5 108831.80538328023 1
i 6 149.32977659219742 2 8.5 79.57232725937588 -1 0.06521739130435 -0.5 -0.5 108080.96320392142 1
i 2 149.40980326775593 2 10.75 64.92948136511288 -1 -0.15217391304348 -0.5 -0.5 107094.16474064381 1
i 6 149.48982994331445 2 6.16666666666667 66.39636772975186 -1 -0.32608695652174 -0.5 -0.5 105877.6301121472 1
i 5 149.56985661887296 2 10.91666666666667 72.28619091051215 -1 -0.23913043478261 -0.5 -0.5 104438.98494888058 1
i 4 149.6498832944315 2 8.16666666666667 61.77179104944909 -1 -0.06521739130435 -0.5 -0.5 102787.18561299707 1
i 5 149.72990996999002 2 7.91666666666667 78.83775482983165 -1 -0.02173913043478 -0.5 -0.5 100932.43189268865 1
i 2 149.80993664554853 2 11.08333333333333 66.36344827487822 -1 -0.06521739130435 -0.5 -0.5 98886.06828765014 1
i 6 149.88996332110705 2 6.25 62.7272199427407 -1 0.02173913043478 -0.5 -0.5 96660.475140524 1
i 6 149.96998999666556 2 9 75.1249608537056 -1 -0.19565217391304 -0.5 -0.5 94268.95098812685 1
i 3 150.0500166722241 2 9.16666666666667 63.43350567712979 -1 0.02173913043478 -0.5 -0.5 91725.58760423103 1
i 5 150.13004334778262 2 7.25 75.15047171955096 -1 0.02173913043478 -0.5 -0.5 89045.13928157139 1
i 3 150.21007002334113 2 11 68.68215981513904 -1 0.02173913043478 -0.5 -0.5 86242.88795331672 1
i 5 150.29009669889965 2 6.66666666666667 60.42274778444987 -1 0.06521739130435 -0.5 -0.5 83334.50578332758 1
i 6 150.37012337445816 2 8.91666666666667 78.67933825548374 -1 -0.06521739130435 -0.5 -0.5 80335.91685954016 1
i 2 150.45015005001667 2 10.41666666666667 64.60695151123029 -1 -0.19565217391304 -0.5 -0.5 77263.15960647141 1
i 6 150.53017672557522 2 6.41666666666667 68.59654815638365 -1 -0.02173913043478 -0.5 -0.5 74132.25149139069 1
i 5 150.61020340113373 2 10.66666666666667 71.44347387330227 -1 -0.10869565217391 -0.5 -0.5 70959.05753546563 1
i 4 150.69023007669225 2 7.58333333333333 60.90798774280296 -1 -0.06521739130435 -0.5 -0.5 67759.16405737541 1
i 5 150.77025675225076 2 8 79.69681643275662 -1 -0.19565217391304 -0.5 -0.5 64547.758974258795 1
i 2 150.85028342780927 2 11.08333333333333 65.77417386535853 -1 -0.19565217391304 -0.5 -0.5 61339.519865405375 1
i 6 150.93031010336782 2 6 63.3704256401292 -1 -0.15217391304348 -0.5 -0.5 58148.51086998769 1
i 6 151.01033677892633 2 10 74.12767617798433 -1 -0.23913043478261 -0.5 -0.5 54988.08934396573 1
i 3 151.09036345448484 2 8.75 63.13195110285096 -1 -0.15217391304348 -0.5 -0.5 51870.82304536689 1
i 5 151.17039013004336 2 7.41666666666667 76.38416769609961 -1 0.02173913043478 -0.5 -0.5 48808.41845454656 1
i 3 151.25041680560187 2 11 67.95716178608045 -1 -0.19565217391304 -0.5 -0.5 45811.66066911116 1
i 6 151.33044348116042 2 6.58333333333333 61.21749092448564 -1 -0.23913043478261 -0.5 -0.5 42890.36514503397 1
i 6 151.41047015671893 2 9.08333333333333 77.57983951369565 -1 -0.10869565217391 -0.5 -0.5 40053.34138857413 1
i 2 151.49049683227744 2 10 64.23882425623418 -1 -0.02173913043478 -0.5 -0.5 37308.36854070824 1
i 5 151.57052350783596 2 6.66666666666667 70.94540002225746 -1 -0.10869565217391 -0.5 -0.5 34662.18263932106 1
i 4 151.65055018339447 2 10.83333333333333 70.53792756746972 -1 -0.28260869565217 -0.5 -0.5 32120.475196577114 1
i 5 151.73057685895301 2 7.25 60.24582879559733 -1 -0.3695652173913 -0.5 -0.5 29687.902592043105 1
i 5 151.81060353451153 2 8.16666666666667 79.99977560826144 -1 -0.02173913043478 -0.5 -0.5 27368.105657757755 1
i 2 151.89063021007004 2 10 65.32651203859486 -1 -0.02173913043478 -0.5 -0.5 25163.73872142919 1
i 6 151.97065688562856 2 6.08333333333333 64.44872409101853 -1 -0.19565217391304 -0.5 -0.5 23076.50727926527 1
i 6 152.05068356118707 2 10.25 73.2314889809703 -1 -0.06521739130435 -0.5 -0.5 21107.213391793473 1
i 4 152.13071023674559 2 8.41666666666667 62.64966949612975 -1 0.02173913043478 -0.5 -0.5 19255.80783481594 1
i 5 152.21073691230413 2 7.83333333333333 77.53521199869297 -1 -0.23913043478261 -0.5 -0.5 17521.447993908583 1
i 2 152.29076358786264 2 10.91666666666667 67.19845823609272 -1 -0.02173913043478 -0.5 -0.5 15902.56046438808 1
i 6 152.37079026342116 2 6.5 62.02538426097047 -1 0.10869565217391 -0.5 -0.5 14396.907309287455 1
i 6 152.45081693897967 2 9.5 76.40551833894797 -1 -0.28260869565217 -0.5 -0.5 13001.654934946075 1
i 3 152.53084361453818 2 9.58333333333333 63.82796543054796 -1 -0.23913043478261 -0.5 -0.5 11713.444566418975 1
i 5 152.61087029009673 2 6.91666666666667 73.18408829067913 -1 -0.15217391304348 -0.5 -0.5 10528.463342039755 1
i 4 152.69089696565524 2 11 69.61029916207649 -1 -0.06521739130435 -0.5 -0.5 9442.515096705727 1
i 5 152.77092364121376 2 6 60.00104340631391 -1 -0.10869565217391 -0.5 -0.5 8451.089965390162 1
i 6 152.85095031677227 2 8.41666666666667 79.66100093503664 -1 0.02173913043478 -0.5 -0.5 7549.432010315145 1
i 2 152.93097699233078 2 10.75 64.97212142552125 -1 -0.06521739130435 -0.5 -0.5 6732.604155441621 1
i 6 153.0110036678893 2 6.16666666666667 66.1322795230492 -1 0.02173913043478 -0.5 -0.5 5995.549798606685 1
i 5 153.09103034344784 2 10.5 72.39498411928281 -1 -0.32608695652174 -0.5 -0.5 5333.150562968348 1
i 4 153.17105701900635 2 8 61.88707873067898 -1 -0.32608695652174 -0.5 -0.5 4740.279743500219 1
i 5 153.25108369456487 2 7 78.69518755210817 -1 -0.19565217391304 -0.5 -0.5 4211.851099395746 1
i 2 153.33111037012338 2 11 66.45342964753353 -1 -0.02173913043478 -0.5 -0.5 3742.862737635566 1
i 6 153.4111370456819 2 6.66666666666667 62.65390114545943 -1 -0.32608695652174 -0.5 -0.5 3328.4359250245498 1
i 6 153.49116372124044 2 9.66666666666667 75.26660458390728 -1 0.23913043478261 -0.5 -0.5 2963.848754290239 1
i 3 153.57119039679895 2 9.16666666666667 63.47275510048596 -1 0.19565217391304 -0.5 -0.5 2644.56467296163 1
i 5 153.65121707235747 2 7.16666666666667 74.96015279734802 -1 -0.19565217391304 -0.5 -0.5 2366.255960631838 1
i 3 153.73124374791598 2 11 68.78137458504236 -1 -0.06521739130435 -0.5 -0.5 2124.822309838347 1
i 5 153.8112704234745 2 6.66666666666667 60.33822347276991 -1 -0.06521739130435 -0.5 -0.5 1916.4047274463371 1
i 6 153.89129709903304 2 8.75 78.81370408700792 -1 -0.02173913043478 -0.5 -0.5 1737.3950264996222 1
i 2 153.97132377459155 2 10.41666666666667 64.65107705410705 -1 -0.10869565217391 -0.5 -0.5 1584.4412226825846 1
i 6 154.05135045015007 2 6.41666666666667 68.29190683332877 -1 -0.10869565217391 -0.5 -0.5 1454.4491846230767 1
i 5 154.13137712570858 2 10.66666666666667 71.557980289986 -1 -0.28260869565217 -0.5 -0.5 1344.5809133206067 1
i 4 154.2114038012671 2 7.83333333333333 61.01546220505253 -1 -0.15217391304348 -0.5 -0.5 1252.2498431883532 1
i 5 154.29143047682564 2 7 79.61136091330977 -1 -0.32608695652174 -0.5 -0.5 1175.1135659414388 1
i 2 154.37145715238415 2 11 65.84286909088851 -1 -0.02173913043478 -0.5 -0.5 1111.064379355224 1
i 6 154.45148382794267 2 6.08333333333333 63.26762228565673 -1 0.19565217391304 -0.5 -0.5 1058.2180563986594 1
i 6 154.53151050350118 2 9 74.25256205274309 -1 -0.15217391304348 -0.5 -0.5 1014.9012171693379 1
i 3 154.6115371790597 2 8 63.17732088068046 -1 0.06521739130435 -0.5 -0.5 979.6376672368381 1
i 5 154.6915638546182 2 7.41666666666667 76.23296110114056 -1 -0.10869565217391 -0.5 -0.5 951.1340423283876 1
i 3 154.77159053017675 2 11 68.05347119108717 -1 -0.23913043478261 -0.5 -0.5 928.2650716774913 1
i 6 154.85161720573527 2 6.58333333333333 61.10482704746018 -1 -0.23913043478261 -0.5 -0.5 910.0587417303266 1
i 6 154.93164388129378 2 9 77.73123210338802 -1 0.10869565217391 -0.5 -0.5 895.6816091805644 1
i 2 155.0116705568523 2 10.16666666666667 64.29107916362832 -1 -0.28260869565217 -0.5 -0.5 884.4244783666221 1
i 5 155.0916972324108 2 6.66666666666667 70.63493899419757 -1 0.02173913043478 -0.5 -0.5 875.6886237495061 1
i 4 155.17172390796935 2 10 70.66087618589228 -1 0.06521739130435 -0.5 -0.5 868.9727042654007 1
i 5 155.25175058352787 2 7.41666666666667 60.31414779437871 -1 -0.06521739130435 -0.5 -0.5 863.8604835069802 1
i 5 155.33177725908638 2 8.16666666666667 79.99642883244806 -1 -0.15217391304348 -0.5 -0.5 860.0094385334029 1
i 2 155.4118039346449 2 10 65.37929254071058 -1 0.02173913043478 -0.5 -0.5 857.1403111496764 1
i 6 155.4918306102034 2 6 64.27234064227602 -1 -0.32608695652174 -0.5 -0.5 855.027629137037 1
i 6 155.57185728576192 2 10.16666666666667 73.34560923076039 -1 -0.19565217391304 -0.5 -0.5 853.4912014624946 1
i 4 155.65188396132046 2 8.5 62.72990350293109 -1 -0.32608695652174 -0.5 -0.5 852.3885711501499 1
i 5 155.73191063687898 2 7.66666666666667 77.38033812363828 -1 -0.23913043478261 -0.5 -0.5 851.6083923651224 1
i 3 155.8119373124375 2 10 67.30073401142498 -1 0.06521739130435 -0.5 -0.5 851.0646843562181 1
i 6 155.891963987996 2 6.5 61.92746287426826 -1 -0.15217391304348 -0.5 -0.5 850.6919041557604 1
i 6 155.97199066355452 2 9.33333333333333 76.56144040971508 -1 -0.19565217391304 -0.5 -0.5 850.4407721995378 1
i 3 156.05201733911306 2 9.66666666666667 63.88163690426607 -1 0.02173913043478 -0.5 -0.5 850.2747800987543 1
i 5 156.13204401467158 2 6 72.90737927361369 -1 -0.02173913043478 -0.5 -0.5 850.1673074095997 1
i 4 156.2120706902301 2 10 69.72976178319698 -1 -0.02173913043478 -0.5 -0.5 850.0992741058701 1
i 5 156.2920973657886 2 6 60.00164292465844 -1 -0.06521739130435 -0.5 -0.5 850.057257240482 1
i 6 156.37212404134712 2 8.33333333333333 79.74049367833592 -1 -0.10869565217391 -0.5 -0.5 850.0320036428512 1
i 2 156.45215071690566 2 10.75 65.01539058328943 -1 0.15217391304348 -0.5 -0.5 850.0172750982025 1
i 6 156.53217739246418 2 6.08333333333333 65.87681175615245 -1 -0.23913043478261 -0.5 -0.5 850.0089679573238 1
i 5 156.6122040680227 2 10.5 72.50378929660556 -1 -0.06521739130435 -0.5 -0.5 850.0044552139882 1
i 4 156.6922307435812 2 8.08333333333333 62.00028683078216 -1 0.19565217391304 -0.5 -0.5 850.0021054710837 1
i 5 156.77225741913972 2 7.75 78.54840088689313 -1 -0.06521739130435 -0.5 -0.5 850.0009396367662 1
i 2 156.85228409469826 2 11.08333333333333 66.54599312019447 -1 0.15217391304348 -0.5 -0.5 850.0003924275541 1
i 6 156.93231077025678 2 6.33333333333333 62.5798252293327 -1 0.02173913043478 -0.5 -0.5 850.0001516258557 1
i 6 157.0123374458153 2 9.66666666666667 75.41065472652622 -1 -0.28260869565217 -0.5 -0.5 850.0000534069239 1
i 3 157.0923641213738 2 9.33333333333333 63.51352343580311 -1 -0.02173913043478 -0.5 -0.5 850.0000168187364 1
i 5 157.17239079693232 2 7.08333333333333 74.76015977374348 -1 -0.19565217391304 -0.5 -0.5 850.0000046123328 1
i 3 157.25241747249083 2 11.08333333333333 68.88265376784346 -1 -0.02173913043478 -0.5 -0.5 850.0000010615043 1
i 5 157.33244414804938 2 6.66666666666667 60.26158639591833 -1 -0.15217391304348 -0.5 -0.5 850.0000001941979 1
i 6 157.4124708236079 2 8.66666666666667 78.94430235960567 -1 0.23913043478261 -0.5 -0.5 850.0000000259599 1
i 2 157.4924974991664 2 10.5 64.69442477254904 -1 -0.02173913043478 -0.5 -0.5 850.0000000022011 1
i 6 157.57252417472492 2 6.33333333333333 67.99022314780495 -1 -0.19565217391304 -0.5 -0.5 850.0000000000908 1
i 5 157.65255085028343 2 10.66666666666667 71.67130494079623 -1 0.15217391304348 -0.5 -0.5 850.0000000000009 1
i 4 157.73257752584198 2 7.66666666666667 61.12609811452904 -1 -0.19565217391304 -0.5 -0.5 850 1
i 5 157.8126042014005 2 7 79.51632028597723 -1 0.02173913043478 -0.5 -0.5 850 1
i 2 157.892630876959 2 11.08333333333333 65.91419762868483 -1 0.02173913043478 -0.5 -0.5 850 1
i 6 157.97265755251752 2 6.08333333333333 63.17207378848394 -1 -0.15217391304348 -0.5 -0.5 849.9999999999986 1
i 6 158.05268422807603 2 9 74.37931316143694 -1 -0.15217391304348 -0.5 -0.5 849.9999999998873 1
i 3 158.13271090363455 2 8 63.21984417312532 -1 -0.32608695652174 -0.5 -0.5 849.9999999974102 1
i 5 158.2127375791931 2 7.5 76.08012220624397 -1 -0.02173913043478 -0.5 -0.5 849.9999999704359 1
i 3 158.2927642547516 2 11.08333333333333 68.14901801773661 -1 0.15217391304348 -0.5 -0.5 849.9999997835988 1
i 6 158.37279093031012 2 6.66666666666667 60.99283839733714 -1 -0.10869565217391 -0.5 -0.5 849.9999988353794 1
i 6 158.45281760586863 2 8 77.88111880632296 -1 -0.23913043478261 -0.5 -0.5 849.9999949983413 1
i 2 158.53284428142715 2 10.08333333333333 64.34229108077434 -1 0.06521739130435 -0.5 -0.5 849.9999819266066 1
i 5 158.6128709569857 2 6.5 70.32354845762123 -1 -0.23913043478261 -0.5 -0.5 849.9999430252617 1
i 4 158.6928976325442 2 10 70.78305273740638 -1 0.02173913043478 -0.5 -0.5 849.9998392067707 1
i 5 158.77292430810272 2 7.33333333333333 60.38917861744123 -1 0.06521739130435 -0.5 -0.5 849.9995859124641 1
i 5 158.85295098366123 2 8.08333333333333 79.9816322856978 -1 -0.02173913043478 -0.5 -0.5 849.9990126743671 1
i 2 158.93297765921974 2 10 65.43380573451127 -1 0.10869565217391 -0.5 -0.5 849.9977956711608 1
i 6 159.0130043347783 2 6.08333333333333 64.10683353215212 -1 -0.23913043478261 -0.5 -0.5 849.9953502509981 1
i 6 159.0930310103368 2 10.33333333333333 73.46088409867534 -1 0.23913043478261 -0.5 -0.5 849.9906662402641 1
i 4 159.17305768589532 2 8.5 62.80478817187736 -1 -0.15217391304348 -0.5 -0.5 849.9820640514835 1
i 5 159.25308436145383 2 7.66666666666667 77.22639642498638 -1 0.10869565217391 -0.5 -0.5 849.9668442032109 1
i 3 159.33311103701234 2 10 67.4027947005765 -1 0.15217391304348 -0.5 -0.5 849.940796968303 1
i 6 159.4131377125709 2 6.5 61.82611564309398 -1 -0.19565217391304 -0.5 -0.5 849.8975326149933 1
i 6 159.4931643881294 2 9.33333333333333 76.71765146171617 -1 -0.23913043478261 -0.5 -0.5 849.8275862805406 1
i 3 159.57319106368791 2 9.66666666666667 63.93606098286888 -1 0.5 -0.5 -0.5 849.7172451433153 1
i 5 159.65321773924643 2 6 72.62304970963528 -1 -0.15217391304348 -0.5 -0.5 849.5470394967854 1
i 4 159.73324441480494 2 10 69.85081635253337 -1 -0.06521739130435 -0.5 -0.5 849.2898338708562 1
i 5 159.81327109036346 2 7 60.01270596936928 -1 0.10869565217391 -0.5 -0.5 848.9084498107421 1
i 6 159.893297765922 2 8.33333333333333 79.8101841623643 -1 -0.06521739130435 -0.5 -0.5 848.3527486464352 1
i 2 159.97332444148051 2 10.75 65.05946704546105 -1 0.06521739130435 -0.5 -0.5 847.5561009097271 1
i 6 160.05335111703903 2 6.08333333333333 65.63060755482866 -1 -0.06521739130435 -0.5 -0.5 846.4311693200206 1
i 5 160.13337779259754 2 10.5 72.61280509076434 -1 0.02173913043478 -0.5 -0.5 844.8649347890877 1
i 4 160.21340446815606 2 8.25 62.11071024229716 -1 -0.15217391304348 -0.5 -0.5 842.7128999852318 1
i 5 160.2934311437146 2 7.75 78.39825326731349 -1 -0.10869565217391 -0.5 -0.5 839.7924129058349 1
i 2 160.3734578192731 2 11.16666666666667 66.64091758320036 -1 0.02173913043478 -0.5 -0.5 835.875063838581 1
i 6 160.45348449483163 2 6.25 62.50408234272606 -1 -0.15217391304348 -0.5 -0.5 830.6781231860865 1
i 6 160.53351117039014 2 9.66666666666667 75.55702233044462 -1 -0.19565217391304 -0.5 -0.5 823.8550049520932 1
i 3 160.61353784594866 2 9.25 63.55609603643496 -1 -0.19565217391304 -0.5 -0.5 814.9847612205373 1
i 5 160.69356452150717 2 7.16666666666667 74.54983872201846 -1 0.06521739130435 -0.5 -0.5 803.5606365912464 1
i 3 160.7735911970657 2 11 68.98628107148389 -1 -0.10869565217391 -0.5 -0.5 788.9777380580372 1
i 5 160.85361787262423 2 6.75 60.19368351480959 -1 -0.10869565217391 -0.5 -0.5 770.5199049170654 1
i 6 160.93364454818274 2 8.58333333333333 79.07054543245127 -1 -0.06521739130435 -0.5 -0.5 747.3458945614822 1
i 2 161.01367122374126 2 10.5 64.73714588479167 -1 0.10869565217391 -0.5 -0.5 718.4750329413177 1
i 6 161.09369789929977 2 6.25 67.69213849302274 -1 -0.10869565217391 -0.5 -0.5 682.7725124341262 1
i 5 161.1737245748583 2 10.75 71.78353062579244 -1 -0.10869565217391 -0.5 -0.5 638.9345541877246 1
i 4 161.25375125041683 2 7.75 61.23933950493583 -1 0.10869565217391 -0.5 -0.5 585.4736858853361 1
i 5 161.33377792597534 2 7 79.41217291732931 -1 -0.32608695652174 -0.5 -0.5 520.7044185076093 1
i 2 161.41380460153385 2 11 65.98827159629374 -1 -0.23913043478261 -0.5 -0.5 442.7296361404152 1
i 6 161.49383127709237 2 6.16666666666667 63.08289533230111 -1 -0.28260869565217 -0.5 -0.5 349.42804028175465 1
i 6 161.5738579526509 2 9 74.50805556131822 -1 -0.06521739130435 -0.5 -0.5 238.44301351338046 1
i 3 161.65388462820943 2 8 63.26012414675299 -1 -0.06521739130435 -0.5 -0.5 107.17328590526925 1
i 5 161.73391130376794 2 7.41666666666667 75.92470478798957 -1 -0.10869565217391 -0.5 -0.5 -47.23419976513404 1
i 3 161.81393797932645 2 11.16666666666667 68.24405584559597 -1 -0.23913043478261 -0.5 -0.5 -227.8888217915262 1
i 5 161.89396465488497 2 6.58333333333333 60.88235207011095 -1 0.02173913043478 -0.5 -0.5 -438.1578113740551 1
i 6 161.9739913304435 2 8 78.02932678109332 -1 -0.02173913043478 -0.5 -0.5 -681.6643907990772 1
i 2 162.05401800600202 2 10.08333333333333 64.3923856453466 -1 0.06521739130435 -0.5 -0.5 -962.2821439758686 1
i 5 162.13404468156054 2 6.66666666666667 70.01181620131126 -1 -0.15217391304348 -0.5 -0.5 -1284.12527191934 1
i 4 162.21407135711905 2 10.75 70.90428143564745 -1 0.02173913043478 -0.5 -0.5 -1651.5344214043675 1
i 5 162.29409803267757 2 7.33333333333333 60.47042252669468 -1 0.06521739130435 -0.5 -0.5 -2069.057819716444 1
i 5 162.37412470823608 2 8.16666666666667 79.95549343133717 -1 0.23913043478261 -0.5 -0.5 -2541.427502037019 1
i 2 162.45415138379462 2 10.91666666666667 65.49015239254202 -1 -0.19565217391304 -0.5 -0.5 -3073.5304801261946 1
i 6 162.53417805935314 2 6.08333333333333 63.95200470280928 -1 -0.15217391304348 -0.5 -0.5 -3670.3747710681278 1
i 6 162.61420473491165 2 10.08333333333333 73.57738454727256 -1 -0.02173913043478 -0.5 -0.5 -4337.050282104776 1
i 4 162.69423141047017 2 8.58333333333333 62.87440039101823 -1 -0.02173913043478 -0.5 -0.5 -5078.684631075685 1
i 5 162.77425808602868 2 7.66666666666667 77.0735002666046 -1 0.3695652173913 -0.5 -0.5 -5900.39407049854 1
i 3 162.85428476158722 2 10.91666666666667 67.50435270023088 -1 0.10869565217391 -0.5 -0.5 -6807.229775588748 1
i 6 162.93431143714574 2 6.41666666666667 61.72166533759896 -1 0.10869565217391 -0.5 -0.5 -7804.11985097924 1
i 6 163.01433811270425 2 9.5 76.87383714646748 -1 0.10869565217391 -0.5 -0.5 -8895.807506009458 1
i 3 163.09436478826277 2 9.75 63.99090675676094 -1 -0.15217391304348 -0.5 -0.5 -10086.785942435325 1
i 5 163.17439146382128 2 6.83333333333333 72.33209829695836 -1 -0.15217391304348 -0.5 -0.5 -11381.230589494826 1
i 4 163.2544181393798 2 10 69.97310711999256 -1 0.23913043478261 -0.5 -0.5 -12782.9294076299 1
i 5 163.33444481493834 2 7.08333333333333 60.03387342302962 -1 -0.19565217391304 -0.5 -0.5 -14295.212061929871 1
i 5 163.41447149049685 2 8.33333333333333 79.86954107088317 -1 0.02173913043478 -0.5 -0.5 -15920.878837759716 1
i 2 163.49449816605537 2 10.83333333333333 65.1045139410433 -1 -0.10869565217391 -0.5 -0.5 -17662.130232314004 1
i 6 163.57452484161388 2 6.16666666666667 65.39422077940375 -1 0.15217391304348 -0.5 -0.5 -19520.498205343556 1
i 5 163.6545515171724 2 10.33333333333333 72.72221677713028 -1 0.02173913043478 -0.5 -0.5 -21496.780108594954 1
i 4 163.73457819273094 2 8.16666666666667 62.2177046160329 -1 -0.02173913043478 -0.5 -0.5 -23590.976335227497 1
i 5 163.81460486828945 2 7.83333333333333 78.24557311091152 -1 -0.06521739130435 -0.5 -0.5 -25802.232736581765 1
i 2 163.89463154384796 2 11 66.73793022537878 -1 -0.32608695652174 -0.5 -0.5 -28128.78884325981 1
i 6 163.97465821940648 2 6.25 62.42591140723402 -1 -0.28260869565217 -0.5 -0.5 -30567.93290004921 1
i 6 164.054684894965 2 9.66666666666667 75.70556189496745 -1 0.02173913043478 -0.5 -0.5 -33115.964679348515 1
i 3 164.13471157052354 2 9.5 63.60063666264219 -1 -0.10869565217391 -0.5 -0.5 -35768.166975641456 1
i 5 164.21473824608205 2 7 74.32878340462608 -1 -0.10869565217391 -0.5 -0.5 -38518.786604293586 1
i 3 164.29476492164056 2 11 69.09245010090878 -1 -0.23913043478261 -0.5 -0.5 -41361.02563247662 1
i 5 164.37479159719908 2 6.83333333333333 60.13524391388626 -1 -0.19565217391304 -0.5 -0.5 -44287.04345895379 1
i 6 164.4548182727576 2 8.58333333333333 79.19176860441121 -1 0.02173913043478 -0.5 -0.5 -47287.97023448388 1
i 2 164.53484494831613 2 10.58333333333333 64.7794101646299 -1 -0.28260869565217 -0.5 -0.5 -50353.93197686768 1
i 6 164.61487162387465 2 6.25 67.39836126678867 -1 0.28260869565217 -0.5 -0.5 -53474.087586406386 1
i 5 164.69489829943316 2 10.66666666666667 71.89476753712201 -1 -0.06521739130435 -0.5 -0.5 -56636.677810573055 1
i 4 164.77492497499168 2 7.91666666666667 61.3545750345781 -1 -0.32608695652174 -0.5 -0.5 -59829.08604344337 1
i 5 164.8549516505502 2 7 79.2994775718681 -1 -0.23913043478261 -0.5 -0.5 -63037.91067848249 1
i 2 164.9349783261087 2 11 66.06518131450481 -1 -0.15217391304348 -0.5 -0.5 -66249.0485649834 1
i 6 165.01500500166725 2 6.25 62.9991038833316 -1 0.02173913043478 -0.5 -0.5 -69447.78895186407 1
i 6 165.09503167722576 2 9.91666666666667 74.63891269440482 -1 -0.19565217391304 -0.5 -0.5 -72618.91714009196 1
i 3 165.17505835278428 2 8 63.29879816800206 -1 -0.06521739130435 -0.5 -0.5 -75746.82690973933 1
i 5 165.2550850283428 2 7.33333333333333 75.765648521195 -1 0.10869565217391 -0.5 -0.5 -78815.64064199617 1
i 3 165.3351117039013 2 11.16666666666667 68.33890819033186 -1 -0.32608695652174 -0.5 -0.5 -81809.33592327977 1
i 5 165.41513837945985 2 6.58333333333333 60.77426476934214 -1 -0.19565217391304 -0.5 -0.5 -84711.87729998986 1
i 6 165.49516505501836 2 8.83333333333333 78.1756700362162 -1 -0.32608695652174 -0.5 -0.5 -87507.35175090801 1
i 2 165.57519173057688 2 10.25 64.44132609012438 -1 -0.15217391304348 -0.5 -0.5 -90180.10636163772 1
i 5 165.6552184061354 2 6.5 69.70026942037242 -1 -0.10869565217391 -0.5 -0.5 -92714.88662339565 1
i 4 165.7352450816939 2 10.75 71.02442656414213 -1 -0.19565217391304 -0.5 -0.5 -95096.97373851619 1
i 5 165.81527175725242 2 7.41666666666667 60.5574042318556 -1 -0.15217391304348 -0.5 -0.5 -97312.31929787144 1
i 5 165.89529843281096 2 8.16666666666667 79.91816421576894 -1 -0.28260869565217 -0.5 -0.5 -99347.67570203375 1
i 2 165.97532510836947 2 10.91666666666667 65.54843855561673 -1 -0.10869565217391 -0.5 -0.5 -101190.72072831028 1
i 6 166.055351783928 2 6 63.80757449329822 -1 0.19565217391304 -0.5 -0.5 -102830.17469991521 1
i 6 166.1353784594865 2 10.25 73.69518285661921 -1 -0.06521739130435 -0.5 -0.5 -104255.90879062738 1
i 4 166.21540513504502 2 8.83333333333333 62.93890300916448 -1 0.02173913043478 -0.5 -0.5 -105459.04309766207 1
i 5 166.29543181060356 2 7.58333333333333 76.92163533143642 -1 -0.06521739130435 -0.5 -0.5 -106432.03323552753 1
i 3 166.37545848616207 2 10 67.60517155463037 -1 -0.10869565217391 -0.5 -0.5 -107168.7443428716 1
i 6 166.4554851617206 2 6.58333333333333 61.61451187499361 -1 0.23913043478261 -0.5 -0.5 -107664.51155053345 1
i 6 166.5355118372791 2 9.16666666666667 77.02970325330303 -1 -0.19565217391304 -0.5 -0.5 -107916.18612996256 1
i 3 166.61553851283762 2 9.83333333333333 64.04585660014772 -1 -0.28260869565217 -0.5 -0.5 -107922.16672422315 1
i 5 166.69556518839616 2 6.83333333333333 72.03554022715807 -1 0.10869565217391 -0.5 -0.5 -107682.41525612865 1
i 4 166.77559186395467 2 10 70.09626933381632 -1 -0.32608695652174 -0.5 -0.5 -107198.45730670964 1
i 5 166.8556185395132 2 7.08333333333333 60.06470487641069 -1 -0.10869565217391 -0.5 -0.5 -106473.36695909411 1
i 5 166.9356452150717 2 8.5 79.91813289203456 -1 -0.10869565217391 -0.5 -0.5 -105511.73630482689 1
i 2 167.01567189063022 2 10.83333333333333 65.15067837213556 -1 0.32608695652174 -0.5 -0.5 -104319.63000854659 1
i 6 167.09569856618876 2 6.08333333333333 65.1681046545499 -1 0.10869565217391 -0.5 -0.5 -102904.52551963994 1
i 6 167.17572524174727 2 10.33333333333333 72.83219138832798 -1 -0.15217391304348 -0.5 -0.5 -101275.23970307324 1
i 4 167.2557519173058 2 8.25 62.32070385788359 -1 -0.3695652173913 -0.5 -0.5 -99441.84283317602 1
i 5 167.3357785928643 2 7.83333333333333 78.09113747100058 -1 -0.41304347826087 -0.5 -0.5 -97415.56105117744 1
i 2 167.41580526842282 2 10 66.83671457732892 -1 -0.23913043478261 -0.5 -0.5 -95208.66852735798 1
i 6 167.49583194398133 2 6.25 62.34471822475852 -1 -0.10869565217391 -0.5 -0.5 -92834.3706897335 1
i 6 167.57585861953987 2 9.5 75.85607384849365 -1 -0.28260869565217 -0.5 -0.5 -90306.67998158425 1
i 3 167.6558852950984 2 9.41666666666667 63.64718916538541 -1 0.19565217391304 -0.5 -0.5 -87640.28568835433 1
i 5 167.7359119706569 2 7.08333333333333 74.09685218431176 -1 -0.19565217391304 -0.5 -0.5 -84850.41942968399 1
i 3 167.81593864621541 2 11 69.20125546267481 -1 0.15217391304348 -0.5 -0.5 -81952.71794385544 1
i 5 167.89596532177393 2 6.83333333333333 60.08685559616993 -1 -0.06521739130435 -0.5 -0.5 -78963.08479964918 1
i 6 167.97599199733247 2 8.58333333333333 79.30724517332881 -1 -0.15217391304348 -0.5 -0.5 -75897.5526546363 1
i 2 168.05601867289099 2 10.83333333333333 64.82140238415795 -1 -0.10869565217391 -0.5 -0.5 -72772.14764006264 1
i 6 168.1360453484495 2 6.33333333333333 67.10965504014966 -1 0.10869565217391 -0.5 -0.5 -69602.75739141084 1
i 5 168.216072024008 2 10.5 72.00515257861154 -1 -0.23913043478261 -0.5 -0.5 -66405.00416213993 1
i 4 168.29609869956653 2 7.83333333333333 61.47113817993578 -1 0.02173913043478 -0.5 -0.5 -63194.12435738503 1
i 5 168.37612537512504 2 7.91666666666667 79.17887516423204 -1 -0.10869565217391 -0.5 -0.5 -59984.85570661049 1
i 2 168.45615205068358 2 11.16666666666667 66.144986697211 -1 -0.10869565217391 -0.5 -0.5 -56791.33316166914 1
i 6 168.5361787262421 2 6.25 62.91963206532981 -1 -0.02173913043478 -0.5 -0.5 -53626.994461599345 1
i 6 168.6162054018006 2 9.83333333333333 74.77199903596268 -1 0.28260869565217 -0.5 -0.5 -50504.4961506108 1
i 3 168.69623207735913 2 9 63.33651870610163 -1 -0.06521739130435 -0.5 -0.5 -47435.64067359875 1
i 5 168.77625875291764 2 7.25 75.60181019882093 -1 0.10869565217391 -0.5 -0.5 -44431.31500702442 1
i 3 168.85628542847618 2 11 68.43395585171704 -1 -0.06521739130435 -0.5 -0.5 -41501.441114761066 1
i 5 168.9363121040347 2 6.66666666666667 60.66953332008082 -1 0.28260869565217 -0.5 -0.5 -38654.93835141096 1
i 6 169.0163387795932 2 8.83333333333333 78.31993626126416 -1 0.15217391304348 -0.5 -0.5 -35899.69777207149 1
i 2 169.09636545515173 2 10.41666666666667 64.4891110569914 -1 -0.02173913043478 -0.5 -0.5 -33242.568150290244 1
i 5 169.17639213071024 2 6.41666666666667 69.38939195101743 -1 -0.10869565217391 -0.5 -0.5 -30689.353357111868 1
i 4 169.25641880626878 2 10.75 71.143391534175 -1 -0.02173913043478 -0.5 -0.5 -28244.820615909888 1
i 5 169.3364454818273 2 7.41666666666667 60.64966828626766 -1 -0.19565217391304 -0.5 -0.5 -25912.719022021392 1
i 5 169.4164721573858 2 8 79.86983531676863 -1 -0.10869565217391 -0.5 -0.5 -23695.807604429774 1
i 2 169.49649883294433 2 10 65.60877753290295 -1 -0.32608695652174 -0.5 -0.5 -21595.892110505574 1
i 6 169.57652550850284 2 6.08333333333333 63.67318197863443 -1 -0.28260869565217 -0.5 -0.5 -19613.869614708186 1
i 6 169.65655218406138 2 10.08333333333333 73.81435740295657 -1 -0.23913043478261 -0.5 -0.5 -17749.779989224073 1
i 4 169.7365788596199 2 8.75 62.9985398778748 -1 -0.15217391304348 -0.5 -0.5 -16002.86322878172 1
i 5 169.8166055351784 2 7.91666666666667 76.7706533650394 -1 -0.10869565217391 -0.5 -0.5 -14371.62159361181 1
i 3 169.89663221073693 2 11 67.70507576595932 -1 -0.02173913043478 -0.5 -0.5 -12853.885523320594 1
i 6 169.97665888629544 2 6.58333333333333 61.50512126285099 -1 -0.06521739130435 -0.5 -0.5 -11446.882279713534 1
i 6 170.05668556185395 2 9.16666666666667 77.18498127763827 -1 0.02173913043478 -0.5 -0.5 -10147.306297659743 1
i 3 170.1367122374125 2 9 64.10061809693335 -1 -0.06521739130435 -0.5 -0.5 -8951.390258635643 1
i 5 170.216738912971 2 6.75 71.7343698183324 -1 -0.28260869565217 -0.5 -0.5 -7854.975950544432 1
i 4 170.29676558852952 2 10.91666666666667 70.2199444438806 -1 0.06521739130435 -0.5 -0.5 -6853.584038095064 1
i 5 170.37679226408804 2 7.08333333333333 60.10470244193107 -1 -0.10869565217391 -0.5 -0.5 -5942.481939015495 1
i 5 170.45681893964655 2 8.25 79.95563134878418 -1 -0.3695652173913 -0.5 -0.5 -5116.74908073936 1
i 2 170.5368456152051 2 10 65.19809213770502 -1 0.06521739130435 -0.5 -0.5 -4371.338898318215 1
i 6 170.6168722907636 2 6 64.95260514990301 -1 -0.15217391304348 -0.5 -0.5 -3701.137025187726 1
i 6 170.69689896632212 2 10.25 72.9428753631597 -1 -0.10869565217391 -0.5 -0.5 -3101.0152223136256 1
i 4 170.77692564188064 2 8.75 62.41923342961006 -1 -0.02173913043478 -0.5 -0.5 -2565.880686330572 1
i 5 170.85695231743915 2 7.91666666666667 77.93565305439671 -1 -0.02173913043478 -0.5 -0.5 -2090.7204718225744 1
i 2 170.93697899299767 2 10 66.93692157255587 -1 0.15217391304348 -0.5 -0.5 -1670.6408552967769 1
i 6 171.0170056685562 2 6.33333333333333 62.26008207100071 -1 -0.06521739130435 -0.5 -0.5 -1300.9015571348527 1
i 6 171.09703234411472 2 9.5 76.00831119247697 -1 -0.10869565217391 -0.5 -0.5 -976.9448215731712 1
i 3 171.17705901967324 2 9.41666666666667 63.69568715313252 -1 -0.32608695652174 -0.5 -0.5 -694.4194323465064 1
i 5 171.25708569523175 2 7 73.8541664920758 -1 0.10869565217391 -0.5 -0.5 -449.1998121031249 1
i 3 171.33711237079027 2 11 69.31269150396041 -1 -0.28260869565217 -0.5 -0.5 -237.4004162258259 1
i 5 171.4171390463488 2 6 60.0489497751387 -1 -0.15217391304348 -0.5 -0.5 -55.38568572992178 1
i 6 171.49716572190732 2 8.5 79.41620815995644 -1 -0.10869565217391 -0.5 -0.5 100.22413095130591 1
i 2 171.57719239746584 2 10.58333333333333 64.86331800323917 -1 -0.23913043478261 -0.5 -0.5 232.55094140633113 1
i 6 171.65721907302435 2 6.25 66.82681823920812 -1 -0.02173913043478 -0.5 -0.5 344.460185005812 1
i 5 171.73724574858286 2 10.58333333333333 72.11484752848264 -1 -0.19565217391304 -0.5 -0.5 438.5652299362719 1
i 4 171.8172724241414 2 7 61.58831460706772 -1 -0.10869565217391 -0.5 -0.5 517.2343908225763 1
i 5 171.89729909969992 2 7 79.05108368232345 -1 -0.10869565217391 -0.5 -0.5 582.6001646391023 1
i 2 171.97732577525844 2 11 66.22770903393241 -1 -0.15217391304348 -0.5 -0.5 636.5702883699375 1
i 6 172.05735245081695 2 6.25 62.84335239949527 -1 0.15217391304348 -0.5 -0.5 680.840234291867 1
i 6 172.13737912637546 2 9.75 74.90741258818541 -1 -0.06521739130435 -0.5 -0.5 716.9067769934918 1
i 3 172.217405801934 2 9.08333333333333 63.37392965176053 -1 -0.28260869565217 -0.5 -0.5 746.0822894390084 1
i 5 172.29743247749252 2 7.66666666666667 75.43200646725884 -1 0.10869565217391 -0.5 -0.5 769.5094526165229 1
i 3 172.37745915305103 2 11.16666666666667 68.52961886631205 -1 -0.15217391304348 -0.5 -0.5 788.1760936577645 1
i 5 172.45748582860955 2 6.66666666666667 60.56915795188874 -1 -0.19565217391304 -0.5 -0.5 802.9298998556961 1
i 6 172.53751250416806 2 8.75 78.46187266721977 -1 -0.06521739130435 -0.5 -0.5 814.4927898548183 1
i 2 172.61753917972658 2 10.33333333333333 64.53577227186281 -1 0.06521739130435 -0.5 -0.5 823.4747576016497 1
i 5 172.69756585528512 2 6.41666666666667 69.07964539211055 -1 -0.32608695652174 -0.5 -0.5 830.3870386438493 1
i 5 172.77759253084363 2 10.75 71.26111718065832 -1 -0.28260869565217 -0.5 -0.5 835.6544813545173 1
i 5 172.85761920640215 2 7.5 60.74677141647325 -1 0.28260869565217 -0.5 -0.5 839.6270370197734 1
i 5 172.93764588196066 2 8 79.81073418022058 -1 0.10869565217391 -0.5 -0.5 842.5903119453217 1
i 2 173.01767255751918 2 10 65.6712905293881 -1 -0.15217391304348 -0.5 -0.5 844.7751513933616 1
i 6 173.09769923307772 2 6.08333333333333 63.54838290755137 -1 0.06521739130435 -0.5 -0.5 846.3662489396812 1
i 6 173.17772590863623 2 10 73.93499623612446 -1 -0.23913043478261 -0.5 -0.5 847.5097955280409 1
i 3 173.25775258419475 2 8.66666666666667 63.05363134936034 -1 -0.15217391304348 -0.5 -0.5 848.3201999796019 1
i 5 173.33777925975326 2 7.5 76.62026596398162 -1 -0.3695652173913 -0.5 -0.5 848.8859269657273 1
i 3 173.41780593531178 2 11 67.80395903261018 -1 0.32608695652174 -0.5 -0.5 849.2745095349505 1
i 6 173.4978326108703 2 6.5 61.39401956420231 -1 -0.06521739130435 -0.5 -0.5 849.5368013361394 1
i 6 173.57785928642883 2 9.08333333333333 77.33943087882119 -1 -0.06521739130435 -0.5 -0.5 849.7105389016799 1
i 3 173.65788596198735 2 9 64.15493249459931 -1 -0.06521739130435 -0.5 -0.5 849.8232870013733 1
i 5 173.73791263754586 2 6.66666666666667 71.42953083327538 -1 0.10869565217391 -0.5 -0.5 849.8948404448296 1
i 4 173.81793931310438 2 10 70.34379272711449 -1 0.06521739130435 -0.5 -0.5 849.9391541206033 1
i 5 173.8979659886629 2 7.33333333333333 60.15333339064161 -1 -0.15217391304348 -0.5 -0.5 849.9658698531185 1
i 5 173.97799266422143 2 8.33333333333333 79.98180883286814 -1 0.28260869565217 -0.5 -0.5 849.9815041764684 1
i 2 174.05801933977995 2 10 65.24687381691736 -1 0.02173913043478 -0.5 -0.5 849.9903557035117 1
i 6 174.13804601533846 2 6.08333333333333 64.74795929909634 -1 0.06521739130435 -0.5 -0.5 849.9951847286499 1
i 6 174.21807269089697 2 10.33333333333333 73.05439449984667 -1 -0.06521739130435 -0.5 -0.5 849.9977113376157 1
i 4 174.2980993664555 2 8.33333333333333 62.51291874067319 -1 -0.10869565217391 -0.5 -0.5 849.9989718699147 1
i 5 174.37812604201403 2 7.66666666666667 77.77974051358687 -1 -0.28260869565217 -0.5 -0.5 849.9995673146371 1
i 2 174.45815271757255 2 10 67.03818256596288 -1 -0.3695652173913 -0.5 -0.5 849.9998313030233 1
i 6 174.53817939313106 2 6.33333333333333 62.17175191957421 -1 -0.15217391304348 -0.5 -0.5 849.9999399340717 1
i 6 174.61820606868957 2 9.5 76.16198919839906 -1 -0.02173913043478 -0.5 -0.5 849.9999808330235 1
i 3 174.6982327442481 2 9.5 63.74596989880467 -1 0.19565217391304 -0.5 -0.5 849.9999946564515 1
i 5 174.77825941980663 2 6 73.60109275644157 -1 0.10869565217391 -0.5 -0.5 849.999998743955 1
i 3 174.85828609536514 2 11.08333333333333 69.42665781796757 -1 -0.02173913043478 -0.5 -0.5 849.9999997636604 1
i 5 174.93831277092366 2 6 60.02179384840692 -1 0.10869565217391 -0.5 -0.5 849.9999999671413 1
i 6 175.01833944648217 2 8.5 79.51787625847354 -1 -0.19565217391304 -0.5 -0.5 849.9999999970454 1
i 2 175.0983661220407 2 10.66666666666667 64.90535812224132 -1 0.02173913043478 -0.5 -0.5 849.9999999998658 1
i 6 175.1783927975992 2 6.33333333333333 66.55065898663577 -1 -0.10869565217391 -0.5 -0.5 849.9999999999982 1
i 5 175.25841947315774 2 10.5 72.22403520449924 -1 -0.02173913043478 -0.5 -0.5 850 1
i 4 175.33844614871626 2 7 61.70535588542222 -1 -0.23913043478261 -0.5 -0.5 850 1
i 5 175.41847282427477 2 7 78.91688651480318 -1 0.02173913043478 -0.5 -0.5 850 1
i 2 175.4984994998333 2 11.08333333333333 66.31332364677843 -1 0.19565217391304 -0.5 -0.5 850.0000000000008 1
i 6 175.5785261753918 2 6.33333333333333 62.76911118798978 -1 -0.15217391304348 -0.5 -0.5 850.0000000000757 1
i 6 175.65855285095034 2 9.75 75.04522618121962 -1 0.10869565217391 -0.5 -0.5 850.0000000019223 1
i 3 175.73857952650886 2 9.08333333333333 63.4116396091503 -1 -0.10869565217391 -0.5 -0.5 850.0000000233031 1
i 5 175.81860620206737 2 7.33333333333333 75.25506655541096 -1 -0.10869565217391 -0.5 -0.5 850.0000001775294 1
i 3 175.8986328776259 2 11.08333333333333 68.62633361393571 -1 -0.02173913043478 -0.5 -0.5 850.0000009830783 1
i 5 175.9786595531844 2 6.66666666666667 60.47415907381472 -1 0.06521739130435 -0.5 -0.5 850.0000043133214 1
i 6 176.0586862287429 2 8.75 78.6011714294516 -1 -0.15217391304348 -0.5 -0.5 850.0000158477822 1
i 2 176.13871290430146 2 10.33333333333333 64.58137211479594 -1 -0.10869565217391 -0.5 -0.5 850.0000506290174 1
i 5 176.21873957985997 2 6.33333333333333 68.77149313370022 -1 -0.19565217391304 -0.5 -0.5 850.0001444524739 1
i 5 176.29876625541849 2 10.66666666666667 71.37757941890105 -1 -0.15217391304348 -0.5 -0.5 850.0003754082162 1
i 4 176.378792930977 2 7.66666666666667 60.84827112841754 -1 0.10869565217391 -0.5 -0.5 850.0009020329508 1
i 5 176.4588196065355 2 8.08333333333333 79.74112741675037 -1 -0.02173913043478 -0.5 -0.5 850.0020272831193 1
i 2 176.53884628209406 2 11.08333333333333 65.7361054595886 -1 -0.19565217391304 -0.5 -0.5 850.0043009486236 1
i 6 176.61887295765257 2 6.08333333333333 63.43264558616194 -1 -0.41304347826087 -0.5 -0.5 850.0086772081967 1
i 6 176.69889963321108 2 10.08333333333333 74.05719886210261 -1 -0.10869565217391 -0.5 -0.5 850.0167487650899 1
i 3 176.7789263087696 2 8.75 63.10457003567829 -1 -0.10869565217391 -0.5 -0.5 850.0310843419915 1
i 5 176.8589529843281 2 7.5 76.4700393218003 -1 0.28260869565217 -0.5 -0.5 850.0557021630617 1
i 3 176.93897965988666 2 11.08333333333333 67.901790561083 -1 0.06521739130435 -0.5 -0.5 850.0967182726523 1
i 6 177.01900633544517 2 6.5 61.28179191024256 -1 -0.28260869565217 -0.5 -0.5 850.1632149563625 1
i 6 177.09903301100368 2 9.08333333333333 77.49283877400147 -1 0.10869565217391 -0.5 -0.5 850.2683809213769 1
i 2 177.1790596865622 2 9 64.20857987102423 -1 -0.15217391304348 -0.5 -0.5 850.4309810025892 1
i 5 177.2590863621207 2 6.66666666666667 71.12189610005224 -1 -0.15217391304348 -0.5 -0.5 850.6772186991104 1
i 4 177.33911303767925 2 10 70.46750276113892 -1 0.15217391304348 -0.5 -0.5 851.0430594964425 1
i 5 177.41913971323777 2 7.16666666666667 60.21005016655741 -1 -0.19565217391304 -0.5 -0.5 851.5770863588051 1
i 5 177.49916638879628 2 8.16666666666667 79.99653098540986 -1 -0.10869565217391 -0.5 -0.5 852.34396064133 1
i 2 177.5791930643548 2 10 65.29713177085672 -1 -0.15217391304348 -0.5 -0.5 853.4285616327267 1
i 6 177.6592197399133 2 6 64.55429793098017 -1 -0.02173913043478 -0.5 -0.5 854.940875669167 1
i 6 177.73924641547183 2 10.25 73.16685572582283 -1 -0.15217391304348 -0.5 -0.5 857.0217009591544 1
i 4 177.81927309103037 2 8.5 62.6014886507038 -1 -0.06521739130435 -0.5 -0.5 859.8492266653765 1
i 5 177.89929976658888 2 7.66666666666667 77.62392239959253 -1 -0.19565217391304 -0.5 -0.5 863.6465341921404 1
i 2 177.9793264421474 2 10 67.1401231522867 -1 -0.23913043478261 -0.5 -0.5 868.690054878148 1
i 6 178.0593531177059 2 6.41666666666667 62.07963464330072 -1 -0.10869565217391 -0.5 -0.5 875.3190013198316 1
i 6 178.13937979326442 2 9.41666666666667 76.31679673300411 -1 -0.10869565217391 -0.5 -0.5 883.9457693596503 1
i 3 178.21940646882297 2 9.5 63.79780220978812 -1 -0.15217391304348 -0.5 -0.5 895.0672844673409 1
i 5 178.29943314438148 2 6 73.33821148885869 -1 -0.06521739130435 -0.5 -0.5 909.2772400183503 1
i 3 178.37945981994 2 11 69.54296999672604 -1 -0.19565217391304 -0.5 -0.5 927.2791461320498 1
i 5 178.4594864954985 2 6 60.00549308192568 -1 -0.15217391304348 -0.5 -0.5 949.9000766743171 1
i 6 178.53951317105702 2 8.5 79.61148124649115 -1 0.19565217391304 -0.5 -0.5 978.1049692575177 1
i 2 178.61953984661554 2 10.66666666666667 64.94772397024026 -1 0.06521739130435 -0.5 -0.5 1013.0112991842911 1
i 6 178.69956652217408 2 6 66.28196880213214 -1 -0.06521739130435 -0.5 -0.5 1055.9039139677698 1
i 5 178.7795931977326 2 10.5 72.33291336034655 -1 -0.06521739130435 -0.5 -0.5 1108.2497810865586 1
i 4 178.8596198732911 2 8.16666666666667 61.8214979176546 -1 0.06521739130435 -0.5 -0.5 1171.712368829974 1
i 5 178.93964654884962 2 7.83333333333333 78.77711549827177 -1 -0.23913043478261 -0.5 -0.5 1248.1653493394708 1
i 2 179.01967322440814 2 11.16666666666667 66.40175394137992 -1 -0.19565217391304 -0.5 -0.5 1339.7052851723072 1
i 6 179.09969989996668 2 6.25 62.69576926033398 -1 0.02173913043478 -0.5 -0.5 1448.6629368257234 1
i 6 179.1797265755252 2 9.75 75.18547798295354 -1 -0.02173913043478 -0.5 -0.5 1577.6128095851986 1
i 3 179.2597532510837 2 9.5 63.45019467471272 -1 -0.15217391304348 -0.5 -0.5 1729.3805446829433 1
i 5 179.33977992664222 2 7.33333333333333 75.06989137115877 -1 -0.19565217391304 -0.5 -0.5 1907.0477528942677 1
i 3 179.41980660220074 2 11.08333333333333 68.724526669278 -1 0.06521739130435 -0.5 -0.5 2113.953889124997 1
i 5 179.49983327775928 2 6.66666666666667 60.3855490587644 -1 0.15217391304348 -0.5 -0.5 2353.694774879747 1
i 6 179.5798599533178 2 8.75 78.73745608267828 -1 -0.32608695652174 -0.5 -0.5 2630.117392292826 1
i 2 179.6598866288763 2 10.58333333333333 64.62600112841098 -1 -0.15217391304348 -0.5 -0.5 2947.310599012705 1
i 6 179.73991330443482 2 6.41666666666667 68.46542506797908 -1 -0.02173913043478 -0.5 -0.5 3309.591447881864 1
i 5 179.81993997999334 2 10.75 71.49278662408578 -1 0.10869565217391 -0.5 -0.5 3721.4868390910274 1
i 4 179.89996665555188 2 7 60.95371153342238 -1 -0.15217391304348 -0.5 -0.5 4187.710285138231 1
i 5 179.9799933311104 2 7 79.66132752189876 -1 -0.15217391304348 -0.5 -0.5 4713.133630171358 1
i 2 180.0600200066689 2 11 65.80335369212662 -1 0.06521739130435 -0.5 -0.5 5302.753634552274 1
i 6 180.14004668222742 2 6 63.32534532821424 -1 -0.02173913043478 -0.5 -0.5 5961.653412027486 1
i 6 180.22007335778594 2 9.91666666666667 74.18107598083316 -1 0.19565217391304 -0.5 -0.5 6694.958789746074 1
i 3 180.30010003334445 2 8.83333333333333 63.15181634158327 -1 0.19565217391304 -0.5 -0.5 7507.789749425695 1
i 5 180.380126708903 2 7.5 76.31939115291974 -1 -0.15217391304348 -0.5 -0.5 8405.207199865192 1
i 3 180.4601533844615 2 11.08333333333333 67.9986191780988 -1 -0.15217391304348 -0.5 -0.5 9392.155425335155 1
i 6 180.54018006002002 2 6.5 61.16908555578468 -1 -0.06521739130435 -0.5 -0.5 10473.400649476112 1
i 6 180.62020673557853 2 9 77.64501412933174 -1 -0.06521739130435 -0.5 -0.5 11653.466248523378 1
i 2 180.70023341113705 2 10.16666666666667 64.26138151186363 -1 -0.02173913043478 -0.5 -0.5 12936.56523918569 1
i 5 180.7802600866956 2 6.58333333333333 70.81225675720992 -1 -0.32608695652174 -0.5 -0.5 14326.53075342715 1
i 4 180.8602867622541 2 10.83333333333333 70.59079771785714 -1 -0.06521739130435 -0.5 -0.5 15826.745293006274 1
i 5 180.94031343781262 2 7.41666666666667 60.27430664768831 -1 -0.10869565217391 -0.5 -0.5 17440.0696289903 1
i 5 181.02034011337113 2 8.16666666666667 79.99974612419193 -1 0.06521739130435 -0.5 -0.5 19168.772273902156 1
i 2 181.10036678892965 2 10 65.34896763290811 -1 -0.3695652173913 -0.5 -0.5 21014.46050504698 1
i 6 181.18039346448816 2 6 64.3716514445727 -1 -0.06521739130435 -0.5 -0.5 22978.013955293354 1
i 6 181.2604201400467 2 10.25 73.28035019426294 -1 -0.10869565217391 -0.5 -0.5 25059.521810998645 1
i 4 181.34044681560522 2 8.58333333333333 62.68477485415251 -1 -0.15217391304348 -0.5 -0.5 27258.224664531444 1
i 5 181.42047349116373 2 7.66666666666667 77.46861441432839 -1 -0.32608695652174 -0.5 -0.5 29572.462060346003 1
i 3 181.50050016672225 2 10.91666666666667 67.24237688091935 -1 0.06521739130435 -0.5 -0.5 31999.62674785928 1
i 6 181.58052684228076 2 6.41666666666667 61.98377808063688 -1 0.02173913043478 -0.5 -0.5 34536.12661153822 1
i 6 181.6605535178393 2 9.5 76.47240796158205 -1 -0.02173913043478 -0.5 -0.5 37177.35518819574 1
i 3 181.74058019339782 2 9.58333333333333 63.85089596174664 -1 0.02173913043478 -0.5 -0.5 39917.67160419388 1
i 5 181.82060686895633 2 6.83333333333333 73.06627780927032 -1 -0.19565217391304 -0.5 -0.5 42750.39067133073 1
i 4 181.90063354451485 2 11 69.66137396203837 -1 -0.23913043478261 -0.5 -0.5 45667.78377091242 1
i 5 181.98066022007336 2 6.91666666666667 60 -1 -0.19565217391304 -0.5 -0.5 48661.09103179114 1
i 6 182.0606868956319 2 8.33333333333333 79.69629435303202 -1 -0.06521739130435 -0.5 -0.5 51720.54517187549 1
i 2 182.14071357119042 2 10.75 64.99061142910551 -1 0.06521739130435 -0.5 -0.5 54835.40722524411 1
i 6 182.22074024674893 2 6.25 66.02149790421637 -1 0.06521739130435 -0.5 -0.5 57994.01422099114 1
i 5 182.30076692230745 2 10.66666666666667 72.44168678568164 -1 0.19565217391304 -0.5 -0.5 61183.83871716345 1
i 4 182.38079359786596 2 8.08333333333333 61.93598217880205 -1 -0.32608695652174 -0.5 -0.5 64391.5599264677 1
i 5 182.4608202734245 2 7.91666666666667 78.63263044677348 -1 -0.06521739130435 -0.5 -0.5 67603.14600219904 1
i 2 182.54084694898302 2 11 66.49286749434562 -1 0.10869565217391 -0.5 -0.5 70803.946885883 1
i 6 182.62087362454153 2 6.16666666666667 62.62224531194411 -1 0.19565217391304 -0.5 -0.5 73978.79695514284 1
i 6 182.70090030010005 2 9.66666666666667 75.32816221891161 -1 0.06521739130435 -0.5 -0.5 77112.1265540665 1
i 3 182.78092697565856 2 9.16666666666667 63.49005368171444 -1 0.19565217391304 -0.5 -0.5 80188.0813416384 1
i 5 182.86095365121707 2 7.25 74.87551359119996 -1 -0.06521739130435 -0.5 -0.5 83190.64825898712 1
i 3 182.94098032677562 2 11 68.82458786167508 -1 0.10869565217391 -0.5 -0.5 86103.78679606983 1
i 5 183.02100700233413 2 6.66666666666667 60.30430098078386 -1 -0.02173913043478 -0.5 -0.5 88911.5641348202 1
i 6 183.10103367789264 2 8.66666666666667 78.87027095700087 -1 0.06521739130435 -0.5 -0.5 91598.29266111486 1
i 2 183.18106035345116 2 10.5 64.66977550218394 -1 0.10869565217391 -0.5 -0.5 94148.66827354692 1
i 6 183.26108702900967 2 6.33333333333333 68.16197951919811 -1 -0.10869565217391 -0.5 -0.5 96547.90787453396 1
i 5 183.34111370456822 2 10.66666666666667 71.60677727546914 -1 0.19565217391304 -0.5 -0.5 98781.88440975455 1
i 4 183.42114038012673 2 7.66666666666667 61.0626081344689 -1 0.15217391304348 -0.5 -0.5 100837.25782580223 1
i 5 183.50116705568524 2 7 79.5717028975283 -1 -0.10869565217391 -0.5 -0.5 102701.60034386121 1
i 2 183.58119373124376 2 11 65.87316476319577 -1 -0.15217391304348 -0.5 -0.5 104363.51449861586 1
i 6 183.66122040680227 2 6.08333333333333 63.22575868353616 -1 -0.15217391304348 -0.5 -0.5 105812.74246642666 1
i 6 183.7412470823608 2 9 74.30674732312531 -1 -0.06521739130435 -0.5 -0.5 107040.26530369674 1
i 3 183.82127375791933 2 8.83333333333333 63.19589291013995 -1 -0.19565217391304 -0.5 -0.5 108038.39083435039 1
i 5 183.90130043347784 2 7.66666666666667 76.16759137173791 -1 0.06521739130435 -0.5 -0.5 108800.82906252379 1
i 3 183.98132710903636 2 11 68.09457495505536 -1 -0.02173913043478 -0.5 -0.5 109322.75414110819 1
i 6 184.06135378459487 2 6.83333333333333 61.05661491352632 -1 -0.10869565217391 -0.5 -0.5 109600.85209624279 1
i 6 184.14138046015339 2 9 77.7957810001194 -1 -0.15217391304348 -0.5 -0.5 109633.35368973149 1
i 2 184.22140713571193 2 10.08333333333333 64.31320021263447 -1 -0.06521739130435 -0.5 -0.5 109420.05199284144 1
i 5 184.30143381127044 2 6.58333333333333 70.5013201599538 -1 -0.28260869565217 -0.5 -0.5 108962.30444305406 1
i 4 184.38146048682896 2 10.83333333333333 70.71343896663333 -1 -0.02173913043478 -0.5 -0.5 108263.01935701666 1
i 5 184.46148716238747 2 7.25 60.34557002462854 -1 0.15217391304348 -0.5 -0.5 107326.62707504723 1
i 5 184.54151383794598 2 8.25 79.99147336037983 -1 -0.02173913043478 -0.5 -0.5 106159.03611190103 1
i 2 184.62154051350453 2 10.91666666666667 65.40247995437488 -1 0.02173913043478 -0.5 -0.5 104767.57488202893 1
i 6 184.70156718906304 2 6.08333333333333 64.19995673706126 -1 0.02173913043478 -0.5 -0.5 103160.91975227282 1
i 6 184.78159386462156 2 10.16666666666667 73.39495735965284 -1 -0.19565217391304 -0.5 -0.5 101349.01034790784 1
i 4 184.86162054018007 2 8.83333333333333 62.76270841205903 -1 -0.23913043478261 -0.5 -0.5 99342.95319670673 1
i 5 184.94164721573858 2 7.58333333333333 77.31411894178444 -1 -0.10869565217391 -0.5 -0.5 97154.9149376291 1
i 3 185.02167389129713 2 10 67.3445983794929 -1 -0.19565217391304 -0.5 -0.5 94798.00644401602 1
i 6 185.10170056685564 2 6.58333333333333 61.88435178867137 -1 -0.19565217391304 -0.5 -0.5 92286.15931376399 1
i 6 185.18172724241415 2 9.33333333333333 76.62849360358928 -1 0.19565217391304 -0.5 -0.5 89633.99625972203 1
i 3 185.26175391797267 2 9.66666666666667 63.90493136722475 -1 0.15217391304348 -0.5 -0.5 86856.69699120056 1
i 5 185.34178059353118 2 6.91666666666667 72.78617730502052 -1 -0.15217391304348 -0.5 -0.5 83969.86121166452 1
i 4 185.4218072690897 2 10.91666666666667 69.78156241396175 -1 0.06521739130435 -0.5 -0.5 80989.37036786915 1
i 5 185.50183394464824 2 6 60.00512987521286 -1 -0.02173913043478 -0.5 -0.5 77931.24977236957 1
i 6 185.58186062020675 2 8.5 79.77164961534794 -1 -0.06521739130435 -0.5 -0.5 74811.53268477204 1
i 2 185.66188729576527 2 10.75 65.0342062126755 -1 -0.28260869565217 -0.5 -0.5 71646.12787844636 1
i 6 185.74191397132378 2 6.08333333333333 65.76993359907783 -1 0.06521739130435 -0.5 -0.5 68450.69213996636 1
i 5 185.8219406468823 2 10.41666666666667 72.55055869680601 -1 -0.10869565217391 -0.5 -0.5 65240.50904971579 1
i 4 185.90196732244084 2 8.16666666666667 62.04807793653842 -1 -0.06521739130435 -0.5 -0.5 62030.375276179635 1
i 5 185.98199399799935 2 7.83333333333333 78.4842968221098 -1 -0.10869565217391 -0.5 -0.5 58834.495485260086 1
i 2 186.06202067355787 2 11 66.58647491576927 -1 0.23913043478261 -0.5 -0.5 55666.38682212998 1
i 6 186.14204734911638 2 6.5 62.54755700393692 -1 0.10869565217391 -0.5 -0.5 52538.793769169686 1
i 6 186.2220740246749 2 9.66666666666667 75.47322157385062 -1 -0.10869565217391 -0.5 -0.5 49463.614022087204 1
i 3 186.3021007002334 2 9.25 63.53156876222657 -1 -0.10869565217391 -0.5 -0.5 46451.835860089304 1
i 5 186.38212737579195 2 7.08333333333333 74.67115244424228 -1 -0.19565217391304 -0.5 -0.5 43513.487317907326 1
i 3 186.46215405135047 2 11 68.92684542814592 -1 -0.02173913043478 -0.5 -0.5 40657.59730000889 1
i 5 186.54218072690898 2 6.83333333333333 60.23131648391907 -1 -0.10869565217391 -0.5 -0.5 37892.16861339039 1
i 6 186.6222074024675 2 8.58333333333333 78.99907604616682 -1 0.02173913043478 -0.5 -0.5 35224.16273726748 1
i 2 186.702234078026 2 10.58333333333333 64.71283450308233 -1 0.06521739130435 -0.5 -0.5 32659.495998109498 1
i 6 186.78226075358455 2 6.75 67.86175845806822 -1 -0.23913043478261 -0.5 -0.5 30203.04667910383 1
i 5 186.86228742914307 2 10.58333333333333 71.71961832921404 -1 -0.06521739130435 -0.5 -0.5 27858.672465900407 1
i 4 186.94231410470158 2 7.83333333333333 61.17443397779921 -1 -0.19565217391304 -0.5 -0.5 25629.237517277696 1
i 5 187.0223407802601 2 7.91666666666667 79.47268907369858 -1 -0.19565217391304 -0.5 -0.5 23516.64835129083 1
i 2 187.1023674558186 2 11 65.9456594017053 -1 0.02173913043478 -0.5 -0.5 21521.897655688408 1
i 6 187.18239413137715 2 6 63.1330595176179 -1 -0.02173913043478 -0.5 -0.5 19645.115066471466 1
i 6 187.26242080693567 2 9 74.43433797784724 -1 -0.06521739130435 -0.5 -0.5 17885.62391097835 1
i 3 187.34244748249418 2 8.91666666666667 63.2373767592958 -1 -0.02173913043478 -0.5 -0.5 16242.002881654857 1
i 5 187.4224741580527 2 7.33333333333333 76.01376853225179 -1 0.02173913043478 -0.5 -0.5 14712.151593674644 1
i 3 187.5025008336112 2 11 68.18986786721527 -1 -0.02173913043478 -0.5 -0.5 13293.358983137045 1
i 6 187.58252750916975 2 6.58333333333333 60.94516577408771 -1 -0.10869565217391 -0.5 -0.5 11982.373521896918 1
i 6 187.66255418472826 2 8.91666666666667 77.94496858690667 -1 -0.23913043478261 -0.5 -0.5 10775.474259214341 1
i 2 187.74258086028678 2 10.08333333333333 64.36393925703639 -1 -0.10869565217391 -0.5 -0.5 9668.541747894098 1
i 5 187.8226075358453 2 6.5 70.18971478079143 -1 -0.06521739130435 -0.5 -0.5 8657.127972188075 1
i 4 187.9026342114038 2 10.83333333333333 70.83522773675045 -1 0.19565217391304 -0.5 -0.5 7736.524464593965 1
i 5 187.98266088696232 2 7.33333333333333 60.42332815750635 -1 0.28260869565217 -0.5 -0.5 6901.827877314219 1
i 5 188.06268756252086 2 8.16666666666667 79.97179101414733 -1 -0.10869565217391 -0.5 -0.5 6148.002359558173 1
i 2 188.14271423807938 2 10 65.45776775969375 -1 -0.15217391304348 -0.5 -0.5 5469.938182346116 1
i 6 188.2227409136379 2 6 64.03906345533684 -1 -0.02173913043478 -0.5 -0.5 4862.5061461312625 1
i 6 188.3027675891964 2 10.41666666666667 73.51074978417014 -1 -0.02173913043478 -0.5 -0.5 4320.607401593363 1
i 4 188.38279426475492 2 8.5 62.83531477690073 -1 0.02173913043478 -0.5 -0.5 3839.2184086343486 1
i 5 188.46282094031346 2 7.66666666666667 77.16061957594079 -1 -0.06521739130435 -0.5 -0.5 3413.4308513148885 1
i 3 188.54284761587198 2 10.91666666666667 67.446475724746 -1 0.02173913043478 -0.5 -0.5 3038.4864156720528 1
i 6 188.6228742914305 2 6.58333333333333 61.78162788738766 -1 -0.02173913043478 -0.5 -0.5 2709.806421704338 1
i 6 188.702900966989 2 9.33333333333333 76.78473125711638 -1 -0.28260869565217 -0.5 -0.5 2423.0163791297546 1
i 3 188.78292764254752 2 9.91666666666667 63.95957657912022 -1 0.10869565217391 -0.5 -0.5 2173.9656077904688 1
i 5 188.86295431810603 2 6.75 72.49888038370453 -1 0.15217391304348 -0.5 -0.5 1958.742126999248 1
i 4 188.94298099366458 2 10 69.90319222936421 -1 -0.19565217391304 -0.5 -0.5 1773.6830730921356 1
i 5 189.0230076692231 2 7 60.02058057747442 -1 -0.06521739130435 -0.5 -0.5 1615.3809505698116 1
i 6 189.1030343447816 2 8.5 79.83696275252987 -1 -0.02173913043478 -0.5 -0.5 1480.6860592578219 1
i 2 189.18306102034012 2 10.83333333333333 65.07868028375958 -1 -0.10869565217391 -0.5 -0.5 1366.7054679119044 1
i 6 189.26308769589863 2 6.08333333333333 65.52788236438013 -1 -0.02173913043478 -0.5 -0.5 1270.7989237752129 1
i 5 189.34311437145718 2 10.41666666666667 72.65972275303321 -1 -0.02173913043478 -0.5 -0.5 1190.5720981281372 1
i 4 189.4231410470157 2 8.16666666666667 62.15710380367688 -1 -0.06521739130435 -0.5 -0.5 1123.8675703252754 1
i 5 189.5031677225742 2 7.83333333333333 78.33296289223428 -1 -0.10869565217391 -0.5 -0.5 1068.7539478119816 1
i 2 189.58319439813272 2 11 66.68233213832013 -1 0.23913043478261 -0.5 -0.5 1023.5135078825755 1
i 6 189.66322107369123 2 6.25 62.47085540463127 -1 -0.06521739130435 -0.5 -0.5 986.6287292860104 1
i 6 189.74324774924978 2 9.58333333333333 75.6205428056412 -1 0.23913043478261 -0.5 -0.5 956.7680590836118 1
i 3 189.8232744248083 2 9.41666666666667 63.57497341410496 -1 0.19565217391304 -0.5 -0.5 932.7712333200994 1
i 5 189.9033011003668 2 7.08333333333333 74.45625709143144 -1 -0.02173913043478 -0.5 -0.5 913.6344400157294 1
i 3 189.98332777592532 2 11.08333333333333 69.03154597621659 -1 -0.06521739130435 -0.5 -0.5 898.4955806392815 1
i 5 190.06335445148383 2 6.75 60.16739516360426 -1 0.02173913043478 -0.5 -0.5 886.6198524738775 1
i 6 190.14338112704237 2 8.66666666666667 79.12324928046678 -1 -0.23913043478261 -0.5 -0.5 877.3858399859059 1
i 2 190.2234078026009 2 10.5 64.75533770951958 -1 -0.02173913043478 -0.5 -0.5 870.2722692376335 1
i 6 190.3034344781594 2 6.41666666666667 67.56543283239108 -1 -0.19565217391304 -0.5 -0.5 864.8455462558439 1
i 5 190.38346115371792 2 10.66666666666667 71.83140439838998 -1 -0.10869565217391 -0.5 -0.5 860.748168705023 1
i 4 190.46348782927643 2 7.75 61.28860975896129 -1 -0.10869565217391 -0.5 -0.5 857.6880707431011 1
i 5 190.54351450483495 2 7 79.36479831560652 -1 -0.06521739130435 -0.5 -0.5 855.4289339887561 1
i 2 190.6235411803935 2 11.08333333333333 66.02094142546454 -1 -0.06521739130435 -0.5 -0.5 853.7814734286636 1
i 6 190.703567855952 2 6.16666666666667 63.04631977611868 -1 -0.10869565217391 -0.5 -0.5 852.5956860650655 1
i 6 190.78359453151052 2 9 74.56397359085861 -1 -0.06521739130435 -0.5 -0.5 851.754032275088 1
i 3 190.86362120706903 2 8 63.27688775536808 -1 0.32608695652174 -0.5 -0.5 851.1655052558281 1
i 5 190.94364788262754 2 7.33333333333333 75.85692433726604 -1 -0.28260869565217 -0.5 -0.5 850.7605325105534 1
i 3 191.0236745581861 2 11.08333333333333 68.28478273125295 -1 0.10869565217391 -0.5 -0.5 850.4866449619249 1
i 5 191.1037012337446 2 6.66666666666667 60.83559582063614 -1 -0.3695652173913 -0.5 -0.5 850.3048437626937 1
i 6 191.18372790930312 2 8 78.09239994328767 -1 -0.32608695652174 -0.5 -0.5 850.1865919633927 1
i 2 191.26375458486163 2 10.33333333333333 64.41354068101013 -1 -0.02173913043478 -0.5 -0.5 850.1113575987923 1
i 5 191.34378126042014 2 6.5 69.87800054661693 -1 -0.23913043478261 -0.5 -0.5 850.064636149591 1
i 4 191.42380793597866 2 10.75 70.95600551166734 -1 0.3695652173913 -0.5 -0.5 850.0363833850954 1
i 5 191.5038346115372 2 7.5 60.50709255197725 -1 -0.19565217391304 -0.5 -0.5 850.0197939535423 1
i 5 191.58386128709571 2 8.08333333333333 79.94082656325648 -1 -0.19565217391304 -0.5 -0.5 850.0103664218883 1
i 2 191.66388796265423 2 10 65.51493377052961 -1 -0.02173913043478 -0.5 -0.5 850.0052014548172 1
i 6 191.74391463821274 2 6.08333333333333 63.88873829970282 -1 -0.10869565217391 -0.5 -0.5 850.0024861659624 1
i 6 191.82394131377126 2 10.08333333333333 73.62779836383909 -1 -0.15217391304348 -0.5 -0.5 850.0011241068081 1
i 4 191.9039679893298 2 8.66666666666667 62.90270838153422 -1 -0.32608695652174 -0.5 -0.5 850.0004766508417 1
i 5 191.98399466488831 2 7.66666666666667 77.00817560262026 -1 -0.10869565217391 -0.5 -0.5 850.000187492953 1
i 3 192.06402134044686 2 10 67.54774198745753 -1 -0.28260869565217 -0.5 -0.5 850.0000674696055 1
i 6 192.14404801600537 2 6.5 61.67596392101788 -1 0.10869565217391 -0.5 -0.5 850.0000218090169 1
i 6 192.22407469156389 2 9.33333333333333 76.94081436768235 -1 0.10869565217391 -0.5 -0.5 850.0000061785123 1
i 3 192.30410136712243 2 9.75 64.01450470945468 -1 -0.23913043478261 -0.5 -0.5 850.0000014824368 1
i 5 192.38412804268094 2 6.75 72.20539780082248 -1 -0.06521739130435 -0.5 -0.5 850.0000002866296 1
i 4 192.46415471823946 2 10 70.02590180137516 -1 -0.02173913043478 -0.5 -0.5 850.0000000413845 1
i 5 192.54418139379797 2 7.08333333333333 60.04595515694093 -1 0.10869565217391 -0.5 -0.5 850.0000000039357 1
i 5 192.62420806935648 2 8.33333333333333 79.8917444704737 -1 0.10869565217391 -0.5 -0.5 850.0000000001959 1
i 2 192.70423474491503 2 10.75 65.12418990409851 -1 -0.23913043478261 -0.5 -0.5 850.0000000000032 1
i 6 192.78426142047354 2 6.08333333333333 65.29585597764381 -1 -0.32608695652174 -0.5 -0.5 850 1
i 5 192.86428809603206 2 10.33333333333333 72.76935684703285 -1 0.10869565217391 -0.5 -0.5 850 1
i 4 192.94431477159057 2 8.33333333333333 62.26244710805614 -1 -0.02173913043478 -0.5 -0.5 850 1
i 5 193.02434144714908 2 7.75 78.17943752292302 -1 0.10869565217391 -0.5 -0.5 849.9999999999997 1
i 2 193.1043681227076 2 11.08333333333333 66.78014642408775 -1 -0.10869565217391 -0.5 -0.5 849.99999999995 1
i 6 193.18439479826614 2 6.33333333333333 62.39144954822267 -1 -0.28260869565217 -0.5 -0.5 849.9999999985849 1
i 6 193.26442147382465 2 9.5 75.76995663315208 -1 -0.28260869565217 -0.5 -0.5 849.9999999817288 1
i 3 193.34444814938317 2 9.33333333333333 63.62037921171769 -1 -0.32608695652174 -0.5 -0.5 849.9999998548915 1
i 5 193.42447482494168 2 7.08333333333333 74.23053392235192 -1 -0.02173913043478 -0.5 -0.5 849.9999991723848 1
i 3 193.5045015005002 2 11.08333333333333 69.1388412407794 -1 0.06521739130435 -0.5 -0.5 849.9999962878915 1
i 5 193.58452817605874 2 6.75 60.11320797524613 -1 0.15217391304348 -0.5 -0.5 849.9999861261924 1
i 6 193.66455485161725 2 8.66666666666667 79.24209705762922 -1 0.3695652173913 -0.5 -0.5 849.9999550687372 1
i 2 193.74458152717577 2 10.5 64.79746181222511 -1 -0.28260869565217 -0.5 -0.5 849.999870367837 1
i 6 193.82460820273428 2 6.33333333333333 67.27373674731312 -1 -0.19565217391304 -0.5 -0.5 849.9996599672243 1
i 5 193.9046348782928 2 10.66666666666667 71.94225727129304 -1 0.15217391304348 -0.5 -0.5 849.9991765297265 1
i 4 193.9846615538513 2 7 61.40449999468605 -1 -0.19565217391304 -0.5 -0.5 849.9981367890559 1
i 5 194.06468822940985 2 7 79.24862483225338 -1 0.10869565217391 -0.5 -0.5 849.9960240060165 1
i 2 194.14471490496837 2 11.08333333333333 66.09908914318851 -1 -0.19565217391304 -0.5 -0.5 849.991937300343 1
i 6 194.22474158052688 2 6.08333333333333 62.96451791683327 -1 0.02173913043478 -0.5 -0.5 849.9843669605904 1
i 6 194.3047682560854 2 9 74.69577459583134 -1 -0.23913043478261 -0.5 -0.5 849.9708695554446 1
i 3 194.3847949316439 2 9.08333333333333 63.31507237834744 -1 -0.10869565217391 -0.5 -0.5 849.9476108699187 1
i 5 194.46482160720245 2 7.33333333333333 75.6959583692044 -1 -0.3695652173913 -0.5 -0.5 849.9087385005769 1
i 3 194.54484828276097 2 11.08333333333333 68.3796695234988 -1 0.23913043478261 -0.5 -0.5 849.8455395389602 1
i 5 194.62487495831948 2 6.66666666666667 60.72882915856896 -1 -0.28260869565217 -0.5 -0.5 849.7453323667036 1
i 6 194.704901633878 2 8 78.23787945513632 -1 0.19565217391304 -0.5 -0.5 849.5900354324971 1
i 2 194.7849283094365 2 10.33333333333333 64.46198319723108 -1 -0.19565217391304 -0.5 -0.5 849.3543502665314 1
i 5 194.86495498499505 2 6.5 69.5666836868175 -1 -0.32608695652174 -0.5 -0.5 849.0034912258898 1
i 4 194.94498166055357 2 10.75 71.07565353516574 -1 0.02173913043478 -0.5 -0.5 848.4903908870191 1
i 5 195.02500833611208 2 7.5 60.59639711977283 -1 0.23913043478261 -0.5 -0.5 847.7523079510586 1
i 5 195.1050350116706 2 8 79.8987490842985 -1 -0.10869565217391 -0.5 -0.5 846.7067643455279 1
i 2 195.1850616872291 2 10 65.57408697224993 -1 -0.28260869565217 -0.5 -0.5 845.2467402202054 1
i 6 195.26508836278765 2 6 63.7486668229012 -1 -0.10869565217391 -0.5 -0.5 843.2350600497009 1
i 6 195.34511503834617 2 10.25 73.74617746442851 -1 0.10869565217391 -0.5 -0.5 840.497910336737 1
i 4 195.42514171390468 2 8.66666666666667 62.96508743292662 -1 -0.15217391304348 -0.5 -0.5 836.8174396753731 1
i 5 195.5051683894632 2 7.5 76.85671597899919 -1 -0.28260869565217 -0.5 -0.5 831.9234053374554 1
i 3 195.5851950650217 2 10 67.64818576533878 -1 0.23913043478261 -0.5 -0.5 825.4838471712657 1
i 6 195.66522174058022 2 6.66666666666667 61.56778925550697 -1 -0.06521739130435 -0.5 -0.5 817.0947894484408 1
i 6 195.74524841613876 2 9.16666666666667 77.09645924575307 -1 -0.10869565217391 -0.5 -0.5 806.2689942736099 1
i 3 195.82527509169728 2 9 64.06940769838698 -1 -0.10869565217391 -0.5 -0.5 792.4238160928244 1
i 5 195.9053017672558 2 6.75 71.90673996447819 -1 0.32608695652174 -0.5 -0.5 774.8682354139078 1
i 4 195.9853284428143 2 10 70.14932731033397 -1 0.19565217391304 -0.5 -0.5 752.7891806930984 1
i 5 196.06535511837282 2 7.16666666666667 60.08078564215715 -1 0.06521739130435 -0.5 -0.5 725.2372799564961 1
i 5 196.14538179393136 2 8.33333333333333 79.93560752877107 -1 -0.06521739130435 -0.5 -0.5 691.1122175227002 1
i 2 196.22540846948988 2 10 65.17087542800118 -1 -0.02173913043478 -0.5 -0.5 649.1479054961853 1
i 6 196.3054351450484 2 6.08333333333333 65.07426213384248 -1 0.02173913043478 -0.5 -0.5 597.8977137511624 1
i 6 196.3854618206069 2 10.33333333333333 72.8796193135311 -1 -0.10869565217391 -0.5 -0.5 535.7200350961883 1
i 4 196.46548849616542 2 8.25 62.36357971361016 -1 -0.19565217391304 -0.5 -0.5 460.7644933245373 1
i 5 196.54551517172393 2 7 78.0244697148517 -1 -0.02173913043478 -0.5 -0.5 370.9591299996871 1
i 2 196.62554184728248 2 10 66.87958581140249 -1 -0.06521739130435 -0.5 -0.5 263.99893017781136 1
i 6 196.705568522841 2 6.58333333333333 62.30881955834259 -1 -0.32608695652174 -0.5 -0.5 137.33606690458865 1
i 6 196.7855951983995 2 9 75.92124209816384 -1 -0.10869565217391 -0.5 -0.5 -11.82774164090735 1
i 3 196.86562187395802 2 9.41666666666667 63.66778107612799 -1 -0.10869565217391 -0.5 -0.5 -186.546360886857 1
i 5 196.94564854951653 2 7.08333333333333 73.99395547120798 -1 0.06521739130435 -0.5 -0.5 -390.1314526285518 1
i 3 197.02567522507508 2 11.08333333333333 69.24878251158465 -1 -0.15217391304348 -0.5 -0.5 -626.151377402882 1
i 5 197.1057019006336 2 6 60.0692770359128 -1 -0.02173913043478 -0.5 -0.5 -898.4264079274766 1
i 6 197.1857285761921 2 8.58333333333333 79.35487241141843 -1 0.19565217391304 -0.5 -0.5 -1211.019899702125 1
i 2 197.26575525175062 2 10.75 64.83939674632065 -1 -0.23913043478261 -0.5 -0.5 -1568.2250985431426 1
i 6 197.34578192730913 2 6.16666666666667 66.98745160092835 -1 -0.02173913043478 -0.5 -0.5 -1974.5473075742927 1
i 5 197.42580860286768 2 10.58333333333333 72.05232485888257 -1 0.23913043478261 -0.5 -0.5 -2434.6811879153584 1
i 4 197.5058352784262 2 7.91666666666667 61.5214163302003 -1 0.02173913043478 -0.5 -0.5 -2953.4830276364487 1
i 5 197.5858619539847 2 7.83333333333333 79.12484365699386 -1 -0.23913043478261 -0.5 -0.5 -3535.9378819922363 1
i 2 197.66588862954322 2 11.16666666666667 66.18014685178865 -1 -0.02173913043478 -0.5 -0.5 -4187.1215637354 1
i 6 197.74591530510173 2 6.33333333333333 62.88655718500684 -1 0.02173913043478 -0.5 -0.5 -4912.157544557699 1
i 6 197.82594198066028 2 9.75 74.82984938709819 -1 -0.06521739130435 -0.5 -0.5 -5716.16891623822 1
i 3 197.9059686562188 2 9 63.35258254014244 -1 0.02173913043478 -0.5 -0.5 -6604.225651661789 1
i 5 197.9859953317773 2 7.25 75.52970430662104 -1 -0.19565217391304 -0.5 -0.5 -7581.287499988103 1
i 3 198.06602200733582 2 11.08333333333333 68.47492840813624 -1 -0.02173913043478 -0.5 -0.5 -8652.142945366086 1
i 5 198.14604868289433 2 6.75 60.625843704038 -1 -0.23913043478261 -0.5 -0.5 -9821.344752955805 1
i 6 198.22607535845285 2 8.91666666666667 78.38117921125708 -1 -0.02173913043478 -0.5 -0.5 -11093.142717893863 1
i 2 198.3061020340114 2 10.25 64.50927994406926 -1 0.06521739130435 -0.5 -0.5 -12471.414320374677 1
i 5 198.3861287095699 2 6.58333333333333 69.25623569831029 -1 0.10869565217391 -0.5 -0.5 -13959.594071342874 1
i 5 198.46615538512842 2 10.83333333333333 71.19409153775004 -1 -0.15217391304348 -0.5 -0.5 -15560.602406692418 1
i 5 198.54618206068693 2 7.58333333333333 60.69079281081993 -1 -0.23913043478261 -0.5 -0.5 -17276.77505139984 1
i 5 198.62620873624545 2 8.08333333333333 79.84576503605845 -1 -0.06521739130435 -0.5 -0.5 -19109.79382727216 1
i 2 198.706235411804 2 10 65.6353440843855 -1 -0.23913043478261 -0.5 -0.5 -21060.61991718027 1
i 6 198.7862620873625 2 6.08333333333333 63.61845270583972 -1 0.02173913043478 -0.5 -0.5 -23129.4306236699 1
i 6 198.86628876292102 2 10.08333333333333 73.86596927158365 -1 -0.10869565217391 -0.5 -0.5 -25315.56066936318 1
i 4 198.94631543847953 2 8.66666666666667 63.02272915744639 -1 -0.32608695652174 -0.5 -0.5 -27617.449079782764 1
i 5 199.02634211403804 2 7.5 76.70603300656713 -1 0.06521739130435 -0.5 -0.5 -30032.592665521544 1
i 3 199.10636878959656 2 11 67.74766036633423 -1 -0.10869565217391 -0.5 -0.5 -32557.50707954878 1
i 6 199.1863954651551 2 6.5 61.45759611820787 -1 -0.02173913043478 -0.5 -0.5 -35187.69636706543 1
i 6 199.26642214071362 2 9.16666666666667 77.2514093806965 -1 -0.10869565217391 -0.5 -0.5 -37917.63184966882 1
i 3 199.34644881627213 2 9.83333333333333 64.12400674754566 -1 0.02173913043478 -0.5 -0.5 -40740.741093587916 1
i 5 199.42647549183064 2 6.75 71.60388260399161 -1 0.06521739130435 -0.5 -0.5 -43649.40760388384 1
i 4 199.50650216738916 2 10 70.27311691928763 -1 0.02173913043478 -0.5 -0.5 -46634.981764472235 1
i 5 199.5865288429477 2 7.16666666666667 60.12455653535602 -1 0.19565217391304 -0.5 -0.5 -49687.803408651635 1
i 5 199.66655551850621 2 8.25 79.96826750467841 -1 -0.02173913043478 -0.5 -0.5 -52797.236258669334 1
i 2 199.74658219406473 2 10.91666666666667 65.21886265904772 -1 -0.15217391304348 -0.5 -0.5 -55951.71431762459 1
i 6 199.82660886962324 2 6 64.86339995697274 -1 -0.19565217391304 -0.5 -0.5 -59138.80013482524 1
i 6 199.90663554518176 2 10.25 72.99064761658252 -1 -0.15217391304348 -0.5 -0.5 -62345.254699426696 1
i 4 199.9866622207403 2 8.41666666666667 62.46006926182535 -1 -0.19565217391304 -0.5 -0.5 -65557.11854887508 1
i 5 200.0666888962988 2 7.83333333333333 77.86873093866747 -1 -0.10869565217391 -0.5 -0.5 -68759.80351153965 1
i 2 200.14671557185733 2 10.91666666666667 66.98029116100784 -1 0.06521739130435 -0.5 -0.5 -71938.19433933086 1
i 6 200.22674224741584 2 6.33333333333333 62.22261856515101 -1 -0.19565217391304 -0.5 -0.5 -75076.75932901725 1
i 6 200.30676892297436 2 9.41666666666667 76.07413468694564 -1 -0.06521739130435 -0.5 -0.5 -78159.66888309461 1
i 3 200.3867955985329 2 9.41666666666667 63.71706987767151 -1 0.15217391304348 -0.5 -0.5 -81170.92082484333 1
i 5 200.4668222740914 2 6.91666666666667 73.746751420207 -1 0.10869565217391 -0.5 -0.5 -84094.47116034798 1
i 3 200.54684894964993 2 11 69.36132243330952 -1 -0.02173913043478 -0.5 -0.5 -86914.3688748741 1
i 5 200.62687562520844 2 6.83333333333333 60.03596356401464 -1 -0.10869565217391 -0.5 -0.5 -89614.8932640649 1
i 6 200.70690230076696 2 8.91666666666667 79.46079888451301 -1 -0.19565217391304 -0.5 -0.5 -92180.69223387651 1
i 2 200.78692897632547 2 10.58333333333333 64.88134104799852 -1 0.15217391304348 -0.5 -0.5 -94596.91995831096 1
i 6 200.866955651884 2 6.25 66.70738320876261 -1 -0.15217391304348 -0.5 -0.5 -96849.37226185258 1
i 5 200.94698232744253 2 10.58333333333333 72.16177857694244 -1 0.10869565217391 -0.5 -0.5 -98924.61809501125 1
i 4 201.02700900300104 2 7.91666666666667 61.63862779406624 -1 0.23913043478261 -0.5 -0.5 -100810.12549653748 1
i 5 201.10703567855955 2 7 78.99420263431419 -1 -0.02173913043478 -0.5 -0.5 -102494.38048493234 1
i 2 201.18706235411807 2 11 66.26411693571643 -1 -0.10869565217391 -0.5 -0.5 -103966.99739405693 1
i 6 201.2670890296766 2 6.16666666666667 62.81129420889981 -1 -0.19565217391304 -0.5 -0.5 -105218.81926233953 1
i 6 201.34711570523513 2 9.75 74.9662862866893 -1 -0.23913043478261 -0.5 -0.5 -106242.00700077039 1
i 3 201.42714238079364 2 9.33333333333333 63.39005034840898 -1 -0.02173913043478 -0.5 -0.5 -107030.11620017081 1
i 5 201.50716905635215 2 7.33333333333333 75.35697726156776 -1 -0.15217391304348 -0.5 -0.5 -107578.16059090817 1
i 3 201.58719573191067 2 11 68.57098948106912 -1 -0.10869565217391 -0.5 -0.5 -107882.66133626831 1
i 5 201.66722240746918 2 6.66666666666667 60.52765152818503 -1 0.02173913043478 -0.5 -0.5 -107941.6815213218 1
i 6 201.74724908302773 2 8.83333333333333 78.52202456085132 -1 -0.15217391304348 -0.5 -0.5 -107754.84538972692 1
i 2 201.82727575858624 2 10.33333333333333 64.55547611136 -1 -0.23913043478261 -0.5 -0.5 -107323.34207845003 1
i 5 201.90730243414475 2 6.41666666666667 68.94711589889286 -1 -0.15217391304348 -0.5 -0.5 -106649.91380183445 1
i 5 201.98732910970327 2 10.66666666666667 71.31127573063513 -1 -0.10869565217391 -0.5 -0.5 -105738.82863864778 1
i 5 202.06735578526178 2 7.58333333333333 60.78983827457476 -1 -0.28260869565217 -0.5 -0.5 -104595.83827555433 1
i 5 202.14738246082032 2 8 79.7821181236205 -1 -0.28260869565217 -0.5 -0.5 -103228.12125474564 1
i 2 202.22740913637884 2 11.16666666666667 65.69882945587685 -1 0.02173913043478 -0.5 -0.5 -101644.21245926853 1
i 6 202.30743581193735 2 6.08333333333333 63.4976147603612 -1 -0.02173913043478 -0.5 -0.5 -99853.91974396702 1
i 6 202.38746248749587 2 10 73.98726665376779 -1 -0.15217391304348 -0.5 -0.5 -97868.2287803327 1
i 3 202.46748916305438 2 8.83333333333333 63.07598545010634 -1 0.19565217391304 -0.5 -0.5 -95699.19732747028 1
i 5 202.54751583861292 2 7.5 76.55577640045604 -1 -0.06521739130435 -0.5 -0.5 -93359.84026667745 1
i 3 202.62754251417144 2 11.08333333333333 67.84609125807837 -1 -0.3695652173913 -0.5 -0.5 -90864.00684214929 1
i 6 202.70756918972995 2 6.58333333333333 61.34593578281925 -1 0.19565217391304 -0.5 -0.5 -88226.25163335225 1
i 6 202.78759586528847 2 9.08333333333333 77.40543639686962 -1 0.45652173913043 -0.5 -0.5 -85461.70084495879 1
i 3 202.86762254084698 2 9 64.17805932078994 -1 -0.10869565217391 -0.5 -0.5 -82585.91553678835 1
i 5 202.94764921640552 2 6.66666666666667 71.29774095235042 -1 -0.02173913043478 -0.5 -0.5 -79614.75342913934 1
i 4 203.02767589196404 2 10.91666666666667 70.39694208711063 -1 0.23913043478261 -0.5 -0.5 -76564.23090793013 1
i 5 203.10770256752255 2 7.25 60.17672648790891 -1 0.02173913043478 -0.5 -0.5 -73450.38682010602 1
i 5 203.18772924308107 2 8.41666666666667 79.9895379626193 -1 0.28260869565217 -0.5 -0.5 -70289.14959335863 1
i 2 203.26775591863958 2 10.83333333333333 65.26826538400492 -1 -0.15217391304348 -0.5 -0.5 -67096.20913692315 1
i 6 203.3477825941981 2 6.08333333333333 64.66346032929826 -1 -0.15217391304348 -0.5 -0.5 -63886.89488347678 1
i 6 203.42780926975664 2 10.33333333333333 73.10255914802084 -1 0.06521739130435 -0.5 -0.5 -60676.06121785282 1
i 4 203.50783594531515 2 8.33333333333333 62.55158541518509 -1 -0.06521739130435 -0.5 -0.5 -57477.98140876562 1
i 5 203.58786262087366 2 7.83333333333333 77.71280099292929 -1 0.15217391304348 -0.5 -0.5 -54306.25101707133 1
i 2 203.66788929643218 2 10 67.08188965164683 -1 0.3695652173913 -0.5 -0.5 -51173.70160112761 1
i 6 203.7479159719907 2 6.41666666666667 62.1326651499441 -1 -0.06521739130435 -0.5 -0.5 -48092.32537903994 1
i 6 203.82794264754924 2 9 76.2283369002167 -1 -0.15217391304348 -0.5 -0.5 -45073.2113417201 1
i 3 203.90796932310775 2 9.58333333333333 63.76805033594894 -1 0.19565217391304 -0.5 -0.5 -42126.49314270366 1
i 5 203.98799599866626 2 6.91666666666667 73.48938449931873 -1 -0.10869565217391 -0.5 -0.5 -39261.30892298624 1
i 3 204.06802267422478 2 11.08333333333333 69.47632296973227 -1 -0.06521739130435 -0.5 -0.5 -36485.77306472513 1
i 5 204.1480493497833 2 6.83333333333333 60.01346465696935 -1 0.10869565217391 -0.5 -0.5 -33806.959708778595 1
i 6 204.2280760253418 2 8.75 79.55909743968769 -1 -0.15217391304348 -0.5 -0.5 -31230.89772027813 1
i 2 204.30810270090035 2 10 64.9234965594829 -1 0.02173913043478 -0.5 -0.5 -28762.576645718673 1
i 6 204.38812937645886 2 6.16666666666667 66.43433574168441 -1 0.06521739130435 -0.5 -0.5 -26405.96307656149 1
i 5 204.46815605201738 2 10.5 72.2708085275859 -1 -0.23913043478261 -0.5 -0.5 -24164.02671942965 1
i 4 204.5481827275759 2 8.16666666666667 61.7553767634932 -1 -0.06521739130435 -0.5 -0.5 -22038.77537331589 1
i 5 204.6282094031344 2 7.83333333333333 78.85750827751959 -1 -0.15217391304348 -0.5 -0.5 -20031.29793054899 1
i 2 204.70823607869295 2 11.08333333333333 66.3509530527381 -1 0.28260869565217 -0.5 -0.5 -18141.814451620165 1
i 6 204.78826275425146 2 6.16666666666667 62.73757627618052 -1 -0.32608695652174 -0.5 -0.5 -16369.732314482175 1
i 6 204.86828942980998 2 9.91666666666667 75.1051444222545 -1 0.06521739130435 -0.5 -0.5 -14713.707406946827 1
i 3 204.9483161053685 2 9.08333333333333 63.42806082985051 -1 -0.15217391304348 -0.5 -0.5 -13171.709315917358 1
i 5 205.028342780927 2 7.16666666666667 75.17662980273602 -1 -0.28260869565217 -0.5 -0.5 -11741.089469029639 1
i 3 205.10836945648555 2 11 68.66828822555259 -1 0.06521739130435 -0.5 -0.5 -10418.651201940611 1
i 5 205.18839613204406 2 6.66666666666667 60.43527327166339 -1 -0.10869565217391 -0.5 -0.5 -9200.720757100355 1
i 6 205.26842280760258 2 8.75 78.66007975156288 -1 -0.15217391304348 -0.5 -0.5 -8083.21826596102 1
i 2 205.3484494831611 2 10.33333333333333 64.60064647795517 -1 -0.15217391304348 -0.5 -0.5 -7061.727824921847 1
i 6 205.4284761587196 2 6.33333333333333 68.6397961026503 -1 0.02173913043478 -0.5 -0.5 -6131.565844189057 1
i 5 205.50850283427815 2 10.83333333333333 71.42719628459403 -1 -0.10869565217391 -0.5 -0.5 -5287.846926447572 1
i 4 205.58852950983666 2 7.58333333333333 60.89308711182966 -1 -0.23913043478261 -0.5 -0.5 -4525.54661706309 1
i 5 205.66855618539518 2 8 79.70809360655942 -1 0.06521739130435 -0.5 -0.5 -3839.560457521296 1
i 2 205.7485828609537 2 11 65.76467300609922 -1 -0.02173913043478 -0.5 -0.5 -3224.75886722752 1
i 6 205.8286095365122 2 6.16666666666667 63.38558209537565 -1 -0.06521739130435 -0.5 -0.5 -2676.037473760261 1
i 6 205.90863621207072 2 10.16666666666667 74.11017407335736 -1 -0.02173913043478 -0.5 -0.5 -2188.362606465369 1
i 3 205.98866288762926 2 8.75 63.12527861651675 -1 0.06521739130435 -0.5 -0.5 -1756.8117612825995 1
i 5 206.06868956318777 2 7.41666666666667 76.40544880253013 -1 -0.19565217391304 -0.5 -0.5 -1376.608934328273 1
i 3 206.1487162387463 2 11 67.9434814659097 -1 -0.15217391304348 -0.5 -0.5 -1043.1548067052013 1
i 6 206.2287429143048 2 6.5 61.23341950590572 -1 -0.19565217391304 -0.5 -0.5 -752.0518420186212 1
i 6 206.30876958986332 2 9.08333333333333 77.55833740361041 -1 -0.06521739130435 -0.5 -0.5 -499.1244301547587 1
i 2 206.38879626542186 2 9 64.2313630363651 -1 -0.15217391304348 -0.5 -0.5 -280.43427517316553 1
i 5 206.46882294098037 2 6 70.98915354211735 -1 -0.10869565217391 -0.5 -0.5 -92.29128107629973 1
i 4 206.5488496165389 2 10 70.52050564641425 -1 -0.19565217391304 -0.5 -0.5 68.73976370690187 1
i 5 206.6288762920974 2 7.16666666666667 60.2367468149137 -1 -0.23913043478261 -0.5 -0.5 205.8363642430991 1
i 5 206.70890296765592 2 8.5 79.99932145400207 -1 -0.15217391304348 -0.5 -0.5 321.91899158846655 1
i 2 206.78892964321443 2 10 65.31918863234414 -1 0.10869565217391 -0.5 -0.5 419.65486198200773 1
i 6 206.86895631877297 2 6 64.47453013933361 -1 0.19565217391304 -0.5 -0.5 501.4644234360649 1
i 6 206.9489829943315 2 10.25 73.21545361980543 -1 -0.02173913043478 -0.5 -0.5 569.5301471247359 1
i 4 207.02900966989 2 8.41666666666667 62.63790145972764 -1 0.15217391304348 -0.5 -0.5 625.8072251993843 1
i 5 207.10903634544852 2 7.75 77.55715746243257 -1 0.19565217391304 -0.5 -0.5 672.0357877053984 1
i 2 207.18906302100703 2 10 67.18400864121402 -1 -0.15217391304348 -0.5 -0.5 709.7542683317943 1
i 6 207.26908969656557 2 6.41666666666667 62.03892898014092 -1 0.06521739130435 -0.5 -0.5 740.3135709257349 1
i 6 207.3491163721241 2 9.33333333333333 76.38352987100299 -1 -0.23913043478261 -0.5 -0.5 764.8917151456087 1
i 3 207.4291430476826 2 9.66666666666667 63.82046187088875 -1 0.02173913043478 -0.5 -0.5 784.508669377882 1
i 5 207.50916972324111 2 6 73.22251537805924 -1 -0.15217391304348 -0.5 -0.5 800.0411111871005 1
i 4 207.58919639879963 2 11.16666666666667 69.59356789053307 -1 -0.10869565217391 -0.5 -0.5 812.2368892073788 1
i 5 207.66922307435817 2 6 60.0018184538979 -1 -0.02173913043478 -0.5 -0.5 821.7289946641883 1
i 6 207.7492497499167 2 8.41666666666667 79.6490136997761 -1 -0.06521739130435 -0.5 -0.5 829.0488848457277 1
i 2 207.8292764254752 2 10.66666666666667 64.96606286116454 -1 0.23913043478261 -0.5 -0.5 834.6390341047005 1
i 6 207.90930310103371 2 6.08333333333333 66.16908585333384 -1 0.15217391304348 -0.5 -0.5 838.8646197306199 1
i 5 207.98932977659223 2 10.5 72.37961652439648 -1 -0.06521739130435 -0.5 -0.5 842.0242797517313 1
i 4 208.06935645215077 2 8.16666666666667 61.87089883466977 -1 0.19565217391304 -0.5 -0.5 844.3599069637578 1
i 5 208.14938312770929 2 7 78.71560708629418 -1 0.06521739130435 -0.5 -0.5 846.0654679032561 1
i 2 208.2294098032678 2 11 66.44055497256227 -1 -0.23913043478261 -0.5 -0.5 847.2948568502759 1
i 6 208.3094364788263 2 6.33333333333333 62.66428377232951 -1 -0.02173913043478 -0.5 -0.5 848.1688131221698 1
i 6 208.38946315438483 2 9.66666666666667 75.24644417040379 -1 -0.15217391304348 -0.5 -0.5 848.7809448651001 1
i 3 208.46948982994334 2 9.33333333333333 63.4671253966275 -1 -0.02173913043478 -0.5 -0.5 849.2029143062734 1
i 5 208.54951650550188 2 7.33333333333333 74.98761221397862 -1 -0.02173913043478 -0.5 -0.5 849.4888481198059 1
i 3 208.6295431810604 2 11.08333333333333 68.76723868480599 -1 0.32608695652174 -0.5 -0.5 849.6790423711867 1
i 5 208.7095698566189 2 6.66666666666667 60.34970836693762 -1 -0.15217391304348 -0.5 -0.5 849.8030346836811 1
i 6 208.78959653217743 2 8.66666666666667 78.79493534224468 -1 -0.10869565217391 -0.5 -0.5 849.8821171021614 1
i 2 208.86962320773594 2 10.33333333333333 64.64489290753872 -1 0.02173913043478 -0.5 -0.5 849.9313619339565 1
i 6 208.94964988329448 2 6.33333333333333 68.3347846137606 -1 0.02173913043478 -0.5 -0.5 849.9612299589011 1
i 5 209.029676558853 2 10.66666666666667 71.54187475384664 -1 -0.10869565217391 -0.5 -0.5 849.9788261648987 1
i 4 209.1097032344115 2 7.66666666666667 61.00007299499948 -1 -0.23913043478261 -0.5 -0.5 849.9888629193505 1
i 5 209.18972990997003 2 7 79.62402662733982 -1 -0.10869565217391 -0.5 -0.5 849.9943845544677 1
i 2 209.26975658552854 2 11.08333333333333 65.8330060739641 -1 0.06521739130435 -0.5 -0.5 849.9973010261414 1
i 6 209.34978326108705 2 6.08333333333333 63.28168827658335 -1 -0.19565217391304 -0.5 -0.5 849.9987718714676 1
i 6 209.4298099366456 2 9 74.2348064709961 -1 -0.15217391304348 -0.5 -0.5 849.9994753729466 1
i 3 209.5098366122041 2 8 63.1710965677707 -1 0.10869565217391 -0.5 -0.5 849.9997918315557 1
i 5 209.58986328776263 2 7.5 76.2544040998975 -1 -0.15217391304348 -0.5 -0.5 849.999924308169 1
i 3 209.66988996332114 2 11.08333333333333 68.03991465930338 -1 -0.28260869565217 -0.5 -0.5 849.9999752225542 1
i 6 209.74991663887965 2 6.66666666666667 61.12072273900948 -1 0.02173913043478 -0.5 -0.5 849.9999928697395 1
i 6 209.8299433144382 2 9.08333333333333 77.70992903100768 -1 -0.15217391304348 -0.5 -0.5 849.9999982547092 1
i 2 209.9099699899967 2 10.08333333333333 64.28375705898581 -1 -0.23913043478261 -0.5 -0.5 849.999999653542 1
i 5 209.98999666555522 2 6.66666666666667 70.67887534665348 -1 -0.19565217391304 -0.5 -0.5 849.9999999481249 1
i 4 210.07002334111374 2 10 70.64354685905147 -1 0.28260869565217 -0.5 -0.5 849.9999999947958 1
i 5 210.15005001667225 2 7.33333333333333 60.3040759201804 -1 -0.10869565217391 -0.5 -0.5 849.9999999997175 1
i 5 210.2300766922308 2 8.08333333333333 79.99759816306285 -1 -0.10869565217391 -0.5 -0.5 849.9999999999948 1
i 2 210.3101033677893 2 10 65.3717322677407 -1 -0.15217391304348 -0.5 -0.5 850 1
i 6 210.39013004334782 2 6.08333333333333 64.29659879402715 -1 -0.32608695652174 -0.5 -0.5 850 1
i 6 210.47015671890634 2 10.33333333333333 73.3294166147895 -1 -0.02173913043478 -0.5 -0.5 850 1
i 4 210.55018339446485 2 8.5 62.71889229528875 -1 -0.06521739130435 -0.5 -0.5 850.0000000000002 1
i 5 210.6302100700234 2 7.66666666666667 77.40216810086353 -1 -0.02173913043478 -0.5 -0.5 850.0000000000326 1
i 3 210.7102367455819 2 10 67.28628916389292 -1 -0.15217391304348 -0.5 -0.5 850.0000000010326 1
i 6 210.79026342114042 2 6.5 61.94151255665302 -1 -0.19565217391304 -0.5 -0.5 850.0000000142469 1
i 6 210.87029009669894 2 9.33333333333333 76.53938495167573 -1 0.10869565217391 -0.5 -0.5 850.0000001181594 1
i 3 210.95031677225745 2 9.66666666666667 63.87400022899007 -1 -0.02173913043478 -0.5 -0.5 850.0000006948143 1
i 5 211.03034344781597 2 6 72.94696075343778 -1 0.19565217391304 -0.5 -0.5 850.0000031879831 1
i 4 211.1103701233745 2 10 69.71277817201172 -1 -0.02173913043478 -0.5 -0.5 850.0000121256228 1
i 5 211.19039679893302 2 6 60.0009163583718 -1 -0.06521739130435 -0.5 -0.5 850.0000398214665 1
i 6 211.27042347449154 2 8.33333333333333 79.72984323205272 -1 -0.02173913043478 -0.5 -0.5 850.0001162041868 1
i 2 211.35045015005005 2 10.66666666666667 65.0092319994599 -1 -0.23913043478261 -0.5 -0.5 850.0003077060354 1
i 6 211.43047682560857 2 6.08333333333333 65.91235919063129 -1 -0.19565217391304 -0.5 -0.5 850.0007511581135 1
i 5 211.5105035011671 2 10.5 72.48840773016137 -1 -0.06521739130435 -0.5 -0.5 850.0017112551145 1
i 4 211.59053017672562 2 8.08333333333333 61.98444469639843 -1 -0.41304347826087 -0.5 -0.5 850.0036734172185 1
i 5 211.67055685228414 2 7 78.5693640925758 -1 0.15217391304348 -0.5 -0.5 850.0074878134035 1
i 2 211.75058352784265 2 11.08333333333333 66.532765764593 -1 -0.06521739130435 -0.5 -0.5 850.0145849097964 1
i 6 211.83061020340116 2 6.33333333333333 62.59037314672754 -1 -0.02173913043478 -0.5 -0.5 850.0272881235048 1
i 6 211.91063687895968 2 9.66666666666667 75.39015840309801 -1 -0.02173913043478 -0.5 -0.5 850.0492549116799 1
i 3 211.99066355451822 2 9.33333333333333 63.50765905245321 -1 -0.02173913043478 -0.5 -0.5 850.0860837805133 1
i 5 212.07069023007674 2 7.33333333333333 74.78903109367529 -1 0.02173913043478 -0.5 -0.5 850.1461310902031 1
i 3 212.15071690563525 2 11.08333333333333 68.86820706288918 -1 0.02173913043478 -0.5 -0.5 850.2415879490682 1
i 5 212.23074358119376 2 6.66666666666667 60.27190312398508 -1 -0.02173913043478 -0.5 -0.5 850.3898736837626 1
i 6 212.31077025675228 2 8.66666666666667 78.926099684878 -1 -0.15217391304348 -0.5 -0.5 850.6154080598199 1
i 2 212.39079693231082 2 10.5 64.68834181963695 -1 0.06521739130435 -0.5 -0.5 850.951829296558 1
i 6 212.47082360786933 2 6.33333333333333 68.03264574061564 -1 0.02173913043478 -0.5 -0.5 851.4447286418363 1
i 5 212.55085028342785 2 10.66666666666667 71.65536199246475 -1 -0.19565217391304 -0.5 -0.5 852.1549745036658 1
i 4 212.63087695898636 2 7.66666666666667 61.11029472103165 -1 -0.10869565217391 -0.5 -0.5 853.1626995355026 1
i 5 212.71090363454488 2 7 79.5303130608074 -1 -0.06521739130435 -0.5 -0.5 854.572022309713 1
i 2 212.79093031010342 2 11 65.90395534893321 -1 -0.15217391304348 -0.5 -0.5 856.5165709822296 1
i 6 212.87095698566193 2 6.08333333333333 63.18516604334752 -1 0.06521739130435 -0.5 -0.5 859.1658693795898 1
i 6 212.95098366122045 2 9 74.36128640075452 -1 0.15217391304348 -0.5 -0.5 862.7326360048036 1
i 3 213.03101033677896 2 8 63.21398644006915 -1 -0.02173913043478 -0.5 -0.5 867.4810333980805 1
i 5 213.11103701233748 2 7.41666666666667 76.10185030758198 -1 -0.23913043478261 -0.5 -0.5 873.7358890118566 1
i 3 213.19106368789602 2 11.08333333333333 68.13555557800748 -1 -0.02173913043478 -0.5 -0.5 881.8928892569023 1
i 6 213.27109036345453 2 6.66666666666667 61.00859017789008 -1 -0.10869565217391 -0.5 -0.5 892.4297257285072 1
i 6 213.35111703901305 2 8 77.8600388388316 -1 -0.10869565217391 -0.5 -0.5 905.9181470052267 1
i 2 213.43114371457156 2 10.08333333333333 64.3351217463052 -1 0.06521739130435 -0.5 -0.5 923.036841105046 1
i 5 213.51117039013008 2 6.58333333333333 70.36757890500877 -1 0.10869565217391 -0.5 -0.5 944.5850430647356 1
i 4 213.5911970656886 2 10 70.7658440914468 -1 -0.06521739130435 -0.5 -0.5 971.4967296587922 1
i 5 213.67122374124713 2 7.41666666666667 60.37818922784781 -1 -0.06521739130435 -0.5 -0.5 1004.8552295726131 1
i 5 213.75125041680565 2 8.08333333333333 79.9844139766088 -1 -0.3695652173913 -0.5 -0.5 1045.9080430609442 1
i 2 213.83127709236416 2 10 65.42599462231004 -1 -0.28260869565217 -0.5 -0.5 1096.0816310068326 1
i 6 213.91130376792267 2 6 64.12956505614234 -1 0.06521739130435 -0.5 -0.5 1156.9959001668187 1
i 6 213.9913304434812 2 10.16666666666667 73.4445240059556 -1 0.02173913043478 -0.5 -0.5 1230.4780801210093 1
i 4 214.07135711903973 2 8.66666666666667 62.79453016514455 -1 -0.28260869565217 -0.5 -0.5 1318.575658945985 1
i 5 214.15138379459825 2 7.58333333333333 77.24808494387051 -1 -0.23913043478261 -0.5 -0.5 1423.568019824779 1
i 3 214.23141047015676 2 10 67.38839873925879 -1 -0.23913043478261 -0.5 -0.5 1547.9764006192597 1
i 6 214.31143714571527 2 6.58333333333333 61.84063174055599 -1 -0.28260869565217 -0.5 -0.5 1694.5717837502552 1
i 6 214.3914638212738 2 9.25 76.69557461840185 -1 0.06521739130435 -0.5 -0.5 1866.3803154019456 1
i 3 214.4714904968323 2 9.91666666666667 63.92833817773823 -1 0.06521739130435 -0.5 -0.5 2066.685851862505 1
i 5 214.55151717239085 2 6.91666666666667 72.66364821318436 -1 0.06521739130435 -0.5 -0.5 2299.0292373938714 1
i 4 214.63154384794936 2 10.91666666666667 69.8336289828223 -1 0.02173913043478 -0.5 -0.5 2567.2039329567588 1
i 5 214.71157052350787 2 7 60.01052060892386 -1 -0.28260869565217 -0.5 -0.5 2875.2476387979664 1
i 6 214.7915971990664 2 8.33333333333333 79.80095313627004 -1 -0.19565217391304 -0.5 -0.5 3227.4295866030043 1
i 2 214.8716238746249 2 10.75 65.05318413393262 -1 -0.06521739130435 -0.5 -0.5 3628.2332186941057 1
i 6 214.95165055018344 2 6.08333333333333 65.66481032295613 -1 0.06521739130435 -0.5 -0.5 4082.334022512848 1
i 5 215.03167722574196 2 10.41666666666667 72.59738215407317 -1 -0.19565217391304 -0.5 -0.5 4594.572348055972 1
i 4 215.11170390130047 2 8.08333333333333 62.09530225649456 -1 -0.02173913043478 -0.5 -0.5 5169.9211035225735 1
i 5 215.191730576859 2 7.75 78.41964016249021 -1 0.19565217391304 -0.5 -0.5 5813.448299481358 1
i 2 215.2717572524175 2 11 66.6273720664724 -1 -0.02173913043478 -0.5 -0.5 6530.274493449542 1
i 6 215.35178392797604 2 6.25 62.51491564028235 -1 0.15217391304348 -0.5 -0.5 7325.525273822394 1
i 6 215.43181060353456 2 9 75.53620609647261 -1 -0.06521739130435 -0.5 -0.5 8204.279013275482 1
i 3 215.51183727909307 2 9.33333333333333 63.5499639633893 -1 0.06521739130435 -0.5 -0.5 9171.510215708406 1
i 5 215.5918639546516 2 7.08333333333333 74.58019993317593 -1 0.19565217391304 -0.5 -0.5 10232.028875867303 1
i 3 215.6718906302101 2 11 68.97148864125404 -1 0.10869565217391 -0.5 -0.5 11390.4163653196 1
i 5 215.75191730576864 2 6 60.20271894564247 -1 -0.06521739130435 -0.5 -0.5 12650.958450699865 1
i 6 215.83194398132716 2 8.58333333333333 79.0529967821696 -1 0.06521739130435 -0.5 -0.5 14017.57613819794 1
i 2 215.91197065688567 2 10.58333333333333 64.73114156015288 -1 -0.10869565217391 -0.5 -0.5 15493.755120412865 1
i 6 215.99199733244419 2 6.25 67.73401106457487 -1 0.23913043478261 -0.5 -0.5 17082.4746759363 1
i 5 216.0720240080027 2 10.66666666666667 71.7677368950825 -1 0.10869565217391 -0.5 -0.5 18786.13693682082 1
i 4 216.1520506835612 2 7 61.22320375605246 -1 -0.19565217391304 -0.5 -0.5 20606.497492529215 1
i 5 216.23207735911976 2 7.91666666666667 79.42742040553937 -1 -0.10869565217391 -0.5 -0.5 22544.598339703614 1
i 2 216.31210403467827 2 11 65.97763533513637 -1 0.06521739130435 -0.5 -0.5 24600.704213660858 1
i 6 216.39213071023678 2 6.16666666666667 63.09514502454245 -1 -0.19565217391304 -0.5 -0.5 26774.243348767413 1
i 6 216.4721573857953 2 9 74.48973983578655 -1 0.15217391304348 -0.5 -0.5 29063.75370988522 1
i 3 216.5521840613538 2 8.91666666666667 63.25454531815988 -1 -0.06521739130435 -0.5 -0.5 31466.83571515755 1
i 5 216.63221073691236 2 7.5 75.94685918472086 -1 -0.10869565217391 -0.5 -0.5 33980.11243125329 1
i 3 216.71223741247087 2 11 68.23064720033591 -1 0.06521739130435 -0.5 -0.5 36599.198165544054 1
i 5 216.79226408802938 2 6.58333333333333 60.89783872542925 -1 -0.10869565217391 -0.5 -0.5 39318.67630600529 1
i 6 216.8722907635879 2 8 78.008494847256 -1 -0.32608695652174 -0.5 -0.5 42132.08716923347 1
i 2 216.9523174391464 2 10.08333333333333 64.38537725881609 -1 0.15217391304348 -0.5 -0.5 45031.92651086963 1
i 5 217.03234411470493 2 6.58333333333333 70.05586171650799 -1 -0.3695652173913 -0.5 -0.5 48009.655232053155 1
i 4 217.11237079026347 2 10.75 70.8872158647307 -1 -0.06521739130435 -0.5 -0.5 51055.720681778585 1
i 5 217.19239746582198 2 7.33333333333333 60.4585846346678 -1 -0.15217391304348 -0.5 -0.5 54159.58980987791 1
i 5 217.2724241413805 2 8.08333333333333 79.95986942684637 -1 0.06521739130435 -0.5 -0.5 57309.794271056104 1
i 2 217.352450816939 2 10.91666666666667 65.48207594249862 -1 -0.02173913043478 -0.5 -0.5 60493.98741885091 1
i 6 217.43247749249753 2 6.08333333333333 63.97324257268946 -1 -0.02173913043478 -0.5 -0.5 63699.012962357105 1
i 6 217.51250416805607 2 10.08333333333333 73.5608469908922 -1 -0.06521739130435 -0.5 -0.5 66910.98489046172 1
i 4 217.59253084361458 2 8.58333333333333 62.86487938660618 -1 -0.19565217391304 -0.5 -0.5 70115.37810079019 1
i 5 217.6725575191731 2 7.75 77.0950389156777 -1 -0.23913043478261 -0.5 -0.5 73297.12900659599 1
i 3 217.7525841947316 2 10.91666666666667 67.4900434009897 -1 0.19565217391304 -0.5 -0.5 76440.74523681744 1
i 6 217.83261087029013 2 6.41666666666667 61.73659725291942 -1 -0.02173913043478 -0.5 -0.5 79530.42339559326 1
i 6 217.91263754584867 2 9.25 76.8517822724588 -1 -0.19565217391304 -0.5 -0.5 82550.17370989927 1
i 3 217.99266422140718 2 9.75 63.98314408851161 -1 -0.15217391304348 -0.5 -0.5 85483.95027049966 1
i 5 218.0726908969657 2 6.91666666666667 72.37357077643993 -1 -0.28260869565217 -0.5 -0.5 88315.78546406138 1
i 4 218.1527175725242 2 10 69.95576717832456 -1 0.10869565217391 -0.5 -0.5 91029.92710536723 1
i 5 218.23274424808272 2 7 60.03028549239718 -1 0.06521739130435 -0.5 -0.5 93610.97670967897 1
i 5 218.31277092364127 2 8.5 79.86179863896638 -1 0.02173913043478 -0.5 -0.5 96044.02729805459 1
i 2 218.39279759919978 2 10 65.09808462227795 -1 -0.15217391304348 -0.5 -0.5 98314.79910382799 1
i 6 218.4728242747583 2 6.08333333333333 65.42700651686351 -1 -0.02173913043478 -0.5 -0.5 100409.77154730803 1
i 5 218.5528509503168 2 10.5 72.70672731355378 -1 -0.19565217391304 -0.5 -0.5 102316.30986844198 1
i 4 218.63287762587532 2 8.33333333333333 62.20281743622881 -1 -0.19565217391304 -0.5 -0.5 104022.78485360302 1
i 5 218.71290430143384 2 7.83333333333333 78.26726929085802 -1 -0.02173913043478 -0.5 -0.5 105518.68416247636 1
i 2 218.79293097699238 2 11 66.72410796401144 -1 -0.10869565217391 -0.5 -0.5 106794.71385324288 1
i 6 218.8729576525509 2 6.25 62.43712778816658 -1 -0.19565217391304 -0.5 -0.5 107842.88881784852 1
i 6 218.9529843281094 2 9.58333333333333 75.6844496941187 -1 0.10869565217391 -0.5 -0.5 108656.61097234595 1
i 3 219.03301100366792 2 9.5 63.59422116661385 -1 -0.15217391304348 -0.5 -0.5 109230.73419826139 1
i 5 219.11303767922644 2 7.16666666666667 74.3606760427958 -1 0.15217391304348 -0.5 -0.5 109561.61519741395 1
i 3 219.19306435478498 2 11 69.07729047460495 -1 0.02173913043478 -0.5 -0.5 109647.14960202154 1
i 5 219.2730910303435 2 6.75 60.14290312940123 -1 -0.3695652173913 -0.5 -0.5 109486.7928715987 1
i 6 219.353117705902 2 8.75 79.17497208489866 -1 0.10869565217391 -0.5 -0.5 109081.56570508175 1
i 2 219.43314438146052 2 10.58333333333333 64.7734594811095 -1 0.02173913043478 -0.5 -0.5 108434.04389780042 1
i 6 219.51317105701904 2 6.33333333333333 67.43958000056591 -1 -0.15217391304348 -0.5 -0.5 107548.33277518615 1
i 5 219.59319773257755 2 10.58333333333333 71.87910581098664 -1 0.06521739130435 -0.5 -0.5 106430.0265353217 1
i 4 219.6732244081361 2 7.75 61.33819673799098 -1 -0.06521739130435 -0.5 -0.5 105086.15302748534 1
i 5 219.7532510836946 2 7 79.31589581061311 -1 0.06521739130435 -0.5 -0.5 103525.10468068301 1
i 2 219.83327775925312 2 11 66.05413995819819 -1 -0.23913043478261 -0.5 -0.5 101756.55647191596 1
i 6 219.91330443481164 2 6.08333333333333 63.01065545338547 -1 -0.10869565217391 -0.5 -0.5 99791.37198594393 1
i 6 219.99333111037015 2 9.83333333333333 74.62029094849616 -1 0.02173913043478 -0.5 -0.5 97641.49876407195 1
i 3 220.0733577859287 2 8 63.29340677888193 -1 0.06521739130435 -0.5 -0.5 95319.85426693833 1
i 5 220.1533844614872 2 7.33333333333333 75.78838490223927 -1 -0.06521739130435 -0.5 -0.5 92840.20388346915 1
i 3 220.23341113704572 2 11 68.3255038044686 -1 0.15217391304348 -0.5 -0.5 90217.0325037264 1
i 5 220.31343781260423 2 6.58333333333333 60.78935565823139 -1 -0.10869565217391 -0.5 -0.5 87465.41123612365 1
i 6 220.39346448816275 2 8.91666666666667 78.15511369588631 -1 0.19565217391304 -0.5 -0.5 84600.86088867398 1
i 2 220.4734911637213 2 10.25 64.43448164624161 -1 0.02173913043478 -0.5 -0.5 81639.21384939588 1
i 5 220.5535178392798 2 6.66666666666667 69.74425858708813 -1 0.06521739130435 -0.5 -0.5 78596.47599263793 1
i 4 220.63354451483832 2 10.75 71.00752084017252 -1 -0.15217391304348 -0.5 -0.5 75488.69020645868 1
i 5 220.71357119039683 2 7.58333333333333 60.54478366072132 -1 -0.06521739130435 -0.5 -0.5 72331.80308231876 1
i 5 220.79359786595535 2 8.08333333333333 79.92411060193781 -1 -0.10869565217391 -0.5 -0.5 69141.53623308304 1
i 2 220.8736245415139 2 10 65.54008137782212 -1 0.19565217391304 -0.5 -0.5 65933.26361067012 1
i 6 220.9536512170724 2 6 63.82736313347749 -1 0.02173913043478 -0.5 -0.5 62721.896082218314 1
i 6 221.03367789263092 2 10.33333333333333 73.67845735489801 -1 0.02173913043478 -0.5 -0.5 59521.77439551702 1
i 4 221.11370456818943 2 8.83333333333333 62.93009097469268 -1 0.02173913043478 -0.5 -0.5 56346.57152323923 1
i 5 221.19373124374795 2 7.58333333333333 76.94303411147513 -1 -0.15217391304348 -0.5 -0.5 53209.20522339327 1
i 3 221.27375791930646 2 10 67.59097884008251 -1 0.3695652173913 -0.5 -0.5 50121.76149344014 1
i 6 221.353784594865 2 6.91666666666667 61.62979889031024 -1 -0.10869565217391 -0.5 -0.5 47095.42943002662 1
i 6 221.43381127042352 2 9.16666666666667 77.00771045689936 -1 -0.15217391304348 -0.5 -0.5 44140.44783843943 1
i 3 221.51383794598203 2 9 64.0380976552506 -1 -0.15217391304348 -0.5 -0.5 41266.06376797541 1
i 5 221.59386462154055 2 6.75 72.07774372084184 -1 -0.10869565217391 -0.5 -0.5 38480.502984633764 1
i 4 221.67389129709906 2 10.91666666666667 70.07882830731143 -1 -0.15217391304348 -0.5 -0.5 35790.952232830685 1
i 5 221.7539179726576 2 7.16666666666667 60.05978063259332 -1 -0.10869565217391 -0.5 -0.5 33203.552986170595 1
i 5 221.83394464821612 2 8.25 79.91193377206129 -1 0.06521739130435 -0.5 -0.5 30723.40624537393 1
i 2 221.91397132377463 2 10.83333333333333 65.14408282333895 -1 0.02173913043478 -0.5 -0.5 28354.587811557885 1
i 6 221.99399799933315 2 6.08333333333333 65.19941573157583 -1 -0.23913043478261 -0.5 -0.5 26100.17334668036 1
i 6 222.07402467489166 2 10.33333333333333 72.81661301919124 -1 -0.19565217391304 -0.5 -0.5 23962.27243149078 1
i 4 222.15405135045017 2 8.25 62.306412170423 -1 -0.06521739130435 -0.5 -0.5 21942.070746020385 1
i 5 222.23407802600872 2 7.75 78.11303700577834 -1 0.02173913043478 -0.5 -0.5 20039.879429008663 1
i 2 222.31410470156723 2 10 66.82266254500848 -1 0.06521739130435 -0.5 -0.5 18255.19062143302 1
i 6 222.39413137712575 2 6.25 62.3563911531164 -1 -0.19565217391304 -0.5 -0.5 16586.738165343537 1
i 6 222.47415805268426 2 9.58333333333333 75.83469694807323 -1 -0.06521739130435 -0.5 -0.5 15032.562412551895 1
i 3 222.55418472824277 2 9.33333333333333 63.64049103806664 -1 -0.06521739130435 -0.5 -0.5 13590.078097765218 1
i 5 222.63421140380132 2 7.08333333333333 74.13028007634269 -1 -0.10869565217391 -0.5 -0.5 12256.144246760581 1
i 3 222.71423807935983 2 11 69.18572140470398 -1 -0.10869565217391 -0.5 -0.5 11027.135121252564 1
i 5 222.79426475491834 2 6.75 60.0930647555559 -1 -0.15217391304348 -0.5 -0.5 9899.011246804588 1
i 6 222.87429143047686 2 8.58333333333333 79.29130646418595 -1 -0.19565217391304 -0.5 -0.5 8867.389627283046 1
i 2 222.95431810603537 2 10.58333333333333 64.81547847864867 -1 -0.10869565217391 -0.5 -0.5 7927.612317115399 1
i 6 223.03434478159392 2 6.16666666666667 67.15010939656463 -1 0.06521739130435 -0.5 -0.5 7074.812599530668 1
i 5 223.11437145715243 2 10.58333333333333 71.98960194381401 -1 -0.02173913043478 -0.5 -0.5 6303.978103041824 1
i 4 223.19439813271094 2 7.83333333333333 61.45461465442008 -1 0.06521739130435 -0.5 -0.5 5610.0102780031475 1
i 5 223.27442480826946 2 7 79.19636873017737 -1 -0.19565217391304 -0.5 -0.5 4987.779748168985 1
i 2 223.35445148382797 2 11 66.13353394108746 -1 -0.15217391304348 -0.5 -0.5 4432.177147094283 1
i 6 223.43447815938652 2 6.08333333333333 62.93064064151673 -1 -0.10869565217391 -0.5 -0.5 3938.1591440993216 1
i 6 223.51450483494503 2 9.83333333333333 74.75305590807382 -1 -0.02173913043478 -0.5 -0.5 3500.789457795569 1
i 3 223.59453151050354 2 9 63.3312224998258 -1 0.19565217391304 -0.5 -0.5 3115.274745238053 1
i 5 223.67455818606206 2 7.25 75.62529363031688 -1 -0.15217391304348 -0.5 -0.5 2776.9953402813044 1
i 3 223.75458486162057 2 11.08333333333333 68.42049906789465 -1 -0.10869565217391 -0.5 -0.5 2481.530894412795 1
i 5 223.8346115371791 2 6.58333333333333 60.68409015702011 -1 0.15217391304348 -0.5 -0.5 2224.6810462132544 1
i 6 223.91463821273763 2 8.83333333333333 78.29968763249798 -1 -0.28260869565217 -0.5 -0.5 2002.4813107549078 1
i 2 223.99466488829614 2 10.33333333333333 64.48242868569665 -1 -0.28260869565217 -0.5 -0.5 1811.2144370921608 1
i 5 224.07469156385466 2 6.41666666666667 69.43325828172166 -1 -0.19565217391304 -0.5 -0.5 1647.4175300382567 1
i 4 224.15471823941317 2 10.83333333333333 71.12665698685267 -1 0.02173913043478 -0.5 -0.5 1507.8852714430132 1
i 5 224.23474491497169 2 7.41666666666667 60.63632842882504 -1 0.10869565217391 -0.5 -0.5 1389.669606119279 1
i 5 224.31477159053023 2 8.08333333333333 79.87732292163842 -1 -0.06521739130435 -0.5 -0.5 1290.0762785486115 1
i 2 224.39479826608874 2 10 65.60012313552237 -1 -0.06521739130435 -0.5 -0.5 1206.6586188373021 1
i 6 224.47482494164726 2 6 63.6915773681239 -1 -0.23913043478261 -0.5 -0.5 1137.208980541478 1
i 6 224.55485161720577 2 10.25 73.79743236058785 -1 -0.19565217391304 -0.5 -0.5 1079.7482295277068 1
i 4 224.63487829276428 2 8.83333333333333 62.9903976186738 -1 -0.15217391304348 -0.5 -0.5 1032.5136726909425 1
i 5 224.7149049683228 2 7.5 76.7919415872025 -1 -0.15217391304348 -0.5 -0.5 993.9457989002324 1
i 3 224.79493164388134 2 10 67.69102040564749 -1 -0.41304347826087 -0.5 -0.5 962.6741828542488 1
i 6 224.87495831943986 2 6.58333333333333 61.5206938087893 -1 -0.15217391304348 -0.5 -0.5 937.5028764996196 1
i 6 224.95498499499837 2 9.16666666666667 77.1630868073323 -1 -0.02173913043478 -0.5 -0.5 917.3955832261628 1
i 3 225.03501167055688 2 9 64.09290230743899 -1 -0.41304347826087 -0.5 -0.5 901.4608781227686 1
i 5 225.1150383461154 2 6.66666666666667 71.77716631414359 -1 -0.06521739130435 -0.5 -0.5 888.9377040585683 1
i 4 225.19506502167394 2 10 70.20245210966293 -1 -0.10869565217391 -0.5 -0.5 879.1813391026972 1
i 5 225.27509169723245 2 7.25 60.09851484639353 -1 -0.06521739130435 -0.5 -0.5 871.6499966139016 1
i 5 225.35511837279097 2 8.41666666666667 79.95101569847505 -1 -0.06521739130435 -0.5 -0.5 865.8921859436747 1
i 2 225.43514504834948 2 10 65.19131259881175 -1 0.02173913043478 -0.5 -0.5 861.5349297477371 1
i 6 225.515171723908 2 6.08333333333333 64.98239930527181 -1 0.15217391304348 -0.5 -0.5 858.2729039388845 1
i 6 225.59519839946654 2 10.25 72.92718867091111 -1 -0.06521739130435 -0.5 -0.5 855.858538790356 1
i 4 225.67522507502505 2 8.33333333333333 62.40559835890505 -1 -0.15217391304348 -0.5 -0.5 854.0930949616052 1
i 5 225.75525175058357 2 7.75 77.95766098917805 -1 -0.32608695652174 -0.5 -0.5 852.818706513725 1
i 2 225.83527842614208 2 10 66.92269059124398 -1 -0.19565217391304 -0.5 -0.5 851.9113644571453 1
i 6 225.9153051017006 2 6.33333333333333 62.27226051119744 -1 -0.3695652173913 -0.5 -0.5 851.2747990816027 1
i 6 225.99533177725914 2 9.5 75.9867070279916 -1 -0.02173913043478 -0.5 -0.5 850.8352072227023 1
i 3 226.07535845281765 2 9.5 63.68872191847494 -1 0.02173913043478 -0.5 -0.5 850.5367616068575 1
i 5 226.15538512837617 2 7.08333333333333 73.88909704397258 -1 -0.10869565217391 -0.5 -0.5 850.3378333048834 1
i 3 226.23541180393468 2 11.08333333333333 69.29678975229461 -1 0.10869565217391 -0.5 -0.5 850.207854875357 1
i 5 226.3154384794932 2 6 60.05365782299637 -1 -0.06521739130435 -0.5 -0.5 850.124750708573 1
i 6 226.3954651550517 2 8.5 79.40123712515984 -1 -0.02173913043478 -0.5 -0.5 850.072862075135 1
i 2 226.47549183061025 2 10.66666666666667 64.8573927934398 -1 0.02173913043478 -0.5 -0.5 850.0412971047226 1
i 6 226.55551850616877 2 6.33333333333333 66.86639421065563 -1 0.23913043478261 -0.5 -0.5 850.0226400274898 1
i 5 226.63554518172728 2 10.5 72.09938373758543 -1 0.15217391304348 -0.5 -0.5 850.0119591635203 1
i 4 226.7155718572858 2 7 61.57174922608918 -1 -0.45652173913043 -0.5 -0.5 850.0060590190122 1
i 5 226.7955985328443 2 7 79.06954682862195 -1 -0.10869565217391 -0.5 -0.5 850.0029281381629 1
i 2 226.87562520840285 2 11.08333333333333 66.2158445014129 -1 -0.19565217391304 -0.5 -0.5 850.0013407936898 1
i 6 226.95565188396137 2 6.33333333333333 62.85397974808093 -1 0.02173913043478 -0.5 -0.5 850.0005769387228 1
i 6 227.03567855951988 2 9.75 74.88813554610527 -1 0.19565217391304 -0.5 -0.5 850.0002308902403 1
i 3 227.1157052350784 2 9.08333333333333 63.36863915758316 -1 0.10869565217391 -0.5 -0.5 850.0000848128917 1
i 5 227.1957319106369 2 7.33333333333333 75.45640469010695 -1 -0.28260869565217 -0.5 -0.5 850.0000281080119 1
i 3 227.27575858619542 2 11.08333333333333 68.51604877264539 -1 -0.15217391304348 -0.5 -0.5 850.0000082132608 1
i 5 227.35578526175397 2 6.66666666666667 60.58303759093934 -1 -0.06521739130435 -0.5 -0.5 850.0000020497998 1
i 6 227.43581193731248 2 8.75 78.4419704718918 -1 -0.15217391304348 -0.5 -0.5 850.0000004174206 1
i 2 227.515838612871 2 10.33333333333333 64.529245573969 -1 -0.15217391304348 -0.5 -0.5 850.000000064728 1
i 5 227.5958652884295 2 6.5 69.1233241332687 -1 -0.06521739130435 -0.5 -0.5 850.0000000068342 1
i 5 227.67589196398802 2 10.75 71.2445599821107 -1 -0.10869565217391 -0.5 -0.5 850.0000000004026 1
i 5 227.75591863954656 2 7.5 60.73277455748116 -1 -0.02173913043478 -0.5 -0.5 850.0000000000086 1
i 5 227.83594531510508 2 8.08333333333333 79.81972859540562 -1 0.02173913043478 -0.5 -0.5 850 1
i 2 227.9159719906636 2 10 65.66232133117627 -1 0.02173913043478 -0.5 -0.5 850 1
i 6 227.9959986662221 2 6.08333333333333 63.5654530058131 -1 -0.28260869565217 -0.5 -0.5 850 1
i 6 228.07602534178062 2 10.08333333333333 73.91785853687453 -1 -0.15217391304348 -0.5 -0.5 849.9999999999999 1
i 4 228.15605201733916 2 8.66666666666667 63.04610912145473 -1 -0.15217391304348 -0.5 -0.5 849.9999999999792 1
i 5 228.23607869289768 2 7.5 76.6414930938247 -1 0.23913043478261 -0.5 -0.5 849.9999999992535 1
i 3 228.3161053684562 2 11.08333333333333 67.7900515886291 -1 -0.32608695652174 -0.5 -0.5 849.9999999889552 1
i 6 228.3961320440147 2 6.5 61.40979975678239 -1 -0.02173913043478 -0.5 -0.5 849.9999999041629 1
i 6 228.47615871957322 2 9.08333333333333 77.31766698668156 -1 0.32608695652174 -0.5 -0.5 849.9999994183388 1
i 3 228.55618539513176 2 9 64.14729415087797 -1 0.19565217391304 -0.5 -0.5 849.9999972680536 1
i 5 228.63621207069028 2 6.66666666666667 71.47279092318033 -1 -0.23913043478261 -0.5 -0.5 849.9999894202394 1
i 4 228.7162387462488 2 10 70.32629555174366 -1 -0.10869565217391 -0.5 -0.5 849.9999647554076 1
i 5 228.7962654218073 2 7.33333333333333 60.14595903884093 -1 -0.02173913043478 -0.5 -0.5 849.9998959499259 1
i 5 228.87629209736582 2 8.33333333333333 79.97880294085684 -1 -0.10869565217391 -0.5 -0.5 849.999721809618 1
i 2 228.95631877292433 2 10 65.23989422987754 -1 -0.02173913043478 -0.5 -0.5 849.9993153526261 1
i 6 229.03634544848288 2 6.08333333333333 64.7762095883769 -1 -0.06521739130435 -0.5 -0.5 849.9984293912771 1
i 6 229.1163721240414 2 10.33333333333333 73.03858291209593 -1 -0.06521739130435 -0.5 -0.5 849.9966081694556 1
i 4 229.1963987995999 2 8.33333333333333 62.49998696918715 -1 -0.28260869565217 -0.5 -0.5 849.9930497479969 1
i 5 229.27642547515842 2 7.66666666666667 77.8017748673396 -1 -0.32608695652174 -0.5 -0.5 849.9863993012215 1
i 2 229.35645215071693 2 10 67.02382539262686 -1 -0.15217391304348 -0.5 -0.5 849.9744483341243 1
i 6 229.43647882627548 2 6.33333333333333 62.18446141972566 -1 0.10869565217391 -0.5 -0.5 849.9537091324974 1
i 6 229.516505501834 2 9.5 76.1401998717411 -1 -0.10869565217391 -0.5 -0.5 849.9188276396541 1
i 3 229.5965321773925 2 9.5 63.73876527003252 -1 -0.15217391304348 -0.5 -0.5 849.8617915781675 1
i 5 229.67655885295102 2 6 73.63746038298159 -1 -0.06521739130435 -0.5 -0.5 849.7708842093449 1
i 3 229.75658552850953 2 11.08333333333333 69.41040794907796 -1 -0.02173913043478 -0.5 -0.5 849.6293278922361 1
i 5 229.83661220406805 2 6 60.02497296722157 -1 -0.15217391304348 -0.5 -0.5 849.4135558475706 1
i 6 229.9166388796266 2 8.5 79.5039831281014 -1 0.02173913043478 -0.5 -0.5 849.0910455584294 1
i 2 229.9966655551851 2 10.66666666666667 64.89940305703212 -1 -0.32608695652174 -0.5 -0.5 848.6176433778645 1
i 6 230.07669223074362 2 6.33333333333333 66.58924279982843 -1 -0.06521739130435 -0.5 -0.5 847.9343075049868 1
i 5 230.15671890630213 2 10.5 72.20863135690198 -1 -0.19565217391304 -0.5 -0.5 846.9631958775232 1
i 4 230.23674558186065 2 7 61.68885581062638 -1 0.06521739130435 -0.5 -0.5 845.6030270427658 1
i 5 230.3167722574192 2 7 78.93620517891044 -1 -0.02173913043478 -0.5 -0.5 843.723646020299 1
i 2 230.3967989329777 2 11 66.30105385539275 -1 -0.10869565217391 -0.5 -0.5 841.159733834562 1
i 6 230.47682560853622 2 6.16666666666667 62.77952042551303 -1 -0.02173913043478 -0.5 -0.5 837.7036090016117 1
i 6 230.55685228409473 2 9.75 75.02560681474083 -1 0.02173913043478 -0.5 -0.5 833.0970819720828 1
i 3 230.63687895965325 2 9.08333333333333 63.40627201261714 -1 -0.15217391304348 -0.5 -0.5 827.0223394602461 1
i 5 230.7169056352118 2 7.33333333333333 75.28054204361457 -1 -0.06521739130435 -0.5 -0.5 819.0918547460101 1
i 3 230.7969323107703 2 11 68.61258852369984 -1 -0.45652173913043 -0.5 -0.5 808.8373423521936 1
i 5 230.87695898632882 2 6.66666666666667 60.48721713386743 -1 0.02173913043478 -0.5 -0.5 795.6978008073098 1
i 6 230.95698566188733 2 8.75 78.58166303238342 -1 -0.15217391304348 -0.5 -0.5 779.0067152380789 1
i 2 231.03701233744584 2 10.33333333333333 64.57499051021207 -1 -0.06521739130435 -0.5 -0.5 757.9785219268782 1
i 5 231.1170390130044 2 6.33333333333333 68.81491776294135 -1 0.02173913043478 -0.5 -0.5 731.6944692479925 1
i 5 231.1970656885629 2 10.75 71.36120094266514 -1 -0.06521739130435 -0.5 -0.5 699.0880429932338 1
i 4 231.27709236412142 2 7.58333333333333 60.83368025312346 -1 -0.02173913043478 -0.5 -0.5 658.930158353563 1
i 5 231.35711903967993 2 8.08333333333333 79.75158838649571 -1 -0.15217391304348 -0.5 -0.5 609.8143549959069 1
i 2 231.43714571523844 2 11.08333333333333 65.72680307996212 -1 0.10869565217391 -0.5 -0.5 550.1422649499283 1
i 6 231.51717239079696 2 6.08333333333333 63.44847102062889 -1 0.3695652173913 -0.5 -0.5 478.10965453294034 1
i 6 231.5971990663555 2 10 74.03983373967469 -1 -0.32608695652174 -0.5 -0.5 391.69337038189514 1
i 3 231.67722574191401 2 8 63.09760814377732 -1 0.3695652173913 -0.5 -0.5 288.63954491095194 1
i 5 231.75725241747253 2 7.58333333333333 76.49127562102107 -1 -0.41304347826087 -0.5 -0.5 166.45343724028828 1
i 3 231.83727909303104 2 11.08333333333333 67.88803062399236 -1 -0.06521739130435 -0.5 -0.5 22.39130096136766 1
i 6 231.91730576858956 2 6.58333333333333 61.29769340996877 -1 -0.15217391304348 -0.5 -0.5 -146.54532084936187 1
i 6 231.9973324441481 2 9.25 77.47123409188413 -1 -0.10869565217391 -0.5 -0.5 -343.6124709428569 1
i 2 232.0773591197066 2 9 64.20104757544331 -1 -0.15217391304348 -0.5 -0.5 -572.3234268300215 1
i 5 232.15738579526513 2 6.66666666666667 71.16550126782248 -1 -0.23913043478261 -0.5 -0.5 -836.4447406333169 1
i 4 232.23741247082364 2 10.83333333333333 70.45004276059278 -1 -0.15217391304348 -0.5 -0.5 -1139.988309880576 1
i 5 232.31743914638216 2 7.16666666666667 60.20156666654462 -1 -0.23913043478261 -0.5 -0.5 -1487.1991509835404 1
i 5 232.39746582194067 2 8.25 79.995148553674 -1 -0.15217391304348 -0.5 -0.5 -1882.5385879383402 1
i 2 232.4774924974992 2 10.91666666666667 65.28993731679068 -1 -0.15217391304348 -0.5 -0.5 -2330.6626185947357 1
i 6 232.55751917305773 2 6.16666666666667 64.58099211644591 -1 -0.02173913043478 -0.5 -0.5 -2836.395279343497 1
i 6 232.63754584861624 2 10.25 73.15090517476825 -1 -0.28260869565217 -0.5 -0.5 -3404.6968958305793 1
i 4 232.71757252417476 2 8.5 62.58929219870345 -1 -0.19565217391304 -0.5 -0.5 -4040.6271815705018 1
i 5 232.79759919973327 2 7.75 77.64591565046531 -1 -0.06521739130435 -0.5 -0.5 -4749.303227279879 1
i 2 232.8776258752918 2 10 67.12569251619401 -1 0.02173913043478 -0.5 -0.5 -5535.852510256035 1
i 6 232.95765255085033 2 6.66666666666667 62.09287938208836 -1 -0.10869565217391 -0.5 -0.5 -6405.361143933068 1
i 6 233.03767922640884 2 9.5 76.29486736465466 -1 0.28260869565217 -0.5 -0.5 -7362.817681472287 1
i 3 233.11770590196735 2 9.5 63.79039513056466 -1 0.23913043478261 -0.5 -0.5 -8413.052882264237 1
i 5 233.19773257752587 2 6 73.37592259884582 -1 -0.10869565217391 -0.5 -0.5 -9560.675944912666 1
i 3 233.2777592530844 2 11.16666666666667 69.52640265185505 -1 -0.02173913043478 -0.5 -0.5 -10810.00780282002 1
i 5 233.35778592864293 2 6.83333333333333 60.00713795463027 -1 0.19565217391304 -0.5 -0.5 -12165.01216713276 1
i 6 233.43781260420144 2 8.5 79.59877275470387 -1 0.10869565217391 -0.5 -0.5 -13629.22508462909 1
i 2 233.51783927975995 2 10.66666666666667 64.94171081974761 -1 -0.02173913043478 -0.5 -0.5 -15205.683853360173 1
i 6 233.59786595531847 2 6.16666666666667 66.31945058629134 -1 -0.19565217391304 -0.5 -0.5 -16896.85620470448 1
i 5 233.677892630877 2 10.66666666666667 72.31754089238419 -1 0.06521739130435 -0.5 -0.5 -18704.570715283688 1
i 4 233.75791930643553 2 8 61.80517128022278 -1 -0.15217391304348 -0.5 -0.5 -20629.949454312995 1
i 5 233.83794598199404 2 7.91666666666667 78.79716995210896 -1 0.02173913043478 -0.5 -0.5 -22673.343900180265 1
i 2 233.91797265755255 2 11 66.38909303610333 -1 -0.15217391304348 -0.5 -0.5 -24834.275172923455 1
i 6 233.99799933311107 2 6.16666666666667 62.70611883001095 -1 0.15217391304348 -0.5 -0.5 -27111.379626164366 1
i 6 234.07802600866958 2 9.66666666666667 75.16551336146611 -1 -0.15217391304348 -0.5 -0.5 -29502.36082195889 1
i 3 234.15805268422812 2 9.25 63.44467758431539 -1 -0.02173913043478 -0.5 -0.5 -32003.94887471519 1
i 5 234.23807935978664 2 7.16666666666667 75.09659278314088 -1 -0.06521739130435 -0.5 -0.5 -34611.8680956238 1
i 3 234.31810603534515 2 11.08333333333333 68.71054792739525 -1 0.02173913043478 -0.5 -0.5 -37320.81379713104 1
i 5 234.39813271090367 2 6.83333333333333 60.39764414279597 -1 -0.28260869565217 -0.5 -0.5 -40124.43902837478 1
i 6 234.47815938646218 2 8.91666666666667 78.71839928375115 -1 -0.3695652173913 -0.5 -0.5 -43015.351908027675 1
i 2 234.55818606202072 2 10.41666666666667 64.61975021010787 -1 -0.02173913043478 -0.5 -0.5 -45985.12410187349 1
i 6 234.63821273757924 2 6.58333333333333 68.50852388134749 -1 0.10869565217391 -0.5 -0.5 -49024.310859920835 1
i 5 234.71823941313775 2 10.66666666666667 71.47658381246572 -1 0.10869565217391 -0.5 -0.5 -52122.48288401714 1
i 4 234.79826608869627 2 7.58333333333333 60.93859244204562 -1 -0.10869565217391 -0.5 -0.5 -55268.27014328658 1
i 5 234.87829276425478 2 7 79.67320775764476 -1 -0.10869565217391 -0.5 -0.5 -58449.4175940496 1
i 2 234.9583194398133 2 11.16666666666667 65.79369953867841 -1 -0.19565217391304 -0.5 -0.5 -61652.8525950653 1
i 6 235.03834611537184 2 6 63.34002022836964 -1 -0.28260869565217 -0.5 -0.5 -64864.76364097359 1
i 6 235.11837279093035 2 10 74.16346717824973 -1 -0.06521739130435 -0.5 -0.5 -68070.68986913394 1
i 3 235.19839946648887 2 8.75 63.14534581201801 -1 -0.19565217391304 -0.5 -0.5 -71255.62063046888 1
i 5 235.27842614204738 2 7.41666666666667 76.34072792705346 -1 -0.19565217391304 -0.5 -0.5 -74404.10425625213 1
i 3 235.3584528176059 2 11.08333333333333 67.9849949289472 -1 -0.23913043478261 -0.5 -0.5 -77500.36500261523 1
i 6 235.43847949316444 2 6.58333333333333 61.1850129581171 -1 -0.02173913043478 -0.5 -0.5 -80528.42701572481 1
i 6 235.51850616872295 2 9.16666666666667 77.62359451578193 -1 -0.23913043478261 -0.5 -0.5 -83472.24403531416 1
i 2 235.59853284428146 2 10 64.25397798658521 -1 -0.3695652173913 -0.5 -0.5 -86315.83344521144 1
i 5 235.67855951983998 2 6.58333333333333 70.85610033912312 -1 0.06521739130435 -0.5 -0.5 -89043.41318839103 1
i 4 235.7585861953985 2 10.83333333333333 70.57341174716267 -1 -0.10869565217391 -0.5 -0.5 -91639.53999306251 1
i 5 235.83861287095704 2 7.25 60.26479057972694 -1 -0.19565217391304 -0.5 -0.5 -94089.2473065971 1
i 5 235.91863954651555 2 8.33333333333333 79.99998988276015 -1 -0.32608695652174 -0.5 -0.5 -96378.1813070139 1
i 2 235.99866622207406 2 10 65.34154422302333 -1 0.06521739130435 -0.5 -0.5 -98492.73335812126 1
i 6 236.07869289763258 2 6.16666666666667 64.39679106347872 -1 0.23913043478261 -0.5 -0.5 -100420.16729439583 1
i 6 236.1587195731911 2 10.16666666666667 73.26424861340732 -1 0.02173913043478 -0.5 -0.5 -102148.7399656864 1
i 4 236.23874624874964 2 8.66666666666667 62.673331371758 -1 -0.15217391304348 -0.5 -0.5 -103667.81353903553 1
i 5 236.31877292430815 2 7.75 77.49051456869425 -1 0.23913043478261 -0.5 -0.5 -104967.95814486 1
i 2 236.39879959986666 2 10.91666666666667 67.22792357486564 -1 -0.06521739130435 -0.5 -0.5 -106041.04356604036 1
i 6 236.47882627542518 2 6.58333333333333 61.99754346177289 -1 -0.28260869565217 -0.5 -0.5 -106880.31879965356 1
i 6 236.5588529509837 2 9.33333333333333 76.4503850498486 -1 -0.15217391304348 -0.5 -0.5 -107480.47847023855 1
i 3 236.6388796265422 2 9.66666666666667 63.84332954069021 -1 0.10869565217391 -0.5 -0.5 -107837.7152384016 1
i 5 236.71890630210075 2 6.83333333333333 73.1052167480124 -1 -0.28260869565217 -0.5 -0.5 -107949.75752671061 1
i 4 236.79893297765926 2 11.08333333333333 69.64452866357229 -1 -0.23913043478261 -0.5 -0.5 -107815.89207352328 1
i 5 236.87895965321778 2 6 60.00012607284971 -1 0.02173913043478 -0.5 -0.5 -107436.97102169953 1
i 6 236.9589863287763 2 8.5 79.68487015565097 -1 -0.19565217391304 -0.5 -0.5 -106815.40345001139 1
i 2 237.0390130043348 2 10.66666666666667 64.98451303331758 -1 0.15217391304348 -0.5 -0.5 -105955.13145737523 1
i 6 237.11903967989335 2 6.08333333333333 66.05777501550264 -1 -0.23913043478261 -0.5 -0.5 -104861.59111062098 1
i 5 237.19906635545186 2 10.58333333333333 72.42631665962794 -1 0.19565217391304 -0.5 -0.5 -103541.65876225685 1
i 4 237.27909303101038 2 8.16666666666667 61.91993497880102 -1 0.10869565217391 -0.5 -0.5 -102003.58343256263 1
i 5 237.3591197065689 2 7.83333333333333 78.65329833684538 -1 -0.15217391304348 -0.5 -0.5 -100256.90612742677 1
i 2 237.4391463821274 2 11 66.47983764933193 -1 -0.06521739130435 -0.5 -0.5 -98312.36712696006 1
i 6 237.51917305768592 2 6.16666666666667 62.63268288481511 -1 -0.15217391304348 -0.5 -0.5 -96181.80242753851 1
i 6 237.59919973324446 2 9.75 75.30785613755081 -1 -0.02173913043478 -0.5 -0.5 -93878.03064944685 1
i 3 237.67922640880298 2 9.16666666666667 63.48432836494058 -1 -0.19565217391304 -0.5 -0.5 -91414.7318317759 1
i 5 237.7592530843615 2 7.25 74.90356745269891 -1 0.02173913043478 -0.5 -0.5 -88806.31962412245 1
i 3 237.83927975992 2 11 68.81032359175413 -1 0.23913043478261 -0.5 -0.5 -86067.80844994751 1
i 5 237.91930643547852 2 6.66666666666667 60.31529919814315 -1 -0.23913043478261 -0.5 -0.5 -83214.67725815797 1
i 6 237.99933311103706 2 8.66666666666667 78.85173520852067 -1 0.02173913043478 -0.5 -0.5 -80262.73149753727 1
i 2 238.07935978659557 2 10.41666666666667 64.66363739310053 -1 0.10869565217391 -0.5 -0.5 -77227.96494278233 1
i 6 238.1593864621541 2 6.41666666666667 68.20467285135857 -1 -0.23913043478261 -0.5 -0.5 -74126.4229718452 1
i 5 238.2394131377126 2 10.66666666666667 71.59074293603675 -1 -0.06521739130435 -0.5 -0.5 -70974.06884262012 1
i 4 238.31943981327112 2 7.91666666666667 61.04703156926851 -1 -0.32608695652174 -0.5 -0.5 -67786.65444411838 1
i 5 238.39946648882966 2 7.91666666666667 79.58494653028734 -1 0.06521739130435 -0.5 -0.5 -64579.596904544436 1
i 2 238.47949316438817 2 11.08333333333333 65.86314089187847 -1 0.06521739130435 -0.5 -0.5 -61367.86232803231 1
i 6 238.5595198399467 2 6.16666666666667 63.23939144166877 -1 -0.10869565217391 -0.5 -0.5 -58165.85780533651 1
i 6 238.6395465155052 2 9 74.28887750011158 -1 -0.28260869565217 -0.5 -0.5 -54987.33270374462 1
i 3 238.71957319106372 2 8.91666666666667 63.18983638451452 -1 -0.23913043478261 -0.5 -0.5 -51845.290090531875 1
i 5 238.79959986662226 2 7.41666666666667 76.18914057553904 -1 -0.10869565217391 -0.5 -0.5 -48751.908984878355 1
i 3 238.87962654218077 2 11 68.08106310173507 -1 -0.23913043478261 -0.5 -0.5 -45718.47796830295 1
i 6 238.9596532177393 2 6.66666666666667 61.07246301811816 -1 -0.02173913043478 -0.5 -0.5 -42755.3405157693 1
i 6 239.0396798932978 2 9 77.77457075875608 -1 -0.3695652173913 -0.5 -0.5 -39871.85224175016 1
i 2 239.11970656885632 2 10 64.30594235376209 -1 0.02173913043478 -0.5 -0.5 -37076.350090149754 1
i 5 239.19973324441483 2 6.75 70.54530717543074 -1 -0.10869565217391 -0.5 -0.5 -34376.13333671922 1
i 4 239.27975991997337 2 10.83333333333333 70.69615834643929 -1 0.02173913043478 -0.5 -0.5 -31777.45611986452 1
i 5 239.3597865955319 2 7.25 60.33509553820679 -1 -0.23913043478261 -0.5 -0.5 -29285.531072749847 1
i 5 239.4398132710904 2 8.08333333333333 79.99333676134593 -1 -0.15217391304348 -0.5 -0.5 -26904.543498260107 1
i 2 239.51983994664891 2 10 65.3948137152159 -1 -0.15217391304348 -0.5 -0.5 -24637.675410466032 1
i 6 239.59986662220743 2 6.16666666666667 64.22355612589644 -1 0.23913043478261 -0.5 -0.5 -22487.138663165864 1
i 6 239.67989329776597 2 10.25 73.37869405806805 -1 -0.23913043478261 -0.5 -0.5 -20454.216298877185 1
i 4 239.7599199733245 2 8.5 62.75202179007773 -1 -0.10869565217391 -0.5 -0.5 -18539.311181314322 1
i 5 239.839946648883 2 7.66666666666667 77.33589035855493 -1 -0.10869565217391 -0.5 -0.5 -16742.00092114476 1
i 3 239.91997332444151 2 10.91666666666667 67.33016944962806 -1 -0.3695652173913 -0.5 -0.5 -15061.098069106933 1
i 6 240.00000000000003 2 6.41666666666667 61.89860720493824 -1 -0.10869565217391 -0.5 -0.5 -13494.714531980753 1
</CsScore>
</CsoundSynthesizer>
