(in-package :stella)
;
(defobject drum (csound-note)
	((instr :initform "i1") dur pitch amp)
	(:parameters instr time dur pitch amp))
;
(defun low (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm (between 1 4))
			(setf dur rhythm)
			(setf pitch (item (pitches c1 a b c d e f fs bf for num_of_notes in heap) :kill t))
			(setf amp 6000)
			))
;
(defun high (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm (between .001 .1))
			(setf dur (* rhythm 10))
			(setf pitch (item (pitches c6 a b c d e f fs bf for num_of_notes in heap) :kill t))
			(setf amp 4000)
			))			
;

(defun make-score (&key (start-time 1.)
                        (my-scorefile "drum3.sco"))
	(let* ((myheader (header "f3 0 16384 9 10 1 16 1.5 22 2 23 1.5"
							"f1 0 16385 5 1 16384 .004"
							"f2 0 16385 5 1 16384 .00012"
							"f4 0 16384 10 1")))
		(fheader my-scorefile myheader)
		(merge drums ()
			(low start-time 10)
			(high (+ start-time 10) 50)
			(low (+ start-time 10) 20)
			(high (+ start-time 15) 50))
                (write-cs "drums" :filename my-scorefile)))