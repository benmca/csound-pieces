/*               ugen developed by matt ingalls, ...            */
/*                                                              */
/*      diskin  -       a new soundin that shifts pitch         */
/*              based on the old soundin code                   */
#include "cs.h"
#include "soundio.h"
#include "diskin.h"
#include "oload.h" /* for strset */

/*RWD 3:2000 same as in soundin.c: should go somewhere common... */
#define INLONGFAC (1.0 / 65536.0)
#define INFLOATFAC (FL(32767.0))
/* RWD 5:2001 added 24 bit file support */
/* also: my attempt to fix bugs in diskin, unrelated to sample formats
 * specifically: negative pitch: fails to load block at very end of infile
 *               glitch when backwards read arrives at first block of infile - bad pointer calc
 *                               + ~possible~ bug using krate sig for transp - problems when this is zero?
 */


#ifdef _DEBUG
#include <assert.h>
#endif
/*RWD*/
#define DISKINHACK

extern  char    *retfilnam;
extern  HEADATA *readheader(int, char *, SOUNDIN*);
extern  void bytrev2(char*, int);
extern  void bytrev4(char*, int);
extern  char *getstrformat(int);
extern  int getsizformat(int);
extern  int bytrevhost(void);
extern  void sndwrterr(unsigned, unsigned);

/*RWD 5:2001 */
extern void bytrev3(char *,int);        /* in soundin.c */


static int sreadinew(           /* special handling of sound input       */
    int     infd,               /* to accomodate reads thru pipes & net  */
    char    *inbuf,             /* where nbytes rcvd can be < n requested*/
    int     nbytes,             /*                                       */
    SOUNDINEW *p)               /* extra arg passed for filetyp testing  */
{                               /* on POST-HEADER reads of audio samples */
    int    n, ntot=0;

    do
      if ((n = read(infd, inbuf+ntot, nbytes-ntot)) < 0)
        die(Str(X_1201,"soundfile read error"));
    while (n > 0 && (ntot += n) < nbytes);
    if (p->filetyp
#ifdef NeXT
        || 1
#endif
        ) {             /* for AIFF and WAV samples */
      if (p->filetyp == TYP_AIFF || p->filetyp == TYP_AIFC) {     /*RWD 3:2000*/
        if (p->audrem > 0) {      /* AIFF:                  */
          if (ntot > p->audrem)   /*   chk haven't exceeded */
            ntot = p->audrem;     /*   limit of audio data  */
          p->audrem -= ntot;
        }
        else ntot = 0;
      }
      if (ntot && p->bytrev != NULL)          /* for post-header of both */
        p->bytrev(inbuf, ntot);             /*   bytrev 2 or 4 as reqd */
    }
    /*RWD 3:2000 expanded format fixups ; more efficient here than in soundinew() ?
      (well, saves a LOT of typing!) */
    if (p->filetyp==TYP_WAV  ||
        p->filetyp==TYP_AIFF ||
        p->filetyp==TYP_AIFC) {
      if (p->format==AE_FLOAT) {
        int i,cnt;
        float scalefac = (float)INFLOATFAC;
        float *ptr = (float *) inbuf;

        if (p->do_floatscaling)
          scalefac *= p->fscalefac;
        cnt = ntot/sizeof(float);
        for (i=0; i<cnt; i++)
          *ptr++ *= scalefac;
      }
      else if (p->format==AE_LONG) {
        int i;
        int cnt = ntot/sizeof(long);
        long *ptr = (long*) inbuf;
        for (i=0; i<cnt; i++) {
          *ptr = (long) ((double) *ptr *  INLONGFAC);
          ptr++;
        }
      }
    }
    return(ntot);
}


static int sngetset(SOUNDINEW *p, char *sfname)
{
    HEADATA *hdr = NULL;
    int     sinfd = 0;
    SOUNDIN forReadHeader;
    long readlong = 0;

    if ((sinfd = openin(sfname)) < 0) {     /* open with full dir paths */
      if (isfullpath(sfname))
        sprintf(errmsg,Str(X_696,"diskin cannot open %s"), sfname);
      else
        sprintf(errmsg,Str(X_695,"diskin cannot find \"%s\" in its search paths"),
                sfname);
      goto errtn;
    }
    sfname = retfilnam;                        /* & record fullpath filnam */
    if ((p->format = (short)*p->iformat) > 0)  /* convert spec'd format code */
      p->format |= 0x100;

    p->endfile = 0;
    p->begfile = 0;
    p->filetyp = 0;             /* initially non-typed for readheader */

    /******* construct the SOUNDIN struct to use old readheader ***********/
    forReadHeader.filetyp = p->filetyp;
    forReadHeader.bytrev = p->bytrev;
    forReadHeader.audrem = p->audrem;

    /****** if headerblk returned ******/
    if ((hdr=readheader(sinfd,sfname,&forReadHeader)) != NULL
        && !(readlong = hdr->readlong)) {         /* & hadn't readin audio */
#ifdef never
      if (hdr->filetyp == TYP_AIFF                /*    chk the hdr codes  */
          && hdr->aiffdata != NULL
          && hdr->aiffdata->loopmode1 != 0        /* looping aiff:         */
          && (p->analonly || p->OUTOCOUNT))       /*     ok for gen01 only */
        warning(Str(X_586,"aiff looping file, once through only"));
#endif
      if (hdr->sr != esr) {                  /* non-anal:  cmp w. esr */
        sprintf(errmsg,Str(X_62,"%s sr = %ld, orch sr = %7.1f"),
                sfname, hdr->sr, esr);
        warning(errmsg);
      }

      if (hdr->nchnls != p->OUTOCOUNT) {        /*        chk nchnls */
        sprintf(errmsg,Str(X_58,"%s nchnls = %d, soundin reading as if nchnls = %d"),
                sfname, (int) hdr->nchnls, (int) p->OUTOCOUNT);
        warning(errmsg);
        hdr->nchnls = p->OUTOCOUNT;
      }

      if (p->format && hdr->format != p->format) {   /*    chk format */
        sprintf(errmsg,Str(X_694,"diskin %s superceded by %s header format %s"),
                getstrformat((int)p->format), sfname,
                getstrformat((int)hdr->format));
        warning(errmsg);
      }

      /***********  copy header data  *************/
          /*RWD 3:2000 copy scalefac stuff */
      p->do_floatscaling = forReadHeader.do_floatscaling;
      p->fscalefac = forReadHeader.fscalefac;

      switch ((p->format = (short)hdr->format)) {
      case AE_CHAR:   break;
      case AE_UNCH:   break;
      case AE_ULAW:   break;
      case AE_SHORT:  break;
      case AE_LONG:   break;
      case AE_FLOAT:  break;
      case AE_24INT:  break;            /*RWD 5:2001 */

      default: sprintf(errmsg,Str(X_52,"%s format %s not yet supported"),
                       sfname, getstrformat((int)p->format));
      goto errcls;
      }
      p->sampframsiz = (short)(hdr->sampsize * hdr->nchnls);
      p->filetyp = hdr->filetyp;
      p->aiffdata = hdr->aiffdata;
      p->sr = hdr->sr;
      p->nchnls = (short)hdr->nchnls;
      if (hdr->audsize > 0 )    /* given audiosize */
        p->audrem = p->audsize = hdr->audsize;
      else
        p->audrem = p->audsize  = -1;    /* else mark unknown */
    }
    /******* no hdr:  find info elsewhere *********/
    else {
      warning(Str(X_1062,"no soundin header, presuming orchestra sr"));
      p->sr = (long) esr;
      p->channel = p->OUTOCOUNT;

      if (!p->format) {         /* no format:                     */
        p->format = O.outformat; /*     orch defaults to outformat */
      }

      sprintf(errmsg,Str(X_55,"%s has no soundfile header, reading as %s, %d chnl%s"),
              sfname, getstrformat((int)p->format), (int)p->channel,
              p->channel == 1 ? "" : "s");
      warning(errmsg);

      p->sampframsiz = getsizformat((int)p->format) * p->channel;
      p->filetyp = 0;           /*  in_type cannot be AIFF or WAV */
      p->aiffdata = NULL;
      p->nchnls = p->channel;
      p->audrem = p->audsize  = -1;      /* mark unknown */
    }

    p->fdch.fd = sinfd;              /*     store & log the fd     */
    return(TRUE);

 errcls:
    close(sinfd);               /* init error:  close any open file */
 errtn:
    return(FALSE);           /*              return empty handed */
}


