#include <stdio.h>                                          /*  HETRO.C   */
#include <sys/types.h>
#include <sys/stat.h>
#ifndef __ZTC__
#include <sys/file.h>
#endif
#include <math.h>

#define TWOPI   6.28308530
#ifndef PI
#define	PI	3.14159265
#endif
#define	SQRTOF3	1.73205081
#define SQUELCH	0.5	/* % of max ampl below which delta_f is frozen */

/* Authors:   Tom Sullivan, Nov'86, Mar'87;  bv revised Jun'92  */
/* Function: Fixed frequency heterodyne filter analysis.		     */
/* compile as : cc -o hetro hetro.c -lm                                      */

/* lowest heterodyne freq = sr/bufsiz */

static float  	x1,x2,yA,y2,y3,		/* lpf coefficients*/
	cur_est,			/* current freq. est.*/
	freq_est = 0, max_frq, max_amp,	/* harm freq. est. & max vals found */
	fund_est = 100.,		/* fundamental est.*/
	t,				/* fundamental period est.*/
	delta_t, outdelta_t,		/* sampling period, outpnt period */
	sr=20000,			/* sampling rate*/
       	freq_c = 0,			/* filter cutoff freq.*/
	input_dur = 0,		        /* sample input duration*/
	beg_time = 0, total_time,	/* begin time and total analysis time*/
	*(MAGS[50]), *(FREQS[50]);      /* magnitude and freq. output buffers*/

static double *cos_mul, *sin_mul,       /* quad. term buffers*/
       	*a_term, *b_term,               /*real & imag. terms*/
        *r_ampl,		        /* pt. by pt. amplitude buffer*/
	*r_phase,		        /* pt. by pt. phase buffer*/
	*a_avg,			        /* output dev. freq. buffer*/
	new_ph,				/* new phase value*/
       	old_ph = 0,			/* previous phase value*/
       	jmp_ph = 0,			/* for phase unwrap*/
        *ph_av1, *ph_av2, *ph_av3,      /*tempor. buffers*/
        *amp_av1, *amp_av2, *amp_av3,   /* same for ampl.*/
	m_ampsum = 32767.;		/* maximum amplitude at output*/
       
static long    windsiz; 		/* # of pts. in one per. of sample*/

static int     hmax = 50,		/* max harmonics requested */
	num_pts = 256,  		/* breakpoints per harmonic */
	amp_min = 32;   		/* amplitude cutout threshold */

static int     skip,			/* flag to stop analysis if zeros*/
	bufsiz = 1, smpsin;		/* circular buffer size, num sampsin */

static long    midbuf,			/* set to bufsiz / 2   */
	bufmask;		        /* set to bufsiz - 1   */

static char    *infilnam,		/* input file name */
	*outfilnam,			/* output file name */
	*auxp,				/* pointer to input file */
	message[128];

static short 	*adp; 		/*pointer to front of sample file*/
static struct 	stat statbuf;	
       char	*malloc();	/* allocate space */
static double	*c_p,*s_p;	/* pointers to space for sine and cos terms */

static  double 	GETVAL(), sq();
static  void    PUTVAL(), hetdyn(), lpinit(), lowpass(), average();
static  void    output(), output_ph(), filedump(), quit();
static  int     sgn(), u();

#define FIND(MSG)   if (*s == '\0')  \
		        if (!(--argc) || (s = *++argv) && *s == '-')  \
			    quit(MSG);

