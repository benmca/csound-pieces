(in-package :stella) 
(defparameter *totaldur* 0) 
; 
(defobject filt1 (csound-note) 
  ((instr :initform "i1") inst dur amp pitch pan dist pct indx) 
  (:parameters instr time dur amp pitch pan dist pct indx))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))


(defun filt (st len pn)
  (algorithm nil filt1 (start st length len)

    (setf pitch (item (pitches a6 b c d e f g a7 b c d e f g in random)))
;    (setf pitch (between 5000 10000))
         (setf amp (between .1 .5 ))
          (setf rhythm (interpl count 0 5.0 len 0.25))
          (setf dur (between 1 4))
          (setf dist (between 1 30))
          (setf pan (between 45 pn))
          (setf pct .1)
          (setf indx (between 1 3))
          (setf *totaldur* (max (+ time dur) *totaldur*))
         
))
;
;
;
(defun mrn (&key (revtime 10.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
 ;
;
;
(defun ms (&key (start-time 1.)(my-scorefile "shine1_1.sco")) 
  (let* ((myheader (header "" 
			   ))) 
    (fheader my-scorefile myheader) 
    (merge all () 
     (filt 1 30 90)
     (filt 1 30 0)
     (filt 10 20 46)
     (mrn)
  ) 
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
