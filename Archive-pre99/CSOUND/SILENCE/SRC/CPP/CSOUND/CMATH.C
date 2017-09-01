/*      Math functions for Csound coded by Paris Smaragdis 1994         */
/*      Berklee College of Music Csound development team                */

#include "cs.h"
#include "cmath.h"
#include <math.h>
#include <time.h>   /* for random seeding from the time - mkc July 1997 */

#ifndef RAND_MAX
#define RAND_MAX        (32767)
#endif

void ipow(POW *p)               /*      Power for i-rate */
{
    *p->sr = (MYFLT)pow(*p->in, *p->powerOf);   /*      sophisticated code!     */
}

void apow(POW *p)               /*      Power routine for a-rate  */
{
    long n = ksmps;
    MYFLT *in = p->in, *out = p->sr;

    do {
        *out++ = (MYFLT)pow(*in++, *p->powerOf) / *p->norm;
    } while (--n);
}

void kpow(POW *p)               /*      Power routine for k-rate        */
{
    *p->sr = (MYFLT)pow(*p->in, *p->powerOf) / *p->norm;
}

long holdrand = 2345678L;  /* gab d5 */

void seedrand(PRAND *p)
{
    if ((unsigned int)*p->out == 0) {
      printf(Str(X_458,"Seeding from current time\n"));
      srand((unsigned int)(holdrand = time(NULL)));
    }
    else {
      printf(Str(X_459,"Seeding with %.3f\n"), *p->out);
      srand((unsigned int)(holdrand = (int)*p->out));
    }
}

void auniform(PRAND *p)         /* Uniform distribution */
{
    long n = ksmps;
    MYFLT *out = p->out;
    MYFLT arg1 = *p->arg1;

    do *out++ = unifrand(arg1);
    while( --n);
}

void ikuniform(PRAND *p)
{
    *p->out = unifrand(*p->arg1);
}

void alinear(PRAND *p)          /* Linear random functions      */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = linrand(*p->arg1);
    } while (--n);
}

void iklinear(PRAND *p)
{
    *p->out = linrand(*p->arg1);
}

void atrian(PRAND *p)           /*      Triangle random functions       */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = trirand(*p->arg1);
    } while (--n);
}

void iktrian(PRAND *p)
{
    *p->out = trirand(*p->arg1);
}

void aexp(PRAND *p)             /*      Exponential random functions    */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = exprand(*p->arg1);
    } while (--n);
}

void ikexp(PRAND *p)
{
    *p->out = exprand(*p->arg1);
}

void abiexp(PRAND *p)           /*      Bilateral exponential rand. functions */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = biexprand(*p->arg1);
    } while (--n);
}

void ikbiexp(PRAND *p)
{
    *p->out = biexprand(*p->arg1);
}

void agaus(PRAND *p)            /*      Gaussian random functions       */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = gaussrand(*p->arg1);
    } while (--n);
}

void ikgaus(PRAND *p)
{
    *p->out = gaussrand(*p->arg1);
}

void acauchy(PRAND *p)          /*      Cauchy random functions */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = cauchrand(*p->arg1);
    } while (--n);
}

void ikcauchy(PRAND *p)
{
    *p->out = cauchrand(*p->arg1);
}

void apcauchy(PRAND *p)         /*      Positive Cauchy random functions */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = pcauchrand(*p->arg1);
    } while (--n);
}

void ikpcauchy(PRAND *p)
{
    *p->out = pcauchrand(*p->arg1);
}

void abeta(PRAND *p)            /*      Beta random functions   */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = betarand(*p->arg1, *p->arg2, *p->arg3);
    } while (--n);
}

void ikbeta(PRAND *p)
{
    *p->out = betarand(*p->arg1, *p->arg2, *p->arg3);
}

void aweib(PRAND *p)            /*      Weibull randon functions        */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = weibrand(*p->arg1, *p->arg2);
    } while (--n);
}

void ikweib(PRAND *p)
{
    *p->out = weibrand(*p->arg1, *p->arg2);
}

void apoiss(PRAND *p)           /*      Poisson random funcions */
{
    long n = ksmps;
    MYFLT *out = p->out;

    do {
        *out++ = poissrand(*p->arg1);
    } while (--n);
}

