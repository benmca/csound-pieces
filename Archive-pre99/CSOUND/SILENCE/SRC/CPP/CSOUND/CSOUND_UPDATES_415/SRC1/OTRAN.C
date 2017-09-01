#include "cs.h"			/*				OTRAN.C	*/
#include "oload.h"
#include <math.h>
#include <string.h>
#include "pstream.h"

static struct namepool {
    NAME		*names;
    NAME		*nxtslot;
    NAME		*namlim;
    struct namepool	*next;
} gbl, lcl;
static	int	gblsize = GNAMES, lclsize = LNAMES;
static	ARGLST	*nullist;
static	ARGOFFS	*nulloffs;
static  short   lclkcnt, lcldcnt, lclwcnt, lclfixed;
static	short	lclpcnt, lclnxtpcnt;
static	short	lclnxtkcnt, lclnxtdcnt, lclnxtwcnt, lclnxtacnt;
static	short	gblnxtkcnt = 0, gblnxtacnt = 0, gblfixed, gblacount;
static	short	*nxtargoffp, *argofflim, lclpmax;
static	char	*strargspace, *strargptr;
static	long	poolcount, strargsize = 0, argoffsize;
static  int	nconsts;
	int	tran_nchnls = DFLT_NCHNLS;  /* used by rdorch  */
static	int	displop1, displop2, displop3, displop4;

extern	MYFLT	*pool;
extern	short	*argoffspace;
extern	OPARMS	O;

static	int	gexist(char *), gbloffndx(char *), lcloffndx(char *);
static  int	constndx(char *);
static	void	insprep(INSTRTXT *), lgbuild(char *);
#define txtcpy(a,b) memcpy(a,b,sizeof(TEXT));
static	void	gblnamset(char *);
static	short	plgndx(char *);
static  NAME    *lclnamset(char *);
void	putop(TEXT*), putstrg(char *);
short   	nlabels = NLABELS;
short   	ngotos = NGOTOS;


extern	INSTRTXT **instrtxtp, instxtanchor;
extern	void	rdorchfile(void);
extern	int	getopnum(char *);
extern	OENTRY	*opcodlst;

#define KTYPE   1
#define DTYPE   2
#define WTYPE   3
#define ATYPE   4
#define Dfloats (sizeof(DOWNDAT)/sizeof(MYFLT))
#define Wfloats (sizeof(SPECDAT)/sizeof(MYFLT))
#define PTYPE   5
#define Pfloats (sizeof(PVSDAT) / sizeof(MYFLT))

#ifdef RESET
void tranRESET(void)
{
    gblsize     = GNAMES;
    lclsize     = LNAMES;
    nullist     = nulloffs = NULL;
    nxtargoffp  = argofflim = NULL;
    strargspace = strargptr = NULL;
    gblnxtkcnt  = 0;
    gblnxtacnt  = 0;
    strargsize  = 0L;
    tran_nchnls = DFLT_NCHNLS;
    nlabels     = NLABELS;
}
#endif

