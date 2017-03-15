/* FIXME for NeXT -- sbrandon */
#include "cs.h"                                       /*    MIDIRECV.C    */
#include "midiops.h"
#include "oload.h"

#ifdef SGI
/************************************/
/* obsolete SGI code                */
/*                                  */
/*#    include <sys/termio.h>       */
/*#    include <sys/stropts.h>      */
/*#    include <sys/z8530.h>        */
/*     static struct termio tty;    */
/*     static struct strioctl str;  */
/************************************/

/*******************************************/
/* Irix media library MIDI implementation  */
/* (Victor Lazzarini, feb 2001)            */
/*******************************************/

#include <dmedia/midi.h>
#include <poll.h>
#include <stropts.h>

MDport sgiport;
MDevent* mevent;
struct pollfd midipoll;

/* end media library MIDI implementation */

#elif defined HPUX
#    include <sgtty.h>
#    define INBAUD    EXTB
     static struct sgttyb tty;
#elif defined LINUX                              /* J. Mohr  1995 Oct 17 */
#    include <sys/time.h>

/* Include either termios.h or bsd/sgtty.h depending on autoconf tests */
/* We prefer termios as it appears to be the newer interface */
#  ifdef HAVE_TERMIOS_H
#    include <termios.h>
     struct termios tty;
#  else /* HAVE_TERMIOS_H */
#  if HAVE_BSD_SGTTY_H
#    include <bsd/sgtty.h>
     static struct sgttyb tty;
#  endif /* HAVE_BSD_SGTTY_H */
#  endif /* HAVE_TERMIOS_H */
#    include <errno.h>
/*#    include <bsd/sgtty.h> */
#    define INBAUD    EXTB
#elif defined sol
#    include <sgtty.h>
#    include <sys/ioctl.h>
     static struct sgttyb tty;
#    define INBAUD    EXTB  /* ioctl baud rate: EXTA = 19200, EXTB = 38400 */
#elif __BEOS__
#    include <OS.h>
#    include "CsSvInterface.h"
     static const int32 kPortCapacity = 100;
     static port_id gMidiInPort = B_ERROR;
#elif defined(mills_macintosh)
     extern int MacSensMidi(void);
#elif !defined(DOSGCC) && !defined(__WATCOMC__)&& !defined(LATTICE) && !defined(WIN32) && !defined(SYMANTEC) && !defined(__EMX__)
#    if defined(__MACH__)
#      define USE_OLD_TTY 1
#    endif
#    include <sys/ioctl.h>
#    define INBAUD    EXTB  /* ioctl baud rate: EXTA = 19200, EXTB = 38400 */
     static struct sgttyb tty;
#elif defined MACOSX
#       include <sgtty.h>
        static struct sgttyb tty;
#endif
#ifdef AMIGA
# include <sgtty.h>
#endif

#if defined(sun) || defined(sol)
#include <sys/fcntl.h>
# if defined(sol)
#   include <sys/ttold.h>
# endif
#undef NL0
#undef NL1
#undef CR0
#undef CR1
#undef CR2
#undef CR3
#undef TAB0
#undef TAB1
#undef TAB2
#undef XTABS
#undef BS0
#undef BS1
#undef FF0
#undef FF1
#undef ECHO
#undef NOFLSH
#undef TOSTOP
#undef FLUSHO
#undef PENDIN
#include <sys/termio.h>
#include <sys/stropts.h>
#endif /* ifdef SUN */

#ifdef NeXTi
#include <mach.h>
#include <servers/netname.h>
#include <midi/midi_server.h>
#include <midi/midi_reply_handler.h>
#include <midi/midi_timer.h>
#include <midi/midi_timer_reply_handler.h>
#include <midi/midi_error.h>
#include <midi/midi_timer_error.h>
port_t dev_port,owner_port,timer_port,recv_port,
    recv_reply_port,neg_port;
port_set_name_t port_set;
msg_header_t *in_msg ;
int midiCnt ;

kern_return_t getMidiData
( void *                arg,
  midi_raw_t    midi_raw_data,
  u_int         midi_raw_dataCnt
)
;

midi_reply_t midi_reply = { getMidiData,0,0,0,0,0 };
#define midiError(msg,no) \
     { if (no != KERN_SUCCESS) { midi_error(msg,no) ; exit(1) ;}}
#define midiTimerError(msg,no) \
     { if (no != KERN_SUCCESS) { midi_timer_error(msg,no) ; exit(1) ;}}
#define machError(msg,no) \
     { if (no != KERN_SUCCESS) { mach_error(msg,no) ; exit(1) ;}}

#endif /* NeXTi */

#define MBUFSIZ   1024
#define ON        1
#define OFF       0
#define MAXLONG   0x7FFFFFFFL

static u_char *mbuf, *bufp, *bufend, *endatp;
static u_char *sexbuf, *sexp, *sexend;
static u_char *fsexbuf, *fsexp, *fsexend;
static int  rtfd = 0;        /* init these to stdin */
static FILE *mfp = NULL;   /* was stdin */
MEVENT  *Midevtblk, *FMidevtblk;
MCHNBLK *m_chnbp[MAXCHAN];   /* ptrs to chan ctrl blks */
static MYFLT MastVol = FL(1.0);     /* maps ctlr 7 to ctlr 9 */
static long  MTrkrem;
static double FltMidiNxtk, kprdspertick, ekrdQmil;
long   FMidiNxtk;
int    Mforcdecs = 0, Mxtroffs = 0, MTrkend = 0;
void  m_chn_init(MEVENT *, short);
static void  (*nxtdeltim)(void), Fnxtdeltim(void), Rnxtdeltim(void);
extern void  schedofftim(INSDS *), deact(INSDS *), beep(void);
static MYFLT mapctl(int, MYFLT);
void midNotesOff(void);

/* static int   LCtl = ON; */
/* static int   NVoices = 1; */
static int   defaultinsno = 0;
extern INSTRTXT **instrtxtp;
/* extern INSDS *insalloc[]; */
extern VPGLST *vpglist;
/* extern short *insbusy; */
extern long  kcounter;
extern OPARMS O;
extern INX inxbas;
extern void xturnon(int, long);
extern void xturnoff(INSDS*);
extern void insxtroff(short);

                        /*** double condition for the moment (see below) ***/

