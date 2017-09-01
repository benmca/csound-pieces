                                                        /* ugmoss.c */
#include "cs.h"
#include "ugmoss.h"
#include "aops.h"
#include <math.h>

/******************************************************************************
  this code was written in feburary 2001
  by william 'pete' moss. <bantha@bigfoot.com>
  no copyright, since it seems silly to copyright a well-known algorithm.
******************************************************************************/

void dconvset(DCONV *p)
{
    FUNC *ftp;

    p->len = (int)*p->isize;
    if ((ftp = ftfind(p->ifn)) != NULL) {         /* find table */
      p->ftp = ftp;
      if (ftp->flen < p->len) p->len = ftp->flen; /* correct len if flen shorter */
    }
    else
      initerror(Str(X_1557,"No table for dconv"));

    if (p->sigbuf.auxp == NULL || p->sigbuf.size < p->len*(int)sizeof(MYFLT))
      auxalloc(p->len*sizeof(MYFLT), &p->sigbuf);
    p->curp = (MYFLT *)p->sigbuf.auxp;
}

void dconv(DCONV *p)
{
    long i = 0;
    int nsmps = ksmps;
    long len = p->len;
    MYFLT *ar, *ain, *ftp, *startp, *endp, *curp;
    MYFLT sum;

    ain = p->ain;                               /* read saved values */
    ar = p->ar;
    ftp = p->ftp->ftable;
    startp = (MYFLT *) p->sigbuf.auxp;
    endp = startp + len;
    curp = p->curp;

    do {
      *curp = *ain++;                           /* get next input sample */
    sum = *curp++ * *ftp;
    while (curp < endp)
      sum += (*curp++ * *(ftp + ++i));          /* do the convolution */
    curp = startp;                              /* correct the ptr */
    while (i < len)
      sum += (*curp++ * *(ftp + ++i));          /* do more convolution */
      if (--curp < startp) curp += len;         /* correct for last ++curp */
      *ar++ = sum;
    } while (--nsmps);

  p->curp = curp;                               /* save state */
}

void and_kk(AOP *p)
{
    long input1 = (long)*p->a;
    long input2 = (long)*p->b;
    *p->r = (MYFLT)(input1 & input2);
}

void and_aa(AOP *p)
{
    MYFLT *r           = p->r;
    MYFLT *in1         = p->a;
    MYFLT *in2         = p->b;
    unsigned int nsmps = ksmps;
    long input1, input2;

    do {
      input1 = (long)*in1++;
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 & input2);
    } while (--nsmps);
}

void and_ak(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    unsigned int nsmps = ksmps;
    long input2 = (long)*p->b, input1;

    do {
      input1 = (long)*in1++;
      *r++ = (MYFLT)(input1 & input2);
    } while (--nsmps);
}

void and_ka(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in2 = p->b;
    unsigned int nsmps = ksmps;
    long input2, input1 = (long)*p->a;

    do {
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 & input2);
    } while (--nsmps);
}

void or_kk(AOP *p)
{
    long input1 = (long)*p->a;
    long input2 = (long)*p->b;
    *p->r = (MYFLT)(input1 | input2);
}

void or_aa(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    MYFLT *in2 = p->b;
    unsigned int nsmps = ksmps;
    long input2, input1;

    do {
      input1 = (long)*in1++;
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 | input2);
    } while (--nsmps);
}

void or_ak(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    unsigned int nsmps = ksmps;
    long input2 = (long)*p->b, input1;

    do {
      input1 = (long)*in1++;
      *r++ = (MYFLT)(input1 | input2);
    } while (--nsmps);
}

void or_ka(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in2 = p->b;
    unsigned int nsmps = ksmps;
    long input2, input1 = (long)*p->a;

    do {
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 | input2);
    } while (--nsmps);
}

void xor_kk(AOP *p)
{
    long input1 = (long)*p->a;
    long input2 = (long)*p->b;
    *p->r = (MYFLT)(input1 ^ input2);
}

void xor_aa(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    MYFLT *in2 = p->b;
    unsigned int nsmps = ksmps;
    long input2, input1;

    do {
      input1 = (long)*in1++;
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 ^ input2);
    } while (--nsmps);
}

void xor_ak(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    unsigned int nsmps = ksmps;
    long input2 = (long)*p->b, input1;

    do {
      input1 = (long)*in1++;
      *r++ = (MYFLT)(input1 ^ input2);
    } while (--nsmps);
}

void xor_ka(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in2 = p->b;
    unsigned int nsmps = ksmps;
    long input2, input1 = (long)*p->a;

    do {
      input2 = (long)*in2++;
      *r++ = (MYFLT)(input1 ^ input2);
    } while (--nsmps);
}

void not_k(AOP *p)              /* Added for completeness by JPff */
{
    long input1 = (long)*p->a;
    *p->r = (MYFLT)(~input1);
}

void not_a(AOP *p)
{
    MYFLT *r = p->r;
    MYFLT *in1 = p->a;
    unsigned int nsmps = ksmps;
    long input1;

    do {
      input1 = (long)*in1++;
      *r++ = (MYFLT)(~input1);
    } while (--nsmps);
}

/* all the vcomb and valpass stuff adapted from comb() and alpass()
   with additional insight from me (petemoss@petemoss.org)  */

