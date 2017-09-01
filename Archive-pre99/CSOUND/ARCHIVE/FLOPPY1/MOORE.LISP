
(in-package :stella) 
(defparameter *totaldur* 0)
(defparameter a 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idx 0)
(defparameter idur 0) 
(defparameter idxdur 0) 
(defparameter pitchindex 0) 
(defparameter overalltempo 0) 

; 
(defobject soundin (csound-note) 
  ((instr :initform "i1") inst dur idx pan dist pct pitch amp) 
  (:parameters instr time dur idx pan dist pct pitch amp))
(defobject soundwarp (csound-note)
  ((instr :initform "i2") dur amp pitch pan dist pct istr iendx indx iatck)
  (:parameters instr time dur amp pitch pan dist pct istr iendx indx iatck))
(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))
;
(defun loop1 (st len pn tem am rot)
  (algorithm nil soundin (start st length len)

    (setf idxdur '((0.0  e) (.366 e.) (.885 e) (1.234 e) (1.602 e)(1.974 e) (2.287 e)(2.673 e)(3.045 e.)(3.541 q) 
                   (4.264 q+s)
                   ))
    (setf i (item (items 0 1 2 3 4 5 6 7 8 9 10 in random)))
;11 items, for 'polvoish.aif'
    (setf idur (nth i idxdur))	;pick i'th pair out of idxdur
    (setf idx (nth 0 idur))		;set idx to 1st element
    (setf du (nth 1 idur))		;set dur to 2nd element
    (setf dur (rhythm du tem))
;pass sprout alg item stream of notes, with length of stream for len?
    (if (= i 0)
      (progn
        (setf p (pitches [a3 a4]))
        (setf r (rhythms e))
        (setf l 1)
;l=num of items - no padding needed
        ))
    (if (= i 1)
      (progn
        (setf p (pitches a4 g e))
        (setf r (rhythms s))
        (setf l 3)
        ))
    (if (or (= i 2) (= i 3) (= i 4) (= i 5))
      (progn
        (setf p (pitches [e3 e4]))
        (setf r (rhythms e))
        (setf l 1)
        ))

    (if (= i 6)
      (progn
        (setf p (pitches [bf3 g4 c5] [g3 e4 a4]))
        (setf r (rhythms s))
        (setf l 2)
        ))
    (if (= i 7)
      (progn
        (setf p (pitches [g3 e4 a4] r ))
        (setf r (rhythms s))
        (setf l 2)
        ))
    (if (= i 8)
      (progn
        (setf p (pitches [g3 e4 a4] [g3 e4 a4] r))
        (setf r (rhythms s))
        (setf l 3)
        ))

    (if (= i 9)
      (progn
        (setf p (pitches [g3 e4 a4] [c4 a4 d4] [c4 a4 d4] [c4 a4 d4]))
        (setf r (rhythms s))
        (setf l 4)
        ))
    (if (= i 10)
      (progn
        (setf p (pitches [c4 a4 d4] [d4 b4 e5] [d4 b4 e5] [d4 b4 e5] [d4 b4 e5]))
        (setf r (rhythms s))
        (setf l 5)
        ))
;
;
;
;
;
;
;
;

;   (setf rhythm (item
;	          (items
;            (items (rhythms q e e e e s s s e. e. in heap tempo (tempo tem)) for 
;                          (item (items 1 1 2 3 5 10 #e(between 20 40) #e(between 40 60) #e(between 60 100))))
;	            (items (rhythms w+w w+w+w w in random tempo (tempo tem)))
;	            )))
    (setf rhythm (rhythm du tem))
;    (if (> dur rhythm)
;      (setf dur rhythm))
;
;
;
;HERE'S THE SPROUT
;
    (sprout
     (algorithm nil midi-note (length l amplitude 1 start time channel 10)
       (setf note (item p))
       (setf rhythm (item r))
       (setf duration rhythm)
       ))

    (setf pitch (* tem 0.0119))
;to get pitch adjustment: x times tem = pitch scalar. 
;I use 1/orig. tem to get scalar
    (if (= pn 100)
      (setf pan (between 50 70))
      (setf pan pn))
    (setf dist 10)
    (setf pct .01)
    (setf amp am)
    (setf *totaldur* (max (+ time dur) *totaldur*))
))

;
;
(defun mrn (&key (revtime 20.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 1))
	     ))
 
; 
(defun ms (&key (start-time 1.)(my-scorefile "moorrnd2.sco")(my-midifile "moorrnd2.mid")) 
  (let* ((myheader (header "" 
                    "f 1 0 1048576 1 \"polvoish.aif\" 0 0 0"
                    "f 8 0 16384 9 .5 1 0"
			   )))
    (fheader my-scorefile myheader) 
    (merge all () 
;
;function proto:
;(defun loop1/2 (st len pn tem am rot)
;
;      (loop1 1 1 10 80 1 5)
      (loop1 1 60 0 60 1 5)
            )
    (open-cmd my-scorefile) 
	(mix-cmd "all")
;
;HERE's THE MIDI FILE SAVE
;

    (open-cmd my-midifile) 
	(mix-cmd "all")
))

