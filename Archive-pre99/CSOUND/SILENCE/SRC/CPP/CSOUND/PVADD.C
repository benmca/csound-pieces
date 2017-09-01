/******************************************/
/* The applications in this file were     */
/* designed and coded by Richard Karpen   */
/* University of Washington, Seattle 1998 */
/******************************************/
/*    PVADD.C        */

#include "cs.h"
#include <math.h>
#include "dsputil.h"
#include "pvoc.h"
#include "pvocext.h"
#include "pvadd.h"
#include "oload.h"

extern  MYFLT   esr;
extern  int     ksmps;


/* This is used in pvadd instead of the Fetch() from dsputil.c */
void FetchInForAdd(MYFLT *inp, MYFLT *buf, long fsize,
                MYFLT  pos, int binoffset, int maxbin, int binincr)
{
    long    j;
    MYFLT   *frm0,*frm1;
    long    base;
    MYFLT   frac;

    base = (long)pos;
    frac = ((MYFLT)(pos - (MYFLT)base));
    /* & how close to get to next */
    frm0 = inp + ((long)fsize+2L)*base;
    frm1 = frm0 + ((long)fsize+2L);
    if (frac != FL(0.0)) {
        for(j = binoffset; j < maxbin; j+=binincr) {
            buf[2L*j] = frm0[2L*j] + frac*(frm1[2L*j]-frm0[2L*j]);
            buf[2L*j+1L] = frm0[2L*j+1L]
                        + frac*(frm1[2L*j+1L]-frm0[2L*j+1L]);
            }
        }
    else
        {
        for(j = binoffset; j < maxbin; j+=binincr) {
           buf[2L*j] = frm0[2L*j];
           buf[2L*j+1] = frm0[2L*j+1L];
           }
        }
}

void pvaddset(PVADD *p)
{
    int      i, ibins;
    char     pvfilnam[MAXNAME];
    PVSTRUCT *pvh;
    int     frInc, chans, size;
    MEMFIL   *mfp, *ldmemfile(char *);
    FUNC *ftp, *AmpGateFunc;
    MYFLT *oscphase;
    long   memsize;

   if(*p->ifn > 0)
        if ((ftp = ftfind(p->ifn)) == NULL)
                return;
   p->ftp = ftp;

   if(*p->igatefun > 0)
        if ((AmpGateFunc = ftfind(p->igatefun)) == NULL)
                return;
    p->AmpGateFunc = AmpGateFunc;

    if (*p->ifilno == sstrcod) {                         /* if strg name given */
      extern EVTBLK *currevent;
      extern char *unquote(char *name);
      if (p->STRARG == NULL) strcpy(pvfilnam,unquote(currevent->strarg));
      else strcpy(pvfilnam, unquote(p->STRARG));
    }
    else if ((long)*p->ifilno <= strsmax && strsets != NULL &&
             strsets[(long)*p->ifilno])
      strcpy(pvfilnam, strsets[(long)*p->ifilno]);
    else sprintf(pvfilnam,"pvoc.%d", (int)*p->ifilno);
    if ((mfp = p->mfp) == NULL
      || strcmp(mfp->filename, pvfilnam) != 0)
        if ( (mfp = ldmemfile(pvfilnam)) == NULL) {
            sprintf(errmsg,Str(X_408,"PVADD cannot load %s"), pvfilnam);
            goto pverr;
        }

    pvh = (PVSTRUCT *)mfp->beginp;
    if (pvh->magic != PVMAGIC) {
        sprintf(errmsg,Str(X_60,"%s not a PVOC file (magic %ld)"),
                pvfilnam, pvh->magic );
        goto pverr;
        }

    chans    = pvh->channels;
    p->frSiz = pvh->frameSize;
    p->frPtr = (MYFLT *) ((char *)pvh+pvh->headBsize);
    p->maxFr = -1 + ( pvh->dataBsize / (chans * (p->frSiz+2) * sizeof(MYFLT)));

    if(*p->imode == 1 || *p->imode == 2)
        memsize = (long)(MAXBINS+PVFFTSIZE+PVFFTSIZE +
                ((p->frSiz+2L) * (p->maxFr+2)));
    else
        memsize = (long)(MAXBINS+PVFFTSIZE+PVFFTSIZE);

    if (p->auxch.auxp == NULL || memsize != p->mems) {
        register MYFLT *fltp;
        auxalloc((memsize * sizeof(MYFLT)), &p->auxch);
        fltp = (MYFLT *) p->auxch.auxp;
        p->oscphase = fltp;      fltp += MAXBINS;
        p->buf = fltp;
        if(*p->imode == 1 || *p->imode == 2) {
                fltp += PVFFTSIZE * 2;
                p->pvcopy = fltp;
                }
        }
    p->mems=memsize;

    if ((p->asr = pvh->samplingRate) != esr) { /* & chk the data */
        sprintf(errmsg,Str(X_63,"%s''s srate = %8.0f, orch's srate = %8.0f"),
                pvfilnam, p->asr, esr);
        warning(errmsg);
        }
    if (pvh->dataFormat != PVMYFLT) {
        sprintf(errmsg,Str(X_1358,"unsupported PV data format %ld in %s"),
                pvh->dataFormat, pvfilnam);
        goto pverr;
        }
    if (p->frSiz > PVFRAMSIZE) {
        sprintf(errmsg,Str(X_406,"PV frame %d bigger than %ld in %s"),
                p->frSiz, PVFRAMSIZE, pvfilnam);
        goto pverr;
        }
    if (p->frSiz < 128) {
        sprintf(errmsg,Str(X_407,"PV frame %ld seems too small in %s"),
                p->frSiz, pvfilnam);
        goto pverr;
        }
    if (chans != 1) {
        sprintf(errmsg,Str(X_32,"%d chans (not 1) in PVOC file %s"),
                chans, pvfilnam);
        goto pverr;
        }

    frInc    = pvh->frameIncr;
    p->frPrtim = esr/((MYFLT)frInc);
       /* factor by which to mulitply 'real' time index to get frame index */

    size = pvfrsiz(p);
    p->prFlg = 1;    /* true */


   if(*p->igatefun > 0)
        p->PvMaxAmp = PvocMaxAmp(p->frPtr,size, p->maxFr);

   if(*p->imode == 1 || *p->imode == 2) {
        SpectralExtract(p->frPtr, p->pvcopy, size, p->maxFr, (int)*p->imode, *p->ifreqlim);
        p->frPtr = (MYFLT *)p->pvcopy;
        }

    oscphase = p->oscphase;

    for(i=0; i < MAXBINS; i++)
                *oscphase++ = FL(0.0);

    ibins = (*p->ibins==0 ? size/2 : (int)*p->ibins);
    p->maxbin = ibins + (int)*p->ibinoffset;
    p->maxbin = (p->maxbin > size/2 ? size/2 : p->maxbin);
    /*  printf("maxbin=%d\n", p->maxbin); fflush(stdout); */

     return;

pverr:  initerror(errmsg);
}

