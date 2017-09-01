(in-package :cm)

#|

An implementataion of one and two dimensional cellular automata.
A number of examples are provided at the end of the file along
with a graphics window class (in MCL) for displaying automata
states as colored rectangles.  For an example of making music and
graphics together see rt.lisp
 
To create an automata call MAKE-AUTOMATA with a list or array of
initial states and a transition rule function.
For 2D automata the cells
should be a list of lists; each sublist becomes a "row" of initial
states.  Otherwise,the can be the actual state array.  In
this case the array must be rank 3, with the first dimension size
size 2, ie [2,Y,X].  For example, for a one dimensional automata of
16 cells the array would be [2,1,16].  For an 7x8 2D automata it
would be [2,7,8].  The [0,Y,X] plane must already hold the initial
states representing clock time 0.
The rule function implementsthe automata's state
transitions rules. This function must accept two arguments, the
automata and the index of the current cell, and returns as its
value the next state of the current cell.  The function may
optionally returns a second value, which becomes the external
value returned by the automata for the new state. Rule functions
typically need to examine the state of one or more cells to
compute the new state of the current cell.  Use the macro
CELL-STATE to accesses the state of the current cell or any of its
neighbors:
      CELL-STATE (AUTOMATA INDEX &OPTIONAL INCREMENT)
It is best to specify neighbors as a positive or negative increment
argument to the current index.  CELL-STATE does bounds checking
and automatically computes addresses MOD the size of the cell array.
To access several cells at the same time use the WITH-STATES macro:
      WITH-STATES (AUTOMATA INDEX (&REST (VAR INC)) &BODY)
The with-states macro is much faster than calling cell-states
seperately to access several neighbor states.  Note that for 2D
automata the index passed to the rule function will an encoded 
point containing both x and y coordinates for the current cell
Increment arguments to cell-state or with-states must also be
expressed as xy points  Use the XY macro to encode a point given
seperate x and y values:
      XY (X Y)
For example:
(with-states a i ((above (xy 0 -1)) (rh (xy 1 0))) (+ above right))
sums the states of two neighbors: a cell directly above the current
cell and a cell directly to the right of the current cell.
Once an automata has been created, use the state function to read
successive states from it.
     STATE (AUTOMATA)
The function:
     CLOCK-STATES (AUTOMATA)
returns a list of all states in the current clock tick.
|#


