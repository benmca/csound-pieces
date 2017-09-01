(in-package :stella) 

;idur = p3
;iamp = p4
;ipitch = p5
;irandfactor = p6

(defobject quick (csound-note) 
  ((instr :initform "i2") inst dur amp pitch randfactor pn) 
  (:parameters instr time dur amp pitch randfactor pn))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
(defun vl1army (st pan)
  (algorithm nil quick (start st length 1)
	     (setf rhythm 10)
	     (setf dur (between 30 45))
	     (setf pitch .6)
	     (setf randfactor (between .01 .5))
	     (setf amp .4)
	     (setf pn pan)
))
;

(defun ms (&key (start-time 1.)(my-scorefile "vl12.sco")) 
  (let* ((myheader (header "" 
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
	   (vl1army 0 0)
	   (vl1army .01 .1)
	   (vl1army .02 .20)
	   (vl1army .03 .30)
	   (vl1army .04 .40)
	   (vl1army .05 .50)
	   (vl1army .06 .60)
	   (vl1army .1 .70)
	   (vl1army .2 .80)
	   (vl1army .35 .90)

            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")))
;LOOP ARGUMENTS:st len pn tem am rot
