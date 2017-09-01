#include "cs.h"                 /*                                 MUSMON.C     */
#include "cscore.h"
#include "midiops.h"
#include "oload.h" /* for TRNON */
#include "soundio.h"
#include "triginstr.h"  /* For triginstr (re Aug 1999) */

#define SEGAMPS 01
#define SORMSG  02

extern  INSTRTXT **instrtxtp;
extern  INSDS   actanchor, *frstoff;

#ifdef GAB_RT /*gab-A1*/
void gab_putchar(char);	
void timer_init(void);	
#endif /*GAB_RT*/

int     insno;
char    strmsg[100];

FLOAT   maxamp[MAXCHNLS], *maxampend, smaxamp[MAXCHNLS], omaxamp[MAXCHNLS];
long    rngcnt[MAXCHNLS], srngcnt[MAXCHNLS], orngcnt[MAXCHNLS];
extern  unsigned long    maxpos[MAXCHNLS], smaxpos[MAXCHNLS], omaxpos[MAXCHNLS];
short   rngflg = 0, srngflg = 0, multichan = 0;
int     sensType = 0;

extern  int     Mxtroffs, MTrkend;
extern  OPARMS  O;
extern  MEVENT  *Midevtblk, *FMidevtblk;
extern  EVTBLK  *Linevtblk;
static  EVTBLK  *scorevtblk;
static  short   offonly = 0;
static  short   sectno = 0;
static  long    kcnt = 0L;
static  FLOAT   timtot = 0.0f;
static  FLOAT   betsiz, ekrbetsiz;
extern  int     MIDIinsert(int, MCHNBLK*, MEVENT*);
extern  int insert(int, EVTBLK*);

static void settempo(FLOAT tempo)
{
        if (tempo > 0.0f) {
            betsiz = 60.0f / tempo;
            ekrbetsiz = ekr * betsiz;
        }
}

void tempset(TEMPO *p)
{
        FLOAT tempo;

        if ((tempo = *p->istartempo) <= 0.)
            initerror(Str(X_864,"illegal istartempo value"));
        else {
            settempo(tempo);
            p->prvtempo = tempo;
        }
}

void tempo(TEMPO *p)
{
       if (*p->ktempo != p->prvtempo) {
           settempo(*p->ktempo);
           p->prvtempo = *p->ktempo;
       }
}

extern  MCHNBLK *m_chnbp[];
extern  void    RTLineset(void), MidiOpen(void), FMidiOpen(void);
extern  void    scsort(FILE*, FILE*), oload(void), cscorinit(void);
extern  void    cscore(void), schedofftim(INSDS *), infoff(FLOAT);
extern  void    orcompact(void), rlsmemfiles(void), timexpire(FLOAT);
extern  void    beatexpire(FLOAT), deact(INSDS*), fgens(EVTBLK *);
extern  void    sfopenin(void), sfopenout(void), sfnopenout(void);
extern  void    iotranset(void), sfclosein(void), sfcloseout(void);
extern  long    kcounter;
extern  FILE    *scfp, *oscfp;
extern  OPARMS  O;
#ifdef SSOUND
int     playevents(void);
static int lplayed = 0;
#else
static  int     playevents(void), lplayed = 0;
#endif
/*static*/  int     segamps, sormsg;
static  EVTBLK  *e = NULL;
EVTBLK *currevent;
static  FLOAT   *maxp;
static  long    *rngp;
static  EVENT   **ep, **epend;  /* pointers for stepping through lplay list */
static  EVENT   *lsect = NULL;
static  FLOAT   curbt, curp2;
#ifdef WIN32
FLOAT   *pcurp2 = &curp2;
#endif
void    beep(void);
extern  void    RTclose(void);

