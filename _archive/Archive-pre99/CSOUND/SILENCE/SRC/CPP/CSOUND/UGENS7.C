#include "cs.h"                 /*                              UGENS7.C        */
#include "ugens7.h"
#include <math.h>

/* loosely based on code of Michael Clarke, University of Huddersfield */

#define FZERO   (FL(0.0))
#define FONE    (FL(1.0))

static   int    newpulse(FOFS *, OVRLAP *, MYFLT *, MYFLT *, MYFLT *);

void fofset0(FOFS *p, int flag)
{
        if ((p->ftp1 = ftfind(p->ifna)) != NULL
         && (p->ftp2 = ftfind(p->ifnb)) != NULL) {
            OVRLAP *ovp, *nxtovp;
            long   olaps;
            p->durtogo = (long)(*p->itotdur * esr);
            if (*p->iphs == FL(0.0))                       /* if fundphs zero,  */
                p->fundphs = MAXLEN;                    /*   trigger new FOF */
            else p->fundphs = (long)(*p->iphs * fmaxlen) & PHMASK;
            if ((olaps = (long)*p->iolaps) <= 0) {
                initerror(Str(X_891,"illegal value for iolaps"));
                return;
            }
            if (*p->iphs >= FL(0.0))
              auxalloc((long)olaps * sizeof(OVRLAP), &p->auxch);
            ovp = &p->basovrlap;
            nxtovp = (OVRLAP *) p->auxch.auxp;
            do {
                ovp->nxtact = NULL;
                ovp->nxtfree = nxtovp;              /* link the ovlap spaces */
                ovp = nxtovp++;
            } while (--olaps);
            ovp->nxtact = NULL;
            ovp->nxtfree = NULL;
            p->fofcount = -1;
            p->prvband = FZERO;
            p->expamp = FONE;
            p->prvsmps = 0;
            p->preamp = FONE;
            p->xincod   = (p->XINCODE & 0x7) ? 1 : 0;
            p->ampcod   = (p->XINCODE & 0x2) ? 1 : 0;
            p->fundcod  = (p->XINCODE & 0x1) ? 1 : 0;
            p->formcod  = (p->XINCODE & 0x4) ? 1 : 0;
            if (flag)
              p->fmtmod = (*p->ifmode == FZERO) ? 0 : 1;
        }
        p->foftype = flag;
}

void fofset(FOFS        *p)
{
    fofset0(p, 1);
}

void fofset2(FOFS       *p)
{
    fofset0(p, 0);
}


