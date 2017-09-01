/*							UGENS4.H	*/

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xcps, *knh, *ifn, *iphs;
	short	ampcod, cpscod;
	long	lphs;
	FUNC	*ftp;
        int     reported;
} BUZZ;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xcps, *kn, *kk, *kr, *ifn, *iphs;
	short	ampcod, cpscod, prvn;
	MYFLT	prvr, twor, rsqp1, rtn, rtnp1, rsumr;
	long	lphs;
	FUNC	*ftp;
        int     reported;
} GBUZZ;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *kamp, *kcps, *icps, *ifn, *imeth, *ipar1, *ipar2;
	MYFLT	sicps, param1, param2;
	short	thresh1, thresh2, method;
	long	phs256, npts, maxpts;
	AUXCH	auxch;
} PLUCK;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *iseed, *sel, *base;
        int	rand;
	short	ampcod;
        short   new;
} RAND;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xcps, *iseed, *sel, *base;
	short	ampcod, cpscod, new;
        int     rand;
	long	phs;
	MYFLT	num1;
} RANDH;

typedef struct {
	OPDS	h;
	MYFLT	*ar, *xamp, *xcps, *iseed, *sel, *base;
	short	ampcod, cpscod, new;
        int	rand;
	long	phs;
	MYFLT	num1, num2, dfdmax;
} RANDI;
