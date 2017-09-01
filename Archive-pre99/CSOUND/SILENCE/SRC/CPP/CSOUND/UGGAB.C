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
    MYFLT       *adest= p->xdest;
    MYFLT       *asig = p->xsig;
    MYFLT       xlow, xhigh, xsig;
    int         loopcount = ksmps;

    if ((xlow=*p->xlow) >= (xhigh=*p->xhigh)) {
      MYFLT     xaverage;
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
    MYFLT       *adest, *asig;
    MYFLT       xlow, xhigh, xaverage, xsig;
    int         loopcount = ksmps;

    adest = p->xdest;
    asig  = p->xsig;
    xlow = *p->xlow;
    xhigh = *p->xhigh;

    if (xlow >= xhigh)  {
      xaverage = (xlow + xhigh)*FL(0.5);
      do
        *adest++ = xaverage;
      while (--loopcount);
      return;                   /* Suggested by Istvan Varga */
    }

    do  {
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
    case 0:       /* down-up */
      if (p->old_sig <= *p->kthreshold && *p->ksig > *p->kthreshold)
        *p->kout = FL(1.0);
      else
        *p->kout = FL(0.0);
      break;
    case 1:      /* up-down */
      if (p->old_sig >= *p->kthreshold && *p->ksig < *p->kthreshold)
        *p->kout = FL(1.0);
      else
        *p->kout = FL(0.0);
      break;
    case 2:      /* both */
      if ((p->old_sig <= *p->kthreshold && *p->ksig > *p->kthreshold) ||
          (p->old_sig >= *p->kthreshold && *p->ksig < *p->kthreshold ) )
        *p->kout = FL(1.0);
      else
        *p->kout = FL(0.0);
      break;
    default:
      perferror(Str(X_17," bad imode value"));
      return;
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
    do  {
      *out++ = point_value * (*val2++ - *val1) + *val1++;
    } while (--loopcount);
}

/* Oscilators */

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
    MYFLT       *out = p->out, *ft = p->ftp->ftable;
    MYFLT       *curr_samp, fract;
    double      phs = p->phs;
    double      si = *p->freq * p->tablen / esr;
    long        n = ksmps;
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
    double      phs = p->phs;
    double      si = *p->freq * p->tablen / ekr;
    MYFLT       *curr_samp = p->ftp->ftable + (long)phs;
    MYFLT       fract = (MYFLT)(phs - (double)((long)phs));

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
    MYFLT       *out = p->out, *ftab = p->ftp->ftable;
    MYFLT       fract;
    double      phs  = p->phs;
    double      si   = *p->freq * p->tablen / esr;
    long        n    = ksmps;
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
    double      phs   = p->phs;
    double      si    = *p->freq * p->tablen / ekr;
    MYFLT       *ftab = p->ftp->ftable;
    int         x0    = (long)phs;
    MYFLT       fract = (MYFLT)(phs - (double)x0);
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
 /* changed from
        p->phs    = *p->iphs * p->tablen;   */

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
    MYFLT       *out = p->out, *ft = p->ftp->ftable;
    MYFLT       *curr_samp, fract;
    double      phs= p->phs, si= *p->freq * (p->fsr/esr);
    long        n = ksmps;
    double      loop, end, looplength = p->looplength;
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
    MYFLT       *out = p->out, *ftab = p->ftp->ftable;
    MYFLT       fract;
    double      phs = p->phs, si= *p->freq * (p->fsr/esr);
    long        n = ksmps;
    double      loop, end, looplength = p->looplength;
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


void sum(SUM *p)
{
    int nsmps=ksmps, count=(int) p->INOCOUNT,j,k=0;
    MYFLT *ar = p->ar, **args = p->argums;
    do {
      MYFLT ans = FL(0.0);
      for (j=0; j<count; j++)
        ans += args[j][k];
      k++;
      *ar++ = ans;
    } while (--nsmps);
}

/* Actually by JPff but after Gabriel */
void product(SUM *p)
{
    int nsmps=ksmps, count=(int) p->INOCOUNT,j,k=0;
    MYFLT *ar = p->ar, **args = p->argums;
    do {
      MYFLT ans = FL(1.0);
      for (j=0; j<count; j++)
        ans *= args[j][k];
      k++;
      *ar++ = ans;
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
    int nsmps, j;
    MYFLT       *ar, *asig;
    MYFLT       c3p1, c3t4, omc3, c2sqr;
    MYFLT       *yt1, *yt2, c1,c2,c3,cosf;
    double      cf;
    int         loop = p->loop;
    MYFLT       sep = (*p->sep / (MYFLT)loop);
    int flag = (int) *p->iflag;
    ar = p->ar;
    nsmps = ksmps;
    do {
      *ar++ = FL(0.0);
    } while (--nsmps);

    yt1= p->yt1;
    yt2= p->yt2;

    for (j=0; j<loop; j++) {
      if (flag)                 /* linear separation in hertz */
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
    int nsmps = ksmps;
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

/* by Gab Maldonado. Under GNU license with a special exception for Canonical Csound addition */

void loopseg_set(LOOPSEG *p)
{
    p->nsegs = p->INOCOUNT-4;
    p->phs      = FL(0.0);
}


void loopseg(LOOPSEG *p)
{
    MYFLT **argp=p->argums;
    MYFLT beg_seg=FL(0.0), end_seg=FL(0.0), durtot=FL(0.0);
    double   phs, si=*p->freq/ekr;
    int nsegs=p->nsegs;
    int j;

    if (*p->retrig) {
      phs=0.0;
      p->phs=0.0;
    }
    else
      phs=p->phs;

    for ( j=0; j <=nsegs; j+=2)
      durtot += *argp[j];

    for ( j=0; j < nsegs; j+=2) {
      beg_seg += *argp[j] / durtot;
      end_seg = beg_seg + *argp[j+2] / durtot;
      if (beg_seg <= phs && end_seg > phs) {
        MYFLT diff = end_seg - beg_seg;
        MYFLT fract = ((MYFLT)phs-beg_seg)/diff;
        MYFLT v1 = *argp[j+1];
        MYFLT v2 = *argp[j+3];
        *p->out = v1 + (v2-v1) * fract;
        break;
      }
    }
    phs    += si;
    while (phs >= 1.0)
      phs -= 1.0;
    while (phs < 0.0 )
      phs += 1.0;
    p->phs = phs;
}


void lpshold(LOOPSEG *p)
{
    MYFLT **argp=p->argums;
    MYFLT beg_seg=FL(0.0), end_seg=FL(0.0), durtot=FL(0.0);
    double   phs, si=*p->freq/ekr;
    int nsegs=p->nsegs;
    int j;

    if (*p->retrig) {
      phs=0.0;
      p->phs=0.0;
    }
    else
      phs=p->phs;

    for ( j=0; j <=nsegs; j+=2)
      durtot += *argp[j];

    for ( j=0; j < nsegs; j+=2) {
      beg_seg += *argp[j] / durtot;
      end_seg = beg_seg + *argp[j+2] / durtot;
      if (beg_seg <= phs && end_seg > phs) {
        /* MYFLT diff = end_seg - beg_seg; */
        /* MYFLT fract = (phs-beg_seg)/diff;) */
        /* MYFLT v1 = *argp[j+1]; */
        /* MYFLT v2 = *argp[j+3]; */
        /* *p->out = v1 + (v2-v1) * fract; */
        *p->out = *argp[j+1];
        break;
      }
    }
    phs    += si;
    while (phs >= 1.0)
      phs -= 1.0;
    while (phs < 0.0 )
      phs += 1.0;
    p->phs = phs;
}

/* by Gab Maldonado. Under GNU license with a special exception for Canonical Csound addition */

void lineto_set(LINETO *p)
{
    p->current_time = FL(0.0);
    p->incr=FL(0.0);
    p->old_time=FL(0.0);
    p->flag = 1;
}

void lineto(LINETO *p)
{
    if (p->flag) {
      p->val_incremented = p->current_val = *p->ksig;
      p->flag=0;
    }
    if (*p->ksig != p->current_val && p->current_time > p->old_time) {
      p->old_time = *p->ktime;
      p->val_incremented = p->current_val;
      p->current_time = FL(0.0);
      p->incr = (*p->ksig - p->current_val) /  ((long) (ekr * p->old_time) + 1);
      p->current_val = *p->ksig;
    }
    else if (p->current_time < p->old_time) {
      p->val_incremented += p->incr;
    }
    p->current_time += 1/ekr;
    *p->kr = p->val_incremented;
}


void tlineto_set(LINETO2 *p)
{
    p->current_time = FL(0.0);
    p->incr=FL(0.0);
    p->old_time=FL(1.0);
    p->flag = 1;
}


void tlineto(LINETO2 *p)
{
    if (p->flag) {
      p->val_incremented = p->current_val = *p->ksig;
      p->flag=0;
    }
    if (*p->ktrig) {
      p->old_time = *p->ktime;
      /* p->val_incremented = p->current_val; */
      p->current_time = FL(0.0);
      p->incr = (*p->ksig - p->current_val) /  ((long) (ekr * p->old_time) + 1);
      p->current_val = *p->ksig;
    }
    else if (p->current_time < p->old_time) {
      p->current_time += 1/ekr;
      p->val_incremented += p->incr;
    }
    *p->kr = p->val_incremented;
}

/* by Gabriel Maldonado. Under GNU license with a special exception
   for Canonical Csound addition */

void vibrato_set(VIBRATO *p)
{
    FUNC        *ftp;

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
      if (*p->iphs >= 0)
        p->lphs = ((long)(*p->iphs * fmaxlen)) & PHMASK;
    }
    p->xcpsAmpRate = randGab *(*p->cpsMaxRate - *p->cpsMinRate) + *p->cpsMinRate;
    p->xcpsFreqRate = randGab *(*p->ampMaxRate - *p->ampMinRate) + *p->ampMinRate;
    p->tablen = ftp->flen;
    p->tablenUPkr = p->tablen /ekr;
}


void vibrato(VIBRATO *p)
{
    FUNC        *ftp;
    double      phs, inc;
    MYFLT   *ftab, fract, v1;
    MYFLT RandAmountAmp,RandAmountFreq;

    RandAmountAmp = (p->num1amp + (MYFLT)p->phsAmpRate * p->dfdmaxAmp) * *p->randAmountAmp ;
    RandAmountFreq = (p->num1freq + (MYFLT)p->phsFreqRate * p->dfdmaxFreq) * *p->randAmountFreq ;

    phs = p->lphs;
    ftp = p->ftp;
    if (ftp==NULL) {
      initerror(Str(X_1664,"vibrato(krate): not initialised"));
      return;
    }
    fract = (MYFLT) (phs - (long)phs);
    ftab = ftp->ftable + (long)phs;
    v1 = *ftab++;
    *p->out = (v1 + (*ftab - v1) * fract) * (*p->AverageAmp * (MYFLT)pow(2.0,RandAmountAmp));
    inc = ( *p->AverageFreq * pow(2,RandAmountFreq)) *  p->tablenUPkr;
    phs += inc;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;
    p->lphs = phs;
    p->phsAmpRate += (long)(p->xcpsAmpRate * kicvt);
    if (p->phsAmpRate >= MAXLEN) {
      p->xcpsAmpRate =  randGab  * (*p->ampMaxRate - *p->ampMinRate) + *p->ampMinRate;
      p->phsAmpRate &= PHMASK;
      p->num1amp = p->num2amp;
      p->num2amp = BiRandGab ;
      p->dfdmaxAmp = (p->num2amp - p->num1amp) / fmaxlen;
    }
    p->phsFreqRate += (long)(p->xcpsFreqRate * kicvt);
    if (p->phsFreqRate >= MAXLEN) {
      p->xcpsFreqRate =  randGab  * (*p->cpsMaxRate - *p->cpsMinRate) + *p->cpsMinRate;
      p->phsFreqRate &= PHMASK;
      p->num1freq = p->num2freq;
      p->num2freq = BiRandGab ;
      p->dfdmaxFreq = (p->num2freq - p->num1freq) / fmaxlen;
    }
}


void vibr_set(VIBR *p)
  /* faster and easier to use than vibrato, but less flexible */
{
    FUNC        *ftp;
#define randAmountAmp   1.59055f   /* these default values are far from being the best */
#define randAmountFreq  0.629921f  /* if you think you found better ones, please tell me*/
#define ampMinRate      1.f       /* them by posting a message to g.maldonado@agora.stm.it */
#define ampMaxRate      3.f
#define cpsMinRate      1.19377f
#define cpsMaxRate      2.28100f
#define iphs            0.f

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
      p->lphs = ((long)(iphs * fmaxlen)) & PHMASK;
    }
    p->xcpsAmpRate = randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate;
    p->xcpsFreqRate = randGab  * (ampMaxRate - ampMinRate) + ampMinRate;
    p->tablen = ftp->flen;
    p->tablenUPkr = p->tablen /ekr;
}

void vibr(VIBR *p)
{
    FUNC        *ftp;
    double      phs, inc;
    MYFLT   *ftab, fract, v1;
    /* extern MYFLT powof2(MYFLT x); */
    MYFLT rAmountAmp,rAmountFreq;

    rAmountAmp = (p->num1amp + (MYFLT)p->phsAmpRate * p->dfdmaxAmp) * randAmountAmp ;
    rAmountFreq = (p->num1freq + (MYFLT)p->phsFreqRate * p->dfdmaxFreq) * randAmountFreq ;
    phs = p->lphs;
    ftp = p->ftp;
    if (ftp==NULL) {
      initerror(Str(X_1664,"vibrato(krate): not initialised"));
      return;
    }
    fract = (MYFLT) (phs - (long)phs); /*PFRAC(phs);*/
    ftab = ftp->ftable + (long)phs; /*(phs >> ftp->lobits);*/
    v1 = *ftab++;
    *p->out = (v1 + (*ftab - v1) * fract) * (*p->AverageAmp * (MYFLT)pow(2.0,rAmountAmp));
    inc = ( *p->AverageFreq * (MYFLT)pow(2.0,rAmountFreq) ) *  p->tablenUPkr;
    phs += inc;
    while (phs >= p->tablen)
      phs -= p->tablen;
    while (phs < 0 )
      phs += p->tablen;
    p->lphs = phs;

    p->phsAmpRate += (long)(p->xcpsAmpRate * kicvt);
    if (p->phsAmpRate >= MAXLEN) {
      p->xcpsAmpRate =  randGab  * (ampMaxRate - ampMinRate) + ampMinRate;
      p->phsAmpRate &= PHMASK;
      p->num1amp = p->num2amp;
      p->num2amp = BiRandGab ;
      p->dfdmaxAmp = (p->num2amp - p->num1amp) / fmaxlen;
    }

    p->phsFreqRate += (long)(p->xcpsFreqRate * kicvt);
    if (p->phsFreqRate >= MAXLEN) {
      p->xcpsFreqRate =  randGab  * (cpsMaxRate - cpsMinRate) + cpsMinRate;
      p->phsFreqRate &= PHMASK;
      p->num1freq = p->num2freq;
      p->num2freq = BiRandGab ;
      p->dfdmaxFreq = (p->num2freq - p->num1freq) / fmaxlen;
    }
#undef  randAmountAmp
#undef  randAmountFreq
#undef  ampMinRate
#undef  ampMaxRate
#undef  cpsMinRate
#undef  cpsMaxRate
#undef  iphs
}

void jitter2_set(JITTER2 *p)
{
    if (*p->cps1==FL(0.0) && *p->cps2==FL(0.0) && *p->cps2==FL(0.0) /* accept default values */
        && *p->amp1==FL(0.0) && *p->amp2==FL(0.0) && *p->amp3==FL(0.0))
      p->flag = 1;
    else
      p->flag = 0;
    p->dfdmax1 = p->dfdmax2 = p->dfdmax3 = FL(0.0);
    p->phs1 = p->phs2 = p->phs3 = 0;
}


void jitter2(JITTER2 *p)
{
    MYFLT out1,out2,out3;
    out1 = (p->num1a + (MYFLT)p->phs1 * p->dfdmax1);
    out2 = (p->num1b + (MYFLT)p->phs2 * p->dfdmax2);
    out3 = (p->num1c + (MYFLT)p->phs3 * p->dfdmax3);

    if (p->flag) { /* accept default values */
      *p->out  = (out1* FL(0.5) + out2 * FL(0.3) + out3* FL(0.2)) * *p->gamp ;
      p->phs1 += (long) (0.82071231913 * kicvt);
      p->phs2 += (long) (7.009019029039107 * kicvt);
      p->phs3 += (long) (10 * kicvt);
    }
    else {
      *p->out  = (out1* *p->amp1 + out2* *p->amp2 +out3* *p->amp3) * *p->gamp ;
      p->phs1 += (long)( *p->cps1 * kicvt);
      p->phs2 += (long)( *p->cps2 * kicvt);
      p->phs3 += (long)( *p->cps3 * kicvt);
    }
    if (p->phs1 >= MAXLEN) {
      p->phs1   &= PHMASK;
      p->num1a   = p->num2a;
      p->num2a   = BiRandGab ;
      p->dfdmax1 = (p->num2a - p->num1a) / fmaxlen;
    }
    if (p->phs2 >= MAXLEN) {
      p->phs2   &= PHMASK;
      p->num1b   = p->num2b;
      p->num2b   = BiRandGab ;
      p->dfdmax2 = (p->num2b - p->num1b) / fmaxlen;
    }
    if (p->phs3 >= MAXLEN) {
      p->phs3   &= PHMASK;
      p->num1c   = p->num2c;
      p->num2c   = BiRandGab ;
      p->dfdmax3 = (p->num2c - p->num1c) / fmaxlen;
    }
}

void jitter_set(JITTER *p)
{
    p->num2     = BiRandGab;
    p->initflag = 1;
    p->phs=0;
}


void jitter(JITTER *p)
{
    if (p->initflag) {
      p->initflag = 0;
      *p->ar = p->num2 * *p->amp;
      goto next;
    }
    *p->ar = (p->num1 + (MYFLT)p->phs * p->dfdmax) * *p->amp;
    p->phs += (long)(p->xcps * kicvt);

    if (p->phs >= MAXLEN) {
    next:
      p->xcps   = randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin;
      p->phs   &= PHMASK;
      p->num1   = p->num2;
      p->num2   = BiRandGab;
      p->dfdmax = (p->num2 - p->num1) / fmaxlen;
    }
}

void jitters_set(JITTERS *p)
{
    p->num1     = BiRandGab;
    p->num2     = BiRandGab;
    p->df1      = FL(0.0);
    p->initflag = 1;
    p->cod      = (p->XINCODE & 02) ? 1 : 0;
    p->phs      = 0;
}


void jitters(JITTERS *p)
{
    MYFLT       x, c3= p->c3, c2= p->c2;
    MYFLT       f0 = p->num0, df0= p->df0;

    if (p->initflag == 1) {
      p->initflag = 0;
      goto next;
    }
    p->phs += p->si;
    if (p->phs >= 1.0) {
      MYFLT     slope, resd1, resd0, f2, f1;
    next:
      p->si =  (randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin)/ekr;
      while (p->phs > 1.0)
        p->phs -= 1.0;
      f0 = p->num0 = p->num1;
      f1 = p->num1 = p->num2;
      f2 = p->num2 = BiRandGab;
      df0 = p->df0 = p->df1;
      p->df1 = ( f2  - f0 ) * FL(0.5);
      slope = f1 - f0;
      resd0 = df0 - slope;
      resd1 = p->df1 - slope;
      c3 = p->c3 = resd0 + resd1;
      c2 = p->c2 = - (resd1 + FL(2.0)* resd0);
    }
    x= (MYFLT) p->phs;
    *p->ar = (((c3 * x + c2) * x + df0) * x + f0) * *p->amp;
}

void jittersa(JITTERS *p)
{
    MYFLT   x, c3=p->c3, c2=p->c2;
    MYFLT   f0= p->num0, df0 = p->df0;
    MYFLT   *ar = p->ar, *amp = p->amp;
    MYFLT   cpsMax = *p->cpsMax, cpsMin = *p->cpsMin;
    int     n = ksmps, cod = p->cod;
    double phs = p->phs, si = p->si;

    if (p->initflag) {
      p->initflag = 0;
      goto next;
    }
    do {
      phs += si;
      if (phs >= 1.0) {
        MYFLT   slope, resd1, resd0, f2, f1;
      next:
        si =  (randGab  * (cpsMax - cpsMin) + cpsMin)/esr;
        while (phs > 1.0)
          phs -= 1.0;
        f0 = p->num0 = p->num1;
        f1 = p->num1 = p->num2;
        f2 = p->num2 = BiRandGab;
        df0 = p->df0 = p->df1;
        p->df1 = ( f2 - f0 ) * FL(0.5);
        slope = f1 - f0;
        resd0 = df0 - slope;
        resd1 = p->df1 - slope;
        c3 = p->c3 = resd0 + resd1;
        c2 = p->c2 = - (resd1 + FL(2.0)* resd0);
      }
      x = (MYFLT) phs;
      *ar++ = (((c3 * x + c2) * x + df0) * x + f0) * *amp;
      if (cod) amp++;
    } while(--n);
    p->phs = phs;
    p->si =si;
}

void kDiscreteUserRand(DURAND *p)
{ /* gab d5*/
    if (p->pfn != (long)*p->tableNum) {
      if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
        sprintf(errmsg, Str(X_315,"invalid table no. %f"), *p->tableNum);
        perferror(errmsg);
        return;
      }
      p->pfn = (long)*p->tableNum;
    }
    *p->out = p->ftp->ftable[(long)(randGab * p->ftp->flen+FL(0.5))];
}

void iDiscreteUserRand(DURAND *p)
{
  p->pfn = 0L;
  kDiscreteUserRand(p);
}

void aDiscreteUserRand(DURAND *p)
{ /* gab d5*/
    MYFLT *out = p->out, *table;
    long n = ksmps, flen;

    if (p->pfn != (long)*p->tableNum) {
      if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
        sprintf(errmsg, Str(X_315,"invalid table no. %f"), *p->tableNum);
        perferror(errmsg);
        return;
      }
      p->pfn = (long)*p->tableNum;
    }
    table = p->ftp->ftable;
    flen = p->ftp->flen;
    do {
      *out++ = table[(long)(randGab * flen +FL(0.5))];
    } while (--n);
}


