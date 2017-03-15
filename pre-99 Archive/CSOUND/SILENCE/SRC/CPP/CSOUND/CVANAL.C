/************************************************************************/
/*                                                                      */
/*  Performs a FFT on a time domain soundfile, and saves the result in  */
/*  a file.                                                             */
/*  Purpose is to create a frequency domain version of an impulse       */
/*  response, for the later use by the convolve operator.               */
/*  Greg Sullivan                                                       */
/************************************************************************/

#include "cs.h"
#include "soundio.h"
#include "fft.h"
#include "dsputil.h"
#include "convolve.h"

static void takeFFT(SOUNDIN *inputSound, CVSTRUCT *outputCVH,
                     long Hlenpadded, int indfd, int ofd);
static void quit(char *msg);
static void PrintBuf(MYFLT *buf, long size, char *msg);
static int CVAlloc(CVSTRUCT**, long, int, MYFLT, int, int, long, int, int);


#define SF_UNK_LEN      -1      /* code for sndfile len unkown  */

static  complex *basis;             /* LUTable for FFT */

extern  int      SAsndgetset(char *, SOUNDIN**, MYFLT*, MYFLT*, MYFLT*, int);
extern  long     getsndin(int, MYFLT *, long, SOUNDIN *);

#define FIND(MSG)   if (*s == '\0')  \
                        if (!(--argc) || (s = *++argv) && *s == '-')  \
                            quit(MSG);

int cvanal(int argc, char **argv)
{
    CVSTRUCT *cvh;
    char    *infilnam, *outfilnam;
    int     infd, ofd, err, channel = ALLCHNLS;
    SOUNDIN  *p;  /* space allocated by SAsndgetset() */
    extern  char     *retfilnam;

    MYFLT    beg_time = FL(0.0), input_dur = FL(0.0), sr = FL(0.0);
    long     Estdatasiz,Hlen;
    long     Hlenpadded = 1;
    long     nb;

    if (!(--argc))
#ifdef CWIN
      {
        int __cdecl cvanal_dialog(MYFLT*, int*, MYFLT*, MYFLT*, char**, char**);
        if (cvanal_dialog(&sr, &channel, &beg_time, &input_dur, &infilnam, &outfilnam)==0)
          return 0;
      }
    else {
#else
      {
        quit(Str(X_939,"insufficient arguments"));
        return 0;
      }
#endif
      do {
        char *s = *++argv;
        if (*s++ == '-')
          switch (*s++) {
          case 's':
            FIND(Str(X_1057,"no sampling rate"))
              if (sizeof(MYFLT)==sizeof(float))
                sscanf(s,"%f",&sr);
              else
                sscanf(s,"%lf",&sr);
            break;
          case 'c':
            FIND(Str(X_1026,"no channel"))
              sscanf(s,"%d",&channel);
            if ((channel < 1) || (channel > 4))
              quit(Str(X_656,"channel must be in the range 1 to 4"));
            break;
          case 'b':
            FIND(Str(X_1025,"no begin time"))
              if (sizeof(MYFLT)==sizeof(float))
                sscanf(s,"%f",&beg_time);
              else
                sscanf(s,"%lf",&beg_time);
            break;
          case 'd':
            FIND(Str(X_1030,"no duration time"))
              if (sizeof(MYFLT)==sizeof(float))
                sscanf(s,"%f",&input_dur);
              else
                sscanf(s,"%lf",&input_dur);
            break;
          default:   quit(Str(X_1352,"unrecognised switch option"));
          }
        else break;
      } while (--argc);

      if (argc !=  2) quit(Str(X_876,"illegal number of filenames"));
      infilnam = *argv++;
      outfilnam = *argv;
#ifdef CWIN
    }
#endif

    if (
        (infd = SAsndgetset(infilnam,&p,&beg_time,&input_dur,&sr,channel))<0) {
      sprintf(errmsg,Str(X_735,"error while opening %s"), retfilnam);
      quit(errmsg);
    }
    sr = (MYFLT)p->sr;

    Hlen = p->getframes;
    while (Hlenpadded < 2*Hlen-1)
      Hlenpadded <<= 1;

    Estdatasiz = (Hlenpadded + 2) * sizeof(MYFLT);
    if (channel == ALLCHNLS)
      Estdatasiz *= p->nchnls;

    /* alloc & fill CV hdrblk */
    if ((err = CVAlloc(&cvh, Estdatasiz, CVMYFLT, sr, p->nchnls,channel,
                       Hlen,CVRECT,4))) {
      err_printf( Str(X_680,"cvanal: Error allocating header\n"));
      exit(1);
    }

    if ((ofd = openout(outfilnam, 1)) < 0)     /* open the output CV file */
      quit(Str(X_632,"cannot create output file"));
                                               /* & wrt hdr into the file */
    if ((nb = write(ofd,(char *)cvh,(int)cvh->headBsize)) < cvh->headBsize)
      quit(Str(X_630,"cannot write header"));

    basis = AssignBasis(NULL,Hlenpadded);      /* set up FFT tables */
    takeFFT(p, cvh, Hlenpadded,infd, ofd);

/*      outputPVH->dataBsize = oframeAct * fftfrmBsiz; */
/*      PVCloseWrHdr(ftFile, outputPVH); */    /* Rewrite dataBsize, Close files */

    close(infd);
    close(ofd);
#ifdef never
#if !defined(mac_classic) && !defined(SYMANTEC)
    if (access(outfilnam, 0x6))
      chmod(outfilnam, S_IREAD | S_IWRITE); /* Make read-write */
#endif
#endif
    return 1;
}

