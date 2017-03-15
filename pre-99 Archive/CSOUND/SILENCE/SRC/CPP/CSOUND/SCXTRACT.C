#include "sort.h"                                    /*  SCXTRACT.C  */

extern void  readxfil(FILE *), extract(void), swrite(void), sfree(void);
extern int sread(void);

int scxtract(FILE *scin, FILE * scout, FILE *xfile)     /* called from xmain.c or some other main */
                                /*   extracts events from each score sect */
{                               /*   according to the controlling xfile   */
    int n;

    readxfil(xfile);
    SCOREIN = scin;
    SCOREOUT = scout;

    sectcnt = 0;
    do {
      if ((n = sread()) > 0) {
        /*  allout();   */
        /*  textout();  */
        extract();
        swrite();
      }
    } while (n > 1);
    sfree();        /* return all memory used */
    return(0);
}