main(argc,argv)
     int argc;
     char **argv;
{
	int      i, hno, infd, len;
	long     length, nrd, smpspc, bufspc, mgfrspc;
	char     *dsp, *dspace, *mspace;
	double   *begbufs, *endbufs;

	if (!(--argc))	    quit("insufficient arguments");
	do {
	    register char *s = *++argv;
	    if (*s++ == '-')
	        switch (*s++) {
		    case 's':   FIND("no sampling rate")
				sscanf(s,"%f",&sr);
				break;
		    case 'b':   FIND("no begin time")
				sscanf(s,"%f",&beg_time);
				break;
		    case 'd':   FIND("no duration time")
				sscanf(s,"%f",&input_dur);
				break;
		    case 'f':   FIND("no fundamental estimate")
				sscanf(s,"%f",&fund_est);
				break;
		    case 'h':   FIND("no harmonic count")
				sscanf(s,"%d",&hmax);
				break;
		    case 'M':   FIND("no amplitude maximum")
				sscanf(s,"%lf",&m_ampsum);
				break;
		    case 'm':   FIND("no amplitude minimum")
				sscanf(s,"%d",&amp_min);
				break;
		    case 'n':   FIND("no number of output points")
				sscanf(s,"%d",&num_pts);
				break;
		    case 'l':   FIND("no filter cutoff")
				sscanf(s,"%f",&freq_c);
				break;
		    default:   quit("Invalid switch option");
		}
	    else break;
	} while (--argc);

	if (!(argc--))	quit("no input filename");
	infilnam = *argv++;
	if (!(argc--))	quit("no output filename");
	outfilnam = *argv;
	fprintf(stderr,"Input file:  %s\n", infilnam);		
	fprintf(stderr,"Output file:  %s\n", outfilnam);
	if (argc)	quit("too many filenames");

	if (freq_c > 1)
            fprintf (stderr,"Filter cutoff freq. = %f\n",freq_c);

	while (bufsiz < (sr/fund_est + 0.5)) 
	    bufsiz *= 2;
	midbuf = bufsiz/2;
	bufmask = bufsiz - 1;
				
	delta_t = 1./sr;			/* calculate # of samples   */
	t = 1./fund_est;			/* in one fundamental period*/
	windsiz = floor((double)t/delta_t+0.5);	/* of the input waveform    */

	if ((input_dur < 0) || (beg_time < 0))
	    quit("input and begin times cannot be less than zero");
	if (beg_time != 0)
	    total_time = beg_time + input_dur;
	else total_time = input_dur;
		
	if ((infd = open(infilnam,0)) < 0) {	/* open sample file */
	    sprintf(message,"can't open %s",infilnam);
	    quit (message);
	}

	if (beg_time != 0) {
	    long start = (long)(sr*beg_time) * sizeof(short);
	    lseek(infd, start, 0);
	}

	fstat(infd, &statbuf);
	len = statbuf.st_size;
	if (len < sr*total_time*sizeof(short))
	    quit("invalid choice of constraint times");
	
	if (input_dur == 0) {
	    length = len;
	    input_dur = length/(sr * sizeof(short));
	}
	else length = (long)(sr*input_dur) * sizeof(short);

	if ((num_pts > 32767) || (num_pts >= (sr*input_dur - windsiz))) 
	    quit("number of output points is too great");

	auxp = malloc(length); 	/* allocate space for it*/
	if (auxp == NULL) {
	    sprintf(message,"Cannot allocate %d bytes so stopping\n",length);
	    quit(message);
	}
	fprintf(stderr,"file length to be analyzed = %d bytes\n",length);
	
	if((nrd = read(infd,auxp,length)) <= 0) {  /* and read it in */
	    sprintf(message,"Read error on %s\n",infilnam);
	    quit(message);
	}
	smpsin = nrd / sizeof(short);
	outdelta_t = (float)num_pts / (smpsin - windsiz);
	close(infd);				

	smpspc = smpsin * sizeof(double);
	bufspc = bufsiz * sizeof(double);
	
	dsp = dspace = malloc(smpspc * 2 + bufspc * 13);
	if (dsp == NULL) {
	    sprintf(message,"Cannot allocate %d bytes for buffer\n",
	    	    smpspc * 2 + bufspc * 13);
	    quit(message);
	}
	c_p = (double *) dsp;		dsp += smpspc;	/* space for the    */
	s_p = (double *) dsp;		dsp += smpspc;	/* quadrature terms */
	begbufs = (double *) dsp;
	cos_mul = (double *) dsp;	dsp += bufspc;  /* bufs that will be */
	sin_mul = (double *) dsp;	dsp += bufspc;  /* refilled each hno */
	a_term = (double *) dsp;	dsp += bufspc;
	b_term = (double *) dsp;	dsp += bufspc;
	r_ampl = (double *) dsp;	dsp += bufspc;
	ph_av1 = (double *) dsp;	dsp += bufspc;
	ph_av2 = (double *) dsp;	dsp += bufspc;
	ph_av3 = (double *) dsp;	dsp += bufspc;
	r_phase = (double *) dsp;	dsp += bufspc;
	amp_av1 = (double *) dsp;	dsp += bufspc;
	amp_av2 = (double *) dsp;	dsp += bufspc;
	amp_av3 = (double *) dsp;	dsp += bufspc;
	a_avg = (double *) dsp;		dsp += bufspc;
	endbufs = (double *) dsp;

	mgfrspc = num_pts * sizeof(float);
	dsp = mspace = malloc(mgfrspc * hmax * 2);
	if (dsp == NULL) {
	    sprintf(message,"Cannot allocate mspace %d\n",mgfrspc*hmax*2);
	    quit(message);
	}
	for (i = 0; i < hmax; i++) {
	    MAGS[i] = (float *) dsp;	;dsp += mgfrspc;
	    FREQS[i] = (float *) dsp;	;dsp += mgfrspc;
	}
	lpinit();				/* calculate LPF coeffs.  */
	adp = (short *)auxp;		/* point to beg sample data block */
	for (hno = 0; hno < hmax; hno++) {	/* for requested harmonics*/
	    register double *dblp;
	    freq_est += fund_est;		/*   do analysis */
	    cur_est = freq_est;
	    dblp = begbufs;
	    do  *dblp++ = 0.;		/* clear all refilling buffers*/
	    while (dblp < endbufs);
	    max_frq = 0.;
	    max_amp = 0.;

	    fprintf(stderr,"analyzing harmonic #%d\n",hno);
	    fprintf(stderr,"freq est %6.1f,", cur_est);
	    hetdyn(hno);		/* perform actual computation */
	    fprintf(stderr," max found %6.1f, rel amp %6.1f\n", max_frq, max_amp);
	}
	free(dspace);
	filedump();			/* write output to adsyn file */
	free(mspace);
	exit(0);
}

