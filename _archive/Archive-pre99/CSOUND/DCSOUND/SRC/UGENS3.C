#include "cs.h"                 /*                              UGENS3.C        */
#include "ugens3.h"
#include <math.h>
#include "oload.h"

extern void turnoff(void);

#define FZERO (FL(0.0))
static short *isintab = NULL;

#ifdef RESET
void adsynRESET(void)
{
    isintab = NULL;   /* hope this is enough... */
}
#endif

void foscset(FOSC *p)
{
    FUNC   *ftp;

    if ((ftp = ftfind(p->ifn)) != NULL) {
      p->ftp = ftp;
      if (*p->iphs >= 0)
        p->cphs = p->mphs = (long)(*p->iphs * fmaxlen);
    }
    p->ampcod = (p->XINCODE & 0x2) ? 1 : 0;
    p->carcod = (p->XINCODE & 0x4) ? 1 : 0;
    p->modcod = (p->XINCODE & 0x8) ? 1 : 0;
}

void foscil(FOSC *p)
{
    FUNC   *ftp;
    MYFLT  *ar, *ampp, *modp, cps, amp;
    MYFLT  xcar, xmod, *carp, car, fmod, cfreq, mod, ndx, *ftab;
    long   mphs, cphs, minc, cinc, lobits;
    int    nsmps = ksmps;

    ar = p->rslt;
    ftp = p->ftp;
    if (ftp==NULL) {
      initerror(Str(X_774,"foscil: not initialized"));
      return;
    }
    ftab = ftp->ftable;
    lobits = ftp->lobits;
    mphs = p->mphs;
    cphs = p->cphs;
    ampp = p->xamp;
    cps  = *p->kcps;
    carp = p->xcar;
    modp = p->xmod;
    amp  = *ampp;
    xcar = *carp;
    xmod = *modp;

    if (p->XINCODE) {
      do {
        if (p->ampcod) amp = *(ampp++);
        if (p->carcod) xcar = *(carp++);
        if (p->modcod) xmod = *(modp++);
        car = cps * xcar;
        mod = cps * xmod;
        ndx = *p->kndx * mod;
        minc = (long)(mod * sicvt);
        mphs &= PHMASK;
        fmod = *(ftab + (mphs >>lobits)) * ndx;
        mphs += minc;
        cfreq = car + fmod;
        cinc = (long)(cfreq * sicvt);
        cphs &= PHMASK;
        *ar++ = *(ftab + (cphs >>lobits)) * amp;
        cphs += cinc;
      } while (--nsmps);
    }
    else {
      MYFLT amp;
      amp = *ampp;
      cps = *p->kcps;
      car = cps * *carp;
      mod = cps * *modp;
      ndx = *p->kndx * mod;
      minc = (long)(mod * sicvt);
      do {
        mphs &= PHMASK;
        fmod = *(ftab + (mphs >>lobits)) * ndx;
        mphs += minc;
        cfreq = car + fmod;
        cinc = (long)(cfreq * sicvt);
        cphs &= PHMASK;
        *ar++ = *(ftab + (cphs >>lobits)) * amp;
        cphs += cinc;
      } while (--nsmps);
    }
    p->mphs = mphs;
    p->cphs = cphs;
}

