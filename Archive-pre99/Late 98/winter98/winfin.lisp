(in-package :stella)
;
(defparameter *totaldur* 0)
(defparameter *totalplk* 0)
;
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
	     (setf dist (between 1 5))
	     (setf pct .4)
	     (setf bal .5);balance between rev and straight
	     (setf *totalplk* (max (+ mytime dur) *totalplk*))
))
;
(defun crowd2 (instrument mystart people loca)
  (algorithm nil crowd (start mystart length people)
	     (setf numb instrument)
	     (setf rhythm (between .001 2.000))
	     (setf mytime (+ mystart rhythm))
	     (setf dur 5)
	     (setf freq (item (pitches df1 ef gf af bf df2 ef gf af bf df3 ef gf af bf in heap)))
	     (setf loc (+ loca (between 1.0 10.0)))
	     (setf dist (between 1 5))
	     (setf pct .6)
	     (setf bal .5);balance between rev and straight
	     (setf *totalplk* (max (+ mytime dur) *totalplk*))
))
;
(defun crowd3 (instrument mystart people loca)
  (algorithm nil crowd (start mystart length people)
	     (setf numb instrument)
	     (setf rhythm (between .001 1.000))
	     (setf mytime (+ mystart rhythm))
	     (setf dur 5)
	     (setf freq (item (pitches df1 ef gf af bf df2 ef gf af bf df3 ef gf af bf in heap)))
	     (setf loc (+ loca (between 1.0 10.0)))
	     (setf dist (between 1 5))
	     (setf pct 20)
	     (setf bal .5);balance between rev and straight
	     (setf *totalplk* (max (+ mytime dur) *totalplk*))
))

(defun crowd4 (instrument mystart people loca)
  (algorithm nil crowd (start mystart length people)
	     (setf numb instrument)
	     (setf rhythm (between .001 1.000))
	     (setf mytime (+ mystart rhythm))
	     (setf dur 10)
	     (setf freq (item (pitches df1 ef f gf a af bf df2 ef f gf a bf in heap)))
	     (setf loc (+ loca (between 1.0 10.0)))
	     (setf dist (between 1 5))
	     (setf pct 100)
	     (setf bal 0);balance between rev and straight
	     (setf *totalplk* (max (+ mytime dur) *totalplk*))
))





(defobject vox (csound-note)
  ((instr :initform "i1") time dur amp freq ifn loc dist pct)
  (:parameters instr time dur amp freq ifn loc dist pct))

(defun vox1 (starttime)
  (algorithm nil vox (start starttime length 10)
	     (setf rhythm (item (rhythms e e e e e e q q q. in heap tempo(tempo 40))))
	     (setf amp (item (items 2000 2000 2000 2000 2500 in heap)))
	     (setf dur (* rhythm 4))
	     (setf freq (item (items (pitches df3 ef gf af bf in heap for 10))))
	     (setf ifn 2)
             (setf *totaldur* (max (+ time dur) *totaldur*))
	     (setf loc (interpl count 1 0 5 45.0 10 90.0))
	     (setf dist 10)
	     (setf pct .05)
	     ))


(defun vox2 (starttime)
  (algorithm nil vox (start starttime length 30)
	     (setf rhythm (item (rhythms e e e e e e q q q. in heap tempo(tempo 40))))
	     (setf amp (item (items 2000 2000 2000 2000 2500 in heap)))
	     (setf dur (* rhythm 4))
	     (setf freq (item (items (pitches df3 ef gf af bf in heap for 10)(pitches df3 ef gf af bf df2 ef gf af b in heap for 10)(pitches df3 ef gf af bf df2 ef gf af bf df1 ef gf af bf in heap for 10))))
	     (setf ifn 2)
             (setf *totaldur* (max (+ time dur) *totaldur*))
	     (setf loc (between 0.0 89.9))

	     (setf dist (between 10 20))
	     (setf pct (between .01 .1))
	     ))
;
(defun vox3 (starttime)
  (algorithm nil vox (start starttime length 26)
	     (setf rhythm (item (rhythms e e e e e e q q q. in heap tempo(tempo 40))))
	     (setf amp (item (items 1300 1300 1300 1300 1700 in heap)))
	     (setf dur  (* rhythm 4))
	     (setf freq (item (items (pitches df3 ef f gf g af bf in heap for 10)(pitches df3  d ef gf af b bf df2 ef e gf g af b in heap for 10)(pitches a4 for 6))))
	     (setf ifn 2)
             (setf *totaldur* (max (+ time dur) *totaldur*))
	     (setf loc (between 0.0 89.9))
	     (setf dist (between 20 80))
	     (setf pct (between 0 50))
	     ))
;



(defobject samp (csound-note)
  ((name :initform "i10") time dur)
  (:parameters name time dur))
(defobject samp2 (csound-note)
  ((name :initform "i11") time dur)
  (:parameters name time dur))
(defun lange (startt dura)
  (algorithm nil samp (start startt length 1 rhythm 0)
	     (setf dur dura)))
    







;
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

(defun m-s (&key (start-time 1.)(my-scorefile "winfin.sco"))
  (let* ((myheader (header "f1 0 16385 10 1"
                           "f2 0 65537 1 \"bulge4.aiff\" 0 0 1"
			   "f3 0 16385 9 .5 1 0"
			   "f4 0 262144 1 \"lange1.aiff\" 0 0 1"
			   "f5 0 262144 1 \"lange1.aiff\" 0 0 2"
			   ;"f6 0 262144 1 \"schnell1.aiff\" 0 0 1"
			   ;"f7 0 262144 1 \"schnell1.aiff\" 0 0 2"
			   

			   )));i10=lange(f4&f5), i11=schnell(f6&f7)
    (fheader my-scorefile myheader)
    (merge all ()
	   (vox1 1)
	   (vox1 1.8)
	   (vox1 1.5)
           (vox2 10)
 	   (vox2 10)
	   (vox2 10)
	   (vox1 70)
	   (vox1 70.1)
	   (vox1 70.33)
	   (vox3 85)
	   (vox3 85)
	   (vox3 85)
	   (crowd1 2 31 40 30)
	   (crowd1 2 32 100 70)
	   (crowd1 2 36 10 81)
	   (crowd1 2 37 72 10)
	   (crowd2 2 49 60 10)
	   (crowd2 2 54 10 70)
	   (crowd2 2 57 10 40)
	   (crowd2 2 57.8 10 45)
	   (crowd3 2 60 20 50)
	   (crowd3 2 62 30 55)
	   (crowd3 2 64 40 17)
	   (crowd3 2 68 30 22)
	   (crowd3 2 72 20 62)

	   (crowd4 2 90 10 80)
	   (crowd4 2 98 20 40)
	   (crowd4 2 98.7 20 53)
	   (crowd4 2 99 20 79)

	   (crowd4 2 100 10  10)
	   (crowd4 2 103 4 50)
	   (crowd4 2 105 2 37)
	   (lange 1 122)
	   (mkrvn)
	   (mkrvn1)
)
    (write-cs "all" :filename my-scorefile)))