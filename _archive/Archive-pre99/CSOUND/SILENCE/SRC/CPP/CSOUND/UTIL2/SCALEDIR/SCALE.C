/*******************************************************\
*   scale.c                                             *
*   scale a sound file by a float factor                *
*   jpff 3 Sep 1994 after code by dpwe 19sep90          *
*   and a certain amount of lifting from Csound itself  *
\*******************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "../../cs.h"
#include "../../ustub.h"
#include "../../soundio.h"

/* Constants */

#define SHORTMAX 32767
#define FIND(MSG)   if (*s == '\0')  \
                        if (!(--argc) || (s = *++argv) && *s == '-') \
                            die(MSG);

/* Static function prototypes */

 static void InitScaleTable(double, char *);
 static int  SCsndgetset(char *);
 static void ScaleSound(int, int);
 static void FindAndReportMax(int);
 static void (*audtran)(char *, int), nullfn(char *, int);
 static void (*spoutran)(float *);
 static void chartran(float *), alawtran(float *),
            ulawtran(float *), shortran(float *), 
            longtran(float *), floatran(float *);

/* Externs */
extern long getsndin(int, float *, long, SOUNDIN *);
extern void bytrev2(char *, int), bytrev4(char *, int), rewriteheader(int,long);
extern int  openout(char *, int), bytrevhost(void), getsizformat(int);
extern int sndgetset(SOUNDIN *);
extern void writeheader(int, char*);
extern char *getstrformat(int);

/* Static global variables */
static SOUNDIN     *p;  /* space allocated by SAsndgetset() */
static unsigned    outbufsiz;
static void        *outbuf; 
static  char       *choutbuf;               /* char  pntr to above  */
static  short      *shoutbuf;               /* short pntr           */
static  long       *lloutbuf;               /* long  pntr           */
static  float      *floutbuf;               /* float pntr           */
static  int        outrange = 0;            /* Count samples out of range */

static void usage(char *mesg)
{
    err_printf( "%s\n", mesg);
    err_printf(Str(X_19,"Usage:\tscale [-flags] soundfile\n"));
    err_printf(Str(X_9,"Legal flags are:\n"));
    err_printf(Str(X_157,"-o fnam\tsound output filename\n"));
    err_printf(Str(X_96,"-A\tcreate an AIFF format output soundfile\n"));
    err_printf(Str(X_132,"-W\tcreate a WAV format output soundfile\n"));
    err_printf(Str(X_149,"-h\tno header on output soundfile\n"));
    err_printf(Str(X_141,"-c\t8-bit signed_char sound samples\n"));
    err_printf(Str(X_136,"-a\talaw sound samples\n"));
    err_printf(Str(X_166,"-u\tulaw sound samples\n"));
    err_printf(Str(X_164,"-s\tshort_int sound samples\n"));
    err_printf(Str(X_153,"-l\tlong_int sound samples\n"));
    err_printf(Str(X_145,"-f\tfloat sound samples\n"));
    err_printf(Str(X_11,"-F fpnum\tamount to scale amplitude\n"));
    err_printf(Str(X_24,"-F file \tfile of scaling information (alternative)\n"));
    err_printf(Str(X_25,"-R\tcontinually rewrite header while writing soundfile (WAV/AIFF)\n"));
    err_printf(Str(X_108,"-H#\tprint a heartbeat style 1, 2 or 3 at each soundfile write\n"));
    err_printf(Str(X_120,"-N\tnotify (ring the bell) when score or miditrack is done\n"));
    err_printf(Str(X_90,"-- fnam\tlog output to file\n"));
    err_printf(Str(X_39,"flag defaults: scale -s -otest -F 0.0\n"));
    err_printf(Str(X_41,"If scale is 0.0 then reports maximum possible scaling\n"));
    exit(1);
}

