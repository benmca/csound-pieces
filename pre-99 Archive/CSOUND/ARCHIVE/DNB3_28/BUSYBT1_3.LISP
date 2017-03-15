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
    (if (= pn 100)
      (setf pan (between 50 70))
    (setf pan pn))
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
(defun ms (&key (start-time 1.)(my-scorefile "busybt1_3.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
 ; 14 units in 2 bars
      (loop1 1    483 45 92 1 5)
      (loop1 1.652 483 10 92 1 4)
      (loop1 2.304 483 80 92 1 3)
      (loop1 20.869 224 100 368 .7 4)
      (loop1 20.869 224 100 368 .7 8)
      (loop1 62.608 168 100 276 .6 2)
      (loop1 62.7 168 30 276 .65 4)
      (mrn)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
