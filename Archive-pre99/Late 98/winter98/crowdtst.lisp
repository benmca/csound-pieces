(in-package :stella)
;
(defparameter *totaldur* 0)
(defparameter *totalplk* 0)


(defobject crowd (csound-note)
  ((instr :initform "i")numb mytime dur freq loc dist pct bal)
  (:parameters instr numb mytime dur freq loc dist pct bal))

(defun crowd1 (instrument mystart people loca)
  (algorithm nil crowd (start mystart length people)
	     (setf numb instrument)
	     (setf rhythm (between .001 2.000))
	     (setf mytime (+ mystart rhythm))
	     (setf dur 10)
	     (setf freq (item (pitches df2 ef gf af bf in heap)))
	     (setf loc (+ loca (between 1.0 10.0)))
	     (setf dist 1)
	     (setf pct 100)
	     (setf bal 0);balance between rev and straight
	     (setf *totalplk* (max (+ mytime dur) *totalplk*))
))

(defobject reverb1 (csound-note)
  ((name :initform "i98") mystart dur)
  (:parameters name mystart dur))

(defobject reverb2 (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
(defun mkrvn1 (&key (revtime 10))
  (algorithm nil reverb1 (start 10000 length 1 rhythm 0)
    (setf mystart 1)
    (setf dur (+ revtime *totalplk*))
    ))
;
(defun mkrvn (&key (revtime 2.5))
  (algorithm nil reverb2 (start 10000 length 1 revtime revtime rhythm 0)
    (setf mystart 1)
    (setf dur (+ revtime *totaldur*))
    ))
;

(defun m-s (&key (start-time 1.)(my-scorefile "crowdtst.sco"))
  (let* ((myheader (header "f1 0 16385 10 1"
                           ;"f2 0 65537 1 \"bulge4.aiff\" 0 0 1"
			   "f3 0 16385 9 .5 1 0"
			   ;"f4 0 262144 1 \"lange1.aiff\" 0 0 1"
			   ;"f5 0 262144 1 \"lange1.aiff\" 0 0 2"
			   ;"f6 0 262144 1 \"schnell1.aiff\" 0 0 1"
			   ;"f7 0 262144 1 \"schnell1.aiff\" 0 0 2"
			   

			   )));i10=lange(f4&f5), i11=schnell(f6&f7)
    (fheader my-scorefile myheader)
    (merge all ()
	   (crowd1 1 1 30 30)

	   (mkrvn1)
)
    (write-cs "all" :filename my-scorefile)))