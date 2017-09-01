(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan)
  (:parameters instr inst mytime dur amp pitch pan))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

;(defun test1 (st len tem pn)
;  (algorithm nil quick (start st length len)
;	(setf pan pn)
;    (setf inst (item (items 1 2 in random)))
;    (setf rhythm (item (items (rhythms q q e e q tempo(tempo tem)) (rhythms q q q q tempo(tempo tem))(rhythms e e e e q e e tempo(tempo tem))
;		(rhythms h q e e tempo(tempo tem)) in random)))
;    (setf dur (* (between 1 8) rhythm))
;    (setf pitch (between 1.3 1.6))
;    (setf amp (between 30000 32768))
;    (setf *totaldur* (max (+ time dur) *totaldur*))
;))

(defun metalfigure (st len tem pn)
  (algorithm nil quick (start st length len)
		(setf pan pn)
		(setf inst (item (items 2 (items 1 for 6) 2 (items 1 for 4) 1 1 
								2 (items 1 for 7) 2 (items 1 for 3) 1 1
								2 (items 1 for 8) 2 (items 1 for 2) 1 1 4
							)))
	;rest 2 quarters after looping -- having inst = 4 is a kludgy way to do this
	(if (= inst 4) 
		(progn
			(setf inst 1)
			(setf pan pn)
			(setf rhythm (item (items 
							(rhythms h tempo(tempo tem))
								)))
			(setf dur (* 2 rhythm))
			(setf pitch 1)
			(setf amp (item (items 0)))
		)
		(progn
			(setf rhythm (item (items 
				(rhythms e tempo(tempo tem))
					)))
			(setf dur (* 2 rhythm))
			(if (= inst 1)
				(setf pitch (between .9 1.1))
				(setf pitch 1)
				)
			(setf amp (* (between .9 1.1)(item (items (items 1 for 12) 0 0))))
		)
	)
;
; bigger random offset for snare (inst 2) than bass drum
;(maybe)
;
	(if (= inst 2)
		(setf mytime (+ time (between .01 .1)))
		(setf mytime (+ time (between .01 .1)))	
	)
	(setf *totaldur* (max (+ time dur) *totaldur*))
))

(defun mrn (&key (revtime 3.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\MetalSketch\\Metal2.sco"))
  (let* ((myheader (header "f 1 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
		(metalfigure 1 90 140 1)
		(metalfigure 1 90 140 20)
		(metalfigure 1 90 140 40)
		(metalfigure 1 90 140 70)
		(metalfigure 1 90 140 90)
		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