void kContinuousUserRand(CURAND *p)
{ /* gab d5*/
    long indx;
    MYFLT findx, fract, v1, v2;
    if (p->pfn != (long)*p->tableNum) {
      if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
        sprintf(errmsg, Str(X_315,"invalid table no. %f"), *p->tableNum);
        perferror(errmsg);
        return;
      }
      p->pfn = (long)*p->tableNum;
    }
    findx = (MYFLT) (randGab * p->ftp->flen+FL(0.5));
    indx = (long) findx;
    fract = findx - indx;
    v1 = *(p->ftp->ftable + indx);
    v2 = *(p->ftp->ftable + indx + 1);
    *p->out = (v1 + (v2 - v1) * fract) * (*p->max - *p->min) + *p->min;
}

void iContinuousUserRand(CURAND *p)
{
    p->pfn = 0;
    kContinuousUserRand(p);
}

void Cuserrnd_set(CURAND *p)
{
    p->pfn = 0;
}

void aContinuousUserRand(CURAND *p)
{ /* gab d5*/
    MYFLT min = *p->min, rge = *p->max;
    MYFLT *out = p->out, *table;
    long n = ksmps, flen, indx;
    MYFLT findx, fract,v1,v2;

    if (p->pfn != (long)*p->tableNum) {
      if ( (p->ftp = ftfindp(p->tableNum) ) == NULL) {
        sprintf(errmsg, Str(X_315,"invalid table no. %f"), *p->tableNum);
        perferror(errmsg);
        return;
      }
      p->pfn = (long)*p->tableNum;
    }

    table = p->ftp->ftable;
    flen = p->ftp->flen;

    rge -= min;
    do {
      findx = (MYFLT) (randGab * flen + FL(0.5));
      indx = (long) findx;
      fract = findx - indx;
      v1 = table[indx];
      v2 = table[indx+1];
      *out++ = (v1 + (v2 - v1) * fract) * rge + min;
    } while (--n);
}

