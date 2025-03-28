
/* 
 *    PROGRAM:   srconv - sample rate converter
 *
 *    AUTHOR:    Mark Dolson
 *
 *    DATE:      August 26, 1989
 *
 *    COMMENTS:  srconv takes floats on stdin at sample rate Rin and
 *               outputs them on stdout at sample rate Rout.  optionally,
 *               the ratio (Rin / Rout)  may be linearly time-varying
 *               according to a set of (time, ratio) pairs in an auxiliary file.
 *
 *               flags:
 *
 *                    r = output sample rate (must be specified)
 *                    R = input sample rate (must be specified)
 *                    P = input sample rate / output sample rate
 *                    Q = quality factor (1, 2, 3, or 4: default = 2)
 *                    if a time-varying control file is given, it must be last
 *
 *    MODIFIED:  John ffitch December 2000; changes to Csound context
 */

#include "cs.h"
#include "sfheader.h"
#include "soundio.h"
#include "ustub.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define IBUF 	(4096)
#define IBUF2 	(IBUF/2)
#define OBUF 	(4096)
#define ERR(x) {perror(x); exit(1);}
#define FIND(MSG)   if (*s == '\0')  \
                        if (!(--argc) || ((s = *argv++) != NULL) && *s == '-') \
                            dieu(MSG);

extern  HEADATA *readheader(int, char *, SOUNDIN*);
extern	int      SAsndgetset(char *, SOUNDIN**, MYFLT*, MYFLT*, MYFLT*, int);
extern	long     getsndin(int, MYFLT *, long, SOUNDIN *);
extern void bytrev2(char *, int), bytrev4(char *, int), rewriteheader(int,long);
extern int  openout(char *, int), bytrevhost(void), getsizformat(int);
extern void writeheader(int, char *);
extern char *getstrformat(int);

static void (*audtran)(char *, int), nullfn(char *, int);
static void (*spoutran)(float *, int);
static void chartran(float *, int), alawtran(float *, int),
            ulawtran(float *, int), shortran(float *, int),
            longtran(float *, int), floatran(float *, int),
            bytetran(float *, int);
void kaiser(int, MYFLT *, int, int, MYFLT);
void usage(int);
int writebuffer(MYFLT *, int);

/* Static global variables */
static unsigned    outbufsiz;
static void        *outbuf;
static  char       *choutbuf;               /* char  pntr to above  */
static  short      *shoutbuf;               /* short pntr           */
static  long       *lloutbuf;               /* long  pntr           */
static  float      *floutbuf;               /* float pntr           */
static  int        outrange = 0;            /* Count samples out of range */

static int outfd;
static int   block = 0;
static long  bytes = 0;
OPARMS	O = {0,0, 0,1,1,0, 0,0, 0,0, 0,0, 1,0,0,7, 0,0,0, 0,0,0,0, 0,0 };


static void dieu(char *s)
{
    fprintf(stderr, "dnoise: %s\n", s);
    usage(1);
}

void beep(void)
{
#ifdef _macintosh
	SysBeep(10000);
#elif CWIN
	extern void cwin_Beep(void);
	cwin_Beep();
#else
        printf(Str(X_28,"%c\tbeep!\n"),'\007');
#endif
}

