#include "sort.h"                                     /*   SREAD.C     */
#include "cs.h"  /* for PMAX */
#include <math.h>      /* for fabs() */
#include <ctype.h>
#include <time.h>	/* gab A9*/

FILE    *SCOREIN, *SCOREOUT;
int     sectcnt;                /* count of sections in scorefile       */
SRTBLK  *frstbp;                /* logical frstblk in srtblk chain      */
static SRTBLK  *bp, *prvibp;    /* current srtblk,  prev w/same int(p1) */
static char    *sp, *nxp;       /* string pntrs into srtblk text        */
static int     op;              /* opcode of current event              */
static int     warpin;          /* input format sensor                  */
static int     linpos;          /* line position sensor                 */
static int     lincnt;          /* count of lines/section in scorefile  */
static MYFLT   prvp2 = -FL(1.0);	/* Last event time */
static MYFLT   clock_base = FL(0.0);
static MYFLT   warp_factor = FL(1.0);

static void    copylin(void), copypflds(void), ifa(void), setprv(void);
static void    carryerror(void), pcopy(int, int, SRTBLK*), salcinit(void);
static void    salcblk(void), flushlin(void);
static int     getop(void), getpfld(void);
       MYFLT   stof(char *);
extern FILE    *fopen_path(char *, char *, char *, char *);
extern char    name_full[256];
extern char    *scorename;

#define MEMSIZ  40000L          /* size of memory requests from system  */
#define MARGIN  400             /* minimum remaining before new request */

static MEMHDR *basmem = NULL;
static MEMHDR *curmem;
static char   *memend;          /* end of cur memblk     */

#define MARGS	(10) //Gab
typedef struct MACRO {          /* To store active macros */
  char          *name;          /* Use is by name */
  int           acnt;           /* Count of arguments */
  char          *body;          /* The text of the macro */
  struct MACRO  *next;          /* Chain of active macros */
  int           margs;          /* ammount of space for args */
  char          *arg[MARGS];    /* With these arguments */
} MACRO;

static  MACRO   *macros = NULL;
struct in_stack {		/* Stack of active inputs */
  short	string;			/* Flag to say if string or file */
  short	args;			/* Argument count for macro */
  char	*body;			/* String */
  FILE	*file;			/* File case only */
  MACRO *mac;
  short line;
};

struct marked_sections {
  char  *name;
  long	posit;
  char  *file;
} names[30], *current_name = NULL;

static int next_name = -1;

static struct in_stack inputs[20], *str; /* Currently allow 20 maximum */
static int pop = 0;		/* Number of macros to pop */
static int ingappop = 1;	/* Are we in a popable gap? */
static int linepos = -1;

typedef struct scotables {
	long len;
	MYFLT *table;
} SCOTABLE;
SCOTABLE sco_table[100]; /* gab A9 */


static void scorerr(char *s)
{
    struct in_stack *curr = str;

    printf("score error:  %s on line %d position %d", s, str->line, linepos);

    while (curr!=inputs) {
      if (curr->string) {
	MACRO *mm = NULL;
	while (mm != curr->mac) mm = mm->next;
	printf("called from line %d of macro %s\n", curr->line, mm->name);
      }
      else {
	printf("in line %f of file input %s\n", curr->line, curr->body);
      }
      curr--;
    }
    exit(1);
}

MYFLT get_table_value(MYFLT tabnum, MYFLT index) /* gab A9*/
{
	MYFLT *tnum = &tabnum;
	extern FUNC *ftfind(MYFLT *);
	FUNC *f = ftfind(tnum);
	MYFLT result;
	long ndx = (long) (index + .5);
	long flen = f->flen;
	while (ndx < 0)  ndx += flen;
	while (ndx > flen) ndx -= flen;
	result = f->ftable[ndx];
	return result;
}

MYFLT operate(MYFLT a, MYFLT b, char c)
{
    MYFLT ans;
    
    switch (c) {
    case '+': ans = a+b; break;
    case '-': ans = a-b; break;
    case '*': ans = a*b; break;
    case '/': ans = a/b; break;
	case '^': ans = (MYFLT) pow((double)a,(double)b); break; /* gab A8 */ /* rise a to power b */
	case '%': ans = (MYFLT) fmod(a,b); break; /* gab A9 */  /* a modulus b */
	case 'R':  /* gab A9 */ /* random number in range 0-a , seed b */
		if (b == -1.)	{
			srand((unsigned)time( NULL ));
		}
		else if (b != 0.) {
			srand(((unsigned int) b) * 65533 + 2); 
		}
		ans = a * (MYFLT) rand()/(MYFLT) RAND_MAX; 
		break;
	case 'T': ans =  get_table_value(a,b); break; /* gab A9 */ /* get value from table a, index b */
    default:
      err_printf("Internal error op=%c\n", c);
      exit(1);
    }
    return ans;
}

#define ungetscochar(c) if (str->string) str->body--; else ungetc(c, str->file)