void ikRangeRand(RANGERAND *p)
{ /* gab d5*/
    *p->out = randGab * (*p->max - *p->min) + *p->min;
}

void aRangeRand(RANGERAND *p)
{ /* gab d5*/
    MYFLT min = *p->min, max = *p->max, *out = p->out;
    long n = ksmps;
    MYFLT rge = max - min;

    do {
      *out++ = randGab * rge + min;
    } while (--n);
}


void randomi_set(RANDOMI *p)
{
    p->cpscod = (p->XINCODE & 01) ? 1 : 0;
    p->dfdmax = FL(0.0);
}

void krandomi(RANDOMI *p)
{
    *p->ar = (p->num1 + (MYFLT)p->phs * p->dfdmax) * (*p->max - *p->min) + *p->min;
    p->phs += (long)(*p->xcps * kicvt);
    if (p->phs >= MAXLEN) {
      p->phs   &= PHMASK;
      p->num1   = p->num2;
      p->num2   = randGab;
      p->dfdmax = (p->num2 - p->num1) / fmaxlen;
    }
}

void randomi(RANDOMI *p)
{
    long        phs = p->phs, inc;
    int         n = ksmps;
    MYFLT       *ar, *cpsp;
    MYFLT       amp, min;

    cpsp = p->xcps;
    min = *p->min;
    amp =  (*p->max - min);
    ar = p->ar;
    inc = (long)(*cpsp++ * sicvt);
    do {
      *ar++ = (p->num1 + (MYFLT)phs * p->dfdmax) * amp + min;
      phs += inc;
      if (p->cpscod)
        inc = (long)(*cpsp++ * sicvt);
      if (phs >= MAXLEN) {
        phs &= PHMASK;
        p->num1 = p->num2;
        p->num2 = randGab;
        p->dfdmax = (p->num2 - p->num1) / fmaxlen;
      }
    } while (--n);
    p->phs = phs;
}

