/* filter.c */

/* Author: Michael A. Casey
 * Language: C
 * Copyright (C) 1997 Michael A. Casey, MIT Media Lab, All Rights Reserved
 *
 * Implementation of filter opcode for general purpose filtering.
 * This opcode implements the following difference equation:
 *
 * (1)*y(n) = b(0)*x(n) + b(1)*x(n-1) + ... + b(nb)*x(n-nb)
 *                      - a(1)*y(n-1) - ... - a(na)*y(n-na)
 *
 * whose system function is represented by:
 *
 *                             -1                -nb
 *        jw  B(z)   b(0) + b(1)z + .... + b(nb)z
 *     H(e) = ---- = ----------------------------
 *                               -1              -na
 *            A(z)    1   + a(1)z + .... + a(na)z
 *
 * The syntax is as follows:
 *
 *  xsig2 xfilter xsig1, nb, na, b(0), b(1), ..., b(nb), a(1), a(2), ..., a(na)
 *
 * xsig is either a k-rate or a-rate signal and xfilter is
 * the corresponding opcode: kfilter or filter respectively.
 * b(n) and a(n) are either i or k-rate arguments
 * nb and na are i-time arguments with the following limits:
 *
 *   1 <= nb <= 51
 *   0 <= na <= 50
 *
 * The filter is implemented with a direct form-II digital filter lattice
 * which has the advantage of requiring a single Nth-order delay line
 * [N = max(na,nb-1)], as well as negating the need for pole-zero
 * factorization which is required of type III and IV digital filter
 * lattice structures.
 *
 *
 * Examples of digital filtering using filter
 * ==========================================
 *
 * A first-order IIR filter with k-rate gain kG and k-rate pole coefficient
 * ka1 has the following syntax:
 *
 *   asig2    filter asig1, 1, 1, kG, ka1
 *
 * A first-order allpass IIR filter with i-var coefficient c has the
 * following syntax:
 *
 *   asig2   filter asig1, 2, 1, -ic, 1, ic
 *
 * A first-order linear-phase lowpass FIR filter operating on a kvar signal
 * has the following syntax:
 *
 *   ksig2   kfilter ksig1, 2, 0, 0.5, 0.5
 *
 * Potential applications of filter
 * ================================
 *
 * Since filter allows the implementation of generalised recursive filters,
 * it can be used to specify a large range of general DSP algorithms- very
 * efficiently.
 *
 * For example, a digital waveguide can be implemented for musical instrument
 * modeling using a pair of delayr and delayw opcodes in conjunction with the
 * filter opcode.
 *
 *
 * The zfilter opcode
 * ==================
 *
 * Whereas the above two opcodes, filter and kfilter, are static linear
 * time-invariant (LTI) filters, zfilter implements two pole-warping
 * operations to effect control over the filter at the k-rate. The
 * operations are radial pole-shear and angular pole-warp respectively.
 *
 * Pole shearing increases the magnitude of poles along radial lines in
 * the Z-plane. This has the affect of altering filter ring times. The
 * variable kmag is the parameters (-1:1)
 *
 * Pole warping changes the frequency of poles by moving them along angular
 * paths in the Z plane. This operation leaves the shape of the magnitude
 * response unchanged but alters the frequencies by a constant factor
 * (preserving 0 and pi). This alters the resonant frequencies of the filter
 * but leaves the "timbre" of the filter intact.
 *
 * The following example implements a forth-order all-pole model with pole
 * shear and warp factors kmag and kfreq and i-time IIR coefficient ia1...ia4.
 *
 * asig2  zfilter kmag, kfreq, 1, 4, 1, ia1, ia2, ia3, ia4
 *
 * Notice
 * ======
 *
 * This code is provided as is for the express purpose of enhancing Csound
 * with a general-purpose filter routine. No guarantees are made as to its
 * effectiveness for a particular application. The author reserves the right
 * to withdraw this code from the Csound distribution at any time without
 * notice. This code is not to be used for any purposes other than those
 * covered by the public Csound license agreement. For any other use,
 * including distribution in whole or part, specific prior permission
 * must be obtained from MIT.
 *
 */

