                /*                                      SPECTRA.H       */

#define MAXFRQS 120

typedef struct {
        OPDS    h;
        SPECDAT *wsig;
        MYFLT   *signal,*iprd,*iocts,*ifrqs,*iq,*ihann;
        MYFLT   *idbout,*idisprd,*idsines;
        int     nfreqs, hanning, ncoefs, dbout, nsmps, scountdown, timcount;
        MYFLT   curq, *sinp, *cosp, *linbufp;
        int     disprd, dcountdown, winlen[MAXFRQS], offset[MAXFRQS];
        DOWNDAT downsig;
        WINDAT  sinwindow, octwindow;
        AUXCH   auxch1, auxch2;
} SPECTRUM;

#ifdef never
typedef struct {
        OPDS    h;
        SPECDAT *wsig;
        DOWNDAT *dsig;
        MYFLT   *iprd, *ifrqs, *iq, *ihann, *idbout, *idsines;
        int     nfreqs, hanning, ncoefs, dbout;
        MYFLT   curq, *sinp, *cosp, *linbufp;
        int     countdown, timcount, winlen[MAXFRQS];
        WINDAT  dwindow;
        AUXCH   auxch;
} NOCTDFT;
#endif

typedef struct {
        OPDS    h;
        SPECDAT *wsig;
        MYFLT   *iprd, *iwtflg;
        int     countdown, timcount;
        WINDAT  dwindow;
} SPECDISP;

#define MAXPTL 10

typedef struct {
        OPDS    h;
        MYFLT   *koct, *kamp;
        SPECDAT *wsig;
        MYFLT   *kvar, *ilo, *ihi, *istrt, *idbthresh, *inptls, *irolloff;
        MYFLT   *iodd, *iconf, *interp, *ifprd, *iwtflg;
        int     pdist[MAXPTL], nptls, rolloff, kinterp, ftimcnt;
        MYFLT   pmult[MAXPTL], confact, kvalsav, kval, kavl, kinc, kanc;
        MYFLT   *flop, *fhip, *fundp, *oct0p, threshon, threshoff;
        int     winpts, jmpcount, playing;
        SPECDAT wfund;
        SPECDISP fdisplay;
} SPECPTRK;

typedef struct {
        OPDS    h;
        MYFLT   *ksum;
        SPECDAT *wsig;
        MYFLT   *interp;
        int     kinterp;
        MYFLT   kval, kinc;
} SPECSUM;

typedef struct {
        OPDS    h;
        SPECDAT *waddm;
        SPECDAT *wsig1, *wsig2;
        MYFLT   *imul2;
        MYFLT   mul2;
} SPECADDM;

typedef struct {
        OPDS    h;
        SPECDAT *wdiff;
        SPECDAT *wsig;
        SPECDAT specsave;
} SPECDIFF;

typedef struct {
        OPDS    h;
        SPECDAT *wscaled;
        SPECDAT *wsig;
        MYFLT   *ifscale, *ifthresh;
        int     thresh;
        MYFLT   *fscale, *fthresh;
        AUXCH   auxch;
} SPECSCAL;

typedef struct {
        OPDS    h;
        SPECDAT *wacout;
        SPECDAT *wsig;
        SPECDAT accumer;
} SPECHIST;

typedef struct {
        OPDS    h;
        SPECDAT *wfil;
        SPECDAT *wsig;
        MYFLT   *ifhtim;
        MYFLT   *coefs, *states;
        AUXCH   auxch;
} SPECFILT;
