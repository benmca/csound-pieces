/* pvxanal.h */
#include "pvfileio.h"

typedef struct pvocex_ch {
        double  rratio;
        MYFLT   *input,         /* pointer to start of input buffer */
                *anal,          /* pointer to start of analysis buffer */
                *banal,         /* pointer to anal[1] (for FFT calls) */
                *bsyn,          /* pointer to syn[1]  (for FFT calls) */
                *nextIn,        /* pointer to next empty word in input */
                *analWindow,    /* pointer to center of analysis window */
                *i0,            /* pointer to amplitude channels */
                *i1,            /* pointer to frequency channels */
                *oi,            /* pointer to old phase channels */
                *oldInPhase;    /* pointer to start of input phase buffer */

        int     m, n;

        int     N ,             /* number of phase vocoder channels (bands) */
                M,              /* length of analWindow impulse response */
                L,              /* length of synWindow impulse response */
                D,              /* decimation factor (default will be M/8) */
                I,              /* interpolation factor (default will be I=D)*/
                W ,             /* filter overlap factor (determines M, L) */
                K,              /* set kaiser window*/
                H,              /* set vonHann window */
                analWinLen,     /* half-length of analysis window */
                synWinLen;      /* half-length of synthesis window */

                MYFLT Fexact;

        long // tmprate,        /* temporary variable */
                ibuflen,        /* length of input buffer */
                nI,             /* current input (analysis) sample */
                nMin,           /* first input (analysis) sample */
                nMax;           /* last input sample (unless EOF) */
/***************************** 6:2:91  OLD CODE **************
                                                long    origsize;
*******************************NEW CODE **********************/
                MYFLT   beta ,  /* parameter for Kaiser window */
                real,           /* real part of analysis data */
                imag,           /* imaginary part of analysis data */
                mag,            /* magnitude of analysis data */
                phase,          /* phase of analysis data */
                angleDif,       /* angle difference */
                RoverTwoPi,     /* R/D divided by 2*Pi */
                TwoPioverR,     /* 2*Pi divided by R/I */
                sum,            /* scale factor for renormalizing windows */
                ftot,           /* scale factor for calculating statistics */
                rIn,            /* decimated sampling rate */
                invR,           /* 1. / srate */
                time,           /* nI / srate */
                R ;             /* input sampling rate */
        int     i,j,k,          /* index variables */
                Dd,             /* number of new inputs to read (Dd <= D) */
                N2,             /* N/2 */
                NO,             /* synthesis NO = N / P */
                NO2,            /* NO/2 */
                Mf,             /* flag for even M */
                Lf,             /* flag for even L */
                flag,           /* end-of-input flag */
                X;              /* flag for magnitude output */

        float   srate;          /* sample rate from header on stdin */
        float   timecheckf;
        long    isr,            /* sampling rate */
        Nchans;                 /* no of chans */

        /* my vars */
        int vH;                 /* von Hann window */
/*      pvocmode m_mode; */
        long  bin_index;        /* index into oldOutPhase to do fast norm_phase */
        float *synWindow_base;
        MYFLT *analWindow_base;

} PVX;

#define MAXPVXCHANS (8)



