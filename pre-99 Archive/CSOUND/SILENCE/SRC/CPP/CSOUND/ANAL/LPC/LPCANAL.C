                                                          /*  LPCANAL.C      */

/* Standalone analysis program, reading fixed-point monaural sound files.
 * Currently set for maximum of 34 poles, & max anal segment of 500 samples,
 * meaning that the frame slices cannot exceed 250 samples.
 * Program size expands linearly with slice size, and as square of npoles.
 */

/* #include <sysdep.h> */
#include <stdio.h>
#include <math.h>    /* removed include <sys/file.h> */
#ifndef __ZTC__
#include <pwd.h>
#else
#include <stdlib.h>
#endif

#include <lpc.h>
#include <sndf.h>

#ifndef SEEK_CUR		/* stdio.h not ansi! */
#define	SEEK_SET	0
#define SEEK_CUR	1
#define SEEK_END	2
#endif

#define POLEMAX	34
#define DEFNPOLES POLEMAX
#define FRAMAX  500 
#define DEFSLICE 200	/* <= FRAMAX/2 */
#define NDATA 	4	/* number of data values stored with frame */
#define PITCHMIN	70.0
#define PITCHMAX	200.0	/* default limits in Hz for pitch search */

static  int     NPOLE, FRAME, debug=0, verbose=0, doPitch = 1;
static  void    alpol(), gauss(), die(), dieu();
extern  char	*buildsfname();

#define FIND(MSG)   if (*s == '\0')  \
		        if (!(--argc) || (s = *++argv) && *s == '-')  \
			    dieu(MSG);