static int getscochar(int expand) /* Read a score character, expanding macros */
{				  /* if flag set */
    int c;
top:
    if (str->string) {
		c= *str->body++;
		if (c == '\0') {
			pop += str->args;
			str--;
			goto top;
		}
    }
    else {
		c = getc(str->file);
		if (c == EOF) {
			if (str == &inputs[0]) return EOF;
			fclose(str->file);
			mfree(str->body);
			str--; goto top;
		}
    }
    if (c =='\r') c = '\n';	/* For macintosh */
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
			mfree(macros->name); 
			mfree(macros->body);
		 	for (i=0; i<macros->acnt; i++) {
  				mfree(macros->arg[i]);
			}
			mfree(macros);
			macros = nn;
			pop--;
		} while (pop);
		if (c == '$' && expand) {
			char name[100];
			int i=0;
			int j;
			MACRO *mm = macros;
			ingappop = 0;
			while (isalpha(c=getscochar(1)) || (i!=0 && isdigit(c))) name[i++] = c;
			if (c!='.') { ungetscochar(c); }
			name[i] = '\0';
#ifdef MACDEBUG
			printf("Macro %s found\n", name); 
#endif
			while (mm!=NULL) {	/* Find the definition */
				if (strcmp(name, mm->name)==0) break;
				mm = mm->next;
			}
			if (mm==NULL) scorerr("Undefined macro");
#ifdef MACDEBUG
			printf("Found macro %s required %d arguments\n", mm->name, mm->acnt);
#endif
			/* Should bind arguments here */
			/* How do I recognise entities?? */
			if (mm->acnt) {
				if ((c=getscochar(1))!='(') scorerr("Syntax error in macro call");
				for (j=0; j<mm->acnt; j++) {
					char term = (j==mm->acnt-1 ? ')' : '\''/*'#'*/); /*gab A9*/
					MACRO* nn = (MACRO*) mmalloc(sizeof(MACRO));
					int size = 100;
					nn->name = mmalloc(strlen(mm->arg[j])+1);
					strcpy(nn->name, mm->arg[j]);
#ifdef MACDEBUG
					printf("defining argument %s ", nn->name);
#endif
					i = 0;
					nn->body = (char*)mmalloc(100);
					while ((c = getscochar(1))!= term) {
						nn->body[i++] = c;
						if (i>= size) nn->body = mrealloc(nn->body, size += 100);
					}
					nn->body[i]='\0';
#ifdef MACDEBUG
					printf("as...#%s#\n", nn->body);
#endif
					nn->acnt = 0;	/* No arguments for arguments */
					nn->next = macros;
					macros = nn;
				}
			}
			str++;
			str->string = 1; str->body = mm->body; str->args = mm->acnt;
			str->mac = mm; str->line = 1;
#ifdef MACDEBUG
			printf("Macro %s definded as >>%s<<\n", mm->name, mm->body);
#endif
			ingappop = 1;
			goto top;
		}
		/* End of macro expander */
		if (expand && c == '[') {		/* Evaluable section */
			char stack[30];
			MYFLT vv[30];
			char *op = stack-1;
			MYFLT *pv = vv-1;
			char buffer[100];
			int i;
			int type=0;
			*++op = '[';
			c = getscochar(1);
			do {
				switch (c) {
				case '0': case '1': case '2': case '3': case '4':
				case '5': case '6': case '7': case '8': case '9':
				case '.':
					if (type==1) {
						err_printf("Number not allowed in context []\n");
						exit(1);
					}
					i = 0;
					while (isdigit(c) || c=='.' || c=='e' || c=='E') {
						buffer[i++]=c;
						c = getscochar(1);
					}
					buffer[i] = '\0';
					*++pv = (MYFLT)atof(buffer);
					type = 1;
					break;
        case '~':
          if (type==1) {
            err_printf(Str(X_438,"Random not in context []\n"));
            exit(1);
          }
          *++pv = (MYFLT) rand()/(MYFLT)RAND_MAX;
          type = 1;
          c = getscochar(1);
          break;
        case '@':
          if (type==1) {
            err_printf(Str(X_1454,"Upper not in context []\n"));
            exit(1);
          }
          {
            int n = 0;
            int k = 0;          /* 0 or 1 depending on guard bit */
            c = getscochar(1);
            if (c=='@') { k = 1; c = getscochar(1);}
            while (isdigit(c)) {
              n = 10*n + c - '0';
              c = getscochar(1);
            }
            i = 1;
            while (i<=n-k && i< 0x4000000) i <<= 2;
            *++pv = (MYFLT)(i+k);
            type = 1;
          }
          break;
				case '+': case '-':
					if (type==0) {
						err_printf("Operator %c not allowed in context []\n", c);
						exit(1);
					}
					if (*op != '[' && *op != '(') {
						MYFLT v = operate(*(pv-1), *pv, *op);
						op--; pv--;
						*pv = v;
					}
					type = 0;
					*++op = c; c = getscochar(1); break;
				case '*':
				case '/':
				//case '^': /* gab A8 */
				case '%': /* gab A9 */	
				case 'R': /* gab A9 */	
				case 'T': /* gab A9 */	
					if (type==0) {
						err_printf("Operator %c not allowed in context []\n", c);
						exit(1);
					}
					if (*op == '*' || *op == '/' 
						/*|| *op == '^'*/ || *op == '%' || *op == 'R'|| *op == 'T' /* gab A9 */) {
						MYFLT v = operate(*(pv-1), *pv, *op);
						op--; pv--;
						*pv = v;
					}
					type = 0;
					*++op = c; c = getscochar(1); break;
				case '(':
					if (type==1) {
						err_printf("Open bracket not allowed in context []\n");
						exit(1);
					}
					type = 0;
					*++op = c; c = getscochar(1); break;
				case ')':
					if (type==0) {
						err_printf("Closing bracket not allowed in context []\n");
						exit(1);
					}
					while (*op != '(') {
						MYFLT v = operate(*(pv-1), *pv, *op);
						op--; pv--;
						*pv = v;
					}
					type = 1;
					op--; c = getscochar(1); break;
			    case '^':
						type = 0;
						*++op = c; c = getscochar(1); break;
				case ']':
					if (type==0) {
						err_printf("Closing bracket not allowed in context []\n");
						exit(1);
					}
					while (*op != '[') {
						MYFLT v = operate(*(pv-1), *pv, *op);
						op--; pv--;
						*pv = v;
					}
					c = '$';
					break;
				case '$':
					break;
				case ' ':		/* Ignore spaces */
					c = getscochar(1);
					continue;
				default:
					printf("Incorrect evaluation\n");
					exit(1);
				}
			} while (c!='$');
			/* Make string macro or value */
			sprintf(buffer, "%f", *pv);
			{
				MACRO* nn = (MACRO*) mmalloc(sizeof(MACRO));
				nn->name = mmalloc(2);
				strcpy(nn->name, "[");
				nn->body = (char*)mmalloc(strlen(buffer)+1);
				strcpy(nn->body, buffer);
				nn->acnt = 0;	/* No arguments for arguments */
				nn->next = macros;
				macros = nn;
				str++;
				str->string = 1; str->body = nn->body; str->args = 0;
				str->mac = NULL; str->line = 1;
#ifdef MACDEBUG
				err_printf("[] defined as >>%s<<\n", nn->body);
#endif
				ingappop = 1;
				goto top;
			}
    }
    return c;
}

				/* Variable for repeat sections */
