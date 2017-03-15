
/* pluck.c -- plucked string class definitions */

/*
 * Code conversion from C++ to C (October 1994)
 * Author: Michael A. Casey MIT Media Labs
 * Language: C
 * Copyright (c) 1994 MIT Media Lab, All Rights Reserved
 * Soem modificatiosn John ffitch, 2000, simplifying code
 */

#include "cs.h"
#include "wavegde.h"
#include "pluck.h"

/* external prototypes */
extern void error(const char*, const char*);

/* ***** plucked string class member function definitions ***** */

/* ::pluck -- create the plucked-string instrument */
void pluckPluck(WGPLUCK* plk)
{

    /* ndelay = total required delay - 1.0 */
    len_t ndelay = (len_t) (esr / *plk->freq - FL(1.0));

#ifdef WG_VERBOSE
    printf("pluckPluck -- allocating memory...");
#endif

    /* Allocate auxillary memory or reallocate if size has changed */
    auxalloc((len_t)(ndelay/2)*sizeof(MYFLT), &plk->upperData);
    auxalloc((len_t)(ndelay/2)*sizeof(MYFLT), &plk->lowerData);
/*     auxalloc(3L*sizeof(MYFLT), &plk->bridgeCoeffs); */
/*     auxalloc(3L*sizeof(MYFLT), &plk->bridgeData); */

#ifdef WG_VERBOSE
    printf("done.\n");
#endif

    /* construct waveguide object */
#ifdef WG_VERBOSE
    printf("Constructing waveguide...");
#endif

    waveguideWaveguide((waveguide*)&plk->wg,             /* waveguide       */
                       (MYFLT)*plk->freq,                /* f0 frequency    */
                       (MYFLT*)plk->upperData.auxp,      /* upper rail data */
                       (MYFLT*)plk->lowerData.auxp);     /* lower rail data */
#ifdef WG_VERBOSE
    printf("done.\n");
#endif
    /* Allocate memory to bridge data and coeffs */
#ifdef WG_VERBOSE
    printf("Initializing bridge filters...");
#endif
/*     plk->bridge.coeffs=(MYFLT*)plk->bridgeCoeffs.auxp;  /\* bridge coeffs *\/ */
/*     plk->bridge.buffer.data=(MYFLT*)plk->bridgeData.auxp;/\* bridge data *\/ */
/*     filterFilter(&plk->bridge,3); /\* construct bridge filter object *\/ */
#ifdef WG_VERBOSE
    printf("done\n");
#endif
    /* Excite the string with the input parameters */
#ifdef WG_VERBOSE
    printf("Exciting the string...");
#endif
    pluckExcite(plk);
#ifdef WG_VERBOSE
    printf("done\n");
#endif
}

/* pluck::excite -- excitation function for plucked string */
void pluckExcite(WGPLUCK* plk)
{
    MYFLT *shape;
    int i;
    int size = plk->wg.upperRail.size;

    /* set the delay element to pick at */
    plk->pickSamp=(len_t)(size * *plk->pickPos);
    if (plk->pickSamp<1)
      plk->pickSamp = 1;
    
    /* set the bridge filter coefficients for the correct magnitude response */
    pluckSetFilters(plk,*plk->Aw0,*plk->AwPI);/*attenuation in dB at w0 and PI*/

    /* add the pick shape to the waveguide rails */
    shape = pluckShape(plk);    /* Efficiency loss here */

    /* add shape to lower rail */
    for (i=0;i<size;i++) {
      plk->wg.lowerRail.data[i] = shape[i]; /* Why add? Starts at zero anyway */
      plk->wg.upperRail.data[size-i-1] = shape[i];
    }

    /* flip shape and add to upper rail */
/*      pluckFlip(plk,shape); */
/*      for (i=0;i<size;i++) */
/*        plk->wg.upperRail.data[i] = shape[i]; */

    /* free the space used by the pluck shape */
    free((char*)shape);
    
    /* Reset the tuning and bridge filters */
    /*filterReset(&plk->wg.tnFIR);*/
    /*filterReset(&plk->bridge);*/
    
    /* set excitation flag */
    plk->wg.excited = 1;
}


