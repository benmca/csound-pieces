#include "cs.h"                                       /*    MIDIOPS.C    */
#include "midiops.h"
#include <math.h>

#define	dv127	(1.0f/127.0f)

extern MYFLT *cpsocint, *cpsocfrc, octresol;
extern INSDS    *curip;         /* valid at I-time */
extern MCHNBLK  *m_chnbp[];

#define	MIDI_VALUE(m,field) ((m != (MCHNBLK *) NULL) ? m->field : 0.0f)

    /*
     * m (=m_chnbp) can easily be NULL (the only place it gets set, as
     * of 3.484, is in MIDIinsert) so we should check for validity
     * 					[added by nicb@axnet.it]
     */

#define pitchbend_value(m) (m->pchbend)

extern INSTRTXT **instrtxtp;  /* gab-A3 (added) */
void midibset(MIDIVAL *);

void massign(MASSIGN *p)
{
    MCHNBLK *chn;
    short chnl = (short)(*p->chnl - 1.0f);
    m_chinsno(chnl, (short) *p->insno);
				/* Changes from gab */
    if ((chn = m_chnbp[chnl]) == NULL)
      m_chnbp[chnl] = chn = (MCHNBLK *) mcalloc((long)sizeof(MCHNBLK));
    if (instrtxtp[(int) *p->insno] != NULL)           /* if corresp instr exists  */
      chn->pgmno = (short) *p->insno;                 /*     assign as pgmno      */
    else { 
      char s[80];
      sprintf(s,"instr %d does not exit. Can't assign it to chan %d",
              (int) *p->insno, (int) *p->chnl );
      initerror(s);
    }
}

void ctrlinit(CTLINIT *p)
{
    short chnl = (short)(*p->chnl - 1.0f);
    short nargs = p->INOCOUNT;
    if ((nargs & 0x1) == 0)
	initerror("uneven ctrl pairs");
    else {
	MCHNBLK *chn;
	MYFLT **argp = p->ctrls;
	short ctlno, nctls = nargs >> 1;
	if ((chn = m_chnbp[chnl]) == NULL)
	    chn = m_getchnl(chnl);
	do {
	    ctlno = (short) **argp++;
	    if (ctlno < 0 || ctlno > 120) {
		initerror("illegal ctrl no");
		return;
	    }
	    chn->ctl_val[ctlno] = **argp++;
	} while (--nctls);
    }
}

MYFLT **uctl_map = NULL;                /* accessed by midirecv */
MYFLT dsctl_map[12] = {1.0f,0.0f,1.0f,0.0f,1.0f,0.0f,
                       1.0f,0.0f,1.0f,0.0f,1.0f,0.0f};

void notnum(MIDIVAL *p)      /* valid only at I-time */
{
    *p->r = curip->m_pitch;
}


/* cpstmid by G.Maldonado */
void cpstmid(CPSTABLE *p)
{
    FUNC  *ftp;
    MYFLT *func;
    int notenum = curip->m_pitch;
    int grade;
    int numgrades;
    int basekeymidi;
    MYFLT basefreq, factor,interval;
 
    if ((ftp = ftfind(p->tablenum)) == NULL) 
      initerror("cpstmid: invalid table");
    func = ftp->ftable;
    numgrades = (int) *func++;
    interval = *func++;
    basefreq = *func++;
    basekeymidi = (int) *func++;
	
    if (notenum < basekeymidi) {
      notenum = basekeymidi - notenum;
      grade  = (numgrades-(notenum % numgrades)) % numgrades;
      factor = - (MYFLT)(int) ((notenum+numgrades-1) / numgrades) ;
    }
    else {
      notenum = notenum - basekeymidi;
      grade  = notenum % numgrades;
      factor = (MYFLT)(int) (notenum / numgrades);
    }
    factor = (MYFLT)pow((double)interval, (double)factor);
    *p->r = func[grade] * factor * basefreq;
}

void veloc(MIDIMAP *p)          /* valid only at I-time */
{
    *p->r = *p->ilo + curip->m_veloc * (*p->ihi - *p->ilo) * dv127;
}

void pchmidi(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    double fract, oct, ioct;
    oct = curip->m_pitch / 12.0 + 3.0;
    fract = modf(oct, &ioct);
    fract *= 0.12;
    *p->r = (MYFLT)(ioct + fract);
}

void pchmidib(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    double fract, oct, ioct;
    oct = (curip->m_pitch + (pitchbend_value(curip->m_chnbp) * p->iscal)) / 12.0f + 3.0f;
    fract = modf(oct, &ioct);
    fract *= 0.12;
    *p->r = (MYFLT)(ioct + fract);
}

void pchmidib_i(MIDIVAL *p)
{
  midibset(p);
  pchmidib(p);
}

void octmidi(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = curip->m_pitch / 12.0f + 3.0f;
}

void octmidib(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = (curip->m_pitch + (pitchbend_value(curip->m_chnbp) * p->iscal)) / 12.0f + 3.0f;
}

void octmidib_i(MIDIVAL *p)
{
  midibset(p);
  octmidib(p);
}

void cpsmidi(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    long  loct;
    loct = (long)(((curip->m_pitch +
	     pitchbend_value(curip->m_chnbp) * p->iscal)/ 12.0f + 3.0f) * octresol);
    *p->r = CPSOCTL(loct);
}