/* Contains modifications by John ffitch, which have no restrictions attached
 * Main changes are to work in double precision internally */

#include <stdlib.h>

#include "cs.h"
#include "filter.h"
#include "complex.h"
#include <math.h>

/*  #define sinf(a) (float)sin((double)(a)) */
/*  #define cosf(a) (float)cos((double)(a)) */
/*  #define sqrtf(a) (float)sqrt((double)(a)) */
/*  #define atan2f(a,b) (float)atan2((double)(a),(double)(b)) */

#ifndef sinf
#define sinf(a) sin(a)
#define cosf(a) cos((a))
#define sqrtf(a) sqrt((a))
#define atan2f(a,b) atan2((a),(b))
#endif


#ifndef MAX
#define MAX(a,b) ((a>b)?(a):(b))
#define MIN(a,b) ((a>b)?(b):(a))
#endif

#define POLISH (1)      /* 1=polish pole roots after Laguer root finding */

typedef struct FPOLAR {double mag,ph;} fpolar; /* >>was float<< */

/* Routines associated with pole control */
void expandPoly(fcomplex[], double[], int);
void complex2polar(fcomplex[],fpolar[], int);
void polar2complex(fpolar[],fcomplex[], int);
void sortRoots(fcomplex roots[], int dim);
int sortfun(fpolar *a, fpolar *b);
void nudgeMags(fpolar a[], fcomplex b[], int dim, double fact);
void nudgePhases(fpolar a[], fcomplex b[], int dim, double fact);

extern void error(const char*, const char*);
extern void zroots(fcomplex [], int, fcomplex [], int);

/* Filter initialization routine */
void ifilter(FILTER* flt)
{
    int i;

    /* since i-time arguments are not guaranteed to propegate to p-time
     * we must copy the i-vars into the flt structure.
     */

    flt->numa = (int)*flt->na;
    flt->numb = (int)*flt->nb;

    /* First check bounds on initialization arguments */
    if ((flt->numb<1) || (flt->numb>(MAXZEROS+1)) ||
        (flt->numa<0) || (flt->numa>MAXPOLES))
      error(Str(X_278,"Filter order out of bounds: (1<=nb<51, 0<=na<=50)"),
            "<filter>");

    /* Calculate the total delay in samples and allocate memory for it */
    flt->ndelay = MAX(flt->numb-1,flt->numa);

    auxalloc(flt->ndelay * sizeof(double), &flt->delay); /* >> was float<< */

    /* Initialize the delay line for safety */
    for (i=0;i<flt->ndelay;i++)
      ((double*)flt->delay.auxp)[i] = 0.0; /* >> was float<< */

    /* Set current position pointer to beginning of delay */
    flt->currPos = (double*)flt->delay.auxp; /* >> was float<< */

    for (i=0; i<flt->numb+flt->numa; i++)
      flt->dcoeffs[i] = (double)*flt->coeffs[i];
}

