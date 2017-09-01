/********************************************/
/* wrap and mirror UGs by Gabriel Maldonado */
/* and others by same author                */
/* Code adapted by JPff 1998 Sep 19         */
/********************************************/

#include "cs.h"
#include "uggab.h"
#include <math.h>

void wrap(WRAP *p)
{
    MYFLT 	*adest= p->xdest;
    MYFLT  	*asig = p->xsig;
    MYFLT	xlow, xhigh, xsig;
    int 	loopcount = ksmps;

    if ((xlow=*p->xlow) >= (xhigh=*p->xhigh)) {
      MYFLT 	xaverage;
      xaverage = (xlow + xhigh) * FL(0.5);
      do
	*adest++ = xaverage;
      while (--loopcount);
    }
    else
      do {
	if ((xsig=(MYFLT) *asig++) >= xlow )
	  *adest++ = (MYFLT)(xlow + fmod(xsig - xlow, fabs(xlow-xhigh)));
	else
	  *adest++ = (MYFLT)(xhigh- fmod(xhigh- xsig, fabs(xlow-xhigh)));
      } while (--loopcount);
}


void kwrap(WRAP *p)
{
    MYFLT xsig, xlow, xhigh;

    if ((xlow=*p->xlow) >= (xhigh=*p->xhigh))
      *p->xdest = (xlow + xhigh)*FL(0.5);
    else {
      if ((xsig=*p->xsig) >= xlow )
	*p->xdest = (MYFLT)(xlow + fmod(xsig - xlow, fabs(xlow-xhigh)));
      else
	*p->xdest = (MYFLT)(xhigh- fmod(xhigh- xsig, fabs(xlow-xhigh)));
    }
}


/*---------------------------------------------------------------------*/


void kmirror(WRAP *p)
{
    MYFLT  xsig, xlow, xhigh;
    xsig = *p->xsig;
    xhigh= *p->xhigh;
    xlow = *p->xlow;

    if (xlow >= xhigh) *p->xdest = (xlow + xhigh)*FL(0.5);
    else {
      while ((xsig > xhigh) || (xsig < xlow)) {
	if (xsig > xhigh)
	  xsig = xhigh + xhigh - xsig;
	else
	  xsig = xlow + xlow - xsig;
      }
      *p->xdest = xsig;
    }
}


void mirror(WRAP *p)
{
    MYFLT 	*adest, *asig;
    MYFLT	xlow, xhigh, xaverage, xsig;
    int 	loopcount = ksmps;

    adest = p->xdest;
    asig  = p->xsig;
    xlow = *p->xlow;
    xhigh = *p->xhigh;

    if (xlow >= xhigh)	{
      xaverage = (xlow + xhigh)*FL(0.5);
      do
	*adest++ = xaverage;
      while (--loopcount);
    }

    do	{
      xsig = *asig++;
      while ((xsig > xhigh) || ( xsig < xlow )) {
	if (xsig > xhigh)
	  xsig = xhigh + xhigh - xsig;
	else
	  xsig = xlow + xlow - xsig;
      }
      *adest++ = xsig;
    } while (--loopcount);
}


void trig_set(TRIG *p)
{
    p->old_sig = FL(0.0);
}

void trig(TRIG *p)
{
    switch ((int) (*p->kmode + FL(0.5))) {
    case 0:	  /* down-up */
      if (p->old_sig <= *p->kthreshold && *p->ksig > *p->kthreshold)
	*p->kout = FL(1.0);
      else
	*p->kout = FL(0.0);
      break;
    case 1:	 /* up-down */
      if (p->old_sig >= *p->kthreshold && *p->ksig < *p->kthreshold)
	*p->kout = FL(1.0);
      else
	*p->kout = FL(0.0);
      break;
    case 2:	 /* both */
      if ((p->old_sig <= *p->kthreshold && *p->ksig > *p->kthreshold) ||
	  (p->old_sig >= *p->kthreshold && *p->ksig < *p->kthreshold ) )
	*p->kout = FL(1.0);
      else
	*p->kout = FL(0.0);
      break;
    default:
      perferror(Str(X_17," bad imode value"));
    }
    p->old_sig = *p->ksig;
}