static double GETVAL(inb,smpl)    /* get value at position smpl in array inb */
  register double *inb;
  register long smpl; 
{
	return(*(inb + ((smpl + midbuf) & bufmask)));
}

static void PUTVAL(outb,smpl,value)  /* put value in array outb at postn smpl */
  register long smpl;
  register double *outb, value; 
{
	*(outb + ((smpl + midbuf) & bufmask)) = value;
}

static void hetdyn(hno)                           /* HETERODYNE FILTER */
  int hno;
{
        long 	smplno;
	double 	temp_a, temp_b, tpidelest;
	register double *cos_p, *sin_p, *cos_wp, *sin_wp;
	int   	n, outpnt, lastout = -1;
	register short *ptr;

	jmp_ph = 0;   			/* set initial phase to 0 */
	temp_a = temp_b = 0;
	cos_p = c_p;
	sin_p = s_p;
	tpidelest = TWOPI * cur_est * delta_t;
	for (smplno = 0; smplno < smpsin; smplno++) {
	    double phase = smplno * tpidelest;     /* do all quadrature calcs */
	    ptr = adp + smplno;  		   /* at once and point to it */
	    *cos_p++ = (double)(*ptr) * cos(phase);
	    *sin_p++ = (double)(*ptr) * sin(phase);
	}

	cos_p = cos_wp = c_p;
	sin_p = sin_wp = s_p;
	for (smplno = 0; smplno < smpsin - windsiz; smplno++) {
	    if (smplno == 0 && smpsin >= windsiz) {   /* for first smplno */
	        n = windsiz;
	        do {
		    temp_a += *cos_wp++;     /* sum over windsiz = nsmps in */
		    temp_b += *sin_wp++;     /*    1 period of fund. freq.  */
		} while (--n);
	    }
	    else {	/* if more than 1 fund. per. away from file end */
			/* remove front value and add on new rear value */
			/* to obtain summation term for new sample! */
	        if (smplno <= smpsin - windsiz) {		
		    temp_a += (*cos_wp++ - *cos_p++);  /* _wp = _p + windsiz */
		    temp_b += (*sin_wp++ - *sin_p++);
		}
		else {      
		    skip = 1;
		    temp_a = temp_b = 0;
		}
	    }
	    PUTVAL(cos_mul,smplno,temp_a);     /* store values into buffers*/
	    PUTVAL(sin_mul,smplno,temp_b);
	    if ((freq_c <= 1) || (smplno < 3)) {
	        average(windsiz,cos_mul,a_term,smplno); /* average over previous */
		average(windsiz,sin_mul,b_term,smplno); /* values 1 fund prd ago */
	    }
	    else {
	        lowpass(a_term,cos_mul,smplno);
		lowpass(b_term,sin_mul,smplno);
	    }
	    output_ph(smplno);              /* calculate mag. & phase for sample */
	    if ((outpnt = smplno * outdelta_t) > lastout) {  /* if next out-time */
	        output(smplno, hno, outpnt);                 /*     place in     */
		lastout = outpnt;	                     /*     output array */
	    }
	    if (skip) {
	        skip = 0;       /* quit if no more samples in file */
		break;
	    }
	}
}

