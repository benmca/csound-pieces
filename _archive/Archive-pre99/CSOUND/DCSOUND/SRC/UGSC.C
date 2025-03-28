/* ugsc.c -- Opcodes from Sean Costello <costello@seanet.com> */

#include <math.h>
#include "cs.h"
#include "ugsc.h"

/* svfilter.c
 *
 * Copyright 1999, by Sean M. Costello
 *
 * svfilter is an implementation of Hal Chamberlin's state variable filter 
 * algorithm, from "Musical Applications of Microprocessors" (Hayden Books,
 * Indianapolis, Indiana, 1985), 2nd. edition, pp. 489-492. It implements
 * a second-order resonant filter, with lowpass, highpass and bandpass
 * outputs.
 *
 */

void svfset(SVF *p)
{
    /* set initial delay states to 0 */
    p->ynm1 = p->ynm2 = FL(0.0);
}       

void svf(SVF *p)
{
    MYFLT f1, q1, scale;
    MYFLT *low, *high, *band, *in, *ynm1, *ynm2;
    MYFLT low2, high2, band2;
    MYFLT kfco = *p->kfco, kq = *p->kq;
    int nsmps = ksmps;
        
    /* calculate frequency and Q coefficients */
    f1 = FL(2.0) * (MYFLT)sin(PI * (double)(kfco / esr));
    q1 = FL(1.0) / kq;

    in = p->in;
    low = p->low;
    band = p->band;
    high = p->high;
    ynm1 = &(p->ynm1);
    ynm2 = &(p->ynm2);
    
    /* if there is a non-zero value for iscl, set scale to be
     * equal to the Q coefficient.
     */
    if (*p->iscl) 
      scale = q1;
    else 
      scale = FL(1.0);
        
    /* equations derived from Hal Chamberlin, "Musical Applications
     * of Microprocessors.
     */
    do{
      *low++ = low2 = *ynm2 + f1 * *ynm1;
      *high++ = high2 = scale * *in++ - low2 - q1 * *ynm1;
      *band++ = band2 = f1 * high2 + *ynm1;
      *ynm1 = band2;
      *ynm2 = low2;
    } while (--nsmps);
}

/* hilbert.c
 *
 * Copyright 1999, by Sean M. Costello
 *
 * hilbert is an implementation of an IIR Hilbert transformer.
 * The structure is based on two 6th-order allpass filters in 
 * parallel, with a constant phase difference of 90 degrees
 * (+- some small amount of error) between the two outputs.
 * Allpass coefficients are calculated at i-time.
 */


void hilbertset(HILBERT *p)
{
    int j;  /* used to increment for loop */

    /* pole values taken from Bernie Hutchins, "Musical Engineer's Handbook" */
    double poles[12] = {.3609, 2.7412, 11.1573, 44.7581, 179.6242, 798.4578, 
                        1.2524, 5.5671, 22.3423, 89.6271, 364.7914, 2770.1114};
    double polefreq[12], rc[12], alpha[12], beta[12];
    /* calculate coefficients for allpass filters, based on sampling rate */
    for(j=0; j<12; j++) {
      /*      p->coef[j] = (1 - (15 * PI * pole[j]) / esr) /
              (1 + (15 * PI * pole[j]) / esr); */
      polefreq[j] = poles[j] * 15.0;
      rc[j] = 1.0 / (2.0 * PI * polefreq[j]);
      alpha[j] = 1.0 / rc[j];
      beta[j] = (1.0 - (alpha[j] / (2.0 * (double)esr))) /
                (1.0 + (alpha[j] / (2.0 * (double)esr)));
      p->xnm1[j] = p->ynm1[j] = FL(0.0);
      p->coef[j] = -(MYFLT)beta[j]; 
    }
}

