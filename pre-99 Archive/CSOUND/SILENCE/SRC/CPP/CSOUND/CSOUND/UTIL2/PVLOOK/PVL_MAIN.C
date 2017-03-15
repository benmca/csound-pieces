/*******************************************************************/
/* PVLOOK.C by Richard Karpen 1993 */
/*******************************************************************/

#include <stdio.h>
#include <stdlib.h>

int pvlook(int, char **);

int main(int argc, char *argv[])
{
    if ( argc == 1 ) {
      fprintf( stderr,"pvlook is a program which reads a Csound pvanal's pvoc.n "
               "file and outputs frequency and magnitude trajectories for each "
               "of the analysis bins. \n");
      fprintf(stderr, "usage: pvlook [-bb X] [-eb X] [-bf X] [-ef X] [-i X]  "
              "file > output\n" ) ;
      fprintf( stderr,
               "        -bb X  begin at anaysis bin X. Numbered from 1 "
               "[defaults to 1]\n" ) ;
      fprintf( stderr,
               "        -eb X  end at anaysis bin X [defaults to highest]\n" ) ;
      fprintf( stderr,
               "        -bf X  begin at anaysis frame X. Numbered from 1 "
               "[defaults to 1]\n" ) ;
      fprintf( stderr,
               "        -ef X  end at anaysis frame X [defaults to last]\n" ) ;
      fprintf( stderr,
               "        -i X  prints values as integers [defaults to "
               "floating point]\n" ) ;
      exit( -1 ) ;
    }
    return pvlook(argc, argv);
}

#ifndef CWIN
#include <stdarg.h>

void dribble_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vprintf(fmt, a);
    va_end(a);
}

void err_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    vfprintf(stderr, fmt, a);
    va_end(a);
}
#endif