void foscili(FOSC       *p)
{
    FUNC   *ftp;
    MYFLT  *ar, *ampp, amp, cps, fract, v1, car, fmod, cfreq, mod;
    MYFLT  *carp, *modp, xcar, xmod, ndx, *ftab;
    long   mphs, cphs, minc, cinc, lobits;
    int    nsmps = ksmps;
    
    ar = p->rslt;
    ftp = p->ftp;
    if (ftp==NULL) {        /* RWD fix */
      initerror(Str(X_775,"foscili: not initialized"));
      return;
    }
    lobits = ftp->lobits;
    mphs = p->mphs;
    cphs = p->cphs;
    ampp = p->xamp;
    cps  = *p->kcps;
    carp = p->xcar;
    modp = p->xmod;
    amp  = *ampp;
    xcar = *carp;
    xmod = *modp;
    if (p->XINCODE) {
      do {
        if (p->ampcod)  amp = *(ampp++);
        if (p->carcod)  xcar = *(carp++);
        if (p->modcod)  xmod = *(modp++);
        car = cps * xcar;
        mod = cps * xmod;
        ndx = *p->kndx * mod;
        minc = (long)(mod * sicvt);
        mphs &= PHMASK;
        fract = PFRAC(mphs);
        ftab = ftp->ftable + (mphs >>lobits);
        v1 = *ftab++;
        fmod = (v1 + (*ftab - v1) * fract) * ndx;
        mphs += minc;
        cfreq = car + fmod;
        cinc = (long)(cfreq * sicvt);
        cphs &= PHMASK;
        fract = PFRAC(cphs);
        ftab = ftp->ftable + (cphs >>lobits);
        v1 = *ftab++;
        *ar++ = (v1 + (*ftab - v1) * fract) * amp;
        cphs += cinc;
      }
      while (--nsmps);
    }
    else {
      cps = *p->kcps;
      car = cps * *carp;
      mod = cps * *modp;
      ndx = *p->kndx * mod;
      minc = (long)(mod * sicvt);
      do {
        mphs &= PHMASK;
        fract = PFRAC(mphs);
        ftab = ftp->ftable + (mphs >>lobits);
        v1 = *ftab++;
        fmod = (v1 + (*ftab - v1) * fract) * ndx;
        mphs += minc;
        cfreq = car + fmod;
        cinc = (long)(cfreq * sicvt);
        cphs &= PHMASK;
        fract = PFRAC(cphs);
        ftab = ftp->ftable + (cphs >>lobits);
        v1 = *ftab++;
        *ar++ = (v1 + (*ftab - v1) * fract) * amp;
        cphs += cinc;
      } while (--nsmps);
    }
    p->mphs = mphs;
    p->cphs = cphs;
}

void losset(LOSC *p)
{
    extern   FUNC   *ftnp2find(MYFLT*);       /* permit non-power-of-2 ftable (no masks) */
    FUNC   *ftp;

    if ((ftp = ftnp2find(p->ifn)) != NULL) {
      p->ftp = ftp;
      if (*p->ibas != FZERO)
        p->cpscvt = ftp->cvtbas / *p->ibas;
      else if ((p->cpscvt = ftp->cpscvt) == FZERO) {
        p->cpscvt = FL(261.62561); /* Middle C */
        warning(Str(X_1041,"no legal base frequency"));
        /* goto lerr1; */
      }
      if ((p->mod1 = (short)*p->imod1) < 0) {
        if ((p->mod1 = ftp->loopmode1) == 0)
          warning(Str(X_968,"locscil: sustain defers to non-looping source"));
        p->beg1 = ftp->begin1;
        p->end1 = ftp->end1;
      }
      else {
        p->beg1 = (long)*p->ibeg1;
        p->end1 = (long)*p->iend1; 
        if (p->mod1 < 0 || p->mod1 > 3
            || p->beg1 < 0 || p->end1 > ftp->flenfrms
            || p->beg1 >= p->end1)
          goto lerr2;
      }
      if ((p->mod2 = (short)*p->imod2) < 0) {
        p->mod2 = ftp->loopmode2;
        p->beg2 = ftp->begin2;
        p->end2 = ftp->end2;
      }
      else {
        p->beg2 = (long)*p->ibeg2;
        p->end2 = (long)*p->iend2;
        if (p->mod2 < 0 || p->mod2 > 3
            || p->beg2 < 0 || p->end2 > ftp->flenfrms
            || p->beg2 >= p->end2)
          goto lerr3;
      }
      if (!p->mod2 && !p->end2)         /* if no release looping */
        p->end2 = ftp->soundend;      /*   set a reading limit */
      p->beg1 <<= LOBITS;
      p->end1 <<= LOBITS;
      p->beg2 <<= LOBITS;
      p->end2 <<= LOBITS;
      p->lphs = 0;
      p->seg1 = 1;
      if ((p->curmod = p->mod1))
        p->looping = 1;
      else p->looping = 0;
      if (p->OUTOCOUNT == 1) {
        p->stereo = 0;
        if (ftp->nchnls != 1)
          initerror(Str(X_1007,"mono loscil cannot read from stereo ftable"));
      }
      else {
        p->stereo = 1;
        if (ftp->nchnls != 2)
          initerror(Str(X_1245,"stereo loscil cannot read from mono ftable"));
      }
    }
    return;
/*   lerr1: */
/*      initerror(Str(X_1041,"no legal base frequency")); */
/*      return; */
 lerr2:
    initerror(Str(X_888,"illegal sustain loop data"));
    return;
 lerr3:
    initerror(Str(X_879,"illegal release loop data"));
    return;
}

