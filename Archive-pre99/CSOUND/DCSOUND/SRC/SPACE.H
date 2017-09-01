
/******************************************/
/* The applications in this file were     */
/* designed and coded by Richard Karpen   */
/* University of Washington, Seattle 1998 */
/******************************************/


typedef	struct {
  OPDS	h;
  MYFLT	*r1, *r2, *r3, *r4, *asig,*ifn, *time, *reverbamount, *kx, *ky;
  MYFLT  ch1, ch2, ch3, ch4;
  FUNC   *ftp;
  AUXCH   auxch;
  MYFLT	*rrev1, *rrev2, *rrev3, *rrev4;
} SPACE;

typedef	struct {
  OPDS	h;
  MYFLT	*r1, *r2, *r3, *r4;
  SPACE *space;
} SPSEND;

typedef	struct {
  OPDS	h;
  MYFLT	*r, *ifn, *time, *kx, *ky;
  FUNC	*ftp;
} SPDIST;

