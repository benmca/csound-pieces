/* This file contains a collection of utilities for the Physical Model
   opcodes, in no particular order
*/

#include <stdlib.h>
#include "physutil.h"    

/*******************************************/
/*  Noise Generator Class,                 */
/*  by Perry R. Cook, 1995-96              */ 
/*  White noise as often as you like.      */
/*******************************************/

#define ONE_OVER_RANDLIMIT (1.0f/(MYFLT)(RAND_MAX/2))

MYFLT Noise_tick(Noise *n)
{
    *n = (MYFLT) rand() - (MYFLT)(RAND_MAX/2);
    *n *= ONE_OVER_RANDLIMIT;
/* return (*n=0); */
    return *n;
}


/*******************************************/
/*  Linearly Interpolating Delay Line      */
/*  Object by Perry R. Cook 1995-96        */
/*  This one uses a delay line of maximum  */
/*  length specified on creation, and      */ 
/*  linearly interpolates fractional       */
/*  length.  It is designed to be more     */
/*  efficient if the delay length is not   */
/*  changed very often.                    */
/*******************************************/

void make_DLineL(DLineL *p, long max_length)
{
    long i;

    p->length = max_length;
    auxalloc(max_length * sizeof(MYFLT), &p->inputs);
    for (i=0; i<max_length; i++) ((MYFLT*)p->inputs.auxp)[i] = 0.0f;
    p->outPoint = 0;
    p->lastOutput = 0.0f;
    p->inPoint = max_length >> 1;
}

void DLineL_setDelay(DLineL *p, MYFLT lag)
{
    MYFLT outputPointer;

/* printf("SetDelay of %f\n", lag); */
    outputPointer = p->inPoint - lag; /* read chases write, + 1 for interp. */
    while (outputPointer<0.0f)
      outputPointer += (MYFLT)p->length;           /* modulo maximum length */
    while (outputPointer>=(MYFLT)p->length)
      outputPointer -= (MYFLT)p->length;           /* modulo maximum length */
    p->outPoint = (long) outputPointer;            /* integer part */
    p->alpha = outputPointer - (MYFLT)p->outPoint; /* fractional part */
    p->omAlpha = 1.0f - p->alpha;                  /* 1.0 - fractional part */

/* printf("outPoint=%ld alpha=%f omAlpha=%f\n", p->outPoint, p->alpha, p->omAlpha); */
}

MYFLT DLineL_tick(DLineL *p, MYFLT sample) /* Take one, yield one */
{
    MYFLT lastOutput;

    ((MYFLT*)p->inputs.auxp)[p->inPoint++] = sample; /*  Input next sample */
    if ( p->inPoint ==  p->length)         /* Check for end condition */
      p->inPoint -= p->length;
                                /* first 1/2 of interpolation */
    lastOutput = ((MYFLT*)p->inputs.auxp)[p->outPoint++] * p->omAlpha;
    if ( p->outPoint< p->length) {         /*  Check for end condition */
                                /* second 1/2 of interpolation    */
      lastOutput += ((MYFLT*)p->inputs.auxp)[p->outPoint] * p->alpha;
    }
    else {                      /*  if at end . . .  */
                                /* second 1/2 of interpolation */
      lastOutput +=  ((MYFLT*)p->inputs.auxp)[0]*p->alpha;
      p->outPoint -=  p->length;
    }
/* printf("tick->%f\n", lastOutput); */
    return (p->lastOutput = lastOutput);
}

/*******************************************/
/*  Envelope Class, Perry R. Cook, 1995-96 */ 
/*  This is the base class for envelopes.  */
/*  This one is capable of ramping state   */
/*  from where it is to a target value by  */
/*  a rate.                                */
/*******************************************/

void make_Envelope(Envelope *e)
{    
    e->target = 0.0f;
    e->value = 0.0f;
    e->rate = 0.001f;
    e->state = 1;
/*     printf("Envmk: state=%d (%f %f %f)\n", */
/*            e->state, e->value, e->rate, e->target); */
}

void Envelope_keyOn(Envelope *e)
{
    e->target = 1.0f;
    if (e->value != e->target) e->state = 1;
}

void Envelope_keyOff(Envelope *e)
{
    e->target = 0.0f;
    if (e->value != e->target) e->state = 1;
}

void Envelope_setRate(Envelope *e, MYFLT aRate)
{
    if (aRate < 0.0f) {
        err_printf(Str(X_1010,"negative rates not allowed!!, correcting\n"));
        e->rate = -aRate;
    }
    else e->rate = aRate;

/*     printf("RATE_NORM=%f\n", (MYFLT)RATE_NORM); */
/*     printf("EnvSR: state=%d (%f %f %f)\n", */
/*            e->state, e->value, e->rate, e->target); */
}