void loscil(LOSC *p)
{
        FUNC   *ftp;
        MYFLT  *ar1, *ftbl, *ftab, *xamp;
        long   phs, inc, beg, end;
        int    nsmps = ksmps, aamp;
        MYFLT  fract, v1, v2, *ar2;
extern  MYFLT  loscal;                /* 1. / LOFACT */

        ftp = p->ftp;
        ftbl = ftp->ftable;
        if ((inc = (long)(*p->kcps * p->cpscvt)) < 0)
            inc = -inc;
        xamp = p->xamp;
        aamp = (p->XINCODE) ? 1 : 0;
        if (p->seg1) {                      /* if still segment 1  */
            beg = p->beg1;
            end = p->end1;
            if (p->h.insdshead->relesing)   /*    sense note_off   */
                p->looping = 0;
        }
        else {
            beg = p->beg2;
            end = p->end2;
        }
        phs = p->lphs;
        ar1 = p->ar1;
        if (p->stereo) {
            ar2 = p->ar2;
            goto phsck2;
        }
phschk: if (phs >= end && p->curmod!=3) goto put0;
        switch(p->curmod) {
        case 0: do {
                    fract = (phs & LOMASK) * loscal;         /* NO LOOPING  */
                    ftab = ftbl + (phs >> LOBITS);
                    v1 = *ftab++;
                    *ar1++ = (v1 + (*ftab - v1) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end)
                        goto nxtseg;
                } while (--nsmps);
                break;
        case 1: do {
                    fract = (phs & LOMASK) * loscal;        /* NORMAL LOOPING */
                    ftab = ftbl + (phs >> LOBITS);
                    v1 = *ftab++;
                    *ar1++ = (v1 + (*ftab - v1) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end) {
                        if (!(p->looping)) goto nxtseg;
                         phs -= end - beg;
                    }
                } while (--nsmps);
                break;
        case 2:
         case2: do {
                    fract = (phs & LOMASK) * loscal;       /* BIDIR FORW, EVEN */
                    ftab = ftbl + (phs >> LOBITS);
                    v1 = *ftab++;
                    *ar1++ = (v1 + (*ftab - v1) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end) {
                        if (!(p->looping)) goto nxtseg;
                        phs -= (phs - end) * 2;
                        p->curmod = 3;
                        if (--nsmps) goto case3;
                        else break;
                    }
                } while (--nsmps);
                break;
        case 3:
         case3: do {
                    fract = (phs & LOMASK) * loscal;      /* BIDIR BACK, EVEN */
                    ftab = ftbl + (phs >> LOBITS);
                    v1 = *ftab++;
                    *ar1++ = (v1 + (*ftab - v1) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs -= inc) < beg) {
                        phs += (beg - phs) * 2;
                        p->curmod = 2;
                        if (--nsmps) goto case2;
                        else break;
                    }
                } while (--nsmps);
                break;

        nxtseg: if (p->seg1) {
                    p->seg1 = 0;
                    if ((p->curmod = p->mod2) != 0)
                        p->looping = 1;
                    if (--nsmps) {
                        beg = p->beg2;
                        end = p->end2;
                        p->lphs = phs;
                        goto phschk;
                    }
                    break;
                }
                if (--nsmps) goto phsout;
                break;
        }
        p->lphs = phs;
        return;

