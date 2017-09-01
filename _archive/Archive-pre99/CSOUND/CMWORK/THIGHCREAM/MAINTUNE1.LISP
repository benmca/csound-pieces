(in-package :stella)
(defparameter *totaldur* 0)
;
(defobject quick (csound-note)
  ((instr :initform "i") inst mytime dur amp pitch pan dist pct)
  (:parameters instr inst mytime dur amp pitch pan dist pct))

(defobject revnote (csound-note)
  ((name :initform "i99") mystart dur revtime)
  (:parameters name mystart dur revtime))


(defun bassline(st tem pn)
  (algorithm nil quick (start st)
        (setf inst 1)
	    (setf mytime time)


        (setf rhythm 
		    (item 
			        (items 
                        (items (rhythms s s e e e e e s s s s e e e e tempo(tempo tem)) for 2)
                        (rhythms s tempo(tempo tem) for 4)
                        (items (rhythms s s e e e e e s s s s e e e e tempo(tempo tem)) for 2)
                        (rhythms e tempo(tempo tem) for 2)
			        )
		    :kill t)
	    )

        (setf dur rhythm)

        (setf pitch 
		    (item 
			    (items 
				    (items (pitches f3 e ds a2 gs3 a2 gs3 r f3 e ds a2 gs3 a2 gs3) for 2)
				    (pitches r f3 e ds)
                    (items (pitches d3 cs g2 g2 fs3 g2 e3 r d3 cs g2 g2 fs3 g2 fs3) for 2)
                    (pitches g2 gs)
			    )
		    )
	    )

        (setf amp .5)
	    (setf pan pn)
        (setf dist 1)
        (setf pct .01)
        (setf *totaldur* (max (+ mytime dur) *totaldur*))
))


(defun melody(st tem pn)
  (algorithm nil quick (start st)
        (setf inst 1)
	    (setf mytime time)


        (setf rhythm 
		    (item 
			        (items 
                        (rhythms q e q e q e e q e q e q tempo(tempo tem))
                        (rhythms q e e e e e e tempo(tempo tem))
                        (rhythms q e q e e e q e e q q e q e q q q tempo(tempo tem)) 
                        (rhythms q e q e q e e e e q e q e q q q e e q e q e h h h q e e e e e e tempo(tempo tem))
			        )
		    :kill t)
	    )

        (setf dur rhythm)

        (setf pitch 
		    (item 
			    (items 
				    (pitches gs5 fs gs a b cs6 b5 cs6 b5 a gs cs)
				    (pitches r fs4 g a b c5 cs)
                    (pitches ds5 cs cs b4 cs5 cs4 cs cs cs cs ds5 cs cs b4 r r b gs5 fs gs a b cs6 b5 cs6 b5 cs6 b5 a gs 
                            fs r r r cs5 ds cs cs b4 a gs a r a b cs5 ds e fs)
			    )
		    )
	    )

        (setf amp .8)
	    (setf pan pn)
        (setf dist 2)
        (setf pct .075)
        (setf *totaldur* (max (+ mytime dur) *totaldur*))
))


;
;   This function will also sprout the bassline function
;   4 times (due to loop), 3 seconds apart
;

(defun spawnerbass (st len tem)
    (mute nil (start st length len)
        (setf rhythm (item (rhythms w+w+w+w+w+w+h tempo(tempo tem))))
                (sprout
                    (bassline time tem 15)
                )
    )
)        

(defun spawnermel (st len tem)
    (mute nil (start st length len)
        (setf rhythm (item (rhythms w+w+w+w+w+w+h+w+w+w+w+w+w+h tempo(tempo tem))))
                (sprout
                    (melody time tem 75)
                )
    )
)        

(defun mrn (&key (revtime 5.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
	     (setf mystart 0)
	     (setf dur (+ revtime *totaldur* 5))
	     ))

(defun ms (&key (start-time 1.)(my-scorefile "..\\CsWork\\thighcream\\maintune1.sco"))
  (let* ((myheader (header "f 1 0 16384 9 .5 1 0"
						  "f 2 0 16384 10 1"
			   )))
    (fheader my-scorefile myheader)
    (merge all ()
        ;(bassline 0 180 45)
        (spawnerbass 0 4 140)
        (spawnermel 0 2 140)
		(mrn)
            )
    (open-cmd my-scorefile)
	(mix-cmd "all")))
