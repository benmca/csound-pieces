
/*******************************************************\
*  dpwelib.h                                            *
*  little header to try and setup STDC for my lib       *
*  dpwe 28may91                                         *
\*******************************************************/

/* WHAT'S HERE:  a bunch of stuff typically needed for my code
                 - but you might not need it all
 Includes (& what they are needed for
   * <stdio.h>  (printf, FILE, stderr, fopen, (size_t))
   * <stdlib.h> or equivalent (malloc, atof, labs, NULL, size_t)
   * <fcntl.h>  (O_RDONLY etc)
   * <string.h> (strcmp, rindex, strrchr)
 Defines
   * READMODE, WRITEMODE for fopen of binary files
   * MYFLTARG for type of floats in prototypes
 Macros
   * MIN, MAX (arguments evaluated twice)
   * PARG -- for optional argument prototypes : void fn PARG((type arg));
 PARG is pretty important, but you could include it explicitly
 in any stand-alone header you wanted to build.
 */

#ifndef _DPWELIB_H_
#define _DPWELIB_H_

#include <stdio.h>

/* Prototype argument wrapper */
/* make fn protos like   void fn PARG((int arg1, char arg2));  */
#ifdef __STDC__
#define PARG(a)         a
#else /* !__STDC__ */
#define PARG(a)         ()
#endif /* __STDC__ */

#ifdef SYMANTEC
#include <stdlib.h>             /* for malloc prototype */
#include <fcntl.h>
#include <string.h>
#define hypot(a,b)      sqrt(pow(a,2.0)+pow(b,2.0))
#define READMODE "rb"
#define WRITEMODE "wb+"

#else  /* Unix, not mac (SYMANTEC) */
#ifndef mac_classic
#include <sys/types.h>
#endif
#define READMODE "rb"
#define WRITEMODE "wb+"

#ifdef NeXT
#include <stdlib.h>

#else  /* ultrix, not NeXT */
#ifdef clipper
#else
# if defined(LATTICE) || defined(WIN32) || defined(SGI)
#  include <stdlib.h>
# else
#  include <unistd.h>
#  ifndef mac_classic
#   include <malloc.h>
#  endif
# endif
#endif

#endif /* NeXT or ultrix */

#ifdef sun
#define  strchr(A,B)    index(A,B)
#define  strrchr(A,B)   rindex(A,B)
#endif /* sun */

#if defined(SYS5) || defined(_MSC_VER)
#include <fcntl.h>
#include <string.h>
#else   /* not SYS5 */
#define  strchr(A,B)    index(A,B)
#define  strrchr(A,B)   rindex(A,B)
#include <strings.h>
#endif  /* SYS5 */

#endif /* mac or Unix */

/* some general utilities to put in a .h file */
#ifndef MAX
#define MAX(a,b)        ((a>b)?(a):(b))
#define MIN(a,b)        ((a>b)?(b):(a))
#endif

#endif /* _DPWELIB_H_ */
