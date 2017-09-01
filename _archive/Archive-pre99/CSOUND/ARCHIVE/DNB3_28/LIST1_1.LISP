(in-package :stella) 
(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idur 0) 
; 
(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan dist pct pitch amp) 
  (:parameters instr time dur idx pan dist pct pitch amp))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
(defun loop1 (st len pn tem am rot)
  (algorithm nil quick (start st length len)
	(setf idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)(2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)));14 items, for 'Jam1_1.aif
	(setf i (item (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 in rotation	
				change (changes start '(0 1) step rot) )))	;index into paired stream
	(setf idur (nth i idxdur))	;pick i'th pair out of idxdur
	(setf idx (nth 0 idur))		;set idx to 1st element
	(setf du (nth 1 idur))		;set dur to 2nd element
	(setf dur (rhythm du tem))
	(if (= i 13)
	(setf dur (* dur .9))
	(setf dur (* dur 1.02))
	)

(setf rhythm (item
	      (items
	       (items (rhythms q e e e e s s s e. e. in heap tempo (tempo tem)) for 3)
	       (items (rhythms q q s e s s e s q e. e q e s in rotation
		change (changes start '(0 1) step rot) tempo (tempo tem)) for 3)
	       (items (rhythms (12 weight 5) (6 weight 3) (32 weight 2) in random tempo (tempo tem)) for 10)
	       )))




;	(if (= pn 10)
;	(setf rhythm (item (rhythms q q s e s s e s q e. e q e s)))

;	(setf rhythm (item (rhythms q e e e e s s s e. e. in heap tempo (tempo tem))))
;)

;	(setf rhythm (item (rhythms q q s e s s e s q e. e q e s in rotation
;				change
;	       (items (rhythms q e e e e s s s e. e. in heap tempo (tempo tem)) for 3)
;	       (items (rhythms q q s e s s e s q e. e q e s in rotation (changes start '(0 1) step rot) tempo (tempo tem))))
	
;	(if (= pn 39)
;	    (setf rhythm (item (rhythms q q s e s s e s q e. 32 32 32 32  e. q e s in random tempo (tempo tem))))
      (setf pitch (* tem .01136))
    (if (= pn 100)
      (setf pan (between 50 70))
    (setf pan pn))
    (setf dist 100)
    (setf pct 10)
    (setf amp am)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
 
; 
(defun ms (&key (start-time 1.)(my-scorefile "/home03/mcallister/dnb3_28/list1_1.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
      (loop1 1 156 10 120 50 5)
      (loop1 1 156 80 120 50 5);	(loop1 1 100 30 120 50 5)
;      (loop1 1 100 50 60 50 5);	(loop1 1 100 45 120 50 5)
;      (loop1 1 100 80 60 50 5);      (loop1 1 48 10 60 120 5)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
