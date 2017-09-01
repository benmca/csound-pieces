/*      vdelay, multitap, reverb2 coded by Paris Smaragdis 1994 */
/*      Berklee College of Music Csound development team        */
/*      Copyright (c) May 1994.  All rights reserved            */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "cs.h"
#include "vdelay.h"
#include "revsets.h"

#define ESR     (esr/FL(1000.0))

void vdelset(VDEL *p)           /*  vdelay set-up   */
{
    unsigned long n = (long)(*p->imaxd * ESR);
    MYFLT *buf;

    if (n == 0) n = 1;		/* fix due to Troxler */

    if (!*p->istod) {
      if (p->aux.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux.size) /* allocate space for delay buffer */
	auxalloc(n * sizeof(MYFLT), &p->aux);
      else {
	buf = (MYFLT *)p->aux.auxp;  /*    make sure buffer is empty       */
	do {
	  *buf++ = FL(0.0);
	} while (--n);
      }
      p->left = 0;
    }
}

void vdelay(VDEL *p)              /*      vdelay  routine */
{
    unsigned long  nn, maxd, indx;
    MYFLT *out = p->sr;  /* assign object data to local variables   */
    MYFLT *in = p->ain;
    MYFLT *del = p->adel;
    MYFLT *buf = (MYFLT *)p->aux.auxp;

    if (buf==NULL) {            /* RWD fix */
      initerror(Str(X_1372,"vdelay: not initialized"));
      return;
    }
    maxd = (unsigned long) (*p->imaxd * ESR);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;

    if (p->XINCODE == 3)    {    /*      if delay is a-rate      */
        do {
	    MYFLT  fv1, fv2;
	    long   v1, v2;

            buf[indx] = *in++;
            fv1 = indx - (*del++) * ESR;
        /* Make sure Inside the buffer      */
	    /*
	     * The following has been fixed by adding a cast and making a
	     * ">=" instead of a ">" comparison. The order of the comparisons
	     * has been swapped as well (a bit of a nit, but comparing a
	     * possibly negative number to an unsigned isn't a good idea--and
	     * broke on Alpha).
	     * heh 981101
	     */
            while (fv1 < FL(0.0))
                fv1 += (MYFLT)maxd;
            while (fv1 >= (MYFLT)maxd)
                fv1 -= (MYFLT)maxd;

            if (fv1 < maxd - 1) /* Find next sample for interpolation      */
                fv2 = fv1 + 1;
            else
                fv2 = FL(0.0);

            v1 = (long)fv1;
            v2 = (long)fv2;
            *out++ = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);

            if (++indx == maxd) indx = 0;             /* Advance current pointer */

        } while (--nn);
    }
    else {                      /* and, if delay is k-rate */
        do {
            MYFLT  fv1, fv2;
            long   v1, v2;

            buf[indx] = *in++;
            fv1 = indx - *del * ESR;
				/* Make sure inside the buffer      */
	    /*
	     * See comment above--same fix applied here.  heh 981101
	     */
            while (fv1 < FL(0.0))
                fv1 += (MYFLT)maxd;
            while (fv1 >= (MYFLT)maxd)
                fv1 -= (MYFLT)maxd;

            if (fv1 < maxd - 1) /* Find next sample for interpolation      */
                fv2 = fv1 + 1;
            else
                fv2 = FL(0.0);

            v1 = (long)fv1;
            v2 = (long)fv2;
            *out++ = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);

            if (++indx == maxd) indx = 0;             /*      Advance current pointer */

        } while (--nn);
    }
    p->left = indx;             /*      and keep track of where you are */
}