void Envelope_setTarget(Envelope *e, MYFLT aTarget)
{
    e->target = aTarget;
    if (e->value != e->target) e->state = 1;
}

void Envelope_setValue(Envelope *e, MYFLT aValue)
{
    e->state = 0;
    e->target = aValue;
    e->value = aValue;
}

MYFLT Envelope_tick(Envelope *e)
{
    if (e->state)  {
        if (e->target > e->value)    {
            e->value += e->rate;
            if (e->value >= e->target)    {
                e->value = e->target;
                e->state = 0;
            }
        }
        else    {
            e->value -= e->rate;
            if (e->value <= e->target)    {
                e->value = e->target;
                e->state = 0;
            }
        }
    }
/*     printf("Env: %f\n", e->value); */
    return e->value;
}

/* int Envelope_informTick(Envelope *e) */
/* { */
/*     Envelope_tick(e); */
/*     return e->state; */
/* } */

/* MYFLT Envelope_lastOut(Envelope *e) */
/* { */
/*     return e->value; */
/* } */

void Envelope_print(Envelope *p)
{
    printf(Str(X_252,"Envelope: value=%f target=%f rate=%f state=%d\n"),
           p->value, p->target, p->rate, p->state);
}


/*******************************************/
/*  One Pole Filter Class,                 */
/*  by Perry R. Cook, 1995-96              */
/*  The parameter gain is an additional    */
/*  gain parameter applied to the filter   */
/*  on top of the normalization that takes */
/*  place automatically.  So the net max   */
/*  gain through the system equals the     */
/*  value of gain.  sgain is the combina-  */
/*  tion of gain and the normalization     */
/*  parameter, so if you set the poleCoeff */
/*  to alpha, sgain is always set to       */
/*  gain * (1.0 - fabs(alpha)).            */
/*******************************************/

void make_OnePole(OnePole* p)
{
    p->poleCoeff = 0.9f;
    p->gain = 1.0f;
    p->sgain = 0.1f;
    p->outputs = 0.0f;
}

/* void OnePole_clear(OnePole* p) */
/* { */
/*     p->outputs = 0.0f; */
/*     p->lastOutput = 0.0f; */
/* } */

void OnePole_setPole(OnePole* p, MYFLT aValue)
{
    p->poleCoeff = aValue;
    if (p->poleCoeff > 0.0f)                   /*  Normalize gain to 1.0 max */
	p->sgain = p->gain * (1.0f - p->poleCoeff);
    else
	p->sgain = p->gain * (1.0f + p->poleCoeff);
/*     printf("OnePoleSetPole: %f %f\n", aValue, p->sgain); */
}

void OnePole_setGain(OnePole* p, MYFLT aValue)
{
    p->gain = aValue;
    if (p->poleCoeff > 0.0f)
	p->sgain = p->gain * (1.0f - p->poleCoeff);  /*  Normalize gain to 1.0 max */
    else
	p->sgain = p->gain * (1.0f + p->poleCoeff);
}

MYFLT OnePole_tick(OnePole* p, MYFLT sample)  /*   Perform Filter Operation */
{
    p->outputs = (p->sgain * sample) + (p->poleCoeff * p->outputs);
/*     p->lastOutput = p->outputs; */
    return p->outputs;
}

void OnePole_print(OnePole *p)
{
    printf("OnePole: gain=%f outputs=%f poleCoeff=%f sgain=%f\n",
           p->gain, p->outputs, p->poleCoeff, p->sgain);
}


/*******************************************/
/*  DC Blocking Filter                     */ 
/*  by Perry R. Cook, 1995-96              */ 
/*  This guy is very helpful in, uh,       */
/*  blocking DC.  Needed because a simple  */
/*  low-pass reflection filter allows DC   */
/*  to build up inside recursive           */ 
/*  structures.                            */
/*******************************************/

void make_DCBlock(DCBlock* d)
{
    d->outputs = 0.0f;
    d->inputs = 0.0f;
/*     d->lastOutput = 0.0f; */
}

/* void DCBlock_clear(DCBlock* d) */
/* { */
/*     d->outputs = 0.0f; */
/*     d->inputs = 0.0f; */
/*     d->lastOutput = 0.0f; */
/* } */

MYFLT DCBlock_tick(DCBlock* d, MYFLT sample)    
{
    d->outputs = sample - d->inputs + (0.99f * d->outputs);
    d->inputs = sample;
/*     d->lastOutput = d->outputs; */
    return d->outputs;
}


