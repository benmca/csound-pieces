(in-package :cm)
(in-syntax :cmusic)

;;; CMUSIC syntax implementatino example. This file should be compiled.
;;;- Look for defmethod on write-event....
;;; - Charles Baker
;;; this files shows how to implement an object and output printing methods
;;; for cmusic score files.  the object defined here is for a ficticious
;;; instrument called ks. ks inherits its rhythm and time slots from Note,
;;; so all we need to do is add duration, frequency and amp. we also add
;;; a name slot and  give it default value of "ks".
;;;

(defobject ks (note) 
  ((name :initform "ks")
   dur
   amp
   freq))

;;;
;;; we first define a method on print-object to print useful slot information
;;; whenever the List command prints an ks object to the terminal.  if a slot
;;; is unbound, we print the value of +slot-unset+, the system print string
;;; denoting unbound slot values. we wrap the whole printout inside the
;;; printing-random-thing macro so that our display looks like other types of
;;; data defined in the editor.  a typical ks might therefore display as:
;;;  #<ii 10.5 1.0 440 .1 12323231>
;;;

(defmethod print-object ((object ks) stream)
  (printing-random-thing (object stream)
    ;; show rhythm and print all unbound slots as "-unset-"
    (formatting-slots (object stream :default +slot-unset+)
      name rhythm dur amp freq)))

;;;
;;; this method on write-event writes our object to the open cmusic score 
;;; file. we get the file associated with the output stream, write the 
;;; current parameter values to it, and finish with an end-of-line. note
;;; that in this case there is no default print value for unbound slots so
;;; we will get an error if we try to write an ks object to a score file
;;; with incomplete parameter information. this is a feature a bug because
;;; it catches the error at the earliest possible time.  note also that
;;; this method writes the time value to the score file, not the rhythm.


;;;OK - CB: I have tried to simplify this a bit:
;;; You need only provide the unique parameters fore this instrument:
;;;Always have "note time name dur .....;, in cmusic and if I can figure how,
;;;I'll try to have the call be 
;;; (cmus-write-method ks 'amp '(freq :suffix "Hz")).....

(defmethod write-event ((object ks) (stream cmusic-score-file))
  (cmus-formatting-slots (object (slot-value stream 'stream))
     amp (freq :suffix "Hz")))

;;; after compiling and loading this file, try pasting everything between
;;; #| and |# (including blank lines) to stella's main prompt:

#|
(thread foo ()
  (dotimes (i 20)
    (object ks freq (between 220. 440.) rhythm .2 dur .1 amp 20)))
list foo
syntax cmusic
write foo
0


|#
