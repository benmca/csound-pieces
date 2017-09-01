	/*	Envelope follower by Paris Smaragdis	*/
	/*	Berklee College of Music Csound development team */
	/*	Copyright (c) August 1994.  All rights reserve */
	/*	Improvements 1999 John ffitch */

#include "cs.h"
#include <math.h>
#include "follow.h"

void flwset(FOL *p)
{
    p->wgh = p->max = FL(0.0);
    p->length = (long)(*p->len * esr);
    if (p->length<=0L) {           /* RWD's suggestion */
      initerror(Str(X_549,"\nError: follow - zero length!\n"));
      p->length = (long)esr;
    }
    p->count = p->length;
}

                                /* Use absolute value rather than max/min */
void follow(FOL *p)
{
    long	n = ksmps;
    MYFLT	*in = p->in, *out = p->out;
    MYFLT	max = p->max;
    long        count = p->count;
    do {
      MYFLT sig = *in++;
      if (sig > max) max = sig;
      else if (sig < -max) max = -sig;
      if (--count == 0L) {
	p->wgh = max;
	max = FL(0.0);
	count = p->length;
      }
      *out++ = p->wgh;
    } while (--n);
    p->max = max;
    p->count = count;
}

/* The Jean-Marc Jot (IRCAM) envelope follower, from code by
   Bram.DeJong@rug.ac.be and James Maccartney posted on music-dsp;
   Transferred to csound by JPff, 2000 feb 12
*/
void envset(ENV *p)
{
                                /* Note - 6.90775527898 -- log(0.001) */
    p->lastatt = *p->attack;
    if (p->lastatt<=FL(0.0))
      p->ga = (MYFLT) exp(- 69.0775527898/esr);
    else 
      p->ga = (MYFLT) exp(- 6.90775527898/(esr* p->lastatt));
    p->lastrel = *p->release;
    if (p->lastrel<=FL(0.0))
      p->gr = (MYFLT) exp(- 69.0775527898/esr);
    else
      p->gr = (MYFLT) exp(- 6.90775527898/(esr* p->lastrel));
    p->envelope = FL(0.0);
}

void envext(ENV *p)
{
    int nsmps = ksmps;
    MYFLT	envelope = p->envelope;
    MYFLT 	ga, gr;
    MYFLT	*in = p->in, *out = p->out;
    if (p->lastrel!=*p->attack) {
      p->lastatt = *p->attack;
      if (p->lastatt<=FL(0.0))
        ga = p->ga = (MYFLT) exp(-10000.0/esr);
      else 
        ga = p->ga = (MYFLT) exp(-1.0/(esr* p->lastatt));
    }
    else ga = p->ga;
    if (p->lastrel!=*p->release) {
      p->lastrel = *p->release;
      if (p->lastrel<=FL(0.0))
        gr = p->gr = (MYFLT) exp(-100.0/esr);
      else
        gr = p->gr = (float) exp(-1.0/(esr* p->lastrel));
    }
    else gr = p->gr;
    do {
      MYFLT inp = *in++;
      if (inp<FL(0.0)) inp = -inp; /* Absolute value */
      if (envelope < inp) {
        envelope = inp + ga*(envelope-inp);
      }
      else {
        envelope = inp + gr*(envelope-inp);
      }
      *out++ = envelope;
    } while (nsmps--);
    p->envelope = envelope;
}