static void lpinit() /* lowpass coefficient ititializer */
{	        /* 3rd order butterworth LPF coefficients calculated using */
		/* impulse invariance */
  float costerm,sinterm;
  double omega_c;

        omega_c = freq_c*TWOPI;
	costerm = cos(SQRTOF3*omega_c*delta_t/2);
	sinterm = sin(SQRTOF3*omega_c*delta_t/2);
	x1 = omega_c*delta_t*(exp(-omega_c*delta_t) + exp(-omega_c*delta_t/2)
	    * (-costerm + sinterm/SQRTOF3));
	x2 = omega_c*delta_t*(exp(-omega_c*delta_t) - exp(-3*omega_c*delta_t/2)
	    * (costerm + sinterm/SQRTOF3));
	yA = (-(exp(-omega_c*delta_t) + 2*exp(-omega_c*delta_t/2)*costerm));
	y2 = 2 * exp(-3*omega_c*delta_t/2)*costerm + exp(-omega_c*delta_t);
	y3 = (-exp(-2*omega_c*delta_t));
}

static void lowpass(out,in,smpl)    /* call with x1,x2,yA,y2,y3 initialized  */
  long smpl;		/* calls LPF function */
  double *in, *out; 
{
	PUTVAL(out, smpl, (x1 *
	    GETVAL(in,smpl-1) + x2 * GETVAL(in,smpl-2) -
	    yA * GETVAL(out,smpl-1) - y2 *
	    GETVAL(out,smpl-2) - y3 * GETVAL(out,smpl-3)));
}

static void average(window,in,out,smpl)  /* AVERAGES OVER 'WINDOW' SAMPLES */
			     /* this is actually a comb filter with 'Z' */
  long window,smpl;	     /* transform of (1/w *[1 - Z**-w]/[1 - Z**-1]) */
  register double *in,*out;  /* ie. zeros at all harmonic frequencies except*/
			     /* the current one where the pole cancels it */
{			     
	PUTVAL(out, smpl, (double)(GETVAL(out,smpl-1) +
	    (1/(double)window) * (GETVAL(in,smpl) - GETVAL(in,smpl-window))));
}

                                 /* update phase counter */
