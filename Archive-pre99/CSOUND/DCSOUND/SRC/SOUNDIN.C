#include "cs.h"                 /*                      SOUNDIN.C       */
#include "soundio.h"
#include "oload.h"

/*RWD 3:2000*/
#define INLONGFAC (1.0 / 65536.0)         /* convert 32bit long into quasi 16 bit range */
#define INMYFLTFAC (FL(32767.0))

static  MYFLT   fzero = FL(0.0);
static  long    datpos= 0L;       /* Used in resetting only */
MYFLT curr_func_sr = FL(0.0);

char    **strsets = NULL;

extern  int     strsmax;
extern  int     ksmps;
extern  HEADATA *readheader(int, char *, SOUNDIN*);
extern  short   ulaw_decode[];
extern  int     bytrevhost(void), openin(char*);
extern  char    *retfilnam;
extern  OPARMS  O;
extern  void sndwrterr(int, int);

#ifdef RESET
void soundinRESET(void)
{
    datpos = 0;
    fzero = FL(0.0);             /* do not seem to need anything else... */
}
#endif

char *getstrformat(int format)  /* used here, and in sfheader.c */
{
    switch(format) {
    case AE_UNCH:  return(Str(X_1356,"unsigned bytes"));   /* J. Mohr 1995 Oct 17 */
    case AE_CHAR:  return(Str(X_1190,"signed chars"));
    case AE_ALAW:  return(Str(X_589,"alaw bytes"));
    case AE_ULAW:  return(Str(X_1304,"ulaw bytes"));
    case AE_SHORT: return(Str(X_1189,"shorts"));
    case AE_LONG:  return(Str(X_969,"longs"));
    case AE_FLOAT: return(Str(X_769,"floats"));
    case AE_NO_AUDIO: return("<<no audio>>");/*gab-A1*/
    case AE_D3D: return("shorts on DirectX 3D buffers");/*gab c3*/
	case AE_VST: return("floats (VST processing)");
   default:
      {
        char st[80];
        sprintf(st, Str(X_1343,"unknown sound format %d(0x%x)"), format, format);
        die(st); return(NULL);
      }
    }
}

int getsizformat(int format)
{
 static int formatsiz[] = {0, sizeof(char), sizeof(char), sizeof(char),
                            sizeof(short), sizeof(long), sizeof(float),
                            sizeof(char),sizeof(long),sizeof(double),0,sizeof(short),
							sizeof(float)}; /* gab-A1 ( sizeof(short),0 is the format for no audio)*/
        if (format > AE_LAST)
                die(Str(X_857,"illegal input to getsizformat"));
        return(formatsiz[format & 0xF]);
}

void bytrev2(char *buf, int nbytes)      /* reverse bytes in buf of shorts */
{
        char *p = buf, c1, c2;
        int n = nbytes/2;

        do {
            c1 = *p++;
            c2 = *p--;
            *p++ = c2;
            *p++ = c1;
        } while (--n);
}

void bytrev4(char *buf, int nbytes)     /* reverse bytes in buf of longs */
{
        char *p = buf, *q = buf;
        char c1, c2, c3, c4;
        int n = nbytes/4;

        do {
            c1 = *p++;
            c2 = *p++;
            c3 = *p++;
            c4 = *p++;
            *q++ = c4;
            *q++ = c3;
            *q++ = c2;
            *q++ = c1;
        } while (--n);
}

int sreadin(                    /* special handling of sound input       */
    int     infd,               /* to accomodate reads thru pipes & net  */
    char    *inbuf,             /* where nbytes rcvd can be < n requested*/
    int     nbytes,             /*  */
    SOUNDIN *p)                 /* extra arg passed for filetyp testing  */
{                               /* on POST-HEADER reads of audio samples */
        int    n, ntot=0;

        do if ((n = read(infd, inbuf+ntot, nbytes-ntot)) < 0)
                die(Str(X_1201,"soundfile read error"));
        while (n > 0 && (ntot += n) < nbytes);
        if (p->filetyp) {                           /* for AIFF and WAV samples */
                        /*RWD 3:2000 added AIFC */
            if (p->filetyp == TYP_AIFF ||
                p->filetyp==TYP_AIFC ||
                p->filetyp==TYP_WAV) {
                if (p->audrem > 0) {                /* AIFF:                  */
                    if (ntot > p->audrem)           /*   chk haven't exceeded */
                        ntot = p->audrem;           /*   limit of audio data  */
                    p->audrem -= ntot;
                }
                else ntot = 0;
            }
            if (ntot && p->bytrev != NULL)          /* for post-header of both */
                p->bytrev(inbuf, ntot);             /*   bytrev 2 or 4 as reqd */
        }
#ifdef NeXT
# ifdef __LITTLE_ENDIAN__
            if (!p->filetyp && ntot && p->bytrev != NULL)          /* for post-header of both */
                p->bytrev(inbuf, ntot);             /*   bytrev 2 or 4 as reqd */
# endif
#endif
                /*RWD 3:2000: removed my floatsam fixup code: now all handled in soundin, etc */
        return(ntot);
}