void MidiOpen(void)   /* open a Midi event stream for reading, alloc bufs */
{                     /*     callable once from main.c                    */
    int i;
    Midevtblk = (MEVENT *) mcalloc((long)sizeof(MEVENT));
    mbuf = (u_char *) mcalloc((long)MBUFSIZ);
    bufend = mbuf + MBUFSIZ;
    bufp = endatp = mbuf;
    sexbuf = (u_char *) mcalloc((long)MBUFSIZ);
    sexend = sexbuf + MBUFSIZ;
    sexp = NULL;
    for (i=0; i<MAXCHAN; i++) m_chnbp[i] = NULL; /* Clear array */
    m_chn_init(Midevtblk,(short)0);
    if (strcmp(O.Midiname,"stdin") == 0) {
#if defined(mills_macintosh) || defined(SYMANTEC) || defined(WIN32) || defined(__BEOS__)   /*** double condition for the moment (see above) ***/
      die(Str(X_437,"RT Midi_event Console not implemented"));
# elif defined (DOSGCC) || defined (__WATCOMC__) || defined (LATTICE)
      warning(Str(X_118,"-M stdin: system has no fcntl reading stdin"));
# else
      if (fcntl(rtfd, F_SETFL, fcntl(rtfd, F_GETFL, 0) | O_NDELAY) < 0) {
        perror(Str(X_757,"fcntl"));
        die(Str(X_117,"-M stdin fcntl failed"));
      }
#endif
    }
    else {                   /* open MIDI device, & set nodelay on reads  */
      if ((rtfd = open(O.Midiname, O_RDONLY | O_NDELAY, 0)) < 0)
        dies(Str(X_210,"cannot open %s"), O.Midiname);
#ifndef SYS5
# if defined (DOSGCC) || defined (__WATCOMC__) || defined (LATTICE) || defined(WIN32) || defined(__EMX__)
      warning(Str(X_827,"have not figured out DOS or BCC fcntl yet !!!"));
# else
      if (fcntl(rtfd, F_SETFL, fcntl(rtfd, F_GETFL, 0) | O_NDELAY) < 0)
        dies(Str(X_756,"fcntl failed on %s"), O.Midiname);
# endif
#endif
#ifdef SGI
      /*******************obsolete SGI code**************************************/
      /*       new implementation using the Irix media library

      {
        int arg;
        tty.c_iflag = IGNBRK;
        tty.c_oflag = 0;
        tty.c_cflag = B9600 | CS8 | CREAD | CLOCAL | HUPCL;
        tty.c_lflag = 0;
        tty.c_line = 1;
        tty.c_cc[VINTR] = 0;
        tty.c_cc[VQUIT] = 0;
        tty.c_cc[VERASE] = 0;
        tty.c_cc[VKILL] = 0;
        tty.c_cc[VMIN] = 1;
        tty.c_cc[VTIME] = 0;
        ioctl(rtfd, TCSETAF, &tty);

        str.ic_cmd = SIOC_RS422;
        str.ic_timout = 0;
        str.ic_len = 4;
        arg = RS422_ON;
        str.ic_dp = (char *)&arg;
        if (ioctl(rtfd, I_STR, &str) < 0) {
          perror(Str(X_202,"cannot ioctl RS422"));
          exit(1);
        }
        str.ic_cmd = SIOC_EXTCLK;
        str.ic_timout = 0;
        str.ic_len = 4;
        arg = EXTCLK_32X;
        str.ic_dp = (char *)&arg;
        if (ioctl(rtfd, I_STR, &str) < 0) {
          perror(Str(X_199,"cannot ioctl EXTCLK"));
          exit(1);
        }
     }
****************************************************************************/
#elif defined sun
      while (ioctl(rtfd, I_POP, 0) == 0)  /* pop the 2 STREAMS modules */
        ;                               /*  betwn user & uart driver */
      gtty(rtfd, &tty);
      tty.sg_ispeed = (char)15;
      tty.sg_ospeed = (char)15;
      tty.sg_flags &= ~(O_TANDEM | O_ECHO | O_CRMOD | O_ANYP);
      tty.sg_flags |= RAW;
      stty(rtfd, &tty);
      ioctl(rtfd, TCFLSH, 0);
      fcntl(rtfd, F_SETFL, O_NDELAY);
#elif defined NeXTi
      {
        kern_return_t r;
        char *midiPort = "midi1" ; /* "midi0" is A */
        close(rtfd) ; /* easier to close it than hassle with idndefs */
        rtfd = 0 ;
            /* look up midi port on localhost */
        r = netname_look_up(name_server_port, "", midiPort, &dev_port);
        mach_error(Str(X_1282,"timer_track: netname_look_up error"), r);
            /* Become owner of the device. */
        r = port_allocate(task_self(), &owner_port);
        machError(Str(X_592,"allocate owner port"), r);
        neg_port = PORT_NULL;
        r = midi_set_owner(dev_port, owner_port, &neg_port);
        midiError(Str(X_617,"become owner"), r);
            /* Get the timer port for the device. */
        r = midi_get_out_timer_port(dev_port, &timer_port);
        midiError(Str(X_1114,"output timer port"), r);
            /*  Get the receive port for the device. */
        r = midi_get_recv(dev_port, owner_port, &recv_port);
        midiError(Str(X_1157,"recv port"), r);
            /* Find out what time it is (and other vital information). */
        r = port_allocate(task_self(), &recv_reply_port);
        machError(Str(X_594,"allocate timer reply port"), r);
            /* Tell it to ignore system messages we are not interested in. */
        r = midi_set_sys_ignores(recv_port,
                                 (MIDI_IGNORE_ACTIVE_SENS
                                  | MIDI_IGNORE_TIMING_CLCK
                                  | MIDI_IGNORE_START
                                  | MIDI_IGNORE_CONTINUE
                                  | MIDI_IGNORE_STOP
                                  | MIDI_IGNORE_SONG_POS_P));
        machError("midi_set_sys_ignores", r);
            /* Set the protocol to indicate our preferences. */
        r = midi_set_proto(recv_port,
                           MIDI_PROTO_RAW,     /* raw, cooked, or packed */
                           FALSE,              /* absolute time codes wanted */
                           MIDI_PROTO_SYNC_SYS,/* use system clock */
                           10,                 /* 10 clocks before data sent */
                           2,                  /* 2 clock timeout between input chars */
                           8192);              /* maximum output queue size  */
        machError("midi_set_proto", r);
            /* Get it to send us received data from now */
        r = midi_get_data(recv_port, recv_reply_port);
        midiTimerError("midi_get_data", r);
            /* Allocate port set.  */
        r = port_set_allocate(task_self(), &port_set);
        machError(Str(X_593,"allocate port set"), r);
            /* Add data receive port to port set. */
        r = port_set_add(task_self(), port_set, recv_reply_port);
        machError(Str(X_584,"add recv_reply_port to set"), r);
            /* Start the timer up.  */
        r = timer_start(timer_port, owner_port);
        midiError(Str(X_1281,"timer start"), r);
            /* allocate the message structure */
        in_msg = (msg_header_t *)malloc(MSG_SIZE_MAX);
      }
#elif defined LINUX
# ifdef HAVE_TERMIOS_H
      if (isatty(rtfd)) {
        if (tcgetattr(rtfd, &tty) < 0) {
          perror(Str(X_1273,"tcgetattr"));
          die(Str(X_331,"MIDI receive: cannot get termios info."));
        }
        cfmakeraw(&tty);
        if (cfsetispeed(&tty, INBAUD) < 0) {
          perror(Str(X_653,"cfsetispeed"));
          die(Str(X_333,"MIDI receive: cannot set input baud rate."));
        }
        if (tcsetattr(rtfd, TCSANOW, &tty) < 0) {
          perror(Str(X_1274,"tcsetattr"));
          die(Str(X_334,"MIDI receive: cannot set termios."));
        }
      }/* HAVE_TERMIOS_H */
# elif defined HAVE_BSD_SGTTY_H
      if (isatty(rtfd)) {
        if (ioctl(rtfd, TIOCGETP, &tty) < 0) {
          perror(Str(X_946,"ioctl"));
          die(Str(X_332,"MIDI receive: cannot get tty settings."));
        }
        tty.sg_ispeed = INBAUD;            /* set baud rate         */
        tty.sg_flags = RAW;                /* and no I/O processing */
        if (ioctl(rtfd, TIOCSETP, &tty) < 0)
          {
            perror(Str(X_946,"ioctl"));
            die(Str(X_335,"MIDI receive: cannot set tty settings"));
          }
      }
# endif /* HAVE_BSD_SGTTY_H */
#elif !defined(__BEOS__) && !defined(mills_macintosh)
# if !defined(DOSGCC) && !defined(__WATCOMC__) && !defined(LATTICE) && !defined(WIN32) && !defined(__EMX__)
      ioctl(rtfd, TIOCGETP, &tty);           /* for other machines      */
      tty.sg_ispeed = INBAUD;                /*   set baud rate         */
      tty.sg_flags = RAW;                    /*   and no I/O processing */

      ioctl(rtfd, TIOCSETP, &tty);
# endif
#endif
#ifdef SGI
      /***********************************************/
      /* New SGI media library MIDI support VL, 2001 */
      /***********************************************/

      mdInit();
      if(!(sgiport   = mdOpenInPort(O.Midiname))) {
        printf("Can not open port: %s", O.Midiname);
        exit(1);
      }
      else printf("Opening midi port: %s\n", O.Midiname);
      close(rtfd);                  /* close port as in the NeXT implementation */
      rtfd = mdGetFd(sgiport);      /* get the fd of the open port   */
      mevent = mdMalloc((MBUFSIZ/4)*sizeof(MDevent)); /* MDevent alloc */
      midipoll.events = POLLIN;     /* set the poll attrib */
      midipoll.fd = rtfd;
#endif
#if defined(__BEOS__)
      port_id serverPort = find_port(kServerPortName);
      if (serverPort >= B_OK) {
        /* Create a port for transferring MIDI data. */
        gMidiInPort = create_port(kPortCapacity, O.Midiname);
        if (gMidiInPort >= B_OK) {
          struct ServerMidiPort request;
          status_t status;

          /* Send the request to the server. */
          request.mPort = gMidiInPort;
          request.mClientThread = find_thread(0);

          status = write_port(serverPort, kServerNewMidiInPort, &request, sizeof(request));
          if (status >= B_OK) {
            status = write_port(gMidiInPort, 0, O.Midiname, strlen(O.Midiname));
          }
          if (status < B_OK) {
            /* Something went wrong. */
            delete_port(gMidiInPort);
            gMidiInPort = (port_id)status;
          }
        }
      }
      if (gMidiInPort < B_OK) {
        die(Str(X_1548,"Failed to open MIDI input port to Csound Server."));
      }
#endif
}
}

