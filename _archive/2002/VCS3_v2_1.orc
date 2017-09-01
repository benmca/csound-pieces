;-------------------------------------------------------------------------------
; EMS VCS3 / Synthi A Emulator by Steven Cook - steve@babcom.u-net.com
;-------------------------------------------------------------------------------
sr     = 44100  
kr     = 441 
ksmps  = 100
nchnls = 1


FLpanel	"VCS3",1000,1000,100,100

#define BUTTONBANKWIDTH #400#
#define BUTTONBANKHEIGHT #20#
#define BUTTONBANKWIDTH #400#
#define BUTTONBANKORGX #100#
#define BUTTONBANKORGY #(1000-400)#

#define FIRSTROWOFFSETX #50#
#define FIRSTROWOFFSETY #50#
#define SECONDROWOFFSETX #50#
#define SECONDROWOFFSETY #150#
#define THIRDROWOFFSETX #50#
#define THIRDROWOFFSETY #250#
#define FOURTHROWOFFSETX #50#
#define FOURTHROWOFFSETY #350#

#define LABELOFFSETX #0#
#define LABELOFFSETY #80#
#define LABELWIDTH #100#
#define LABELHEIGHT #20#

#define KNOBOFFSETX #25#
#define KNOBOFFSETY #10#
#define KNOBWIDTH #50#

#define BUTTONWIDTH #25#
#define BUTTONHEIGHT #20#

;------------------------------------------------------------
; TOP ROW LAYOUT
;------------------------------------------------------------
itopbox  FLbox  "OSC1", 1, 1, 20, 100, 20, $FIRSTROWOFFSETX-50, $FIRSTROWOFFSETY 

ihandleosc1freqval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX, $FIRSTROWOFFSETY+$LABELOFFSETY
gkosc1freq, iosc1freqhandle FLknob  "freq", 0, 10, 0, 3, ihandleosc1freqval, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX , $FIRSTROWOFFSETY+$KNOBOFFSETY

ihandleosc1shapeval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+100, $FIRSTROWOFFSETY+$LABELOFFSETY
gkosc1shape, iosc1shapehandle FLknob  "shape", 0, 1, 0, 3, ihandleosc1shapeval, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+100 , $FIRSTROWOFFSETY+$KNOBOFFSETY


ihandleosc1lev1val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+200, $FIRSTROWOFFSETY+$LABELOFFSETY
gkosc1lev1, iosc1lev1handle FLknob  "sine level", 0, 1, 0, 3, ihandleosc1lev1val,  $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+200, $FIRSTROWOFFSETY+$KNOBOFFSETY


ihandleosc1lev2val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+300, $FIRSTROWOFFSETY+$LABELOFFSETY
gkosc1lev2, iosc1lev2handle FLknob  "saw level", 0, 1, 0, 3, ihandleosc1lev2val, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+300, $FIRSTROWOFFSETY+$KNOBOFFSETY

itopboxring  FLbox  "RING", 1, 1, 20, 100, 20, $FIRSTROWOFFSETX+450, $FIRSTROWOFFSETY 

ihandleringval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+500, $FIRSTROWOFFSETY+$LABELOFFSETY
gkringlevel, iringhandle FLknob  "level", 0, 1, 0, 3, ihandleringval, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+500 , $FIRSTROWOFFSETY+$KNOBOFFSETY

ihandlefiltosc_freqval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+600, $FIRSTROWOFFSETY+$LABELOFFSETY
gkfiltosc_freq, ifiltosc_freqhandle FLknob  "freq", 0, 1, 0, 3, ihandlefiltosc_freqval, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+600 , $FIRSTROWOFFSETY+$KNOBOFFSETY

ihandlefiltosc_respval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+700, $FIRSTROWOFFSETY+$LABELOFFSETY
gkfiltosc__resp, ifiltosc_resphandle FLknob  "response", 0, 1, 0, 3, ihandlefiltosc_respval,  $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+700, $FIRSTROWOFFSETY+$KNOBOFFSETY

ihandlefiltosc_levlval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FIRSTROWOFFSETX+$LABELOFFSETX+800, $FIRSTROWOFFSETY+$LABELOFFSETY
gkfiltosc_levl, ifiltosc_levlhandle FLknob  "level", 0, 1, 0, 3, ihandlefiltosc_levlval, $KNOBWIDTH, $FIRSTROWOFFSETX+$KNOBOFFSETX+800, $FIRSTROWOFFSETY+$KNOBOFFSETY


FLsetVal_i  7.0, iosc1freqhandle
FLsetVal_i  .52, iosc1shapehandle
FLsetVal_i  .75, iosc1lev1handle
FLsetVal_i  .1, iosc1lev2handle
FLsetTextSize  10, iosc1freqhandle
FLsetTextSize  10, iosc1shapehandle
FLsetTextSize  10, iosc1lev1handle
FLsetTextSize  10, iosc1lev2handle
FLsetBox 1, ihandleosc1freqval
FLsetBox 1, ihandleosc1shapeval
FLsetBox 1, ihandleosc1lev1val
FLsetBox 1, ihandleosc1lev2val

FLsetVal_i  .66, iringhandle
FLsetVal_i  .5, ifiltosc_freqhandle
FLsetVal_i  .9, ifiltosc_resphandle
FLsetVal_i  .5, ifiltosc_levlhandle
FLsetTextSize  10, iringhandle
FLsetTextSize  10, ifiltosc_freqhandle
FLsetTextSize  10, ifiltosc_resphandle
FLsetTextSize  10, ifiltosc_levlhandle
FLsetBox 1, ihandleringval
FLsetBox 1, ihandlefiltosc_freqval
FLsetBox 1, ihandlefiltosc_respval
FLsetBox 1, ihandlefiltosc_levlval


;------------------------------------------------------------
; 2nd ROW LAYOUT
;------------------------------------------------------------
i2ndbox  FLbox  "OSC2", 1, 1, 20, 100, 20, $SECONDROWOFFSETX-50, $SECONDROWOFFSETY 


ihandleosc2freqval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX, $SECONDROWOFFSETY+$LABELOFFSETY
gkosc2freq, iosc2freqhandle FLknob  "freq", 0, 10, 0, 3, ihandleosc2freqval, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX , $SECONDROWOFFSETY+$KNOBOFFSETY

ihandleosc2shapeval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+100, $SECONDROWOFFSETY+$LABELOFFSETY
gkosc2shape, iosc2shapehandle FLknob  "shape", 0, 1, 0, 3, ihandleosc2shapeval, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+100 , $SECONDROWOFFSETY+$KNOBOFFSETY


