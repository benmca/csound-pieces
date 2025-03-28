#include "cs.h"                                        /*  FILOPEN.C    */
#include <ctype.h>

#ifdef mills_macintosh
#include <unix.h>
#endif

#define ERRSIZ  200
#define WARNMSG 04

char    errmsg[ERRSIZ];                /* sprintf space for compiling msgs */
char    *ssdirpath, *sfdirpath;
char    *sadirpath, *retfilnam;       /* actual filename returned  */
static  char    *incdirpath;

void sssfinit(void)
{
#if defined(mills_macintosh) || defined(SYMANTEC)
    extern char ssdir_path[], sfdir_path[], sadir_path[], incdir_path[];
    if (ssdir_path != NULL && ssdir_path[0] != '\0')
      ssdirpath = ssdir_path;
    else ssdirpath = NULL;
    if (sfdir_path != NULL && sfdir_path[0] != '\0')
      sfdirpath = sfdir_path;
    else sfdirpath = NULL;
    if (sadir_path != NULL && sadir_path[0] != '\0')
      sadirpath = sadir_path;
    else sadirpath = NULL;
    if (incdir_path != NULL && incdir_path[0] != '\0')
      incdirpath = incdir_path;
    else incdirpath = NULL;
#else
    char        *getenv(const char *);
    ssdirpath = getenv("SSDIR");
    sfdirpath = getenv("SFDIR");
    sadirpath = getenv("SADIR");
    incdirpath = getenv("INCDIR");
#endif
}

int isfullpath(char *name)
{
#if defined(mac_classic) || defined(SYMANTEC)
    if (strchr(name,':') != NULL)      /* if name already a pathname */
#else
      if (
# if defined(DOSGCC) || defined(LATTICE) || defined(__WATCOMC__) || defined(WIN32)
          (isalpha(*name) && *(name+1)==':') ||
# endif
          *name == '/' || *name == '.')
#endif
        return(1);                     /*   return yes  */
      else return(0);
}

char *catpath(char *path, char *name) /*  build a fullpath filename     */
{
    static char fullname[MAXNAME];
    sprintf(fullname,"%s%s%s",path,
#if defined(mac_classic) || defined(SYMANTEC)
            ":",
#else
            "/",
#endif
            name);
    return(fullname);
}

char *unquote(char *name)       /* remove any quotes from a filename   */
                                /* also for THINKC rm ./ & cvt / to :  */
{
    static char newname[MAXNAME];
    char c, *old = name, *nnew = newname;
    do {
      if ((c = *old++) != '"') {
#if defined(mac_classic) || defined(SYMANTEC)
        if (nnew == newname && (c == '.' || c == '/'))
          continue;
        if (c == '/')  c = ':';
#endif
        *nnew++ = c;
      }
    } while (c);
    return(newname);
}

#if defined MSVC
#ifdef SSOUND
/**
* Changed file permissions so that re-entrant versions of Csound
* can overwrite files without need for manual deletion.
* Still doesn't seem to work...
*/
#define RD_OPTS  _O_RDONLY | _O_BINARY
#define WR_OPTS  _O_TRUNC | _O_CREAT | _O_RDWR | _O_BINARY, _S_IREAD | _S_IWRITE
#else
#define RD_OPTS  O_RDONLY | O_BINARY
#define WR_OPTS  O_TRUNC | O_CREAT | O_WRONLY | O_BINARY,_S_IWRITE
#endif
#elif defined(mac_classic) || defined(SYMANTEC) || defined(WIN32)
#define RD_OPTS  O_RDONLY | O_BINARY
#define WR_OPTS  O_TRUNC | O_CREAT | O_WRONLY | O_BINARY
#elif defined DOSGCC
#define RD_OPTS  O_RDONLY | O_BINARY, 0
#define WR_OPTS  O_TRUNC | O_CREAT | O_WRONLY | O_BINARY, 0644
#elif defined LATTICE
#define RD_OPTS  O_RDONLY | O_RAW, 0
#define WR_OPTS  O_TRUNC | O_CREAT | O_WRONLY | O_RAW, 0644
#else
#ifndef O_BINARY
# define O_BINARY (0)
#endif
#define RD_OPTS  O_RDONLY | O_BINARY, 0
#define WR_OPTS  O_TRUNC | O_CREAT | O_WRONLY | O_BINARY, 0644
#endif

int
openin(char *filnam)/* open a file for reading. If not fullpath, will search: */
                   /*  current directory, then SSDIR (if defined), then SFDIR */
{                  /*  returns normal fd, also sets a global return filename  */
                   /*  called by sndgetset (for soundin, gen01), and sfopenin */

    char *pathnam = filnam;
    int  infd;

    if (isfullpath(filnam))
      infd = open(filnam, RD_OPTS);
    else {
      if ((infd = open(filnam, RD_OPTS)) >= 0)
        goto done;
      if (ssdirpath != NULL) {
        pathnam = catpath(ssdirpath, filnam);
        if ((infd = open(pathnam, RD_OPTS)) >= 0)
          goto done;
      }
      if (sfdirpath != NULL) {
        pathnam = catpath(sfdirpath, filnam);
        if ((infd = open(pathnam, RD_OPTS)) >= 0)
          goto done;
      }
      dies(Str(X_642,"cannot open %s.  Not in cur dir, SSDIR or SFDIR as defined"),
           filnam);
    }
 done:
    retfilnam = pathnam;
    return(infd);
}