static void Fnxtdeltim(void) /* incr FMidiNxtk by next delta-time */
{                            /* standard, with var-length deltime */
    unsigned long deltim = 0;
    unsigned char c;
    short count = 1;

    if (MTrkrem > 0) {
      while ((c = getc(mfp)) & 0x80) {
        deltim += c & 0x7F;
        deltim <<= 7;
        count++;
      }
      MTrkrem -= count;
      if ((deltim += c) > 0) {                  /* if deltim nonzero */
        FltMidiNxtk += deltim * kprdspertick; /*   accum in double */
        FMidiNxtk = (long) FltMidiNxtk;       /*   the kprd equiv  */
        /*              printf("FMidiNxtk = %ld\n", FMidiNxtk);  */
      }
    }
    else {
      printf(Str(X_718,"end of track in midifile '%s'\n"), O.FMidiname);
      printf(Str(X_33,"%d forced decays, %d extra noteoffs\n"),
             Mforcdecs, Mxtroffs);
      MTrkend = 1;
      O.FMidiin = 0;
      if (O.ringbell && !O.termifend)  beep();
    }
}

static void Rnxtdeltim(void)        /* incr FMidiNxtk by next delta-time */
{             /* Roland MPU401 form: F8 time fillers, no Trkrem val, EOF */
    unsigned long deltim = 0;
    int c;

    do {
      if ((c = getc(mfp)) == EOF) {
        printf(Str(X_712,"end of MPU401 midifile '%s'\n"), O.FMidiname);
        printf(Str(X_33,"%d forced decays, %d extra noteoffs\n"),
               Mforcdecs, Mxtroffs);
        MTrkend = 1;
        O.FMidiin = 0;
        if (O.ringbell && !O.termifend)  beep();
        return;
      }
      deltim += (c &= 0xFF);
    }
    while (c == 0xF8);      /* loop while sys_realtime tming clock */
    if (deltim) {                             /* if deltim nonzero */
      FltMidiNxtk += deltim * kprdspertick;   /*   accum in double */
      FMidiNxtk = (long) FltMidiNxtk;         /*   the kprd equiv  */
      /*          printf("FMidiNxtk = %ld\n", FMidiNxtk);  */
    }
}

void FMidiOpen(void) /* open a MidiFile for reading, sense MPU401 or standard */
{                    /*     callable once from main.c      */
        short sval;
        long lval, tickspersec;
        u_long deltim;
        char inbytes[16];    /* must be long-aligned, 16 >= MThd maxlen */
extern long natlong(long);
extern short natshort(short);

        FMidevtblk = (MEVENT *) mcalloc((long)sizeof(MEVENT));
        fsexbuf = (u_char *) mcalloc((long)MBUFSIZ);
        fsexend = fsexbuf + MBUFSIZ;
        fsexp = NULL;
        m_chn_init(FMidevtblk,(short)0);

        if (strcmp(O.FMidiname,"stdin") == 0) {
          mfp = stdin;
#if defined(mills_macintosh) || defined(SYMANTEC)
          die(Str(X_345,"MidiFile Console input not implemented"));
#endif
        }
        else if (!(mfp = fopen(O.FMidiname, "rb")))
            dies(Str(X_643,"cannot open '%s'"), O.FMidiname);
        if ((inbytes[0] = getc(mfp)) != 'M')
            goto mpu401;
        if ((inbytes[1] = getc(mfp)) != 'T') {
            ungetc(inbytes[1],mfp);
            goto mpu401;
        }
        if (fread(inbytes+2, 1, 6, mfp) < 6)
            dies(Str(X_1323,"unexpected end of '%s'"), O.FMidiname);
        if (strncmp(inbytes, "MThd", 4) != 0)
            dies(Str(X_1377,"we're confused.  file '%s' begins with 'MT',\n"
                 "but not a legal header chunk"), O.FMidiname);
        printf(Str(X_72,"%s: found standard midifile header\n"), O.FMidiname);
        if ((lval = natlong(*(long *)(inbytes+4))) < 6 || lval > 16) {
            sprintf(errmsg,Str(X_614,"bad header length %ld in '%s'"), lval, O.FMidiname);
            die(errmsg);
        }
        if (fread(inbytes, 1, (int)lval, mfp) < (unsigned long)lval)
            dies(Str(X_1323,"unexpected end of '%s'"), O.FMidiname);
        if ((sval = natshort(*(short *)inbytes)) != 0) {
            sprintf(errmsg,Str(X_67,"%s: Midifile format %d not supported"),
                    O.FMidiname, sval);
            die(errmsg);
        }
        if ((sval = natshort(*(short *)(inbytes+2))) != 1)
            dies(Str(X_875,"illegal ntracks in '%s'"), O.FMidiname);
        if ((inbytes[4] & 0x80)) {
            short SMPTEformat, SMPTEticks;
            SMPTEformat = -(inbytes[4]);
            SMPTEticks = *(u_char *)inbytes+5;
            if (SMPTEformat == 29)  SMPTEformat = 30;  /* for drop frame */
            printf(Str(X_450,"SMPTE timing, %d frames/sec, %d ticks/frame\n"),
                   SMPTEformat, SMPTEticks);
            tickspersec = SMPTEformat * SMPTEticks;
        }
        else {
            short Qticks = natshort(*(short *)(inbytes+4));
            printf(Str(X_344,"Metrical timing, Qtempo = 120.0, Qticks = %d\n"), Qticks);
            ekrdQmil = ekr / Qticks / 1000000.;
            tickspersec = Qticks * 2;
        }
        kprdspertick = ekr / tickspersec;
        printf(Str(X_959,"kperiods/tick = %7.3f\n"), kprdspertick);

chknxt: if (fread(inbytes, 1, 8, mfp) < 8)         /* read a chunk ID & size */
            dies(Str(X_1323,"unexpected end of '%s'"), O.FMidiname);
        if ((lval = natlong(*(long *)(inbytes+4))) <= 0)
            dies(Str(X_895,"improper chunksize in '%s'"), O.FMidiname);
        if (strncmp(inbytes, "MTrk", 4) != 0) {    /* if not an MTrk chunk,  */
            do sval = getc(mfp);                   /*    skip over it        */
            while (--lval);
            goto chknxt;
        }
        printf(Str(X_1294,"tracksize = %ld\n"), lval);
        MTrkrem = lval;                            /* else we have a track   */
        FltMidiNxtk = 0.;
        FMidiNxtk = 0;                             /* init the time counters */
        nxtdeltim = Fnxtdeltim;                    /* set approp time-reader */
        nxtdeltim();                               /* incr by 1st delta-time */
        return;

mpu401: printf(Str(X_69,"%s: assuming MPU401 midifile format, ticksize = 5 msecs\n"), O.FMidiname);
        kprdspertick = ekr / 200.;
        ekrdQmil = 1.;                             /* temp ctrl (not needed) */
        MTrkrem = MAXLONG;                         /* no tracksize limit     */
        FltMidiNxtk = 0.;
        FMidiNxtk = 0;
        nxtdeltim = Rnxtdeltim;                    /* set approp time-reader */
        if ((deltim = (inbytes[0] & 0xFF))) {      /* if 1st time nonzero    */
            FltMidiNxtk += deltim * kprdspertick;  /*     accum in double    */
            FMidiNxtk = (long) FltMidiNxtk;        /*     the kprd equiv     */
/*          printf("FMidiNxtk = %ld\n", FMidiNxtk);   */
            if (deltim == 0xF8)     /* if char was sys_realtime timing clock */
                nxtdeltim();                      /* then also read nxt time */
        }
}