ihandleosc2lev1val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+200, $SECONDROWOFFSETY+$LABELOFFSETY
gkosc2lev1, iosc2lev1handle FLknob  "pulse level", 0, 1, 0, 3, ihandleosc2lev1val,  $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+200, $SECONDROWOFFSETY+$KNOBOFFSETY


ihandleosc2lev2val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+300, $SECONDROWOFFSETY+$LABELOFFSETY
gkosc2lev2, iosc2lev2handle FLknob  "ramp level", 0, 1, 0, 3, ihandleosc2lev2val, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+300, $SECONDROWOFFSETY+$KNOBOFFSETY


i2ndenvbox  FLbox  "ENV", 1, 1, 20, 100, 20, $SECONDROWOFFSETX+450, $SECONDROWOFFSETY 


ihandleenv_attackval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+550, $SECONDROWOFFSETY+$LABELOFFSETY
gkenv_attack, iattack_envhandle FLknob  "attack", 0, 10, 0, 3, ihandleenv_attackval, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+550, $SECONDROWOFFSETY+$KNOBOFFSETY

ihandleenv_onval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+650, $SECONDROWOFFSETY+$LABELOFFSETY
gkenv_on, ienv_onhandle FLknob  "on", 0, 1, 0, 3, ihandleenv_onval, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+650 , $SECONDROWOFFSETY+$KNOBOFFSETY

ihandleenv_decayval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+750, $SECONDROWOFFSETY+$LABELOFFSETY
gkenv_decay, ienv_decayhandle FLknob  "decay", 0, 10, 0, 3, ihandleenv_decayval,  $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+750, $SECONDROWOFFSETY+$KNOBOFFSETY

ihandleenv_offval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $SECONDROWOFFSETX+$LABELOFFSETX+850, $SECONDROWOFFSETY+$LABELOFFSETY
gkenv_off, ienv_offhandle FLknob  "off", 0, 1, 0, 3, ihandleenv_offval, $KNOBWIDTH, $SECONDROWOFFSETX+$KNOBOFFSETX+850, $SECONDROWOFFSETY+$KNOBOFFSETY

FLsetVal_i  1.0, iosc2freqhandle
FLsetVal_i  0.0, iosc2shapehandle
FLsetVal_i  0.75, iosc2lev1handle
FLsetVal_i  .6, iosc2lev2handle
FLsetTextSize  10, iosc2freqhandle
FLsetTextSize  10, iosc2shapehandle
FLsetTextSize  10, iosc2lev1handle
FLsetTextSize  10, iosc2lev2handle
FLsetBox 1, ihandleosc2freqval
FLsetBox 1, ihandleosc2shapeval
FLsetBox 1, ihandleosc2lev1val
FLsetBox 1, ihandleosc2lev2val



FLsetVal_i  .25, iattack_envhandle
FLsetVal_i  0.0, ienv_onhandle
FLsetVal_i  7.75, ienv_decayhandle
FLsetVal_i  1.0, ienv_offhandle
FLsetTextSize  10, iattack_envhandle
FLsetTextSize  10, ienv_onhandle
FLsetTextSize  10, ienv_decayhandle
FLsetTextSize  10, ienv_offhandle
FLsetBox 1, ihandleenv_attackval
FLsetBox 1, ihandleenv_onval
FLsetBox 1, ihandleenv_decayval
FLsetBox 1, ihandleenv_offval



;------------------------------------------------------------
; 3rd ROW LAYOUT
;------------------------------------------------------------
i3rdbox  FLbox  "OSC3", 1, 1, 20, 100, 20, $THIRDROWOFFSETX-50, $THIRDROWOFFSETY 

ihandleosc3freqval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX, $THIRDROWOFFSETY+$LABELOFFSETY
gkosc3freq, iosc3freqhandle FLknob  "freq", 0, 10, 0, 3, ihandleosc3freqval, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX , $THIRDROWOFFSETY+$KNOBOFFSETY

ihandleosc3shapeval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+100, $THIRDROWOFFSETY+$LABELOFFSETY
gkosc3shape, iosc3shapehandle FLknob  "shape", 0, 1, 0, 3, ihandleosc3shapeval, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+100 , $THIRDROWOFFSETY+$KNOBOFFSETY


ihandleosc3lev1val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+200, $THIRDROWOFFSETY+$LABELOFFSETY
gkosc3lev1, iosc3lev1handle FLknob  "pulse level", 0, 1, 0, 3, ihandleosc3lev1val,  $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+200, $THIRDROWOFFSETY+$KNOBOFFSETY


ihandleosc3lev2val  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+300, $THIRDROWOFFSETY+$LABELOFFSETY
gkosc3lev2, iosc3lev2handle FLknob  "ramp level", 0, 1, 0, 3, ihandleosc3lev2val, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+300, $THIRDROWOFFSETY+$KNOBOFFSETY


i3rdenvbox  FLbox  "REVERB", 1, 1, 20, 100, 20, $THIRDROWOFFSETX+450, $THIRDROWOFFSETY 

ihandlervb_mixval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+500, $THIRDROWOFFSETY+$LABELOFFSETY
gkrvb_mix, irvb_mixhandle FLknob  "mix", 0, 10, 0, 3, ihandlervb_mixval, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+500, $THIRDROWOFFSETY+$KNOBOFFSETY

ihandlervb_levelval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+600, $THIRDROWOFFSETY+$LABELOFFSETY
gkrvb_level, irvb_levelhandle FLknob  "level", 0, 1, 0, 3, ihandlervb_levelval, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+600 , $THIRDROWOFFSETY+$KNOBOFFSETY

ihandleenv_trapval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+750, $THIRDROWOFFSETY+$LABELOFFSETY
gkenv_trap, ienv_traphandle FLknob  "trapezoid", 0, 1, 0, 3, ihandleenv_trapval,  $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+750, $THIRDROWOFFSETY+$KNOBOFFSETY

ihandleenv_sigval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $THIRDROWOFFSETX+$LABELOFFSETX+850, $THIRDROWOFFSETY+$LABELOFFSETY
gkenv_sig, ienv_sighandle FLknob  "signal", 0, 1, 0, 3, ihandleenv_sigval, $KNOBWIDTH, $THIRDROWOFFSETX+$KNOBOFFSETX+850, $THIRDROWOFFSETY+$KNOBOFFSETY


FLsetVal_i  3.05, iosc3freqhandle
FLsetVal_i  0.33, iosc3shapehandle
FLsetVal_i  0.00, iosc3lev1handle
FLsetVal_i  0.25, iosc3lev2handle

