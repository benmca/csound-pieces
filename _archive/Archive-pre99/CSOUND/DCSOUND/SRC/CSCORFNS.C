#include "cs.h" 			/*			CSCORFNS.C	*/
#include "cscore.h"

#define TYP_FREE   0
#define TYP_EVENT  1
#define TYP_EVLIST 2
#define TYP_SPACE  3
#define WMYFLTS    4       /* extra floats for warped events */
#define NSLOTS     100     /* default slots in lcreat list   */
#define MAXALLOC   32768L

typedef struct space {
        CSHDR  h;
	struct space *nxtspace;
} SPACE;

/* RWD: moved from below for use in reset */
typedef struct {
    FILE  *scfp;
	EVENT *next;
	MYFLT until;
	int   wasend, warped;
} INFILE;
static INFILE *infiles = NULL;    /* array of infile status blks */

/* next two from defev() really */
static  EVENT  *evtmp = NULL;
static  EVTBLK *evtmpblk;

static SPACE  spaceanchor = { { NULL, NULL, TYP_SPACE, 0 }, NULL };
static CSHDR  *nxtfree = NULL;   /* fast pointer to yet unused free space */
static EVENT  *nxtevt = NULL;    /* to hold nxt infil event, PMAX pfields */
static EVTBLK *nxtevtblk;        /* cs.h EVTBLK subset of EVENT nxtevt    */
extern FILE   *scfp, *oscfp;
extern int    warped;
static int    warpout = 0;


#ifdef RESET
void cscoreRESET(void)
{
    nxtfree = nxtevt   = nxtevtblk = infiles = NULL;
    warped	 = warpout  = 0;
    evtmp   = evtmpblk = NULL;
    if (spaceanchor.nxtspace!=NULL) {
      SPACE *p = &spaceanchor;
      SPACE *n;
      while ((n = p->nxtspace) != NULL) {
        if (p != &spaceanchor) mfree(n);  /*gab 12/Jan/2001*/
        p = n;
      }
    }
}
#endif

static SPACE *morespace(void)   /* alloc large amount of memory, keep in a */
{                               /* chain. Put SPACE blk at top & init rem as */
                                /* a FREE blk */
        SPACE *space, *prvspace;
	CSHDR *free;

	prvspace = &spaceanchor;
	while ((space = prvspace->nxtspace) != NULL)
	    prvspace = space;
	space = (SPACE *) mmalloc((long) MAXALLOC);
	prvspace->nxtspace = space;
	space->nxtspace = NULL;
	space->h.prvblk = NULL;
	space->h.nxtblk = (CSHDR *) ((char *) space + sizeof(SPACE));
	space->h.type = TYP_SPACE;
	space->h.size = sizeof(SPACE);
	free = space->h.nxtblk;
	free->prvblk = (CSHDR *) space;    /* init rem as a TYP_FREE blk */
	free->nxtblk = NULL;
	free->type = TYP_FREE;
	free->size = MAXALLOC - sizeof(SPACE);
	return(space);
}

static CSHDR *getfree(int minfreesiz)
    /* search space chains for min size free blk */
    /* else alloc new space blk & reset fast free */
{
        SPACE *curspace;
	CSHDR *blkp;

	curspace = &spaceanchor;
	while ((curspace = curspace->nxtspace) != NULL) {
	    blkp = curspace->h.nxtblk;
	    do {
	        if (blkp->type == TYP_FREE && blkp->size >= minfreesiz)
		    return(blkp);
	    } while ((blkp = blkp->nxtblk) != NULL);
	}
	curspace = morespace();              /* else alloc more space, and  */
	nxtfree = curspace->h.nxtblk;        /* reset the fast free pointer */
	return(nxtfree);
}

