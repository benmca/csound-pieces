#include "cs.h"                 /*                      RDORCH.C        */
#include <ctype.h>
#include <string.h>

#ifdef DOSGCC
#include <unistd.h>
#endif
#ifdef sol
#include <unistd.h>
#endif
#ifdef sun
#define   SEEK_SET        0
#define   SEEK_CUR        1
#define   SEEK_END        2
#endif

#define LINMAX    1000
#define LENMAX    100L
#define GRPMAX    VARGMAX
#define LBLMAX    100
#define STRSPACE  4000

typedef struct  {
        int     reqline;
        char    *label;
} LBLREQ;

#define MARGS   (3)
typedef struct MACRO {          /* To store active macros */
  char          *name;          /* Use is by name */
  int           acnt;           /* Count of arguments */
  char          *body;          /* The text of the macro */
  struct MACRO  *next;          /* Chain of active macros */
  int           margs;          /* ammount of space for args */
  char          *arg[MARGS];    /* With these arguments */
} MACRO;

static  MACRO   *macros = NULL;

static  long    lenmax = LENMAX;        /* Length of input line buffer  */
static  char    **linadr;               /* adr of each line in text     */
static  short   *srclin;                /* text no. of expanded lines   */
static  int     curline;                /* current line being examined  */
static  char    *collectbuf = NULL;     /* splitline collect buffer     */
static  char    **group;                /* splitline local storage      */
static  char    **grpsav;               /* copy of above                */
static  long    grpmax = GRPMAX;        /* Size of group structure      */
static  int     opgrpno;                /* grpno identified as opcode   */
static  int     linopnum;               /* data for opcode in this line */
static  char    *linopcod;
static  int     linlabels;              /* count of labels this line    */
static  LBLREQ  *lblreq;
static  int     lblmax;
static  int     lblcnt;
static  int     lgprevdef = 0;
static  int     opnum;                  /* opcod data carriers          */
static  char    *opcod;                 /*  (line or subline)           */
static  ARGLST  *nxtarglist, *nullist;
static  struct spchain {
    char                *sspace; /* Base of this section */
    char                *ssplim; /* Last char available */
    char                *sspnxt; /* Last char used */
    struct spchain      *next;   /* Next pool */
} sp_chain;
static  long    space_size;
static  char    *strsav(char *s);
static  void    intyperr(int n, char tfound, char expect), printgroups(int count);
static  int     isopcod(char *s);
static  void    lblrequest(char *s), lblfound(char *s);
static  void    lblclear(void), lblchk(void);

int     synterrcnt = 0;

static  FILE    *fp;
struct in_stack {
  short string;
  short args;
  char  *body;
  FILE  *file;
  MACRO *mac;
  short line;
};

static struct in_stack *inputs = NULL, *str;
static int input_size = 0, input_cnt = 0;
static int pop = 0;             /* Number of macros to pop */
static int ingappop = 1;
static void lexerr(char*);
static int linepos = -1;

extern   OENTRY *opcodlst;

void orchRESET(void)
{
    int i;
    mfree(linadr); linadr=NULL;
    mfree(srclin); srclin=NULL;
    curline    = 0;
    group      = NULL;
    grpsav     = NULL;
    collectbuf = NULL;
    lenmax     = LENMAX;
    grpmax     = GRPMAX;
    opgrpno    = 0;
    linopnum   = 0;
    linopcod   = NULL;
    linlabels  = 0;
    lgprevdef  = 0;
    synterrcnt = 0;
    lblcnt     = 0;
    opnum      = 0;
    opcod      = NULL;
    if (nxtarglist!=NULL) {
      mfree(nxtarglist); nxtarglist = NULL;
    }
    if (nullist!=NULL) {
      mfree(nullist); nullist = NULL;
    }
    space_size =0;
    while (macros) {
      mfree(macros->body);
      mfree(macros->name);
      for (i=0; i<macros->acnt; i++) mfree(macros->arg[i]);
      macros = macros->next;
    }
    pop        = 0;
    ingappop   = 1;
    linepos    = -1;
}

ARGLST* copy_arglist(ARGLST *old)
{
    size_t n = sizeof(ARGLST)+ old->count*sizeof(char*)-sizeof(char*);
    ARGLST *nn = (ARGLST*)mmalloc(n);
/*     printf("copy_arglist: %d args\n", old->count); */
    memcpy(nn, old, n);
    memset(old, 0, n);
    return nn;
}

                                /* Two functions to read/unread chracters from
                                 * a stack of file and macro inputs */

#define ungetorchar(c) if (str->string) str->body--; else ungetc(c, str->file)

void skiporchar(void)
{
    int c;
top:
    if (str->string) {
      c= *str->body++;
      if (c == '\n' || c == '\r') {
        str->line++; linepos = -1;
        return;
      }
      if (c == '\0') {
        pop += str->args;
        str--; input_cnt--;
        linepos = -1;
        return;
      }
    }
    else {
      c = getc(str->file);
      if (c == '\n' || c == '\r' || c == 26) {    /* MS-DOS spare ^Z */
        str->line++; linepos = -1;
        return;
      }
      if (c == EOF) {
        if (str == &inputs[0]) {
          linepos = -1;
          return;
        }
        fclose(str->file);
        mfree(str->body);
        str--; input_cnt--;
        str->line++; linepos = -1;
        return;
      }
    }
    linepos++;
    goto top;
}

int getorchar(void)
{
    int c;
top:
    if (str->string) {
      c= *str->body++;
      if (c == '\0') {
        pop += str->args;
        str--; input_cnt--;
        goto top;
      }
    }
    else {
      c = getc(str->file);
      if (c == 26) goto top;    /* MS-DOS spare ^Z */
      if (c == EOF) {
        if (str == &inputs[0]) return EOF;
        fclose(str->file);
        mfree(str->body);
        str--; input_cnt--; goto top;
      }
    }
    if (c == '\r') c = '\n';
    if (c == '\n') {
      str->line++; linepos = -1;
    }
    else linepos++;
    if (ingappop && pop)
      do {
        MACRO *nn = macros->next;
        int i;
#ifdef MACDEBUG
        printf("popping %s\n", macros->name);
#endif
        mfree(macros->name); mfree(macros->body);
        for (i=0; i<macros->acnt; i++)
          mfree(macros->arg[i]);
        mfree(macros);
        macros = nn;
        pop--;
      } while (pop);
    return c;
}

