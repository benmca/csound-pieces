/*                                                 MIDIOPS.H   */

#define NOTEOFF_TYPE  0x80
#define NOTEON_TYPE   0x90
#define POLYAFT_TYPE  0xA0
#define CONTROL_TYPE  0xB0
#define PROGRAM_TYPE  0xC0
#define AFTOUCH_TYPE  0xD0
#define PCHBEND_TYPE  0xE0
#define SYSTEM_TYPE   0xF0

#define MAXCHAN       96        /* for 6 ports */

#define DATENABL        3       /* unused ctl_val spc */
#define DATENTRY        6
#define VOLUME          7
#define MOD_VOLUME      9       /* unused ctl_val spc */
#define SUSTAIN_SW    64
#define NRPNLSB         98
#define NRPNMSB         99
#define RPNLSB          100
#define RPNMSB          101

#define VIB_RATE        102     /* ROLAND EXTENDED CTRLS */
#define VIB_DEPTH       103     /* in unused ctl_val spc */
#define VIB_DELAY       104
#define TVF_CUTOFF      105
#define TVF_RESON       106 
#define TVA_RIS         107
#define TVA_DEC         108
#define TVA_RLS         109

#define BENDSENS        110     /* unused ctl_val spc */

typedef struct {
    short  type;
    short  chan;
    short  dat1;
    short  dat2;
} MEVENT;

typedef struct {
    OPDS   h;
    MYFLT  *chnl, *insno;
} MASSIGN;

typedef struct {
    OPDS   h;
    MYFLT  *chnl, *ctrls[64];
} CTLINIT;

typedef struct {
    OPDS   h;
    MYFLT  *r, *irange;		/* MWB addition */
    MYFLT  iscal;
} MIDIVAL;

typedef struct {
    OPDS   h;
    MYFLT  *r, *imax, *ifn;
} MIDIAMP;

typedef struct {
    OPDS   h;
    MYFLT  *r, *iscal;
    MYFLT  scale;
} MIDISCL;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ictlno, *ilo, *ihi;
    long   ctlno;
  MYFLT  scale, lo;
} MIDICTL;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ichano, *ictlno, *ilo, *ihi;
    long   chano, ctlno;
    MYFLT  scale, lo;
} CHANCTL;

typedef struct {
    OPDS   h;
    MYFLT  *r, *iscal;
    MYFLT  scale, prvbend, prvout;
} MIDIKMB;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ilo, *ihi;
} MIDIMAP;

typedef struct {
    OPDS   h;
    MYFLT  *r, *ilo, *ihi;
    MYFLT  scale, lo;
} MIDIKMAP;

typedef struct {
    OPDS   h;
    MYFLT  *olap;
} MIDIOLAP;

typedef struct {
    OPDS   h;
    MYFLT  *r;
} MIDIAGE;

void m_chinsno(short, short);
MCHNBLK *m_getchnl(short);
extern MYFLT **uctl_map, dsctl_map[];

typedef struct {	/* gab-A3 */
	OPDS   h;
	MYFLT *r, *tablenum;/*, *numgrades, *interval, *basefreq, *basekeymidi; */
	

} CPSTABLE;