#ifdef RESET
void musreset(void)
{
    /* belt, braces, and parachute */
      int i;
      for(i=0;i<MAXCHNLS;i++){
              maxamp[i] = 0.;
              smaxamp[i] = 0.;
              omaxamp[i] = 0.;
              rngcnt[i] = 0;
              srngcnt[i] = 0;
              orngcnt[i] = 0;
              omaxpos[i] = smaxpos[i] = maxpos[i] = 1;
      }
      maxampend = NULL;
      rngflg = 0;
      srngflg = 0;
      multichan = 0;
      sensType = 0;
      scorevtblk = NULL;
      offonly = 0;
      sectno = 0;
      kcnt = 0L;
      timtot = 0;
      betsiz = (FLOAT)0.;
      ekrbetsiz = (FLOAT)0.;

      lplayed = 0;
      segamps = 0;
      sormsg = 0;
      e = NULL;
      maxp = NULL;
      rngp = NULL;
      ep = NULL;
      epend = NULL;
      lsect = NULL;
      curbt = (FLOAT)0.;
      curp2 = (FLOAT)0.;
}
#endif

int musmon(void)
{
	int     n;
	extern int midi_out_enabled; /* gab d6 */
#ifdef __ZPC__
# ifdef WITHx87
        err_printf(Str(X_337,"MIT Csound:  %d86 with FLOATing point, v"), __I86__);
# else
        err_printf("MIT Csound:  %d86, v", __I86__);
# endif
        err_printf("%d.%.02d\n", VERSION, SUBVER);
#else
# ifdef __BORLANDC__
        err_printf("MIT Csound (BorlandC): %d.%.02d\n", VERSION, SUBVER);
# else
        err_printf("MIT Csound: %d.%.02d (%s)\n", VERSION, SUBVER, __DATE__);
# endif
#endif
# ifdef macintosh
/*	GetVersNumString(PPCVER);
	PtoCstr(PPCVER);
	err_printf("(Mills/PPC: %s)\n", PPCVER);
*/
# endif
	if (!POLL_EVENTS()) exit(1);
	if (O.Midiin || midi_out_enabled)  MidiOpen();    /*gab d6*/  /*   alloc bufs & open files    */
	dispinit();             /* initialise graphics or character display */
	oload();                        /* set globals and run inits */
	if (O.FMidiin) FMidiOpen(); /*gab-A1*/
	printf(Str(X_1099,"orch now loaded\n"));
#ifdef macintosh
        fflush(stdout);
#endif
	if (!POLL_EVENTS()) exit(1);
	
        multichan = (nchnls > 1) ? 1:0;
        maxampend = &maxamp[nchnls];
        segamps = O.msglevel & SEGAMPS;
        sormsg = O.msglevel & SORMSG;

        if (O.Linein)  RTLineset();     /* if realtime input expected   */
        if (O.outbufsamps < 0) {        /* if k-aligned iobufs requestd */
            O.inbufsamps = O.outbufsamps *= -ksmps; /*  set from absolute value */
            printf(Str(X_956,"k-period aligned audio buffering\n"));
#ifdef macintosh
	    warning(Str(X_536,"Will probably not work with playback routines"));
#endif
        }
        else {                          /* else keep the user values    */
            if (!O.inbufsamps)  O.inbufsamps = IOBUFSAMPS;
            if (!O.outbufsamps) O.outbufsamps = IOBUFSAMPS; /* or get defaults  */
        }
#ifdef macintosh	    
	if (IsNotAPowerOf2(O.outbufsamps) != 0) {
	  O.outbufsamps = RoundDownToPowerOf2(O.outbufsamps);
	  printf(Str(X_1164,"reset output buffer blocksize to power of 2 (%ld)\n"),
                 O.outbufsamps);
	}
	if (IsNotAPowerOf2(O.inbufsamps) != 0) {
	  O.inbufsamps = RoundDownToPowerOf2(O.inbufsamps);
	  printf(Str(X_1163,"reset input buffers blocksize to power of 2 (%ld)\n"),
                 O.inbufsamps);
	}
#endif
        printf(Str(X_602,"audio buffered in %d sample-frame blocks\n"),
               O.outbufsamps);
        O.inbufsamps *= nchnls;         /* now adjusted for n channels  */
        O.outbufsamps *= nchnls;
        if (!POLL_EVENTS()) exit(1);
        if (O.sfread)                   /* if audio-in requested,       */
            sfopenin();                 /*   open/read? infile or device */
        if (O.sfwrite)                  /* if audio-out requested,      */
            sfopenout();                /*   open the outfile or device */
        else sfnopenout();
        if (!POLL_EVENTS()) exit(1);
        iotranset();                    /* point recv & tran to audio formatter */

        curp2 = curbt = 0.0f;
        if (O.Beatmode)                        /* if performing from beats */
            settempo((FLOAT)O.cmdTempo);       /*   set the initial tempo  */
	
        /*        if (!O.Linein) {               /* *************** */
        if (!(scfp = fopen(O.playscore, "r"))) {
          if (!O.Linein)
            dies(Str(X_649,"cannot reopen %s"), O.playscore);
        }
        if (O.usingcscore) {
            if (lsect == NULL) {
                lsect = (EVENT *) mmalloc((long)sizeof(EVENT));
                lsect->op = 'l';
            }
            printf(Str(X_1361,"using Cscore processing\n"));
            if (!(oscfp = fopen("cscore.out", "w")))  /* override stdout in   */
                die(Str(X_631,"cannot create cscore.out"));      /* rdscor for cscorefns */
            cscorinit();
            cscore();         /* call cscore, optionally re-enter via lplay() */
            fclose(oscfp);
            fclose(scfp);       
            if (lplayed) goto done;

            if (!(scfp = fopen("cscore.out", "r")))   /*   rd from cscore.out */
                die(Str(X_650,"cannot reopen cscore.out"));
            if (!(oscfp = fopen("cscore.srt", "w")))  /*   writ to cscore.srt */
                die(Str(X_651,"cannot reopen cscore.srt"));
            printf(Str(X_1196,"sorting cscore.out ..\n"));
            if (!POLL_EVENTS()) exit(1);
            scsort(scfp, oscfp);                      /* call the sorter again */
            fclose(scfp);
            fclose(oscfp);
            printf(Str(X_564,"\t... done\n"));
            if (!(scfp = fopen("cscore.srt", "r")))   /*   rd from cscore.srt */
                die(Str(X_651,"cannot reopen cscore.srt"));
            printf(Str(X_1127,"playing from cscore.srt\n"));
            if (!POLL_EVENTS()) exit(1);
            O.usingcscore = 0;
        }
        if (e == NULL)
            e = scorevtblk = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
        printf(Str(X_448,"SECTION %d:\n"),++sectno);
        if (!POLL_EVENTS()) exit(1);
#ifdef macintosh
	fflush(stdout);
#endif
#ifdef GAB_RT		
	if (O.outformat == AE_NO_AUDIO) timer_init();  /*gab-A1*/
#endif

#ifdef SSOUND	//	AFTER SSOUND
done:
	return 0;
#else			//	BEGIN BEFORE SSOUND	
	playevents();                      /* play all events in the score */
done:   printf(Str(X_716,"end of score.\t\t   overall amps:"));
        /*        fclose(scfp);		/* So it can be removed */
        if (!POLL_EVENTS()) exit(1);
        for (maxp=omaxamp, n=nchnls; n--; )
            printf("%9.1f", *maxp++);
        if (O.outformat != AE_FLOAT) {
            printf(Str(X_554,"\n\t   overall samples out of range:"));
            for (rngp=orngcnt, n=nchnls; n--; )
                printf("%9ld", *rngp++);
        }
/*      if (O.Linein)  RTclose(); */ /* now done via atexit */
        printf(Str(X_548,"\n%d errors in performance\n"),perferrcnt);
        if (O.sfread)
            sfclosein();
        if (O.sfwrite)
            sfcloseout();
        else printf(Str(X_1061,"no sound written to disk\n"));
        if (O.ringbell) beep();
        if (dribble) {
          fclose(dribble);
          dribble = NULL;
        }
        return dispexit();      /* hold or terminate the display output     */
                                /* for Mac, dispexit returns 0 to exit immediately */
#endif			//	END BEFORE SSOUND	
}

