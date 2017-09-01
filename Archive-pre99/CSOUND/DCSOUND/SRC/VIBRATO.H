typedef struct	{	/* gab d5*/
	OPDS	h;
	MYFLT	*out, *min, *max;
} RANGERAND;

typedef struct	{	/* gab d5*/
	OPDS	h;
	MYFLT	*out, *tableNum;
	int		pfn;
	FUNC	*ftp;
} DURAND;

typedef struct	{	/* gab d5*/
	OPDS	h;
	MYFLT	*out, *min,*max,*tableNum;
	int		pfn;
	FUNC	*ftp;
} CURAND;

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ar, *min, *max, *xcps;
	short	cpscod;
    long	phs;
	MYFLT	num1, num2, dfdmax;
} RANDOMI; 

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ar, *min, *max, *xcps;
	short	cpscod;
	long	phs;
	MYFLT	num1;
} RANDOMH;

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*out, *gamp, *amp1, *cps1, *amp2, *cps2, *amp3, *cps3;
	int	    flag;
    long	phs1,phs2,phs3;
	MYFLT	num1a,num2a, dfdmax1,num1b,num2b, dfdmax2,num1c,num2c, dfdmax3;
} JITTER2; 


typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ar, *amp, *cpsMin, *cpsMax;
	MYFLT	xcps;
    long	phs;
	int initflag;
	MYFLT	num1, num2, dfdmax;
} JITTER; 

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ar, *amp, *cpsMin, *cpsMax;
	double	si;
    double	phs;
	int initflag, cod;
	MYFLT	num0, num1, num2, df0, df1,c3, c2;
} JITTERS; 


typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ar, *rangeMin, *rangeMax, *cpsMin, *cpsMax;
	double	si;
    double	phs;
	int initflag, cod;
	MYFLT	num0, num1, num2, df0, df1,c3, c2;
} RANDOM3; 

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*out, *AverageAmp,*AverageFreq, *randAmountAmp, *randAmountFreq; 
	MYFLT	*ampMinRate, *ampMaxRate, *cpsMinRate, *cpsMaxRate, *ifn, *iphs;
	MYFLT	xcpsAmpRate, xcpsFreqRate;
	double	lphs, tablenUPkr;
    long	tablen, phsAmpRate, phsFreqRate;
	MYFLT	num1amp, num2amp, num1freq, num2freq, dfdmaxAmp, dfdmaxFreq;
	FUNC	*ftp;
} VIBRATO; 


typedef struct {  
	OPDS	h;
	MYFLT	*out, *AverageAmp,*AverageFreq,*ifn; 
	MYFLT	xcpsAmpRate, xcpsFreqRate;
	double	lphs, tablenUPkr;
    long	tablen, phsAmpRate, phsFreqRate;
	MYFLT	num1amp, num2amp, num1freq, num2freq, dfdmaxAmp, dfdmaxFreq;
	FUNC	*ftp;
} VIBR; 
/*
typedef struct { 
	OPDS	h;
	MYFLT	*out, *AverageAmp,*AverageFreq,*ifn; 
	MYFLT	xcpsAmpRate, xcpsFreqRate;
	double	lphs, tablenUPkr;
    MYFLT	tablen, phsAmpRate, phsFreqRate;
	MYFLT	num1amp, num2amp, num1freq, num2freq, dfdmaxAmp, dfdmaxFreq;
	FUNC	*ftp;
} VIBR; 
*/
typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kcf, *kbw, *ord, *iscl, *istor;
	int     scale, loop;
	MYFLT	c1, c2, c3, *yt1, *yt2, cosf, prvcf, prvbw;
	AUXCH	aux;
} KRESONX;

typedef struct {  /* gab f1 */
	OPDS	h;
	MYFLT	*kr, *ksig, *ktime;
	MYFLT	current_val, current_time, incr, val_incremented, old_time;
	int flag;
} LINETO; 

typedef struct {  /* gab f1 */
	OPDS	h;
	MYFLT	*kr, *ksig, *ktime, *ktrig;
	MYFLT	current_val, current_time, incr, val_incremented, old_time;
	int flag;
} LINETO2; 

extern long holdrand;

#define oneUp31Bit		(double) (4.656612875245796924105750827168e-10)
#define randGab   (MYFLT)((double) (((holdrand = holdrand * 214013L + 2531011L) >> 1) & 0x7fffffff) * oneUp31Bit)
#define BiRandGab   (MYFLT)((double) (holdrand = holdrand * -214013L + 2531011L) * oneUp31Bit)


typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *kinterp, *ixmode, *outargs[VARGMAX];
} MTABLEI;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *kinterp, *ixmode, *outargs[VARGMAX];
	int nargs;
	MYFLT  	xbmul;
	long  pfn, len;
	MYFLT	*ftable;
} MTABLE;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *ixmode, *inargs[VARGMAX];
} MTABLEIW;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *ixmode, *inargs[VARGMAX];
	int nargs;
	MYFLT  	xbmul;
	long  pfn, len;
	MYFLT	*ftable;
} MTABLEW;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *inargs[VARGMAX];
} MTABIW;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *inargs[VARGMAX];
	int nargs;
	//MYFLT  	xbmul;
	long  pfn, len;
	MYFLT	*ftable;
} MTABW;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *outargs[VARGMAX];
} MTABI;

typedef struct {
	OPDS	h;
	MYFLT	*xndx, *xfn, *outargs[VARGMAX];
	int nargs;
	//MYFLT  	xbmul;
	long  pfn, len;
	MYFLT	*ftable;
} MTAB;

typedef struct {
	OPDS	h;
	MYFLT	*rslt, *xndx, *xfn, *ixmode;
	MYFLT  	xbmul;
	FUNC	*ftp;
} FASTAB;


typedef struct {
	OPDS	h;
	MYFLT	*sr, *xcps, *iphs;
	double	curphs;
	int flag;
} METRO;

typedef struct {
	OPDS	h;
	MYFLT	*out, *freq,*retrig, *argums[VARGMAX];
	double	phs;
	int	nsegs;
} LOOPSEG;	 


typedef struct {
    OPDS    h;
    MYFLT   *sr, *kamp, *kcps, *ifn, *ifreqtbl, *iamptbl, *icnt, *iphs;
    FUNC    *ftp;
    FUNC    *freqtp;
    FUNC    *amptp;
    int     count;
    int     inerr;
    AUXCH   lphs;
	MYFLT	*previousAmp;
} ADSYNT2;




/*====================
opcodes from Jens Groh
======================*/

typedef struct {
    OPDS    h;
    MYFLT   *ifilcod;
} PRINTI; 

typedef struct { /* for nlalp opcode */
   OPDS h; /* header */
   MYFLT *aresult; /* resulting signal */
   MYFLT *ainsig; /* input signal */
   MYFLT *klfact; /* linear factor */
   MYFLT *knfact; /* nonlinear factor */
   MYFLT *istor; /* initial storage disposition */
   double m0; /* energy storage */
   double m1; /* energy storage */
} NLALP; 
