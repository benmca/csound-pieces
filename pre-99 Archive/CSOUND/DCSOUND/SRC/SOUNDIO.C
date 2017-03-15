#include <windows.h> /*gab c3 */
#include "cs.h"                 /*                      SOUNDIO.C       */
#include "soundio.h"
#include <math.h>
#ifdef _macintosh
#include "MacTransport.h"
#endif


/******* RWD 3:2000 requirements and assumtions for sample formats:
 * (1)  the assumed 'normal' range for a Csound audio sample is +- 32767.0
 *	This will thus translate directly to 16bit storage, with a direct cast.
 * (2)  floating-point WAVE and AIFF-C files should contain normalized floats (+- 1.0)
 *	so the data must be scaled accordingly, based on (1).
 * (3)  32bit integer files contain samples in range +- (2^^31)-1, so again must be scaled
 *      from the Csound 'normal' range.
 * (4)  (if/when 24bit formats are supported, samples must be similarly scaled
 *      into the range (2^^23)-1.
 * (5)  PEAK data IN ALL CASES is normalized to +- 1.0. For floatsam files, where the values can
 *      exceed this range, the PEAK values will record that directly.
 *      For all integer formats, PEAK will reflect clipping, so will never exceed +-1.0.
 */

static  char    *sfoutname;                         /* soundout filename    */
static  char    *inbuf;
        char    *outbuf;                            /* contin sndio buffers */
static  char    *chinbufp, *choutbufp;              /* char  pntr to above  */
static  short   *shinbufp, *shoutbufp;              /* short pntr           */
static  long    *llinbufp, *lloutbufp;              /* long  pntr           */
static  float   *flinbufp, *floutbufp;              /* MYFLT pntr           */
static  unsigned inbufrem,  outbufrem;              /* in monosamps (see openin,iotranset) */
/* static */ unsigned inbufsiz,  outbufsiz;      /* GAB 11/Jan/2001 */        /* alloc in sfopenin/out     */
static  int     isfd, isfopen = 0, infilend = 0;    /* (real set in sfopenin)    */
static  int     osfd, osfopen = 0;                  /* (real set in sfopenout)   */
static  int     pipdevin = 0, pipdevout = 0;        /* mod by sfopenin,sfopenout */
        long    nrecs = 0;
unsigned long   nframes = 1;
extern  MYFLT   *spin, *spout, maxamp[], *maxampend;
extern  unsigned long    maxpos[MAXCHNLS], smaxpos[MAXCHNLS], omaxpos[MAXCHNLS];
extern  long    rngcnt[];
extern  short   rngflg, multichan;
extern  int     nspin, nspout, nchnls, ksmps;
extern  HEADATA *readheader(int, char*, SOUNDIN*);
extern  short   ulaw_decode[];
extern  OPARMS  O;
extern  int	dither_output;

static  SOUNDIN *p;    /* to be passed via sreadin() */
static  int     (*audrecv)(char *, int), audread(char *, int);
/*static*/  void    (*audtran)(char *, int); /* gab d3 */
static  void	audwrite(char *, int), audwrtrev2(char *, int), audwrtrev4(char *, int); /*gab d3*/
extern  void    bytrev2(char *, int), bytrev4(char *, int);
extern  void	rewriteheader(int, long, int);
extern  int     openin(char *), openout(char *, int), bytrevhost(void), getsizformat(int);
extern  char    *getstrformat(int), *retfilnam;

#ifdef RTAUDIO
#ifdef GAB_RT /*gab-A1*/
extern  int   (*rtrecord)(char *, int);  
extern  void  (*rtplay)(char *, int); 
extern  void  (*rtplay_and_file)(char *, int); 
extern  void  (*write_to_file) (char *, int);
void do_events_timing(void); 
int 	rt_output_flag = 0; /*gab b1*/ 
extern int directSound_flag;
extern int directSoundCapture_flag;
int 	o_flag = 0;  

#include "dsbuffer.h"

MYFLT *spout3D[BUF3D_MAX];
int nspout3D[BUF3D_MAX],spout3Dnum;
DS3D *instance3D[BUF3D_MAX];
extern void Dsound3d(char *outbuf, int nbytes, DS3D *instance);
char *outbuf3D[BUF3D_MAX];
unsigned int outbuf3Dsiz;
short *shoutbuf3Dp[BUF3D_MAX];
#else	/*GAB_RT*/
extern  int     rtrecord(char *, int);
extern  void    rtplay(char *, int);
#endif	/*GAB_RT*/
extern  void    rtclose(void);
extern  void    recopen(int, int, MYFLT, int);
extern  void    playopen(int, int, MYFLT, int);
#define DEVAUDIO 0x7fff         /* unique fd for rtaudio  */
# ifdef sol
extern	int	audiofd;
# endif
#endif
#ifdef PIPES
FILE* pin=NULL, *pout=NULL;
/*sbrandon: added NeXT to line below*/
# if defined(SGI) || defined(LINUX) || defined(__BEOS__) || defined(NeXT)
#  define _popen popen
#  define _pclose pclose
# endif
#endif
void (*spinrecv)(void), (*spoutran)(void), (*nzerotran)(long);
static void byterecv(void), charrecv(void),  alawrecv(void), ulawrecv(void),
            shortrecv(void),longrecv(void), floatrecv(void);
static void bytetran(void), chartran(void),  alawtran(void), ulawtran(void),
            shortran(void), longtran(void), floatran(void);
static void bytetran_d(void), chartran_d(void), ulawtran_d(void),
            shortran_d(void), longtran_d(void);
static void bzerotran(long), czerotran(long), azerotran(long), uzerotran(long),
            szerotran(long), lzerotran(long), fzerotran(long);

static void d3dtran(void), d3dzerotran(long), shortranRT(void);
#ifdef VST
static void vstrecv(void),vsttran(void); /*gab e1 */
#endif

