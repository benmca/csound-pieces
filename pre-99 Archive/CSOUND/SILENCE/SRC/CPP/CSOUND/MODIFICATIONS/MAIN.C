#include "cs.h"                 /*                               MAIN.C */
#include "soundio.h"
#include <ctype.h>              /* For isdigit */
#include <string.h>

#ifdef SYMANTEC
#define main mw_main
#endif

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
static char *foo;
static char listing_file[PATH_LEN];
static int  vbuf;
static int csNGraphs;
static MYFLT temp;
extern int RescaleFloatFile;
#endif

/*static*/  char        *scorename = NULL;
        char    *xfilename = NULL;
static  char    *sortedscore = NULL;
static  char    *xtractedscore = "score.xtr";
static  char    scnm[255];
static  char    nme[255];
static  char    *playscore = NULL;     /* unless we extract */
static  FILE    *scorin, *scorout, *xfile;
        FILE    *dribble;
extern  void    dieu(char *);
extern  OPARMS  O;
char    *orchname = NULL;  /* used by rdorch */
int     keep_tmp = 0;
int     dither_output = 0;      /* A boolean really */
int     peakchunks = 1;         /* Ditto */
extern int argdecode(int, char**, char**, char*);
extern void init_pvsys(void);

#include <signal.h>

#if !defined(LINUX) && !defined(SGI) && !defined(__BEOS__) && !defined(MACOSX)
static char *signal_to_string(int sig)
{
    switch(sig) {
#ifdef SIGHUP
    case SIGHUP:        return "Hangup";
#endif
#ifdef SIGINT
    case SIGINT:        return "Interrupt";
#endif
#ifdef SIGQUIT
    case SIGQUIT:       return "Quit";
#endif
#ifdef SIGILL
    case SIGILL:        return "Illegal instruction";
#endif
#ifdef SIGTRAP
    case SIGTRAP:       return "Trace trap";
#endif
#ifdef SIGABRT
    case SIGABRT:       return "Abort";
#endif
#ifdef SIGBUS
    case SIGBUS:        return "BUS error";
#endif
#ifdef SIGFPE
    case SIGFPE:        return "Floating-point exception";
#endif
#ifdef SIGUSR1
    case SIGUSR1:       return "User-defined signal 1";
#endif
#ifdef SIGSEGV
    case SIGSEGV:       return "Segmentation violation";
#endif
#ifdef SIGUSR2
    case SIGUSR2:       return "User-defined signal 2";
#endif
#ifdef SIGPIPE
    case SIGPIPE:       return "Broken pipe";
#endif
#ifdef SIGALRM
    case SIGALRM:       return "Alarm clock";
#endif
#ifdef SIGTERM
    case SIGTERM:       return "Termination";
#endif
#ifdef SIGSTKFLT
    case SIGSTKFLT:     return "???";
#endif
#ifdef SIGCHLD
    case SIGCHLD:       return "Child status has changed";
#endif
#ifdef SIGCONT
    case SIGCONT:       return "Continue";
#endif
#ifdef SIGSTOP
    case SIGSTOP:       return "Stop, unblockable";
#endif
#ifdef SIGTSTP
    case SIGTSTP:       return "Keyboard stop";
#endif
#ifdef SIGTTIN
    case SIGTTIN:       return "Background read from tty";
#endif
#ifdef SIGTTOU
    case SIGTTOU:       return "Background write to tty";
#endif
#ifdef SIGURG
    case SIGURG:        return "Urgent condition on socket ";
#endif
#ifdef SIGXCPU
    case SIGXCPU:       return "CPU limit exceeded";
#endif
#ifdef SIGXFSZ
    case SIGXFSZ:       return "File size limit exceeded ";
#endif
#ifdef SIGVTALRM
    case SIGVTALRM:     return "Virtual alarm clock ";
#endif
#ifdef SIGPROF
    case SIGPROF:       return "Profiling alarm clock";
#endif
#ifdef SIGWINCH
    case SIGWINCH:      return "Window size change ";
#endif
#ifdef SIGIO
    case SIGIO: return "I/O now possible";
#endif
#ifdef SIGPWR
    case SIGPWR:        return "Power failure restart";
#endif
    default:
      return "???";
    }
}

