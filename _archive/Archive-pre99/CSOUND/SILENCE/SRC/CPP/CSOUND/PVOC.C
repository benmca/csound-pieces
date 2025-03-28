/***************************************************************\
*       pvoc.c                                                  *
*       file in/out functions for pvoc FFT files                *
*       'inspired' by the NeXT SND system                       *
*       01aug90 dpwe                                            *
\***************************************************************/

#include "sysdep.h"

#include <stdio.h>
#if defined(mac_classic) || defined(SYMANTEC)
#  include <stdlib.h>           /* for malloc() */
#  define READMODE "rb"
#  define WRITEMODE "wb+"
#else
#  ifdef NeXT
#    include <stdlib.h>
#  else
#    ifdef clipper
#      define SEEK_SET (0)
#    else
#      if !defined(LATTICE) && !defined(__WATCOMC__) && !defined(WIN32) && !defined(__ncc)
#        include <unistd.h>
#        include <malloc.h>
#      else
#        include <stdlib.h>
#      endif /* LATTICE */
#    endif /* clipper */
#  endif /* NeXT */
#  include <sys/types.h>
#  define READMODE "r"
#  define WRITEMODE "w+"
#endif /* SYMANTEC */

#if defined(SYS5) || defined(WIN32)
#include <fcntl.h>
#include <string.h>
#else
#include <strings.h>
#endif

#include "cs.h"
#include "pvoc.h"

/* static function prototypes */
static void cs_itoa(int n, char *s);

/* static variables */
static PVSTRUCT tmphdr;         /* scratch space for pre-load */
static char unspecMsg[] = "Unspecified error : _______";
/* want to 'fill in' at    012345678901234567890... [20..27] */
#define USMINDX 20      /* where to write into above string ^ */

char *PVDataLoc(PVSTRUCT *phdr)
{
    return( ((char *)phdr)+phdr->headBsize );
}

int PVReadHdr(FILE *fil, PVSTRUCT *phdr)
    /* read just the header from a candidate pvoc file */
    /* returns PVE_RDERR if read fails (or file too small)
            or PVE_NPV   if magic number doesn't fit
            or PVE_OK     otherwise                     */
{
    size_t      num;

    phdr->magic = 0L;
    if (fseek(fil, 0L, SEEK_SET) != 0)
        return(PVE_RDERR);
    if ((num = fread((void *)phdr, (size_t)1, (size_t)sizeof(PVSTRUCT), fil))
                    < (size_t)sizeof(PVSTRUCT))
        {
            err_printf( Str(X_420,"PVRdH: wanted %d got %d\n"),
                    (size_t)sizeof(PVSTRUCT), num);
            return(PVE_RDERR);
        }
    if (phdr->magic != PVMAGIC)
        return(PVE_NPV);
    return(PVE_OK);
}

int PVWriteHdr(FILE *fil, PVSTRUCT *phdr)
{
    long        bSize;

    if (phdr->magic != PVMAGIC)
        return PVE_NPV;
    if (fseek(fil, 0L, SEEK_SET) != 0)
        return PVE_RDERR;
    bSize = phdr->headBsize;
    if (fwrite((void *)phdr, (size_t)1, (size_t)bSize, fil) < (size_t)bSize )
        return PVE_WRERR;
    return PVE_OK;
}



FILE *PVOpenAllocRdHdr(char *path, PVSTRUCT **phdr)
    /* read all of candidate header - variable length header */
{
    FILE        *pvf;
    long        hSize, rem;
    int         err = 0;

    if ((pvf = fopen(path,"r"))!= NULL) {
      if (PVReadHdr(pvf, &tmphdr) == PVE_OK ) {
        hSize = tmphdr.headBsize;
        *phdr = (PVSTRUCT *)malloc((size_t)hSize);
        if ((*phdr)!=NULL) {
          **phdr = tmphdr;      /* copies elements of struct ?? */
          rem = hSize - sizeof(PVSTRUCT);
          if (rem > 0)
            fread((void *)((*phdr)+1),(size_t)1,(size_t)rem,pvf);
        }
        else
          err = 1;      /* malloc error */
      }
      else
        err = 1;                /* header read error - e.g. not pv file */
    }
    if (err) {
      fclose(pvf);
      pvf = NULL;
    }
    return(pvf);
}