void otran(void)
{
    TEXT        *tp, *getoptxt(int *);
    int		init = 1;
    INSTRTXT *ip;
    INSTRTXT *prvinstxt = &instxtanchor;
    OPTXT	*bp, *prvbp;
    ARGLST	*alp;
    char	*s;
    long	pmax, nn;
    long	n, opdstot, count, sumcount, instxtcount, optxtcount;

    gbl.names  = (NAME *)mmalloc((long)(GNAMES*sizeof(NAME)));
    gbl.namlim = gbl.names + GNAMES;
    gbl.nxtslot = gbl.names;
    gbl.next = NULL;
    lcl.names = (NAME *)mmalloc((long)(LNAMES*sizeof(NAME)));
    lcl.namlim = lcl.names + LNAMES;
    lcl.next = NULL;
    instrtxtp = (INSTRTXT **)mcalloc((long)((1+maxinsno)*sizeof(INSTRTXT*)));

    gblnamset("sr");		/* enter global reserved words */
    gblnamset("kr");
    gblnamset("ksmps");
    gblnamset("nchnls");
    gblnamset("$sr");		/* incl command-line overrides */
    gblnamset("$kr");
    gblnamset("$ksmps");

    displop1 = getopnum("print");	/* opnums that need "signal name" */
    displop2 = getopnum("display");
    displop3 = getopnum("dispfft");
    displop4 = getopnum("specdisp");

    rdorchfile();				/* go read orch file	*/
    while ((tp = getoptxt(&init)) != NULL) {	/*   then for each opcode: */
        unsigned int threads;
	int opnum = tp->opnum;
	switch(opnum) {
	case INSTR:
	    ip = (INSTRTXT *) mcalloc((long)sizeof(INSTRTXT));
	    prvinstxt = prvinstxt->nxtinstxt = ip;
	    txtcpy((char *)&ip->t,(char *)tp);
	    prvbp = (OPTXT *) ip;		/* begin an optxt chain */
	    alp = ip->t.inlist;
	    if (sscanf(alp->arg[0], "%ld", &n) && n)
		putop(&ip->t);		/* print, except i0 */
	    for (nn = alp->count; nn>0; ) {
	        int i;
		s = alp->arg[--nn];	/* log all insnos */
		if (!(sscanf(s, "%ld", &n)) || n > maxinsno) {
                  int old_maxinsno = maxinsno;
		  while (n>maxinsno) maxinsno += MAXINSNO; /* Expand */
/* 		  err_printf(Str(X_266,"Extending instr number from %d to %d\n"), old_maxinsno, maxinsno); */
		  instrtxtp = (INSTRTXT**)
		    mrealloc(instrtxtp,
			     (long)((1+maxinsno)*sizeof(INSTRTXT*)));
				/* Array expected to be nulled so.... */
		  for (i=old_maxinsno; i<maxinsno; i++) instrtxtp[i]=NULL;
		}
		else if (n<0) {
		    synterr(Str(X_860,"illegal instr number"));
		    continue;
		}
		if (instrtxtp[n] != NULL) {
		    sprintf(errmsg,Str(X_935,"instr %ld redefined"),n);
		    synterr(errmsg);
		}
		instrtxtp[n] = ip;
	    }
	    lcl.nxtslot = lcl.names;	/* clear lcl namlist */
	    if (lcl.next) {
		struct namepool *lll = lcl.next;
		lcl.next = NULL;
		while (lll) {
		    struct namepool *n = lll->next;
		    mfree(lll->names);
		    mfree(lll);
		    lll = n;
		}
	    }
	    lclnxtkcnt = lclnxtdcnt = 0;	/*   for rebuilding  */
	    lclnxtwcnt = lclnxtacnt = 0;
	    lclnxtpcnt = 0;
	    opdstot = 0;
            threads = 0;
	    pmax = 3L;			/* set minimum pflds */
	    break;
	case ENDIN:
	    bp = (OPTXT *) mcalloc((long)sizeof(OPTXT));
	    txtcpy((char *)&bp->t, (char *)tp);
	    prvbp->nxtop = bp;
	    bp->nxtop = NULL;	/* terminate the optxt chain */
	    VMSG( { putop(&bp->t);
			printf("pmax %ld, kcnt %d, dcnt %d, wcnt %d, acnt %d pcnt %d\n",
				pmax,lclnxtkcnt,lclnxtdcnt,lclnxtwcnt,lclnxtacnt,lclnxtpcnt); } )
	    ip->pmax = (short)pmax;
#ifdef __alpha__
	    /*
	     * On Alpha we need to align at 2*sizeof(float) (i.e. 64 bits).
	     * So we round up.  heh 981101
	     */
	    ip->pextrab = ((n = pmax-3L) > 0) ?
	      (short)((n + 1) & ~0x1)*sizeof(MYFLT) : 0;
#else
 	    ip->pextrab = ((n = pmax-3L) > 0) ? (short)n*sizeof(MYFLT) : 0;
#endif
            ip->mdepends = threads >> 4;
	    ip->lclkcnt = lclnxtkcnt;
	    ip->lcldcnt = lclnxtdcnt;
	    ip->lclwcnt = lclnxtwcnt;
	    ip->lclacnt = lclnxtacnt;
	    ip->lclfixed = lclnxtkcnt + lclnxtdcnt * Dfloats
		                      + lclnxtwcnt * Wfloats;
	    ip->lclpcnt  = lclnxtpcnt;
            ip->lclfixed = lclnxtkcnt + lclnxtdcnt * Dfloats
				      + lclnxtwcnt * Wfloats
				      + lclnxtpcnt * Pfloats;
	    ip->opdstot = opdstot;		/* store total opds reqd */
            n = -1;             /* No longer in an instrument */
	    break;
	default:
	    bp = (OPTXT *) mcalloc((long)sizeof(OPTXT));
	    txtcpy((char *)&bp->t,(char *)tp);
	    prvbp = prvbp->nxtop = bp;	/* link into optxt chain */
            threads |= opcodlst[opnum].thread;
	    opdstot += opcodlst[opnum].dsblksiz;        /* sum opds's */
	    VMSG( putop(&bp->t); )
	    if (opnum == displop1)			/* display op arg ? */
		for (alp=bp->t.inlist, nn=alp->count; nn>0; ) {
		    s = alp->arg[--nn];
		    strargsize += (long)strlen(s) +  1L;/* sum the chars */
		}
	    if (opnum == displop2 || opnum == displop3 || opnum == displop4) {
		alp=bp->t.inlist;
		s = alp->arg[0];
		strargsize += (long)strlen(s) + 1L;
	    }
	    for (alp=bp->t.inlist, nn=alp->count; nn>0; ) {
		s = alp->arg[--nn];
		if (*s == '"') {			/* "string" arg ? */
		    strargsize += (long)strlen(s) - 1L;	/* sum real chars */
		    continue;
		}
		if ((n = pnum(s)) >= 0)
		    { if (n > pmax)  pmax = n; }
		else lgbuild(s);
	    }
	    for (alp=bp->t.outlist, nn=alp->count; nn>0; ) {
		s = alp->arg[--nn];
		if ((n = pnum(s)) >= 0)
		    { if (n > pmax)  pmax = n; }
		else lgbuild(s);
		if (!nn && bp->t.opcod[1] == '_'	/* rsvd glbal = n ? */
		    && strcmp(bp->t.opcod,"=_r")==0) {	/*  (assume const)  */
		    MYFLT constval = pool[constndx(bp->t.inlist->arg[0])];
		    if (strcmp(s,"nchnls") == 0)
			tran_nchnls = (int)constval;
		}
	    }
            n = 0;              /* Mark as unfinished */
	    break;
	}
    }
    if (n != -1) synterr(Str(X_348,"Missing endin"));

    ip = instxtanchor.nxtinstxt;
    bp = (OPTXT *) ip;
    while (bp != (OPTXT *) NULL && (bp = bp->nxtop) != NULL) {	/* chk instr 0 for illegal perfs */
	int thread, opnum = bp->t.opnum;
	if (opnum == ENDIN) break;
	if (opnum == LABEL || opnum == STRSET) continue;
	if ((thread = opcodlst[opnum].thread) & 06
	    || !thread && bp->t.pftype != 'b')
	    synterr(Str(X_1124,"perf-pass statements illegal in header blk"));
    }
    if (synterrcnt) {
	printf(Str(X_38,"%d syntax errors in orchestra.  compilation invalid\n"),
	       synterrcnt);
	exit(1);
    }
    VMSG(printf("poolcount = %ld, strargsize = %ld\n",
		poolcount,strargsize); )
    VMSG( { long n; MYFLT *p;
	    printf("pool:");
	    for (n = poolcount, p = pool; n--; p++)
		printf("\t%g", *p);
            printf("\n");  } )
    gblfixed = gblnxtkcnt;
    gblacount = gblnxtacnt;

    if (strargsize) {
	strargspace = mcalloc((long)strargsize);
	strargptr = strargspace;
    }
    ip = &instxtanchor;
    for (sumcount = 0; (ip = ip->nxtinstxt) != NULL; ) {/* for each instxt */
	OPTXT *optxt = (OPTXT *) ip;
	int optxtcount = 0;
	while ((optxt = optxt->nxtop) != NULL) {/* for each op in instr  */
	    TEXT *ttp = &optxt->t;
	    optxtcount += 1;
	    if (ttp->opnum == ENDIN) break;	/*    (until ENDIN)      */
	    if ((count = ttp->inlist->count)!=0)
		sumcount += count +1;		/* count the non-nullist */
	    if ((count = ttp->outlist->count)!=0)	/* slots in all arglists */
		sumcount += count +1;
	}
	ip->optxtcount = optxtcount;		/* optxts in this instxt */
    }
    argoffsize = (sumcount + 1) * sizeof(short);/* alloc all plus 1 null */
    argoffspace = (short *) mmalloc((long)argoffsize);   /* as argoff shorts */
    nxtargoffp = argoffspace;
    nulloffs = (ARGOFFS *) argoffspace;    	/* setup the null argoff */
    *nxtargoffp++ = 0;
    argofflim = nxtargoffp + sumcount;
    ip = &instxtanchor;
    while ((ip = ip->nxtinstxt) != NULL)	/* add all other entries */
	insprep(ip);				/*   as combined offsets */
    VMSG( { short *p = argoffspace;
	    printf("argoff array:\n");
	    do printf("\t%d", *p++);
	    while (p < argofflim);
	    printf("\n");	} )
    if (nxtargoffp != argofflim)
	die(Str(X_901,"inconsistent argoff sumcount"));
    if (strargsize && strargptr != strargspace + strargsize)
	die(Str(X_904,"inconsistent strarg sizecount"));

    ip = &instxtanchor;				/* set the OPARMS values */
    instxtcount = optxtcount = 0;
    while ((ip = ip->nxtinstxt) != NULL) {
	instxtcount += 1;
	optxtcount += ip->optxtcount;
    }
    O.instxtcount = instxtcount;
    O.optxtsize = instxtcount * sizeof(INSTRTXT)
	+ optxtcount * sizeof(OPTXT);
    O.poolcount = poolcount;
    O.gblfixed = gblnxtkcnt;
    O.gblacount = gblnxtacnt;
    O.argoffsize = argoffsize;
    O.argoffspace = (char *)argoffspace;
    O.strargsize = strargsize;
    O.strargspace = strargspace;
}