FLsetTextSize  10, iosc3freqhandle
FLsetTextSize  10, iosc3shapehandle
FLsetTextSize  10, iosc3lev1handle
FLsetTextSize  10, iosc3lev2handle

FLsetBox 1, ihandleosc3freqval
FLsetBox 1, ihandleosc3shapeval
FLsetBox 1, ihandleosc3lev1val
FLsetBox 1, ihandleosc3lev2val

FLsetVal_i  1.0, irvb_mixhandle
FLsetVal_i  .5, irvb_levelhandle
FLsetVal_i  .66, ienv_traphandle
FLsetVal_i  1.0, ienv_sighandle

FLsetTextSize  10, irvb_mixhandle
FLsetTextSize  10, irvb_levelhandle
FLsetTextSize  10, ienv_traphandle
FLsetTextSize  10, ienv_sighandle

FLsetBox 1, ihandlervb_mixval
FLsetBox 1, ihandlervb_levelval
FLsetBox 1, ihandleenv_trapval
FLsetBox 1, ihandleenv_sigval

;------------------------------------------------------------
; 4th ROW LAYOUT
;------------------------------------------------------------
i3rdbox  FLbox  "NOISE GEN", 1, 1, 20, 100, 20, $FOURTHROWOFFSETX-50, $FOURTHROWOFFSETY 

ihandlenoisecolorval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FOURTHROWOFFSETX+$LABELOFFSETX, $FOURTHROWOFFSETY+$LABELOFFSETY
gknoisecolor, inoisecolorhandle FLknob  "color", 0, 10, 0, 3, ihandlenoisecolorval, $KNOBWIDTH, $FOURTHROWOFFSETX+$KNOBOFFSETX , $FOURTHROWOFFSETY+$KNOBOFFSETY

ihandlenoiselevelval  FLvalue " ", $LABELWIDTH, $LABELHEIGHT, $FOURTHROWOFFSETX+$LABELOFFSETX+100, $FOURTHROWOFFSETY+$LABELOFFSETY
gknoiselevel, inoiselevelhandle FLknob  "level", 0, 1, 0, 3, ihandlenoiselevelval, $KNOBWIDTH, $FOURTHROWOFFSETX+$KNOBOFFSETX+100 , $FOURTHROWOFFSETY+$KNOBOFFSETY


FLsetVal_i  0.4, inoisecolorhandle
FLsetVal_i  0.75, inoiselevelhandle

FLsetTextSize  10, inoisecolorhandle
FLsetTextSize  10, inoiselevelhandle

FLsetBox 1, ihandlenoisecolorval
FLsetBox 1, ihandlenoiselevelval


;------------------------------------------------------------
; JOYSTICK LAYOUT
;------------------------------------------------------------

gk1,gk2,ihj1,ihj2 FLjoy	"Joystick", -32767, 32767, -32767, 32767,0,0,-1,-1,250,250,$BUTTONBANKORGX+$BUTTONBANKWIDTH+120,$BUTTONBANKORGY

;------------------------------------------------------------
; MATRIX LAYOUT
;------------------------------------------------------------

gkbutton1a, ihandle1a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1b, ihandle1b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1c, ihandle1c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1d, ihandle1d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1e, ihandle1e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1f, ihandle1f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1g, ihandle1g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1h, ihandle1h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1i, ihandle1i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1j, ihandle1j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1k, ihandle1k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1l, ihandle1l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1m, ihandle1m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1n, ihandle1n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1o, ihandle1o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY, 105, 80,  0, 1
gkbutton1p, ihandle1p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY, 105, 80,  0, 1
FLsetVal_i 1, ihandle1b
FLsetVal_i 1, ihandle1c
FLsetVal_i 1, ihandle1e

gkbutton2a, ihandle2a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2b, ihandle2b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2c, ihandle2c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2d, ihandle2d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2e, ihandle2e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2f, ihandle2f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2g, ihandle2g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2h, ihandle2h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2i, ihandle2i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2j, ihandle2j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2k, ihandle2k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2l, ihandle2l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2m, ihandle2m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2n, ihandle2n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2o, ihandle2o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+20, 105, 81,  0, 1
gkbutton2p, ihandle2p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+20, 105, 81,  0, 1
FLsetVal_i 1, ihandle2j

gkbutton3a, ihandle3a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3b, ihandle3b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3c, ihandle3c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3d, ihandle3d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3e, ihandle3e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3f, ihandle3f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3g, ihandle3g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3h, ihandle3h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3i, ihandle3i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3j, ihandle3j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3k, ihandle3k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3l, ihandle3l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3m, ihandle3m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3n, ihandle3n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3o, ihandle3o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+40, 105, 82,  0, 1
gkbutton3p, ihandle3p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+40, 105, 82,  0, 1
FLsetVal_i 1, ihandle3f

gkbutton4a, ihandle4a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4b, ihandle4b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4c, ihandle4c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4d, ihandle4d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4e, ihandle4e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4f, ihandle4f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4g, ihandle4g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4h, ihandle4h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4i, ihandle4i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4j, ihandle4j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4k, ihandle4k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4l, ihandle4l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4m, ihandle4m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4n, ihandle4n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4o, ihandle4o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+60, 105, 83,  0, 1
gkbutton4p, ihandle4p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+60, 105, 83,  0, 1
FLsetVal_i 1, ihandle4d

gkbutton5a, ihandle5a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5b, ihandle5b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5c, ihandle5c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5d, ihandle5d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5e, ihandle5e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5f, ihandle5f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5g, ihandle5g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5h, ihandle5h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5i, ihandle5i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5j, ihandle5j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5k, ihandle5k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5l, ihandle5l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5m, ihandle5m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5n, ihandle5n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5o, ihandle5o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+80, 105, 84,  0, 1
gkbutton5p, ihandle5p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+80, 105, 84,  0, 1

gkbutton6a, ihandle6a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6b, ihandle6b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6c, ihandle6c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6d, ihandle6d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6e, ihandle6e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6f, ihandle6f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6g, ihandle6g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6h, ihandle6h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6i, ihandle6i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6j, ihandle6j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6k, ihandle6k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6l, ihandle6l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6m, ihandle6m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6n, ihandle6n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6o, ihandle6o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+100, 105, 85,  0, 1
gkbutton6p, ihandle6p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+100, 105, 85,  0, 1
FLsetVal_i 1, ihandle6n