void psignal(int sig, char *str)
{
    fprintf(stderr, "%s: %s\n", str, signal_to_string(sig));
}
#endif

#if defined(__BEOS__)
void psignal(int sig, char *str)
{
    fprintf(stderr, "%s: %s\n", str, strsignal(sig));
}
#endif

static void signal_handler(int sig)
{
    psignal(sig, "Csound tidy up");
    exit(1);
}

static void install_signal_handler(void)
{
#if defined(LINUX) || defined(SGI) || defined(sol)
   int sigs[] = { SIGHUP, SIGINT, SIGQUIT, SIGILL, SIGTRAP, SIGABRT, SIGIOT,
                  SIGBUS, SIGFPE, SIGSEGV, SIGPIPE, SIGTERM, SIGXCPU,
                  SIGXFSZ, -1};
#else
# if defined(CSWIN)
   int sigs[] = { SIGHUP, SIGINT, SIGQUIT, -1};
# else
#  if defined(__EMX__)
    int sigs[] = { SIGHUP, SIGINT, SIGQUIT, SIGILL, SIGTRAP, SIGABRT, SIGBUS,
                   SIGFPE, SIGUSR1, SIGSEGV, SIGUSR2, SIGPIPE, SIGALRM, SIGTERM,
                   SIGCHLD, -1 };
#  else
    int sigs[] = { -1};
#  endif
# endif
#endif
    int *x;

    for (x = sigs; *x > 0; x++)
      signal(*x, signal_handler);
}

static void remove_plname(void)
{
    remove(nme);
}

static void remove_scnam(void)
{
    remove(scnm);
}

void create_opcodlst(void)
{
    extern OENTRY *opcodlst, *oplstend, opcodlst_1[], opcodlst_2[];
    extern long oplength_1, oplength_2;
    long length = 0;

    /* Basic Entry1 stuff */
    if (opcodlst!=NULL) return;
    opcodlst = (OENTRY*) mmalloc(length = oplength_1);
    memcpy(opcodlst, opcodlst_1, oplength_1);
    oplstend = opcodlst +  length/sizeof(OENTRY);
    /* Add entry2 */
    opcodlst = (OENTRY*) mrealloc(opcodlst, length + oplength_2);
    memcpy(opcodlst+length/sizeof(OENTRY), opcodlst_2, oplength_2);
    length += oplength_2;
    oplstend = opcodlst +  length/sizeof(OENTRY);
                                /* Add libraries here???? */
#ifdef SSOUND
	/**
	* Load plugin opcodes.
	*/
	csoundLoadAllOpcodes();
#else
#endif
}

#ifdef CWIN
void dialog_arguments(void);
#include <stdarg.h>
extern int cwin_atexit(void (*)(void));