void vdelay3(VDEL *p)              /*      vdelay routine with cubic interp */
{
    unsigned long  nn, maxd, indx;
    MYFLT *out = p->sr;  /* assign object data to local variables   */
    MYFLT *in = p->ain;
    MYFLT *del = p->adel;
    MYFLT *buf = (MYFLT *)p->aux.auxp;

    if (buf==NULL) {            /* RWD fix */
      initerror(Str(X_1371,"vdelay3: not initialized"));
      return;
    }
    maxd = (unsigned long) (*p->imaxd * ESR);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;

    if (p->XINCODE == 3)    {    /*      if delay is a-rate      */
      do {
	    MYFLT  fv1, fv2;
	    long   v0, v1, v2, v3;

            buf[indx] = *in++;
            fv1 = indx - (*del++) * ESR;
        /* Make sure Inside the buffer      */
	    /*
	     * The following has been fixed by adding a cast and making a
	     * ">=" instead of a ">" comparison. The order of the comparisons
	     * has been swapped as well (a bit of a nit, but comparing a
	     * possibly negative number to an unsigned isn't a good idea--and
	     * broke on Alpha).
	     * heh 981101
	     */
            while (fv1 < FL(0.0))
                fv1 += (MYFLT)maxd;
            while (fv1 >= (MYFLT)maxd)
                fv1 -= (MYFLT)maxd;

            if (fv1 < maxd - 1) /* Find next sample for interpolation      */
                fv2 = fv1 + 1;
            else
                fv2 = FL(0.0);

            v1 = (long)fv1;
            v2 = (long)fv2;
            if (maxd<4) {
            *out++ = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);
            }
            else {
              MYFLT delfrac = fv1 - ( long)fv1;
              v0 = (v1==0 ? maxd-1 : v1-1);
              v3 = (v2==(long)maxd-1 ? 0 : v2+1);
              {
                MYFLT frsq = delfrac*delfrac;
                MYFLT frcu = frsq*buf[v0];
                MYFLT t1 = buf[v3] + 3*buf[v1];
                *out++ = buf[v1] + FL(0.5)*frcu +
                  delfrac*(buf[v2] - frcu/6 - t1/6 - buf[v0]/3) +
                  frsq*delfrac*(t1/6 - FL(0.5)*buf[v2]) +
                  frsq*(FL(0.5)* buf[v2] - buf[v1]);
              }
            }
            if (++indx == maxd) indx = 0;             /* Advance current pointer */

        } while (--nn);
    }
    else {                      /* and, if delay is k-rate */
      do {
        MYFLT  fv1, fv2;
	long   v0, v1, v2, v3;

        buf[indx] = *in++;
        fv1 = indx - *del * ESR;
				/* Make sure inside the buffer      */
	/*
	 * See comment above--same fix applied here.  heh 981101
	 */
        while (fv1 < FL(0.0))
          fv1 += (MYFLT)maxd;
        while (fv1 >= (MYFLT)maxd)
          fv1 -= (MYFLT)maxd;

        if (fv1 < maxd - 1) /* Find next sample for interpolation      */
          fv2 = fv1 + 1;
        else
          fv2 = FL(0.0);

        v1 = (long)fv1;
        v2 = (long)fv2;
        if (maxd<4) {
          *out++ = buf[v1] + (fv1 - ( long)fv1) * ( buf[v2] - buf[v1]);
        }
        else {
          MYFLT delfrac = fv1 - ( long)fv1;
          v0 = (v1==0 ? maxd : v1-1);
          v3 = (v2==(long)maxd-1 ? 0 : v2+1);
          {
            MYFLT frsq = delfrac*delfrac;
            MYFLT frcu = frsq*buf[v0];
            MYFLT t1 = buf[v3] + 3*buf[v1];
            *out++ = buf[v1] + FL(0.5)*frcu +
              delfrac*(buf[v2] - frcu/6 - t1/6 - buf[v0]/3) +
              frsq*delfrac*(t1/6 - FL(0.5)*buf[v2]) +
              frsq*(FL(0.5)* buf[v2] - buf[v1]);
          }
        }
        if (++indx == maxd) indx = 0;             /*      Advance current pointer */

      } while (--nn);
    }
    p->left = indx;             /*      and keep track of where you are */
}

/* vdelayx, vdelayxs, vdelayxq, vdelayxw, vdelayxws, vdelayxwq */
/* coded by Istvan Varga, Mar 2001 */

void vdelxset(VDELX *p)           /*  vdelayx set-up (1 channel) */
{
    unsigned long n = (long)(*p->imaxd * esr);
    MYFLT *buf1;

    if (n == 0) n = 1;		/* fix due to Troxler */

    if (!*p->istod) {
      if (p->aux1.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux1.size) /* allocate space */
	auxalloc(n * sizeof(MYFLT), &p->aux1);   /* for delay buffer */
      buf1 = (MYFLT *)p->aux1.auxp;  /*    make sure buffer is empty       */
      do {
	*buf1++ = FL(0.0);
      } while (--n);

      p->left = 0;
      p->interp_size = 4 * (int) (FL(0.5) + FL(0.25) * *(p->iquality));
      p->interp_size = (p->interp_size < 4 ? 4 : p->interp_size);
      p->interp_size = (p->interp_size > 1024 ? 1024 : p->interp_size);
    }
}

void vdelxsset(VDELXS *p)           /*  vdelayxs set-up (stereo) */
{
    unsigned long n = (long)(*p->imaxd * esr);
    MYFLT *buf1, *buf2;

    if (n == 0) n = 1;		/* fix due to Troxler */

    if (!*p->istod) {
      if (p->aux1.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux1.size) /* allocate space */
	auxalloc(n * sizeof(MYFLT), &p->aux1);   /* for delay buffer */
      if (p->aux2.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux2.size)
	auxalloc(n * sizeof(MYFLT), &p->aux2);
      buf1 = (MYFLT *)p->aux1.auxp;  /*    make sure buffer is empty       */
      buf2 = (MYFLT *)p->aux2.auxp;
      do {
	*buf1++ = FL(0.0);
*buf2++ = FL(0.0);
      } while (--n);

      p->left = 0;
      p->interp_size = 4 * (int) (FL(0.5) + FL(0.25) * *(p->iquality));
      p->interp_size = (p->interp_size < 4 ? 4 : p->interp_size);
      p->interp_size = (p->interp_size > 1024 ? 1024 : p->interp_size);
    }
}