void hilbert(HILBERT *p)
{
    MYFLT xn1 = FL(0.0), yn1 = FL(0.0), xn2 = FL(0.0), yn2 = FL(0.0);
    MYFLT *out1, *out2, *in;
    MYFLT *xnm1, *ynm1, *coef;
    int nsmps = ksmps;
    int j;

    xnm1 = p->xnm1;
    ynm1 = p->ynm1;
    coef = p->coef;
    out1 = p->out1;
    out2 = p->out2;
    in = p->in;

    do {
      xn1 = *in;
      /* 6th order allpass filter for cosine output. Structure is
       * 6 first-order allpass sections in series. Coefficients
       * taken from arrays calculated at i-time.
       */
      for (j=0; j < 6; j++) {
        yn1 = coef[j] * (xn1 - p->ynm1[j]) + p->xnm1[j];
        p->xnm1[j] = xn1;
        p->ynm1[j] = yn1;
        xn1 = yn1;
      }
      xn2 = *in++;
      /* 6th order allpass filter for sine output. Structure is
       * 6 first-order allpass sections in series. Coefficients
       * taken from arrays calculated at i-time.
       */
      for (j=6; j < 12; j++) {
        yn2 = coef[j] * (xn2 - p->ynm1[j]) + p->xnm1[j];
        p->xnm1[j] = xn2;
        p->ynm1[j] = yn2;
        xn2 = yn2;
      }
      *out1++ = yn1;
      *out2++ = yn2;
    } while (--nsmps);
}


/* resonrz.c
 *
 * Copyright 1999, by Sean M. Costello
 *
 * resonr and resonz are implementations of second-order 
 * bandpass resonators, with added zeroes in the transfer function.
 * The algorithms are based upon the work of Julius O. Smith and
 * John Stautner at Stanford, and Ken Steiglitz at Princeton.
 *
 */
 
void resonzset(RESONZ *p)
{
    /* error message code derived from code for reson in ugens5.c */
    int scaletype;
    p->scaletype = scaletype = (int)*p->iscl;
    if (scaletype && scaletype != 1 && scaletype != 2) {
      sprintf(errmsg,Str(X_981,"illegal reson iscl value, %f"),*p->iscl);
      initerror(errmsg);
    }
    if (!(*p->istor))
      p->xnm1 = p->xnm2 = p->ynm1 = p->ynm2 = FL(0.0);
    
    p->aratemod = (p->XINCODE & 01) ? 1 : 0;
    /* printf("The value of aratemod is %d\n", p->aratemod); */
    
}

void resonr(RESONZ *p)
{
    /* 
     *
     * An implementation of the 2-pole, 2-zero reson filter
     * described by Julius O. Smith and James B. Angell in 
     * "A Constant Gain Digital Resonator Tuned by a Single
     * Coefficient," Computer Music Journal, Vol. 6, No. 4,
     * Winter 1982, p.36-39. resonr implements the version
     * where the zeros are located at + and - the square root
     * of r, where r is the pole radius of the reson filter.
     *
     */

    MYFLT r, scale; /* radius & scaling factor */
    MYFLT c1, c2;   /* filter coefficients */
    MYFLT *out, *in, xn, yn, *xnm1, *xnm2, *ynm1, *ynm2;
    MYFLT kcf = *p->kcf, kbw = *p->kbw;
    int nsmps = ksmps;

    r = (MYFLT)exp(-PI * (double)(kbw / esr));
    c1 = FL(2.0) * r * (MYFLT)cos(2.0 * PI * (double)(kcf / esr));
    c2 = r * r;

    /* calculation of scaling coefficients */
    if (p->scaletype == 1)
      scale = FL(1.0) - r;
    else if (p->scaletype == 2)
      scale = (MYFLT)sqrt(1.0 - (double)r);
    else scale = FL(1.0);
    
    out = p->out;
    in = p->in; 
    xnm1 = &(p->xnm1);
    xnm2 = &(p->xnm2);
    ynm1 = &(p->ynm1);
    ynm2 = &(p->ynm2);
    
    do {
      xn = *in;
      *out++ = yn = scale * (*in++ - r * *xnm2) + c1 * *ynm1 - c2 * *ynm2;
      *xnm2 = *xnm1;
      *xnm1 = xn;
      *ynm2 = *ynm1;
      *ynm1 = yn;
    } while (--nsmps);
}

