/* ***************************************************************** */
/* ******** Program to export pvoc files in tabular format. ******** */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jun 17                                           */
/* ***************************************************************** */
     
#include <stdio.h>
#include <stdlib.h>
#include "pvoc.h"

void usage(int);

#include <stdarg.h>

void mfree(void *p)
{
    free(p);
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
    float *data;

    if (argc!= 3)
        usage(argc);
    inf = fopen(argv[1], "rb");
    if (inf == NULL) {
        err_printf( "Cannot open input file %s\n", argv[1]);
        exit(1);
    }
    outf = fopen(argv[2], "w");
    if (inf == NULL) {
        err_printf( "Cannot open output file %s\n", argv[2]);
        exit(1);
    }
    if ((i = PVReadHdr(inf, &pv)) != PVE_OK) {
        char *msg;
        switch (i) {
        case PVE_NOPEN:
            msg = "could not open file";
            break;
        case PVE_NPV:
            msg = "not a PVOC file";
            break;
        case PVE_MALLOC:
            msg = "could not allocate memory";
            break;
        case PVE_RDERR:
            msg = "read error";
            break;
        case PVE_WRERR:
            msg = "write error";
            break;
        }
        err_printf( "Error reading PV header: %s\n", msg);
        exit(1);
    }
    fprintf(outf, "ByteOffset,DataSize,dFormat,Rate,Channels,FrameSize,FrameInc,BSize,frameFormat,MinFreq,MaxFreq,LogLin\n");
    fprintf(outf, "%ld,%ld,%ld,%g,%ld,%ld,%ld,%ld,%ld,%g,%g,%ld\n",
            pv.headBsize, pv.dataBsize, pv.dataFormat, pv.samplingRate,
            pv.channels, pv.frameSize, pv.frameIncr, pv.frameBsize,
            pv.frameFormat, pv.minFreq, pv.maxFreq, pv.freqFormat);
    i = pv.dataBsize/pv.frameBsize;
    data = (float*) malloc(pv.frameBsize);
    for (; i!=0; i--) {
        int j;
        fread(data, (size_t)1, (size_t)pv.frameBsize, inf);
        for (j = 0; j<pv.frameBsize/sizeof(float); j ++)
            fprintf(outf, "%s%g", (j==0 ? "" : ","), data[j]);
        fprintf(outf, "\n");
    }
    fclose(inf);
    fclose(outf);
    return 0;
}

void usage(int argc)
{
    err_printf( "pv_export usage: pvfile commafile\n");
    err_printf( "argc=%d\n", argc);
    exit(1);
}
