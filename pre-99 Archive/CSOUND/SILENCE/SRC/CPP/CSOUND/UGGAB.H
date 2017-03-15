/********************************************/
/* wrap and mirror UGs by Gabriel Maldonado */
/********************************************/

typedef struct {
    OPDS  h;
    MYFLT *xdest, *xsig, *xlow, *xhigh;
} WRAP;


typedef struct {
    OPDS  h;
    MYFLT *kout, *ksig, *kthreshold, *kmode;
    MYFLT old_sig;
} TRIG;


typedef struct {
    OPDS  h;
    MYFLT *r, *val1, *val2, *point, *imin, *imax;
    MYFLT point_factor;
} INTERPOL;


typedef struct  {
    OPDS        h;
    MYFLT       *out, *amp, *freq, *ift, *iphs;
    FUNC        *ftp;
    long        tablen;
    double      phs;
} POSC;

typedef struct  {
    OPDS        h;
    MYFLT       *out, *amp, *freq, *kloop, *kend, *ift, *iphs;
    FUNC        *ftp;
    long        tablen;
    MYFLT       fsr;
    double      phs, looplength;
} LPOSC;

typedef struct {
    OPDS        h;
    MYFLT       *ar, *argums[VARGMAX];
} SUM;

typedef struct {
    OPDS        h;
    MYFLT       *ar, *asig, *kcf, *kbw, *ord, *sep, *iflag, *iscl, *istor;
    int         scale, loop;
    AUXCH       aux;
    MYFLT       *yt1, *yt2;
} RESONY;

typedef struct {
    OPDS        h;
    MYFLT       *ar, *asig, *kincr ;
    double      index;
    long        sample_index;
    MYFLT       value;
} FOLD;

typedef struct {
        OPDS    h;
        MYFLT   *out, *freq,*retrig, *argums[VARGMAX];
        double  phs;
        int     nsegs;
} LOOPSEG;

typedef struct {  /* gab f1 */
        OPDS    h;
        MYFLT   *kr, *ksig, *ktime;
        MYFLT   current_val, current_time, incr, val_incremented, old_time;
        int flag;
} LINETO;

typedef struct {  /* gab f1 */
        OPDS    h;
        MYFLT   *kr, *ksig, *ktime, *ktrig;
        MYFLT   current_val, current_time, incr, val_incremented, old_time;
        int flag;
} LINETO2;

typedef struct {
        OPDS    h;
        MYFLT   *out, *AverageAmp,*AverageFreq, *randAmountAmp, *randAmountFreq;
        MYFLT   *ampMinRate, *ampMaxRate, *cpsMinRate, *cpsMaxRate, *ifn, *iphs;
        MYFLT   xcpsAmpRate, xcpsFreqRate;
        double  lphs, tablenUPkr;
        long    tablen, phsAmpRate, phsFreqRate;
        MYFLT   num1amp, num2amp, num1freq, num2freq, dfdmaxAmp, dfdmaxFreq;
        FUNC    *ftp;
} VIBRATO;


typedef struct {
        OPDS    h;
        MYFLT   *out, *AverageAmp,*AverageFreq,*ifn;
        MYFLT   xcpsAmpRate, xcpsFreqRate;
        double  lphs, tablenUPkr;
        long    tablen, phsAmpRate, phsFreqRate;
        MYFLT   num1amp, num2amp, num1freq, num2freq, dfdmaxAmp, dfdmaxFreq;
        FUNC    *ftp;
} VIBR;

typedef struct {
        OPDS    h;
        MYFLT   *out, *gamp, *amp1, *cps1, *amp2, *cps2, *amp3, *cps3;
        int     flag;
        long    phs1,phs2,phs3;
        MYFLT   num1a,num2a, dfdmax1,num1b,num2b, dfdmax2,num1c,num2c, dfdmax3;
} JITTER2;


typedef struct {
        OPDS    h;
        MYFLT   *ar, *amp, *cpsMin, *cpsMax;
        MYFLT   xcps;
        long    phs;
        int     initflag;
        MYFLT   num1, num2, dfdmax;
} JITTER;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *amp, *cpsMin, *cpsMax;
        double  si;
        double  phs;
        int     initflag, cod;
        MYFLT   num0, num1, num2, df0, df1,c3, c2;
} JITTERS;


extern long holdrand;

#define oneUp31Bit      (4.656612875245796924105750827168e-10)
#define randGab         (MYFLT)((double) \
               (((holdrand=holdrand*214013L+2531011L)>>1)&0x7fffffff)*oneUp31Bit)
#define BiRandGab   (MYFLT)((double) \
               (holdrand = holdrand*(-214013L) + 2531011L)*oneUp31Bit)

typedef struct  {
        OPDS    h;
        MYFLT   *out, *tableNum;
        int     pfn;
        FUNC    *ftp;
} DURAND;

typedef struct  {
        OPDS    h;
        MYFLT   *out, *min, *max, *tableNum;
        int     pfn;
        FUNC    *ftp;
} CURAND;

typedef struct  {
        OPDS    h;
        MYFLT   *out, *min, *max;
} RANGERAND;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *min, *max, *xcps;
        short   cpscod;
        long    phs;
        MYFLT   num1, num2, dfdmax;
} RANDOMI;

typedef struct {
        OPDS    h;
        MYFLT   *ar, *min, *max, *xcps;
        short   cpscod;
        long    phs;
        MYFLT   num1;
} RANDOMH;


typedef struct {
        OPDS    h;
        MYFLT   *ar, *rangeMin, *rangeMax, *cpsMin, *cpsMax;
        double  si;
        double  phs;
        int initflag, cod;
        MYFLT   num0, num1, num2, df0, df1,c3, c2;
} RANDOM3;