char name_full[256];            /* Remember name used */
FILE *fopen_path(char *name, char *basename, char *env, char *mode)
{
    FILE *ff;
    char *p;
                                /* First try to open name given */
    strcpy(name_full, name);
    if (ff = fopen(name_full, mode)) return ff;
                                /* if that fails try in base directory */
    strcpy(name_full, basename);
#if defined(mac_classic) || defined(SYMANTECS)
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
#if defined(mac_classic) || defined(SYMANTECS)
      sprintf(name_full, "%s:%s", p, name);
#else
      sprintf(name_full, "%s/%s", p, name);
#endif
    if (ff = fopen(name_full, mode)) return ff;
    return NULL;                /* or give up */
}

static  long    ORCHSIZ;

void rdorchfile(void)           /* read entire orch file into txt space */
{
    int c, lincnt;
    int srccnt;
    char        *cp, *endspace, *ortext;
    extern  char    *orchname;
    int linmax = LINMAX;        /* Maximum number of lines      */

    printf(Str(X_1098,"orch compiler:\n"));
    if ((fp = fopen(orchname,"r")) == NULL)
      dies(Str(X_645,"cannot open orch file %s"),orchname);
    if (fseek(fp, 0L, SEEK_END) != 0)
      dies(Str(X_626,"cannot find end of file %s"),orchname);
    if ((ORCHSIZ = ftell(fp)) <= 0)
      dies(Str(X_786,"ftell error on %s"),orchname);
    rewind(fp);
    inputs = (struct in_stack*)malloc(20*sizeof(struct in_stack));
    input_size = 20;
    input_cnt = 0;
    str = inputs;
    str->string = 0;
    str->file = fp;
    str->body = orchname;
    ortext = mmalloc(ORCHSIZ + 1);              /* alloc mem spaces */
    linadr = (char **) mmalloc((long)(LINMAX+1)*sizeof(char **));
    srclin = (short *) mmalloc((long)(LINMAX+1)*sizeof(short));
    sp_chain.sspace = mmalloc(space_size = (long)STRSPACE);
    sp_chain.sspnxt = sp_chain.sspace;
    sp_chain.ssplim = sp_chain.sspace + STRSPACE;
    sp_chain.next = NULL;
    srclin[1] = 1;
    lincnt = srccnt = 1;
    cp = linadr[1] = ortext;
    endspace = ortext + ORCHSIZ + 1;
    strsav("sr");
    group = (char **)mcalloc((GRPMAX+1)*sizeof(char*));
    grpsav= (char **)mcalloc((GRPMAX+1)*sizeof(char*));
    lblreq = (LBLREQ*)mcalloc(LBLMAX*sizeof(LBLREQ));
    lblmax = LBLMAX;

    while ((c = getorchar()) != EOF) {  /* read entire orch file  */
      if (cp == endspace-1) {           /* Must extend */
        char * orold = ortext;
        int i;
        ortext = mrealloc(ortext, ORCHSIZ += 400);
        endspace = ortext + ORCHSIZ + 1;
/*          printf("Orchestra Text extended to %d\n", ORCHSIZ); */
        if (ortext != orold) {
          int adj = ortext - orold;
          for (i=1; i<=lincnt; i++)
            linadr[i] += adj; /* Relocate */
          cp += adj;
        }
      }
      *cp++ = c;
      if (c == ';') {
        skiporchar();
        c = '\n';
      }
      if (c == '\\') {  /* Continuation?? */
        while ((c = getorchar())==' ' || c == '\t'); /* Ignore spaces */
        if (c==';') {   /* Comments get skipped */
          skiporchar();
          c = '\n';
        }
        if (c == '\n') {
          cp--;         /* Ignore newline */
          srccnt++;                       /*      record a fakeline */
/*            srclin[++lincnt] = 0; */
/*            linadr[lincnt] = cp; */
        }
        else  {
          *(cp-1) = c;
        }
      }
      else if (c == '\n') {                     /* at each new line */
        char *lp = linadr[lincnt];
        while ((c = *lp) == ' ' || c == '\t')
          lp++;
        if (*lp != '\n' && *lp != ';') {
          curline = lincnt - 1;
        }
        srccnt++;
        if (++lincnt >= linmax) {
/*                printf("too many lines...increasing\n"); */
          linmax += 100;
          linadr =
            (char **) mrealloc(linadr, (long)(linmax+1)*sizeof(char *));
          srclin =
            (short *) mrealloc(srclin, (long)(linmax+1)*sizeof(short));
        }
        srclin[lincnt] = srccnt;
        linadr[lincnt] = cp;            /* record the adrs */
      }
      else if (c == '#' && linepos==0) {        /* Start Macro definition */
        /* also deal with #include here */
        char mname[100];
        int i=0;
        int arg = 0;
        int size = 100;
        MACRO *mm = (MACRO*)mmalloc(sizeof(MACRO));
        mm->margs = MARGS;  /* Initial size */
        cp--;
        while (isspace(c = getorchar()));
        if (c=='d') {
          if ((c = getorchar())!='e' || (c = getorchar())!='f' ||
              (c = getorchar())!='i' || (c = getorchar())!='n' ||
              (c = getorchar())!='e') lexerr(Str(X_390,"Not #define"));
          while (isspace(c = getorchar()));
          do {
            mname[i++] = c;
          } while (isalpha(c = getorchar())|| (i!=0 && (isdigit(c)||c=='_')));
          mname[i] = '\0';
          printf(Str(X_341,"Macro definition for %s\n"), mname);
          mm->name = mmalloc(i+1);
          strcpy(mm->name, mname);
          if (c == '(') {       /* arguments */
#ifdef MACDEBUG
            printf("M-arguments: ");
#endif
            do {
              while (isspace(c = getorchar()));
              i = 0;
              while (isalpha(c)|| (i!=0 && (isdigit(c)||c=='_'))) {
                mname[i++] = c;
                c = getorchar();
              }
              mname[i] = '\0';
#ifdef MACDEBUG
              printf("%s\t", mname);
#endif
              mm->arg[arg] = mmalloc(i+1);
              strcpy(mm->arg[arg++], mname);
              if (arg>=mm->margs) {
                mm = (MACRO*)realloc(mm, sizeof(MACRO)+mm->margs*sizeof(char*));
                mm->margs += MARGS;
/*                    lexerr(Str(X_496,"Too many arguments to macro")); */
              }
              while (isspace(c)) c = getorchar();
            } while (c=='\'' || c=='#');
            if (c!=')') printf(Str(X_984,"macro error\n"));
          }
          mm->acnt = arg;
          i = 0;
          while ((c = getorchar())!= '#'); /* Skip to next # */
          mm->body = (char*)mmalloc(100);
          while ((c = getorchar())!= '#') {
            mm->body[i++] = c;
            if (i>= size) mm->body = mrealloc(mm->body, size += 100);
            if (c=='\\') {      /* allow escaped # */
              mm->body[i++] = c = getorchar();
              if (i>= size) mm->body = mrealloc(mm->body, size += 100);
            }
            if (c == '\n') {
              srccnt++;
            }
          }
          mm->body[i]='\0';
          mm->next = macros;
          macros = mm;
#ifdef MACDEBUG
          printf("Macro %s with %d arguments defined\n",
                 mm->name, mm->acnt);
#endif
          c = ' ';
        }
        else if (c=='i') {
          int delim;
          if ((c = getorchar())!='n' || (c = getorchar())!='c' ||
              (c = getorchar())!='l' || (c = getorchar())!='u' ||
              (c = getorchar())!='d' || (c = getorchar())!='e')
            lexerr(Str(X_391,"Not #include"));
          while (isspace(c = getorchar()));
          delim = c;
          i = 0;
          while ((c=getorchar())!=delim) mname[i++] = c;
          mname[i]='\0';
          while ((c=getorchar())!='\n');
#ifdef MACDEBUG
          printf("#include \"%s\"\n", mname);
#endif
          input_cnt++;  
          if (input_cnt>=input_size) {
            input_size += 20;
            inputs = realloc(inputs, input_size*sizeof(struct in_stack));
            if (inputs == NULL) {
              die(Str(X_1692, "No space for include files"));
            }
          }
          str++;
          str->string = 0;
          str->file = fopen_path(mname, orchname, "INCDIR", "r");
          if (str->file==0) {
            printf(Str(X_209,"Cannot open #include'd file %s\n"), mname);
            str--; input_cnt--;
          }
          else {
            str->body = (char*)mmalloc(strlen(name_full)+1);
            strcpy(str->body, name_full);       /* Remember name */
            str->line = 1;
            linepos = -1;
          }
        }
        else if (c=='u') {
          if ((c = getorchar())!='n' || (c = getorchar())!='d' ||
              (c = getorchar())!='e' || (c = getorchar())!='f')
            lexerr(Str(X_392,"Not #undef"));
          while (isspace(c = getorchar()));
          do {
            mname[i++] = c;
          } while (isalpha(c = getorchar())|| (i!=0 && (isdigit(c)||c=='_')));
          mname[i] = '\0';
          printf(Str(X_982,"macro %s undefined\n"), mname);
          if (strcmp(mname, macros->name)==0) {
            MACRO *mm=macros->next;
            mfree(macros->name); mfree(macros->body);
            for (i=0; i<macros->acnt; i++)
              mfree(macros->arg[i]);
            mfree(macros); macros = mm;
          }
          else {
            MACRO *mm = macros;
            MACRO *nn = mm->next;
            while (strcmp(mname, nn->name)!=0) {
              mm = nn; nn = nn->next;
              if (nn==NULL) lexerr(Str(X_505,"Undefining undefined macro"));
            }
            mfree(nn->name); mfree(nn->body);
            for (i=0; i<nn->acnt; i++)
              mfree(nn->arg[i]);
            mm->next = nn->next; mfree(nn);
          }
          while (c!='\n') c = getorchar(); /* ignore rest of line */
        }
        else {
          err_printf(Str(X_533,"Warning: Unknown # option"));
          ungetorchar(c);
          c = '#';
        }
      }
      else if (c == '$') {
        char name[100];
        int i=0;
        int j;
        MACRO *mm, *mm_save = NULL;
        ingappop = 0;
        while (isalpha(c=getorchar())|| (i!=0 && (isdigit(c)||c=='_'))) {
          name[i++] = c; name[i] = '\0';
          mm = macros;
          while (mm != NULL) {  /* Find the definition */
            if (!(strcmp (name, mm->name))) break;
            mm = mm->next;
          }
          if (mm != NULL) mm_save = mm; /* found a name */
        }
        mm = mm_save;
        if (strlen (mm->name) != (unsigned)i) {
/*              fprintf (stderr, "Warning: $%s matches macro name $%s\n", */
/*                              name, mm->name); */
          do {
            ungetorchar (c);
            c = name[--i];
          } while ((unsigned)i >= strlen (mm->name));
          c = getorchar (); i++;
        }
        if (c!='.') { ungetorchar(c); }
        if (mm==NULL) {
          lexerr(Str(X_504,"Undefined macro"));
          continue;
        }
#ifdef MACDEBUG
        printf("Found macro %s required %d arguments\n",
               mm->name, mm->acnt);
#endif
        /* Should bind arguments here */
        /* How do I recognise entities?? */
        if (mm->acnt) {
          if ((c=getorchar())!='(') lexerr(Str(X_474,"Syntax error in macro call"));
          for (j=0; j<mm->acnt; j++) {
            char term = (j==mm->acnt-1 ? ')' : '\'');
            char trm1 = (j==mm->acnt-1 ? ')' : '#'); /* Compatability */
            MACRO* nn = (MACRO*) mmalloc(sizeof(MACRO));
            int size = 100;
            nn->name = mmalloc(strlen(mm->arg[j])+1);
            strcpy(nn->name, mm->arg[j]);
#ifdef MACDEBUG
            printf("defining argument %s ", nn->name);
#endif
            i = 0;
            nn->body = (char*)mmalloc(100);
            while ((c = getorchar())!= term && c!=trm1) {
              if (i>98) {
                printf(Str(X_347,"Missing argument terminator\n%.98s"), nn->body);
                exit(1);
              }
              nn->body[i++] = c;
              if (i>= size) nn->body = mrealloc(nn->body, size += 100);
              if (c == '\n') {
                srccnt++;
              }
            }
            nn->body[i]='\0';
#ifdef MACDEBUG
            printf("as...#%s#\n", nn->body);
#endif
            nn->acnt = 0;       /* No arguments for arguments */
            nn->next = macros;
            macros = nn;
          }
        }
        cp--;           /* Ignore $ sign */
        input_cnt++;  
        if (input_cnt>=input_size) {
          input_size += 20;
          inputs = realloc(inputs, input_size*sizeof(struct in_stack));
          if (inputs == NULL) {
            die(Str(X_1692, "No space for include files"));
          }
          }
        str++;
        str->string = 1; str->body = mm->body; str->args = mm->acnt;
        str->mac = mm;
        str->line = 1;
        ingappop = 1;
      }
    }
    if (cp >= endspace) {
      die(Str(X_766,"file too large for ortext space")); /* Ought to extend */
    }
    if (*(cp-1) != '\n')                /* if no final NL,      */
      *cp++ = '\n';                     /*    add one           */
    else --lincnt;
    linadr[lincnt+1] = NULL;            /* terminate the adrs list */
    printf(Str(X_34,"%d lines read\n"),lincnt);
    fclose(fp);                         /* close the file       */
    curline = 0;                        /*   & reset to line 1  */
    while (macros) {                    /* Clear all macros */
      int i;
      mfree(macros->body);
      mfree(macros->name);
      for (i=0; i<macros->acnt; i++) mfree(macros->arg[i]);
      macros = macros->next;
    }
    nullist = (ARGLST *) mmalloc(sizeof(ARGLST)); /* nullist is a count only  */
    nullist->count = 0;
    nxtarglist = (ARGLST *) mmalloc(sizeof(ARGLST) + 200*sizeof(char*));
}