void beep(void)
{
#ifdef macintosh
	SysBeep(10000);
#elif CWIN
	extern void cwin_Beep(void);
	cwin_Beep();
#else
        printf(Str(X_28,"%c\tbeep!\n"),'\007');
#endif
}

void lplay(EVLIST *a)           /* cscore re-entry into musmon */
{
        lplayed = 1;
        if (!sectno)  printf(Str(X_448,"SECTION %d:\n"),++sectno);
        ep = &a->e[1];            /* from 1st evlist member */
        epend = ep + a->nevents;  /*   to last              */
        playevents();             /* play list members      */
}

#define MAXTIM 3600.
#define MAXONS 5

/*static*/ TRNON turnons[MAXONS]; /*gab-a5 */
/*static*/ TRNON *tpend = turnons + MAXONS;		/*gab-a5 */
TRNON *frsturnon = NULL;
void xturnon(int, long);

void turnon(TURNON *p)          /* make list to turn on instrs for indef perf */
{                               /* called from i0 for execution in playevents */
    int insno = (int)*p->insno;
    long xtratim = (long)(*p->itime * ekr);
    xturnon(insno, xtratim);
}

void xturnon(int insno, long xtratim) /* schedule a later turnon        */
{                               /* called by above & ctrlr 111  */
    TRNON *tp = turnons;
    long ktime = kcounter + xtratim;

    while (tp->insno && ++tp < tpend);  /* quick see if list is full */
    if (tp >= tpend)
      printf(Str(X_1293,"too many turnons waiting\n"));
    else {
      TRNON *prvtp = tp - 1;
      while (prvtp >= turnons && prvtp->ktime > ktime) {
        tp->insno = prvtp->insno;
        tp->ktime = prvtp->ktime;       /* else move later ones down */
        tp--; prvtp--;
      }
      tp->insno = insno;                        /*   & insert the new one */
      tp->ktime = ktime;
    }
    frsturnon = turnons;
}