static void insprep(INSTRTXT *tp) /* prep an instr template for efficient */
				  /* allocs repl arg refs by offset ndx to */
				  /* lcl/gbl space */
{
    OPTXT	*optxt;
    OENTRY	*ep;
    int		n, opnum, inreqd;
    char	**argp;
    char	**labels, **lblsp;
    LBLARG	*larg, *largp;
    ARGLST	*outlist, *inlist;
    ARGOFFS 	*outoffs, *inoffs;
    short	indx, *ndxp;

    labels = (char **)mmalloc((nlabels) * sizeof(char *));
    lblsp = labels;
    larg = (LBLARG *)mmalloc((ngotos = NGOTOS) * sizeof(LBLARG));
    largp = larg;
    lclkcnt = tp->lclkcnt;
    lcldcnt = tp->lcldcnt;
    lclwcnt = tp->lclwcnt;
    lclfixed = tp->lclfixed;
    lclpcnt  = tp->lclpcnt;
    lcl.nxtslot = lcl.names;			/* clear lcl namlist */
    if (lcl.next) {
      struct namepool *lll = lcl.next;
      lcl.next = NULL;
      while (lll) {
        struct namepool *n = lll->next;
        mfree(lll->names);
        mfree(lll);
        lll = n;
      }
    }
    lclnxtkcnt = lclnxtdcnt = 0;		/*   for rebuilding  */
    lclnxtwcnt = lclnxtacnt = 0;
    lclnxtpcnt = 0;
    lclpmax = tp->pmax;				/* set pmax for plgndx */
    ndxp = nxtargoffp;
    optxt = (OPTXT *)tp;
    while ((optxt = optxt->nxtop) != NULL) {	/* for each op in instr */
      TEXT *ttp = &optxt->t;
      if ((opnum = ttp->opnum) == ENDIN)	/*  (until ENDIN)  */
        break;
      if (opnum == LABEL) {
        if (lblsp - labels >= nlabels) {
          int oldn = lblsp-labels;
          nlabels += NLABELS;
          if (lblsp - labels >= nlabels) nlabels = lblsp - labels + 2;
          printf(Str(X_319,"LABELS list is full...extending to %d\n"), nlabels);
          labels =
            (char**)mrealloc(labels,(long)nlabels*sizeof(char *));
          lblsp = &labels[oldn];
        }
        *lblsp++ = ttp->opcod;
        continue;
      }
      ep = &opcodlst[opnum];
      VMSG( printf("%s argndxs:", ep->opname); )
      if ((outlist = ttp->outlist) == nullist || !outlist->count)
        ttp->outoffs = nulloffs;
      else {
        ttp->outoffs = outoffs = (ARGOFFS *) ndxp;
        outoffs->count = n = outlist->count;
        argp = outlist->arg;		/* get outarg indices */
        ndxp = outoffs->indx;
        while (n--) {
          *ndxp++ = indx = plgndx(*argp++);
          VMSG( printf("\t%d",indx); )
	    }
      }
      if ((inlist = ttp->inlist) == nullist || !inlist->count)
        ttp->inoffs = nulloffs;
      else {
        ttp->inoffs = inoffs = (ARGOFFS *) ndxp;
        inoffs->count = inlist->count;
        if (opnum == displop1) {		/* display op arg ? */
          optxt->t.strarg = strargptr;
          for (n=0; n < inlist->count; n++ ) {
            char *s = inlist->arg[n];
            do *strargptr++ = *s;	/*   copy all args  */
            while (*s++);
          }
        }
        else if (opnum==displop2 || opnum==displop3 || opnum==displop4) {
          char *s = inlist->arg[0];
          optxt->t.strarg = strargptr;
          do *strargptr++ = *s;		/*   or just the 1st */
          while (*s++);
        }
        inreqd = strlen(ep->intypes);
        argp = inlist->arg;			/* get inarg indices */
        ndxp = inoffs->indx;
        for (n=0; n < inlist->count; n++, argp++, ndxp++) {
          if (n < inreqd && ep->intypes[n] == 'l') {
            if (largp - larg >= ngotos) {
              int oldn = ngotos;
              ngotos += NGOTOS;
              printf(Str(X_289,"GOTOS list is full..extending to %d\n"), ngotos); 
              if (largp - larg >= ngotos) ngotos = largp - larg + 1;
              larg = (LBLARG *)
                mrealloc(larg,(long)ngotos*sizeof(LBLARG));
              largp = &larg[oldn];
            }
            VMSG( printf("\t***lbl"); ) /* if arg is label,  */
            largp->lbltxt = *argp;
            largp->ndxp = ndxp;		/*  defer till later */
            largp++;
          }
          else {
            char *s = *argp;
            if (*s == '"') {		/* string argument:  */
              optxt->t.strarg = strargptr;/*  save strargs ptr */
              s++;
              do {
                char c = *s++;
#if defined(SYMANTEC) || defined(_macintosh)
                if (c == '/')	/*  on Mac subst ':' */
                  c = ':';
#endif
                *strargptr++ = c;	/*  copy w/o quotes  */
              } while (*s != '"');
              *strargptr++ = '\0';	/*  terminate string */
              indx = 1;   		/*  cod=1st pool val */
            }
            else indx = plgndx(s);	/* else normal index */
            VMSG( printf("\t%d",indx); )
              *ndxp = indx;
          }
        }
      }
      VMSG( { putchar('\n');  if (dribble) putc('\n', dribble);})
    }
  nxt:
    while (--largp >= larg) {			/* resolve the lbl refs */
      char *s = largp->lbltxt;
      char **lp;
      for (lp = labels; lp < lblsp; lp++)
        if (strcmp(s, *lp) == 0) {
          *largp->ndxp = lp - labels + MIN_SHORT;
          goto nxt;
        }
      dies(Str(X_1272,"target label '%s' not found"), s);
    }
    nxtargoffp = ndxp;
    if (!POLL_EVENTS()) exit(1);	/* on Mac/Win, allow system events */
    mfree(labels);
    mfree(larg);
}