gkbutton7a, ihandle7a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7b, ihandle7b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7c, ihandle7c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7d, ihandle7d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7e, ihandle7e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7f, ihandle7f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7g, ihandle7g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7h, ihandle7h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7i, ihandle7i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7j, ihandle7j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7k, ihandle7k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7l, ihandle7l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7m, ihandle7m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7n, ihandle7n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7o, ihandle7o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+120, 105, 86,  0, 1
gkbutton7p, ihandle7p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+120, 105, 86,  0, 1
FLsetVal_i 1, ihandle7h

gkbutton8a, ihandle8a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8b, ihandle8b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8c, ihandle8c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8d, ihandle8d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8e, ihandle8e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8f, ihandle8f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8g, ihandle8g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8h, ihandle8h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8i, ihandle8i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8j, ihandle8j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8k, ihandle8k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8l, ihandle8l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8m, ihandle8m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8n, ihandle8n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8o, ihandle8o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+140, 105, 87,  0, 1
gkbutton8p, ihandle8p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+140, 105, 87,  0, 1


gkbutton9a, ihandle9a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9b, ihandle9b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9c, ihandle9c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9d, ihandle9d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9e, ihandle9e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9f, ihandle9f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9g, ihandle9g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9h, ihandle9h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9i, ihandle9i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9j, ihandle9j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9k, ihandle9k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9l, ihandle9l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9m, ihandle9m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9n, ihandle9n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9o, ihandle9o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+160, 105, 88,  0, 1
gkbutton9p, ihandle9p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+160, 105, 88,  0, 1

gkbutton10a, ihandle10a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10b, ihandle10b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10c, ihandle10c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10d, ihandle10d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10e, ihandle10e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10f, ihandle10f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10g, ihandle10g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10h, ihandle10h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10i, ihandle10i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10j, ihandle10j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10k, ihandle10k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10l, ihandle10l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10m, ihandle10m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10n, ihandle10n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10o, ihandle10o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+180, 105, 89,  0, 1
gkbutton10p, ihandle10p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+180, 105, 89,  0, 1
FLsetVal_i 1, ihandle10b
FLsetVal_i 1, ihandle10g


gkbutton11a, ihandle11a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11b, ihandle11b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11c, ihandle11c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11d, ihandle11d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11e, ihandle11e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11f, ihandle11f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11g, ihandle11g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11h, ihandle11h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11i, ihandle11i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11j, ihandle11j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11k, ihandle11k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11l, ihandle11l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11m, ihandle11m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11n, ihandle11n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11o, ihandle11o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+200, 105, 90,  0, 1
gkbutton11p, ihandle11p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+200, 105, 90,  0, 1
FLsetVal_i 1, ihandle11j


gkbutton12a, ihandle12a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12b, ihandle12b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12c, ihandle12c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12d, ihandle12d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12e, ihandle12e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12f, ihandle12f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12g, ihandle12g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12h, ihandle12h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12i, ihandle12i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12j, ihandle12j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12k, ihandle12k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12l, ihandle12l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12m, ihandle12m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12n, ihandle12n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12o, ihandle12o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+220, 105, 91,  0, 1
gkbutton12p, ihandle12p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+220, 105, 91,  0, 1
FLsetVal_i 1, ihandle12i


gkbutton13a, ihandle13a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13b, ihandle13b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13c, ihandle13c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13d, ihandle13d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13e, ihandle13e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13f, ihandle13f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13g, ihandle13g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13h, ihandle13h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13i, ihandle13i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13j, ihandle13j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13k, ihandle13k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13l, ihandle13l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13m, ihandle13m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13n, ihandle13n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13o, ihandle13o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+240, 105, 92,  0, 1
gkbutton13p, ihandle13p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+240, 105, 92,  0, 1
FLsetVal_i 1, ihandle13h

gkbutton14a, ihandle14a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14b, ihandle14b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14c, ihandle14c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14d, ihandle14d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14e, ihandle14e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14f, ihandle14f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14g, ihandle14g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14h, ihandle14h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14i, ihandle14i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14j, ihandle14j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14k, ihandle14k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14l, ihandle14l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14m, ihandle14m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14n, ihandle14n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14o, ihandle14o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+260, 105, 93,  0, 1
gkbutton14p, ihandle14p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+260, 105, 93,  0, 1
FLsetVal_i 1, ihandle14c

gkbutton15a, ihandle15a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15b, ihandle15b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15c, ihandle15c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15d, ihandle15d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15e, ihandle15e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15f, ihandle15f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15g, ihandle15g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15h, ihandle15h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15i, ihandle15i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15j, ihandle15j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15k, ihandle15k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15l, ihandle15l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15m, ihandle15m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15n, ihandle15n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15o, ihandle15o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+280, 105, 94,  0, 1
gkbutton15p, ihandle15p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+280, 105, 94,  0, 1
FLsetVal_i 1, ihandle15j

gkbutton16a, ihandle16a  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16b, ihandle16b  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+25, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16c, ihandle16c  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+50, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16d, ihandle16d  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+75, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16e, ihandle16e  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+100, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16f, ihandle16f  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+125, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16g, ihandle16g  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+150, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16h, ihandle16h  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+175, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16i, ihandle16i  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+200, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16j, ihandle16j  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+225, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16k, ihandle16k  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+250, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16l, ihandle16l  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+275, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16m, ihandle16m  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+300, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16n, ihandle16n  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+325, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16o, ihandle16o  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+350, $BUTTONBANKORGY+300, 105, 95,  0, 1
gkbutton16p, ihandle16p  FLbutton  " ", 1, 0, 2, $BUTTONWIDTH, $BUTTONHEIGHT, $BUTTONBANKORGX+375, $BUTTONBANKORGY+300, 105, 95,  0, 1
FLsetVal_i 1, ihandle16k


iboxhandley1  FLbox  "osc1 sine", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY
iboxhandley2  FLbox  "osc1 saw", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+20
iboxhandley3  FLbox  "osc2 pulse", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+40
iboxhandley4  FLbox  "osc2 saw", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+60
iboxhandley5  FLbox  "osc3 pulse", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+80
iboxhandley6  FLbox  "osc3 saw", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+100
iboxhandley7  FLbox  "noise", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+120
iboxhandley8  FLbox  "input 1", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+140
iboxhandley9  FLbox  "input 2", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+160
iboxhandley10  FLbox  "filter", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+180
iboxhandley11  FLbox  "trapezoid 3", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+200
iboxhandley12  FLbox  "env signal", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+220
iboxhandley13  FLbox  "ring mod", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+240
iboxhandley14  FLbox  "reverb", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+260
iboxhandley15  FLbox  "joystick x", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+280
iboxhandley16  FLbox  "joystick y", 1, 1, 10, 100, $BUTTONBANKHEIGHT, $BUTTONBANKORGX-100, $BUTTONBANKORGY+300

