/*                                                      PVADD.H    */

#define     MAXBINS         4096
#ifndef PVFRAMSIZE
#define     PVFRAMSIZE      8192                /* i.e. max FFT point size */
#endif
#define     PVFFTSIZE       (2*PVFRAMSIZE)      /* 2x for real + imag */
#define     pvfrsiz(p)      (p->frSiz)

typedef struct {
    OPDS    h;
    MYFLT   *rslt, *ktimpnt, *kfmod, *ifilno, *ifn, *ibins;
    MYFLT   *ibinoffset, *ibinincr, *imode, *ifreqlim, *igatefun;
    MEMFIL  *mfp;
    FUNC *ftp, *AmpGateFunc;
    AUXCH   auxch;
    MYFLT   *oscphase, *buf, *pvcopy, PvMaxAmp;
    MYFLT   frPktim, frPrtim, *frPtr, asr;
    long    maxFr, frSiz, prFlg, mems;
    int     maxbin;
} PVADD;

