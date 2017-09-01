#include "cs.h"		/*					AOPS.C	*/
#include "aops.h"
#include <math.h>
#include <time.h>

static	double	eipt3=8.3333333, oct;
static	double	logtwo=0.693147;

#define FZERO	FL(0.0)

extern  double  onept, log10d20;
extern	MYFLT 	*spin, *spout;
extern  int     spoutactive;

void rassign(ASSIGN *p)
{
	*p->r = *p->a;  /* still not quite right */
}

void assign(ASSIGN *p)
{
	*p->r = *p->a;
}

void aassign(ASSIGN *p)
{
        MYFLT 	*r, *a;
	int	nsmps = ksmps;

 	r = p->r;
	a = p->a;
	if (p->XINCODE) {
		do *r++ = *a++;
		while (--nsmps);
	}
	else {
		do *r++ = *a;
		while (--nsmps);
	}
}

void init(ASSIGN *p)
{
	*p->r = *p->a;
}

void ainit(ASSIGN *p)
{
        MYFLT	*r, *a;
	int	nsmps = ksmps;

 	r = p->r;
	a = p->a;
	do  *r++ = *a;
	while (--nsmps);
}

#define	RELATN(OPNAME,OP) void OPNAME(RELAT *p) { *p->rbool = (*p->a OP *p->b) ? 1 : 0; /* printf("bool = %d\n",*p->rbool);*/ }

RELATN(gt,>)
RELATN(ge,>=)
RELATN(lt,<)
RELATN(le,<=)
RELATN(eq,==)
RELATN(ne,!=)

#define	LOGCLX(OPNAME,OP) void OPNAME(LOGCL *p) { *p->rbool = (*p->ibool OP *p->jbool) ? 1 : 0; }

LOGCLX(and,&&)
LOGCLX(or,||)

#define	KK(OPNAME,OP) void OPNAME(AOP *p) { *p->r = *p->a OP *p->b; }

KK(addkk,+)
KK(subkk,-)
KK(mulkk,*)
KK(divkk,/)

MYFLT MOD(MYFLT a, MYFLT bb)
{
    if (bb==FL(0.0)) return FL(0.0);
    else {
      MYFLT b = (bb<0 ? -bb : bb);
/*        MYFLT b100 = b*100.0f; */
/*        MYFLT b10000 = b*10000.0f; */
/*        MYFLT b1000000 = b*1000000.0f; */
/*        printf("MOD(%f,%f)=", a, b); fflush(stdout); */
/*        while (a>b1000000) a -= b1000000; */
/*        while (a>b10000) a -= b10000; */
/*        while (a>b100) a -= b100; */
/*        while (a>b) a -= b; */
/*        while (-a>b1000000) a += b1000000; */
/*        while (-a>b10000) a += b10000; */
/*        while (-a>b100) a += b100; */
/*        while (-a>b) a += b; */
      int d = (int)(a / b);
/*        printf("MOD(%f,%f)=[d=%d]", a, b, d); fflush(stdout); */
      a -= d * b;
      while (a>b) a -= b;
      while (-a>b) a += b;
/*        printf("%f\n", a); */
      return a;
    }
}

void modkk(AOP *p)
{
    *p->r = MOD(*p->a, *p->b);
}

#define KA(OPNAME,OP) void OPNAME(AOP *p) {	\
	int	nsmps = ksmps;		        \
	MYFLT	*r, a, *b;		        \
	r = p->r;				\
	a = *p->a;				\
	b = p->b;				\
	do *r++ = a OP *b++;			\
	while (--nsmps);			\
}

KA(addka,+)
KA(subka,-)
KA(mulka,*)
KA(divka,/)

void modka(AOP *p)
{
    int	nsmps = ksmps;
    MYFLT	*r, a, *b;
    r = p->r;
    a = *p->a;
    b = p->b;
    do
      *r++ = MOD(a,*b++);
    while (--nsmps);
}

#define AK(OPNAME,OP) void OPNAME(AOP *p) {	\
	int	nsmps = ksmps;		        \
	MYFLT	*r, *a, b;		        \
	r = p->r;				\
	a = p->a;				\
	b = *p->b;				\
	do *r++ = *a++ OP b;			\
	while (--nsmps);			\
}

AK(addak,+)
AK(subak,-)
AK(mulak,*)
AK(divak,/)

void modak(AOP *p) {
    int	nsmps = ksmps;
    MYFLT	*r, *a, b;
    r = p->r;
    a = p->a;
    b = *p->b;
    do *r++ = MOD(*a++, b);
    while (--nsmps);
}


