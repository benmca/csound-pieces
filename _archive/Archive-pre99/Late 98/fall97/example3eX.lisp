(in-package :stella)
;
(defobject contr-low (csound-note)
  ((instr :initform "i1") dur amp freq fmrat1 fmrat2)
  (:parameters instr mytime dur amp freq fmrat1 fmrat2))
;
(defobject partic-high (csound-note)
  ((instr :initform "i2") dur amp freq1 index)
  (:parameters instr mytime dur amp freq1 index))
;
(defun contr-low1 (mystart numnotes length)
; distribute numnotes notes over length time
  (setf amp 15000)
  (setf freq (between (pitch 'a2)(pitch 'a4) for numnotes))
  (setf rhythm (* (between .01 (/ length 10))(interpl count 0 1 

;
(defun partic-high1 (mystart numevents)
  (algorithm nil partic-high (start mystart)
	    (unless-chording (setf rhythm (between 1 4))
	     (setf dur (between .4 .6)))
	     (setf freq (item (items
			       (pitches [a2 b e fs] for 2 )
			       (pitches [a3 d f gf[ for 3) for 6)))
			       

(defun make-score (&key (start-time 1.)
			(my-scorefile "examp3.sco"))
  (let* ((myheader (header "; Notelist for Csound Example Orchestra #3"
			   "f 1 0 16384 10 1"
			   "f 2 0 16385 5 1 16384 .0001")))
    (fheader my-scorefile myheader)
    (merge bells ()
	   (loop for i from 0 below 10 do
		 (partic-high1 (* i i) (interpl i 0 5 9 15))))
	   (belldown start-time 25)
	   (bellup (+ start-time 10) 20)
	   (bellheap (+ start-time 20) 20)
	   (belldown (+ start-time 30) 8))
    (write-cs "bells" :filename my-scorefile)))