main(argc, argv)
    int argc;
    char **argv;
{
    int 	jj, slice, counter;
    float	coef[POLEMAX+NDATA], inskip, dur;
    char	*sfname, *iname, *oname;
    double	errn, rms1, rms2, cc[40];
    short	sigi[FRAMAX];	/* changed to short */
    long	i, nsamps, skipbytes, outskip;
    int 	nbytes, nblpc, firstframe, nread;
    int 	n, hsize, esize;	/* new declarations */
    SFSTRUCT    *sfh;
    FILE	*sf,*analf;
    LPHEADER    *lph;
    char	c, *lpbuf, *tp;
    int         rflag = 0;
    float	pchlow, pchhigh;
    void        ptable();
    float       getpch();

    lpbuf = (char *) calloc(LPBUFSIZ, sizeof(char));
    lph = (LPHEADER *) lpbuf;
    tp = lph->text;

    NPOLE = DEFNPOLES;	    /* DEFAULTS... */
    slice = DEFSLICE;
    inskip = 0.0;
    dur = 0.0;			/* default duration is to length of ip */
    *tp = '\0';
    pchlow = PITCHMIN;
    pchhigh = PITCHMAX;

    if (!(--argc))  dieu("insufficient arguments");
    do {
	register char *s = *++argv;
	if (*s++ == '-')
	    switch (*s++) {
	    case 'b':	FIND("no begin time")
		sscanf(s,"%f",&inskip); break;	
	    case 'd':	FIND("no duration")
		sscanf(s,"%f",&dur); break; 
	    case 'p':	FIND("no poles")
		sscanf(s,"%d",&NPOLE); break;
	    case 'h':	FIND("no hopsize")
		sscanf(s,"%d",&slice); break; 
	    case 'C':	FIND("no comment string")
		strncat(tp,s,(LPBUFSIZ - sizeof(LPHEADER) + 4));
		tp += strlen(tp);
		break;
	    case 'P':	FIND("no low frequency")
		sscanf(s,"%f",&pchlow);
		if (pchlow == 0) doPitch = 0;	/* -P0 inhibits ptrack */
		break;
	    case 'Q':	FIND("no high frequency")
		sscanf(s,"%f",&pchhigh); break;
	    case 'v':	FIND("no verbose level")
		sscanf(s,"%d",&verbose);
	        if (verbose > 1)  debug = 1;
	        break;
	    default: dieu("unrecognized flag");
	    }
	else break;
    } while (--argc);

    if (argc != 2)  dieu("incorrect number of filenames");
    iname = *argv++;
    oname = *argv;

    if (verbose) {
	fprintf(stderr,"Reading sound from %s, writing lpfile to %s\n",
		iname, oname);
	fprintf(stderr,"poles=%d interframeoffset=%d skip=%4.1f duration=%4.1f\n",
		NPOLE, slice, inskip, dur);
	fprintf(stderr,"lpheader comment:\n%s\n", lph->text);
	if (pchlow > 0.)
	    fprintf(stderr, "pch track range: %5.1f to %5.1f Hz\n",pchlow,pchhigh);
	else
	    fprintf(stderr,"pitch tracking inhibited\n");
    }
    if ((analf = fopen(oname,"w")) == NULL)
	die("cannot open output data file");
    sfname = buildsfname(iname);

    if ((sf = SFOpenAllocRdHdr(sfname, &sfh)) == NULL)
	die("cannot open sound file"); /* %s", sfname); */

    if (debug)	fprintf(stderr, "sf_chans=%d sf_srate=%7.1f sf_format=%d\n", 
			sfh->channels, sfh->samplingRate, sfh->format);
    if (sfh->channels != 1)
	die("takes monaural files only");
    if (sfh->format != SFMT_SHORT)
	die("takes integer (shortsam) files only");
    if (NPOLE > POLEMAX)
	die("poles exceeds maximum allowed");
    FRAME = slice * 2;
    if (FRAME > FRAMAX)
	die("framesize (inter-frame-offset*2) exceeds maximum allowed");

    if (dur == 0)
	dur = (((float)sfh->dataBsize / (sfh->channels*sizeof(short)) )
	       / sfh->samplingRate) - inskip;
    lph->lpmagic = LP_MAGIC;
    lph->srate = sfh->samplingRate;
    lph->npoles = NPOLE;
    lph->nvals = NPOLE + NDATA;
    lph->framrate = lph->srate / (float) slice;
    lph->duration = dur;

                                /* compute header size */
    hsize = tp - (char *) lph;	/* sizeof text */
    esize = 4 - (hsize % 4);    /* round up to 4 byte boundary */
    if (esize == 4) esize = 0;	/* if we need it */
    lph->headersize = hsize + esize;
    if (lph->headersize >= (LPBUFSIZ - sizeof(LPHEADER) + 4))
	lph->headersize = LPBUFSIZ;
    if (fwrite((char *)lph,sizeof(char),lph->headersize,analf) < lph->headersize)
	die("anallpc: can't write header");
    skipbytes = (long)(inskip * sfh->samplingRate) * sizeof(short);
/*  { /* if not seekable */
/*	while (skipbytes > FRAMAX) { /* remote: spinread for lseek */
/*	    if ((nread = fread((char *)sigi,sizeof(char),FRAMAX,sf)) < FRAMAX)
/*		die("soundfile skip error");
/*	    skipbytes -= nread;
/*	}
/*	if ((nread = fread((char *)sigi,skipbytes,sizeof(char),sf)) < skipbytes)
/*	    die("soundfile skip error");
/*  }
/*  else
 */   if (fseek(sf,skipbytes,SEEK_CUR) < 0)
	die("bad seek on skip");

    firstframe = 0;
    nblpc = (NPOLE + NDATA) * sizeof(float);
    outskip = firstframe * nblpc + lph->headersize;

    nsamps = dur * sfh->samplingRate;
    nbytes = FRAME * sizeof(short); /* bytes for whole frame */
    if ((nread = fread((char *)sigi, sizeof(char), nbytes, sf)) != nbytes)
	die("soundfile read error: couldn't fill first frame");
    /*	for(i=0;i<FRAME;i++) printf("%d ",sigi[i]); 	*/

    if (debug) fprintf(stderr, "nbytes : %d\n", nbytes);
    nbytes = slice * sizeof(short); /* bytes for half frame, FRAME is slice * 2 */

    if (doPitch)
	ptable(pchlow, pchhigh, (float)sfh->samplingRate, FRAME);

    if (debug) fprintf(stderr, "nbytes shifted: %d\n", nbytes);
    i = 0;
    counter = 1;
    while (i < nsamps) {
	alpol(sigi,&errn,&rms1,&rms2,cc);
	coef[0] = (float)rms2; 
	coef[1] = (float)rms1; 
	coef[2] = (float)errn; 
	if (doPitch)
	    coef[3] = getpch(sigi);
	else coef[3] = 0.0;
	if (debug)
	    fprintf(stderr,"%d\t%9.4f\t%9.4f\t%9.4f\t%9.4f\n",
		    counter++,coef[0],coef[1],coef[2],coef[3]);
	for (jj=NDATA; jj<NPOLE+NDATA; jj++)	/* reverse the coefs & change sign */
	    coef[jj] = (float)-cc[NPOLE-jj+(NDATA - 1)];  
						/* then write the anal frame */
	if ((n = fwrite((char *)coef, sizeof(char), nblpc, analf)) != nblpc)
	    die("write error");
	for (jj=0; jj<slice; jj++,i++) /* now move slice forward */
	    sigi[jj] = sigi[jj+slice]; /*   & refill:	     */
	if ((n = fread((char *)(sigi+slice), sizeof(char), nbytes, sf)) != nbytes)
	    break;		/* ran up against eof */
    }
}