iboxhandlex1  FLbox  "meter", 1, 1, 10, 25, 100, $BUTTONBANKORGX+0, $BUTTONBANKORGY-100
iboxhandlex2  FLbox  "out1", 1, 1, 10, 25, 100, $BUTTONBANKORGX+25, $BUTTONBANKORGY-100
iboxhandlex3  FLbox  "out2", 1, 1, 10, 25, 100, $BUTTONBANKORGX+50, $BUTTONBANKORGY-100
iboxhandlex4  FLbox  "env", 1, 1, 10, 25, 100, $BUTTONBANKORGX+75, $BUTTONBANKORGY-100
iboxhandlex5  FLbox  "ring mod a", 1, 1, 10, 25, 100, $BUTTONBANKORGX+100, $BUTTONBANKORGY-100
iboxhandlex6  FLbox  "ring mod a", 1, 1, 10, 25, 100, $BUTTONBANKORGX+125, $BUTTONBANKORGY-100
iboxhandlex7  FLbox  "rvb", 1, 1, 10, 25, 100, $BUTTONBANKORGX+150, $BUTTONBANKORGY-100
iboxhandlex8  FLbox  "filt", 1, 1, 10, 25, 100, $BUTTONBANKORGX+175, $BUTTONBANKORGY-100
iboxhandlex9  FLbox  "osc freq 1", 1, 1, 10, 25, 100, $BUTTONBANKORGX+200, $BUTTONBANKORGY-100
iboxhandlex10  FLbox  "osc freq 2", 1, 1, 10, 25, 100, $BUTTONBANKORGX+225, $BUTTONBANKORGY-100
iboxhandlex11  FLbox  "osc freq 3", 1, 1, 10, 25, 100, $BUTTONBANKORGX+250, $BUTTONBANKORGY-100
iboxhandlex12  FLbox  "decay", 1, 1, 10, 25, 100, $BUTTONBANKORGX+275, $BUTTONBANKORGY-100
iboxhandlex13  FLbox  "rvb mix", 1, 1, 10, 25, 100, $BUTTONBANKORGX+300, $BUTTONBANKORGY-100
iboxhandlex14  FLbox  "filter freq", 1, 1, 10, 25, 100, $BUTTONBANKORGX+325, $BUTTONBANKORGY-100
iboxhandlex15  FLbox  "out ch lvl 1", 1, 1, 10, 25, 100, $BUTTONBANKORGX+350, $BUTTONBANKORGY-100
iboxhandlex16  FLbox  "out ch lvl 2", 1, 1, 10, 25, 100, $BUTTONBANKORGX+375, $BUTTONBANKORGY-100

FLpanel_end 
FLrun




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

