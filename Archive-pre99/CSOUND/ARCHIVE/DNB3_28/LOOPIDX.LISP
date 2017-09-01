(in-package :stella) 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx) 
  (:parameters instr time dur idx))
(defobject quick2 (csound-note) 
  ((instr :initform "i2") inst dur idx) 
  (:parameters instr time dur idx))
;
;
;
(defun loop1 (st len)
  (algorithm nil quick (start st length len) 
    (setf idx (item (items 0 .6 1.2 1.8 2.4 3 3.6 4.2 4.8 5.4 6.0 6.6 7.2 7.8 8.4 9 in heap))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo 72))))
    (setf dur (* rhythm 1.02))
))
;
;
;
(defun loop2 (st len)
  (algorithm nil quick2 (start st length len) 
    (setf idx (item (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 ))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo 72))))
    (setf dur (* rhythm 1.02))
))
; 
; 
; 
(defun ms (&key (start-time 1.)(my-scorefile "loopidx.sco")) 
  (let* ((myheader (header "" 
			   ))) 
    (fheader my-scorefile myheader) 
    (merge all () 
      (loop2 1 16)
      (loop1 9 32)
      (loop2 9 16)
            ) 
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
