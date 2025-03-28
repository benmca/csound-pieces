#include "cs.h"                 /*                              MEMFILES.C      */

static MEMFIL *memfiles = NULL;

extern int    isfullpath(char *);              /* def in filopen.c */
extern char   *sadirpath, *catpath(char *, char *);    /* def in filopen.c */

#if !defined(mills_macintosh) && !defined(SYMANTEC)

static struct stat statbuf;

#if defined DOSGCC
#define RD_OPTS  O_RDONLY | O_BINARY, 0
#elif defined LATTICE
#define RD_OPTS  O_RDONLY | O_RAW, 0
#else
#ifndef O_BINARY
# define O_BINARY (0)
#endif
#define RD_OPTS  O_RDONLY | O_BINARY, 0
#endif

static int LoadFile(            /* simulate the THINK_C LoadFile  */
     char *filnam,              /* reads the entire file into mem */
     int  maconly,              /* is vRefNum on mac */
     char **allocp,
     long *len)
{
    int fd;

    if ((fd = open(filnam, RD_OPTS)) < 0)   /* if cannot open the file */
        return(1);                              /*    return 1            */
#ifdef LATTICE
    stat(filnam, &statbuf);
#else
    fstat(fd, &statbuf);                        /* else get its length */
#endif
    *len = statbuf.st_size;
    *allocp = mmalloc((long)(*len));            /*   alloc as reqd     */
    if (read(fd, *allocp, (int)(*len)) != *len) /*   read file in      */
        dies(Str(X_1149,"read error on %s"),filnam);
    close(fd);                                  /*   and close it      */
    return(0);                                  /*   return 0 for OK   */
}

#endif

MEMFIL *ldmemfile(char *filnam) /* read an entire file into memory and log it */
                                /* share the file with all subsequent requests*/
{                               /* if not fullpath, look in current directory,*/
                                /*   then SADIR (if defined).                 */
                                /* Used by adsyn, pvoc, and lpread            */
    MEMFIL      *mfp, *mfp2, *last = NULL;
    char        *allocp;
    long        len;
    char    *pathnam = filnam;

    mfp = memfiles;
    while (mfp!=NULL) {                                 /* Checking chain */
      if (strcmp(mfp->filename,"") == 0)                /* if empty slot  */
        goto ldopn;                                     /*   go readfile  */
      else if (strcmp(mfp->filename,filnam) == 0)       /* else if match  */
        return(mfp);                                    /*   we have it   */
      last = mfp;
      mfp = mfp->next;
    }
    /*    printf("Extending memfiles\n"); */
    mfp = (MEMFIL*)mcalloc(sizeof(MEMFIL)); /* Add new file description */
    if (mfp == NULL) {
      sprintf(errmsg,Str(X_988,"memfiles: cannot allocate for MEMFIL extention")); /* else overflow */
      goto lderr;
    }
    if (last != NULL) last->next = mfp;
    else              memfiles = mfp;

ldopn:
    if (isfullpath(filnam)) {
        if (LoadFile(filnam,0,&allocp,&len)) {          /* look fullpath */
            sprintf(errmsg,Str(X_636,"cannot load %s"), filnam);
            goto lderr;
        }
    }
    else {
        if (LoadFile(filnam,0,&allocp,&len) == 0)       /* look in cur dir */
            goto done;
        if (sadirpath != NULL) {                        /* if SADIR set,   */
            pathnam = catpath(sadirpath, filnam);       /*   get fullname  */
            for (mfp2 = memfiles; mfp2 != mfp; mfp2 = mfp2->next)/*   chk prv slots */
              if (strcmp(mfp2->filename,pathnam) == 0)
                return(mfp2);                       /*   if match, rtn */
            if (LoadFile(pathnam,0,&allocp,&len)) {     /*   else loadfile */
                sprintf(errmsg,Str(X_636,"cannot load %s"), pathnam);
                goto lderr;
            }
        }
        else {
            sprintf(errmsg,Str(X_637,"cannot load %s, or SADIR undefined"), pathnam);
            goto lderr;
        }
    }
done:
    strcpy(mfp->filename, pathnam);                      /* init the struct */
    mfp->beginp = allocp;
    mfp->endp = allocp + len;
    mfp->length = len;
    printf(Str(X_764,"file %s (%ld bytes) loaded into memory\n"), pathnam,len);
    return(mfp);                                         /* rtn new slotadr */

lderr:
    initerror(errmsg);
    return(NULL);
}

void rlsmemfiles(void) /* clear the memfile array, & free all allocated space */
{
    MEMFIL  *mfp = memfiles, *last = NULL;
    int     memcount = 0;

    while (mfp) {
      MEMFIL *nxt = mfp->next;
      if (strcmp(mfp->filename,"") != 0) {            /* if slot taken    */
        strcpy(mfp->filename,"");                     /*   clr the name & */
        mfree(mfp->beginp);                           /*   free the space */
        if (last) last->next = nxt;                   /*   Splice it out  */
        else memfiles = nxt;
        mfree(mfp);                                   /*   and free space */
        memcount++;
      }
      else
        last = mfp;
      mfp = nxt;
    }
    if (memcount)
      printf(Str(X_36,"%d memfile%s deleted\n"), memcount, (memcount>1)? Str(X_1172,"s"):"");
}

/* RWD 8:2001 (maybe temporary) external memfile support for pvocex */

int find_memfile(const char *fname,MEMFIL **pp_mfp)
{
    MEMFIL *mfp = memfiles;
    while (mfp!=NULL) {
      if (strcmp(mfp->filename,fname) == 0) {
        *pp_mfp = mfp;
        return 1;
      }
      mfp = mfp->next;
    }
    return 0;
}

void add_memfil(MEMFIL *mfp)
{
    if (memfiles==NULL)
      memfiles = mfp;
    else {
      /* cheeky! add it at the top */
      /* umm, I hope this doesn't break anything..... */
      mfp->next = memfiles;
      memfiles = mfp;
    }
}