;-------------------------------------------------------------------------------
instr    1 ; OSCILLATOR 1 - Variable sine and fixed saw
;ioct     = int(p4)*2184.533333            ; Frequency - octaves
;isemi    = frac(p4)*18204.44444           ; Frequency - semitones
;ifreq    = ioct + isemi                   ; Sum octaves and semitones
koct     = int(gkosc1freq)*2184.533333            ; Frequency - octaves
ksemi    = frac(gkosc1freq)*18204.44444           ; Frequency - semitones
kfreq    = koct + ksemi                   ; Sum octaves and semitones
;ishape   = p5 - .5                        ; Shape
kshape = gkosc1shape - .5
;ilevl1   = p6*32767                       ; Sine output level
;ilevl2   = p7*65535                       ; Saw output level
klevl1 = gkosc1lev1*32767
klevl2 = gkosc1lev2*65535
afmod    = ga09                           ; Frequency modulation input
ga09     = 0                              ; Clear global ch.09
afreq    = kfreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
ksaw     downsamp  asaw                   ; Convert ramp to kr
ksync    trigger  ksaw, .5, 1             ; Detect falling edge of ramp
zkw      ksync, 0                         ; Output sync pulse to zak ch.0
atri     oscili .5, afreq, 2, -1          ; Generate triangle
asine    tablei  atri + kshape, 4, 1, .5  ; Shape triangle into sine
zaw      asine*klevl1, 01                 ; Output to zak ch.01
zaw      (asaw - .5)*klevl2, 02           ; Output to zak ch.02
endin
;-------------------------------------------------------------------------------
instr    2 ; OSCILLATOR 2 - Variable pulse and ramp
asaw     init 0                           ; Initialise ramp to zero
koct     = int(gkosc2freq)*2184.533333            ; Frequency - octaves
ksemi    = frac(gkosc2freq)*18204.44444           ; Frequency - semitones
kfreq    = koct + ksemi                   ; Sum octaves and semitones
kshape   limit  gkosc2shape, .01, .99              ; Shape, limited to avoid 0% pulse
kshift   = abs(.5 - kshape)/2 + .25       ; Calc DC level shift for ramp
klevl1   = gkosc2lev1*32767                       ; Pulse output level
klevl2   = gkosc2lev2*65535                       ; Ramp output level
isync    = p8                             ; Sync
afmod    = ga10                           ; Frequency modulation input
ga10     = 0                              ; Clear global ch.10
afreq    = kfreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
ksync    zkr 0                            ; Sync pulse input from oscillator 1
ksync    = (ksync > 0 ? ksync : 0)        ; Sync on/off switch
afreq    = (ksync > 0 ? (1 - asaw)*sr : afreq) ; Calc frequency to reset
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
asaw1    limit  asaw, 0, kshape           ; Isolate lower section
asaw2    limit  asaw, kshape, 1           ; Isolate upper section
aramp    = asaw1*(.5/kshape) + (asaw2 - kshape)*(.5/(1 - kshape)) ; Recalc ramp
apulse   table  aramp, 3, 1               ; Read pulse wave from table
aramp    mirror  1 - asaw - kshape, 0, 1  ; Full wave rectify (saw + shape)
zaw      apulse*klevl1, 03                ; Output to zak ch.03
zaw      (aramp - kshift)*klevl2, 04      ; Output to zak ch.04
endin
;-------------------------------------------------------------------------------
instr    3 ; OSCILLATOR 3 - Variable pulse and ramp, LFO or audio rate
asaw     init 0                           ; Initialise ramp to zero
koct     = int(gkosc3freq)*2184.533333            ; Frequency - octaves
ksemi    = frac(gkosc3freq)*18204.44444           ; Frequency - semitones
kfreq    = koct + ksemi                   ; Sum octaves and semitones
kshape   limit  gkosc3shape, .01, .99              ; Shape, limited to avoid 0% pulse
kshift   = abs(.5 - kshape)/2 + .25       ; Calc DC level shift for ramp
klevl1   = gkosc3lev1*32767                       ; Pulse output level
klevl2   = gkosc3lev2*65535                       ; Ramp output level
isync    = p8                             ; Sync
imode    = (p9 > 0 ? .05 : 1)             ; LFO/audio rate switch
afmod    = ga11                           ; Frequency modulation input
ga11     = 0                              ; Clear global ch.11
afreq    = kfreq + afmod + 68.50634       ; Add FM sources and tune to A=440
afreq    tablei  afreq/32768, 7, 1        ; Linear to exponential convertor
ksync    zkr 0                            ; Sync pulse input from oscillator 1
ksync    = (ksync > 0 ? ksync : 0)        ; Sync on/off switch
afreq    = (ksync > 0 ? (1 - asaw)*sr : afreq*imode) ; Calc frequency to reset
asaw     oscili  1, afreq, 1, -1          ; Generate positive ramp
asaw1    limit  asaw, 0, kshape           ; Isolate lower section
asaw2    limit  asaw, kshape, 1           ; Isolate upper section
aramp    = asaw1*(.5/kshape) + (asaw2 - kshape)*(.5/(1 - kshape)) ; Recalc ramp
apulse   table  aramp, 3, 1               ; Read pulse wave from table
aramp    mirror  1 - asaw - kshape, 0, 1  ; Full wave rectify (saw + shape)
zaw      apulse*klevl1, 05                ; Output to zak ch.05
zaw      (aramp - kshift)*klevl2, 06      ; Output to zak ch.06
endin
;-------------------------------------------------------------------------------
instr    4 ; NOISE GENERATOR
kcolour1 = ampdb((1 - gknoisecolor - .5)*24)        ; Colour (bass)
kcolour2 = ampdb((gknoisecolor - .5)*24)            ; Colour (treble)
klevl    = gknoiselevel                             ; Output level
iseed    = rnd(1)                         ; Generate seed value
anoise   rand  32000, iseed               ; Generate white noise
anoise   pareq  anoise, 100, kcolour1, .707, 1 ; Bass +/-
anoise   pareq  anoise, 10000, kcolour2, .707, 2 ; Treble -/+
zaw      anoise*klevl, 07                 ; Output to zak ch.07
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
kfreq    = gkfiltosc_freq*.8 + .2                     ; Frequency (cutoff)
krez     = gkfiltosc__resp                             ; Response (resonance)
klevl    = gkfiltosc_levl*65536                       ; Output level
ain      limit  ga08/65536, -1, 1         ; Signal input, limited
ga08     = 0                              ; Clear global ch.08
afmod    = ga14/32767                     ; Frequency modulation input
ga14     = 0                              ; Clear global ch.14
afreq    tablei  kfreq + afmod, 8, 1      ; Linear to exponential convertor
afilt    moogvcf  ain, afreq, krez        ; Filter
zaw      afilt*klevl, 10                  ; Output to zak ch.10
endin
;-------------------------------------------------------------------------------
instr    7 ; RING MOD
klevl    = gkringlevel                             ; Output level
ain1     = ga05/32767                     ; Input A
ain2     = ga06/32767                     ; Input B
ga05     = 0                              ; Clear global ch.05
ga06     = 0                              ; Clear global ch.06
aring    = ain1*ain2*32767                ; Calculate and scale ring modulation
zaw      aring*klevl, 13                  ; Output to zak ch.13
endin
;-------------------------------------------------------------------------------
instr    8 ; REVERBERATION
kmix     = gkrvb_mix                             ; Mix (wet/dry)
klevl    = gkrvb_level                             ; Output level
ain      = ga07                           ; Signal input
amixmod  = ga13/32767                     ; Mix modulation input
ga07     = 0                              ; Clear global ch.07
ga13     = 0                              ; Clear global ch.13
arvb     reverb  ain, 3                   ; Generate reverb
amix     limit  amixmod + kmix, 0, 1      ; Limit mix range 0 to 1
arvb     = arvb*amix + ain*(1 - amix)     ; Calculate wet/dry balance
zaw      arvb*klevl, 14                   ; Output to zak ch.14
endin
;-------------------------------------------------------------------------------
;instr    9 ; JOYSTICK - Dual random moulation source
;irngex   = p4*32767                       ; X Range
;irngey   = p5*32767                       ; Y Range
;iratex   = p6                             ; X Rate
;iratey   = p7                             ; Y Rate
;iseed    = rnd(1)                         ; Generate random seed value
;kx       randi  1, iratex, iseed          ; Generate X random modulation
;ky       randi  1, iratey, iseed          ; Generate Y random modulation
;kjoyx    = sin(90 - sininv(kx))           ; Calculate X circular boundary
;kjoyy    = sin(90 - sininv(ky))           ; Calculate Y circular boundary
;kx       limit  kx, -kjoyy, kjoyy         ; Constrain X within Y boundary
;ky       limit  ky, -kjoyx, kjoyx         ; Constrain Y within X boundary
;ax       upsamp  kx                       ; Convert X to sr
;ay       upsamp  ky                       ; Convert Y to sr
;zaw      ax*irngex, 15                    ; Output X to zak ch.15
;zaw      ay*irngey, 16                    ; Output Y to zak ch.16
;endin
;-------------------------------------------------------------------------------
instr    9 ; JOYSTICK - Realtime X-Y input using mouse (untested)
irangex  = p4                             ; Range X
irangey  = p5                             ; Range Y
;kx, ky   xyin  .1, -32767, 32767, -32767, 32767, 0, 0 ; Input mouse position
ajoyx    interp  gk1;*irangex               ; Convert to audio rate
ajoyy    interp  gk2;*irangey               ; Convert to audio rate
zaw      ajoyx, 15                        ; Output to zak ch.15
zaw      ajoyy, 16                        ; Output to zak ch.16
endin
;-------------------------------------------------------------------------------
instr    10 ; ENVELOPE SHAPER
kattack  limit  gkenv_attack, .001, 100             ; Attack time
kon      = gkenv_on + .001                      ; On (sustain) time
kdecay   = gkenv_decay + .001                   ; Decay time
koff     = gkenv_off + .001                      ; Off (repeat delay) time

