(in-package :stella)

(defobject main (csound-note)
  ((instr :initform "i1") time dur amp pitch revpct angle)
  (:parameters instr time dur amp pitch revpct angle))


(defparameter *totaldur* 0)

(defun narrow (st len)
  (algorithm nil main (start st length len)
	     (setf rhythm (item (rhythms q q e. e tempo (tempo 30))))
	     (setf dur (* rhythm 1.3))
	     (setf amp 1000)
	     (setf pitch (between 440 3000))
	     (setf angle (between 0 90))
	     (setf revpct (between 1 100))
	     (setf *totaldur* (max (+ time dur) *totaldur*))))

(defun mrn (&key (revtime 10.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "sw_1.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"
			   "f 2 0 262145 1 \"medium.aif\" 0 0 0"
			   "f 3 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
	   (narrow 1 10)
	   (mrn)
)
    (open-cmd my-scorefile)
	(mix-cmd "all")))