phsout: p->lphs = phs;
put0:   do *ar1++ = FZERO;
        while (--nsmps);
        return;

phsck2: if (phs >= end && p->curmod != 3) goto put0s;        /* for STEREO:  */
        switch(p->curmod) {
        case 0: do {
                    fract = (phs & LOMASK) * loscal;         /* NO LOOPING  */
                    ftab = ftbl + ((phs >> LOBITS) << 1);
                    v1 = *ftab++;
                    v2 = *ftab++;
                    *ar1++ = (v1 + (*ftab++ - v1) * fract) * *xamp;
                    *ar2++ = (v2 + (*ftab   - v2) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end)
                        goto nxtseg2;
                } while (--nsmps);
                break;
        case 1: do {
                    fract = (phs & LOMASK) * loscal;        /* NORMAL LOOPING */
                    ftab = ftbl + ((phs >> LOBITS) << 1);
                    v1 = *ftab++;
                    v2 = *ftab++;
                    *ar1++ = (v1 + (*ftab++ - v1) * fract) * *xamp;
                    *ar2++ = (v2 + (*ftab   - v2) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end) {
                        if (!(p->looping)) goto nxtseg2;
                         phs -= end - beg;
                    }
                } while (--nsmps);
                break;
        case 2:
         case2s: do {
                    fract = (phs & LOMASK) * loscal;       /* BIDIR FORW, EVEN */
                    ftab = ftbl + ((phs >> LOBITS) << 1);
                    v1 = *ftab++;
                    v2 = *ftab++;
                    *ar1++ = (v1 + (*ftab++ - v1) * fract) * *xamp;
                    *ar2++ = (v2 + (*ftab   - v2) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs += inc) >= end) {
                        if (!(p->looping)) goto nxtseg2;
                        phs -= (phs - end) * 2;
                        p->curmod = 3;
                        if (--nsmps) goto case3s;
                        else break;
                    }
                } while (--nsmps);
                break;
        case 3:
         case3s: do {
                    fract = (phs & LOMASK) * loscal;      /* BIDIR BACK, EVEN */
                    ftab = ftbl + ((phs >> LOBITS) << 1);
                    v1 = *ftab++;
                    v2 = *ftab++;
                    *ar1++ = (v1 + (*ftab++ - v1) * fract) * *xamp;
                    *ar2++ = (v2 + (*ftab   - v2) * fract) * *xamp;
                    if (aamp)  xamp++;
                    if ((phs -= inc) < beg) {
                        phs += (beg - phs) * 2;
                        p->curmod = 2;
                        if (--nsmps) goto case2s;
                        else break;
                    }
                } while (--nsmps);
                break;

        nxtseg2:if (p->seg1) {
                    p->seg1 = 0;
                    if ((p->curmod = p->mod2) != 0)
                        p->looping = 1;
                    if (--nsmps) {
                        beg = p->beg2;
                        end = p->end2;
                        p->lphs = phs;
                        goto phsck2;
                    }
                    break;
                }
                if (--nsmps) goto phsout2;
                break;
        }
        p->lphs = phs;
        return;

phsout2:p->lphs = phs;
put0s:  do {
             *ar1++ = FZERO;
             *ar2++ = FZERO;
        } while (--nsmps);
}

