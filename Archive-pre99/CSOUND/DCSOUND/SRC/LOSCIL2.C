/* derived by loscil by Gabriel Maldonado */
#include "cs.h"                 /*                              LOSCIL2.C        */
#include "ugens3.h"
#include <math.h>

static MYFLT    fzero = 0.;

void losset2(LOSC *p)
{
extern   FUNC   *ftnp2find(MYFLT*);       /* permit non-power-of-2 ftable (no masks) */
register FUNC   *ftp;

        if ((ftp = ftnp2find(p->ifn)) != NULL) {
                p->ftp = ftp;
                if (*p->ibas != fzero)
                    p->cpscvt = ftp->cvtbas / *p->ibas;
                else if ((p->cpscvt = ftp->cpscvt) == fzero)
                    goto lerr1;
                if ((p->mod1 = (short) *p->imod1) < 0) {
                    if ((p->mod1 = ftp->loopmode1) == 0)
                        warning("locscil: sustain defers to non-looping source");
                    p->beg1 = ftp->begin1;
                    p->end1 = ftp->end1; 
                }
                else {
                    p->beg1 = (long) *p->ibeg1;
                    p->end1 = (long) *p->iend1;
                    if (p->mod1 < 0 || p->mod1 > 3
                     || p->beg1 < 0 || p->end1 > ftp->flenfrms
                     || p->beg1 >= p->end1)
                        goto lerr2;
                }
                if ((p->mod2 = (short) *p->imod2) < 0) {
                    p->mod2 = ftp->loopmode2;
                    p->beg2 = ftp->begin2;
                    p->end2 = ftp->end2;
                }
                else {
                    p->beg2 = (long) *p->ibeg2;
                    p->end2 = (long) *p->iend2;
                    if (p->mod2 < 0 || p->mod2 > 3
                     || p->beg2 < 0 || p->end2 > ftp->flenfrms
                     || p->beg2 >= p->end2)
                        goto lerr3;
                }
                if (!p->mod2 && !p->end2)         /* if no release looping */
                    p->end2 = ftp->soundend;      /*   set a reading limit */
                p->beg1 <<= LOBITS;
                p->end1 <<= LOBITS;
				/*p->end1--;*/

                p->beg2 <<= LOBITS;
                p->end2 <<= LOBITS;
				/*p->end2--;*/
                p->lphs = 0;
                p->seg1 = 1;
                if ((p->curmod = p->mod1))
                    p->looping = 1;
                else p->looping = 0;
                if (p->OUTOCOUNT == 1) {
                    p->stereo = 0;
                    if (ftp->nchnls != 1)
                        initerror("mono loscil cannot read from stereo ftable");
                }
                else {
                    p->stereo = 1;
                    if (ftp->nchnls != 2)
                        initerror("stereo loscil cannot read from mono ftable");
                }
        }
        return;
 lerr1: initerror("no legal base frequency");
        return;
 lerr2: initerror("illegal sustain loop data");
        return;
 lerr3: initerror("illegal release loop data");
        return;
}

void loscil2(LOSC *p)
{
         FUNC   *ftp;
	MYFLT  *ar1,  *xamp;
	short  *ftbl, *ftab;	/*gab*/
	long   phs, inc, beg, end;
	int    nsmps = ksmps, aamp;
    MYFLT  fract, v1, v2, *ar2;
	extern   MYFLT  loscal;                /* 1. / LOFACT */

        ftp = p->ftp;
        ftbl = (short *) ftp->ftable; /*gab*/
        if ((inc = (long) (*p->kcps * p->cpscvt)) < 0)
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
			/*beg >>= 1; end >>= 1;*/	 /* gab-A3 */
            goto phsck2;
        }
phschk: if (phs >= end) goto put0;
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
put0:   do *ar1++ = fzero;
        while (--nsmps);
        return;

phsck2: if (phs >= end) goto put0s;            /* for STEREO:  */
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
             *ar1++ = fzero;
             *ar2++ = fzero;
        } while (--nsmps);
}
