(in-package :cm)

;;;
;;; Examples of "change ringing" rotations.  I was first made aware of this
;;; technique by Nicky Hind.  Change ringing is an algorithmic procedure
;;; for church bell ringing invented by those clever British, who also gave
;;; these algorithms great names like Plain Bob Minimus, Grandsire Doubles etc. 
;;; The algorithms all involve rotating diferent pairs of bells in the peal, 
;;; but "...the composer's job is to be sure that he has selected as far as
;;; possible the most musical sequences from the many thousands available."
;;; We implement change ringing by passsing the appropriate changes to the
;;; rotation pattern. These rotation changes affect just the first two
;;; change value numbers, ie. the start index and the stepping increment of
;;; the rotation.  Change ringing rotates (almost always) by pairs, so the
;;; step increment between rotations is generally 2.  The start index is
;;; (almost always) the mod 2 cycle. The basic changes for even bell hunting
;;; is therefore a cycle of two changes: (items (0 2) (1 2)).  This pattern
;;; is called the Plain Hunt. Plain Hunting causes a set of n elements to
;;; repeat after 2n changes, or n times through our cycle. Here is Plain Hunt
;;;  Minumus (4 elements A B C D); X marks the rotations.
;;;
;;; Plain Hunt Minimus
;;;	A B C D
;;;	 X   X
;;;	B A D C
;;;	   X
;;;	B D A C
;;;	 X   X
;;;	D B C A
;;;	   X
;;;	D C B A
;;;	 X   X
;;;	C D A B
;;;	   X
;;;	C A D B
;;;	 X   X
;;;	A C B D
;;;	   X
;;;	A B C D
;;;

(defprop plain-hunt :item-expand t)
(defprop dodge :item-expand t)
(defprop plain-bob :item-expand t)
(defprop call-bob :item-expand t)
(defprop call-single :item-expand t)
(defprop grandsire :item-expand t)

;;;
;;; Plain Hunt changes: start=cycle(0,1) and step=2.
;;; For n elements, this process brings a pattern back to its original
;;; form after 2*n changes, which we look at as n repetitions of
;;; cycle(0,1)
;;;

(defun plain-hunt () (items (0 2) (1 2)))

;;;
;;; Plain Bob builds on the Plain Hunt and is n-1 repetions of cycle(0,1)
;;; followed by a "dodge" on the nth: cycle(0,2), wich causes the rotation
;;; to start at the 2nd index instead of the first, this stops the return 
;;; of the pattern, which finally repeats after 2n*(n-1) changes.
;;;

(defun plain-bob (n)
 (items (items (plain-hunt) for (1- n))
        (dodge 2)))

(defun dodge (start &optional (step 2))
  ;; returns a "dodged" cycle, ie instead of 0,1 its 0,x
  (make-item-stream 'items 'cycle (list '(0 2) (list start step))))

;;;
;;; Call Bob builds on Plain Bob. It's n-2 repitions of Plain Bob
;;; followed by a plain bob whose dodge is different: cycle(1,3). The
;;; total number of changes become 3*(2n*(n-1)). So for 6 bells 
;;; (Call Bob Minumus), the pattern repeats after 3*60 or 180 changes.
;;;

(defun call-bob (n)
  (items (items (plain-bob n) for (- n 2))
         (items (items (plain-hunt) for (1- n)) (dodge 1 3))))

;;;
;;;
;;; Call Single builds on Call Bob, but the very last dodge of 1,3 is
;;; replaced by a rotation of just the last two elements, which causes
;;; the process to double (360 changes for 6 bells). If call-single were
;;; itself doubled with another single then all n! possible rotations
;;; would be made, ie 720 changes for 6 bells, 720=6*5*4*3*2*1
;;;

(defun call-single (n)
  (items (items (call-bob n) for 2)
         (items (items (plain-bob n) for (- n 2))
                ;; the third call-bob is the single
                (items (items (plain-hunt) for (1- n)) 
                       (dodge (- n 2))))))

;;;
;;; Grandsire rotates an odd number of Bells
;;;

(defun grandsire (n)
  (items (0 3)
         (items (items (1 2) (0 2)) for (1- n))
         (1 2)))





#|
(setf x (items 1 2 3 4 5 in rotation change (grandsire 5)))
(loop repeat 10 collect (read-items x))

(setf x (items 1 2 3 4 in rotation change (plain-hunt)))
(loop repeat 8 collect (read-items x))

(setf x (items 1 2 3 4 in rotation change (plain-bob 4)))
(loop repeat 24 collect (read-items x))

(setf x (items 1 2 3 4 5 6 in rotation change (plain-bob 6)))
(loop repeat 60 collect (read-items x))

|#