static void output_ph(smpl)	/* calculates magnitude and phase components */
  long smpl; 			/* for each samples quadrature components, & */
				/* and unwraps the phase.  A phase difference*/
{				/* is taken to represent the freq. change.   */
double 	delt_temp;	        /* the pairs are then comb filtered.	     */
double 	temp_a;

	if ((temp_a=GETVAL(a_term,smpl)) == 0)
	    new_ph=(-PI/2)*sgn(GETVAL(b_term,smpl));
	else new_ph= -atan(GETVAL(b_term,smpl)/temp_a) - PI*u(-temp_a);

	if (fabs((double)new_ph - old_ph)>PI) 
	    jmp_ph -= TWOPI*sgn(temp_a);

	old_ph = new_ph;
	PUTVAL(r_phase,smpl,old_ph+jmp_ph);
	delt_temp = ((GETVAL(r_phase,smpl) - GETVAL(r_phase,smpl-1))/
		      (TWOPI*delta_t));
	if ((freq_c <= 1) || (smpl < 3)) {
	    PUTVAL(amp_av1,smpl,(float)sqrt(sq(GETVAL(a_term,smpl))
	    	  + sq(GETVAL(b_term,smpl))));
	    average(windsiz,amp_av1,amp_av2,smpl);
	    average(windsiz,amp_av2,amp_av3,smpl);
	    average(windsiz,amp_av3,r_ampl,smpl);
	    PUTVAL(ph_av1,smpl,delt_temp);
	    average(windsiz,ph_av1,ph_av2,smpl);
	    average(windsiz,ph_av2,ph_av3,smpl);
	    average(windsiz,ph_av3,a_avg,smpl);
	}
	else {
	    PUTVAL(r_ampl,smpl,(float)sqrt(sq(GETVAL(a_term,smpl))
	    	  + sq(GETVAL(b_term,smpl))));
	    PUTVAL(a_avg,smpl,delt_temp);
	}
}

static void output(smpl,hno,pnt)    /* output one freq_mag pair */
  long smpl;			/* when called, gets frequency change */
  int hno, pnt;			/* and adds it to current freq. stores*/
{				/* current amp and new freq in arrays */
  double delt_freq;
  float  new_amp, new_freq;

        if (pnt < num_pts) {
	    delt_freq = GETVAL(a_avg,smpl);             /* 0.5 for rounding ? */
	    FREQS[hno][pnt] = new_freq = delt_freq + cur_est;
	    MAGS[hno][pnt] = new_amp = GETVAL(r_ampl,smpl);
	    if (new_freq > max_frq)
	        max_frq = new_freq;
	    if (new_amp > max_amp)
	        max_amp = new_amp;
  /*printf("A=%f\tF=%f\t%lf\n",MAGS[hno][pnt],FREQS[hno][pnt],delt_freq);*/
	}
}

static sgn(num)            /* RETURN SIGN OF ARGUMENT */
  double num; 
{
	if (num >= 0) return(1);
	return(-1);
}

static u(num)              /* UNIT STEP FUNCTION */
  double num; 
{
	if (num > 0) return(1);
	return(0);
}

static double sq(num)     /* RETURNS SQUARE OF ARGUMENT */
  double num; 
{
	return(num*num);
}	

static void quit (msg)
  char	*msg;
{
	fprintf(stderr,"hetro:  %s\n\tanalysis aborted\n",msg);
	exit(1);
}

#define END  32767

