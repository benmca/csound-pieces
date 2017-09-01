                                                         /* PROTOTYP.H */
#ifndef __PROTO_H
#include <stdlib.h>
#define IGN(X) X = X

#ifdef __cplusplus
extern "C" {
#endif

int hetro(int argc, char **argv), lpanal(int argc, char **argv);
int pvanal(int argc, char **argv), cvanal(int argc, char **argv);
int sndinfo(int argc, char **argv), pvlook(int argc, char **argv);
void cscorinit(void), cscore(void);
char *mmalloc(long), *mcalloc(long);
void *mrealloc(void*, long), mfree(void*);
#ifdef CWIN
void all_free(void);
#endif
void auxalloc(long, AUXCH *), auxchfree(INSDS *);
void fdrecord(FDCH *), fdclose(FDCH *), fdchclose(INSDS *);
void warning(char *), initerror(char *), perferror(char *);
void synterr(char *), synterrp(char *, char *);
void die(char *), dies(char *, char *);
void putop(TEXT *), putstrg(char *);
void rdorchfile(void), otran(void), resetouts(void);
char argtyp(char *);
TEXT *getoptxt(int *);
int  express(char *), getopnum(char *), pnum(char *), lgexist(char *);
void oload(void);
void cpsoctinit(void), reverbinit(void);
void dispinit(void);
void sssfinit(void);
int  init0(void);
INSDS *instance(int);
int  isfullpath(char *), dispexit(void);
char *catpath(char *, char *);
int  openin(char *), openout(char *, int);
void scsort(FILE *, FILE *);
int  scxtract(FILE *, FILE *, FILE *);
int  rdscor(EVTBLK *);
int  musmon(void);
void RTLineset(void);
int  sensLine(void);
void fgens(EVTBLK *);
FUNC *ftnp2find(MYFLT *), *ftfindp(MYFLT *argp);
void beep(void), rlsmemfiles(void);
double modf(double, double *);  /* not included in math.h */
MYFLT intpow(MYFLT, long);
void list_opcodes(int);
                                           /* common globals */
extern int   inerrcnt, synterrcnt, perferrcnt;

extern int   odebug;   /* orch control flag: */

extern MYFLT esr, ekr, ensmps, hfkprd, onedsr, onedkr;    /* set in oload */
extern int   ksmps, nchnls;
extern MYFLT /*pi, twopi,*/ tpidsr, mpidsr, mtpdsr;
extern MYFLT sicvt, kicvt, fmaxlen, dv32768, sstrcod;
extern char  strmsg[], errmsg[], *unquote(char *);

extern OPARMS O;
#ifdef __cplusplus
}
#endif

#define __PROTO_H
#endif
