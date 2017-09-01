#include "cs.h"                 /*                              ARG_DECODE.C */
#include "soundio.h"
#include <ctype.h>

#ifdef mills_macintosh
#include <SIOUX.h>
#include "perf.h"
#include"MacTransport.h"

#define main mw_main
#define PATH_LEN        128

extern struct Transport transport;
extern Boolean displayText;

extern char sfdir_path[];
extern char sadir_path[];
extern char ssdir_path[];
extern char saved_scorename[];
extern unsigned char mytitle[];
extern Boolean util_perf;
extern unsigned short pollEventRate;

static char *foo;
static char listing_file[PATH_LEN];
static int  vbuf;
static int csNGraphs;
static int rescale24 = 0;
static MYFLT temp;
#endif

#ifdef LINUX
int midi_out;
extern void openMIDIout(void);
#endif

extern  OPARMS  O;
extern char    *orchname;  /* used by rdorch */
int     stdinassgn = 0;
extern char    *scorename;
extern char    *xfilename;
extern int keep_tmp;
extern int dither_output;
extern int peakchunks;
extern void create_opcodlst(void);
extern void readOptions(FILE*);

#define FIND(MSG)   if (*s == '\0')  \
                        if (!(--argc) || ((s = *++argv) != NULL) && *s == '-') \
                            dieu(MSG);

/* alphabetically, so i dont have to hunt for a letter next time...
**********************************************************************
-a alaw sound samples
-A create an AIFF format output soundfile
-b N sample frames (or -kprds) per software sound I/O buffer
-B N samples per hardware sound I/O buffer
-c 8-bit signed_char sound samples
-C use Cscore processing of scorefile
-d suppress all displays
-D defer GEN01 soundfile loads until performance time
-e Rescale floats as shorts to max amplitude
-E (was -G) N  Number of tables in graphics window
-f float sound samples
-F fnam read MIDIfile event stream from file 'fnam'
-g suppress graphics, use ascii displays
-G suppress graphics, use Postscript displays
-h no header on output soundfile
-H N print a heartbeat style 1, 2 or 3 at each soundfile write
-i fnam sound input filename
-I I-time only orch run
-j Used in localisation
-J create an IRCAM format output soundfile
-k N orchestra krate override
-K No Peak Chunks
-l long_int sound samples
-L dnam read Line-oriented realtime score events from device 'dnam'
-m N tty message level. Sum of: 1=note amps, 2=out-of-range msg, 4=warnings
-M dnam read MIDI realtime events from device 'dnam'
-n no sound onto disk
-N notify (ring the bell) when score or miditrack is done
-o fnam sound output filename
-O
-p Play after rendering
-P N Poll Events Every N Buffer Writes (Mac)
-q fnam  Sound Sample-In Directory
-Q fnam  Analysis Directory (Macintosh)
         MIDI output device (Linux, BeOS)
-r N orchestra srate override
-R continually rewrite header while writing soundfile (WAV/AIFF)
-s short_int sound samples
-S score is in Scot format
-t N use uninterpreted beats of the score, initially at tempo N
-t0 Use score.srt rather than a temporary
-T terminate the performance when miditrack is done
-u ulaw sound samples
-U unam run utility program unam
-v verbose orch translation
-V N  Number of chars in screen buffer for output window
-w   Record and Save MIDI input to a file
-W create a WAV format output soundfile
-x fnam extract from score.srt using extract file 'fnam'
-X fnam  Sound File Directory
-y N  Enables Profile Display at rate N in seconds,
   or for negative N, at -N kperiods
-Y N  Enables Progress Display at rate N seconds,
   or for negative N, at -N kperiods
-z List opcodes in this version
-Z Dither output
-- fnam log output to file (was -y fnam  Redirect output to listing file 'fnam')
-3 24bit samples
-8 8-bit unsigned_char sound samples  J. Mohr 1995 Oct 17
*/

