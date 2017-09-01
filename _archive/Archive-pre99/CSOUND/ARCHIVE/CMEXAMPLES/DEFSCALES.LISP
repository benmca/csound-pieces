(in-package :stella)

;;;
;;; This file contains defscale examples of various types of scales. I
;;; didn't bother to define a 00 octave in any of them. See dictionary
;;; and the scales.lisp implementation file for more information.


;;; Pythagorian-Chromatic, Mean-Tone and Just-Tone are taken from
;;; "Musical Acoustics", 2nd ed, Donald Hall, Brooks/Cole pub.

(defscale pythagorian-chromatic
          (:lowest-pitch 16.351597  :octave-ratio (cents 1200)
           :number-of-octaves 10
           :suboctave-enharmonic 'bs :superoctave-enharmonic 'cf)
  ((c cn bs) :scaler (cents 0))
  ((cs df) :scaler (cents 114))
  ((d cn) :scaler (cents 204))
  ((ds ef) :scaler (cents 294))
  ((e en ff) :scaler (cents 408))
  ((f fn es) :scaler (cents 498))
  ((fs gf) :scaler (cents 612))
  ((g gn) :scaler (cents 702))
  ((gs af) :scaler (cents 816)) 
  ((a an) :scaler (cents 906)) 
  ((as bf) :scaler (cents 996)) 
  ((b bn cf) :scaler (cents 1110)) 
  )

(defscale mean-tone 
          (:lowest-pitch 16.351597  :octave-ratio (cents 1200)
           :number-of-octaves 10
           :suboctave-enharmonic 'bs :superoctave-enharmonic 'cf)
  ((c cn bs) :scaler (cents 0))
  ((cs df) :scaler (cents 76))
  ((d cn) :scaler (cents 193))
  ((ds ef) :scaler (cents 310))
  ((e en ff) :scaler (cents 386))
  ((f fn es) :scaler (cents 503))
  ((fs gf) :scaler (cents 579))
  ((g gn) :scaler (cents 697))
  ((gs af) :scaler (cents 773)) 
  ((a an) :scaler (cents 890)) 
  ((as bf) :scaler (cents 1007)) 
  ((b bn cf) :scaler (cents 1083)) 
  )

(defscale just-tone 
          (:lowest-pitch 16.351597  :octave-ratio (cents 1200)
           :number-of-octaves 10
           :suboctave-enharmonic 'bs :superoctave-enharmonic 'cf)
  ((c cn bs) :scaler (cents 0))
  ((cs df) :scaler (cents 92))
  ((d cn) :scaler (cents 182))
  ((ds ef) :scaler (cents 294))
  ((e en ff) :scaler (cents 386))
  ((f fn es) :scaler (cents 498))
  ((fs gf) :scaler (cents 590))
  ((g gn) :scaler (cents 702))
  ((gs af) :scaler (cents 792)) 
  ((a an) :scaler (cents 884)) 
  ((as bf) :scaler (cents 996)) 
  ((b bn cf) :scaler (cents 1088)) 
  )

;;;
;;; Chromatic and diatonic versions of the Bohlen-Pierce scale. Taken
;;; from "Current Directions in Computer Music Research", Mathews and 
;;; Pierce ed. MIT Press.
;;;

(defscale bp-chromatic
          (:lowest-pitch 16.351597 :octave-ratio 3.0
           :number-of-octaves 10)
  a b c d e f g h i j k l m)       ; call 'em whatever you want!

(defscale bp-diatonic
          (:lowest-pitch 16.351597 :octave-ratio 3
           :number-of-octaves 10)
  (i    :scaler (expt 3 0))
  (ii   :scaler (expt 3 1/13))
  (iii  :scaler (expt 3 3/13))
  (iv   :scaler (expt 3 4/13))
  (v    :scaler (expt 3 6/13))
  (vi   :scaler (expt 3 7/13))
  (vii  :scaler (expt 3 9/13))
  (viii :scaler (expt 3 10/13))
  (ix   :scaler (expt 3 12/13))
  )

;;;
;;; Quarter-Tone uses "qs" and "qf" as the 1/4 suffixes and I didnt bother
;;;  to invent enharmonic spellings.
;;;

(defscale quarter-tone
          (:lowest-pitch 16.351597  :octave-ratio (cents 1200)
           :number-of-octaves 10)
  (c cn) cqs (cs df) dqf (d dn) dqs (ds ef) eqf
  (e en ff) (eqs fqf) (f fn es) fqs (fs gf) gqf (g gn) gqs 
  (gs af) aqf (a an) aqs (as bf) bqf (b bn) bqs)


;;;
;;; Stretched-Chromatic has "mistuned" octaves ie, the :octave-ratio is
;;; 1300 cents (minor 9th) instead of the normal 1200.
;;;

(defscale stretched-chromatic
          (:lowest-pitch 16.351597 :octave-ratio (cents 1300)
           :number-of-octaves 10
           :suboctave-enharmonic 'bs :superoctave-enharmonic 'cf)
  (c cn bs)
  (cs df)
  (d cn)
  (ds ef)
  (e en ff)
  (f fn es)
  (fs gf)
  (g gn)
  (gs af) 
  (a an)
  (as bf) 
  (b bn cf) 
  )

;;;
;;; Slendro and Pelog are general scales with no fixed relationship between
;;; octave or interval. Maybe I should disallow the notion of "octave" in
;;; these types of scales alltogether. Taken from "Music Cultures of the
;;; Pacific, the Near East and Asia". William Malm, Prentice Hall.
;;;

(defscale slendro 
          (:lowest-pitch 220.0 :number-of-octaves 3 :divisions-per-octave 5
           :octave-ratio nil)
  (nem :scaler (cents 0))
  (barang :scaler (cents 218))
  (gulu :scaler (cents 473))
  (dada :scaler (cents 721))
  (lima :scaler (cents 954))

  (nem :scaler (cents 1213))
  (barang :scaler (cents 1458))
  (gulu :scaler (cents 1695))
  (dada :scaler (cents 1929))
  (lima :scaler (cents 2174))

  (nem :scaler (cents 2441))       ; incomplete 3rd octave.
  )

(defscale pelog 
          (:lowest-pitch 220.0 :number-of-octaves 3 :divisions-per-octave 5
           :octave-ratio nil)
  (nem :scaler (cents 0))
  (barang :scaler (cents 125))
  (bem :scaler (cents 266))
  (gulu :scaler (cents 563))
  (dada :scaler (cents 676))
  (pelog :scaler (cents 800))
  (lima :scaler (cents 965))

  (nem :scaler (cents 1220))
  (barang :scaler (cents 1360))
  (bem :scaler (cents 1503))
  (gulu :scaler (cents 1778))
  (dada :scaler (cents 1905))
  (pelog :scaler (cents 2021))
  (lima :scaler (cents 2225))

  (nem :scaler (cents 2447))       ; incomplete 3rd octave.
  )