ktrap    = gkenv_trap*32767                       ; Trapezoid output level
kamp     = gkenv_sig                             ; Amplifier output level
ain      = ga04*kamp                      ; Amplifier signal input
admod    = ga12/32767                     ; Decay modulation input
ga04     = 0                              ; Clear global ch.04
ga12     = 0                              ; Clear global ch.12
kdmod    downsamp  admod                  ; Convert decay modulation to kr
kdecay   = kdecay + abs(kdmod)            ; Add decay modulation avoiding (-)
krate    = 1/(kattack + kon + kdecay + koff) ; Total env time
k1       = kattack                        ; 1st index level
k2       = k1 + kon                       ; 2nd index level
k3       = k2 + kdecay                    ; 3rd index level
k4       = k3 + koff                      ; 4th index level
aramp    oscil  k4, krate, 1              ; Generate (+) ramp
a1       limit  aramp, 0, k1              ; Isolate 1st section of ramp
a2       limit  aramp, k1, k2             ; Isolate 2nd section of ramp
a3       limit  aramp, k2, k3             ; Isolate 3rd section of ramp
a4       limit  aramp, k3, k4             ; Isolate 4th section of ramp
; Recalculate ramp
aramp = .25*(a1*(1/kattack)+(a2-k1)*(1/kon)+(a3-k2)*(1/kdecay)+(a4-k3)*(1/koff))
atrap    tablei  aramp, 5, 1              ; Generate trapezoid envelope shape
zaw      atrap*ktrap, 11                  ; Output to zak ch.11
zaw      ain*atrap, 12                    ; Output to zak ch.12
endin


;-------------------------------------------------------------------------------
instr    80 ; PATCH MATRIX translator for 1st row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 1;
;
;
k01     = gkbutton1a
k02     = gkbutton1b
k03     = gkbutton1c
k04     = gkbutton1d
k05     = gkbutton1e
k06     = gkbutton1f
k07     = gkbutton1g
k08     = gkbutton1h
k09     = gkbutton1i
k10     = gkbutton1j
k11     = gkbutton1k
k12     = gkbutton1l
k13     = gkbutton1m
k14     = gkbutton1n
k15     = gkbutton1o
k16     = gkbutton1p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
endin

;-------------------------------------------------------------------------------
instr    81 ; PATCH MATRIX translator for 2nd row
;
; translate button events to notes for instr 98
;
izakchannel = 2;
;
;
k01     = gkbutton2a
k02     = gkbutton2b
k03     = gkbutton2c
k04     = gkbutton2d
k05     = gkbutton2e
k06     = gkbutton2f
k07     = gkbutton2g
k08     = gkbutton2h
k09     = gkbutton2i
k10     = gkbutton2j
k11     = gkbutton2k
k12     = gkbutton2l
k13     = gkbutton2m
k14     = gkbutton2n
k15     = gkbutton2o
k16     = gkbutton2p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin

;-------------------------------------------------------------------------------
instr    82 ; PATCH MATRIX translator for 3rd row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 3;
;
;
k01     = gkbutton3a
k02     = gkbutton3b
k03     = gkbutton3c
k04     = gkbutton3d
k05     = gkbutton3e
k06     = gkbutton3f
k07     = gkbutton3g
k08     = gkbutton3h
k09     = gkbutton3i
k10     = gkbutton3j
k11     = gkbutton3k
k12     = gkbutton3l
k13     = gkbutton3m
k14     = gkbutton3n
k15     = gkbutton3o
k16     = gkbutton3p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    83 ; PATCH MATRIX translator for 4th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 4;
;
;
k01     = gkbutton4a
k02     = gkbutton4b
k03     = gkbutton4c
k04     = gkbutton4d
k05     = gkbutton4e
k06     = gkbutton4f
k07     = gkbutton4g
k08     = gkbutton4h
k09     = gkbutton4i
k10     = gkbutton4j
k11     = gkbutton4k
k12     = gkbutton4l
k13     = gkbutton4m
k14     = gkbutton4n
k15     = gkbutton4o
k16     = gkbutton4p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    84 ; PATCH MATRIX translator for 5th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 5;
;
;
k01     = gkbutton5a
k02     = gkbutton5b
k03     = gkbutton5c
k04     = gkbutton5d
k05     = gkbutton5e
k06     = gkbutton5f
k07     = gkbutton5g
k08     = gkbutton5h
k09     = gkbutton5i
k10     = gkbutton5j
k11     = gkbutton5k
k12     = gkbutton5l
k13     = gkbutton5m
k14     = gkbutton5n
k15     = gkbutton5o
k16     = gkbutton5p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    85 ; PATCH MATRIX translator for 6th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 6;
;
;
k01     = gkbutton6a
k02     = gkbutton6b
k03     = gkbutton6c
k04     = gkbutton6d
k05     = gkbutton6e
k06     = gkbutton6f
k07     = gkbutton6g
k08     = gkbutton6h
k09     = gkbutton6i
k10     = gkbutton6j
k11     = gkbutton6k
k12     = gkbutton6l
k13     = gkbutton6m
k14     = gkbutton6n
k15     = gkbutton6o
k16     = gkbutton6p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    86 ; PATCH MATRIX translator for 7th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 7;
;
;
k01     = gkbutton7a
k02     = gkbutton7b
k03     = gkbutton7c
k04     = gkbutton7d
k05     = gkbutton7e
k06     = gkbutton7f
k07     = gkbutton7g
k08     = gkbutton7h
k09     = gkbutton7i
k10     = gkbutton7j
k11     = gkbutton7k
k12     = gkbutton7l
k13     = gkbutton7m
k14     = gkbutton7n
k15     = gkbutton7o
k16     = gkbutton7p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    87 ; PATCH MATRIX translator for 8th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 8;
;
;
k01     = gkbutton8a
k02     = gkbutton8b
k03     = gkbutton8c
k04     = gkbutton8d
k05     = gkbutton8e
k06     = gkbutton8f
k07     = gkbutton8g
k08     = gkbutton8h
k09     = gkbutton8i
k10     = gkbutton8j
k11     = gkbutton8k
k12     = gkbutton8l
k13     = gkbutton8m
k14     = gkbutton8n
k15     = gkbutton8o
k16     = gkbutton8p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    88 ; PATCH MATRIX translator for 9th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 9;
;
;
k01     = gkbutton9a
k02     = gkbutton9b
k03     = gkbutton9c
k04     = gkbutton9d
k05     = gkbutton9e
k06     = gkbutton9f
k07     = gkbutton9g
k08     = gkbutton9h
k09     = gkbutton9i
k10     = gkbutton9j
k11     = gkbutton9k
k12     = gkbutton9l
k13     = gkbutton9m
k14     = gkbutton9n
k15     = gkbutton9o
k16     = gkbutton9p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    89 ; PATCH MATRIX translator for 10th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 10;
;
;
k01     = gkbutton10a
k02     = gkbutton10b
k03     = gkbutton10c
k04     = gkbutton10d
k05     = gkbutton10e
k06     = gkbutton10f
k07     = gkbutton10g
k08     = gkbutton10h
k09     = gkbutton10i
k10     = gkbutton10j
k11     = gkbutton10k
k12     = gkbutton10l
k13     = gkbutton10m
k14     = gkbutton10n
k15     = gkbutton10o
k16     = gkbutton10p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    90 ; PATCH MATRIX translator for 11th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 11;
;
;
k01     = gkbutton11a
k02     = gkbutton11b
k03     = gkbutton11c
k04     = gkbutton11d
k05     = gkbutton11e
k06     = gkbutton11f
k07     = gkbutton11g
k08     = gkbutton11h
k09     = gkbutton11i
k10     = gkbutton11j
k11     = gkbutton11k
k12     = gkbutton11l
k13     = gkbutton11m
k14     = gkbutton11n
k15     = gkbutton11o
k16     = gkbutton11p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    91 ; PATCH MATRIX translator for 12th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 12;
;
;
k01     = gkbutton12a
k02     = gkbutton12b
k03     = gkbutton12c
k04     = gkbutton12d
k05     = gkbutton12e
k06     = gkbutton12f
k07     = gkbutton12g
k08     = gkbutton12h
k09     = gkbutton12i
k10     = gkbutton12j
k11     = gkbutton12k
k12     = gkbutton12l
k13     = gkbutton12m
k14     = gkbutton12n
k15     = gkbutton12o
k16     = gkbutton12p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset

