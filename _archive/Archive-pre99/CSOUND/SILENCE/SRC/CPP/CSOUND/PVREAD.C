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

/*RWD 10:9:2000 read pvocex file format */
#include "pvfileio.h"
static int pvocex_loadfile(const char *fname,PVREAD *p,MEMFIL **mfp);
extern int find_memfile(const char *fname,MEMFIL **pp_mfp);
extern void add_memfil(MEMFIL *mfp);

#define WLN   1         /* time window is WLN*2*ksmps long */
#define OPWLEN (2*WLN*ksmps)    /* manifest used for final time wdw */

extern  MYFLT   esr;
extern  int     ksmps;
extern  char    errmsg[];
extern  int     odebug;


void FetchInOne(
    MYFLT   *inp,       /* pointer to input data */
    MYFLT   *buf,       /* where to put our nice mag/pha pairs */
    long    fsize,      /* frame size we're working with */
    MYFLT   pos,        /* fractional frame we want */
    long    mybin)
{
    MYFLT   *frm0,*frm1;
    long    base;
    MYFLT   frac;
    long    twmybin = mybin+mybin; /* Always used thus */

    /***** WITHOUT INFO ON WHERE LAST FRAME IS, MAY 'INTERP' BEYOND IT ****/
    base = (long)pos;               /* index of basis frame of interpolation */
    frac = ((MYFLT)(pos - (MYFLT)base));
    /* & how close to get to next */
    frm0 = inp + ((long)fsize+2L)*base;
    frm1 = frm0 + ((long)fsize+2L);         /* addresses of both frames */
    if (frac != 0.0) {          /* must have 2 cases to avoid poss seg vlns */
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
    int     frInc, chans, size; /* THESE SHOULD BE SAVED IN PVOC STRUCT */

    if (*p->ifilno == sstrcod)                         /* if strg name given */
        strcpy(pvfilnam, unquote(p->STRARG));          /*   use that         */
    else if ((long)*p->ifilno <= strsmax && strsets != NULL &&
             strsets[(long)*p->ifilno])
      strcpy(pvfilnam, strsets[(long)*p->ifilno]);
    else sprintf(pvfilnam,"pvoc.%d", (int)*p->ifilno); /* else pvoc.filnum   */
    if ((mfp = p->mfp) == NULL
      || strcmp(mfp->filename, pvfilnam) != 0) { /* if file not already readin */
      /* RWD: try for pvocex first */
      if (pvocex_loadfile(pvfilnam,p,&mfp))     {   /* got it */
        p->mfp = mfp;
        return;
      }
      if ( (mfp = ldmemfile(pvfilnam)) == NULL) {
        sprintf(errmsg,Str(X_419,"PVREAD cannot load %s"), pvfilnam);
        goto pverr;
      }
    }
    else
    /* need to check format again here */
      if (pvocex_loadfile(pvfilnam,p,&mfp)) {
        /* handles all config settings */
        p->mfp = mfp;
        return;
      }
    /* only old-format stuff from here */
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
    size = pvfrsiz(p);          /* size used in def of OPWLEN ? */
    p->prFlg = 1;    /* true */
    p->mybin = (long)(*p->ibin-FL(1.0));

    return;
pverr:  initerror(errmsg);
}

void pvread(PVREAD *p)
{
    MYFLT  frIndx;
    MYFLT  *buf = (MYFLT*)(p->fftBuf.auxp);
/*           int      asize = pvdasiz(p); */ /* fix */
    int    size = pvfrsiz(p);

/*     if (pdebug) { printf("<%7.4f>",*p->ktimpnt); fflush(stdout); } */

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
    FetchInOne(p->frPtr,buf,size,frIndx, p->mybin);
    *p->kfreq = buf[1];
    *p->kamp = buf[0];
 }


/* PVOCEX read into memory */
/* NB!!!! there are two separate structures to read into:
        PVOC, and PVREAD.  This is PVREAD version.
 */
/* convert pvocex data into amp+freq format Csound expects. Later, we can load
 * the stipulated window too... */
/* generic read error messages in pvfileio.c */
/* NB no death here on read failure, only on memory failure */

int pvocex_loadfile(const char *fname,PVREAD *p,MEMFIL **mfp)
{
    PVOCDATA pvdata;
    WAVEFORMATEX fmt;
    MEMFIL *mfil = NULL;
    int i,j,rc=0,pvx_id = -1;
    long pvx_fftsize;
    long mem_wanted = 0;
    long totalframes,framelen;
    float *memblock = NULL;
    float cs_ampfac;               /* needs to be overlapsamps */
    float *pFrame;

    pvx_id = pvoc_openfile(fname,&pvdata,&fmt);
    if (pvx_id < 0)
      return 0;

    /* fft size must be <= PVFRAMSIZE (=8192) for Csound */
    pvx_fftsize = 2 * (pvdata.nAnalysisBins-1);
    framelen = 2 * pvdata.nAnalysisBins;
    if (pvx_fftsize > PVFRAMSIZE) {
      sprintf(errmsg,"pvoc-ex file %s: FFT size %d too large for Csound\n",fname,pvx_fftsize);
      return 0;
    }

    /* have to reject m/c files for now, until opcodes upgraded*/
    if (fmt.nChannels > 1) {
      sprintf(errmsg,"pvoc-ex file %s is not mono\n",fname);
      return 0;
    }

    /* also, accept only 32bit floats for now */
    if (pvdata.wWordFormat == PVOC_IEEE_FLOAT) {
      sprintf(errmsg,"pvoc-ex file %s is not 32bit floats\n",fname);
      return 0;
    }

    /* FOR NOW, accept only PVOC_AMP_FREQ : later, we can convert */
    /* NB Csound knows no other: frameFormat is not read anywhere! */
    if (pvdata.wAnalFormat != PVOC_AMP_FREQ) {
      sprintf(errmsg,"pvoc-ex file %s not in AMP_FREQ format\n",fname);
      return 0;
    }
    /* ignore the window spec until we can use it! */
    totalframes = pvoc_framecount(pvx_id);

    if (totalframes == 0) {
      sprintf(errmsg,"pvoc-ex file %s is empty!\n",fname);
      return 0;
    }
    if (!find_memfile(fname,&mfil)) {
      mem_wanted = totalframes * 2 * pvdata.nAnalysisBins * sizeof(float);
      /* try for the big block first! */
      memblock = (float *) mmalloc(mem_wanted);
      if (p->fftBuf.auxp  == NULL) /* Allocate space dynamically */
        auxalloc(sizeof(MYFLT)*PVFFTSIZE, &p->fftBuf);

      /* fill'er-up */
      /* need to loop, as we need to rescale amplitudes for Csound */
      /* still not sure this is right, yet...what about effect of double-window ? */
      cs_ampfac = (float ) (pvdata.dwOverlap * ((float)(framelen-2) /(float) pvdata.dwWinlen)) ;
      pFrame = memblock;
      for (i=0;i < totalframes;i++) {
        rc = pvoc_getframes(pvx_id,pFrame,1);
        if (rc != 1)
          break;                /* read error, but may still have something to use */
        /* scale amps */
        for(j=0;j < framelen; j+=2)
          pFrame[j] *= cs_ampfac;
        pFrame += framelen;
      }
      pvoc_closefile(pvx_id);
      if (rc <0) {
        sprintf(errmsg,"error reading pvoc-ex file %s\n",fname);
        mfree(memblock);
        mfree(p->fftBuf.auxp);
        return 0;
      }
      if (i < totalframes) {
        sprintf(errmsg,"error reading pvoc-ex file %s after %d frames\n",fname,i);
        mfree(memblock);
        mfree(p->fftBuf.auxp);
        return 0;
      }
    }
    else
      memblock = (float *) mfil->beginp;

    if ((p->asr = (MYFLT) fmt.nSamplesPerSec) != esr) { /* & chk the data */
      sprintf(errmsg,Str(X_63,"%s''s srate = %8.0f, orch's srate = %8.0f"),
              fname, p->asr, esr);
      warning(errmsg);
    }
    p->frSiz = pvx_fftsize;
    p->frPtr = (MYFLT *) memblock;
    p->baseFr = 0;  /* point to first data frame */
    p->maxFr = totalframes - 1;

    /* highest possible frame index */
    /* factor by which to mult expand phase diffs (ratio of samp spacings) */

    p->frPrtim = esr/((MYFLT) pvdata.dwOverlap);
    /*size = pvfrsiz(p);*/              /* size used in def of OPWLEN ? */
    p->prFlg = 1;    /* true */
    p->mybin = (long)(*p->ibin-1.0f);


    /* Need to assign the MEMFIL to p->mfp in calling func */
    if (mfil==NULL) {
      mfil = (MEMFIL *)  mmalloc(sizeof(MEMFIL));
      /* just hope the filename is short enough...! */
      mfil->next = NULL;
      mfil->filename[0] = '\0';
      strcpy(mfil->filename,fname);
      mfil->beginp = (char *) memblock;
      mfil->endp = mfil->beginp + mem_wanted;
      mfil->length = mem_wanted;
      /*from memfiles.c */
      printf(Str(X_764,"file %s (%ld bytes) loaded into memory\n"), fname,mem_wanted);
      add_memfil(mfil);
    }
    *mfp = mfil;
    return 1;
}