#-mcl
(progn
(defun xy (x &optional (y 0))
  (when (< x 0) (setf x (+ 65536 x)))
  (when (< y 0) (setf y (+ 65536 y)))
  (logior (ash (logand y #xffff) 16) (logand x #xffff) ))
(defun xy-x (xy)
  (let ((x (logand xy #xffff)))
    (if (>= x 32768) (- x 65536) x)))
(defun xy-y (xy)
  (let ((y (ash (logand xy #xffff0000) -16)))
    (if (>= y 32768) (- y 65536) y)))
)

(defclass automata ()
  ((cells :initarg :cells :accessor automata-cells :initform nil)
   (index :initform 0 :accessor automata-index)
   (bounds :accessor automata-bounds)
   (next :initform 0 :accessor automata-next)
   (rule :accessor automata-rule :initarg :rule)))

(defun make-automata (cells rule &rest args)
  (apply #'make-instance 'automata :cells cells :rule rule args))

(defmethod initialize-instance :after ((object automata) &rest args)
  (declare (ignore args))
  (let* ((cells (slot-value object 'cells))
         array r c)
    (if (arrayp cells)
      (let ((d (array-dimensions cells)))
        (unless (= (array-rank cells) 3)
          (error "Cells must be a 3D array!"))
        (unless (<= 2 (pop d))
          (error "Cells Z dimension not >= 2!"))
        (setf r (pop d) c (pop d)))
      (progn
        (if (consp (car cells))
          (setf r (length cells) c (length (car cells))
                cells (if (= r 1) (pop cells) cells))
          (setf r 1 c (length cells)))
        (setf array (make-array (list 2 r c)))
        (if (= r 1)
          (dotimes (x c) (setf (aref array 0 0 x) (pop cells)))
          (loop for row in cells for y from 0
                do (loop for col in row for x from 0
                         do (setf (aref array 0 y x) col))))
        (setf (slot-value object 'cells) array)))
    (setf (slot-value object 'bounds) (vector 0 r c))))

(defmacro cell-state (auto index &optional inc)
  (let ((a (gensym)) (s (gensym)) (b (gensym)))
    `(let* ((,a ,auto)
            (,s ,(if inc `(xy+ ,index ,inc) index))
            (,b (automata-bounds ,a)))
       (declare (type (simple-vector 3) ,b) 
                (type (array t (2 * *)) ,a))
       (aref (automata-cells ,a)
             (the fixnum (svref ,b 0))
             (the fixnum
               (mod (the fixnum (xy-y ,s)) (the fixnum (svref ,b 1))))
             (the fixnum
               (mod (the fixnum (xy-x ,s)) (the fixnum (svref ,b 2))))))))

(defmacro with-states (automata index (&rest neighbors) &body body)
  (let ((obj (gensym)) (zyx (gensym)) (ary (gensym)) 
        (ind (gensym)) (row (gensym)) (col (gensym)) 
        let)
    (setf let
          (loop for (v p) in neighbors
                for c = (if (numberp p)
                          (if (= (xy-x p) 0) col
                              `(mod (the fixnum (+ ,col ,(xy-x p)))
                                    (the fixnum (svref ,zyx 2))))
                          `(mod (the fixnum (+ ,col 
                                               (the fixnum (xy-x ,p))))
                                (the fixnum (svref ,zyx 2))))
                for r = (if (numberp p)
                          (if (= (xy-y p) 0) row
                              `(mod (the fixnum (+ ,row ,(xy-y p)))
                                    (the fixnum (svref ,zyx 1)) ))
                          `(mod (the fixnum (+ ,row
                                               (the fixnum (xy-y ,p))))
                                (the fixnum (svref ,zyx 1))))
                collect `(,v 
                          (aref ,ary (the fixnum (svref ,zyx 0))
                                  (the fixnum ,r) (the fixnum ,c)))))
    `(let* ((,obj ,automata)
            (,ind ,index)
            (,row (xy-y ,ind))
            (,col (xy-x ,ind))
            (,zyx (automata-bounds ,obj))
            (,ary (automata-cells ,obj)))
       (declare (type (simple-vector 3) ,zyx) 
                (type (array t (2 * *)) ,ary)
                (fixnum ,row ,col)
                (optimize (speed 3) (safety 0))
                )
       (let (,@let)
         ,@body))))
                       
(defun state (auto)
  (let* ((i (automata-index auto))
         (x (xy-x i))
         (y (xy-y i))
         (b (automata-bounds auto))
         (c (automata-cells auto))
         state next value)
    (declare (fixnum y x) (type (array t (2 * *) c))
             (type (simple-vector 3) b)
             ;(optimize (speed 3) (safety 0))
             )
    ;; state = cells[z,y,x] next = cells[z+1 MOD 2,y,x]
    (setf state (aref c (svref b 0) y x))
    (multiple-value-setq (next value)
      (funcall (slot-value auto 'rule) auto i))
    (setf (aref c (if (= (svref b 0) 1) 0 1) y x)
          next)
    ;; increment x y x MOD size. if at end increment Z.
    (unless (< (incf x) (the fixnum (svref b 2)))
      (setf x 0)
      (unless (< (incf y) (the fixnum (svref b 1)))
        (setf y 0)
        (setf (svref b 0) (if (= (svref b 0) 1) 0 1))))
    (setf (automata-index auto) (xy x y))
    (or value state)))

(defun clock-states (automata)
  (let ((b (automata-bounds automata)))
    (loop repeat (* (aref b 1) (aref b 2))
          collect (state automata))))

#+mcl
(progn

(defclass cellview (ccl:view)
  ((automata :initarg :automata)
   (colors  :initform nil :initarg :state-colors)
   (rows :initform 40 :initarg :rows)
   (columns :initarg :columns)
   (times :initform 1 :initarg :times)
   (cell-size :initform 4 :initarg :cell-size)
   (cell-border :initform 1 :initarg :cell-border)
   )
  (:default-initargs :view-position #@(5 25)
    :view-nick-name ':cellview))

(defmethod initialize-instance :after ((view cellview) &rest args)
  (declare (ignore args))
  (unless (slot-boundp view 'automata)
    (error "Can't create cellview without :automata object!"))
  (let ((colors (slot-value view 'colors))
        (table (make-hash-table)))
    (if (consp colors)
      (loop for c in colors as i from 0
            do (setf (gethash i table) c)))
    (setf (slot-value view 'colors) table))
  (let ((size (+ (slot-value view 'cell-size)
                 (slot-value view 'cell-border))))
    (unless (slot-boundp view 'columns)
      (setf (slot-value view 'columns) 
            (aref (automata-bounds (slot-value view 'automata) ) 2)))
    (ccl:set-view-size
     view (xy (* size (slot-value view 'columns))
              (* size (slot-value view 'rows))))))
  
(defmethod draw-automata ((view cellview) )
  (declare (optimize (speed 3) (safety 0)))
  (ccl:with-focused-view view
    (loop with automata = (slot-value view 'automata)
          and colors = (slot-value view 'colors)
          and size fixnum = (slot-value view 'cell-size)
          and whole fixnum = (+ (slot-value view 'cell-border)
                                (slot-value view 'cell-size))
          and x fixnum = 0 and y fixnum = 0
          repeat (slot-value view 'times)
          do
          (setf y 0)
          (loop repeat (slot-value view 'rows)
                do
                (setf x 0)
                (loop repeat (slot-value view 'columns)
                      do
                      (ccl:with-fore-color 
                        (let ((state (state automata)))
                          (or (gethash state colors)
                              (setf (gethash state colors)
                                    (ccl:make-color (random 65535)
                                                    (random 65535)
                                                    (random 65535)))))
                        (ccl:fill-rect view ccl:*black-pattern* 
                                       x y (+ x size) (+ y size)))
                      (incf x whole))
                (incf y whole)))))


(defmacro cellview (auto &rest args &aux (view (gensym)) 
                         (size (gensym)))
  `(let* ((,view (make-instance 'cellview :automata ,auto ,@args))
          (,size (ccl:view-size ,view)))
(print (view-width ,view))
(print (view-height ,view))
 
     (when (< (xy-x ,size) 100)
       (ccl:set-view-position ,view
             (xy (/ (- 110 (xy-x ,size)) 2)
                 (xy-y (ccl:view-position ,view)))))
     (make-instance 'ccl:window
       :window-type :document
       :view-subviews 
       (list
        (ccl:make-dialog-item 'ccl:static-text-dialog-item
                              #@(5 5) #@(30 12) "Reps:" 'nil
                              :view-font '("geneva" 10 :srcor :plain))
        (ccl:make-dialog-item 'ccl:editable-text-dialog-item
                              #@(40 5) #@(20 12) "1"
                              nil :view-font
                              '("geneva" 10 :srcor :plain)
                              :view-nick-name :reps)
        (ccl:make-dialog-item 'ccl:button-dialog-item
                              #@(80 5) #@(20 12) "OK"
                              #'(lambda (b)
                                  (let ((v (ccl:find-named-sibling
                                            b ':cellview))
                                        (n (parse-integer
                                            (ccl:dialog-item-text
                                             (ccl:find-named-sibling
                                              b ':reps))
                                            :junk-allowed t)))
                                    (setf (slot-value v 'times) 
                                          (if (and (integerp n)
                                                   (> n 0)) n 1))
                                    (draw-automata v)))
                              :view-font '("geneva" 10 :srcor :plain)
                              :default-button t)
                              ,view)
       :view-size
       (xy (+ (max (view-width ,view ) 100) 10)
           (+ (view-height ,view) 
              (xy-y (ccl:view-position ,view))
               5)))))

) ; mcl



#|


;;; add neighbors together

(defun add-neighbors (automata index) 
  (with-states automata index ((left -1) (right 1))
    (mod (+ left right) 3)))

(cellview (make-automata '(1 0 1 ) #'add-neighbors)
          :state-colors (list ccl:*red-color*
                              ccl:*green-color*
                              ccl:*blue-color* )
          
          :columns 3 :rows 1
          :cell-size 80)


(cellview (make-automata '(1 0 2 2 0 2 1 2) #'add-neighbors)
          :state-colors (list ccl:*red-color*
                              ccl:*green-color*
                              ccl:*blue-color* )
          
          :columns 8 :rows 1
          :cell-size 80)

;;;
          :columns 20 :rows 20)
;;;
;;;  A "left shift" automata; next state is from i+1
;;;

(defun left-shift (automata index) (cell-state automata index 1))

(cellview (make-automata '(0 1 2 3) #'left-shift)
          :state-colors (list ccl:*pink-color*
                              ccl:*yellow-color*
                              ccl:*green-color*
                              ccl:*blue-color*)
          
          :columns 4 :rows 1
          :cell-size 24)

;;;
;;; Next state is i + i+1 mod 3.
;;;

(defun sum1 (automata index)
   ;; add cell value to next cell's value mod 3
  (with-states automata index ((here 0) (there 1))
    (mod (+ here there) 3)))

(cellview (make-automata '(1 0 0 2) #'sum1)
          :state-colors '(212 2078484 14485510) 
          :columns 4 :rows 1
          :cell-size 100)

(cellview (make-automata '(0 0 0 1) #'sum1)
          :state-colors '(212 2078484 14485510) 
          :columns 4 :rows 1  :cell-size 100)

(cellview (make-automata '(0 1 2 1 0) #'sum1)
          :state-colors '(212 2078484 14485510) 
          :columns 5 :rows 20)

(cellview
 (make-automata (loop repeat 40 collect (random 3))  #'sum1)
 :state-colors '(212 2078484 14485510)  ;  blue green red
 :cell-size 4)

;;;
;;; 2D automata using HGLASS rule set. 5 postions are examined,
;;; allowing up to 32 different states.
;;;

(defvar hglass 
  (vector 0 1 1 1 0 0 0 0   0 0 0 1 0 0 0 0   
          0 0 0 0 0 1 0 0   0 1 0 0 0 1 1 1)
  "lookup vector of new state.")

(defun hglass (auto index)
  "ors east, west, south and north to compute new state"
  (with-states auto index
               ((here  #.(xy 0  0))
                (east  #.(xy 1  0))
                (west  #.(xy -1  0))
                (south #.(xy 0  1))
                (north #.(xy 0 -1)))
    (svref hglass (logior (ash east 4) (ash west 3) 
                          (ash south 2) (ash north 1) 
                          here))))
;;;
;;; random first generation
;;;

(let* ((r 8) (c 8) (b (make-array (list 2 r c))))
  (loop for i below r
        do (loop for j below c 
                 do (setf (aref b 0 i j) (random 2))))
  (cellview
   (make-automata b #'hglass)
   :state-colors '(212 14485510) :rows 8 :columns 8))

;;;
;;; pretty square
;;;

(let* ((r 16) (c 16) (b (make-array (list 2 r c) :initial-element 0)))
  (loop for i from 4 to 11
        do (loop for j from 4 to 11
                 do (setf (aref b 0 i j) 1)))
  (cellview
   (make-automata b #'hglass)
   :state-colors '(212 14485510) :rows 16 :columns 16))

;;;
;;; Conway's game of Life.
;;;

(defun life (auto index)
  (with-states auto index 
               ((ul #.(xy -1 -1)) (um #.(xy 0 -1)) (ur #.(xy 1 -1)) 
                (ml #.(xy -1 0))  (me #.(xy 0 0)) (mr #.(xy 1 0))
                (ll #.(xy -1 1))  (lm #.(xy 0 1))  (lr #.(xy 1 1)))
    (let ((sum (+ ul um ur ml mr ll lm lr))) 
      (if (= me 0) ; dead cell
        (if (= sum 3) 1 0)
        (if (or (= 2 sum) (= 3 sum)) 1 0)))))

(cellview
 (make-automata '((0 0 0 0 0 0 0 0)
                  (0 0 0 1 1 0 1 0)
                  (0 0 1 0 1 0 1 0)
                  (0 0 1 1 1 0 0 0)
                  (0 1 0 0 1 1 1 0)
                  (0 1 1 1 0 0 0 0)
                  (0 0 0 1 1 0 1 0)
                  (0 0 0 0 0 0 0 0))
                #'life)
 :state-colors '(212  14485510)
 :cell-size 40 :cell-border 1  
 :rows 8 :columns 8 :times 80)

(cellview
 (make-automata (loop repeat 8 
                      collect (loop repeat 8 collect (random 2)))
                #'life)
 :state-colors '(212 14485510)
 :cell-size 7 :rows 8 :columns 8)

;;;
;;; positional rule uses 3 neighbors mod 2 for max 8 states.
;;; 

(defun 8states (auto index)
  (with-states auto index 
               ((left -1) (here 0) (right 1))
    (values (mod (1+ here) 2)
            (+ (* left 4) (* here 2) right))))

(cellview
 (make-automata '(0 1 1 0 1 0 1 1) #'8states)
 :cell-size 7 :rows 8 :columns 8
 :state-colors (list ccl:*pink-color* ccl:*purple-color* 
                     ccl:*yellow-color* ccl:*red-color*
                     ccl:*green-color*  ccl:*brown-color*
                     ccl:*blue-color* ccl:*orange-color*))

(cellview
 (make-automata (loop repeat 8 collect (random 2))
                #'8states)
 :cell-size 7 :rows 8 :columns 8
 :state-colors (list ccl:*pink-color* ccl:*purple-color* 
                     ccl:*yellow-color* ccl:*red-color*
                     ccl:*green-color*  ccl:*brown-color*
                     ccl:*blue-color* ccl:*orange-color*))
|#