#define AA(OPNAME,OP) void OPNAME(AOP *p) {	\
	int	nsmps = ksmps;		        \
	MYFLT	*r, *a, *b;		        \
	r = p->r;				\
	a = p->a;				\
	b = p->b;				\
	do *r++ = *a++ OP *b++;			\
	while (--nsmps);			\
}

AA(addaa,+)
AA(subaa,-)
AA(mulaa,*)
AA(divaa,/)

void modaa(AOP *p) {
    int	nsmps = ksmps;
    MYFLT	*r, *a, *b;
    r = p->r;
    a = p->a;
    b = p->b;
    do *r++ = MOD(*a++, *b++);
    while (--nsmps);
}

void divzkk(DIVZ *p)
{
    *p->r = (*p->b != 0.0 ? *p->a / *p->b : *p->def);
}

void divzka(DIVZ *p)
{
    int		nsmps = ksmps;
    MYFLT	*r, a, *b, def;
    r = p->r;
    a = *p->a;
    b = p->b;
    def = *p->def;
    do {
      *r++ = (*b==FL(0.0) ? def : a / *b);
      b++;
    } while (--nsmps);
}

void divzak(DIVZ *p)
{
    int		nsmps = ksmps;
    MYFLT	*r, *a, b, def;
    r = p->r;
    a = p->a;
    b = *p->b;
    def = *p->def;
    if (b==FL(0.0)) {
      do
	*r++ = def;
      while (--nsmps);
    }
    else {
      do
	*r++ = *a++ / b;
      while (--nsmps);
    }
}

void divzaa(DIVZ *p)
{
	int	nsmps = ksmps;
	MYFLT	*r, *a, *b, def;
	r = p->r;
	a = p->a;
	b = p->b;
	def = *p->def;
	do {
	  *r++ = (*b==FL(0.0) ? def : *a / *b);
	  a++; b++;
	} while (--nsmps);
}

void conval(CONVAL *p)
{
	if (*p->cond)
		*p->r = *p->a;
	else *p->r = *p->b;
}

void aconval(CONVAL *p)
{
        MYFLT	*r, *s;
	int	nsmps = ksmps;

	r = p->r;
	if (*p->cond)
		s = p->a;
	else s = p->b;
	do *r++ = *s++;
	while (--nsmps);
}

void int1(EVAL *p)				/* returns signed whole no. */
{
	double intpart;
	modf((double)*p->a, &intpart);
	*p->r = (MYFLT)intpart;
}

void frac1(EVAL *p)				/* returns positive frac part */
{
	double intpart, fracpart;
	fracpart = modf((double)*p->a, &intpart);
	*p->r = (MYFLT)fracpart;
}

static double rndfrac = .5, rndmlt = 105.947;

void rnd1(EVAL *p)              /* returns unipolar rand(x) */
{
	double intpart;
	rndfrac = modf(rndfrac * rndmlt, &intpart);
	*p->r = *p->a * (MYFLT)rndfrac;
}

void birnd1(EVAL *p)            /* returns bipolar rand(x) */
{
	double intpart;
	rndfrac = modf(rndfrac * rndmlt, &intpart);
	*p->r = *p->a * (FL(2.0) * (MYFLT)rndfrac - FL(1.0));
}

#define LIB1(OPNAME,LIBNAME)  void OPNAME(EVAL *p)	 \
				{ *p->r = (MYFLT)LIBNAME((double)*p->a); }
LIB1(abs1,fabs)
LIB1(exp01,exp)
LIB1(log01,log)
LIB1(sqrt1,sqrt)
LIB1(sin1,sin)
LIB1(cos1,cos)
LIB1(tan1,tan)
LIB1(asin1,asin)
LIB1(acos1,acos)
LIB1(atan1,atan)
LIB1(sinh1,sinh)
LIB1(cosh1,cosh)
LIB1(tanh1,tanh)
LIB1(log101,log10)
void atan21(AOP *p) { *p->r = (MYFLT)atan2((double)*p->a, (double)*p->b); }

#define LIBA(OPNAME,LIBNAME) void OPNAME(EVAL *p) {		       \
				int	nsmps = ksmps;	               \
				MYFLT	*r, *a;		               \
				r = p->r;		               \
				a = p->a;			       \
				do *r++ = (MYFLT)LIBNAME((double)*a++);\
				while (--nsmps);		       \
				}
LIBA(absa,fabs)
LIBA(expa,exp)
LIBA(loga,log)
LIBA(sqrta,sqrt)
LIBA(sina,sin)
LIBA(cosa,cos)
LIBA(tana,tan)
LIBA(asina,asin)
LIBA(acosa,acos)
LIBA(atana,atan)
LIBA(sinha,sinh)
LIBA(cosha,cosh)
LIBA(tanha,tanh)
LIBA(log10a,log10)