static char repeat_name_n[40][40];
static int repeat_cnt_n[40] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
static long repeat_point_n[40];
static int repeat_inc_n = 1; 
static MACRO *repeat_mm_n[40];
static int repeat_index=0;

static int nested_repeat(void)	/* gab A9*/
{
    repeat_cnt_n[repeat_index]--;
    if (repeat_cnt_n[repeat_index]==0) { /* Expired */
		if (repeat_index > 1) {
			char c[41];
			int j;
			for (j = 0; j<repeat_index; j++) {
				c[j]=' ';
				c[j+1]='\0';
			}
			printf("%s Nested LOOP terminated, level:%d\n",c,repeat_index);

		}
		else
			printf("External LOOP terminated, level:%d\n",repeat_index);
		if (strcmp(repeat_name_n[repeat_index], macros->name)==0) {
			MACRO *mm=macros->next;
			mfree(macros->name); mfree(macros->body);
			mfree(macros); macros = mm;
		}
		else {
			MACRO *mm = macros;
			MACRO *nn = mm->next;
			while (strcmp(repeat_name_n[repeat_index], nn->name)!=0) {
				mm = nn; nn = nn->next;
				if (nn==NULL)
					scorerr("Undefining undefined macro");
			}
			mfree(nn->name); mfree(nn->body);
			mm->next = nn->next; mfree(nn);
		}
		repeat_index--;
    }
    else {
		int i;
		fseek(str->file, repeat_point_n[repeat_index], SEEK_SET);
		sscanf(repeat_mm_n[repeat_index]->body, "%d", &i);
		i = i + repeat_inc_n;
		sprintf(repeat_mm_n[repeat_index]->body, "%d", i);
		if (repeat_index > 1) {
			char c[41];
			int j;
			for (j = 0; j<repeat_index; j++) {
				c[j]=' ';
				c[j+1]='\0';
			}	
#ifdef MACDEBUG
			printf("%s  Nested LOOP section (%d) Level:%d\n",c, i,repeat_index);
#endif
		}
		else 
#ifdef MACDEBUG
			printf(" External LOOP section (%d) Level:%d\n", i,repeat_index);
#endif
		*(nxp-2) = 's'; *nxp++ =  LF;
		return 1;
    }
    return 0;
}

/* Variable for repeat sections */
static char repeat_name[40];
static int repeat_cnt = 0;
static long repeat_point;
static int repeat_inc = 1;
static MACRO *repeat_mm;

static int do_repeat(void)	/* At end of section repeat if necessary */
{
    repeat_cnt--;
    if (repeat_cnt==0) { /* Expired */
		/* Delete macro */
		printf("Loop terminated\n");
		if (strcmp(repeat_name, macros->name)==0) {
			MACRO *mm=macros->next;
			mfree(macros->name); mfree(macros->body);
			mfree(macros); macros = mm;
		}
		else {
			MACRO *mm = macros;
			MACRO *nn = mm->next;
			while (strcmp(repeat_name, nn->name)!=0) {
				mm = nn; nn = nn->next;
				if (nn==NULL)
					scorerr("Undefining undefined macro");
			}
			mfree(nn->name); mfree(nn->body);
			mm->next = nn->next; mfree(nn);
		}
    }
    else {
		int i;
		fseek(str->file, repeat_point, SEEK_SET);
		sscanf(repeat_mm->body, "%d", &i);
		i = i + repeat_inc;
		sprintf(repeat_mm->body, "%d", i);
		printf("Repeat section (%d)\n", i);
		*(nxp-2) = 's'; *nxp++ =  LF;
		return 1;
    }
    return 0;
}

char * trim(char *buf)  /*gab A9*/
{
	char *s = buf;
	while (*buf) {
		if (*buf ==' ' || *buf =='\t' || *buf ==13 ||  *buf ==10) {
			*buf = '\0';
			return s;
		}
		buf++;
	}
	return s;
}


