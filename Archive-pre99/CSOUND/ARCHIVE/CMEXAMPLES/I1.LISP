(in-package :cm)

;;;
;;; This example shows how to implement a csound note object. i1
;;; inherits from csound-note, a system defined note class that
;;; implements score file and terminal printing for all subclasses.
;;; csound-note declares a slot INS to hold the name (string) of
;;; the csound instrument that will play the note.  If you do not
;;; specify a value for Ins it defaults to the name of the note
;;; class you are declaring.  The :parameters list to defobject 
;;; defines which slots and in what order they will be printed
;;; in the csound score file statements.  The Ins slot is automatically
;;; declared to be a parameter by the csound-note-class.
;;;
;;; If you need highly optimized or specialized slot printing you
;;; can override the printing implemented by csound-note by defining
;;; your own output method for write-event.  See the formatting-slots
;;; entry in the Common Music Dictionary for more information.
;;;
;;; Compile and load the file before trying the example.
;;;

(defobject i1 (csound-note) 
  (dur freq amp)
  (:parameters ins time dur freq amp))

#|

(algorithm foo i1 (length 20 dur .1 rhythm .1 amp .5)
  (setf freq (between 220 440)))

open test.sco
mix foo 0

|#