void fof(FOFS *p)
{
        OVRLAP *ovp;
        FUNC    *ftp1,  *ftp2;
        MYFLT   *ar, *amp, *fund, *form;
        long   nsmps = ksmps, fund_inc, form_inc;
        MYFLT  v1, fract ,*ftab;

        if (p->auxch.auxp==NULL) { /* RWD fix */
          initerror(Str(X_770,"fof: not initialised"));
          return;
        }
        ar = p->ar;
        amp = p->xamp;
        fund = p->xfund;
        form = p->xform;
        ftp1 = p->ftp1;
        ftp2 = p->ftp2;
        fund_inc = (long)(*fund * sicvt);
        form_inc = (long)(*form * sicvt);
        do {
            if (p->fundphs & MAXLEN) {               /* if phs has wrapped */
                p->fundphs &= PHMASK;
                if ((ovp = p->basovrlap.nxtfree) == NULL) {
                    perferror(Str(X_267,"FOF needs more overlaps"));
                    return;
                }
                if (newpulse(p, ovp, amp, fund, form)) {   /* init new fof */
                    ovp->nxtact = p->basovrlap.nxtact;     /* & link into  */
                    p->basovrlap.nxtact = ovp;             /*   actlist    */
                    p->basovrlap.nxtfree = ovp->nxtfree;
                }
            }
            *ar = FZERO;
            ovp = &p->basovrlap;
            while (ovp->nxtact != NULL) {         /* perform cur actlist:  */
                MYFLT result;
                OVRLAP *prvact = ovp;
                ovp = ovp->nxtact;                   /*  formant waveform  */
                fract = PFRAC1(ovp->formphs);        /* from JMC Fog*/
                ftab = ftp1->ftable + (ovp->formphs >> ftp1->lobits);/*JMC Fog*/
/*              printf("\n ovp->formphs = %ld, ", ovp->formphs); */ /* TEMP JMC*/
                v1 = *ftab++;                           /*JMC Fog*/
                result = v1 + (*ftab - v1) * fract;     /*JMC Fog*/
/*              result = *(ftp1->ftable + (ovp->formphs >> ftp1->lobits) ); */
                if (p->foftype) {
                  if (p->fmtmod)
                    ovp->formphs += form_inc;           /* inc phs on mode */
                  else ovp->formphs += ovp->forminc;
                }
                else {
#define kgliss ifmode
                /* MYFLT ovp->glissbas = kgliss / grain length. ovp->sampct is
                   incremented each sample. We add glissbas * sampct to the
                   pitch of grain at each a-rate pass (ovp->formphs is the
                   index into ifna; ovp->forminc is the stepping factor that
                   decides pitch) */
                  ovp->formphs += (long)(ovp->forminc + ovp->glissbas * ovp->sampct++);
                }
                ovp->formphs &= PHMASK;
                if (ovp->risphs < MAXLEN) {             /*  formant ris envlp */
                    result *= *(ftp2->ftable + (ovp->risphs >> ftp2->lobits) );
                    ovp->risphs += ovp->risinc;
                }
                if (ovp->timrem <= ovp->dectim) {       /*  formant dec envlp */
                    result *= *(ftp2->ftable + (ovp->decphs >> ftp2->lobits) );
                    if ((ovp->decphs -= ovp->decinc) < 0)
                        ovp->decphs = 0;
                }
                *ar += (result * ovp->curamp);          /*  add wavfrm to out */
                if (--ovp->timrem)                      /*  if fof not expird */
                    ovp->curamp *= ovp->expamp;         /*   apply bw exp dec */
                else {
                    prvact->nxtact = ovp->nxtact;       /*  else rm frm activ */
                    ovp->nxtfree = p->basovrlap.nxtfree;/*  & ret spc to free */
                    p->basovrlap.nxtfree = ovp;
                    ovp = prvact;
                }
            }
            p->fundphs += fund_inc;
            if (p->xincod) {
                if (p->ampcod)    amp++;
                if (p->fundcod)   fund_inc = (long)(*++fund * sicvt);
                if (p->formcod)   form_inc = (long)(*++form * sicvt);
            }
            p->durtogo--;
            ar++;
        } while (--nsmps);
}

static int newpulse(FOFS *p, OVRLAP *ovp, MYFLT *amp, MYFLT *fund, MYFLT *form)
{
        MYFLT   octamp = *amp, oct;
        long   rismps, newexp = 0;

        if ((ovp->timrem = (long)(*p->kdur * esr)) > p->durtogo) /* ringtime */
            return(0);
        if ((oct = *p->koct) > FZERO) {                   /* octaviation */
            long ioct = (long)oct, bitpat = ~(-1L << ioct);
            if (bitpat & ++p->fofcount)
                return(0);
            if ((bitpat += 1) & p->fofcount)
                octamp *= (FONE + ioct - oct);
        }
        if (*fund == FZERO)                               /* formant phs */
            ovp->formphs = 0;
        else ovp->formphs = (long)(p->fundphs * *form / *fund) & PHMASK;
        ovp->forminc = (long)(*form * sicvt);
        if (*p->kband != p->prvband) {                    /* bw: exp dec */
            p->prvband = *p->kband;
            p->expamp = (MYFLT)exp((double)(*p->kband * mpidsr));
            newexp = 1;
        }
        /* Init grain rise ftable phase. Negative kform values make
           the kris (ifnb) initial index go negative and crash csound.
           So insert another if-test with compensating code. */
        if (*p->kris >= onedsr && *form != FZERO) {      /* init fnb ris */
          if (*form < FZERO && ovp->formphs != 0)
            ovp->risphs = (long)((MAXLEN - ovp->formphs) / -*form / *p->kris);
          else
            ovp->risphs = (long)(ovp->formphs / *form / *p->kris);
          ovp->risinc = (long)(sicvt / *p->kris);
          rismps = MAXLEN / ovp->risinc;
        }
        else {
          ovp->risphs = MAXLEN;
          rismps = 0;
        }
        if (newexp || rismps != p->prvsmps) {            /* if new params */
            if (p->prvsmps = rismps)                     /*   redo preamp */
                p->preamp = intpow(p->expamp, -rismps);
            else p->preamp = FONE;
        }
        ovp->curamp = octamp * p->preamp;                /* set startamp  */
        ovp->expamp = p->expamp;
        if ((ovp->dectim = (long)(*p->kdec * esr)) > 0)  /*      fnb dec  */
            ovp->decinc = (long)(sicvt / *p->kdec);
        ovp->decphs = PHMASK;
        if (!p->foftype) {
                /* Make fof take k-rate phase increment:
                   Add current iphs to initial form phase */
          ovp->formphs += (long)(*p->iphs * fmaxlen);              /*     krate phs */
          ovp->formphs &= PHMASK;
                /* Set up grain gliss increment: ovp->glissbas will be added to
                   ovp->forminc at each pass in fof2. Thus glissbas must be
                   equal to kgliss / grain playing time. Also make it harmonic,
                   so integer kgliss can represent octaves (ie pow() call). */
          ovp->glissbas = ovp->forminc * (MYFLT)pow(2.0, (double)*p->kgliss);
                                /* glissbas should be diff of start & end pitch*/
          ovp->glissbas -= ovp->forminc;
          ovp->glissbas /= ovp->timrem;
          ovp->sampct = 0;   /* Must be reset in case ovp was used before  */
        }
        return(1);
}