void MidiClose(void)
{
     extern int close(int);
#  if defined(__BEOS__)
    /* Close the connection to the server. */
    if (gMidiInPort >= B_OK) {
      delete_port(gMidiInPort);
      gMidiInPort = B_ERROR;
    }
#  endif
#ifndef SGI  /******** for SGI using media library ********/
    if (rtfd) close(rtfd);
#else
    mdFree(mevent);
    if(rtfd) mdClosePort(sgiport);
#endif
    if (mfp) fclose(mfp);
}

static void AllNotesOff(MCHNBLK *);

static void sustsoff(MCHNBLK *chn)  /* turnoff all notes in chnl sust array */
{                        /* called by SUSTAIN_SW_off only if count non-zero */
    INSDS *ip, **ipp1, **ipp2;
    short nn, suscnt;

    suscnt = chn->ksuscnt;
    ipp1 = ipp2 = chn->ksusptr + 64;          /* find midpoint of sustain array */
    ipp1--;
    for (nn = 64; nn--; ipp1--, ipp2++ ) {
        if ((ip = *ipp1) != NULL) {
            *ipp1 = NULL;
            do {
              if (ip->xtratim) {
                ip->relesing = 1;
                ip->offtim = (kcounter + ip->xtratim) * onedkr;
                schedofftim(ip);
              }
              else deact(ip);
            } while ((ip = ip->nxtolap) != NULL);
            if (--suscnt == 0)  break;
        }
        if ((ip = *ipp2) != NULL) {
            *ipp2 = NULL;
            do {
              if (ip->xtratim) {
                ip->relesing = 1;
                ip->offtim = (kcounter + ip->xtratim) * onedkr;
                schedofftim(ip);
              }
              else deact(ip);
            } while ((ip = ip->nxtolap) != NULL);
            if (--suscnt == 0)  break;
        }
    }
    if (suscnt) printf(Str(X_1251,"sustain count still %d\n"), suscnt);
    chn->ksuscnt = 0;
}

static void m_timcod_QF(int a, int b) { IGN(a); IGN(b);}  /* dummy sys_common targets */
static void m_song_pos(long a) { IGN(a);}
static void m_song_sel(long a) { IGN(a);}

void m_chanmsg(MEVENT *mep) /* exec non-note chnl_voice & chnl_mode cmnds */
{
    MCHNBLK *chn = m_chnbp[mep->chan];
    short n;
    MYFLT *fp;

    switch(mep->type) {
    case PROGRAM_TYPE:
      n = mep->dat1;                      /* program change: INSTR N  */
      if (instrtxtp[n+1] != NULL)         /* if corresp instr exists  */
        chn->pgmno = n+1;                 /*     assign as pgmno      */
      else chn->pgmno = defaultinsno;     /* else assign the default  */
      printf(Str(X_991,"midi channel %d now using instr %d\n"),mep->chan+1,chn->pgmno);
      break;
    case POLYAFT_TYPE:
      chn->polyaft[mep->dat1] = mep->dat2;     /* Polyphon per-Key Press  */
      break;
    case CONTROL_TYPE:                    /* CONTROL CHANGE MESSAGES: */
      if ((n = mep->dat1) >= 111)         /* if special, redirect */
        goto special;
      if (n == RPNLSB && mep->dat2 == 127 && chn->dpmsb == 127)
        chn->ctl_val[DATENABL] = FL(0.0);
      else if (n == NRPNMSB || n == RPNMSB)
        chn->dpmsb = mep->dat2;
      else if (n == NRPNLSB || n == RPNLSB) {
        chn->dplsb = mep->dat2;
        chn->ctl_val[DATENABL] = FL(1.0);
      } else if (n == DATENTRY && chn->ctl_val[DATENABL] != FL(0.0)) {
        int   msb = chn->dpmsb;
        int   lsb = chn->dplsb;
        MYFLT fval;
        if (msb == 0 && lsb == 0) {
          chn->ctl_val[BENDSENS] = mep->dat2;
        }
        else if (msb == 1) {            /* GS system PART PARAMS */
          int ctl;
          switch(lsb) {
          case 8:  ctl = VIB_RATE;        break;
          case 9:  ctl = VIB_DEPTH;       break;
          case 10: ctl = VIB_DELAY;       break;
          case 32: ctl = TVF_CUTOFF;      break;
          case 33: ctl = TVF_RESON;       break;
          case 99: ctl = TVA_RIS;         break;
          case 100:ctl = TVA_DEC;         break;
          case 102:ctl = TVA_RLS;         break;
          default:printf(Str(X_1327,"unknown NPRN lsb %d\n"), lsb);
          }
          fval = (MYFLT) (mep->dat2 - 64);
          if (uctl_map != NULL && (fp = uctl_map[ctl]) != NULL) {
            MYFLT xx = (fval * *fp++);
            fval = xx + *fp;    /* optionally map */
          }
          chn->ctl_val[ctl] = fval;           /* then store     */
        } else {
          if (msb < 24 || msb == 25 || msb == 27 || msb > 31
              || lsb < 25 || lsb > 87)
            printf(Str(X_1333,"unknown drum param nos, msb %ld lsb %ld\n"),
                   (long)msb, (long)lsb);
          else {
            static int drtab[8] = {0,0,1,1,2,3,4,5};
            int parnum = drtab[msb - 24];
            if (parnum == 0)
              fval = (MYFLT) (mep->dat2 - 64);
            else fval = mep->dat2;
            if (dsctl_map != NULL) {
              fp = &dsctl_map[parnum*2];
              if (*fp != FL(0.0)) {
                MYFLT xx = (fval * *fp++);
                fval = xx + *fp;    /* optionally map */
              }
            }
            printf(Str(X_195,"CHAN %ld DRUMKEY %ld not in keylst,"
                   " PARAM %ld NOT UPDATED\n"),
                   (long)mep->chan+1, (long)lsb, (long)msb);
          }
        }
      }
      else if (uctl_map != NULL && (fp = uctl_map[n]) != NULL) {
        MYFLT xx = (mep->dat2 * *fp++);
        chn->ctl_val[n] = xx + *fp;    /* optional map */
      }
      else chn->ctl_val[n] = (MYFLT) mep->dat2;   /* record data as MYFLT */
      if (n == VOLUME)
        chn->ctl_val[MOD_VOLUME] = chn->ctl_val[VOLUME] * MastVol;
      else if (n == SUSTAIN_SW) {
        short temp = (mep->dat2 > 0);
        if (chn->sustaining != temp) {            /* if sustainP changed  */
          if (chn->sustaining && chn->ksuscnt)    /*  & going off         */
            sustsoff(chn);                        /*      reles any notes */
          chn->sustaining = temp;
        }
      }
      break;

special:
      if (n < 121) {          /* for ctrlr 111, 112, ... chk inexclus lists */
        int index = mep->dat2;                    /*    for the index given */
        INX *inxp = &inxbas;
        while ((inxp = inxp->nxtinx) != NULL)
          if (inxp->ctrlno == n) {                /* if found ctrlno xclist */
            int *insp, cnt = inxp->inscnt;
            if (index <= cnt) {                   /*   & the index in-range */
              INSDS *ip;
              long xtratim = 0;                   /*     turnoff all instrs */
              for (insp = inxp->inslst; cnt--; insp++)
                if ((ip = instrtxtp[*insp]->instance) != NULL) {
                  do  if (ip->actflg) {
                    if (ip->xtratim > xtratim)
                      xtratim = ip->xtratim;
                    xturnoff(ip);
                  }
                  while ((ip = ip->nxtinstance) != NULL);
                }
              if (index) {
                int insno = inxp->inslst[index-1];
                xturnon(insno, xtratim);          /*     & schedstart this */
                printf(Str(X_934,"instr %ld now on\n"), (long)insno);
              }
            }
            else printf(Str(X_908,"index %ld exceeds ctrl %ld exclus list\n"),
                        (long)index, (long)n);
            return;
          }
        printf(Str(X_678,"ctrl %ld has no exclus list\n"), (long)n);
        break;
      }
/* modemsg: */
      if (n == 121) {                           /* CHANNEL MODE MESSAGES:  */
        MYFLT *fp = chn->ctl_val + 1;           /* from ctlr 1 */
        short nn = 101;                         /* to ctlr 101 */
        do *fp++ = FL(0.0);                     /*   reset all ctlrs to 0 */
        while (--nn);                           /* exceptions:  */
        chn->ctl_val[7] = mapctl(7, FL(127.0));    /*   volume     */
        chn->ctl_val[8] = mapctl(8, FL(64.0));     /*   balance    */
        chn->ctl_val[10] = mapctl(10, FL(64.0));   /*   pan        */
        chn->ctl_val[11] = mapctl(11, FL(127.0));  /*   expression */
        chn->ctl_val[BENDSENS] = mapctl(BENDSENS, FL(2.0));
        chn->ctl_val[9] = chn->ctl_val[7] * MastVol;
      }
      else if (n == 122) {                      /* absorb lcl ctrl data */
/*      int lcl_ctrl = mep->dat2;  ?? */        /* 0:off, 127:on */
      }
      else if (n == 123) midNotesOff();         /* allchnl AllNotesOff */
      else if (n == 126) {                      /* MONO mode */
        if (chn->monobas == NULL) {
          MONPCH *mnew, *mend;
          chn->monobas = (MONPCH *)mcalloc((long)sizeof(MONPCH) * 8);
          mnew = chn->monobas;  mend = mnew + 8;
          do  mnew->pch = -1;
          while (++mnew < mend);
        }
        chn->mono = 1;
      }
      else if (n == 127) {                      /* POLY mode */
        if (chn->monobas != NULL) {
          free((char *)chn->monobas);
          chn->monobas = NULL;
        }
        chn->mono = 0;
      }
      else printf(Str(X_661,"chnl mode msg %d not implemented\n"), n);
      break;
    case AFTOUCH_TYPE:
      chn->aftouch = mep->dat1;                 /* chanl (all-key) Press */
      break;
    case PCHBEND_TYPE:
      chn->pchbend = (MYFLT)(((mep->dat2 - 64) << 7) + mep->dat1)/FL(8192.0);
/*        chn->posbend = (MYFLT)((mep->dat2 << 7) + mep->dat1) / FL(16384.0); */
      break;
    case SYSTEM_TYPE:              /* sys_common 1-3 only:  chan contains which */
      switch(mep->chan) {
      case 1: m_timcod_QF((int)((mep->dat1)>>4) & 0x7, (int)mep->dat1 & 0xF);
        break;
      case 2: m_song_pos((((long)mep->dat2)<<7) + mep->dat1);
        break;
      case 3: m_song_sel((long)mep->dat1);
        break;
      default:sprintf(errmsg,Str(X_1353,"unrecognised sys_common type %d"), mep->chan);
        die(errmsg);
      }
      break;
    default:
      sprintf(errmsg,Str(X_1351,"unrecognised message type %d"), mep->type);
      die(errmsg);
    }
}