#ifdef never
int PVReadFile(char *filename, PVSTRUCT **pphdr)
    /* read in the header and all the data */
    /* returns PVE_NOPEN   if cannot open
               PVE_NPV     if not a PVOC file
               PVE_RDERR   if reads fail
               PVE_MALLOC  if cannot get memory
               PVE_OK      otherwise    */
{
    FILE        *fil;
    int         i, err = PVE_OK;
    long        headBsize, dataBsize, count;
    int         infoBsize;
    size_t      num;

    if ((fil = fopen(filename, READMODE)) == NULL)
        return(PVE_NOPEN);
    *pphdr = NULL;
    err = PVReadHdr(fil, &tmphdr);
    if (err == PVE_OK)
        {
        headBsize = tmphdr.headBsize;
        infoBsize = headBsize - sizeof(PVSTRUCT) + PVDFLTBYTS;
        if (infoBsize < 0)
            err = PVE_NPV;
        }
    if (err == PVE_OK)
        {
            dataBsize = tmphdr.dataBsize;
            err = PVAlloc(pphdr, dataBsize, PVMYFLT, (MYFLT)1000,
                          1, 0L, 0L, 0L, PVPOLAR, (MYFLT)0, (MYFLT)1,
                          PVLIN, infoBsize);
        }
    if (err == PVE_OK)
        {
        /* copy over what we already read */
            for (i = 0; i < sizeof(PVSTRUCT)/2; ++i)
                ((short *)*pphdr)[i] = ((short *)&tmphdr)[i];
            /* figure how many bytes expected left */
            if (dataBsize == PV_UNK_LEN)
                count = infoBsize - PVDFLTBYTS;
            else
                count = dataBsize + infoBsize - PVDFLTBYTS;
            if ((num = fread( (void *)((*pphdr)+1),
                              (size_t)1, (size_t)count, fil)) < (size_t)count )
                {
                    err_printf(
                            Str(X_421,"PVRead: wanted %d got %ld\n"), num, count);
                    err = PVE_RDERR;
                }
        }
    if ((err != PVE_OK) && (*pphdr != NULL))
        {
            PVFree(*pphdr);
            *pphdr = NULL;
        }
    fclose(fil);
    return(err);
}
#endif

FILE *PVOpenWrHdr(char *filename, PVSTRUCT *phdr)
{
    FILE        *fil = NULL;

    if (phdr->magic != PVMAGIC)
        return NULL;    /* PVE_NPV   */
    if ((fil = fopen(filename,WRITEMODE)) == NULL)
        return NULL;    /* PVE_NOPEN */
    if (PVWriteHdr(fil, phdr)!= PVE_OK )
        {
            fclose(fil);
            return NULL;        /* PVE_WRERR */
        }
    return fil;
}

int PVWriteFile(char *filename, PVSTRUCT *phdr)
    /* write out a PVOC block in memory to a file
       returns PV_NOPEN  if cannot open file
               PV_NPV    if *phdr isn't magic
               PV_WRERR  if write fails  */
{
    FILE        *fil;
    int         err = PVE_OK;
    long        bSize;
    char        *buf;

    if (phdr->magic != PVMAGIC)
        return(PVE_NPV);
    if ((fil = PVOpenWrHdr(filename, phdr)) == NULL)
        return(PVE_NOPEN);
    if (phdr->dataBsize == PV_UNK_LEN)
        bSize = 0;
    else
        bSize = phdr->dataBsize;
    buf   = (char *)PVDataLoc(phdr);
    if (fwrite(buf, (size_t)1, (size_t)bSize, fil) < (size_t)bSize )
        err = PVE_WRERR;
    fclose(fil);
    return(err);
}

void PVCloseWrHdr(FILE *file, PVSTRUCT *phdr)
{
    long len;

    len = ftell(file);
    if (PVReadHdr(file, &tmphdr) == PVE_OK )    /* only if we can seek back */
        {
            len -= tmphdr.headBsize;
            if (phdr == NULL)
                {
                    tmphdr.dataBsize = len;
                    PVWriteHdr(file, &tmphdr);
                }
            else{
                if (phdr->dataBsize == 0 || phdr->dataBsize == PV_UNK_LEN)
                    phdr->dataBsize = len;
                PVWriteHdr(file, phdr);
            }
        }
}

