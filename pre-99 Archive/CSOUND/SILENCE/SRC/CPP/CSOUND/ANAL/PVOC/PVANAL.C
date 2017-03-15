/************************************************************************/
/*  pva.c	    (after pvanal.c)					*/
/*  Frequency Domain Analysis						*/
/*  Takes a time domain soundfile and converts it into a file of	*/
/*  This version just calculates pure FFT rather than PVOC's phi-dot	*/
/*  More importantly, it reads from disk rather than using so much core */
/*  dpwe  14feb91							*/
/************************************************************************/

#include <stdio.h>

#ifdef THINK_C
#include <tc_main.h>
#include <stdlib.h>
char sfdir_path[] = "Frida:dpwe:sound:";
#else
/* #include <malloc.h> ***************** */
#endif

#include <fft.h>
#include <dsputil.h>
#include <sndf.h>
#include <pvoc.h>

/*** Static function prototypes ***/
#ifdef __STDC__			/* prototype arguments */
static FILE *CreatePVfile(char *pvPath, PVSTRUCT **oPVH, SFSTRUCT *iSnd);
static void takeFFTs(SFSTRUCT *inputSound, PVSTRUCT  *outputPVH,
		     FILE *sndFile, FILE *ftFile);
static void quit(char *msg);
static void PrintBuf(float *buf, int size, char *msg);
static void convertToMono(SFSTRUCT **theSound);
static void CopyShorts(short *sce, int sinc, short *dst, int dinc, 
		       long len, int fwdNbck);
#else				/* no argument prototypes */
static FILE *CreatePVfile();
static void takeFFTs();
static void quit();
static void PrintBuf();
static void convertToMono();
static void CopyShorts();
#endif

#define MINFRMMS	20	/* frame defaults to at least this many ms */
#define MAXFRMPTS	65536
#define MINFRMPTS	16	/* limits on fft size */
#define DFLT_OVLP	4	/* default frame overlap factor */

#ifndef SF_UNK_LEN		/* old sndf stuff */
#define SF_UNK_LEN -1
#endif

/* Global variables */
int	    sfErr;
int	    debug = 0;		/* tweaked inside ! */
char *programName;
/* Static global variables */
static	long frameSize	= 0;	    /* size of FFT frames */
static	long frameIncr	= 0;	    /* step between successive frames */

complex *basis;     /* LUTable for FFT */

#define FIND(MSG)   if (*s == '\0')  \
		        if (!(--argc) || (s = *++argv) && *s == '-')  \
			    quit(MSG);

/* copied from newer dpwelib */
#define SF_BYTE_SIZE_MASK	15	/* SFMT && SIZE_MASK == # bytes */
int SFSampleSizeOf(format)
    int format;		/* return number of bytes per sample in given fmt */
    {
    return(format & SF_BYTE_SIZE_MASK);
    }
#define SHORTMAX 32767
void Short2Float(sb, sinc, fb, finc, n)
    short *sb;
    int sinc;
    float *fb;
    int finc;
    long n;
    {
    register float scale = 1.0/(float)(SHORTMAX+1L);

    fb += n*finc; sb += n*sinc;	/* start at top for in-place copying */
    while(n--)
	{
	fb -= finc; sb -= sinc;
	*fb = scale * (float)*sb;
	}
    }

