(in-package :stella)
;
; 
;    4     5    flags:    6                7                                             8         9             10
;   amp   pitch       fadefactor  phrase:0=beg/end, 1=mid, 2=allatck, 3=1note(fade)    glisswait  2ndpitch(glis) randstart
;
(defobject gnaw (csound-note)
  ((inst :initform "i") instr dur amp pitch fade phrase gliswait endpitch)
  (:parameters inst instr time dur amp pitch fade phrase gliswait endpitch))
;
(defparameter glis 0)
(defun gnawa (start-time)
  (algorithm nil gnaw (start start-time length 20)
	     (setf instr 2)
	     ;(setf rhythm (item (items (rhythms s. e. s in random tempo (tempo 0 60 5 80 6 75 9 83 20 90) for 15)(rhythms q q. for 5))))

	     (setf rhythm 1)
	     (setf amp (item (items 1 1 1 1 1.5 in heap)))
	     ;(setf pitch (item (pitches a2 c d)))
	     (setf pitch (item (items (pitches a4 c4 in random for 5)(pitches d4 ds e f fs g  for 15))))
	     (setf phrase (item (items (items 0 for 5)(items 1 for 10)(items 3 for 5))))
	     ;(setf phrase 3)
	     (setf dur rhythm)
;pitch stuff
	     (if (= pitch (item (pitches c4)))
		 (progn 
		   (setf glis 1)
		   (setf endpitch (item (pitches a2))))
	       (progn
		 (setf glis 0)
		 (setf endpitch pitch)))
;time stuff
	     (if (= glis 1)
		 (setf gliswait (between .01 (* dur .1)))
	       (setf gliswait 0))
	     (if (= phrase 1)
		(setf randstart (between .75 1))
	       (setf randstart 0))
	     (if (= phrase 3)
		 (setf fade (* dur .7))
	       (setf fade 0))
	     (if (< dur .1 )
		 (setf phrase 1)
		  )
))
;

;don't forget: p10 can't be 0!!!

;

;
(defun ms (&key (start-time 1.)(my-scorefile "final2.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"
			   "f 2 0 32768 1 \"miro22.aiff\" 0 0 0"
			   "f 3 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
	   (gnawa 1)
)
    (write-cs "all" :filename my-scorefile)))