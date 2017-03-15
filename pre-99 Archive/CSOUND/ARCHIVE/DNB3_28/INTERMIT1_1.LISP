(in-package :stella) 
(defparameter *totaldur* 0)
 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan  amp climb) 
  (:parameters instr time dur idx pan  amp climb))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
;
(defun loop1 (st len)
  (algorithm nil quick (start st length len)
    (setf amp (item (items 1 .001)))
    (setf rhythm (interpl count 0 1.0 len 15.0))
;    (setf dur (* (between .7 1.3) rhythm))
    (setf dur rhythm)
    (setf idx (between 1 12))
    (setf pan (between 0 90))
    (setf climb (between .01 dur))
    (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
;

; 
;


(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
 
; 
(defun ms (&key (start-time 1.)(my-scorefile "intermit1_1.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
     (loop1 1 40)
     (mrn)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
