#define	Combs	6
#define	Alpas	5
typedef struct	{
	OPDS	h;
	FLOAT	*out, *in, *time, *hdif, *istor;
	FLOAT	*cbuf_cur[Combs], *abuf_cur[Alpas];
	FLOAT	c_time[Combs], c_gain[Combs], a_time[Alpas], a_gain[Alpas];
	FLOAT	z[Combs], g[Combs];
        AUXCH	temp;
	AUXCH	caux[Combs], aaux[Alpas];
	FLOAT	prev_time, prev_hdif;
} NREV;

