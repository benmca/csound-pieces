#include "cs.h"                                       /*    MIDIRECV.C    */
#include "midiops.h"
#include "oload.h"
#include "stdio.h" /*gab A8*/


#define MBUFSIZ   1024
#define ON        1
#define OFF       0
#define MAXLONG   0x7FFFFFFFL

static u_char *mbuf, *bufp, *bufend, *endatp;
static u_char *sexbuf, *sexp, *sexend;
static u_char *fsexbuf, *fsexp, *fsexend;
static int  rtfd = 0;        /* init these to stdin */
static FILE *mfp;// ;= stdin; /* gab e1*/
MEVENT  *Midevtblk, *FMidevtblk;
MCHNBLK *m_chnbp[MAXCHAN];   /* ptrs to chan ctrl blks */
static MYFLT MastVol = 1.0f;     /* maps ctlr 7 to ctlr 9 */
static long  MTrkrem;
static double FltMidiNxtk, kprdspertick, ekrdQmil;
long   FMidiNxtk;
int    Mforcdecs = 0, Mxtroffs = 0, MTrkend = 0;
static void  m_chn_init(MEVENT *, short);
static void  (*nxtdeltim)(void), Fnxtdeltim(void), Rnxtdeltim(void);
extern void  schedofftim(INSDS *), deact(INSDS *), beep(void);
static MYFLT mapctl(int, MYFLT);
void midNotesOff(void);

int   defaultinsno = 0; /* gab-A1 (before static)*/
extern INSTRTXT **instrtxtp; /*gab-A1 (fixed) before: extern INSTRTXT *instrtxtp[];*/
/* extern INSDS *insalloc[]; */
extern VPGLST *vpglist;
extern short *insbusy;
extern MYFLT **pctlist;
extern long  kcounter;
extern OPARMS O;
extern INX inxbas;
extern void xturnon(int, long);
extern void xturnoff(INSDS*);
extern void insxtroff(short);
void m_chinsno(short chan, short insno); /* gab A8 */
static void ctlreset(short chan); /* gab A8 */
# ifdef GAB_RT /* gab-A1 */
int readmidi(char *, int size);
int midi_out_enabled=0;      
void set_out_port_num(int num);
void gab_midi_init();
void gab_midi_out_init();
void midi_out_enable(int num)   
{
	midi_out_enabled=1;		
	if (num != -1) set_out_port_num(num);
} 
#endif /* GAB_RT */