int sread(void)			/*  called from main,  reads from SCOREIN   */
{				/*  each score statement gets a sortblock   */
	int  rtncod;            /* return code to calling program:      */
				/*   2 = section read, more remaining   */
				/*   1 = last section,   0 = null file  */
	extern char *scorename;
	bp = prvibp = frstbp = NULL;
	nxp = NULL;
	warpin = 0;
	lincnt = 1; 
	rtncod = 1; 
	sectcnt++;
	str = inputs; str->file = SCOREIN;
	str->string = 0; str->body = scorename;
	str->line = 1; str->mac = NULL;
	
	salcinit();              /* init the mem space for this section */
	while ((op = getop()) != EOF) {  /* read next op from scorefile */
		rtncod = 2;
		salcblk();       /* build a line structure; init bp,nxp */
again:
		switch(op) {            /*  and dispatch on opcodes     */
		case 'i':
		case 'f':
		case 'a':
			ifa();
			break;
		case 'w':
			warpin++;
			copypflds();
			break;
		case 't':
			copypflds();
			break;
		case 'b':	/* Set a clock base */
			{
				char *old_nxp = nxp-2;
				getpfld();
				clock_base = stof(sp);
				printf("Clockbase = %f\n", clock_base);
				flushlin();
				op = getop();
				nxp = old_nxp;
				*nxp++ = op; /* Undo this line */
				nxp++;
				goto again;
			}
		case 's':
			if (repeat_cnt!=0) {
				if (do_repeat()) return (rtncod);
			}
			if (current_name) {
				fclose(str->file);
				mfree(str->body);
				str--;
				current_name = NULL;
			}
			copylin();
			clock_base = FL(0.0);
			warp_factor = FL(1.0);
			prvp2 = -FL(1.0);
			return(rtncod);
		case 'F': 
			{  /* gab A9 */
				extern void fgens(EVTBLK *);
				extern void dispinit(void);
				EVTBLK *ev = (EVTBLK *) malloc(sizeof(EVTBLK));
				char *old_nxp = nxp-2;
				int j =1;
				char s[50];
				while (getpfld()) {
					ev->p[j] = (MYFLT) atof(trim(sp));   /*   set sp, nxp  */
					if (j++ > PMAX) dies("score table num.%s too long\n",itoa((int) ev->p[1],s,10));
				}
				ev->opcod='f';
				ev->pcnt=j-1;
				ev->p2orig=0.;
				ev->p3orig=ev->p[3];
				dispinit();
				fgens(ev);
				
				*(nxp-1) = LF;
				op = getop();
				nxp = old_nxp;
				*nxp++ = op; 
				nxp++;
				goto again;

				continue;
			}
		case '}'/*'d'*/: /* gab A9*/
			{
				int temp;
				char *old_nxp = nxp-2;
				if ((temp=repeat_cnt_n[repeat_index])!=0) 	
					nested_repeat();
				op = getop();
 				nxp = old_nxp;
				*nxp++ = op; 
				nxp++;
				goto again;
			}

		case '{'/*'j'*/: /* gab A9 */
			{	char *old_nxp = nxp-2;
			repeat_index++;
			if (current_name) {
				fclose(str->file);
				mfree(str->body);
				str--;
				current_name = NULL;
			}
			if (str->string) {
				int c;
				err_printf("LOOP not at top level; ignored\n");
				do {    /* Ignore rest of line */
					c = getscochar(1);
				} while (c != LF && c != EOF);
			}
			else {
				char *nn = repeat_name_n[repeat_index];
				int c;
				repeat_mm_n[repeat_index] = (MACRO*)mmalloc(sizeof(MACRO));
				repeat_cnt_n[repeat_index] = 0;
				do {
					c = getscochar(1);
				} while (c==' '||c=='\t');
				do {
					repeat_cnt_n[repeat_index] = 10 * repeat_cnt_n[repeat_index] + c - '0';
					c = getscochar(1);
				} while (isdigit(c));
				if (repeat_index > 1) {
					char st[41];
					int j;
					for (j = 0; j<repeat_index; j++) {
						st[j]=' ';
						st[j+1]='\0';
					}
					printf("%s Nested LOOP=%d Level:%d\n",st, repeat_cnt_n[repeat_index], repeat_index);
				}
				else
					printf("External LOOP=%d Level:%d\n", repeat_cnt_n[repeat_index], repeat_index);
				do {
					c = getscochar(1);
				} while (c==' '||c=='\t');
				do {
					*nn++ = c;
				} while (isalpha(c=getscochar(1)) ||
					(nn!=repeat_name_n[repeat_index] && isdigit(c)));
				*nn = '\0';
				/* Define macro for counter */
				/*                           printf("Found macro definition for %s\n", */
				/* 				 repeat_name); */
				repeat_mm_n[repeat_index]->name = mmalloc(strlen(repeat_name_n[repeat_index])+1);
				strcpy(repeat_mm_n[repeat_index]->name, repeat_name_n[repeat_index]);
				repeat_mm_n[repeat_index]->acnt = 0;
				repeat_mm_n[repeat_index]->body = (char*)mmalloc(8);
				sprintf(repeat_mm_n[repeat_index]->body, "%d", 0/*1*/); /* Set value */ /*gab A9 repeats start from 0 */
				repeat_mm_n[repeat_index]->next = macros;
				macros = repeat_mm_n[repeat_index];
				while (c != LF && c != EOF) {  /* Ignore rest of line */
					c = getscochar(1);
				};
				repeat_point_n[repeat_index] = ftell(str->file);
			}
			clock_base = FL(0.0);
			warp_factor = FL(1.0);
			prvp2 = -FL(1.0);
			op = getop();
			nxp = old_nxp;
			*nxp++ = op; 
			nxp++;
			goto again;
			
			}
		case 'r':	/* For now treat as s */
			/* First deal with previous section */
			if (repeat_cnt!=0) {
				if (do_repeat()) return (rtncod);
			}
			if (current_name) {
				fclose(str->file);
				mfree(str->body);
				str--;
				current_name = NULL;
			}
			/* Then remember this state */
			*(nxp-2) = 's'; *nxp++ = LF;
			if (str->string) {
				int c;
				err_printf("Repeat not at top level; ignored\n");
				do {    /* Ignore rest of line */
					c = getscochar(1);
				} while (c != LF && c != EOF);
			}
			else {
				char *nn = repeat_name;
				int c;
				repeat_mm = (MACRO*)mmalloc(sizeof(MACRO));
				repeat_cnt = 0;
				do {
					c = getscochar(1);
				} while (c==' '||c=='\t');
				do {
					repeat_cnt = 10 * repeat_cnt + c - '0';
					c = getscochar(1);
				} while (isdigit(c));
				printf("Repeats=%d\n", repeat_cnt);
				do {
					c = getscochar(1);
				} while (c==' '||c=='\t');
				do {
					*nn++ = c;
				} while (isalpha(c=getscochar(1)) ||
					(nn!=repeat_name && isdigit(c)));
				*nn = '\0';
				/* Define macro for counter */
				/*                           printf("Found macro definition for %s\n", */
				/* 				 repeat_name); */
				repeat_mm->name = mmalloc(strlen(repeat_name)+1);
				strcpy(repeat_mm->name, repeat_name);
				repeat_mm->acnt = 0;
				repeat_mm->body = (char*)mmalloc(8);
				sprintf(repeat_mm->body, "%d", 1); /* Set value */
				repeat_mm->next = macros;
				macros = repeat_mm;
				while (c != LF && c != EOF) {  /* Ignore rest of line */
					c = getscochar(1);
				};
				repeat_point = ftell(str->file);
			}
			clock_base = FL(0.0);
			warp_factor = FL(1.0);
			prvp2 = -FL(1.0);
			return (rtncod);
		case 'e':       
			if (repeat_cnt!=0) {
				if (do_repeat()) return (rtncod);
			}
			if (current_name) {
				fclose(str->file);
				mfree(str->body);
				str--;
				current_name = NULL;
			}
			copylin();
			return(--rtncod);
		case 'm':	/* Remember this place */
			{	
				char *old_nxp = nxp-2;
				char buff[200];
				int c;
				int i = 0;
				while ((c=getscochar(1))==' ' || c=='\t');
				do {
					buff[i++]=c;
				} while (isalpha(c=getscochar(1))|| (i!=0 && isdigit(c)));
				buff[i]=0;
				printf("Named section >>>%s<<<\n", buff);
				for (i=0; i<=next_name; i++) 
					if (strcmp(buff, names[i].name)==0) break;
					if (i>next_name) {
						i = ++next_name;
						names[i].name = (char*)mmalloc(i+1);
						strcpy(names[i].name, buff);
					}
					else mfree(names[i].file);
					flushlin();
					if (!str->string) {
						names[next_name].posit = ftell(str->file);
						names[next_name].file = mmalloc(strlen(str->body)+1);
						strcpy(names[next_name].file, str->body);
						printf("%d: File %s position %ld\n",
							next_name, names[next_name].file,
							names[next_name].posit);
					}
					else {
						err_printf("Ignoring name %s not in file\n", buff);
						names[i].name[0] = '\0'; /* Destroy name */
					}
					op = getop();
					nxp = old_nxp;
					*nxp++ = op; /* Undo this line */
					nxp++;
					goto again;
			}
		case 'n':
			{
				char *old_nxp = nxp-2;
				char buff[200];
				int c;
				int i = 0;
				while ((c=getscochar(1))==' ' || c=='\t');
				do {
					buff[i++]=c;
				} while (isalpha(c=getscochar(1))|| (i!=0 && isdigit(c)));
				buff[i]='\0';
				flushlin();
				for (i = 0; i<=next_name; i++)
					if (strcmp(buff, names[i].name)==0) break;
					if (i>next_name) err_printf(Str(X_352,"Name not found"), buff);
					else {
						printf(Str(X_249,"Duplicate %d: %s (%s,%ld)\n"),
							i, buff, names[i].file, names[i].posit);
						str++;
						str->string = 0;
						str->file = fopen(names[i].file, "r");
						/*RWD 3:2000*/
						if (str->file==NULL)
                            dies(Str(X_214,"cannot open input file %s\n"),names[i].file);
						str->body = mmalloc(strlen(names[i].file)+1);
						fseek(str->file, names[i].posit, SEEK_SET);
						strcpy(str->body, names[i].file);
					}
					op = getop();
					nxp = old_nxp;
					*nxp++ = op; /* Undo this line */
					nxp++;
					goto again;
			}
	      case 'v':	/* Suggestion of Bryan Bales */
				  {	/* Set local variability of time */
					  char *old_nxp = nxp-2;
					  getpfld();
					  warp_factor = stof(sp);
#ifdef MACDEBUG
					  printf("Warp_factor = %f\n", warp_factor);
#endif
					  flushlin();
					  op = getop();
					  nxp = old_nxp;
					  *nxp++ = op; /* Undo this line */
					  nxp++;
					  goto again;
				  }
			  default:
				  err_printf("sread is confused on legal opcodes\n");
				  break;
		}
	}
	if (rtncod<0)		/* Ending so clear macros */
		while (macros!=NULL) {
			int i;
			mfree(macros->body);
			mfree(macros->name);
			for (i=0; i<macros->acnt; i++) mfree(macros->arg[i]);
			macros = macros->next;
		}
		return(--rtncod);
}