/* ********* OLD CODE FRAGMENTS ******** */
/* static void m_chanmsg(MEVENT *mep) */ /* exec non-note chnl_voice & chnl_mode cmnds */
/* { ....  */
/*     short n, nn, tstchan; */
/*     MCHNBLK *tstchn; */

/*     switch(mep->type) { */
/*     case CONTROL_TYPE:  */                          /* CONTROL CHANGE MESSAGES: */
/*             if ((n = mep->dat1) >= 121) */              /* if mode msg, redirect */
/*                 goto modemsg;           */
/*             tstchan = (mep->chan + 1) & 0xF; */
/*             if ((tstchn = m_chnbp[tstchan]) != NULL */
/*               && tstchn->Omni == 0 */
/*               && tstchn->Poly == 0) {  */        /* if Global Controller update */
/*                 chn = tstchn;  */                /*   looping from chan + 1     */
/*                 nn = chn->nchnls; */
/*             } */
/*             else nn = 1; */                      /* else just a single pass     */
/*             do {        */
/*                 if ((n = mep->dat1) < 32) { */           /* MSB --               */
/*                     chn->ctl_byt[n] = mep->dat2 << 7; */ /* save as shifted byte */
/*                     chn->ctl_val[n] = (MYFLT) mep->dat2; */ /* but record as MYFLT  */
/*                     if (n == 6) */     /* Data Entry:   */
/*                         switch(chn->RegParNo) { */
/*                         case 0: */        /* pitch-bend sensitivity  */
/*                           chn->pbensens = (mep->dat2 * 100 + chn->ctl_byt[38]) */
/*                                           / f12800; */
/*                           chn->pchbendf = chn->pchbend * chn->pbensens; */
/*                           break; */
/*                         case 1: */      /* fine tuning */
/*                           chn->finetune = (((mep->dat2-64)<<7) + chn->ctl_byt[38]) */
/*                                             / f1048576; */
/*                           chn->tuning = chn->crsetune + chn->finetune;                 */
/*                           break; */
/*                         case 2: */      /* coarse tuning */
/*                           chn->crsetune = (((mep->dat2-64)<<7) + chn->ctl_byt[38]) */
/*                                             / f128; */
/*                           chn->tuning = chn->crsetune + chn->finetune; */
/*                           break; */
/*                         default: */
/*                           printf("unrecognised RegParNo %d\n", chn->RegParNo); */
/*                         } */
/*                     else if (n == 7) */
/*                         Volume = chn->ctl_val[7]; */
/*                 } */
/*                 else if (n < 64) */                 /* LSB -- combine with MSB   */
/*                     chn->ctl_val[n-32] = (MYFLT)(chn->ctl_byt[n-32] + mep->dat2) */
/*                                          / f128; */
/*                 else if (n < 70) { */
/*                     chn->ctl_byt[n] = mep->dat2 & 0x40;*//* switches             */
/*                     chn->ctl_val[n] = (MYFLT) mep->dat2; */ /*  or controllers      */
/*                     switch(n) { */
/*                         short temp; */
/*                     case SUSTAIN_SW: */
/*                         temp = (mep->dat2 >= O.SusPThresh); */
/*                     if (chn->sustaining != temp) { *//* if sustainP changed  */
/*                         if (chn->sustaining && chn->ksuscnt)*/ /*  & going off */
/*                             sustsoff(chn); */        /*      reles any notes */
/*                         chn->sustaining = temp; */
/*                     } */
/*                         break; */
/*                 } */
/*                 } */
/*              else if (n < 121) { */
/*                chn->ctl_byt[n] = mep->dat2 << 7; */ /* save as shifted byte  */
/*                chn->ctl_val[n] = (MYFLT) mep->dat2; */ /* controllers  */
/*              }  */
/*                 else { */
/*                     printf("undefined controller #%d\n", n); */
/*                     break; */
/*                 } */
/*                 if (nn > 1 && (chn = m_chnbp[++tstchan]) == NULL) { */
/*                     printf("Global Controller update cannot find MCHNBLK %d\n", */
/*                            tstchan); */
/*                     break; */
/*                 } */
/*             } while (--nn); */  /* loop if Global update */
/*             break; */
/* modemsg:    if (chn->bas_chnl != mep->chan) {  */   /* CHANNEL MODE MESSAGES:  */
/*                 printf("mode message %d on non-basic channel %d ignored\n", */
/*                        n, mep->chan + 1); */
/*                 break; */
/*             } */
/*             if (n == 121) { */
/*                 short *sp = chn->ctl_byt; */
/*                 MYFLT *fp = chn->ctl_val; */
/*                 short nn = 120; */
/*                 do { */
/*                     *sp++ = 0;  */ /* reset all controllers to 0 */
/*                     *fp++ = 0.; */
/*                 } while (--nn);  */      /* exceptions:  */
/*                 chn->ctl_byt[8] = 64; */ /*      BALANCE */
/*                 chn->ctl_val[8] = 64.; */
/*                 chn->ctl_byt[10] = 64;*/ /*      PAN     */
/*                 chn->ctl_val[10] = 64.; */
/*             } */
/*             else if (n == 122) */
/*                 LCtl = (mep->dat2) ? ON : OFF; */
/*             else { */
/*                         AllNotesOff(chn); */
/*                 switch(n) { */
/*                 case 124: chn->Omni = OFF; */
/*                           break; */
/*                 case 125: chn->Omni = ON; */
/*                           break; */
/*                 case 126: chn->Poly = OFF; */
/*                           NVoices = mep->dat2; */
/*                           break; */
/*                 case 127: chn->Poly = ON; */
/*                           NVoices = 1; */
/*                           break; */
/*             } */
/*             } */
/*             break; */
/*     case CHNPRES_TYPE: */
/*             chn->chnpress = mep->dat1; */            /* channel (all-key) Press */
/*             break; */
/*     case PCHBEND_TYPE: */
/*             chn->pchbend = (MYFLT)(((mep->dat2 - 64) << 7) + mep->dat1) / f8192; */
/*             chn->pbendiff = chn->pchbend * chn->pbensens; */
/*             break; */
/* } */