/* pluck::setFilters -- frequency dependent filter calculations */
void pluckSetFilters(WGPLUCK* plk, MYFLT A_w0, MYFLT A_PI)
{
    /* Define the required magnitude response of H1 at w0 and PI */

    /* Constrain attenuation specification to dB per second */
    double NRecip = plk->wg.f0/esr; /*  N=t*esr/f0  */
    MYFLT H1_w0 = (MYFLT) pow(10.0,-(double)A_w0*0.05*NRecip);
    MYFLT H1_PI = (MYFLT) pow(10.0,-(double)A_PI*0.05*NRecip);
/*      printf("Aw0 = %f Api = %f (%f, %f)\n", A_w0, A_PI, H1_w0,H1_PI ); */
    {
    /* The tuning filter is allpass, so no dependency for H1 */
    /* therefore solve for the coefficients of the bridge filter directly */
    MYFLT cosw0 = (MYFLT)cos((double)plk->wg.w0);
    MYFLT a1=(H1_w0+cosw0*H1_PI)/(1+cosw0);
    MYFLT a0 = (a1 - H1_PI)*FL(0.5);
/*      printf("cosw0 = %f\n", cosw0); */
    /* apply constraints on coefficients (see Sullivan)*/
    if ((a0<FL(0.0))|| (a1<a0+a0)) {
      a0=FL(0.0);
      a1=H1_w0;
    }

    filter3Set(&plk->bridge,a0, a1);   /* set the new bridge coefficients */

    /*  if (VERBOSE)
        printf("bridge :a0=%f, a1=%f\n",a0,a1);
    */
}
}

/* Reverse the positions of the values in 'a' */
MYFLT * pluckFlip(WGPLUCK* plk, MYFLT * a)
{
    int i,j;
    int n=plk->wg.upperRail.size;
    int nh = (n/2);
    MYFLT tmp;
    
    for (i=0;i<nh;i++) {
      j=n-i-1;
      tmp = a[i];
      a[i] = a[j];
      a[j] = tmp;
    }
    return a;
}

/* ::pluckShape -- the pluck function for a string */
MYFLT *pluckShape(WGPLUCK* plk)
{
    MYFLT scale = *plk->amp;
    MYFLT  *shape;
    len_t len=plk->wg.lowerRail.size;
    len_t i;
    MYFLT M;

    /* This memory must be freed after use */
    shape = (MYFLT *) mmalloc(len*sizeof(MYFLT));
    if (!shape)
      error(Str(X_231,"Couldn't allocate for initial shape"),"<pluckShape>");
    
    scale = FL(0.5) * scale;      /* Scale was squared!! */
    for (i=0;i<plk->pickSamp;i++)
      shape[i] = scale*i / plk->pickSamp;
    
    M = (MYFLT)len - plk->pickSamp;
    for (i=0;i<M;i++)
      shape[plk->pickSamp+i] = scale - (i*scale/M);
    
    return shape;
}


/* ::getSamps -- the sample generating routine */
void pluckGetSamps(WGPLUCK* plk)
{
    MYFLT       yr0,yl0,yrM,ylM;        /* Key positions on the waveguide */
    MYFLT *ar = plk->out;    /* The sample output buffer */
    len_t M=plk->wg.upperRail.size; /* Length of the guide rail */
    len_t N=ksmps;
/*    int i = 0; */
    MYFLT *fdbk = plk->afdbk;
    /* set the delay element to pickup at */
    len_t pickupSamp=(len_t)(M * *plk->pickupPos);
    if (pickupSamp<1) pickupSamp = 1;

    /* calculate N samples of the plucked string algorithm */
/*      if (plk->wg.excited) */
      do {
/*          void dumpRail(guideRail*, len_t); */
/*          dumpRail(&plk->wg.upperRail, M-1); */
/*          dumpRail(&plk->wg.lowerRail, M-1); */
        *ar++ = guideRailAccess(&plk->wg.upperRail,pickupSamp)
               +guideRailAccess(&plk->wg.lowerRail,M-pickupSamp);
        /*        sampBuf[i++] += *fdbk++; */
        yrM = guideRailAccess(&plk->wg.upperRail,M-1);/* wave into the nut */
        ylM = -yrM;                 /* reflect the incoming sample at the nut */

        yl0 = guideRailAccess(&plk->wg.lowerRail,0);  /* wave into bridge */
/*          printf("Removing %.2f (upper) and %.2f (lower)\n", yrM, yl0); */
        yr0 = -filter3FIR(&plk->bridge,yl0);   /* bridge reflection filter */
        yr0 = filterAllpass(&plk->wg,yr0);     /* allpass tuning filter */
        yr0 += *fdbk++;           /* Surely better to inject here */
        guideRailUpdate(&plk->wg.upperRail,yr0);    /* update the upper rail*/
        guideRailUpdate(&plk->wg.lowerRail,ylM);    /* update the lower rail*/
/*          printf("inserting %.2f (upper) and %.2f (lower)\n", yr0, ylM); */
      } while(--N);
}