static void copylin(void)	/* copy source line to srtblk   */
{
	int c;
	nxp--;
	do {
	    c = getscochar(1);
	    *nxp++ = c;
	} while (c != LF && c != EOF);
	if (c == EOF) *(nxp-1) = '\n'; /* Avoid EOF characters */
	lincnt++;
	linpos = 0;
}                

static void copypflds(void)
{
        bp->pcnt = 0;
	while (getpfld())       /* copy each pfield,    */
		bp->pcnt++;     /* count them,          */
	*(nxp-1) = LF;          /* terminate with newline */
 }

static void ifa(void)
{
	SRTBLK *prvbp;
	int n;
	
	bp->pcnt = 0;
	while (getpfld()) {             /* while there's another pfield,  */
		if (++bp->pcnt == PMAX) {
			err_printf(Str(X_1238,"sread: instr pcount exceeds PMAX\n"));
			err_printf(Str(X_561,"\t sect %d line %d\n"), sectcnt, lincnt);
			err_printf(Str(X_3,"      remainder of line flushed\n"));
			flushlin();
			continue;
		}
                if (*sp == '^' && op == 'i' && bp->pcnt == 2) {
                  if (*(sp+1)=='+') sp++;
		  if (prvp2<0) {
		    err_printf(Str(X_369,"No previous event in ^\n"));
		    prvp2 = bp->p2val = warp_factor*stof(sp+1);
		  }
                  else prvp2 = bp->p2val = prvp2 + warp_factor*stof(sp+1);
                }
		else if (nxp-sp == 2 && (*sp == '.' || *sp == '+')) {
                  if (op == 'i'
                      && (*sp == '.' || bp->pcnt == 2)
                      && ((bp->pcnt >= 2 && (prvbp = prvibp) != NULL
                           && bp->pcnt <= prvbp->pcnt)
                          || (bp->pcnt == 1 && (prvbp = bp->prvblk) != NULL
                              && prvbp->text[0] == 'i'))) {
                    if (*sp == '.') {
                      nxp = sp;
                      pcopy((int)bp->pcnt, 1, prvbp);
                      prvp2 = bp->p2val;
                    }
                    else /* need the fabs() in case of neg p3 */
                      prvp2 = bp->p2val = prvbp->p2val + (MYFLT)fabs(prvbp->p3val);
                  }
                  else carryerror();
		}
		else switch(bp->pcnt) {         /*  watch for p1,p2,p3, */
			case 1: bp->p1val = stof(sp);   /*   & MYFLT, setinsno..*/
				if (op == 'i')
					setprv();
				else prvibp = NULL;
				break;
			case 2: prvp2 = bp->p2val = warp_factor*stof(sp)+clock_base;
				break;
			case 3: if (op == 'i') bp->p3val = warp_factor*stof(sp);
				else bp->p3val = stof(sp);
				break;
			default:break;
		}
		switch(bp->pcnt) {              /* newp2, newp3:        */
		case 2:	if (warpin) {                   /* for warpin,  */
			getpfld();              /*   newp2 follows */
			bp->newp2 = warp_factor*stof(sp)+clock_base;
			nxp = sp;               /*    (skip text)  */
				}
			else bp->newp2 = bp->p2val;     /* else use p2val  */
			break;
		case 3: if (warpin && op == 'i') {
			getpfld();
			bp->newp3 = warp_factor*stof(sp);   /* same for newp3  */
			nxp = sp;
				}
			else bp->newp3 = bp->p3val;
			break;
		}
	}
	if (op == 'i'                   /* then carry any rem pflds */
		&& ((prvbp = prvibp) != NULL
		|| !bp->pcnt && (prvbp = bp->prvblk) != NULL
		&& prvbp->text[0] == 'i')
		&& (n = prvbp->pcnt - bp->pcnt) > 0) {
		pcopy((int)bp->pcnt + 1, n, prvbp);
		bp->pcnt += n;
	}
	*(nxp-1) = LF;                  /* terminate this stmnt with newline */
}