main(argc,argv)
     int argc;
     char **argv;
{
    SFSTRUCT	*inputSound;
    PVSTRUCT	*outputPVH;
    FILE	*sndFile;
    FILE	*ftFile;
    char    *inputSoundFile = NULL;
    char    *outputPvocFile = NULL;
    int     i, ovlp = 0;		/* number of overlapping windows to have */
    char    errmsg[80];

    programName = argv[0];

    if (!(--argc))	    quit("insufficient arguments");
    do {
	register char *s = *++argv;
	if (*s++ == '-')
	    switch (*s++) {
	    case 's':
	           FIND("no framesize")
		   sscanf(s,"%ld",&frameSize);
		   if (frameSize < MINFRMPTS || frameSize > MAXFRMPTS
		     || !IsPowerOfTwo(frameSize))  {
		       sprintf(errmsg,"pvanal: frameSize must be 2^r and %d..%d\n",
			       MINFRMPTS, MAXFRMPTS);
		       quit(errmsg);
		   }
		   break;
	    case 'w':
		   FIND("no windfact")
		   sscanf(s,"%d",&frameIncr);
		   break;
	    case 'h':
		   FIND("no hopsize")
		   sscanf(s,"%d",&ovlp);
		   break;
	    default:
		   quit("unrecognized switch option");
		   break;
	    }
	else break;
    } while (--argc);

    if (!(argc--)) quit("no input filename");
    inputSoundFile = *argv++;
    if (!(argc--)) quit("no output filename");
    outputPvocFile = *argv;
    if (argc)      quit("too many filenames");

    if (ovlp && frameIncr) quit("pvanal cannot have both -w and -h");

    /* Open sound file */
    if ((sndFile = SFOpenAllocRdHdr(inputSoundFile, &inputSound)) == NULL) {
	printf("pvanal: error opening %s as input soundfile\n",inputSoundFile);
	exit(1);
    }
    /* Abort if unsupported format */
    if(debug)
	printf("Read sound at %lx; magic = %lx, srate = %6.1f\n",
	       inputSound, inputSound->magic, inputSound->samplingRate);
    if (inputSound->format != SFMT_SHORT) {
	fprintf(stderr,"pvanal: unsupported sound format: %d\n",inputSound->format);
	exit(1);
    }

    /* setup frame size etc according to sampling rate */
    if (frameSize == 0) {		/* not specified on command line */
	int	target;
	target = inputSound->samplingRate * (float)MINFRMMS / (float)1000;
	frameSize = MAXFRMPTS;	/* default frame size is > MINFRMMS millisecs */
	while ((frameSize>>1) >= target && frameSize > MINFRMPTS)
	    frameSize >>= 1;	/* divide down until just larger */
    }
    if (ovlp == 0 && frameIncr == 0) {
	ovlp = DFLT_OVLP;	/* default overlap */
	frameIncr = frameSize / ovlp;
    }
    else if (ovlp == 0)
	ovlp = frameSize/frameIncr;
    else
	frameIncr = frameSize/ovlp;

    if (ovlp < 2 || ovlp > 16) {
	fprintf(stderr, "pvanal: %d is a bad window overlap index\n", ovlp);
	exit(1);
    }

    basis = AssignBasis(NULL,frameSize);      /* set up FFT tables */
    if ((ftFile=CreatePVfile(outputPvocFile,&outputPVH,inputSound)) == NULL) {
	fprintf(stderr,"pvanal: error opening %s as output file\n",outputPvocFile);
	exit(1);
    }

    takeFFTs(inputSound, outputPVH, sndFile, ftFile);

    PVCloseWrHdr(ftFile, outputPVH);    /* Close files */
    fclose(sndFile);
}

static void quit(msg)
     char *msg;
{
	fprintf(stderr,"pvanal error: %s\n", msg);
	fprintf(stderr,
	"Usage: pvanal [-n<frmsiz>] [-w<windfact> | -h<hopsize>] inputSoundfile outputFFTfile\n");
	exit(0);
}

static FILE *CreatePVfile(pvPath,ppPVH,inputSound)
    char	    *pvPath;
    PVSTRUCT	    **ppPVH;
    SFSTRUCT	    *inputSound;
    {
    float   rate     = (float)inputSound->samplingRate;
    int     chans    = (int)inputSound->channels;
    int     dsize    = SFSampleSizeOf(inputSound->format);
    long    frameWords;
    int     err;
    FILE    *opFile;

    if(debug)
	printf("Framesiz %ld, framInc %ld\n",frameSize, frameIncr);
    /* If we dealt with frames that hit the ends properly, we'd have */
    /*	 (size/sizeof(short))/frameIncr frames (>= 1/2 inside file) */
    frameWords = frameSize + 2L; /* each frame has Mag & phase for n/2 +1 */
    if(inputSound->dataBsize != SF_UNK_LEN)
	printf("Est. frames %ld\n", 
	       inputSound->dataBsize/(chans*dsize*frameIncr));
    if(chans > 1)
	{
	printf("Sorry: using just 1st channel of %d-channel sound\n", chans);
/*	chans = 1;	/* will write # chans into PV header tho' only mono */
	}
    printf("Output: %d chan%s, %ld frsize, %ld frInc\n",
       chans, (chans==1)?"":"s", frameSize, frameIncr);
    /* Allocate a new PV block */
    if (err = PVAlloc(ppPVH, PV_UNK_LEN, PVFLOAT, rate, chans,
	      frameSize, frameIncr, sizeof(float)*2*(frameSize/2 + 1),
	      PVPVOC, 0.0, rate/2.0, PVLIN, 4))
    { fprintf(stderr, "pvanal: %s\n", PVErrMsg(err));
      exit(1);	}
    opFile = PVOpenWrHdr(pvPath, *ppPVH);
    return opFile;
    }

/*
 * takeFFTs
 *  Go through the (mono) input sound frame by frame and find the
 *  magnitude and phase change for a string of FFT bins
 */