static int rngflg=0;

void harmset(HARMON *p)
{
    MYFLT minfrq = *p->ilowest;
    if (minfrq < FL(64.0)) {
      initerror(Str(X_346,"Minimum frequency too low"));
      return;
    }
    if (p->auxch.auxp == NULL || minfrq < p->minfrq) {
      long nbufs = (long)(ekr * FL(3.0) / minfrq) + 1;
      long nbufsmps = nbufs * ksmps;
      long maxprd = (long)(esr / minfrq);
      long totalsiz = nbufsmps * 4 + maxprd;
      auxalloc((long)totalsiz * sizeof(MYFLT), &p->auxch);
      p->bufp = (MYFLT *) p->auxch.auxp;
      p->midp = p->bufp + nbufsmps;        /* each >= maxprd * 3 */
      p->bufq = p->midp + nbufsmps;
      p->midq = p->bufq + nbufsmps;
      p->autobuf = p->midq + nbufsmps;     /* size of maxprd */
      p->nbufsmps = nbufsmps;
      p->n2bufsmps = nbufsmps * 2;
      p->lomaxdist = maxprd;
      p->minfrq = minfrq;
    }
    if ((p->autoktim = (long)(*p->iptrkprd * ekr + FL(0.5))) < 1)
      p->autoktim = 1;
    p->autokcnt = 1;              /* init for immediate autocorr attempt */
    p->sicvt = FL(65536.0) * onedsr;
    p->cpsmode = ((*p->icpsmode != FL(0.0)));
    p->inp1 = p->bufp;
    p->inp2 = p->midp;
    p->inq1 = p->bufq;
    p->inq2 = p->midq;
    p->puls1 = NULL;
    p->puls2 = NULL;
    p->puls3 = NULL;
    p->prvest = FL(0.0);
    p->prvq = FL(0.0);
    p->phase1 = 0;
    p->phase2 = 0;
    rngflg = 0;
}