static
int splitline(void)     /* split next orch line into atomic groups */
{                       /* cnt labels this line, and set opgrpno where found */
    int grpcnt, prvif, logical, condassgn, parens;
    int c, collecting;
    char        *cp, *lp, *grpp=NULL;

    if (collectbuf == NULL)
      collectbuf = mcalloc((long)lenmax);
 nxtlin:
    if ((lp = linadr[++curline]) == NULL)       /* point at next line   */
      return(0);
    VMSG( printf(Str(X_321,"LINE %d:\n"),curline); )
    linlabels = opgrpno = 0;
    grpcnt = prvif = logical = condassgn = parens = collecting = 0;
    cp = collectbuf;
    while ((c = *lp++) != '\n') {               /* for all chars this line:  */
      if (cp - collectbuf >= lenmax) {
        int i;
        char *nn = mcalloc(lenmax+LENMAX);
        memcpy(nn, collectbuf, lenmax); /* Copy data */
        if (nn==NULL) die(Str(X_966,"line LENMAX exceeded"));
        cp = (cp - collectbuf) + nn;    /* Adjust pointer  */
        for (i=0; i<grpcnt; i++) group[i] += (nn-collectbuf);
        mfree(collectbuf);              /* Need to correct grp vector */
        collectbuf = nn;
        lenmax += LENMAX;
/*              err_printf( "SplitLine buffer extended to %d\n", lenmax); */
/*              die(X_966,"line LENMAX exceeded"); */
      }
      if (c == '"') {                     /* quoted string:    */
        if (collecting) {
          synterrp(lp-1,Str(X_1326,"unexpected quote character"));
          continue;
        }
        if (grpcnt >= grpmax) {
          group = (char **)mrealloc(group,((grpmax+=GRPMAX)+1)*sizeof(char*));
          grpsav=(char **) mrealloc(grpsav,(grpmax+1)*sizeof(char*));
          if (group==NULL || grpsav==NULL) die(Str(X_290,"GRPMAX overflow"));
        }
        grpp = group[grpcnt++] = cp;
        *cp++ = c;                      /*  cpy to nxt quote */
        while ((*cp++ = c = *lp++) != '"' && c != '\n');
        if (c == '\n')
          synterrp(lp-1,Str(X_1348,"unmatched quotes"));
        collecting = 1;                 /*   & resume chking */
        continue;
      }
      if (c == ';') {
        while ((c = *lp++) != '\n');    /* comments:  gobble */
        break;                          /*    & exit linloop */
      }
      if (c == '/' && *lp == '*') { /* C Style comments */
        char *ll, *eol;
        ll= strstr(lp++, "*/");
      nxtl:   /* printf("%%%%%%%%%%at nxtl %.50s\n", lp); */
        eol = strchr(lp, '\n');
        if (eol!=NULL && eol<ll) {
          /*                 printf("%%%%%%%%%%newline in comment\n"); */
          lp = linadr[++curline]; 
          ll= strstr(lp, "*/");
          goto nxtl;
        }
        if (ll == NULL) {
          synterrp(lp-2, Str(X_514,"Unmatched comment"));
          lp = eol+1; break;
        }
        lp = ll+2;
        continue;
      }
      if (c == ' ' || c == '\t') {      /* spaces, tabs:     */
        if (!opgrpno && collecting) {   /*  those before args */
          *cp++ = '\0';                 /*  can be delimitrs  */
          collecting = 0;
          if (strcmp(grpp,"if") == 0) { /* of if opcod */
            strcpy(grpp,"cggoto");      /* (replace) */
            cp = grpp + 7;
            prvif++;
          }
          if (isopcod(grpp))            /*   or maybe others */
            opgrpno = grpcnt;
        }
        continue;                       /* now discard blanks*/
      }
      if (c == ':' && collecting && grpcnt == linlabels+1) {
        linlabels++;                    /* colon in 1st grps */
        *cp++ = '\0';                   /*  is also delimitr */
        collecting = 0;                 /*  (do not copy it) */
        continue;
      }
      if (c == '=' && !opgrpno) {       /* assign befor args */
        if (collecting)                 /* can be a delimitr */
          *cp++ = '\0';
        grpp = group[grpcnt++] = cp;    /* is itslf an opcod */
        *cp++ = c;
        *cp++ = '\0';
        isopcod(grpp);
        opgrpno = grpcnt;
        collecting = 0;                 /* & self-delimiting */
        continue;
      }
      if (c == ',') {                   /* comma:        */
        if (!collecting)
          synterrp(lp-1,Str(X_997,"misplaced comma"));
        if (parens) {
          synterrp(lp-2,Str(X_1315,"unbalanced parens"));
          parens = 0;
        }
        *cp++ = '\0';                   /*  terminate strng */
        collecting = logical = condassgn = 0;
        continue;
      }
      if (prvif && collecting) {        /* for prev "if":    */
        if (strncmp(lp-1,"goto",4) == 0) {/* if found "goto" */
          *cp++ = '\0';                 /*      delimit cond */
          lp += 3;                      /*      & step over  */
          prvif = collecting = 0;
          continue;
        }
        else if ((c == 'i' || c == 'k') /*  if preced i or k */
                 && strncmp(lp,"goto",4) == 0) { /*  before "goto"  */
          *(group[opgrpno-1]+1) = c;    /*     modify cggoto */
          isopcod(group[opgrpno-1]);
          *cp++ = '\0';                 /*     then delimit  */
          lp += 4;                      /*      etc          */
          prvif = collecting = 0;
          continue;
        }
      }
      if (!collecting++) {              /* remainder are     */
        if (grpcnt >= grpmax) {         /* collectable chars */
          group = (char**)mcalloc(((grpmax+=GRPMAX)+1)*sizeof(char*));
          grpsav =(char**)mcalloc((grpmax+1)*sizeof(char*));
          if (group==NULL || grpsav==NULL)
            die(Str(X_290,"GRPMAX overflow"));
        }
        grpp = group[grpcnt++] = cp;
      }
      if ((c == '>' || c == '<' || c == '=' ||
                c == '!' || c == '&' || c == '|')
               && (prvif || parens) )
        logical++;
      else if ( isalnum(c)       /* establish validity */
           || c == '+' || c == '-'
           || c == '*' || c == '/'
           || c == '%' || c == '^'
           || c == '¬' || c == '#' /* Bit operations */
           || c == '.' || c == '_'
           /* allow uppercases and underscore in variables */
           )
        ;
      else if (c == '(')
        parens++;                   /* and monitor function */
      else if (c == ')')
        --parens;
      else if (c == '?' && logical )
        condassgn++;
      else if (c == ':' && condassgn)
        ;
      else {
        sprintf(errmsg,Str(X_841,"illegal character %c"),c);
        synterrp(lp-1,errmsg);
      }
      *cp++ = c;                        /* then collect the char   */
    }                                   /*  and loop for next      */

    if (!grpcnt)                        /* if line was trivial,    */
      goto nxtlin;                      /*      try another        */
    if (collecting) {                   /* if still collecting,    */
      *cp = '\0';                       /*      terminate          */
      if (!opgrpno)                     /*      & chk for opcod    */
        if (isopcod(grpp))
          opgrpno = grpcnt;
    }
    if (parens)                         /* check balanced parens   */
      synterrp(lp-1,Str(X_1315,"unbalanced parens"));
    if (grpcnt > linlabels && !opgrpno) {       /* if no full line opcod,  */
      synterr(Str(X_1042,"no legal opcode"));   /*      complain &         */
      goto nxtlin;                              /*      try another        */
    }
    linopnum = opnum;                   /* else save full line ops */
    linopcod = opcod;
    VMSG( printgroups(grpcnt); )
    if (!POLL_EVENTS()) exit(1);        /* on Mac/win, allow system events */
    return(grpcnt);
}

