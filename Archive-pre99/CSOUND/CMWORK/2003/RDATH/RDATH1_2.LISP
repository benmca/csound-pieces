(in-package :stella)

(defparameter *repeaterM.wav_total_length* 7.218)

(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idx 0) 
(defparameter idxdur 0) 

;
(defobject soundin_indx (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan dist pct indx origdur)
  (:parameters instr inst mytime dur amp pitch pan dist pct indx origdur))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))

(defun repeater(st tem pn len pitchsca)
  (algorithm nil soundin_indx (start st length len)
        (setf inst 2)
	    (setf mytime time)

    (setf idxdur '((2.292000 0.175000 e)(2.467000 0.162000 e)(2.629000 0.186000 e)(2.815000 0.157000 e)
        (2.972000 0.156000 e)(3.128000 0.196000 e)(3.324000 0.170000 e)(3.494000 0.145000 e)(3.639000 0.177000 e)
        (3.816000 0.173000 e)(3.989000 0.157000 e)(4.146000 0.184000 e)(4.330000 0.165000 e)(4.495000 0.166000 e)
        (4.661000 0.173000 e)(4.834000 0.166000 e)(5.000000 0.156000 e)(5.156000 0.177000 e)(5.333000 0.158000 e)
        (5.491000 0.151000 e)(5.642000 0.171000 e)(5.813000 0.167000 e)(5.980000 0.154000 e)(6.134000 0.151000 q)
        (6.285000 0.352000 q))); 25 items
    
    (setf i (between 0 24))
;        (item 
;            (items 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 )
;    ))	;index into paired stream
    (setf idx (nth i idxdur))	;pick i'th pair out of idxdur
    (setf indx (nth 0 idx))		;set idx to 1st element
    (setf origdur (nth 1 idx) )
    (setf rhythm (rhythm (nth 2 idx) tem))  
    ;
    ; improvement in the loop index method - 
    ;   makes sure there is a distinction between duration in orig sample and 
    ;   replayed duration.
    ;   You will hear articulations from the following note if the duration of a given fragment is too long
    ;   It follows that for fast tempi, orig dur is ok for replayed duration if using soundin, diskin,
    ;   but for slow tempi you must take care to smooth the end of each fragment.
    ;
    (setf dur (* rhythm (between 1.01 1.1)))

    (setf pitch (* 1 pitchsca))
    (setf amp (interpl count 0 .1 (* len .5) 1 len 0))
	(setf pan pn)
    (setf dist 2)
    (setf pct .075)
    (setf *totaldur* (max (+ mytime dur) *totaldur*))
))


(defun spawner (st len pitch tem pan gesturelen)
    (mute nil (start st length len)
            (setf rhythm (item(rhythms w)))
            (setf pitchscalar (* pitch (item (items 1 1 in random))))
        (sprout
            (repeater time tem pan gesturelen pitchscalar)
        )
    )
)        

(defun mrn (&key (revtime 10.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 10))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\2003\\rdath\\rdath1_2.sco"))
  (let* ((myheader (header "f1 0 16384 9 .5 1 0"   ;half sine
						  "f2 0 16384 10 1"        ;sine
						  "f3 0 2097152 1 \"\\rdath\\repeaterM.wav\" 0 0 0"        ;sine
                          "f4 0 512 5 .001 100 1.0 312 1.0 100 .001"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()

        (spawner 1 20 .25 30 45 5)
        (spawner 1 1 1 120 10 25)
        (spawner 1.1 1 1 120 40 25)
        (spawner 1.2 1 1 120 60 25)
        (spawner 1.3 1 1 120 90 25)

        (spawner 10 1 .94 120 10 25)
        (spawner 10.1 1 .871  120 40 25)
        (spawner 10.2 1 .9 120 60 25)
        (spawner 10.3 1 .9 120 90 25)
        (spawner 10 1 1 120 10 25)
        (spawner 10.1 1 1 120 40 25)
        (spawner 10.2 1 1 120 60 25)
        (spawner 10.3 1 1 120 90 25)

        (spawner 20 1 .94 120 10 25)
        (spawner 20.1 1 .871  120 40 25)
        (spawner 20.2 1 .9 120 60 25)
        (spawner 20.3 1 .9 120 90 25)
        (spawner 20 1 .54 120 10 25)
        (spawner 20.1 1 .571  120 40 25)
        (spawner 20.2 1 .53 120 60 25)
        (spawner 20.3 1 .51 120 90 25)
        (spawner 20 1 1 120 10 25)
        (spawner 20.1 1 1 120 40 25)
        (spawner 20.2 1 1 120 60 25)
        (spawner 20.3 1 1 120 90 25)

        (spawner 30 1 .44 120 10 25)
        (spawner 30.1 1 .4  120 40 25)
        (spawner 30.2 1 .4 120 60 25)
        (spawner 30.3 1 .4 120 90 25)
        (spawner 30 1 .4 120 10 25)
        (spawner 30.1 1 .4  120 40 25)
        (spawner 30.2 1 .4 120 60 25)
        (spawner 30.3 1 .4 120 90 25)
        (spawner 20 1 1 120 10 25)
        (spawner 30.1 1 1 120 40 25)
        (spawner 30.2 1 1 120 60 25)
        (spawner 30.3 1 1 120 90 25)
        (spawner 30 1 .94 120 10 25)
        (spawner 30.1 1 .871  120 40 25)
        (spawner 30.2 1 .9 120 60 25)
        (spawner 30.3 1 .9 120 90 25)
        (spawner 30 1 .4 120 10 25)
        (spawner 30.1 1 .571  120 40 25)
        (spawner 30.2 1 .53 120 60 25)
        (spawner 30.3 1 .4 120 90 25)
        (spawner 30 1 1 120 10 25)
        (spawner 30.1 1 1 120 40 25)
        (spawner 30.2 1 1 120 60 25)
        (spawner 30.3 1 1 120 90 25)


		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
