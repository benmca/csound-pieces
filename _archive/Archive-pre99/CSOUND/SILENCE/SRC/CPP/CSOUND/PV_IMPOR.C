/* ***************************************************************** */
/* ******** Program to import pvoc files from tabular format. ****** */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jun 17                                           */
/* ***************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "pvoc.h"
#include "text.h"

void usage(int);
MYFLT getnum(FILE*, char *);

long natlong(long lval)         /* coerce a bigendian long into a natural long */
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

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
}

int main(int argc, char **argv)
{
    PVSTRUCT pv;
    FILE *inf;
    FILE *outf;
    int i;

    if (argc!= 3)
        usage(argc);
    inf = fopen(argv[1], "rb");
    if (inf == NULL) {
        fprintf(stderr, Str(X_214,"Cannot open input file %s\n"), argv[1]);
        exit(1);
    }
    outf = fopen(argv[2], "w");
    if (inf == NULL) {
        fprintf(stderr, Str(X_215,"Cannot open output file %s\n"), argv[2]);
        exit(1);
    }
    fscanf(inf, "ByteOffset,DataSize,dFormat,Rate,Channels,FrameSize,FrameInc,BSize,frameFormat,MinFreq,MaxFreq,LogLin\n");
    fscanf(inf, "%ld,%ld,%ld,%g,%ld,%ld,%ld,%ld,%ld,%g,%g,%ld\n",
            &pv.headBsize, &pv.dataBsize, &pv.dataFormat, &pv.samplingRate,
            &pv.channels, &pv.frameSize, &pv.frameIncr, &pv.frameBsize,
            &pv.frameFormat, &pv.minFreq, &pv.maxFreq, &pv.freqFormat);
    i = pv.dataBsize/pv.frameBsize;
    pv.magic = PVMAGIC;

    fwrite(&pv, (size_t)1, (size_t)sizeof(pv), outf);
    for (; i!=0; i--) {
        int j;
        for (j = 0; j<pv.frameBsize/sizeof(MYFLT); j ++) {
            char term;
            MYFLT data = getnum(inf, &term);
            fwrite(&data, (size_t)1, (size_t)sizeof(MYFLT),outf);
            if (term!=',' && term!='\n') fprintf(stderr, Str(X_473,"Sync error\n"));
        }
    }
    fclose(inf);
    fclose(outf);
    return 0;
}

MYFLT getnum(FILE* inf, char *term)
{
    char buff[100];
    int  cc;
    int p = 0;
    while ((cc=getc(inf))!=',' && cc!='\n') buff[p++] = cc;
    buff[p]='\0';
    *term = cc;
    return (MYFLT)atof(buff);
}

void usage(int argc)
{
    fprintf(stderr, Str(X_1139,"pv_export usage: pvfile commafile\n"));
    fprintf(stderr, "argc=%d\n", argc);
    exit(1);
}