static  void    lblclear(void), lblrequest(char *);
static  void    lblfound(char *), lblchk(void);

TEXT *getoptxt(int *init)       /* get opcod and args from current line */
{                               /*      returns pntr to a TEXT struct   */
    static      short   grpcnt = 0, nxtest = 1;
    static      short   xprtstno = 0, polcnt = 0;
    static      short   instrblk = 0, instrcnt = 0;
    static      TEXT    optext; /* struct to be passed back to caller   */

    extern      char    *tokenstring;
    extern      POLISH  *polish;
    extern      int     tran_nchnls;
    TEXT        *tp;
    char        c, d, str[20], *s, argtyp(char *);
    int         nn, incnt, outcnt;

#ifdef RESET
    if (*init) {
      grpcnt   = 0;
      nxtest   = 1;
      xprtstno = 0;
      polcnt   = 0;
      instrblk = 0;
      instrcnt = 0;
      *init    = 0;
      memset(&optext,0,sizeof(TEXT));
    }
#endif
 tstnxt:
    tp = &optext;
    if (nxtest >= grpcnt) {             /* if done with prevline, */
      if (!(grpcnt = splitline()))      /*    attack next line    */
        return((TEXT *)0);              /*    (else we're done)   */
      for (nn=0; nn<grpcnt; nn++)       /*    save the group pntrs */
        grpsav[nn] = group[nn];
      xprtstno = grpcnt - 1;            /*    and reinit indices  */
      nxtest = 0;
      tp->linenum = curline;
    }
    if (linlabels) {
      s = strsav(group[nxtest]);
      lblfound(s);
      tp->opnum = LABEL;
      tp->opcod = s;
      tp->inlist = tp->outlist = nullist;
      linlabels--;
      nxtest++;
      return(tp);
    }
    if (!instrcnt) {                    /* send initial "instr 0"    */
      tp->opnum = INSTR;
      tp->opcod = strsav("instr");      /*    to hold global assigns */
      tp->outlist = nullist;
      nxtarglist->count = 1;
      nxtarglist->arg[0] = strsav("0");
      tp->inlist = copy_arglist(nxtarglist);
      instrcnt = instrblk = 1;
      return(tp);
    }                                   /*  then at 1st real INSTR,  */
    if (instrcnt == 1 && instrblk && opnum == INSTR) {
      tp->opnum = ENDIN;                /*  send an endin to */
      tp->opcod = strsav("endin");      /*  term instr 0 blk */
      tp->outlist = tp->inlist = nullist;
      instrblk = 0;
      instrcnt = 2;
      return(tp);
    }
    while (xprtstno >= 0) {             /* for each arg (last 1st):  */
      if (!polcnt)                      /* if not midst of expressn  */
        polcnt = express(group[xprtstno--]);  /* tst nxtarg  */
      if (polcnt < 0) {                 /* polish but arg only, */
        group[xprtstno+1] = strsav(tokenstring); /* redo ptr */
        polcnt = 0;                     /* & contin */
      }
      else if (polcnt) {
        POLISH  *pol;                   /* for real polish ops, */
        int n;
        pol = &polish[--polcnt];        /*    grab top one      */
        if (isopcod(pol->opcod) == 0) { /* and check it out  */
          synterr(Str(X_877,"illegal opcod from expr anal"));
          goto tstnxt;
        }
        tp->opnum = opnum;              /* ok to send subop */
        tp->opcod = strsav(opcod);
        nxtarglist->count = outcnt = 1;
        nxtarglist->arg[0] = strsav(pol->arg[0]);
        tp->outlist = copy_arglist(nxtarglist);
        n = nxtarglist->count = incnt = pol->incount;
        do  nxtarglist->arg[n-1] = strsav(pol->arg[n]);
        while (--n);
        tp->inlist = copy_arglist(nxtarglist);
        if (!polcnt)                    /* last op? hit the grp ptr */
          group[xprtstno+1] = tp->outlist->arg[0];
        goto spctst;
      }
    }
    if (nxtest < opgrpno-1) {
      c = argtyp(group[nxtest]);        /* use outype to modify some opcodes */
      if (strcmp(linopcod,"=") == 0
          || opcodlst[linopnum].dsblksiz == 0xffff  /* Flagged as translating */
          || (( strcmp(linopcod,"table") == 0 ||        /*    with prefix   */
                strcmp(linopcod,"tablei") == 0 ||
                strcmp(linopcod,"table3") == 0 ||
                strcmp(linopcod,"wrap") == 0 ||
                strcmp(linopcod,"mirror") == 0)
              && (c == 'i' || c == 'p'))
          ) {
        if (c == 'p')   c = 'i';
        if (c == '?')   c = 'a';                /* tmp */
        sprintf(str, "%s_%c", linopcod, c);
        if (!(isopcod(str))) {
          printf(Str(X_270,"Failed to find %s\n"), str);
          sprintf(errmsg,Str(X_1111,"output arg '%s' illegal type"),
                  group[nxtest]);
          synterr(errmsg);                      /* report syntax error     */
          nxtest = 100;                         /* step way over this line */
          goto tstnxt;                          /* & go to next            */
        }
        linopnum = opnum;
        linopcod = opcod;
        VMSG( printf(Str(X_1004,"modified opcod: %s\n"),opcod); )
          }
      else if (opcodlst[linopnum].dsblksiz == 0xfffd) {
        if ((c = argtyp(group[opgrpno ] )) != 'a') c = 'k';
        sprintf(str, "%s_%c", linopcod, c);
        if (!(isopcod(str))) {
          printf(Str(X_270,"Failed to find %s\n"), str);
          sprintf(errmsg,Str(X_1111,"output arg '%s' illegal type"),
                  group[nxtest]);
          synterr(errmsg);                      /* report syntax error     */
          nxtest = 100;                         /* step way over this line */
          goto tstnxt;                          /* & go to next            */
        }
        linopnum = opnum;
        linopcod = opcod;
        VMSG( printf(Str(X_1004,"modified opcod: %s\n"),opcod); )
          }
      else if (opcodlst[linopnum].dsblksiz == 0xfffe) { /* Two tags for OSCIL's */
          /*    if (strcmp(linopcod,"oscil") == 0  */
          /*           || strcmp(linopcod,"oscili") == 0) { */
        if ((c = argtyp(group[opgrpno ] )) != 'a') c = 'k';
        if ((d = argtyp(group[opgrpno+1])) != 'a') d = 'k';
        sprintf(str,"%s_%c%c",linopcod,c,d);
        isopcod(str); /*  opcode with suffix */
        linopnum = opnum;
        linopcod = opcod;
        VMSG( printf(Str(X_1004,"modified opcod: %s\n"),opcod); )
          c = argtyp(group[nxtest]);            /* reset outype params */
      }                                 /* need we reset outype again here ? */
      else if (opcodlst[linopnum].dsblksiz == 0xfffc) { /* For divz types */
        c = argtyp(group[opgrpno  ]);
        d = argtyp(group[opgrpno+1]);
        if ((c=='i' || c=='c') && (d=='i' || d=='c')) c='i',d = 'i';
        else {
          if (c != 'a') c = 'k';
          if (d != 'a') d = 'k';
        }
        sprintf(str,"divz_%c%c",c,d);
        isopcod(str); /*  opcode with suffix */
        linopnum = opnum;
        linopcod = opcod;
      }
    }
    tp->opnum = linopnum;                       /* now use identified   */
    tp->opcod = strsav(linopcod);               /*   full line opcode   */
    if (strncmp(linopcod,"out",3) == 0 && /* but take case of MIDI ops */
        (linopcod[3] == '\0' || linopcod[3] == 's' ||
         linopcod[3] == 'q'  || linopcod[3] == 'h' ||
         linopcod[3] == 'o'  || linopcod[3] == 'x' ||
         linopcod[3] == '3'     ))
      if (   tran_nchnls == 1  && strcmp(linopcod,"out" ) != 0
          || tran_nchnls == 2  && strncmp(linopcod,"outs",4) != 0
          || tran_nchnls == 4  && strncmp(linopcod,"outq",4) != 0
          || tran_nchnls == 6  && strncmp(linopcod,"outh",4) != 0
          || tran_nchnls == 8  && strncmp(linopcod,"outo",4) != 0
          || tran_nchnls == 16 && strncmp(linopcod,"outx",4) != 0
          || tran_nchnls == 32 && strncmp(linopcod,"out32",5) != 0
        ) {
/*      printf("nchnls = %d; opcode = %s\n", tran_nchnls, linopcod); */
        if (tran_nchnls == 1) isopcod("out");
        else if (tran_nchnls == 2)  isopcod("outs");
        else if (tran_nchnls == 4)  isopcod("outq");
        else if (tran_nchnls == 6)  isopcod("outh");
        else if (tran_nchnls == 8)  isopcod("outo");
        else if (tran_nchnls == 16) isopcod("outx");
        else if (tran_nchnls == 32) isopcod("out32");
        err_printf(Str(X_56,"%s inconsistent with global nchnls (%d); replaced with %s\n"),
                   linopcod,tran_nchnls,opcod);
        tp->opnum = linopnum = opnum;
        tp->opcod = strsav(linopcod = opcod);
      }
    incnt = outcnt = 0;
    while (nxtest < opgrpno-1)          /* create the out arglist  */
      nxtarglist->arg[outcnt++] = strsav(group[nxtest++]);
    nxtarglist->count = outcnt;
    if (outcnt == 0)
      tp->outlist = nullist;
    else {
      tp->outlist = copy_arglist(nxtarglist); /* & prep ins */
    }
    nxtest++;
    while (nxtest < grpcnt)                     /*      & ensuing inargs  */
      nxtarglist->arg[incnt++] = strsav(group[nxtest++]);
    nxtarglist->count = incnt;
    if (incnt==0)
      tp->inlist = nullist;
    else tp->inlist = copy_arglist(nxtarglist);
    grpcnt = 0;                         /* all done w. these groups */

 spctst:
    tp->xincod = 0;
    if (tp->opnum == INSTR) {                   /* for opcod INSTR  */
      if (instrblk)
        synterr(Str(X_936,"instr blks cannot be nested (missing 'endin'?)"));
      else instrblk = 1;
      resetouts();                              /* reset #out counts */
      lblclear();                               /* restart labelist  */
    }
    else if (tp->opnum == ENDIN) {                      /* ENDIN:       */
      lblchk();                         /* chk missed labels */
      if (!instrblk)
        synterr(Str(X_1347,"unmatched endin"));
      else instrblk = 0;
    }
    else {                                      /* for all other opcodes:  */
      OENTRY    *ep = opcodlst + tp->opnum;
      int       n, nreqd;
      char      tfound, treqd, *types;

      if (!instrblk)
        synterr(Str(X_998,"misplaced opcode"));
      if ((n = incnt) > (nreqd = strlen(types = ep->intypes))) {
        if ((treqd = types[nreqd-1]) == 'n') {/* indef args: */
          if (!(incnt & 01))          /* require odd */
            synterr(Str(X_1003,"missing or extra arg"));
        }
        else if (treqd != 'm' && treqd != 'z' &&
                 treqd != 'y' && treqd != 'Z')/* else any no */
          synterr(Str(X_1287,"too many input args"));
      }
      else if (incnt < nreqd) {         /*  or set defaults: */
        do {
          switch(types[incnt]) {
          case 'k':             /* Will this work? */
          case 'o': nxtarglist->arg[incnt++] = strsav("0");
            break;
          case 'p': nxtarglist->arg[incnt++] = strsav("1");
            break;
          case 'q': nxtarglist->arg[incnt++] = strsav("10");
            break;
          case 'v': nxtarglist->arg[incnt++] = strsav(".5");
            break;
          case 'h': nxtarglist->arg[incnt++] = strsav("127");
            break;
          case 'j': nxtarglist->arg[incnt++] = strsav("-1");
            break;
          case 'm': nreqd--;
            break;
          default:  synterr(
                            Str(X_942,"insufficient required arguments"));
            goto chkin;
          }
        } while (incnt < nreqd);
        nxtarglist->count = n = incnt;          /*    in extra space */
        if (tp->inlist == nullist && incnt > 0) {
                                /*MWB 2/11/97 fixed bug that prevented an
                                  opcode with only optional arguments from
                                  properly loading defaults */
          tp->inlist = copy_arglist(nxtarglist);
        }
      }
    chkin:
      if (n>tp->inlist->count) {
        int i;
        size_t m = sizeof(ARGLST)+ (n-1)*sizeof(char*);
        tp->inlist = (ARGLST*)mrealloc(tp->inlist, m);
/*      printf("extend_arglist by %d args\n", n-tp->inlist->count); */
        for (i=tp->inlist->count; i<n; i++) {
          tp->inlist->arg[i] = nxtarglist->arg[i];
/*        printf("%d = %s:\n", i, tp->inlist->arg[i]); */
        }
        tp->inlist->count = n;
      }
      while (n--) {                     /* inargs:   */
        s = tp->inlist->arg[n];
/*         printf("Looking at %s: n=%d nreqd=%d\n",s, n,nreqd); */
        if (n >= nreqd) {               /* det type required */
          if (types[0] == 'z')
            treqd = 'z';
          else if (types[0] == 'y')
            treqd = 'y';
          else if (types[0] == 'Z')
            treqd = 'Z';
          else
            treqd = 'i';                /*   (indef in-type */
        }
        else treqd = types[n];          /*       or given)   */
        if (treqd == 'l') {             /* if arg takes lbl  */
          VMSG(printf(Str(X_1296,"treqd = l\n"));)
            lblrequest(s);              /*      req a search */
            continue;                   /*      chk it later */
        }
        tfound = argtyp(s);             /* else get arg type */
        if (tfound != 'c' && tfound != 'p'
            && tfound != 'S' && !lgprevdef) {
          sprintf(errmsg,
                  Str(X_914,"input arg '%s' used before defined"),s);
          synterr(errmsg);
        }
        VMSG( printf("treqd %c, tfound %c\n",treqd,tfound); )
          if (tfound == 'a' && n < 4) { /*JMC added for FOG*/
            /* 4 for FOF, 8 for FOG */
            static short xincod[4] = {2,1,4,8};
            tp->xincod += xincod[n];
          }
          switch(treqd) {
          case 'd': if (tfound != 'd')
            intyperr(n,tfound, 'd');
            break;
          case 'w': if (tfound != 'w')
            intyperr(n,tfound, 'w');
            break;
          case 'f': if(tfound != 'f')
            intyperr(n,tfound,'f');
            break;
          case 'a': if (tfound != 'a')
            intyperr(n,tfound,'a');
            break;
          case 's':
          case 'x': if (tfound == 'a') {
            if (tp->outlist != nullist) {
              char outyp = argtyp(tp->outlist->arg[0]);
              if (outyp != 'a' && outyp != 'd' && outyp != 'w')
                intyperr(n,tfound,'x');
            }
            break;
          }
          case 'k': if (tfound == 'k') break;
          case 'h':
          case 'i':
          case 'j':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'q':
          case 'v':
          case 'z':
          case 'y':
/*             printf("treqd=%c tfound=%c\n", treqd, tfound); */
            if ((treqd == 'z' && tfound == 'k')
                ||(treqd == 'y' && tfound == 'a'))
              break;
            if (treqd != 's'
                && (tfound == 'i' || tfound == 'p'
                    || tfound == 'c' || tfound == 'r'))
              break;
            intyperr(n,tfound, treqd);
            break;
          case 'Z':
/*             printf("Z %c %d\n", tfound, n); */
            if (!(tfound == 'a' && ((n&1)==1)) &&
                (!((tfound == 'k' || tfound == 'c' || tfound == 'i')
                   && ((n&1)==0))))
              intyperr(n,tfound, 'Z');
            break;
          case 'S': if (tfound != 'S'
                        && tfound != 'i' && tfound != 'p'
                        && tfound != 'c')
            intyperr(n,tfound,'S');
          break;
          case 'B': if (tfound == 'B')
            break;
          case 'b': if (tfound == 'b')
            break;
          default:  intyperr(n,tfound, treqd);
            break;
          }
      }
      VMSG( printf(Str(X_1387,"xincod = %d\n"),tp->xincod); )
      if ((n = outcnt) != (int)strlen(types = ep->outypes)
          && (*types != (char)'m' || !n || n > MAXCHNLS))
        synterr(Str(X_873,"illegal no of output args"));
      while (n--) {                                     /* outargs:  */
        s = tp->outlist->arg[n];
        treqd = types[n];
        tfound = argtyp(s);                     /*  found    */
        VMSG( printf(Str(X_1295,"treqd %c, tfound %c\n"),treqd,tfound); )
        if (tfound == 'd' || tfound == 'w')
          if (lgprevdef) {
            sprintf(errmsg,
                    Str(X_1112,"output name previously used, type '%c' must be uniquely defined"),
                    tfound);
            synterr(errmsg);
          }
        if (tfound == treqd)                    /*  as reqd, */
          continue;
        switch(treqd) {                         /*  or else  */
        case 's': if (tfound == 'a' || tfound == 'k')
          continue;
        break;
        case 'i': if (tfound == 'p')
          continue;
        break;
        case 'B': if (tfound == 'b')
          continue;
        break;
        case 'm': if (tfound == 'a')
          continue;
        break;
        }
        sprintf(errmsg,Str(X_1111,"output arg '%s' illegal type"),s);
        synterr(errmsg);
      }
      if (incnt) {
        if (ep->intypes[0] != 'l')      /* intype defined by 1st inarg */
          tp->intype = argtyp(tp->inlist->arg[0]);
        else tp->intype = 'l';  /*   (unless label)  */
      }
      if (outcnt)                       /* pftype defined by outarg */
        tp->pftype = tfound;
      else tp->pftype = tp->intype;   /*    else by 1st inarg     */
    }
    return(tp);                         /* return the text blk */
}