/* izfilter - initialize z-plane controllable filter */
void izfilter(ZFILTER *zflt)
{
    fcomplex a[MAXPOLES];
    fcomplex *roots;
    double* coeffs;
    int i, dim;

    /* since i-time arguments are not guaranteed to propegate to p-time
     * we must copy the i-vars into the zflt structure.
     */

    zflt->numa = (int)*zflt->na;
    zflt->numb = (int)*zflt->nb;

    /* First check bounds on initialization arguments */
    if ((zflt->numb<1) || (zflt->numb>(MAXZEROS+1)) ||
        (zflt->numa<0) || (zflt->numa>MAXPOLES))
      error(Str(X_278,"Filter order out of bounds: (1<=nb<51, 0<=na<=50)"),
            "<filter>");

    /* Calculate the total delay in samples and allocate memory for it */
    zflt->ndelay = MAX(zflt->numb-1,zflt->numa);

    auxalloc(zflt->ndelay * sizeof(double), &zflt->delay); /* >> was float<< */

    /* Initialize the delay line for safety */
    for (i=0;i<zflt->ndelay;i++)
      ((double*)zflt->delay.auxp)[i] = 0.0; /* >> was float<< */

    /* Set current position pointer to beginning of delay */
    zflt->currPos = (double*)zflt->delay.auxp; /* >> was float<< */

    for (i=0; i<zflt->numb+zflt->numa+1; i++)
      zflt->dcoeffs[i] = (double)*zflt->coeffs[i];

    /* Add auxillary root memory */
    auxalloc(zflt->numa * sizeof(fcomplex), &zflt->roots);
    roots = (fcomplex*) zflt->roots.auxp;
    dim = zflt->numa;

    coeffs = zflt->dcoeffs + zflt->numb;

    /* Reverse coefficient order for root finding */
    a[dim] = Complex(1.0,0.0);
    for (i=dim-1; i>=0; i--)
      a[i] = Complex(coeffs[dim-i-1],0.0);

    /* NRIC root finding routine, a[0..M] roots[1..M] */
    zroots(a, dim,  roots-1, POLISH);

    /* Sort roots into descending order of magnitudes */
    sortRoots(roots, dim);
}


/* a-rate filter routine
 *
 * Implements the following difference equation
 *
 * (1)*y(n) = b(0)*x(n) + b(1)*x(n-1) + ... + b(nb)*x(n-nb)
 *                      - a(1)*y(n-1) - ... - a(na)*y(n-na)
 *
 */
void afilter(FILTER* flt)
{
    int n,i;

    double* a = flt->dcoeffs+flt->numb;
    double* b = flt->dcoeffs+1;
    double  b0 = flt->dcoeffs[0];

    double poleSamp, zeroSamp, inSamp;

    /* Outer loop */
    for (n=0; n<ksmps; n++) {

      inSamp = flt->in[n];
      poleSamp = inSamp;
      zeroSamp = 0.0;

      /* Inner filter loop */
      for (i=0; i< flt->ndelay; i++) {

        /* Do poles first */
        /* Sum of products of a's and delays */
        if (i<flt->numa)
          poleSamp += -(a[i])*readFilter(flt,i+1);

        /* Now do the zeros */
        if (i<(flt->numb-1))
          zeroSamp += (b[i])*readFilter(flt,i+1);

      }

      flt->out[n] = (MYFLT)((b0)*poleSamp + zeroSamp);
      /* update filter delay line */
      insertFilter(flt, poleSamp);
    }
}

/* k-rate filter routine
 *
 * Implements the following difference equation at the k rate
 *
 * (1)*y(k) = b(0)*x(k) + b(1)*x(k-1) + ... + b(nb)*x(k-nb)
 *                      - a(1)*y(k-1) - ... - a(na)*y(k-na)
 *
 */
void kfilter(FILTER* flt)
{
    int i;

    double* a = flt->dcoeffs+flt->numb;
    double* b = flt->dcoeffs+1;
    double  b0 = flt->dcoeffs[0];

    double poleSamp, zeroSamp, inSamp;

    inSamp = *flt->in;
    poleSamp = inSamp;
    zeroSamp = 0.0;

    /* Filter loop */
    for (i=0; i<flt->ndelay; i++) {

      /* Do poles first */
      /* Sum of products of a's and delays */
      if (i<flt->numa)
        poleSamp += -(a[i])*readFilter(flt,i+1);
      
      /* Now do the zeros */
      if (i<(flt->numb-1))
        zeroSamp += (b[i])*readFilter(flt,i+1);
    }

    *flt->out = (MYFLT)((b0)*poleSamp + zeroSamp);

    /* update filter delay line */
    insertFilter(flt, poleSamp);
}

/* azfilter - a-rate controllable pole filter
 *
 * This filter allows control over the magnitude
 * and frequency response of the filter by efficient
 * manipulation of the poles.
 *
 * The k-rate controls are:
 *
 * kmag, kfreq
 *
 * The rest of the filter is the same as filter
 *
 */
