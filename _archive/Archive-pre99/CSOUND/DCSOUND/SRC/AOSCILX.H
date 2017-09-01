/*	Oscilx coded by Paris Smaragdis					*/
/*	Berklee College of Music Csound development team		*/
/*	Copyright (c) August 1994.  All rights reserved			*/

typedef struct	{
	OPDS	h;
	MYFLT	*out, *amp, *freq, *ift, *periods;
	FUNC	*ftp;
	long	mask, end;
	MYFLT	indx, phs;
} AOX;