void randomh_set(RANDOMH *p)
{
    p->cpscod = (p->XINCODE & 01) ? 1 : 0;
}

void krandomh(RANDOMH *p)
{
    *p->ar = p->num1 * (*p->max - *p->min) + *p->min;
    p->phs += (long)(*p->xcps * kicvt);
    if (p->phs >= MAXLEN) {
      p->phs &= PHMASK;
      p->num1 = randGab;
    }
}

void randomh(RANDOMH *p)
{
    long        phs = p->phs, inc;
    int         n = ksmps;
    MYFLT       *ar, *cpsp;
    MYFLT       amp, min;

    cpsp = p->xcps;
    min  = *p->min;
    amp  = (*p->max - min);
    ar   = p->ar;
    inc  = (long)(*cpsp++ * sicvt);
    do {
      *ar++     = p->num1 * amp + min;
      phs      += inc;
      if (p->cpscod)
        inc     = (long)(*cpsp++ * sicvt);
      if (phs >= MAXLEN) {
        phs    &= PHMASK;
        p->num1 = randGab;
      }
    } while (--n);
    p->phs = phs;
}



void random3_set(RANDOM3 *p)
{
    p->num1     = randGab;
    p->num2     = randGab;
    p->df1      = FL(0.0);
    p->initflag = 1;
    p->cod      = (p->XINCODE & 02) ? 1 : 0;
}