static void quit(char *msg)
{
    err_printf(Str(X_679,"cvanal error: %s\n"), msg);
    err_printf(Str(X_516,"Usage: cvanal [-d<duration>] "
                         "[-c<channel>] [-b<begin time>] <input soundfile>"
                         " <output impulse response FFT file> \n"));
    exit(1);
}

static void takeFFT(
    SOUNDIN         *p,
    CVSTRUCT        *cvh,
    long            Hlenpadded,
    int             infd,
    int             ofd)
{
    long    i,j, read_in;
    MYFLT   *inbuf,*outbuf;
    MYFLT   *fp1,*fp2;
    MYFLT   dv32768 = FL(1.0) / FL(32768.0);
    long    Hlen = cvh->Hlen;
    int     nchnls;

    nchnls = cvh->channel != ALLCHNLS ? 1 : cvh->src_chnls;
    inbuf   = fp1 = (MYFLT *)mmalloc(Hlen * nchnls * sizeof(MYFLT));
    if ( (read_in = getsndin(infd, inbuf, (long)(Hlen*nchnls),p)) <
         (Hlen*nchnls) )
      die(Str(X_965,"less sound than expected!"));

    /* normalize the samples read in. (Only if short data. Should really do
       other formats too, with the appropriate scale factor) */
    /*RWD 5:2001: the data is already converted to quasi-16bit, so we must do this always */
    /*if (p->format == AE_SHORT) { */
    /*floating point raw and IRCAM files are not normalised (IV Oct 2001) */
    if ((p->format != AE_FLOAT) || (p->filetyp == TYP_WAV) ||
        (p->filetyp == TYP_AIFF) || (p->filetyp == TYP_AIFC)) {
      for (i = read_in; i--; )
        *fp1++ *= dv32768;
    }
    /* } */
    fp1 = inbuf;
    outbuf = fp2 = (MYFLT *)MakeBuf(Hlenpadded + 2);

    for (i = 0; i < nchnls; i++) {
      for (j = Hlen; j > 0; j--) {
        *fp2++ = *fp1;
        fp1 += nchnls;
      }
      if (!POLL_EVENTS()) exit(1);
      fp1 = inbuf + i + 1;
      /*printf("about to FFT\n");*/
      /* PrintBuf(outbuf, Hlenpadded, "normalised & padded"); */
      FFT2realpacked((complex *)outbuf, Hlenpadded,basis);
      if (!POLL_EVENTS()) exit(1);
      /*printf("finished FFTing\n");*/
      /* PrintBuf(Buf, 2*Hlenpadded, X_761,"FFT'd"); */
      /* write straight out, just the indep vals */
      write(ofd, (char *)outbuf, cvh->dataBsize/nchnls);
      for (j = Hlenpadded - Hlen; j > 0; j--)
        *fp2++ = FL(0.0);
      fp2 = outbuf;
    } /* end i loop */
}

static int CVAlloc(
    CVSTRUCT    **pphdr,        /* returns address of new block */
    long        dataBsize,      /* desired bytesize of datablock */
    int         dataFormat,     /* data format - PVMYFLT etc */
    MYFLT       srate,          /* sampling rate of original in Hz */
    int         src_chnls,      /* number of channels in source */
    int         channel,        /* requested channel(s) */
    long        Hlen,           /* impulse response length */
    int         Format,         /* format of frames: CVPOLAR, CVPVOC etc */
    int         infoBsize)      /* bytes to allocate in info region */

    /* Allocate memory for a new CVSTRUCT+data block;
       fill in header according to passed in data.
       Returns CVE_MALLOC  (& **pphdr = NULL) if malloc fails
               CVE_OK      otherwise  */
{
    long        hSize;

    hSize = sizeof(CVSTRUCT) + infoBsize - CVDFLTBYTS;
    if (( (*pphdr) = (CVSTRUCT *)malloc((size_t)hSize)) == NULL )
        return(CVE_MALLOC);
    (*pphdr)->magic = CVMAGIC;
    (*pphdr)->headBsize = hSize;
    (*pphdr)->dataBsize = dataBsize;
    (*pphdr)->dataFormat= dataFormat;
    (*pphdr)->samplingRate = srate;
    (*pphdr)->src_chnls  = src_chnls;
    (*pphdr)->channel  = channel;
    (*pphdr)->Hlen = Hlen;
    (*pphdr)->Format = Format;
    /* leave info bytes undefined */
    return(CVE_OK);
}

#define DBGPTS 8
static void PrintBuf(MYFLT *buf, long size, char *msg)
{
    int   i;
/*      if (!debug) return;   */
/*      size = DBGPTS;      */
    printf("%s:\n",msg);
    for (i=0; i<size; ++i)
      printf("buf[%d] = %7.2f\n",i,buf[i]);
/*      printf("\n"); */
}


