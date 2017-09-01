
/* waveguide.h -- primitive data types and declarations for waveguides */

/*
 * Code conversion from C++ to C (October 1994)
 * Author: Michael A. Casey MIT Media Labs
 * Language: C
 * Copyright (c) 1994 MIT Media Lab, All Rights Reserved
 */

#ifndef _waveguide_h
#define _waveguide_h

#include <math.h>
#ifndef sinf
#define sinf(a) (MYFLT)sin((double)(a))
#define cosf(a) (MYFLT)cos((double)(a))
#define sqrtf(a) (MYFLT)sqrt((double)(a))
#define atan2f(a,b) (MYFLT)atan2((double)(a),(double)(b))
#define powf(a,b) (MYFLT)pow((double)(a),(double)(b))
#endif

/* TYPEDEFS */
typedef long    len_t;    /* length type */


/* CLASS DEFINITIONS */

/* circularBuffer -- circular buffer class */
/* serves as base class for waveguides and lattice filters */
typedef struct {
  int    inited;           /* Data initialization flag */
  len_t  size;             /* Size of the digital filter lattice */
  MYFLT* insertionPoint;   /* Position in queue to place new data */
  MYFLT* extractionPoint;  /* Position to read data from */
  MYFLT* data;             /* The lattice data */
  MYFLT* endPoint;         /* The end of the data */
  MYFLT* pointer;          /* pointer to current position in data */
} circularBuffer;


/* circular buffer member functions */
void circularBufferCircularBuffer(circularBuffer*,len_t);/* constructor */  
void circularBufferWrite(circularBuffer*, MYFLT);  /* write a sample */
MYFLT circularBufferRead(circularBuffer*);         /* read next sample */


/* class filter -- recursive filter implementation class */
typedef struct {
  circularBuffer buffer; /* The filter's delay line */
  MYFLT* coeffs;         /* The filter's coefficients */
} filter;

/* filter member functions */
void filterFilter(filter*,len_t); /* constructor */
void filterSet(filter*,MYFLT*); /* set the coefficients */
/* void filterReset(filter*);        /* clears the delay lines */
MYFLT filterGet(filter*,len_t);  /* check index range, return coefficient */
/*MYFLT filterIIR(filter*,MYFLT);   /* recursive filter routine */
MYFLT filterFIR(filter*,MYFLT);   /* convolution filter routine */

/* class filter3-- JPff */
typedef struct {
  MYFLT		x1, x2;         /* Delay line */
  MYFLT 	a0, a1;         /* The filter's coefficients */
} filter3;

/* filter member functions */
void filter3Filter(filter3*); /* constructor */
void filter3Set(filter3*,MYFLT,MYFLT); /* set the coefficients */
MYFLT filter3FIR(filter3*,MYFLT);   /* convolution filter routine */

/* waveguide rail implementation class */
typedef circularBuffer guideRail; /* It's just a circular buffer really */

/* guideRail member functions */
void guideRailGuideRail(guideRail*,len_t);/* constructor */
MYFLT guideRailAccess(guideRail*,len_t);  /* delay line access routine */
void guideRailUpdate(guideRail*,MYFLT);   /* delay line update routine */


/* waveguide -- abstract base class definition for waveguide classes */
typedef struct{
  int excited;         /* excitation flag */
  guideRail upperRail; /* the right-going wave */
  guideRail lowerRail; /* the left-going wave */
  MYFLT c;             /* The tuning filter coefficient */
  MYFLT p;             /* The tuning fitler state */
  MYFLT w0;            /* The fundamental frequency (PI normalized) */
  MYFLT f0;            /* The fundamental frequency (Hertz) */
} waveguide;

MYFLT filterAllpass(waveguide*,MYFLT);/* 1st-order allpass filtering*/

/* waveguide member functions */
void waveguideWaveguide(waveguide*,
			MYFLT,
			MYFLT*,
			MYFLT*);
MYFLT waveguideGetFreq(waveguide*);   /* return f0 frequency */
void waveguideSetTuning(waveguide*, MYFLT); /* Set tuning filters */
#endif

