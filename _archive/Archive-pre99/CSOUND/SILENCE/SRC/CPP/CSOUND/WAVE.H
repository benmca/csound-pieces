/*                                                             WAVE.H   */
/* RWD.2.98: changed to deal with variable length headers */
struct wav_head {
  long  magic;                  /* 'RIFF' */
  long  len0;                   /* Chunk size = len + 8 + 16 + 12 */
  long  magic1;                 /* 'WAVE' */
  long  magic2;                 /* 'fmt ' */
  long  len;                    /* length of samples */
  short format;                 /* 1 is PCM, rest not known */
  short nchns;                  /* Number of chanels */
  long  rate;                   /* sampling frequency */
  long  aver;                   /* Average bytes/sec !! */
  short nBlockAlign;            /* (rate*nch +7)/8 */
  short size;                   /* size of each sample (8,16,32) */
};

/*  long        magic3;         */              /* 'data' */
/*  long        datasize;       */      /* data chunk size */

typedef struct SampleLoop {
  long  dwIdentifier;          /* link to 'cue' or 'adtl' entry */
  long  dwType;                /* 0=fwd 1=alt 2=rev 3=... */
  long  dwStart;               /* counting from 0 */
  long  dwEnd;
  long  dwFraction;            /* 0xFFFFFFFF = 1 sample point */
  long  dwPlayCount;           /* 0=infinite */
} SampleLoop;

typedef struct
{
  long  chunkID;
  long  chunkSize;

  long  dwManufacturer;        /* assigned by MMA */
  long  dwProduct;             /* assigned by manufacturer */
  long  dwSamplePeriod;        /* nanoseconds  */
  long  dwMIDIUnityNote;
  long  dwMIDIPitchFraction;   /* 0xFFFFFFFF = +100 cents  */
  long  dwSMPTEFormat;         /* fps (or 29 for 30-drop) */
  long  dwSMPTEOffset;         /* 0xhhmmssff */
  long  cSampleLoops;          /* number of loops      */
  long  cbSamplerData;         /* bytes manufacturer specific data */
  struct SampleLoop Loops[1];
} SMPL;

static char     RIFF_ID[4] = {'R','I','F','F'};
static char     WAVE_ID[4] = {'W','A','V','E'};
static char     FMT_ID[4]  = {'f','m','t',' '};
static char     DATA_ID[4] = {'d','a','t','a'};
static char     FACT_ID[4] = {'f','a','c','t'};
static char     SMPL_ID[4] = {'s','m','p','l'};
static char     PEAK_ID[4] = {'P','E','A','K'};
#define WAVHDRSIZ (sizeof(struct wav_head))