void resonz(RESONZ *p)
{
    /* 
     *
     * An implementation of the 2-pole, 2-zero reson filter
     * described by Julius O. Smith and James B. Angell in 
     * "A Constant Gain Digital Resonator Tuned by a Single
     * Coefficient," Computer Music Journal, Vol. 6, No. 4,
     * Winter 1982, p.36-39. resonr implements the version
     * where the zeros are located at z = 1 and z = -1.
     *
     */
    
    MYFLT r, scale; /* radius & scaling factor */
    MYFLT c1, c2;   /* filter coefficients */
    MYFLT *out, *in, xn, yn, *xnm1, *xnm2, *ynm1, *ynm2;
    MYFLT kcf = *p->kcf, kbw = *p->kbw;
    int nsmps = ksmps;
    
    r = (MYFLT)exp(-PI * (double)(kbw / esr));
    c1 = FL(2.0) * r * (MYFLT)cos(2.0 * PI * (double)(kcf / esr));
    c2 = r * r;
        
    /* Normalizing factors derived from equations in Ken Steiglitz,
     * "A Note on Constant-Gain Digital Resonators," Computer
     * Music Journal, vol. 18, no. 4, pp. 8-10, Winter 1982.
     */
    if (p->scaletype == 1)
      scale = (FL(1.0) - c2) * FL(0.5);
    else if (p->scaletype == 2)
      scale = (MYFLT)sqrt((1.0 - (double)c2) * 0.5);
    else scale = FL(1.0);
    
    out = p->out;
    in = p->in; 
    xnm1 = &(p->xnm1);
    xnm2 = &(p->xnm2);
    ynm1 = &(p->ynm1);
    ynm2 = &(p->ynm2);
    
    do {
      xn = *in;
      *out++ = yn = scale * (*in++ - *xnm2) + c1 * *ynm1 - c2 * *ynm2;
      *xnm2 = *xnm1;
      *xnm1 = xn;
      *ynm2 = *ynm1;
      *ynm1 = yn;
    } while (--nsmps);
}

void phaser1set(PHASER1 *p)
{
    int j;
    int loop = (int) (*p->iorder + FL(0.5));
    if (!(*p->istor) || p->auxx.auxp == NULL || p->auxy.auxp == NULL){
      auxalloc((long)loop*sizeof(MYFLT), &p->auxx);
      auxalloc((long)loop*sizeof(MYFLT), &p->auxy);
      p->xnm1 = (MYFLT *) p->auxx.auxp;
      p->ynm1 = (MYFLT *) p->auxy.auxp;
      for (j=0; j< loop; j++)
        p->xnm1[j] = p->ynm1[j] = FL(0.0);
    }
    else if (p->auxx.size < loop || p->auxy.size < loop ) {
                                /* Existing arrays too small so copy */
      AUXCH tmp1, tmp2;
      tmp1.auxp = tmp2.auxp = NULL;
      auxalloc((long)loop*sizeof(MYFLT), &tmp1);
      auxalloc((long)loop*sizeof(MYFLT), &tmp2);
      for (j=0; j< loop; j++) {
        ((MYFLT*)tmp1.auxp)[j] = p->xnm1[j];
        ((MYFLT*)tmp2.auxp)[j] = p->ynm1[j];
      }
      mfree(p->auxx.auxp);      /* and fiddle it */
      mfree(p->auxy.auxp);
      p->auxx = tmp1;
      p->auxy = tmp2;
      p->xnm1 = (MYFLT *) p->auxx.auxp;
      p->ynm1 = (MYFLT *) p->auxy.auxp;
    }
    p->loop = loop;
}

void phaser1(PHASER1 *p)
{	
    MYFLT xn = FL(0.0), yn = FL(0.0);
    MYFLT *out, *in;
    MYFLT *xnm1, *ynm1, feedback;
    MYFLT coef = *p->kcoef, fbgain = *p->fbgain;
    MYFLT beta, wp;
    int nsmps = ksmps;
    int j;

    xnm1 = p->xnm1;
    ynm1 = p->ynm1;
    feedback = p->feedback;
    out = p->out;
    in = p->in;
    
    if (coef <= FL(0.0))
      coef = -coef;	/* frequency will "fold over" if <= 0 Hz */
    /* next two lines implement bilinear z-transform, to convert
     * frequency value into a useable coefficient for the 
     * allpass filters.
     */
    wp = PI_F * coef / esr;
    beta = (FL(1.0) - wp)/(FL(1.0) + wp);

    do {
      xn = *in++ + feedback * fbgain;
      for (j=0; j < p->loop; j++) {
        /* Difference equation for 1st order 
         * allpass filter */
        yn = beta * (xn + p->ynm1[j]) - p->xnm1[j];
        /* Stores state values in arrays */
        p->xnm1[j] = xn;
        p->ynm1[j] = yn;
        xn = yn;
      }
      *out++ = yn;
      feedback = yn;
    } while (--nsmps);
    p->feedback = feedback;
}


