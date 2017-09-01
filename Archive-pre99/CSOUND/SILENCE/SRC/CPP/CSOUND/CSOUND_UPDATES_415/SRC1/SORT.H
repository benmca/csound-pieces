#include <stdio.h>                                 /*      SORT.H */
#ifndef MYFLT
#include "sysdep.h"
#endif
#define SP ' '
#define LF '\n'

typedef struct srtblk {
	struct srtblk *nxtblk;
	struct srtblk *prvblk;
	short   insno;
	short   pcnt;
	MYFLT   p1val;
	MYFLT   p2val;
	MYFLT   p3val;
	MYFLT   newp2;
	MYFLT   newp3;
	char    preced;
	char    text[9];
} SRTBLK;

extern  SRTBLK *frstbp;
extern  int    sectcnt;
extern  FILE   *SCOREIN;
extern  FILE   *SCOREOUT;
