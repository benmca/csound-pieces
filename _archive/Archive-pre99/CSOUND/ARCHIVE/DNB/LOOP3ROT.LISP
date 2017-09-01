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

(defun bassnare (st len);length 16
  (algorithm nil quick (start st length len)
	(setf inst (item (items 4 3 3 3 4 3 3 3 5 5 6 6 5 6 6 7 in rotation	
				change (changes start '(0 1 2 3 4 5) step 2))))

	(setf rhythm (item (rhythms s tempo (tempo 130))))
	(setf dur rhythm)

(if (= inst 3)
	(setf dur .27))

(if (= inst 4)
	(setf dur .27))

(if (= inst 5)
	(setf dur .8))

(if (= inst 6)
	(setf dur .8))

(if (= inst 7)
	(setf dur .8))

	(setf amp (item (items 5 0 0 0 5 0  4 0 6 3 4 0 0 in rotation	
				change (changes start '(0 1 2 3 4 5) step 3))))

))


;
;
(defun hat (st len)
  (algorithm nil quick (start st length len)
	(setf inst 1)
	(setf rhythm (item (rhythms s tempo (tempo 130))))
	(setf dur .212)
	(setf amp (between .5 1.5))
))
;
;




;
;(defun mrn (&key (revtime 10.))
;  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
;	     (setf mystart 0)
;	     (setf dur (+ revtime *totaldur* 1))
;	     ))
;
(defun ms (&key (start-time 1.)(my-scorefile "c:/Ben/loop3rot.sco"))
  (let* ((myheader (header ""
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
		(bassnare 1 150)
		(hat 1 150)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