void pvadd(PVADD *p)
{
    MYFLT  *ar, *ftab;
    MYFLT frIndx;
    int    size = pvfrsiz(p);
    int i, binincr=(int)*p->ibinincr,  nsmps=ksmps;
    MYFLT amp, v1, fract, *oscphase;
    long phase, incr;
    FUNC *ftp;
    long lobits;
    int mode = (int)*p->imode;


 if (p->auxch.auxp==NULL) {
      initerror(Str(X_1140,"pvadd: not initialised"));
      return;
    }

    ftp = p->ftp;
    if (ftp==NULL) {
          initerror(Str(X_1140,"pvadd: not initialised"));
          return;
     }

    if ((frIndx = *p->ktimpnt * p->frPrtim) < 0)
        {
        perferror(Str(X_410,"PVADD timpnt < 0"));
        return;
        }
    if (frIndx > p->maxFr)  /* not past last one */
        {
        frIndx = (MYFLT)p->maxFr;
        if (p->prFlg)
            {
            p->prFlg = 0;   /* false */
            warning(Str(X_409,"PVADD ktimpnt truncated to last frame"));
            }
        }
    FetchInForAdd(p->frPtr,p->buf, size, frIndx,
                (int)*p->ibinoffset, p->maxbin, binincr);

    if(*p->igatefun > 0)
        PvAmpGate(p->buf,p->maxbin*2, p->AmpGateFunc, p->PvMaxAmp);

    ar = p->rslt;
    for (i=0; i<nsmps; i++) *ar++ = FL(0.0);
    oscphase = p->oscphase;
    for(i = (int)*p->ibinoffset; i < p->maxbin; i+=binincr) {
      lobits = ftp->lobits;
      nsmps = ksmps;
      ar = p->rslt;
      phase = (long)*oscphase;
      if(p->buf[i*2+1] == 0 || p->buf[i*2+i] == p->asr*.5)
        amp = FL(0.0);
      else {
        incr=(long)(p->buf[i*2+1] * *p->kfmod * sicvt);
        amp=p->buf[i*2];
       }
      do {
                fract = PFRAC(phase);
                ftab = ftp->ftable + (phase >> lobits);
                v1 = *ftab++;
                *ar += (v1 + (*ftab - v1) * fract) * amp;
                 ar++;
                phase += incr;
                phase &= PHMASK;
         } while (--nsmps);
      *oscphase = (MYFLT)phase;
      oscphase++;
   }
}




