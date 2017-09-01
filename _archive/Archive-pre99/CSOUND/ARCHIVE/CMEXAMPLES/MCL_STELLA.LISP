;;;-*- Mode: Lisp; Package: STELLA -*-
;;;
;;; File: mcl-stella.lisp
;;;
;;; 
;;; Input to stella from arbitrary fred windows:
;;;
;;; o  at the stella prompt, meta-enter evaluates one of:
;;;      o  the current selection, if any, or else
;;;      o  the current {}-delimited multiline form, if any, or else
;;;      o  the current line 
;;;    as a stella command.
;;; o  meta-return pastes the current selection, if any, or a newline into the
;;;    listener. this is fine to answer subsequential prompts produced by
;;;    tl:ask-user, which calls read-line.
;;; o  meta-control-return is the same as meta-return, except that it tries to
;;;    paste the current symbolic expression, if there isn't already a 
;;;    selection.
;;;
;;; Scripting utility functions: qs ("QuickScript"), script-stella
;;;
;;; See also the examples at the end of this file.
;;;
;;;
;;;   1-6-93  works with the new tl.lisp. moved the remaining stuff to stella.
;;;   5-6-93  new script-stella function: accepts new echo keyword and uses 
;;;           both tl:eval-from-file and tl:eval-from-string.
;;;           meta-enter now supports the {} multiline stella command syntax.
;;;  10-6-93  eliminated tl:*external-input*: ed-input-to-stella now uses
;;;           tl:top-level's parser.
;;;           ed-input-to-stella now no longer reads 'random' {} pairs
;;;           when a buffer contains multiple nested levels of curly braces.
;;;   9-8-93  added qs function
;;;  25-8-93  script-stella now shields probe-file from strings containing
;;;           wildcard characters.

(in-package stella)

(export '(qs script-stella) :stella)


(defun script-stella (output echo &rest strings)
  (if (every #'stringp strings)
    (progn
      (when (eq output t) (setf output *standard-output*))
      (if (and (not (wild-pathname-p (first strings)))
               (probe-file (first strings)))
        (tl:eval-from-file (first strings) :output output 
                           :commands *commands* :echo-input echo)
        (progn 
          (setf strings (format nil "~{~a~%~}" strings))
          (tl:eval-from-string strings :output output :commands *commands*
                             :echo-input echo))))
    (error "wrong argument type: data or pathname string(s) expexcted.")))

;;;
;;; "QuickScript": a quick interface to script-stella. 
;;; try for example (qs "edit top-level~%?~%q" t t)

(defun qs (format-string &optional (output nil) (echo nil)) 
  (script-stella output echo (format nil format-string)))




#|
;;; scripting stella
;;;  
;;; syntax: script-stella <output-stream> <echo-input> {string}*
;;; 
;;; output-stream t is the same as *standard-output*, echo-input determines
;;; whether or not the input form should be printed. 
;;;
;;; example 1: direct data strings

(script-stella t t "(expt 23 34)" "help help" "parameters" "" "" ""
               "(inspector::universal-time-string (get-universal-time))")

;;;
;;; example 2: using format to construct one single string. note, that 
;;  there is no need for a final ~%. 

(script-stella t t (format nil "(print \"hi!\")~%help write~%~s" 
                       '(cm::date-string)))

;;;
;;; example 3: multiline syntax

(script-stella nil nil "{map 1 set amplitude .5 
                         when (= $channel 0) set amplitude .3 
                         when (= (mod (degree $note) 5) 0) scale duration 2}")

;;;
;;; example 4: executing a script file.

(script-stella t t "core:desktop folder:foo.tl")

(script-stella t t "import .midi:test.midi
test")
(script-stella t t "listen"
"^")
(script-stella t t "{listen}	    
^")
(script-stella t t "{list
1[1:5]} 
list")
(script-stella t t "edit 1" "?" "start" "" "quit")


;;;
;;; QuickScript: qs <format-string> &optional (output nil) (echo nil)
;;; 
;;; the first parameter must be a string acceptable to format. Both output
;;; and echo parameters are optional and default to nil.
;;;
;;; Examples:

(qs "list Top-Level" t)                 ; output must be t here
(qs "parameters~%containers~%" t)       ;   and here
(qs "listen 1~%^")
(qs "unfreeze 1~%listen 1~%1" t t)

|#

;;;
;;; -*- EOF -*-