void loscil3(LOSC *p)
{
        FUNC   *ftp;
        MYFLT  *ar1, *ftbl, *xamp;
        long   phs, inc, beg, end;
        int    nsmps = ksmps, aamp;
        MYFLT  fract, *ar2;
extern  MYFLT  loscal;                /* 1. / LOFACT */
        int     x0;
        MYFLT   y0, y1, ym1, y2;

        ftp = p->ftp;
        ftbl = ftp->ftable;
        if ((inc = (long)(*p->kcps * p->cpscvt)) < 0)
            inc = -inc;
        xamp = p->xamp;
        aamp = (p->XINCODE) ? 1 : 0;
        if (p->seg1) {                      /* if still segment 1  */
            beg = p->beg1;
            end = p->end1;
            if (p->h.insdshead->relesing)   /*    sense note_off   */
                p->looping = 0;
        }
        else {
            beg = p->beg2;
            end = p->end2;
        }
        phs = p->lphs;
        ar1 = p->ar1;
        if (p->stereo) {
            ar2 = p->ar2;
            goto phsck2;
        }
phschk: if (phs >= end && p->curmod != 3) goto put0;
        switch(p->curmod) {
        case 0:
          do {
            fract = (phs & LOMASK) * loscal;         /* NO LOOPING  */
            x0 = (phs >> LOBITS);
            x0--;
            if (x0<0) {
              ym1 = ftbl[ftp->flen-2]; x0 = 0;
            }
            else ym1 = ftbl[x0++];
            y0 = ftbl[x0++];
            y1 = ftbl[x0++];
            if (x0>ftp->flen) y2 = ftbl[1]; else y2 = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end)
              goto nxtseg;
          } while (--nsmps);
          break;
        case 1:
          do {
            fract = (phs & LOMASK) * loscal;        /* NORMAL LOOPING */
            x0 = (phs >> LOBITS);
            x0--;
            if (x0<0) {
              ym1 = ftbl[ftp->flen-2]; x0 = 0;
            }
            else ym1 = ftbl[x0++];
            y0 = ftbl[x0++];
            y1 = ftbl[x0++];
            if (x0>ftp->flen) y2 = ftbl[1]; else y2 = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp *(y0 + FL(0.5)*frcu +
                               fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                               frsq*fract*(t1/6 - FL(0.5)*y1) +
                               frsq*(FL(0.5)* y1 - y0));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end) {
              if (!(p->looping)) goto nxtseg;
              phs -= end - beg;
            }
          } while (--nsmps);
          break;
        case 2:
         case2:
          do {
            fract = (phs & LOMASK) * loscal;       /* BIDIR FORW, EVEN */
            x0 = (phs >> LOBITS);
            x0--;
            if (x0<0) {
              ym1 = ftbl[ftp->flen-2]; x0 = 0;
            }
            else ym1 = ftbl[x0++];
            y0 = ftbl[x0++];
            y1 = ftbl[x0++];
            if (x0>ftp->flen) y2 = ftbl[1]; else y2 = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end) {
              if (!(p->looping)) goto nxtseg;
              phs -= (phs - end) * 2;
              p->curmod = 3;
              if (--nsmps) goto case3;
              else break;
            }
          } while (--nsmps);
          break;
        case 3:
        case3:
          do {
            fract = (phs & LOMASK) * loscal;      /* BIDIR BACK, EVEN */
            x0 = (phs >> LOBITS);
            x0--;
            if (x0<0) {
              ym1 = ftbl[ftp->flen-2]; x0 = 0;
            }
            else ym1 = ftbl[x0++];
            y0 = ftbl[x0++];
            y1 = ftbl[x0++];
            if (x0>ftp->flen) y2 = ftbl[1]; else y2 = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
            }
            if (aamp)  xamp++;
            if ((phs -= inc) < beg) {
              phs += (beg - phs) * 2;
              p->curmod = 2;
              if (--nsmps) goto case2;
              else break;
            }
          } while (--nsmps);
          break;
          
        nxtseg: if (p->seg1) {
                    p->seg1 = 0;
                    if ((p->curmod = p->mod2) != 0)
                        p->looping = 1;
                    if (--nsmps) {
                        beg = p->beg2;
                        end = p->end2;
                        p->lphs = phs;
                        goto phschk;
                    }
                    break;
                }
                if (--nsmps) goto phsout;
                break;
        }
        p->lphs = phs;
        return;
        
 phsout:
        p->lphs = phs;
 put0:
        do *ar1++ = FZERO;
        while (--nsmps);
        return;
        
 phsck2:
        if (phs >= end && p->curmod != 3) goto put0s; /* for STEREO:  */
        switch(p->curmod) {
        case 0:
          do {
            MYFLT ym1r, y0r, y1r, y2r;
            fract = (phs & LOMASK) * loscal;         /* NO LOOPING  */
            x0 = (phs >> LOBITS) << 1;
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            x0--; if (x0<0) x0 = 0;
            x0--; if (x0<0) x0 = 0;
            ym1 = ftbl[x0++]; ym1r = ftbl[x0++];
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y1 = ftbl[x0++]; y1r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y2 = ftbl[x0++]; y2r = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp *(y0 + FL(0.5)*frcu +
                               fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                               frsq*fract*(t1/6 - FL(0.5)*y1) +
                               frsq*(FL(0.5)* y1 - y0));
              frcu = frsq*ym1r;
              t1 = y2r + 3*y0r;
              *ar2++ = *xamp *(y0r + FL(0.5)*frcu +
                               fract*(y1r - frcu/6 - t1/6 - ym1r/3) +
                               frsq*fract*(t1/6 - FL(0.5)*y1r) +
                               frsq*(FL(0.5)* y1r - y0r));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end)
              goto nxtseg2;
          } while (--nsmps);
          break;
        case 1:
          do {
            MYFLT ym1r, y0r, y1r, y2r;
            fract = (phs & LOMASK) * loscal;        /* NORMAL LOOPING */
            x0 = (phs >> LOBITS) << 1;
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            x0--; if (x0<0) x0 = 0;
            x0--; if (x0<0) x0 = 0;
            ym1 = ftbl[x0++]; ym1r = ftbl[x0++];
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y1 = ftbl[x0++]; y1r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y2 = ftbl[x0++]; y2r = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
              frcu = frsq*ym1r;
              t1 = y2r + 3*y0r;
              *ar2++ = *xamp * (y0r + FL(0.5)*frcu +
                                fract*(y1r - frcu/6 - t1/6 - ym1r/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1r) +
                                frsq*(FL(0.5)* y1r - y0r));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end) {
              if (!(p->looping)) goto nxtseg2;
              phs -= end - beg;
            }
          } while (--nsmps);
          break;
        case 2:
        case2s:
          do {
            MYFLT ym1r, y0r, y1r, y2r;
            fract = (phs & LOMASK) * loscal;       /* BIDIR FORW, EVEN */
            x0 = (phs >> LOBITS) << 1;
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            x0--; if (x0<0) x0 = 0;
            x0--; if (x0<0) x0 = 0;
            ym1 = ftbl[x0++]; ym1r = ftbl[x0++];
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y1 = ftbl[x0++]; y1r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y2 = ftbl[x0++]; y2r = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
              frcu = frsq*ym1r;
              t1 = y2r + 3*y0r;
              *ar2++ = *xamp * (y0r + FL(0.5)*frcu +
                                fract*(y1r - frcu/6 - t1/6 - ym1r/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1r) +
                                frsq*(FL(0.5)* y1r - y0r));
            }
            if (aamp)  xamp++;
            if ((phs += inc) >= end) {
              if (!(p->looping)) goto nxtseg2;
              phs -= (phs - end) * 2;
              p->curmod = 3;
              if (--nsmps) goto case3s;
              else break;
            }
          } while (--nsmps);
          break;
        case 3:
        case3s:
          do {
            MYFLT ym1r, y0r, y1r, y2r;
            fract = (phs & LOMASK) * loscal;      /* BIDIR BACK, EVEN */
            x0 = (phs >> LOBITS) << 1;
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            x0--; if (x0<0) x0 = 0;
            x0--; if (x0<0) x0 = 0;
            ym1 = ftbl[x0++]; ym1r = ftbl[x0++];
            y0 = ftbl[x0++]; y0r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y1 = ftbl[x0++]; y1r = ftbl[x0++];
            if (x0>ftp->flen) x0 = 2;
            y2 = ftbl[x0++]; y2r = ftbl[x0];
            {
              MYFLT frsq = fract*fract;
              MYFLT frcu = frsq*ym1;
              MYFLT t1 = y2 + 3*y0;
              *ar1++ = *xamp * (y0 + FL(0.5)*frcu +
                                fract*(y1 - frcu/6 - t1/6 - ym1/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1) +
                                frsq*(FL(0.5)* y1 - y0));
              frcu = frsq*ym1r;
              t1 = y2r + 3*y0r;
              *ar2++ = *xamp * (y0r + FL(0.5)*frcu +
                                fract*(y1r - frcu/6 - t1/6 - ym1r/3) +
                                frsq*fract*(t1/6 - FL(0.5)*y1r) +
                                frsq*(FL(0.5)* y1r - y0r));
            }
            if (aamp)  xamp++;
            if ((phs -= inc) < beg) {
              phs += (beg - phs) * 2;
              p->curmod = 2;
              if (--nsmps) goto case2s;
              else break;
            }
          } while (--nsmps);
          break;

        nxtseg2:if (p->seg1) {
                    p->seg1 = 0;
                    if ((p->curmod = p->mod2) != 0)
                        p->looping = 1;
                    if (--nsmps) {
                        beg = p->beg2;
                        end = p->end2;
                        p->lphs = phs;
                        goto phsck2;
                    }
                    break;
                }
                if (--nsmps) goto phsout2;
                break;
        }
        p->lphs = phs;
        return;

