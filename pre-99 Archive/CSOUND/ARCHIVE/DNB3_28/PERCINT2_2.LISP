; **********************************
; update path for specific computer!
; **********************************
;	percint2_2.lisp
;	1) unite loop/index point approach and sndwarp readthrough of individual samples, to
;		form one solid intro fill
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
(defobject quick2 (csound-note)
  ((instr :initform "i2") dur amp pitch pan dist pct istr iendx indx iatck)
  (:parameters instr time dur amp pitch pan dist pct istr iendx indx iatck))
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



(defun minmain (st len)
  (algorithm nil quick2 (start st length len)
    (setf pitch 1)
	(setf rhythm (item (items
                             (rhythms (h weight 10) (h. weight 10) (w weight 10) (w. weight 10) (.5 weight 10) (32 weight 7)(24 weight 7)(64 weight 7)(e weight 7) in random for 40)
                             (rhythms (32 weight 7)(24 weight 6)(64 weight 7)(e weight 2) in random for 20)
                             )))
        (setf dur rhythm)
	(setf amp (between 50 100))
        (if (> rhythm (rhythm 'e))
           (setf istr (item (items 3 4 [4 5] [4 6] [4 8]  [3 9] [3 5] [3 6] in random)))
           (progn
            (setf istr (item (items 3 4 8 9 in random)))
            (setf amp (* amp (between 1.01 2))))
           )
        (if (= istr 3)
          (progn
            (setf indx 0)
            (setf iatck .024)
          (setf iendx .27)))
        (if (= istr 4)
          (progn
            (setf indx .012)
            (setf iatck .062)
          (setf iendx .35)))
        (if (= istr 5)
          (progn
            (setf indx .025)
            (setf iatck .39)
          (setf iendx 13.87)))
        (if (= istr 6)
          (progn
            (setf indx .019)
            (setf iatck .123)
          (setf iendx 6.1)))
        (if (= istr 7)
          (progn
            (setf indx 2.101)
            (setf iatck 2.142)
          (setf iendx 4.01)))
        (if (= istr 8)
          (progn
            (setf indx 0)
            (setf iatck .066)
          (setf iendx .461)))
        (if (= istr 9)
          (progn
            (setf indx .012)
            (setf iatck .033)
          (setf iendx .8)))
	(setf pan (item (items
                          (items 10 20 30  in random for 3)
                          (items 70 80 90 in random for 3)
                          (items 40 50 60 in random for 3)
                          )))
        (setf dist (between 1 3))
        (setf pct .1)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))



(defun mrn (&key (revtime 20.))
	(algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
		(setf mystart 0)
		(setf dur (+ revtime *totaldur* 1))
))

;
(defun ms (&key (start-time 1.)(my-scorefile "c:/csound/percint2_2.sco"))
	(let* ((myheader (header 
			  "f 1 0 262144 1 \"Jam1_1.aif\" 0  0 0"
		 	  "f 2 0 16384  9 .5 1 0"
                    "f 3 0 524288 1 \"UGLYBDM.AIF\" 0 0 0"
                    "f 4 0 524288  1 \"RUINSNR1M.AIF\" 0 0 0"
                    "f 5 0 1048576 1 \"penderhitM.AIF\" 0 0 0"
                    "f 6 0 524288 1 \"penderhit2M.AIF\" 0 0 0"
                    "f 7 0 262144 1 \"THUNHISS3.aif\" 0 0 0"	;MAC:was thunhiss4
                    "f 8 0 524288 1 \"CurtisclhhM.AIF\" 0 0 0"	;MAC:was curtis~2
                    "f 9 0 524288 1 \"cagetomM.AIF\" 0 0 0"
)))
(fheader my-scorefile myheader)
(merge all ()
; old loop1 arguements: st len pn tem am rot
; loop1 args: st len pn tempmod am switch  star end
; 5 < pan > 85 for drunk walk to work
;
;	(loop1 1 40 55 1 10000 2 400 40)
	(minmain 1 10)
)
(open-cmd my-scorefile)
(mix-cmd "all")))