void azfilter(ZFILTER* zflt)
{
    int n,i;

    double* a = zflt->dcoeffs+zflt->numb;
    double* b = zflt->dcoeffs+1;
    double  b0 = zflt->dcoeffs[0];
    
    double poleSamp, zeroSamp, inSamp;

    fpolar B[MAXPOLES];
    fcomplex C[MAXPOLES+1];

    fcomplex *roots = (fcomplex*) zflt->roots.auxp;
    double kmagf = *zflt->kmagf; /* Mag nudge factor */
    double kphsf = *zflt->kphsf; /* Phs nudge factor */

    int dim = zflt->numa;

    /* Nudge pole magnitudes */
    complex2polar(roots,B,dim);
    nudgeMags(B,roots,dim,kmagf);
    nudgePhases(B,roots,dim,kphsf);
    polar2complex(B,C,dim);
    expandPoly(C,a,dim);

    /* C now contains the complex roots of the nudged filter */
    /* and a contains their associated real coefficients. */

    /* Outer loop */
    for (n=0; n<ksmps; n++) {
      inSamp = zflt->in[n];
      poleSamp = inSamp;
      zeroSamp = 0.0;

      /* Inner filter loop */
      for (i=0; i< zflt->ndelay; i++) {

        /* Do poles first */
        /* Sum of products of a's and delays */
        if (i<zflt->numa)
          poleSamp += -(a[i])*readFilter((FILTER*)zflt,i+1);

        /* Now do the zeros */
        if (i<(zflt->numb-1))
          zeroSamp += (b[i])*readFilter((FILTER*)zflt,i+1);
      }

      zflt->out[n] = (MYFLT)((b0)*poleSamp + zeroSamp);
      
      /* update filter delay line */
      insertFilter((FILTER*)zflt, poleSamp);
    }
}

/* readFilter -- delay-line access routine
 *
 * Reads sample x[n-i] from a previously established delay line.
 * With this syntax i is +ve for a time delay and -ve for a time advance.
 *
 * The use of explicit indexing rather than implicit index incrementing
 * allows multiple lattice structures to access the same delay line.
 *
 */
double readFilter(FILTER* flt, int i)
{
    double* readPoint; /* Generic pointer address */

    /* Calculate the address of the index for this read */
    readPoint = flt->currPos - i;

    /* Wrap around for time-delay if necessary */
    if (readPoint < ((double*)flt->delay.auxp) )
      readPoint += flt->ndelay;
    else
      /* Wrap for time-advance if necessary */
      if (readPoint > ((double*)flt->delay.auxp + (flt->ndelay-1)) )
        readPoint -= flt->ndelay;

    return *readPoint; /* Dereference read address for delayed value */
}


/* insertFilter -- delay-line update routine
 *
 * Inserts the passed value into the currPos and increments the
 * currPos pointer modulo the length of the delay line.
 *
 */
void insertFilter(FILTER* flt, double val)
{
    /* Insert the passed value into the delay line */
    *flt->currPos = val;

    /* Update the currPos pointer and wrap modulo the delay length */
    if (((double*) (++flt->currPos)) >
        ((double*)flt->delay.auxp + (flt->ndelay-1)) )
      flt->currPos -= flt->ndelay;
}

/* Compute polynomial coefficients from the roots */
/* The expanded polynomial is computed as a[0..N] in
 * descending powers of Z
 */
void expandPoly(fcomplex roots[], double a[], int dim)
{
    int j,k;
    fcomplex z[MAXPOLES],d[MAXPOLES];

    z[0] = Complex(1.0, 0.0);
    for (j=1;j<=dim;j++)
      z[j] = Complex(0.0,0.0);

    /* Recursive coefficient expansion about the roots of A(Z) */
    for (j=0;j<dim;j++) {
      for (k=0;k<dim;k++)
        d[k]=z[k]; /* Store last vector of coefficients */
      for (k=1;k<=j+1;k++)
        z[k] = Csub(z[k],Cmul(roots[j], d[k-1]));
    }
    for (j=0;j<dim;j++)
      (a[j]) = z[j+1].r;
}