/*-------------------------------*/


void interpol(INTERPOL *p)
{
    MYFLT point_value = (*p->point - *p->imin ) * (FL(1.0)/(*p->imax - *p->imin));
    *p->r = point_value * (*p->val2 - *p->val1) + *p->val1;
}

void nterpol_init(INTERPOL *p)
{
    p->point_factor = FL(1.0)/(*p->imax - *p->imin);
}

void knterpol(INTERPOL *p)
{
    MYFLT point_value = (*p->point - *p->imin ) * p->point_factor;
    *p->r = point_value * (*p->val2 - *p->val1) + *p->val1;
}

void anterpol(INTERPOL *p)
{
    MYFLT point_value = (*p->point - *p->imin ) * p->point_factor;
    MYFLT *out = p->r, *val1 = p->val1, *val2 = p->val2;
    int loopcount = ksmps;
    do	{
      *out++ = point_value * (*val2++ - *val1) + *val1++;
    } while (--loopcount);
}

/* Oscilators */
/*
void posc_set( POSC *p)
{
    FUNC *ftp;

    if ((ftp = ftnp2find(p->ift)) == NULL) return;
    p->ftp    = ftp;
    p->tablen = ftp->flen;
    p->phs    = *p->iphs * p->tablen;
}

void posc(POSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs = p->phs;
    double      si = *p->freq * p->tablen / esr;
    long	n = ksmps;
    MYFLT       amp = *p->amp;

    do {
      curr_samp = ft + (long)phs;
      fract     = (MYFLT)(phs - (double)((long)phs));
      *out++    = amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
      phs      += si;
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;
    } while (--n);
    p->phs = phs;
}


void kposc(POSC *p)
{
    double	phs = p->phs;
    double      si = *p->freq * p->tablen / ekr;
    MYFLT	*curr_samp = p->ftp->ftable + (long)phs;
    MYFLT	fract = (MYFLT)(phs - (double)((long)phs));

    *p->out = *p->amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
    phs    += si;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;
    p->phs = phs;
}

void posc3(POSC *p)
{
    MYFLT	*out = p->out, *ftab = p->ftp->ftable;
    MYFLT	fract;
    double	phs  = p->phs;
    double      si   = *p->freq * p->tablen / esr;
    long	n    = ksmps;
    MYFLT       amp = *p->amp;
    int         x0;
    MYFLT       y0, y1, ym1, y2;

    do {
      x0    = (long)phs;
      fract = (MYFLT)(phs - (double)x0);
      x0--;
      if (x0<0) {
        ym1 = ftab[p->tablen-1]; x0 = 0;
      }
      else ym1 = ftab[x0++];
      y0    = ftab[x0++];
      y1    = ftab[x0++];
      if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
      {
        MYFLT frsq = fract*fract;
        MYFLT frcu = frsq*ym1;
        MYFLT t1   = y2 + FL(3.0)*y0;
        *out++     = amp * (y0 + FL(0.5)*frcu +
                            fract*(y1 - frcu/FL(6.0) - t1/FL(6.0) - ym1/FL(3.0)) +
                            frsq*fract*(t1/FL(6.0) - FL(0.5)*y1) +
                            frsq*(FL(0.5)* y1 - y0));
      }
      phs += si;
      while (phs >= p->tablen)
        phs -= p->tablen;
      while (phs < 0 )
        phs += p->tablen;
    } while (--n);
    p->phs = phs;
}

void kposc3(POSC *p)
{
    double	phs   = p->phs;
    double      si    = *p->freq * p->tablen / ekr;
    MYFLT	*ftab = p->ftp->ftable;
    int         x0    = (long)phs;
    MYFLT	fract = (MYFLT)(phs - (double)x0);
    MYFLT       y0, y1, ym1, y2;

    x0--;
    if (x0<0) {
      ym1 = ftab[p->tablen-1]; x0 = 0;
    }
    else ym1 = ftab[x0++];
    y0 = ftab[x0++];
    y1 = ftab[x0++];
    if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
    {
      MYFLT frsq = fract*fract;
      MYFLT frcu = frsq*ym1;
      MYFLT t1   = y2 + FL(3.0)*y0;
      *p->out    = *p->amp * (y0 + FL(0.5)*frcu +
                              fract*(y1 - frcu/FL(6.0) - t1/FL(6.0) - ym1/FL(3.0)) +
                              frsq*fract*(t1/FL(6.0) - FL(0.5)*y1) +
                              frsq*(FL(0.5)* y1 - y0));
    }
    phs += si;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;
    p->phs = phs;
}

void lposc_set(LPOSC *p)
{
    FUNC *ftp;
    MYFLT  loop, end, looplength;

    if ((ftp = ftnp2find(p->ift)) == NULL) return;
    if (!(p->fsr=ftp->gen01args.sample_rate)){
      printf(Str(X_970,"losc: no sample rate stored in function assuming=sr\n"));
      p->fsr=esr;
    }
    p->ftp    = ftp;
    p->tablen = ftp->flen;
//  changed from
//        p->phs    = *p->iphs * p->tablen;   
 
     if ((loop = *p->kloop) < 0) loop=FL(0.0);
     if ((end = *p->kend) > p->tablen || end <=0 ) end = (MYFLT)p->tablen;
     looplength = end - loop;

     if (*p->iphs >= 0)
       p->phs = *p->iphs;
     while (p->phs >= end)
       p->phs -= looplength;
}


void lposc(LPOSC *p)
{
    MYFLT	*out = p->out, *ft = p->ftp->ftable;
    MYFLT	*curr_samp, fract;
    double	phs= p->phs, si= *p->freq * (p->fsr/esr);
    long	n = ksmps;
    double	loop, end, looplength = p->looplength;
    MYFLT       amp = *p->amp;

    if ((loop = *p->kloop) < 0) loop=0;
    if ((end = *p->kend) > p->tablen || end <=0 ) end = p->tablen;
    looplength = end - loop;

    do {
      curr_samp = ft + (long)phs;
      fract = (MYFLT)(phs - (double)((long)phs));
      *out++ = amp * (*curr_samp +(*(curr_samp+1)-*curr_samp)*fract);
      phs += si;
      if (phs >= end) phs -= looplength;
    } while (--n);
    p->phs = phs;
}

void lposc3(LPOSC *p)
{
    MYFLT	*out = p->out, *ftab = p->ftp->ftable;
    MYFLT	fract;
    double	phs = p->phs, si= *p->freq * (p->fsr/esr);
    long	n = ksmps;
    double	loop, end, looplength = p->looplength;
    MYFLT       amp = *p->amp;
    int         x0;
    MYFLT       y0, y1, ym1, y2;

    if ((loop = *p->kloop) < 0) loop=0;
    if ((end = *p->kend) > p->tablen || end <=0 ) end = p->tablen;
    looplength = end - loop;

    do {
      x0    = (long)phs;
      fract = (MYFLT)(phs - (double)x0);
      x0--;
      if (x0<0) {
        ym1 = ftab[p->tablen-1]; x0 = 0;
      }
      else ym1 = ftab[x0++];
      y0    = ftab[x0++];
      y1    = ftab[x0++];
      if (x0>p->tablen) y2 = ftab[1]; else y2 = ftab[x0];
      {
        MYFLT frsq = fract*fract;
        MYFLT frcu = frsq*ym1;
        MYFLT t1   = y2 + FL(3.0)*y0;
        *out++     = amp * (y0 + FL(0.5)*frcu +
                            fract*(y1 - frcu/FL(6.0) - t1/FL(6.0) - ym1/FL(3.0)) +
                            frsq*fract*(t1/FL(6.0) - FL(0.5)*y1) +
                            frsq*(FL(0.5)* y1 - y0));
      }
      phs += si;
      while (phs >= end) phs -= looplength;
    } while (--n);
    p->phs = phs;
}

*/
void sum(SUM *p)
{
    int nsmps=ksmps, count=(int) p->INOCOUNT,j,k=0;
    MYFLT *ar = p->ar, **args = p->argums;
    do {
      *ar=FL(0.0);
      for (j=0; j<count; j++)
 	*ar += args[j][k];
      k++;
      ar++;
    } while (--nsmps);
}