static void setprv(void)	/*  set insno = (int) p1val     */
{				/*  prvibp = prv note, same insno */
	SRTBLK *p;
	short n;

	n = bp->insno = (short) bp->p1val;              /* set current insno */
	p = bp;
	while ((p = p->prvblk) != NULL)
	        if (p->insno == n) {
		        prvibp = p;                     /* find prev same */
			return;
		}
	prvibp = NULL;                                  /*  if there is one */
}

static void carryerror(void)	/* print offending text line */
{				/*      (partial)            */
	char *p;

	err_printf(
	 "sread: illegal use of carry, sect %d line %d,   0 substituted\n",
		sectcnt,lincnt);
	*(nxp-3) = SP;
	p = bp->text;
	while (p <= nxp-2)
		err_printf("%c",*p++);
	err_printf("<=\n");
	*(nxp-2) = '0';
}

static void pcopy(int pfno, int ncopy, SRTBLK *prvbp)
				/* cpy pfields from prev note of this instr */
				/*     begin at pfno, copy 'ncopy' fields   */
				/*     uses *nxp++;    sp untouched         */
{
	char *p, *pp, c;
	int  n;

	pp = prvbp->text;                       /* in text of prev note,    */
	n = pfno;
	while (n--)
		while (*pp++ != SP)             /*    locate starting pfld  */
			;
	n = ncopy;
	p = nxp;
	while (n--) {                           /*      and copy n pflds    */
		if (*pp != '"')
		        while ((*p++ = c = *pp++) != SP && c != LF)
			        ;
		else {
			*p++ = *pp++;
		        while ((*p++ = *pp++) != '"')
			        ;
			*p++ = *pp++;
		}
		switch(pfno) {
		case 1: bp->p1val = prvbp->p1val;       /*  with p1-p3 vals */
			setprv();
			break;
		case 2: if (*(p-2) == '+')              /* (interpr . of +) */
		          prvp2 = bp->p2val = prvbp->p2val + (MYFLT)fabs(prvbp->p3val);
			else prvp2 = bp->p2val = prvbp->p2val;
			bp->newp2 = bp->p2val;
			break;
		case 3: bp->newp3 = bp->p3val = prvbp->p3val;
			break;
		default:break;
		}
		pfno++;
	}
	nxp = p;                                /* adjust globl nxp pntr */
}

static void salcinit(void)    /* init the sorter mem space for a new section */
{                             /*  alloc 1st memblk if nec; init *nxp to this */
	if ((curmem = basmem) == NULL) {
		curmem = basmem = (MEMHDR *) mmalloc((long)MEMSIZ);
		curmem->nxtmem = NULL;
		curmem->memend = (char *)curmem + MEMSIZ;
        }                                 
	memend = curmem->memend;
	nxp = (char *)curmem + sizeof(MEMHDR);
}

static void salcblk(void)       /* alloc a srtblk from current mem space:   */
{				/*   align following *nxp, set new bp, nxp  */
				/*   set srtblk lnks, put op+blank in text  */

	SRTBLK *prvbp;

	if (memend - nxp < MARGIN) {            /* if this memblk exhausted */
                if (nxp > memend)  goto margerr;
		if (curmem->nxtmem != NULL)          /*      chain to next  */
			curmem = curmem->nxtmem;
		else {                               /*      or alloc a new */
		        MEMHDR *prvmem = curmem;
			err_printf("sread: requesting more memory\n");
			curmem = (MEMHDR *) mmalloc((long)MEMSIZ);
			prvmem->nxtmem = curmem;
			curmem->nxtmem = NULL;
			curmem->memend = (char *)curmem + MEMSIZ;
		}
		memend = curmem->memend;
		nxp = (char *)curmem + sizeof(MEMHDR);
	}
				/* now allocate a srtblk from this space:   */
	prvbp = bp;
#ifdef __alpha__
	/*
	 * On Alpha we need to round up to 8 bytes (64 bits).
	 * heh 981101
	 */
	bp = (SRTBLK *) ((((LONG) nxp) + 7) & ~0x7);
#else
	bp = (SRTBLK *) ((((long) nxp) + 3) & -4);
#endif
	if (frstbp == NULL)
		frstbp = bp;
        if (prvbp != NULL)
		prvbp->nxtblk = bp;     /* link with prev srtblk        */
	bp->prvblk = prvbp;
	bp->nxtblk = NULL;
	nxp = bp->text;
	*nxp++ = op;                    /* place op, blank into text    */
	*nxp++ = SP;
	return;

margerr:  err_printf("sread:  text space overrun, increase MARGIN\n");
	exit(1);
}

