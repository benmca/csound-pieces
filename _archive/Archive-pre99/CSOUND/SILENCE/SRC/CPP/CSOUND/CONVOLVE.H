#ifndef _CONVOLVE_H_
#define _CONVOLVE_H_

#define CONVOLVE_VERSION_STRING "CONVOLVE VERSION: V1.1\n"

#ifndef NULL
#define NULL 0L
#endif /* !NULL */

#define CVMAGIC 666     /* Evil, eh? */

#define CVDFLTBYTS 4

typedef struct cvstruct
{
    long        magic;                  /* magic number to identify */
    long        headBsize;              /* byte offset from start to data */
    long        dataBsize;              /* total number of bytes of data */
    long        dataFormat;             /* (int) format specifier */
    MYFLT       samplingRate;           /* of original sample */
    long        src_chnls;              /* no. of channels in source */
    long        channel;                /* requested channel(s) */
    long        Hlen;                   /* length of impulse reponse */
    long        Format;                 /* (int) how words are org'd in frm */
    char        info[CVDFLTBYTS];       /* extendable byte area */
} CVSTRUCT;

/* Error codes returned by CONVOLVE file functions */
#define CVE_OK          0       /* no error*/
#define CVE_NOPEN       -1      /* couldn't open file */
#define CVE_NCV         -2      /* not a CONVOLVE file */
#define CVE_MALLOC      -3      /* couldn't allocate memory */
#define CVE_RDERR       -4      /* read error */
#define CVE_WRERR       -5      /* write error */

#define CV_UNK_LEN      -1L     /* flag if dataBsize unknown in hdr */

/* values for dataFormat field */
#define CVMYFLT (4+32)  /* 32 bit float data */

/* values for frameFormat field */
#define CVRECT  1       /* real, imag pairs */

/********************************/
/* exported function prototypes */
/********************************/

#endif /* !_CONVOLVE_H_ */
