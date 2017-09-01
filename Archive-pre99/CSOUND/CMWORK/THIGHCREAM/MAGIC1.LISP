(in-package :stella)
(defparameter *totaldur* 0)
(defparameter gurglelength 0)
;
(defobject quick (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan dist pct)
  (:parameters instr inst mytime dur amp pitch pan dist pct))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun magic (st len tem pn)
  (algorithm nil quick (start st length len)
    (setf inst 1)
	(setf mytime time)
	
    (setf rhythm 
		(item 
			(items 
				(rhythms 32 for (- len 4) tempo(tempo tem)) 
				(rhythms 32 for 4 tempo(tempo tem))
			)
		)
	)
	(if (< count len)
	    (setf dur rhythm)
		(setf dur 2)
	)

    (setf pitch 
		(item 
			(items 
				(pitches g3  a in random for (- len 4)) 
				(pitches e4 b5 a6 e7)
			)
		)
	)

    (setf amp 1)
	(setf pan pn)
    (setf dist (item 
                (items 
                    (items  1 for (- len 4)) 
                    (items  1 for 4) 
                )
            )
    )
    (setf pct (item 
                (items 
                    (items .001 for (- len 4)) 
                    (items  .01 for 4) 
                )
            )
    )

    (setf *totaldur* (max (+ mytime dur) *totaldur*))
))


;
;   This function will sprout the bassline function
;   4 times (due to loop), 3 seconds apart
;
(defun spawner (st len)
    (mute nil (start st length len rhythm .1)
        (loop for d from 1 to 4 do
            (with-vars-snapshotted (d)
                (format t "~%Sprouting algorithm at ~S." time)
    
                (sprout
                    (magic (* 3 d) 32 120 45)
                )
            )
        )
    )
)        

;
;   This function will also sprout the bassline function
;   4 times (due to loop), 3 seconds apart
;

(defun spawner2 (st len)
    (mute nil (start st length len)
        (setf rhythm 3)
        (loop for d from 1 to 4 do
                (sprout
                    (magic time 25 120 45)
                )
         )
    )
)        

(defun mrn (&key (revtime 5.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 5))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\thighcream\\magic1.sco"))
  (let* ((myheader (header "f 1 0 16384 9 .5 1 0"
						  "f 2 0 16384 10 1"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
		;(magic 0 25 120 45)
        (spawner2 0 4)
		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
