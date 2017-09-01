/*    LOCSIG.H	*/

/******************************************/
/* The applications in this file were     */
/* designed and coded by Richard Karpen   */
/* University of Washington, Seattle 1998 */
/******************************************/


typedef	struct {
  OPDS	h;
  MYFLT	*r1, *r2, *r3, *r4, *asig, *degree, *distance, *reverbamount;
  MYFLT  prev_degree, prev_distance, distr, distrsq;
  MYFLT  ch1, ch2, ch3, ch4;
  AUXCH   auxch;
  MYFLT	*rrev1, *rrev2, *rrev3, *rrev4;
} LOCSIG;

typedef	struct {
  OPDS	h;
  MYFLT	*r1, *r2, *r3, *r4;
  LOCSIG *locsig;
} LOCSEND;