phsout2:p->lphs = phs;
put0s:  do {
             *ar1++ = FZERO;
             *ar2++ = FZERO;
        } while (--nsmps);
}


#define ISINSIZ 32768L
#define ADMASK  32767L
        
static MYFLT sinsizdsr;       /* ISINSIZ / esr */
static MYFLT mkdkr;           /* 1024000 / ekr */

void adset(ADSYN *p)
{
        long    n;
        char    filnam[MAXNAME];
        MEMFIL  *mfp;
        short  *adp, *endata, val;
        PTLPTR *ptlap, *ptlfp, *ptlim;
        int	size;
	long	filno;

        if (isintab == NULL) {          /* if no sin table yet, make one */
                short *ip;
                isintab = ip = (short *) mmalloc((long)ISINSIZ * sizeof(short));
                for (n = 0; n < ISINSIZ; n++)
                        *ip++ = (short) (sin(TWOPI * n / ISINSIZ) * 32767.);
                sinsizdsr = ISINSIZ * onedsr;
                mkdkr = FL(1024000.0) * onedkr;     /*  & set local consts */
        }
        if (*p->ifilcod == sstrcod) { /* if char string name given */
          extern EVTBLK *currevent;
          extern char *unquote(char *name);
          if (p->STRARG == NULL) strcpy(filnam,unquote(currevent->strarg));
          else strcpy(filnam, unquote(p->STRARG));
        }
	else if ((filno = (long)*p->ifilcod) < strsmax && strsets != NULL &&
		 strsets[filno])
	  strcpy(filnam, strsets[filno]);
        else sprintf(filnam,"adsyn.%ld",filno);/* else adsyn.filnum */
        if ((mfp = p->mfp) == NULL || strcmp(mfp->filename,filnam) != 0) {
            if ((mfp = ldmemfile(filnam)) == NULL) {    /*   readfile if reqd */
                sprintf(errmsg,Str(X_185,"ADSYN cannot load %s"),filnam);
                goto adserr;
            }
            p->mfp = mfp;                               /*   & record         */
        }

        adp = (short *) mfp->beginp;                    /* align on file data */
        endata = (short *) mfp->endp;
        size = 1+(*adp == -1 ? MAXPTLS : *adp++); /* Old no header -> MAXPIL */
        if (p->aux.auxp==NULL || p->aux.size < (long)sizeof(PTLPTR)*size)
          auxalloc(sizeof(PTLPTR)*size, &p->aux);

        ptlap = ptlfp = (PTLPTR*)p->aux.auxp;   /* find base ptl blk */
        ptlim = ptlap + size;
        printf(Str(X_1138,"ptlap = %p ptlim=%p\n"), ptlap, ptlim);
        do if ((val = *adp++) < 0) {            /* then for each brkpt set,   */
                switch (val) {
                case -1: ptlap->nxtp = ptlap + 1;       /* chain the ptl blks */
		         if ((ptlap = ptlap->nxtp) >= ptlim) goto adsful;
                         ptlap->ap = (DUPLE *) adp;     /*  record start amp  */
                         ptlap->amp = ptlap->ap->val;
                         break;                 
                case -2: if ((ptlfp += 1) >= ptlim) goto adsful;
                         ptlfp->fp = (DUPLE *) adp;     /*  record start frq  */
                         ptlfp->frq = ptlfp->fp->val;
                         ptlfp->phs = 0;                /*  and clr the phase */
                         break;
                default: sprintf(errmsg,Str(X_842,"illegal code %d encountered"),val);
                         goto adserr;
                }
        } while (adp < endata);
        if (ptlap != ptlfp) {
                sprintf(errmsg,Str(X_31,"%d amp tracks, %d freq tracks"),
                        ptlap - (PTLPTR*)p->aux.auxp - 1,
                        ptlfp - (PTLPTR*)p->aux.auxp - 1);
                goto adserr;
        }
        ptlap->nxtp = NULL;   /* terminate the chain */
        p->mksecs = 0;
	
        return;

adsful: sprintf(errmsg,Str(X_1119,"partial count exceeds MAXPTLS"));
adserr: initerror(errmsg);
}

