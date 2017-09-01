/*                                                             AIFF.H   */

typedef long ID;

typedef struct {
        ID      ckID;
        long    ckSize;
} CkHdr;

typedef struct {
        CkHdr   ckHdr;
        ID      formType;
} FormHdr;

typedef struct {
        CkHdr   ckHdr;                   /* CommonChunk in 2 parts to avoid */
        short   numChannels;             /*   this short rounded up to long */
} CommChunk1;

typedef struct {
        long    numSampleFrames;         /*   ... to accomodate this long   */
        short   sampleSize;
        char    sampleRate[10];          /* 80-bit extended value     */
} CommChunk2;

typedef struct {
        ID      compressionType;
        char    compressionName[256];
} CommChunk3;

/* for AIFF-C/32 float*/

/* #define Float32Name {11, 'F','l','o','a','t',' ','3','2',' ',' ',' '} */
/*RWD 3:2000 handle pad byte correctly in the code! */
#define Float32Name    {8, 'F','l','o','a','t',' ','3','2'}
#define Float32Type    {'F','L','3','2'}           /*RWD 3:2000 NB not used */

typedef struct {
        CkHdr ckHdr;
        long version;
} AifcFverChunk;

typedef struct {
        CkHdr   ckHdr;
        unsigned long   applicationSignature;
        unsigned char   data[1];                        /* variable length array */
} ApplicationSpecificChunk ;


/* end of stuff for AIFF-C 32-float */

typedef short MrkrID;

typedef struct {
        short   playMode;
        MrkrID  beginLoop;
        MrkrID  endLoop;
} Loop;

typedef struct {
        CkHdr   ckHdr;
        char    baseNote;
        char    detune;
        char    lowNote;
        char    highNote;
        char    lowVelocity;
        char    highVelocity;
        short   gain;
        Loop    sustainLoop;
        Loop    releaseLoop;
} InstrChunk;

typedef struct {
        CkHdr   ckHdr;
        long    offset;
        long    blockSize;
} SoundDataHdr;

/* To lump Form, CommonChunk, and SoundData into one,
 *  add FormHdr, CommChunk1, CommChunk2, SoundDataHdr.
 */