int
main(int argc, char **argv)
{
    char        *inputfile = NULL;
    double      factor = 0.0;
    char        *factorfile = NULL;
    int         infd, outfd;
    char        outformch, c, *s, *filnamp;
    char        *envoutyp;
    OPARMS      OO;

    init_getstring(argc, argv);
    memset(&OO, 0, sizeof(OO));
    /* Check arguments */
    {
        char *getenv();
        if ((envoutyp = getenv("SFOUTYP")) != NULL) {
            if (strcmp(envoutyp,"AIFF") == 0)
                OO.filetyp = TYP_AIFF;
            else if (strcmp(envoutyp,"WAV") == 0)
                OO.filetyp = TYP_WAV;
            else {
                err_printf(Str(X_61,"%s not a recognized SFOUTYP env setting"),
                        envoutyp);
                exit(1);
            }
        }
    }
    O.filnamspace = filnamp = mmalloc((long)1024);
    if (!(--argc))
        usage(Str(X_939,"Insufficient arguments"));
    do {
        s = *++argv;
        if (*s++ == '-')                      /* read all flags:  */
            while ((c = *s++) != '\0')
                switch(c) {
                case 'j':
                    FIND("")
                    while (*++s);
                    break;
                case 'o':
                    FIND(Str(X_1052,"no outfilename"))
                    O.outfilename = filnamp;            /* soundout name */
                    while ((*filnamp++ = *s++)); s--;
                    if (strcmp(O.outfilename,"stdin") == 0)
                        die("-o cannot be stdin");
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
                    if (OO.filetyp == TYP_WAV) {
                        if (envoutyp == NULL) goto outtyp;
                        warning(Str(X_95,"-A overriding local default WAV out"));
                    }
                    OO.filetyp = TYP_AIFF;     /* AIFF output request  */
                    break;
                case 'W':
                    if (OO.filetyp == TYP_AIFF) {
                        if (envoutyp == NULL) goto outtyp;
                        warning(Str(X_131,"-W overriding local default AIFF out"));
                    }
                    OO.filetyp = TYP_WAV;      /* WAV output request  */
                    break;
                case 'F':
                    FIND(Str(X_42,"no scale factor"));
                    if (isdigit(*s) || *s == '-' || *s == '+')
                        factor = atof(s);
                    else
                        factorfile = s;
                    while (*++s);
                    break;
                case 'h':
                    OO.sfheader = 0;           /* skip sfheader  */
                    break;
                case 'c':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_CHAR;     /* 8-bit char soundfile */
                    break;
                case 'a':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_ALAW;     /* a-law soundfile */
                    break;
                case 'u':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_ULAW;     /* mu-law soundfile */
                    break;
                case 's':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_SHORT;    /* short_int soundfile */
                    break;
                case 'l':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_LONG;     /* long_int soundfile */
                    break;
                case 'f':
                    if (OO.outformat) goto outform;
                    outformch = c;
                    OO.outformat = AE_FLOAT;    /* float soundfile */
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
                    O.ringbell = 1;             /* notify on completion */
                    break;
                case '-':
                    FIND(Str(X_1044,"no log file"));
                    dribble = fopen(s, "w");
                    while (*s++); s--;
                    break;
                default:
                    sprintf(errmsg,Str(X_1334,"unknown flag -%c"), c);
                    usage(errmsg);
                }
        else if (inputfile == NULL) {
            inputfile = --s;
        }
        else usage(Str(X_1286,"too many arguments"));
    } while (--argc);

    /* Read sound file */
    if (!(infd = SCsndgetset(inputfile))) {
        err_printf(Str(X_76,"%s: error while opening %s"), argv[0], inputfile);
        exit(1);
    }
    if (factor != 0.0 || factorfile != NULL) {          /* perform scaling */
        if (OO.outformat)                       /* if no audioformat yet  */
            O.outformat = OO.outformat;
        else O.outformat = p->format; /* Copy from input file */
        O.outsampsiz = getsizformat(O.outformat);
        if (OO.filetyp)
            O.filetyp = OO.filetyp;
        else O.outformat = O.informat; /* Copy from input file */
        if (OO.sfheader)
            O.sfheader = OO.sfheader;
        else O.sfheader = 1;
        if (O.filetyp == TYP_AIFF) {
            if (!O.sfheader)
                die(Str(X_629,"can't write AIFF/WAV soundfile with no header"));
            if (O.outformat == AE_ALAW || O.outformat == AE_ULAW
              || O.outformat == AE_FLOAT) {
                sprintf(errmsg,Str(X_180,"AIFF does not support %s encoding"),
                     getstrformat(O.outformat));
                die(errmsg);
            }
        }
        if (O.filetyp == TYP_WAV) {
            if (!O.sfheader)
                die(Str(X_629,"can't write AIFF/WAV soundfile with no header"));
            if (O.outformat == AE_ALAW || O.outformat == AE_ULAW
              || O.outformat == AE_FLOAT) {
                sprintf(errmsg,Str(X_181,"WAV does not support %s encoding"),
                     getstrformat(O.outformat));
                die(errmsg);
            }
        }
        if (OO.filetyp)
            O.filetyp = OO.filetyp;
        if (O.rewrt_hdr && !O.sfheader)
            die(Str(X_628,"can't rewrite header if no header requested"));
        if (O.outfilename == NULL)  O.outfilename = "test";
        outfd = openout(O.outfilename, 1);
        esr = p->sr;
        nchnls = p->nchnls;
        if (O.sfheader)         
            writeheader(outfd, O.outfilename);  /* write header as required     */
        if (O.filetyp == TYP_AIFF && bytrevhost()
         || O.filetyp == TYP_WAV && !bytrevhost()) {
            if (O.outformat == AE_SHORT)        /* if audio out needs byte rev  */
                audtran = bytrev2;           /*   redirect the audio puts    */
            else if (O.outformat == AE_LONG)
                audtran = bytrev4;
            else audtran = nullfn;
        }
        else audtran = nullfn;          /* else use standard audio puts */
        outbufsiz = 1024 * O.outsampsiz;/* calc outbuf size  */
        outbuf = mmalloc((long)outbufsiz);                 /*  & alloc bufspace */
        printf(Str(X_1382,"writing %d-byte blks of %s to %s %s\n"),
               outbufsiz, getstrformat(O.outformat), O.outfilename,
               O.filetyp == TYP_AIFF ? "(AIFF)" :
               O.filetyp == TYP_WAV ? "(WAV)" : "");
        switch(O.outformat) {
        case AE_CHAR:  spoutran = chartran;
                       choutbuf = outbuf;
                       break;
        case AE_ALAW:  spoutran = alawtran;
                       choutbuf = outbuf;
                       break;
        case AE_ULAW:  spoutran = ulawtran;
                       choutbuf = outbuf;
                       break;
        case AE_SHORT: spoutran = shortran;
                       shoutbuf = (short *)outbuf;
                       break;
        case AE_LONG:  spoutran = longtran;
                       lloutbuf = (long  *)outbuf;
                       break;
        case AE_FLOAT: spoutran = floatran;
                       floutbuf = (float *)outbuf;
                       break;
        default: 
            err_printf( "Type is %x\n", O.outformat);
            die(Str(X_1329,"unknown audio_out format"));
        }
        InitScaleTable(factor, factorfile);
        ScaleSound(infd, outfd);
        close(outfd);
    }
    else
        FindAndReportMax(infd);
    if (O.ringbell) putc(7, stderr);
    return 0;

outtyp:
    usage(Str(X_1113,"output soundfile cannot be both AIFF and WAV"));

outform:
    sprintf(errmsg,Str(X_1198,"sound output format cannot be both -%c and -%c"),
            outformch, c);
    usage(errmsg);
}