void iotranset(void)
    /* direct recv & tran calls to the right audio formatter  */
{   /*                            & init its audio_io bufptr  */
        switch(O.informat) {
	case AE_UNCH:  spinrecv = byterecv;          /* J. Mohr  1995 Oct 17 */
	               chinbufp = inbuf;
	               break;
        case AE_CHAR:  spinrecv = charrecv;
                       chinbufp = inbuf;
                       break;
        case AE_ALAW:  spinrecv = alawrecv;
                       chinbufp = inbuf;
                       break;
        case AE_ULAW:  spinrecv = ulawrecv;
                       chinbufp = inbuf;
                       break;
        case AE_SHORT: spinrecv = shortrecv;
                       shinbufp = (short *)inbuf;
                       break;
        case AE_LONG:  spinrecv = longrecv;
                       llinbufp = (long  *)inbuf;
                       break;
        case AE_FLOAT: spinrecv = floatrecv;
                       flinbufp = (float *)inbuf;
                       break;
#ifdef GAB_RT /*gab-A1*/
		case AE_D3D:   spinrecv = shortrecv;
	                   shinbufp = (short *)inbuf;
                       break;
		case AE_NO_AUDIO: 
					spinrecv = do_events_timing;
                    shinbufp = (short *)inbuf;
					break;
#	ifdef VST
		case AE_VST: 
					spinrecv = vstrecv;
                    flinbufp = (float *)inbuf;
					break;
#	endif 
#endif /*GAB_RT*/
        default: die(Str(X_1328,"unknown audio_in format"));
        }

        switch(O.outformat) {
	case AE_UNCH:  spoutran = (dither_output ? bytetran_d : bytetran); /* J. Mohr  1995 Oct 17 */
	               nzerotran = bzerotran;
	               choutbufp = outbuf;
	               break;
        case AE_CHAR:  spoutran = (dither_output ? chartran_d : chartran);
                       nzerotran = czerotran;
                       choutbufp = outbuf;
		       break;
        case AE_ALAW:  spoutran = alawtran;
                       nzerotran = azerotran;
                       choutbufp = outbuf;
		       break;
        case AE_ULAW:  spoutran = (dither_output ? ulawtran_d : ulawtran);
                       nzerotran = uzerotran;
                       choutbufp = outbuf;
		       break;
        case AE_SHORT: spoutran = (dither_output ? shortran_d : shortran);
                       nzerotran = szerotran;
                       shoutbufp = (short *)outbuf;
		       break;
        case AE_LONG:  spoutran = (dither_output ? longtran_d : longtran);
                       nzerotran = lzerotran;
                       lloutbufp = (long  *)outbuf;
		       break;
        case AE_FLOAT: spoutran = floatran;
                       nzerotran = fzerotran;
                       floutbufp = (float *)outbuf;
		       break;
#ifdef GAB_RT /*gab-A1*/
        case AE_NO_AUDIO: 
					spoutran = do_events_timing;  
                    nzerotran = (void (*)(long))do_events_timing;
 					shoutbufp = (short *)outbuf;
		       break;
		case AE_D3D: /*gab c2*/
			{		int j;
					spoutran = d3dtran;  
                    nzerotran = d3dzerotran;
 					shoutbufp = (short *)outbuf;
					for (j=0; j < spout3Dnum; j++)
						shoutbuf3Dp[j] = (short *)outbuf3D[j];
			}
		       break;
#	ifdef VST
        case AE_VST: spoutran = vsttran;
                     nzerotran = vsttran;//vstzerotran;
                     floutbufp = (float *)outbuf;
		       break;
#	endif
#endif /*GAB_RT*/
        default: die(Str(X_1329,"unknown audio_out format"));
        }
}

void sndwrterr(unsigned nret, unsigned nput) /* report soundfile write(osfd) error      */
                                /* called after chk of write() bytecnt  */
{
    void sfcloseout(void);
    printf(Str(X_1203,"soundfile write returned bytecount of %d, not %d\n"),nret,nput);
    printf(Str(X_77,"(disk may be full...\n closing the file ...)\n"));
    outbufrem = O.outbufsamps;       /* consider buf is flushed */
    sfcloseout();                    /* & try to close the file */
    die(Str(X_563,"\t... closed\n"));
}

static int audread(char *inbuf, int nbytes)        /* diskfile read option for audrecv's */
                                /*     assigned during sfopenin()     */
{
    return(sreadin(isfd,inbuf,nbytes,p));
}