void usage(void)
{
err_printf(Str(X_519,"Usage:\tcsound [-flags] orchfile scorefile\n"));
err_printf( Str(X_325,"Legal flags are:\n"));
err_printf(Str(X_128,"-U unam\trun utility program unam\n"));
err_printf(Str(X_102,"-C\tuse Cscore processing of scorefile\n"));
err_printf(Str(X_109,"-I\tI-time only orch run\n"));
err_printf(Str(X_155,"-n\tno sound onto disk\n"));
err_printf(Str(X_150,"-i fnam\tsound input filename\n"));
err_printf(Str(X_157,"-o fnam\tsound output filename\n"));
err_printf(Str(X_138,"-b N\tsample frames (or -kprds) per software sound I/O buffer\n"));
err_printf(Str(X_100,"-B N\tsamples per hardware sound I/O buffer\n"));
err_printf(Str(X_96,"-A\tcreate an AIFF format output soundfile\n"));
err_printf(Str(X_132,"-W\tcreate a WAV format output soundfile\n"));
err_printf(Str(X_111,"-J\tcreate an IRCAM format output soundfile\n"));
err_printf(Str(X_149,"-h\tno header on output soundfile\n"));
err_printf(Str(X_141,"-c\t8-bit signed_char sound samples\n"));
err_printf(Str(X_136,"-a\talaw sound samples\n"));
err_printf(Str(X_94,"-8\t8-bit unsigned_char sound samples\n")); /* J. Mohr 1995 Oct 17 */
err_printf(Str(X_166,"-u\tulaw sound samples\n"));
err_printf(Str(X_164,"-s\tshort_int sound samples\n"));
err_printf(Str(X_153,"-l\tlong_int sound samples\n"));
err_printf(Str(X_145,"-f\tfloat sound samples\n"));
err_printf(Str(X_1138,"-3\t24bit sound samples\n"));
err_printf(Str(X_161,"-r N\torchestra srate override\n"));
err_printf(Str(X_152,"-k N\torchestra krate override\n"));
err_printf(Str(X_1552,"-K\rDo not generate PEAK chunks\n"));
err_printf(Str(X_168,"-v\tverbose orch translation\n"));
err_printf(Str(X_154,"-m N\ttty message level. Sum of: 1=note amps, 2=out-of-range msg, 4=warnings\n"));
err_printf(Str(X_143,"-d\tsuppress all displays\n"));
err_printf(Str(X_147,"-g\tsuppress graphics, use ascii displays\n"));
err_printf(Str(X_107,"-G\tsuppress graphics, use Postscript displays\n"));
err_printf(Str(X_170,"-x fnam\textract from score.srt using extract file 'fnam'\n"));
err_printf(Str(X_165,"-t N\tuse uninterpreted beats of the score, initially at tempo N\n"));
err_printf(Str(X_425,"-t 0\tuse score,srt for sorted score rather than a temporary\n"));
err_printf(Str(X_112,"-L dnam\tread Line-oriented realtime score events from device 'dnam'\n"));
err_printf(Str(X_116,"-M dnam\tread MIDI realtime events from device 'dnam'\n"));
err_printf(Str(X_105,"-F fnam\tread MIDIfile event stream from file 'fnam'\n"));
/* err_printf(Str(X_121,"-P N\tMIDI sustain pedal threshold (0 - 128)\n")); */
err_printf(Str(X_125,"-R\tcontinually rewrite header while writing soundfile (WAV/AIFF)\n"));
err_printf(Str(X_108,"-H#\tprint a heartbeat style 1, 2 or 3 at each soundfile write\n"));
err_printf(Str(X_120,"-N\tnotify (ring the bell) when score or miditrack is done\n"));
err_printf(Str(X_126,"-T\tterminate the performance when miditrack is done\n"));
err_printf(Str(X_103,"-D\tdefer GEN01 soundfile loads until performance time\n"));
#ifdef LINUX                    /* Jonathan Mohr  1995 Oct 17 */
err_printf(Str(X_1549,"-Q dnam\tselect MIDI output device\n"));
#ifdef RTAUDIO
err_printf(Str(X_130,"-V N\tset real-time audio output volume to N (1 to 100)\n"));
#endif
#endif
#ifdef __BEOS__                 /* jjk 09252000 */
err_printf(Str(X_1549,"-Q dnam\tselect MIDI output device\n"));
#endif
err_printf(Str(X_172,"-z\tList opcodes in this version\n"));
err_printf(Str(X_1537,"-Z\tDither output\n"));
err_printf(Str(X_90,"-- fnam\tlog output to file\n"));
#ifdef mills_macintosh
err_printf(Str(X_581,"_____________Macintosh Command Line Flags_________________\n"));
/* err_printf(Str(X_89,"-- fnam\t Redirect output to listing file 'fnam'\n")); */
err_printf(Str(X_133,"-X fnam\t Sound File Directory\n"));
err_printf(Str(X_160,"-q fnam\t Sound Sample-In Directory\n"));
err_printf(Str(X_123,"-Q fnam\t Analysis Directory\n"));
err_printf(Str(X_129,"-V N\t Number of chars in screen buffer for output window\n"));
err_printf(Str(X_104,"-E N\t Number of tables in graphics window\n"));
err_printf(Str(X_159,"-p\t\t Play after rendering\n"));
err_printf(Str(X_144,"-e\t\t Rescaled floats as shorts to max amplitude\n"));
err_printf(Str(X_169,"-w\t\t Record and Save MIDI input to a file\n"));
err_printf(Str(X_171,"-y N\t Enables Progress Display at rate N seconds,\n"));
err_printf(Str(X_572,"\t\t\tor for negative N, at -N kperiods\n"));
err_printf(Str(X_134,"-Y N\t Enables Profile Display at rate N in seconds,\n"));
err_printf(Str(X_572,"\t\t\tor for negative N, at -N kperiods\n"));
err_printf("-P N\t Poll Events Every N Buffer Writes\n");
err_printf(Str(X_582,"__________________________________________________________\n"));
#endif
err_printf(Str(X_768,"flag defaults: csound -s -otest -b%d -B%d -m7 -P128\n"),
        IOBUFSAMPS, IODACSAMPS);
#ifdef SSOUND
/**
* Try not to just exit if we get here, for re-entrant versions of Csound.
*/
#else
        exit(1);
#endif
}

