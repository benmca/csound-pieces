;;; this file is automatically loaded by CM.

(in-package :cm)

;;;
;;;  Fix Common Music directory to reflect runtime file system.
;;;

(in-package :cm)

(setf *common-music-directory*
      (namestring
       #+mcl (ccl:mac-default-directory)
       #+(or excl clisp)
       (make-pathname
	#+windows :device
	#+windows (pathname-device
		   (truename *load-pathname*))	
	:directory
	(pathname-directory 
	 (truename *load-pathname*)))
       ))

#+(and acl linux clm)
(progn
  (setf clm::*libclm-pathname* 
        (concatenate 'string *common-music-directory* "libclm.so"))
  (load clm::*libclm-pathname*)
  )

;;;
;;; MCL: Uncomment and edit to reflect your OMS setup document.
;;; The order of entries in a connection is: <INPUT> <OUTPUT>
;;;

; (setf *midi-default-connections* '(("K2500" "K2500")))

;;;
;;; Linux: Uncomment and edit to use and external midifile player.
;;;

; (setf *midifile-player* nil)
; (setf *midifile-player-args* nil)

