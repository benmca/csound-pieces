/******************************************/
/*  WaveGuide Flute ala Karjalainen,      */
/*  Smith, Waryznyk, etc.                 */
/*  with polynomial Jet ala Cook          */
/*  by Perry Cook, 1995-96                */
/*  Recoded for Csound by John ffitch     */
/*  November 1997                         */
/*                                        */
/*  This is a waveguide model, and thus   */
/*  relates to various Stanford Univ.     */
/*  and possibly Yamaha and other patents.*/
/*                                        */
/******************************************/

#if !defined(__Flute_h)
#define __Flute_h

#include "physutil.h"

/**********************************************/
/* Jet Table Object by Perry R. Cook, 1995-96 */
/* Consult Fletcher and Rossing, Karjalainen, */
/*       Cook, more, for information.         */
/* This, as with many other of my "tables",   */
/* is not a table, but is computed by poly-   */
/* nomial calculation.                        */
/**********************************************/

MYFLT JetTabl_lookup(MYFLT);

typedef struct FLUTE {
    OPDS	h;
    MYFLT	*ar;                  /* Output */
    MYFLT	*amp, *frequency;
    MYFLT	*jetRatio, *attack, *dettack, *noiseGain, *vibFreq;
    MYFLT	*vibAmt, *ifn, *lowestFreq; 
    MYFLT	*jetRefl;       /* Optional 0.5 */
    MYFLT	*endRefl;       /* Optional 0.5 */

    FUNC	*vibr;
    MYFLT	v_rate;         /* Parameters for vibrato */
    MYFLT	v_time;
/*     MYFLT	v_phaseOffset; */
    DLineL	jetDelay;
    DLineL	boreDelay;
    OnePole	filter;
    DCBlock	dcBlock;
    Noise	noise;
    ADSR	adsr;
    MYFLT	lastFreq;
    MYFLT	lastJet;
    MYFLT	maxPress;
    MYFLT	vibrGain;
    MYFLT	outputGain;
    MYFLT	kloop;
    MYFLT       lastamp;
} FLUTE;

#endif