void dieu(char *s)
{
    err_printf(Str(X_236,"Csound Command ERROR:\t%s\n"),s);
    usage();
#ifdef mills_macintosh
    die("");
#else
    if (!POLL_EVENTS()) exit(1);
#endif
}

typedef struct {
  char *util;
  int (*fn)(int, char**);
  int  strno;
  char *string;
} UTILS;

UTILS utilities[] = {
  { "hetro", hetro, X_1364, "util HETRO:\n" },
  { "lpanal", lpanal, X_1365, "util LPANAL:\n" },
  { "pvanal", pvanal, X_1366, "util PVANAL:\n" },
  { "sndinfo", sndinfo, X_1367, "util SNDINFO:\n" },
  { "cvanal", cvanal, X_1363, "util CVANAL:\n" },
  { "pvlook", pvlook, X_23, "util PVLOOK:\n" },
  { NULL, NULL, 0}
};

int argdecode(int argc, char **argv, char **pfilnamp, char *envoutyp)
{
    char *s;
    char c;
    int n;
    static char outformch;
    char *filnamp = *pfilnamp;

#ifdef mills_macintosh
         keep_tmp = 1;
 #else
    keep_tmp = 0;
#endif

    do {

      s = *++argv;
      if (*s++ == '-') {                        /* read all flags:  */
        while ((c = *s++) != '\0') {
          switch(c) {
          case 'U':
            FIND(Str(X_1064,"no utility name"));
#ifdef mills_macintosh
            util_perf = true;
            transport.state |= kUtilPerf;
#endif
            for (n=0; utilities[n].util!=NULL; n++) {
              if (strcmp(s,utilities[n].util) == 0) {
              printf(Str(utilities[n].strno, utilities[n].string));
#ifdef mills_macintosh
              SIOUXSetTitle((unsigned char *)CtoPstr((char *)s));
#endif
              (utilities[n].fn)(argc,argv);
              goto fnd;
              }
            }
#ifdef never
            if (strcmp(s,"hetro") == 0) {
              printf(Str(X_1364,"util HETRO:\n"));
              hetro(argc,argv);
            }
            else if (strcmp(s,"lpanal") == 0) {
              printf(Str(X_1365,"util LPANAL:\n"));
              lpanal(argc,argv);
            }
            else if (strcmp(s,"pvanal") == 0) {
              printf(Str(X_1366,"util PVANAL:\n"));
              pvanal(argc,argv);
            }
            else if (strcmp(s,"sndinfo") == 0) {
              printf(Str(X_1367,"util SNDINFO:\n"));
              sndinfo(argc,argv);
            }
            else if (strcmp(s,"cvanal") == 0) {
              printf(Str(X_1363,"util CVANAL:\n"));
              cvanal(argc,argv);
            }
            else if (strcmp(s,"pvlook") == 0) {
              printf(Str(X_23,"util PVLOOK:\n"));
              pvlook(argc,argv);
            }
            else
#endif
              dies(Str(X_127,"-U %s not a valid UTIL name"),s);
          fnd:
            *pfilnamp = filnamp;
            return(0);
            /********** commandline flags only for mac version***************/
            /*********************  matt 5/26/96 ****************************/
#ifdef mills_macintosh
          case 'q':
            FIND(Str(X_1060,"no sound sample directory name")) ;
            foo = filnamp;
            while ((*filnamp++ = *s++));  s--;
            strcpy(ssdir_path,foo);
            break;
          case 'Q':
            FIND(Str(X_1023,"no analysis directory name")) ;
            foo = filnamp;
            while ((*filnamp++ = *s++));  s--;
            strcpy(sadir_path,foo);
            break;
          case 'X':
            FIND(Str(X_1059,"no sound file directory name"));
            foo = filnamp;
            while ((*filnamp++ = *s++));  s--;
            strcpy(sfdir_path,foo);
            break;
/*      case '-': FIND(Str(X_1043,"no listing file name")) ;
            foo = filnamp;
            while ((*filnamp++ = *s++));  s--;
            strcpy(listing_file,foo);
            printf(Str(X_1158,"redirecting standard out to %s......\n"),
                   listing_file);
            if (!freopen(listing_file,"w",stdout))
                          die(Str(X_673,"could not redirect sandard out\n"));
            break;
*/
          case 'V':
            FIND(Str(X_1058,"no screen buffer size"));
            sscanf(s,"%d",&vbuf);
            fflush(stdout);
            setvbuf(stdout, NULL, _IOFBF, vbuf);
            while (*++s);
            break;
          case 'P':
            FIND(Str(X_1551,"no poll event rate"));
            sscanf(s,"%d",&n);
            while (*++s);
            pollEventRate = n;
            break;
          case 'E':
            FIND(Str(X_1049,"no number of graphs"));
            sscanf(s,"%d",&csNGraphs);
            SetCsNGraphs(csNGraphs);
            while (*++s);
            break;
          case 'p':
            SetPlayOnFinish(TRUE);
            break;
          case 'e':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            sscanf(s,"%d",&rescale24);
            outformch = c;
            O.outformat = AE_FLOAT;   /* float soundfile */
            if (rescale24)
              SetRescaleFloatFileTo24(TRUE);
            SetRescaleFloatFile(TRUE);
            while (*++s);
            break;
          case 'w':
            SetRecordMIDIData(TRUE);
            break;
          case 'y':
            FIND(Str(X_1020,"no Rate for Progress Display"));
            if (sizeof(MYFLT)==4) sscanf(s,"%f",&temp);
            else sscanf(s,"%lf", &temp);
/*### TEMP */err_printf(
    Str(X_488,"The Progress/Profile feature is currently disabled, sorry.\n"));
            while (*++s);
            break;
          case 'Y':
            FIND(Str(X_1019,"no Rate for Profile Display"));
            if (sizeof(MYFLT)==4) sscanf(s,"%f",&temp);
            else sscanf(s,"%lf", &temp);
            /*### TEMP  printf("Profile flag is %f.\n  COMING SOON!!\n",temp); */
            while (*++s);
            break;
#endif
            /*******************************************************************/
          case 'C':
            O.usingcscore = 1;     /* use cscore processing  */
            break;
          case 'I':
            O.initonly = 1;           /* I-only implies */
          case 'n':
            O.sfwrite = 0;            /* nosound        */
            break;
          case 'i':
            FIND(Str(X_1038,"no infilename"));
            O.infilename = filnamp;   /* soundin name */
            while ((*filnamp++ = *s++));  s--;
            if (!POLL_EVENTS()) exit(1);
            if (strcmp(O.infilename,"stdout") == 0)
              dieu("-i cannot be stdout");
            if (strcmp(O.infilename,"stdin") == 0)
#if defined mills_macintosh || defined SYMANTEC
              dieu(Str(X_1242,"stdin audio not supported"));
#else
            {
              if (stdinassgn)
                dieu(Str(X_151,"-i: stdin previously assigned"));
              stdinassgn = 1;
            }
#endif
            O.sfread = 1;
            break;
          case 'o':
            FIND(Str(X_1052,"no outfilename"));
            O.outfilename = filnamp;          /* soundout name */
            while ((*filnamp++ = *s++)); s--;
            if (strcmp(O.outfilename,"stdin") == 0)
              dieu(Str(X_156,"-o cannot be stdin"));
            if (strcmp(O.outfilename,"stdout") == 0)
#if defined mac_classic || defined SYMANTEC || defined BCC || defined __WATCOMC__ || defined WIN32
              dieu(Str(X_1244,"stdout audio not supported"));
#else
            {
              if ((O.stdoutfd = dup(1)) < 0) /* redefine stdout */
                die(Str(X_1290,"too many open files"));
              dup2(2,1);                /* & send 1's to stderr */
            }
#endif
            break;
          case 'b':
            FIND(Str(X_1039,"no iobufsamps"));
            sscanf(s,"%d%n",&O.outbufsamps, &n);
            /* defaults in musmon.c */
            O.inbufsamps = O.outbufsamps;
            s += n;
            break;
          case 'B':
            FIND(Str(X_1034,"no hardware bufsamps"));
            sscanf(s,"%ld%n",&O.oMaxLag, &n);
            /* defaults in rtaudio.c */
            s += n;
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
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_CHAR;    /* signed 8-bit char soundfile */
            break;
          case 'a':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_ALAW;    /* a-law soundfile */
            break;
          case 'u':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_ULAW;    /* mu-law soundfile */
            break;
          case '8':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_UNCH;    /* unsigned 8-bit soundfile */
            break;
          case 's':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_SHORT;   /* short_int soundfile*/
            break;
/*RWD 5:2001 */
          case '3':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_24INT;   /* 24bit packed soundfile*/
            break;
          case 'l':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_LONG;    /* long_int soundfile */
            break;
          case 'f':
            if (O.outformat) {
              sprintf(errmsg,
                      Str(X_1198,"Sound format -%c has been overruled by -%c"),
                      outformch, c);
              warning(errmsg);
            }
            outformch = c;
            O.outformat = AE_FLOAT;   /* float soundfile */
            if (O.filetyp == TYP_AIFF) {
              warning(Str(X_402,
                          "Overriding File Type to AIFF-C for float output"));
              O.filetyp = TYP_AIFC;
            }
            break;
          case 'r':
            FIND(Str(X_1056,"no sample rate"));
            sscanf(s,"%ld",&O.sr_override);
            while (*++s);
            break;
          case 'j':
            FIND("");
            while (*++s);
            break;
          case 'k':
            FIND(Str(X_1029,"no control rate"));
            sscanf(s,"%ld",&O.kr_override);
            while (*++s);
            break;
          case 'v':
            O.odebug = odebug = 1;    /* verbose otran  */
            break;
          case 'm':
            FIND(Str(X_1046,"no message level"));
            sscanf(s,"%d%n",&O.msglevel, &n);
            s += n;
            break;
          case 'd':
            O.displays = 0;           /* no func displays */
            break;
          case 'g':
            O.graphsoff = 1;          /* don't use graphics */
            break;
          case 'G':
            O.postscript = 1;         /* Postscript graphics*/
            break;
          case 'x':
            FIND(Str(X_1068,"no xfilename"));
            xfilename = s;            /* extractfile name */
            while (*++s);
            break;
          case 't':
            FIND(Str(X_1063,"no tempo value"));
            {
              int val;
              sscanf(s,"%d%n",&val, &n);/* use this tempo .. */
              s += n;
              if (val < 0) dieu(Str(X_890,"illegal tempo"));
              else if (val == 0) {
                keep_tmp=1;
                break;
              }
              else O.cmdTempo = val;
              O.Beatmode = 1;       /* on uninterpreted Beats */
            }
            break;
          case 'L':
            FIND(Str(X_1017,"no Linein score device_name"));
            O.Linename = filnamp;     /* Linein device name */
            while ((*filnamp++ = *s++));  s--;
            if (!strcmp(O.Linename,"stdin")) {
              if (stdinassgn)
                dieu(Str(X_115,"-L: stdin previously assigned"));
              stdinassgn = 1;
            }
            O.Linein = 1;
            break;
          case 'M':
            FIND(Str(X_1047,"no midi device_name"));
            O.Midiname = filnamp;     /* Midi device name */
            while ((*filnamp++ = *s++));  s--;
            if (!strcmp(O.Midiname,"stdin")) {
              if (stdinassgn)
                dieu(Str(X_119,"-M: stdin previously assigned"));
              stdinassgn = 1;
            }
            O.Midiin = 1;
            break;
          case 'F':
            FIND(Str(X_1048,"no midifile name"));
            O.FMidiname = filnamp;    /* Midifile name */
            while ((*filnamp++ = *s++));  s--;
            if (!strcmp(O.FMidiname,"stdin")) {
              if (stdinassgn)
                dieu(Str(X_106,"-F: stdin previously assigned"));
              stdinassgn = 1;
            }
            O.FMidiin = 1;          /***************/
            break;
#ifdef LINUX
          case 'Q':
            FIND(Str(X_1018,"no MIDI output device"));
            midi_out = -1;
            if (isdigit(*s)) {
              sscanf(s,"%d%n",&midi_out,&n);
              s += n;
              openMIDIout();
            }
            break;
#endif
#ifdef __BEOS__                     /* jjk 09252000 - MIDI output device */
          case 'Q':
            FIND(Str(X_1550,"no midi output device name"));
            O.Midioutname = filnamp;
            while ((*filnamp++ = *s++));  s--;
            break;
#endif
          case 'R':
            O.rewrt_hdr = 1;
            break;
          case 'H':
            if (isdigit(*s)) {
              sscanf(s, "%d%n", &O.heartbeat, &n);
              s += n;
            }
            else O.heartbeat = 1;
            break;
          case 'N':
            O.ringbell = 1;        /* notify on completion */
            break;
          case 'T':
            O.termifend = 1;       /* terminate on midifile end */
            break;
          case 'D':
            O.gen01defer = 1;  /* defer GEN01 sample loads
                                  until performance time */
            break;
          case 'K':
            peakchunks = 0;     /* Do not write peak information */
            break;
#ifdef LINUX
#ifdef RTAUDIO
          /* Add option to set soundcard output volume for real-
                       time audio output under Linux. -- J. Mohr 95 Oct 17 */
          case 'V':
            FIND(Str(X_1066,"no volume level"));
            sscanf(s,"%d%n",&O.Volume, &n);
            s += n;
            break;
#endif
#endif
          case 'z':
            {
              int full = 0;
              if (*s != '\0') {
                if (isdigit(*s)) full = *s++ - '0';
              }
              create_opcodlst();
              list_opcodes(full);
            }
#ifndef mills_macintosh
            *pfilnamp = filnamp;
            return (1);
#else
            break;
#endif
          case 'Z':
            dither_output = 1;
            break;
          case '@':
            FIND("No indirection file");
            {
              FILE *ind = fopen(s, "r");
              if (ind==0) {
                sprintf(errmsg, "Can not open indirection file %s\n", s);
                dieu(errmsg);
              }
              else {
                readOptions(ind);
                fclose(ind);
              }
              while (*s++); s--;
            }
            break;
          case '-':
            FIND(Str(X_1044,"no log file"));
            dribble = fopen(s, "w");
            while (*s++); s--;
            break;
          default:
            sprintf(errmsg,Str(X_1334,"unknown flag -%c"), c);
            dieu(errmsg);
          }
          if (!POLL_EVENTS()) exit(1);
        }
      }
      else {
        if (orchname == NULL)
          orchname = --s;
        else if (scorename == NULL)
          scorename = --s;
        else dieu(Str(X_1286,"too many arguments"));
      }
      if (!POLL_EVENTS()) exit(1);
    } while (--argc);
    *pfilnamp = filnamp;
    return 1;

outtyp:
    dieu(Str(X_1113,"output soundfile cannot be both AIFF and WAV"));

    *pfilnamp = filnamp;
    return (0);
}
