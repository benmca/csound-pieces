#include "cs.h"                 /*                              LINEVENT.C      */
#include <stdlib.h>
#include <ctype.h>
#if defined(mills_macintosh) || defined(SYMANTEC)
#include <console.h>
#include <fcntl.h>
#else
#include <fcntl.h>
#endif

void RTclose(void);
#if defined(__BEOS__)
# include <unistd.h>
#else
  extern int close(int);
#if !defined(mac_classic) && !defined(SYMANTEC) && !defined(LINUX)
extern int read(int, void*, unsigned);
#endif
#endif

#ifdef PIPES
# if defined(SGI) || defined(LINUX) || defined(NeXT) || defined(MACOSX)
#  define _popen popen
#  define _pclose pclose
# elif defined(__BEOS__) || defined(__MACH__)
#  include <stdio.h>
#  define _popen popen
#  define _pclose pclose
# else
   FILE *_popen(const char *, const char *);
# endif
#endif

#define LBUFSIZ   200
#define LF        '\n'

static char *Linebuf, *Linep, *Linebufend;
int  Linefd = 0;
#if defined(mills_macintosh) || defined(SYMANTEC)
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
#elif defined(mills_macintosh)
        Linecons = stdin;
        setvbuf(stdin, NULL, _IONBF, 0);
#else
#if defined(DOSGCC) || defined(LATTICE) || defined(__WATCOMC__) || defined(WIN32) || defined(mac_classic)
        setvbuf(stdin, NULL, _IONBF, 0);
/*      warning("-L stdin:  system has no fcntl function to get stdin"); */
#else
        if (fcntl(Linefd, F_SETFL,
                  (stdmode =fcntl(Linefd, F_GETFL, 0)) | O_NDELAY) < 0)
            die(Str(X_113,"-L stdin fcntl failed"));
#endif
#endif
    }
#ifdef PIPES
    else if (O.Linename[0]=='|') {
      Linepipe = _popen(&(O.Linename[1]), "r");
      if (Linepipe == NULL) Linefd = fileno(Linepipe);
      else dies(Str(X_210,"Cannot open %s"), O.Linename);
    }
#endif
#if defined(mills_macintosh) || defined(SYMANTEC)
#define MODE
#else
#define MODE ,0
#endif
    else if ((Linefd = open(O.Linename, O_RDONLY | O_NDELAY  MODE)) < 0)
        dies(Str(X_210,"Cannot open %s"), O.Linename);
    printf(Str(X_1243,"stdmode = %.8x Linefd = %d\n"), stdmode, Linefd);
    atexit(RTclose);
}

