/*******************************************/
/*  Master Class for 4 Operator FM Synth   */
/*  by Perry R. Cook, 1995-96              */ 
/*  This instrument contains an 4 waves,   */
/*  4 envelopes, and various state vars.   */
/*                                         */
/*  The basic Chowning/Stanford FM patent  */
/*  expired April 1995, but there exist    */
/*  follow-on patents, mostly assigned to  */
/*  Yamaha.  If you are of the type who    */
/*  should worry about this (making money) */
/*  worry away.                            */
/*                                         */
/*******************************************/

#if !defined(__FM4OP_h)
#define __FM4OP_h

#include "physutil.h"

/*******************************************/
/*  Two Zero Filter Class,                 */
/*  by Perry R. Cook, 1995-96              */ 
/*  See books on filters to understand     */
/*  more about how this works.  Nothing    */
/*  out of the ordinary in this version.   */
/*******************************************/

typedef struct TwoZero {
    MYFLT gain;
    MYFLT inputs[2];
    MYFLT lastOutput;
    MYFLT zeroCoeffs[2];
} TwoZero;

/*******************************************/
/*  Two Pole Filter Class,                 */
/*  by Perry R. Cook, 1995-96              */ 
/*  See books on filters to understand     */
/*  more about how this works.  Nothing    */
/*  out of the ordinary in this version.   */
/*******************************************/

typedef struct TwoPole {
    MYFLT gain;
    MYFLT onputs[2];
    MYFLT lastOutput;
    MYFLT poleCoeffs[2];
} TwoPole;

/* ********************************************************************** */

typedef struct FM4OP {
    OPDS    h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp, *frequency;
    MYFLT	*control1, *control2, *modDepth; /* Control1 doubles as vowel */
    MYFLT	*vibFreq;
    MYFLT	*ifn0, *ifn1, *ifn2, *ifn3, *vifn;

    ADSR	adsr[4]; 
    FUNC	*waves[4];
    MYFLT	w_rate[4];         /* Parameters for vibrato */
    MYFLT	w_time[4];
    MYFLT	w_phase[4];
    FUNC	*vibWave;
    MYFLT	v_rate;         /* Parameters for vibrato */
    MYFLT	v_time;
/*     MYFLT	v_phaseOffset; */
    TwoZero	twozero;
    MYFLT	baseFreq;
    MYFLT	ratios[4];
    MYFLT	gains[4];
} FM4OP;

typedef struct FM4OPV {
    OPDS    h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp, *frequency;
    MYFLT	*control1, *control2, *modDepth; /* Control1 doubles as vowel */
    MYFLT	*vibFreq;
    MYFLT	*ifn0, *ifn1, *ifn2, *ifn3, *vifn;

    ADSR	adsr[4]; 
    FUNC	*waves[4];
    MYFLT	w_rate[4];
    MYFLT	w_time[4];
    MYFLT	w_phase[4];
    FUNC	*vibWave;
    MYFLT	v_rate;         /* Parameters for vibrato */
    MYFLT	v_time;         /* Parameters for vibrato */
/*     MYFLT	v_phaseOffset; */
    TwoZero	twozero;
    MYFLT	baseFreq;
    MYFLT	ratios[4];
    MYFLT	gains[4];
    MYFLT	tilt[3];
    MYFLT	mods[3];
    MYFLT	last_control;
} FM4OPV;


#endif