int cwin_main(int argc, char **argv)
#else
#ifdef SSOUND
/**
* On Windows, "main" in libraries conflicts with "main" in executable programs.
*/
int csoundMain(int argc, char **argv)
#else
int main(int argc, char **argv)
#endif
#endif
{
        char  *s;
        char  *filnamp, *envoutyp = NULL;
        int   n;
extern  int   getsizformat(int), musmon(void);
extern  char  *getstrformat(int);
        init_getstring(argc, argv);
        init_pvsys();
        if (sizeof(MYFLT)==sizeof(float))
          err_printf(Str(X_237,"Csound Version %d.%.02d (%s)\n"),
                      VERSION, SUBVER, __DATE__);
        else
          err_printf(Str(X_1545,"Csound(d) Version %d.%.02d (%s)\n"),
                    VERSION, SUBVER, __DATE__);
#if !defined(mills_macintosh) && !defined(SYMANTEC)
        {
            char *getenv(const char*);
            if ((envoutyp = getenv("SFOUTYP")) != NULL) {
                if (strcmp(envoutyp,"AIFF") == 0)
                    O.filetyp = TYP_AIFF;
                else if (strcmp(envoutyp,"WAV") == 0)
                    O.filetyp = TYP_WAV;
                else if (strcmp(envoutyp,"IRCAM") == 0)
                    O.filetyp = TYP_IRCAM;
                else {
                    sprintf(errmsg,
                            Str(X_61,"%s not a recognised SFOUTYP env setting"),
                            envoutyp);
                    dieu(errmsg);
                }
            }
        }
#endif
        if (!POLL_EVENTS()) exit(1);
#ifdef CWIN
        cwin_atexit(all_free);
#endif
        install_signal_handler();
        O.filnamspace = filnamp = mmalloc((long)1024);
        dribble = NULL;
        peakchunks = 1;
        {
          FILE *csrc = fopen(".csoundrc", "r");
          extern int readOptions(FILE *);
          if (csrc!=NULL) {
            readOptions(csrc);
            fclose(csrc);
          }
        }
        if (--argc == 0) {
#ifdef CWIN
            dialog_arguments();
#else
            dieu(Str(X_939,"insufficient arguments"));
#ifdef SSOUND
			return -1;
#else
#endif
#endif
        }
#ifdef CWIN
        else
#endif
          if (argdecode(argc, argv, &filnamp, envoutyp)==0)
#ifndef mills_macintosh
            exit(1);
#else
            return(0);
#endif

        if (!POLL_EVENTS()) exit(1);
        if (orchname == NULL)
            dieu(Str(X_1051,"no orchestra name"));
        else if ((strcmp(orchname+strlen(orchname)-4, ".csd")==0 ||
                  strcmp(orchname+strlen(orchname)-4, ".CSD")==0)
                 && (scorename==NULL || strlen(scorename)==0)) {
          int read_unified_file(char **, char **);
          err_printf("UnifiedCSD:  %s\n", orchname);
          if (!read_unified_file(&orchname, &scorename)) {
            err_printf(Str(X_240,"Decode failed....stopping\n"));
            exit(1);
          }
        }
        if (scorename==NULL || strlen(scorename)==0) { /* No scorename yet */
          char *p;
          FILE *scof;
          extern char sconame[];
          void deleteScore(void);
          tmpnam(sconame);              /* Generate score name */
          if ((p=strchr(sconame, '.')) != NULL) *p='\0'; /* with extention */
          strcat(sconame, ".sco");
          scof = fopen(sconame, "w");
          fprintf(scof, "f0 86400\n");
          fclose(scof);
          scorename = sconame;
          atexit(deleteScore);
        }
        if (O.Linein || O.Midiin || O.FMidiin)
            O.RTevents = 1;
        if (O.RTevents || O.sfread)
            O.ksensing = 1;
        if (O.rewrt_hdr && !O.sfheader)
            dieu(Str(X_628,"cannot rewrite header if no header requested"));
        if (O.sr_override || O.kr_override) {
            long ksmpsover;
            if (!O.sr_override || !O.kr_override)
                dieu(Str(X_1231,"srate and krate overrides must occur jointly"));
            ksmpsover = O.sr_override / O.kr_override;
            if (ksmpsover * O.kr_override != O.sr_override)
                dieu(Str(X_666,"command-line srate / krate not integral"));
        }
        if (!O.outformat)                       /* if no audioformat yet  */
            O.outformat = AE_SHORT;             /*  default to short_ints */
        O.outsampsiz = getsizformat(O.outformat);
        O.informat = O.outformat; /* informat defaults; resettable by readinheader */
        O.insampsiz = O.outsampsiz;
        if (O.filetyp == TYP_AIFF || O.filetyp == TYP_AIFC || O.filetyp == TYP_WAV) {
          if (!O.sfheader)
            dieu(Str(X_629,"cannot write AIFF/WAV soundfile with no header"));
            /* WAVE format supports only unsigned bytes for 1- to 8-bit
               samples and signed short integers for 9 to 16-bit samples.
                                   -- Jonathan Mohr  1995 Oct 17  */
            /* Also seems that type 3 is floats */
          if ((O.filetyp != TYP_AIFC) &&
              (O.outformat == AE_ALAW || O.outformat == AE_ULAW
#ifdef mills_macintosh
                || (O.outformat == AE_FLOAT && !RescaleFloatFile)
#else
               || O.outformat == AE_FLOAT
#endif
               ))
            printf(Str(X_525,"WARNING: %s encoding information cannot\n"
                       "be contained in the header...\n"),
                   getstrformat(O.outformat));
/*             { */
/*               sprintf(errmsg,"AIFF/WAV does not support %s encoding", */
/*                       getstrformat(O.outformat)); */
/*               dieu(errmsg); */
/*             } */
        }
        err_printf(Str(X_1100,"orchname:  %s\n"), orchname);
        if (scorename != NULL)
            err_printf(Str(X_1179,"scorename: %s\n"), scorename);
        if (xfilename != NULL)
            err_printf(Str(X_1386,"xfilename: %s\n"), xfilename);
#if defined(SYS5) || defined(WIN32) || defined(__EMX__)
        {
          static  char  buf[80];
          VMSG(setvbuf(stdout,buf,_IOLBF,80);)
        }
#else
#if !defined(SYMANTEC) && !defined(mills_macintosh) && !defined(LATTICE)
        VMSG(setlinebuf(stdout);)
#endif
#endif
        if (scorename == NULL) {
          if (O.RTevents) {
            err_printf(Str(X_1153,
                           "realtime performance using dummy numeric scorefile\n"));
            if (!POLL_EVENTS()) exit(1);
            goto perf;
          }
          else {
            if (keep_tmp) {
              scorename = "score.srt";
            }
            else {
              scorename = tmpnam(scnm);
              atexit(remove_scnam);
            }
          }
        }
        if (!POLL_EVENTS()) exit(1);
#ifdef mills_macintosh
        {
          char *c;
          strcpy(saved_scorename,scorename);
          strcpy((char *)mytitle,scorename);
          c = (char *)&mytitle[0] + strlen((char *)mytitle);
          while (*c != ':' && c != (char *)mytitle) c -= 1;
          if (c != (char *) mytitle) c += 1;
          strcpy((char *)mytitle,c);
          strcat((char *)mytitle," listing");
          SIOUXSetTitle((unsigned char *)CtoPstr((char *)mytitle));
        }
#endif
        if ((n = strlen(scorename)) > 4            /* if score ?.srt or ?.xtr */
          && (!strcmp(scorename+n-4,".srt")
              || !strcmp(scorename+n-4,".xtr"))) {
            err_printf(Str(X_1362,"using previous %s\n"),scorename);
            playscore = sortedscore = scorename;            /*   use that one */
        }
        else {
          if (keep_tmp) {
            playscore = sortedscore = "score.srt";
          }
          else {
            playscore = sortedscore = tmpnam(nme);
            atexit(remove_plname);
          }
          if (!(scorin = fopen(scorename, "r")))          /* else sort it   */
            dies(Str(X_646,"cannot open scorefile %s"), scorename);
          if (!(scorout = fopen(sortedscore, "w")))
            dies(Str(X_639,"cannot open %s for writing"), sortedscore);
          err_printf(Str(X_1197,"sorting score ...\n"));
          scsort(scorin, scorout);
          fclose(scorin);
          fclose(scorout);
        }
        if (!POLL_EVENTS()) exit(1);
        if (xfilename != NULL) {                        /* optionally extract */
            if (!strcmp(scorename,"score.xtr"))
                dies(Str(X_634,"cannot extract %s, name conflict"),scorename);
            if (!(xfile = fopen(xfilename, "r")))
                dies(Str(X_644,"cannot open extract file %s"), xfilename);
            if (!(scorin = fopen(sortedscore, "r")))
                dies(Str(X_649,"cannot reopen %s"), sortedscore);
            if (!(scorout = fopen(xtractedscore, "w")))
                dies(Str(X_639,"cannot open %s for writing"), xtractedscore);
            err_printf(Str(X_10,"  ... extracting ...\n"));
            scxtract(scorin, scorout, xfile);
            fclose(scorin);
            fclose(scorout);
            playscore = xtractedscore;
        }
/*          else { */
/*            playscore = scorename; */
/*            printf("playscore = %s\n", playscore); */
/*          } */
        err_printf(Str(X_564,"\t... done\n"));
        if (!POLL_EVENTS()) exit(1);

        s = playscore;
        O.playscore = filnamp;
        while ((*filnamp++ = *s++));    /* copy sorted score name */

perf:   O.filnamsize = filnamp - O.filnamspace;
        create_opcodlst();
        if (POLL_EVENTS()) {
          otran();              /* read orcfile, setup desblks & spaces     */
          if (POLL_EVENTS())
            return musmon();   /* load current orch and play current score */
        }
        return (0);
}


