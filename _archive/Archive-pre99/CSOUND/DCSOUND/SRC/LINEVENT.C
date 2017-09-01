#include "cs.h"			/*				LINEVENT.C	*/
#include <stdlib.h>
#ifdef SYMANTEC
#include <console.h>
#else
#include <fcntl.h>
#endif


extern int close(int);
void RTclose(void);
#ifndef SYMANTEC
extern int read(int, void*, unsigned);
#endif

#define LBUFSIZ   200
#define LF        '\n'

static char *Linebuf, *Linep, *Linebufend;
int  Linefd = 0;
#ifdef SYMANTEC
static FILE *Linecons;
#endif

typedef struct levtblk {
    struct levtblk *nxtblk;
    struct levtblk *nxtact;
    long      inuse, oncounter;
    EVTBLK    evtblk;
} LEVTBLK;

static LEVTBLK  *Firstblk;
static LEVTBLK  *Firstact;
EVTBLK *Linevtblk;
extern long kcounter;
extern OPARMS O;
int stdmode;
#ifdef PIPES
FILE *Linepipe;
#endif

void RTLineset(void)   /* set up Linebuf & ready the input files */
{                      /*     callable once from musmon.c        */
    Firstblk = (LEVTBLK *) mcalloc((long)sizeof(LEVTBLK));
    Firstact = NULL;
    Linebuf = mcalloc((long)LBUFSIZ);
    Linebufend = Linebuf + LBUFSIZ;
    Linep = Linebuf;
    if (strcmp(O.Linename,"stdin") == 0) {
#ifdef SYMANTEC
	console_options.top += 10;
	console_options.left += 10;
	console_options.title = "\pRT Line_events";
	console_options.nrows = 10;
	console_options.ncols = 50;
	Linecons = fopenc();
	cshow(Linecons);
#else
#if defined (__ZPC__) || defined (DOSGCC) || defined (LATTICE) || defined(__BORLANDC__) || defined(__WATCOMC__) || defined(WIN32)
	setvbuf(stdin, NULL, _IONBF, 0);
/* 	warning("-L stdin:  system has no fcntl function to get stdin"); */
#else
	if (fcntl(Linefd, F_SETFL,
		  (stdmode =fcntl(Linefd, F_GETFL, 0)) | O_NDELAY) < 0)
	    die("-L stdin fcntl failed");
#endif
#endif
    }
#ifdef PIPES
# ifdef SGI
#  define _popen popen
#  define _pclose pclose
# endif
    else if (O.Linename[0]=='|') {
      FILE *_popen(const char *, const char *);
      Linepipe = _popen(&(O.Linename[1]), "r");
      if (Linepipe == NULL) Linefd = fileno(Linepipe);
      else dies("cannot open %s", O.Linename);
    }
#endif
#ifdef SYMANTEC
#define MODE
#else
#define MODE ,0
#endif
    else if ((Linefd = open(O.Linename, O_RDONLY | O_NDELAY  MODE)) < 0)
	dies("cannot open %s", O.Linename);
    printf("stdmode = %.8x Linefd = %d\n", stdmode, Linefd);
    atexit(RTclose);
}

void RTclose(void)
{
    printf("stdmode = %.8x Linefd = %d\n", stdmode, Linefd);
#ifdef SYMANTEC
    if (Linecons != NULL) fclose(Linecons);
#else
				/* JPff patch hoping to keep window */
    if (Linefd)
	close(Linefd);
    else {
#if !defined (__ZPC__) && !defined (DOSGCC) && !defined (LATTICE) && !defined(__BORLANDC__) && !defined(__WATCOMC__) && !defined(WIN32)
	fcntl(Linefd, F_SETFL, stdmode);
#endif
    }
#endif
}

static int containsLF(char *cp, char *endp)/* does string segment contain LF? */
{
    do { if (*cp++ == LF)  return(1); }
    while (cp < endp);
    return(0);
}