#define SQR(a) (a*a)

void complex2polar(fcomplex a[], fpolar b[], int N)
{
    int i;

    for (i=0; i<N; i++) {
      b[i].mag = sqrtf(SQR(a[i].r)+SQR(a[i].i));
      b[i].ph = atan2f(a[i].i,a[i].r);
    }
}


void polar2complex(fpolar a[], fcomplex b[],int N)
{
    int i;

    for (i=0;i<N;i++) {
      b[i].r = a[i].mag*cosf(a[i].ph);
      b[i].i = a[i].mag*sinf(a[i].ph);
    }
}


/* Sort poles in decreasing order of magnitudes */
void sortRoots(fcomplex roots[], int dim)
{
    fpolar plr[MAXPOLES];

    /* Convert roots to polar form */
    complex2polar(roots, plr, dim);

    /* Sort by their magnitudes */
    qsort(plr, dim, sizeof(fpolar), (int (*)(const void *, const void * ))sortfun);

    /* Convert back to complex form */
    polar2complex(plr,roots,dim);

}

/* Comparison function for sorting in DECREASING order */
int sortfun(fpolar *a, fpolar *b)
{
    if (a->mag<b->mag)
      return 1; 
    else if (a->mag==b->mag)
      return 0;
    else
      return -1;
}


/* nudgeMags - Pole magnitude nudging routine
 *
 * Find the largest-magnitude pole off the real axis
 * and nudge all non-real poles by a factor of the distance
 * of the largest pole to the unit circle (or zero if fact is -ve).
 *
 * This has the effect of changing the time-response of the filter
 * without affecting the overall frequency response characteristic.
 *
 */
void nudgeMags(fpolar a[], fcomplex b[], int dim, double fact)
{
    double eps = .000001; /* To avoid underflow comparisons */
    double nudgefact;
    int i;

    /* Check range of nudge factor */
    if (fact>0 && fact<=1) {
      /* The largest magnitude pole will be at the beginning of
       * the array since it was previously sorted by the init routine.
       */
      for (i=0;i<dim;i++)
        if (fabs (b[i].i)>eps) /* Check if pole is complex */
          break;

      nudgefact = 1 + (1/a[i].mag-1)*fact;

      /* Nudge all complex-pole magnitudes by this factor */
      for (i=dim-1;i>=0;i--)
        if (fabs(b[i].i)>eps)
          a[i].mag *= nudgefact;
    }
    else if (fact < 0 && fact >=-1) {

      nudgefact = (fact + 1);

      /* Nudge all complex-pole magnitudes by this factor */
      for (i=dim-1;i>=0;i--)
        if (fabs(b[i].i)>eps)
          a[i].mag *= nudgefact;
    }
    else
      /* Factor is out of range, do nothing */;
}


/* nudgePhases - Pole phase nudging routine
 *
 * Multiply phases of all poles by factor
 */
void nudgePhases(fpolar a[], fcomplex b[], int dim, double fact)
{
    double eps = .000001; /* To avoid underflow comparisons */
    double nudgefact;
    int i;
    double phmax=0.0;

    /* Check range of nudge factor */
    if (fact>0 && fact<=1) {
      /* Find the largest angled non-real pole */
      for (i=0;i<dim;i++)
        if (a[i].ph>phmax)
          phmax = a[i].ph;

      phmax /= PI; /* Normalize to radian frequency */

      nudgefact = 1 + (1-phmax)*fact;

      /* Nudge all complex-pole magnitudes by this factor */
      for (i=dim-1;i>=0;i--)
        if (fabs(b[i].i)>eps)
          a[i].ph *= nudgefact;
    }
    else if (fact < 0 && fact >=-1) {
      nudgefact = (fact + 1);

      /* Nudge all complex-pole magnitudes by this factor */
      for (i=dim-1;i>=0;i--)
        if (fabs(b[i].i)>eps)
          a[i].ph *= nudgefact;
    }
    else
      /* Factor is out of range, do nothing */;
}