void random3(RANDOM3 *p)
{
    MYFLT       x, c3= p->c3, c2= p->c2;
    MYFLT       f0 = p->num0, df0= p->df0;

    if (p->initflag) {
      p->initflag =0;
      goto next;
    }
    p->phs += p->si;
    if (p->phs >= 1.0) {
      MYFLT     slope, resd1, resd0, f2, f1;
    next:
      p->si =  (randGab  * (*p->cpsMax - *p->cpsMin) + *p->cpsMin)/ekr;
      while (p->phs > 1.0)
        p->phs -=1.;
      f0     = p->num0 = p->num1;
      f1     = p->num1 = p->num2;
      f2     = p->num2 = randGab;
      df0    = p->df0 = p->df1;
      p->df1 = ( f2  - f0 ) * FL(0.5);
      slope  = f1 - f0;
      resd0  = df0 - slope;
      resd1  = p->df1 - slope;
      c3     = p->c3 = resd0 + resd1;
      c2     = p->c2 = - (resd1 + FL(2.0)* resd0);
    }
    x = (MYFLT) p->phs;
    *p->ar = (((c3 * x + c2) * x + df0) * x + f0) *
      (*p->rangeMax - *p->rangeMin) + *p->rangeMin;
}

void random3a(RANDOM3 *p)
{

    MYFLT       x, c3=p->c3, c2=p->c2;
    MYFLT       f0 = p->num0, df0 = p->df0;
    MYFLT       *ar = p->ar, *rangeMin = p->rangeMin;
    MYFLT       *rangeMax = p->rangeMax;
    MYFLT       cpsMin = *p->cpsMin, cpsMax = *p->cpsMax;
    int         n = ksmps, cod = p->cod;
    double      phs = p->phs, si = p->si;

    if (p->initflag) {
      p->initflag = 0;
      goto next;

    }
    do {
      phs += si;
      if (phs >= 1.0) {
        MYFLT   slope, resd1, resd0, f2, f1;
      next:
        si =  (randGab  * (cpsMax - cpsMin) + cpsMin)/esr;
        while (phs > 1.0)
          phs -= 1.0;
        f0     = p->num0 = p->num1;
        f1     = p->num1 = p->num2;
        f2     = p->num2 = BiRandGab;
        df0    = p->df0 = p->df1;
        p->df1 = ( f2 - f0 ) * FL(0.5);
        slope  = f1 - f0;
        resd0  = df0 - slope;
        resd1  = p->df1 - slope;
        c3     = p->c3 = resd0 + resd1;
        c2     = p->c2 = - (resd1 + FL(2.0)* resd0);
      }
      x = (MYFLT) phs;
      *ar++ = (((c3 * x + c2) * x + df0) * x + f0) *
        (*rangeMax - *rangeMin) + *rangeMin;
      if (cod) {
        rangeMin++;
        rangeMax++;
      }
    } while(--n);
    p->phs = phs;
    p->si  = si;
}

