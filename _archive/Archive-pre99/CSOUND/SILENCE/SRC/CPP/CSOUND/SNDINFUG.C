/* sndinfUG.c         -matt 7/25/99
             ugens to retrieve info about a sound file */

#include "cs.h"
#include "soundio.h"
#include "sndinfUG.h"
#include "oload.h" /* for strset */
#include "pvoc.h"
#include "pvfileio.h"
int anal_filelen(SNDINFO *p,MYFLT *p_length);

extern  char    *retfilnam;
extern  HEADATA *readheader(int, char *, SOUNDIN*);

HEADATA *getsndinfo(SNDINFO *p)
{
    HEADATA *hdr = NULL;
    int     sinfd = 0;
    SOUNDIN *sp;
    char    *sfname, soundiname[128];
    long filno;

    if (*p->ifilno == sstrcod) { /* if char string name given */
      extern EVTBLK *currevent;
      if (p->STRARG == NULL)
        strcpy(soundiname,unquote(currevent->strarg));
      else
        strcpy(soundiname,unquote(p->STRARG));    /* unquote it,  else use */
    }
    else if ((filno=(long)*p->ifilno) <= strsmax && strsets != NULL &&
             strsets[filno])
      strcpy(soundiname, strsets[filno]);
    else
      sprintf(soundiname,"soundin.%ld",filno);  /* soundin.filno */

    sfname = soundiname;
    if ((sinfd = openin(sfname)) < 0) {     /* open with full dir paths */
      if (isfullpath(sfname))
        sprintf(errmsg,Str(X_1463,"diskinfo cannot open %s"), sfname);
      else
        sprintf(errmsg,Str(X_1464,
                           "diskinfo cannot find \"%s\" in its search paths"),
                sfname);
     /* RWD 5:2001 better to exit in this situation ! */
      die(errmsg);
    }

    sfname = retfilnam;                        /* & record fullpath filnam */

    /****** if headerblk returned ******/
    sp = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
    hdr=readheader(sinfd,sfname, sp);
    if (hdr == NULL || hdr->audsize <= 0)
      hdr->audsize = (long)lseek(sinfd,(off_t)0L,SEEK_END); /* use file length */

    mfree((char *)sp);
    close(sinfd);               /* init error:  close any open file */

    return hdr;
}

void filelen(SNDINFO *p)
{
    HEADATA *hdr = NULL;
    long readlong;
    MYFLT dur = FL(0.0);        /*RWD 8:2001 */

    if (anal_filelen(p,&dur)) {
      *(p->r1) = dur;
      return;
    }
    /* RWD 8:2001 now set to quit on failure, else we have bad hdr */
    else if ((hdr = getsndinfo(p)) != NULL
             && !(readlong = hdr->readlong)) { /* & hadn't readin audio */
      *(p->r1) = (MYFLT)hdr->audsize / hdr->sampsize / hdr->nchnls / hdr->sr;
    }
    else {
      short bytes = 1;
      warning(Str(X_1455,
                  "No valid header.  Calculating length "
                  "using output file's format"));
      /*RWD 5:2001 which I think is a very bad idea... */
      switch(O.outformat) {
      case AE_UNCH:
      case AE_CHAR:
      case AE_ALAW:
      case AE_ULAW:
        bytes = 1;
        break;
      case AE_SHORT:
        bytes = 2;
        break;
      case AE_LONG:
        bytes = 4;
        break;
      case AE_FLOAT:
        bytes = 4;
        break;
      case AE_24INT:   /*RWD 5:2001*/
        bytes = 3;
        break;
      break;
      }
      /* RWD 5:2001: bug lurking if hdr == NULL; rely on getsndinfo to have quit! */
      *(p->r1) = hdr->audsize / bytes / nchnls /  esr;
    }
}

void filenchnls(SNDINFO *p)
{
    HEADATA *hdr = NULL;
    long readlong;

    if ((hdr = getsndinfo(p)) != NULL
        && !(readlong = hdr->readlong)) {         /* & hadn't readin audio */
      *(p->r1) = (MYFLT)hdr->nchnls;
    }
    else {
      warning(Str(X_1456,"No valid header.  Returning output nchnls"));
      *(p->r1) = (MYFLT)nchnls;
    }
}