void newsndinset(SOUNDINEW *p)       /* init routine for diskin   */
{
/****************************************************
        revision history
        6/98                    -matt
                fixed headerless file defaults,
                allowed for reinits, and cleaned up code
        8/11/98                 -matt
                made backwards playback and 0 skiptime
                        set skiptime to end of file
        1/26/99                         -matt
                fixed bug when skiptime is default
*****************************************************/
    int     n;
    char    *sfname, soundiname[128];
    int     sinfd = 0;
    long    nbytes, filno;
    MYFLT   skiptime = *p->iskptim;

    /* RWD 5:2001 need this as var, change size to read 24bit data */
    /* should go in SOUNDINEW struct eventually */
    long snewbufsize = SNDINEWBUFSIZ;


    if (skiptime < 0)
    {
      warning(Str(X_1460,"negative skip time, substituting zero."));
      skiptime = FL(0.0);
    }

/* #####RWD: it is not safe to assume all compilers init this to 0 */
    if (p->fdch.fd != 0) {  /* if file already open, rtn */
      /*********** for reinits, we gotta do some stuff here ************/
      /* we get a crash if backwards and 0 skiptime, so lets set it to file
                        end instead..*/
      if (skiptime <= 0 && *p->ktransp < 0) {
        if (p->audsize > 0)
          skiptime = (MYFLT)p->audsize/(MYFLT)(p->sr * p->sampframsiz);
        else
          skiptime = FL(1.0)/(MYFLT)p->sr; /* one sample */
      }

      nbytes = (long)(skiptime * p->sr) * p->sampframsiz;
      if (nbytes > p->audrem) {
        warning(Str(X_1191,"skip time larger than audio data,substituting zero."));
        nbytes = 0;
      }

      p->endfile = 0;
      p->begfile = 0;

      if (nbytes > 0) {
        p->audrem = p->audsize-nbytes+p->firstsampinfile;
      }
      else {
        p->begfile = TRUE;
        if (*p->ktransp < 0)
          p->endfile = TRUE;
        p->audrem = -1;
      }

      /* set file pointer */
      if ((p->filepos =         /* seek to bndry */
           (long)lseek(p->fdch.fd, (off_t)(nbytes+p->firstsampinfile), SEEK_SET)) < 0)
        die(Str(X_698,"diskin seek error during reinit"));

      if ((n =                  /* now rd fulbuf */
           sreadinew(p->fdch.fd,p->inbuf,snewbufsize/*SNDINEWBUFSIZ*/,p)) == 0)  /*RWD 5:2001 */
        p->endfile = 1;

      p->inbufp = p->inbuf;
      p->bufend = p->inbuf + n;
      p->guardpt = p->bufend - p->sampframsiz;
      p->phs = 0.;

      return;
    }

    p->channel = ALLCHNLS;      /* reading all channels     */
    p->analonly = 0;

    /********  open the file  ***********/
    if ((n = p->OUTOCOUNT) && n != 1 && n != 2 && n != 4 &&
        n != 6 && n!= 8) {      /* if appl,chkchnls */
      sprintf(errmsg,Str(X_700,"diskin: illegal no of receiving channels"));
      goto errtn;
    }
    if (*p->ifilno == sstrcod) { /* if char string name given */
      extern EVTBLK *currevent;
      if (p->STRARG == NULL) strcpy(soundiname,unquote(currevent->strarg));
      else strcpy(soundiname,unquote(p->STRARG));    /* unquote it,  else use */
    }
    else if ((filno=(long)*p->ifilno) <= strsmax && strsets != NULL &&
             strsets[filno])
      strcpy(soundiname, strsets[filno]);
    else sprintf(soundiname,"soundin.%ld",filno);  /* soundin.filno */
    sfname = soundiname;
    if(!sngetset(p, sfname))
      return;
      sinfd  = p->fdch.fd;

    /*******  display messages ####possibly this be verbose mode only??? */
    printf(Str(X_604,"audio sr = %ld, "), p->sr);
    if (p->nchnls == 1)
      printf(Str(X_1006,"monaural\n"));
    else {
      printf(Str(X_64,"%s, reading "), p->nchnls == 2 ? Str(X_1246,"stereo") :
                             p->nchnls == 4 ? Str(X_1148,"quad") :
                             p->nchnls == 6 ? Str(X_830,"hex") : Str(X_1088,"oct") );
      if (p->channel == ALLCHNLS)
        printf(Str(X_51,"%s channels\n"), p->nchnls == 2 ? Str(X_619,"both") : Str(X_591,"all"));
      else printf(Str(X_655,"channel %d\n"), p->channel);
    }

        /********  handle byte reversals  *******/
    if (p->filetyp == TYP_AIFF && bytrevhost() ||
        p->filetyp == TYP_AIFC && bytrevhost() ||
#ifdef NeXT
        !p->filetyp && bytrevhost() ||
#endif
        p->filetyp == TYP_WAV && !bytrevhost()) {
      if (p->format == AE_SHORT)          /* if audio_in needs byte rev */
        p->bytrev = bytrev2;            /*     set on sample size       */
      else if (p->format == AE_LONG || p->format==AE_FLOAT)     /*RWD 3:2000*/
        p->bytrev = bytrev4;
      else if(p->format == AE_24INT) {  /*RWD 5:2001 */
        p->bytrev = bytrev3;
      }
      else p->bytrev = NULL;
#ifdef NeXT
        if (!p->filetyp) printf(Str(X_1095,"opening NeXT infile %s, with%s bytrev\n"),
                sfname, p->bytrev == NULL ? Str(X_21," no") : "");
        else
#endif
          printf(Str(X_1093,"opening %s infile %s, with%s bytrev\n"),
                 p->filetyp == TYP_AIFF ? "AIFF" : TYP_AIFC ? "AIFF-C" : "WAV",
                 sfname, p->bytrev == NULL ? Str(X_21," no") : "");
    }
    else
      p->bytrev = NULL;

    /*RWD 5:2001  */
    /* 24bit format: ~should~ calc for n-chans? */
    if(p->format == AE_24INT)
      snewbufsize = SNDINEWBUFSIZ_24;

    if (p->sampframsiz <= 0)    /* must know framsiz */
      die(Str(X_882,"illegal sampframsiz"));

    /*****  set file pointers, buffers, and diskin-specific stuff  ******/
    /* we get a crash if backwards and 0 skiptime, so lets set it to file
       end instead..*/
    if (skiptime <= 0 && *p->ktransp < 0) {
      if (p->audsize > 0)
        skiptime = (MYFLT)p->audsize/(MYFLT)(p->sr * p->sampframsiz);
      else
        skiptime = FL(1.0)/(MYFLT)p->sr; /* one sample */
    }

    nbytes = (long)(skiptime * p->sr) * p->sampframsiz;
                /*#### will this work for all header types??? */
    p->firstsampinfile = tell(sinfd);

    if ((p->audrem > 0) && (nbytes > p->audrem)) {
      warning(Str(X_1191,"skip time larger than audio data,substituting zero."));
      nbytes = 0;
    }

    if (nbytes > 0) {
      if (p->audsize > 0 )      /* change audsize   */
        p->audrem = p->audsize-nbytes+p->firstsampinfile;

      if ((p->filepos =         /* seek to bndry */
           (long)lseek(sinfd, (off_t)(nbytes+p->firstsampinfile), SEEK_SET)) < 0)
        die(Str(X_699,"diskin seek error: invalid skip time"));
    }
    else {
      p->begfile = TRUE;
      if (*p->ktransp < 0)
        p->endfile = TRUE;
    }

    if ((n =                    /* now rd fulbuf */
         sreadinew(sinfd,p->inbuf,snewbufsize,p)) == 0) /*RWD 5:2001 */
      p->endfile = 1;
    p->inbufp = p->inbuf;
    p->bufend = p->inbuf + n;

    /*****  if soundinset successful  ********/
    if (sinfd > 0) {
      fdrecord(&p->fdch);              /*     instr will close later */

      p->guardpt = p->bufend - p->sampframsiz;
      p->phs = 0.0;
      return;
    }
    else initerror(errmsg);
    return;

  errtn:  return;                  /*              return empty handed */
}


