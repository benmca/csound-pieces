/*                                                              UGENS8C.H    */

#include "ugens8.h"

typedef struct {
    OPDS    h;
    MYFLT   *kfreq, *kamp, *ktimpnt,  *ifilno, *ibin;
    MEMFIL      *mfp;
    long    kcnt;
    long    baseFr, maxFr, frSiz, prFlg;
    /* base Frame (in frameData0) and maximum frame on file, ptr to fr, size */
    MYFLT  frPrtim, *frPtr,  asr;
    AUXCH  fftBuf;              /* MYFLT fftBuf[PVFFTSIZE]; */
    long mybin;
} PVREAD;

