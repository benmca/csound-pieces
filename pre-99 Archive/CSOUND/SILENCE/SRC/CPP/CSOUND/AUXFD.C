#include "cs.h"                                 /*      AUXFD.C         */

extern  INSDS   *curip;         /* current insds, maintained by insert.c */

static  void auxrecord(AUXCH  *),auxchprint(INSDS *),fdchprint(INSDS *);

void auxalloc(long nbytes, AUXCH *auxchp)
     /* allocate an auxds, or expand an old one */
     /*    call only from init (xxxset) modules */
{
    char *auxp;

    if ((auxp = auxchp->auxp) != NULL)  /* if size change only,      */
      mfree(auxp);                      /*      free the old space   */
    else auxrecord(auxchp);             /* else linkin new auxch blk */
    auxp = mcalloc(nbytes);             /* now alloc the space       */
    auxchp->size = nbytes;              /* update the internal data  */
    auxchp->auxp = auxp;
    auxchp->endp = auxp + nbytes;
    VMSG(auxchprint(curip);)
}

static void auxrecord(AUXCH *auxchp)
     /* put auxch into chain of xp's for this instr */
     /* called only from auxalloc       */
{
    AUXCH       *prvchp, *nxtchp;

    prvchp = &curip->auxch;                     /* from current insds,  */
    while ((nxtchp = prvchp->nxtchp) != NULL)   /* chain through xplocs */
      prvchp = nxtchp;
    prvchp->nxtchp = auxchp;                    /* then add this xploc  */
    auxchp->nxtchp = NULL;                      /* & terminate the chain */
}

void fdrecord(FDCH *fdchp)      /* put fdchp into chain of fd's for this instr */
                                /*      call only from init (xxxset) modules   */
{
    FDCH        *prvchp, *nxtchp;

    prvchp = &curip->fdch;                      /* from current insds,  */
    while ((nxtchp = prvchp->nxtchp) != NULL)   /* chain through fdlocs */
      prvchp = nxtchp;
    prvchp->nxtchp = fdchp;                     /* then add this fdloc  */
    fdchp->nxtchp = NULL;                       /* & terminate the chain */
    VMSG(fdchprint(curip);)
}

void fdclose(FDCH *fdchp)       /* close a file and remove from fd chain */
                                /*  call only from inits, after fdrecord */
{
    FDCH        *prvchp, *nxtchp;

    prvchp = &curip->fdch;                      /* from current insds,  */
    while ((nxtchp = prvchp->nxtchp) != NULL) {     /* chain through fdlocs */
      if (nxtchp == fdchp) {            /*   till find this one */
        close(fdchp->fd);               /* then close the file  */
        fdchp->fd = 0;                  /*   delete the fd &    */
        prvchp->nxtchp = fdchp->nxtchp; /* unlnk from fdchain */
        VMSG(fdchprint(curip);)
          return;
      }
      else prvchp = nxtchp;
    }
    fdchprint(curip);
    sprintf(errmsg,Str(X_759,"fdclose: no record of fd %d"), fdchp->fd);
    die(errmsg);
}

void auxchfree(INSDS *ip)       /* release all xds in instr auxp chain  */
                                /*   called by insert at orcompact      */
{
    AUXCH       *curchp = &ip->auxch;
    char        *auxp;

    VMSG(auxchprint(ip);)
    while ((curchp = curchp->nxtchp) != NULL) { /* for all xp's in chain: */
      if ((auxp = curchp->auxp) == NULL) {
        auxchprint(ip);
        dies(Str(X_608,"auxchfree: illegal auxp %lx in chain"),auxp);
      }
      mfree(auxp);                      /*      free the space  */
      curchp->auxp = NULL;              /*      & delete the pntr */
    }
    ip->auxch.nxtchp = NULL;            /* finally, delete the chain */
    VMSG(auxchprint(ip);)
}

void fdchclose(INSDS *ip)   /* close all files in instr fd chain     */
                            /*   called by insert on deact & expire  */
{                           /*   (also musmon on s-code, & fgens for gen01) */
    FDCH        *curchp = &ip->fdch;
    int fd;

    VMSG(fdchprint(ip);)
      while ((curchp = curchp->nxtchp) != NULL) { /* for all fd's in chain: */
        if ((fd = curchp->fd) <= 2) {
          fdchprint(ip);
          sprintf(errmsg,Str(X_758,"fdclose: illegal fd %d in chain"),fd);
          die(errmsg);
        }
        close(fd);                      /*      close the file  */
        curchp->fd = 0;                 /*      & delete the fd */
      }
      ip->fdch.nxtchp = NULL;           /* finally, delete the chain */
      VMSG(fdchprint(ip);)
}

static void auxchprint(INSDS *ip)   /* print the xp chain for this insds blk */
{
    AUXCH       *curchp = &ip->auxch;

    printf(Str(X_609,"auxlist for instr %d (%lx):\n"), ip->insno, ip);
    while ((curchp = curchp->nxtchp) != NULL)         /* chain through auxlocs */
      printf(Str(X_574,"\tauxch at %lx: size %lx, auxp %lx, endp %lx\n"),
             curchp, curchp->size, curchp->auxp, curchp->endp);
}

static void fdchprint(INSDS *ip)   /* print the fd chain for this insds blk */
{
    FDCH        *curchp = &ip->fdch;

    printf(Str(X_760,"fdlist for instr %d (%lx):"), ip->insno, ip);
    while ((curchp = curchp->nxtchp) != NULL)    /* chain through fdlocs */
      printf(Str(X_12,"  fd %d in %lx"), curchp->fd, curchp);
    putchar('\n'); if (dribble) putc('\n', dribble);
}