void vdelxqset(VDELXQ *p)           /*  vdelayxq set-up (quad channels) */
{
    unsigned long n = (long)(*p->imaxd * esr);
    MYFLT *buf1, *buf2, *buf3, *buf4;

    if (n == 0) n = 1;		/* fix due to Troxler */

    if (!*p->istod) {
      if (p->aux1.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux1.size) /* allocate space */
	auxalloc(n * sizeof(MYFLT), &p->aux1);   /* for delay buffer */
      if (p->aux2.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux2.size)
	auxalloc(n * sizeof(MYFLT), &p->aux2);
      if (p->aux3.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux3.size)
	auxalloc(n * sizeof(MYFLT), &p->aux3);
      if (p->aux4.auxp == NULL ||
	  (int)(n*sizeof(MYFLT)) > p->aux4.size)
	auxalloc(n * sizeof(MYFLT), &p->aux4);
      buf1 = (MYFLT *)p->aux1.auxp;  /*    make sure buffer is empty       */
      buf2 = (MYFLT *)p->aux2.auxp;
      buf3 = (MYFLT *)p->aux3.auxp;
      buf4 = (MYFLT *)p->aux4.auxp;
      do {
	*buf1++ = FL(0.0);
	*buf2++ = FL(0.0);
	*buf3++ = FL(0.0);
	*buf4++ = FL(0.0);
      } while (--n);

      p->left = 0;
      p->interp_size = 4 * (int) (FL(0.5) + FL(0.25) * *(p->iquality));
      p->interp_size = (p->interp_size < 4 ? 4 : p->interp_size);
      p->interp_size = (p->interp_size > 1024 ? 1024 : p->interp_size);
    }
}

