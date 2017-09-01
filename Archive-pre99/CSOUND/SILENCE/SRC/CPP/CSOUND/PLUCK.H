/* pluck.h -- plucked string class declarations */

/*
 * Code conversion from C++ to C (October 1994)
 * Author: Michael A. Casey MIT Media Labs
 * Language: C
 * Copyright (c) 1994 MIT Media Lab, All Rights Reserved
 * Soem modifications my John ffitch, 2000, simplifying code
 */


#ifndef _pluck_h
#define _pluck_h

#include "wavegde.h"

/* pluck -- derived class to implement simple plucked string algorithm */
typedef struct {
  OPDS h;
  MYFLT *out;                   /* plucked string output */
  MYFLT *freq,*amp,*pickupPos,*pickPos,*Aw0,*AwPI,*afdbk; /* inputs */

  waveguide wg;                 /* general waveguide model structure   */
  filter3 bridge;               /* lowpass bridge filter               */
  len_t pickSamp;               /* where to pluck the string           */

  /* Auxillary memory allocation */
  AUXCH upperData;              /* upper rail data space */
  AUXCH lowerData;              /* lower rail data space */
  AUXCH bridgeCoeffs;           /* Bridge filter coefficients */
  AUXCH bridgeData;             /* Bridge filter lattice data */
} WGPLUCK;

void pluckExcite(WGPLUCK*);     /* excitation function  */
MYFLT *pluckStop(WGPLUCK*,len_t,MYFLT,MYFLT); /*damping sample generation*/
MYFLT *pluckShape(WGPLUCK*);    /* pluck shape function */
MYFLT *pluckFlip(WGPLUCK*,MYFLT*); /* flip the shape */
void pluckSetFilters(WGPLUCK*,MYFLT,MYFLT);    /* sets filters*/

#endif