void ikpoiss(PRAND *p)
{
    *p->out = poissrand(*p->arg1);
}


/* * * * * * RANDOM NUMBER GENERATORS * * * * * */


#define unirand()       (MYFLT)((double)rand()/(double)RAND_MAX)

MYFLT unifrand(MYFLT range)
{
    return range*unirand();
}

MYFLT linrand(MYFLT range)      /*      linear distribution routine     */
{
    MYFLT r1, r2;

    r1 = unirand();
    r2 = unirand();

    if (r1 > r2)
        r1 = r2;

    return (r1 * range);
}

MYFLT trirand(MYFLT range)      /*      triangle distribution routine   */
{
    MYFLT r1, r2;

    r1 = unirand();
    r2 = unirand();

    return (((r1 + r2) - FL(1.0)) * range);
}

MYFLT exprand(MYFLT l)          /*      exponential distribution routine */
{
    MYFLT r1;

    if (l < FL(0.0)) return (FL(0.0));

    do {
        r1 = unirand();
    } while (r1 == FL(0.0));

    return (-(MYFLT)log(r1 *l));
}

MYFLT biexprand(MYFLT l)        /* bilateral exponential distribution routine */
{
    MYFLT r1;

    if (l < FL(0.0)) return (FL(0.0));

    do {
        r1 = FL(2.0) * unirand();
    } while (r1 == FL(0.0) || r1 == FL(2.0));

    if (r1 > FL(1.0))     {
        r1 = FL(2.0) - r1;
        return (-(MYFLT)log(r1 * l));
    }
    return ((MYFLT)log(r1 * l));
}

MYFLT gaussrand(MYFLT s)        /*      gaussian distribution routine   */
{
    MYFLT r1 = FL(0.0);
    int n = 12;
    s /= FL(3.83);

    do {
        r1 += unirand();
    } while (--n);

    return (s * (r1 - FL(6.0)));
}

MYFLT cauchrand(MYFLT a)        /*      cauchy distribution routine     */
{
    MYFLT r1;
    a /= FL(318.3);

    do {
      do {
        r1 = unirand();
      } while (r1 == FL(0.5));

      r1 = a * (MYFLT)tan(PI*(double)r1);
    } while (r1>FL(1.0) || r1<-FL(1.0)); /* Limit range artificially */
    return r1;
}

MYFLT pcauchrand(MYFLT a)       /*      positive cauchy distribution routine */
{
    MYFLT r1;
    a /= FL(318.3);

    do {
      do {
        r1 = unirand();
      } while (r1 == FL(1.0));

      r1 = a * (MYFLT)tan( PI * 0.5 * (double)r1);
    } while (r1>FL(1.0));
    return r1;
}

MYFLT betarand(MYFLT range, MYFLT a, MYFLT b) /* beta distribution routine  */
{
    MYFLT r1, r2;

    if (a < FL(0.0) || b < FL(0.0) ) return (FL(0.0));

    do {
        do {
            r1 = unirand();
        } while (r1 == FL(0.0));

        do {
            r2 = unirand();
        } while (r2 == FL(0.0));

        r1 = (MYFLT)pow(r1, 1.0 / (double)a);
        r2 = (MYFLT)pow(r2, 1.0 / (double)b);
    } while ((r1 + r2) > FL(1.0));

    return ((r1 / (r1 +r2)) * range);
}

MYFLT weibrand(MYFLT s, MYFLT t) /*      weibull distribution routine    */
{
    MYFLT r1, r2;

    if (t < FL(0.0) ) return (FL(0.0));

    do {
        r1 = unirand();
    } while (r1 == FL(0.0) || r1 == FL(1.0));

    r2 = FL(1.0) /  (FL(1.0) - r1);

    return (s * (MYFLT)pow (log((double)r2),  (1.0 /(double)t)));
}

MYFLT poissrand(MYFLT l)        /*      Poisson distribution routine    */
{
    MYFLT r1, r2, r3;

    if (l < FL(0.0) ) return (FL(0.0));

    r1 = unirand();
    r2 = (MYFLT)exp(-l);
    r3 = FL(0.0);

    while (r1 >= r2) {
        r3++;
        r1 *= unirand();
    }

    return (r3);
}