int sndgetset(SOUNDIN *p)       /* core of soundinset                */
                                /* called from sndinset, SAsndgetset, & gen01 */
                                /* Return -1 on failure */
{
        int    n;
        HEADATA *hdr;
        long    hdrsize = 0, readlong = 0, framesinbuf, skipframes;
        char    *sfname, soundiname[128];
        int     sinfd;
        long    filno;

        if ((n = p->OUTOCOUNT) && n != 1 && n != 2 && n != 4 &&
            n != 6 && n!= 8) { /* if appl,chkchnls */
          sprintf(errmsg,Str(X_1209,"soundin: illegal no of receiving channels"));
          goto errtn;
        }
        if (*p->ifilno == sstrcod) {               /* if char string name given */
           extern EVTBLK *currevent; 
           if (p->STRARG == NULL) strcpy(soundiname,unquote(currevent->strarg));
           else strcpy(soundiname,unquote(p->STRARG));    /*     unquote it,  else use */
        } 
        else if ((filno = (long)*p->ifilno) < strsmax && strsets != NULL &&
                 strsets[filno])
          strcpy(soundiname, strsets[filno]);
        else sprintf(soundiname,"soundin.%ld",filno);  /* soundin.filno */
        sfname = soundiname;
        if ((sinfd = openin(sfname)) < 0) {      /* open with full dir paths */
            if (isfullpath(sfname))
                sprintf(errmsg,Str(X_1206,"soundin cannot open %s"), sfname);
            else sprintf(errmsg,Str(X_1205,"soundin can't find \"%s\" in its search paths"),
                         sfname);
            goto errtn;
        }
        sfname = retfilnam;                      /* & record fullpath filnam */
        if ((p->format = (short)*p->iformat) > 0)       /* convert spec'd format code */
            p->format |= 0x100;
        p->endfile = 0;
        p->filetyp = 0;         /* initially non-typed for readheader */
        if ((hdr=readheader(sinfd,sfname,p)) != NULL /* if headerblk returned */
              && !(readlong = hdr->readlong)) {  /* & hadn't readin audio */
            curr_func_sr = (MYFLT)hdr->sr;
#ifdef never
            if (hdr->filetyp == TYP_AIFF         /*    chk the hdr codes  */
              && hdr->aiffdata != NULL
              && hdr->aiffdata->loopmode1 != 0   /* looping aiff:         */
              && (p->analonly || p->OUTOCOUNT))  /*     ok for gen01 only */
                warning(Str(X_586,"aiff looping file, once through only"));
#endif
            if (p->analonly) {                          /* anal: if sr param val */
                if (p->sr != 0 && p->sr != hdr->sr) {   /*          use it       */
                    sprintf(errmsg,Str(X_162,"-s %ld overriding soundfile sr %ld"),
                            p->sr, hdr->sr);
                    warning(errmsg);
                    hdr->sr = p->sr;
                }
            }
            else if (hdr->sr != esr) {                  /* non-anal:  cmp w. esr */
                sprintf(errmsg,Str(X_62,"%s sr = %ld, orch sr = %7.1f"),
                        sfname, hdr->sr, esr);
                warning(errmsg);
            }
            if (p->OUTOCOUNT) {                          /* for orch SOUNDIN: */
                if (hdr->nchnls != p->OUTOCOUNT) {       /*        chk nchnls */
                    sprintf(errmsg,Str(X_58,"%s nchnls = %d, soundin reading as if nchnls = %d"),
                            sfname, (int) hdr->nchnls, (int) p->OUTOCOUNT);
                    warning(errmsg);
                    hdr->nchnls = p->OUTOCOUNT;
                }
            }                                            /* else chk sufficient */
            else if (p->channel != ALLCHNLS && p->channel > hdr->nchnls) {
                sprintf(errmsg,Str(X_1162,"req chan %d, file %s has only %ld"),
                        p->channel, sfname, hdr->nchnls);
                die(errmsg);
            }
            if (p->format && hdr->format != p->format) {
                sprintf(errmsg,Str(X_1204,"soundin %s superceded by %s header format %s"),
                        getstrformat((int)p->format), sfname,
                        getstrformat((int)hdr->format));
                warning(errmsg);
            }
            switch ((p->format = (short)hdr->format)) { /* & copy header data */
            case AE_UNCH:   break;
            case AE_CHAR:   break;
            case AE_ULAW:   break;
            case AE_SHORT:  break;
            case AE_LONG:   break;
            case AE_FLOAT:  break;
            default: sprintf(errmsg,Str(X_52,"%s format %s not yet supported"),
                             sfname, getstrformat((int)p->format));
                     goto errcls;
            }
            p->sampframsiz = (short)(hdr->sampsize * hdr->nchnls);
            hdrsize = hdr->hdrsize;
            p->filetyp = hdr->filetyp;          /* copy type from headata       */
            p->aiffdata = hdr->aiffdata;
            p->sr = hdr->sr;
            p->nchnls = (short)hdr->nchnls;
        }
        else {                                  /* no hdr:  find info elsewhere */
            if (p->analonly) {
                if (!p->sr) {
                    p->sr = (long)DFLT_SR;
                    sprintf(errmsg,
                            Str(X_1016,"no -s and no soundheader, using sr default %ld"),p->sr);
                    warning(errmsg);
                }
            }
            else {
                warning(Str(X_1062,"no soundin header, presuming orchestra sr"));
                p->sr = (long) esr;
            }
            if (p->OUTOCOUNT)
              p->channel = p->OUTOCOUNT;
            else if (p->channel == ALLCHNLS)
                p->channel = 1;
            if (!p->format) {                 /* no format:                  */
                if (p->analonly)              /*  analonly defaults to short */
                    p->format = AE_SHORT;
                else p->format = O.outformat; /*  orch defaults to outformat */
            }
            sprintf(errmsg,
                    Str(X_55,"%s has no soundfile header, reading as %s, %d chnl%s"),
                    sfname, getstrformat((int)p->format), (int)p->channel,
                    p->channel == 1 ? "" : "s");
            warning(errmsg);
            p->sampframsiz = getsizformat((int)p->format) * p->channel;
            p->filetyp = 0;                   /* in_type can't be AIFF or WAV */
            p->aiffdata = NULL;
            p->nchnls = p->channel;
        }
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

        if ( p->filetyp == TYP_AIFF && bytrevhost() ||
             p->filetyp == TYP_AIFC && bytrevhost() ||
#ifdef NeXT
             !p->filetyp && bytrevhost() ||
#endif
             p->filetyp == TYP_WAV && !bytrevhost()) {
          if (p->format == AE_SHORT)          /* if audio_in needs byte rev */
            p->bytrev = bytrev2;            /*     set on sample size     */
                  /*RWD 3:2000 added AE_FLOAT*/
          else if (p->format == AE_LONG || p->format == AE_FLOAT)
            p->bytrev = bytrev4;
          else p->bytrev = NULL;
#ifdef NeXT
        if (!p->filetyp) printf(Str(X_1095,"opening NeXT infile %s, with%s bytrev\n"),
                sfname, p->bytrev == NULL ? Str(X_21," no") : "");
        else
#endif
          printf(Str(X_1093,"opening %s infile %s, with%s bytrev\n"),
                 p->filetyp == TYP_AIFF ? "AIFF" :
                 p->filetyp == TYP_AIFC ? "AIFF-C" : "WAV",
                 sfname, p->bytrev == NULL ? Str(X_21, " no") : "");
        }
        else p->bytrev = NULL;
        if (p->sampframsiz <= 0)                           /* must know framsiz */
            die(Str(X_882,"illegal sampframsiz"));
        if (hdr != NULL && hdr->audsize > 0 ) {            /* given audiosize   */
            p->audrem = hdr->audsize;
            p->framesrem = hdr->audsize / p->sampframsiz;  /*   find frames rem */
        }
        else {
            p->audrem = -1;                                /* else mark unknown */
            p->framesrem = -1;
        }
        skipframes = (long)(*p->iskptim * p->sr);
        framesinbuf = SNDINBUFSIZ / p->sampframsiz;
        if (skipframes < framesinbuf) {              /* if sound within 1st buf */
            int nreq;
            if (readlong) {                             /*  fill by direct read */
                nreq = SNDINBUFSIZ - sizeof(long);
                *(long *)p->inbuf = hdr->firstlong;
                n = sreadin(sinfd, p->inbuf+sizeof(long), nreq, p);
                p->bufend = p->inbuf + sizeof(long) + n;
            }
            else {
                nreq = SNDINBUFSIZ;
                n = sreadin(sinfd, p->inbuf, nreq, p);
                p->bufend = p->inbuf + n;
            }
            p->inbufp = p->inbuf + skipframes * p->sampframsiz;
        }
        else {                                          /* for greater skiptime: */
            long nbytes = skipframes * p->sampframsiz;
            if (hdrsize < 0) {
                int nbufs = nbytes/SNDINBUFSIZ;         /* if headersize unknown, */
                int nrem = nbytes - (long)nbufs * SNDINBUFSIZ;
                while (--nbufs)                         /*  spinrd to req boundry */
                    sreadin(sinfd,p->inbuf,SNDINBUFSIZ,p);
                if (nrem)
                    sreadin(sinfd,p->inbuf,nrem,p);
            }
            else if (lseek(sinfd, nbytes+hdrsize, 0) < 0)  /* else seek to bndry */
                    die(Str(X_1208,"soundin seek error"));
            if ((n = sreadin(sinfd,p->inbuf,SNDINBUFSIZ,p)) == 0)/* now rd fulbuf */
                p->endfile = 1;
            p->inbufp = p->inbuf;
            p->bufend = p->inbuf + n;
        }
        if (p->inbufp >= p->bufend)   /* needed? */
                p->endfile = 1;
        if (p->framesrem != -1)
            p->framesrem -= skipframes;              /* sampleframes to EOF   */
        datpos = hdrsize;
        return(sinfd);                              /* return the active fd  */

 errcls: close(sinfd);               /* init error:  close any open file */
 errtn:  return(-1);                  /*              return empty handed */
}

