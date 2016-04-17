(in-package :stella)

(defparameter *christmasball.wav_total_length* 24.96)

(defparameter *totaldur* 0)
(defparameter i 0)
(defparameter du 0)
(defparameter idx 0) 
(defparameter idxdur 0) 
(defparameter *buflen* 4096)
;
(defobject soundin_indx (csound-note)
           ((instr :initform "i") inst mytime dur amp pitch pan dist pct indx origdur)
           (:parameters instr inst mytime dur amp pitch pan dist pct indx origdur))

(defobject revnote (csound-note)
           ((name :initform "i99") mystart dur revtime)
           (:parameters name mystart dur revtime))

(defun strum(st tem pn len)
  (algorithm nil soundin_indx (start st length len)
             (setf inst 1)
             (setf mytime time)
             
             
             (setf idxdur '((.808 e) (1.246 e) (1.731 e)(2.170 e) (2.586 e) (3.024 e) (3.509 e) (3.902 e) (4.410 e) (4.918 e) 
                            (5.403 q) (6.234 e) (6.765 e) (7.204 q) (8.081 q) (8.936 e) (9.444 e) (9.859 e) (10.344 e) (10.76 e) (11.198 e) 
                            (11.637 e) (12.122 e) (12.561 e) (13.161 e) (13.6 e) (14.039 e) (14.547 e) (15.078 e) (15.563 e) (16.071 e) 
                            (16.625 e) (17.156 e) (17.641 e) (18.149 e) (18.657 e) (19.095 e) (19.65 e) (20.134 e) (20.666 e) (21.150 e) 
                            (21.682 e) (22.190 e) (22.651 h))); 44 items, for 'christmas_ball.wav
             
             (setf i 
                   (item 
                     (items 
                       (chord (items 0 1 2 3 4 ))
                       (chord (items 5 6 7 8 9 ))
                       (chord (items 10 11 12 13 14))
                       (chord (items 15 16 17 18 19))
                       (chord (items 20 21 22 23 24 ))
                       (chord (items 25 26 27 28 29))
                       (chord (items 30 31 32 33))
                       (chord (items 34 35 36 ))
                       (chord (items 37 38 ))
                       39 40 41 42 43)
                     ))	;index into paired stream
             (setf idx (nth i idxdur))	;pick i'th pair out of idxdur
             (setf indx (nth 0 idx))		;set idx to 1st element
             ;(setf rhythm (rhythm (nth 1 idx) tem))  
             ;
             ; improvement in the loop index method - 
             ;   makes sure there is a distinction between duration in orig sample and 
             ;   replayed duration.
             ;   You will hear articulations from the following note if the duration of a given fragment is too long
             ;   It follows that for fast tempi, orig dur is ok for replayed duration if using soundin, diskin,
             ;   but for slow tempi you must take care to smooth the end of each fragment.
             ;
             (if (< i 43)
                 (setf origdur ( - 
                                (nth 0 (nth (+ i 1) idxdur))
                                indx
                                ))
                 ;if last element, subtract indx point from total length of file 
                 (setf origdur (- *christmasball.wav_total_length*  indx))		;set dur to 2nd element
                 )
             (setf rhythm 
                   (item 
                     (items 
                       (rhythms w+w+w )
                       )
                     )
                   )
             (setf dur rhythm)
             
             ;    (setf pitch (item (items (pitches [a4 a4 a4 a4 a4] [a4 a4 a4 a4 a4] [a4 a4 a4 a4 a4] [a4 a4 a4 a4 a4] [a4 a4 a4 a4 a4] [a4 a4 a4 a4 a4] [a4 a4 a4 a4] [a4 a4 a4] [a4 a4] a4 a4 a4 a4 a4 in sequence))))
             (setf pitch 1)
             (setf amp .8)
             (setf pan 
                   (item 
                     (items 	(items (items 0 for 5)
                                    (items  15 for 5)
                                    (items 25 for 5) 
                                    (items 35 for 5) 
                                    (items 45 for 5) 
                                    (items 55 for 5) in heap) 
                            55 55 55 55
                            65 65 65 
                            75 75
                            45 55 65 75 90
                            
                            )
                     )
                   )
             (setf dist 100)
             (setf pct .01)
             (setf *totaldur* (max (+ mytime dur) *totaldur*))
             ))
(defun mrn (&key (revtime 5.))
  (algorithm nil revnote (start 10000 length 1 revtime revtime rhythm 0)
             (setf mystart 0)
             (setf dur (+ revtime *totaldur* 5))
             ))

(defun print-stream (filename)
  (let ((buffer (make-array *buflen*
                            
                            )))
    (with-open-file (f filename :direction :input
                       :if-does-not-exist :error
                       )
                    (do ((j 0))((= j (file-length f)))
                        (setf myline (read-line f t "eofeof"))
                        (if (string-equal myline "eofeof")(return))
                        (princ myline)
                        (write-char #\Newline)
                        (setf j (+ j ))
                        )
                    ))
  )


(defun ms (&key (start-time 1.)(my-scorefile "strum.sco"))
  (let* ((myheader (header "" )))
    (fheader my-scorefile myheader)
    (merge all ()
           (strum 0 10 90 14)
           (mrn)
           )
    (setf mystream (make-string-output-stream))
    (open-cmd my-scorefile)
    (mix-cmd "all 0 play nil")
    ))
(ms)
(print-stream  "strum.sco")