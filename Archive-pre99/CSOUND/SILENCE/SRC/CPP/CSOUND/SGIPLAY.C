/***************************************************************\
*	SGIplay.c						*
*  provide lofi-style device interface for realtime output on	*
*  SGI Iris Indigo hardware					*
*  dpwe 12nov91							*
\***************************************************************/

#include <audio.h>

static ALport playPort = 0L;
static ALport recPort = 0L;
static int pldszstat = 0;
static int rcdszstat = 0;
static int nchans = 0;

#define NUM_PARAMS 1
void play_set(int chans, int dsize, float srate, int scale)
{
    ALconfig config;
    long params[2*NUM_PARAMS];
    
    pldszstat = dsize;	/* remember what it is set to */
    config = ALnewconfig();
    nchans = chans;     /* static global for play_on */
    ALsetchannels(config, (long)chans);
    ALsetwidth(config, (long)dsize);
    params[0] = AL_OUTPUT_RATE;
    params[1] = (long)srate;
    ALsetparams(AL_DEFAULT_DEVICE, params, 2*NUM_PARAMS);
    playPort = ALopenport("SGIplay", "w", config);
    ALfreeconfig(config);
}

void play_on(short *buf, long csize)	/* the number of SAMPLE FRAMES */
{
    ALwritesamps(playPort, buf, csize*nchans);
}

void play_rls(void)
{
    while(ALgetfilled(playPort)>0)
      sginap(1);
    ALcloseport(playPort);
}

void play(	/* called from main place */
    short   *stt,
    short   *end,
    int     chans,
    int     dsize,	/* ignored - assumed = sizeof(short) in what follows */
    float   srate,
    int     scale	/* crude gain - ignored here */
  )
{
    short 	*src;
    int		chunkSamps;
    int		bestSize;

    play_set(chans,dsize,srate,scale);

    src = stt;
    bestSize = 1024*chans; /* (hbBlck/2)*chans; /* hblck/2 is frames per blk */
    while(src < end)		/* samples still to send */
	{
	chunkSamps = end-src;
	if (chunkSamps>bestSize) chunkSamps=bestSize;
	play_on(src,chunkSamps);
	src += (chunkSamps);	/* cs/2 is num of frames */
	}
    play_rls();		/* release for parallel code */
}

void rec_set(int chans, int dsize, float srate, int scale)
{
    ALconfig config;
    long params[2*NUM_PARAMS];
    
    rcdszstat = dsize;	/* remember what it is set to */
    config = ALnewconfig();
    ALsetchannels(config, (long)chans);
    ALsetwidth(config, (long)dsize);
    params[0] = AL_INPUT_RATE;
    params[1] = (long)srate;
    ALsetparams(AL_DEFAULT_DEVICE, params, 2*NUM_PARAMS);
    recPort = ALopenport("SGIrec", "r", config);
    ALfreeconfig(config);
}

void rec_on(short *buf, long csize)	/* the number of SAMPLES */
{
    ALreadsamps(recPort, buf, csize);
}

void rec_rls(void)
{
/*    while(ALgetfilled(recPort)>0)
      sginap(1);    */
    ALcloseport(recPort);
}

void record(	/* called from main place */
    short   *stt,
    short   *end,
    int     chans,
    int     dsize,	/* ignored - assumed = sizeof(short) in what follows */
    float   srate,
    int     scale)	/* crude gain - ignored here */
{
    short 	*src;
    int		chunkSamps;
    int		bestSize;

    rec_set(chans,dsize,srate,scale);

    src = stt;
    bestSize = 1024*chans; /* (hbBlck/2)*chans; /* hblck/2 is frames per blk */
    while(src < end)		/* samples still to send */
	{
	chunkSamps = end-src;
	if (chunkSamps>bestSize) chunkSamps=bestSize;
	rec_on(src,chunkSamps);
	src += (chunkSamps);	/* cs/2 is num of frames */
	}
    rec_rls();		/* release for parallel code */
}

