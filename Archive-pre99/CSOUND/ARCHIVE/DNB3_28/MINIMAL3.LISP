(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick2 (csound-note)
  ((instr :initform "i2") dur amp pitch pan dist pct istr iendx indx iatck)
  (:parameters instr time dur amp pitch pan dist pct istr iendx indx iatck))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun minmain (st len)
  (algorithm nil quick (start st length len)
    (setf pitch 1)
	(setf rhythm (item (items
                             (rhythms (h weight 10) (h. weight 10) (w weight 10) (w. weight 10) (.5 weight 10) (32 weight 7)(24 weight 7)(64 weight 7)(e weight 7) in random for 40)
                             (rhythms (32 weight 7)(24 weight 6)(64 weight 7)(e weight 2) in random for 20)
                             )))
        (setf dur rhythm)
	(setf amp (between 50 100))
        (if (> rhythm (rhythm 'e))
           (setf istr (item (items 1 2 [2 3] [2 4] [2 6]  [1 7] [1 3] [1 4] in random)))
           (progn
            (setf istr (item (items 1 2 6 7 in random)))
            (setf amp (* amp (between 1.01 2))))
           )
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
            (setf indx 2.101)
            (setf iatck 2.142)
          (setf iendx 4.01)))
        (if (= istr 6)
          (progn
            (setf indx 0)
            (setf iatck .066)
          (setf iendx .461)))
        (if (= istr 7)
          (progn
            (setf indx .012)
            (setf iatck .033)
          (setf iendx .8)))
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
	     (setf dur (+ revtime *totaldur* 1))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "minimal3_3.sco"))
  (let* ((myheader (header
                    "f 1 0 16384 1 \"UGLYBDM.AIF\" 0 0 0"
                    "f 2 0 16384 1 \"RUINSNR1M.AIF\" 0 0 0"
                    "f 3 0 1048576 1 \"Penderhit1M.AIF\" 0 0 0"
                    "f 4 0 524288 1 \"Penderhit2M.AIF\" 0 0 0"
                    "f 5 0 262144 1 \"THUNHISS4.aif\" 0 0 0"
                    "f 6 0 65536 1 \"Curtis~2.AIF\" 0 0 0"
                    "f 7 0 262144 1 \"CAGETOMM.AIF\" 0 0 0"
                    "f 8 0 16384 9 .5 1 0"
		)))
    (fheader my-scorefile myheader)
    (merge all ()
      (minmain 1 80)
      (mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
