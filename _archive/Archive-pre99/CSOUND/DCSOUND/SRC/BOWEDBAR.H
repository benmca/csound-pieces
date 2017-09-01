/*********************************************/
/*  Bowed Bar model                          */
/*  by Georg Essl, 1999                      */
/*  For details refer to:                    */
/*    G.Essl, P.R.Cook: "Banded Waveguides:  */
/*    Towards Physical Modelling of Bar      */
/*    Percussion Instruments", ICMC'99       */
/*********************************************/

#if !defined(__BowedBar_h)
#define __BowedBar_h
#define NR_MODES (4)

#include "cs.h"
#include "physutil.h"
#include "bowed.h"

/*******************************************/
/*  Non-Interpolating Delay Line           */
/*  Object by Perry R. Cook 1995-96.       */
/*  Revised by Gary Scavone, 1999.         */
/*                                         */
/*  This one uses either a delay line of   */
/*  maximum length specified on creation   */
/*  or a default length of 2048 samples.   */
/*  A non-interpolating delay line is      */
/*  typically used in non-time varying     */
/*  (reverb) applications.                 */
/*******************************************/

typedef struct DLineN {
  AUXCH	inputs;
  MYFLT	lastOutput;
  long inPoint;
  long outPoint;
  long length;
} DLINEN;

typedef struct BowedBar {
    OPDS	h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp, *frequency, *position, *bowPress, *GAIN;
    MYFLT	*integration_const, *trackVel, *bowposition, *lowestFreq;
  
    BowTabl     bowTabl;
    ADSR        adsr;
    BiQuad      bandpass[NR_MODES];
  
    MYFLT	maxVelocity;
    MYFLT	modes[4];
    DLINEN	delay[4];
/*      MYFLT	Zs[4][2]; */
/*      MYFLT	coeffs[4][2]; */
/*      MYFLT	filtOut[4]; */
/*      MYFLT	filtIn[4]; */
/*      MYFLT	filtGain[4]; */
    MYFLT	freq;
    int		nr_modes;       /* Usually 4 */
    int		length;
    MYFLT	gains[4];
    MYFLT	velinput;
    MYFLT	bowvel, bowTarg, lastBowPos;
    MYFLT	lastpos;
/*      int		pluck; */
    MYFLT	lastpress;
    int		kloop;
} BOWEDBAR;

#endif
