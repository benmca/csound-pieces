(in-package :stella)
;
(defobject drum (csound-note)
	((instr :initform "i1") dur pitch amp)
	(:parameters instr time dur pitch amp))
;
(defun low (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm .1)
			(setf dur rhythm)
			(setf pitch (item (pitches a2 for num_of_notes in heap) :kill t))
			(setf amp  (* 16000 (interpl count 0 .1 25 .9 49 .1)))
			))
;
(defun high (start-time num_of_notes)
	(algorithm nil drum (start start-time)
			(setf rhythm .1)
			(setf dur rhythm)
			(setf pitch (item (pitches a5  for num_of_notes in heap) :kill t))
			(setf amp (* 16000 (interpl count 0 .1 25 .9 49 .1)))
			))			
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
			(high start-time 50))
                (write-cs "drums" :filename my-scorefile)))
