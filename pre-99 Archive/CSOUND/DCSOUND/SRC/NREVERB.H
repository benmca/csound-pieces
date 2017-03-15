#define	Combs	6
#define	Alpas	5
typedef struct	{
	OPDS	h;
	MYFLT	*out, *in, *time, *hdif, *istor;
	MYFLT	*cbuf_cur[Combs], *abuf_cur[Alpas];
	MYFLT	c_time[Combs], c_gain[Combs], a_time[Alpas], a_gain[Alpas];
	MYFLT	z[Combs], g[Combs];
        AUXCH	temp;
	AUXCH	caux[Combs], aaux[Alpas];
	MYFLT	prev_time, prev_hdif;
} NREV;

