double besseli(double);
MYFLT unifrand(MYFLT);
MYFLT linrand(MYFLT);
MYFLT trirand(MYFLT);
MYFLT exprand(MYFLT);
MYFLT biexprand(MYFLT);
MYFLT gaussrand(MYFLT);
MYFLT cauchrand(MYFLT);
MYFLT pcauchrand(MYFLT);
MYFLT weibrand(MYFLT, MYFLT);
MYFLT betarand(MYFLT, MYFLT, MYFLT);
MYFLT poissrand(MYFLT);

typedef struct	{
	OPDS	h;
	MYFLT	*sr, *in, *powerOf, *norm;
} POW;

typedef	struct	{
	OPDS	h;
	MYFLT	*out, *arg1, *arg2, *arg3;
} PRAND; 
