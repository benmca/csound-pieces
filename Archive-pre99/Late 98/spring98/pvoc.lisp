(in-package :stella)
;
; 
;    4     5    flags: 6              7                   8
;   amp   pitch      short note? all attack?  phrase:0=beg, 1=mid, 2=end
;
(defobject gnaw (csound-note)
  ((instr :initform "i3") dur amp pitch shrt atck phrase)
  (:parameters instr time dur amp pitch shrt atck phrase))
;


(defun gnawa (start-time)
  (algorithm nil gnaw (start start-time length 10)
	     (setf rhythm (item (rhythms e q q e q in heap tempo (tempo 120))))
	     (setf amp 1)
	     (setf pitch (item (pitches a2 c3 a2 in heap)))
	     (setf shrt 0)
	     (setf atck 0)
	     (setf phrase 0)
	     (setf dur (+ rhythm (between .1 .5)))
))
;

;don't forget: p10 can't be 0!!!

;

;
(defun ms (&key (start-time 1.)(my-scorefile "pvoc.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
	   (gnawa 1)
)
    (write-cs "all" :filename my-scorefile)))