static void intyperr(int n, char tfound, char expect)
{
        char *s = grpsav[opgrpno + n];
        char t[10];

        switch(tfound) {
        case 'd':
        case 'w':
        case 'f':
        case 'a':
        case 'k':
        case 'i':
        case 'p': t[0] = tfound;
                  t[1] = '\0';
                  break;
        case 'r':
        case 'c': strcpy(t,"const");
                  break;
        case 'S': strcpy(t,"string");
                  break;
        case 'b':
        case 'B': strcpy(t,"boolean");
                  break;
        case '?': strcpy(t,"?");
                  break;
        }
        printf("Expecting %c: ", expect);
        sprintf(
                errmsg,
                Str(X_913,
                    "input arg '%s' of type %s not allowed when expecting %c"),
                s,t,expect);
        synterr(errmsg);
}

/* This function has been totally rewritten to use a chain of space pools
 * so there is limit beyond total memory -- JPff March 1995
 */
static char *strsav(char *s)
{
    char        *t, *u;
    struct spchain *pool = &sp_chain;

    while (1) {
                                /* Look in the pool */
        t = pool->sspace;
        do {
            if (*s == *t && strcmp(s,t) == 0) /* srch storage for match */
                return(t);                 /*  & return where found  */
            while (*t++);
        } while (t < pool->sspnxt);
        if (t != pool->ssplim) break;
        if (pool->next == NULL) break;
/*      err_printf( "Next pool for %s\n", s); */
        pool = pool->next;
    }
    if (strlen(s)+t+1 > pool->ssplim) {
/*      long n = pool->ssplim - pool->sspnxt; */
        pool->ssplim = pool->sspnxt;
        pool->next = (struct spchain*)mmalloc(sizeof(struct spchain));
        pool = pool->next;
        t = pool->sspnxt = pool->sspace = (char *)mmalloc(STRSPACE);
        pool->ssplim = pool->sspace + STRSPACE;
    }
    u = t;

    while (*t++ = *s++);        /* else enter as new string */
    pool->sspnxt = t;
    return(u);                  /* & return with its address */
}