int SAsndgetset(
     char    *infilnam,                          /* Stand-Alone sndgetset() */
     SOUNDIN **ap,                               /* used by SoundAnal progs */
     MYFLT   *abeg_time,
     MYFLT   *ainput_dur,
     MYFLT   *asr,
     int     channel)
{                               /* Return -1 on failure */
        SOUNDIN  *p;
        char     quotname[80];
        int      infd;
static  ARGOFFS  argoffs = {0};     /* these for sndgetset */
static  OPTXT    optxt;

        sssfinit();                 /* stand-alone init of SFDIR etc. */
        esr = FL(0.0);                 /* set esr 0. with no orchestra   */
        optxt.t.outoffs = &argoffs; /* point to dummy OUTOCOUNT       */
        *ap = p = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
        p->h.optext = &optxt;
        p->ifilno = &sstrcod;
        p->iskptim = abeg_time;
        p->iformat = &fzero;
        sprintf(quotname,"%c%s%c",'"',infilnam,'"');
        p->STRARG = quotname;
        p->sr = (long)*asr;
/* G. Sullivan This modification is not really complete - calling routines
   should now really be modified to check for channel count > 1, when they
   are not able to handle this case. I have been lazy, and have not yet
   bothered to do this. The reason I made this change was so that
   cvanal could handle stereo, or quad, soundfiles */
        if (channel < 1 || ((channel > 4) && (channel != ALLCHNLS))) {
/*        if (channel < 1 || channel > 4)  { */         /* SAsnd is chan 1,2,3 or 4 */
            printf(Str(X_658,"channel request %d illegal\n"), channel);
            return(-1);
        }
        p->channel = channel;
        p->analonly = 1;
        if ((infd = sndgetset(p)) < 0)            /* open sndfil, do skiptime */
            return(-1);

        if (p->framesrem < 0 )
            warning(Str(X_1318,"undetermined file length, will attempt requested duration"));
        else {
            if (*ainput_dur == FL(0.0)) {         /* 0 durtim, use to EOF */
                p->getframes = p->framesrem;
                *ainput_dur = (MYFLT) p->getframes / p->sr;
            }
                             /* else chk that input dur is within filetime rem */
            else if ((p->getframes = (long)(p->sr * *ainput_dur)) > p->framesrem) {
                    p->getframes = p->framesrem;
                    warning(Str(X_789,"full requested duration not available"));
            }
            printf(Str(X_598,"analyzing %ld sample frames (%3.1f secs)"),
                    p->getframes, *ainput_dur);
            if (*abeg_time != 0.0)
                printf(Str(X_18," from timepoint %3.1f\n"), *abeg_time);
            else printf("\n");
        }
        return(infd);
}