void atan2aa(AOP *p) {
	int	nsmps = ksmps;
	MYFLT	*r, *a, *b;
	r = p->r;
	a = p->a;
	b = p->b;
	do *r++ = (MYFLT)atan2((double)*a++, (double)*b++);
	while (--nsmps);
}

void dbamp(EVAL *p)
{
	*p->r = (MYFLT)(log(fabs((double)*p->a)) / log10d20);
}

void ampdb(EVAL *p)
{
	*p->r = (MYFLT) exp((double)*p->a * log10d20);
}

void aampdb(EVAL *p)
{
	int	nsmps = ksmps;
	MYFLT	*r, *a;
	r = p->r;
	a = p->a;
	do *r++ = (MYFLT) exp((double)*a++ * log10d20);
	while (--nsmps);
}

void dbfsamp(EVAL *p)
{
	*p->r = (MYFLT)(log(fabs((double)*p->a)/FL(32768.0)) / log10d20);
}

void ampdbfs(EVAL *p)
{
	*p->r =  FL(32767.0) * (MYFLT) exp((double)*p->a * log10d20);
}

void aampdbfs(EVAL *p)
{
	int	nsmps = ksmps;
	MYFLT	*r, *a;
	r = p->r;
	a = p->a;
	do *r++ = FL(32767.0) * (MYFLT) exp((double)*a++ * log10d20);
	while (--nsmps);
}

void ftlen(EVAL *p)
{
    FUNC	*ftp;

    if ((ftp = ftnp2find(p->a)) != NULL)
      *p->r = (MYFLT)ftp->flen;
    else *p->r = -FL(1.0);	/* Return something */
}

void ftlptim(EVAL *p)
{
	FUNC    *ftp;
        if ((ftp = ftnp2find(p->a)) == NULL) return;
	if (ftp->loopmode1)
	    *p->r = ftp->begin1 * onedsr;
	else {
	    *p->r = FL(0.0);
	    warning(Str(X_1074,"non-looping sample"));
	}
}

void numsamp(EVAL *p)		/***** nsamp by G.Maldonado ****/
{
    FUNC	*ftp;
    if ((ftp = ftfind(p->a)) != NULL)
      *p->r = (MYFLT) ftp->soundend;
    else *p->r = FL(0.0);
}

void ftsr(EVAL *p)		/**** ftsr by G.Maldonado ****/
{
    FUNC	*ftp;
    if ((ftp = ftfind(p->a)) != NULL)
      *p->r = ftp->gen01args.sample_rate;
    else
      *p->r = FL(0.0);
}

/**** ftlen2 by G.Maldonado ****/	/* gab-A1 */
FUNC   *ftfind2(MYFLT*); /*declaration*/
/* SEE FGENS.C for ftfind2() function */
void ftlen2(EVAL *p)
{
register FUNC	*ftp;

	if ((ftp = ftfind2(p->a)) != NULL)
		*p->r = (MYFLT) ftp->flen;
}
/********************************/

#ifdef LINUX
void rtclock(EVAL *p)
{
#include <sys/time.h>
#include <unistd.h>
    struct timeval tv;
    struct timezone tz;
    gettimeofday(&tv, &tz);
    *p->r = (MYFLT)tv.tv_sec + FL(0.001)*(MYFLT)tv.tv_usec;
}

#else
void rtclock(EVAL *p)
{
    time_t realtime = time(NULL);
    *p->r = (MYFLT) realtime;
}
#endif

MYFLT *cpsocint = NULL;     /* arrays & scaler for fast cpsoct conversion */
MYFLT *cpsocfrc = NULL;
MYFLT octresol = (MYFLT)OCTRES;

void cpsoctinit(void)           /* init the arrays, called by oload */
{
	MYFLT *fp;
	long  count;

	cpsocint = (MYFLT *) mmalloc((long)NOCTS * sizeof(MYFLT));
        cpsocfrc = (MYFLT *) mmalloc((long)OCTRES * sizeof(MYFLT));
	for (fp = cpsocint, count = 0; count < NOCTS; count++)
	    *fp++ = (MYFLT) pow(2.0, (double)count);
	for (fp = cpsocfrc, count = 0; count < OCTRES; count++)
	    *fp++ = (MYFLT)(pow(2.0, (double)count / (double)OCTRES) * onept);
}

void octpch(EVAL *p)
{
	double	fract;
	fract = modf((double)*p->a, &oct);
	fract *= eipt3;
	*p->r = (MYFLT) (oct + fract);
}

