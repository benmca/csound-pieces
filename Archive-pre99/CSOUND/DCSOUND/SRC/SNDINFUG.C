/* sndinfUG.c         -matt 7/25/99 
             ugens to retrieve info about a sound file */

#include "cs.h"
#include "soundio.h"
#include "sndinfUG.h"
#include "oload.h" /* for strset */

extern  char    *retfilnam;
extern  HEADATA *readheader(int, char *, SOUNDIN*);

HEADATA *getsndinfo(SNDINFO *p)
{
/*    int     n; */
    HEADATA *hdr = NULL;
    int     sinfd = 0;
    SOUNDIN *sp;
/*    long readlong = 0; */
    char    *sfname, soundiname[128];
    long filno;
        
    if (*p->ifilno == sstrcod) { /* if char string name given */
      extern EVTBLK *currevent;
      if (p->STRARG == NULL) 
        strcpy(soundiname,unquote(currevent->strarg));
      else 
        strcpy(soundiname,unquote(p->STRARG));    /* unquote it,  else use */
    } 
    else if ((filno=(long)*p->ifilno) < strsmax && strsets != NULL &&
             strsets[filno])
      strcpy(soundiname, strsets[filno]);
    else 
      sprintf(soundiname,"soundin.%ld",filno);  /* soundin.filno */
    
    sfname = soundiname;
    if ((sinfd = openin(sfname)) < 0) {     /* open with full dir paths */
      if (isfullpath(sfname))
        sprintf(errmsg,Str(X_1463,"diskinfo cannot open %s"), sfname);
      else 
        sprintf(errmsg,Str(X_1464,"diskinfo can't find \"%s\" in its search paths"),
                sfname);
      return NULL;
    }
    
    sfname = retfilnam;                        /* & record fullpath filnam */

    /****** if headerblk returned ******/
    sp = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
    hdr=readheader(sinfd,sfname, sp);
    if (hdr == NULL || hdr->audsize <= 0)
      hdr->audsize =lseek(sinfd, 0L, SEEK_END);  /* use file length */
    
    mfree((char *)sp);
    close(sinfd);               /* init error:  close any open file */   
        
    return hdr;
}
        
void filelen(SNDINFO *p)
{
    HEADATA *hdr = NULL;
    long readlong;

    if ((hdr = getsndinfo(p)) != NULL
        && !(readlong = hdr->readlong)) { /* & hadn't readin audio */
      *(p->r1) = (MYFLT)hdr->audsize / hdr->sampsize / hdr->nchnls /  hdr->sr;
    }
    else {
      short bytes = 1;
      warning(Str(X_1455,"No valid header.  Calculating length using output file's format"));
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
      }
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


/* a temporary existence of peak - right now only looks at AIFC but, eventually
   this should be used instead with the PEAK chunk data of WAV/AIFF/AIFF_C 
   we could also provide an option to calculate the peak for files without (or with
   invalid) peak information */
void filepeak(SNDINFOPEAK *p)
{
    HEADATA *hdr = NULL;
    long readlong;
              
    if ((hdr = getsndinfo((SNDINFO *)p)) != NULL
        && !(readlong = hdr->readlong)) {         /* & hadn't readin audio */
      if (*p->channel > hdr->nchnls)
        die(Str(X_1458,"Input channel for peak exceeds number of channels in file"));
      
      if (hdr->filetyp == TYP_AIFC) { /* assume maxamps are there, (this is bad) */
        /* channel '0' is the overall maxamps */
        *p->r1 = hdr->aiffdata->maxamps[(int)(*(p->channel))];
      }
      else { /* ## should we have an option to calculate peaks? */
        die("No peak information contained in the header of this file");
      }
    }
    else {
      die(Str(X_1459,"No valid header.  Cannot calculate peak values"));
    }
}  