int main(int argc, char **argv)
{
    MYFLT
      *input,    /* pointer to start of input buffer */
      *output,   /* pointer to start of output buffer */
      *nextIn,   /* pointer to next empty word in input */
      *nextOut,  /* pointer to next empty word in output */
      *window,   /* pointer to center of analysis window */
      *wj,       /* pointer to window */
      *wj1,      /* pointer to window */
      *fxval,    /* pointer to start of time-array for time-vary function */
      *fyval,    /* pointer to start of P-scale-array for time-vary func */
      *i0,       /* pointer */
      *i1;       /* pointer */
    
    int
      M = 2401,   /* length of window impulse response */
      N = 120,    /* length of sinc period */
      L = 120,    /* internal sample rate is L*Rin */
      m,          /* current input sample in buffer */
      o,          /* current input at L*Rin mod L */
      del,        /* increment */
      WinLen,     /* half-length of window at L*Rin */
      wLen,       /* half-length of window at Rin */
      jMin,       /* initial offset in window */
      mMax;       /* maximum valid m */

    long
      n,          /* current input sample */
      nMax = 100000000;    /* last input sample (unless EOF) */

    MYFLT
      beta = FL(6.8),           /* parameter for Kaiser window */
      sum,                      /* scale factor for renormalizing windows */
      fdel,                     /* float del */
      idel,                     /* float del */
      fo,                       /* float o */
      of,                       /* fractional o */
      fL = FL(120.0),           /* float L */
      iw,                       /* interpolated window */
      tvx0,                     /* current x value of time-var function */
      tvx1,                     /* next x value of time-var function */
      tvdx,                     /* tvx1 - tvx0 */
      tvy0,                     /* current y value of time-var function */
      tvy1,                     /* next y value of time-var function */
      tvdy,                     /* tvy1 - tvy0 */
      tvslope,                  /* tvdy / tvdx */
      time,                     /* n / Rin */
      invRin,                   /* 1. / Rin */
      P = FL(0.0),              /* Rin / Rout */
      Rin = FL(0.0),            /* input sampling rate */
      Rout = FL(0.0);           /* output sample rate */

    int
      i,k,                      /* index variables */
      nread,                    /* number of bytes read */
      tvflg = 0,                /* flag for time-varying time-scaling */
      tvnxt,                    /* counter for stepping thru time-var func */
      tvlen,                    /* length of time-varying function */
      Head = 1,                 /* flag for header */
      Chans = 0,                /* number of channels */
      chan,                     /* current channel */
      Q = 0;                    /* quality factor */
    
    FILE    *tvfp;    /* time-vary function file */

    SOUNDIN     *p;
    int		channel = ALLCHNLS;
    MYFLT       beg_time = FL(0.0), input_dur = FL(0.0), sr = FL(0.0);
    char        *infile = NULL, *outfile = NULL, *bfile = NULL;
    int		inf;
    char        c, *s;
    char *envoutyp = NULL;
    char        outformch;
    char *getenv(const char*);

    init_getstring(argc, argv);

    O.filnamspace = outfile = (char*)mmalloc((long)1024);
    if ((envoutyp = getenv("SFOUTYP")) != NULL) {
      if (strcmp(envoutyp,"AIFF") == 0)
        O.filetyp = TYP_AIFF;
      else if (strcmp(envoutyp,"WAV") == 0)
        O.filetyp = TYP_WAV;
      else if (strcmp(envoutyp,"IRCAM") == 0)
        O.filetyp = TYP_IRCAM;
      else {
        sprintf(errmsg,
                Str(X_61,"%s not a recognized SFOUTYP env setting"),
                envoutyp);
        dieu(errmsg);
      }
    }

    /* call getopt to interpret commandline */

    ++argv;
    while (--argc>0) {
      s = *argv++;
      if (*s++ == '-') {                        /* read all flags:  */
        while ((c = *s++) != '\0') {
          switch (c) {
          case 'j':
            FIND("")
              while (*++s);
            break;
          case 'o':
            FIND(Str(X_1052,"no outfilename"))
              O.outfilename = outfile;            /* soundout name */
            while ((*outfile++ = *s++)); s--;
            if (strcmp(O.outfilename,"stdin") == 0)
              die(Str(X_156,"-o cannot be stdin"));
            if (strcmp(O.outfilename,"stdout") == 0) {
#ifdef THINK_C
              die(Str(X_1244,"stdout audio not supported"));
#else
              if ((O.stdoutfd = dup(1)) < 0) /* redefine stdout */
                die(Str(X_1290,"too many open files"));
              dup2(2,1);                /* & send 1's to stderr */
#endif
            }
            break;
          case 'A':
            if (O.filetyp == TYP_WAV) {
              if (envoutyp == NULL) goto outtyp;
              warning(Str(X_95,"-A overriding local default WAV out"));
            }
            if (O.outformat == AE_FLOAT) {
              warning(Str(X_401,"Overriding File Type to AIFF-C for AIFF float format"));
              O.filetyp = TYP_AIFC;
            }
            else O.filetyp = TYP_AIFF;     /* AIFF output request*/
            break;
          case 'J':
            if (O.filetyp == TYP_AIFF ||
                O.filetyp == TYP_WAV) {
              if (envoutyp == NULL) goto outtyp;
              warning(Str(X_110,"-J overriding local default AIFF/WAV out"));
            }
            O.filetyp = TYP_IRCAM;      /* IRCAM output request */
            break;
          case 'W':
            if (O.filetyp == TYP_AIFF) {
              if (envoutyp == NULL) goto outtyp;
              warning(Str(X_131,"-W overriding local default AIFF out"));
            }
            if (!POLL_EVENTS()) exit(1);
            O.filetyp = TYP_WAV;      /* WAV output request */
            break;
          case 'h':
            O.sfheader = 0;           /* skip sfheader  */
            break;
          case 'c':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_CHAR;     /* 8-bit char soundfile */
            break;
          case '8':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_UNCH;     /* 8-bit unsigned char file */
            break;
          case 'a':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_ALAW;     /* a-law soundfile */
            break;
          case 'u':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_ULAW;     /* mu-law soundfile */
            break;
          case 's':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_SHORT;    /* short_int soundfile */
            break;
          case 'l':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_LONG;     /* long_int soundfile */
            break;
          case 'f':
            if (O.outformat) goto outform;
            outformch = c;
            O.outformat = AE_FLOAT;    /* float soundfile */
            break;
          case 'R':
            O.rewrt_hdr = 1;
            break;
          case 'H':
            if (isdigit(*s)) {
              int n;
              sscanf(s, "%d%n", &O.heartbeat, &n);
              s += n;
            }
            else O.heartbeat = 1;
            break;
          case 'N':
            O.ringbell = 1;        /* notify on completion */
            break;
         case '-':
            FIND(Str(X_1044,"no log file"));
            dribble = fopen(s, "w");
            while (*s++); s--;
            break;
          case 'Q': 
            FIND("No Q argument")
            sscanf(s,"%d", &Q);
            while (*++s);
            break;
          case 'P': 
            FIND("No P argument")
            sscanf(s,"%f", &P);
            while (*++s);
            break;
          case 'r': 
            FIND("No r argument")
            sscanf(s,"%f", &Rout);
            while (*++s);
            break;
          case 'i':
            FIND("No break file")
            tvflg = 1;
            bfile = s;
            while ((*s++)); s--;
            break;
          default:
            printf("Looking at %c\n", c);
            usage(1);    /* this exits with error */
          }
        }
      }
      else if (infile==NULL) {
        infile = --s;
        printf("Infile set to %s\n", infile);
      }
      else {
        printf("End with %s\n", s);
        usage(1);
      }
    }

    if (infile==NULL) {
      printf("No input given\n");
      usage(1);
    }
    if ((inf = SAsndgetset(infile,&p,&beg_time,&input_dur,&sr,channel))<0) {
      fprintf(stderr,Str(X_735,"error while opening %s"), infile);
      exit(1);
    }
    if (Rin == FL(0.0))
      Rin = (MYFLT)p->sr;
    if (Chans == 0)
      Chans = (int) p->nchnls;
    if (Chans == 0)
      Chans = 1;
    
    if ((P != FL(0.0)) && (Rout != FL(0.0)))
      ERR("srconv: can't specify both -r and -P\n")
        if (P != FL(0.0))
          Rout = Rin / P;
    
    if (tvflg) {
      P = FL(0.0);        /* will be reset to max in time-vary function */
      if ((tvfp = fopen(bfile,"r")) == NULL)
        ERR("srconv: can't open time-vary function file\n")
          fscanf(tvfp,"%d",&tvlen);
      if ((fxval = (MYFLT *) malloc(tvlen*sizeof(MYFLT))) == NULL)
        ERR("srconv: unable to allocate memory\n")
          if ((fyval = (MYFLT *) malloc(tvlen*sizeof(MYFLT))) == NULL)
            ERR("srconv: unable to allocate memory\n")
              i0 = fxval;
      i1 = fyval;
      for (i = 0; i < tvlen; i++, i0++, i1++){
        if ((fscanf(tvfp,"%f %f",i0,i1)) == EOF)
          ERR("srconv: too few x-y pairs in time-vary function file\n")
            if (*i1 > P)
              P = *i1;
      }
      Rout = Rin / P;    /* this is min Rout */
      tvx0 = fxval[0];
      tvx1 = fxval[1];
      tvy0 = fyval[0];
      tvy1 = fyval[1];
      tvdx = tvx1 - tvx0;
      if (tvx0 != FL(0.0))
        ERR("srconv: first x value in time-vary function must be 0\n")
          if (tvy0 <= FL(0.0))
            ERR("srconv: invalid initial y value in time-vary function\n")
              if (tvdx <= FL(0.0))
                ERR("srconv: invalid x values in time-vary function\n")
                  tvdy = tvy1 - tvy0;
      tvslope = tvdy / tvdx;
      tvnxt = 1;
      /*
        fprintf(stderr,"len=%d\n", tvlen);
        fprintf(stderr,"x0: %f  y0: %f  x1: %f  y1: %f\n",tvx0,tvy0,tvx1,tvy1);
      */
    }

    if (P != FL(0.0)) {          /* This is not right *********  */
      esr = Rin;
    }
    if (P == FL(0.0)) {
      esr = Rout;
    }
    if (O.outformat == 0) O.outformat = p->format;
    O.outsampsiz = getsizformat(O.outformat);
    if (O.filetyp == TYP_AIFF) {
        if (!O.sfheader)
            die(Str(X_640,"can't write AIFF soundfile with no header"));
        if (O.outformat == AE_ALAW || O.outformat == AE_ULAW
            || O.outformat == AE_FLOAT) {
            sprintf(errmsg,Str(X_180,"AIFF does not support %s encoding"),
                    getstrformat(O.outformat));
            die(errmsg);
        }
    }
    if (O.filetyp == TYP_WAV) {
        if (!O.sfheader)
            die(Str(X_338,"can't write WAV soundfile with no header"));
        if (O.outformat == AE_ALAW || O.outformat == AE_ULAW
            || O.outformat == AE_FLOAT) {
            sprintf(errmsg,Str(X_181,"WAV does not support %s encoding"),
                    getstrformat(O.outformat));
            die(errmsg);
        }
    }
    if (O.rewrt_hdr && !O.sfheader)
        die(Str(X_628,"can't rewrite header if no header requested"));
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
    outfd = openout(O.outfilename, 1);
    nchnls = Chans = p->nchnls;
    if (O.sfheader)
        writeheader(outfd, O.outfilename);      /* write header as required   */
    if (O.filetyp == TYP_AIFF && bytrevhost()
        || O.filetyp == TYP_WAV && !bytrevhost()) {
        if (O.outformat == AE_SHORT)        /* if audio out needs byte rev  */
            audtran = bytrev2;           /*   redirect the audio puts    */
        else if (O.outformat == AE_LONG)
            audtran = bytrev4;
        else audtran = nullfn;
    }
    else audtran = nullfn;              /* else use standard audio puts */
    outbufsiz = OBUF * O.outsampsiz;/* calc outbuf size */
    outbuf = mmalloc((long)outbufsiz);                 /*  & alloc bufspace */
    printf(Str(X_1382,"writing %d-byte blks of %s to %s %s\n"),
		   outbufsiz, getstrformat(O.outformat), O.outfilename,
		   O.filetyp == TYP_AIFF ? "(AIFF)" :
		   O.filetyp == TYP_WAV ? "(WAV)" : "");
    switch(O.outformat) {
    case AE_CHAR:
        spoutran = chartran;
        choutbuf = outbuf;
        break;
    case AE_ALAW:
        spoutran = alawtran;
        choutbuf = outbuf;
        break;
    case AE_ULAW:
        spoutran = ulawtran;
        choutbuf = outbuf;
        break;
    case AE_SHORT:
        spoutran = shortran;
        shoutbuf = (short *)outbuf;
        break;
    case AE_LONG:
        spoutran = longtran;
        lloutbuf = (long  *)outbuf;
        break;
    case AE_FLOAT:
        spoutran = floatran;
        floutbuf = (float *)outbuf;
        break;
    case AE_UNCH:
        spoutran = bytetran;
        choutbuf = outbuf;
        break;
    default:
        err_printf( "Type is %x\n", O.outformat);
        die(Str(X_1329,"unknown audio_out format"));
    }


/* this program performs arbitrary sample-rate conversion
    with high fidelity.  the method is to step through the
    input at the desired sampling increment, and to compute
    the output points as appropriately weighted averages of
    the surrounding input points.  there are two cases to
    consider: 1) sample rates are in a small-integer ratio -
    weights are obtained from table, 2) sample rates are in
    a large-integer ratio - weights are linearly
    interpolated from table.  */

/* calculate increment: if decimating, then window is impulse response of low-
    pass filter with cutoff frequency at half of Rout; if interpolating,
    then window is impulse response of lowpass filter with cutoff frequency
    at half of Rin. */

    fdel = ((MYFLT) (L * Rin) / Rout);
    del = (int)fdel;
    idel = (MYFLT)del;
    if (del > L)
      N = del;
    if ((Q >= 1) && (Q <=4))
      M = Q * N * 10 + 1;
    if (tvflg)
      fdel = tvy0 * L;
    
    invRin  =  FL(1.0) / Rin;
    
/* make window: the window is the product of a kaiser and a sin(x)/x */
    if ((window = (MYFLT *) calloc((size_t)(M+1),sizeof(MYFLT))) == NULL)
      ERR("srconv: insufficient memory\n")
    WinLen = (M-1)/2;
    window += WinLen;
    wLen = (M/2 - L) / L;

    kaiser(M,window,WinLen,1,beta);
    for (i = 1; i <= WinLen; i++)
      *(window - i) = *(window + i);

    for (i = 1; i <= WinLen; i++){ 
      *(window - i) *= N * (MYFLT)(sin((double)(PI*i) / (double)N) / (double)(PI*i));
      *(window + i) = *(window - i);
    }

    if (Rout < Rin){
      sum = *window;
      for (i = L-1; i <= WinLen; i += L)
        sum += *(window - i) + *(window + i);
      
      sum = FL(1.0) / sum;    
    }
    else
      sum = FL(1.0) / *window;    

    *window *= sum;
    for (i = 1; i <= WinLen; i++){
      *(window - i) *= sum;
      *(window + i) = *(window - i);
    }

    *(window + WinLen + 1) = FL(0.0);
      
/* set up input buffer:  nextIn always points to the next empty
    word in the input buffer.  If the buffer is full, then
    nextIn jumps back to the beginning, and the old values
    are written over. */

    if ((input = (MYFLT *) calloc((size_t)IBUF, sizeof(MYFLT))) == NULL)
      ERR("srconv: insufficient memory\n")

/* set up output buffer:  nextOut always points to the next empty
    word in the output buffer.  If the buffer is full, then
    it is flushed, and nextOut jumps back to the beginning. */

    if ((output = (MYFLT *) calloc((size_t)OBUF, sizeof(MYFLT))) == NULL)
      ERR("srconv: insufficient memory\n")
    nextOut = output;

/* initialization: */

    nread = getsndin(inf, input, IBUF2, p);
    nMax = (long)(input_dur * p->sr);
    nextIn = input + nread;
    for (i = nread; i < IBUF2; i++)
      *(nextIn++) = FL(0.0);
    jMin = -(wLen + 1) * L;
    mMax = IBUF2;
    o = n = m = 0;
    fo = FL(0.0);

/* main loop:   If nMax is not specified it is assumed to be very large
        and then readjusted when read detects the end of input. */

    while (n < nMax) {
      time = n * invRin;

    /* case 1:  (Rin / Rout) * 120 = integer  */

      if ((tvflg == 0) && (idel == fdel)) {
    /* apply window (window is sampled at L * Rin) */

        for (chan = 0; chan < Chans; chan++) {
          *nextOut = FL(0.0);
          k = Chans * (m - wLen) + chan - Chans;
          if (k < 0)
            k += IBUF;
          wj = window + jMin - o;
          for (i = -wLen; i <= wLen+1; i++){
            wj += L;
            k += Chans;
            if (k >= IBUF)
              k -= IBUF;
            *nextOut += *wj * *(input + k);
          }
          nextOut++;
          if (nextOut >= (output + OBUF)) {
            nextOut = output;
            writebuffer(output, OBUF);
          }
        }
        
    /* move window (window advances by del samples at L * Rin sample rate) */

        o += del;
        while (o >= L) {
          o -= L;
          n++;
          m++;
          if ((Chans * (m + wLen + 1)) >= mMax) {
            mMax += IBUF2;
            if (nextIn >= (input + IBUF))
              nextIn = input;
            nread = getsndin(inf, nextIn, IBUF2, p);
            nextIn += nread;
            if (nread < IBUF2)
              nMax = n + wLen + (nread / Chans) + 1;
            for (i = nread; i < IBUF2; i++)
              *(nextIn++) = FL(0.0);
          }
          if ((Chans * m) >= IBUF) {
            m = 0;
            mMax = IBUF2;
          }
        }
      }
      
    /* case 2: (Rin / Rout) * 120 = non-integer constant */

      else {

    /* apply window (window values are linearly interpolated) */

        for (chan = 0; chan < Chans; chan++) {
          *nextOut = FL(0.0);
          o = (int)fo;
          of = fo - o;
          wj = window + jMin - o;
          wj1 = wj + 1;
          k = Chans * (m - wLen) + chan - Chans;
          if (k < 0)
            k += IBUF;
          for (i = -wLen; i <= wLen+1; i++) {
            wj += L;
            wj1 += L;
            k += Chans;
            if (k >= IBUF)
              k -= IBUF;
            iw = *wj + of * (*wj1 - *wj);
            *nextOut += iw * *(input + k);
          }
          nextOut++;
          if (nextOut >= (output + OBUF)) {
            nextOut = output;
            writebuffer(output, OBUF);
          }
        }

    /* move window */

        fo += fdel;
        while (fo >= fL) {
          fo -= fL;
          n++;
          m++;
          if ((Chans * (m + wLen + 1)) >= mMax) {
            mMax += IBUF2;
            if (nextIn >= (input + IBUF))
              nextIn = input;
            nread = getsndin(inf, nextIn, IBUF2, p);
            nextIn += nread;
            if (nread < IBUF2)
              nMax = n + wLen + (nread / Chans) + 1;
            for (i = nread; i < IBUF2; i++)
              *(nextIn++) = FL(0.0);
          }
          if ((Chans * m) >= IBUF) {
            m = 0;
            mMax = IBUF2;
          }
        }

        if (tvflg && (time > FL(0.0))) {
          while (tvflg && (time >= tvx1)) {
            if (++tvnxt >= tvlen)
              tvflg = 0;
            else {
              tvx0 = tvx1;
              tvx1 = fxval[tvnxt];
              tvy0 = tvy1;
              tvy1 = fyval[tvnxt];
              tvdx = tvx1 - tvx0;
              if (tvdx <= FL(0.0))
                ERR("srconv: invalid x values in time-vary function\n");
              tvdy = tvy1 - tvy0;
              tvslope = tvdy / tvdx;
            }
          }
          P = tvy0 + tvslope * (time - tvx0);
          fdel = (MYFLT) L * P;
        }
      }
      
    }
    nread = nextOut - output;
    writebuffer(output, nread);
    rewriteheader(outfd, bytes);
    printf("\n\n");
    close(outfd);
    if (O.ringbell) beep();
    exit(0);

outtyp:
    dieu(Str(X_1113,"output soundfile cannot be both AIFF and WAV"));
    exit(1);
outform:
    sprintf(errmsg,Str(X_1198,"sound output format cannot be both -%c and -%c"),
            outformch, c);
    usage(1);
}