void pchoct(EVAL *p)
{
	double fract;
	fract = modf((double)*p->a, &oct);
	fract *= 0.12;
	*p->r = (MYFLT)(oct + fract);
}

void cpsoct(EVAL *p)
{
        long loct = (long)(*p->a * octresol);
	*p->r = (MYFLT)CPSOCTL(loct);
}

void acpsoct(EVAL *p)
{
	MYFLT	*r, *a;
	long	loct, nsmps = ksmps;
	a = p->a;
	r = p->r;
	do {
	    loct = (long)(*a++ * octresol);
	    *r++ = CPSOCTL(loct);
	} while (--nsmps);
}

void octcps(EVAL *p)
{
	*p->r = (MYFLT)(log((double)*p->a / onept) / logtwo);
}

void cpspch(EVAL *p)
{
	double	fract;
	long   loct;

	fract = modf((double) *p->a, &oct);
	fract *= eipt3;
	loct = (long) ((oct + fract) * octresol);
	*p->r = (MYFLT)CPSOCTL(loct);
/* 	err_printf("%.2f -> %f\n", *p->a, *p->r); */
}

void cpsxpch(XENH *p)
{				/* This may be too expensive */
    double  fract;
    double  loct;

/*       err_printf("pc,et,cy,ref=%.4f,%.4f,%.4f,%.4f\n",  */
/*    	       *p->pc, *p->et, *p->cy, *p->ref);  */

    fract = modf((double)*p->pc, &loct); /* Get octave */
    if (*p->et > 0) {
      fract = pow((double)*p->cy, loct + (100.0*fract)/((double)*p->et));
      *p->r = (MYFLT)fract * *p->ref;
    }
    else {			/* Values in a table */
      MYFLT t = - *p->et;
      FUNC* ftp = ftfind(&t);
      long len;
      if (ftp == NULL) {
	printf(Str(X_387,"No tuning table %d\n"), (int)(- *p->et));
	exit(1);
      }
      len = ftp->flen;
      while (fract>len) {
	fract -= len; loct++;
      }
      fract += 0.005;
      *p->r = *p->ref * *(ftp->ftable + (int)(100.0*fract)) *
        (MYFLT)pow((double)*p->cy, loct);
    }
/*      err_printf("....-> %.6f\n", *p->r);  */
}

void cps2pch(XENH *p)
{
    double  fract;
    double  loct;

    fract = modf((double)*p->pc, &loct);	/* Get octave */
    if (*p->et > 0) {
      fract = pow(2.0, loct + (100.0*fract)/((double)*p->et));
      *p->r = (MYFLT)(fract * 1.02197503906); /* Refer to base frequency */
    }
    else {
      MYFLT t = - *p->et;
      FUNC* ftp = ftfind(&t);
      long len;
      if (ftp == NULL) {
	printf(Str(X_387,"No tuning table %d\n"), (int)(- *p->et));
	exit(1);
      }
      len = ftp->flen;
      while (fract>len) {
	fract -= len; loct++;
      }
      fract += 0.005;
      *p->r = (MYFLT)(1.02197503906 * *(ftp->ftable +(int)(100.0*fract)) *
                      pow(2.0, loct));
    }

/*       double ref = 261.62561 / pow(2.0, 8.0); */
}

#define STEPS 32768
#define OCTAVES 5.
MYFLT *powerof2 = NULL; /* gab-A1 for fast power of two table  */
MYFLT *logbase2 = NULL; /* gab-A1 for fast log base 2 table */
static void init_powers(void)
{
    double incr, exp;
    int count;
    MYFLT *fp;

/*      printf("init_powers %p\n", powerof2); */
    if (powerof2!=NULL) return;
    incr = (OCTAVES +OCTAVES) / STEPS;
    exp = -OCTAVES;

    powerof2 = (MYFLT *) mmalloc((long)(STEPS+1) * sizeof(MYFLT));
    fp =  powerof2;
    for	( count = 0; count <= STEPS; count++, exp += incr)
      *fp++ = (MYFLT) pow(2.0, exp);
    powerof2 += STEPS/2;
}


#define INTERVAL 4.
static void init_logs(void)
{ /* gab for fast log base two table */
    double incr, first;
    double conv;
    MYFLT *fp;
    int count;
/*      printf("init_logs %p\n", logbase2); */
    if (logbase2!=NULL) return;
    incr = (INTERVAL - 1/INTERVAL) / STEPS;
    first = 1.0/(double)INTERVAL;
    conv = 1.0/log(2.0);
    logbase2  = (MYFLT *) mmalloc((long)(STEPS+1) * sizeof(MYFLT));
    fp = logbase2;
    for	(count = 0; count <= STEPS; count++, first +=incr)
      *fp++ = (MYFLT) (conv * log(first));
/*      printf("init_logs %p\n", logbase2); */
}