static void csfree(CSHDR *bp)
    /* return a TYP_EVENT or TYP_EVLIST to free space */
    /* consolidate with any prev or follow free space */
{
        CSHDR *prvp, *nxtp;

        if ((prvp = bp->prvblk) != NULL && prvp->type == TYP_FREE) {
	    if ((nxtp = bp->nxtblk) != NULL && nxtp->type == TYP_FREE) {
	        if ((prvp->nxtblk = nxtp->nxtblk) != NULL)
		    nxtp->nxtblk->prvblk = prvp;
		prvp->size += bp->size + nxtp->size;
	    }
	    else {
	        if ((prvp->nxtblk = bp->nxtblk) != NULL)
		    bp->nxtblk->prvblk = prvp;
		prvp->size += bp->size;
	    }
	}
	else {
	    if ((nxtp = bp->nxtblk) != NULL && nxtp->type == TYP_FREE) {
	        if ((bp->nxtblk = nxtp->nxtblk) != NULL)
		    nxtp->nxtblk->prvblk = bp;
		bp->size += nxtp->size;
	    }
	    bp->type = TYP_FREE;
	}
}

EVLIST * lcreat(int nslots)         /* creat an array of event pointer slots */
{
        CSHDR *newblk, *newfree;
	EVLIST *a;
	int   needsiz = sizeof(EVLIST) + nslots * sizeof(EVENT *);
	int   minfreesiz = needsiz + sizeof(CSHDR);
	
        if (nxtfree != NULL && nxtfree->size >= minfreesiz)
	    newblk = nxtfree;
	else newblk = getfree(minfreesiz);
	newfree = (CSHDR *) ((char *)newblk + needsiz);
	newfree->prvblk = newblk;
	newfree->nxtblk = newblk->nxtblk;
	newfree->type = TYP_FREE;
	newfree->size = newblk->size - needsiz;
	newblk->nxtblk = newfree;
	newblk->type = TYP_EVLIST;
	newblk->size = needsiz;
	if (newblk == nxtfree)	nxtfree = newfree;
	a = (EVLIST *) newblk;
	a->nslots = nslots;
	a->nevents= 0;
	return(a);
}

EVENT * createv(int pcnt)                   /* creat a new event space */
{
        CSHDR *newblk, *newfree;
	EVENT *e;
	int   needsiz = sizeof(EVENT) + pcnt * sizeof(MYFLT);
	int   minfreesiz = needsiz + sizeof(CSHDR);
	
        if (nxtfree != NULL && nxtfree->size >= minfreesiz)
	    newblk = nxtfree;
	else newblk = getfree(minfreesiz);
	newfree = (CSHDR *) ((char *)newblk + needsiz);
	newfree->prvblk = newblk;
	newfree->nxtblk = newblk->nxtblk;
	newfree->type = TYP_FREE;
	newfree->size = newblk->size - needsiz;
	newblk->nxtblk = newfree;
	newblk->type = TYP_EVENT;
	newblk->size = needsiz;
	if (newblk == nxtfree)	nxtfree = newfree;
	e = (EVENT *) newblk;
	e->pcnt = pcnt;
	return(e);
}

EVENT * copyev(EVENT *e)                     /* make a new copy of an event */
{
	EVENT *f;
        int  n;
        MYFLT *p, *q;

	n = e->pcnt;
	f = createv(n);
	f->op = e->op;
	f->strarg = e->strarg;
	p = &e->p2orig;
	q = &f->p2orig;
	n += WMYFLTS;
	while (n--)
	    *q++ = *p++;
	return(f);
}

/* RWD: cannot addd init arg as this is a std public func */
/* Can only do reentry by moving statics outside: fortunately, */
/* names are unique */