void MidiOpen(void)   /* open a Midi event stream for reading, alloc bufs */
{                     /*     callable once from main.c                    */
	int j;
	Midevtblk = (MEVENT *) mcalloc((long)sizeof(MEVENT));
	mbuf = (u_char *) mcalloc((long)MBUFSIZ);
	bufend = mbuf + MBUFSIZ;
	bufp = endatp = mbuf;
	sexbuf = (u_char *) mcalloc((long)MBUFSIZ);
	sexend = sexbuf + MBUFSIZ;
	sexp = NULL;
	if (O.Midiin) 
		gab_midi_init(); 
	if (midi_out_enabled) 
		gab_midi_out_init(); 
	for (j=0; j<=15 ; j++)	   
		m_chn_init(Midevtblk,(short)j); 

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
            printf("end of track in midifile '%s'\n", O.FMidiname);
            printf("%d forced decays, %d extra noteoffs\n",
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
                printf("end of MPU401 midifile '%s'\n", O.FMidiname);
                printf("%d forced decays, %d extra noteoffs\n",
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
            FltMidiNxtk += deltim * kprdspertick; /*   accum in double */
            FMidiNxtk = (long) FltMidiNxtk;       /*   the kprd equiv  */
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

#ifdef GAB_RT  /* gab-A1 */
		{  short j;
			for (j=0; j<=15 ; j++)        
        	m_chn_init(FMidevtblk,(short)j);
		}
#endif	/*GAB_RT */
        if (strcmp(O.FMidiname,"stdin") == 0) {
        }
        else if (!(mfp = fopen(O.FMidiname, "rb")))
            dies("cannot open '%s'", O.FMidiname);
        if ((inbytes[0] = getc(mfp)) != 'M')
            goto mpu401;
        if ((inbytes[1] = getc(mfp)) != 'T') {
            ungetc(inbytes[1],mfp);
            goto mpu401;
        }
        if (fread(inbytes+2, 1, 6, mfp) < 6)
            dies("unexpected end of '%s'", O.FMidiname);
        if (strncmp(inbytes, "MThd", 4) != 0)
            dies("we're confused.  file '%s' begins with 'MT',\nbut not a legal header chunk", O.FMidiname);
        printf("%s: found standard midifile header\n", O.FMidiname);
        if ((lval = natlong(*(long *)(inbytes+4))) < 6 || lval > 16) {
            sprintf(errmsg,"bad header length %ld in '%s'", lval, O.FMidiname);
            die(errmsg);
        }
        if (fread(inbytes, 1, (int)lval, mfp) < (unsigned long)lval)
            dies("unexpected end of '%s'", O.FMidiname);
        if ((sval = natshort(*(short *)inbytes)) != 0) {
            sprintf(errmsg,"%s: Midifile format %d not supported",
                    O.FMidiname, sval);
            die(errmsg);
        }
        if ((sval = natshort(*(short *)(inbytes+2))) != 1)
            dies("illegal ntracks in '%s'", O.FMidiname);
        if ((inbytes[4] & 0x80)) {
            short SMPTEformat, SMPTEticks;
            SMPTEformat = -(inbytes[4]);
            SMPTEticks = *(u_char *)inbytes+5;
            if (SMPTEformat == 29)  SMPTEformat = 30;  /* for drop frame */
            printf("SMPTE timing, %d frames/sec, %d ticks/frame\n",
                   SMPTEformat, SMPTEticks);
            tickspersec = SMPTEformat * SMPTEticks;
        }
        else {
            short Qticks = natshort(*(short *)(inbytes+4));
            printf("Metrical timing, Qtempo = 120.0, Qticks = %d\n", Qticks);
            ekrdQmil = ekr / Qticks / 1000000.;
            tickspersec = Qticks * 2;
        }
        kprdspertick = ekr / tickspersec;
        printf("kperiods/tick = %7.3f\n", kprdspertick);

chknxt: if (fread(inbytes, 1, 8, mfp) < 8)         /* read a chunk ID & size */
            dies("unexpected end of '%s'", O.FMidiname);
        if ((lval = natlong(*(long *)(inbytes+4))) <= 0)
            dies("improper chunksize in '%s'", O.FMidiname);
        if (strncmp(inbytes, "MTrk", 4) != 0) {    /* if not an MTrk chunk,  */
            do sval = getc(mfp);                   /*    skip over it        */
            while (--lval);
            goto chknxt;
        }
        printf("tracksize = %ld\n", lval);
        MTrkrem = lval;                            /* else we have a track   */
        FltMidiNxtk = 0.;
        FMidiNxtk = 0;                             /* init the time counters */
        nxtdeltim = Fnxtdeltim;                    /* set approp time-reader */
        nxtdeltim();                               /* incr by 1st delta-time */
        return;

mpu401: printf("%s: assuming MPU401 midifile format, ticksize = 5 msecs\n", O.FMidiname);
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
#ifndef __ZPC__
    extern int close(int);
        if (rtfd) close(rtfd);
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
    if (suscnt) printf("sustain count still %d\n", suscnt);
    chn->ksuscnt = 0;
}

static void m_timcod_QF(int a, int b) { IGN(a); IGN(b);}  /* dummy sys_common targets */
static void m_song_pos(long a) { IGN(a);}
static void m_song_sel(long a) { IGN(a);}

static void m_chanmsg(MEVENT *mep) /* exec non-note chnl_voice & chnl_mode cmnds */
{
    MCHNBLK *chn = m_chnbp[mep->chan];
    short n;
    /*MYFLT *fp;*/

    switch(mep->type) {
    case POLYAFT_TYPE:
            chn->polyaft[mep->dat1] = mep->dat2;     /* Polyphon per-Key Press  */
            break;
    case CONTROL_TYPE:                              /* CONTROL CHANGE MESSAGES: */
			/* IMPORTANT: in GAB_RT version all CONTROL_TYPEs (gab a1)
			* are handled in the same way except SUSTAIN_SW */
	      if ((n = mep->dat1) == SUSTAIN_SW)	{
			  if (O.SusPThresh < 128) { /* if pedal enabled */
                    register short temp = (mep->dat2 >= O.SusPThresh);
                    if (chn->sustaining != temp) {   /* if sustainP changed  */
                        if (chn->sustaining && chn->ksuscnt) /*  & going off */
                            sustsoff(chn);           /*      reles any notes */
                        chn->sustaining = temp;
                    }
			  }
			  else chn->ctl_val[n] = (MYFLT) mep->dat2; /* pedal disabled  */
				
		  }
          else  chn->ctl_val[n] = (MYFLT) mep->dat2; /* but record as float  */
		  break;
    case AFTOUCH_TYPE:
            chn->aftouch = mep->dat1;               /* chanl (all-key) Press */
            break;
    case PCHBEND_TYPE:
            chn->pchbend = (MYFLT)(((mep->dat2 - 64) << 7) + mep->dat1)/8192.0f;
            //chn->posbend = (MYFLT)((mep->dat2 << 7) + mep->dat1) / 16384.0f;
            break;
    case SYSTEM_TYPE:              /* sys_common 1-3 only:  chan contains which */
            switch(mep->chan) {
            case 1: m_timcod_QF((int)((mep->dat1)>>4) & 0x7, (int)mep->dat1 & 0xF);
                    break;
            case 2: m_song_pos((((long)mep->dat2)<<7) + mep->dat1);
                    break;
            case 3: m_song_sel((long)mep->dat1);
                    break;
            default:sprintf(errmsg,"unrecognized sys_common type %d", mep->chan);
                    die(errmsg);
            }
            break;
	case PROGRAM_TYPE:	/*gab A8*/
		{	int insno = mep->dat1+1;
			if (insno <= 0 || instrtxtp[insno] == NULL)  {
				char s[128];
				sprintf(s,"Invalid Program Change: instr %d doesn't exist! MIDI event aborted.",insno);
				warning(s);	//die("unknown instr");
			}
			else {
				short chan = mep->chan;
				ctlreset(chan);
				/* m_chinsno(mep->chan, insno);  */
				m_chnbp[chan]->pgmno = insno;	
			}
		}
		 break;	/* end gab A8 */
    default:sprintf(errmsg,"unrecognized message type %d", mep->type);
            die(errmsg);
    }
}

static void m_chn_init(MEVENT *mep, short chan)
    /* alloc a midi control blk for a midi chnl */
    /*  & assign corr instr n+1, else a default */
{        
    MCHNBLK *chn;
    if (!defaultinsno) {
				/* find lowest instr as default */
	    defaultinsno = 1;
		while (instrtxtp[defaultinsno]==NULL) {
			defaultinsno++;
			if (defaultinsno>maxinsno) die("midi init cannot find any instrs");
		}
	}
    if ((chn = m_chnbp[chan]) == NULL)
	    m_chnbp[chan] = chn = (MCHNBLK *) mcalloc((long)sizeof(MCHNBLK));
    if (instrtxtp[chan+1] != NULL)           /* if corresp instr exists  */
		chn->pgmno = chan+1;                 /*     assign as pgmno      */
    else chn->pgmno = defaultinsno;          /* else assign the default  */
/*     chn->pbensens = 1.0; */                 /* pbend sensit 1 semitone  */
    mep->type = CONTROL_TYPE;
    mep->chan = chan;
    mep->dat1 = 121;  /* reset all controllers */
    m_chanmsg(mep);
    printf("midi channel %d using instr %d\n", chan + 1, chn->pgmno);
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
            sprintf(errmsg,"illegal midi chnl no %d", chan+1);
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

void m_chinsno(short chan, short insno)         /* assign an insno to a chnl */
{                                               /* =massign: called from i0  */
    MCHNBLK  *chn = NULL;                              
    
    if (insno <= 0 /* || insno >= maxinsno */
        || instrtxtp[insno] == NULL)  die("unknown instr");
    if (m_chnbp[chan] != NULL)
      printf("massign: chnl %d exists, ctrls now defaults\n");
    chn = m_getchnl(chan);
    chn->insno = insno;
//    chn->posbend = 0.5f;                 /* for pos pchbend (0 - 1.) */
    ctlreset(chan);
    printf("chnl %d using instr %d\n", chan+1, chn->insno);
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
        MastVol = (MYFLT)mvdat * (1.0f/128.0f);
        for (chnl = 0; chnl < MAXCHAN; chnl++)
            if ((chn = m_chnbp[chnl]) != NULL)
                chn->ctl_val[MOD_VOLUME] = chn->ctl_val[VOLUME] * MastVol;
}


static void m_start(void) {}      /* dummy sys_realtime targets */
static void m_contin(void) {}
static void m_stop(void) {}
static void m_end(void) { /* gab c3*/
	fcloseall(); 
#undef exit
	exit(0);
}
static void m_sysReset(void) {}
static void m_tuneReq(void) {}

static int sexcnt = 0;
static void m_sysex(u_char *sbuf, u_char *sp) /* sys_excl msg, sexbuf: ID + data */
{
    int nbytes = sp - sbuf;
    if (++sexcnt >= 100) {
        printf("100th system exclusive $%x, length %d\n", *sbuf, nbytes);
        sexcnt = 0;
    }
}

static short datbyts[8] = { 2, 2, 2, 2, 1, 1, 2, 0 };
static short m_clktim = 0;
static short m_sensing = 0;

int sensMidi(void)		   /* sense a MIDI event, collect the data & dispatch */
{						   /*  called from kperf(), return(2) if MIDI on/off  */
	short  c, type;
	MEVENT *mep = Midevtblk;
	static	short datreq, datcnt;
	int  n;
nxtchr:	
	if (bufp >= endatp) {
		if ((n = readmidi((char *)mbuf, MBUFSIZ)) > 0) {
			bufp = mbuf;
			endatp = mbuf + n;
		}
		else return (0);
	}
	if ((c = *bufp++) & 0x80) { 			 /* STATUS byte:	  */
		type = c & 0xF0;
		if (type == SYSTEM_TYPE) { 
			short lo3 = (c & 0x07);
			if (c & 0x08)					 /* sys_realtime:	  */
				switch (lo3) {				 /*   dispatch now	  */
					case 0: m_clktim++;
						goto nxtchr;
					case 2: m_start();
						goto nxtchr;
					case 3: m_contin();
						goto nxtchr;
					case 4: m_stop();
						goto nxtchr;
					case 5: m_end(); /* gab c3*/
						goto nxtchr;
					case 6: m_sensing = 1;
						goto nxtchr;
					case 7: m_sysReset();
						goto nxtchr;
					default: printf("undefined sys-realtime msg %x\n",c);
						goto nxtchr;
				}
			else {							/* sys_non-realtime status:   */
				if (sexp != NULL) { 		   /* implies			*/
					m_sysex(sexbuf,sexp);	   /*	sys_exclus end	*/
					sexp = NULL;
				}
				switch (lo3) {				   /* dispatch on lo3:	*/
					case 7: goto nxtchr;		   /* EOX: already done */
					case 0: sexp = sexbuf;		   /* sys_ex begin: 	*/
						goto nxtchr;		   /*	goto copy data	*/
					case 1: 					   /* sys_common:		*/
					case 3: datreq = 1; 		   /*	need some data	*/
						break;
					case 2: datreq = 2; 		   /*	(so build evt)	*/
						break;	   
					case 5: datreq = 2; 		   /* terminate csound	gab c3	*/
						m_end();
						break;	   
					case 6: m_tuneReq();		   /*	this do immed	*/
						goto nxtchr;
					default: printf("undefined sys_common msg %x\n", c);
						datreq = 32767; /* waste any data following */
						datcnt = 0;
						goto nxtchr;
				}
			}
			mep->type = type;				/* begin sys_com event	*/
			mep->chan = lo3;				/* holding code in chan */
			datcnt = 0;
			goto nxtchr;
		}
		else {								/* other status types:	*/
			short chan;
			if (sexp != NULL) { 			   /* also implies		*/
				m_sysex(sexbuf,sexp);		   /*	sys_exclus end	*/
				sexp = NULL;
			}
			chan = c & 0xF;
			if (m_chnbp[chan] == NULL)		   /* chk chnl exists	*/
				m_chn_init(mep, chan);
			mep->type = type;				   /* & begin new event */
			mep->chan = chan;
			datreq = datbyts[(type>>4) & 0x7];
			datcnt = 0;
			goto nxtchr;
		}
	}
	if (sexp != NULL) { 				  /* NON-STATUS byte:	   */
		if (sexp < sexend)				  /* if sys_excl		   */
			*sexp++ = (u_char)c;		  /*	special data sav   */
		else printf("system exclusive buffer overflow\n");
		goto nxtchr;
	}
	if (datcnt == 0)
		mep->dat1 = c;					  /* else normal data	   */
	else mep->dat2 = c;
	if (++datcnt < datreq)				  /* if msg incomplete	   */
		goto nxtchr;					  /*   get next char	   */
	datcnt = 0; 						  /* else allow a repeat   */
	/* NB:	this allows repeat in syscom 1,2,3 too */
	if (mep->type > NOTEON_TYPE) {		  /* if control or syscom  */
		m_chanmsg(mep); 				  /*   handle from here    */
		goto nxtchr;					  /*   & go look for more  */
	}
	return(2);							  /* else it's note_on/off */
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
            printf("system exclusive buffer overflow\n");
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

nxtevt: if (--MTrkrem < 0 || (c = getc(mfp)) == EOF)
            goto Trkend;
        if (!(c & 0x80))      /* no status, assume running */
            goto datcpy;
        if ((type = c & 0xF0) == SYSTEM_TYPE) {     /* STATUS byte:      */
            short lo3;
            switch(c) {
            case 0xF0:                          /* SYS_EX event:  */
                if ((len = vlendatum()) <= 0)
                    die("zero length sys_ex event");
                printf("reading sys_ex event, length %ld\n",len);
                fsexdata((int)len);
                goto nxtim;
            case 0xF7:                          /* ESCAPE event:  */
                if ((len = vlendatum()) <= 0)
                    die("zero length escape event");
                printf("escape event, length %ld\n",len);
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
                               printf("%ld usecs illegal in Tempo event\n", usecs);
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
                case 0x07: while (len--) {
                               int ch;
                               putchar(ch = getc(mfp));
                               if (dribble) putc(ch, dribble);
                           }
                           break;
                case 0x2F: goto Trkend;         /* normal end of track */
                default:   printf("skipping meta event type %x\n",type);
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
                case 2: m_start();
                        break;
                case 3: m_contin();
                        break;
                case 4: m_stop();
                        break;
                case 6: m_sensing = 1;
                        break;
                case 7: m_sysReset();
                        break;
                default: printf("undefined sys-realtime msg %x\n",c);
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
                default: sprintf(errmsg,"undefined sys_common msg %x\n", c);
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

datcpy: mep->dat1 = c;                        /* sav the required data */
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

nxtim:  nxtdeltim();
        if (O.FMidiin && kcounter >= FMidiNxtk)
            goto nxtevt;
        return(0);

Trkend: printf("end of midi track in '%s'\n", O.FMidiname);
        printf("%d forced decays, %d extra noteoffs\n", Mforcdecs, Mxtroffs);
        MTrkend = 1;
        O.FMidiin = 0;
        if (O.ringbell && !O.termifend)  beep();
        return(0);
}

