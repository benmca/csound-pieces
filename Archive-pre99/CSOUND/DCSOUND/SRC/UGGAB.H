/********************************************/
/* wrap and mirror UGs by Gabriel Maldonado */
/********************************************/

typedef struct {
    OPDS  h;
    MYFLT *xdest, *xsig, *xlow, *xhigh;
} WRAP;


typedef struct {
    OPDS  h;
    MYFLT *kout, *ksig, *kthreshold, *kmode;
    MYFLT old_sig;
} TRIG;

 
typedef struct {
    OPDS  h;
    MYFLT *r, *val1, *val2, *point, *imin, *imax;
    MYFLT point_factor;
} INTERPOL;

/*
typedef struct	{
    OPDS	h;
    MYFLT	*out, *amp, *freq, *ift, *iphs;
    FUNC	*ftp;
    long	tablen;
    double	phs;
} POSC;

typedef struct	{
    OPDS	h;
    MYFLT	*out, *amp, *freq, *kloop, *kend, *ift, *iphs;
    FUNC	*ftp;
    long	tablen;
    MYFLT	fsr;
    double	phs, looplength;
} LPOSC;
*/
typedef struct {
    OPDS	h;
    MYFLT	*ar, *argums[VARGMAX];
} SUM;

typedef	struct {
    OPDS	h;
    MYFLT	*ar, *asig, *kcf, *kbw, *ord, *sep, *iflag, *iscl, *istor;
    int     	scale, loop;
    AUXCH	aux;
    MYFLT	*yt1, *yt2;
} RESONY;

typedef struct {
    OPDS	h;
    MYFLT	*ar, *asig, *kincr ;
    double 	index;
    long 	sample_index;
    MYFLT 	value;
} FOLD;

