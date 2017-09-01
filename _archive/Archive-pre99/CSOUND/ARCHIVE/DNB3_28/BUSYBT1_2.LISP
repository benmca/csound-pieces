(in-package :stella) 
(defparameter *totaldur* 0)
 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan dist pct pitch amp) 
  (:parameters instr time dur idx pan dist pct pitch amp))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
;
(defun loop1 (st len pn tem am rot)
  (algorithm nil quick (start st length len)
    (setf idx (item (items 0.018 .697 1.376 1.538 1.869 2.032 2.2 2.543 2.705 3.373 3.895 4.232 4.894 5.236 in rotation	
				change (changes start '(0 1) step rot))))
    (setf rhythm (item (rhythms q q s e s s e s q e. e q e s in rotation	
				change (changes start '(0 1) step rot) tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (if (< tem 88)
      (setf pitch (* tem .01136))
      (setf pitch 1))
    (setf pan pn)
    (setf dist 100)
    (setf pct 10)
    (setf amp am)
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
(defun ms (&key (start-time 1.)(my-scorefile "busybt1_2.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
      (loop1 1    25 45 92 1 5)
      (loop1 1.652 25 10 92 1 4)
      (loop1 2.304 25 80 92 1 3)

      (mrn)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