static void lgbuild(char *s)	/* build pool of floating const values	*/
				/* build lcl/gbl list of ds names, offsets */
{				/*   (no need to save the returned values) */
    char c;

    if (((c = *s) >= '0' && c <= '9')
	|| c == '.' || c == '-' || c == '+')
	constndx(s);
    else if (!(lgexist(s))) {
	if (c == 'g' || c == '#' && *(s+1) == 'g')
	    gblnamset(s);
	else lclnamset(s);
    }
}

static short plgndx(char *s)	/* get storage ndx of const, pnum, lcl or gbl */
				/* argument const/gbl indexes are positiv+1, */
				/* pnum/lcl negativ-1 called only after      */
				/* poolcount & lclpmax are finalised */
{
    char	c;
    short	n, indx;

    if (((c = *s) >= '0' && c <= '9')
	|| c == '.' || c == '-' || c == '+') {
	indx = constndx(s) + 1;
    }
    else if ((n = pnum(s)) >= 0)
	indx = - n;
    else if (c == 'g' || c == '#' && *(s+1) == 'g' || gexist(s))
      indx = (short) (poolcount + 1 + gbloffndx(s));
    else indx = - (lclpmax + 1 + lcloffndx(s));
/*     printf(" [%s -> %d (%x)]\n", s, indx, indx); */
    return(indx);
}