endin
;-------------------------------------------------------------------------------
instr    92 ; PATCH MATRIX translator for 13th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 13;
;
;
k01     = gkbutton13a
k02     = gkbutton13b
k03     = gkbutton13c
k04     = gkbutton13d
k05     = gkbutton13e
k06     = gkbutton13f
k07     = gkbutton13g
k08     = gkbutton13h
k09     = gkbutton13i
k10     = gkbutton13j
k11     = gkbutton13k
k12     = gkbutton13l
k13     = gkbutton13m
k14     = gkbutton13n
k15     = gkbutton13o
k16     = gkbutton13p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    93 ; PATCH MATRIX translator for 14th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 14;
;
;
k01     = gkbutton14a
k02     = gkbutton14b
k03     = gkbutton14c
k04     = gkbutton14d
k05     = gkbutton14e
k06     = gkbutton14f
k07     = gkbutton14g
k08     = gkbutton14h
k09     = gkbutton14i
k10     = gkbutton14j
k11     = gkbutton14k
k12     = gkbutton14l
k13     = gkbutton14m
k14     = gkbutton14n
k15     = gkbutton14o
k16     = gkbutton14p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    94 ; PATCH MATRIX translator for 15th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 15;
;
;
k01     = gkbutton15a
k02     = gkbutton15b
k03     = gkbutton15c
k04     = gkbutton15d
k05     = gkbutton15e
k06     = gkbutton15f
k07     = gkbutton15g
k08     = gkbutton15h
k09     = gkbutton15i
k10     = gkbutton15j
k11     = gkbutton15k
k12     = gkbutton15l
k13     = gkbutton15m
k14     = gkbutton15n
k15     = gkbutton15o
k16     = gkbutton15p

ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
endin
;-------------------------------------------------------------------------------
instr    95 ; PATCH MATRIX translator for 16th row
;
; translate button events to notes for instr 98
;
;reset:
izakchannel = 16;
;
;
k01     = gkbutton16a
k02     = gkbutton16b
k03     = gkbutton16c
k04     = gkbutton16d
k05     = gkbutton16e
k06     = gkbutton16f
k07     = gkbutton16g
k08     = gkbutton16h
k09     = gkbutton16i
k10     = gkbutton16j
k11     = gkbutton16k
k12     = gkbutton16l
k13     = gkbutton16m
k14     = gkbutton16n
k15     = gkbutton16o
k16     = gkbutton16p
ain      zar  izakchannel                         ; Read selected zak ch.
ga02     = (k02 > 0 ? ga02 + ain : ga02)  ; Add zak to global ch.02 if 'pin' = 1
ga03     = (k03 > 0 ? ga03 + ain : ga03)  ; Add zak to global ch.03 if 'pin' = 1
ga04     = (k04 > 0 ? ga04 + ain : ga04)  ; Add zak to global ch.04 if 'pin' = 1
ga05     = (k05 > 0 ? ga05 + ain : ga05)  ; Add zak to global ch.05 if 'pin' = 1
ga06     = (k06 > 0 ? ga06 + ain : ga06)  ; Add zak to global ch.06 if 'pin' = 1
ga07     = (k07 > 0 ? ga07 + ain : ga07)  ; Add zak to global ch.07 if 'pin' = 1
ga08     = (k08 > 0 ? ga08 + ain : ga08)  ; Add zak to global ch.08 if 'pin' = 1
ga09     = (k09 > 0 ? ga09 + ain : ga09)  ; Add zak to global ch.09 if 'pin' = 1
ga10     = (k10 > 0 ? ga10 + ain : ga10)  ; Add zak to global ch.10 if 'pin' = 1
ga11     = (k11 > 0 ? ga11 + ain : ga11)  ; Add zak to global ch.11 if 'pin' = 1
ga12     = (k12 > 0 ? ga12 + ain : ga12)  ; Add zak to global ch.12 if 'pin' = 1
ga13     = (k13 > 0 ? ga13 + ain : ga13)  ; Add zak to global ch.13 if 'pin' = 1
ga14     = (k14 > 0 ? ga14 + ain : ga14)  ; Add zak to global ch.14 if 'pin' = 1
ga15     = (k15 > 0 ? ga15 + ain : ga15)  ; Add zak to global ch.15 if 'pin' = 1
ga16     = (k16 > 0 ? ga16 + ain : ga16)  ; Add zak to global ch.16 if 'pin' = 1
;reinit reset
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
;outs1    aout1*sqrt(ipan1) + aout2*sqrt(1 - ipan2) ; Output and pan ch.1
;outs2    aout1*sqrt(1 - ipan1) + aout2*sqrt(ipan2) ; Output and pan ch.2
out .5*(aout1+aout2)
endin
;-------------------------------------------------------------------------------
