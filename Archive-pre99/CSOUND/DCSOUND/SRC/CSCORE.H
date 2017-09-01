#include <stdio.h>                     /*             CSCORE.H     */

#ifndef MYFLT
#include "sysdep.h"
#endif

typedef struct cshdr {
        struct cshdr *prvblk;
	struct cshdr *nxtblk;
	short  type;
	short  size;
} CSHDR;

typedef struct {
        CSHDR h;
	char  *strarg;
	char  op;
	short pcnt;
	MYFLT p2orig;
	MYFLT p3orig;
	MYFLT offtim;
	MYFLT p[1];
} EVENT;

typedef struct {
        CSHDR h;
	int   nslots;
	int   nevents;
	EVENT *e[1];
} EVLIST;

EVENT  *createv(int), *defev(char*), *getev(void), *copyev(EVENT*);
EVLIST *lcreat(int), *lappev(EVLIST*,EVENT*), *lappstrev(EVLIST*,char*);
EVLIST *lget(void), *lgetnext(MYFLT), *lgetuntil(MYFLT), *lcopy(EVLIST*);
EVLIST *lcopyev(EVLIST*), *lxins(EVLIST*,char*), *lxtimev(EVLIST*,MYFLT,MYFLT);
EVLIST *lsepf(EVLIST*), *lseptwf(EVLIST*), *lcat(EVLIST*,EVLIST*);
void putstr(char*), putev(EVENT*), relev(EVENT*), lput(EVLIST*);
void lsort(EVLIST*), lrel(EVLIST*), lrelev(EVLIST*), lplay(EVLIST*);
FILE *filopen(char*), *getcurfp(void);
void filclose(FILE*), setcurfp(FILE*);