void vdelayx(VDELX *p)              /*      vdelayx routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *in1 = p->ain1;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1;
    long   i, i2, xpos;

    if (buf1 == NULL) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      buf1[indx] = *in1++;
      n1 = 0.0;

      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx - ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 += (double) buf1[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 -= (double) buf1[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	}
	*out1 = (MYFLT) (n1 * x2);
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	*out1 = buf1[xpos];
      }

      if (++indx == maxd) indx = 0;
      out1++;
    } while (--nn);

    p->left = indx;
}

void vdelayxw(VDELX *p)              /*      vdelayxw routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *in1 = p->ain1;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1;
    long   i, i2, xpos;

    if (buf1 == NULL) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx + ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	n1 = (double) *in1 * x2;
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] += (MYFLT) (n1 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] -= (MYFLT) (n1 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	}
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	buf1[xpos] += *in1;
      }

      *out1++ = buf1[indx]; buf1[indx] = FL(0.0);
      if (++indx == maxd) indx = 0;
      in1++;
    } while (--nn);

    p->left = indx;
}

void vdelayxs(VDELXS *p)              /*      vdelayxs routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *out2 = p->sr2;
    MYFLT *in1 = p->ain1;
    MYFLT *in2 = p->ain2;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    MYFLT *buf2 = (MYFLT *)p->aux2.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1, n2;
    long   i, i2, xpos;

    if ((buf1 == NULL) || (buf2 == NULL)) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      buf1[indx] = *in1++; buf2[indx] = *in2++;
      n1 = 0.0; n2 = 0.0;

      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx - ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 += (double) buf1[xpos] * w; n2 += (double) buf2[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 -= (double) buf1[xpos] * w; n2 -= (double) buf2[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	}
	*out1 = (MYFLT) (n1 * x2); *out2 = (MYFLT) (n2 * x2);
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	*out1 = buf1[xpos]; *out2 = buf2[xpos];
      }

      if (++indx == maxd) indx = 0;
      out1++; out2++;
    } while (--nn);

    p->left = indx;
}

void vdelayxws(VDELXS *p)              /*      vdelayxws routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *out2 = p->sr2;
    MYFLT *in1 = p->ain1;
    MYFLT *in2 = p->ain2;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    MYFLT *buf2 = (MYFLT *)p->aux2.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1, n2;
    long   i, i2, xpos;

    if ((buf1 == NULL) || (buf2 == NULL)) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx + ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	n1 = (double) *in1 * x2; n2 = (double) *in2 * x2;
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] += (MYFLT) (n1 * w); buf2[xpos] += (MYFLT) (n2 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] -= (MYFLT) (n1 * w); buf2[xpos] -= (MYFLT) (n2 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	}
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	buf1[xpos] += *in1; buf2[xpos] += *in2;
      }

      *out1++ = buf1[indx]; buf1[indx] = FL(0.0);
      *out2++ = buf2[indx]; buf2[indx] = FL(0.0);
      if (++indx == maxd) indx = 0;
      in1++; in2++;
    } while (--nn);

    p->left = indx;
}

void vdelayxq(VDELXQ *p)              /*      vdelayxq routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *out2 = p->sr2;
    MYFLT *out3 = p->sr3;
    MYFLT *out4 = p->sr4;
    MYFLT *in1 = p->ain1;
    MYFLT *in2 = p->ain2;
    MYFLT *in3 = p->ain3;
    MYFLT *in4 = p->ain4;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    MYFLT *buf2 = (MYFLT *)p->aux2.auxp;
    MYFLT *buf3 = (MYFLT *)p->aux3.auxp;
    MYFLT *buf4 = (MYFLT *)p->aux4.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1, n2, n3, n4;
    long   i, i2, xpos;

    if ((buf1 == NULL) || (buf2 == NULL) || (buf3 == NULL) || (buf4 == NULL)) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      buf1[indx] = *in1++; buf2[indx] = *in2++;
      buf3[indx] = *in3++; buf4[indx] = *in4++;
      n1 = 0.0; n2 = 0.0; n3 = 0.0; n4 = 0.0;

      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx - ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 += (double) buf1[xpos] * w; n2 += (double) buf2[xpos] * w;
	  n3 += (double) buf3[xpos] * w; n4 += (double) buf4[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  n1 -= (double) buf1[xpos] * w; n2 -= (double) buf2[xpos] * w;
	  n3 -= (double) buf3[xpos] * w; n4 -= (double) buf4[xpos] * w;
	  if (++xpos >= maxd) xpos -= maxd;
	}
	*out1 = (MYFLT) (n1 * x2); *out2 = (MYFLT) (n2 * x2);
	*out3 = (MYFLT) (n3 * x2); *out4 = (MYFLT) (n4 * x2);
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	*out1 = buf1[xpos]; *out2 = buf2[xpos];
	*out3 = buf3[xpos]; *out4 = buf4[xpos];
      }

      if (++indx == maxd) indx = 0;
      out1++; out2++; out3++; out4++;
    } while (--nn);

    p->left = indx;
}

void vdelayxwq(VDELXQ *p)              /*      vdelayxwq routine  */
{
    long  nn, maxd, indx;
    MYFLT *out1 = p->sr1;  /* assign object data to local variables   */
    MYFLT *out2 = p->sr2;
    MYFLT *out3 = p->sr3;
    MYFLT *out4 = p->sr4;
    MYFLT *in1 = p->ain1;
    MYFLT *in2 = p->ain2;
    MYFLT *in3 = p->ain3;
    MYFLT *in4 = p->ain4;
    MYFLT *del = p->adel;
    MYFLT *buf1 = (MYFLT *)p->aux1.auxp;
    MYFLT *buf2 = (MYFLT *)p->aux2.auxp;
    MYFLT *buf3 = (MYFLT *)p->aux3.auxp;
    MYFLT *buf4 = (MYFLT *)p->aux4.auxp;
    int   wsize = p->interp_size;
    double x1, x2, w, d, d2x, n1, n2, n3, n4;
    long   i, i2, xpos;

    if ((buf1 == NULL) || (buf2 == NULL) || (buf3 == NULL) || (buf4 == NULL)) {
      initerror(Str(X_1372,"vdelay: not initialized"));		/* RWD fix */
      return;
    }
    maxd = (long) (*p->imaxd * esr);
    if (maxd == 0) maxd = 1;	/* Degenerate case */
    nn = ksmps;
    indx = p->left;
    i2 = (wsize >> 1);
    d2x = 1.0 / (double) (i2 * i2);

    do {
      /* x1: fractional part of delay time */
      /* x2: sine of x1 (for interpolation) */
      /* xpos: integer part of delay time (buffer position to read from) */

      x1 = (double) indx + ((double) *del++ * (double) esr);
      while (x1 < 0.0) x1 += (double) maxd;
      xpos = (long) x1;
      x1 -= (double) xpos;
      x2 = sin (PI * x1) / PI;
      while (xpos >= maxd) xpos -= maxd;

      if (x1 * (1.0 - x1) > 0.00000001) {
	n1 = (double) *in1 * x2; n2 = (double) *in2 * x2;
	n3 = (double) *in3 * x2; n4 = (double) *in4 * x2;
	xpos += (1 - i2);
	while (xpos < 0) xpos += maxd;
	d = (double) (1 - i2) - x1;
	for (i = i2; --i;) {
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] += (MYFLT) (n1 * w); buf2[xpos] += (MYFLT) (n2 * w);
	  buf3[xpos] += (MYFLT) (n3 * w); buf4[xpos] += (MYFLT) (n4 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	  w = 1.0 - d*d*d2x; w *= (w / d++);
	  buf1[xpos] -= (MYFLT) (n1 * w); buf2[xpos] -= (MYFLT) (n2 * w);
	  buf3[xpos] -= (MYFLT) (n3 * w); buf4[xpos] -= (MYFLT) (n4 * w);
	  if (++xpos >= maxd) xpos -= maxd;
	}
      }
      else {						/* integer sample */
	xpos = (long) ((double) xpos + x1 + 0.5);	/* position */
	if (xpos >= maxd) xpos -= maxd;
	buf1[xpos] += *in1; buf2[xpos] += *in2;
	buf3[xpos] += *in3; buf4[xpos] += *in4;
      }

      *out1++ = buf1[indx]; buf1[indx] = FL(0.0);
      *out2++ = buf2[indx]; buf2[indx] = FL(0.0);
      *out3++ = buf3[indx]; buf3[indx] = FL(0.0);
      *out4++ = buf4[indx]; buf4[indx] = FL(0.0);
      if (++indx == maxd) indx = 0;
      in1++; in2++; in3++; in4++;
    } while (--nn);

    p->left = indx;
}