static int constndx(char *s)	/* get storage ndx of float const value	*/
				/* builds value pool on 1st occurrence  */
{				/* final poolcount used in plgndx above  */
    MYFLT	newval;		/* pool may be moved w. ndx still valid */
    long	n;
    MYFLT	*fp;
    char	*str = s;

    if (pool == NULL) {
	pool = (MYFLT *)mmalloc((long)NCONSTS * sizeof(MYFLT));
	*pool = (MYFLT)SSTRCOD;
	poolcount = 1;
	nconsts = NCONSTS;
    }
    if (sizeof(MYFLT)==4) {
      if (sscanf(s,"%f",&newval) != 1) goto flerror;
    }
    else {
      if (sscanf(s,"%lf",&newval) != 1) goto flerror;
    }
    /* It is twmpting to assume that if this loop is removed then we
     * would not share constants.  However this breaks something else
     * as this function is used to retrieve constants as well....
     * I (JPff) have not understood this yet.
     */
    for (fp=pool,n=poolcount; n--; fp++) {	/* now search constpool */
	if (newval == *fp)			/* if val is there	*/
	    return(fp - pool);			/*    return w. index	*/
    }
    if (++poolcount > nconsts) {
      /* die("flconst pool is full"); */
	int indx = fp-pool;
	nconsts += NCONSTS;
 	printf(Str(X_751,"extending Floating pool to %d\n"), nconsts);
	pool = (MYFLT*)mrealloc(pool, nconsts*sizeof(MYFLT));
	fp = pool + indx;
    }
    *fp = newval;				/* else enter newval	*/
/*      printf("Constant %d: %f\n", fp-pool, newval); */
    return(fp - pool);				/*   and return new ndx */

flerror:sprintf(errmsg,Str(X_1086,"numeric syntax '%s'"),str);
	synterr(errmsg);
	return(0);
}

