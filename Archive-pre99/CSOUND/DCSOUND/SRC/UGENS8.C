#include "cs.h"   /*      UGENS8.C        */
#include <math.h>
#include "dsputil.h"
#include "fft.h"
#include "pvoc.h"
#include "pvocext.h"
#include "ugens8.h"
#include "soundio.h"
#include "oload.h"

/******************************************/
/* Originated by Dan Ellis, MIT */
/* Spectral Extraction and Amplitude Gating */
/* added by Richard Karpen, University */
/* of Washington, Seattle 1998 */
/******************************************/


#define WLN   1         /* time window is WLN*2*ksmps long */

#define OPWLEN (2*WLN*ksmps)    /* manifest used for final time wdw */

extern  MYFLT   esr, ekr, sicvt, kicvt, dv32768;
extern  int     ksmps;

void pvset(PVOC *p)
{
    int      i;
    long     memsize;
    char     pvfilnam[MAXNAME];
    MEMFIL   *mfp, *ldmemfile();
    PVSTRUCT *pvh;
    int      frInc, chans, size; /* THESE SHOULD BE SAVED IN PVOC STRUCT */
    FUNC     *AmpGateFunc;


   /* if (*p->ifilno == sstrcod) */                        /* if strg name given */
    /*      strcpy(pvfilnam, p->STRARG); */                   /*   use that         */
	if (*p->ifilno == sstrcod) {/*gab B1*/ /* if char string name given */
		extern EVTBLK *currevent; /*gab B1*/
		extern char *unquote(char *name);
		if (p->STRARG == NULL) strcpy(pvfilnam,unquote(currevent->strarg)); /*gab B1*/
		else strcpy(pvfilnam, unquote(p->STRARG));
	} 
    else if ((long)*p->ifilno < strsmax && strsets != NULL &&
	     strsets[(long)*p->ifilno])
      strcpy(pvfilnam, strsets[(long)*p->ifilno]);
    else sprintf(pvfilnam,"pvoc.%d", (int)*p->ifilno); /* else pvoc.filnum   */
    if ((mfp = p->mfp) == NULL
      || strcmp(mfp->filename, pvfilnam) != 0) /* if file not already readin */
        if ( (mfp = ldmemfile(pvfilnam)) == NULL) {
            sprintf(errmsg,Str(X_411,"PVOC cannot load %s"), pvfilnam);
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
    p->baseFr = 0;  /* point to first data frame */
    p->maxFr = -1 + ( pvh->dataBsize / (chans * (p->frSiz+2) * sizeof(MYFLT)));

     if(*p->imode == 1 || *p->imode == 2)
	memsize = (long)(PVDATASIZE + PVFFTSIZE*3 + PVWINLEN + 
			((p->frSiz+2L) * (p->maxFr+2)));
     else
	memsize = (long)(PVDATASIZE + PVFFTSIZE*3 + PVWINLEN);

    if (p->auxch.auxp == NULL || memsize != p->mems) {
        register MYFLT *fltp;
        auxalloc((memsize * sizeof(MYFLT)), &p->auxch);
        fltp = (MYFLT *) p->auxch.auxp;
        p->lastPhase = fltp;   fltp += PVDATASIZE;    /* and insert addresses */
        p->fftBuf = fltp;      fltp += PVFFTSIZE;
        p->dsBuf = fltp;       fltp += PVFFTSIZE;
        p->outBuf = fltp;      fltp += PVFFTSIZE;
        p->window = fltp;
        if(*p->imode == 1 || *p->imode == 2) {
        	fltp += PVWINLEN;
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
        sprintf(errmsg,Str(X_1359,"unsupported PVOC data format %ld in %s"),
                pvh->dataFormat, pvfilnam);
        goto pverr;
    }
    if (p->frSiz > PVFRAMSIZE) {
        sprintf(errmsg,Str(X_413,"PVOC frame %d bigger than %ld in %s"),
                p->frSiz, PVFRAMSIZE, pvfilnam);
        goto pverr;
    }
    //if (p->frSiz < 128) { /* gab C4 conditions cancellation */
    //    sprintf(errmsg,Str(X_414,"PVOC frame %ld seems too small in %s"),
    //            p->frSiz, pvfilnam);
    //    goto pverr;
    //}
    if (chans != 1) {
        sprintf(errmsg,Str(X_32,"%d chans (not 1) in PVOC file %s"),
                chans, pvfilnam);
        goto pverr;
    }


    frInc    = pvh->frameIncr;
    p->frPktim = ((MYFLT)ksmps)/((MYFLT)frInc);
    /* factor by which to mult expand phase diffs (ratio of samp spacings) */
    p->frPrtim = esr/((MYFLT)frInc);
    /* factor by which to mulitply 'real' time index to get frame index */
    size = pvfrsiz(p);          /* size used in def of OPWLEN ? */
/*  p->scale = 4.*((MYFLT)ksmps)/((MYFLT)pvfrsiz(p)*(MYFLT)pvfrsiz(p)); */
/*    p->scale = 2.*((MYFLT)ksmps)/((MYFLT)OPWLEN*(MYFLT)pvfrsiz(p));   */
    p->scale = FL(32768.0)*FL(2.0)*((MYFLT)ksmps)/((MYFLT)OPWLEN*(MYFLT)pvfrsiz(p));
    /* 2*incr/OPWLEN scales down for win ovlp, windo'd 1ce (but 2ce?) */
    /* 1/frSiz is the required scale down before (i)FFT */
    p->prFlg = 1;    /* true */
    p->opBpos = 0;
    p->lastPex = FL(1.0);       /* needs to know last pitchexp to update phase */
    /* Set up time window */
    for (i=0; i < pvdasiz(p); ++i) {  /* or maybe pvdasiz(p) */
     /* p->window[i] = (0.54-0.46*cos(TWOPI*(MYFLT)i/(MYFLT)(pvfrsiz(p)))); */
        p->lastPhase[i] = FL(0.0);
    }
    if( (OPWLEN/2 + 1)>PVWINLEN ) {
        sprintf(errmsg, Str(X_960,"ksmps of %d needs wdw of %d, max is %d for pv %s\n"),
                ksmps, (OPWLEN/2 + 1), PVWINLEN, pvfilnam);
        goto pverr;
    }
    
    if(*p->igatefun > 0)
      if ((AmpGateFunc = ftfind(p->igatefun)) == NULL)
        return;
    p->AmpGateFunc = AmpGateFunc;
  
    if(*p->igatefun > 0)
      p->PvMaxAmp = PvocMaxAmp(p->frPtr, size, p->maxFr);

    if(*p->imode == 1 || *p->imode == 2) {
      SpectralExtract(p->frPtr, p->pvcopy, size, p->maxFr,
                      (int)*p->imode, *p->ifreqlim);
      p->frPtr = p->pvcopy; 
    }

    for (i=0; i < OPWLEN/2+1; ++i)    /* time window is OPWLEN long */
        p->window[i] = (FL(0.54)-FL(0.46)*(MYFLT)cos(TWOPI*(double)i/(double)OPWLEN));
    /* NB : HAMMING */
    for(i=0; i< pvfrsiz(p); ++i)
        p->outBuf[i] = FL(0.0);
    MakeSinc( /* p->sncTab */ );        /* sinctab is same for all instances */
    p->plut = (MYFLT *)AssignBasis(NULL, pvfrsiz(p));    /* SET UP NONET FFT */

    return;

 pverr:
    initerror(errmsg);
}
#define pdebug (1)

void pvoc(PVOC *p)
{
    MYFLT  *ar = p->rslt;
    MYFLT  frIndx;
    MYFLT  *buf = p->fftBuf;
    MYFLT  *buf2 = p->dsBuf;
    MYFLT  *plut = p->plut;
    int    asize = pvdasiz(p);  /* new */
    int    size = pvfrsiz(p);
    int    buf2Size, outlen;
    int    circBufSize = PVFFTSIZE;
    int    specwp = (int)*p->ispecwp;   /* spectral warping flag */
    MYFLT  pex;


    if (p->auxch.auxp==NULL) {
      initerror(Str(X_1147,"pvoc: not initialized"));
      return;
    }
/*      if (pdebug) { printf("<%7.4f>",*p->ktimpnt); fflush(stdout); } */
    pex = *p->kfmod;
    outlen = (int)(((MYFLT)size)/pex);
    /* use outlen to check window/krate/transpose combinations */ /* gab C4 conditions cancellation */
    // if (outlen>PVFFTSIZE) {  /* Maximum transposition down is one octave */
    //                          /* ..so we won't run into buf2Size problems */
    //   perferror(Str(X_418,"PVOC transpose too low"));
    //   return;
    // }
    // if (outlen<2*ksmps) {    /* minimum post-squeeze windowlength */
    //   perferror(Str(X_417,"PVOC transpose too high"));
    //   return;
    // }
    buf2Size = OPWLEN;       /* always window to same length after DS */
    if ((frIndx = *p->ktimpnt * p->frPrtim) < 0) {
      perferror(Str(X_416,"PVOC timpnt < 0"));
      return;
    }
    if (frIndx > p->maxFr) {  /* not past last one */
      frIndx = (MYFLT)p->maxFr;
      if (p->prFlg) {
        p->prFlg = 0;   /* false */
        warning(Str(X_415,"PVOC ktimpnt truncated to last frame"));
      }
    }
    FetchIn(p->frPtr,buf,size,frIndx);
    
    if(*p->igatefun > 0)
    	PvAmpGate(buf,size, p->AmpGateFunc, p->PvMaxAmp);
    	
    FrqToPhase(buf, asize, pex*(MYFLT)ksmps, p->asr,
           /*a0.0*/FL(0.5) * ( (pex / p->lastPex) - FL(1.0)) );
    /* Offset the phase to align centres of stretched windows, not starts */
    RewrapPhase(buf, asize, p->lastPhase);

    if (specwp>0) PreWarpSpec(buf, asize, pex); 

    Polar2Rect(buf, asize);
    buf[1] = FL(0.0); buf[size+1] = FL(0.0);    /* kill spurious imag at dc & fs/2 */
    FFT2torl((complex *)buf,size,1,/*a pex*/ p->scale, (complex *)plut);
    /* CALL TO NONET FFT */
    PackReals(buf, size);
    if (pex != FL(1.0))
      UDSample(buf,(FL(0.5)*((MYFLT)size - pex*(MYFLT)buf2Size))/*a*/,
               buf2, size, buf2Size, pex);
    else
      CopySamps(buf+(int)(FL(0.5)*((MYFLT)size - pex*(MYFLT)buf2Size))/*a*/,
                buf2,buf2Size);
    ApplyHalfWin(buf2, p->window, buf2Size); 
    addToCircBuf(buf2, p->outBuf, p->opBpos, ksmps, circBufSize);
    writeClrFromCircBuf(p->outBuf, ar, p->opBpos, ksmps, circBufSize);
    p->opBpos += ksmps;
    if (p->opBpos > circBufSize)     p->opBpos -= circBufSize;
    addToCircBuf(buf2+ksmps,p->outBuf,p->opBpos,buf2Size-ksmps,circBufSize);
    p->lastPex = pex;        /* needs to know last pitchexp to update phase */
}


