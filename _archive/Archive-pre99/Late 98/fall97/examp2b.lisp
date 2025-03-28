(in-package :stella)
(defobject simple (csound-note)
	((instr :initform "i3") dur amp pitch (rise :initform .01)
		(decay :initform .01)(wavetable :initform 1))
	(:parameters instr time dur amp pitch rise decay wavetable))
(defun examp2 ()
	(algorithm simptest simple (length 200)
		(setf rhythm (item (rhythms e q e q e. s 12 12 12)))
		(setf dur rhythm)
		(setf pitch (item (pitches c4 d ef f g a b fs in heap)))
		(setf amp (* 16000 (interpl count 0 .1 10 .8 19 .1)))
	)
)
(defparameter *header*
	(header
		"; Notelist for Csound Orchestra Example2b"
		"f 1 0 16384 10 1"))
(defun make-score ()
	(fheader "ex2b.sco" *header*)
	(examp2)
	(write-cs "simptest" :filename "ex2b.sco"))

