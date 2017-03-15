/* filter.h */

/* Author: Michael A. Casey
 * Language: C
 * Copyright (C) 1997 Michael A. Casey, MIT Media Lab, All Rights Reserved 
 *
 */


#ifndef __filter_h
#define __filter_h

#define MAXZEROS 50 /* Allow up to 50th-order digital filters */
#define MAXPOLES 50

/* Csound structure for FILTER opcode */

typedef struct {
  OPDS h;
  
  MYFLT *out;       /* output signal */
  MYFLT *in;        /* input signal */
  MYFLT *nb, *na;   /* filter-order input arguments */
  MYFLT *coeffs[MAXPOLES+MAXZEROS+1]; /* filter-coefficient input arguments */
  MYFLT *d1,*d2;    /* These allow ZFILTER to access FILTER routines */
 
  int numa;         /* i-var p-time storage registers */
  int numb;

  double dcoeffs[MAXPOLES+MAXZEROS+1]; /* filter-coefficient double arguments */
  AUXCH delay;     /* delay-line state memory base pointer */  
  double* currPos;  /* delay-line current position pointer */ /* >>Was float<< */
  int   ndelay;    /* length of delay line (i.e. filter order) */
} FILTER;

typedef struct {
  OPDS h;
  
  MYFLT *out;       /* output signal */
  MYFLT *in;        /* input signal */
  MYFLT *kmagf, *kphsf; /* magnitude and phase pole nudging factors */
  MYFLT *nb, *na;   /* filter-order input arguments */
  MYFLT *coeffs[MAXPOLES+MAXZEROS+1]; /* filter-coefficient input arguments */
  
  int numa;         /* i-var p-time storage registers */
  int numb;

  double dcoeffs[MAXPOLES+MAXZEROS+1]; /* filter-coefficient double arguments */
  AUXCH delay;     /* delay-line state memory base pointer */  
  double* currPos;  /* delay-line current position pointer */ /* >>Was float<< */
  int   ndelay;    /* length of delay line (i.e. filter order) */
  AUXCH roots;     /* pole roots memory for zfilter */
} ZFILTER;

/* filter opcode function prototypes */

double  readFilter(FILTER*,int);   /* delay-line access routine */ /* >>>wasw float<<<*/
void insertFilter(FILTER*,double); /* delay-line update routine */

#endif