static int isopcod(char *s)     /* tst a string against opcodlst  */
                                /*   & set op carriers if matched */
{
    extern       OENTRY *oplstend;
    OENTRY      *ep = opcodlst;
    char        *ename;

    while (++ep < oplstend && (ename = ep->opname) != NULL)
      if (strcmp(s,ename) == 0) {               /* on corr match,   */
        opnum = ep - opcodlst;          /*  set op carriers */
        opcod = ename;
        return(1);                      /*  & report success */
      }
    return(0);
}

int getopnum(char *s)           /* tst a string against opcodlst  */
                                /*   & return with opnum          */
{
    extern       OENTRY *oplstend;
    OENTRY      *ep = opcodlst;

    while (++ep < oplstend && ep->opname != NULL) {
      if (strcmp(s,ep->opname) == 0)            /* on corr match,   */
        return(ep - opcodlst);          /*  return w. opnum */
    }
    printf("opcode=%s\n", s);
    die(Str(X_1341,"unknown opcode"));
    return(0);  /* compiler only */
}

char argtyp(char *s)    /* find arg type:  d, w, a, k, i, c, p, r, S, B, b */
{                       /*   also set lgprevdef if !c && !p && !S */
    extern int pnum(char *), lgexist(char *);
    char c;

    if (((c = *s) >= '0' && c <= '9')
        || c == '.' || c == '-' || c == '+')
      return('c');                              /* const */
    if (pnum(s) >= 0)
      return('p');                              /* pnum */
    if (c == '"')
      return('S');                              /* quoted String */
    lgprevdef = lgexist(s);                     /* (lgprev) */
    if (strcmp(s,"sr") == 0       || strcmp(s,"kr") == 0
        || strcmp(s,"ksmps") == 0 || strcmp(s,"nchnls") == 0)
      return('r');                              /* rsvd */
    if (c == 'd' || c == 'w') /* N.B. d,w NOT YET #TYPE OR GLOBAL */
      return(c);
    if (c == '#')
      c = *(++s);
    if (c == 'g')
      c = *(++s);
    if (strchr("akiBbf", c) != NULL)
      return(c);
    else return('?');
}