void RTclose(void)
{
    printf(Str(X_1243,"stdmode = %.8x Linefd = %d\n"), stdmode, Linefd);
#if defined(mills_macintosh) || defined(SYMANTEC)
    if (Linecons != NULL) fclose(Linecons);
#else
                                /* JPff patch hoping to keep window */
    if (Linefd)
        close(Linefd);
    else {
#if !defined(DOSGCC) && !defined(LATTICE) && !defined(__WATCOMC__) && !defined(WIN32) && !defined(mac_classic)
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
    static MYFLT prvp1 = FL(0.0);
    static MYFLT prvp2 = FL(0.0);

    if
#if defined(mills_macintosh) || defined(SYMANTEC)
    ((n = fread((void *)Linep, (size_t)1,
                   (size_t)(Linebufend-Linep), Linecons)) > 0 || Linep > Linebuf)
#else
    ((n = read(Linefd, Linep, Linebufend-Linep)) > 0 || Linep > Linebuf)
#endif
      {
        /*      printf("sensLine %d CHARS\n",n);  */
        Linend = Linep + (n>0 ? n : 0);
        /*        if ((c = *(Linend - 1)) == LF || containsLF(Linep,Linend)) { */
        if (containsLF(Linebuf,Linend)) {
          cp = Linebuf;
          Curblk = getblk();          /* get a blk from the levtblk pool */
          e = &Curblk->evtblk;
          while ((c = *cp++) == ' ' || c == '\t')/* skip initial white space */
            ;
          if (c == LF) goto Timchk;     /* if null line, bugout     */
          switch(c) {                   /* look for legal opcode    */
          case 'e':                     /* Quit realtime */
          case 'i':
          case 'f':
            e->opcod = c;
            break;
          default:
            err_printf(Str(X_1340,"unknown opcode %c\n"));
            goto Lerr;
          }                                  /* for params that follow:  */
          for (fp = &e->p[1], pcnt = 0; c != LF && pcnt<PMAX; pcnt++) {
            /*          long val = 0, scale = 1; */
            char *newcp;
            while ((c = *cp++) == ' ' || c == '\t') /* skip white space */
              ;
            if (c == LF) break;
            if (c == '"') {                /* if find character string  */
              char *sstrp;
              if (pcnt != 4) {
                err_printf(Str(X_1000,"misplaced string\n")); /* (must be p5) */
                goto Lerr;
              }
              if ((sstrp = e->strarg) == NULL)
                e->strarg = sstrp = mcalloc((long)SSTRSIZ);
              while ((c = *cp++) != '"') {
                if (c == LF) {
                  err_printf(Str(X_1349,"unmatched quotes\n"));
                  cp--;
                  goto Lerr;
                }
                *sstrp++ = c;           /*   sav in private strbuf */
              }
              *sstrp = '\0';
              *fp++ = sstrcod;            /*   & store coded float   */
              continue;
            }
            if (!(isdigit(c) || c=='+' || c=='-' || c=='.'))
              goto Lerr;
            if (c == '.'                        /*  if lone dot,       */
                && ((n = *cp)==' ' || n=='\t' || n==LF)) {
              if (e->opcod != 'i' || prvop != 'i' || pcnt >= prvpcnt) {
                err_printf(Str(X_708,"dot carry has no reference\n"));
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
          if (pcnt < 3 && e->opcod !='e') {
            err_printf(Str(X_1284,"too few pfields\n"));/* check sufficient pfields */
            goto Lerr;
          }
          e->pcnt = pcnt;                      /*   &  record pfld count    */
          prve = e;
          prvop = e->opcod;                    /* preserv the carry sensors */
          prvpcnt = pcnt;
          prvp1 = e->p[1];
          prvp2 = e->p[2];
          if (pcnt == PMAX && c != LF) {
            err_printf(Str(X_1291,"too many pfields\n"));
            while (*cp++ != LF)              /* flush any excess data     */
              ;
          }
          Linep = Linebuf;
          while (cp < Linend)                  /* copy remaining data to    */
            *Linep++ = *cp++;                /*     beginning of Linebuf  */
          if (e->p[2] < 0.) {
            err_printf(Str(X_114,"-L with negative p2 illegal\n"));
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
      Firstact->inuse = 0;                    /*   mark its space available    */
      Firstact = Firstact->nxtact;
      return(1);                              /*   & report Line-type RTevent  */
    }
    else return(0);                           /* else nothing due yet          */

 Lerr:
    n = cp - Linebuf - 1;                     /* error position */
    while (*cp++ != LF);                      /* go on to LF    */
    *(cp-1) = '\0';                           /*  & insert NULL */
    err_printf(Str(X_838,"illegal RT scoreline:\n%s\n"), Linebuf);
    while (n--)
      err_printf(" ");
    err_printf("^\n");                        /* mark the error */
    Linep = Linebuf;
    while (cp < Linend)
      *Linep++ = *cp++;                       /* mov rem data forward */
    return(0);
}

/* send a lineevent from the orchestra */
/* code derived from sensLine() -matt 2001/12/07 */
#include "schedule.h"
void eventOpcode(LINEVENT *p)
{
    LEVTBLK  *Curblk;
    EVTBLK   *e;
    int      n;

    static EVTBLK *prve = NULL;
    static char prvop = ' ';
    static int prvpcnt = 0;
    static MYFLT prvp1 = FL(0.0);
    static MYFLT prvp2 = FL(0.0);

    Curblk = getblk();          /* get a blk from the levtblk pool */
    e = &Curblk->evtblk;

    if ((*p->args[0] != sstrcod) ||
        (*p->STRARG != 'i' && *p->STRARG != 'f' && *p->STRARG !='e')) {
      sprintf(errmsg, Str(X_1136,"lineevent param 1 must be \"i\", \"f\", or \"e\"\n"));
      perferror(errmsg);
      return;
    }
    else
      e->opcod = *p->STRARG;

    if (p->INOCOUNT < 4 && e->opcod !='e') {
      err_printf(Str(X_1284,"too few pfields\n"));/* check sufficient pfields */
      return;
    }
    else
      e->pcnt = p->INOCOUNT-1;
    
    for (n = 1; n < p->INOCOUNT; n++) {
      e->p[n] = *p->args[n];
      /*##? form the string -- perhaps not needed? */
      /* e->strarg */
      /*## add a feature for pfield carry? */
    }

    prve = e;
    prvop = e->opcod;                    /* preserv the carry sensors */
    prvpcnt = e->pcnt;
    prvp1 = e->p[1];
    prvp2 = e->p[2];

    e->p2orig = e->p[2];
    e->p3orig = e->p[3];

    Curblk->inuse = 1;
    Curblk->oncounter = kcounter + (long)(e->p[2] * ekr);
    Linsert(Curblk);
}

