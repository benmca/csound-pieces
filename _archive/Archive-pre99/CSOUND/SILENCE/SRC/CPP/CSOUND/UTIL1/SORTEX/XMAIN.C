#include "../../sort.h"                                    /*   XMAIN.C  */
#include <string.h>
#include <stdlib.h>

FILE* dribble = NULL;

void dies(char *s, char *t)
{
    char errmsg[200];
    sprintf(errmsg,s,t);
    printf("%s\n",errmsg);
    if (dribble) fflush(dribble); /* Should not be necessary */
    exit(1);
}

char        *scorename = NULL;
long natlong(long lval)             /* coerce a bigendian long into a natural long */
{
    unsigned char benchar[4];
    unsigned char *p = benchar;
    long natlong;

    *(long *)benchar = lval;
    natlong = *p++;
    natlong <<= 8;
    natlong |= *p++;
    natlong <<= 8;
    natlong |= *p++;
    natlong <<= 8;
    natlong |= *p;
    return(natlong);
}

int main(int ac, char **av)         /* stdio stub for standalone extract */
                                    /*     first opens the control xfile */
{
    FILE *xfp;
    init_getstring(0, NULL);
    ac--;  av++;
    if (ac != 1) {
      fprintf(stderr,"usage: extract xfile <in >out\n");
      exit(1);
    }
    if ((xfp = fopen(*av,"r")) == NULL) {
      fprintf(stderr,"extract: can't open %s\n", *av);
      exit(1);
    }
    return(scxtract(stdin,stdout,xfp));
}

char name_full[256];		/* Remember name used */
FILE *fopen_path(char *name, char *basename, char *env, char *mode)
{
    FILE *ff;
    char *p;
				/* First try to open name given */
    strcpy(name_full, name);
    if (ff = fopen(name_full, mode)) return ff;
				/* if that fails try in base directory */
    strcpy(name_full, basename);
#if defined(__MWERKS) || defined(SYMANTECS)
    p = strrchr(name_full, ':');
#else
    p = strrchr(name_full, '/');
    if (p==NULL) p = strrchr(name_full, '\\');
#endif
    if (p != NULL) {
      strcpy(p+1, name);
      if (ff = fopen(name_full, mode)) return ff;
				/* Of us env argument */
    }
    if (p = getenv(env))
#if defined(__MWERKS) || defined(SYMANTECS)
      sprintf(name_full, "%s:$s", p, name);
#else
      sprintf(name_full, "%s/$s", p, name);
#endif
    if (ff = fopen(name_full, mode)) return ff; 
    return NULL;		/* or give up */
}

void synterr(char *s)
{
  printf("error:  %s\n",s);
}


#ifndef CWIN
#include <stdarg.h>

void dribble_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vprintf(fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
    if (dribble != NULL) {
      va_start(a, fmt);
      vfprintf(dribble, fmt, a);
      va_end(a);
    }
}
#endif
