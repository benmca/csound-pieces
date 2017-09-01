#define	SNDINEWBUFSIZ  (16384)
#ifndef TRUE
#define TRUE (1)
#endif
#ifndef FALSE
#define FALSE (0)
#endif

typedef	struct {
  OPDS	h;
  MYFLT	*r1, *r2, *r3, *r4, *ifilno, *ktransp, *iskptim, *ilooping, *iformat;
  short	format, channel, nchnls, sampframsiz, filetyp;
  short analonly, endfile, begfile;
  long	sr, audrem, audsize;
  AIFFDAT *aiffdata;
  void	(*bytrev)();
  FDCH	fdch;
  char	*inbufp, *bufend, *guardpt;
  char	inbuf[SNDINEWBUFSIZ];
  double 	phs;
  long	filepos, firstsampinfile;	
  /*RWD 3:2000*/
  float	fscalefac;
  long	do_floatscaling;
} SOUNDINEW;


