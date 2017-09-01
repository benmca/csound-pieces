(in-package :stella)



(defobject coalesce (csound-note)
  ((instr :initform "i1") dur amp pitch pitch2)
  (:parameters instr time dur amp pitch pitch2))

(defun coalong (mystart points focusfreq durat)
  (algorithm nil coalesce (start mystart length points)
    (setf pitch (between (* focusfreq .5)(* focusfreq 4)))
    (setf pitchmod (between .01 .03))
    (setf pitch (+ pitch (* pitch pitchmod)))
    (setf pitch2 focusfreq)
    (setf rhythm (between .0001 (/ durat points)))
    (setf dur (- durat  time)))
    (setf amp 1500)
    )
;
(defobject pulse (csound-note)
  ((instr :initform "i2") dur amp pitch index rat)
  (:parameters instr time dur amp pitch index rat))
;

(defun make-score (&key (start-time 1.)(my-scorefile "piece1.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1")))
    (fheader my-scorefile myheader)
    (merge all ()
      (coalong 1 20 440 20)
      (coalong 20 4 1600 10))
    (write-cs "all" :filename my-scorefile)))