void multitap_set(MDEL *p)
{
    long n;
    MYFLT *buf, max = FL(0.0);

    if (p->INOCOUNT/2 == (MYFLT)p->INOCOUNT/2.)
        die(Str(X_539,"Wrong input count in multitap\n"));

    for (n = 0 ; n < p->INOCOUNT - 1 ; n += 2) {
        if (max < *p->ndel[n]) max = *p->ndel[n];
    }

    n = (long)(esr * max * sizeof(MYFLT));
    if (p->aux.auxp == NULL ||    /* allocate space for delay buffer */
	n > p->aux.size)
      auxalloc(n, &p->aux);
    else {
      buf = (MYFLT *)p->aux.auxp; /* make sure buffer is empty       */
      n = p->max;
      do {
	*buf++ = FL(0.0);
      } while (--n);
    }

    p->left = 0;
    p->max = (long)(esr * max);
}

void multitap_play(MDEL *p)
{                               /* assign object data to local variables   */
    long  n, nn = ksmps, indx = p->left, delay;
    MYFLT *out = p->sr, *in = p->ain;
    MYFLT *buf = (MYFLT *)p->aux.auxp;
    MYFLT max = (MYFLT)p->max;

    if (buf==NULL) {            /* RWD fix */
      initerror(Str(X_1008,"multitap: not initialized"));
      return;
    }
    do {
        buf[indx] = *in++;      /*      Write input     */
        *out = FL(0.0);            /*      Clear output buffer     */

        if (++indx == max) indx = 0;         /*      Advance input pointer   */
        for (n = 0 ; n < p->INOCOUNT - 1 ; n += 2) {
            delay = indx - (long)(esr * *p->ndel[n]);
            if (delay < 0)
                delay += (long)max;
            *out += buf[delay] * *p->ndel[n+1]; /*      Write output    */
        }
        out++;                  /*      Advance output pointer  */
    } while (--nn);
    p->left = indx;
}

/*      nreverb coded by Paris Smaragdis 1994 and Richard Karpen 1998 */

#define LOG001  (-6.9078)       /* log(.001) */

static int prime( int val )
{
    int i, last;

    last = (int)sqrt( (double)val );
    for ( i = 3; i <= last; i+=2 ) {
      if ( (val % i) == 0 ) return 0;
    }
    return 1;
}

#define OLD_CODE 1 //gab
#ifdef OLD_CODE
MYFLT ngc_time[Combs] = {FL(1433.0), FL(1601.0), FL(1867.0),
                         FL(2053.0), FL(2251.0), FL(2399.0)};
MYFLT ngc_gain[Combs] = {FL(0.822), FL(0.802), FL(0.773),
                         FL(0.753), FL(0.753), FL(0.753)};
MYFLT nga_time[Alpas] = {FL(347.0), FL(113.0), FL(37.0), FL(59.0), FL(43.0)};
MYFLT nga_gain = FL(0.7);

void nreverb_set(NREV *p)   /* 6-comb/lowpass, 5-allpass reverberator */
{
    long i, n;
    MYFLT *temp;

    MYFLT srscale=esr/FL(25641.0); /* denominator is probably CCRMA "samson box" sampling-rate! */
    int c_time, a_time;

    if (*p->hdif > FL(1.0) || *p->hdif < FL(0.0))
      die(Str(X_294,"High frequency diffusion not in (0, 1)\n"));

    if (*p->istor == FL(0.0) || p->temp.auxp == NULL) {
      auxalloc(ksmps * sizeof(MYFLT), &p->temp);
      temp = (MYFLT *)p->temp.auxp;
      for (n = 0 ; n < ksmps ; n++)
        *temp++ = FL(0.0);

      for (i = 0 ; i < Combs ; i++) {
        /* derive new primes to make delay times work with orch. sampling-rate */
        c_time = (int)(ngc_time[i] * srscale);
        if (c_time % 2 == 0)  c_time += 1;
        while(!prime( c_time))  c_time += 2;
        p->c_time[i] = (MYFLT)c_time;

        p->c_gain[i] = (MYFLT)exp((double)(LOG001 * (p->c_time[i]/esr) /
                                           (ngc_gain[i] * *p->time)));
        p->g[i] = *p->hdif;
        p->c_gain[i] = p->c_gain[i] * (FL(1.0) - p->g[i]);
        p->z[i] = FL(0.0);

        auxalloc((long)(p->c_time[i] * sizeof(MYFLT)), &p->caux[i]);
        p->cbuf_cur[i] = (MYFLT *)p->caux[i].auxp;
        for (n = 0 ; n < p->c_time[i] ; n++)
          *(p->cbuf_cur[i] + n) = FL(0.0);
      }
      for (i = 0 ; i < Alpas ; i++) {
        a_time = (int)(nga_time[i] * srscale);
        if (a_time % 2 == 0)  a_time += 1;
        while(!prime( a_time))  a_time += 2;
        p->a_time[i] = (MYFLT)a_time;
        p->a_gain[i] = (MYFLT)exp((double)(LOG001 * (p->a_time[i]/esr) /
                                           (nga_gain * *p->time)));
        auxalloc((long) p->a_time[i] * sizeof(MYFLT), &p->aaux[i]);
        p->abuf_cur[i] = (MYFLT *)p->aaux[i].auxp;
      }
    }

    p->prev_time = *p->time;
    p->prev_hdif = *p->hdif;
}