void m_chn_init(MEVENT *mep, short chan)
    /* alloc a midi control blk for a midi chnl */
    /*  & assign corr instr n+1, else a default */
{
    MCHNBLK *chn;

    if (!defaultinsno) {
                                /* find lowest instr as default */
      defaultinsno = 1;
      while (instrtxtp[defaultinsno]==NULL) {
        defaultinsno++;
        if (defaultinsno>maxinsno)
          die(Str(X_993,"midi init cannot find any instrs"));
      }
    }
    if ((chn = m_chnbp[chan]) == NULL)
      m_chnbp[chan] = chn = (MCHNBLK *) mcalloc((long)sizeof(MCHNBLK));
/*     chn->Omni = 1; */
/*     chn->Poly = 1; */
/*     chn->bas_chnl = chan; */
/*     chn->nchnls = 1; */
    if (instrtxtp[chan+1] != NULL)           /* if corresp instr exists  */
      chn->pgmno = chan+1;                 /*     assign as pgmno      */
    else chn->pgmno = defaultinsno;          /* else assign the default  */
/*     chn->pbensens = 1.0; */                 /* pbend sensit 1 semitone  */
    mep->type = CONTROL_TYPE;
    mep->chan = chan;
    mep->dat1 = 121;  /* reset all controllers */
    m_chanmsg(mep);
    printf(Str(X_992,"midi channel %d using instr %d\n"), chan + 1, chn->pgmno);
}

static void ctlreset(short chan)    /* reset all controllers for this channel */
{
        MEVENT  mev;
        mev.type = CONTROL_TYPE;
        mev.chan = chan;
        mev.dat1 = 121;
        m_chanmsg(&mev);
}

MCHNBLK *m_getchnl(short chan)          /* get or create a chnlblk ptr */
{
        MCHNBLK *chn;
        if (chan < 0 || chan >= MAXCHAN) {
            sprintf(errmsg,Str(X_870,"illegal midi chnl no %d"), chan+1);
            die(errmsg);
        }
        if ((chn = m_chnbp[chan]) == NULL) {
            m_chnbp[chan] = chn = (MCHNBLK *) mcalloc((long)sizeof(MCHNBLK));
            chn->pgmno = -1;
            chn->insno = -1;
            ctlreset(chan);
        }
        return(chn);
}

void m_chinsno(short chan, short insno)   /* assign an insno to a chnl */
{                                         /* =massign: called from i0  */
    MCHNBLK  *chn = NULL;

    if (insno <= 0 /* || insno >= maxinsno */
        || instrtxtp[insno] == NULL) {
      printf(Str(X_310,"Insno = %d\n"), insno);
      die(Str(X_1336,"unknown instr"));
    }
    if (m_chnbp[chan] != NULL)
      printf(Str(X_987,"massign: chnl %d exists, ctrls now defaults\n"));
    chn = m_getchnl(chan);
    chn->insno = insno;
    chn->pchbend = FL(0.0);     /* Mid value */
    /*    chn->posbend = FL(0.5); */          /* for pos pchbend (0 - 1.) */
    ctlreset(chan);
    printf(Str(X_660,"chnl %d using instr %d\n"), chan+1, chn->insno);
}

static void AllNotesOff(MCHNBLK *chn)
{
    INSDS *ip, **ipp = chn->kinsptr;
    int nn = 128;

    do {
        if ((ip = *ipp) != NULL) {      /* if find a note in kinsptr slot */
            deact(ip);                  /*    deactivate, clear the slot  */
            *ipp = NULL;
        }
        ipp++;
    } while (--nn);
    if (chn->sustaining)                /* same for notes in sustain list */
        sustsoff(chn);
    insxtroff(chn->insno);              /* finally rm all xtratim hanging */
}

void midNotesOff(void)          /* turnoff ALL curr midi notes, ALL chnls */
{                               /* called by musmon, ctrl 123 & sensFMidi */
    int chan = 0;
    MCHNBLK *chn;
    do  if ((chn = m_chnbp[chan]) != NULL)
      AllNotesOff(chn);
    while (++chan < MAXCHAN);
}


static MYFLT mapctl(int ctl, MYFLT fval)
{
    MYFLT *fp;
    if (uctl_map != NULL && (fp = uctl_map[ctl]) != NULL)
        fval = (fval * *fp++) + *fp;
    return(fval);
}

void setmastvol(short mvdat)    /* set MastVol & adjust all chan modvols */
{
    MCHNBLK *chn;
    int chnl;
    MastVol = (MYFLT)mvdat * (FL(1.0)/FL(128.0));
    for (chnl = 0; chnl < MAXCHAN; chnl++)
      if ((chn = m_chnbp[chnl]) != NULL)
        chn->ctl_val[MOD_VOLUME] = chn->ctl_val[VOLUME] * MastVol;
}


static void m_start(void) {}      /* dummy sys_realtime targets */
static void m_contin(void) {}
static void m_stop(void) {}
static void m_sysReset(void) {}
static void m_tuneReq(void) {}

static int sexcnt = 0;
static void m_sysex(u_char *sbuf, u_char *sp) /* sys_excl msg, sexbuf: ID + data */
{
    int nbytes = sp - sbuf;
    if (++sexcnt >= 100) {
        printf(Str(X_178,"100th system exclusive $%x, length %d\n"), *sbuf, nbytes);
        sexcnt = 0;
    }
}

