			/* Structure for Dobson/Fitch nonlinear filter */
typedef struct	{
	OPDS	h;
        MYFLT	*ar, *in, *a, *b, *d, *C, *L;	/* The parameter */
        AUXCH	delay;		/* Buffer for old values */
	int	point;		/* Pointer to old values */
} NLFILT;

