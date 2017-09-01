/******************************************/
/*  Bowed String model ala Smith          */
/* after McIntyre, Schumacher, Woodhouse  */
/*  by Perry Cook, 1995-96                */
/*  Recoded for Csound by John ffitch     */
/*  November 1997                         */
/*                                        */
/*  This is a waveguide model, and thus   */
/*  relates to various Stanford Univ.     */
/*  and possibly Yamaha and other patents.*/
/*                                        */
/******************************************/

#if !defined(__Bowed_h)
#define __Bowed_h

#include "physutil.h"

/***********************************************/
/*  Simple Bow Table Object, after Smith       */
/*    by Perry R. Cook, 1995-96                */
/***********************************************/

typedef struct BowTabl {
    MYFLT       offSet;
    MYFLT       slope;
    MYFLT       lastOutput;
} BowTabl;

MYFLT BowTabl_lookup(BowTabl*, MYFLT sample);

typedef struct BOWED {
    OPDS        h;
    MYFLT       *ar;                  /* Output */
    MYFLT       *amp, *frequency;
    MYFLT       *bowPress, *betaRatio, *vibFreq;
    MYFLT       *vibAmt, *ifn, *lowestFreq;

    FUNC        *vibr;
    MYFLT       v_rate;         /* Parameters for vibrato */
    MYFLT       v_time;
    MYFLT       v_phaseOffset;
    MYFLT       v_lastOutput;
    DLineL      neckDelay;
    DLineL      bridgeDelay;
    BowTabl     bowTabl;
    OnePole     reflFilt;
    BiQuad      bodyFilt;
    ADSR        adsr;
    MYFLT       maxVelocity;
    MYFLT       baseDelay;
    MYFLT       vibrGain;
    MYFLT       lastpress;
    MYFLT       lastfreq;
    MYFLT       lastbeta;
    MYFLT       lastamp;
    int         kloop;
} BOWED;


#endif