static short datbyts[8] = { 2, 2, 2, 2, 1, 1, 2, 0 };
static short m_clktim = 0;
static short m_sensing = 0;

int sensMidi(void)         /* sense a MIDI event, collect the data & dispatch */
{                          /*  called from kperf(), return(2) if MIDI on/off  */
    short  c, type;
    MEVENT *mep = Midevtblk;
    static  short datreq, datcnt;
    int  n;
#ifdef SGI  /* for new SGI media library implementation*/
    int i, j;
#endif
#ifdef LINUX
    /* For select() call, from David Ratajczak */
    fd_set rfds;
    struct timeval tv;
    int retval;
#endif
#ifdef mills_macintosh
    return MacSensMidi();
#endif
 nxtchr:
    if (bufp >= endatp) {
#ifdef NeXTi
      in_msg->msg_size = MSG_SIZE_MAX;
      in_msg->msg_local_port = port_set;
      msg_receive(in_msg, RCV_TIMEOUT, 0);
      midiCnt = 0 ;
      if (in_msg->msg_local_port == recv_reply_port)
        midi_reply_handler(in_msg,&midi_reply);
      midi_get_data(recv_port, recv_reply_port);
      if (midiCnt > 0) {
        n = midiCnt ;
        bufp = mbuf ;
        endatp = mbuf + n ;
      }
      else return(0) ;
#elif defined LINUX
      /********  NEW STUFF **********/ /* from David Ratajczak */
      /* Use select() to make truly */
      /* non-blocking call to midi  */
      /******************************/

      /* Watch rtfd to see when it has input. */
      FD_ZERO(&rfds);
      FD_SET(rtfd, &rfds);
      /* return immediately */
      tv.tv_sec = 0;
      tv.tv_usec = 0;

      retval = select(rtfd+1, &rfds, NULL, NULL, &tv);
      /* Don't rely on the value of tv now! */

      if (retval) {
        if(retval<0)printf(Str(X_1185,"sensMIDI: retval errno %d"),errno);
        if ((n = read(rtfd, (char *)mbuf, MBUFSIZ)) > 0) {
          bufp = mbuf;
          endatp = mbuf + n;
        }
        else return(0);
      }
      else return(0);
#elif defined(__BEOS__)
      {
        int32 dummy;
        /* Read MIDI data from server, if available. */
        if ((n = read_port_etc(gMidiInPort, &dummy, mbuf, MBUFSIZ, B_TIMEOUT, 0)) > 0) {
          bufp = mbuf;
          endatp = mbuf + n;

        } else {
          return 0;
        }
      }
#elif defined SGI
      /*****************************************/
      /* SGI media library MIDI implementation */
      /* non-blocking calls to mdReceive()     */
      /* using poll()  VL feb 2001             */
      /*****************************************/

      if (poll(&midipoll, 1, 0)) {
        if ((n = mdReceive(sgiport, mevent, MBUFSIZ/4)) > 0 ) {
          /* n is number of MDevents         */
          /*  put the midi message (3 bytes) */
          /*  from mevent  (MDevent->msg)    */
          /*  in the midi buffer             */

          for(i = 0 ;i < n; i++)
            for(j = 0; j < 3; j++){
              mbuf[j+i] = mevent[i].msg[j];
            }
          bufp = mbuf;
          endatp = mbuf + n*j;

        }
        else return (0);
      }
      else return (0);
#else
#ifdef SSOUND
	  /**
	  * Reads from user-defined MIDI input.
	  */
	  if(csoundIsExternalMidiEnabled())
	  {
		  int n = csoundExternalMidiRead(mbuf, MBUFSIZ);
		  if(n == 0)
		  {
			  return 0;
		  }
		  bufp = mbuf;
		  endatp = mbuf + n;
	  }
	  else
	  {
		  return 0;
	  }
#else
      if ((n = read(rtfd, (char *)mbuf, MBUFSIZ)) > 0) {
	bufp = mbuf;
	endatp = mbuf + n;
      }
      else return(0);
#endif
#endif
    }
    if ((c = *bufp++) & 0x80) {              /* STATUS byte:      */
      type = c & 0xF0;
      if (type == SYSTEM_TYPE) {
        short lo3 = (c & 0x07);
        if (c & 0x08)                    /* sys_realtime:     */
          switch (lo3) {                 /*   dispatch now    */
          case 0: m_clktim++;
            goto nxtchr;
          case 2: m_start();
            goto nxtchr;
          case 3: m_contin();
            goto nxtchr;
          case 4: m_stop();
            goto nxtchr;
          case 6: m_sensing = 1;
            goto nxtchr;
          case 7: m_sysReset();
            goto nxtchr;
          default: printf(Str(X_1316,"undefined sys-realtime msg %x\n"),c);
            goto nxtchr;
          }
        else {                           /* sys_non-realtime status:   */
          if (sexp != NULL) {            /* implies           */
            m_sysex(sexbuf,sexp);        /*   sys_exclus end  */
            sexp = NULL;
          }
          switch (lo3) {                 /* dispatch on lo3:  */
          case 7: goto nxtchr;           /* EOX: already done */
          case 0: sexp = sexbuf;         /* sys_ex begin:     */
            goto nxtchr;                 /*   goto copy data  */
          case 1:                        /* sys_common:       */
          case 3: datreq = 1;            /*   need some data  */
            break;
          case 2: datreq = 2;            /*   (so build evt)  */
            break;
          case 6: m_tuneReq();           /*   this do immed   */
            goto nxtchr;
          default: printf(Str(X_1317,"undefined sys_common msg %x\n"), c);
            datreq = 32767; /* waste any data following */
            datcnt = 0;
            goto nxtchr;
          }
        }
        mep->type = type;               /* begin sys_com event  */
        mep->chan = lo3;                /* holding code in chan */
        datcnt = 0;
        goto nxtchr;
      }
      else {                            /* other status types:  */
        short chan;
        if (sexp != NULL) {             /* also implies      */
          m_sysex(sexbuf,sexp);         /*   sys_exclus end  */
          sexp = NULL;
        }
        chan = c & 0xF;
        if (m_chnbp[chan] == NULL)      /* chk chnl exists   */
          m_chn_init(mep, chan);
        mep->type = type;               /* & begin new event */
        mep->chan = chan;
        datreq = datbyts[(type>>4) & 0x7];
        datcnt = 0;
        goto nxtchr;
      }
    }
    if (sexp != NULL) {                 /* NON-STATUS byte:      */
      if (sexp < sexend)                /* if sys_excl           */
        *sexp++ = (u_char)c;            /*    special data sav   */
      else printf(Str(X_1262,"system exclusive buffer overflow\n"));
      goto nxtchr;
    }
    if (datcnt == 0)
      mep->dat1 = c;                    /* else normal data      */
    else mep->dat2 = c;
    if (++datcnt < datreq)              /* if msg incomplete     */
      goto nxtchr;                      /*   get next char       */
    datcnt = 0;                         /* else allow a repeat   */
    /* NB:  this allows repeat in syscom 1,2,3 too */
    if (mep->type > NOTEON_TYPE) {      /* if control or syscom  */
      m_chanmsg(mep);                   /*   handle from here    */
      goto nxtchr;                      /*   & go look for more  */
    }
#ifdef __BEOS__
    /*
     *  Enter the input event into a buffer used by 'midiin'.
     *  This is a horrible hack that emulates what DirectCsound does,
     *  in an attempt to make 'midiin' work.  It might be usable
     *  by other OSes than BeOS, but it should be cleaned up first.
     *
     *                  jjk 09262000
     */
    {
      typedef union {
        unsigned long dwData;
        unsigned char bData[4];
      } MIDIMESSAGE;

      extern int MIDIINBUFMAX;
      extern unsigned long MIDIINbufIndex;
      extern MIDIMESSAGE MIDIINbuffer2[];

      MIDIMESSAGE *pMessage = MIDIINbuffer2 + (MIDIINbufIndex++ % MIDIINBUFMAX);
      pMessage->bData[0] = mep->type | mep->chan;
      pMessage->bData[1] = mep->dat1;
      pMessage->bData[2] = mep->dat2;
    }
#endif
    return(2);                          /* else it's note_on/off */
}