EVENT * defev(char *s)                    /* define an event from string arg */
{
        MYFLT *p, *q;

	if (evtmp == NULL) {
	    evtmp = createv(PMAX);
	    evtmpblk = (EVTBLK *) &evtmp->strarg;
	}
	while (*s == ' ')
	    s++;
	evtmp->op = *s++;				/* read opcode */
	while (*s == ' ')
	    s++;
        p = &evtmp->p[1];
	q = &evtmp->p[PMAX];
	while (sscanf(s,"%f",p++) > 0) {		/* read pfields */
	    while (*s >= '0' && *s <= '9' || *s == '.' || *s == '-')
		s++;
	    while (*s == ' ')
		s++;
	    if (p > q && *s != '\0')  {		/* too many ? */
		p++;
		printf(Str(X_405,"PMAX exceeded, string event truncated.\n"));
		break;
	    }
	}
	evtmp->pcnt = p - &evtmp->p[1] - 1;   /* set count of params recvd */
	evtmp->p2orig = evtmp->p[2];
	evtmp->p3orig = evtmp->p[3];
	return(copyev(evtmp));                /* copy event to a new space */
}

EVENT * getev(void)                  /* get nxt event from input score buf */
{                                                 /*   and  refill the buf */
        EVENT *e;

	if (nxtevt->op != '\0')
	    e = copyev(nxtevt);
	else e = NULL;
	if (!(rdscor(nxtevtblk)))
	    nxtevt->op = '\0';
	return(e);
}

void putev(EVENT *e)                      /* put an event to cscore outfile */
{
        int  pcnt;
	MYFLT *q;
	int  c = e->op;

	if (c == 's')  warpout = 0;     /* new section:  init to non-warped */
	putc(c, oscfp);
	q = &e->p[1];
	if ((pcnt = e->pcnt)) {
	    if (pcnt--)		fprintf(oscfp," %g",*q++);
	    else goto termin;
	    if (pcnt--) {
	        if (warpout)	fprintf(oscfp," %g", e->p2orig);
				fprintf(oscfp," %g",*q++);
	    }
	    else goto termin;
	    if (pcnt--) {
	        if (warpout)	fprintf(oscfp," %g", e->p3orig);
				fprintf(oscfp," %g",*q++);
	    }
	    else goto termin;
	    while (pcnt--)
	        fprintf(oscfp," %g",*q++);
	}
termin:	putc((int)'\n', oscfp);
	if (c == 'w')  warpout = 1; /* was warp statement: sect now warped */
}

void putstr(char *s)
{
	fprintf(oscfp,"%s\n", s);
	if (*s == 's')  warpout = 0;
	else if (*s == 'w') warpout = 1;
}

static EVLIST * lexpand(EVLIST *a)
    /* expand an event list by NSLOTS more slots */
    /* copy the previous list, free up the old   */
{
        EVLIST *b;
        EVENT **p, **q;
        int n;

	b = lcreat(a->nslots + NSLOTS);
	b->nevents = n = a->nevents;
	p = &a->e[1];
	q = &b->e[1];
	while (n--)
	    *q++ = *p++;
	csfree((CSHDR *) a);
	return(b);
}

EVLIST * lappev(EVLIST *a, EVENT *e) /* append an event to a list */
{
        int  n;

	if ((n = a->nevents) == a->nslots)
	    a = lexpand(a);
	a->e[n+1] = e;
	a->nevents++;
	return(a);
}

EVLIST * lappstrev(EVLIST *a, char *s) /* append a string event to a list */
{
        EVENT *e = defev(s);
	return(lappev(a,e));
}

EVLIST * lget(void)          /* get section events from the scorefile */
{
        EVLIST *a;
        EVENT *e, **p;
	int nevents = 0;

	a = lcreat(NSLOTS);
	p = &a->e[1];
	while ((e = getev()) != NULL) {
	    if (e->op == 's' || e->op == 'e')
		break;
	    if (nevents == a->nslots) {
	        a->nevents = nevents;
	        a = lexpand(a);
		p = &a->e[nevents+1];
	    }
	    *p++ = e;
	    nevents++;
	}
	a->nevents = nevents;
	return(a);
}

static MYFLT curuntil;           /* initialized to zero by filopen */
static int   wasend;             /* ditto */