static void lblclear(void)
{
    lblcnt = 0;
}

static void lblrequest(char *s)
{
    int req;

    for (req=0; req<lblcnt; req++)
      if (strcmp(lblreq[req].label,s) == 0)
        return;
    if (++lblcnt >= lblmax) {
      LBLREQ *tmp = mrealloc(lblreq, (lblmax += LBLMAX)*sizeof(LBLREQ));
      if (tmp==NULL)
        die(Str(X_962,"label list is full"));
      lblreq = tmp;
    }
    lblreq[req].reqline = curline;
    lblreq[req].label =s;
}

static void lblfound(char *s)
{
    int req;

    for (req=0; req<lblcnt; req++ )
      if (strcmp(lblreq[req].label,s) == 0) {
        if (lblreq[req].reqline == 0)
          synterr(Str(X_709,"duplicate label"));
        goto noprob;
      }
    if (++lblcnt >= lblmax) {
      LBLREQ *tmp = mrealloc(lblreq, (lblmax += LBLMAX)*sizeof(LBLREQ));
      if (tmp==NULL)
        die(Str(X_962,"label list is full"));
      lblreq = tmp;
    }
    lblreq[req].label = s;
noprob:
    lblreq[req].reqline = 0;
}

static void lblchk(void)
{
    int req;
    int n;

    for (req=0; req<lblcnt; req++ )
      if (n = lblreq[req].reqline) {
        char    *s;
        printf(Str(X_724,"error line %d.  unknown label:\n"),n);
        s = linadr[n];
        do {
          putchar(*s);
          if (dribble) putc(*s, dribble);
        } while (*s++ != '\n');
        synterrcnt++;
      }
}