static double ff = 0.0;
static int table_used = 0;
typedef struct scalepoint {
    double y0;
    double y1;
    double yr;
    int x0;
    int x1;
    struct scalepoint *next;
} scalepoint;
scalepoint scale_table = {0.0, 0.0, 0.0, 0, 0, NULL};
scalepoint *end_table = &scale_table;

static void 
InitScaleTable(double factor, char *factorfile)
{
    if (factor != 0.0) ff = factor;
    else {
        FILE *f = fopen(factorfile, "r");
        double samplepert = (double)p->sr;
        double x, y;
        while (fscanf(f, "%lf %lf\n", &x, &y) == 2) {
            scalepoint *newpoint = (scalepoint*) malloc(sizeof(scalepoint));
            if (newpoint == NULL) {
                err_printf( "Insufficient memory\n");
                exit(1);
            }
            end_table->next = newpoint;
            newpoint->x0 = end_table->x1;
            newpoint->y0 = end_table->y1;
            newpoint->x1 = (int) (x*samplepert);
            newpoint->y1 = y;
            newpoint->yr =
                (x == newpoint->x0 ?
                 y - newpoint->y0 :
                 (y - newpoint->y0)/((double)(newpoint->x1 - newpoint->x0)));
            newpoint->next = NULL;
            end_table = newpoint;
        }
        {
            scalepoint *newpoint = (scalepoint*) malloc(sizeof(scalepoint));
            if (newpoint == NULL) {
                err_printf( "Insufficient memory\n");
                exit(1);
            }
            end_table->next = newpoint;
            newpoint->x0 = end_table->x1;
            newpoint->y0 = end_table->y1;
            newpoint->x1 = 0x7fffffff;
            newpoint->y1 = 0.0;
            newpoint->next = NULL;
            newpoint->yr = (x == newpoint->x0 ?
                            -newpoint->y0 :
                            -newpoint->y0/((double)(0x7fffffff-newpoint->x0)));
        }
        end_table = &scale_table;
/*      { */
/*          scalepoint *tt = &scale_table; */
/*          err_printf( "Scale table is\n"); */
/*          while (tt != NULL) { */
/*              err_printf( "(%d %lf) -> %d %lf [%lf]\n", */
/*                      tt->x0, tt->y0, tt->x1, tt->y1, tt->yr); */
/*              tt = tt->next; */
/*          } */
/*          err_printf( "END of Table\n"); */
/*      } */
        table_used = 1;
    }
}

