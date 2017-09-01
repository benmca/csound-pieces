#ifdef __STDC__                                              /* SYSDEP.H */
#  include <stdlib.h>
#  include <stdio.h>
#endif

				/* Experiment with doubles or floats */
#ifndef __FL_DEF
#ifndef MYFLT
# define MYFLT float
# define FL(x) x##f
#else
# define FL(x) x
#endif
#define __FL_DEF
#endif

#ifdef macintosh
# include <stdlib.h>
# include <unix.h>       /* for open() etc protos on mac */
# define  SYS5
# define  SFDIGDES
# define  WINDOWS       /* with winmac.c */
# define  RTAUDIO
/*### define  SFIRCAM */
# define  u_char  unsigned char
# define  u_short unsigned short
# define  u_int   unsigned int
# define  u_long  unsigned long
#  define  O_NDELAY (0)
#define exit(x) die("");
#elif defined(SYMANTEC)                                         /* SYSDEP.H */
# include <stdlib.h>
# include <unix.h>       /* for open() etc protos on mac */
# define  SYS5
# define  SFDIGDES
# define  WINDOWS       /* with winmac.c */
# define  u_char  unsigned char
# define  u_short unsigned short
# define  u_int   unsigned int
# define  u_long  unsigned long
  extern  long    lseek();
/*    extern  long    tell(); */
#else
# ifdef __ZPC__
#  define  u_char  unsigned char
#  define  u_short unsigned short
#  define  u_int   unsigned int
#  define  u_long  unsigned long
#  define  tell(x) lseek(x,0L,1)
#  define  O_NDELAY (0)
# else
#  ifdef LATTICE
#  define  u_char  unsigned char
#  define  u_short unsigned short
#  define  u_int   unsigned int
#  define  u_long  unsigned long
#  include <fcntl.h>
#  include <sys/types.h>
#  else
#   ifdef __BORLANDC__
#     define  u_char  unsigned char
#     define  u_short unsigned short
#     define  u_int   unsigned int
#     define  u_long  unsigned long
#     define  O_NDELAY (0)
#     include <io.h>
#   else
#     ifdef __WATCOMC__
#     define  u_char  unsigned char
#     define  u_short unsigned short
#     define  u_int   unsigned int
#     define  u_long  unsigned long
#     define  O_NDELAY (0)
#     include <io.h>
#     else
#     ifdef WIN32
#      define  u_char  unsigned char
#      define  u_short unsigned short
#      define  u_int   unsigned int
#      define  u_long  unsigned long
#      define  O_NDELAY (0)
#      include <io.h>
#      include <fcntl.h>
#     else
#      ifdef DOSGCC
#       define O_NDELAY (0)
#      endif
#      include <sys/types.h>
#     endif
/*  RWD for WIN32 on VC++ */
#	  ifndef _MSC_VER
#     include <sys/file.h>
#	  endif
#    endif
#   endif
#  endif
# endif
# include <sys/stat.h>
#endif
#ifdef AMIGA
#  define tell(x) lseek(x,0L,1)
#endif

#ifdef SYS5
# ifndef index
# define  index(A,B) strchr(A,B)
# define  tell(x) lseek(x,0L,1)
# endif
# include <fcntl.h>
# include <string.h>
#else
# ifdef WIN32
#  include <string.h>
#  include <fcntl.h>
# else
#  include <strings.h>
# endif
#endif

#ifdef __BEOS__
# include <unistd.h>
# if !defined(O_NDELAY) && !defined(CSSVINTERFACE_H)
#  error "Please use Makefile.be to build the BeOS version of Csound."
# endif
#endif
