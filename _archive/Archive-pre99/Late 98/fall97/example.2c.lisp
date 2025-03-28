(in-package :stella)
(defobject simple (csound-note)
  ((name :initform "i3") dur amp pitch (rise :initform .01) (decay :initform .01)(wavetable :initform 1))
  (:parameters name time dur amp pitch rise decay wavetable))
;
(defun examp2 (start-time num-of-notes)
  (algorithm simptest simple (start start-time length num-of-notes)
	     (setf rhythm (item (rhythms e q e q e. s 12 12 12)))
	     (setf dur (* rhythm 1.5))
	     (setf pitch (* (between .99 1.01)(item (pitches c4 d ef f g a b fs in heap))))
	     (setf amp (* 16000 (interpl count 0 .1 10 .8 19 .1)))
	     )
)
;
(defparameter *header*
  (header
   "; Notelist for Csound Orchestra Example2"
   "f 1 0 16384 10 1"))
;
(defun make-score (&key (start-time 1.)(num-of-notes 20)
  (my-scorefile "example2c.sco"))
(fheader my-scorefile *header*)
(examp2 start-time num-of-notes)
(write-cs "simptest" :filename my-scorefile))
