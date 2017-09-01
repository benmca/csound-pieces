/* ***************************************************************** */
/* ******** Program to import hetro files from tabular format. ***** */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jul 14                                           */
/* ***************************************************************** */

#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#ifndef MYFLT
#include "sysdep.h"
#endif
/*#include "hetro.h"*/
#include "text.h"

#define END  32767

void usage(void);

short getnum(FILE* inf, char *term)
{
    char buff[100];
    int  cc;
    int p = 0;
    while ((cc=getc(inf))!=',' && cc!='\n') {
        if (cc == EOF) {
            *term = '\0';
            return 0;
        }
        buff[p++] = cc;
    }
    buff[p]='\0';
    *term = cc;
    return (short)atoi(buff);
}

long natlong(long lval)             /* coerce a bigendian long into a natural long */
{
    unsigned char benchar[4];
    unsigned char *p = benchar;
    long natlong;

    *(long *)benchar = lval;
    natlong = *p++;
    natlong <<= 8;
    natlong |= *p++;
    natlong <<= 8;
    natlong |= *p++;
    natlong <<= 8;
    natlong |= *p;
    return(natlong);
}

FILE *dribble = NULL;
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
      va_start(a, fmt); /* gab */
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}

int main(int argc, char **argv)
{
    FILE *infd;
    FILE *outf;

    if (argc!= 3)
        usage();

    infd = fopen(argv[1], "r");
    if (infd == NULL) {
        fprintf(stderr, Str(X_213,"Cannot open input comma file%s\n"), argv[1]);
        exit(1);
    }
    outf = fopen(argv[2], "w");
    if (outf == NULL) {
        fprintf(stderr, Str(X_216,"Cannot open output hetro file %s\n"), argv[2]);
        exit(1);
    }

    for (;;) {
        short x;
        char term;
        short end = END;
        x = getnum(infd, &term);
        if (term == '\0') break;
        fwrite(&x, 1, sizeof(short), outf);
        if (term == '\n')  fwrite(&end, 1, sizeof(short), outf);
    }
    fclose(outf);
    fclose(infd);
}

void usage(void)
{
    fprintf(stderr, Str(X_517,"Usage: het_import commafile hetfile\n"));
    exit(1);
}

