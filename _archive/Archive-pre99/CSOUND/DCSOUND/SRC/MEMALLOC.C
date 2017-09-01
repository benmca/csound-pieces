#include "cs.h"				/*		MEMALLOC.C	*/
#undef _DEBUG  /* gab 7 jan 2001 */
/* global here so reachable by all standalones */
MYFLT sstrcod = (MYFLT)SSTRCOD;

/*  #define MEMDEBUG */

#ifdef CWIN 
#include <crtdbg.h>
extern void DisplayMsg(char *, ...);
#endif
typedef struct {
    void *p;
    long  n;
} MEMREC;
static MEMREC* all = NULL;
static int apsize = 0;
static int ap=0;

#ifdef MEMDEBUG
void all_free(void)
{
/*     DisplayMsg("%d blocks to free", ap); */
    while (--ap>=0) {
/*        DisplayMsg("freeing %p(%d)", all[ap].p, all[ap].n); */
        if (all[ap].p != NULL) free(all[ap].p);
        all[ap].p = NULL;
    }
    free(all);
    all = NULL;			/* For safety */
    ap = 0;
    return;
}
#endif

#ifdef RESET
void memRESET(void)
{
#ifdef MEMBEBUG
    all_free();
    ap = 0;
    all = NULL;
#endif
    apsize = 0;
}
#endif

static void memdie(long nbytes)
{
    err_printf(Str(X_989,"memory allocate failure for %d\n"), nbytes);
#ifdef _macintosh
    err_printf(Str(X_1297,"try increasing preferred size setting for the Perf Application\n"));
#endif
    exit(1);
}

 char *
mcalloc(long nbytes)		/* allocate new memory space, cleared to 0 */
{
    char *p;
#ifdef _DEBUG
    if (!_CrtCheckMemory()) {
      printf("Memory error\n");
    }
#endif
    if ((p = (char *)calloc((size_t)nbytes, (size_t)1)) == NULL) {
      if (nbytes==0) return NULL;
      else memdie(nbytes);
    }
#ifdef MEMDEBUG
    if (ap >= apsize) {
      MEMREC *new_all = (MEMREC*)realloc(all, sizeof(MEMREC)*(apsize += 1020));
      if (new_all == NULL) err_printf( "Too many allocs\n"), exit(1);
      all = new_all;
    }
    all[ap].n = nbytes;
    all[ap++].p = p;
#endif
    return(p);
}

 char *
mmalloc(long nbytes)	     /* allocate new memory space, NOT cleared to 0 */
{
    char *p;

#ifdef _DEBUG
    if (!_CrtCheckMemory()) {
      printf("Memory error\n");
    }
#endif
    if ((p = (char *)malloc((size_t)nbytes)) == NULL)
      memdie(nbytes);
#ifdef MEMDEBUG
    if (ap >= apsize) {
      MEMREC *new_all = (MEMREC *)realloc(all, sizeof(MEMREC)*(apsize += 1020));
      if (new_all == NULL) err_printf( "Too many allocs\n"), exit(1);
      all = new_all;
    }
    all[ap].n = nbytes;
    all[ap++].p = p;
#endif
    return(p);
}

 void *
mrealloc(void *old, long nbytes)		/* Packaged realloc */
{
    void *p;

#ifdef _DEBUG
    if (!_CrtCheckMemory()) {
      printf("Memory error\n");
    }
#endif
    if ((p = realloc(old, (size_t)nbytes)) == NULL)
      memdie(nbytes);
#ifdef MEMDEBUG
    if (old != NULL) {
      int oldall = 0;
      while (all[oldall].p != old) {
	oldall++;
	if (oldall > ap) memdie(-nbytes);
      }
/*        err_printf("Changing %p(%d) to %p(%d)\n", old, all[oldall].n, p, nbytes); */
      all[oldall].n = nbytes;
      all[oldall].p = p;
    }
    else {
      if (ap >= apsize) {
	MEMREC *new_all = (MEMREC*)realloc(all, sizeof(MEMREC)*(apsize += 1020));
	if (new_all == NULL) err_printf( "Too many allocs\n"), exit(1);
	all = new_all;
      }
      all[ap].n = nbytes;
      all[ap++].p = p;
    }
#endif
    return(p);
}

void mfree(void *ptr)
{
#ifdef MEMDEBUG
    int i = 0;
    while (all[i].p != ptr) {
      i++;
      if (i>ap) memdie(0);
    }
    /*      err_printf("Freeing %d bytes\n", all[i].n); */
    all[i].p = NULL;
#endif
#ifdef _DEBUG
    if (!_CrtCheckMemory()) {
      printf("Memory error\n");
    }
#endif
    free(ptr);
}