void usage(int exitcode)
{
    err_printf("usage: srconv [flags] infile\n\nflags:\n");
err_printf("-P num\tpitch transposition ratio (srate / r) [don't specify both P and r]\n");
err_printf("-Q num\tquality factor (1, 2, 3, or 4: default = 2)\n");
err_printf("-i filnam\tbreak file\n");
err_printf("-r num\toutput sample rate (must be specified)\n");
err_printf(Str(X_157,"-o fnam\tsound output filename\n"));
err_printf("\n");
err_printf(Str(X_96,"-A\tcreate an AIFF format output soundfile\n"));
err_printf(Str(X_111,"-J\tcreate an IRCAM format output soundfile\n"));
err_printf(Str(X_132,"-W\tcreate a WAV format output soundfile\n"));
err_printf(Str(X_149,"-h\tno header on output soundfile\n"));
err_printf(Str(X_141,"-c\t8-bit signed_char sound samples\n"));
err_printf(Str(X_136,"-a\talaw sound samples\n"));
err_printf(Str(X_94,"-8\t8-bit unsigned_char sound samples\n"));
err_printf(Str(X_166,"-u\tulaw sound samples\n"));
err_printf(Str(X_164,"-s\tshort_int sound samples\n"));
err_printf(Str(X_153,"-l\tlong_int sound samples\n"));
err_printf(Str(X_145,"-f\tfloat sound samples\n"));
err_printf(Str(X_161,"-r N\torchestra srate override\n"));
err_printf(Str(X_1552,"-K\rDo not generate PEAK chunks\n"));
err_printf(Str(X_125,"-R\tcontinually rewrite header while writing soundfile (WAV/AIFF)\n"));
err_printf(Str(X_108,"-H#\tprint a heartbeat style 1, 2 or 3 at each soundfile write\n"));
err_printf(Str(X_120,"-N\tnotify (ring the bell) when score or miditrack is done\n"));
err_printf(Str(X_90,"-- fnam\tlog output to file\n"));
    exit(exitcode);
}