/* Actually by JPff but after Gabriel */
void product(SUM *p)
{
    int nsmps=ksmps, count=(int) p->INOCOUNT,j,k=0;
    MYFLT *ar = p->ar, **args = p->argums;
    do {
      *ar=FL(1.0);
      for (j=0; j<count; j++)
 	*ar *= args[j][k];
      k++;
      ar++;
    } while (--nsmps);
}

void rsnsety(RESONY *p)
{
    int scale;
    int j;
    p->scale = scale = (int) *p->iscl;
    if ((p->loop = (int) (*p->ord + FL(0.5))) < 1) p->loop = 4; /*default value*/
    if (!*p->istor && (p->aux.auxp == NULL ||
                      (int)(p->loop*2*sizeof(MYFLT)) > p->aux.size))
      auxalloc((long)(p->loop*2*sizeof(MYFLT)), &p->aux);
    p->yt1 = (MYFLT*)p->aux.auxp; p->yt2 = (MYFLT*)p->aux.auxp + p->loop;
/*      else if (p->loop > 50) */
/*        initerror("illegal order num. (min 1, max 50)"); */
    if (scale && scale != 1 && scale != 2) {
      sprintf(errmsg,Str(X_1453, "illegal reson iscl value, %f"),*p->iscl);
      initerror(errmsg);
    }
    if (!(*p->istor)) {
      for (j=0; j< p->loop; j++) p->yt1[j] = p->yt2[j] = FL(0.0);
    }
}

