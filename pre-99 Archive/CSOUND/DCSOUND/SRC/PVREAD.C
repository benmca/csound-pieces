/**************************************************************/
/***********pvread, **************************/
/*** By Richard Karpen - July-October 1992************/
/************************************************************/
#include "cs.h"		
#include "dsputil.h"
#include "fft.h"
#include "pvoc.h"
#include "pvread.h"
#include "soundio.h"
#include <math.h>
#include "oload.h"

#define WLN   1		/* time window is WLN*2*ksmps long */
#define OPWLEN (2*WLN*ksmps)	/* manifest used for final time wdw */

extern	MYFLT	esr;
extern	int	ksmps;
extern	char	errmsg[];
extern  int     odebug;


void FetchInOne(
    MYFLT   *inp,	/* pointer to input data */
    MYFLT   *buf,	/* where to put our nice mag/pha pairs */
    long    fsize,	/* frame size we're working with */
    MYFLT   pos,	/* fractional frame we want */
    long    mybin)
{
    MYFLT   *frm0,*frm1;
    long    base;
    MYFLT   frac;
    long    twmybin = mybin+mybin; /* Always used thus */

    /***** WITHOUT INFO ON WHERE LAST FRAME IS, MAY 'INTERP' BEYOND IT ****/
    base = (long)pos;		    /* index of basis frame of interpolation */
    frac = ((MYFLT)(pos - (MYFLT)base));
    /* & how close to get to next */
    frm0 = inp + ((long)fsize+2L)*base;
    frm1 = frm0 + ((long)fsize+2L);	    /* addresses of both frames */
    if (frac != 0.0) {		/* must have 2 cases to avoid poss seg vlns */
      				/* and failed computes, else may interp   */
		                /* bd valid data */
      buf[0] = frm0[twmybin] + frac*(frm1[twmybin]-frm0[twmybin]);
      buf[1L] = frm0[twmybin+1L] + frac*(frm1[twmybin+1L]-frm0[twmybin+1L]);
    }
    else {
      	/* frac is 0.0 i.e. just copy the source frame */
      buf[0] = frm0[twmybin];
      buf[1L] = frm0[twmybin+1L];
    } 
}


void pvreadset(PVREAD *p)
{
    char     pvfilnam[64];
    MEMFIL   *mfp, *ldmemfile(char*);
    PVSTRUCT *pvh;
    int     frInc, chans, size;	/* THESE SHOULD BE SAVED IN PVOC STRUCT */

    if (*p->ifilno == sstrcod)                         /* if strg name given */
        strcpy(pvfilnam, unquote(p->STRARG));          /*   use that         */
    else if ((long)*p->ifilno < strsmax && strsets != NULL &&
	     strsets[(long)*p->ifilno])
      strcpy(pvfilnam, strsets[(long)*p->ifilno]);
    else sprintf(pvfilnam,"pvoc.%d", (int)*p->ifilno); /* else pvoc.filnum   */
    if ((mfp = p->mfp) == NULL
      || strcmp(mfp->filename, pvfilnam) != 0) /* if file not already readin */
      if ( (mfp = ldmemfile(pvfilnam)) == NULL) {
	sprintf(errmsg,Str(X_419,"PVREAD cannot load %s"), pvfilnam);
	goto pverr;
      }
    if (p->fftBuf.auxp  == NULL) /* Allocate space dynamically */
      auxalloc(sizeof(MYFLT)*PVFFTSIZE, &p->fftBuf);
    pvh = (PVSTRUCT *)mfp->beginp;
    if (pvh->magic != PVMAGIC) {
	sprintf(errmsg,Str(X_60,"%s not a PVOC file (magic %ld)"), 
		pvfilnam, pvh->magic );
	goto pverr;
    }
    p->frSiz = pvh->frameSize;
    frInc    = pvh->frameIncr;
    chans    = pvh->channels;
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
    if (p->frSiz < 128) {
	sprintf(errmsg,Str(X_414,"PVOC frame %ld seems too small in %s"),
		p->frSiz, pvfilnam);
	goto pverr;
    }
    if (chans != 1) {
	sprintf(errmsg,Str(X_32,"%d chans (not 1) in PVOC file %s"),
	        chans, pvfilnam);
	goto pverr;
    }
    /* Check that pv->frSiz is a power of two too ? */
    p->frPtr = (MYFLT *) ((char *)pvh+pvh->headBsize);
    p->baseFr = 0;  /* point to first data frame */
    p->maxFr = -1 + (pvh->dataBsize / (chans * (p->frSiz+2) * sizeof(MYFLT)));
    /* highest possible frame index */
    /* factor by which to mult expand phase diffs (ratio of samp spacings) */
    p->frPrtim = esr/((MYFLT)frInc);
    size = pvfrsiz(p);		/* size used in def of OPWLEN ? */
    p->prFlg = 1;    /* true */
    p->mybin = (long)(*p->ibin-FL(1.0));

    return;
pverr:	initerror(errmsg);
}

void pvread(PVREAD *p)
{
    MYFLT  frIndx;
    MYFLT  *buf = (MYFLT*)(p->fftBuf.auxp);
/* 	     int      asize = pvdasiz(p); */ /* fix */
    int    size = pvfrsiz(p);

/*     if (pdebug) { printf("<%7.4f>",*p->ktimpnt); fflush(stdout); } */
	
    if ((frIndx = *p->ktimpnt * p->frPrtim) < 0)
      {
	perferror(Str(X_416,"PVOC timpnt < 0"));
	return;
      }
    if (frIndx > p->maxFr)  /* not past last one */
      {
	frIndx = (MYFLT)p->maxFr;
	if (p->prFlg)
	  {
	    p->prFlg = 0;   /* false */
	    warning(Str(X_415,"PVOC ktimpnt truncated to last frame"));
	  }
      }
    FetchInOne(p->frPtr,buf,size,frIndx, p->mybin);
    *p->kfreq = buf[1];
    *p->kamp = buf[0];
 }
 
 