static void gblnamset(char *s) /* builds namelist & type counts for gbl names */
{
    NAME	*np;
    struct namepool *ggg;

    for (ggg=&gbl; ggg!=NULL; ggg=ggg->next) {
      for (np=ggg->names; np<ggg->nxtslot; np++)/* search gbl namelist: */
        if (strcmp(s,np->namep) == 0)	/* if name is there	*/
          return;				/*    return    	*/

      if (ggg->nxtslot+1 >= ggg->namlim) {	/* chk for full table	*/
/*	    die("gbl namelist is full"); */
        if (ggg->next == NULL) {
          err_printf( Str(X_263,"Extending Global pool to %d\n"),
                      gblsize+=GNAMES);
          ggg->next = (struct namepool*)mmalloc(sizeof(struct namepool));
          ggg = ggg->next;
          ggg->names = (NAME *)mmalloc((long)(GNAMES*sizeof(NAME)));
          ggg->namlim = ggg->names + GNAMES;
          ggg->nxtslot = ggg->names;
          ggg->next = NULL;
          np = ggg->names;
          break;
        }
        else continue;
      }
      else break;
    }
    ++(ggg->nxtslot);
    np->namep = s;				/* else record newname	*/
    if (*s == '#')	s++;
    if (*s == 'g')	s++;
    if (*s == 'a') {				/*   and its type-count */
	np->type = ATYPE;
	np->count = gblnxtacnt++;
    }
    else {
	np->type = KTYPE;
	np->count = gblnxtkcnt++;
    }
}