#if !defined(SYMANTEC) && !defined(_macintosh) && !defined(LINUX) && !defined(__BEOS__)
extern int write(int, const void*, unsigned int);
#endif
/* RWD.2.98 WAVE floats format must be NORMALIZED +- 1 */
static void audwrite_norm( char *outbuf,int nbytes)
{
#define NORMFACT FL(32768.0)
    int i,n;
    int cnt = nbytes / sizeof(MYFLT);
    MYFLT *fptr = (MYFLT *)outbuf;
    for(i=0;i<cnt;i++)
      *fptr++ /= NORMFACT;
    if ((n = write(osfd, outbuf, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
    if (O.rewrt_hdr)
      rewriteheader(osfd, nbytes +(long)nrecs*outbufsiz, 0);
    nrecs++;                /* JPff fix */
    if (O.heartbeat) {
      if (O.heartbeat==1) {
#ifdef SYMANTEC
	nextcurs();
#elif __BEOS__
        putc('.', stderr); fflush(stderr);
#else
        putc("|/-\\"[nrecs&3], stderr); putc(8,stderr);
#endif
      }
      else if (O.heartbeat==2) putc('.', stderr);
      else if (O.heartbeat==3) {
#ifdef CWIN
        char report[40];
        extern void cwin_report_right(char *);
        sprintf(report, "%d(%.3f)", nrecs, nrecs/ekr);
        cwin_report_right(report);
#else
	int n;
	err_printf( "%d(%.3f)%n", nrecs, nrecs/ekr, &n);
	while (n--) err_printf("\b");
#endif
      }
      else err_printf("\a");
    }
    if (!POLL_EVENTS()) exit(1);
}



static void audwrite(char *outbuf, int nbytes)    /* diskfile write option for audtran's */
                                /*      assigned during sfopenout()    */
{
    int n;
    if (osfd<0) return;
    if ((n = write(osfd, outbuf, nbytes)) < nbytes)
      sndwrterr(n, nbytes);
    if (O.rewrt_hdr)
      rewriteheader(osfd, nbytes +(long)nrecs*outbufsiz, 0);
    nrecs++;                /* JPff fix */
    if (O.heartbeat) {
      if (O.heartbeat==1) {
#ifdef SYMANTEC
	nextcurs();
#else
        putc("|/-\\"[nrecs&3], stderr); putc(8,stderr);
#endif
      }
      else if (O.heartbeat==2) putc('.', stderr);
      else if (O.heartbeat==3) {
#ifdef CWIN
        char report[40];
        extern void cwin_report_right(char *);
        sprintf(report, "%d(%.3f)", nrecs, nrecs/ekr);
        cwin_report_right(report);
#else
	int n;
	err_printf( "%d(%.3f)%n", nrecs, nrecs/ekr, &n);
	while (n--) err_printf("\b");
#endif
      }
      else err_printf("\a");

    }
    if (!POLL_EVENTS()) exit(1);
}
#ifdef NeXT /*sbrandon: for RT playback */
static void swaprtplay(char *outbuf, int nbytes) /* soundout write option for audtran's */
                                /*      assigned during sfopenout()    */
{
    bytrev2(outbuf, nbytes);    /* rev bytes in shorts  */
    rtplay(outbuf, nbytes);   /*   & send the data    */
}
#endif

static void audwrtrev2(char *outbuf, int nbytes) /* diskfile write option for audtran's */
                                /*      assigned during sfopenout()    */
{
    bytrev2(outbuf, nbytes);    /* rev bytes in shorts  */
    audwrite(outbuf, nbytes);   /*   & send the data    */
}

/*RWD 3:2000  format fixups: reversed.... */
#define OUTFLOATFAC (FL(1.0) / FL(32768.0))
#define OUTLONGFAC (16)
static void audwrtrev4(char *outbuf, int nbytes) /* diskfile write option for audtran's */
                                /*      assigned during sfopenout()    */
{
	/*RWD 3:2000 added fixups */
#ifndef _macintosh
    /* skipping until a better solution is found..
       this is conflicting with the mac float/rescale stuff/etc.. */
    int i;
    if (O.outformat==AE_LONG) {
      long *sp = (long *) outbuf;
      long nsamps = nbytes/sizeof(long);
      for (i=0;i < nsamps;i++)
        *sp++ <<= OUTLONGFAC;
    }
    else if (O.outformat==AE_FLOAT) {
      float *sp = (float *) outbuf;
      long nsamps = nbytes/sizeof(long);
      for(i=0;i < nsamps;i++)
        *sp++ *= (float)OUTFLOATFAC;
    }
#endif
    bytrev4(outbuf, nbytes);    /* rev bytes in longs   */
    audwrite(outbuf, nbytes);   /*   & send the data    */
}

/*RWD 3:2000 .... and non-byte-reversed files*/
static void audwrt4(char *outbuf,int nbytes)
{
#ifndef _macintosh
    /* skipping until a better solution is found..
       this is conflicting with the mac float/rescale stuff/etc.. */
    int i;
    if (O.outformat==AE_LONG) {
      long *sp = (long *) outbuf;
      long nsamps = nbytes/sizeof(long);
      for(i=0;i < nsamps;i++)
        *sp++ <<= OUTLONGFAC;
    }
    else if (O.outformat==AE_FLOAT) {
      float *sp = (float *) outbuf;
      long nsamps = nbytes/sizeof(long);
      for(i=0;i < nsamps;i++)
        *sp++ *= (float)OUTFLOATFAC;		
    }
#endif
    audwrite(outbuf, nbytes);   /*  & send the data    */
}

void sfopenin(void)             /* init for continuous soundin */
{                               /*    called only if -i flag   */
    HEADATA *hdr;
    char    *sfname;
    long     n, readlong = 0;

    if (p == NULL)
      p = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
    if (O.infilename != NULL && strcmp(O.infilename,"stdin") == 0) {
      sfname = O.infilename;
      isfd = 0;		/* get sound from stdin if requested */
      pipdevin = 1;
    }
#ifdef PIPES
    else if (O.infilename != NULL && O.infilename[0]=='|') {
      FILE *_popen(const char *, const char *);
      pin = _popen(O.infilename+1, "rb");
      isfd = fileno(pin);
      pipdevin = 1;
    }
#endif
#ifdef RTAUDIO
	if (directSoundCapture_flag) { /* gab c3 */
		extern void set_rtplay_Dsound();
		extern BOOL CreateDsoundCaptureObject(char *);									
		extern int RecordDsoundNowait(char * /*, int nbytes*/);
		char s[256];
		if (CreateDsoundCaptureObject(s) == FALSE)  {
			MessageBox( NULL,	
				s,
				"Unable to open DirectSoundCapture device",	
                MB_TASKMODAL|MB_ICONSTOP 	
				);
			exit(0);
		}
	    audrecv = (int (*)(char *, int)) RecordDsoundNowait;                          /* & redirect audio puts */
        isfd = DEVAUDIO;                         /* dummy file descriptor */
        pipdevin = 1;                           /* no backward seeks !   */
		goto inset;
	}
    else if (O.infilename != NULL &&
             (strcmp(O.infilename,"devaudio") == 0
#ifdef WIN32
              || strncmp(O.infilename,"devaudio", 7) == 0
              || strncmp(O.infilename,"adc", 3) == 0
#endif
              || strcmp(O.infilename,"adc") == 0)) {
#ifdef WIN32
      extern int win_dev;
      win_dev = 0;
      if (strncmp(O.infilename,"devaudio", 7) == 0)
        sscanf(O.infilename+7, "%d", &win_dev);
      else if (strncmp(O.infilename,"adc", 3) == 0)
        sscanf(O.infilename+3, "%d", &win_dev);
#endif
      sfname = O.infilename;
      recopen(nchnls,O.insampsiz,esr,2);  /* open devaudio for input */
      audrecv = rtrecord;                 /*  & redirect audio gets  */
      isfd = DEVAUDIO;                    /* dummy file descriptor */
      pipdevin   = 1;                     /* no backward seeks !   */
      goto inset;                         /* no header processing  */
    }
#endif
    else {			/* else build filename and open that */
      if ((isfd = openin(O.infilename)) < 0)
        dies(Str(X_947,"isfinit: cannot open %s"), retfilnam);
      sfname = retfilnam;
    }
    p->filetyp = 0;		/* initially non-typed for readheader */
    if ((hdr = readheader(isfd,sfname,p)) != NULL/* if headerblk returned */
        && !(readlong = hdr->readlong)) {          /* & hadn't readin audio */
      if (hdr->sr != (long)esr) {              /*    chk the hdr codes  */
        sprintf(errmsg,Str(X_607,"audio_in %s has sr = %ld, orch sr = %ld"),
                sfname, hdr->sr, (long)esr);
        warning(errmsg);
      }
      if (hdr->nchnls != nchnls) {
        sprintf(errmsg,Str(X_606,"audio_in %s has %ld chnls, orch %d chnls"),
                sfname, hdr->nchnls, nchnls);
        die(errmsg);
      }
      O.insampsiz = (int)hdr->sampsize; /*    & cpy header vals  */
      O.informat = (int) hdr->format;
      p->filetyp = hdr->filetyp;           
      p->audrem = hdr->audsize;
    }
    else {                                       /* no header:  defaults  */
      sprintf(errmsg,Str(X_54,"%s has no soundfile header, assuming %s"),
              sfname, getstrformat(O.outformat) );
      warning(errmsg);
      p->filetyp = 0;                          /*  (see also soundin.c) */
      p->audrem = -1;
    }
    if (p->filetyp == TYP_AIFF && bytrevhost() ||
        p->filetyp == TYP_AIFC && bytrevhost() ||
        p->filetyp == TYP_WAV && !bytrevhost()) {
      if (O.informat == AE_SHORT)        /* if audio_in needs byte rev */
        p->bytrev = bytrev2;           /*    set on sample size      */
      else if (O.informat == AE_LONG)
        p->bytrev = bytrev4;
      else if (O.informat == AE_FLOAT)
	p->bytrev = bytrev4;
      else p->bytrev = NULL;
      printf(Str(X_1093,"opening %s infile %s, with%s bytrev\n"),
             p->filetyp == TYP_AIFF ? "AIFF" :
             p->filetyp == TYP_AIFC ? "AIFF-C" : "WAV",
             sfname, p->bytrev == NULL ? Str(X_21," no") : "");
    }
    else p->bytrev = NULL;
    audrecv = audread;	/* will use standard audio gets  */

#ifdef RTAUDIO
 inset:
#endif
    inbufsiz = (unsigned)O.inbufsamps * O.insampsiz;/* calc inbufsize reqd   */
    inbuf = mcalloc((long)inbufsiz); /* alloc inbuf space     */
    printf(Str(X_1151,"reading %d-byte blks of %s from %s %s\n"),
           inbufsiz, getstrformat(O.informat), sfname,
           p->filetyp == TYP_AIFF ? "(AIFF)" :
           p->filetyp == TYP_AIFC ? "(AIFF-C)" :
           p->filetyp == TYP_WAV ? "(WAV)" : "");
    isfopen = 1;
    if (readlong) {		/*     & fill it from    */
      *(long *)inbuf = hdr->firstlong;
      n = sreadin(isfd, inbuf+sizeof(long), inbufsiz-sizeof(long), p);
      n += sizeof(long);
    }
    else n = audrecv(inbuf, inbufsiz); /*     file or devaudio  */
    inbufrem = (unsigned int)(n / O.insampsiz); /* datasiz in monosamps  */
}

void sfopenout(void)                            /* init for sound out       */
{                                               /* (not called if nosound)  */
    extern  void    writeheader(int, char*);

#ifdef NeXT
    if (O.outfilename == NULL && !O.filetyp) O.outfilename = "test.snd";
	else if (O.outfilename == NULL) O.outfilename = "test";
#else
    if (O.outfilename == NULL) {
      if (O.filetyp == TYP_WAV) O.outfilename = "test.wav";
      else if (O.filetyp == TYP_AIFF) O.outfilename = "test.aif";
      else O.outfilename = "test";
    }
#endif
    if (strcmp(O.outfilename,"stdout") == 0) {
      sfoutname = O.outfilename;
      osfd = O.stdoutfd;              /* send sound to stdout if requested */
      pipdevout = 1;
    }    
#ifdef PIPES
    else if (O.outfilename != NULL && O.outfilename[0]=='|') {
      FILE *_popen(const char *, const char *);
      pout = _popen(O.infilename+1, "wb");
      osfd = fileno(pout);
      pipdevout = 1;
      if (O.filetyp == TYP_AIFF || O.filetyp == TYP_WAV) {
        printf(Str(X_400,"Output file type changed to IRCAM for use in pipe\n"));
        O.filetyp = TYP_IRCAM;
      }
    }
#endif
	if(directSound_flag) { /* gab c3 */
		extern int sleep_flag;
		extern void set_dsound_sleep();
		extern void set_rtplay_Dsound();
		extern void set_current_process_priority_critical(void);
		extern void set_current_process_priority_normal(void);
		extern BOOL CreateDsoundObject(char *s);
		extern BOOL	flag3d;
		extern int critical_flag;
		char s[256];
		if (sleep_flag) 
			set_dsound_sleep();
		else 
			set_rtplay_Dsound();
		if (CreateDsoundObject(s) == FALSE)  {
			MessageBox( NULL, s, "Unable to open DirectSound device", MB_TASKMODAL|MB_ICONSTOP );
			exit(0);
		}
		if (flag3d) {
			int j;
			extern BOOL CreateDsListner(char * );
			extern BOOL CreateDs3d (char *, DS3D *);
			extern BOOL flagEAX;
			printf("Creating 3D Listener\n");
			if (CreateDsListner(s) == FALSE) {
				MessageBox( NULL, s, "Unable to use the DirectSound3D Listener", MB_TASKMODAL|MB_ICONSTOP );
				exit(0);
			}
			for (j=0; j < spout3Dnum; j++){
				if (CreateDs3d(s, instance3D[j] ) == FALSE) {
					MessageBox( NULL, s, "Unable to use a DirectSound3D Source",	MB_TASKMODAL|MB_ICONSTOP );
					exit(0);
				}
				printf("Creating 3D Source #%d\n",j);
#ifdef GAB_EAX
				if (flagEAX) {
					extern BOOL CreateEAXinterface(char *, DS3D *); 
					if (CreateEAXinterface(s, instance3D[j] ) == FALSE) {
						MessageBox( NULL, s, "Unable to use an EAX Source",	MB_TASKMODAL|MB_ICONSTOP );
						exit(0);
					}
				}
#endif //GAB_EAX
			}
		}
		if (critical_flag)  set_current_process_priority_critical(); /*Gab 18/8/97*/
		else set_current_process_priority_normal();
		osfd = DEVAUDIO;                         /* dummy file descriptor */
		if (o_flag) {
            if ((osfd = openout(O.outfilename, 3)) < 0)   /* else open sfdir or cwd */
				dies("sfinit: cannot open %s", retfilnam);
            sfoutname = mmalloc((long)strlen(retfilnam)+1);
            strcpy(sfoutname, retfilnam);       /*   & preserve the name */
			audtran = rtplay_and_file; 
			if (O.filetyp == TYP_AIFF && bytrevhost() || O.filetyp == TYP_WAV && !bytrevhost()) {
				if (O.outformat == AE_SHORT)        /* if audio out needs byte rev*/
					write_to_file = audwrtrev2;           /*   redirect the audio puts  */
				else if (O.outformat == AE_LONG)
					write_to_file = audwrtrev4;
				else write_to_file = audwrite;
			}
			else write_to_file = audwrite;                /* else use standard audio puts */
		}
		else audtran = rtplay;                        /* & redirect audio puts */
        pipdevout = 1;                           /* no backward seeks !   */
		goto outset;
	} /* end gab */
#ifdef RTAUDIO
    else if (strcmp(O.outfilename,"devaudio") == 0
			|| (rt_output_flag && !o_flag)	 /* gab-A1 */
#ifdef WIN32
              || strncmp(O.outfilename,"devaudio", 7) == 0
              || strncmp(O.outfilename,"dac", 3) == 0
#endif
              || strcmp(O.outfilename,"dac") == 0) {
#ifdef WIN32
      extern int win_dev;
      win_dev = 0;
	  if (O.infilename != NULL) { /* gab 13/Jan/2001 */
      if (strncmp(O.infilename,"devaudio", 7) == 0)
        sscanf(O.infilename+7, "%d", &win_dev);
      else if (strncmp(O.infilename,"dac", 3) == 0)
        sscanf(O.infilename+3, "%d", &win_dev);
	  } /* gab 13/Jan/2001 */
#endif
      sfoutname = O.outfilename;
      playopen(nchnls, O.outsampsiz, esr, 2);  /* open devaudio for out */
      audtran = rtplay;                        /* & redirect audio puts */
#ifdef NeXT /*sbrandon: even RT playback has to be swapped*/
# ifdef __LITTLE_ENDIAN__
 	audtran = swaprtplay;
# endif
#endif
      osfd = DEVAUDIO;                         /* dummy file descriptor */
      pipdevout = 1;                           /* no backward seeks !   */
#ifdef sol
      if (O.sfheader)
        writeheader(audiofd,"devaudio");
#endif
#if defined(_macintosh) || defined(SYMANTEC)
      O.outformat = AE_SHORT;
#endif
#ifdef _macintosh
      transport.state |= kGenRealtime;
#endif
      goto outset;                        /* no header needed      */
    }
#endif
    /*************************** GAB START ***************************/ /*gab-A1*/
	else if	 ((rt_output_flag && o_flag) || strcmp(O.outfilename,"both") == 0 ) { 
		if ((osfd = openout(O.outfilename, 3)) < 0)   /* else open sfdir or cwd */
			dies("sfinit: cannot open %s", retfilnam);
		sfoutname = mmalloc((long)strlen(retfilnam)+1);
		strcpy(sfoutname, retfilnam);       /*   & preserve the name */
		playopen(nchnls, O.outsampsiz, esr, 2);  /* open devaudio for out */
		audtran = rtplay_and_file;               /* & redirect audio puts */
		if (O.sfheader)         
			writeheader(osfd, sfoutname);       /* write header as required   */
		if (O.filetyp == TYP_AIFF && bytrevhost() || O.filetyp == TYP_WAV && !bytrevhost()) {
			if (O.outformat == AE_SHORT)        /* if audio out needs byte rev*/
				write_to_file = audwrtrev2;     /*   redirect the audio puts  */
			else if (O.outformat == AE_LONG)
				write_to_file = audwrtrev4;
			else write_to_file = audwrite;
		}
		else write_to_file = audwrite;                /* else use standard audio puts */
		goto outset;
	}
	else if ( O.outformat == AE_NO_AUDIO ) ; /* do nothing */
    /*GAB_RT******************************* GAB END **************************/ /*gab-A1*/
    else if (strcmp(O.outfilename,"null") == 0) {
      osfd = -1;
      sfoutname = mmalloc((long)strlen(retfilnam)+1);
      strcpy(sfoutname, retfilnam);       /*   & preserve the name */
    }      
    else {
      if ((osfd = openout(O.outfilename, 3)) < 0)   /* else open sfdir or cwd */
        dies(Str(X_1187,"sfinit: cannot open %s"), retfilnam);
      sfoutname = mmalloc((long)strlen(retfilnam)+1);
      strcpy(sfoutname, retfilnam);       /*   & preserve the name */
      if (strcmp(sfoutname, "/dev/audio") == 0) {
        /*      ioctl(   );   */
        pipdevout = 1;
      }
    }
#if defined(SYMANTEC)
    AddMacHeader(sfoutname,nchnls,esr,O.outsampsiz);  /* set Mac resource */
    SetMacCreator(sfoutname);               /*   set creator & file type */
#endif
    if (O.sfheader) {
      writeheader(osfd, sfoutname);       /* write header as required   */
#ifdef _macintosh
      transport.osfd = osfd;
      transport.eoheader = tell(osfd);
#endif
    }
    if (O.filetyp == TYP_AIFF && bytrevhost() ||
        O.filetyp == TYP_AIFC && bytrevhost() ||
        O.filetyp == TYP_WAV && !bytrevhost()) {
      if (O.outformat == AE_SHORT)        /* if audio out needs byte rev*/
        audtran = audwrtrev2;           /*   redirect the audio puts  */
	  /*RWD 3:2000 add AE_FLOAT */
      else if (O.outformat == AE_LONG || O.outformat == AE_FLOAT)
        audtran = audwrtrev4;
      else audtran = audwrite;
    }
#ifdef NeXT /*sbrandon*/
# ifdef __LITTLE_ENDIAN__ 
      if (!O.filetyp && O.outformat == AE_SHORT)        /* if audio out needs byte rev*/
        audtran = audwrtrev2;           /*   redirect the audio puts  */
      else if (!O.filetyp && (O.outformat == AE_LONG || O.outformat == AE_FLOAT))
        audtran = audwrtrev4;
# endif
#endif
    /*RWD 3:2000 non-reversed fixups */
	else if (O.filetyp == TYP_AIFF && !bytrevhost() ||
                 O.filetyp == TYP_AIFC && !bytrevhost() ||
                 O.filetyp == TYP_WAV && bytrevhost()) 
          audtran = audwrt4;
    else audtran = audwrite; /* else use standard audio puts */

#ifdef RTAUDIO    
outset:
#endif
    outbufsiz = (unsigned)O.outbufsamps * O.outsampsiz;/* calc outbuf size */
    //outbuf = mmalloc((long)outbufsiz); /*  & alloc bufspace */
    outbuf = mmalloc((long)30000*4); /* gab d2 *//*  & alloc bufspace */
    printf(Str(X_1382,"writing %d-byte blks of %s to %s"),
	   outbufsiz, getstrformat(O.outformat), sfoutname);
    if (strcmp(O.outfilename,"devaudio") == 0 	/* realtime output has no
                                                   header */
        || strcmp(O.outfilename,"dac") == 0)  printf("\n");
    else if (O.sfheader == 0) printf(" (raw)\n");
    else
      printf(" %s\n",
             O.filetyp == TYP_AIFF ? "(AIFF)" :
             O.filetyp == TYP_AIFC ? "(AIFF-C)" :
             O.filetyp == TYP_WAV ? "(WAV)" : 
#ifdef _macintosh				
             "(SDII)"
#elif defined(SFIRCAM)
             "(IRCAM)"
#elif defined(NeXT)
             "(NeXT)"
#else
             "(Raw)"
#endif
             );
    osfopen = 1;
    outbufrem = O.outbufsamps;
}

void sfnopenout(void)
{
    printf(Str(X_1079,"not writing to sound disk\n"));
    outbufrem = O.outbufsamps;          /* init counter, though not writing */
}

extern int close(int);

void sfclosein(void)
{
    if (!isfopen) return;
#ifdef RTAUDIO
    if (isfd == DEVAUDIO) {
      if (!osfopen || osfd != DEVAUDIO)
        rtclose();     /* close only if not open for output too */
    }           
    else
#endif
#ifdef PIPES
      if (pin != NULL) {
	int _pclose(FILE*);
	_pclose(pin);
	pin = NULL;
      }
      else
#endif
	close(isfd);
    isfopen = 0;
}

void sfcloseout(void)
{
        int     nb;

        if (!osfopen) return;
   if (osfd != DEVAUDIO) /*gab B2*/
        if ((nb = (O.outbufsamps-outbufrem) * O.outsampsiz) > 0)/* flush outbuffer */
                audtran(outbuf, nb);
#ifdef RTAUDIO
        if (osfd == DEVAUDIO) {
            if (!isfopen || isfd != DEVAUDIO)
#ifdef GAB_RT /*gab-A1*/
			{
				if (O.outformat != AE_NO_AUDIO) { /*gab 9-4-97*/
					unsigned int j=0;
					for (j=0; j < outbufsiz ; j++) outbuf[j]=0; /* fill the buffer with silence */
					for (j=0;j <3; j++)	audtran(outbuf, outbufsiz); /* flush the soundcard buffer */
					if (directSound_flag) {
						extern void DsoundStop();
						DsoundStop();
					}
					else rtclose();     /* close only if not open for input too */
				}
			}
#else 
                rtclose();     /* close only if not open for input too */
#endif /*GAB_RT*/
            goto report;
        }
#ifdef GAB_RT /*gab-A1*/
		if (strcmp(retfilnam,"both") == 0)	{  /*** GAB 2-sept-97 */
			rtclose();	
			if (O.sfheader) {	/* if header */
            	unsigned long datasize = nb ? (nrecs-1)*outbufsiz + nb : nrecs*outbufsiz;
            	rewriteheader(osfd, datasize, 0); /*  rewrite  */
        	}
			close(osfd);
			goto report;
		}
#endif /*GAB_RT*/
#endif
        if (O.sfheader && !pipdevout) {	/* if header, & backward seeks ok */
            unsigned long datasize =
	      nb ? (nrecs-1)*outbufsiz + nb : nrecs*outbufsiz;
            rewriteheader(osfd, datasize, 1); /*  rewrite  */
        }
#ifdef PIPES
	if (pout!=NULL) {
	  int _pclose(FILE*);
	  _pclose(pout);
	  pout = NULL;
	}
#endif
#ifndef SFSUN41
        if (!pipdevout)
#endif
                close(osfd);
#ifdef RTAUDIO
report: 
#endif
        printf(Str(X_44,"%ld %d-byte soundblks of %s written to %s"),
               nrecs, outbufsiz, getstrformat(O.outformat), sfoutname);
	if (strcmp(O.outfilename,"devaudio") == 0 	/* realtime output has no
header */
	         || strcmp(O.outfilename,"dac") == 0) printf("\n");
	else if (O.sfheader == 0) printf(" (raw)\n");
	else
	    printf(" %s\n",
	           O.filetyp == TYP_AIFF ? "(AIFF)" :
	           O.filetyp == TYP_AIFC ? "(AIFF-C)" :
	           O.filetyp == TYP_WAV ? "(WAV)" : 
#ifdef _macintosh
	                                  "(SDII)"
#elif defined(SFIRCAM)
	  	       			  "(IRCAM)"
#elif defined(NeXT)
                                          "(NeXT)"
#else
					  "(Raw)"
#endif
                   );
        osfopen = 0;
		if (access(sfoutname, 6))  chmod( sfoutname, S_IREAD | S_IWRITE );  /*gab-A1 removes read-only flag*/
}

static void bytetran()	                             /* J. Mohr  1995 Oct 17 */
                            /* same as above, but 8-bit unsigned char output */
{	      /*   sends HI-ORDER 8 bits of shortsamp, converted to unsigned */
    MYFLT	*sp, *maxampp;
    unsigned long	*maxps;
    long	longsmp, *rngp;
    int		n, spoutrem;
    MYFLT	absamp;

    sp = spout;			/* adr spout	*/
    spoutrem = nspout;		/* smps to go	*/
    maxampp = maxamp;
    maxps = maxpos;

nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;		/*	prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      if ((longsmp = (long)*sp) >= 0) {	/* +ive samp:	*/
        if (*sp > *maxampp) {		/*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {		/* out of range?     */
          longsmp = 32767;	/*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {					/* ditto -ive samp */
        if ((absamp = -*sp) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *choutbufp++ = (unsigned char)(longsmp >> 8)^0x80;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void bytetran_d()        /* J. Mohr  1995 Oct 17 */
                            /* same as above, but 8-bit unsigned char output */
{	      /*   sends HI-ORDER 8 bits of shortsamp, converted to unsigned */
    MYFLT	*sp, *maxampp;
    unsigned long	*maxps;
    long	longsmp, *rngp;
    int		n, spoutrem;
    MYFLT	absamp;

    sp = spout;			/* adr spout	*/
    spoutrem = nspout;		/* smps to go	*/
    maxampp = maxamp;
    maxps = maxpos;

nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;		/*	prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)floor(*sp + 128.0*(MYFLT)rand()/ RAND_MAX);
      if ((longsmp) >= 0) {	/* +ive samp:	*/
        if (*sp > *maxampp) {		/*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {		/* out of range?     */
          longsmp = 32767;	/*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {					/* ditto -ive samp */
        if ((absamp = -*sp) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *choutbufp++ = (unsigned char)(longsmp >> 8)^0x80;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void shortran(void)      /* fix spout vals and put in outbuf */
{                               /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem;
    MYFLT   absamp;

    sp = spout;                     /* adr spout    */      
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)*sp;
      if (longsmp >= 0) { /* +ive samp:   */
        if (*sp > *maxampp) {             /*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {          /* out of range?     */
          longsmp = 32767;        /*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {                            /* ditto -ive samp */
        if ((absamp = -*sp) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *shoutbufp++ = (short) longsmp;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        shoutbufp = (short *) outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void shortran_d(void)    /* fix spout vals and put in outbuf */
{                               /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem;
    MYFLT   absamp;

    sp = spout;                     /* adr spout    */      
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)floor(*sp + (MYFLT)rand()/ RAND_MAX);
      if (longsmp >= 0) { /* +ive samp:   */
        if (*sp > *maxampp) {             /*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {          /* out of range?     */
          longsmp = 32767;        /*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {                            /* ditto -ive samp */
        if ((absamp = -*sp) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *shoutbufp++ = (short) longsmp;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        shoutbufp = (short *) outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

/*-----------------------------------------------*/
/* gab c3*/
static void shortranRT(void)      /* fix spout vals and put in outbuf */
{                               /*      write buffer when full      */
    MYFLT  *sp;
    int    n, spoutrem;
	
    sp = spout;                     /* adr spout    */      
    spoutrem = nspout;              /* smps to go   */
nchk:
     if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
 		n = outbufrem;          /*      prepare to send in parts  */
     spoutrem -= n;
     outbufrem -= n;

     do *shoutbufp++ = (short) *sp++;
     while (--n);

     if (!outbufrem) {
		audtran(outbuf,outbufsiz);
		shoutbufp = (short *) outbuf;
 		outbufrem = O.outbufsamps;
 		if (spoutrem) goto nchk;
     }
}

static void d3dtran_but(void)      /* fix spout vals and put in outbuf */
{                               /*      write buffer when full      */
    MYFLT  *sp;
    int    n, spoutrem;
	
    sp = spout;                     /* adr spout    */      
    spoutrem = nspout;              /* smps to go   */
nchk:
     if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
 		n = outbufrem;          /*      prepare to send in parts  */
     spoutrem -= n;
     outbufrem -= n;

     do *shoutbufp++ = (short) *sp++;
     while (--n);

     if (!outbufrem) {
		audtran(outbuf,outbufsiz);
		shoutbufp = (short *) outbuf;
 		outbufrem = O.outbufsamps;
 		if (spoutrem) goto nchk;
     }
}


static void d3dtran(void)      /* fix spout vals and put in outbuf */
{                              /*      write buffer when full      */
    MYFLT  *sp, *sp3D[BUF3D_MAX];
    int    n, spoutrem, /*spout3Drem[BUF3D_MAX],*/j;
	
    sp = spout;                     /* adr spout    */      
	for (j=0; j< spout3Dnum; j++){
		sp3D[j] = spout3D[j];
	}
    spoutrem = nspout;              /* smps to go   */

nchk:
     if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
 		n = outbufrem;          /*      prepare to send in parts  */
     spoutrem -= n;
     outbufrem -= n;

     do {
		 *shoutbufp++ = (short) *sp++;
		 for (j=0; j<  spout3Dnum; j++)
			 *shoutbuf3Dp[j]++ = (short) *sp3D[j]++;
		 
     }while (--n);

     if (!outbufrem) {
		audtran(outbuf,outbufsiz);
		shoutbufp = (short *) outbuf;
		for (j=0; j< spout3Dnum; j++){
			Dsound3d(outbuf3D[j], outbuf3Dsiz, instance3D[j]);
			shoutbuf3Dp[j] = (short *) outbuf3D[j];
		}
		
 		outbufrem = O.outbufsamps;
 		if (spoutrem) goto nchk;
     }
}
/*
float *spout3D[BUF3D_MAX];
int nspout3D[BUF3D_MAX],spout3Dnum;
DS3D *instance3D[BUF3D_MAX];
extern void Dsound3d(char *outbuf, int nbytes, DS3D *instance);
char *outbuf3D[BUF3D_MAX];
unsigned int outbuf3Dsiz;
short *shoutbuf3Dp[BUF3D_MAX];
extern int	flag3d;
*/

                    
static void d3dzerotran(long kcnt) /* copy kcnt zerospouts to short soundbuf, */
                                /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0, j;

    //if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do { *shoutbufp++ = (short) 0;
		 for (j=0; j<  spout3Dnum; j++)
			 *shoutbuf3Dp[j]++ = (short) 0;
      } while (--n);
    }
    else shoutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
	  shoutbufp = (short *) outbuf;
		for (j=0; j< spout3Dnum; j++){
			Dsound3d(outbuf3D[j], outbuf3Dsiz, instance3D[j]);
			shoutbuf3Dp[j] = (short *) outbuf3D[j];
		}

      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

/* end gab c3*/
/*-----------------------------------------------*/


static void chartran(void)      /* same as above, but 8-bit char output */
{                               /*   sends HI-ORDER 8 bits of shortsamp */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem;
    MYFLT   absamp;

    sp = spout;                     /* adr spout    */
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)*sp;
      if (longsmp >= 0) { /* +ive samp:   */
        if (*sp > *maxampp) {           /*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {          /* out of range?     */
          longsmp = 32767;        /*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {                                  /* ditto -ive samp */
        if ((absamp = (MYFLT)((long)(-(*sp)))) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *choutbufp++ = (char)(longsmp >> 8);
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void chartran_d(void)    /* same as above, but 8-bit char output */
{                               /*   sends HI-ORDER 8 bits of shortsamp */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem;
    MYFLT   absamp;

    sp = spout;                     /* adr spout    */
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)floor(*sp + 128.0*(MYFLT)rand()/ RAND_MAX);
      if (longsmp >= 0) { /* +ive samp:   */
        if (*sp > *maxampp) {           /*  maxamp this seg  */
          *maxampp = *sp;
          *maxps = nframes;
        }
        if (longsmp > 32767) {          /* out of range?     */
          longsmp = 32767;        /*   clip and report */
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      else {                                  /* ditto -ive samp */
        if ((absamp = (MYFLT)((long)(-(*sp)))) > *maxampp) {
          *maxampp = absamp;
          *maxps = nframes;
        }
        if (longsmp < -32768) {
          longsmp = -32768;
          rngp = rngcnt + (maxampp - maxamp);
          (*rngp)++;
          rngflg = 1;
        }
      }
      if (osfopen)
        *choutbufp++ = (char)(longsmp >> 8);
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void alawtran(void)
{
    die(Str(X_590,"alaw not yet implemented"));
}

#define MUCLIP  32635
#define BIAS    0x84
#define MUZERO  0x02
#define ZEROTRAP 

static void ulawtran(void)              /* ulaw-encode spout vals & put in outbuf */
{                                       /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem, sign;
    extern  char    exp_lut[];               /* mulaw encoding table */

    sp = spout;                     /* adr spout    */ 
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)*sp;
      if (longsmp < 0L) {          /* if sample negative   */
        sign = 0x80;
        longsmp = - longsmp;        /*  make abs, save sign */
      }
      else sign = 0;
      if (longsmp > *maxampp) {             /* save maxamp this seg  */
        *maxampp = (MYFLT)longsmp;
        *maxps = nframes;
      }
      if (longsmp > MUCLIP) {             /* out of range?     */
        longsmp = MUCLIP;           /*   clip and report */
        rngp = rngcnt + (maxampp - maxamp);
        (*rngp)++;
        rngflg = 1;
      }
      if (osfopen) {
        int sample, exponent, mantissa, ulawbyte;
        sample = (int)(longsmp + BIAS);
        exponent = exp_lut[( sample >> 8 ) & 0x7F];
        mantissa = ( sample >> (exponent+3) ) & 0x0F;
        ulawbyte = ~ (sign | (exponent << 4) | mantissa );
#ifdef ZEROTRAP
        if (ulawbyte == 0) ulawbyte = MUZERO;    /* optional CCITT trap */
#endif
        *choutbufp++ = ulawbyte;
      }
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void ulawtran_d(void)              /* ulaw-encode spout vals & put in outbuf */
{                                       /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    long   longsmp, *rngp;
    int    n, spoutrem, sign;
    extern  char    exp_lut[];               /* mulaw encoding table */

    sp = spout;                     /* adr spout    */ 
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      longsmp = (long)floor(*sp + (MYFLT)rand()/ RAND_MAX);
      if (longsmp < 0L) {          /* if sample negative   */
        sign = 0x80;
        longsmp = - longsmp;        /*  make abs, save sign */
      }
      else sign = 0;
      if (longsmp > *maxampp) {             /* save maxamp this seg  */
        *maxampp = (MYFLT)longsmp;
        *maxps = nframes;
      }
      if (longsmp > MUCLIP) {             /* out of range?     */
        longsmp = MUCLIP;           /*   clip and report */
        rngp = rngcnt + (maxampp - maxamp);
        (*rngp)++;
        rngflg = 1;
      }
      if (osfopen) {
        int sample, exponent, mantissa, ulawbyte;
        sample = (int)(longsmp + BIAS);
        exponent = exp_lut[( sample >> 8 ) & 0x7F];
        mantissa = ( sample >> (exponent+3) ) & 0x0F;
        ulawbyte = ~ (sign | (exponent << 4) | mantissa );
#ifdef ZEROTRAP
        if (ulawbyte == 0) ulawbyte = MUZERO;    /* optional CCITT trap */
#endif
        *choutbufp++ = ulawbyte;
      }
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        choutbufp = outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void longtran(void)              /* send long_int spout vals to outbuf */
{                                       /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    int    n, spoutrem;
    MYFLT  absamp;
    long	longsmp;

    sp = spout;                     /* adr spout    */
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      if ((absamp = *sp) < FL(0.0))
        absamp = -absamp;
      if (absamp > *maxampp) {          /*  maxamp this seg  */
        *maxampp = absamp;
        *maxps = nframes;
      }
      longsmp = (long)*sp;
      if (osfopen)
        *lloutbufp++ = longsmp;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        lloutbufp = (long *) outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void longtran_d(void)            /* send long_int spout vals to outbuf */
{                                       /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    int    n, spoutrem;
    MYFLT  absamp;
    long	longsmp;

    sp = spout;                     /* adr spout    */
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      if ((absamp = *sp) < FL(0.0))
        absamp = -absamp;
      if (absamp > *maxampp) {          /*  maxamp this seg  */
        *maxampp = absamp;
        *maxps = nframes;
      }
      longsmp = (long)floor(*sp + (MYFLT)rand()/ RAND_MAX);
      if (osfopen)
        *lloutbufp++ = longsmp;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        lloutbufp = (long *) outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void floatran(void)              /* send float spout vals to outbuf */
{                                       /*      write buffer when full      */
    MYFLT  *sp, *maxampp;
    unsigned long	*maxps;
    int    n, spoutrem;
    MYFLT  absamp;
    float       fltsmp;

    sp = spout;                     /* adr spout    */
    spoutrem = nspout;              /* smps to go   */
    maxampp = maxamp;
    maxps = maxpos;

 nchk:
    if ((n = spoutrem) > (int)outbufrem) /* if nspout remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    spoutrem -= n;
    outbufrem -= n;
    do {
      if ((absamp = *sp) < 0.0f)
        absamp = -absamp;
      if (absamp > *maxampp) {         /*  maxamp this seg  */
        *maxampp = absamp;
        *maxps = nframes;
      }
      fltsmp = (float)*sp;
      if (osfopen)
        *floutbufp++ = fltsmp;
      if (multichan) {
	maxps++;
	if (++maxampp >= maxampend)
	  maxampp = maxamp, maxps = maxpos, nframes++;
      }
      else nframes++;
      sp++;
    } while (--n);
    if (!outbufrem) {
      if (osfopen) {
        audtran(outbuf,outbufsiz);
        floutbufp = (float *) outbuf;
      }
      outbufrem = O.outbufsamps;
      if (spoutrem) goto nchk;
    }
}

static void szerotran(long kcnt) /* copy kcnt zerospouts to short soundbuf, */
                                /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
 nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do *shoutbufp++ = (short) 0;
      while (--n);
    }
    else shoutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      shoutbufp = (short *) outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void bzerotran(kcnt)	                    /* J. Mohr  1995 Oct 17 */
  /* copy kcnt zerospouts to (unsigned) char soundbuf, */
  long kcnt;			            /* sending buffer whenever full */
{
    int	n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;	/* calculate total smps to go	*/
 nchk:
    if ((n = smpsrem) > (int)outbufrem)	/* if smps remaining > buf rem, */
      n = outbufrem;		/*	prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;		/* clear buf only till clean */
      do *choutbufp++ = (const char)0x80;
      while (--n);
    }
    else choutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      choutbufp = outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void czerotran(long kcnt)/* copy kcnt zerospouts to (signed) char soundbuf, */
                                /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
 nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do *choutbufp++ = 0x00;
      while (--n);
    }
    else choutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      choutbufp = outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void azerotran(long kcnt) { die(Str(X_590,"alaw not yet implemented")); }

static void uzerotran(long kcnt)/* copy kcnt zerospouts to ulaw soundbuf, */
                                /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
 nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do *choutbufp++ = (const char) 0xFF; /* no signal is 0xFF in mulaw */
      while (--n);
    }
    else choutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      choutbufp = outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void lzerotran(long kcnt)        /* copy kcnt zerospouts to long_int soundbuf, */
  /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
 nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do *lloutbufp++ = 0L;
      while (--n);
    }
    else lloutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      lloutbufp = (long *) outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void fzerotran(long kcnt)        /* copy kcnt zerospouts to float soundbuf, */
                                        /*      sending buffer whenever full     */
{
    int   n, smpsrem, clearcnt = 0;

    if (!osfopen)  return;
    smpsrem = nspout * (int)kcnt;        /* calculate total smps to go   */
 nchk:
    if ((n = smpsrem) > (int)outbufrem)  /* if smps remaining > buf rem, */
      n = outbufrem;          /*      prepare to send in parts  */
    smpsrem -= n;
    outbufrem -= n;
    if (clearcnt < O.outbufsamps) {
      clearcnt += n;          /* clear buf only till clean */
      do *floutbufp++ = 0.0f;
      while (--n);
    }
    else floutbufp += n;
    if (!outbufrem) {
      audtran(outbuf,outbufsiz);
      floutbufp = (float *) outbuf;
      outbufrem = O.outbufsamps;
      if (smpsrem) goto nchk;
    }
}

static void clrspin1(MYFLT *r, int spinrem) /* clear remainder of spinbuf to zeros */
{                                	    /* called only once, at EOF   */
    infilend = 1;                        /* 1st filend pass:   */
    while (spinrem--)                    /*   clear spin rem   */
      *r++ = FL(0.0);
}

static void clrspin2(void)      /* clear spinbuf to zeros   */
{                               /* called only once, at EOF */
    MYFLT *r = spin;
    int n = nspin;
    infilend = 2;                        /* at 2nd filend pass  */
    do *r++ = FL(0.0);                       /*   clr whole spinbuf */
    while (--n);
    printf(Str(X_713,"end of audio_in file\n"));
}

static void byterecv()                            /* J. Mohr  1995 Oct 17 */
  /* get spin values from byte inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
 nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = (MYFLT) ( (short)((*(unsigned char*)chinbufp++)^0x80) << 8 );
    while (--n);
    if (!inbufrem) {
    echk:	    if (!infilend) {
      if ((n = audrecv(inbuf, inbufsiz)) != 0) {
        chinbufp = inbuf;
        inbufrem = n / sizeof(char);
        if (spinrem) goto nchk;
      } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
    } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

static void charrecv(void)              /* get spin values from char inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
 nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = (MYFLT) ( (short)*(chinbufp++) << 8 );
    while (--n);
    if (!inbufrem) {
    echk:
      if (!infilend) {
        if ((n = audrecv(inbuf, inbufsiz)) != 0) {
          chinbufp = inbuf;
          inbufrem = n / sizeof(char);
          if (spinrem) goto nchk;
        } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
      } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

static void alawrecv(void)
{
    die(Str(X_588,"alaw audio_in not yet implemented"));
}

static void ulawrecv(void)              /* get spin values from ulaw inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = (MYFLT) ulaw_decode[*(unsigned char *)chinbufp++];
    while (--n);
    if (!inbufrem) {
    echk:
      if (!infilend) {
        if ((n = audrecv(inbuf, inbufsiz)) != 0) {
          chinbufp = inbuf;
          inbufrem = n / sizeof(char);
          if (spinrem) goto nchk;
        } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
      } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

static void shortrecv(void)              /* get spin values from short_int inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
 nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = (MYFLT) *shinbufp++;
    while (--n);
    if (!inbufrem) {
    echk:
      if (!infilend) {
        if ((n = audrecv(inbuf, inbufsiz)) != 0) {
          shinbufp = (short *) inbuf;
          inbufrem = n / sizeof(short);
          if (spinrem) goto nchk;
        } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
      } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

static void longrecv(void)              /* get spin values from long_int inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
 nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = (MYFLT) *llinbufp++;
    while (--n);
    if (!inbufrem) {
    echk:
      if (!infilend) {
        if ((n = audrecv(inbuf, inbufsiz)) != 0) {
          llinbufp = (long *) inbuf;
          inbufrem = n / sizeof(long);
          if (spinrem) goto nchk;
        } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
      } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

static void floatrecv(void)              /* get spin values from float inbuf */
{
    MYFLT *r = spin;
    int   n, spinrem = nspin;

    if (infilend == 2) return;
    if (!inbufrem)  goto echk;
 nchk:
    if ((n = spinrem) > (int)inbufrem)   /* if nspin remaining > buf rem,  */
      n = inbufrem;               /*       prepare to get in parts  */
    spinrem -= n;
    inbufrem -= n;
    do *r++ = *flinbufp++;
    while (--n);
    if (!inbufrem) {
    echk:
      if (!infilend) {
        if ((n = audrecv(inbuf, inbufsiz)) != 0) {
          flinbufp = (float*) inbuf;
          inbufrem = n / sizeof(MYFLT);
          if (spinrem) goto nchk;
        } else clrspin1(r,spinrem);  /* 1st filend pass: partial clr  */
      } else clrspin2();           /* 2nd filend pass: zero the spinbuf */
    }
}

void GabWriteAudioFile() {
            if ((osfd = openout(O.outfilename, 3)) < 0)   /* else open sfdir or cwd */
				dies("sfinit: cannot open %s", retfilnam);
            sfoutname = mmalloc((long)strlen(retfilnam)+1);
            strcpy(sfoutname, retfilnam);       /*   & preserve the name */
			//audtran = rtplay_and_file; 
			if (O.filetyp == TYP_AIFF && bytrevhost() || O.filetyp == TYP_WAV && !bytrevhost()) {
				if (O.outformat == AE_SHORT)        /* if audio out needs byte rev*/
					write_to_file = audwrtrev2;           /*   redirect the audio puts  */
				else if (O.outformat == AE_LONG)
					write_to_file = audwrtrev4;
				else write_to_file = audwrite;
			}
			else write_to_file = audwrite;                /* else use standard audio puts */
}

void GabCloseAudioFile() {
	 close(osfd);
}