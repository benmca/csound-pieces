(in-package :stella) 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan pitch) 
  (:parameters instr time dur idx pan pitch))
(defobject quick2 (csound-note) 
  ((instr :initform "i2") inst dur idx pan pitch) 
  (:parameters instr time dur idx pan pitch))
;
;
;
(defun loop1 (st len pn tem)
  (algorithm nil quick (start st length len)
    (setf pitch 2)
    (setf idx (item (items 0 .6 1.2 1.8 2.4 3 3.6 4.2 4.8 5.4 6.0 6.6 7.2 7.8 8.4 9 in heap))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
))
;
;
;
(defun loop2 (st len pn tem)
  (algorithm nil quick2 (start st length len) 
    (setf pitch 2)
    (setf idx (item (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in heap))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
))

(defun loop3 (st len pn tem)
  (algorithm nil quick (start st length len)
    (setf pitch 2)
    (setf idx (item (items 0 .6 1.2 1.8 2.4 3 3.6 4.2 4.8 5.4 6.0 6.6 7.2 7.8 8.4 9 in rotation	
				change (changes start '(0 1) step 5))))
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
))
; 
(defun loop4 (st len pn tem)
  (algorithm nil quick2 (start st length len) 
    (setf pitch 2)
    (setf idx (item (items (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in rotation	
				change (changes start '(0 1) step 2) for 20) (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in heap for 20) ) ))
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
))
; 

; 
; 
(defun ms (&key (start-time 1.)(my-scorefile "sepbeat1.sco")) 
  (let* ((myheader (header "" 
			   ))) 
    (fheader my-scorefile myheader) 
    (merge all () 
      (loop4 1 60 .1 72)
;      (loop1 31 72 .8 194)
;      (loop1 1 144 .5 194)

            ) 
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