int PVAlloc(
    PVSTRUCT    **pphdr,        /* returns address of new block */
    long        dataBsize,      /* desired bytesize of datablock */
    int         dataFormat,     /* data format - PVMYFLT etc */
    MYFLT       srate,          /* sampling rate of original in Hz */
    int         chans,          /* channels of original .. ? */
    long        frSize,         /* frame size of analysis */
    long        frIncr,         /* frame increment (hop) of analysis */
    long        fBsize,         /* bytes in each data frame of file */
    int         frMode,         /* format of frames: PVPOLAR, PVPVOC etc */
    MYFLT       minF,           /* frequency of lowest bin */
    MYFLT       maxF,           /* frequency of highest bin */
    int         fqMode,         /* freq. spacing mode - PVLIN / PVLOG */
    int         infoBsize)      /* bytes to allocate in info region */
    /* Allocate memory for a new PVSTRUCT+data block;
       fill in header according to passed in data.
       Returns PVE_MALLOC  (& **pphdr = NULL) if malloc fails
               PVE_OK      otherwise  */
{
    long        bSize, hSize;

    hSize = sizeof(PVSTRUCT) + infoBsize - PVDFLTBYTS;
    if (dataBsize == PV_UNK_LEN)
        bSize = hSize;
    else
        bSize = dataBsize + hSize;
/*      bSize += sizeof(PVSTRUCT) + infoBsize - PVDFLTBYTS; Greg Sullivan<<<<< */
    if (( (*pphdr) = (PVSTRUCT *)malloc((size_t)bSize)) == NULL )
                return(PVE_MALLOC);
    (*pphdr)->magic = PVMAGIC;
    (*pphdr)->headBsize = hSize;
    (*pphdr)->dataBsize = dataBsize;
    (*pphdr)->dataFormat= dataFormat;
    (*pphdr)->samplingRate = srate;
    (*pphdr)->channels  = chans;
    (*pphdr)->frameSize = frSize;
    (*pphdr)->frameIncr = frIncr;
    (*pphdr)->frameBsize= fBsize;
    (*pphdr)->frameFormat = frMode;
    (*pphdr)->minFreq   = minF;
    (*pphdr)->maxFreq   = maxF;
    (*pphdr)->freqFormat= fqMode;
    /* leave info bytes undefined */
    return(PVE_OK);
}

void PVFree(PVSTRUCT *phdr)     /* release a PVOC block */
{
    mfree(phdr);                /* let operating system sort it out */
}

char *PVErrMsg(int err)         /* return string for error code */
    {
    switch(err)
        {
    case PVE_OK:        return(Str(X_360,"No PV error"));
    case PVE_NOPEN:     return(Str(X_212,"Cannot open PV file"));
    case PVE_NPV:       return(Str(X_395,"Object/file not PVOC"));
    case PVE_MALLOC:    return(Str(X_368,"No memory for PVOC"));
    case PVE_RDERR:     return(Str(X_257,"Error reading PVOC file"));
    case PVE_WRERR:     return(Str(X_258,"Error writing PVOC file"));
    default:
        cs_itoa(err, &unspecMsg[USMINDX]);
        return(unspecMsg);
        }
    }

void PVDie(int err, char *msg)  /* what else to do with your error code */
{
    if (msg != NULL && *msg)
        err_printf(Str(X_70,"%s: error: %s (%s)\n"),"pvoc",PVErrMsg(err),msg);
    else
        err_printf(Str(X_71,"%s: error: %s\n"),"pvoc",PVErrMsg(err));
    exit(1);
}

/* itoa from K&R p59 */
static void cs_itoa(int n, char *s)
{
    int     i,j,sign;
    char    c;

    if ((sign = n) < 0)     n = -n;
    i = 0;
    do  {
        s[i++] = n%10 + '0';
    } while( (n /= 10) > 0);
    if (sign < 0)
        s[i++] = '-';
    s[i--] = '\0';
    for (j=0; j<i; ++j,--i)     /* reverse the string */
        { c = s[i]; s[i] = s[j]; s[j] = c; }
}



