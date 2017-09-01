/*      					 		UGENS9.H    */

typedef struct {
    OPDS    h;
    MYFLT   *ar1,*ar2,*ar3,*ar4,*ain,*ifilno,*channel;
    MEMFIL  *mfp;
    long    Hlen, Hlenpadded,incount,outcnt,obufsiz;
    int     nchnls; /* number of channels we are actually processing */
    MYFLT   *H,*cvlut,*outhead,*outail,*obufend;
    AUXCH   auxch;    /* use AUXDS to manage the following buffer spaces */
    MYFLT   *fftbuf;  /* [Hlenpadded + 2] (general FFT working buffer) */
    MYFLT   *olap;    /* [(Hlen - 1) * nchnls] (samples to overlap on next run) */
    MYFLT   *outbuf;  /* (to store output audio if 
                        ((Hlen > ksmps) && !(multiple of ksmps)), or 
                        ((Hlen < ksmps) && !(submultiple of ksmps)) */
    MYFLT   *X;       /* [Hlenpadded + 2] (holds transform of input audio -
                         only required for multi-channel output)   */
} CONVOLVE;

