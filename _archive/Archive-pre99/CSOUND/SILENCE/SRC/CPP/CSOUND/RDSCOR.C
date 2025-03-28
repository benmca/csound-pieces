#include "cs.h"                 /*                              RDSCOR.C */

FILE   *scfp = NULL;
FILE   *oscfp = NULL /*stdout*/;     /* default Cscore outfile */
int    warped = 0;
static char *sstrbuf = NULL;
static int  sstrlen = 0;
static void dumpline(void);

static void flushline(void)             /* flush scorefile to next newline */
{
    int c;
    while ((c = getc(scfp)) != EOF && c != '\n')
        ;
}

static int scanflt(MYFLT *pfld)
{   /* read a MYFLT from scorefile; return 1 if OK, else 0 */
    int  c;

    while ((c = getc(scfp)) == ' ' || c == '\t')  /* skip leading white space */
        ;
    if (c == ';') {             /* Comments terminate line */
      flushline();
      return 0;
    }
    if (c == '"') {                               /* if find a quoted string  */
        char *sstrp;
        if ((sstrp = sstrbuf) == NULL)
            sstrp = sstrbuf = mmalloc((long)SSTRSIZ);
        while ((c = getc(scfp)) != '"')
            *sstrp++ = c;                         /*   copy the characters    */
        *sstrp++ = '\0';
        *pfld = sstrcod;                          /*   flag with hifloat      */
        sstrlen = sstrp - sstrbuf;                /*    & overall length      */
        return(1);
    }
    if (!(c>='0' && c<='9' || c=='+' || c=='-' || c=='.')) {
        ungetc(c,scfp);
        printf(Str(X_250,"ERROR: illegal character %c(%.2x) in scoreline: "), c, c);
        dumpline();
        return(0);
    }
    ungetc(c,scfp);
    if (sizeof(MYFLT)==4)
      fscanf(scfp, "%f", pfld);
    else
      fscanf(scfp, "%lf", pfld);
    return(1);
}

static void dumpline(void)      /* print the line while flushing it */
{
    int c;
    while ((c = getc(scfp)) != EOF && c != '\n') {
        putchar(c);
        if (dribble) putc(c, dribble);
    }
    printf(Str(X_557,"\n\tremainder of line flushed\n"));
}


int rdscor(EVTBLK *e)           /* read next score-line from scorefile */
                                /*  & maintain section warped status   */
{                               /*      presumes good format if warped */
    MYFLT *pp, *plim;
    int  c;

    if (scfp == NULL) {    /* if no concurrent scorefile  */
        e->opcod = 'f';    /*     return an 'f 0 3600'    */
        e->p[1] = FL(0.0);
        e->p[2] = FL(3600.0);
        e->p2orig = FL(3600.0);
        e->pcnt = 2;
        return(1);
    }
    while ((c = getc(scfp)) != EOF)   /* else read the real score */
        switch (c) {
        case ' ':
        case '\t':
        case '\n':
            continue;            /* skip leading white space */
        case ';':
            flushline();
            continue;
        case 's':
        case 't':
            warped = 0;
            goto unwarped;
        case 'w':
            warped = 1;          /* w statement is itself unwarped */
unwarped:   e->opcod = c;                    /* UNWARPED scorefile:  */
            pp = &e->p[0];
            plim = &e->p[PMAX];              /*    caution, irregular format */
            while (1) {
                while ((c = getc(scfp))==' ' || c=='\t');  /* eat whitespace */
                if (c == ';')  { flushline();  break; }    /* comments? skip */
                if (c == '\n' || c == EOF)   break;        /* newline? done  */
                ungetc(c,scfp);                            /* pfld:  back up */
                if (!scanflt(++pp))  break;                /*   & read value */
                if (pp >= plim) {
                    printf(Str(X_251,"ERROR: too many pfields: "));
                    dumpline();
                    break;
                }
            }
            e->p2orig = e->p[2];                 /* now go count the pfields */
            e->p3orig = e->p[3];
            goto setp;
        case 'e':
            e->opcod = c;
            e->pcnt = 0;
            return(1);
        default:                                /* WARPED scorefile:       */
            if (!warped) goto unwarped;
            e->opcod = c;                                        /* opcod */
            pp = &e->p[0];
            plim = &e->p[PMAX];
            if (getc(scfp) != '\n' && scanflt(++pp))             /* p1      */
              if (getc(scfp) != '\n' && scanflt(&e->p2orig))     /* p2 orig */
                if (getc(scfp) != '\n' && scanflt(++pp))         /* p2 warp */
                  if (getc(scfp) != '\n' && scanflt(&e->p3orig)) /* p3 orig */
                    if (getc(scfp) != '\n' && scanflt(++pp))     /* p3 warp */
                      while (getc(scfp) != '\n' && scanflt(++pp))/* p4....  */
                        if (pp >= plim) {
                          flushline();
                          ++pp;
                          break;
                        }
setp:       e->pcnt = pp - &e->p[0];                   /* count the pfields */
            if (sstrlen) {                /* if string arg present, save it */
                e->strarg = mmalloc((long) sstrlen);
                strcpy(e->strarg, sstrbuf);
                sstrlen = 0;
            }
            return(1);
        }
    fclose(scfp);
    return(0);
}
