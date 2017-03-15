(in-package :stella)

(defparameter *christmasball.wav_total_length* 24.96)

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

    
    (setf idxdur '((.808 e) (1.246 e) (1.731 e)(2.170 e) (2.586 e) (3.024 e) (3.509 e) (3.902 e) (4.410 e) (4.918 e) 
            (5.403 q) (6.234 e) (6.765 e) (7.204 q) (8.081 q) (8.936 e) (9.444 e) (9.859 e) (10.344 e) (10.76 e) (11.198 e) 
            (11.637 e) (12.122 e) (12.561 e) (13.161 e) (13.6 e) (14.039 e) (14.547 e) (15.078 e) (15.563 e) (16.071 e) 
            (16.625 e) (17.156 e) (17.641 e) (18.149 e) (18.657 e) (19.095 e) (19.65 e) (20.134 e) (20.666 e) (21.150 e) 
            (21.682 e) (22.190 e) (22.651 h))); 44 items, for 'christmas_ball.wav

    (setf i 
        (item 
            (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 
            38 39 40 41 42 43 )
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

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\2003\\StarsAreComingOut\\christmas_material3_1.sco"))
  (let* ((myheader (header "f1 0 16384 9 .5 1 0"   ;half sine
						  "f2 0 16384 10 1"        ;sine
						  "f3 0 2097152 1 \"\\sources\\christmasball.wav\" 0 0 0"        ;sine
                          "f4 0 512 5 .001 100 1.0 312 1.0 100 .001"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
        (origmelody 0 80 45 88)
;        (origmelody 0 81 45 88)
 ;       (origmelody 0 79 80 88)
		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
