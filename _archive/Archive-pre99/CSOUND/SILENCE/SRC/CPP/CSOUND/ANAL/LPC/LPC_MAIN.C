#include <stdio.h>
#include "../../cs.h"
#include "../../ustub.h"

char *scorename = "Lpc";
char *orchname  = "Lpc";

main(int argc, char **argv)
{
    init_getstring(argc, argv);
    lpanal(argc,argv);
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

