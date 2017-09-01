
typedef struct {
        FUNC *function, *nxtfunction;
        MYFLT d;
        long   cnt;
} TSEG;

typedef struct {
        OPDS    h;
        MYFLT   *argums[VARGMAX];
        TSEG    *cursegp;
        FUNC    *outfunc;
        long    nsegs;
        AUXCH   auxch;
} TABLESEG;

#include "ugens8.h"

typedef struct {
    OPDS    h;
    MYFLT   *rslt, *ktimpnt, *kfmod, *ifilno, *ispecwp, *isegtab;
    char    *strarg;
    MEMFIL  *mfp;
    long    kcnt;
    long    baseFr, maxFr, frSiz, prFlg, opBpos;
      /* base Frame (in frameData0) and maximum frame on file, ptr to fr, size */
    MYFLT   frPktim, frPrtim, scale, asr, *frPtr, lastPex, *plut;
      /* asr is analysis sample rate */
      /* fft frames per k-time (equals phase change expansion factor) */
    AUXCH   auxch;              /* manage AUXDS for the following 5 buffer spaces */
    MYFLT   *lastPhase;         /* [PVDATASIZE] Keep track of cum. phase */
    MYFLT   *fftBuf;            /* [PVFFTSIZE]  FFT works on Real & Imag */
    MYFLT   *dsBuf;             /* [PVFFTSIZE]  Output of downsampling may be 2x */
    MYFLT   *outBuf;            /* [PVFFTSIZE]  Output buffer over win length */
    MYFLT   *window;            /* [PVWINLEN]   Store 1/2 window */
    TABLESEG *tableseg;
    AUXCH   auxtab;             /* For table is all else fails */
} VPVOC;



