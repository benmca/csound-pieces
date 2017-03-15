; **********************************
; update path for specific computer!
; **********************************
;	percint2.lisp
;	1) modify tempo to standard tempo value, for overall interpl tempo movement
;	2) at crest, probability is higher for a) backwards sound b) cymbal sound 
;
(in-package :stella)
(defparameter *totaldur* 0)
; variables for list management
(defparameter i 0)
(defparameter du 0)
(defparameter idur 0)
(defparameter idxdur 0)
(defparameter srhythm 0)	;temp value for rhythm (rhythm @ 60)
(defparameter intemp 0)		;tempo via interpl

;idur = p3 iamp = p4 ipitch = p5 indx = p6 iendx = p7	ipan = p8 idist = p9	ipct = p10 idir = p11		; flag: 0=forward, 1=backward

(defobject quick (csound-note)
	((instr :initform "i1") inst mytime dur amp pitch idx endx pan dist pct dir)
	(:parameters instr time dur amp pitch idx endx pan dist pct dir))
(defobject revnote (csound-note)
	((name :initform "i99") mystart dur revtime)
	(:parameters name mystart dur revtime))
;
(defun loop1 (st len pn tem am switch star end)
	(algorithm nil quick (start st length len)
; if center of stream, chance of bw or metallic sound increases else in rotation?
		(setf idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)(2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)));14 items, for 'Jam1_1.aif
		(setf i (item (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13)));in rotation
;					change (changes start '(0 1) step rot) )))	;index into paired stream
		(setf idur (nth i idxdur))	;pick i'th pair out of idxdur
		(setf idx (nth 0 idur))		;set idx to 1st element
		(setf du (nth 1 idur))		;set dur to 2nd element
; ****
; * tempo mod with switch variable
; ****
;
; 1=tempo modification with slow 'spike' in middle.
; 2=tempo change from star to end
; 3=reverse of 1, fast spike in middle
;
;

;	(if (= switch 1)
;		(progn
;		(setf intemp (interpl count 0 (* tem 400.0) (* len .475) (* tem 200.0) (* len .5) (* tem 40.0) (* len .525) (* tem 200.0) len (* tem 400.0)))
;		(setf srhythm (item 
;			(rhythms q q. q.. in random tempo (tempo 60))))
;		(setf rhythm (* srhythm (/ 60.0 intemp)))
;		)
;	)
	(if (= switch 2)
		(progn
		(setf rhythm (item
			(rhythms q q. q.. in random tempo (tempo from star to end in len))))
		)
	)
;	(if (= switch 3)
;		(progn
;		(setf intemp (interpl count 0 (* tem 40.0) (* len .025) (* tem 200.0) (* len .5) (* tem 400.0) (* len .975) (* tem 200.0) len (* tem 40.0)))
;		(setf srhythm (item 
;			(rhythms q q. q.. in random tempo (tempo 60))))
;		(setf rhythm (* srhythm (/ 60.0 intemp)))
;		)
;	)

		(setf dur rhythm)
		(setf pitch 1)
; define endx

		(setf endx (+ idx (rhythm du 140)))
;(pprint "indx:")
;(pprint idx)
;(pprint "endx:")
;(pprint endx)
; backwards or forwards? bw=1
		(if (= count (* len .5))
			(progn
				(setf dir (item (items 1 2 in random)))
			)
			(setf dir (item (items (1 weight 1)(2 weight 10) in random)))
		)
		(setf pan (drunk pn 5))
		(setf dist 1)
		(setf pct .01)
		(setf amp am)
		(setf mytime (+ time rhythm))
		(setf *totaldur* (max (+ mytime dur) *totaldur*))
))

(defun mrn (&key (revtime 20.))
	(algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
		(setf mystart 0)
		(setf dur (+ revtime *totaldur* 1))
))

;
(defun ms (&key (start-time 1.)(my-scorefile "c:/csound/perci2.sco"))
	(let* ((myheader (header "f1 0 262144 1 \"Jam1_1.aif\" 0  0 0"
					"f2 0 16384 9 .5 1 0"
)))
(fheader my-scorefile myheader)
(merge all ()
; old loop1 arguements: st len pn tem am rot
; loop1 args: st len pn tempmod am switch  star end
; 5 < pan > 85 for drunk walk to work
;
;	(loop1 1 40 45 4 10000 1  1 1)
	(loop1 1 40 55 1 10000 2 400 40)
;	(loop1 25 40 65 1 10000 3  1 1)

)
(open-cmd my-scorefile)
(mix-cmd "all")))