void powoftwo_set(EVAL *p)
{
/*      printf("powoftwo-set %p\n", powerof2); */
    if (powerof2==NULL) init_powers();
}

void logbasetwo_set(EVAL *p)
{
/*      printf("logbasetwo_set %p\n", logbase2); */
    if (logbase2==NULL) init_logs();
}

void powoftwo(EVAL *p)
{
    int n = (int) (*p->a * (STEPS/(OCTAVES + OCTAVES)) + FL(0.5));
/*      printf("Poweroftwo:%d %p\n", n, powerof2); */
    if (n<-STEPS/2 || n>STEPS/2) *p->r = (MYFLT)pow(2.0, (double)*p->a);
    else *p->r = powerof2[n];
}

void powoftwoa(EVAL *p) 	  /* by G.Maldonado, liberalised by JPff */
{
    MYFLT *r, *a;
    long nsmps=ksmps;
    a = p->a;
    r = p->r;
    do 	{
      MYFLT aa = *a++;
      int n = (int) (aa * (STEPS/(OCTAVES + OCTAVES)) + FL(0.5));
      if (n<-STEPS/2 || n>STEPS/2) *r++ = (MYFLT)pow(2.0, (double)aa);
      else *r++ = powerof2[n] ;
    } while (--nsmps);
}

/** GAB START -------------*/
#define pow2(x)  powerof2[(int) ((x) * (STEPS/(OCTAVES*2)) + .5)]
#define oneUp6 		0.166666666666666666666666666666667f
#define oneUp12		0.0833333333333333333333333333333333f
#define oneUp1200	8.33333333333333333333333333333333e-4f




MYFLT powof2(MYFLT x)
{
	return	pow2(x);
}

MYFLT dbFunc(MYFLT x)
{
	return pow2(x * oneUp6);
}


void semitone(EVAL *p) 	  /* by G.Maldonado */
{
	*p->r = pow2(*p->a * oneUp12);
}

void isemitone(EVAL *p)
{
    powoftwo_set(p);
    semitone(p);
}

void semitone_a(EVAL *p) 	  /* by G.Maldonado */
{
	MYFLT *r, *a;
	long nsmps=ksmps;
	a = p->a;
	r = p->r;
	do 	*r++ = pow2(*a++ * oneUp12); 
	while (--nsmps);
}

void cent(EVAL *p) 	  /* by G.Maldonado */
{
	*p->r = pow2(*p->a * oneUp1200);
}

void icent(EVAL *p)
{
    powoftwo_set(p);
    cent(p);
}

void cent_a(EVAL *p) 	  /* by G.Maldonado */
{
	MYFLT *r, *a;
	long nsmps=ksmps;
	a = p->a;
	r = p->r;
	do 	*r++ = pow2(*a++ * oneUp1200);
	while (--nsmps);
}

void db(EVAL *p) 	  /* by G.Maldonado */
{
	*p->r = pow2(*p->a * oneUp6);
}

void idb(EVAL *p)
{
    powoftwo_set(p);
    db(p);
}

void db_a(EVAL *p) 	  /* by G.Maldonado */
{
	MYFLT *r, *a;
	long nsmps=ksmps;
	a = p->a;
	r = p->r;
	do 	*r++ = pow2(*a++ * oneUp6); 
	while (--nsmps);
}

/** GAB END -------------*/


void logbasetwo(EVAL *p)
{
    int n = (int) ((*p->a -  (FL(1.0)/INTERVAL)) / (INTERVAL - FL(1.0)/INTERVAL)
                   *  STEPS + FL(0.5));
/*      printf("Logbasetwo:%d %p\n", n, logbase2); */
    if (n<0 || n>STEPS) *p->r = (MYFLT)(log((double)*p->a)/log(2.0));
    else *p->r = logbase2[n] ;
}

void logbasetwoa(EVAL *p) 	/* by G.Maldonado liberalised by JPff */
{
    MYFLT *r, *a;
    long nsmps=ksmps;
    a = p->a;
    r = p->r;
    do {
      MYFLT aa = *a++;
      int n = (int) ((aa -  (FL(1.0)/INTERVAL)) / (INTERVAL - FL(1.0)/INTERVAL)
                     *  STEPS + FL(0.5));
      if (n<0 || n>STEPS) *r++ = (MYFLT)(log((double)aa)/log(2.0));
      else                *r++ = logbase2[n] ;
    } while (--nsmps);
}

void ipowoftwo(EVAL *p)
{
    powoftwo_set(p);
    powoftwo(p);
}