void kturnon()                  /* turn on instrs due in turnon list */
{                       /* called by kperf when frsturnon set & ktime ready */
    int insno;
    TRNON *tp = turnons;
    EVTBLK *e = (EVTBLK *) mmalloc((long)sizeof(EVTBLK));
    e->opcod = 'i';
    e->pcnt = 3;                
    /*    e->strlen = 0; */
    e->offtim = -1.0f;     /* indef perf */
    e->p[2] = 0.0f;
    e->p[3] = -1.0f;
    while (tp < tpend && (insno = tp->insno) && tp->ktime <= kcounter) {
      int n;
      e->p[1] = (FLOAT)insno;                   /* for each instr due */
      if (instrtxtp[insno] == NULL) {           /*     turnon now     */
        printf(Str(X_1299,"turnon deleted. instr %d undefined\n"), insno);
        perferrcnt++;
      }
      else if ((n = insert(insno, e)) != 0) {
        printf(Str(X_1298,"turnon deleted. instr %d "), insno);
        if (n < 0) printf(Str(X_990,"memory fault\n"));
        else printf(Str(X_822,"had %d init errors\n"), n);
        perferrcnt++;
      } 
      tp->insno = 0;                            /*      & mark it done */
      tp++;
    }
    free((char *)e);
    if (tp < tpend && tp->insno) {              /*   if list non-empty  */
      TRNON *newtp = turnons;
      do {
        newtp->insno = tp->insno;               /*   shuffle to the top */
        newtp->ktime = tp->ktime;
        tp->insno = 0;
      } while (++tp < tpend && tp->insno && newtp++);
      frsturnon = turnons;                      /*   & set gbl pointer */
    } else frsturnon = NULL;
}
#ifdef SSOUND
int playevents(void)  /* play all events in a score or an lplay list */
#else
static playevents(void)  /* play all events in a score or an lplay list */
#endif
{
	int     n;
	FLOAT   prvbt, nxtim, nxtbt, *smaxp;
	unsigned long    *maxps, *smaxps;
	long    *srngp;
	char    opcod;
	
	if (frsturnon != NULL)          /* if something in turnon list  */
		kturnon();                  /*   turnon now                 */
#ifdef SSOUND
//	Change playevents() from a loop to an iterated function.
//	It does exactly what it did before, except for one and only one
//	control sample (ksmps audio sample frames).
//	Returns true if processing is not finished,
//	and false if processing is finished.
#else
	while (
#ifdef CWIN
		POLL_EVENTS()
#else
		1
#endif
		) {           /* read each score event:       */
#endif
		if (O.usingcscore) {         /*   i.e. get next lplay event  */
			if (ep < epend)
				e = (EVTBLK *) &((*ep++)->strarg);     /* nxt event  */
			else e = (EVTBLK *) &(lsect->strarg);      /* else lcode */ 
		}
		else if (!(rdscor(e)))       /*   or rd nxt evt from scorfil */
			e->opcod = 'e';
retest:
		offonly = 0;
		currevent = e;
		switch(e->opcod) {
		case 'w':
			if (O.Beatmode)               /* Beatmode: read 'w'  */
				settempo(e->p2orig);      /*   to init the tempo */
#ifdef SSOUND
			return 1;
#else
			continue;                     /*   for this section  */
#endif
		case 'i':
		case 'f':
		case 'a':
			if (frstoff != NULL) {
				if (O.Beatmode) {
					if (frstoff->offbet < e->p2orig)
						goto setoff;
				}
				else {
					if (frstoff->offtim < e->p[2])
						goto setoff;
				}
			}
			nxtim = e->p[2];
			nxtbt = e->p2orig;
			break;
		case 'l':
			if (frstoff != NULL)
				goto setoff;
			goto lcode;
		case 's':
		case 'e':
			if (frstoff == NULL)
				goto scode;
setoff:
			nxtim = frstoff->offtim;
			nxtbt = frstoff->offbet;
			offonly = 1;
			break;
		default:
			printf(Str(X_723,"error in score.  illegal opcode %c (ASCII %d)\n"),
				e->opcod, e->opcod);
			perferrcnt++;
#ifdef SSOUND
			return 0;
#else
			continue;
#endif
		}
		if (MTrkend && O.termifend && frstoff == NULL) {
			printf(Str(X_1278,"terminating. "));
			return(0);             /* aborting with perf incomplete */
		}
		if (O.Beatmode)
			kcnt = (long)((nxtbt - curbt) * ekrbetsiz + 0.5f);
		else kcnt = (long)((nxtim - curp2) * ekr + 0.5f);
		if (kcnt > 0) {                 /* perf for kcnt kprds  */
			long kdone, kperf(long);
			if (!O.initonly
				&& (kdone = kperf(kcnt)) < kcnt) { /* early rtn:  RTevent  */
				curp2 += kdone * onedkr;    /*    update only curp2 */
				if (sensType == 1) {        /*    for Linein,       */
					e = Linevtblk;          /*      get its evtblk  */
					e->p[2] = curp2;        /*      & insert curp2  */
				}
				else if(sensType == 4) {   /* Realtime orc event (re Aug 1999) */
					EVTNODE *evtlist = OrcTrigEvts.nxtevt;
					while (evtlist && evtlist->kstart <= kcounter) {
						int insno = evtlist->insno;
						e = &evtlist->evt;
						evtlist = OrcTrigEvts.nxtevt = evtlist->nxtevt;
						/* If several events pending we must insert all but one
						- code copied from switch(e->opcod) case 'i' below */
						if(evtlist && evtlist->kstart <= kcounter) {
							if (O.Beatmode && e->p3orig >= 0.)
								e->p[3] = e->p3orig * betsiz;
							if (n = insert(insno, e)) {  /* alloc,init,activate */
								printf("\t\t   T%7.3f",curp2);
								printf(Str(X_1481,
									"triginstr note deleted.  i%d had %d init errors\n"),
									insno, n);
								perferrcnt++;
							}
						}
					}
					if(OrcTrigEvts.nxtevt == NULL) O.OrcEvts = 0;
				} 
				if (!kdone)                 /* if null duration,    */
					goto mtest;             /*  chk for midi on-off */
				if (segamps || sormsg && rngflg)
					printf(Str(X_13,"  rtevent:\t   T%7.3f TT%7.3f M:"),
					curp2,timtot+curp2);
			}
			else {                          /* else a score event:  */
				prvbt = curbt;
				curbt = nxtbt;              /*    update beats too  */
				curp2 = nxtim;
				if (segamps || sormsg && rngflg)
					printf("B%7.3f ..%7.3f T%7.3f TT%7.3f M:",
					prvbt,  curbt,  curp2,  timtot+curp2);
			}
			if (segamps || sormsg && rngflg) {
				for (n=nchnls, maxp=maxamp; n--;)
					printf("%9.1f", *maxp++);
				putchar('\n'); if (dribble) putc('\n', dribble);
				if (rngflg) {
					printf(Str(X_560,"\t number of samples out of range:"));
					for (n=nchnls, rngp=rngcnt; n--;)
						printf("%9ld", *rngp++);
					putchar('\n'); if (dribble) putc('\n', dribble);
					rngflg = 0;
					srngflg++;
				}
			}
			for (n=nchnls,maxp=maxamp-1,smaxp=smaxamp-1,
				maxps=maxpos-1,smaxps=smaxpos-1,
				rngp=rngcnt,srngp=srngcnt; n--; ) {
				++maxps; ++smaxps;
				if (*++maxp > *++smaxp) {
					*smaxp = *maxp;
					/*                printf("sectionpos[%d](%p->%p) %ld -> ", maxp-maxamp, maxps, smaxps, *smaxps); */
					*smaxps = *maxps;
					/*                printf("%ld\n", *smaxps); */
				}
				*maxp = 0.0f;
				*maxps = 0;
				*srngp++ += *rngp;
				*rngp++ = 0;
			}
		}
		if (sensType == 0) { /* if this was a score or turnoff time:  */
			if (frstoff != NULL) {      /* if turnoffs pending,   */
				if (O.Beatmode)
					beatexpire(curbt + hfkprd); /* rm any expired instrs */
				else 
					timexpire(curp2 + hfkprd);
			}
			if (offonly)
				goto retest;            /*  if offonly, loop back */
		}
mtest:
		/* Old test: is faster */
		/* if (sensType >= 2) {            /* Midievent:             */
		/* New version (re Aug 1999): */
		if (sensType == 2 || sensType == 3) {      /* Midievent:    */
			MEVENT *mep;
			MCHNBLK *chn;
			
			if (sensType == 2)          /* realtime or Midifile  */
				mep = Midevtblk;
			else mep = FMidevtblk;
			chn = m_chnbp[mep->chan];
			insno = chn->pgmno;
			if (mep->type == NOTEON_TYPE && mep->dat2) { /* midi note ON: */
				if (n = MIDIinsert(insno,chn,mep)) {  /* alloc,init,activ */
					printf(Str(X_568,"\t\t   T%7.3f - note deleted. "), curp2);
					printf(Str(X_926,"instr %d had %d init errors\n"), insno, n);
					perferrcnt++;
				}
			}
			else {                         /* else midi note OFF:    */
				short pch = mep->dat1;
				INSDS *ip = chn->kinsptr[pch];
				if (ip == NULL)             /*  if already off, done  */
					Mxtroffs++;
				else {
					chn->kinsptr[pch] = NULL;/*  mark this key off    */
					if (chn->sustaining) {  /*  if sustain pedal on   */
						chn->ksusptr[pch] = ip;
						chn->ksuscnt++;     /*    let the note ring   */
					}
					else {                  /*  else some kind of off */
						do {
							/*		    if (!POLL_EVENTS()) exit(1); */
							if (ip->xtratim) {  /*    if offtime delayed  */
								ip->relesing = 1;/*     enter reles phase */
								ip->offtim = (kcounter + ip->xtratim) * onedkr;
								schedofftim(ip);/*      & put in offqueue */
							}
							else deact(ip);     /*    else off now        */
						} while ((ip = ip->nxtolap) != NULL);
					}
				}
			}
		}
		else switch(e->opcod) {             /* scorevt or Linevt:     */
	  case 'e':
		  goto scode;		/* quit realtime */
	  case 'i':
		  insno = abs((int)e->p[1]);
		  if (insno > maxinsno || instrtxtp[insno] == NULL) {
			  if (sensType) printf("\t\t   T%7.3f",curp2);
			  else  printf("\t  B%7.3f",curbt);
			  printf(Str(X_16," - note deleted. instr %d(%d) undefined\n"),insno, maxinsno);
			  perferrcnt++;
		  }
		  else if (e->p[1] < 0.)  /* if p1 neg,             */
			  infoff(-e->p[1]);   /*  turnoff any infin cpy */
		  else {
			  if (O.Beatmode && e->p3orig >= 0.)
				  e->p[3] = e->p3orig * betsiz;
			  if (n = insert(insno,e)) {  /* else aloc,init,activat */
				  if (sensType) printf("\t\t   T%7.3f",curp2);
				  else  printf("\t  B%7.3f",curbt);
				  printf(Str(X_15," - note deleted.  i%d had %d init errors\n"),
					  insno, n);
				  perferrcnt++;
			  }
		  }
		  break;
	  case 'f':
		  fgens(e);
		  break;
	  case 'a':
		  curp2 = e->p[2] + e->p[3];
		  curbt = e->p2orig + e->p3orig;
		  printf(Str(X_1280,"time advanced %5.3f beats by score request\n"),
			  e->p3orig);
		  break;
		}
		if (sensType) {                /* RT event now done:          */
			sensType = 0;
			e = scorevtblk;            /*    return to score context  */
			goto retest;               /*    and resume the kperf     */
		}
#ifdef SSOUND
			return 1;
#else
		continue;                      /* else get next score event   */
#endif
		
lcode:
		printf(Str(X_714,"end of lplay event list\t      peak amps:"));
		for (n=nchnls, maxp=smaxamp; n--; )
			printf("%9.1f", *maxp++);
		putchar('\n'); if (dribble) putc('\n', dribble);
		if (srngflg) {
			printf(Str(X_560,"\t number of samples out of range:"));
			for (n=nchnls, srngp=srngcnt; n--; )
				printf("%9ld", *srngp++);
			putchar('\n'); if (dribble) putc('\n', dribble);
			srngflg = 0;
		}
		return(0);
		
scode:
		if ((opcod = e->opcod) == 's'       /* for s, or e after s   */
			|| (opcod == 'e' && sectno > 1)) {
			timtot += curp2;
			prvbt = curbt = curp2 = 0.0f;
			printf(Str(X_717,"end of section %d\t sect peak amps:"),sectno);
			for (n=nchnls, maxp=smaxamp; n--; )
				printf("%9.1f", *maxp++);
			putchar('\n'); if (dribble) putc('\n', dribble);
			if (srngflg) {
				printf(Str(X_560,"\t number of samples out of range:"));
				for (n=nchnls, srngp=srngcnt; n--; )
					printf("%9ld", *srngp++);
				putchar('\n'); if (dribble) putc('\n', dribble);
				srngflg = 0;
			}
		}
		for (n=nchnls,
			smaxp=smaxamp-1, maxp=omaxamp-1,
			smaxps=smaxpos-1,maxps=omaxpos-1,
			srngp=srngcnt,   rngp=orngcnt; n--; ) {
            ++maxps; ++smaxps;
			if (*++smaxp > *++maxp) {
				*maxp = *smaxp;         /* keep ovrl maxamps */
										/*              printf("overallpos[%d](%f) (%p->%p) %ld -> %ld\n",
				maxp-omaxamp, *maxp, maxps, smaxps, *maxps, *smaxps); */
				*maxps = *smaxps;     /* And where */ 
			}
			*smaxp = 0.0f;
            *smaxps = 0;
			*rngp++ += *srngp;          /*   and orng counts */
			*srngp++ = 0;
		}
		if (opcod == 's') {                     /* if s code,        */
			orcompact();                        /*   rtn inactiv spc */
			if (actanchor.nxtact == NULL)       /*   if no indef ins */
				rlsmemfiles();                  /*    purge memfiles */
			curp2 = curbt = 0.0f;                /*   reset sec times */
			printf(Str(X_448,"SECTION %d:\n"), ++sectno);
#ifdef macintosh
			fflush(stdout);
#endif
		}                                       /*   & back for more */
#ifdef SSOUND
		return 0;
#else
		else break;
        }
        return(1);  /* done with entire score */
#endif
}