/*******************************************/
/*  ADSR Subclass of the Envelope Class,   */
/*  by Perry R. Cook, 1995-96              */ 
/*  This is the traditional ADSR (Attack   */
/*  Decay, Sustain, Release) ADSR.         */
/*  It responds to simple KeyOn and KeyOff */
/*  messages, keeping track of it's state. */         
/*  There are two tick (update value)      */
/*  methods, one returns the value, and    */
/*  other returns the state (0 = A, 1 = D, */
/*  2 = S, 3 = R)                          */
/*******************************************/

void make_ADSR(ADSR *a)
{
    make_Envelope((Envelope*)a);
    a->target = 0.0f;
    a->value = 0.0f;
    a->attackRate = 0.001f;
    a->decayRate = 0.001f;
    a->sustainLevel = 0.5f;
    a->releaseRate = 0.01f;
    a->state = ATTACK;
}

void ADSR_keyOn(ADSR *a)
{
    a->target = 1.0f;
    a->rate = a->attackRate;
    a->state = ATTACK;
}

void ADSR_keyOff(ADSR *a)
{
    a->target = 0.0f;
    a->rate = a->releaseRate;
    a->state = RELEASE;
}

void ADSR_setAttackRate(ADSR *a, MYFLT aRate)
{
    if (aRate < 0.0) {
        printf(Str(X_1010,"negative rates not allowed!!, correcting\n"));
        a->attackRate = -aRate;
    }
    else a->attackRate = aRate;
    a->attackRate *= RATE_NORM;
/*    printf("ADSR:att %f\n", a->attackRate); */
}

void ADSR_setDecayRate(ADSR *a, MYFLT aRate)
{
    if (aRate < 0.0) {
        printf(Str(X_1010,"negative rates not allowed!!, correcting\n"));
        a->decayRate = -aRate;
    }
    else a->decayRate = aRate;
    a->decayRate *= RATE_NORM;
}

void ADSR_setSustainLevel(ADSR *a, MYFLT aLevel)
{
    if (aLevel < 0.0f ) {
        printf(Str(X_472,"Sustain level out of range!!, correcting\n"));
        a->sustainLevel = 0.0f;
    }
    else a->sustainLevel = aLevel;
}

void ADSR_setReleaseRate(ADSR *a, MYFLT aRate)
{
    if (aRate < 0.0f) {
        printf(Str(X_1010,"negative rates not allowed!!, correcting\n"));
        a->releaseRate = -aRate;
    }
    else a->releaseRate = aRate;
    a->releaseRate *= RATE_NORM;
}

void ADSR_setAttackTime(ADSR *a, MYFLT aTime)
{
    if (aTime < 0.0) {
      printf("negative times not allowed!!, correcting\n");
      a->attackRate = 1.0f /(-aTime*esr);
    }
    else a->attackRate = 1.0f / (aTime*esr);
}

void ADSR_setDecayTime(ADSR *a, MYFLT aTime)
{
    if (aTime < 0.0) {
      printf("negative times not allowed!!, correcting\n");
      a->decayRate = 1.0f /(-aTime*esr);
    }
    else a->decayRate = 1.0f / (aTime*esr);
}

void ADSR_setReleaseTime(ADSR *a, MYFLT aTime)
{
    if (aTime < 0.0) {
      printf("negative times not allowed!!, correcting\n");
      a->releaseRate = 1.0f /(-aTime*esr);
    }
    else a->releaseRate = 1.0f / (aTime*esr);
}

void ADSR_setAllTimes(ADSR *a, MYFLT attTime, MYFLT decTime, MYFLT susLevel, MYFLT relTime)
{
    ADSR_setAttackTime(a, attTime);
    ADSR_setDecayTime(a, decTime);
    ADSR_setSustainLevel(a, susLevel);
    ADSR_setReleaseTime(a, relTime);
/*      printf("New: attackRate=%f decayRate=%f sustainLevel=%f releaseRate=%f\n", */
/*           a->attackRate, a->decayRate, a->sustainLevel, a->releaseRate); */
}

void ADSR_setAll(ADSR *a, MYFLT attRate, MYFLT decRate,
                 MYFLT susLevel, MYFLT relRate)
{
    ADSR_setAttackRate(a, attRate);
    ADSR_setDecayRate(a, decRate);
    ADSR_setSustainLevel(a, susLevel);
    ADSR_setReleaseRate(a, relRate);
/*      printf("Old: attackRate=%f decayRate=%f sustainLevel=%f releaseRate=%f\n", */
/*             a->attackRate, a->decayRate, a->sustainLevel, a->releaseRate); */
}