void adsyn(ADSYN *p)
{
        PTLPTR  *curp, *prvp;
        DUPLE   *ap, *fp;
        short   curtim, diff, ktogo;
        long   phs, sinc, *sp, amp;
        int    nsmps;
        MYFLT  *ar;
        MYFLT   ampscale, frqscale;
        long    timkincr, nxtim;

        if (isintab==NULL) {    /* RWD fix */
          initerror(Str(X_585,"adsyn: not initialized"));
          return;
        }
        ampscale = *p->kamod * dv32768;            /* (since 15-bit sine table) */
        frqscale = *p->kfmod * sinsizdsr;
        timkincr = (long)(*p->ksmod * mkdkr);      /* 1024 * msecs of analysis  */
        sp = (long *) p->rslt;                     /* use out array for sums */
        nsmps = ksmps;
        do  *sp++ = 0;                             /* cleared first to zero */
        while (--nsmps);
        curtim = (short)(p->mksecs >> 10);         /* cvt mksecs to msecs */
        curp = (PTLPTR*)p->aux.auxp;               /* now for each partial:    */
        while((prvp = curp) && (curp = curp->nxtp) != NULL ) {
            ap = curp->ap;
            fp = curp->fp;
            while (curtim >= (ap+1)->tim)       /* timealign ap, fp */
                curp->ap = ap += 1;
            while (curtim >= (fp+1)->tim)
                curp->fp = fp += 1;
            if ((amp = curp->amp)) {            /* for non-zero amp   */
                sinc = (long)(curp->frq * frqscale);
                phs = curp->phs;
                sp = (long *) p->rslt;   
                nsmps = ksmps;                  /*   addin a sinusoid */
                do {
                    *sp++ += *(isintab + phs) * amp;
                    phs += sinc;
                    phs &= ADMASK;
                }
                while (--nsmps);        
                curp->phs = phs;
            }
            if ((nxtim = (ap+1)->tim) == 32767) {   /* if last amp this partial */
                prvp->nxtp = curp->nxtp;            /*   remov from activ chain */
                curp = prvp;
            }
            else {                                 /* else interp towds nxt amp */
                if ((diff = (short)((ap+1)->val - amp))) {
                    ktogo = (short)(((nxtim<<10) - p->mksecs + timkincr - 1) / timkincr);
                    curp->amp += diff / ktogo;
                }
                if ((nxtim = (fp+1)->tim) != 32767            /*      & nxt frq */
                  && (diff = (fp+1)->val - curp->frq)) {
                    ktogo = (short)(((nxtim<<10) - p->mksecs + timkincr - 1) / timkincr);
                    curp->frq += diff / ktogo;
                }
            }
        }
        p->mksecs += timkincr;                  /* advance the time */
        ar = p->rslt;
        sp = (long *) ar;
        nsmps = ksmps;
        do  *ar++ = *sp++ * ampscale;           /* float & scale the results */
        while (--nsmps);
}

