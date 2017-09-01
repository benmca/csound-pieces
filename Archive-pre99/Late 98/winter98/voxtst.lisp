
(in-package :stella)
;
(defparameter *totaldur* 0)



(defobject vox (csound-note)
  ((instr :initform "i1") time dur amp freq ifn loc dist pct)
  (:parameters instr time dur amp freq ifn loc dist pct))

(defun vox1 (starttime)
  (algorithm nil vox (start starttime length 5)
	     (setf rhythm (item (rhythms e e e e e e q q q. in heap tempo(tempo 40))))
	     (setf amp (item (items 10000 10000 10000 10000 13000 in heap)))
	     (setf dur (* rhythm 4))
	     (setf freq (item (items (pitches df3 ef gf af bf in heap for 10))))
	     (setf ifn 2)
             (setf *totaldur* (max (+ time dur) *totaldur*))
	     (setf loc (interpl count 1 0 5 45.0 10 90.0))
	     (setf dist 1)
	     (setf pct .05)
	     ))
(defun mkrvn (&key (revtime 2.5))
  (algorithm nil reverb2 (start 10000 length 1 revtime revtime rhythm 0)
    (setf mystart 1)
    (setf dur (+ revtime *totaldur*))
    ))
;

(defun m-s (&key (start-time 1.)(my-scorefile "winfin.sco"))
  (let* ((myheader (header "f1 0 16385 10 1"
                           "f2 0 65537 1 \"bulge4.aiff\" 0 0 1"
			   "f3 0 4097 9 .5 1 0"
			  ; "f4 0 524288 1 \"lange.aiff\" 0 0 1"
			  ; "f5 0 524288 1 \"lange.aiff\" 0 0 2"
			  ; "f6 0 131073 1 \"schnell.aiff\" 0 0 1"
			  ; "f7 0 131073 1 \"schnell.aiff\" 0 0 2"
			  ; "i10 1 120"
			  ; "i11 1 120"
			   )));i10=lange(f4&f5), i11=schnell(f6&f7)
    (fheader my-scorefile myheader)
    (merge all ()
	   (vox1 1)
	   (vox1 1.2)

	   (mkrvn)
)
    (write-cs "all" :filename my-scorefile))),