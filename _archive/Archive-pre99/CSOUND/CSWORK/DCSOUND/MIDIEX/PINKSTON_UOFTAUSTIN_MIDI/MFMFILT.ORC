;P3   = DURATION     
;P4 = AMPLITUDE      
;P5   = PITCH IN PCH    
;P6   = STARTING MOD TO CAR RATIO       
;P7 = ENDING MOD TO CAR RATIO     
;P8   = FUNCTION NUMBER FOR RATIO CHANGE                    
;P9   = STARTING INDEX LEVEL         
;P10 = ENDING INDEX LEVEL                            
;P11 = FUNCTION NUMBER FOR RATIO CHANGE                     
;P12 = STARTING CENTER FREQUENCY     
;P13 = ENDING CENTER FREQ     
;P14 = FUNCTION NUMBER FOR CF CHANGE
;P15 = STARTING BAND WIDTH           
;P16 = ENDING BAND WIDTH
;P17 = FUNCTION NUMBER FOR BW CHANGE                     

sr             =         44100
kr             =         4410
ksmps          =         10
nchnls         =         2



massign        1,1

instr          1

inote          cpsmidib
iveloc         ampmidi   1
kgate          linenr    iveloc,0,1.5,.01

ipitch1        =         inote       
ipitch2        =         ipitch1 * 1.001     
ipitch3        =         ipitch1 * 0.998     
imodbase       =         (19 <= 5 ? 19 : 5)      
imodmax        =         (19 <= 5 ? 5 : 19)       
indxbase       =         (1 <= 2 ? 1 : 2)        
indxmax        =         (1 <= 2 ? 2 : 1)        
kmodchg        oscil1i   0.00,(imodmax - imodbase),p3,4       
kmod           =         imodbase + kmodchg      
kndxchg        oscil1i   0.00,(indxmax - indxbase),5,5       
kndx           =         indxbase + kndxchg      
afm1           foscili   (7000*.45),ipitch1,1,kmod,kndx,1        
afm2           foscili   (7000*.35),ipitch2,1,kmod,kndx,1        
afm3           foscili   (7000*.32),ipitch3,1,kmod,kndx,1        
afmttl         =         afm1+afm2+afm3      
aosc1          oscil     (7000 *.45),ipitch1,1       
aosc2          oscil     (7000 *.35),ipitch2,1       
aosc3          oscil     (7000 *.32),ipitch3,1       
aoscttl        =         aosc1+aosc2+aosc3       
afm            =         afmttl - aoscttl;                   
icfbase        =         (3000 <= 12000 ? 3000 : 12000)      
icfmax         =         (3000 <= 12000 ? 12000 : 3000)      
kcfchg         oscil1i   0.00,(icfmax - icfbase),5,6     
kcf            =         icfbase + kcfchg        
ibwbase        =         (100 <= 400 ? 100 : 400)        
ibwmax         =         (100 <= 400 ? 400 : 100)        
kbwchg         oscil1i   0.00,(ibwmax - ibwbase),5,6     
kbw            =         ibwbase + kbwchg        
aflt1          reson     afm,kcf,kbw,1       
aflt2          reson     afm,(kcf*.9),(kbw*1.11),1       
abal           balance   (aflt1+aflt2),afm       
asig           envlpx    abal,.2,5,(5*.39),5,1,.01                       
               outs      asig*kgate,asig*kgate                     
ga1            =         asig*kgate
endin