static double 
gain(int i)
{
    if (!table_used) return ff;
    while (i<end_table->x0 || i>end_table->x1){/* Get correct segment */
/*      err_printf( "Next table: %d (%d %lf) -> %d %lf [%lf]\n", */
/*            i, end_table->x0, end_table->y0, end_table->x1, end_table->y1, */
/*            end_table->yr); */
        end_table = end_table->next;  
    }
    return end_table->y0 + end_table->yr * (double)(i - end_table->x0);
}



static int
SCsndgetset(char *inputfile)
{
    int          infd;
    float        dur;
static  ARGOFFS  argoffs = {0};     /* these for sndgetset */
static  OPTXT    optxt;
static  float    fzero = 0.0;
    char         quotname[80];

    sssfinit();                 /* stand-alone init of SFDIR etc. */
    esr = 0.0;                  /* set esr 0. with no orchestra   */
    optxt.t.outoffs = &argoffs; /* point to dummy OUTOCOUNT       */
    p = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
    p->channel = ALLCHNLS;
    p->h.optext = &optxt;
    p->ifilno = &sstrcod;
    p->iskptim = &fzero;
    p->iformat = &fzero;
    sprintf(quotname,"%c%s%c",'"',inputfile,'"');
    p->STRARG = quotname;
    if ((infd = sndgetset(p)) == 0)            /* open sndfil, do skiptime */
        return(0);
    p->getframes = p->framesrem;
    dur = (float) p->getframes / p->sr;
    printf("scaling %ld sample frames (%3.1f secs)\n",
                   p->getframes, dur);
    return(infd);
}

#define BUFFER_LEN (1024)

static void 
ScaleSound(int infd, int outfd)
{
    float buffer[BUFFER_LEN];
    long  read_in;
    float tpersample;
    float max, min;
    long  maxpos, minpos;
    int   maxtimes, mintimes;
    int   i, chans;
    long  bytes = 0;
    int   block = 0;

    chans = p->nchnls;
    tpersample = 1.0/(float)p->sr;
    max = 0.0;  maxpos = 0; maxtimes = 0;
    min = 0.0;  minpos = 0; mintimes = 0;
    while ((read_in = getsndin(infd, buffer, BUFFER_LEN, p)) > 0) {
        for (i=0; i<read_in; i++) {
            buffer[i] = buffer[i] * gain(i+BUFFER_LEN*block);
            if (buffer[i] >= max) ++maxtimes;
            if (buffer[i] <= min) ++mintimes;
            if (buffer[i] > max)
                max = buffer[i], maxpos = i+BUFFER_LEN*block, maxtimes = 1;
            if (buffer[i] < min)
                min = buffer[i], minpos = i+BUFFER_LEN*block; mintimes = 1;
        }
        spoutran(buffer);
        audtran(outbuf, read_in*O.outsampsiz);
        write(outfd, outbuf, read_in*O.outsampsiz);
        block++;
        bytes += read_in*O.outsampsiz;
        if (O.rewrt_hdr) {
            rewriteheader(outfd, bytes);
            lseek(outfd, 0, 2); /* Place at end again */
        }
        if (O.heartbeat) {
            putc("|/-\\"[block&3], stderr);
            putc('\b',stderr);
        }
    }
    rewriteheader(outfd, bytes);
    close(infd);
    printf("Max val %d at index %ld (time %.4f, chan %d) %d times\n",
        (int)max,maxpos,tpersample*(maxpos/chans),(int)maxpos%chans, maxtimes);
    printf("Min val %d at index %ld (time %.4f, chan %d) %d times\n",
        (int)min,minpos,tpersample*(minpos/chans),(int)minpos%chans, mintimes);
    if (outrange)
        printf("%d sample%sout of range\n",
                       outrange, outrange==1 ? " " : "s ");
    else
        printf("Max scale factor = %.3f\n", 
                       (float)SHORTMAX/(float)((max>-min)?max:-min) );
    return;
    }