void vcombset(VCOMB *p)
{
    long        lpsiz, nbytes;

    if (*p->insmps != FL(0.0)) {
      if ((lpsiz = (long)(FL(0.5)+*p->imaxlpt)) <= 0) {
        initerror(Str(X_867,"illegal loop time"));
        return;
      }
    }
    else if ((lpsiz = (long)(*p->imaxlpt * esr)) <= 0) {
      initerror(Str(X_867,"illegal loop time"));
      return;
    }
    nbytes = lpsiz * sizeof(MYFLT);
    if (p->auxch.auxp == NULL || nbytes != p->auxch.size) {
      auxalloc((long)nbytes, &p->auxch);
      p->pntr = (MYFLT *) p->auxch.auxp;
      p->rvt = FL(0.0);
      p->lpt = FL(0.0);
      p->g   = FL(0.0);
    }
    else if (!(*p->istor)) {
      long *fp = (long *) p->auxch.auxp;
      p->pntr = (MYFLT *) fp;
      do
        *fp++ = 0;
      while (--lpsiz);
      p->rvt = FL(0.0);
      p->lpt = FL(0.0);
      p->g   = FL(0.0);
    }
}

void vcomb(VCOMB *p)
{
    int nsmps = ksmps;
    unsigned long lpt = (unsigned long)(*p->klpt * esr), 
                          maxlpt = (unsigned long)(*p->imaxlpt * esr);
    MYFLT       *ar, *asig, *rp, *endp, *wp;
    MYFLT       g = p->g;

    if (lpt > maxlpt) lpt = maxlpt;

    if (p->auxch.auxp==NULL) {
      initerror(Str(X_1685,"vcomb: not initialised"));
      return;
    }
    if ((p->rvt != *p->krvt) || (p->lpt != *p->klpt)) {
      g = p->g = (MYFLT)pow(.001, (*p->klpt / *p->krvt));
      p->rvt = *p->krvt, p->lpt = *p->klpt;
    }
    ar = p->ar;
    asig = p->asig;
    endp = (MYFLT *) p->auxch.endp;
    rp = p->pntr;
    if ((wp = rp + lpt) >= endp) wp -= maxlpt;
    do {
      *ar = *rp++;
      *wp++ = (*ar++ * g) + *asig++;
      if (wp >= endp) wp = (MYFLT *) p->auxch.auxp;
      if (rp >= endp) rp = (MYFLT *) p->auxch.auxp;
    } while (--nsmps);
    p->pntr = rp;
}

void valpass(VCOMB *p)
{
    int nsmps = ksmps;
    unsigned long lpt = (unsigned long)(*p->klpt * esr), 
                          maxlpt = (unsigned long)(*p->imaxlpt * esr);
    MYFLT       *ar, *asig, *rp, *endp, *wp;
    MYFLT       y, z, g = p->g;

    if (lpt > maxlpt) lpt = maxlpt;

    if (p->auxch.auxp==NULL) {
      initerror(Str(X_1686,"valpass: not initialised"));
      return;
    }
    if ((p->rvt != *p->krvt) || (p->lpt != *p->klpt)) {
      g = p->g = (MYFLT)pow(.001, (*p->klpt / *p->krvt));
      p->rvt = *p->krvt, p->lpt = *p->klpt;
    }
    ar = p->ar;
    asig = p->asig;
    endp = (MYFLT *) p->auxch.endp;
    rp = p->pntr;
    if ((wp = rp + lpt) >= endp) wp -= maxlpt;
    do {
      y = *rp++;
      *wp++ = z = y * g + *asig++;
      *ar++ = y - g * z;
      if (wp >= endp) wp = (MYFLT *) p->auxch.auxp;
      if (rp >= endp) rp = (MYFLT *) p->auxch.auxp;
    } while (--nsmps);
    p->pntr = rp;
}

void ftmorfset(FTMORF *p)
{
    FUNC *ftp;
    unsigned int j = 0, len;

    if ((ftp = ftfind(p->iresfn)) != NULL) {    /* make sure resfn exists */
      p->resfn = ftp, len = p->resfn->flen;     /* and set it up */
    }
    else {
      initerror(Str(X_1687,"iresfn for ftmorf does not exist"));
      return;
    }

    if ((ftp = ftfind(p->iftfn)) != NULL) {     /* make sure ftfn exists */
      p->ftfn = ftp;                            /* and set it up */
    }
    else {
      initerror(Str(X_1688,"iftfn for ftmorf doesnt exist"));
      return;
    }

    do {                /* make sure tables in ftfn exist and are right size*/
      if ((ftp = ftfind(p->ftfn->ftable + j)) != NULL) {
        if (ftp->flen != len) {
          initerror(Str(X_1689,"table in iftfn for ftmorf wrong size"));
          return;
        }
      }
      else {
        initerror(Str(X_1690,"table in iftfn for ftmorf does not exist"));
        return;
      }
    } while (++j < p->ftfn->flen);
    
    p->len = len;
    p->ftndx = -FL(1.0);
}

void ftmorf(FTMORF *p)
{
    int j = 0, i;
    MYFLT f;
    FUNC *ftp1, *ftp2;

    if (*p->kftndx >= p->ftfn->flen) *p->kftndx = p->ftfn->flen - 1;
    i = (int)*p->kftndx;
    f = *p->kftndx - i;
    if (p->ftndx != *p->kftndx) {
      p->ftndx = *p->kftndx;
      ftp1 = ftfind(p->ftfn->ftable + i++);
      ftp2 = ftfind(p->ftfn->ftable + i--);
      do {
        *(p->resfn->ftable + j) = (*(ftp1->ftable + j) * (1-f)) + 
          (*(ftp2->ftable + j) * f);
      } while (++j < p->len);
    }
}



/* end of ugmoss.c */
