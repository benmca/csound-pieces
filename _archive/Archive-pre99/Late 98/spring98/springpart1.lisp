(in-package :stella)
;
; 
;    4     5    flags:    6                7                                             8         9            
;   amp   pitch       fadefactor  phrase:0=beg/end, 1=mid, 2=allatck, 3=1note        glisswait  2ndpitch(glis) 
;
(defobject main (csound-note)
  ((inst :initform "i") instr time dur amp pitch fade phrase gliswait endpitch angle dist revpct)
  (:parameters inst instr time dur amp pitch fade phrase gliswait endpitch angle dist revpct))
;
(defobject birdy (csound-note)
  ((inst :initform "i") instr dur amp pitch)
  (:parameters inst instr time dur amp pitch));
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
(defparameter *totaldur* 0)
(defparameter glis 0)
(defparameter mytime 0)
;
(defun one (start-time tinst length)
  (algorithm nil main (start start-time length length)
	     (setf instr tinst)
	     (setf rhythm (item (items (rhythms s. e. s in random tempo (tempo 0 80 5 100 6 95 9 83 20 80) for 15)(rhythms q q. for 5))))
	     (setf amp (item (items 1 1 1 1 1.5 in heap)))
	     (if (= instr 3)
		 (setf pitch (item (pitches e2 g a3 c d))))
	     (if (= instr 4)
		 (setf pitch (item (pitches e1 g a2 c d))))
	     (if (= instr 2)
		 (setf pitch (item (pitches e3 g a4 c d))))
	     (if (or (= instr 2)(= instr 4))
		 (setf phrase (item (items (items 0 for 5)(items 2 for 10)(items 2 0 in random for 5))))
	       (setf phrase (item (items (items 0 for 5)(items 1 for 10)(items 3 for 5)))))
	     (setf dur (item (items 1 2 3)))
;pitch stuff
	     ;(if (= pitch (item (pitches c4)))
		; (progn 
		  ; (setf glis 1)
		  ; (setf endpitch (item (pitches a2))))
	       ;(progn
		 ;(setf glis 0)
		 (setf endpitch pitch)
		 ;))
;time stuff
	     (if (= glis 1)
		 (setf gliswait (between .01 (* dur .1)))
	       (setf gliswait 0))
	     (if (= phrase 1)
		(setf randstart (between .75 1))
	       (setf randstart 0))
	     (if (= phrase 3)
		 (setf fade (* dur .7))
	       (setf fade 0))
	     (if (< dur .1 )
		 (setf phrase 1)
		  )
;reverb stuff
	     (setf dist (between 1 4))
	     (if (= instr 2)
		 (setf angle (between 1 40)))
	     (if (= instr 3)
	       (setf angle (between 50 90)))
	     (if (= instr 4)
	       (setf angle (between 30 60)))
	     (if (= instr 4)
		 (setf revpct .1)
	       (setf revpct (between .02 .04)))
	     (setf *totaldur* (max (+ time dur) *totaldur*))
))
;

(defun bird (start-time iter)
  (algorithm nil birdy (start start-time length iter)
	     (setf instr 5)
	     (setf rhythm (between .8 1.5))
	     (setf dur (* iter rhythm))
	     (setf amp 3)
	     (setf pitch (between 2 4))
	     (setf *totaldur* (max (+ time dur) *totaldur*))
))
;

(defun phraseone (st)
  (algorithm nil main (start st length 14)
	     (setf instr 3)
	     (setf rhythm (item (rhythms w. 12 12 12 e e e e 12 12 12 q e w. tempo (tempo 80))))
	     (setf amp (item (items 4 2 1 1 2 1 2 1 1 2 1 1 2 4)))
	     (if (= amp 2)
		 (setf amp (* 2 (between .75 1))))
	     (setf amp (* amp 3))
	     (setf phrase (item (items 3 0 0 0 0 1 0 0 1 0 0 0 1 3)))
	     (setf rhythm (* rhythm (between .9 1.1)))
	     (setf dur rhythm)
	     (if (= phrase 3)
		 (setf fade (between .3 .4))
	       (setf fade 0))
	     (setf gliswait 0)
	     (setf pitch (item (pitches d2 d d d d e g e d e d e b)))
	     (setf endpitch pitch)
	     (setf revpct .00001)
	     (setf dist 1)
	     (setf angle 40)
	     (setf *totaldur* (max (+ time dur) *totaldur*))
))


(defun phrasetwo (st)
  (algorithm nil main (start st length 14)
	     (setf instr 3)
	     (setf rhythm (item (rhythms w. 12 12 12 e e e e 12 12 12 q e w. tempo (tempo 80))))
	     (setf amp (item (items 4 2 1 1 2 1 2 1 1 2 1 1 2 4)))
	     (if (= amp 2)
		 (setf amp (* 2 (between .75 1))))
	     (setf amp (* amp 1.7))
	     (setf phrase (item (items 3 0 0 0 0 1 0 0 1 0 0 0 1 3)))
	     (setf rhythm (* rhythm (between .9 1.1)))
	     (setf dur rhythm)
	     (if (= phrase 3)
		 (setf fade (between .3 .4))
	       (setf fade 0))
	     (setf gliswait 0)
	     (setf pitch (item (items (pitches [d1 d2] for 4)(pitches [e1 e2][g1 g2][e1 e2][d1 d2][e1 e2][d1 d2][e1 e2][b1 b2]))))
	     (setf endpitch pitch)
	     (setf revpct .00001)
	     (setf dist 1)
	     (setf angle 57)
	     (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
(defun polvophrase (st)
  (algorithm nil main (start st length 1)
	     (setf instr 6)
	     (setf rhythm 20)
	     (setf amp 1)
	     (setf pitch 200)
	     (setf phrase 0)
	     (setf dur rhythm)
	     (setf fade (* dur .2))
	     (setf endpitch 185)
	     (setf gliswait 0)
	     (setf revpct .02)
	     (setf dist 2)
	     (setf angle 0)
	     (setf *totaldur* (max (+ time dur) *totaldur*))
))
;
(defun mrn (&key (revtime 10.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
;

;
(defun ms (&key (start-time 1.)(my-scorefile "spring.sco"))
  (let* ((myheader (header "f 1 0 16384 10 1"
			   "f 2 0 32768 1 \"miro22.aiff\" 0 0 0"
			   "f 3 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()

	   (one 1 2 5)
	   (one 1.01 3 20)
	   (one 15 4 20)
	   (one 15.4 3 30)
	   (bird 27 10)
	   (phraseone 60)
	   (phrasetwo 80)
	   (polvophrase 90)
	   (mrn)
)
    (write-cs "all" :filename my-scorefile)))