void icpsmidib(MIDIVAL *p)
{
    INSDS *curip = p->h.insdshead;
    long  loct;
    loct = (long)(((curip->m_pitch +
	     pitchbend_value(curip->m_chnbp) * p->iscal) / 12.0f + 3.0f) * octresol);
    *p->r = CPSOCTL(loct);
}

void icpsmidib_i(MIDIVAL *p)
{
  midibset(p);
  icpsmidib(p);
}

void kcpsmidib(MIDIKMB *p)
{
    INSDS *curip = p->h.insdshead;
    MYFLT bend = pitchbend_value(curip->m_chnbp);
    if (bend == p->prvbend || curip->relesing)
	*p->r = p->prvout;
    else {
	long  loct;
	p->prvbend = bend;
	loct = (long)(((curip->m_pitch +
			bend * p->scale) / 12.0f + 3.0f) * octresol);
	*p->r = p->prvout = CPSOCTL(loct);
    }
}

void ampmidi(MIDIAMP *p)	/* convert midi veloc to amplitude */
				/*   valid only at I-time          */
{
    MYFLT amp;
    long  fno;
    FUNC *ftp;

    amp = curip->m_veloc / 128.0f;                   /* amp = normalized veloc */
    if ((fno = (long)*p->ifn) > 0) {
	if ((ftp = ftfind(p->ifn)) == NULL)         /* if valid ftable,       */
	    return;                                 /*     use amp as index   */
	amp = *(ftp->ftable + (long)(amp * ftp->flen));
    }
    *p->r = amp * *p->imax;                         /* now scale the output   */
}

/* 	MWB 2/11/97  New optional field to set pitch bend range
	I also changed each of the xxxmidib opcodes, adding * p->scale*/
void midibset(MIDIVAL *p)
{
    if (*p->irange > 0) {
      p->iscal = *p->irange;
    }
    else {
      p->iscal = 2.0f;
    }
}

void aftset(MIDIKMAP *p)
{
    p->lo = *p->ilo;
    p->scale = (*p->ihi - p->lo) * dv127;
}

void aftouch(MIDIKMAP *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = p->lo + MIDI_VALUE(curip->m_chnbp, aftouch) * p->scale;
}

/* void chpress(MIDISCL *p) */
/* { */
/*     INSDS *curip = p->h.insdshead; */
/*     *p->r = curip->m_chnbp->chnpress * p->scale; */
/* } */

/* void pbenset(MIDISCL *p) */
/* { */
/*     p->scale = *p->iscal; */
/* } */

/* void pchbend(MIDISCL *p) */
/* { */
/*     INSDS *curip = p->h.insdshead; */
/*     *p->r = curip->m_chnbp->pchbend * p->scale; */
/* } */

void imidictl(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
	initerror("illegal controller number");
    else *p->r = MIDI_VALUE(curip->m_chnbp, ctl_val[ctlno])
	    * (*p->ihi - *p->ilo) * dv127 + *p->ilo;
}

void mctlset(MIDICTL *p)
{
    long  ctlno;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
	initerror("illegal controller number");
    else {
      p->ctlno = ctlno;
      p->scale = (*p->ihi - *p->ilo) * dv127;
      p->lo = *p->ilo;
      /* MWB If the controller value is 0, it is initialized to the optional
	 value */
      /*
       * the m_chnbp pointer may very well be null here, so we better check
       * [nicb@axnet.it]
       */
      if (p->h.insdshead->m_chnbp != (MCHNBLK *) NULL)
      if (p->h.insdshead->m_chnbp->ctl_val[p->ctlno] == 0) {
	p->h.insdshead->m_chnbp->ctl_val[p->ctlno] = p->scale;
      }
    }
}

void midictl(MIDICTL *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = MIDI_VALUE(curip->m_chnbp,ctl_val[p->ctlno]) * p->scale + p->lo;
}


void ichanctl(CHANCTL *p)
{
    long  ctlno, chan = (long)(*p->ichano - 1.0f);
    if (chan < 0 || chan > 15 || m_chnbp[chan] == NULL)
	initerror("illegal channel number");
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
	initerror("illegal controller number");
    else *p->r = m_chnbp[chan]->ctl_val[ctlno] * (*p->ihi - *p->ilo) * dv127
		+ *p->ilo;
}

void chctlset(CHANCTL *p)
{
    long  ctlno, chan = (long)(*p->ichano - 1.0f);
    if (chan < 0 || chan > 15 || m_chnbp[chan] == NULL)
	initerror("illegal channel number");
    else p->chano = chan;
    if ((ctlno = (long)*p->ictlno) < 0 || ctlno > 120)
	initerror("illegal controller number");
    else {
	p->ctlno = ctlno;
	p->scale = (*p->ihi - *p->ilo) * dv127;
	p->lo = *p->ilo;
    }
}

void chanctl(CHANCTL *p)
{
    *p->r = m_chnbp[p->chano]->ctl_val[p->ctlno] * p->scale + p->lo;
}

void ipchbend(MIDIMAP *p)
{
    *p->r = *p->ilo + (*p->ihi - *p->ilo) *
	    pitchbend_value(p->h.insdshead->m_chnbp);
}

void kbndset(MIDIKMAP *p)
{
    p->lo = *p->ilo;
    p->scale = *p->ihi - *p->ilo;
}

void kpchbend(MIDIKMAP *p)
{
    INSDS *curip = p->h.insdshead;
    *p->r = p->lo + pitchbend_value(curip->m_chnbp) * p->scale;
}