void phaser2set(PHASER2 *p)
{
    int modetype, j;
    int loop;

    p->modetype = modetype = (int)*p->mode;
    if (modetype && modetype != 1 && modetype != 2) {
      sprintf(errmsg,Str(X_243,"Phaser mode must be either 1 or 2"));
      initerror(errmsg);
    }

    loop = p->loop = (int) (*p->order + .5);
    auxalloc((long)loop*sizeof(MYFLT), &p->aux1);
    auxalloc((long)loop*sizeof(MYFLT), &p->aux2);
    p->nm1 = (MYFLT *) p->aux1.auxp;
    p->nm2 = (MYFLT *) p->aux2.auxp;
    for (j=0; j< loop; j++)
      p->nm1[j] = p->nm2[j] = FL(0.0);
}

void phaser2(PHASER2 *p)
{	
    MYFLT xn = FL(0.0), yn = FL(0.0);
    MYFLT *out, *in;
    MYFLT kbf = *p->kbf, kq = *p->kbw; 
    MYFLT ksep = *p->ksep, fbgain = *p->fbgain;
    MYFLT b, a, r, freq;	
    MYFLT temp;
    MYFLT *nm1, *nm2, feedback;
    int nsmps = ksmps;
    int j;
    
    nm1 = p->nm1;
    nm2 = p->nm2;
    feedback = p->feedback;
    out = p->out;
    in = p->in;
    
    /* frequency of first notch will "fold over" if <= 0 Hz */
    if (kbf <=0)
      kbf = -kbf;
    
    /* keeps ksep at a positive value. Otherwise, blow ups are
     * almost certain to happen.
     */
    if (ksep <=FL(0.0))
      ksep = -ksep;

    do {
      xn = *in++ + feedback * fbgain;
      /* The following code is used to determine
       * how the frequencies of the notches are calculated.
       * If imode=1, the notches will be in a harmonic 
       * relationship of sorts. If imode=2, the frequencies
       * of the notches will be powers of the first notches.
       */
      for (j=0; j < p->loop; j++) {
        if (p->modetype == 1)
          freq = kbf + (kbf * ksep * j);		
        else freq = kbf * (float)pow(ksep,j);

        /* Note similarities of following equations to 
         * equations in resonr/resonz. The 2nd-order
         * allpass filter used here is similar to the
         * typical reson filter, with the addition of zeros.
         * The pole angle determines the frequency of the 
         * notch, while the pole radius determines the q of 
         * the notch.
         */
        r = (MYFLT)exp(-PI * (double)(freq / (kq * esr)));
        b = -FL(2.0) * r * (MYFLT)cos(TWOPI * (double)(freq / esr));
        a = r * r;
        
        /* Difference equations for implementing canonical
         * 2nd order section. (Direct Form II)
         */
        temp = xn - b * p->nm1[j] - a * p->nm2[j];
        yn = a * temp + b * p->nm1[j] + nm2[j];
        p->nm2[j] = p->nm1[j];
        p->nm1[j] = temp;
        xn = yn;
      }
      *out++ = yn;
      feedback = yn;
    } while (--nsmps);
    p->feedback = feedback;
}

/* initialization for 2nd-order lowpass filter */
void lp2_set(LP2 *p)
{
    if (!(*p->istor))
      p->ynm1 = p->ynm2 = FL(0.0);
}

/* k-time code for 2nd-order lowpass filter. Derived from code in 
Hal Chamberlin's "Musical Applications of Microprocessors." */
void lp2(LP2 *p)
{
    MYFLT a, b, c, temp;
    MYFLT *out, *in, yn, ynm1, ynm2;
    MYFLT kfco = *p->kfco, kres = *p->kres;
    int nsmps = ksmps;

    temp = (-PI_F * kfco / (kres * esr));
    a = FL(2.0) * (MYFLT)(cos(TWOPI * (double)(kfco / esr)) * exp((double)temp));
    b = (MYFLT)exp((double)(temp+temp));
    c = FL(1.0) - a + b;

    out = p->out;
    in = p->in; 
    ynm1 = p->ynm1;
    ynm2 = p->ynm2;

    do {
      *out++ = yn = a * ynm1 - b * ynm2 + c * *in++;
      ynm2 = ynm1;
      ynm1 = yn;
    } while (--nsmps);
    p->ynm1 = ynm1;
    p->ynm2 = ynm2;
}


