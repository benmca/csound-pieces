(in-package :stella) 
(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idur 0) 
(defparameter idxdur 0) 
; 

(defobject quick (csound-note) 
  ((instr :initform "i1") inst dur idx pan dist pct pitch amp) 
  (:parameters instr time dur idx pan dist pct pitch amp))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
;
(defun intro (st len pn tem am rot)
  (algorithm nil quick (start st length len)
	(setf idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)(2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)));14 items, for 'Jam1_1.aif
	(setf i (item (items 0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4)))	;index into paired stream
	(setf idur (nth i idxdur))	;pick i'th pair out of idxdur
	(setf idx (nth 0 idur))		;set idx to 1st element
	(setf du (nth 1 idur))		;set dur to 2nd element

;	(setf dur (rhythm du tem))
;	(if (= i 13)
;	(setf dur (* dur .9))
;	(setf dur (* dur 1.02))
;	)

	(setf dur (* (rhythm du tem) (between .8 1.2)))
	(setf rhythm (item (rhythms s tempo (tempo tem))))

      (setf pitch (* tem .01136))
    (if (= pn 100)
      (setf pan (between 10 70))
    (setf pan pn))
    (setf dist 10)
    (setf pct .01)
    (setf amp am)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
;
(defun jam (st len pn tem am rot)
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
;
; last item in loop must always be set so there is no eof dead space in the end result.
;
(setf rhythm (item
	      (items
	       (items (rhythms q e e e e s s s e. e. in heap tempo (tempo tem)) for 3)
	       (items (rhythms q q s e s s e s q e. e q e s in rotation
		change (changes start '(0 1) step rot) tempo (tempo tem)) for 3)
	       (items (rhythms (12 weight 5) (6 weight 3) (32 weight 2) in random tempo (tempo tem)) for 10)
	       )))




      (setf pitch (* tem .01136))
    (if (= pn 100)
      (setf pan (between 50 70))
    (setf pan pn))
    (setf dist 10)
    (setf pct .01)
    (setf amp am)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))

;
;
(defun fadeoutin (st len pn tem am rot)
  (algorithm nil quick (start st length len)
	(setf idxdur '((0.018 q) (.697 q) (1.376 s) (1.538 e)(1.869 s)(2.032 s)(2.2 e)(2.543 s)(2.705 q)(3.373 e.)(3.895 e)(4.232 q)(4.894 e)(5.236 s)));14 items, for 'Jam1_1.aif
	(setf i (item 
                 (items
                 (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 in heap for (items 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1    0 0 0    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
                 (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 in rotation
		change (changes start '(0 1) step rot) for (items 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1    0 0 0    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 ))
                 (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 in heap for (items 0 0 0 0 0 0 0 0 0 0 1 3 5 10 20  100 100 100  20 10 5 3 1 0 0 0 0 0 0 0 0 0 0))
                                )))	;index into paired stream
	(setf idur (nth i idxdur))	;pick i'th pair out of idxdur
	(setf idx (nth 0 idur))		;set idx to 1st element
	(setf du (nth 1 idur))		;set dur to 2nd element
	(setf dur (rhythm du tem))
	(if (= i 13)
	  (setf dur (* dur .9))
	  (setf dur (* dur (between 1 1.1)))
	)
	(if (< dur .02)
	    (setf dur .021))
        (setf rhythm (item
	      (items
                (rhythms q e e e e s s s e. e. in heap tempo (tempo tem) for (items 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1    0 0 0    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
	        (rhythms q q s e s s e s q e. e q e s in rotation
		change (changes start '(0 1) step rot) tempo (tempo tem) for (items 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1    0 0 0    1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
	       (rhythms (128 weight 5) (64 weight 3) (32 weight 2) in random tempo (tempo tem) for (items 0 0 0 0 0 0 0 0 0 0 1 3 5 10 20  100 100 100  20 10 5 3 1 0 0 0 0 0 0 0 0 0 0))
	       )))

        (setf pitch (* tem .01136))
        (if (= pn 100)
          (setf pan (between 40 50))
          (setf pan pn))
        (setf dist 10)
        (setf pct .01)
        (setf amp (interpl count 0 am 300 am 468 0.0 558 am len am))
        (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
;
(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
 
; 
(defun ms (&key (start-time 1.)(my-scorefile "mix1_1.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
	   (intro 0 20 100 60 5.0 5)
      (fadeoutin 5 858 10 120 5.0 3)
      (fadeoutin 5 858 100 120 5.0 7)
      (fadeoutin 5 858 80 120 5.0 5)
      (fadeoutin 5 120 45 60 5.0 5)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
;LOOP ARGUMENTS:st len pn tem am rot