static NAME *lclnamset(char *s)
			/* builds namelist & type counts for lcl names  */
			/*   called by otran for each instr for lcl cnts */
{			/*   lists then redone by insprep via lcloffndx  */
    NAME	*np;
    struct namepool	*lll;

    for (lll=&lcl; lll!=NULL; lll=lll->next) {
      for (np=lll->names; np<lll->nxtslot; np++)/* search lcl namelist: */
        if (strcmp(s,np->namep) == 0)	/* if name is there	*/
          return(np);			/*    return ptr	*/
      if (lll->nxtslot+1 >= lll->namlim) {	/* chk for full table	*/
        /*	    die("lcl namelist is full"); */
        if (lll->next == NULL) {
          err_printf( Str(X_264,"Extending Local pool to %d\n"),
                      lclsize+=LNAMES);
          lll->next = (struct namepool*)mmalloc(sizeof(struct namepool));
          lll = lll->next;
          lll->names = (NAME *)mmalloc((long)(LNAMES*sizeof(NAME)));
          lll->namlim = lll->names + LNAMES;
          lll->nxtslot = lll->names;
          lll->next = NULL;
          np = lll->names;
          break;
        }
        else continue;
      }
      else break;
    }
    ++(lll->nxtslot);
    np->namep = s;				/* else record newname	*/
    if (*s == '#')	s++;
    switch(*s) {				/*   and its type-count */
    case 'd': np->type = DTYPE; np->count = lclnxtdcnt++; break;
    case 'w': np->type = WTYPE; np->count = lclnxtwcnt++; break;
    case 'a': np->type = ATYPE; np->count = lclnxtacnt++; break;
    case 'f': np->type = PTYPE; np->count = lclnxtpcnt++; break;
    default:  np->type = KTYPE; np->count = lclnxtkcnt++; break;
    }
    return(np);
}

