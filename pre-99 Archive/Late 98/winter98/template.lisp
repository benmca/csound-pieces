(in-package :stella)
;
(defobject coalesce (csound-note)
  ((instr :initform "i1") dur amp pitch pitch2 index)
  (:parameters instr time dur amp pitch pitch2 index))

(defun coalong (mystart points focusfreq durat ind)
  (algorithm nil coalesce (start mystart length points)

    ))
;

;

;

;

;
(defun make-score (&key (start-time 1.)(my-scorefile "final.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"
			   "f 2 0 1024 1 "angle.aiff" 0 0 1"
			   "f 3 0 16385 5 1 16384 .001")))
    (fheader my-scorefile myheader)
    (merge all ()
)
    (write-cs "all" :filename my-scorefile)))
