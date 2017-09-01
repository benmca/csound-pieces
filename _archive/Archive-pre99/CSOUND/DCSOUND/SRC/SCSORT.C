#include "sort.h"                                          /*   SCSORT.C  */
#include "cs.h"

extern void  sort(void), twarp(void), swrite(void), sfree(void);
extern int sread(void);

void scsort(FILE *scin, FILE *scout)
    /* called from smain.c or some other main */
    /* reads,sorts,timewarps each score sect in turn */
{
    int n;

    SCOREIN = scin;
    SCOREOUT = scout;

    sectcnt = 0;
    do
      if ((n = sread()) > 0) {
        sort();
        if (!POLL_EVENTS()) break; /* on Mac/Win, system events */
        twarp();
        swrite();
      }
    while (POLL_EVENTS() && n > 1); /* on Mac/Win, allow system events */
    sfree();        /* return all memory used */
}