void ilogbasetwo(EVAL *p)
{
    logbasetwo_set(p);
    logbasetwo(p);
}

void in(IN *p)
{
	MYFLT	*sp, *ar;
	int	nsmps = ksmps;

	sp = spin;
	ar = p->ar;
	do  *ar++ = *sp++;
	while (--nsmps);
}

void ins(INS *p)
{
	MYFLT	*sp, *ar1, *ar2;
	int	nsmps = ksmps;

	sp = spin;
	ar1 = p->ar1;
	ar2 = p->ar2;
	do {
	    *ar1++ = *sp++;
	    *ar2++ = *sp++;
	}
	while (--nsmps);
}

void inq(INQ *p)
{
	MYFLT	*sp, *ar1, *ar2, *ar3, *ar4;
	int	nsmps = ksmps;

	sp = spin;
	ar1 = p->ar1;
	ar2 = p->ar2;
	ar3 = p->ar3;
	ar4 = p->ar4;
	do {
	    *ar1++ = *sp++;
	    *ar2++ = *sp++;
	    *ar3++ = *sp++;
	    *ar4++ = *sp++;
	}
	while (--nsmps);
}

void inh(INH *p)
{
	MYFLT	*sp, *ar1, *ar2, *ar3, *ar4, *ar5, *ar6;
	int	nsmps = ksmps;

	sp = spin;
	ar1 = p->ar1;
	ar2 = p->ar2;
	ar3 = p->ar3;
	ar4 = p->ar4;
	ar5 = p->ar5;
	ar6 = p->ar6;
	do {
	    *ar1++ = *sp++;
	    *ar2++ = *sp++;
	    *ar3++ = *sp++;
	    *ar4++ = *sp++;
	    *ar5++ = *sp++;
	    *ar6++ = *sp++;
	}
	while (--nsmps);
}

void ino(INO *p)
{
	MYFLT	*sp, *ar1, *ar2, *ar3, *ar4, *ar5, *ar6, *ar7, *ar8;
	int	nsmps = ksmps;

	sp = spin;
	ar1 = p->ar1;
	ar2 = p->ar2;
	ar3 = p->ar3;
	ar4 = p->ar4;
	ar5 = p->ar5;
	ar6 = p->ar6;
	ar7 = p->ar7;
	ar8 = p->ar8;
	do {
	    *ar1++ = *sp++;
	    *ar2++ = *sp++;
	    *ar3++ = *sp++;
	    *ar4++ = *sp++;
	    *ar5++ = *sp++;
	    *ar6++ = *sp++;
	    *ar7++ = *sp++;
	    *ar8++ = *sp++;
	}
	while (--nsmps);
}

void inn(INALL *p, int n)
{
    MYFLT	*sp, **ara;
    int		nsmps = ksmps;
    int 	i;

    sp = spin;
    ara = p->ar;
    do {
      for (i=0; i<n; i++) 
        *ara[i] = *sp++;
    }
    while (--nsmps);
}

void in16(INALL *p)
{
    inn(p, 16);
}

void in32(INALL *p)
{
    inn(p, 32);
}

void inall(INCH *p)
{
/*      int nch = (int) p->INOCOUNT; */
/*      inn(p, (nch>nchnls ? nchnls : nch)); */
    int ch = (int)(*p->ch+FL(0.5));
    int	nsmps = ksmps;
    MYFLT *sp = spin+ch-1;
    MYFLT *ain = p->ar;
    if (ch>nchnls) return;
    do {
      *ain++ = *sp;
      sp += nchnls;
    } while (--nsmps);
}

extern MYFLT* zastart;
extern long   zalast;
/* inz writes to za space at a rate as many channels as can. */
void inz(IOZ *p)
{
    MYFLT	*readloc, *writeloc;
    long indx, i;
    int	nsmps = ksmps;

    readloc = spin;
    /* Check to see this index is within the limits of za space.     */
    indx = (long) *p->ndx;
    if (indx > zalast) {
	perferror(Str(X_1529,"inz index > isizea. Not writing."));
    }
    else if (indx < 0) {
	perferror(Str(X_1530,"inz index < 0. Not writing."));
    }
    else {
	/* Now write to the array in za space pointed to by indx.    */
	writeloc = zastart + (indx * ksmps);
	for (i=0; i<nchnls; i++) 
          for (nsmps=0; nsmps<ksmps; nsmps++)
            *writeloc++ = spin[i*ksmps+nsmps];
    }
}

void out(OUT *p)
{
	MYFLT	*sp, *ap;
	int	nsmps = ksmps;

	ap = p->asig;
	sp = spout;
        if (!spoutactive) {
	    do 	*sp++ = *ap++;
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
	        *sp += *ap++;   sp++;
	    }
	    while (--nsmps);
	}
}