/* ------------------------------------------------------------ */

/* Code from Press, Teukolsky, Vettering and Flannery
 * Numerical Recipes in C, 2nd Edition, Cambridge 1992.
 */

#define EPSS (1.0e-7)
#define MR (8)
#define MT (10)
#define MAXIT (MT*MR)

/* Simple definition is sufficient */
#define FPMAX(a,b) (a>b ? a : b)

void laguer(fcomplex a[], int m, fcomplex *x, int *its)
{
    int iter,j;
    double abx,abp,abm,err;
    fcomplex dx,x1,b,d,f,g,h,sq,gp,gm,g2;
    static double frac[MR+1] = {0.0,0.5,0.25,0.75,0.13,0.38,0.62,0.88,1.0};

    for (iter=1; iter<=MAXIT; iter++) {
      *its = iter;
      b = a[m];
      err = Cabs(b);
      d = f = Complex(0.0,0.0);
      abx = Cabs(*x);
      for (j=m-1; j>=0; j--) {
        f = Cadd(Cmul(*x,f),d);
        d = Cadd(Cmul(*x,d),b);
        b = Cadd(Cmul(*x,b),a[j]);
        err = Cabs(b)+abx*err;
      }
      err *= (double)EPSS;
      if (Cabs(b) <= err) return;
      g = Cdiv(d,b);
      g2 = Cmul(g,g);
      h = Csub(g2,RCmul(2.0,Cdiv(f,b)));
      sq = Csqrt(RCmul((double) (m-1),Csub(RCmul((double) m,h),g2)));
      gp = Cadd(g,sq);
      gm = Csub(g,sq);
      abp = Cabs(gp);
      abm = Cabs(gm);
      if (abp < abm) gp = gm;
      dx = ((FPMAX(abp,abm) > 0.0 ? Cdiv(Complex((double) m,0.0),gp)
           : RCmul((double)exp(log(1.0+abx)),
                   Complex((double)cos((double)iter),
                           (double)sin((double)iter)))));
      x1 = Csub(*x,dx);
      if (x->r == x1.r && x->i == x1.i) return;
      if (iter % MT) *x = x1;
      else *x = Csub(*x,RCmul(frac[iter/MT],dx));
    }
    die(Str(X_1289,"too many iterations in laguer"));
    return;
}
#undef EPSS
#undef MR
#undef MT
#undef MAXIT
/* (C) Copr. 1986-92 Numerical Recipes Software *%&&"U^3. */

/* ------------------------------------------------------------ */

/* Code from Press, Teukolsky, Vettering and Flannery
 * Numerical Recipes in C, 2nd Edition, Cambridge 1992.
 */

#define EPS (2.0e-6)
#define MAXM (100)

void zroots(fcomplex a[], int m, fcomplex roots[], int polish)
{
    void laguer(fcomplex a[], int m, fcomplex *x, int *its);
    int i,its,j,jj;
    fcomplex x,b,c,ad[MAXM];

    for (j=0; j<=m; j++) ad[j] = a[j];
    for (j=m; j>=1; j--) {
      x = Complex(0.0,0.0);
      laguer(ad,j,&x,&its);
      if (fabs(x.i) <= 2.0*EPS*fabs(x.r)) x.i = 0.0;
      roots[j] = x;
      b = ad[j];
      for (jj=j-1; jj>=0; jj--) {
        c = ad[jj];
        ad[jj] = b;
        b = Cadd(Cmul(x,b),c);
      }
    }
    if (polish)
      for (j=1; j<=m; j++)
        laguer(a,m,&roots[j],&its);
    for (j=2; j<=m; j++) {
      x = roots[j];
      for (i=j-1; i>=1; i--) {
        if (roots[i].r <= x.r) break;
        roots[i+1] = roots[i];
      }
      roots[i+1] = x;
    }
}
#undef EPS
#undef MAXM
/* (C) Copr. 1986-92 Numerical Recipes Software *%&&"U^3. */
