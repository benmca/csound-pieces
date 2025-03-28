#include "cs.h"                                 /*              EXPRESS.C       */
#include <string.h>             /* for memset */

#define BITSET  0x17
#define BITCLR  0x16
#define BITFLP  0x15

#define LENTOT  200L            /* This one is OK */
#define TOKMAX  50L             /* Should be 50 but bust */
#define POLMAX  30L             /* This one is OK */
#define XERROR(CAUSE)   { strncpy(xprmsg,CAUSE,40);  goto error; }

typedef struct token {
        char    *str;
        short   prec;
} TOKEN;

POLISH  *polish;
static  long    polmax;
        char    *tokenstring;
static  long    toklen;

static  TOKEN   *tokens = NULL, *token, *tokend;
static  TOKEN   **tokenlist = NULL, **revp, **pushp, **argp, **endlist;
static  int     toklength = TOKMAX;
static  int     acount, kcount, icount, Bcount, bcount;
static  char    xprmsg[40], *stringend;
static  char    strminus1[] = "-1", strmult[] = "*";
static  void    putokens(void), putoklist(void);
static  int     nontermin(int);
extern  void    putstrg(char *);
extern  char    argtyp(char *);
extern  void    *mrealloc(void*,long);
        void    resetouts(void);

void expRESET(void)
{
    mfree(polish); polish=NULL;
    polmax      = 0;
    tokenstring = NULL;
    toklen      = 0;
    tokens      = token = tokend = NULL;
    tokenlist   = revp = pushp = argp = endlist = NULL;
    toklength   = TOKMAX;
    resetouts();
    memset(xprmsg,0,40*sizeof(char));
    stringend   = 0;
}

void resetouts(void)
{
    acount = kcount = icount = Bcount = bcount = 0;
}

static char *copystring(char *s)
{
    int len = strlen(s);
    char *r = (char *)mmalloc(len+1);
    strcpy(r, s);
    return r;
}

