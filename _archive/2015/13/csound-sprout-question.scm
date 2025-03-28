;
;; Csound output
;

; To evaluate code put the cursor after each expression and press
; Command-Return, then check the console window for any output.

; A process that sends csound data

(define (ransco len rhy lb ub amp)
  (let ((dur (* rhy 2)))
    (process repeat len
             for t = (elapsed #t) ; get true score time
             for k = lb then (between lb ub)
             do
             (cs:i 1 t dur k amp)
             (wait rhy))))

; Write a score file

(sprout (ransco 10 .2 60 72 1000) "test.sco")

; Options for csound scorefiles are:
;      play:           if #t call csound after writing file
;      header:         header string for scorefile
;      orchestra:      path to .orc file
;      write:          if #t write the scorefile (default #t)
; These options are all 'sticky' and except for write: are saved in
; your preferences file.

; This next command will call csound after generating the
; file. Before executing it copy the simp.orc code below into your
; home directory and use Audio>Csound>Settings... to assign your
; Csound app.

(sprout (ransco 10 .2 60 72 1000) "test.sco" :play #t
        :orchestra "simp.orc")

; This will generate a score without writing an audio file. execute
; the expression several times and use the Audio>Csound>Export... item
; to export all the score data in various formats

(sprout (ransco 10 .2 60 72 1000) "test.sco" :write #f)

(define (f1)
  (process repeat 3
  do
  (sprout (ransco 10 .2 60 72 1000) "test.sco" :write #f)
  (wait 1)))

(sprout (f1))
; Here is the contents of the orc file, copy everything to a new window
; and save it to a file called "simp.orc"

;------------------------------- simp.orc -------------------------------
sr      =      	44100 
ksmps  	=     	10
nchnls	=	2

  	instr 	       ;simple WAVEGUIDE
kcps = cpsmidinn(p4)   ;convert from midi note number to cycles per second
icps = cpsmidinn(p4)
a1 	pluck 	p5, kcps, icps, 0, 1
  	outs a1, a1
  	endin

	instr 2

kcps = cpsmidinn(p4) ;convert from midi note number to cycles per second
kenv adsr .1, .1, .7, .2
aout oscil kenv*p5, kcps, 1
outs aout, aout

	endin