void harmon(HARMON *p)
{
    MYFLT *src1, *src2, *src3, *inp1, *inp2, *outp;
    MYFLT c1, c2, qval, *inq1, *inq2;
    MYFLT sum, minval, *minqp, *minq1, *minq2, *endp;
    MYFLT *pulstrt, lin1, lin2, lin3;
    long  cnt1, cnt2, cnt3;
    long  nn, nsmps, phase1, phase2, phsinc1, phsinc2, period;

    inp1 = p->inp1;
    inp2 = p->inp2;
    inq1 = p->inq1;
    inq2 = p->inq2;
    qval = p->prvq;
    if (*p->kest != p->prvest && *p->kest != FL(0.0)) {/* if new pitch estimate */
      MYFLT estperiod = esr / *p->kest;
      MYFLT b = FL(2.0) - (MYFLT)cos(*p->kest * tpidsr);
      p->c2 = b - (MYFLT)sqrt((double)(b * b) - 1.0);         /*   recalc lopass coefs */
      p->c1 = FL(1.0) - p->c2;
      p->prvest = *p->kest;
      p->estprd = estperiod;
      p->prvar = FL(0.0);
    }
    if (*p->kvar != p->prvar) {
      MYFLT oneplusvar = FL(1.0) + *p->kvar;
      p->mindist = (long)(p->estprd / oneplusvar);  /* prd window is prd +/- var int */
      p->maxdist = (long)(p->estprd * oneplusvar);
      if (p->maxdist > p->lomaxdist)
        p->maxdist = p->lomaxdist;
      p->max2dist = p->maxdist * 2;
      p->prvar = *p->kvar;
    }
    c1 = p->c1;
    c2 = p->c2;
    for (src1 = p->asig, nsmps = ksmps; nsmps--; src1++) {
      *inp1++ = *inp2++ = *src1;              /* dbl store the wavform */
      if (*src1 > FL(0.0))
        qval = c1 * *src1 + c2 * qval;        /*  & its half-wave rect */
      else qval = c2 * qval;
      *inq1++ = *inq2++ = qval;
    }
    if (!(--p->autokcnt)) {                   /* if time for new autocorr  */
      MYFLT *mid1, *mid2, *src4;
      MYFLT *autop, *maxp;
      MYFLT dsum, dinv, win, windec, maxval;
      long  dist;
      p->autokcnt = p->autoktim;
      mid2 = inp2 - p->max2dist;
      mid1 = mid2 - 1;
      autop = p->autobuf;
      for (dist = p->mindist; dist <= p->maxdist; dist++) {
        dsum = FL(0.0);
        dinv = FL(1.0) / dist;
        src1 = mid1;  src3 = mid1 + dist;
        src2 = mid2;  src4 = mid2 + dist;
        for (win = FL(1.0), windec = dinv, nn = dist; nn--; ) {
          dsum += win * (*src1 * *src3 + *src2 * *src4);
          src1--; src2++; src3--; src4++;
          win -= windec;
        }
        *autop++ = dsum * dinv;
      }
      maxval = FL(0.0);
      maxp = autop = p->autobuf;
      endp = autop + p->maxdist - p->mindist;
      while (autop < endp) {
        if (*autop > maxval) {          /* max autocorr gives new period */
          maxval = *autop;
          maxp = autop;
        }
        autop++;
      }
      period = p->mindist + maxp - p->autobuf;
      if (period != p->period) {
        p->period = period;
        if (!p->cpsmode)
          p->sicvt = FL(65536.0) / period;
        p->pnt1 = (long)((MYFLT)period * FL(0.2));
        p->pnt2 = (long)((MYFLT)period * FL(0.8));
        p->pnt3 = period;
        p->inc1 = FL(1.0) / p->pnt1;
        p->inc2 = FL(1.0) / (period - p->pnt2);
      }
    }
    else period = p->period;

    minval = (MYFLT)HUGE_VAL;               /* Suitably large ! */
    minq2 = inq2 - period;                  /* srch the qbuf for minima */
    minq1 = minq2 - period;                 /* which are 1 period apart */
    endp = inq2;                            /* move srch over 1 period  */
    while (minq2 < endp) {
      if ((sum = *minq1 + *minq2) < minval) {
        minval = sum;
        minqp = minq1;
      }
      minq1++; minq2++;
    }
    src1 = minqp - p->n2bufsmps;            /* get src equiv of 1st min  */
    while (src1 + ksmps > inp2)             /* if not enough smps presnt */
      src1 -= period;                     /*      back up 1 prd        */
    pulstrt = src1;                         /* curr available pulse beg  */

    src1 = p->puls1;                        /* insert pulses into output */
    src2 = p->puls2;
    src3 = p->puls3;
    lin1 = p->lin1;
    lin2 = p->lin2;
    lin3 = p->lin3;
    cnt1 = p->cnt1;
    cnt2 = p->cnt2;
    cnt3 = p->cnt3;
    phase1 = p->phase1;
    phase2 = p->phase2;
    phsinc1 = (long)(*p->kfrq1 * p->sicvt);
    phsinc2 = (long)(*p->kfrq2 * p->sicvt);
    outp = p->ar;
    nsmps = ksmps;
    do {
      MYFLT sum;
      if (src1 != NULL) {
        if (++cnt1 < p->pnt11) {
          sum = *src1++ * lin1;
          lin1 += p->inc11;
        } else if (cnt1 <= p->pnt12)
          sum = *src1++;
        else if (cnt1 <= p->pnt13) {
          sum = *src1++ * lin1;
          lin1 -= p->inc12;
        } else {
          sum = FL(0.0);
          src1 = NULL;
        }
      }
      else sum = FL(0.0);
      if (src2 != NULL) {
        if (++cnt2 < p->pnt21) {
          sum += *src2++ * lin2;
          lin2 += p->inc21;
        } else if (cnt2 <= p->pnt22)
          sum += *src2++;
        else if (cnt2 <= p->pnt23) {
          sum += *src2++ * lin2;
          lin2 -= p->inc22;
        } else src2 = NULL;
      }
      if (src3 != NULL) {
        if (++cnt3 < p->pnt31) {
          sum += *src3++ * lin3;
          lin3 += p->inc31;
        } else if (cnt3 <= p->pnt32)
          sum += *src3++;
        else if (cnt3 <= p->pnt33) {
          sum += *src3++ * lin3;
          lin3 -= p->inc32;
        } else src3 = NULL;
      }
      if ((phase1 += phsinc1) & 0xFFFF0000L) {
        phase1 &= 0x0000FFFFL;
        if (src1 == NULL) {
          src1 = pulstrt;
          cnt1 = 0;
          lin1 = p->inc1;
          p->inc11 = p->inc1;
          p->inc12 = p->inc2;
          p->pnt11 = p->pnt1;
          p->pnt12 = p->pnt2;
          p->pnt13 = p->pnt3;
        }
        else if (src2 == NULL) {
          src2 = pulstrt;
          cnt2 = 0;
          lin2 = p->inc1;
          p->inc21 = p->inc1;
          p->inc22 = p->inc2;
          p->pnt21 = p->pnt1;
          p->pnt22 = p->pnt2;
          p->pnt23 = p->pnt3;
        }
        else if (src3 == NULL) {
          src3 = pulstrt;
          cnt3 = 0;
          lin3 = p->inc1;
          p->inc31 = p->inc1;
          p->inc32 = p->inc2;
          p->pnt31 = p->pnt1;
          p->pnt32 = p->pnt2;
          p->pnt33 = p->pnt3;
        }
        else if (++rngflg > 200) {
          printf(Str(X_825,"harmon out of range...\n"));
          rngflg = 0;
        }
      }
      if ((phase2 += phsinc2) & 0xFFFF0000L) {
        phase2 &= 0x0000FFFFL;
        if (src1 == NULL) {
          src1 = pulstrt;
          cnt1 = 0;
          lin1 = p->inc1;
          p->inc11 = p->inc1;
          p->inc12 = p->inc2;
          p->pnt11 = p->pnt1;
          p->pnt12 = p->pnt2;
          p->pnt13 = p->pnt3;
        }
        else if (src2 == NULL) {
          src2 = pulstrt;
          cnt2 = 0;
          lin2 = p->inc1;
          p->inc21 = p->inc1;
          p->inc22 = p->inc2;
          p->pnt21 = p->pnt1;
          p->pnt22 = p->pnt2;
          p->pnt23 = p->pnt3;
        }
        else if (src3 == NULL) {
          src3 = pulstrt;
          cnt3 = 0;
          lin3 = p->inc1;
          p->inc31 = p->inc1;
          p->inc32 = p->inc2;
          p->pnt31 = p->pnt1;
          p->pnt32 = p->pnt2;
          p->pnt33 = p->pnt3;
        }
        else if (++rngflg > 200) {
          printf(Str(X_824,"harmon out of range"));
          rngflg = 0;
        }
      }
      *outp++ = sum;
    } while (--nsmps);
    if (inp1 >= p->midp) {
      p->inp1 = p->bufp;
      p->inp2 = p->midp;
      p->inq1 = p->bufq;
      p->inq2 = p->midq;
      if (src1 != NULL)
        src1 -= p->nbufsmps;
      if (src2 != NULL)
        src2 -= p->nbufsmps;
      if (src3 != NULL)
        src3 -= p->nbufsmps;
    } else {
      p->inp1 = inp1;
      p->inp2 = inp2;
      p->inq1 = inq1;
      p->inq2 = inq2;
    }
    p->puls1 = src1;
    p->puls2 = src2;
    p->puls3 = src3;
    p->lin1 = lin1;
    p->lin2 = lin2;
    p->lin3 = lin3;
    p->cnt1 = cnt1;
    p->cnt2 = cnt2;
    p->cnt3 = cnt3;
    p->phase1 = phase1;
    p->phase2 = phase2;
    p->prvq = qval;
}