static void filedump()     /* WRITE OUTPUT FILE in dump format */
{
        int 	h, pnt, ofd, nbytes;
	double 	scale,x,y;
	short   *(mags[50]), *(freqs[50]), *magout, *frqout;
	double  ampsum, maxampsum = 0.;
	long    lenfil = 0;
	short   *TIME;
	float   timesiz;

	for (h = 0; h < hmax; h++) {
	    mags[h] = (short *)malloc(num_pts * sizeof(short));
	    freqs[h] = (short *)malloc(num_pts * sizeof(short));
	}

	TIME = (short *)malloc(num_pts * sizeof(short));
	timesiz = 1000. * input_dur / num_pts;
	for (pnt = 0; pnt < num_pts; pnt++)
	    TIME[pnt] = (short)(pnt * timesiz);
	
	if ((ofd = creat(outfilnam,0644)) < 0)
	    quit("cannot create output file\n");
		
	for (pnt=0; pnt < num_pts; pnt++) {
	    ampsum = 0.;
	    for (h = 0; h < hmax; h++)
	        ampsum += MAGS[h][pnt];
	    if (ampsum > maxampsum)
		maxampsum = ampsum;
	}
	scale = m_ampsum / maxampsum;
	fprintf(stderr,"scale = %lf\n", scale);

	for (h = 0; h < hmax; h++) {
	    for (pnt = 0; pnt < num_pts; pnt++) {
	        x = MAGS[h][pnt] * scale;
		mags[h][pnt] = (short)(x*u(x));
		y = FREQS[h][pnt];
		freqs[h][pnt] = (short)(y*u(y)); 
	    }
	}

	magout = (short *)malloc((num_pts + 1) * 2 * sizeof(short));
	frqout = (short *)malloc((num_pts + 1) * 2 * sizeof(short));
	for (h = 0; h < hmax; h++) {
	    register short *mp = magout, *fp = frqout;
	    register short *lastmag, *lastfrq, pkamp = 0;
	    int mpoints, fpoints, contig = 0;
	    *mp++ = -1;                      /* set brkpoint type code   */
	    *fp++ = -2;
	    lastmag = mp;
	    lastfrq = fp;
	    for (pnt = 0; pnt < num_pts; pnt++) {
	        register short tim, mag, frq;
		tim = TIME[pnt];
		frq = freqs[h][pnt];
		if ((mag = mags[h][pnt]) > pkamp)
		    pkamp = mag;
		if (mag > amp_min) {
		    if (contig > 1) {        /* if third time this value  */
		        if (mag == *(mp-1) && mag == *(mp-3))
			    mp -= 2;              /* overwrite the second */
		        if (frq == *(fp-1) && frq == *(fp-3))
			    fp -= 2;
		    }
		    *mp++ = tim;
		    *mp++ = mag;
		    *fp++ = tim;
		    *fp++ = frq;
		    lastmag = mp;         /* record last significant seg  */
		    lastfrq = fp;
		    contig++;
		}
		else {
		    if (mp > lastmag) {   /* for non-significant segments */
		        mp = lastmag + 2; /*   only two points necessary  */
			fp = lastfrq + 2; /*   to peg the ends            */
		    }
		    *mp++ = tim;
		    *mp++ = 0;
		    *fp++ = tim;
		    *fp++ = frq;
		    contig = 0;
		}
	    }
	    if (lastmag < mp) {          /* if last signif not last point */
		mp = lastmag + 2;        /*   make it the penultimate mag */
		fp = lastfrq + 2;
	    }
	    *(mp-1) = 0;                 /* force the last mag to zero    */
	    *(fp-1) = *(fp-3);           /*   & zero the freq change      */
	    *mp++ = END;                 /* add the sequence delimiters   */
	    *fp++ = END;
	    mpoints = ((mp - magout) / 2) - 1;
	    nbytes = (mp - magout) * sizeof(short);
	    write(ofd, magout, nbytes);
	    lenfil += nbytes;
	    fpoints = ((fp - frqout) / 2) - 1;
	    nbytes = (fp - frqout) * sizeof(short);
	    write(ofd, frqout, nbytes);
	    lenfil += nbytes;
	    printf("harmonic #%d:\tamp points %d, \tfrq points %d,\tpeakamp %d\n",
		   h,mpoints,fpoints,pkamp);
    	}
	fprintf(stderr,"wrote %ld bytes to %s\n", lenfil, outfilnam);
	close(ofd);
	free((void *)magout);
	free((void *)frqout);
	free((void *)TIME);
	for (h = 0; h < hmax; h++) {
	    free((void *)mags[h]);
	    free((void *)freqs[h]);
	}
}