void outs(OUTS *p)
{
	MYFLT	*sp, *ap1, *ap2;
	int	nsmps = ksmps;

	ap1 = p->asig1;
	ap2 = p->asig2;
	sp = spout;
        if (!spoutactive) {
 	    do {
		*sp++ = *ap1++;
		*sp++ = *ap2++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp++;
		*sp += *ap2++;	sp++;
	    }
	    while (--nsmps);
	}
}

void outq(OUTQ *p)
{
	MYFLT	*sp, *ap1, *ap2, *ap3, *ap4;
	int	nsmps = ksmps;

	ap1 = p->asig1;
	ap2 = p->asig2;
	ap3 = p->asig3;
	ap4 = p->asig4;
	sp = spout;
        if (!spoutactive) {
	    do {
		*sp = *ap1++;	sp++;
		*sp = *ap2++;	sp++;
		*sp = *ap3++;	sp++;
		*sp = *ap4++;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp++;
		*sp += *ap2++;	sp++;
		*sp += *ap3++;	sp++;
		*sp += *ap4++;	sp++;
	    }
	    while (--nsmps);
	}
}

void outs1(OUT *p)
{
	MYFLT	*sp, *ap1;
	int	nsmps = ksmps;

	ap1 = p->asig;
	sp = spout;
	if (!spoutactive) {
 	    do {
		*sp = *ap1++;	sp++;
		*sp = FZERO;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp += 2;
	    }
	    while (--nsmps);
	}
}

