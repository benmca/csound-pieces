typedef struct	{
	OPDS	h;
	MYFLT	*iwidth, *iheight, *ibpp; //outputs
	MYFLT   *ifilno, *ifn, *iflag; //inputs
} BMOPEN;

typedef struct	{
	OPDS	h;
	MYFLT	*kr, *kg, *kb, *ka; //outputs
	MYFLT   *kx, *ky, *ifn; //inputs
	BYTE  ** LineArray;
	int height;
} BMTABLE;

typedef struct	{
	OPDS	h;
	MYFLT	*kr, *kg, *kb, *ka; //outputs
	MYFLT   *ktrig, *kxinc, *kyinc, *ktrig_xphreset, *ktrig_yphreset, *kxphs, *kyphs, *ifn; //inputs
	BYTE  ** LineArray;
	int width, height;
	MYFLT Xphase, Yphase;
	int flag;
} BMOSCIL;


typedef struct	{
	OPDS	h;
	MYFLT	*hue, *sat, *val, *lum; //outputs
	MYFLT   *r, *g, *b; //inputs
} RGB2HSVL;

typedef struct	{
	OPDS	h;
	MYFLT	*kphs, *ihorLines, *ifn, *istartLine, *ifnR, *ifnG, *ifnB;
	BYTE  ** LineArray;
	int width, height;
	int flag;
	MYFLT *ftpLines,*ftpR,*ftpG,*ftpB;
} BMSCAN;



typedef struct	{
	OPDS	h;
	MYFLT	*ktrig, *kphs, *iMinDist, *ifn, *args[PMAX];
	MYFLT endSeq, *table, oldPhs;
	int numParm, currIndex, endIndex, prevIndex, nextIndex, lastIndex;
	MYFLT prevActime, nextActime, lastActime;

} TIMEDSEQ;

