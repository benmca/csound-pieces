#ifndef CS_H            /*                                      CS.H    */
#define CS_H (1)

#ifdef SSOUND
/*
* Move the C++ guards to enclose the entire file,
* in order to enable C++ to #include this file.
*/
#ifdef __cplusplus
extern "C" {
#endif
#else
#endif

#include <stdlib.h>
#include <stdio.h>
#include "sysdep.h"

#include "version.h"

#define VMSGS 1
#if VMSGS
#define VMSG(x) if (odebug) x
#else
#define VMSG(x)
#endif

#define INSTR     1
#define ENDIN     2
#define LABEL     3
#define SETBEG    4
#define STRSET    4
#define PSET      5
#define SETEND    6
/* #define VSET      6 */
/* #define GVSET     7 */
/* #define VDIM      8 */
/* #define VPROGS    9 */
/* #define DVPROGS   10 */
/* #define PGMINIT   17 */
/* #define DPGMINIT  18 */

#define MAXINSNO 200
extern  int maxinsno;
#define PMAX     1000
#define VARGMAX  1001

#define ORTXT      h.optext->t
#define INCOUNT    ORTXT.inlist->count
#define OUTCOUNT   ORTXT.outlist->count
#define INOCOUNT   ORTXT.inoffs->count
#define OUTOCOUNT  ORTXT.outoffs->count
#define XINCODE    ORTXT.xincod
#define STRARG     ORTXT.strarg

#define MAXLEN     0x1000000L
#define PHMASK     0x0FFFFFFL
#define PFRAC(x)   ((MYFLT)((x) & ftp->lomask) * ftp->lodiv)
#define MAXPOS     0x7FFFFFFFL

#define BYTREVS(n) (n>>8  & 0xFF | n<<8 & 0xFF00)
#define BYTREVL(n) (n>>24 & 0xFF | n>>8 & 0xFF00L | n<<8 & 0xFF0000L | n<<24 & 0xFF000000L)

#define NOCTS      20
#define OCTRES     8192
#define RESMASK    8191L
#define RESHIFT    13
#define CPSOCTL(n) cpsocint[n >> RESHIFT] * cpsocfrc[n & RESMASK]

#define LOBITS     10
#define LOFACT     1024
#define LOMASK     1023

#define SSTRCOD    0xFFFFFL
#define SSTRSIZ    200
#define ALLCHNLS   0x7fff
#define DFLT_SR    FL(44100.0)
#define DFLT_KR    FL(4410.0)
#define DFLT_KSMPS 10
#define DFLT_NCHNLS 1
#define MAXCHNLS   256

#define MAXNAME 128

typedef struct {
        int     odebug, initonly;
        int     sfread, sfwrite, sfheader, filetyp;
        int     inbufsamps, outbufsamps;
        int     informat, outformat;
        int     insampsiz, outsampsiz;
        int     displays, graphsoff, postscript, msglevel;
        int     Beatmode, cmdTempo, oMaxLag;
        int     usingcscore, Linein, Midiin, FMidiin;
        int     OrcEvts;        /* - for triginstr (re Aug 1999) */
        int     RTevents, ksensing;
        int     ringbell, termifend, stdoutfd;
        int     rewrt_hdr, heartbeat, gen01defer;
#ifdef LINUX
        int     Volume;         /* Jonathan Mohr  1995 Oct 17 */
#endif
        long    sr_override, kr_override;
        long    instxtcount, optxtsize;
        long    poolcount, gblfixed, gblacount;
        long    argoffsize, strargsize, filnamsize;
        char    *argoffspace, *strargspace, *filnamspace;
        char    *infilename, *outfilename, *playscore;
        char    *Linename, *Midiname, *FMidiname;
#ifdef __BEOS__
        char *Midioutname; /* jjk 09252000 - MIDI output device, -Q option */
#endif
} OPARMS;

#ifdef SSOUND
#else
  /* #ifndef __cplusplus */
#endif

typedef struct polish {
        char    opcod[12];
        short   incount;
        char    *arg[4];     /* Was [4][12] */
} POLISH;

typedef struct arglst {
        short   count;
        char    *arg[1];
} ARGLST;

typedef struct argoffs {
        short   count;
        short   indx[1];
} ARGOFFS;

/* Storage for parsed orchestra code, for each opcode in an INSTRTXT. */
typedef struct text {
        short   linenum;        /* Line num in orch file (currently buggy!)  */
        short   opnum;          /* Opcode index in opcodlst[] */
        char    *opcod;         /* Pointer to opcode name in global pool */
        char    *strarg;        /* (Unquoted) file name if needed by opcode */
        ARGLST  *inlist;        /* Input args (pointer to item in name list) */
        ARGLST  *outlist;
        ARGOFFS *inoffs;        /* Input args (index into list of values) */
        ARGOFFS *outoffs;
        short   xincod;         /* Rate switch for multi-rate opcode functions */
        char    intype;         /* Type of first input argument (g,k,a,w etc) */
        char    pftype;         /* Type of output argument (k, a etc) */
} TEXT;

/* This struct is filled out by otran() at orch parse time.
   It is used as a template for instrument events. */
typedef struct instr {
        struct op * nxtop;              /* Linked list of instr opcodes */
        TEXT    t;                      /* Text of instrument (same in nxtop) */
        short   pmax, vmax, pextrab;    /* Arg count, size of data for all
                                           opcodes in instr */
        short   mdepends;               /* Opcode type (i/k/a) */
        short   lclkcnt, lcldcnt;       /* Storage reqs for this instr */
        short   lclwcnt, lclacnt;
        short   lclpcnt;
        short   lclfixed, optxtcount;
        long    localen;
        long    opdstot;                /* Total size of opds structs in instr */
        long    *inslist;               /* Only used in parsing (?) */
        MYFLT   *psetdata;              /* Used for pset opcode */
        struct insds * instance;        /* Chain of allocated instances of
                                           this instrument */
        struct instr * nxtinstxt;       /* Next instrument in orch (num order) */
        int     active;                 /* To count activations for control */
        int     maxalloc;
        MYFLT   cpuload;                /* % load this instrumemnt makes */
} INSTRTXT;


/* A chain of TEXT structs. Note that this is identical with the first two
   members of struct INSTRTEXT, and is so typecast at various points in code. */
typedef struct op {
        struct op * nxtop;
        TEXT    t;
} OPTXT;

typedef struct fdch {
        struct fdch * nxtchp;
        int    fd;
} FDCH;

typedef struct auxch {
        struct auxch * nxtchp;
        long   size;
        char   *auxp, *endp;
} AUXCH;

typedef struct monblk {
        short  pch;
        struct monblk *prv;
} MONPCH;

typedef struct {
        int     notnum[4];
} DPEXCL;

typedef struct {
        DPEXCL dpexcl[8];
        int    exclset[75];     /* for keys 25-99 */
} DPARM;

typedef struct dklst {
        struct dklst *nxtlst;
        long   pgmno;
        MYFLT  keylst[1];       /* cnt + keynos */
} DKLST;

#define DKBAS  25

typedef struct mchnblk {
        short  pgmno;
        short  insno;
/*      short  Omni; */
/*      short  Poly; */
/*         short  bas_chnl; */
/*      short  nchnls; */
        short  RegParNo;
        short  mono;
        MONPCH *monobas;
        MONPCH *monocur;
        struct insds *kinsptr[128];
        struct insds *ksusptr[128];
        MYFLT  polyaft[128];
        MYFLT  ctl_val[128];    /* ... with GS vib_rate,, stored in c102-c109 */
/*      float  katouch[128]; */
/*      short  ctl_byt[128]; */
        short  ksuscnt;
        short  sustaining;
        MYFLT  aftouch;
/*      float  chnpress; */
        MYFLT  pchbend;
/*      float  posbend; */
/*      float  pbensens; */
        DKLST  *klists;         /* chain of dpgm keylists */
        DPARM  *dparms;         /* drumset params     */
        int    dpmsb;
        int    dplsb;
/*      float  finetune; */
/*      float  crsetune; */
  /*    float  tuning; */    /* displ in semitones */
} MCHNBLK;

/* This struct holds the info for a concrete instrument event
   instance in performance. */
typedef struct insds {
        struct opds * nxti;             /* Chain of init-time opcodes */
        struct opds * nxtp;             /* Chain of performance-time opcodes */
        struct insds * nxtinstance;     /* Next allocated instance */
        struct insds * prvinstance;     /* Previous allocated instance */
        struct insds * nxtact;          /* Next in list of active instruments */
        struct insds * prvact;          /* Previous in list of active instruments */
        struct insds * nxtoff;          /* Next instrument to terminate */
        FDCH    fdch;           /* Chain of files used by opcodes in this instr */
        AUXCH   auxch;          /* Extra memory used by opcodes in this instr */
        MCHNBLK *m_chnbp;       /* MIDI note info block if event started from MIDI */
        short   m_pitch;        /* MIDI pitch, for simple access */
        short   m_veloc;        /* ...ditto velocity */
        short   xtratim;        /* Extra release time requested with xtratim opcode */
        short   relesing;       /* Flag to indicate we're releasing, test with release opcode */
        short   insno;          /* Instrument number */
        short   actflg;         /* Set if instr instance is active (performing) */
        MYFLT   offbet;         /* Time to turn off event, in score beats */
        MYFLT   offtim;         /* Time to turn off event, in seconds (negative on indef/tie) */
        struct insds * nxtolap; /* ptr to next overlapping voice */
        /* end of overlap */
        MYFLT   p0;             /* Copy of required p-field values for quick access */
        MYFLT   p1;
        MYFLT   p2;
        MYFLT   p3;
} INSDS;

typedef void    (*SUBR)(void *);

/* This struct holds the info for one opcode in a concrete
   instrument instance in performance. */
typedef struct opds {
        struct opds * nxti;     /* Next opcode in init-time chain */
        struct opds * nxtp;     /* Next opcode in perf-time chain */
        SUBR    iopadr;         /* Initialization (i-time) function pointer */
        SUBR    opadr;          /* Perf-time (k- or a-rate) function pointer */
/**
* Deinitialization function pointer;
* if not null, called during cleanup on each opcode instance;
* useful for deallocating memory or other resources managed by the opcode.
*/
        SUBR    dopadr;         /* Deinitialization function pointer */
        OPTXT   *optext;        /* Orch file template part for this opcode */
        INSDS   *insdshead;     /* Owner instrument instance data structure */
} OPDS;

typedef struct lblblk {
        OPDS    h;
        OPDS    *prvi;
        OPDS    *prvp;
} LBLBLK;

typedef struct oentry {
        char    *opname;
        unsigned short  dsblksiz;
        unsigned short  thread;
        char    *outypes;
        char    *intypes;
        SUBR    iopadr;
        SUBR    kopadr;
        SUBR    aopadr;
/**
* Deinitialization function pointer;
* if not null, called during cleanup on each opcode instance;
* useful for deallocating memory or other resources managed by the opcode.
*/
        SUBR    dopadr;          
} OENTRY;

typedef struct {
        MYFLT   *begp, *curp, *endp, feedback[6];
        long    scount;
} OCTDAT;

#define MAXOCTS 8

typedef struct {
        long    npts, nocts, nsamps;
        MYFLT   lofrq, hifrq, looct, srate;
        OCTDAT  octdata[MAXOCTS];
        AUXCH   auxch;
} DOWNDAT;

typedef struct {
        long    ktimstamp, ktimprd;
        long    npts, nfreqs, dbout;
        DOWNDAT *downsrcp;
        AUXCH   auxch;
} SPECDAT;

#define AIFF_MAXCHAN 8
typedef struct {
        MYFLT   natcps;
        MYFLT   gainfac;
        short   loopmode1;
        short   loopmode2;
        long    begin1, end1;
        long    begin2, end2;
        MYFLT   maxamps[AIFF_MAXCHAN+1];
} AIFFDAT;

typedef struct {
        MYFLT gen01;
        MYFLT ifilno;
        MYFLT iskptim;
        MYFLT iformat;
        MYFLT channel;
        MYFLT sample_rate;
        char  strarg[SSTRSIZ];
} GEN01ARGS;

typedef struct {
        long    flen;
        long    lenmask;
        long    lobits;
        long    lomask;
        MYFLT   lodiv;
        MYFLT   cvtbas, cpscvt;
        short   loopmode1;
        short   loopmode2;
        long    begin1, end1;   /* all these in ..  */
        long    begin2, end2;
        long    soundend, flenfrms; /* .. sample frames */
        long    nchnls;
        long    fno;
        GEN01ARGS gen01args;
        MYFLT   ftable[1];
} FUNC;

typedef struct MEMFIL {
        char    filename[256];  /* Made larger RWD */
        char    *beginp;
        char    *endp;
        long    length;
 struct MEMFIL  *next;
} MEMFIL;

/* This struct holds the data for one score event. */
typedef struct event {
        char    *strarg;        /* Original argument list string of event */
        char    opcod;          /* Event type */
        short   pcnt;           /* Number of p-fields */
        MYFLT   p2orig;         /* Event start time */
        MYFLT   p3orig;         /* Length */
        MYFLT   offtim;         /* k-time to turn off this event */
        MYFLT   p[PMAX+1];      /* All p-fields for this event */
} EVTBLK;

typedef struct {
        OPDS    h;
        MYFLT   *ktempo, *istartempo;
        MYFLT   prvtempo;
} TEMPO;

FUNC   *ftfind(MYFLT*);
MEMFIL *ldmemfile(char *);

#include "text.h"

#if defined CWIN
#elif defined(mac_classic) || defined(SYMANTEC)
# define POLL_EVENTS() STasks()
# define __cdecl
#else
# define POLL_EVENTS() 1
# if !defined(__BEOS__) || defined(__MWERKS__)
#  define __cdecl
# endif
#endif

#include "prototyp.h"
#ifdef CWIN
#include <stdlib.h>
#define printf cwin_printf
#define err_printf cwin_printf
#undef putchar
#define putchar cwin_putchar
#define exit(n) cwin_exit(n)
extern void cwin_printf(char *, ...);
extern void cwin_fprintf(FILE *, char *, ...);
extern int  cwin_ensure_screen(void);
extern int cwin_poll_window_manager(void);
extern void cwin_putchar(int);
extern void cwin_exit(int);
#define atexit(x) cwin_atexit(x)
#define POLL_EVENTS() cwin_poll_window_manager()/*cwin_ensure_screen()*/
typedef void ExitFunction(void);
extern int cwin_atexit(ExitFunction*);
#else
#define printf dribble_printf
extern void dribble_printf(char *, ...);
#ifdef mills_macintosh
#define err_printf dribble_printf
#else
extern void err_printf(char *, ...);
#endif
#endif /* POLL_EVENTS */
extern FILE* dribble;

#ifdef SSOUND
/*
* Move the C++ guards to enclose the entire file,
* in order to enable C++ to #include this file.
*/
#else
  /* #endif */ /* CWIN */
#endif

#ifdef WIN32
#define tmpnam mytmpnam
char *mytmpnam(char *);
#endif

#ifndef PI
#define PI      (3.14159265358979323846)
#endif
#define TWOPI   (6.28318530717958647692)
#define PI_F    (FL(3.14159265358979323846))
#define TWOPI_F (FL(6.28318530717958647692))

#ifdef SSOUND
/*
* Move the C++ guards to enclose the entire file,
* in order to enable C++ to #include this file.
*/
#ifdef __cplusplus
};
#endif
#else
#endif

#endif /* CS_H */