#ifdef CWIN
int args_OK = 0;
extern void cwin_args(char **, char **, char **);

void dialog_arguments(void)
{
    cwin_args(&orchname, &scorename, &xfilename);
}
#endif

#ifndef CWIN
#include <stdarg.h>

#ifdef mills_macintosh
void dribble_printf(char *fmt, ...)
{
    va_list a;

    /* '\r' returns to end of line, doesnt advance to next line */
    int i;
    int lastChar = strlen(fmt)-1;
    if (fmt[0] == '\r')
       fmt[0] = '\n';
    if (fmt[lastChar] == '\r')
       fmt[lastChar] = '\n';

    if (displayText)
      {
        va_start(a, fmt);
        vprintf(fmt, a);
        va_end(a);
      }
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}
#else
void dribble_printf(char *fmt, ...)
{
#ifdef SSOUND
	/**
	* implement with csoundMessage.
	*/
	char buffer[0x2000];
    va_list a;
	if(!fmt)
	{
		csoundMessage("No format in dribble_printf.\n");
		return;
	}
    va_start(a, fmt);
    vsprintf(buffer, fmt, a);
    va_end(a);
	csoundMessage(buffer);
#else
    va_list a;
    va_start(a, fmt);
    vprintf(fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
	}
#endif
}

void err_printf(char *fmt, ...)
{
#ifdef SSOUND
	/**
	* implement with csoundMessage.
	*/
	char buffer[0x2000];
    va_list a;
	if(!fmt)
	{
		csoundMessage("No format in err_printf.\n");
		return;
	}
    va_start(a, fmt);
    vsprintf(buffer, fmt, a);
    va_end(a);
	csoundMessage(buffer);
    if (dribble != NULL) {
      va_start(a, fmt); /* gab */
      vfprintf(dribble, fmt, a);
      va_end(a);
	}
#else
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt); /* gab */
      vfprintf(dribble, fmt, a);
      va_end(a);
	}
#endif
}
#endif
#endif

#ifdef RESET
void mainRESET(void)
{
    void cscoreRESET(void);
    void expRESET(void);
    void ftRESET(void);
    void insertRESET(void);
    void musRESET(void);
    void oloadRESET(void);
    void tranRESET(void);
    void orchRESET(void);
    void soundinRESET(void);
    void adsynRESET(void);
    void lpcRESET(void);
    void zakRESET(void);

    cscoreRESET();
    expRESET();
    ftRESET();
    insertRESET();
    musRESET();
    oloadRESET();
    tranRESET();
    orchRESET();
    soundinRESET();
    adsynRESET();
    lpcRESET();
    memRESET();
    zakRESET();
}
#endif

#ifdef SSOUND
/**
* For re-entrancy.
*/
void csoundMainCleanup(void)
{
	deleteScore();
	remove_plname();
	remove_scnam();
}
#else
#endif