void soundinew(SOUNDINEW *p)    /*  a-rate routine for soundinew */
{
    MYFLT       *r1, *r2, *r3, *r4, ktransp,looping;
    int         chnsout, n, ntogo, bytesLeft;
    double      phs,phsFract,phsTrunc;
    char        *inbufp = p->inbufp;
    long snewbufsize = SNDINEWBUFSIZ;            /*RWD 5:2001 */
#ifdef DISKINHACK
    long oldfilepos;
#endif

#ifdef _DEBUG
    static long samplecount = 0;
    long tellpos;
    short *sbufp1,*sbufp2,*sbufp3;
#endif
    if(p->format == AE_24INT)
      snewbufsize = SNDINEWBUFSIZ_24;

    if ((!p->bufend) || (!p->inbufp) || (!p->sampframsiz)) {
      initerror(Str(X_701,"diskin: not initialised"));
      return;
    }
    r1      = p->r1;
    r2      = p->r2;
    r3      = p->r3;
    r4      = p->r4;
    ktransp = *p->ktransp;
    looping = *p->ilooping;
    chnsout = p->OUTOCOUNT;
    phs     = p->phs;
    ntogo   = ksmps;
    /*RWD 5:2001 need this when instr dur > filelen*/
    n = 0;
    /* RWD 5:2001 interesting issue - if ktransp starts at zero, we have no idea what direction to go in! */
    /* below, it was "if ktransp > 0", but the docs stipulate that only a negative transp signifies
     * backwards rendering, so really, ktransp=0 implies we go forwards */
#ifdef _DEBUG
    if(inbufp != p->bufend)
      assert(((p->bufend - inbufp) % p->sampframsiz)==0);
#endif
    if (ktransp >= 0 ) {        /* forwards... */
#ifdef DISKINHACK
/* RWD 5:2001 want to keep phase if reversing mid-data */
      if (phs < 0 && p->begfile)
#else
        if (phs < 0)
#endif
          phs = 0; /* we have just switched directions, forget (negative) old phase */
      if (p->endfile) {
        if (p->begfile) p->endfile = FALSE;
        else goto filend;
      }

      while (ntogo) {
        switch (chnsout) {      /* a lot of the following code has been "written out" for speed */
        case 1:
          phsFract = modf(phs,&phsTrunc);
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)(inbufp + 1) -
                                *(char *)inbufp) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)(inbufp + 1) -
                                *(unsigned char *)inbufp) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_SHORT:
#ifdef _DEBUG
            sbufp1 = (short *) p->inbuf;
            sbufp2 = (short *) inbufp;
#endif
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)(inbufp + 2) -
                                *(short *)inbufp) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
#ifdef _DEBUG
              samplecount++;