void synterr(char *s)
{
    int c;
    char        *cp;

    printf(Str(X_745,"error:  %s"),s);
    if ((cp = linadr[curline]) != NULL) {
      printf(Str(X_83,", line %d:\n"),curline);
      do {
        putchar((c = *cp++));
        if (dribble) putc(c, dribble);
      } while (c != '\n');
    }
    else {
      putchar('\n'); if (dribble) putc('\n', dribble);
    }
    synterrcnt++;
}

void synterrp(char *errp, char *s)
{
    char        *cp;

    synterr(s);
    cp = linadr[curline];
    while (cp < errp) {
      int ch = *cp++;
      if (ch != '\t') ch = ' ';
      putchar(ch);
      if (dribble) putc(ch, dribble);
    }
    printf("^\n");
}

static void lexerr(char *s)
{
    struct in_stack *curr = str;
    printf(Str(X_745,"error:  %s"),s);
    while (curr!=inputs) {
      if (curr->string) {
        MACRO *mm = macros;
        while (mm != curr->mac) mm = mm->next;
        printf(Str(X_625,"called from line %d of macro %s\n"), curr->line, mm->name);
      }
      else {
        printf(Str(X_896,"in line %f of file input %s\n"), curr->line, curr->body);
      }
      curr--;
    }
}

static void printgroups(int grpcnt)     /*   debugging aid (onto stdout) */
{
    char        c, *cp = group[0];
    printf("groups:\t");
    while (grpcnt--) {
      printf("%s ", cp);
      while (c = *cp++);
    }
    printf("\n");
}
