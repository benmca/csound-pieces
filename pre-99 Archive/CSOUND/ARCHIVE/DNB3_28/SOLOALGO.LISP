(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((instr :initform "i1") dur amp pitch pan dist pct istr iendx indx iatck)
  (:parameters instr time dur amp pitch pan dist pct istr iendx indx iatck))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun mid (st len am)
  (algorithm nil quick (start st length len)
    (setf pitch 1)
 (setf x (interpl count 0 .5 len 30.0))
    (setf rhythm (item
                  (items
                    (items
                      (rhythms  (200 weight 100)(150 weight 100) (250 weight 100) (256 weight (expr x)) in random )
                   
                    ))))
    (if (= rhythm (rhythm 256))
      (setf dur (between 1 2))
        (setf dur (* rhythm (between 1 1.3))))


        (if (>= dur 1)
          (setf amp (between .6 .8))
    (setf amp (between .2 .4) ))

        (if (< dur 1)
           (setf istr (item (items 2 5 6  in random)))
           (progn
            (setf istr (item (items 2 5 6 7 [2 5] [2 6] [2 7] [5 6] [5 7] [6 7] [2 5 6] [2 5 7] [2 6 7] [5 6 7] [2 5 6 7] in random)))
            )
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

        (if (< dur (- iatck indx))
          (setf indx iatck))
	(setf pan (item (items
                          (items 10 20 30  in random for 3)
                          (items 70 80 90 in random for 3)
                          (items 40 50 60 in random for 3)
                          )))
        (setf dist (between 1 3))
        (setf pct .1)
	(setf amp (* amp am))

    (setf *totaldur* (max (+ time dur) *totaldur*))
))


(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "minimal4_1.sco"))
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
		)))
    (fheader my-scorefile myheader)
    (merge all ()
      (mid  1 4000 1)
      (mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