void nreverb(NREV *p)
{
    long       i, n = ksmps;
    MYFLT      *in, *out = p->out, *buf, *end;
    MYFLT      gain, z;
    MYFLT      hdif = *p->hdif;
    MYFLT      time = *p->time;

    if (p->temp.auxp==NULL) {
      initerror(Str(X_1165,"reverb2: not initialized"));
      return;
    }
    do  *out++ = FL(0.0);
    while (--n);
    if (*p->time != p->prev_time || *p->hdif != p->prev_hdif) {
      if (hdif > FL(1.0)) {
        printf(Str(X_532,"Warning: High frequency diffusion>1\n"));
        hdif = FL(1.0);
      }
      if (hdif < FL(0.0))       {
        printf(Str(X_531,"Warning: High frequency diffusion<0\n"));
        hdif = FL(0.0);
      }
      if (time <= FL(0.0))       {
        printf(Str(X_356,"Non positive reverb time\n"));
        time = FL(0.001);
      }
      for (i = 0 ; i < Combs ; i++)   {
        p->c_gain[i] = (MYFLT)exp((double)(LOG001 * (p->c_time[i]/esr) /
					   (ngc_gain[i] * time)));
        p->g[i] = hdif;
        p->c_gain[i] = p->c_gain[i] * (1 - p->g[i]);
        p->z[i] = FL(0.0);
      }

      for (i = 0 ; i < Alpas ; i++)
        p->a_gain[i] = (MYFLT)exp((double)(LOG001 * (p->a_time[i]/esr) /
					   (nga_gain * time)));

      p->prev_time = time;
      p->prev_hdif = hdif;
    }

    for (i = 0 ; i < Combs ; i++)       {
      buf = p->cbuf_cur[i];
      end = (MYFLT *)p->caux[i].endp;
      gain = p->c_gain[i];
      in = p->in;
      out = p->out;
      n = ksmps;
      do {
        *out++ += *buf;
        *buf += p->z[i] * p->g[i];
        p->z[i] = *buf;
        *buf *= gain;
        *buf += *in++;
        if (++buf >= end)
          buf = (MYFLT *)p->caux[i].auxp;
      } while (--n);
      p->cbuf_cur[i] = buf;
    }

    for (i = 0 ; i < Alpas ; i++)       {
      in = (MYFLT *)p->temp.auxp;
      out = p->out;
      n = ksmps;
      do      *in++ = *out++;
      while (--n);
      buf = p->abuf_cur[i];
      end = (MYFLT *)p->aaux[i].endp;
      gain = p->a_gain[i];
      in = (MYFLT *)p->temp.auxp;
      out = p->out;
      n = ksmps;
      do {
        z = *buf;
        *buf = gain * z + *in++;
        *out++ = z - gain * *buf;
        if (++buf >= end)
          buf = (MYFLT *)p->aaux[i].auxp;
      } while (--n);
      p->abuf_cur[i] = buf;
    }
}
#endif

/*
 * Based on nreverb coded by Paris Smaragdis 1994 and Richard Karpen 1998.
 * Changes made to allow user-defined comb and alpas constant in a ftable.
 * Sept 2000, by rasmus ekman.
 *
 */

/* The original reverb2 constants were in samples at sample rate 25641.0
 * (suggestedly being "probably CCRMA 'samson box' sampling-rate").
 * Used to be defined in single-purpose header revsets.h.
 * Get rid of this right here so we can use them as times in the code.
 */
#define orgCombs 6
#define orgAlpas 5
MYFLT cc_time[orgCombs] = {FL(0.055887056) /*1433.0/25641.0*/,
                           FL(0.062439062) /*1601.0/25641.0*/,
                           FL(0.072813073) /*1867.0/25641.0*/,
                           FL(0.080067080) /*2053.0/25641.0*/,
                           FL(0.087789088) /*2251.0/25641.0*/,
                           FL(0.093561094) /*2399.0/25641.0*/};
MYFLT cc_gain[orgCombs] = {FL(0.822), FL(0.802), FL(0.773),
                           FL(0.753), FL(0.753), FL(0.753)};
