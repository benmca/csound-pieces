/* ***************************************************************** */
/* ******** Program to export lpanal files in tabular format. ****** */
/* ***************************************************************** */

/* ***************************************************************** */
/* John ffitch 1995 Jun 25                                           */
/* ***************************************************************** */
     
#include <stdio.h>
#include <stdlib.h>
#include "lpc.h"

void usage(void);

int main(int argc, char **argv)
{
    FILE *inf;
    FILE *outf;
    LPHEADER hdr;
    int i, j;
    char *str;
    float *coef;

    if (argc!= 3)
	usage();
    inf = fopen(argv[1], "rb");
    if (inf == NULL) {
	fprintf(stderr, "Cannot open input file %s\n", argv[1]);
	exit(1);
    }
    outf = fopen(argv[2], "w");
    if (inf == NULL) {
	fprintf(stderr, "Cannot open output file %s\n", argv[2]);
	exit(1);
    }
    if (fread(&hdr, sizeof(LPHEADER)-4, 1, inf) != 1 ||
	hdr.lpmagic != LP_MAGIC) {
	fprintf(stderr, "Failed to read LPC header\n");
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
    coef = (float *)malloc((hdr.npoles+hdr.nvals)*sizeof(float));
    for (i = 0; i<hdr.nvals; i++) {
	fread(&coef[0], sizeof(float), hdr.npoles, inf);
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

