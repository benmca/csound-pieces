/******************************************/
/*  Simple Brass Instrument Model ala     */
/*  Cook (TBone, HosePlayer)              */
/*  by Perry R. Cook, 1995-96             */
/*                                        */
/*  This is a waveguide model, and thus   */
/*  relates to various Stanford Univ.     */
/*  and possibly Yamaha and other patents.*/
/*                                        */
/*   Controls:    CONTROL1 = lipTension   */
/*                CONTROL2 = slideLength  */
/*                CONTROL3 = vibFreq      */
/*                MOD_WHEEL= vibAmt       */
/******************************************/

#if !defined(__Brass_h)
#define __Brass_h

#include "physutil.h"
#include "cs.h"
#include <math.h>

/*******************************************/
/*                                         */
/*  AllPass Interpolating Delay Line       */
/*  Object by Perry R. Cook 1995-96        */
/*  This one uses a delay line of maximum  */
/*  length specified on creation, and      */
/*  interpolates fractional length using   */
/*  an all-pass filter.  This version is   */
/*  more efficient for computing static    */
/*  length delay lines (alpha and coeff    */
/*  are computed only when the length      */
/*  is set, there probably is a more       */
/*  efficient computational form if alpha  */
/*  is changed often (each sample)).       */
/*                                         */
/*******************************************/


typedef struct DLineA {
    AUXCH       inputs;
    MYFLT       lastOutput;
    long        inPoint;
    long        outPoint;
    long        length;
    MYFLT       alpha;
    MYFLT       coeff;
    MYFLT       lastIn;
} DLineA;

void make_DLineA(DLineA *, long max_length);
/* void DLineA_clear(DLineA *); */
int DLineA_setDelay(DLineA *, MYFLT length);
MYFLT DLineA_tick(DLineA *, MYFLT sample);

/***********************************************/
/*  Lip Filter Object by Perry R. Cook, 1995-96*/
/*  The lip of the brass player has dynamics   */
/*  which are controlled by the mass, spring   */
/*  constant, and damping of the lip.  This    */
/*  filter simulates that behavior and the     */
/*  transmission/reflection properties as      */
/*  well.  See Cook TBone and HosePlayer       */
/*  instruments and articles.                  */
/***********************************************/

typedef BiQuad LipFilt;

void make_LipFilt(LipFilt*);
void LipFilt_clear(LipFilt*);
void LipFilt_setFreq(LipFilt*, MYFLT frequency);
MYFLT LipFilt_tick(LipFilt*, MYFLT mouthSample,MYFLT boreSample);
MYFLT LipFilt_lastOut(LipFilt*);


/* ---------------------------------------------------------------------- */
typedef struct BRASS {
    OPDS    h;
    MYFLT       *ar;                  /* Output */
    MYFLT       *amp, *frequency;
    MYFLT       *liptension, *dettack;
    MYFLT       *vibFreq, *vibAmt, *ifn, *lowestFreq;

    FUNC        *vibr;          /* Table for vibrato */
    MYFLT       v_rate;         /* Parameters for vibrato */
    MYFLT       v_time;
/*     MYFLT    v_phaseOffset; */
    DLineA      delayLine;
    LipFilt     lipFilter;
    DCBlock     dcBlock;
    ADSR        adsr;
    long        length;
    MYFLT       slideTarget;
    MYFLT       maxPressure;
    MYFLT       lipTarget;
    MYFLT       frq;            /* Remember previous value */
    MYFLT       lipT;           /* and lip tension */
    int         kloop;
} BRASS;

#endif
