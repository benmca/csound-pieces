/*                                                              pvinterp.h    */

#include "ugens8.h"

typedef struct {
    OPDS    h;
    MYFLT  *ktimpnt, *ifilno;
    MEMFIL      *mfp;
    long    maxFr, frSiz, prFlg;
    /* base Frame (in frameData0) and maximum frame on file, ptr to fr, size */
    MYFLT   frPktim, frPrtim, asr, *frPtr;
    AUXCH   auxch;
    MYFLT   *lastPhase, *fftBuf;  /* [PVFFTSIZE] FFT works on Real & Imag */
        MYFLT   *buf;
} PVBUFREAD;


typedef struct {
    OPDS    h;
    MYFLT   *rslt, *ktimpnt, *kfmod, *ifilno,
            *kfreqscale1, *kfreqscale2, *kampscale1, *kampscale2,
            *kfreqinterp, *kampinterp;

    MEMFIL  *mfp;
    long    kcnt;
    long    baseFr, maxFr, frSiz, prFlg, opBpos;
     /* base Frame (in frameData0) and maximum frame on file, ptr to fr, size */
    MYFLT   frPktim, frPrtim, scale, asr, *frPtr, lastPex, *plut;
     /* asr is analysis sample rate */
     /* fft frames per k-time (equals phase change expansion factor) */
    AUXCH   auxch;      /* manage AUXDS for the following 5 buffer spaces */
    MYFLT   *lastPhase; /* [PVDATASIZE] Keep track of cum. phase */
    MYFLT   *fftBuf;    /* [PVFFTSIZE]  FFT works on Real & Imag */
    MYFLT   *dsBuf;     /* [PVFFTSIZE]  Output of downsampling may be 2x */
    MYFLT   *outBuf;    /* [PVFFTSIZE]  Output buffer over win length */
    MYFLT   *window;    /* [PVWINLEN]   Store 1/2 window */
    PVBUFREAD *pvbufread;

} PVINTERP;


typedef struct {
    OPDS    h;
    MYFLT   *rslt, *ktimpnt, *kfmod, *ifilno,
            *kampscale1, *kampscale2, *ispecwp;
    MEMFIL  *mfp;
    long    kcnt;
    long    baseFr, maxFr, frSiz, prFlg, opBpos;
     /* base Frame (in frameData0) and maximum frame on file, ptr to fr, size */
    MYFLT   frPktim, frPrtim, scale, asr, *frPtr, lastPex, *plut;
     /* asr is analysis sample rate */
     /* fft frames per k-time (equals phase change expansion factor) */
    AUXCH   auxch;      /* manage AUXDS for the following 5 buffer spaces */
    MYFLT   *lastPhase; /* [PVDATASIZE] Keep track of cum. phase */
    MYFLT   *fftBuf;    /* [PVFFTSIZE]  FFT works on Real & Imag */
    MYFLT   *dsBuf;     /* [PVFFTSIZE]  Output of downsampling may be 2x */
    MYFLT   *outBuf;    /* [PVFFTSIZE]  Output buffer over win length */
    MYFLT   *window;    /* [PVWINLEN]   Store 1/2 window */
    PVBUFREAD *pvbufread;

} PVCROSS;
