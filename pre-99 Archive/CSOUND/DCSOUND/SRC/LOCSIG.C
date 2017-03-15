/*LOCSIG*/

/******************************************/
/* The applications in this file were     */
/* designed and coded by Richard Karpen   */
/* University of Washington, Seattle 1998 */
/******************************************/

#include "cs.h" 
#include "locsig.h"
#include <math.h>

static	LOCSIG	*locsigaddr;

void locsigset(LOCSIG *p)
{
    int outcount=p->OUTOCOUNT;

    if (outcount != 2)
      if (outcount != 4) {
   	 sprintf(errmsg,
		 Str(X_542,"Wrong number of outputs in locsig; must be 2 or 4"));
        goto locerr;
      }

    if (p->auxch.auxp == NULL) {
      MYFLT *fltp;
      auxalloc((long)(ksmps * 4)  * sizeof(MYFLT), &p->auxch);
      fltp = (MYFLT *) p->auxch.auxp;
      p->rrev1 = fltp;   fltp += ksmps; 
      p->rrev2 = fltp;   fltp += ksmps;
      p->rrev3 = fltp;   fltp += ksmps;
      p->rrev4 = fltp;   fltp += ksmps;
    }
    
    p->prev_degree = -FL(918273645.192837465);
    p->prev_distance = -FL(918273645.192837465);

    locsigaddr=p;

    return;
locerr:
    initerror(errmsg);
}

void locsig(LOCSIG *p)
{
    MYFLT *r1, *r2, *r3, *r4, degree, *asig;
    MYFLT direct, *rrev1, *rrev2, *rrev3, *rrev4;
    MYFLT torev, localrev, globalrev;
    int	nsmps = ksmps;

    if (*p->distance != p->prev_distance) {
      p->distr=(FL(1.0) / *p->distance);
      p->distrsq = FL(1.0)/(MYFLT)sqrt(*p->distance); 
      p->prev_distance = *p->distance;
    }
  
    if (*p->degree != p->prev_degree) {

      degree = *p->degree/FL(360.00);
    
      p->ch1 = (MYFLT)cos(TWOPI * (MYFLT)degree);
      if (p->ch1 < FL(0.0)) p->ch1 = FL(0.0);

      p->ch2 = (MYFLT)sin(TWOPI * (MYFLT)degree);
      if (p->ch2 < FL(0.0)) p->ch2 = FL(0.0);
		
      if (p->OUTOCOUNT == 4) {
 	p->ch3 = (MYFLT)cos(TWOPI * ((MYFLT)degree + 0.5));
    	if (p->ch3 < FL(0.0)) p->ch3 = FL(0.0);

    	p->ch4 = (MYFLT)sin(TWOPI * ((MYFLT)degree + 0.5));
    	if (p->ch4 < FL(0.0)) p->ch4 = FL(0.0);
      }

      p->prev_degree = *p->degree;
    }

    r1 = p->r1;
    r2 = p->r2;
    asig = p->asig;

    rrev1 = p->rrev1;
    rrev2 = p->rrev2;
   
    if (p->OUTOCOUNT == 4) {
      r3 = p->r3;
      r4 = p->r4;
      rrev3 = p->rrev3;
      rrev4 = p->rrev4;
    }

    do {
      direct = *asig * p->distr;
      torev = *asig * p->distrsq * *p->reverbamount;
      globalrev = torev * p->distr;
      localrev = torev * (1 - p->distr);

      *r1++ = direct * p->ch1;
      *r2++ = direct * p->ch2;	
      *rrev1++ = (localrev * p->ch1) + globalrev;
      *rrev2++ = (localrev * p->ch2) + globalrev;
	
      if (p->OUTOCOUNT == 4) {
        *r3++ = direct *  p->ch3;
        *r4++ = direct *  p->ch4;
        *rrev3++ = (localrev* p->ch3) + globalrev;
        *rrev4++ = (localrev* p->ch4) + globalrev;
      }
      asig++;
    }
    while (--nsmps);
}

void locsendset(LOCSEND *p)
{
    LOCSIG *q;

    p->locsig=locsigaddr;
    q = p->locsig;

    if (p->OUTOCOUNT != q->OUTOCOUNT) {
      sprintf(errmsg,
              Str(X_394,"Number of outputs must be the same as the previous locsig;"));
      goto locerr;
    }
    return;
  locerr:
    initerror(errmsg);
}

void locsend(LOCSEND *p)
{
    MYFLT	*r1, *r2, *r3, *r4, *rrev1, *rrev2, *rrev3, *rrev4;
    LOCSIG *q = p->locsig;
    int	nsmps = ksmps;

    r1 = p->r1;
    r2 = p->r2;
    rrev1 = q->rrev1;
    rrev2 = q->rrev2;
       
    if (p->OUTOCOUNT == 4) {
      r3 = p->r3;
      r4 = p->r4;
      rrev3 = q->rrev3;
      rrev4 = q->rrev4;
    }
    do {
      *r1++ = *rrev1++;
      *r2++ = *rrev2++;

      if (p->OUTOCOUNT == 4) {
        *r3++ = *rrev3++;
        *r4++ = *rrev4++;
      }
    }
    while (--nsmps);
}