void filesr(SNDINFO *p)
{
    HEADATA *hdr = NULL;
    long readlong;

    if ((hdr = getsndinfo(p)) != NULL
        && !(readlong = hdr->readlong)) {         /* & hadn't readin audio */
      *(p->r1) = (MYFLT)hdr->sr;
    }
    else {
      warning(Str(X_1457,"No valid header.  Returning orch's sr"));
      *(p->r1) = esr;
    }
}


/*RWD 8:2001: now supports all relevant files, and scans overall peak properly */

void filepeak(SNDINFOPEAK *p)
{
    HEADATA *hdr = NULL;
    long readlong;
    int i;

    if ((hdr = getsndinfo((SNDINFO *)p)) != NULL
        && !(readlong = hdr->readlong)) {         /* & hadn't readin audio */
      if (*p->channel > hdr->nchnls)
        die(Str(X_1458,
                "Input channel for peak exceeds number of channels in file"));

      if (hdr->filetyp == TYP_AIFC || hdr->filetyp == TYP_AIFF ||
          hdr->filetyp == TYP_WAV) { /* assume maxamps are there, (this is bad) */
        /* channel '0' is the overall maxamps */
        /* *p->r1 = hdr->aiffdata->maxamps[(int)(*(p->channel))];*/
        /*RWD*/
        if (hdr->peaksvalid) {
          if (*p->channel==0) {
            float maxamp = 0.0f;
            /* get overall maxamp */
            for(i=0;i < hdr->nchnls;i++)
              if (maxamp < hdr->peaks[i].value) maxamp = hdr->peaks[i].value;
            *p->r1 = maxamp;
          }
          else
            *p->r1 = hdr->peaks[(int)(*(p->channel))-1].value;
        }
      }
      else { /* ## should we have an option to calculate peaks? */
        die("No peak information contained in the header of this file");
      }
    }
    else {
      /* RWD: we ought to be able to recover, in this situation ?
         e.g return -1, which can be trapped in the orc. */
      die(Str(X_1459,"No valid header.  Cannot calculate peak values"));
    }
}



/* RWD 8:2001 support analysis files in filelen opcode  */

int anal_filelen(SNDINFO *p,MYFLT *p_dur)
{
    char    *sfname, soundiname[256];
    long filno;
    int fd;
    FILE *fp;
    PVOCDATA pvdata;
    WAVEFORMATEX fmt;
    MYFLT nframes,nchans,srate,overlap,arate,dur;

    /* leap thru std hoops to get the name */
    if (*p->ifilno == sstrcod) { /* if char string name given */
      extern EVTBLK *currevent;
      if (p->STRARG == NULL)
        strcpy(soundiname,unquote(currevent->strarg));
      else
        strcpy(soundiname,unquote(p->STRARG));    /* unquote it,  else use */
    }
    else if ((filno=(long)*p->ifilno) <= strsmax && strsets != NULL &&
             strsets[filno])
      strcpy(soundiname, strsets[filno]);
    else
      sprintf(soundiname,"soundin.%ld",filno);  /* soundin.filno */

    sfname = soundiname;

    /* my prerogative: try pvocex file first! */
    fd = pvoc_openfile(sfname,&pvdata,&fmt);
    if (fd >= 0) {
      nframes   = (MYFLT) pvoc_framecount(fd);
      nchans    = (MYFLT) fmt.nChannels;
      srate     = (MYFLT) fmt.nSamplesPerSec;
      overlap   = (MYFLT) pvdata.dwOverlap;
      arate     = srate /  overlap;
      dur       = (nframes / nchans) / arate;
      *p_dur    = dur;
      pvoc_closefile(fd);
      return 1;
    }
    /* then try old soon-to-die pvoc format */
    fp = fopen(sfname,"rb");
    if (fp) {
      PVSTRUCT hdr;
      int ok = PVReadHdr(fp, &hdr);
      if (ok== PVE_OK){
        MYFLT frsiz;
        srate   = (MYFLT) hdr.samplingRate;
        nchans  = (MYFLT) hdr.channels;
        overlap = (MYFLT) hdr.frameIncr;
        frsiz   = (MYFLT) (hdr.frameSize + 2);
        /* just assume PVMYFLT format for now... */
        nframes = (MYFLT) (hdr.dataBsize / (nchans * frsiz * sizeof(float)));
        arate   = srate /  overlap;
        dur             = (nframes / nchans) / arate;
        *p_dur  = dur;
        fclose(fp);
        return 1;
      }
    }
    return 0;
}
