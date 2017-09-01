


typedef struct	{
	OPDS	h;
	float	*out, *amp, *freq, *ift, *iphs;
	FUNC	*ftp;
	long	tablen;
	double	tablenUPsr;
	double	phs, old_si;
	float	f2, f1, f0, df1, df0, dx, dx2;
	float	slope, resd1, resd0;
	long old_int_phs;
} POSCILS;

typedef struct	{
	OPDS	h;
	float	*out, *amp, *freq, *ift, *iphs;
	FUNC	*ftp;
	long	tablen;
	double	tablenUPsr;
	double	phs;
} POSCILS2;

#define NZEROS 16
#define NPOLES 16

typedef struct	{
	OPDS	h;
	float	*out, *input;
	double 	xv[NZEROS+1], yv[NPOLES+1];
} TEST;