EVLIST * lgetuntil(MYFLT beatno) /* get section events from the scorefile */
{
        EVLIST *a;
        EVENT *e, **p;
	int nevents = 0;
	char op;

	a = lcreat(NSLOTS);
	p = &a->e[1];
	while ((op = nxtevt->op) == 't' || op == 'w' || op == 's' || op == 'e'
	  || op != '\0' && nxtevt->p2orig < beatno) {
	    e = getev();
	    if (e->op == 's') {
	        wasend = 1;
		break;
	    }
	    if (e->op == 'e')
		break;
	    if (nevents == a->nslots) {
	        a->nevents = nevents;
	        a = lexpand(a);
		p = &a->e[nevents+1];
	    }
	    *p++ = e;
	    nevents++;
	}
	a->nevents = nevents;
	return(a);
}

EVLIST * lgetnext(MYFLT nbeats)	/* get section events from the scorefile */
{
	if (wasend) {
	    wasend = 0;
	    curuntil = nbeats;
	}
	else curuntil += nbeats;
	return(lgetuntil(curuntil));
}

void lput(EVLIST *a)		/* put listed events to cscore output */
{
        EVENT **p;
	int  n;

	n = a->nevents;
	p = &a->e[1];
	while (n--)
	    putev(*p++);
}

EVLIST * lcopy(EVLIST *a)
{
	EVLIST *b;
        EVENT **p, **q;
        int  n = a->nevents;

	b = lcreat(n);
	b->nevents = n;
	p = &a->e[1];
	q = &b->e[1];
	while (n--)
	    *q++ = *p++;
	return(b);
}

EVLIST * lcopyev(EVLIST *a)
{
	EVLIST *b;
	EVENT **p, **q;
	int  n = a->nevents;

	b = lcreat(n);
	b->nevents = n;
	p = &a->e[1];
	q = &b->e[1];
	while (n--)
	    *q++ = copyev(*p++);
	return(b);
}

EVLIST * lcat(EVLIST *a, EVLIST *b)
{
        EVENT **p, **q;
        int i, j;

	i = a->nevents;
	j = b->nevents;
	if (i + j >= a->nslots) {
	    EVLIST *c;
	    int n = i;
	    c = lcreat(i+j);
	    p = &a->e[1];
	    q = &c->e[1];
	    while (n--)
		*q++ = *p++;
	    csfree((CSHDR *) a);
	    a = c;
	}
	a->nevents = i+j;
	p = &a->e[i+1];
	q = &b->e[1];
	while (j--)
	    *p++ = *q++;
	return(a);
}

void lsort(EVLIST *a)	/* put evlist pointers into chronological order */
{
	EVENT **p, **q;
        EVENT *e, *f;
	int  n, gap, i, j;

	n = a->nevents;
	e = a->e[n];
	if (e->op == 's' || e->op == 'e')
	    --n;
	for (gap = n/2;  gap > 0;  gap /=2)
	    for (i = gap;  i < n;  i++)
		for (j = i-gap;  j >= 0;  j -= gap) {
		    p = &a->e[j+1];     e = *p;
		    q = &a->e[j+1+gap]; f = *q;
		    if (e->op == 'w')
		        break;
		    if (e->p[2] < f->p[2])
			break;
		    if (e->p[2] == f->p[2]) {
			if (e->op == f->op) {
			    if (e->op == 'f')
				break;
			    if (e->p[1] < f->p[1])
				break;
			    if (e->p[1] == f->p[1])
				if (e->p[3] <= f->p[3])
				    break;
			}
			else if (e->op < f->op)
			    break;
		    }
                    *p = f;  *q = e;         
		}
}

