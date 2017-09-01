;;; This file has only been tested in MCL2.0
;;; File: qp.lisp
;;; Last modification date: 5-12-93
;;;
;;; 
;;; GETTING STARTED:
;;; Set the three parameters *default-midifile-dir*, *default-midifile-name*, 
;;; and *autoload-midifiles* to whatever you desire and evaluate or compile and 
;;; load this file.
;;;
;;; Look at the end of this file for commented-out sample calls.
;;;
;;; compile-me: (compile-file "cm:contrib;qp" :verbose t)

(in-package :cl-user)

;;; BEGIN PARAMETERS ___________________________

(defparameter *default-midifile-dir* ".midi:")          ; pathname
(defparameter *default-midifile-name* "test.midi")      ; filename
(defparameter *autoload-midifiles* t)                   ; nil or t

;;; END PARAMETERS _____________________________

(defparameter *default-midi-name* 
  (merge-pathnames *default-midifile-name* *default-midifile-dir*))

(export '(qp 
          set-midilib 
          show-midilib
          do-midilib
          add-midilib
          set-midilib
          load-mididir
          *default-midifile-dir* 
          *default-midifile-name* 
          *autoload-midifiles*) :cl-user)


;;; The library of known midifile pathnames.

(defvar *midilib* ())


;;;
;;; Quick player 'qp'. qp looks up a pathname in the global list *midilib* if it gets passed
;;; a number. If the first argument is a symbol or string, however, qp tries to treat it as
;;; the name component of a pathname and does a merge-pathnames on it. 
;;; The syntax is:
;;;   (qp <name component of a pathname (string or quoted symbol) | 
;;;             pathname | nr. as shown by show-midilib>
;;;       &optional <starttime (logical-secs)> 
;;;                 <endtime (logical-secs)> 
;;;                 <time-scaling factor (number)> 
;;;                 <head start (ms)>)

(defun qp (path-id &optional (start 0) end (tscale 1) (headstart 1000))
  (let ((path (typecase path-id
                (symbol (merge-pathnames (string path-id) *default-midi-name*))
                (string (merge-pathnames path-id *default-midi-name*))
                (pathname path-id)
                (number (merge-pathnames (elt *midilib* (- path-id 1)) *default-midi-name*))
                (t (error "~&~A is not of type (or SYMBOL STRING PATHNAME NUMBER)" path-id)))))
    (cm:midifile-play path :start start :end end :timescale tscale :headstart headstart)))


;;;
;;; A simple playlist mechanism which is used by qp. 
;;; Names and pathnames of midifiles are held in a list for easy reference.
;;; The functions do-midilib, set-midilib, and add-to-midilib accept symbols as well as
;;; strings and pathname objects.
;;; Namestrings and symbols are merged with the pathname *default-midi-name*.

(defun show-midilib ()
  (declare (special *midilib*))
  (format t "~&Currently known midifiles:~%")
  (loop for x from 1 to (length *midilib*) do
        (format t "~&~3T~4D. ~A" x (elt *midilib* (- x 1))))
  (values))


;;;
;;; The 'generic' function gives full control over the midilib operation to be performed.

(defun do-midilib (&key (clear nil) (verbose t) (show nil) (mididir nil) (namelist nil))
  (declare (special *midilib*))
  (when clear 
    (setf *midilib* nil))
  (when mididir 
    (let ((lib (mapcar #'(lambda (x) (merge-pathnames x  *default-midifile-dir*)) 
                       (mapcar #'file-namestring 
                               (directory (merge-pathnames "*" *default-midifile-dir*))))))
      (if *midilib* 
        (nconc *midilib* lib)
        (setf *midilib* lib))))
  (when (first namelist) 
    (let ((lib (mapcar #'(lambda (x) (typecase x
                                       (symbol (merge-pathnames (string-capitalize (string x)) 
                                                                *default-midi-name*))
                                       (string (merge-pathnames x *default-midi-name*))
                                       (pathname x)
                                       (t (error "~&~a is not of type (or SYMBOL STRING PATHNAME)." x)))) 
                       namelist)))
      (if *midilib* 
        (nconc *midilib* lib)
        (setf *midilib* lib))))      
  (when verbose (format t "~&Holding ~A files in global list~%" (length *midilib*)))
  (when show (show-midilib))
  (values))


;;; 
;;; Helpful 'accessors'

(defun set-midilib (&rest namelist)     ; nil clears midilib
  (if namelist
    (do-midilib :clear t :namelist namelist)
    (do-midilib :clear t)))

(defun add-midilib (&rest namelist)
  (do-midilib :clear nil :namelist namelist))

(defun load-mididir (&key (clear nil) (verbose t))
  (do-midilib :clear clear :mididir t :verbose verbose))


;;;
;;; Autoloads the contents of your midi directory at startup, if
;;; *autoload-midifiles* is t.

(eval-when #+mcl(:load-toplevel :execute) #-mcl (load eval)
     (when *autoload-midifiles* 
       (load-mididir :clear t :verbose nil) (values)))



#|
;;;
;;; Testing stuff. Watch out for different logical hosts and pathnames at your site
;;;

(qp 4)
(qp "test")
(qp 'test)
(qp :test)
(load-mididir :clear t)
(add-midilib "home:test")
(set-midilib "home:test")
(show-midilib)
(do-midilib :show t :mididir t :namelist '("home:test" "core:src:lisp:cm:midi:foo"))
(set-midilib "test" "cf-grammar" "nice-auto" (pathname "home:test.midi")
                    "example_14" "example_16" "legato-autom")

(cm:midifile-play ".midi:cf-grammar.midi")
(cm:midifile-play ".midi:nice-auto.midi" :timescale .5)
(cm:midifile-play ".midi:rising-line.midi" :timescale 2)
(cm:midifile-play ".midi:legato-autom.midi" :timescale 1.5 :headstart 500)
(cm:midifile-play ".midi:legato-autom.midi" :timescale 4 :headstart 1000 :start 6)
|#


;;;
;;; -*- EOF -*-
;;;
