(in-package :stella) 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan pitch amp)
  (:parameters instr time dur idx pan pitch amp))
(defobject quick2 (csound-note) 
  ((instr :initform "i2") inst dur idx pan pitch amp) 
  (:parameters instr time dur idx pan pitch amp))
(defobject quick3 (csound-note) 
  ((instr :initform "i3") inst dur idx pan pitch amp) 
  (:parameters instr time dur idx pan pitch amp))
;
;
(defun slowheap (st len pn tem pit am)
  (algorithm nil quick (start st length len)
    (setf pitch pit)
    (setf idx (item (items 0 .6 1.2 1.8 2.4 3 3.6 4.2 4.8 5.4 6.0 6.6 7.2 7.8 8.4 9 in heap))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
    (setf amp am)
))
;
;
;
(defun flamheap (st len pn tem am)
  (algorithm nil quick2 (start st length len) 
    (setf pitch 2)
    (setf idx (item (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in heap))); idx = articulations in loop (secs to index) 
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
    (setf amp am)
))
;16 elements
(defun slowrot (st len pn tem am) 
  (algorithm nil quick (start st length len)
    (setf pitch 2)
    (setf idx (item (items 0 .6 1.2 1.8 2.4 3 3.6 4.2 4.8 5.4 6.0 6.6 7.2 7.8 8.4 9 in rotation	
				change (changes start '(0 1) step 5))))
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.02))
    (setf pan pn)
    (setf amp am)
))
; 8 elements
(defun flamix (st len pn tem pit am)
  (algorithm nil quick2 (start st length len) 
    (setf pitch pit)
    (setf idx (item (items (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in rotation	
				change (changes start '(0 1) step 2) for 20) (items 0 .475 .95 1.425 1.9 2.375 2.85 3.325 in heap for 20) ) ))
    (setf rhythm (item (rhythms e tempo (tempo tem))))
    (setf dur (* rhythm 1.01))
    (setf pan pn)
    (setf amp am)
))
; 

; 14 elements
(defun jammin (st len pn tem pit am)
  (algorithm nil quick3 (start st length len)
    (setf idx (item (items 0.018 .697 1.376 1.538 1.869 2.032 2.2 2.543 2.705 3.373 3.895 4.232 4.894 5.236 in palindrome)))
    (setf rhythm (item (rhythms q q s e s s e s q e. e q e s in palindrome tempo (tempo tem))))
    (setf amp am)
    (setf dur (* rhythm 1.02))
    (setf pitch pit)
    (if (< tem 88)
      (setf pitch (* tem .01136))
      )
    (setf pan pn)
))
;

; 
(defun ms (&key (start-time 1.)(my-scorefile "sepbeat1_1.sco")) 
  (let* ((myheader (header "" 
			   ))) 
    (fheader my-scorefile myheader) 
    (merge all () 
      (slowheap 1 582 .5 194 2 1)
      (jammin 15.845 170 .8 97 1 1.4)
      (flamix 27.97 50 .14 24.25 .25 .5) 
      (jammin 60.618 196 .2 194 2 1) 

            ) 
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