static long vlendatum(void)  /* rd variable len datum from input stream */
{
    long datum = 0;
    unsigned char c;
    while ((c = getc(mfp)) & 0x80) {
      datum += c & 0x7F;
      datum <<= 7;
      MTrkrem--;
    }
    datum += c;
    MTrkrem--;
    return(datum);
}

static void fsexdata(int n) /* place midifile data into a sys_excl buffer */
{
    MTrkrem -= n;
    if (fsexp == NULL)                 /* 1st call, init the ptr */
      fsexp = fsexbuf;
    if (fsexp + n <= fsexend) {
      fread(fsexp, 1, n, mfp);       /* addin the new bytes    */
      fsexp += n;
      if (*(fsexp-1) == 0xF7) {      /* if EOX at end          */
        m_sysex(fsexbuf,fsexp);    /*    execute and clear   */
        fsexp = NULL;
      }
    }
    else {
      unsigned char c;
      printf(Str(X_1262,"system exclusive buffer overflow\n"));
      do c = getc(mfp);
      while (--n);
      if (c == 0xF7)
        fsexp = NULL;
    }
}

int sensFMidi(void)     /* read a MidiFile event, collect the data & dispatch */
{                     /* called from kperf(), return(SENSMFIL) if MIDI on/off */
    short  c, type;
    MEVENT *mep = FMidevtblk;
    long len;
    static short datreq;

nxtevt:
    if (--MTrkrem < 0 || (c = getc(mfp)) == EOF)
      goto Trkend;
    if (!(c & 0x80))      /* no status, assume running */
      goto datcpy;
    if ((type = c & 0xF0) == SYSTEM_TYPE) {     /* STATUS byte:      */
      short lo3;
      switch(c) {
      case 0xF0:                          /* SYS_EX event:  */
        if ((len = vlendatum()) <= 0)
          die(Str(X_1401,"zero length sys_ex event"));
        printf(Str(X_1152,"reading sys_ex event, length %ld\n"),len);
        fsexdata((int)len);
        goto nxtim;
      case 0xF7:                          /* ESCAPE event:  */
        if ((len = vlendatum()) <= 0)
          die(Str(X_1400,"zero length escape event"));
        printf(Str(X_747,"escape event, length %ld\n"),len);
        if (sexp != NULL)
          fsexdata((int)len);       /* if sysex contin, send  */
        else {
          MTrkrem -= len;
          do c = getc(mfp);    /* else for now, waste it */
          while (--len);
        }
        goto nxtim;
      case 0xFF:                          /* META event:     */
        if (--MTrkrem < 0 || (type = getc(mfp)) == EOF)
          goto Trkend;
        len = vlendatum();
        MTrkrem -= len;
        switch(type) {
          long usecs;
        case 0x51: usecs = 0;           /* set new Tempo       */
          do {
            usecs <<= 8;
            usecs += (c = getc(mfp)) & 0xFF;
          }
          while (--len);
          if (usecs <= 0)
            printf(Str(X_47,"%ld usecs illegal in Tempo event\n"), usecs);
          else {
            kprdspertick = usecs * ekrdQmil;
            /*    printf("Qtempo = %5.1f\n", 60000000. / usecs); */
          }
          break;
        case 0x01:
        case 0x02:
        case 0x03:
        case 0x04:
        case 0x05:                      /* print text events  */
        case 0x06:
        case 0x07:
          while (len--) {
            int ch;
            ch = getc(mfp);
            putchar(ch);
            if (dribble) putc(ch, dribble);
          }
          break;
        case 0x2F: goto Trkend;         /* normal end of track */
        default:
          printf(Str(X_1192,"skipping meta event type %x\n"),type);
          do c = getc(mfp);
          while (--len);
        }
        goto nxtim;
      }
      lo3 = (c & 0x07);
      if (c & 0x08) {                  /* sys_realtime:     */
        switch (lo3) {               /*   dispatch now    */
        case 0:
        case 1: break;    /* Timing Clk handled in Rnxtdeltim() */
        case 2: m_start(); break;
        case 3: m_contin(); break;
        case 4: m_stop(); break;
        case 6: m_sensing = 1; break;
        case 7: m_sysReset(); break;
        default: printf(Str(X_1316,"undefined sys-realtime msg %x\n"),c);
        }
        goto nxtim;
      }
      else if (lo3 == 6) {          /* sys_non-realtime status:   */
        m_tuneReq();              /* do this one immed  */
        goto nxtim;
      }
      else {
        mep->type = type;         /* ident sys_com event  */
        mep->chan = lo3;          /* holding code in chan */
        switch (lo3) {            /* now need some data   */
        case 1:
        case 3: datreq = 1;
          break;
        case 2: datreq = 2;
          break;
        default: sprintf(errmsg,Str(X_1317,"undefined sys_common msg %x\n"), c);
          die(errmsg);
        }
      }
    }
    else {                              /* other status types:  */
      short chan = c & 0xF;
      if (m_chnbp[chan] == NULL)      /*   chk chnl exists    */
        m_chn_init(mep, chan);
      mep->type = type;               /*   & begin new event  */
      mep->chan = chan;
      datreq = datbyts[(type>>4) & 0x7];
    }
    c = getc(mfp);
    MTrkrem--;

datcpy:
    mep->dat1 = c;                        /* sav the required data */
    if (datreq == 2) {
      mep->dat2 = getc(mfp);
      MTrkrem--;
    }
    if (mep->type > NOTEON_TYPE) {        /* if control or syscom  */
      m_chanmsg(mep);                   /*   handle from here    */
      goto nxtim;
    }
    nxtdeltim();
    return(3);                            /* else it's note_on/off */

 nxtim:
    nxtdeltim();
    if (O.FMidiin && kcounter >= FMidiNxtk)
      goto nxtevt;
    return(0);

Trkend:
    printf(Str(X_715,"end of midi track in '%s'\n"), O.FMidiname);
    printf(Str(X_33,"%d forced decays, %d extra noteoffs\n"), Mforcdecs, Mxtroffs);
    MTrkend = 1;
    O.FMidiin = 0;
    if (O.ringbell && !O.termifend)  beep();
    return(0);
}

#ifdef NeXTi
kern_return_t
 getMidiData(void *arg,midi_raw_t midi_raw_data,u_int midi_raw_dataCnt)
{           /* copy midi data into mbuf for comsumption by sensMidi().  */
            /* Also, set variable midiCnt to number of incoming bytes.  */
    int i;
    for (i = 0; i < midi_raw_dataCnt && i <  MBUFSIZ; i++)
      mbuf[i] = (midi_raw_data++)->data;
    midiCnt = i;
}
#endif

#ifdef SSOUND

/**
* Default MIDI open function for user-defined MIDI; used for CsoundVST.
*/
void csoundDefaultMidiOpen(void)
{
	extern MEVENT *Midevtblk;
	int i;
	Midevtblk = (MEVENT *)mcalloc((long) sizeof(MEVENT));
	mbuf = (u_char *)mcalloc((long) MBUFSIZ);
	bufend = mbuf + MBUFSIZ;
	bufp = endatp = mbuf;
	sexbuf = (u_char *)mcalloc((long) MBUFSIZ);
	sexend = sexbuf + MBUFSIZ;
	sexp = NULL;
	for (i = 0; i < MAXCHAN; i++) 
	{
		m_chnbp[i] = NULL; 
	}
	m_chn_init(Midevtblk,(short) 0);
	O.RTevents = 1;
	O.Midiin = 1;
	O.ksensing = 1;
}

#else
#endif