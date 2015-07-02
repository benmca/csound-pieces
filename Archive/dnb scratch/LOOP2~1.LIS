(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((instr :initform "i") inst dur amp)
  (:parameters instr inst time dur amp))
;
;(defobject revnote (csound-note)
;  ((name :initform "i99") mystart dur revtime)
;  (:parameters name mystart dur revtime))
;

(defun bassnare1 (st len);length 14
  (algorithm nil quick (start st length len)
	(setf inst 1)
	(setf rhythm (item (rhythms s s s s s s s s s s s s e. s tempo (tempo 100))))
	(setf dur rhythm)
	(setf amp (item (items 9 5 5 5 0 5 0 5 5 5 5 5 0 5)))
))

(defun bassnare2 (st len);length 14
  (algorithm nil quick (start st length len)
	(setf inst 2)
	(setf rhythm (item (rhythms s s s s s s s s s s s s e. s tempo (tempo 100))))
	(setf dur rhythm)
	(setf amp (item (items 9 5 5 5 0 5 0 5 5 5 5 5 0 5)))
))

(defun bassnare3 (st len);length 14
  (algorithm nil quick (start st length len)
	(setf inst 3)
	(setf rhythm (item (rhythms s s s s s s s s s s s s e. s tempo (tempo 100))))
	(setf dur rhythm)
	(setf amp (item (items 9 5 5 5 0 5 0 5 5 5 5 5 0 5)))
))


;
;
(defun hat (st len)
  (algorithm nil quick (start st length len)
	(setf inst (item (items 1 1 1 2 1)))
	(setf rhythm (item (rhythms q q e e q tempo (tempo 100))))
	(setf dur rhythm)
	(setf amp (item (items 5 5 8 6 9)))
))
;
;(defun mrn (&key (revtime 10.))
;  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
;	     (setf mystart 0)
;	     (setf dur (+ revtime *totaldur* 1))
;	     ))
;
(defun ms (&key (start-time 1.)(my-scorefile "c:/Ben/loop2.sco"))
  (let* ((myheader (header "f 1 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
		(bassnare1 1 56)
		(bassnare2 1 56)
		(bassnare3 1 56)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