#endif
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)(inbufp + 4) -
                                *(long *)inbufp) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(MYFLT *)inbufp +
                               (*(MYFLT *)(inbufp + 4) -
                                *(MYFLT *)inbufp) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
            /*RWD 5:2001*/
          case AE_24INT:
            {
              SAMP24 s24_first,s24_next;
              MYFLT first,next;
              char *ptr;

              s24_first.lsamp = s24_next.lsamp =  0L;
              do {
                ptr = inbufp;
                /* get it right first, optimize later */
                s24_first.bytes[1] = *ptr++;
                s24_first.bytes[2] = *ptr++;
                s24_first.bytes[3] = *ptr++;
                s24_next.bytes[1] = *ptr++;
                s24_next.bytes[2] = *ptr++;
                s24_next.bytes[3] = *ptr;
                /* we now have  quasi 32bit values */
                /* convert to a quasi 16bit value! */
                first = (MYFLT) (s24_first.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next.lsamp * INLONGFAC);
                *r1++ = (MYFLT) (first + ((next-first) * phsFract));
                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 3);
                --ntogo;
#ifdef _DEBUG
                samplecount++;
#endif
              } while ((inbufp < p->guardpt) && (ntogo));
            }
            break;
          }
          break;
        case 2:
          phsFract = modf(phs,&phsTrunc);
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)(inbufp + 2) -
                                *(char *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(char *)(inbufp + 1) +
                               (*(char *)(inbufp + 3) -
                                *(char *)(inbufp + 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)(inbufp + 2) -
                                *(unsigned char *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(unsigned char *)(inbufp + 1) +
                               (*(unsigned char *)(inbufp + 3) -
                                *(unsigned char *)(inbufp + 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_SHORT:
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)(inbufp + 4) -
                                *(short *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(short *)(inbufp + 2) +
                               (*(short *)(inbufp + 6) -
                                *(short *)(inbufp + 2)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_24INT:
            {
              SAMP24 s24_first_1,s24_first_2;
              SAMP24 s24_next_1,s24_next_2;
              MYFLT first,next;
              char *ptr;

              s24_first_1.lsamp = s24_next_1.lsamp =  0L;
              s24_first_2.lsamp = s24_next_2.lsamp =  0L;
              do {
                ptr = inbufp;
                /* get it right first, optimize later */
                s24_first_1.bytes[1] = *ptr++;
                s24_first_1.bytes[2] = *ptr++;
                s24_first_1.bytes[3] = *ptr++;
                s24_first_2.bytes[1] = *ptr++;
                s24_first_2.bytes[2] = *ptr++;
                s24_first_2.bytes[3] = *ptr++;
                s24_next_1.bytes[1] = *ptr++;
                s24_next_1.bytes[2] = *ptr++;
                s24_next_1.bytes[3] = *ptr++;
                s24_next_2.bytes[1] = *ptr++;
                s24_next_2.bytes[2] = *ptr++;
                s24_next_2.bytes[3] = *ptr;
                /* we now have  quasi 32bit values */
                /* convert to a quasi 16bit value! */
                first = (MYFLT) (s24_first_1.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_1.lsamp * INLONGFAC);
                *r1++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_2.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_2.lsamp * INLONGFAC);
                *r2++ = (MYFLT) (first + ((next-first) * phsFract));
                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 6);
                --ntogo;
#ifdef _DEBUG
                samplecount++;
#endif
              } while ((inbufp < p->guardpt) && (ntogo));
            }
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)(inbufp + 8) -
                                *(long *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(long *)(inbufp + 4) +
                               (*(long *)(inbufp + 12) -
                                *(long *)(inbufp + 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(float *)inbufp +
                               (*(float *)(inbufp + 8) -
                                *(float *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(float *)(inbufp + 4) +
                               (*(float *)(inbufp + 12) -
                                *(float *)(inbufp + 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          }
          break;
        case 4:
          phsFract = modf(phs,&phsTrunc);
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)(inbufp + 4) -
                                *(char *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(char *)(inbufp + 1) +
                               (*(char *)(inbufp + 5) -
                                *(char *)(inbufp + 1)) * phsFract);
              *r3++ = (MYFLT) (*(char *)(inbufp + 2) +
                               (*(char *)(inbufp + 6) -
                                *(char *)(inbufp + 2)) * phsFract);
              *r4++ = (MYFLT) (*(char *)(inbufp + 3) +
                               (*(char *)(inbufp + 7) -
                                *(char *)(inbufp + 3)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)(inbufp + 4) -
                                *(unsigned char *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(unsigned char *)(inbufp + 1) +
                               (*(unsigned char *)(inbufp + 5) -
                                *(unsigned char *)(inbufp + 1)) * phsFract);
              *r3++ = (MYFLT) (*(unsigned char *)(inbufp + 2) +
                               (*(unsigned char *)(inbufp + 6) -
                                *(unsigned char *)(inbufp + 2)) * phsFract);
              *r4++ = (MYFLT) (*(unsigned char *)(inbufp + 3) +
                               (*(unsigned char *)(inbufp + 7) -
                                *(unsigned char *)(inbufp + 3)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_SHORT:
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)(inbufp + 8) -
                                *(short *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(short *)(inbufp + 2) +
                               (*(short *)(inbufp + 10) -
                                *(short *)(inbufp + 2)) * phsFract);
              *r3++ = (MYFLT) (*(short *)(inbufp + 4) +
                               (*(short *)(inbufp + 12) -
                                *(short *)(inbufp + 4)) * phsFract);
              *r4++ = (MYFLT) (*(short *)(inbufp + 6) +
                               (*(short *)(inbufp + 14) -
                                *(short *)(inbufp + 6)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_24INT:
            {
              SAMP24 s24_first_1,s24_first_2,s24_first_3,s24_first_4;
              SAMP24 s24_next_1,s24_next_2,s24_next_3,s24_next_4;
              MYFLT first,next;
              char *ptr;

              s24_first_1.lsamp = s24_next_1.lsamp =  0L;
              s24_first_2.lsamp = s24_next_2.lsamp =  0L;
              s24_first_3.lsamp = s24_next_3.lsamp =  0L;
              s24_first_4.lsamp = s24_next_4.lsamp =  0L;
              do {
                ptr = inbufp;
                /* get it right first, optimize later */
                s24_first_1.bytes[1] = *ptr++;
                s24_first_1.bytes[2] = *ptr++;
                s24_first_1.bytes[3] = *ptr++;
                s24_first_2.bytes[1] = *ptr++;
                s24_first_2.bytes[2] = *ptr++;
                s24_first_2.bytes[3] = *ptr++;
                s24_first_3.bytes[1] = *ptr++;
                s24_first_3.bytes[2] = *ptr++;
                s24_first_3.bytes[3] = *ptr++;
                s24_first_4.bytes[1] = *ptr++;
                s24_first_4.bytes[2] = *ptr++;
                s24_first_4.bytes[3] = *ptr++;
                s24_next_1.bytes[1] = *ptr++;
                s24_next_1.bytes[2] = *ptr++;
                s24_next_1.bytes[3] = *ptr++;
                s24_next_2.bytes[1] = *ptr++;
                s24_next_2.bytes[2] = *ptr++;
                s24_next_2.bytes[3] = *ptr++;
                s24_next_3.bytes[1] = *ptr++;
                s24_next_3.bytes[2] = *ptr++;
                s24_next_3.bytes[3] = *ptr++;
                s24_next_4.bytes[1] = *ptr++;
                s24_next_4.bytes[2] = *ptr++;
                s24_next_4.bytes[3] = *ptr;
                /* we now have  quasi 32bit values */
                /* convert to a quasi 16bit value! */
                first = (MYFLT) (s24_first_1.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_1.lsamp * INLONGFAC);
                *r1++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_2.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_2.lsamp * INLONGFAC);
                *r2++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_3.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_3.lsamp * INLONGFAC);
                *r3++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_4.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_4.lsamp * INLONGFAC);
                *r4++ = (MYFLT) (first + ((next-first) * phsFract));

                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 12);
                --ntogo;
#ifdef _DEBUG
                samplecount++;
#endif
              } while ((inbufp < p->guardpt) && (ntogo));
            }
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)(inbufp + 16) -
                                *(long *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(long *)(inbufp + 4) +
                               (*(long *)(inbufp + 20) -
                                *(long *)(inbufp + 4)) * phsFract);
              *r3++ = (MYFLT) (*(long *)(inbufp + 8) +
                               (*(long *)(inbufp + 24) -
                                *(long *)(inbufp + 8)) * phsFract);
              *r4++ = (MYFLT) (*(long *)(inbufp + 12) +
                               (*(long *)(inbufp + 28) -
                                *(long *)(inbufp + 12)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 16);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(float *)inbufp +
                               (*(float *)(inbufp + 16) -
                                *(float *)inbufp) * phsFract);
              *r2++ = (MYFLT) (*(float *)(inbufp + 4) +
                               (*(float *)(inbufp + 20) -
                                *(float *)(inbufp + 4)) * phsFract);
              *r3++ = (MYFLT) (*(float *)(inbufp + 8) +
                               (*(float *)(inbufp + 24) -
                                *(float *)(inbufp + 8)) * phsFract);
              *r4++ = (MYFLT) (*(float *)(inbufp + 12) +
                               (*(float *)(inbufp + 28) -
                                *(float *)(inbufp + 12)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 16);
              --ntogo;
            } while ((inbufp < p->guardpt) && (ntogo));
            break;
          }
          break;
        }

        bytesLeft = (int)(p->bufend - inbufp);
        if (bytesLeft <= p->sampframsiz) {      /* first set file position to where inbuf p "thinks" its pointing to */
          p->filepos = (long)lseek(p->fdch.fd,(off_t)(-bytesLeft),SEEK_CUR);
          if ((n = sreadinew(p->fdch.fd,p->inbuf,snewbufsize,p)) == 0) {  /*RWD 5:2001 */
            if (looping) {
              /* go to beginning of file.
                 depending on the pitch and
                 phase, we might drop a few "guardpoint" samples, but
                 this ugen is intended for large files anyway -- if a
                 few end samples are critical for looping, use oscil or
                 table!!!!  */
              p->audrem = p->audsize;
              p->filepos = (long)lseek(p->fdch.fd,(off_t)p->firstsampinfile,SEEK_SET);
              if ((n = sreadinew(p->fdch.fd,p->inbuf,snewbufsize,p)) == 0)      /*RWD 5:2001 */
                die(Str(X_733,"error trying to loop back to the beginning "
                        "of the sound file!?!??"));
              p->begfile = 1;
              phs = 0;
              inbufp = p->inbufp = p->inbuf;
              p->bufend = p->inbuf + n;
#ifdef DISKINHACK
              /*RWD 5:2001 this cures the symptom (bad data in output sometimes,
               * when a transp sweep hits eof), but not, I suspect, the underlying cause */
              if(n < snewbufsize)
                memset(p->bufend,0,snewbufsize-n);
#endif
              p->guardpt = p->bufend - p->sampframsiz;
            }
            else {
              p->endfile = TRUE;
              goto filend;
            }
          }
          else {
            inbufp = p->inbufp = p->inbuf;
            p->bufend = p->inbuf + n;
#ifdef DISKINHACK
            /*RWD 5:2001 this cures the symptom (bad data in output sometimes,
             * when a transp sweep hits eof), but not, I suspect, the underlying cause */
            if(n < snewbufsize)
              memset(p->bufend,0,snewbufsize-n);
#endif
            p->guardpt = p->bufend - p->sampframsiz;
            phs = modf(phs,&phsTrunc);
            p->begfile = FALSE;
          }
        }
      }
#ifdef _DEBUG
      if(inbufp != p->bufend)
        assert(((p->bufend - inbufp) % p->sampframsiz)==0);
#endif

    }

    else {      /* backwards...                 same thing but different */
      if
#ifdef DISKINHACK
      /*RWD 5:2001 as above */
         (phs > 0 && p->endfile)
#else
         (phs > 0)
#endif
           phs = 0; /* we have just switched directions, forget (positive) old phase */

      if (p->endfile) {         /* firewall-flag signaling when we are at either end of the file */
        if (p->begfile)
          goto filend; /* make sure we are at beginning, not end */
        else
#ifdef DISKINHACK
          /* RWD 5:2001: read in the first block (= last block of infile) */
          {
            bytesLeft = (int)(inbufp - p->inbuf);
            if ((p->filepos = (long)lseek(p->fdch.fd,
                                    (off_t)(bytesLeft-snewbufsize),
                                    SEEK_CUR)) <= p->firstsampinfile) {
              p->filepos = (long)lseek(p->fdch.fd,(off_t)p->firstsampinfile,SEEK_SET);
              p->begfile = 1;
            }

            /* RWD 5:2001 but don't know if this is required here... */
            p->audrem = p->audsize; /* a hack to prevent errors (returning 'ntot')in the sread for AIFF */
            if ((n = sreadinew(p->fdch.fd,p->inbuf,snewbufsize,p)) !=
                snewbufsize) {
              /* we should never get here. if we do,
                 we're fucked because didn't get a full buffer and our
                 present sample is the last sample of the buffer!!!  */
              die(Str(X_697,"diskin read error - during backwards playback"));
              return;
            }
#ifdef _DEBUG
            sbufp1 = (short *) p->inbuf;
#endif
            /* now get the correct remaining size */
            p->audrem = p->audsize - p->firstsampinfile - p->filepos;
            p->bufend = p->inbuf + n;
            /* point to the last sample in buffer */
            inbufp = p->inbufp = p->guardpt = p->bufend - p->sampframsiz;

            /*RWD 5:2001 this cures the symptom (bad data in output sometimes,
             * when a transp sweep hits eof), but not, I suspect, the underlying cause */
            if(n < snewbufsize)
              memset(p->bufend,0,snewbufsize-n);
            phs = modf(phs,&phsTrunc);
            p->endfile = FALSE;
          }
#else
        p->endfile = FALSE; /* at end, must have just switched directions, start making sound again */
#endif
      }

      while (ntogo) {
        switch(chnsout) {
        case 1:
          phsFract = modf(phs,&phsTrunc); /* phsFract and phsTrunc will be non-positive */
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)inbufp -
                                *(char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            /* make sure it
               points to the second sample or greater in the buffer,
               because we need at least two to interpolate */
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)inbufp -
                                *(unsigned char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_SHORT:
#ifdef _DEBUG
            sbufp1 = (short *) p->inbuf;
            sbufp2 = (short *) p->inbufp;
#endif
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)inbufp -
                                *(short *)(inbufp - 2)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
#ifdef _DEBUG
              samplecount++;
#endif
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)inbufp -
                                *(long *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(float *)inbufp +
                               (*(float *)inbufp -
                                *(float *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
/*RWD 5:2001 */
          case AE_24INT:
            {
              SAMP24 s24_first,s24_next;
              MYFLT first,next;
              char *ptr;

              s24_first.lsamp = s24_next.lsamp =  0L;
              do {
                ptr = inbufp - 3;
                s24_next.bytes[1] = *ptr++;
                s24_next.bytes[2] = *ptr++;
                s24_next.bytes[3] = *ptr++;
                s24_first.bytes[1] = *ptr++;
                s24_first.bytes[2] = *ptr++;
                s24_first.bytes[3] = *ptr;

                first = (MYFLT) (s24_first.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next.lsamp * INLONGFAC);

                *r1++ = (MYFLT) (first + ((first-next) * phsFract));
                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 3);
                --ntogo;
              } while ((inbufp > p->inbuf) && (ntogo));
            }
            break;
          }
          break;
        case 2:
          phsFract = modf(phs,&phsTrunc);       /*  phsFract will be negative */
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)inbufp -
                                *(char *)(inbufp - 2)) * phsFract);
              *r2++ = (MYFLT) (*(char *)(inbufp + 1) +
                               (*(char *)(inbufp + 1) -
                                *(char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)inbufp -
                                *(unsigned char *)(inbufp - 2)) * phsFract);
              *r2++ = (MYFLT) (*(unsigned char *)(inbufp + 1) +
                               (*(unsigned char *)(inbufp + 1) -
                                *(unsigned char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 2);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_SHORT:
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)inbufp -
                                *(short *)(inbufp - 4)) * phsFract);
              *r2++ = (MYFLT) (*(short *)(inbufp + 2) +
                               (*(short *)(inbufp + 2) -
                                *(short *)(inbufp - 2)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
/*RWD 5.2001*/
          case AE_24INT:
            {
              SAMP24 s24_first_1,s24_first_2;
              SAMP24 s24_next_1,s24_next_2;
              MYFLT first,next;
              char *ptr;

              s24_first_1.lsamp = s24_next_1.lsamp =  0L;
              s24_first_2.lsamp = s24_next_2.lsamp =  0L;
              do {
                ptr = inbufp - 6;
                /* get it right first, optimize later */
                s24_next_1.bytes[1] = *ptr++;
                s24_next_1.bytes[2] = *ptr++;
                s24_next_1.bytes[3] = *ptr++;
                s24_next_2.bytes[1] = *ptr++;
                s24_next_2.bytes[2] = *ptr++;
                s24_next_2.bytes[3] = *ptr++;
                s24_first_1.bytes[1] = *ptr++;
                s24_first_1.bytes[2] = *ptr++;
                s24_first_1.bytes[3] = *ptr++;
                s24_first_2.bytes[1] = *ptr++;
                s24_first_2.bytes[2] = *ptr++;
                s24_first_2.bytes[3] = *ptr;

                /* we now have  quasi 32bit values */
                /* convert to a quasi 16bit value! */
                first = (MYFLT) (s24_first_1.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_1.lsamp * INLONGFAC);
                *r1++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_2.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_2.lsamp * INLONGFAC);
                *r2++ = (MYFLT) (first + ((next-first) * phsFract));
                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 6);
                --ntogo;
#ifdef _DEBUG
                samplecount++;
#endif
              } while ((inbufp > p->inbuf) && (ntogo));
            }
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)inbufp -
                                *(long *)(inbufp - 8)) * phsFract);
              *r2++ = (MYFLT) (*(long *)(inbufp + 4) +
                               (*(long *)(inbufp + 4) -
                                *(long *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(float *)inbufp +
                               (*(float *)inbufp -
                                *(float *)(inbufp - 8)) * phsFract);
              *r2++ = (MYFLT) (*(float *)(inbufp + 4) +
                               (*(float *)(inbufp + 4) -
                                *(float *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          }
          break;
        case 4:
          phsFract = modf(phs,&phsTrunc);       /*  phsFract will be negative */
          switch (p->format) {
          case AE_CHAR:
            do {
              *r1++ = (MYFLT) (*(char *)inbufp +
                               (*(char *)inbufp -
                                *(char *)(inbufp - 4)) * phsFract);
              *r2++ = (MYFLT) (*(char *)(inbufp + 1) +
                               (*(char *)(inbufp + 1) -
                                *(char *)(inbufp - 3)) * phsFract);
              *r3++ = (MYFLT) (*(char *)(inbufp + 2) +
                               (*(char *)(inbufp + 2) -
                                *(char *)(inbufp - 2)) * phsFract);
              *r4++ = (MYFLT) (*(char *)(inbufp + 3) +
                               (*(char *)(inbufp + 3) -
                                *(char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_UNCH:
            do {
              *r1++ = (MYFLT) (*(unsigned char *)inbufp +
                               (*(unsigned char *)inbufp -
                                *(unsigned char *)(inbufp - 4)) * phsFract);
              *r2++ = (MYFLT) (*(unsigned char *)(inbufp + 1) +
                               (*(unsigned char *)(inbufp + 1) -
                                *(unsigned char *)(inbufp - 3)) * phsFract);
              *r3++ = (MYFLT) (*(unsigned char *)(inbufp + 2) +
                               (*(unsigned char *)(inbufp + 2) -
                                *(unsigned char *)(inbufp - 2)) * phsFract);
              *r4++ = (MYFLT) (*(unsigned char *)(inbufp + 3) +
                               (*(unsigned char *)(inbufp + 3) -
                                *(unsigned char *)(inbufp - 1)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 4);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_SHORT:
            do {
              *r1++ = (MYFLT) (*(short *)inbufp +
                               (*(short *)inbufp -
                                *(short *)(inbufp - 8)) * phsFract);
              *r2++ = (MYFLT) (*(short *)(inbufp + 2) +
                               (*(short *)(inbufp + 2) -
                                *(short *)(inbufp - 6)) * phsFract);
              *r3++ = (MYFLT) (*(short *)(inbufp + 4) +
                               (*(short *)(inbufp + 4) -
                                *(short *)(inbufp - 4)) * phsFract);
              *r4++ = (MYFLT) (*(short *)(inbufp + 6) +
                               (*(short *)(inbufp + 6) -
                              *(short *)(inbufp - 2)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 8);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
/*RWD 5.2001 */
          case AE_24INT:
            {
              SAMP24 s24_first_1,s24_first_2,s24_first_3,s24_first_4;
              SAMP24 s24_next_1,s24_next_2,s24_next_3,s24_next_4;
              MYFLT first,next;
              char *ptr;

              s24_first_1.lsamp = s24_next_1.lsamp =  0L;
              s24_first_2.lsamp = s24_next_2.lsamp =  0L;
              s24_first_3.lsamp = s24_next_3.lsamp =  0L;
              s24_first_4.lsamp = s24_next_4.lsamp =  0L;
              do {
                ptr = inbufp - 12;
                /* get it right first, optimize later */
                s24_next_1.bytes[1] = *ptr++;
                s24_next_1.bytes[2] = *ptr++;
                s24_next_1.bytes[3] = *ptr++;
                s24_next_2.bytes[1] = *ptr++;
                s24_next_2.bytes[2] = *ptr++;
                s24_next_2.bytes[3] = *ptr++;
                s24_next_3.bytes[1] = *ptr++;
                s24_next_3.bytes[2] = *ptr++;
                s24_next_3.bytes[3] = *ptr++;
                s24_next_4.bytes[1] = *ptr++;
                s24_next_4.bytes[2] = *ptr++;
                s24_next_4.bytes[3] = *ptr++;
                s24_first_1.bytes[1] = *ptr++;
                s24_first_1.bytes[2] = *ptr++;
                s24_first_1.bytes[3] = *ptr++;
                s24_first_2.bytes[1] = *ptr++;
                s24_first_2.bytes[2] = *ptr++;
                s24_first_2.bytes[3] = *ptr++;
                s24_first_3.bytes[1] = *ptr++;
                s24_first_3.bytes[2] = *ptr++;
                s24_first_3.bytes[3] = *ptr++;
                s24_first_4.bytes[1] = *ptr++;
                s24_first_4.bytes[2] = *ptr++;
                s24_first_4.bytes[3] = *ptr++;

                first = (MYFLT) (s24_first_1.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_1.lsamp * INLONGFAC);
                *r1++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_2.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_2.lsamp * INLONGFAC);
                *r2++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_3.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_3.lsamp * INLONGFAC);
                *r3++ = (MYFLT) (first + ((next-first) * phsFract));

                first = (MYFLT) (s24_first_4.lsamp * INLONGFAC);
                next = (MYFLT) (s24_next_4.lsamp * INLONGFAC);
                *r4++ = (MYFLT) (first + ((next-first) * phsFract));
                phs += ktransp;
                phsFract = modf(phs,&phsTrunc);
                inbufp = p->inbufp + (long)(phsTrunc * 12);
                --ntogo;
#ifdef _DEBUG
                samplecount++;
#endif
              } while ((inbufp > p->inbuf) && (ntogo));
            }
            break;
          case AE_LONG:
            do {
              *r1++ = (MYFLT) (*(long *)inbufp +
                               (*(long *)inbufp -
                                *(long *)(inbufp - 16)) * phsFract);
              *r2++ = (MYFLT) (*(long *)(inbufp + 4) +
                               (*(long *)(inbufp + 4) -
                                *(long *)(inbufp - 12)) * phsFract);
              *r3++ = (MYFLT) (*(long *)(inbufp + 8) +
                               (*(long *)(inbufp + 8) -
                                *(long *)(inbufp - 8)) * phsFract);
              *r4++ = (MYFLT) (*(long *)(inbufp + 12) +
                               (*(long *)(inbufp + 12) -
                                *(long *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 16);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          case AE_FLOAT:
            do {
              *r1++ = (MYFLT) (*(float *)inbufp +
                               (*(float *)inbufp -
                                *(float *)(inbufp - 16)) * phsFract);
              *r2++ = (MYFLT) (*(float *)(inbufp + 4) +
                               (*(float *)(inbufp + 4) -
                                *(float *)(inbufp - 12)) * phsFract);
              *r3++ = (MYFLT) (*(float *)(inbufp + 8) +
                               (*(float *)(inbufp + 8) -
                                *(float *)(inbufp - 8)) * phsFract);
              *r4++ = (MYFLT) (*(float *)(inbufp + 12) +
                               (*(float *)(inbufp + 12) -
                                *(float *)(inbufp - 4)) * phsFract);
              phs += ktransp;
              phsFract = modf(phs,&phsTrunc);
              inbufp = p->inbufp + (long)(phsTrunc * 16);
              --ntogo;
            } while ((inbufp > p->inbuf) && (ntogo));
            break;
          }
          break;
        }

        if (inbufp <= p->inbuf) { /* we need to get some more samples!! */
          if (p->begfile) {
            if (looping) {      /* hopes this works -- set 1 buffer lenght at end of sound file */
              p->filepos =
                (long)lseek(p->fdch.fd,
                            (off_t)(p->firstsampinfile+p->audsize-snewbufsize),
                            SEEK_SET);   /*RWD 5:2001*/
              phs = -0.0;
              p->begfile = 0;
            }
            else {
              p->endfile = 1;
              goto filend;
            }
          }
          else {
            bytesLeft = (int)(inbufp - p->inbuf + p->sampframsiz);
            /* we're going backwards, so bytesLeft should be
             * non-positive because inbufp should be pointing
             * to the first sample in the buffer or "in front"
             * the buffer.  But we must add a sample frame
             * (p->sampframsiz) to make sure the sample we are
             * pointing at right now becomes the last sample
             * in the next buffer*/
#ifdef DISKINHACK
            /*RWD remember this for when lseek returns -1 */
            oldfilepos = p->filepos;
#endif
#ifdef _DEBUG
            tellpos = tell(p->fdch.fd);
            sbufp1 = (short *) p->inbuf;
#endif

            if ((p->filepos =
                 (long)lseek(p->fdch.fd,
                             (off_t)(bytesLeft-snewbufsize - snewbufsize),
                             /*RWD 5:2001 was SNDINEWBUFSIZ*/
                             SEEK_CUR)) <= p->firstsampinfile) {
              p->filepos = (long)lseek(p->fdch.fd,
                                       (off_t)p->firstsampinfile,SEEK_SET);
              p->begfile = 1;
            }
          }

          p->audrem = p->audsize; /* a hack to prevent errors (returning 'ntot')in the sread for AIFF */

          if ((n = sreadinew(p->fdch.fd,p->inbuf,snewbufsize,p)) !=
              snewbufsize) {       /* RWD 4:2001 was SNDINEWBUFSIZ*/
            /* we should never get here. if we do,
               we're fucked because didn't get a full buffer and our
               present sample is the last sample of the buffer!!!  */
            die(Str(X_697,"diskin read error - during backwards playback"));
            return;
          }
#ifdef _DEBUG
          sbufp1 = (short *) p->inbuf;
#endif
          /* now get the correct remaining size */
          p->audrem = p->audsize - p->firstsampinfile - p->filepos;
#ifdef DISKINHACK
          /* RWD 5:2001  this clears a glitch doing
           * plain reverse looping (pitch  = -1) over file
           */
          if(p->begfile )
            n = oldfilepos - p->firstsampinfile;
#endif
          p->bufend = p->inbuf + n;
          /* point to the last sample in buffer */
          inbufp = p->inbufp = p->guardpt = p->bufend - p->sampframsiz;
#ifdef DISKINHACK
          /*RWD 5:2001 this cures the symptom (bad data in output sometimes,
           * when a transp sweep hits eof), but not, I suspect, the underlying cause */
          if(n < snewbufsize)
            memset(p->bufend,0,snewbufsize-n);
#endif
          phs = modf(phs,&phsTrunc);
        }
#ifdef _DEBUG
        if(inbufp != p->bufend)
          assert(((p->bufend - inbufp) % p->sampframsiz)==0);
#endif
      }
    }

    p->inbufp = inbufp;
    p->phs = modf(phs,&phsTrunc);

    return;

 filend:
    if (ntogo > n) {            /* At RWD's suggestion */
      switch(chnsout) {                   /* if past end of file, */
      case 1:
        do *r1++ = FL(0.0);               /*    move in zeros     */
        while (--ntogo);
        break;
      case 2:
        do {
          *r1++ = FL(0.0);
          *r2++ = FL(0.0);
        } while (--ntogo);
        break;
      case 4:
        do {
          *r1++ = FL(0.0);
          *r2++ = FL(0.0);
          *r3++ = FL(0.0);
          *r4++ = FL(0.0);
        } while (--ntogo);
      }
    }
}

/* Empty buffer to file */
static void sndwrt1(int fd, MYFLT *buf, int nsamps)  /* diskfile write */
{
    int n;
    char buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      long x = (long)buf[n];
      if (x > 32767) x = 32767;
      else if (x < -32768) x = 32768;
      buffer[n] = (char)(x >> 8);
    }
    if ((n = write(fd, (char*)buffer, nsamps)) < nsamps)
      sndwrterr(n, nsamps);
}

static void sndwrtu(int fd, MYFLT *buf, int nsamps)  /* diskfile write */
{
    int n;
    unsigned char buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      long x = (long)buf[n];
      if (x > 32767) x = 32767;
      else if (x < -32768) x = 32768;
      buffer[n] = (unsigned char)(x >> 8)^0x80;
    }
    if ((n = write(fd, (char *)buffer, nsamps)) < nsamps)
      sndwrterr(n, nsamps);
}

static void sndwrt2rev(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;
    short buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      long x = (long)buf[n];
      if (x > 32767) x = 32767;
      else if (x < -32768) x = 32768;
      buffer[n] = (short)x;
    }
    bytrev2((char *)buffer, nbytes = (nsamps<<1));    /* rev bytes in shorts  */
    if ((n = write(fd, (char*)buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

static void sndwrt2(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;
    short buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      long x = (long)buf[n];
      if (x > 32767) x = 32767;
      else if (x < -32768) x = 32768;
      buffer[n] = (short)x;
    }
    nbytes = nsamps << 1;
    if ((n = write(fd, (char*)buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

/*RWD 5:2001 */
static void sndwrt3(int fd,MYFLT *buf,int nsamps)
{
    int n, nbytes;
    SAMP24 s24;
    char buffer[SNDOUTSMPS*3];
    char *bufp = buffer;
    for(n=0;n < SNDOUTSMPS; n++){
      s24.lsamp = (long) (buf[n] * OUT24LONGFAC);
      /*TODO: add range clipping */
      *bufp++ = s24.bytes[1];
      *bufp++ = s24.bytes[2];
      *bufp++ = s24.bytes[3];
    }
    nbytes = nsamps*3;
    if ((n = write(fd,buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

static void sndwrt3rev(int fd,MYFLT *buf,int nsamps)
{
    int n, nbytes;
    SAMP24 s24;
    char buffer[SNDOUTSMPS*3];
    char *bufp = buffer;
    for(n=0;n < SNDOUTSMPS; n++){
      s24.lsamp = (long) (buf[n] * OUT24LONGFAC);
      /*TODO: add range clipping */
      /* umm, can optimize this later.. */
      *bufp++ = s24.bytes[3];
      *bufp++ = s24.bytes[2];
      *bufp++ = s24.bytes[1];
    }
    nbytes = nsamps*3;
    if ((n = write(fd,buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

static void sndwrt4rev(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;
    long buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      buffer[n] = (long)buf[n];
    }
    nbytes = nsamps << 2;
    bytrev4((char *)buffer, nbytes);    /* rev bytes in longs   */
    if ((n = write(fd, (char*)buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

static void sndwrt4(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;
    long buffer[SNDOUTSMPS];
    for (n=0; n<SNDOUTSMPS; n++) {
      buffer[n] = (long)buf[n];
    }
    nbytes = nsamps << 2;
    if ((n = write(fd, (char*)buffer, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

static void sndwrtf(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;
    nbytes = nsamps << 2;
    if ((n = write(fd, (char*)buf, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}

/*RWD 5:2001 */
static void sndwrtfrev(int fd, MYFLT *buf, int nsamps) /* diskfile write */
{
    int n, nbytes;

    nbytes = nsamps << 2;
    bytrev4((char *) buf,nbytes);
    if ((n = write(fd, (char*)buf, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
}


void sndo1set(SNDOUT *p)            /* init routine for instr soundout   */
{
    int    soutfd, filno;
    char   *sfname, sndoutname[128];

    if (p->c.fdch.fd != 0)   return;           /* if file already open, rtn  */
    if (*p->c.ifilcod == sstrcod)
      strcpy(sndoutname, unquote(p->STRARG));
    else if ((filno = (int)*p->c.ifilcod) <= strsmax && strsets != NULL &&
             strsets[filno])
      strcpy(sndoutname, strsets[filno]);
    else
      sprintf(sndoutname,"soundout.%d", filno);
    sfname = sndoutname;
    if ((soutfd = openout(sfname, 1)) < 0) {   /* if openout successful */
      if (isfullpath(sfname))
        sprintf(errmsg,Str(X_1212,"soundout cannot open %s"), sfname);
      else sprintf(errmsg,Str(X_1211,"soundout cannot find %s in search paths"), sfname);
      goto errtn;
    }
    sfname = retfilnam;
    if ((p->c.format = (short)*p->c.iformat) > 0)
      p->c.format |= 0x100;

    if (p->c.filetyp == TYP_AIFF && bytrevhost() ||
        p->c.filetyp == TYP_AIFC && bytrevhost() ||
        p->c.filetyp == TYP_WAV && !bytrevhost()) {
      int rev;
      switch(p->c.format) {
      case AE_UNCH:  p->c.swrtmethod = sndwrtu;    rev = 0;   break;
      case AE_CHAR:
      case AE_ALAW:
      case AE_ULAW:  p->c.swrtmethod = sndwrt1;    rev = 0;   break;
      case AE_SHORT: p->c.swrtmethod = sndwrt2rev; rev = 1;   break;
 /*RWD 5:2001 :  format = 8 from opcode */
      case AE_24INT: p->c.swrtmethod = sndwrt3rev; rev = 1;   break;

      case AE_LONG:  p->c.swrtmethod = sndwrt4rev; rev = 1;   break;
        /*RWD 5:2001 was sndwrtf,rev=0 : but we ~can~ reverse floatsams! */
      case AE_FLOAT: p->c.swrtmethod = sndwrtfrev;    rev = 1;   break;
        /*RWD 5:2001 might as well trap a bad format param */
      default:
        die("Error: bad format parameter for soundout\n");
      }
      printf(Str(X_1094,"opening %s outfile %s, with%s bytrev\n"),
             p->c.filetyp==TYP_AIFF ? "AIFF":
             p->c.filetyp==TYP_AIFC ? "AIFF-C":"WAV", sfname, rev ? "":Str(X_21," no"));
    }
    else switch(p->c.format) {
    case AE_UNCH:  p->c.swrtmethod = sndwrt1;  break;
    case AE_CHAR:
    case AE_ALAW:
    case AE_ULAW:  p->c.swrtmethod = sndwrt1;  break;
    case AE_SHORT: p->c.swrtmethod = sndwrt2;  break;
/*RWD 5:2001 */
    case AE_24INT: p->c.swrtmethod = sndwrt3;  break;

    case AE_LONG:  p->c.swrtmethod = sndwrt4;  break;
    case AE_FLOAT: p->c.swrtmethod = sndwrtf;  break;
/*RWD 5:2001 might as well trap a bad format param */
    default:
      die("Error: undefined format parameter for soundout\n");
    }
    p->c.outbufp = p->c.outbuf;         /* fix - isro 20-11-96 */
    p->c.bufend = p->c.outbuf + SNDOUTSMPS; /* fix - isro 20-11-96 */
    p->c.fdch.fd = soutfd;                  /*     store & log the fd     */
    fdrecord(&p->c.fdch);                   /*     instr will close later */
    return;
 errtn:
    initerror(errmsg);                      /* else just print the errmsg */
}

void soundout(SNDOUT *p)
{
    MYFLT  *outbufp, *asig;
    int    nn, nsamps, ospace;

    asig = p->asig;
    outbufp = p->c.outbufp;
    nsamps = ksmps;
    ospace = (p->c.bufend - outbufp);
 nchk:
    if ((nn = nsamps) > ospace)
      nn = ospace;
    nsamps -= nn;
    ospace -= nn;
    do  *outbufp++ = *asig++;
    while (--nn);
    if (!ospace) {              /* when buf is full  */
      p->c.swrtmethod(p->c.fdch.fd, (void *)p->c.outbuf, p->c.bufend - p->c.outbuf);
      outbufp = p->c.outbuf;
      ospace = SNDOUTSMPS;
      if (nsamps) goto nchk;    /*   chk rem samples */
    }
    p->c.outbufp = outbufp;
}

void sndo2set(SNDOUTS *p)
{
    IGN(p);
}

void soundouts(SNDOUTS *p)
{
    IGN(p);
}
