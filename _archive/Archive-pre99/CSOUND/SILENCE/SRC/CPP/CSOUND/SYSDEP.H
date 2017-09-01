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

#if defined(macintosh)
# define mac_classic /* All Mac Compiles Before OSX, including Carbon */
# define mills_macintosh /* DEFINE THIS to COMPILE the Mills"Perf"Version */
# include <stdlib.h>
# include <unistd.h>       /* for open() etc protos on mac */
# include <stat.h>
# define  SYS5
# define  SFDIGDES
# define  WINDOWS
# define  RTAUDIO
/*# define  SFIRCAM*/
# define  u_char  unsigned char
# define  u_short unsigned short
# define  u_int   unsigned int
# define  u_long  unsigned long
# define  O_NDELAY (0)
# ifdef mills_macintosh
#  define exit(x) die("");
# endif
#elif defined(SYMANTEC)   
# include <stdlib.h>
# include <unix.h>       /* for open() etc protos on mac */
# define  SYS5
# define  SFDIGDES
# define  WINDOWS       /* with winmac.c */
# define  u_char  unsigned char
# define  u_short unsigned short
# define  u_int   unsigned int
# define  u_long  unsigned long
extern  off_t lseek(int, off_t, int);
/*    extern  long    tell(); */
#else
#  ifdef LATTICE
#  define  u_char  unsigned char
#  define  u_short unsigned short
#  define  u_int   unsigned int
#  define  u_long  unsigned long
#  include <fcntl.h>
#  include <sys/types.h>
#  else
#     ifdef __WATCOMC__
#      define  u_char  unsigned char
#      define  u_short unsigned short
#      define  u_int   unsigned int
#      define  u_long  unsigned long
#      define  O_NDELAY (0)
#      include <io.h>
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
#         ifndef _MSC_VER
#     include <sys/file.h>
#         endif
#    endif
#   endif
# include <sys/stat.h>
#endif
#ifdef AMIGA
#  define tell(x) lseek(x,(off_t)0L,SEEK_CUR)
#endif

#ifdef SYS5
# ifndef index
# define  index(A,B) strchr(A,B)
# define  tell(x) lseek(x,(off_t)0L,SEEK_CUR)
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