void ADSR_setTarget(ADSR *a, MYFLT aTarget)
{
    a->target = aTarget;
    if (a->value <a-> target) {
      a->state = ATTACK;
      ADSR_setSustainLevel(a, a->target);
      a->rate = a->attackRate;
    }
    if (a->value > a->target) {
      ADSR_setSustainLevel(a, a->target);
      a->state = DECAY;
      a->rate = a->decayRate;
    }
}

void ADSR_setValue(ADSR *a, MYFLT aValue)
{
    a->state = SUSTAIN;
    a->target = aValue;
    a->value = aValue;
    ADSR_setSustainLevel(a, aValue);
    a->rate = 0.0f;
}

MYFLT ADSR_tick(ADSR *a)
{
    if (a->state==ATTACK)  {
      a->value += a->rate;
      if (a->value >= a->target) {
        a->value = a->target;
        a->rate = a->decayRate;
        a->target = a->sustainLevel;
        a->state = DECAY;
      }
      /*         printf("Attack->%f\n", a->value); */
    }    
    else if (a->state==DECAY)  {
      a->value -= a->decayRate;
      if (a->value <= a->sustainLevel) {
        a->value = a->sustainLevel;
        a->rate = 0.0f;
        a->state = SUSTAIN;
      }
    }
    else if (a->state==RELEASE)  {
      a->value -= a->releaseRate;
      if (a->value <= 0.0f) {
        a->value = 0.0f;
        a->state = CLEAR;
      }
    }
    return a->value;
}

/*  int ADSR_informTick(ADSR *a) */
/*  { */
/*      ADSR_tick(a); */
/*      return a->state; */
/*  } */

/*******************************************/
/*  BiQuad (2-pole, 2-zero) Filter Class,  */
/*  by Perry R. Cook, 1995-96              */ 
/*  See books on filters to understand     */
/*  more about how this works.  Nothing    */
/*  out of the ordinary in this version.   */
/*******************************************/

void make_BiQuad(BiQuad *b)
{
    b->zeroCoeffs[0] = 0.0f;
    b->zeroCoeffs[1] = 0.0f;
    b->poleCoeffs[0] = 0.0f;
    b->poleCoeffs[1] = 0.0f;
    b->gain = 1.0f;
/*     BiQuad_clear(b); */
    b->inputs[0] = 0.0f;
    b->inputs[1] = 0.0f;
    b->lastOutput = 0.0f;
}

void BiQuad_clear(BiQuad *b)
{
    b->inputs[0] = 0.0f;
    b->inputs[1] = 0.0f;
    b->lastOutput = 0.0f;
}

void BiQuad_setPoleCoeffs(BiQuad *b, MYFLT *coeffs)
{
    b->poleCoeffs[0] = coeffs[0];
    b->poleCoeffs[1] = coeffs[1];
}

void BiQuad_setZeroCoeffs(BiQuad *b, MYFLT *coeffs)
{
    b->zeroCoeffs[0] = coeffs[0];
    b->zeroCoeffs[1] = coeffs[1];
}

MYFLT BiQuad_tick(BiQuad *b, MYFLT sample) /*   Perform Filter Operation   */
{                               /*  Biquad is two pole, two zero filter  */
    MYFLT temp;                 /*  Look it up in your favorite DSP text */

/* printf("biQuad: insample=%f\t(%f; %f,%f;%f,%f;%f%f)\t", sample, */
/*   b->gain, b->inputs[0], b->inputs[1], b->poleCoeffs[0], b->poleCoeffs[1], */
/*   b->zeroCoeffs[0], b->zeroCoeffs[1]); */
    temp = sample * b->gain;                     /* Here's the math for the  */
    temp += b->inputs[0] * b->poleCoeffs[0];     /* version which implements */
    temp += b->inputs[1] * b->poleCoeffs[1];     /* only 2 state variables.  */
    
    b->lastOutput = temp;                               /* This form takes   */
    b->lastOutput += (b->inputs[0] * b->zeroCoeffs[0]); /* 5 multiplies and  */
    b->lastOutput += (b->inputs[1] * b->zeroCoeffs[1]); /* 4 adds            */
    b->inputs[1] = b->inputs[0];                        /* and 3 moves       */
    b->inputs[0] = temp;                        /* like the 2 state-var form */

/* printf("tick->%f\n", b->lastOutput); */
    return b->lastOutput;

}