MYFLT ca_time[orgAlpas] = {FL(0.013533014) /*347.0/25641.0*/,
                           FL(0.0044070044) /*113.0/25641.0*/,
                           FL(0.0014430014) /*37.0/25641.0*/,
                           FL(0.0023010023) /*59.0/25641.0*/,
                           FL(0.0016770017) /*43.0/25641.0*/};
MYFLT ca_gain[orgAlpas] = {FL(0.7), FL(0.7), FL(0.7), FL(0.7), FL(0.7)};

void reverbx_set(NREV2 *p)
{
    long i, n;
    MYFLT *temp;
    MYFLT *c_orgtime, *a_orgtime;    /* Temp holder of old or user constants. */
    int c_time, a_time;
    int cmbAllocSize, alpAllocSize;

    if (*p->hdif > 1.0f || *p->hdif < FL(0.0))
      die(Str(X_294,"High frequency diffusion not in (0, 1)\n"));

    /* Init comb constants and allocate dynamized work space */
    if (*p->inumCombs < FL(1.0)) {  /* Using old defaults */
      /* Get nreverb defaults */
      p->numCombs = orgCombs;
      c_orgtime = cc_time;
      p->c_orggains = cc_gain;
    } else {   /* User provided constants */
      FUNC *ftCombs;
      p->numCombs = (int)*p->inumCombs;
      /* Get user-defined set of comb constants from table */
      if ((ftCombs = ftfind(p->ifnCombs)) == NULL) return;
      if (ftCombs->flen < p->numCombs * 2) {
        sprintf(errmsg,
                Str(X_1547,
                    "reverbx; Combs ftable must have %d time and %d gain values"),
                p->numCombs, p->numCombs);
        initerror(errmsg);
        return;
      }
      c_orgtime = ftCombs->ftable;
      p->c_orggains = (ftCombs->ftable + p->numCombs);
    }
    /* Alloc a single block and get arrays of comb pointers from that */
    cmbAllocSize = p->numCombs * sizeof(MYFLT);
    auxalloc(6 * cmbAllocSize + p->numCombs * sizeof(AUXCH), &p->caux2);
    p->c_time = (MYFLT*)p->caux2.auxp;
    p->c_gain = (MYFLT*)(p->caux2.auxp + 1 * cmbAllocSize);
    p->z = (MYFLT*)(p->caux2.auxp + 2 * cmbAllocSize);
    p->g = (MYFLT*)(p->caux2.auxp + 3 * cmbAllocSize);
    p->cbuf_cur = (MYFLT**)(p->caux2.auxp + 4 * cmbAllocSize);
    p->caux = (AUXCH*)(p->caux2.auxp + 5 * cmbAllocSize);

    /* ...and allpass constants and allocs */
    if (*p->inumAlpas < FL(1.0)) {
      /* Get nreverb defaults */
      p->numAlpas = orgAlpas;
      a_orgtime = ca_time;
      p->a_orggains = ca_gain;
    } else {    /* Have user-defined set of alpas constants */
      FUNC *ftAlpas;
      p->numAlpas = (int)*p->inumAlpas;
      if ((ftAlpas = ftfind(p->ifnAlpas)) == NULL) return;
      if (ftAlpas->flen < p->numAlpas * 2) {
        sprintf(errmsg,
                Str(X_1548,
                    "reverbx; Alpas ftable must have %d time and %d gain values"),
                p->numAlpas, p->numAlpas);
        initerror(errmsg);
        return;
      }
      a_orgtime = ftAlpas->ftable;
      p->a_orggains = (ftAlpas->ftable + p->numAlpas);
    }
    /* Dynamic alloc of alpass space */
    alpAllocSize = p->numAlpas * sizeof(MYFLT);
    auxalloc(3 * alpAllocSize + p->numAlpas * sizeof(AUXCH), &p->aaux2);
    p->a_time = (MYFLT*)p->aaux2.auxp;
    p->a_gain = (MYFLT*)(p->aaux2.auxp + 1 * alpAllocSize);
    p->abuf_cur = (MYFLT**)(p->aaux2.auxp + 2 * alpAllocSize);
    p->aaux = (AUXCH*)(p->aaux2.auxp + 3 * alpAllocSize);

    /* Init variables */
    if (*p->istor == 0.0f || p->temp.auxp == NULL) {
      auxalloc(ksmps * sizeof(MYFLT), &p->temp);
      temp = (MYFLT *)p->temp.auxp;
      for (n = 0 ; n < ksmps ; n++)
        *temp++ = 0.0f;

      for (i = 0 ; i < p->numCombs ; i++) {
        MYFLT ftime = c_orgtime[i];
        /* Use directly as num samples if negative */
        if (ftime < FL(0.0))
          c_time = (int)-ftime;
        else {
		/* convert from to seconds to samples, and make prime */
          c_time = (int)(ftime * esr);
		/* Mangle sample number to primes. */
          if (c_time % 2 == 0)  c_time += 1;
          while (!prime(c_time))  c_time += 2;
        }
        p->c_time[i] = (MYFLT)c_time;

#if _DEBUG
	/*err_printf("reverbx B: p->c_time[%d] %f\n",
		i, p->c_time[i]); */
#endif
	p->c_gain[i] = (MYFLT)exp((double)(LOG001 * (p->c_time[i]/esr) /
               (p->c_orggains[i] * *p->time)));
        p->g[i] = *p->hdif;
        p->c_gain[i] = p->c_gain[i] * (1 - p->g[i]);
        p->z[i] = 0.0f;

        auxalloc((long)(p->c_time[i] * sizeof(MYFLT)), &p->caux[i]);
        p->cbuf_cur[i] = (MYFLT *)p->caux[i].auxp;
        for (n = 0 ; n < p->c_time[i] ; n++)
          *(p->cbuf_cur[i] + n) = 0.0f;
      }
      for (i = 0; i < p->numAlpas; i++) {
        MYFLT ftime = a_orgtime[i];
        if (ftime < FL(0.0))
          a_time = (int)-ftime;
        else {
          /* convert seconds to samples and make prime */
          a_time = (int)(ftime * esr);
          if (a_time % 2 == 0)  a_time += 1;
          while(!prime( a_time))  a_time += 2;
        }
        p->a_time[i] = (MYFLT)a_time;
        p->a_gain[i] = (MYFLT)exp((double)(LOG001 * (p->a_time[i]/esr) /
                                           (p->a_orggains[i] * *p->time)));
        auxalloc((long) p->a_time[i] * sizeof(MYFLT), &p->aaux[i]);
        p->abuf_cur[i] = (MYFLT *)p->aaux[i].auxp;
      }
    }

    p->prev_time = *p->time;
    p->prev_hdif = *p->hdif;
}