long getsndin(int fd, MYFLT *fp, long nlocs, SOUNDIN *p)
        /* a simplified soundin */
{
        long  n, nread;
        MYFLT *fbeg = fp, *fend = fp + nlocs, gain;
        /*RWD 3:2000: let aiffdata->gainfac take precedence over PEAK chunk rescaling*/
        /* I assume non-IFF formats don't have the PEAK chunk, for now...*/
        MYFLT scalefac = INMYFLTFAC;

        if (p->aiffdata != NULL && p->aiffdata->gainfac > 0)
            gain = p->aiffdata->gainfac;
        else {
          gain = FL(1.0);
          /*RWD 3:2000*/
          if (p->do_floatscaling)
            scalefac *= p->fscalefac;
        }
        if (p->nchnls == 1 || p->channel == ALLCHNLS) {  /* MONO or ALLCHNLS */
          switch (p->format) {
            case AE_UNCH: {
                unsigned char *inbufp, *bufend;
                inbufp = (unsigned char *) p->inbufp;
                bufend = (unsigned char *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (unsigned char *) p->inbuf;
                        bufend = (unsigned char *) (p->inbuf + n);
                    }
                    /* convert unsigned char to signed by XOR 0x80 */
                    *fp++ = (MYFLT)( (short)((*inbufp++)^0x80) << 8 );
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_CHAR: {
                char *inbufp, *bufend;
                inbufp = p->inbufp;
                bufend = p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = p->inbuf;
                        bufend = p->inbuf + n;
                    }
                    *fp++ = (MYFLT)( (short)*inbufp++ << 8 ) * gain;
                }
                p->inbufp = inbufp;
                p->bufend = bufend;   /* must reinit after EOF this file */
            } break;
            case AE_ULAW: {
                unsigned char *inbufp, *bufend;
                inbufp = (unsigned char *) p->inbufp;
                bufend = (unsigned char *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (unsigned char *) p->inbuf;
                        bufend = (unsigned char *) (p->inbuf + n);
                    }
                    *fp++ = (MYFLT)ulaw_decode[*inbufp++] * gain;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_SHORT: {
                short  *inbufp, *bufend;
                inbufp = (short *) p->inbufp;
                bufend = (short *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (short *) p->inbuf;
                        bufend = (short *) (p->inbuf + n);
                    }
                    *fp++ = (MYFLT) *inbufp++ * gain;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_LONG: {
                long  *inbufp, *bufend;
                inbufp = (long *) p->inbufp;
                bufend = (long *) p->bufend;
                                /*RWD 3:2000 fixup formats */
                if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
                    p->filetyp==TYP_AIFC) {
                  MYFLT val;
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                      if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                        break;
                      inbufp = (long *) p->inbuf;
                      bufend = (long *) (p->inbuf + n);
                    }
                    val = (MYFLT)((double)*inbufp++ * INLONGFAC);
                    *fp++ = val * gain;
                  }
                }
                else {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (long *) p->inbuf;
                        bufend = (long *) (p->inbuf + n);
                    }
                    *fp++ = (MYFLT) *inbufp++ * gain;
                  }
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_FLOAT: {
                MYFLT  *inbufp, *bufend;
                inbufp = (MYFLT *) p->inbufp;
                bufend = (MYFLT *) p->bufend;
                                /*RWD 3:2000 fixup formats */
                if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
                    p->filetyp==TYP_AIFC) {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                      if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                        break;
                      inbufp = (MYFLT *) p->inbuf;
                      bufend = (MYFLT *) (p->inbuf + n);
                    }
                    *fp++ = (MYFLT)(*inbufp++ * scalefac * gain);
                  }
                }
                else {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (MYFLT *) p->inbuf;
                        bufend = (MYFLT *) (p->inbuf + n);
                    }
                    *fp++ = *inbufp++ * gain;
                }
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            default: goto getserr;
          }
        }
        else {                                /* MULTI-CHANNEL, SELECT ONE */
          int chcnt = 0, chreq = p->channel, nchnls = p->nchnls;
          nlocs *= nchnls;
          switch (p->format) {
            case AE_UNCH: {
                unsigned char *inbufp, *bufend;
                inbufp = (unsigned char *) p->inbufp;
                bufend = (unsigned char *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (unsigned char *) p->inbuf;
                        bufend = (unsigned char *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = (MYFLT) ( (short)(*inbufp^0x80) << 8 );
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_CHAR: {
                char *inbufp, *bufend;
                inbufp = p->inbufp;
                bufend = p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = p->inbuf;
                        bufend = p->inbuf + n;
                    }
                    if (++chcnt == chreq)
                        *fp++ = (MYFLT) ( (short)*inbufp << 8 ) * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                }
                p->inbufp = inbufp;
                p->bufend = bufend;
            } break;
            case AE_ULAW: {
                unsigned char *inbufp, *bufend;
                inbufp = (unsigned char *) p->inbufp;
                bufend = (unsigned char *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (unsigned char *) p->inbuf;
                        bufend = (unsigned char *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = (MYFLT) ulaw_decode[*inbufp] * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_SHORT: {
                short  *inbufp, *bufend;
                inbufp = (short *) p->inbufp;
                bufend = (short *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (short *) p->inbuf;
                        bufend = (short *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = (MYFLT) *inbufp * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_LONG: {
                long  *inbufp, *bufend;
                inbufp = (long *) p->inbufp;
                bufend = (long *) p->bufend;
                                /*RWD 3:2000 fixup formats */
                if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
                    p->filetyp==TYP_AIFC) {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                      if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                        break;
                      inbufp = (long *) p->inbuf;
                      bufend = (long *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                      *fp++ = (MYFLT) (*inbufp * INLONGFAC) * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                  }
                }
                else {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (long *) p->inbuf;
                        bufend = (long *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = (MYFLT) *inbufp * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                  }
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            case AE_FLOAT: {
                MYFLT  *inbufp, *bufend;
                inbufp = (MYFLT *) p->inbufp;
                bufend = (MYFLT *) p->bufend;
                                /*RWD 3:2000 fixup formats */
                if(p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
                   p->filetyp==TYP_AIFC) {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                      if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                        break;
                      inbufp = (MYFLT *) p->inbuf;
                      bufend = (MYFLT *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                      *fp++ = (MYFLT)(*inbufp * scalefac) * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                  }
                }
                else {
                  while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (MYFLT *) p->inbuf;
                        bufend = (MYFLT *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = *inbufp * gain;
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                  }
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            default: goto getserr;
          }
        }
        nread = fp - fbeg;
        while (fp < fend)    /* if incomplete */
            *fp++ = FL(0.0);   /*  pad with 0's */
        return(nread);

 getserr:
        printf(Str(X_648,"cannot read sformat %s\n"),getstrformat((int)p->format));
        return(-1L);
}

void sndinset(SOUNDIN *p)    /* init routine for instr soundin   */
                             /* shares above sndgetset with SAsndgetset, gen01*/
{
        int     sinfd;
        long    skipframes;

        if (p->fdch.fd != 0) {  /* if file already open, rtn */
          /* RWD: it is not safe to assume all compilers init this to 0 */
          /* RWD start of mods: for reinits, reset to init point of file */
          /* this is not actually RIGHT yet, but it is close... */
          skipframes = (long)(*p->iskptim * p->sr);
          /* UGH, want datpos to be in SOUNDIN struct somewhere, or add a */
          /* function to get hdrsize...? */
          lseek(p->fdch.fd,datpos+(skipframes* p->sampframsiz),SEEK_SET);
          return;
        }
        p->channel = ALLCHNLS;                   /* reading all channels      */
        p->analonly = 0;
        if ((sinfd = sndgetset(p)) >= 0) {       /* if soundinset successful  */
                p->fdch.fd = sinfd;              /*    store & log the fd     */
                fdrecord(&p->fdch);              /*    instr will close later */
        }
        else initerror(errmsg);                  /* else just print the errmsg*/
                                /* The rest is only used in soundin2, but
                                 * Does little harm so save code size */
/*         p->base_sample_gab = 0; */
/*         p->fl_buf = 0; */
/*         p->initflag_gab = 1; */
/*         p->phase_gab = (p->OUTOCOUNT == 1 ? 27 : 13) + *p->iskptim * p->sr; */
        /*        p->phase_gab = initphase + *p->iskptim * p->sr; */
}

void soundin(SOUNDIN *p)
{
    short       nsmps;
    MYFLT       *r1, *r2, *r3, *r4;
    int chnsout, n, ntogo;
        /*RWD 3:2000*/
    MYFLT scalefac = INMYFLTFAC;
    if (p->do_floatscaling)
      scalefac *= p->fscalefac;

    if ((!p->bufend) || (!p->inbufp) || (!p->sampframsiz)) {
      initerror(Str(X_1210,"soundin: not initialised"));
      return;
    }
    r1 = p->r1;
    r2 = p->r2;
    r3 = p->r3;
    r4 = p->r4;
    chnsout = p->OUTOCOUNT;
    ntogo = ksmps;
    if (p->endfile)
        goto filend;
    nsmps = (p->bufend - p->inbufp) / p->sampframsiz;
    if (nsmps > ksmps)
        nsmps = ksmps;
    ntogo -= nsmps;
    switch (p->format) {
    case AE_UNCH: {
      unsigned char *inbufp = (unsigned char *)p->inbufp;
    byte:
      switch(chnsout) {
      case 1:
        do {
          *r1++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
        } while (--nsmps);
      break;
      case 2:
        do {
          *r1++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
          *r2++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
        } while (--nsmps);
        break;
      case 4:
        do {
          *r1++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
          *r2++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
          *r3++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
          *r4++ = (MYFLT)((short)((*inbufp++)^0x80) << 8 );
        } while (--nsmps);
      }
      if (inbufp >= (unsigned char *)p->bufend) {
        if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
          p->endfile = 1;
          if (ntogo) goto filend;
          else return;
        }
        inbufp = (unsigned char *)p->inbuf;
        p->bufend = p->inbuf + n;
        if (ntogo > 0) {
          if ((nsmps = n / p->sampframsiz) > ntogo)
            nsmps = ntogo;
          ntogo -= nsmps;
          goto byte;
        }
      }
      p->inbufp = (char *)inbufp;
      break;
    }
    case AE_CHAR: {
      char *inbufp = p->inbufp;
    chars:
      switch(chnsout) {
      case 1:
        do {
          *r1++ = (MYFLT) ( (short)*inbufp++ << 8 );
        } while (--nsmps);
        break;
      case 2:
        do {
          *r1++ = (MYFLT) ( (short)*inbufp++ << 8 );
          *r2++ = (MYFLT) ( (short)*inbufp++ << 8 );
        } while (--nsmps);
        break;
      case 4:
        do {
          *r1++ = (MYFLT) ( (short)*inbufp++ << 8 );
          *r2++ = (MYFLT) ( (short)*inbufp++ << 8 );
          *r3++ = (MYFLT) ( (short)*inbufp++ << 8 );
          *r4++ = (MYFLT) ( (short)*inbufp++ << 8 );
        } while (--nsmps);
      }
      if (inbufp >= p->bufend) {
        if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
          p->endfile = 1;
          if (ntogo) goto filend;
          else return;
        }
        inbufp = p->inbuf;
        p->bufend = p->inbuf + n;
        if (ntogo > 0) {
          if ((nsmps = n / p->sampframsiz) > ntogo)
            nsmps = ntogo;
          ntogo -= nsmps;
          goto chars;
        }
      }
      p->inbufp = inbufp;
      break;
    }
    case AE_ULAW:
      {
        unsigned char *inbufp = (unsigned char *)p->inbufp;
      ulaw:
        switch(chnsout) {
        case 1:
          do {
            *r1++ = (MYFLT) ulaw_decode[*inbufp++];
          } while (--nsmps);
          break;
        case 2:
          do {
            *r1++ = (MYFLT) ulaw_decode[*inbufp++];
            *r2++ = (MYFLT) ulaw_decode[*inbufp++];
          } while (--nsmps);
          break;
        case 4:
          do {
            *r1++ = (MYFLT) ulaw_decode[*inbufp++];
            *r2++ = (MYFLT) ulaw_decode[*inbufp++];
            *r3++ = (MYFLT) ulaw_decode[*inbufp++];
            *r4++ = (MYFLT) ulaw_decode[*inbufp++];
          } while (--nsmps);
        }
        if (inbufp >= (unsigned char *)p->bufend) {
          if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
            p->endfile = 1;
            if (ntogo) goto filend;
            else return;
          }
          inbufp = (unsigned char *)p->inbuf;
          p->bufend = p->inbuf + n;
          if (ntogo > 0) {
            if ((nsmps = n / p->sampframsiz) > ntogo)
              nsmps = ntogo;
            ntogo -= nsmps;
            goto ulaw;
          }
        }
        p->inbufp = (char *)inbufp;
        break;
      }
    case AE_SHORT: {
      short *inbufp = (short *)p->inbufp;
    shorts:
      switch(chnsout) {
      case 1:
        do {
          *r1++ = (MYFLT) *inbufp++;
        } while (--nsmps);
        break;
      case 2:
        do {
          *r1++ = (MYFLT) *inbufp++;
          *r2++ = (MYFLT) *inbufp++;
        } while (--nsmps);
        break;
      case 4:
        do {
          *r1++ = (MYFLT) *inbufp++;
          *r2++ = (MYFLT) *inbufp++;
          *r3++ = (MYFLT) *inbufp++;
          *r4++ = (MYFLT) *inbufp++;
        } while (--nsmps);
      }
      if (inbufp >= (short *)p->bufend) {
        if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
          p->endfile = 1;
          if (ntogo) goto filend;
          else return;
        }
        inbufp = (short *) p->inbuf;
        p->bufend = p->inbuf + n;
        if (ntogo > 0) {
          if ((nsmps = n / p->sampframsiz) > ntogo)
            nsmps = ntogo;
          ntogo -= nsmps;
          goto shorts;
        }
      }
      p->inbufp = (char *) inbufp;
      break;
    }
    case AE_LONG: {
      long *inbufp = (long *)p->inbufp;
    longs:
      switch(chnsout) {
      case 1:
        /*RWD 3:2000 format fixup */
        if(p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
           p->filetyp==TYP_AIFC) {
          do {
                *r1++ = (MYFLT)(*inbufp++ * INLONGFAC);
          } while (--nsmps);
        }
        else {
          do {
            *r1++ = (MYFLT) *inbufp++;
          } while (--nsmps);
        }
        break;
      case 2:
        /*RWD 3:2000*/
        if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
            p->filetyp==TYP_AIFC) {
          do {
                *r1++ = (MYFLT)(*inbufp++ * INLONGFAC);
                *r2++ = (MYFLT)(*inbufp++ * INLONGFAC);
          } while (--nsmps);
        }
        else {
          do {
            *r1++ = (MYFLT) *inbufp++;
            *r2++ = (MYFLT) *inbufp++;
          } while (--nsmps);
        }
        break;
      case 4:
        /*RWD 3:2000*/
        if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
            p->filetyp==TYP_AIFC){
          do {
            *r1++ = (MYFLT)(*inbufp++ * INLONGFAC);
            *r2++ = (MYFLT)(*inbufp++ * INLONGFAC);
            *r3++ = (MYFLT)(*inbufp++ * INLONGFAC);
            *r4++ = (MYFLT)(*inbufp++ * INLONGFAC);
          } while (--nsmps);
        }
        else {
          do {
            *r1++ = (MYFLT) *inbufp++;
            *r2++ = (MYFLT) *inbufp++;
            *r3++ = (MYFLT) *inbufp++;
            *r4++ = (MYFLT) *inbufp++;
          } while (--nsmps);
        }
      }
      if (inbufp >= (long *)p->bufend) {
        if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
          p->endfile = 1;
          if (ntogo) goto filend;
          else return;
        }
        inbufp = (long *)p->inbuf;
        p->bufend = p->inbuf + n;
        if (ntogo > 0) {
          if ((nsmps = n / p->sampframsiz) > ntogo)
            nsmps = ntogo;
          ntogo -= nsmps;
          goto longs;
        }
      }
      p->inbufp = (char *)inbufp;
      break;
    }
    case AE_FLOAT: {
      float *inbufp = (float *)p->inbufp;
    floats:
      switch(chnsout) {
      case 1:
        /*RWD 3:2000*/
        if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
            p->filetyp==TYP_AIFC) {
          do {
            *r1++ = (MYFLT)(*inbufp++ * scalefac);
          } while (--nsmps);
        } else {
          do {
            *r1++ = (MYFLT)*inbufp++;
          } while (--nsmps);
        }
        break;
      case 2:
        /*RWD 3:2000*/
        if(p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
           p->filetyp==TYP_AIFC) {
          do {
            *r1++ = (MYFLT)(*inbufp++ * scalefac);
            *r2++ = (MYFLT)(*inbufp++ * scalefac);
          } while (--nsmps);
        } else {
          do {
            *r1++ = (MYFLT)*inbufp++;
            *r2++ = (MYFLT)*inbufp++;
          } while (--nsmps);
        }
        break;
      case 4:
        /*RWD 3:2000*/
        if (p->filetyp==TYP_WAV || p->filetyp==TYP_AIFF ||
            p->filetyp==TYP_AIFC) {
          do {
            *r1++ = (MYFLT)(*inbufp++ * scalefac);
            *r2++ = (MYFLT)(*inbufp++ * scalefac);
            *r3++ = (MYFLT)(*inbufp++ * scalefac);
            *r4++ = (MYFLT)(*inbufp++ * scalefac);
          } while (--nsmps);
        } else {
          do {
            *r1++ = (MYFLT)*inbufp++;
            *r2++ = (MYFLT)*inbufp++;
            *r3++ = (MYFLT)*inbufp++;
            *r4++ = (MYFLT)*inbufp++;
          } while (--nsmps);
        }
      }
      if ((char *)inbufp >= p->bufend) {
        if ((n = sreadin(p->fdch.fd,p->inbuf,SNDINBUFSIZ,p)) == 0) {
          p->endfile = 1;
          if (ntogo) goto filend;
          else return;
        }
        inbufp = (float *) p->inbuf;
        p->bufend = p->inbuf + n;
        if (ntogo > 0) {
          if ((nsmps = n / p->sampframsiz) > ntogo)
            nsmps = ntogo;
          ntogo -= nsmps;
          goto floats;
        }
      }
      p->inbufp = (char *) inbufp;
      break;
    }
    default:
      dies(Str(X_1207,"soundin of %s not implemented"), getstrformat((int)p->format));
    }
    return;

 filend:
    if ((nsmps = ntogo)>0) {    /* At RWD's suggestion */
      switch(chnsout) {                   /* if past end of file, */
      case 1:
        do *r1++ = FL(0.0);               /*    move in zeros     */
        while (--nsmps);
        break;
      case 2:
        do {
          *r1++ = FL(0.0);
          *r2++ = FL(0.0);
        } while (--nsmps);
        break;
      case 4:
        do {
          *r1++ = FL(0.0);
          *r2++ = FL(0.0);
          *r3++ = FL(0.0);
          *r4++ = FL(0.0);
        } while (--nsmps);
      }
    }
}

/*gab-A1*/
long getsndin2(int fd, short *fp, long nlocs, SOUNDIN *p) /* handles shorts */
        /* a simplified soundin */
{
        long  n, nread;
        short *fbeg = fp, *fend = fp + nlocs; 
		MYFLT	gain;

        if (p->aiffdata != NULL)
            gain = p->aiffdata->gainfac;
        else gain = 1.0f;
   if (p->nchnls == 1 || p->channel == ALLCHNLS) {  /* MONO or ALLCHNLS */
       switch (p->format) {
            case AE_SHORT: {
                register short  *inbufp, *bufend;
                inbufp = (short *) p->inbufp;
                bufend = (short *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (short *) p->inbuf;
                        bufend = (short *) (p->inbuf + n);
                    }
                    *fp++ = (short)(*inbufp++ * gain);
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            default: goto getserr;
       }
   } else {                                /* MULTI-CHANNEL, SELECT ONE */
   		int chcnt = 0, chreq = p->channel, nchnls = p->nchnls;
   		nlocs *= nchnls;
   	  switch (p->format) {
            case AE_SHORT: {
                short  *inbufp, *bufend;
                inbufp = (short *) p->inbufp;
                bufend = (short *) p->bufend;
                while (nlocs--) {
                    if (inbufp >= bufend) {
                        if ((n = sreadin(fd,p->inbuf,SNDINBUFSIZ,p)) == 0)
                            break;
                        inbufp = (short *) p->inbuf;
                        bufend = (short *) (p->inbuf + n);
                    }
                    if (++chcnt == chreq)
                        *fp++ = (short)(*inbufp * gain);
                    inbufp++;
                    if (chcnt == nchnls) chcnt = 0;
                }
                p->inbufp = (char *) inbufp;
                p->bufend = (char *) bufend;
            } break;
            default: goto getserr;
          }
        }
        nread = fp - fbeg;
        while (fp < fend)    /* if incomplete */
            *fp++ = 0;   /*  pad with 0's */
        return(nread);

getserr: printf("cannot read sformat %s\n",getstrformat((int)p->format));
        return(-1L);
}