int openout(            /* open a file for writing.  If not fullpath, then  */
  char *filnam,         /*   dirtyp 1 will put it in the current directory  */
  int  dirtyp)          /*   dirtyp 2 will put it in SFDIR                  */
{                       /*   dirtyp 3 will put it in SFDIR else in cur dir  */
                        /* returns normal fd, & sets global return filename */
                        /* called by anals,dumpf (typ 1), sfopenout (typ 3) */

    char *pathnam = filnam;
    int  outfd;

    if (isfullpath(filnam))
      outfd = open(filnam, WR_OPTS);
    else switch(dirtyp) {
    case 3:
    case 2:
      if (sfdirpath != NULL) {
        pathnam = catpath(sfdirpath, filnam);
        outfd = open(pathnam, WR_OPTS);
        break;
      }
      else if (dirtyp == 2)
        dies(Str(X_641,"cannot open %s, SFDIR undefined"), filnam);
      else printf(Str(X_449,"SFDIR undefined.  using current directory\n"));
    case 1:
      outfd = open(filnam, WR_OPTS);
      break;
    default: die(Str(X_1096,"openout: illegal dirtyp"));
    }
    retfilnam = pathnam;
    return(outfd);
}

#ifdef mills_macintosh
int openoutforin(       /* open a file for writing.  If not fullpath, then  */
  char *filnam,         /*   dirtyp 1 will put it in the current directory  */
  int  dirtyp)          /*   dirtyp 2 will put it in SFDIR                  */
{                       /*   dirtyp 3 will put it in SFDIR else in cur dir  */
                        /* returns normal fd, & sets global return filename */
                        /* called by anals,dumpf (typ 1), sfopenout (typ 3) */

    char *pathnam = filnam;
    int  outfd;

    if (isfullpath(filnam))
      outfd = open(filnam, RD_OPTS);
    else switch(dirtyp) {
    case 3:
    case 2:
      if (sfdirpath != NULL) {
        pathnam = catpath(sfdirpath, filnam);
        outfd = open(pathnam, RD_OPTS);
        break;
      }
      else if (dirtyp == 2)
        dies(Str(X_641,"cannot open %s, SFDIR undefined"), filnam);
      else printf(Str(X_449,"SFDIR undefined.  using current directory\n"));
    case 1:
      outfd = open(filnam, RD_OPTS);
      break;
    default: die(Str(X_1096,"openout: illegal dirtyp"));
    }
    retfilnam = pathnam;
    return(outfd);
}

int openrdwr(           /* open a file for writing.  If not fullpath, then  */
  char *filnam,         /*   dirtyp 1 will put it in the current directory  */
  int  dirtyp)          /*   dirtyp 2 will put it in SFDIR                  */
{                       /*   dirtyp 3 will put it in SFDIR else in cur dir  */
                        /* returns normal fd, & sets global return filename */
                        /* called by anals,dumpf (typ 1), sfopenout (typ 3) */

    char *pathnam = filnam;
    int  outfd;

    if (isfullpath(filnam))
      outfd = open(filnam, O_RDWR);
    else switch(dirtyp) {
    case 3:
    case 2:
      if (sfdirpath != NULL) {
        pathnam = catpath(sfdirpath, filnam);
        outfd = open(pathnam, O_RDWR);
        break;
      }
      else if (dirtyp == 2)
        dies(Str(X_638,"cannot open %s for read/write, SFDIR undefined"),
             filnam);
      else printf(Str(X_449,"SFDIR undefined.  using current directory\n"));
    case 1:
      outfd = open(filnam, O_RDWR);
      break;
    default: die(Str(X_1097,"openwr: illegal dirtyp"));
    }
    retfilnam = pathnam;
    return(outfd);
}
#endif/*  mills_macintosh */

/* fopenin() - patches fopen calls, searching file in current dir, INCDIR,
   SSDIR or SFDIR, in that order. Modelled on openin() above. (re May 2000) */

FILE *fopenin(char *filnam)
{
    char *pathnam = filnam;
    FILE *infil;

    if (isfullpath(filnam))
      infil = fopen(filnam, "r");
    else {
      /* Check current directory */
      if ((infil = fopen(filnam, "r")) != NULL)
        goto done;
      /* ... INCDIR directory */
      if (incdirpath != NULL) {
        pathnam = catpath(incdirpath, filnam);
        if ((infil = fopen(pathnam, "r")) != NULL)
          goto done;
      }
      /* ... SSDIR */
      if (ssdirpath != NULL) {
        pathnam = catpath(ssdirpath, filnam);
        if ((infil = fopen(pathnam, "r")) != NULL)
          goto done;
      }
      /* ... and SFDIR */
      if (sfdirpath != NULL) {
        pathnam = catpath(sfdirpath, filnam);
        if ((infil = fopen(pathnam, "r")) != NULL)
          goto done;
      }
      dies(
        Str(X_1528,
            "cannot open %s.  Not in cur dir, INCDIR SSDIR or SFDIR as defined"),
        filnam);
    }
    /* (global) retfilnam can be copied by caller if found name is needed */
 done:
    retfilnam = pathnam;
    return (infil);
}

void warning(char *s)
{
    if (O.msglevel & WARNMSG)
      printf(Str(X_526,"WARNING: %s\n"), s);
}

void dies(char *s, char *t)
{
    sprintf(errmsg,s,t);
    die(errmsg);
}

#if (!defined(mills_macintosh) && !defined(GAB_RT))
void die(char *s)
{
#ifdef SSOUND
	/**
	* Try to throw the message as an exception 
	* instead of just dying, for re-entrant versions of Csound.
	*/
	csoundThrowMessage(s);
#else
    printf("%s\n",s);
    if (dribble) fflush(dribble); /* Should not be necessary */
    exit(1);
#endif
}
#endif