static void alpol(sig, errn, rms1, rms2, c)
     double *errn, *rms1, *rms2, *c;
     short *sig;					/* sig now short */
{
	double a[POLEMAX][POLEMAX], v[POLEMAX], b[POLEMAX];
	double x[FRAMAX], y[FRAMAX];
	double *vp=v, *bp=b, *xp=x, *yp=y;
	double sum, sumx, sumy;
	int k1, i, l, k, limit, j;

	for (xp=x; xp-x < FRAME ;++xp,++sig) 
	    *xp = (double) *sig;
	k1 = NPOLE + 1;
	for (i=0; i < NPOLE ;++i)  {
	    sum = (double) 0.0;
	    for (k=NPOLE; k < FRAME ;++k)
		sum += x[k-(i+1)] * x[k];
	    v[i] = -sum;
	    if (i != NPOLE - 1)  {
		limit = NPOLE - (i+1);
		for (l=0; l < limit ;++l)  {
		    sum += x[NPOLE-(i+1)-(l+1)]* x[NPOLE-(l+1)]
			     - x[FRAME-(i+1)-(l+1)]* x[FRAME-(l+1)];
		    a[(i+1)+l][l] = a[l][(i+1)+l] = sum;
		}
	    }
	}
	sum = (double) 0.0;
	for (k=NPOLE; k < FRAME ;++k)
	    sum += pow(x[k], (double) 2.0);
	sumy = sumx = sum;
	for (l=0; l < NPOLE ;++l)  {
	    sum += pow(x[NPOLE-(l+1)], (double) 2.0) - pow(x[FRAME-(l+1)],
							   (double) 2.0);
	    a[l][l] = sum;
	}
	gauss(a, v, b);
/*	filtn(x, y, b);   */
	for (i=0; i < NPOLE ;++i)
	    sumy = sumy - b[i]*v[i];
	*rms1 = sqrt(sumx/(double) (FRAME - k1 + 1) );
	*rms2 = sqrt(sumy/(double) (FRAME - k1 + 1) );
	*errn = pow(((*rms2)/(*rms1)), (double) 2.0);
	for (bp=b; bp-b < NPOLE ;++bp,++c)
	    *c = *bp;
}

