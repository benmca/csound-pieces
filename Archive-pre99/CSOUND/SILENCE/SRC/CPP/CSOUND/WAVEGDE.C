
/* waveguide.c -- primitive functions and operations for waveguides */

/*
 * Code conversion from C++ to C (October 1994)
 * Author: Michael A. Casey MIT Media Labs
 * Language: C
 * Copyright (c) 1994 MIT Media Lab, All Rights Reserved
 */

#include <stdlib.h>
#include <stdio.h>

#include "cs.h"
#include "wavegde.h"

#define EPSILON (FL(0.25))      /* threshold for small tuning values */
/* prototypes */

void error(const char*, const char*);


/***** circularBuffer class member function definitions *****/

/* ::circularBuffer -- constructor for circular buffer class
 * This routine assumes that the DATA pointer has already been
 * allocated by the calling routine.
 */
void circularBufferCircularBuffer(circularBuffer* cb, len_t N)
{
    MYFLT *data = cb->data;
    if (!data)
      error(Str(X_194,"Buffer memory not allocated!"),
            "<circularBuffer::circularBuffer>");

  /* Initialize pointers and variables */
    cb->size            = N;
    cb->inited          = 1;
    cb->pointer         = data;
    cb->endPoint        = data+cb->size-1;
    cb->insertionPoint  = data;
    cb->extractionPoint = data;
}



/* ::write -- insert new value in the buffer, update insertion pointer */
void circularBufferWrite(circularBuffer* cb, MYFLT val)
{
    /* update the extraction point */
    cb->extractionPoint = cb->insertionPoint;

    /* place data at the insertion point */
    *cb->insertionPoint-- = val;

    /* update the insertion point */
    if (cb->insertionPoint<cb->data)
      cb->insertionPoint = cb->endPoint;
}



/* ::read -- extract the value at the extraction point */
MYFLT circularBufferRead(circularBuffer* cb)
{
    MYFLT val;
    /* Read the value at the extraction point */
    val = *cb->extractionPoint++;

    /* Update the extraction point */
    if (cb->extractionPoint>cb->endPoint)
      cb->extractionPoint=cb->data;

    return val;
}


/* ***** class guideRail -- waveguide rail derived class ***** */
void guideRailGuideRail(guideRail* gr, len_t d)
{
    circularBufferCircularBuffer(gr,d); /* Guide rail is a circular buffer */
}


/* ::update -- waveguide rail insert and update routine */
void guideRailUpdate(guideRail *gr,MYFLT samp)
{
    *gr->pointer++ = samp;
    if (gr->pointer > gr->endPoint)
      gr->pointer = gr->data;
}

/* ::access -- waveguide rail access routine */
MYFLT guideRailAccess(guideRail* gr, len_t pos)
{
    MYFLT *s = gr->pointer - pos;
    while(s < gr->data)
      s += gr->size;
    while(s > gr->endPoint)
      s -= gr->size;
    return *s;
}

void dumpRail(guideRail* gr, len_t M)
{
    MYFLT *s = gr->pointer;
    while (M-- >= 0) {
      printf("%.2f ", *s);
      if (++s > gr->endPoint) s -= gr->size;
    }
    printf("\n\n");
}

#ifdef ORIGINAL
/* ***** class filter -- digital filter routines ****** */
/* ::filter -- constructor, assumes preallocated data and coeffs*/
void filterFilter(filter* filt, len_t n)
{
    if (!filt->coeffs)
      error(Str(X_223,"Coeffs not allocated!"),"<filter::filter>");

    /* Initialize circular buffer */
    circularBufferCircularBuffer(&filt->buffer,n);
}

/* ::set -- set the coefficients */
void filterSet(filter* filt, MYFLT *c)
{
    int i;

    if (!filt->buffer.inited)
      error(Str(X_277,"Filter not inited, cannot set"),"<filter::set>");

    for (i=0;i<filt->buffer.size;i++)
      filt->coeffs[i]=c[i];
#ifdef WG_VERBOSE
    for (i=0; i<filt->buffer.size; i++) printf("c[%d]=%f\n", i, c[i]);
    printf("Zeros at %f, %f\n",
           (-c[1]-sqrt(c[1]*c[1]-4.0*c[0]*c[0]))/(2.0*c[0]),
           (-c[1]+sqrt(c[1]*c[1]-4.0*c[0]*c[0]))/(2.0*c[0]));
#endif
}

