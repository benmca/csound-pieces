/*pvfileio.h: header file for PVOC_EX file format */
/* Initial Version 0.1 RWD 25:5:2000 all rights reserved: work in progress! */
#ifndef __PVFILEIO_H_INCLUDED
#define __PVFILEIO_H_INCLUDED

/* #ifndef WORD  */
/* #define WORD unsigned short */
/* #endif */
/* #ifndef DWORD */
/* #define DWORD unsigned long */
/* #endif */



#ifdef _WINDOWS
#include <windows.h>
#endif

#ifndef _WINDOWS
#ifndef WORD
#define WORD unsigned short
#endif
#ifndef DWORD
#define DWORD unsigned long
#endif

typedef struct _GUID
{
    DWORD                       Data1;
    WORD                        Data2;
    WORD                        Data3;
    unsigned char       Data4[8];
} GUID;


typedef struct /*waveformatex */{
    WORD  wFormatTag;
    WORD  nChannels;
    DWORD nSamplesPerSec;
    DWORD nAvgBytesPerSec;
    WORD  nBlockAlign;
    WORD  wBitsPerSample;
    WORD  cbSize;
} WAVEFORMATEX;
#endif


/* NB no support provided for double format (yet) */
typedef enum pvoc_wordformat { PVOC_IEEE_FLOAT, PVOC_IEEE_DOUBLE}pvoc_wordformat;
/* include PVOC_COMPLEX for some parity with SDIF */
typedef enum pvoc_frametype {PVOC_AMP_FREQ=0, PVOC_AMP_PHASE,PVOC_COMPLEX}pvoc_frametype;

/* a minimal list */

typedef enum pvoc_windowtype {PVOC_DEFAULT=0,
                              PVOC_HAMMING,
                              PVOC_HANN,
                              PVOC_KAISER,
                              PVOC_RECT,
                              PVOC_CUSTOM
} pv_wtype;


/* Renderer information: source is presumed to be of this type */
typedef enum pvoc_sampletype {
                              STYPE_16,
                              STYPE_24,
                              STYPE_32,
                              STYPE_IEEE_FLOAT
} pv_stype;



typedef struct pvoc_data {      /* 32 bytes*/
        WORD    wWordFormat;    /* pvoc_wordformat */
        WORD    wAnalFormat;    /* pvoc_frametype */
        WORD    wSourceFormat;  /* WAVE_FORMAT_PCM or WAVE_FORMAT_IEEE_FLOAT*/
        WORD    wWindowType;    /* pvoc_windowtype */
        DWORD   nAnalysisBins;  /* implicit FFT size = (nAnalysisBins-1) * 2*/
        DWORD   dwWinlen;       /* analysis winlen,samples, NB may be <> FFT size */
        DWORD   dwOverlap;      /* samples */
        DWORD   dwFrameAlign;   /* usually nAnalysisBins * 2 * sizeof(float) */
        float   fAnalysisRate;
        float   fWindowParam;   /* default 0.0f unless needed */
} PVOCDATA;


typedef struct {
    WAVEFORMATEX    Format;      /* 18 bytes:  info for renderer as well as for pvoc*/
    union {                      /* 2 bytes*/
        WORD wValidBitsPerSample;        /*  as per standard WAVE_EX: applies to renderer*/
        WORD wSamplesPerBlock;
        WORD wReserved;

    } Samples;
    DWORD           dwChannelMask;      /*  4 bytes : can be used as in standrad WAVE_EX */

    GUID            SubFormat;                  /* 16 bytes*/
} WAVEFORMATEXTENSIBLE, *PWAVEFORMATEXTENSIBLE;


typedef struct {
        WAVEFORMATEXTENSIBLE wxFormat;   /* 40 bytes*/
        DWORD dwVersion;                 /* 4 bytes*/
        DWORD dwDataSize;                /* 4 bytes: sizeof PVOCDATA data block */
        PVOCDATA data;                   /* 32 bytes*/
} WAVEFORMATPVOCEX;                      /* total 80 bytes*/


/* at least VC++ will give 84 for sizeof(WAVEFORMATPVOCEX), so we need our own version*/
#define SIZEOF_FMTPVOCEX (80)
/* for the same reason:*/
#define SIZEOF_WFMTEX (18)
#define PVX_VERSION             (1)
/******* the all-important PVOC GUID

 {8312B9C2-2E6E-11d4-A824-DE5B96C3AB21}

**************/

extern  const GUID KSDATAFORMAT_SUBTYPE_PVOC;


/* pvoc file handling functions */

const char *pvoc_errorstr(void);
int init_pvsys(void);
int pvoc_createfile(const char *,
                    unsigned long,unsigned long, unsigned long,
                    unsigned long,long, pv_stype, pv_wtype,
                    float,float *, DWORD);
int pvoc_openfile(const char *filename,PVOCDATA *data,WAVEFORMATEX *fmt);
int pvoc_closefile(int ofd);
int pvoc_putframes(int ofd,const float *frame,long numframes);
int pvoc_getframes(int ifd,float *frames,unsigned long nframes);
int pvoc_framecount(int ifd);
int pvoc_rewind(int ifd,int skip_first_frame);          /* RWD 14:4:2001 */
int pvsys_release(void);


#endif