static void gauss(aold, bold, b)
     double aold[POLEMAX][POLEMAX], *bold, *b;
{
	double amax, dum, pivot;
	double c[POLEMAX], a[POLEMAX][POLEMAX];
	int i, j, k, l, istar, ii, lp;

	/* aold and bold untouched by this subroutine */
	for (i=0; i < NPOLE ;++i)  {
	    c[i] = bold[i];
	    for (j=0; j < NPOLE ;++j)
		a[i][j] = aold[i][j];
	}
	/* eliminate i-th unknown */
	for (i=0; i < NPOLE - 1 ;++i)  {        /* find largest pivot */
	    amax = 0.0;
	    for (ii=i; ii < NPOLE ;++ii)  {
		if (fabs(a[ii][i]) >= amax)  {
		    istar = ii;
		    amax = fabs(a[ii][i]);
		}
	    }
	    if (amax < 1e-20)
		die("gauss: ill-conditioned");
	    for (j=0; j < NPOLE ;++j)  {    /* switch rows */
		dum = a[istar][j];
		a[istar][j] = a[i][j];
		a[i][j] = dum;
	    }
	    dum = c[istar];
	    c[istar] = c[i];
	    c[i] = dum;
	    for (j=i+1; j < NPOLE ;++j)  {		/* pivot */
		pivot = a[j][i] / a[i][i];
		c[j] = c[j] - pivot * c[i];
		for (k=0; k < NPOLE ;++k)
		    a[j][k] = a[j][k] - pivot * a[i][k];
	    }
	}				/* return if last pivot is too small */
	if (fabs(a[NPOLE-1][NPOLE-1]) < 1e-20)
	    die("gauss: ill-conditioned");

	*(b+NPOLE-1) = c[NPOLE-1] / a[NPOLE-1][NPOLE-1];
	for (k=0; k<NPOLE-1; ++k)  {	/* back substitute */
	    l = NPOLE-1 -(k+1);
	    *(b+l) = c[l];
	    lp = l + 1;
	    for (j = lp; j<NPOLE; ++j)
		*(b+l) += -a[l][j] * *(b+j);
	    *(b+l) /= a[l][l];
	}
}

static void usage()
{
  fprintf(stderr,"USAGE:\tlpcanal [flags] infilename outfilename\n");
  fprintf(stderr,"\twhere flag options are:\n");
  fprintf(stderr,"-b<begin>\tbegin time in seconds into soundfile (default 0.0)\n");
  fprintf(stderr,"-d<duration>\tseconds of sound to be analyzed (default: to EOF)\n");
  fprintf(stderr,"-p<npoles>\tnumber of poles for analysis (default %d)\n",
	   DEFNPOLES);
  fprintf(stderr,"-h<hopsize>\toffset between frames in samples (default %d)\n",
	   DEFSLICE);
  fprintf(stderr,"\t\t\t(framesize will be twice <hopsize>)\n");
  fprintf(stderr,"-C<string>\tcomment field of lp header (default empty)\n");
  fprintf(stderr,"-P<mincps>\tlower limit for pitch search (default %5.1f Hz)\n",
	   PITCHMIN);
  fprintf(stderr,"\t\t\t(-P0 inhibits pitch tracking)\n");
  fprintf(stderr,"-Q<maxcps>\tupper limit for pitch search (default %5.1f Hz)\n",
	   PITCHMAX);
  fprintf(stderr,"-v<verblevel>\tprinting verbosity: 0=none, 1=verbose, 2=debug.");
  fprintf(stderr," (default 0)\n");
  fprintf(stderr,"see also:  Csound Manual Appendix\n");
}

static void die(msg)
     char *msg;
{
  fprintf(stderr,"lpcanal: %s\n\tanalysis aborted\n",msg);
  exit(0);
}

static void dieu(msg)
     char *msg;
{
  fprintf(stderr,"lpcanal: %s\n",msg);
  usage();
  exit(0);
}
