                                                /*  USTUB.H  */

/* header and dummy global references for main.c stub in  */
/* standalone versions of hetro, lpanal, pvanal, sndinfo  */

OPARMS O;                              /* dummy global resolving */
int nchnls, ksmps;                     /*  for references unused */
MYFLT esr;
FILE* dribble = NULL;
int strsmax = 0;
MYFLT maxamp[MAXCHNLS];
MYFLT smaxamp[MAXCHNLS];
MYFLT omaxamp[MAXCHNLS];
EVTBLK *currevent;
int peakchunks;

void fdrecord(FDCH *fdchp) {}
void initerror(char *s) {}
void sndwrterr(int n, int nput) {}

