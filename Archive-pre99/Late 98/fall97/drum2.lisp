(in-package :stella)
;
(defobject drum (csound-note)
	((instr :initform "i5") dur pitch amp)
	(:parameters instr time dur pitch amp))
;
(defun low (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm (item (rhythms e e e s s s q in heap)))
			(setf dur (between 10 50))
			(setf pitch (item (pitches c1 a b c d e f fs bf for num_of_notes in heap) :kill t))
			(setf amp 6000)
			))
;
(defun high (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm 64)
			(setf dur (between 5 10))
			(setf pitch (item (pitches c6 a b c d e f fs bf for num_of_notes in heap) :kill t))
			(setf amp 4000)
			))			
;
(defun write-cs (container &key (filename "drum2.sco"))
	(open-cmd filename)
	(mix container))
;
(defun make-score (&key (start-time 1.)
                        (my-scorefile "drum2.sco"))
	(let* ((myheader (header "f3 0 16384 9 10 1 16 1.5 22 2 23 1.5"
							"f1 0 16385 5 1 16384 .004"
							"f2 0 16385 5 1 16384 .00012"
							"f4 0 16384 10 1")))
		(fheader my-scorefile myheader)
		(merge drums ()
			(low start-time 50)
			(high (+ start-time 10) 90)
			(low (+ start-time 40) 20)
			(high (+ start-time 40) 40))
                (write-cs "drums" :filename my-scorefile)))
