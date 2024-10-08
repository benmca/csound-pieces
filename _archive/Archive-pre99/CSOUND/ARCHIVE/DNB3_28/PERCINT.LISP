;	percint2.lisp
;	1) modify tempo to standard tempo value, for overall interpl tempo movement
;	2) at crest, probability is higher for a) backwards sound b) cymbal sound 
;
(in-package :stella)
(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idur 0)
(defparameter idxdur 0)
(defparameter maintemp 0)

;idur = p3 iamp = p4 ipitch = p5 indx = p6 iendx = p7	ipan = p8 idist = p9	ipct = p10 idir = p11		; flag: 0=forward, 1=backward

(defobject quick (csound-note)
	((instr :initform "i1") inst dur amp pitch idx endx pan dist pct dir)
	(:parameters instr time dur amp pitch idx endx pan dist pct dir))
(defobject revnote (csound-note)
	((name :initform "i99") mystart dur revtime)
	(:parameters name mystart dur revtime))
;
(defun loop1 (st len pn tem am rot)
	(algorithm nil quick (start st length len)
; tempo interpolation statement
;	(setf maintemp (interpl (+ count 1) 0 40.0 20 400.0 40  40.0))
; if center of stream, chance of bw or metallic sound increases else in rotation?

		(setf idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)(2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)));14 items, for 'Jam1_1.aif
		(setf i (item (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 in rotation
					change (changes start '(0 1) step rot) )))	;index into paired stream
		(setf idur (nth i idxdur))	;pick i'th pair out of idxdur
		(setf idx (nth 0 idur))		;set idx to 1st element
		(setf du (nth 1 idur))		;set dur to 2nd element

		(setf rhythm (item
			(items
			(items (rhythms q e e e e s s s e. e. in heap tempo (tempo tem)) for 3)
			(items (rhythms q q s e s s e s q e. e q e s in rotation
				change (changes start '(0 1) step rot) tempo (tempo tem)) for 3)
			(items (rhythms (12 weight 5) (6 weight 3) (32 weight 2) in random tempo (tempo tem)) for 10)
			)
		))
		(setf dur rhythm)
		(setf pitch 1)
; define endx
		(setf endx (+ idx (rhythm du 172)))
; backwards or forwards? bw=1
		(setf dir (item (items (1 weight 1)(2 weight 10) in random)))

		(if (= pn 100)
			(setf pan (between 50 70))
			(setf pan pn))
			(setf dist 1)
			(setf pct .01)
			(setf amp am)
			(setf *totaldur* (max (+ time dur) *totaldur*))
))

(defun mrn (&key (revtime 20.))
(algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
(setf mystart 0)
(setf dur (+ revtime *totaldur* 1))
))

;
(defun ms (&key (start-time 1.)(my-scorefile "c:/Ben/percint.sco"))
	(let* ((myheader (header "f1 0 262144 1 \"Jam1_1.aiff\" 0  0 0"
					"f2 0 16384 9 .5 1 0"
)))
(fheader my-scorefile myheader)
(merge all ()
; loop1 arguements: st len pn tem am rot
	(loop1 1 30 40 120.0 10000 5)
;      (loop1 1 156 10 40 10000 5)
;      (loop1 1 156 80 120 50 5);	(loop1 1 100 30 120 50 5)      (loop1 1 100 50 60 50 5);	(loop1 1 100 45 120 50 5)
;      (loop1 1 100 80 60 50 5);      (loop1 1 48 10 60 120 5)
;      (loop2 1 100 45 120 50 5)
;      (mrn)
)
(open-cmd my-scorefile)
(mix-cmd "all")))