#ifndef CWIN
#include <stdarg.h>

void dribble_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vprintf(fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}
#endif

int writebuffer(MYFLT * obuf, int length)
{
    spoutran(obuf, length);
    audtran(outbuf, O.outsampsiz*length);
    write(outfd, outbuf, O.outsampsiz*length);
    block++;
    bytes += O.outsampsiz*length;
    if (O.rewrt_hdr) {
      rewriteheader(outfd, bytes);
      lseek(outfd, 0L, SEEK_END); /* Place at end again */
    }
    if (O.heartbeat) {
      if (O.heartbeat==1) {
#ifdef SYMANTEC
        nextcurs();
#elif __BEOS__
        putc('.', stderr); fflush(stderr);
#else
        putc("|/-\\"[block&3], stderr); putc(8,stderr);
#endif
      }
      else if (O.heartbeat==2) putc('.', stderr);
      else if (O.heartbeat==3) {
        int n;
        err_printf( "%d%n", block, &n);
        while (n--) putc(8, stderr);
      }
      else putc(7, stderr);
    }
    return length;
}

static void
nullfn(char *outbuf, int nbytes)
{
    return;
}


static void bytetran(float *buffer, int size) /* after J. Mohr  1995 Oct 17 */
{             /*   sends HI-ORDER 8 bits of shortsamp, converted to unsigned */
    long   longsmp;
    int    n;

    for (n=0; n<size; n++) {
      if ((longsmp = (long)buffer[n]) >= 0)   /* +ive samp:   */
        if (longsmp > 32767) {          /* out of range?     */
          longsmp = 32767;              /*   clip and report */
          outrange++;
        }
        else {                          /* ditto -ive samp */
          if (longsmp < -32768) {
            longsmp = -32768;
            outrange++;
          }
        }
      choutbuf[n] = (unsigned char)(longsmp >> 8)^0x80;
    }
}