void reverbx(NREV2 *p)
{
    long       i, n = ksmps;
    MYFLT      *in, *out = p->out, *buf, *end;
    MYFLT      gain, z;
    MYFLT      hdif = *p->hdif;
    MYFLT      time = *p->time;
    int numCombs = p->numCombs;
    int numAlpas = p->numAlpas;

    if (p->temp.auxp==NULL) {
      initerror(Str(X_1546,"reverbx: not initialized"));
      return;
    }
    buf = (MYFLT*)(p->temp.auxp);
    in = p->in;
    do {
      *buf++ = *in++;
      *out++ = FL(0.0);
    } while (--n);
    if (*p->time != p->prev_time || *p->hdif != p->prev_hdif) {
      if (hdif > FL(1.0)) {
        printf(Str(X_532,"Warning: High frequency diffusion>1\n"));
        hdif = 1.0f;
      }
      if (hdif < FL(0.0))       {
        printf(Str(X_531,"Warning: High frequency diffusion<0\n"));
        hdif = 0.0f;
      }
      if (time <= FL(0.0))       {
        printf(Str(X_356,"Non positive reverb time\n"));
        time = 0.001f;
      }
      for (i = 0 ; i < numCombs ; i++)   {
        p->c_gain[i] = (MYFLT)exp((double)(LOG001 * (p->c_time[i]/esr) /
					   (p->c_orggains[i] * time)));
        p->g[i] = hdif;
        p->c_gain[i] = p->c_gain[i] * (1 - p->g[i]);
        p->z[i] = 0.0f;
      }

      for (i = 0 ; i < numAlpas ; i++)
        p->a_gain[i] = (MYFLT)exp((double)(LOG001 * (p->a_time[i]/esr) /
					   (p->a_orggains[i] * time)));

      p->prev_time = time;
      p->prev_hdif = hdif;
    }

    for (i = 0 ; i < numCombs ; i++) {
      buf = p->cbuf_cur[i];
      end = (MYFLT *)p->caux[i].endp;
      gain = p->c_gain[i];
      in = (MYFLT*)(p->temp.auxp);
      out = p->out;
      n = ksmps;
      do {
        *out++ += *buf;
        *buf += p->z[i] * p->g[i];
        p->z[i] = *buf;
        *buf *= gain;
        *buf += *in++;
        if (++buf >= end)
          buf = (MYFLT *)p->caux[i].auxp;
      } while (--n);
      p->cbuf_cur[i] = buf;
    }

    for (i = 0; i < numAlpas; i++) {
      in = (MYFLT *)p->temp.auxp;
      out = p->out;
      n = ksmps;
      do      *in++ = *out++;
      while (--n);
      buf = p->abuf_cur[i];
      end = (MYFLT *)p->aaux[i].endp;
      gain = p->a_gain[i];
      in = (MYFLT *)p->temp.auxp;
      out = p->out;
      n = ksmps;
      do {
        z = *buf;
        *buf = gain * z + *in++;
        *out++ = z - gain * *buf;
        if (++buf >= end)
          buf = (MYFLT *)p->aaux[i].auxp;
      } while (--n);
      p->abuf_cur[i] = buf;
    }
}
