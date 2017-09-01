(in-package :stella)

(defparameter *christmasball.wav_total_length* 25.782)

(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idx 0) 
(defparameter idxdur 0) 

;
(defobject soundin_indx (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan dist pct indx origdur)
  (:parameters instr inst mytime dur amp pitch pan dist pct indx origdur))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun origmelody(st tem pn len)
  (algorithm nil soundin_indx (start st length len)
        (setf inst 1)
	    (setf mytime time)

    
(setf idxdur '((1.041000 0.241000 e)(1.282000 1.237000 e)(2.519000 0.421000 e)))
    ; 3 items
    (setf i 
        (item 
            (items 0 1 2)
    ))	;index into paired stream
    (setf idx (nth i idxdur))	;pick i'th pair out of idxdur
    (setf indx (nth 0 idx))		;set idx to 1st element
    (setf rhythm (rhythm (nth 1 idx) tem))  
    ;
    ; improvement in the loop index method - 
    ;   makes sure there is a distinction between duration in orig sample and 
    ;   replayed duration.
    ;   You will hear articulations from the following note if the duration of a given fragment is too long
    ;   It follows that for fast tempi, orig dur is ok for replayed duration if using soundin, diskin,
    ;   but for slow tempi you must take care to smooth the end of each fragment.
    ;
    (if (< i 43)
        (setf origdur ( - 
                     (nth 0 (nth (+ i 1) idxdur))
                     indx
                  ))
        ;if last element, subtract indx point from total length of file 
        (setf origdur (- *christmasball.wav_total_length*  indx))		;set dur to 2nd element
    )
    (setf rhythm 
		(item 
            (items 
               (rhythms e e e e e e e e e e q e e q q e e e e e e e e e e e e e e e e e e e e e e e e e e e e h in random tempo(tempo tem))
			)
		)
	)
    (setf dur rhythm)

    (setf pitch 1)
    (setf amp .8)
	(setf pan pn)
    (setf dist 2)
    (setf pct .075)
    (setf *totaldur* (max (+ mytime dur) *totaldur*))
))
(defun mrn (&key (revtime 5.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 5))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\2003\\StarsAreComingOut\\metaltest.sco"))
  (let* ((myheader (header "f1 0 16384 9 .5 1 0"   ;half sine
						  "f2 0 16384 10 1"        ;sine
						  "f3 0 2097152 1 \"\\metal3.wav\" 0 0 0"        ;sine
                          "f4 0 512 5 .001 100 1.0 312 1.0 100 .001"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
        (origmelody 0 8 45 10)
;        (origmelody 0 81 45 88)
 ;       (origmelody 0 79 80 88)
		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