static void
shortran(float *buffer, int size)       /* fix spout vals and put in outbuf */
{                                       /*      write buffer when full      */
    int n;
    long longsmp;

    for (n=0; n<size; n++) {
        if ((longsmp = (long)buffer[n]) >= 0) {               /* +ive samp:   */
            if (longsmp > 32767) {              /* out of range?     */
                longsmp = 32767;        /*   clip and report */
                outrange++;
            }
        }
        else {
            if (longsmp < -32768) {             /* ditto -ive samp */
                longsmp = -32768;
                outrange++;
            }
        }
        shoutbuf[n] = (short)longsmp;
    }
}

static void
chartran(float *buffer, int size) /* same as above, but 8-bit char output */
                                  /*   sends HI-ORDER 8 bits of shortsamp */
{
    int n;
    long longsmp;

    for (n=0; n<size; n++) {
        if ((longsmp = (long)buffer[n]) >= 0) {       /* +ive samp:   */
            if (longsmp > 32767) {              /* out of range?     */
                longsmp = 32767;        /*   clip and report */
                outrange++;
            }
        }
        else {
            if (longsmp < -32768) {             /* ditto -ive samp */
                longsmp = -32768;
                outrange++;
            }
        }
        choutbuf[n] = (char)(longsmp >> 8);
    }
}

