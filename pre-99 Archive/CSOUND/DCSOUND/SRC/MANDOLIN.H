/**********************************************************************/  
/*  Commuted Mandolin Subclass of enhanced dual plucked-string model  */
/*  by Perry Cook, 1995-96                                            */
/*   Controls:	bodySize    pluckPosition	loopGain    deTuning  */
/*                                          			      */
/*  Note: Commuted Synthesis, as with many other WaveGuide techniques,*/
/*  is covered by patents, granted, pending, and/or applied-for.  All */
/*  are assigned to the Board of Trustees, Stanford University.       */
/*  For information, contact the Office of Technology Licensing,      */
/*  Stanford U.                                                       */
/**********************************************************************/  

#if !defined(__Mandolin_h)
#define __Mandolin_h
#include "clarinet.h"
#include "brass.h"

typedef struct Mandolin {
    OPDS	h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp;
    MYFLT	*frequency;
    MYFLT	*pluckPos;
    MYFLT	*detuning;
    MYFLT	*baseLoopGain;
    MYFLT	*s_rate;
    MYFLT	*ifn;
    MYFLT	*lowestFreq;

    FUNC	*soundfile;
    MYFLT	s_time;
    MYFLT	s_lastOutput;
    DLineA	delayLine1;
    DLineA	delayLine2;
    DLineL	combDelay;
    OneZero	filter1;
    OneZero	filter2;
    long	length;
    MYFLT	lastFreq;
    MYFLT	lastLength;
    long	dampTime;
    int		waveDone;
    int		kloop;
} MANDOL;

#endif
