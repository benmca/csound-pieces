/* ***************************************************************** */
/* ******** Program to export hetro files in tabular format. ******* */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jun 19                                           */
/* ***************************************************************** */
     
#include <stdio.h>
#include "cs.h"

MEMFIL *mfp;
OPARMS  O;                      /* Not actually used */

#define END  32767

void usage(void);

#include <stdarg.h>

void dribble_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stdout, fmt, a);
    va_end(a);
}

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
}

void initerror(char *s)
{
    printf("INIT ERROR: %s\n", s);
    exit(1);
}

int main(int argc, char **argv)
{
    MEMFIL *inf;
    FILE *outf;
    short *adp;
    short *endata;
    int cc = 0;

    if (argc!= 3)
        usage();
    inf = ldmemfile(argv[1]);
    if (inf == NULL) {
        err_printf( "Cannot open input file %s\n", argv[1]);
        exit(1);
    }
    outf = fopen(argv[2], "w");
    if (inf == NULL) {
        err_printf( "Cannot open output file %s\n", argv[2]);
        exit(1);
    }
    adp = (short *) inf->beginp;
    endata = (short *) inf->endp;
    cc = 0;
    for (; adp<endata; adp++) {
        if (*adp == END) fputc('\n',outf), cc = 0;
        else fprintf(outf, "%s%hd", (cc ? ",":""), *adp), cc = 1;
    }
    fclose(outf);
}

void usage(void)
{
    exit(1);
}