static void
alawtran(float *buffer, int size)
{
    die(Str(X_590,"alaw not yet implemented"));
}

#define MUCLIP  32635
#define BIAS    0x84
#define MUZERO  0x02
#define ZEROTRAP

static void
ulawtran(float *buffer, int size) /* ulaw-encode spout vals & put in outbuf */
                                 /*     write buffer when full      */
{
    int  n;
    long longsmp;
    int  sign;
    extern char    exp_lut[];               /* mulaw encoding table */
    int sample, exponent, mantissa, ulawbyte;

    for (n=0; n<size; n++) {
        if ((longsmp = (long)buffer[n]) < 0) {        /* if sample negative   */
            sign = 0x80;
            longsmp = - longsmp;                /*  make abs, save sign */
        }
        else sign = 0;
        if (longsmp > MUCLIP) {                 /* out of range?     */
            longsmp = MUCLIP;                   /*   clip and report */
            outrange++;
        }
        sample = longsmp + BIAS;
        exponent = exp_lut[( sample >> 8 ) & 0x7F];
        mantissa = ( sample >> (exponent+3) ) & 0x0F;
        ulawbyte = ~ (sign | (exponent << 4) | mantissa );
#ifdef ZEROTRAP
        if (ulawbyte == 0) ulawbyte = MUZERO;    /* optional CCITT trap */
#endif
        choutbuf[n] = ulawbyte;
    }
}

