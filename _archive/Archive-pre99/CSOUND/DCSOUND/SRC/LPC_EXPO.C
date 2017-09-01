/* ***************************************************************** */
/* ******** Program to export lpanal files in tabular format. ****** */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jun 25                                           */
/* ***************************************************************** */
     
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#ifndef MYFLT
#include "sysdep.h"
#endif
#include "lpc.h"
#include "text.h"

void usage(void);

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
    FILE *inf;
    FILE *outf;
    LPHEADER hdr;
    int i, j;
    char *str;
    MYFLT *coef;

    init_getstring(0, NULL);
    if (argc!= 3)
	usage();
    inf = fopen(argv[1], "rb");
    if (inf == NULL) {
	fprintf(stderr, Str(X_214,"Cannot open input file %s\n"), argv[1]);
	exit(1);
    }
    outf = fopen(argv[2], "w");
    if (outf == NULL) {
	fprintf(stderr, Str(X_215,"Cannot open output file %s\n"), argv[2]);
	exit(1);
    }
    if (fread(&hdr, sizeof(LPHEADER)-4, 1, inf) != 1 ||
	hdr.lpmagic != LP_MAGIC) {
	fprintf(stderr, Str(X_274,"Failed to read LPC header\n"));
	exit(1);
    }
    fprintf(outf, "%ld,%ld,%ld,%ld,%f,%f,%f",
	    hdr.headersize, hdr.lpmagic, hdr.npoles, hdr.nvals,
	    hdr.framrate, hdr.srate, hdr.duration);
    str = (char *)malloc(hdr.headersize-sizeof(LPHEADER)+4);
    fread(&hdr, sizeof(char), hdr.headersize-sizeof(LPHEADER)+4, inf);
    for (i=0; i<hdr.headersize-sizeof(LPHEADER)+4; i++)
	putc(str[i],outf);
    putc('\n', outf);
    coef = (MYFLT *)malloc((hdr.npoles+hdr.nvals)*sizeof(MYFLT));
    for (i = 0; i<hdr.nvals; i++) {
	fread(&coef[0], sizeof(MYFLT), hdr.npoles, inf);
	for (j=0; j<hdr.npoles; j++) 
	    fprintf(outf, "%f%c", coef[j], (j==hdr.npoles-1 ? '\n' : ','));
    }
    fclose(outf);
    fclose(inf);
}

void usage(void)
{
    exit(1);
}