int express(char *s)
{
    POLISH      *pp;
    char        b, c, d, e, nextc, *t, *op, outype, *sorig;
    int         open, prec, polcnt, argcnt;

    if (*s == '"')                 /* if quoted string, not an exprssion */
        return (0);
    if (tokens == NULL) {
        tokens = (TOKEN*) mmalloc((long)TOKMAX*sizeof(TOKEN));
        tokend = tokens+TOKMAX;
        tokenlist = (TOKEN**) mmalloc((long)TOKMAX*sizeof(TOKEN*));
        polish = (POLISH*) mmalloc((long)POLMAX*sizeof(POLISH));
        polmax = POLMAX;
        tokenstring = mmalloc(LENTOT);
        stringend = tokenstring+LENTOT;
        toklen = LENTOT;
    }
    sorig = s;
    if (tokenstring+strlen(s) >= stringend) {
        char *tt;
        TOKEN *ttt;
        long n = toklen + LENTOT+strlen(s);
        tt = (char *)mrealloc(tokenstring, n);
        for (ttt=tokens; ttt<=token; ttt++) /* Adjust all previous tokens */
            ttt->str += (tt-tokenstring);
        tokenstring = tt;               /* Reset string and length */
        stringend = tokenstring + (toklen = n);
        printf(Str(X_494,"Token length extended to %ld\n"), toklen);
    }

    token = tokens;
    token->str = t = tokenstring;
    open = 1;
    while (c = *s++) {
        if (open) {                     /* if unary possible here,   */
            if (c == '+')               /*   look for signs:         */
                continue;
            if (c == '-') {             /* neg const:  get past sign */
                if (*s == '.' || *s >= '0' && *s <= '9')
                    *t++ = c;
                else {                  /* neg symbol: prv / illegal */
                    if (token > tokens
                        && *(token-1)->str == '/')
                        XERROR(Str(X_706,"divide by unary minus"))
                    token++->str = strminus1;
                    token++->str = strmult;
                    token->str = t;     /* else -1 * symbol */
                }
                c = *s++;               /* beg rem of token */
            }
            else if (c == '*' || c == '/' || c == '%')  /* unary mlt, div */
                XERROR(Str(X_1314,"unary mult or divide"))      /*   illegal */
            open = 0;
        }
        *t++ = c;                       /* copy this character or    */
        if ((nextc = *s) == c && (c == '&' || c == '|') /* double op */
            || nextc == '=' && (c=='<' || c=='>' || c=='=' || c=='!'))
            *t++ = c = *s++, open = 1;
        else if ( c == '(' || c == '+' || c == '-' || c == '*' || c == '/'
             || c == '%' || c == '>' || c == '<' || c == '=' || c == '&'
             || c == '|' || c == '?' || c == ':' || c == '#' || c == '�') {
          if (c == '&') *(t-1) = BITCLR;
          else if (c == '|') *(t-1) = BITSET;
          else if (c == '#') *(t-1) = BITFLP;
          open = 1;           /* decl if unary can follow */
        }
        else if (nontermin(c))
            while (nontermin(*s))       /* if not just a termin char */
                *t++ = *s++;            /*      copy entire token    */
        *t++ = '\0';                    /* terminate this token      */
        if (t >= stringend) {           /* Extend token length as required */
            XERROR(Str(X_1283,"token storage LENTOT exceeded"));
        }
        if ((tokend - token)<= 4) {     /* Extend token array and friends */
            int n = token - tokens;
            tokens =
                (TOKEN*)mrealloc(tokens, (toklength+TOKMAX)*sizeof(TOKEN));
            tokenlist =
                (TOKEN**) mrealloc(tokenlist, (toklength+TOKMAX)*sizeof(TOKEN*));
            toklength += TOKMAX;
            printf(Str(X_495,"Tokens length extended to %d\n"), toklength);
            token  = tokens + n;
            tokend = tokens + toklength;
/*          XERROR("token storage TOKMAX exceeded"); */
        }
        (++token)->str = t;             /* & record begin of nxt one */
    }
    token->str = NULL;          /* expr end:  terminate tokens array */
    if (token - tokens <= 1)    /*              & return if no expr  */
        return(0);

    token = tokens;
    while ((s = token->str) != NULL) {  /* now for all tokens found, */
        if ((c = *s) == ')')            /*  assign precedence values */
            prec = 0;
        else if (c == ',')
            prec = 1;
        else if (c == '?' || c == ':')
            prec = 2;
        else if (c == '|')
            prec = 3;
        else if (c == '&')
            prec = 4;
        else if (c == '>' || c == '<' || c == '=' || c == '!')
            prec = 5;
        else if ((c == '+' || c == '-') && *(s+1) == '\0')
            prec = 6;
        else if (c == '*' || c == '/' || c == '%')
            prec = 7;
        else if (c == '^')
            prec = 8;
        else if (c == BITSET && c==BITFLP)
            prec = 9;
        else if (c == BITCLR)
            prec = 10;
        else if (c == '�')
            prec = 11;
        else if (c >= 'a' && c <= 'z'
                 && (t = (token+1)->str) != NULL && *t == '(')
            prec = 12;
        else if (c == '(')
            prec = 13;
        else if ((c = argtyp(s)) == 'a')
            prec = 14;
        else if (c == 'k')
            prec = 15;
        else    prec = 16;
        (token++)->prec = prec;
    }
    VMSG(putokens();)

#define CONDVAL 2
#define LOGOPS  3
#define RELOPS  5
#define AOPS    6
#define BITOPS  9
#define FCALL   12
#define TERMS   14

    token = tokens;
    revp = tokenlist;
    pushp = endlist = tokenlist+toklength;      /* using precedence vals, */
    while (token->str != NULL) {                /*  put tokens rev pol order */
        if (*token->str == '(') {
            token->prec = -1;
            *--pushp = token++;
        }
        else if (pushp < endlist && (*pushp)->prec >= token->prec) {
            if (*token->str == ':' && *(*pushp)->str == '?')
                *pushp = token++;               /* replace ? with : */
            else *revp++ = *pushp++;
        }
        else if (*token->str == ')') {
            if (token++ && *(*pushp++)->str != '(')
                XERROR(Str(X_1380,"within parens"))
        }
        else if ((token+1)->str!=NULL && token->prec < (token+1)->prec)
            *--pushp = token++;
        else *revp++ = token++;
    }
    while (pushp < endlist)
        *revp++ = *pushp++;

    endlist = revp;                             /* count of pol operators */
    VMSG(putoklist();)
    for (revp=tokenlist, polcnt=0;  revp<endlist; )
        if ((*revp++)->prec < TERMS)            /*  is no w. prec < TERMS */
            polcnt++;
    if (!polcnt) {                              /* if no real operators,  */
        strcpy(tokenstring,tokenlist[0]->str);  /* cpy arg to beg str     */
        return(-1);                             /*  and return this info  */
    }
    if (polcnt >= polmax) {
        polmax = polcnt+POLMAX;
        polish = (POLISH*) mrealloc(polish,polmax*sizeof(POLISH));
        printf(Str(X_265,"Extending Polish array length %ld\n"), polmax);
/*      XERROR("polish storage POLMAX exceeded"); */
    }
    pp = &polish[polcnt-1];
    op = pp->opcod;
    for (revp=argp=tokenlist; revp<endlist; ) { /* for all tokens:  */
      char buffer[1024];
        if ((prec = (*revp)->prec) >= TERMS) {
            *argp++ = *revp++;                  /* arg: push back    */
            continue;                           /*      till later   */
        }
        argcnt = argp - tokenlist;
        if (prec == FCALL && argcnt >= 1) {     /* function call:  */
            pp->incount = 1;                    /*    takes one arg */
            pp->arg[1] = copystring((*--argp)->str);
            c = argtyp(pp->arg[1]);             /* whose aki type */
            if (c == 'B' || c == 'b')
                XERROR(Str(X_999,"misplaced relational op"))
            if (c != 'a' && c != 'k')
                c = 'i';                        /*   (simplified)  */
            sprintf(op, "%s_%c", (*revp)->str, c); /* Type at end now */
            if (strcmp(op,"i_k") == 0)
                outype = 'i';                   /* i(karg) is irreg. */
            else outype = c;                    /* else outype=intype */
        }
        else if (prec >= BITOPS && argcnt >= 2) { /* bit op:    */
          if ((c = *(*revp)->str) == BITSET)
            strcpy(op,"or");
          else if (c == BITFLP)
            strcpy(op,"xor");
          else if (c == BITCLR)
            strcpy(op,"and");
          else printf(Str(X_262,"Expression got lost\n"));
          goto common_ops;
        }
        else if (prec >= BITOPS && argcnt == 1) { /* bit op:    */
          if ((c = *(*revp)->str) == '�')
            strcpy(op,"not");
          else printf(Str(X_262,"Expression got lost\n"));
          pp->incount = 1;                    /*   copy 1 arg txts */
            pp->arg[1] = copystring((*--argp)->str);
            e = argtyp(pp->arg[1]);
            if (e == 'B' || e == 'b')
                XERROR(Str(X_999,"misplaced relational op"))
/*              printf("op=%s e=%c c=%c\n", op, e, c); */
            if (e == 'a') {                     /*   to complet optxt*/
                if (c=='�')
                  strcat(op,"_a");
                outype = 'a';
            }
            else if (e == 'k') {
                if (c == '�') strcat(op,"_k");
                outype = 'k';
            }
            else {
                if (c == '�') strcat(op,"_i");
                outype = 'i';
            }
        }
        else if (prec >= AOPS && argcnt >= 2) { /* arith op:    */
            if ((c = *(*revp)->str) == '+')
                strcpy(op,"add");
            else if (c == '-')
                strcpy(op,"sub");               /*   create op text */
            else if (c == '*')
                strcpy(op,"mul");
            else if (c == '/')
                strcpy(op,"div");
            else if (c == '%')
                strcpy(op,"mod");
            else if (c == '^')
                strcpy(op,"pow");
            else printf(Str(X_262,"Expression got lost\n"));
        common_ops:
            pp->incount = 2;                    /*   copy 2 arg txts */
            pp->arg[2] = copystring((*--argp)->str);
            pp->arg[1] = copystring((*--argp)->str);
            e = argtyp(pp->arg[1]);
            d = argtyp(pp->arg[2]);             /*   now use argtyps */
            if (e == 'B' || e == 'b' || d == 'B' || d == 'b' )
                XERROR(Str(X_999,"misplaced relational op"))
/*              printf("op=%s e=%c c=%c d=%c\n", op, e, c, d); */
            if (e == 'a') {                     /*   to complet optxt*/
                if (c=='^' && (d == 'c' || d == 'k'|| d == 'i' || d == 'p'))
                                   strcat(op,"_a");
                else if (d == 'a') strcat(op,"_aa");
                else               strcat(op,"_ak");
                outype = 'a';
            }
            else if (d == 'a') {
                strcat(op,"_ka");
                outype = 'a';
            }
            else if (e == 'k' || d == 'k') {
                if (c == '^') strcat(op,"_k");
                else          strcat(op,"_kk");
                outype = 'k';
            }
            else {
                if (c == '^') strcat(op,"_i");
                else          strcat(op,"_ii");
            outype = 'i';
            }
        }
        else if (prec >= RELOPS && argcnt >= 2) { /* relationals:   */
            strcpy(op,(*revp)->str);            /*   copy rel op    */
            if (strcmp(op,"=") == 0)
                strcpy(op,"==");
            pp->incount = 2;                    /*   & 2 arg txts   */
            pp->arg[2] = copystring((*--argp)->str);
            pp->arg[1] = copystring((*--argp)->str);
            c = argtyp(pp->arg[1]);
            d = argtyp(pp->arg[2]);             /*   now use argtyps */
            if (c == 'a' || d == 'a')           /*   to determ outs  */
                XERROR(Str(X_603,"audio relational"))
            if (c == 'B' || c == 'b' || d == 'B' || d == 'b' )
                XERROR(Str(X_999,"misplaced relational op"))
            if (c == 'k' || d == 'k')
                outype = 'B';
            else outype = 'b';
        }
        else if (prec >= LOGOPS && argcnt >= 2) { /* logicals:    */
            strcpy(op,(*revp)->str);            /*   copy rel op  */
            pp->incount = 2;                    /*   & 2 arg txts */
            pp->arg[2] = copystring((*--argp)->str);
            pp->arg[1] = copystring((*--argp)->str);
            c = argtyp(pp->arg[1]);
            d = argtyp(pp->arg[2]);             /*   now use argtyps */
            if (c == 'b' && d == 'b')           /*   to determ outs  */
                outype = 'b';
            else if ((c == 'B' || c == 'b')
                     && (d == 'B' || d == 'b'))
                outype = 'B';
            else XERROR(Str(X_906,"incorrect logical argumemts"))
        }
        else if (prec == CONDVAL && argcnt >= 3) { /* cond vals:     */
            strcpy(op,": ");                    /*   init op as ': ' */
            pp->incount = 3;                    /*   & cpy 3 argtxts */
            pp->arg[3] = copystring((*--argp)->str);
            pp->arg[2] = copystring((*--argp)->str);
            pp->arg[1] = copystring((*--argp)->str);
            b = argtyp(pp->arg[1]);
            c = argtyp(pp->arg[2]);
            d = argtyp(pp->arg[3]);
            if (   b != 'B' && b != 'b'         /*   chk argtypes, */
                || c == 'B' || c == 'b'
                || d == 'B' || d == 'b'
                || c == 'a' && d != 'a'
                || d == 'a' && c != 'a')
                XERROR(Str(X_905,"incorrect cond value format"))
            outype = 'i';                       /*   determine outyp */
            if (b == 'B' || c == 'k' || d == 'k')
                outype = 'k';
            if (c == 'a' || d == 'a')
                outype = 'a';
            *(op+1) = outype;                   /*   & complet opcod */
        }
        else XERROR(Str(X_944,"insufficient terms"))
        s = &buffer[0] /* pp->arg[0] */;        /* now create outarg */
        if (outype=='a') sprintf(s,"#a%d",acount++); /* acc. to type */
        else if (outype=='k') sprintf(s,"#k%d",kcount++);

        else if (outype=='B') sprintf(s,"#B%d",Bcount++);
        else if (outype=='b') sprintf(s,"#b%d",bcount++);
        else sprintf(s,"#i%d",icount++);
        (*argp++)->str = pp->arg[0] = copystring(s);/* & point argstack there */
        revp++;
        pp--;   op = pp->opcod;                 /* prep for nxt pol */
    }
    if (argp - tokenlist == 1)
        return(polcnt);                         /* finally, return w. polcnt */
    XERROR(Str(X_1277,"term count"))

error:
    synterr(Str(X_748,"expression syntax"));    /* or gracefully report error*/
    printf(" %s: %s\n",xprmsg,sorig);
    strcpy(tokenstring,"1");
    return(-1);
}

static int nontermin(int c)
{
    if (   c == '(' || c == ')' || c == '\0'|| c == '^'
        || c == '+' || c == '-' || c == '*' || c == '/' || c == '%'
        || c == '>' || c == '<' || c == '=' || c == '!'
        || c == '&' || c == '|' || c == '?' || c == ':' )
        return(0);
    else return(1);
}

static void putokens(void)      /* for debugging check only */
{
    TOKEN       *tp = tokens;
    while (tp->str != NULL)
        putstrg((tp++)->str);
    putchar('\n'); if (dribble) putc('\n', dribble);
}

static void putoklist(void)     /*      ditto           */
{
    TOKEN       **tpp = tokenlist;
    while (tpp < endlist)
        putstrg((*tpp++)->str);
    putchar('\n'); if (dribble) putc('\n', dribble);
}