static LEVTBLK *getblk(void)/* get blk from the LEVTBLK pool, or alloc a new one */
{
    LEVTBLK *curp = Firstblk, *nxtp;

    while (curp->inuse) {
        if ((nxtp = curp->nxtblk) == NULL) {
	    nxtp = (LEVTBLK *) mcalloc((long)sizeof(LEVTBLK));
	    curp->nxtblk = nxtp;
	}
	curp = nxtp;
    }
    return(curp);
}

static void Linsert(LEVTBLK *curp) /* insert blk into the time-ordered linevent queue */
{
    LEVTBLK *nxtp = Firstact, *prvp = NULL;

    while (nxtp != NULL && nxtp->inuse && nxtp->oncounter <= curp->oncounter) {
        prvp = nxtp;
        nxtp = nxtp->nxtact;
    }
    if (prvp == NULL)
        Firstact = curp;
    else prvp->nxtact = curp;
    curp->nxtact = nxtp;
}

#ifdef GAB_RT
#include <conio.h>     /* gab-A1 */
#endif

int sensLine(void)
    /* accumlate RT Linein buffer, & place completed events in EVTBLK */
{   /* does more syntax checking than rdscor, since not preprocessed  */
    int c;
    char *cp;
    LEVTBLK  *Curblk;
    EVTBLK   *e;
    int      n, pcnt;
    MYFLT    *fp, *prvfp;
    char     *Linend;
static EVTBLK *prve = NULL;
static char prvop = ' ';
static int prvpcnt = 0;
static MYFLT prvp1 = 0.0f;
static MYFLT prvp2 = 0.0f;

#ifdef GAB_RT 
	if (!kbhit())  return 0; /* gab-A1 */
#endif

#ifdef SYMANTEC
    if ((n = fread((void *)Linep, (size_t)1,
		   (size_t)(Linebufend-Linep), Linecons)) > 0
#else
    if ((n = read(Linefd, Linep, Linebufend-Linep)) > 0
#endif
      || Linep > Linebuf) {
#ifdef GAB_RT 
		printf("sensLine %d CHARS\n",n); /* gab-A1 */
#endif
	Linend = Linep + n;
	if ((c = *(Linend - 1)) == LF || containsLF(Linep,Linend)) {
	    cp = Linebuf;
	    Curblk = getblk();          /* get a blk from the levtblk pool */
	    e = &Curblk->evtblk;
	    while ((c = *cp++) == ' ' || c == '\t')/* skip initial white space */
	        ;
	    if (c == LF) goto Timchk;          /* if null line, bugout     */
	    switch(c) {                        /* look for legal opcode    */
	    case 'i':
	    case 'f': e->opcod = c;
	              break;
	    default:  err_printf("unknown opcode %c\n");
	              goto Lerr;
	    }                                  /* for params that follow:  */
	    for (fp = &e->p[1], pcnt = 0; c != LF && pcnt<PMAX; pcnt++) {
/* 	        long val = 0, scale = 1; */
		char *newcp;
		while ((c = *cp++) == ' ' || c == '\t') /* skip white space */
		    ;
		if (c == LF) break;
		if (c == '"') {                /* if find character string  */
		    char *sstrp;
		    if (pcnt != 4) {
		        err_printf("misplaced string\n"); /* (must be p5) */
			goto Lerr;
		    }
		    if ((sstrp = e->strarg) == NULL)
		        e->strarg = sstrp = mcalloc((long)SSTRSIZ);
		    while ((c = *cp++) != '"') {
		        if (c == LF) {
			    err_printf("unmatched quotes\n");
			    cp--;
			    goto Lerr;
			}
			*sstrp++ = c;           /*   sav in private strbuf */
		    }
		    *sstrp = '\0';
		    *fp++ = sstrcod;            /*   & store coded float   */
		    continue;
		}
		if (!(c>='0' && c<='9' || c=='+' || c=='-' || c=='.'))
		    goto Lerr;
		if (c == '.'                        /*  if lone dot,       */
		  && ((n = *cp)==' ' || n=='\t' || n==LF)) {
		    if (e->opcod != 'i' || prvop != 'i' || pcnt >= prvpcnt) {
		        err_printf("dot carry has no reference\n");
			goto Lerr;
		    }
		    if (e != prve) {                /*        pfld carry   */
		        if (pcnt == 1)
			    *fp = prvp2;
		        else *fp = prve->p[pcnt+1];
		    }
		    fp++;         
		    continue;
		}
		*fp++ = (MYFLT)strtod(cp-1, &newcp);
		cp = newcp;
/* 		if (c == '-') {scale = -1; c = *cp++;} */ /* valid float: eval */
/* 		if (c == '+' || c == '0')  c = *cp++; */
/* 		while (c >= '0' && c <= '9') { */
/* 		    val *= 10; */
/* 		    val += c - '0'; */
/* 		    c = *cp++; */
/* 		} */
/* 		if (c == ' ' || c == '\t' || c == LF) */ /* simple decimal val? */
/* 		    goto pfstor;                      */ /*   quick store       */
/* 		if (c == '.') */
/* 		    c = *cp++; */
/* 		while (c >= '0' && c <= '9') { */       /* else read full float */
/* 		    val *= 10; */
/* 		    val += c - '0'; */
/* 		    scale *= 10; */
/* 		    c = *cp++; */
/* 		} */
/* 		if (c != ' ' && c != '\t' && c != LF) */ /*  chk delimiter legal */
/* 		    goto Lerr; */
/* 	pfstor:	*fp++ = (float) val/scale; */          /* & stor pval in EVTBLK */
	    }
	    if (e->opcod == 'i' && prvop == 'i') /* do carries for instr data */
	        if (!pcnt || pcnt < prvpcnt && e->p[1] == prvp1) {
		    int pcntsav = pcnt;
		    if (e != prve)
		        for (prvfp = &prve->p[pcnt+1]; pcnt < prvpcnt; pcnt++)
			    *fp++ = *prvfp++;
		    else pcnt =  prvpcnt;
		    if (pcntsav < 2)
		        e->p[2] = prvp2;
		}
	    if (pcnt < 3) {
	      err_printf("too few pfields\n");/* check sufficient pfields */
	      goto Lerr;
	    }
	    e->pcnt = pcnt;                      /*   &  record pfld count    */
	    prve = e;
	    prvop = e->opcod;                    /* preserv the carry sensors */
	    prvpcnt = pcnt;
	    prvp1 = e->p[1];
	    prvp2 = e->p[2];
	    if (pcnt == PMAX && c != LF) {
	        err_printf("too many pfields\n");
	        while (*cp++ != LF)              /* flush any excess data     */
		    ;
	    }
	    Linep = Linebuf;
	    while (cp < Linend)                  /* copy remaining data to    */
		*Linep++ = *cp++;                /*     beginning of Linebuf  */
	    if (e->p[2] < 0.) {
	        err_printf("-L with negative p2 illegal\n");
		goto Lerr;
	    }
	    e->p2orig = e->p[2];
	    e->p3orig = e->p[3];
	    Curblk->inuse = 1;
	    Curblk->oncounter = kcounter + (long)(e->p[2] * ekr);
	    Linsert(Curblk);
	}
	else Linep += n;           /* else just accum the chars */
    }

Timchk:
    if (Firstact != NULL
      && Firstact->oncounter <= kcounter) { /* if an event is due now,       */
	Linevtblk = &Firstact->evtblk;
	Firstact->inuse = 0;                /*   mark its space available    */
	Firstact = Firstact->nxtact;
	return(1);                          /*   & report Line-type RTevent  */
    }
    else return(0);                         /* else nothing due yet          */

Lerr:
    n = cp - Linebuf - 1;                   /* error position */
    while (*cp++ != LF);                    /* go on to LF    */
    *(cp-1) = '\0';                         /*  & insert NULL */
    err_printf("illegal RT scoreline:\n%s\n", Linebuf);
    while (n--)
        err_printf(" ");
    err_printf("^\n");                  /* mark the error */
    Linep = Linebuf;
    while (cp < Linend)
        *Linep++ = *cp++;                   /* mov rem data forward */
    return(0);
}