/* ::FIR -- direct convolution filter routine */
 MYFLT filterFIR(filter* filt, MYFLT s)
{
    MYFLT *c = filt->coeffs;
    int i;

    /* y[n] = c1*x[n] + c2*x[n-1] + ... + cM*x[n-M+1] */
    circularBufferWrite(&filt->buffer,s);
    s = FL(0.0);
    for (i=0;i<filt->buffer.size;i++) {
      s += *c++ * circularBufferRead(&filt->buffer);
    }
    return s;
}
#endif

/* ***** class filter3 -- JPff ****** */

/* ::set -- set the coefficients */
void filter3Set(filter3* filt, MYFLT a0, MYFLT a1)
{
    filt->a0 = a0;
    filt->a1 = a1;
#ifdef WG_VERBOSE
    printf("c[0]=%f; c[1]=%f; c[2]=\n", a0, a1, a0);
    printf("Zeros at %f, %f\n",
           (-a1-sqrt(a1*a1-4.0*a0*a0))/(2.0*a0),
           (-a1+sqrt(a1*a1-4.0*a0*a0))/(2.0*a0));
#endif
}


/* ::FIR -- direct convolution filter routine */
 MYFLT filter3FIR(filter3* filt, MYFLT s)
{
    /* y[n] = c1*x[n] + c2*x[n-1] + ... + cM*x[n-M+1] */
    MYFLT ans = filt->a0 * (s+filt->x2) + filt->a1 * filt->x1;
    filt->x2 = filt->x1;
    filt->x1 = s;
    return ans;
}

/* ::allpass -- accurate 1st-order allpass filter routine */
/*   c = allpass filter coefficient, input sample */
MYFLT filterAllpass(waveguide* wg,MYFLT s)
{
    /* p[n] = x[n] + gp[n-1], y[n] = p[n-1] - gp[n] */
    MYFLT q = s + wg->c*wg->p;
    s = - wg->c * q + wg->p;
    wg->p = q;
    return s;
}
/* q = 0.000000 wg->c = -0.047619 wg->p = 0.000000 s = 0.000000 s1 = nan */

/* ***** Waveguide base-class member definitions ***** */

/* ::waveguide -- constructor
 * sets delay lengths and filter responses for frequency
 * total delay length = (SR/f0)
 * also sets tuning filter for fractional delay for exact tuning
 */
void waveguideWaveguide(waveguide* wg,
                        MYFLT  freq,
                        MYFLT* upperData,
                        MYFLT* lowerData)
{
    MYFLT size, df;

    wg->excited = 0;
    wg->p       = FL(0.0); /* tuning filter state variable */
    wg->f0      = freq;
    wg->w0      = (TWOPI_F*freq)/esr;

#ifdef WG_VERBOSE
    printf("f0=%f, w0=%f\n",wg->f0,wg->w0);
#endif

    /* Calculate the size of the delay lines and set them */
    /* Set pointers to appropriate positions in instrument memory */
    size = esr / freq - FL(1.0);

    /* construct the fractional part of the delay */
    df = (size - (len_t)size); /* fractional delay amount */
    if (df<EPSILON) {
      df   = FL(1.0)+EPSILON;
      size = size-FL(1.0);
    }
    wg->upperRail.data = upperData;
    wg->lowerRail.data = lowerData;
#ifdef WG_VERBOSE
    printf("size=%d+1, df=%f\n",(len_t)size,df);
#endif
    size = size*FL(0.5);
    guideRailGuideRail(&wg->upperRail,(len_t)size);
    guideRailGuideRail(&wg->lowerRail,(len_t)size);
    waveguideSetTuning(wg,df);
}

/* Set the allpass tuning filter coefficient */
void waveguideSetTuning(waveguide* wg, MYFLT df)
{
    MYFLT k=(FL(1.0)/esr)*wg->w0;

  /*c = (1.0-df)/(1.0+df);*/ /* Solve for coefficient from df */
    wg->c = -sinf((k-k*df)/FL(2.0))/sinf((k+k*df)/FL(2.0));

#ifdef WG_VERBOSE
    printf("tuning :c=%f\n",wg->c);
    fflush(stdout);
#endif
}

/* error -- report errors */
void error(const char* a, const char* b)
{
    printf(Str(X_259,"Error:%s,%s\n"),a,b);
    exit(1);
}