void sfree(void)		/* free all sorter allocated space */
{				/*    called at completion of sort */
  MEMHDR *curmem, *nxtmem;

        for (curmem = basmem; curmem != NULL; curmem = nxtmem) {
		nxtmem = curmem->nxtmem;
		mfree((char *)curmem);
	}
	basmem = NULL;
}

static void flushlin(void)	/* flush input to end-of-line;  inc lincnt */
{
	int c;
	while ((c = getscochar(0)) != LF && c != EOF)
		;
	lincnt++;
	linpos = 0;
}

static int sget1(void)		/* get first non-white, non-comment char */
{
    int c;
	
srch:
    while ((c = getscochar(1)) == SP || c == '\t' || c == LF)
		if (c == LF) {
			lincnt++;
			linpos = 0;
		}
		if (c == ';' || c == 'c') {
			flushlin();
			goto srch;
		}
		if (c == '\\') {            /* Deal with continuations and specials */
			/* printf("Escaped\n"); */
again:
			c = getscochar(1);
			if (c==';') {
				while ((c=getscochar(1)!='\n') && c!=EOF);
				goto srch;
			}
			if (c==' ' || c=='\t') goto again;
			if (c!='\n' && c!=EOF) {
				err_printf("Improper \\");
				while (c!='\n' && c!=EOF) c = getscochar(1);
			}
			goto srch;
		}
		if (c == '/') {             /* Could be a C-comment */
			c= getc(str->file);/* gab A9*/
			if (c!='*') {
				ungetc(c, str->file);
				c = '/';
			}
			else {          /* gab A9*/  /* It is a comment */
				char d;
				do {
					c= getc(str->file);
					d= getc(str->file);
					ungetc(d, str->file);
				} while (!(c == '*' && d == '/') );
				getc(str->file);
				goto srch;
			}

		}
		if (c == '#') {
			/* Start Macro definition */
			char mname[100];
			int i=0;
			int arg = 0;
			int size = 100;
			MACRO *mm = (MACRO*)mmalloc(sizeof(MACRO));
			mm->margs = MARGS;
			while (isspace(c = getscochar(1)));
			if (c=='d') {
				if ((c = getscochar(1))!='e' || (c = getscochar(1))!='f' ||
					(c = getscochar(1))!='i' || (c = getscochar(1))!='n' ||
					(c = getscochar(1))!='e') {
					err_printf("Not #define");
					flushlin();
					goto srch;
				}
				while (isspace(c = getscochar(1)));
				do {
					mname[i++] = c;
				} while (isalpha(c = getscochar(1)) || (i!=0 && isdigit(c)));
				mname[i] = '\0';
				printf("macro definition for %s\n", mname);
				mm->name = mmalloc(i+1);
				strcpy(mm->name, mname);
				if (c == '(') {	/* arguments */
					/* 	      printf("M-arguments: "); */
					do {
						i = 0;
						while ((c=getscochar(1))==' ' || c=='\0') ; /* remove spaces before arg (gab A9)  */
						ungetscochar(c); /* gab A9 */
						while (isalpha(c = getscochar(1)) || (i!=0 && isdigit(c)))
							mname[i++] = c;
						while (c==' ') c=getscochar(1); /* remove spaces after arg (gab A9)  */
						mname[i] = '\0';
						/* 		printf("%s\t", mname); */
						mm->arg[arg] = mmalloc(i+1);
						strcpy(mm->arg[arg++], mname);
						if (arg>=MARGS) {
							err_printf("Too many arguments to macro");
							flushlin();
							goto srch;
						}
					} while (c=='\'' /*'#'*/); /* gab A9 */
					if (c!=')') {
						err_printf("macro error\n");
						flushlin();
						goto srch;
					}
				}
				mm->acnt = arg;
				i = 0;
				while ((c = getscochar(1))!= '#'); /* Skip to next # */
				mm->body = (char*)mmalloc(100);
				while ((c = getscochar(0))!= '#') {	/* Do not expand here!! */
					mm->body[i++] = c;
					if (c=='\n') lincnt++;
					if (i>= size)
						mm->body = mrealloc(mm->body, size += 100);
				}
				mm->body[i]='\0';
				mm->next = macros;
				macros = mm;
				printf("Macro %s with %d arguments defined\n",  mm->name, mm->acnt);
				c = ' ';
				flushlin();
				goto srch;
			}
			else if (c=='i') {
				int delim;
				if ((c = getscochar(1))!='n' || (c = getscochar(1))!='c' ||
					(c = getscochar(1))!='l' || (c = getscochar(1))!='u' ||
					(c = getscochar(1))!='d' || (c = getscochar(1))!='e') {
					err_printf("Not #include");
					flushlin();
					goto srch;
				}
				while (isspace(c = getscochar(1)));
				delim = c;
				i = 0;
				while ((c=getscochar(1))!=delim) mname[i++] = c;
				mname[i]='\0';
				while ((c=getscochar(1))!='\n');
				str++;
				str->string = 0;
				str->file = fopen_path(mname, scorename, "INCDIR", "r");
				if (str->file==0) {
					printf("Cannot open #include'd file %s\n", mname);
					str--;
				}
				else {
					str->body = mmalloc(strlen(name_full)+1);
					strcpy(str->body, name_full);
				}
			}
			else if (c=='u') {
				if ((c = getscochar(1))!='n' || (c = getscochar(1))!='d' ||
					(c = getscochar(1))!='e' || (c = getscochar(1))!='f') {
					err_printf("Not #undef");
					flushlin();
					goto srch;
				}
				while (isspace(c = getscochar(1)));
				do {
					mname[i++] = c;
				} while (isalpha(c = getscochar(1))|| (i!=0 && isdigit(c)));
				mname[i] = '\0';
				printf("macro %s undefined\n", mname);
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
						if (nn==NULL) scorerr("Undefining undefined macro");
					}
					mfree(nn->name); mfree(nn->body);
					for (i=0; i<nn->acnt; i++)
						mfree(nn->arg[i]);
					mm->next = nn->next; mfree(nn);
				}
				while (c!='\n') c = getscochar(1); /* ignore rest of line */
				lincnt++;
			}
			else {
				err_printf("Unknown # option");
				flushlin();
				goto srch;
			}
			flushlin();
			goto srch;
    }
	
    return(c);
}