static int gbloffndx(char *s)	/* get named offset index into gbl dspace */
				/* called only after otran and gblfixed valid */
{
    NAME	*np;
    int indx;
    struct namepool *ggg = &gbl;

    while (1) {
      for (np=ggg->names; np<ggg->nxtslot; np++)  /* search gbl namelist: */
        if (strcmp(s,np->namep) == 0) {	/* if name is there	*/
          if (np->type == ATYPE)
            indx = gblfixed + np->count;
          else indx = np->count;  	/*    return w. index	*/
          return(indx);
        }
      if (ggg->nxtslot+1 < ggg->namlim)
        die(Str(X_1325,"unexpected global name"));	/* else complain	*/
      ggg = ggg->next;
      if (ggg == NULL) die(Str(X_1055,"no pool for unexpected global name"));
    }
}

static int lcloffndx(char *s)	/* get named offset index into instr lcl */
				/* dspace called by insprep aftr lclcnts,*/
				/* lclfixed valid */
{
    NAME	*np = lclnamset(s);		/* rebuild the table	*/
    int indx;
    int Pfloatsize = Pfloats;
    switch(np->type) {    			/* use cnts to calc ndx */
    case KTYPE:  indx = np->count;  break;
    case DTYPE:  indx = lclkcnt + np->count * Dfloats;  break;
    case WTYPE:  indx = lclkcnt + lcldcnt * Dfloats
		     		+ np->count * Wfloats;  break;
    case ATYPE:  indx = lclfixed + np->count;  break;
		/*RWD ???? */
   case PTYPE: indx = lclkcnt + np->count * Pfloatsize; break;
    default:     die(Str(X_1339,"unknown nametype"));  break;
    }
    return(indx);			/*   and rtn this offset */
}

static int gexist(char *s)	/* tests whether variable name exists	*/
{				/*	in gbl namelist			*/
    NAME	*np;
    struct namepool	*ggg = &gbl;

    while (ggg) {		/* search gbl namelist:                 */
      for (np = ggg->names; np < ggg->nxtslot; np++)
        if (strcmp(s,np->namep) == 0)	/* if name is there	*/
          return(1);			/*	return 1	*/
      ggg = ggg->next;
    }
    return(0);			/* else return 0	                */
}

int lgexist(char *s)		/* tests whether variable name exists	*/
				/*	in gbl or lcl namelist		*/
{
    NAME	*np;
    struct namepool	*gl;
 
    for (gl = &gbl; gl!=NULL; gl=gl->next) {
      for (np = gl->names; np < gl->nxtslot; np++) /* search gbl namelist: */
        if (strcmp(s,np->namep) == 0)	/* if name is there	*/
          return(1);			/*	return 1	*/
    }
    for (gl = &lcl; gl!=NULL; gl=gl->next) {
      for (np = gl->names; np < gl->nxtslot; np++) /* search lcl namelist: */
        if (strcmp(s,np->namep) == 0)	/* if name is there	*/
          return(1);			/*	return 1	*/
    }
    return(0);				/* cannot find, return 0 */
}

void putop(TEXT *tp)
{
    int n, nn;

/*     if (n = tp->outlist->count) { */
/* 	nn = 0; */
/* 	while (n--) */
/* 	    putstrg(tp->outlist->arg[nn++]); */
/*     } */
/*     else { putchar('\t'); if (dribble) putc('\t', dribble); } */
/*     putstrg(tp->opcod); */
/*     if (n = tp->inlist->count) { */
/* 	nn = 0; */
/* 	while (n--) */
/* 	    putstrg(tp->inlist->arg[nn++]); */
/*     } */
/*     putchar('\n'); if (dribble) putc('\n', dribble); */
    if ((n = tp->outlist->count)!=0) {
      nn = 0;
      while (n--) printf("%s\t", tp->outlist->arg[nn++]);
    }
    else printf("\t");
    printf("%s\t", tp->opcod);
    if ((n = tp->inlist->count)!=0) {
      nn = 0;
      while (n--) printf("%s\t",tp->inlist->arg[nn++]);
    }
    printf("\n");
}

void putstrg(char *cp)
{
    printf("%s\t", cp);
}

