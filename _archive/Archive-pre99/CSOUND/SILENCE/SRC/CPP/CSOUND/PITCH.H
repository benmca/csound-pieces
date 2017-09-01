                        /*                                      PITCH.H */

typedef struct {
        OPDS    h;
        MYFLT   *koct, *kamp;
        MYFLT   *asig;
        MYFLT   *iprd, *ilo, *ihi, *idbthresh;
                                /* Optional */
        MYFLT   *ifrqs, *iconf, *istrt, *iocts, *iq, *inptls, *irolloff, *istor;
        MYFLT   c1, c2, prvq;
#define MAXFRQS 120
        SPECDAT wsig;
        int     nfreqs, ncoefs, dbout, scountdown, timcount;
        MYFLT   curq, *sinp, *cosp, *linbufp;
        int     winlen[MAXFRQS], offset[MAXFRQS];
        DOWNDAT downsig;
        WINDAT  sinwindow, octwindow;
        AUXCH   auxch1, auxch2;
        int     pdist[MAXPTL], nptls, rolloff;
        MYFLT   pmult[MAXPTL], confact, kvalsav, kval, kavl, kinc, kanc;
        MYFLT   *flop, *fhip, *fundp, *oct0p, threshon, threshoff;
        int     winpts, jmpcount, playing;
        SPECDAT wfund;
} PITCH;


typedef struct {
        OPDS    h;
        MYFLT   *cnt;
        int     c;
} CLOCK;

typedef struct {
        OPDS    h;
        MYFLT   *r;
        MYFLT   *a;
} CLKRD;

typedef struct {
        OPDS    h;
        MYFLT   *cnt;
        MYFLT   *ins;
} INSTCNT;

typedef struct {
    OPDS        h;
    MYFLT       *instrnum, *ipercent;
} CPU_PERC;

typedef struct {
    OPDS    h;
    MYFLT   *sr, *kamp, *kcps, *ifn, *ifreqtbl, *iamptbl, *icnt, *iphs;
    FUNC    *ftp;
    FUNC    *freqtp;
    FUNC    *amptp;
    int     count;
    int     inerr;
    AUXCH   lphs;
} ADSYNT;

typedef struct {
    OPDS        h;
    MYFLT       *sr, *kamp, *ktona, *kbrite, *ibasef, *ifn;
    MYFLT       *imixtbl, *ioctcnt, *iphs;
    long        lphs[10];
    int         octcnt;
    MYFLT       prevamp;
    FUNC        *ftp;
    FUNC        *mixtp;
} HSBOSC;

typedef struct {
    OPDS    h;
    MYFLT   *kcps, *krms, *asig, *imincps, *imaxcps, *icps,
            *imedi, *idowns, *iexcps, *irmsmedi;
    MYFLT   srate;
    MYFLT   lastval;
    long    downsamp;
    long    upsamp;
    long    minperi;
    long    maxperi;
    long    index;
    long    readp;
    long    size;
    long    peri;
    long    medisize;
    long    mediptr;
    long    rmsmedisize;
    long    rmsmediptr;
    int     inerr;
    AUXCH   median;
    AUXCH   rmsmedian;
    AUXCH   buffer;
} PITCHAMDF;

typedef struct {
        OPDS    h;
        MYFLT   *sr, *xcps, *kindx, *icnt, *iphs;
        AUXCH   curphs;
} PHSORBNK;

/* pinkish opcode... Two methods for generating pink noise */

/* Gardner method space req */
#define GRD_MAX_RANDOM_ROWS   (32)

typedef struct {
    OPDS        h;
    MYFLT       *aout;
    MYFLT       *xin, *imethod, *iparam1, *iseed, *iskip;
    long        ampinc;         /* Scale output to range */
    unsigned long randSeed;     /* Used by local random generator */
                                /* for Paul Kellet's filter bank */
    double      b0, b1, b2, b3, b4, b5, b6;
                                /* for Gardner method */
    long        grd_Rows[GRD_MAX_RANDOM_ROWS];
    long        grd_NumRows;    /* Number of rows (octave bands of noise) */
    long        grd_RunningSum; /* Used to optimize summing of generators. */
    int         grd_Index;      /* Incremented each sample. */
    int         grd_IndexMask;  /* Index wrapped by ANDing with this mask. */
    MYFLT       grd_Scalar;     /* Used to scale to normalize generated noise. */
} PINKISH;


typedef struct {
        OPDS    h;
        MYFLT   *aout;
        MYFLT   *ain, *imethod, *limit, *iarg;
        MYFLT   arg, lim, k1, k2;
        int     meth;
} CLIP;

typedef struct {
        OPDS    h;
        MYFLT   *ar;
        MYFLT   *amp, *freq, *offset;
        int     next;
} IMPULSE;

typedef struct {
        OPDS    h;
        MYFLT   *ans;
} KSENSE;

typedef struct {
        long    cnt;
        MYFLT   alpha;
        MYFLT   val, nxtpt;
        MYFLT   c1;
} NSEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *argums[VARGMAX];
        NSEG    *cursegp;
        long    nsegs;
        long    segsrem, curcnt;
        MYFLT   curval, curinc, alpha;
        MYFLT   curx;
        AUXCH   auxch;
        long    xtra;
} TRANSEG;

typedef struct {
        OPDS    h;
        MYFLT   *rslt, *kamp, *beta;
        MYFLT   last, lastbeta, sq1mb2, ampmod;
        int     ampinc;
} VARI;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *ain, *fco, *res, *dist;
        MYFLT   ay1, ay2, aout, lastin;
} LPF18;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *ain, *rep, *len;
        AUXCH   auxch;
        int     length;         /* Length of buffer */
        int     cnt;            /* Repetions of current cycle */
        int     start;          /* Start of current cycle */
        int     current;        /* takeout point */
        int     direction;      /* Need to check direction of crossing */
        int     end;            /* Insert point */
        MYFLT   lastsamp;       /* So we can test changes */
        int     noinsert;       /* Flag to say we are losing input */
} BARRI;

typedef struct {
        OPDS    h;
        MYFLT   *sr, *xamp, *xcps, *ifn, *iphs;
        unsigned long   lphs;
        FUNC    *ftp;
} XOSC;

typedef struct {
        OPDS    h;
        MYFLT   *ans;
        MYFLT   *pnum;
} PFUN;


                        /*                                      PITCH.H */

