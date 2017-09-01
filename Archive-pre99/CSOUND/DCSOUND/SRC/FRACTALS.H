typedef struct	{
	OPDS	h;
	MYFLT	*kr, *koutrig,  *ktrig, *kx, *ky, *kmaxIter;
	MYFLT oldx, oldy;
	int oldCount;
} MANDEL;

typedef struct {	
	OPDS   h;
	MYFLT *r, *ktrig, *kinput, *tablenum;
	MYFLT old_r;
} CPSTUN;


typedef struct {	
	OPDS   h;
	MYFLT *r, *input, *tablenum;
} CPSTUNI;


typedef struct {	
	OPDS   h;
	MYFLT *ifn, *kval, *ielements;
	int elements;
	MYFLT *vector;
} VECTOROP;

typedef struct {	
	OPDS   h;
	MYFLT *ifn1, *ifn2, *ielements;
	int elements;
	MYFLT *vector1, *vector2;
} VECTORSOP;


typedef struct {	
	OPDS   h;
	MYFLT *ifn, *kmin, *kmax, *ielements;
	int elements;
	MYFLT *vector;
} VLIMIT;

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ifn, *krange, *kcps, *ielements;
	AUXCH auxch;
	MYFLT *vector;
	int elements;
	long	phs;
	MYFLT	*num1;
} VRANDH;

typedef struct {  /* gab d5 */
	OPDS	h;
	MYFLT	*ifn, *krange, *kcps, *ielements;
	AUXCH	auxch;
	MYFLT	*vector;
	int		elements;
	long	phs;
	MYFLT	*num1, *num2, *dfdmax;
} VRANDI;


typedef struct {
	OPDS    h;
	MYFLT   *ioutfunc,*ielements,*argums[VARGMAX];
	TSEG    *cursegp;
	MYFLT *vector;
	int	elements;
	long    nsegs;
	AUXCH   auxch;
} VSEG; 

typedef struct {
	OPDS    h;
	MYFLT   *ktrig, *kreinit, *ioutFunc, *initStateFunc, *iRuleFunc, *ielements, *irulelen, *iradius;
	MYFLT	*currLine, *outVec, *initVec, *ruleVec;
	int	elements, NewOld, ruleLen;
	AUXCH   auxch;
} CELLA; 

typedef	struct {
	OPDS	h;
	MYFLT	*ifn, *khtim, *ielements, *ifnInit;
	MYFLT	c1, c2, *yt1, *vector, prvhtim;
	int elements;
	AUXCH   auxch;
} VPORT;

typedef struct {
	OPDS	h;
	MYFLT	*kr, *kin, *kdel, *imaxd, *istod;
	AUXCH	aux;
	long	left, maxd;
} KDEL;

typedef struct {
	OPDS	h;
	MYFLT	*ifnOut, *ifnIn, *ifnDel, *ielements, *imaxd, *istod;
	AUXCH	aux;
	MYFLT	**buf, *outvec, *invec, *dlyvec;
	long	*left, maxd;
	int		elements;
} VECDEL;