static int getop(void)		/* get next legal opcode */
{
    int c;

 nextc:
    c = sget1();                    /* get first active char */
    switch(c) {                     /*   and check legality  */
    case 'a':
    case 'b':		/* Reset base clock */
    case 'e':		/* End of all */
    case 'f':
    case 'i':
    case 'm':		/* Mark this point */
    case 'n':		/* Duplicate from named position */
    case 'r':		/* Repeated section */
    case 's':		/* Section */
    case 't':
    case 'v':		/* Local warping */
    case 'w':
    case 'F':	/*sco tables (gab A9)*/
	case '{': /* gab A9 */
	case '}': /* gab A9 */
	case EOF:
      break;                  /* if ok, go with it    */
    default:                        /*   else complain      */
      err_printf( "sread: illegal opcode %c, sect %d line %d\n",
		  c,sectcnt,lincnt);
      err_printf("      remainder of line flushed\n");
      flushlin();
      goto nextc;
    }
    linpos++;
    return(c);
}

static int getpfld(void)	     /* get pfield val from SCOREIN file */
{                                    /*      set sp, nxp                 */
    int  c;
    char *p;

    if ((c = sget1()) == EOF)        /* get 1st non-white,non-comment c  */
      return(0);

    if ((c < '0' || c > '9')                  /* if non-numeric          */
	&& c != '.' && c != '+' && c != '-'   /*    and non-carry        */
	&& c != '^' && c != 'n' && c != 'p'   /*    and non-special-char */
	&& c != '<' && c != '>' && c != '|' && c != '(' && c != ')' /*&& c != '{' && c != '}'   gab A9 */
	&& c != '"' && c != '~' ) {
      ungetscochar(c);                        /* then no more pfields    */
      if (linpos)
	err_printf("sread: unexpected char %c, sect %d line %d\n",
		   c, sectcnt, lincnt);
      return(0);                              /*    so return            */
    }
    p = sp = nxp;                         /* else start copying to text  */
    *p++ = c;
    linpos++;
    if (c == '"') {                           /* if have quoted string,  */
      if (bp->pcnt < 3) {
	err_printf("sread: illegally placed string, sect %d line %d\n",
		   sectcnt,lincnt);
	return(0);
      }
      while ((c = getscochar(1)) != '"') {
	if (c == LF || c == EOF) {
	  err_printf("sread: unmatched quote, sect %d line %d\n",
		     sectcnt,lincnt);
	  return(0);
	}
	*p++ = c;                       /*   copy to matched quote */
      }
      *p++ = c;
      goto blank;
    }
    while (((c = getscochar(1)) >= '0' && c <= '9')
	   || c == '.' || c == '+' || c == '-' || c == 'e' || c == 'E'
	   || c == 'n' || c == 'p'          /* else while legal chars,  */
	   || c == '<' || c == '>' || c == '|' 
	 /* gab a9 || c == '{' || c == '}'*/ || c == '(' || c == ')'
	  || c == '~')  /*   continue to bld string */
      *p++ = c;
    ungetscochar(c);                        /* any illegal is delimiter */
 blank:
    *p++ = SP;
    nxp = p;                                /*  add blank      */
    return(1);                              /*  and report ok  */
}

MYFLT stof(char s[])		/* convert string to MYFLT  */
				/* (assumes no white space at beginning */
{				/*      but a blank or nl at end)       */
    char *p;
    MYFLT x = (MYFLT)strtod(s, &p);
    if (s == p || (*p != SP && *p != LF)) {
      err_printf("sread: illegal number format, sect %d line %d:  ",
		 sectcnt,lincnt);
      p = s;
      while (*p != SP && *p != LF) {
	err_printf("%c", *p);
	*p++ = '0';
      }
      err_printf("   zero substituted.\n");
      return FL(0.0);
    }
    return x;
/* 	double val, power; */
/* 	int sign; */
/* 	char *p; */

/* 	sign = 1; */
/* 	p = s; */
/* 	if (*p == '+') */
/* 		p++; */
/* 	if (*p == '-') { */
/* 		p++; */
/* 		sign = -1; */
/* 	} */
/* 	for (val = 0; *p >= '0' && *p <= '9'; p++) */
/* 		val = 10 * val + (*p - '0'); */
/* 	if (*p == '.') */
/* 		p++; */
/* 	for (power = 1; *p >= '0' && *p <= '9'; p++) { */
/* 		val = 10 * val + (*p - '0'); */
/* 		power *= 10; */
/* 	} */
/* 	if (*p != SP && *p != LF) { */
/* 		err_printf( */
/* 		 "sread: illegal number format, sect %d line %d:  ", */
/* 			sectcnt,lincnt); */
/* 		p = s; */
/* 		while (*p != SP && *p != LF) { */
/* 			err_printf("%c", *p); */
/* 			*p++ = '0'; */
/* 		} */
/* 		err_printf("   zero substituted.\n"); */
/* 		val = 0; */
/*         } */
/*         return((MYFLT)(sign * val / power)); */
}