void outs2(OUT *p)
{
	MYFLT	*sp, *ap2;
	int	nsmps = ksmps;

	ap2 = p->asig;
	if (!spoutactive) {
	    sp = spout;
 	    do {
		*sp = FZERO;	sp++;
		*sp = *ap2++;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    sp = spout + 1;
	    do {
		*sp += *ap2++;	sp += 2;
	    }
	    while (--nsmps);
	}
}

void outs12(OUT *p)
{
	MYFLT	*sp, *ap;
	int	nsmps = ksmps;

	ap = p->asig;
	sp = spout;
        if (!spoutactive) {
 	    do {
		*sp++ = *ap;
		*sp++ = *ap++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap;	sp++;
		*sp += *ap++;	sp++;
	    }
	    while (--nsmps);
	}
}

void outq1(OUT *p)
{
	MYFLT	*sp, *ap1;
	int	nsmps = ksmps;

	ap1 = p->asig;
	sp = spout;
	if (!spoutactive) {
 	    do {
		*sp = *ap1++;	sp++;
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp += 4;
	    }
	    while (--nsmps);
	}
}

void outq2(OUT *p)
{
	MYFLT	*sp, *ap2;
	int	nsmps = ksmps;

	ap2 = p->asig;
	if (!spoutactive) {
	    sp = spout;
 	    do {
		*sp = FZERO;	sp++;
		*sp = *ap2++;	sp++;
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    sp = spout + 1;
	    do {
		*sp += *ap2++;	sp += 4;
	    }
	    while (--nsmps);
	}
}

void outq3(OUT *p)
{
	MYFLT	*sp, *ap3;
	int	nsmps = ksmps;

	ap3 = p->asig;
	if (!spoutactive) {
	    sp = spout;
 	    do {
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
		*sp = *ap3++;	sp++;
		*sp = FZERO;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    sp = spout + 2;
	    do {
		*sp += *ap3++;	sp += 4;
	    }
	    while (--nsmps);
	}
}

void outq4(OUT *p)
{
	MYFLT	*sp, *ap4;
	int	nsmps = ksmps;

	ap4 = p->asig;
	if (!spoutactive) {
	    sp = spout;
 	    do {
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
		*sp = FZERO;	sp++;
		*sp = *ap4++;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    sp = spout + 3;
	    do {
		*sp += *ap4++;	sp += 4;
	    }
	    while (--nsmps);
	}
}

void outh(OUTH *p)
{
	MYFLT	*sp, *ap1, *ap2, *ap3, *ap4, *ap5, *ap6;
	int	nsmps = ksmps;

	ap1 = p->asig1;
	ap2 = p->asig2;
	ap3 = p->asig3;
	ap4 = p->asig4;
	ap5 = p->asig5;
	ap6 = p->asig6;
	sp = spout;
        if (!spoutactive) {
	    do {
		*sp = *ap1++;	sp++;
		*sp = *ap2++;	sp++;
		*sp = *ap3++;	sp++;
		*sp = *ap4++;	sp++;
		*sp = *ap5++;	sp++;
		*sp = *ap6++;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp++;
		*sp += *ap2++;	sp++;
		*sp += *ap3++;	sp++;
		*sp += *ap4++;	sp++;
		*sp += *ap5++;	sp++;
		*sp += *ap6++;	sp++;
	    }
	    while (--nsmps);
	}
}

void outo(OUTO *p)
{
	MYFLT	*sp, *ap1, *ap2, *ap3, *ap4, *ap5, *ap6, *ap7, *ap8;
	int	nsmps = ksmps;

	ap1 = p->asig1;
	ap2 = p->asig2;
	ap3 = p->asig3;
	ap4 = p->asig4;
	ap5 = p->asig5;
	ap6 = p->asig6;
	ap7 = p->asig7;
	ap8 = p->asig8;
	sp = spout;
        if (!spoutactive) {
	    do {
		*sp = *ap1++;	sp++;
		*sp = *ap2++;	sp++;
		*sp = *ap3++;	sp++;
		*sp = *ap4++;	sp++;
		*sp = *ap5++;	sp++;
		*sp = *ap6++;	sp++;
		*sp = *ap7++;	sp++;
		*sp = *ap8++;	sp++;
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
		*sp += *ap1++;	sp++;
		*sp += *ap2++;	sp++;
		*sp += *ap3++;	sp++;
		*sp += *ap4++;	sp++;
		*sp += *ap5++;	sp++;
		*sp += *ap6++;	sp++;
		*sp += *ap7++;	sp++;
		*sp += *ap8++;	sp++;
	    }
	    while (--nsmps);
	}
}

static void outn(int n, OUTX *p)
{
	MYFLT	*sp, *ap[64];
	int	nsmps = ksmps;
        int	i;

	for (i=0; i<n; i++) ap[i] = p->asig[i];
	sp = spout;
        if (!spoutactive) {
	    do {
              for (i=0; i<n; i++) {
		*sp = *ap[i]++;	sp++;
              }
              for (i=n+1; i<nchnls; i++) {
                *sp = FL(0.0); sp++;
              }
	    }
	    while (--nsmps);
	    spoutactive = 1;
	}
        else {
	    do {
              for (i=0; i<n; i++) {
		*sp += *ap[i]++;	sp++;
              }
              for (i=n+1; i<nchnls; i++) {
                sp++;
              }
	    }
	    while (--nsmps);
	}
}

void outx(OUTX *p)
{
    outn(16, p);
}

void outX(OUTX *p)
{
    outn(32, p);
}

void outall(OUTX *p)            /* Output a list of channels */
{
    int nch = (int) p->INOCOUNT;
    outn((nch <= nchnls ? nch : nchnls), p);
}

void outch(OUTCH *p)
{
    int		ch;
    int		i, j;
    MYFLT	*sp, *apn;
    int		nsmps = ksmps;
    int		count = (int) p->INOCOUNT;
    MYFLT	**args = p->args;

    for (j=0; j<count; j +=2) {
      nsmps = ksmps;
      ch = (int)(*args[j]+FL(0.5));
      apn = args[j+1];
      if (ch>nchnls) continue;
      if (!spoutactive) {
        sp = spout;
        do {
          for (i=1; i<=nchnls; i++) {
            *sp = ((i==ch) ? *apn++ : FL(0.0));
            sp++;
          }
        } while (--nsmps);
        spoutactive = 1;
      }
      else {
        sp = spout + ch-1;
        do {
          *sp += *apn++;
          sp += nchnls;
        }
        while (--nsmps);
      }
    }
}

/* outz reads from za space at a rate to output. */
void outz(IOZ *p)
{
    MYFLT	*readloc, *writeloc;
    long indx;
    int i;
    int	nsmps = ksmps;

    /*-----------------------------------*/

    writeloc = spout;

    /* Check to see this index is within the limits of za space.    */
    indx = (long) *p->ndx;
    if (indx > zalast) {
	perferror(Str(X_1531,"outz index > isizea. No output"));
        return;
    }
    else if (indx < 0) {
	perferror(Str(X_1532,"outz index < 0. No output."));
        return;
    }
    /* Now read from the array in za space and write to the output. */
    readloc = zastart + (indx * ksmps);
    if (!spoutactive) {
      for (i=0; i<nchnls; i++) 
        for (nsmps=0; nsmps<ksmps; nsmps++)
          spout[i*ksmps+nsmps] = *readloc++;
      spoutactive = 1;
    }
    else {
      for (i=0; i<nchnls; i++) 
        for (nsmps=0; nsmps<ksmps; nsmps++)
          spout[i*ksmps+nsmps] += *readloc++;
    }
}
