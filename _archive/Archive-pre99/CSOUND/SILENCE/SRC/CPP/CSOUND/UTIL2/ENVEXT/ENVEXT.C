/*******************************************************\
*   envext.c                                            *
*   Extract an envelope file from a sound file          *
*   jpff 11 Dec 1994                                    *
*   mainly lifted from scale and Csound itself          *
\*******************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "../../cs.h"
#include "../../ustub.h"
#include "../../soundio.h"

/* Constants */

#define SHORTMAX 32767.0
#define FIND(MSG)   if (*s == '\0')  \
                        if (!(--argc) || (s = *++argv) && *s == '-') \
                            die(MSG);

/* Static function prototypes */

 static int  SCsndgetset(char *);
 static void FindEnvelope(int);

/* Externs */
 extern long getsndin(int, float *, long, SOUNDIN *);
 static char *outname = NULL;
 static float window = 0.25;

/* Static global variables */
static SOUNDIN     *p;  /* space allocated by SAsndgetset() */

static void usage(char *mesg)
{
    fprintf(stderr, "%s\n", mesg);
    fprintf(stderr,"Usage:\tenvext [-flags] soundfile\n");
    fprintf(stderr, "Legal flags are:\n");
    fprintf(stderr,"-o fnam\tsound output filename\n");
    fprintf(stderr, "-w time\tSize of window\n");
    fprintf(stderr,"flag defaults: envext -onewenv\n");
    exit(1);
}

int
main(int argc, char **argv)
{
    char        *inputfile = NULL;
    int         infd;
    char        c, *s;
    OPARMS      OO;

    memset(&OO, 0, sizeof(OO));

    /* Check arguments */
    if (!(--argc))
        usage("Insufficient arguments");
    do {
        s = *++argv;
        if (*s++ == '-')                      /* read all flags:  */
            while ((c = *s++) != '\0')
                switch(c) {
                case 'o':
                    FIND("no outfilename")
                    outname = s;
                    while (*++s);
                    break;
                case 'w':
                    FIND("No window size");
                    window = (float)atof(s);
                    while (*++s);
                    break;
                default:
                    sprintf(errmsg,"unknown flag -%c", c);
                    usage(errmsg);
                }
        else if (inputfile == NULL) {
            inputfile = --s;
        }
        else usage("too many arguments");
    } while (--argc);

    /* Read sound file */
    if (!(infd = SCsndgetset(inputfile))) {
        fprintf(stderr,"%s: error while opening %s", argv[0], inputfile);
        exit(1);
    }
    FindEnvelope(infd);
    return 0;
}

extern int sndgetset(SOUNDIN*);

static int
SCsndgetset(char *inputfile)
{
    int          infd;
    float        dur;
static  ARGOFFS  argoffs = {0};     /* these for sndgetset */
static  OPTXT    optxt;
static  float    fzero = 0.0;
    char         quotname[80];

    sssfinit();                 /* stand-alone init of SFDIR etc. */
    esr = 0.0;                  /* set esr 0. with no orchestra   */
    optxt.t.outoffs = &argoffs; /* point to dummy OUTOCOUNT       */
    p = (SOUNDIN *) mcalloc((long)sizeof(SOUNDIN));
    p->channel = ALLCHNLS;
    p->h.optext = &optxt;
    p->ifilno = &sstrcod;
    p->iskptim = &fzero;
    p->iformat = &fzero;
    sprintf(quotname,"%c%s%c",'"',inputfile,'"');
    p->STRARG = quotname;
    if ((infd = sndgetset(p)) == 0)            /* open sndfil, do skiptime */
        return(0);
    p->getframes = p->framesrem;
    dur = (float) p->getframes / p->sr;
    printf("enveloping %ld sample frames (%3.1f secs)\n", p->getframes, dur);
    return(infd);
}

static void
FindEnvelope(int infd)
{
    int         chans;
    float       tpersample;
    float       max, min;
    long        maxpos, minpos;
    int         block = 0;
    float *     buffer;
    int         bufferlen;
    long        read_in;
    int         i;
    FILE *      outfile;
    
    outfile = fopen((outname == NULL ? "newenv" : outname), "w");
    bufferlen = (int)(window*(float)p->sr);
    buffer = (float*) malloc(bufferlen*sizeof(float));
    chans = p->nchnls;
    tpersample = 1.0/(float)p->sr;
    fprintf(outfile, "%.3f\t%.3f\n", 0.0, 0.0);
    while ((read_in = getsndin(infd, buffer, bufferlen, p)) > 0) {
        max = 0.0;      maxpos = 0;
        min = 0.0;      minpos = 0;
        for (i=0; i<read_in; i++) {
            if (buffer[i] > max)
                max = buffer[i], maxpos = i;
            if (buffer[i] < min)
                min = buffer[i], minpos = i;
        }
        if (-min > max) max = -min, maxpos = minpos;
        fprintf(outfile, "%.3f\t%.3f\n",
                block*window+(float)maxpos*tpersample, max/SHORTMAX);
        block++;
    }
    close(infd);
    fclose(outfile);
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
