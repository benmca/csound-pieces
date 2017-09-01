/***************************************************************\
*       pvoc.h                                                  *
*       header defs for pvoc FFT files                          *
*       'inspired' by the NeXT SND system                       *
*       01aug90 dpwe                                            *
\***************************************************************/

#ifndef _PVOC_H_
#define _PVOC_H_

#ifndef NULL
#define NULL 0L
#endif /* !NULL */

#ifndef MYFLT
#include "sysdep.h"
#endif

extern char *programName;       /* used by PVDie() - you must provide */

#define PVMAGIC 517730  /* look at it upside-down, esp on a 7-seg display */

#define PVDFLTBYTS 4

typedef struct pvstruct
    {
    long        magic;                  /* magic number to identify */
    long        headBsize;              /* byte offset from start to data */
    long        dataBsize;              /* number of bytes of data */
    long        dataFormat;             /* (int) format specifier */
    MYFLT       samplingRate;           /* of original sample */
    long        channels;               /* (int) mono/stereo etc */
    long        frameSize;              /* size of FFT frames (2^n) */
    long        frameIncr;              /* # new samples each frame */
    long        frameBsize;             /* bytes in each file frame */
    long        frameFormat;            /* (int) how words are org'd in frms */
    MYFLT       minFreq;                /* freq in Hz of lowest bin (exists) */
    MYFLT       maxFreq;                /* freq in Hz of highest (or next) */
    long        freqFormat;             /* (int) flag for log/lin frq */
    char        info[PVDFLTBYTS];       /* extendable byte area */
    } PVSTRUCT;

/* Error codes returned by PVOC file functions */
#define PVE_OK          0       /* no error*/
#define PVE_NOPEN       -1      /* couldn't open file */
#define PVE_NPV         -2      /* not a PVOC file */
#define PVE_MALLOC      -3      /* couldn't allocate memory */
#define PVE_RDERR       -4      /* read error */
#define PVE_WRERR       -5      /* write error */

#define PV_UNK_LEN      -1L     /* flag if dataBsize unknown in hdr */

/* values for dataFormat field */
#define PVSHORT 2       /* 16 bit linear data */
#define PVLONG  4       /* 32 bit linear data */
#define PVMYFLT (4+32)  /* 32 bit float data */
#define PVDOUBLE (8+32) /* 64 bit float data */

/* values for frameFormat field */
#define PVMAG   1       /* magnitude only */
#define PVPHASE 2       /* phase only (!) */
#define PVPOLAR 3       /* mag, phase pairs */
#define PVREAL  4       /* real only */
#define PVIMAG  5       /* imaginary only */
#define PVRECT  6       /* real, imag pairs */
#define PVPVOC  7       /* weirdo mag, phi-dot format for phase vocoder */
#define PVCQ    32      /* ORed with previous to indicate one frame per 8ve */

/* values for freqFormat field */
#define PVLIN   1       /* linearly spaced frequency bins */
#define PVEXP   2       /* exponentially spaced frequency bins */

/* Some handy typedefs (one anyway) */
typedef struct {
    MYFLT mag, pha;
    } cpxpolar;

/********************************/
/* exported function prototypes */
/********************************/

char *PVDataLoc(PVSTRUCT *phdr);        /* return ptr to data block */
int   PVReadHdr(FILE *fil, PVSTRUCT *phdr);       /* pass in PVH */
FILE *PVOpenAllocRdHdr(char *path, PVSTRUCT **phdr); /* allocs PVH */
int   PVReadFile(char *filename, PVSTRUCT **phdr);   /* allocates new PVH+ */
int   PVWriteHdr(FILE *fil, PVSTRUCT *phdr);
FILE *PVOpenWrHdr(char *filename, PVSTRUCT *phdr);
int   PVWriteFile(char *filename, PVSTRUCT *phdr);   /* write out PVH+  */
void  PVCloseWrHdr(FILE *file, PVSTRUCT *phdr);
int   PVAlloc(PVSTRUCT **pphdr, long dataBsize, int dFmt, MYFLT srate,
              int chans, long frSize, long frIncr, long fBsize, int frMode,
              MYFLT minF, MYFLT maxF, int fqMode, int infoBsize);
void  PVFree(PVSTRUCT *phdr);                        /* release PVH +   */
char *PVErrMsg(int err);                /* return string for error code */
void  PVDie(int err, char *msg);        /* exit routine */

#endif /* !_PVOC_H_ */