static void takeFFTs(inputSound,outputPVH, sndFile, pvFile)
    SFSTRUCT	    *inputSound;
    PVSTRUCT	    *outputPVH;
    FILE	    *sndFile;
    FILE	    *pvFile;
    {
    long    i,j;
    float   *tmpBuf, *oldInPh, *winBuf;
    float   sampRate = inputSound->samplingRate;
    int     chans    = inputSound->channels;
    int     not_done = 1;
    long    read_in  = -1;
    short   *shBuf;
    long    fsIndepVals = (frameSize/2L)+1L;

    shBuf   = (short *)MakeBuf(chans*frameSize);
    tmpBuf  = MakeBuf(frameSize * 2L);
    oldInPh = MakeBuf(frameSize);
    winBuf  = MakeHalfWin(frameSize,(float)1.0,1);

    /* initially, clear first half of buffer .. */
    for(i = 0; i<(chans*frameSize/2); ++i)	shBuf[i] = 0;
    /* .. and read in second half from file */
    fread(shBuf+frameSize/2, sizeof(short), (chans*frameSize/2), sndFile);

    printf("frame: ");
    for (i = 0; not_done; i++)
	{
	if((i%20)==0)   printf("%ld ", i); fflush(stdout);
	
/*	FloatAndCopy(shBuf,tmpBuf,frameSize);	*/
	Short2Float(shBuf, chans, tmpBuf, 1, frameSize);
	/*  PrintBuf(tmpBuf, frameSize, "floated"); /* */

	CopyShorts(shBuf+(frameIncr*chans),1,shBuf,1,
		   (frameSize-frameIncr)*chans,0);
	if(read_in)		/* if it worked last time */
	    read_in = fread(shBuf+(frameSize-frameIncr)*chans, sizeof(short), 
			    frameIncr*chans, sndFile);
	else
	    not_done = 0;	/* stop after this run-thru */
	/* clear end if not all read in */
	if(read_in < frameIncr)
	    for(j = frameSize-frameIncr+read_in; j<frameSize; ++j)
		shBuf[j] = 0;
	ApplyHalfWin(tmpBuf,winBuf,frameSize);
	/*  PrintBuf(tmpBuf, frameSize, "windo'd"); /* */
	UnpackReals(tmpBuf, frameSize);
	/*  PrintBuf(tmpBuf, frameSize, "unpacked"); /* */
	FFT2real((complex *)tmpBuf, frameSize, 1,basis);
	/*  PrintBuf(tmpBuf, frameSize, "fft'd"); /* */
	Rect2Polar(tmpBuf, fsIndepVals);
	/*  PrintBuf(tmpBuf, frameSize, "toPolar"); /* */
	UnwrapPhase(tmpBuf, fsIndepVals, oldInPh);
	/*  PrintBuf(tmpBuf, frameSize, "unWrapped"); /* */
	PhaseToFrq(tmpBuf, fsIndepVals, (float)frameIncr, (float)sampRate);
	/*  PrintBuf(tmpBuf, frameSize, "toFrq"); /* */
	/* write straight out, just the indep vals */
	fwrite(tmpBuf, 2*sizeof(float), fsIndepVals, pvFile);
	/* debug = 0;	/* */
	}
    printf("%ld\n",i-1);
    }

#define DBGPTS 8
static void PrintBuf(buf,size,msg)
    float *buf;
    int   size;
    char  *msg;
    {
    int   i;

/*    if(!debug)
      return;
 */
    size = DBGPTS;
    printf("%s:",msg);
    for(i=0; i<size; ++i)
    printf("%7.2f ",buf[i]);
    printf("\n");
    }

/* Convert multi-channel sound to mono by tossing extra channels */
static 	void	convertToMono(theSound)
    SFSTRUCT  **theSound;
    {
    SFSTRUCT *newSound;
    short   *oldPtr, *newPtr;
    int     size     = (*theSound)->dataBsize;
    int     format   = (*theSound)->format;
    int     rate     = (*theSound)->samplingRate;
    int     channels = (*theSound)->channels;
    int     newSize, i, j;

    newSize = size/channels;
    if (sfErr = SFAlloc(&newSound, newSize, format, rate, 1, 4))
	{
	printf("pvanal: sound error: %s\n",SFErrMsg(sfErr));
	exit(1);
	}
    oldPtr  = (short *)SFDataLoc(*theSound);
    newPtr  = (short *)SFDataLoc(newSound);
    for (i = 0, j = 0; i < newSize/sizeof(short); i++, j+=channels)
	newPtr[i] = oldPtr[j];
    SFFree(*theSound);
    *theSound = newSound;
    }

static void CopyShorts(sce, sinc, dst, dinc, len, fwdNbck)
    short *sce;
    int sinc;
    short *dst;
    int dinc;
    long len;
    int fwdNbck;
    {
    if(fwdNbck)		/* fwdNbck => copying forward, so start with last */
	{
	sce += len * sinc;
	dst += len * dinc;
	while(len--)
	    {
	    dst -= dinc;	sce -= sinc;
	    *dst = *sce;
	    }
	}
    else		/* copying backward, so start with first */
	while(len--)
	    {
	    *dst = *sce;
	    dst += dinc;	sce += sinc;
	    }
    }