void resony(RESONY *p)
{
    int	nsmps, j;
    MYFLT	*ar, *asig;
    MYFLT	c3p1, c3t4, omc3, c2sqr;
    MYFLT 	*yt1, *yt2, c1,c2,c3,cosf;
    double 	cf;
    int		loop = p->loop;
    MYFLT 	sep = (*p->sep / (MYFLT)loop);
    int flag = (int) *p->iflag;
    ar = p->ar;
    nsmps = ksmps;
    do {
      *ar++ = FL(0.0);
    } while (--nsmps);

    yt1= p->yt1;
    yt2= p->yt2;

    for (j=0; j<loop; j++) {
      if (flag) 		/* linear separation in hertz */
        cosf = (MYFLT) cos((cf = (double)(*p->kcf * sep*j)) * (double)tpidsr);
      else  /* logarithmic separation in octaves */
        cosf = (MYFLT) cos((cf = (double)(*p->kcf * pow(2.0,sep*j))) *
                           (double)tpidsr);
      c3 = (MYFLT) exp((double)*p->kbw * (cf / *p->kcf) * mtpdsr);
      c3p1 = c3 + FL(1.0);
      c3t4 = c3 * FL(4.0);
      c2 = c3t4 * cosf / c3p1;
      c2sqr = c2 * c2;
      omc3 = FL(1.0) - c3;
      if (p->scale == 1)
        c1 = omc3 * (MYFLT)sqrt(1.0 - (double)c2sqr / c3t4);
      else if (p->scale == 2)
        c1 = (MYFLT)sqrt((double)((c3p1*c3p1-c2sqr) * omc3/c3p1));
      else c1 = FL(1.0);
      asig = p->asig;
      ar = p->ar;
      nsmps = ksmps;
      do {
        MYFLT temp = c1 * *asig++ + c2 * *yt1 - c3 * *yt2;
        *ar++ += temp;
        *yt2 = *yt1;
        *yt1 = temp;
      } while (--nsmps);
      yt1++;
      yt2++;
    }
}

void fold_set(FOLD *p)
{
    p->sample_index = 0;
    p->index = 0.0;
}

void fold(FOLD *p)
{
    int	nsmps = ksmps;
    MYFLT *ar = p->ar;
    MYFLT *asig = p->asig;
    MYFLT kincr = *p->kincr;
    double index = p->index;
    long sample_index = p->sample_index;
    MYFLT value = p->value;
    do {
      if (index < (double)sample_index) {
        index += (double)kincr;
        *ar = value = *asig;
      }
      else *ar = value;
      sample_index++;
      ar++;
      asig++;
    } while (--nsmps);
    p->index = index;
    p->sample_index = sample_index;
    p->value = value;
}