EVLIST * lxins(EVLIST *a, char *s) /* list extract by instr numbers */
{
	int  x[5], xcnt;
        int xn, *xp, insno, n;
	EVENT **p, **q, *e;
	EVLIST *b, *c;

	xcnt = sscanf(s,"%d%d%d%d%d",&x[0],&x[1],&x[2],&x[3],&x[4]);
	n = a->nevents;
	b = lcreat(n);
	p = &a->e[1];
	q = &b->e[1];
	while ((n--) && (e = *p++) != NULL) {
	    if (e->op != 'i')
		*q++ = e;
	    else {
		insno = (int)e->p[1];
		xn = xcnt;  xp = x;
		while (xn--)
		    if (*xp++ == insno) {
			*q++ = e;
			break;
		    }
	    }    
	}
	c = lcopy(b);
	csfree((CSHDR *) b);
        return(c);
}

EVLIST * lxtimev(EVLIST *a, MYFLT from, MYFLT to) /* list extract by time */
{
        EVENT **p, **q, *e;
	EVLIST *b, *c;
	MYFLT maxp3;
	int  n;

	n = a->nevents;
	b = lcreat(n);
	p = &a->e[1];
	q = &b->e[1];
	maxp3 = to - from;
	while ((n--) && (e = *p++) != NULL)
	    switch (e->op) {
	    case 'f':
		    if (e->p[2] < to) {
			*q++ = e = copyev(e);
			if (e->p[2] <= from)
			    e->p[2] = FL(0.0);
			else e->p[2] -= from;
		    }
		    break;
	    case 'i':
		    if (e->p[2] < from) {
			if (e->p[2] + e->p[3] > from) {
			    *q++ = e = copyev(e);
			    e->p[3] -= from - e->p[2];
			    e->p[2] = FL(0.0);
			    if (e->p[3] > maxp3)
				e->p[3] = maxp3;
			}
		    }
		    else if (e->p[2] < to) {
			*q++ = e = copyev(e);
			if (e->p[2] + e->p[3] > to)
			    e->p[3] = to - e->p[2];
			e->p[2] -= from;
		    }
		    break;
	    default:
		    *q++ = copyev(e);
		    break;
	    }
	c = lcopy(b);
	csfree((CSHDR *) b);
	return(c);
}

static void 
fp2chk(EVLIST *a, char *s) /* look for f statements with non-0 p[2] */
{
        EVENT *e, **ep = &a->e[1];
        int n = a->nevents, count = 0;

	while (n--)
	    if ((e = *ep++) && e->op == 'f' && e->p[2] != 0.)
	        count++;
	if (count)
	    printf(Str(X_53,"%s found %d f event%s with non-zero p2\n"),
		   s, count, count==1 ? "" : Str(X_1172,"s"));
}

EVLIST * lsepf(EVLIST *a)	/* separate f events from evlist */
{
	EVLIST *b, *c;
        EVENT **p, **q, **r;
        int   n;

	n = a->nevents;
	b = lcreat(n);
	p = q = &a->e[1];
	r = &b->e[1];
	while (n--) {
	    if ((*p)->op == 'f')
		*r++ = *p++;
	    else *q++ = *p++;
	}
	a->nevents = q - &a->e[1];
	b->nevents = r - &b->e[1];
	c = lcopy(b);
	csfree((CSHDR *) b);
	fp2chk(c,"lsepf");
	return(c);
}

EVLIST * lseptwf(EVLIST *a)	/* separate t,w,f events from evlist */
{
	EVLIST *b, *c;
        EVENT **p, **q, **r;
        int   n, op;

	n = a->nevents;
	b = lcreat(n);
	p = q = &a->e[1];
	r = &b->e[1];
	while (n--) {
	    if ((op = (*p)->op) == 't' || op == 'w' || op == 'f')
		*r++ = *p++;
	    else *q++ = *p++;
	}
	a->nevents = q - &a->e[1];
	b->nevents = r - &b->e[1];
	c = lcopy(b);
	csfree((CSHDR *) b);
	fp2chk(c,"lseptwf");
	return(c);
}

void relev(EVENT *e)		/* give back event space */
{
	csfree((CSHDR *) e);
}

void lrel(EVLIST *a) 			/* give back list space */
{
	csfree((CSHDR *) a);
}

