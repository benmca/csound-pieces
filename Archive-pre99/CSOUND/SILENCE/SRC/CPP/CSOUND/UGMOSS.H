                                                         /* ugmoss.h */

                                                         /* ugmoss.h */

typedef struct {
  OPDS                  h;
  MYFLT                 *ar, *ain, *isize, *ifn;
  MYFLT                 *curp;
  FUNC                  *ftp;
  AUXCH                 sigbuf;
  unsigned int  len;
} DCONV;

typedef struct {
  OPDS                  h;
  MYFLT                 *ar, *asig, *krvt, *klpt, *imaxlpt, *istor, *insmps;
  MYFLT                 g, rvt, lpt, *pntr;
  AUXCH                 auxch;
} VCOMB;

typedef struct {
  OPDS                  h;
  MYFLT                 *kftndx, *iftfn, *iresfn;
  FUNC                  *ftfn, *resfn;
  MYFLT                 ftndx;
  unsigned int  len;
} FTMORF;

/* end ugmoss.h */
