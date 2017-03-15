
typedef struct {
	OPDS	h;
	MYFLT	*ar, *asig, *xdel, *kfeedback, *maxd;
	MYFLT	yt1; /* filter instance variables */
	AUXCH	aux;  /* delay instance variables */
	long	left;
	unsigned long maxdelay;
	MYFLT	fmaxd;
} FLANGER;

typedef struct {
	OPDS	h;
	MYFLT *ar, *asig, *xdel, *filt_khp, *kfeedback;
	MYFLT c1, c2, yt1, prvhp; /* filter instance variables */
	AUXCH	aux;  /* delay instance variables */
	long	left;
        short   xdelcod;
} WGUIDE1;

typedef struct {
	OPDS	h;
	MYFLT *ar, *asig, *xdel1, *xdel2, *filt_khp1;
	MYFLT *filt_khp2, *kfeedback1, *kfeedback2;
	MYFLT c1_1, c2_1, yt1_1, prvhp1; /* filter1 instance variables */
	MYFLT c1_2, c2_2, yt1_2, prvhp2; /* filter1 instance variables */
	AUXCH	aux1;  /* delay1 instance variables */
	long	left1;
	AUXCH	aux2;  /* delay1 instance variables */
	long	left2;
	MYFLT	old_out;
        short   xdel1cod, xdel2cod;
} WGUIDE2;

