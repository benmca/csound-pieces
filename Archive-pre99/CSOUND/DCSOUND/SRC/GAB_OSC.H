typedef struct	{
	OPDS	h;
	MYFLT	*out, *amp, *freq, *ift, *iphs;
	FUNC	*ftp;
	long	tablen;
	double	tablenUPsr;
	double	phs;
} POSC;

typedef struct	{
	OPDS	h;
	MYFLT	*out, *amp, *freq, *kloop, *kend, *ift, *iphs;
	FUNC	*ftp;
	long	tablen;
	MYFLT	fsr;
	double	phs /* , looplength */;

} LPOSC;

