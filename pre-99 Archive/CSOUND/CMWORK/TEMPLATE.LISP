(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan)
  (:parameters instr inst mytime dur amp pitch pan))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun test1 (st len tem pn)
  (algorithm nil quick (start st length len)
	(setf pan pn)
    (setf inst 1)
    (setf rhythm 
		(item 
			(items 
				(rhythms q q e e q tempo(tempo tem)) 
				(rhythms q q q q tempo(tempo tem))
				(rhythms e e e e q e e tempo(tempo tem))
				(rhythms h q e e tempo(tempo tem)) 
			in random)
		)
	)
    (setf dur (* (between 1 8) rhythm))
    (setf pitch (between 1.3 1.6))
    (setf amp (between 30000 32768))
    (setf *totaldur* (max (+ time dur) *totaldur*))
))


(defun mrn (&key (revtime 3.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\MetalSketch\\Metal1.sco"))
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