static void
FindAndReportMax(int infd)
{
    int         chans;
    float       tpersample;
    float       max, min;
    long        maxpos, minpos;
    int         maxtimes, mintimes;
    int         block = 0;
    float       buffer[BUFFER_LEN];
    long        read_in;
    int         i;

    chans = p->nchnls;
    tpersample = 1.0/(float)p->sr;
    max = 0.0;  maxpos = 0; maxtimes = 0;
    min = 0.0;  minpos = 0; mintimes = 0;
    while ((read_in = getsndin(infd, buffer, BUFFER_LEN, p)) > 0) {
        for (i=0; i<read_in; i++) {
            if (buffer[i] >= max) ++maxtimes;
            if (buffer[i] <= min) ++mintimes;
            if (buffer[i] > max)
                max = buffer[i], maxpos = i+BUFFER_LEN*block, maxtimes = 1;
            if (buffer[i] < min)
                min = buffer[i], minpos = i+BUFFER_LEN*block, mintimes = 1;
        }
        block++;
    }
    close(infd);
    printf("Max val %d at index %ld (time %.4f, chan %d) %d times\n",
       (int)max,maxpos,tpersample*(maxpos/chans),(int)maxpos%chans,maxtimes);
    printf("Min val %d at index %ld (time %.4f, chan %d) %d times\n",
       (int)min,minpos,tpersample*(minpos/chans),(int)minpos%chans,mintimes);
    printf("Max scale factor = %.3f\n", 
           (float)SHORTMAX/(float)((max>-min)?max:-min) );
}

static void
nullfn(char *outbuf, int nbytes)
{
}

static void
shortran(float buffer[BUFFER_LEN])      /* fix spout vals and put in outbuf */
{                                       /*      write buffer when full      */
    int n;
    long longsmp;

    for (n=0; n<BUFFER_LEN; n++) {
        if ((longsmp = buffer[n]) >= 0) {               /* +ive samp:   */
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
chartran(float buffer[BUFFER_LEN]) /* same as above, but 8-bit char output */
                                   /*   sends HI-ORDER 8 bits of shortsamp */
{
    int n;
    long longsmp;


    for (n=0; n<BUFFER_LEN; n++) {
        if ((longsmp = buffer[n]) >= 0) {       /* +ive samp:   */
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
        choutbuf[n] = longsmp >> 8;
    }
}

static void
alawtran(float buffer[BUFFER_LEN])
{ die("alaw not yet implemented"); }

#define MUCLIP  32635
#define BIAS    0x84
#define MUZERO  0x02
#define ZEROTRAP 

static void
ulawtran(float buffer[BUFFER_LEN]) /* ulaw-encode spout vals & put in outbuf */
                                   /*   write buffer when full      */
{
    int  n;
    long longsmp;
    int  sign;
    extern char    exp_lut[];               /* mulaw encoding table */
    int sample, exponent, mantissa, ulawbyte;

    for (n=0; n<BUFFER_LEN; n++) {
        if ((longsmp = buffer[n]) < 0) {        /* if sample negative   */
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
longtran(float buffer[BUFFER_LEN])      /* send long_int spout vals to outbuf */
                                        /*      write buffer when full      */
{
    int n;

    for (n=0; n<BUFFER_LEN; n++) {
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
floatran(float buffer[BUFFER_LEN])      /* send float spout vals to outbuf */
                                /*      write buffer when full      */
{
    int n;
    for (n=0; n<BUFFER_LEN; n++) {
      if (buffer[n]> 32767.0 || buffer[n]<-32768.0) outrange++;
      floutbuf[n] = buffer[n];
    }
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
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}
#endif