static void
longtran(float *buffer, int size) /* send long_int spout vals to outbuf */
                                  /*    write buffer when full      */
{
    int n;

    for (n=0; n<size; n++) {
        lloutbuf[n] = (long) buffer[n];
        if (buffer[n] > (float)(0x7fffffff)) {
            lloutbuf[n] = 0x7fffffff;
            outrange++;
        }
        else if (buffer[n] < - (float)(0x7fffffff)) {
            lloutbuf[n] = - 0x7fffffff;
            outrange++;
        }
        else lloutbuf[n] = (long) buffer[n];
    }
}

static void
floatran(float *buffer, int size)
{
    int n;
    for (n=0; n<size; n++) floutbuf[n] = buffer[n];
}


MYFLT ino(MYFLT x)
{
    MYFLT	y, t, e, de, sde, xi;
    int i;

    y = x * FL(0.5);
    t = FL(1.0e-08);
    e = FL(1.0);
    de = FL(1.0);
    for (i = 1; i <= 25; i++) {
      xi = (MYFLT)i;
      de = de * y / xi;
      sde = de * de;
      e += sde;
      if (e * t > sde)
        break;
    }
    return(e);
}


void kaiser(int nf, MYFLT *w, int n, int ieo, MYFLT beta)
{

/*
   nf = filter length in samples
    w = window array of size n
    n = filter half length=(nf+1)/2
  ieo = even odd indicator--ieo=0 if nf even
 beta = parameter of kaiser window
*/

    MYFLT	bes, xind, xi;
    int	i;

    bes = ino(beta);
    xind = (MYFLT)(nf-1)*(nf-1);

    for (i = 0; i < n; i++) {
      xi = (MYFLT)i;
      if (ieo == 0)
        xi += 0.5;
      xi = FL(4.0) * xi * xi;
      xi = (MYFLT)sqrt(1.0 - (double)(xi / xind));
      w[i] = ino(beta * xi);
      w[i] /= bes;
    }
    return;
}
