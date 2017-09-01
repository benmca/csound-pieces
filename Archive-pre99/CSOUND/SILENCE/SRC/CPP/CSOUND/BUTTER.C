/*              Butterworth filters coded by Paris Smaragdis 1994       */
/*              Berklee College of Music Csound development team        */
/*              Copyright (c) May 1994.  All rights reserved            */

#include "cs.h"
#include "butter.h"
#include <math.h>
#define ROOT2 (FL(1.4142135623730950488))

void butter_filter(MYFLT *, MYFLT *, MYFLT *);

static MYFLT pidsr;

void butset(BFIL *p)                    /*      Hi/Lo pass set-up       */
{
    if (*p->istor==FL(0.0)) {
        p->a[6] = p->a[7] = FL(0.0);
        p->lkf = FL(0.0);
    }
    pidsr = PI_F / esr; /* Constant really */
}

void bbutset(BBFIL *p)                  /*      Band set-up     */
{
    if (*p->istor==FL(0.0)) {
        p->a[6] = p->a[7] = FL(0.0);
        p->lkb = FL(0.0);
        p->lkf = FL(0.0);
    }
    pidsr = PI_F / esr; /* Constant really */
}

void hibut(BFIL *p)                     /*      Hipass filter   */
{
    MYFLT       *out, *in;

    in = p->ain;
    out = p->sr;

    if (*p->kfc <= FL(0.0))     {
      long      n = ksmps;
      do
        *out++ = *in++;
      while (--n);
      return;
    }

    if (*p->kfc != p->lkf)      {
      MYFLT     *a, c;

      a = p->a;
      p->lkf = *p->kfc;
      c = (MYFLT)tan((double)(pidsr * p->lkf));

      a[1] = FL(1.0) / ( FL(1.0) + ROOT2 * c + c * c);
      a[2] = -(a[1] + a[1]);
      a[3] = a[1];
      a[4] = FL(2.0) * ( c*c - FL(1.0)) * a[1];
      a[5] = ( FL(1.0) - ROOT2 * c + c * c) * a[1];
    }
    butter_filter( in, out, p->a);
}

void lobut(BFIL *p)                             /*      Lopass filter   */
{
    MYFLT       *out, *in;

    in = p->ain;
    out = p->sr;

    if (*p->kfc <= FL(0.0))     {
      long      n = ksmps;

      do
        *out++ = FL(0.0);
      while (--n);

      return;
    }

    if (*p->kfc != p->lkf)      {
      MYFLT     *a, c;

      a = p->a;
      p->lkf = *p->kfc;
      c = FL(1.0) / (MYFLT)tan((double)(pidsr * p->lkf));
      a[1] = FL(1.0) / ( FL(1.0) + ROOT2 * c + c * c);
      a[2] = a[1] + a[1];
      a[3] = a[1];
      a[4] = FL(2.0) * ( FL(1.0) - c*c) * a[1];
      a[5] = ( FL(1.0) - ROOT2 * c + c * c) * a[1];
    }

    butter_filter( in, out, p->a);
}

void bpbut(BBFIL *p)                            /*      Bandpass filter */
{
    MYFLT       *out, *in;

    in = p->ain;
    out = p->sr;
    if (*p->kbw <= FL(0.0))     {
      long      n = ksmps;
      do        *out++ = FL(0.0);
      while (--n);
      return;
    }
    if (*p->kbw != p->lkb || *p->kfo != p->lkf) {
      MYFLT *a, c, d;
      a = p->a;
      p->lkf = *p->kfo;
      p->lkb = *p->kbw;
      c = FL(1.0) / (MYFLT)tan((double)(pidsr * p->lkb));
      d = FL(2.0) * (MYFLT)cos( 2.0 * (double)(pidsr * p->lkf));
      a[1] = FL(1.0) / ( FL(1.0) + c);
      a[2] = FL(0.0);
      a[3] = -a[1];
      a[4] = - c * d * a[1];
      a[5] = ( c - FL(1.0)) * a[1];
    }
    butter_filter( in, out, p->a);
}

void bcbut(BBFIL *p)                                            /*      Band reject filter      */
{
    MYFLT       *out, *in;

    in = p->ain;
    out = p->sr;

    if (*p->kbw <= FL(0.0))     {
      long      n = ksmps;

      do        *out++ = *in++;
      while (--n);

      return;
    }

    if (*p->kbw != p->lkb || *p->kfo != p->lkf) {
      MYFLT *a, c, d;

      a = p->a;
      p->lkf = *p->kfo;
      p->lkb = *p->kbw;
      c = (MYFLT)tan((double)(pidsr * p->lkb));
      d = FL(2.0) * (MYFLT)cos( 2.0 * (double)(pidsr * p->lkf));
      a[1] = FL(1.0) / ( FL(1.0) + c);
      a[2] = - d * a[1];
      a[3] = a[1];
      a[4] = a[2];
      a[5] = ( FL(1.0) - c) * a[1];
    }

    butter_filter( in, out, p->a);
}

void butter_filter(MYFLT *in, MYFLT *out, MYFLT *a)     /*      Filter loop */
{
    MYFLT t, y;
    long n = ksmps;

    do {
      t = *in++ - a[4] * a[6] - a[5] * a[7];
      y = t * a[1] + a[2] * a[6] + a[3] * a[7];
      a[7] = a[6];
      a[6] = t;
      *out++ = y;
    } while (--n);
}
