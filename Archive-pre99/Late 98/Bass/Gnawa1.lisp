(in-package :stella)
;
; 
;    4     5    flags:    6                7                                             8         9             10
;   amp   pitch       all attack?  phrase:0=beg, 1=mid, 2=end, 3=allatck, 4=1note    glisswait  2ndpitch(glis) randstart
;
(defobject gnaw (csound-note)
  ((instr :initform "i3") dur amp pitch atck phrase gliswait endpitch randstart)
  (:parameters instr time dur amp pitch atck phrase gliswait endpitch randstart))
;


(defun gnawa (start-time)
  (algorithm nil gnaw (start start-time length 5)
	     (setf rhythm (item (rhythms e q q e q in heap tempo (tempo 120))))
	     (setf amp 1)
	     (setf pitch (item (pitches a2 c3 d e g)))
	     (setf phrase (item (items 0 1 2 3 4)))
	     (setf dur (+ rhythm (between .1 .5)))
		(setf atck 3)	
	     (setf endpitch (item (pitches a2 c3 d g g)))
	     (if (= pitch endpitch)
		 (setf gliswait .2))
	     (if (or (= phrase 1)(= phrase 2))
		 (setf randstart (between .5 1))
	       (setf randstart 1))
	     
))
;

;don't forget: p10 can't be 0!!!

;

;
(defun ms (&key (start-time 1.)(my-scorefile "Gnawa1.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"

			   "f 3 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
	   (gnawa 1)
)
    (open-cmd my-scorefile)
	(mix-cmd "all")))