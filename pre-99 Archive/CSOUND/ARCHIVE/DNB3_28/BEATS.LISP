(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((inistr :initform "i1") dur amp pitch pan dist pct istr iendx indx iatck)
  (:parameters inistr time dur amp pitch pan dist pct istr iendx indx iatck))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun samps (st num)
  (algorithm nil quick (start st)
	     (setf pitch 1)
	     (if (= num 1)
		(progn
		 (setf rhythm (item (rhythms s s s):kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9)
		 ))
	     (if (= num 2)
		(progn
		 (setf rhythm (item (rhythms s s s):kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr (item (items 9 0 9)))
		 ))
	     (if (= num 3)
		(progn
		 (setf rhythm (item (rhythms s s s s) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9)
		 ))
	     (if (= num 4)
		(progn
		 (setf rhythm (item (rhythms s e) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9)
		 ))
	     (if (= num 5)
		(progn
		 (setf rhythm (item (rhythms 48 for 16) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9)
		 ))
	     (if (= num 6)
		(progn
		 (setf rhythm (item (rhythms 48 for 12) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9)
		 
		 ))
	     (if (= num 7)
		(progn
		 (setf rhythm (item (rhythms 48 for 6) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 9 )
		 
		 ))
	     (if (= num 8)
		(progn
		 (setf rhythm (item (rhythms s (rhythms 48 for 12)) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr (item (items 10 (items 9 for 12))))
		 ))
	     (if (= num 9)
		(progn
		 (setf rhythm (item (rhythms e) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 1)
		 
		 ))
	     (if (= num 10)
		(progn
		 (setf rhythm (item (rhythms e e) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr (item (items 1 10)))
		 
		 ))
	     (if (= num 11)
		(progn
		 (setf rhythm (item (rhythms q q) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr (item (items 1 9)))
		 ))
	     (if (= num 12)
		(progn
		 (setf rhythm (item (rhythms h) :kill t))
		 (setf dur rhythm)
		 (setf amp .8)
		 (setf istr 1)
		 ))
	     (if (= num 13)
		(progn
		 (setf rhythm (item (rhythms e e) :kill t))
		 (setf dur rhythm)
		 (setf amp (item (items .8 1)))
		 (setf istr (item (items 1 9)))
		 
		 ))
	     (if (= num 14)
		(progn
		 (setf rhythm (item (rhythms s e s) :kill t))
		 (setf dur rhythm)
		 (setf amp (item (items .8 1 .6)))
		 (setf istr (item (items 1 1 1)))
		 
		 ))
	     (if (= num 15)
		(progn
		 (setf rhythm (item (rhythms s e s) :kill t))
		 (setf dur rhythm)
		 (setf amp (item (items .8)))
		 (setf istr (item (items 9 1 1)))
		 ))

        (if (= istr 1)
          (progn
            (setf indx 0)
            (setf iatck .024)
          (setf iendx .27)))
        (if (= istr 2)
          (progn
            (setf indx .012)
            (setf iatck .062)
          (setf iendx .35)))
        (if (= istr 3)
          (progn
            (setf indx .025)
            (setf iatck .39)
          (setf iendx 13.87)))
        (if (= istr 4)
          (progn
            (setf indx .019)
            (setf iatck .123)
          (setf iendx 6.1)))
        (if (= istr 5)
          (progn
            (setf indx 0.028)
            (setf iatck 0.062)
          (setf iendx 0.36)))
        (if (= istr 6)
          (progn
            (setf indx 0)
            (setf iatck .035)
          (setf iendx .461)))
        (if (= istr 7)
          (progn
            (setf indx .012)
            (setf iatck .033)
          (setf iendx .8)))
        (if (= istr 9)
          (progn
            (setf indx 0)
            (setf iatck .072)
          (setf iendx .367)))
	(if (= istr 10)
	    (progn
	      (setf indx 0)
	      (setf istr 9)
	      (setf iatck .072)
	      (setf iendx .367)
	      (setf amp .001)))

;don't let iatck exceed total duration of note
        (if (< dur (- iatck indx))
	    (setf indx iatck))

	(setf pan (item (items
                          (items 10 20 30  in random for 3)
                          (items 70 80 90 in random for 3)
                          (items 40 50 60 in random for 3)
                          )))
        (setf dist (between 1 3))
        (setf pct .1)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))


(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))	     ))

(defun ms (&key (start-time 1.)(my-scorefile "beat1.sco"))
  (let* ((myheader (header
;these are config'd for UNIX
                    "f 1 0 16384 1 \"uglybdM.aif\" 0 0 0"
                    "f 2 0 16384 1 \"ruinsnr1M.aif\" 0 0 0"
                    "f 3 0 1048576 1 \"penderhitM.aif\" 0 0 0"
                    "f 4 0 524288 1 \"penderhit2M.aif\" 0 0 0"
                    "f 5 0 65536 1 \"opcloshhM.aif\" 0 0 0"

                    "f 6 0 65536 1 \"curtisclhhM.aif\" 0 0 0"
                    "f 7 0 262144 1 \"cagetomM.aif\" 0 0 0"
                    "f 8 0 16384 9 .5 1 0"
                    "f 9 0 65536 1 \"mc5snr1M.aiff\" 0 0 0"
		)))
    (fheader my-scorefile myheader)
    (merge all ()
      (samps 0 15)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
