/* ***************************************************************** */
/* ******** Program to export pvoc files in tabular format. ******** */
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

void mfree(void *x)
{
    free(x);
}

int main(int argc, char **argv)
{
    PVSTRUCT pv;
    FILE *inf;
    FILE *outf;
    int i;
    MYFLT *data;

    init_getstring(0, NULL);
    if (argc!= 3)
        usage(argc);
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
    if ((i = PVReadHdr(inf, &pv)) != PVE_OK) {
        char *msg;
        switch (i) {
        case PVE_NOPEN:
            msg = Str(X_670,"could not open file");
            break;
        case PVE_NPV:
            msg = Str(X_1077,"not a PVOC file");
            break;
        case PVE_MALLOC:
            msg = Str(X_668,"could not allocate memory");
            break;
        case PVE_RDERR:
            msg = Str(X_1150,"read error");
            break;
        case PVE_WRERR:
            msg = Str(X_1381,"write error");
            break;
        }
        fprintf(stderr, Str(X_256,"Error reading PV header: %s\n"), msg);
        exit(1);
    }
    fprintf(outf, "ByteOffset,DataSize,dFormat,Rate,Channels,FrameSize,FrameInc,BSize,frameFormat,MinFreq,MaxFreq,LogLin\n");
    fprintf(outf, "%ld,%ld,%ld,%g,%ld,%ld,%ld,%ld,%ld,%g,%g,%ld\n",
            pv.headBsize, pv.dataBsize, pv.dataFormat, pv.samplingRate,
            pv.channels, pv.frameSize, pv.frameIncr, pv.frameBsize,
            pv.frameFormat, pv.minFreq, pv.maxFreq, pv.freqFormat);
    i = pv.dataBsize/pv.frameBsize;
    data = (MYFLT*) malloc(pv.frameBsize);
    for (; i!=0; i--) {
        int j;
        fread(data, (size_t)1, (size_t)pv.frameBsize, inf);
        for (j = 0; j<pv.frameBsize/sizeof(MYFLT); j ++)
            fprintf(outf, "%s%g", (j==0 ? "" : ","), data[j]);
        fprintf(outf, "\n");
    }
    fclose(inf);
    fclose(outf);
    return 0;
}

void usage(int argc)
{
    fprintf(stderr, Str(X_1139,"pv_export usage: pvfile commafile\n"));
    fprintf(stderr, "argc=%d\n", argc);
    exit(1);
}

int err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
}

