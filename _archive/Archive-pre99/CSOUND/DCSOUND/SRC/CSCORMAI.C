#include "cscore.h"                                   /*   CSCOREMAIN.C   */
#include "text.h"

extern cscorinit(void), cscore(void);
extern void lput(EVLIST *);
extern FILE *scfp, *oscfp;
FILE    *dribble;
void scfopen(int, char **);
void err_printf(char *, ...);

int main(int argc, char **argv)	/* cscore stub to run a user prog standalone   */
{
    dribble = NULL;
    init_getstring(argc,argv);
    scfopen(argc,argv);     /* open the command line scorein file */
    cscorinit();
    cscore();               /* and call the user cscore program   */
}

void scfopen(int argc, char **argv)     /* simple open of command-line score */
					/* input file use only if not opened */
					/* by other main program */
{
    if (!(--argc)) {
        printf(Str(X_940,"insufficient arguments\n"));
	exit(0);
    }
    if (!(scfp = fopen(*++argv, "r"))) {
        printf(Str(X_635,"cannot find %s\n"), *argv);
	exit(0);
    }
}

void lplay(EVLIST *a)		/* for standalone cscore: no full Csound, so */
				/*  field lplay calls & put events to stderr */
{
    FILE *osave;

    err_printf(
        Str(X_676,
            "cscore lplay:  full Csound would now play the following score\n"));
    osave = oscfp;
    oscfp = stderr;
    lput(a);
    oscfp = osave;
}

/* This standalone cscore stub is invoked with cscore_xxx.c as follows:    */
/*       cc -o cscore cscore_xxx.c -lcscore                                */
/* or, if no libcscore.a was created at installation:                      */
/*       cc -o cscore cscore_xxx.c $CSOUND/cscoremain.o $CSOUND/cscorefns.o \
/*                       $CSOUND/rdscor.o $CSOUND/memalloc.o           	   */
/* where CSOUND is an environment variable denoting a Csound directory     */
/* containing previously compiled modules.                                 */
/* If can't find cscore.h use -I/usr/local/include, or copy from Csound    */
/* The resulting executable can be run with:				   */
/*       cscore scorin > scoreout			        	   */


#ifndef CWIN
#include <stdarg.h>

void dribble_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vprintf(fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}
#endif