void lrelev(EVLIST *a)		/* give back list and its event spaces */
{
        EVENT **p = &a->e[1];
	int  n = a->nevents;

	while (n--)
	    csfree((CSHDR *) *p++);
	csfree((CSHDR *) a);
}

#define MAXOPEN 5

static void savinfdata(		/* store input file data */
  FILE  *fp,
  EVENT *next,
  MYFLT until,
  int   wasend,
  int   warp)
{
	INFILE *infp;
	int    n;

	if ((infp = infiles) == NULL) {
	    infp = infiles = (INFILE *) mcalloc((long)MAXOPEN * sizeof(INFILE));
	    goto save;
	}
	for (n = MAXOPEN; n--; infp++)
	    if (infp->scfp == fp)
		goto save;
	for (infp = infiles, n = MAXOPEN; n--; infp++)
	    if (infp->scfp == NULL)
		goto save;
	printf(Str(X_1288,"too many input files open\n"));
	exit(0);

save:   infp->scfp = fp;
	infp->next = next;
	infp->until = until;
	infp->wasend = wasend;
	infp->warped = warp;
}

static void makecurrent(FILE *fp)
				/* make fp the cur scfp & retreive other data */
				/* set nxtevtblk to subset cs.h EVTBLK struct */
{				/* if nxtevt buffer is empty, read one event  */
	INFILE *infp;
	int    n;

	if ((infp = infiles) != NULL)
	    for (n = MAXOPEN; n--; infp++)
	        if (infp->scfp == fp) {
		    scfp = fp;
		    nxtevt = infp->next;
		    nxtevtblk = (EVTBLK *) &nxtevt->strarg;
		    curuntil = infp->until;
		    wasend = infp->wasend;
		    warped = infp->warped;
		    if (nxtevt->op == '\0')
		        if (!(rdscor(nxtevtblk)))
			    nxtevt->op = '\0';
		    return;
		}
	printf(Str(X_986,"makecurrent: fp not recorded\n"));
	exit(0);
}

void cscorinit(void)		/* verify initial scfp, init other data */
{				/* record & make all this current       */
	EVENT *next;

	if (scfp == NULL) {
	    printf(Str(X_677,"cscorinit: scorin not yet open"));
	    exit(0);
	}
	next = createv(PMAX);              /* creat EVENT blk receiving buf */
	savinfdata(scfp, next, FL(0.0), 1, 0);/* curuntil 0, wasend, non-warp  */
	makecurrent(scfp);                 /* make all this current         */
}

FILE *filopen(char *name)	/* open new cscore input file, init data */
				/* & save;  no rdscor until made current */
{
        FILE *fp;
	EVENT *next;

	if ((fp = fopen(name, "r")) == NULL) {
	    printf(Str(X_722,"error in opening %s\n"), name);
	    exit(0);
	}
	next = createv(PMAX);             /* alloc a receiving evtblk     */
	savinfdata(fp, next, FL(0.0), 1, 0); /* save all, wasend, non-warped */
	return(fp);
}

void filclose(FILE *fp)
{
	INFILE *infp;
	int n;

	if (fp == NULL) {
	    printf(Str(X_762,"filclose: NULL file pointer\n"));
	    return;
	}
	if ((infp = infiles) != NULL)
	    for (n = MAXOPEN; n--; infp++)
	        if (infp->scfp == fp) {
		    infp->scfp = NULL;
		    mfree((char *)infp->next);
		    fclose(fp);
		    if (scfp == fp) scfp = NULL;
		    return;
		}
	printf(Str(X_763,"filclose: fp not recorded\n"));
}

FILE *getcurfp(void)
{
        if (scfp == NULL) {
	    printf(Str(X_796,"getcurfp: no fp current\n"));
	    exit(0);
	}
        return(scfp);
}

void setcurfp(FILE *fp)         /* save the current infil states */
				/* make fp & its states current  */
{
        if (scfp != NULL)
	    savinfdata(scfp, nxtevt, curuntil, wasend, warped);
	makecurrent(fp);
}
