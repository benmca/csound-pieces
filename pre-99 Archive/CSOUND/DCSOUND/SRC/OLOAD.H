#define	NCONSTS	400    /* gbl */		/*	OLOAD.H		*/
#define	LNAMES	400    /* lcl */
#define	GNAMES	100    /* gbl */
#define	NLABELS	5      /* lcl */
#define NGOTOS   40

#ifndef MIN_SHORT
#define MIN_SHORT (-32768)
#endif
extern  short nlabels;
#define LABELIM  (MIN_SHORT + nlabels)
#define CHKING   0
#define CBAS    32250
#define VBAS    32400
#define GVBAS   32550           /* VBAS + PMAX */
#define VMAGIC  0x56444154L     /* "VDAT" */

#define STRSMAX 8
extern  int     strsmax;
extern  char ** strsets;

typedef struct	{
	char	*namep;
	short	type, count;
} NAME;

typedef	struct	{
	char	*lbltxt;
	short	*ndxp;
} LBLARG;

typedef	struct	{
	short	lblno;
	MYFLT	**argpp;
} LARGNO;

typedef struct  {
	MYFLT   *ndx, *string;
} STRNG;

typedef struct  {
	MYFLT   *sets[PMAX];
} PVSET;

typedef struct  {
	MYFLT   *dimen;
} VDIMEN;

typedef struct  {
	OPDS    h;
	MYFLT   *pgm, *vals[32];
} PGM_INIT;

typedef struct inx {
	struct inx *nxtinx;
	int ctrlno;
        int inscnt;
	int inslst[1];
} INX;

typedef struct {
	int	insno;
	long	ktime;
} TRNON;

typedef struct {
    	OPDS   h;
    	MYFLT  *insno, *itime;
} TURNON;

typedef struct  pgmbnk {
	struct  pgmbnk *nxtbnk;
	long    bankno;
	MYFLT   *vpgdat;
	MYFLT   *spldat;
} PGMBNK;

typedef struct  {
	INSTRTXT *instxt;
	PGMBNK  *banks;
} VPGLST;

extern  char    **strsets;
PGMBNK *getchnbnk(MCHNBLK*);
MYFLT *getkeyparms(MCHNBLK*,int);
