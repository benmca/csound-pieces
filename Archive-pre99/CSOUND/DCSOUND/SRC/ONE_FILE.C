#include "cs.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

static char buffer[200];
static char orcname[L_tmpnam+4];
       char sconame[L_tmpnam+4];
static char midname[L_tmpnam+4];
static int midiSet;
#ifndef TRUE
#define TRUE (1)
#define FALSE (0)
#endif

typedef struct namelst {
  char           *name;
  struct namelst *next;
} NAMELST;

NAMELST *toremove = NULL;

#ifdef CWIN
typedef void ExitFunction(void);
extern int cwin_atexit(ExitFunction*);
#endif

#ifdef WIN32
char *mytmpnam(char *a)
{
    char *dir = getenv("SFDIR");
    if (dir==NULL) dir=getenv("HOME");
    dir = _tempnam(dir, "cs");
    strcpy(a, dir);
    free(dir);
    return a;
}
#endif

#ifdef _macintosh
#define fgets macgetstring
char macBuffer[200];
int macBufNdx = 200;
char *macgetstring(char *str, int num, FILE *stream)
{
    int bufferNdx = 0;
    size_t ourReturn;
    while (true) {
      if (macBufNdx >= 200) { /*then we must read in new buffer */
	macBufNdx = 0;
	ourReturn = fread(macBuffer, 1, num, stream);
	if (ourReturn == 0)
	  return NULL;
      }
      else {
	char c = macBuffer[macBufNdx];
	if (c == '\0' || c == '\n' || c == '\r') {
	  buffer[bufferNdx] = '\r';
	  if (bufferNdx < 199)
	    buffer[bufferNdx+1] = '\0';
	  macBufNdx++;
	  return buffer;
	}
	else {
	  buffer[bufferNdx] = c;
	  bufferNdx++;
	  macBufNdx++;
	}
      }
    }
}
#endif

static char *my_fgets(char *s, int n, FILE *stream)
{
    char *a = s;
    if (n <= 1) return NULL;                  /* best of a bad deal */
    do {
      int ch = getc(stream);
      if (ch == EOF) {                       /* error or EOF       */
        if (s == a) return NULL;         /* no chars -> leave  */
        if (ferror(stream)) a = NULL;
        break; /* add NULL even if ferror(), spec says 'indeterminate' */
      }
      if ((*s++ = ch) == '\n') break;
      if (*(s-1) == '\r') break;
    }
    while (--n > 1);
    *s = 0;
    return a;
}

/* static */ void deleteOrch(void)
{
    remove(orcname);
}

void deleteScore(void)
{
    remove(sconame);
}

static void deleteMIDI(void)
{
    remove(midname);
}

int firstsamp = 1;
int sampused[100];
static void deleteSamp(void)
{
    int i;
    char name[256];
    for (i=0; i<100; i++) 
      if (sampused[i]) {
        sprintf(name, "soundin.%d", i);
        remove(name);
      }
    while (toremove) {
      NAMELST *nxt = toremove->next;
      remove(toremove->name);
      free(toremove->name);
      free(toremove);
      toremove = nxt;
    }
}

static     char files[1000];
extern int argdecode(int, char**, char**, char*);

int readOptions(FILE *unf)
{
    char *p;
    int argc = 0;
    char *argv[100];
    char *filnamp = files;

    while (my_fgets(buffer, 200, unf)!= NULL) {
      if (strstr(buffer,"</CsOptions>") == buffer) {
	return TRUE;
      }
      argc = 1;
      p = buffer;
      while (*p == ' ') p++;      /* Ignore leading spaces */
      if (*p==';' || *p=='#') continue; /* Comment line? */
      if (*p=='\n' || *p=='\r') continue; /* Empty line? */
      argv[1] = p;
      while (*p != '\0') {
	if (*p==' ') {
          *p++ = '\0';
#ifdef _DEBUG
          printf("argc=%d argv[%d]=%s\n", argc, argc, argv[argc]);
#endif
          while (*p == ' ' || *p == '\t') p++; /*gab a8*/
	  if (*p==';' ||
              *p=='#' ||
              (*p == '/' && *(p+1) == '/')) { /* Comment line? */
	    *p = '\0'; break;
	  }
          if (*p == '/' && *(p+1) == '*') {  /* Comment line? */
            p += 2;
          top:
            while (*p != '*' && *p != '\0') p++;
            if (*p == '*' && *(p+1)== '/') {
              p += 2; break;
            }
            if (*p=='*') {
              p++; goto top;
            }
            my_fgets(buffer, 200, unf);
            p = buffer; goto top;
	  }
          argv[++argc] = p;
        }
        else if (*p=='\n' || *p == '\r' || *p==13 || *p==10) { /*gab A8*/
	  *p = '\0';
	  break;
	}
	p++;
      }
#ifdef _DEBUG
      printf("argc=%d argv[%d]=%s\n", argc, argc, argv[argc]);
#endif
      argdecode(argc, argv, &filnamp, getenv("SFOUTYP")); /* Read an argv thing */
    }
    return FALSE;
}

static int createOrchestra(FILE *unf)
{
    char *p;
    FILE *orcf;

    tmpnam(orcname);		/* Generate orchestra name */
    if ((p=strchr(orcname, '.')) != NULL) *p='\0'; /* with extention */
    strcat(orcname, ".orc");
    orcf = fopen(orcname, "wt"); /* gab c3 */
    printf(Str(X_232,"Creating %s (%p)\n"), orcname, orcf);
    if (orcf==NULL){
      perror(Str(X_269,"Failed to create\n"));
      exit(1);
    }
    while (my_fgets(buffer, 200, unf)!= NULL) {
      if (strstr(buffer,"</CsInstruments>") == buffer) {
	fclose(orcf);
	atexit(deleteOrch);
	return TRUE;
      }
      else fputs(buffer, orcf);
    }
    return FALSE;
}


static int createScore(FILE *unf)
{
    char *p;
    FILE *scof;

    tmpnam(sconame);		/* Generate score name */
    if ((p=strchr(sconame, '.')) != NULL) *p='\0'; /* with extention */
    strcat(sconame, ".sco");
    scof = fopen(sconame, "wt"); /* gab c3 */
	/*RWD 3:2000*/
    if (scof==NULL)
      return FALSE;

    while (my_fgets(buffer, 200, unf)!= NULL) {
      if (strstr(buffer,"</CsScore>") == buffer) {
	fclose(scof);
	atexit(deleteScore);
	return TRUE;
      }
      else fputs(buffer, scof);
    }
    return FALSE;
}

static int createMIDI(FILE *unf)
{
    int size;
    char *p;
    FILE *midf;
    int c;

    if (tmpnam(midname)==NULL) { /* Generate MIDI file name */
      printf(Str(X_206,"Cannot create temporary file for MIDI subfile\n"));
      exit(1);
    }
    if ((p=strchr(midname, '.')) != NULL) *p='\0'; /* with extention */
    strcat(midname, ".mid");
    midf = fopen(midname, "wb");
    if (midf==NULL) {
      printf(Str(X_217,"Cannot open temporary file (%s) for MIDI subfile\n"), midname);
      exit(1);
    }
    my_fgets(buffer, 200, unf);
    if (sscanf(buffer, Str(X_464,"Size = %d"), &size)==0) {
      printf(Str(X_255,"Error in reading MIDI subfile -- no size read\n"));
      exit(1);
    }
    for (; size > 0; size--) {
      c = getc(unf);
      putc(c, midf);
    }
    fclose(midf);
    atexit(deleteMIDI);
    midiSet = TRUE;
    while (TRUE) {
      if (my_fgets(buffer, 200, unf)!= NULL) {
        if (strstr(buffer,"</CsMidifile>") == buffer) {
          return TRUE;
        }
      }
    }
    return FALSE;
}

static void read_base64(FILE *in, FILE *out)
{
    int c;
    int cycl = 0;
    int n[4];

    do {
      c = getc(in);
    } while (c==' ' || c=='\n');
    ungetc(c, in);
    while ((c = getc(in)) != '=' && c != '<') {
      while (c == '\n') c = getc(in);
      if (c == '=' || c == '<' || c == EOF) break;
      if (isupper(c))       n[cycl] = c-'A';
      else if (islower(c))  n[cycl] = c-'a'+26;
      else if (isdigit(c))  n[cycl] = c-'0'+52;
      else if (c == '+')    n[cycl] = 62;
      else if (c == '/')    n[cycl] = 63;
      else {
	fprintf(stderr, "Non 64base character %c(%2x)\n", c, c);
	exit(1);
      }
      cycl++;
      if (cycl == 4) {
	putc((n[0] << 2) | (n[1] >> 4), out);
	putc(((n[1] & 0xf) <<4) | ((n[2] >> 2) & 0xf), out);
	putc(((n[2] & 0x3) << 6) | n[3], out);
	cycl = 0;
      }
    }
    if (c=='<') ungetc(c, in);
    if (cycl == 1) {
      fprintf(stderr, "Ended on cycl=1\n");
    }
    else if (cycl == 2) {
      putc((n[0] << 2) | (n[1] >> 4), out);
    }
    else if (cycl == 3) {
	putc((n[0] << 2) | (n[1] >> 4), out);
	putc(((n[1] & 0xf) <<4) | ((n[2] >> 2) & 0xf), out);
    }
}

static int createMIDI2(FILE *unf)
{
    char *p;
    FILE *midf;

    if (tmpnam(midname)==NULL) { /* Generate MIDI file name */
      printf(Str(X_206,"Cannot create temporary file for MIDI subfile\n"));
      exit(1);
    }
    if ((p=strchr(midname, '.')) != NULL) *p='\0'; /* with extention */
    strcat(midname, ".mid");
    midf = fopen(midname, "wb");
    if (midf==NULL) {
      printf(Str(X_217,"Cannot open temporary file (%s) for MIDI subfile\n"),
             midname);
      exit(1);
    }
    read_base64(unf, midf);
    fclose(midf);
    atexit(deleteMIDI);
    midiSet = TRUE;
    while (TRUE) {
      if (my_fgets(buffer, 200, unf)!= NULL) {
        if (strstr(buffer,"</CsMidifileB>") == buffer) {
          return TRUE;
        }
      }
    }
    return FALSE;
}

static int createSample(FILE *unf)
{
    int num;
    FILE *smpf;
    char sampname[256];

    sscanf(buffer, "<CsSampleB filename=%d>", &num);
    sprintf(sampname, "soundin.%d", num);
    if ((smpf=fopen(sampname, "r")) !=NULL) {
      printf("File %s already exists\n", sampname);
      exit(1);
    }
    fclose(smpf);
    smpf = fopen(sampname, "wb");
    if (smpf==NULL) {
      printf("Cannot open sample file (%s) subfile\n", sampname);
      exit(1);
    }
    read_base64(unf, smpf);
    fclose(smpf);
    sampused[num] = 1;          /* Remember to delete */
    if (firstsamp) {
      atexit(deleteSamp);
      firstsamp = 0;
    }
    while (TRUE) {
      if (my_fgets(buffer, 200, unf)!= NULL) {
        if (strstr(buffer,"</CsSampleB>") == buffer) {
          return TRUE;
        }
      }
    }
    return FALSE;
}

static int createFile(FILE *unf)
{
    FILE *smpf;
    char filename[256];

    sscanf(buffer, "<CsFileB filename=%s>", filename);
    if ((smpf=fopen(filename, "r")) !=NULL) {
      printf("File %s already exists\n", filename);
      exit(1);
    }
    fclose(smpf);
    smpf = fopen(filename, "wb");
    if (smpf==NULL) {
      printf("Cannot open file (%s) subfile\n", filename);
      exit(1);
    }
    read_base64(unf, smpf);
    fclose(smpf);
    if (firstsamp) {
      atexit(deleteSamp);
      firstsamp = 0;
    }
    {                           /* Remember name to delete */
      NAMELST *n = (NAMELST*)malloc(sizeof(NAMELST));
      n->next = toremove;
      toremove = n;
      n->name = (char*)malloc(1+strlen(filename));
      strcpy(n->name, filename);
    }
    while (TRUE) {
      if (my_fgets(buffer, 200, unf)!= NULL) {
        if (strstr(buffer,"</CsFileB>") == buffer) {
          return TRUE;
        }
      }
    }
    return FALSE;
}

static int checkVersion(FILE *unf)
{
    int major = 0, minor = 0;
    int result = TRUE;
    while (my_fgets(buffer, 200, unf)!= NULL) {
      if (strstr(buffer, "</CsVersion>")==0) return result;
      if (strstr(buffer, "Before")==0) {
        sscanf(buffer, "Before %d.%d", &major, &minor);
        if (VERSION>major) result = FALSE;
        else if (SUBVER>minor) result = FALSE;
      }
      else if (strstr(buffer, "After")==0) {
        sscanf(buffer, "After %d.%d", &major, &minor);
        if (VERSION<major) result = FALSE;
        else if (SUBVER<minor) result = FALSE;
      }
      else if (sscanf(buffer, "%d.%d", &major, &minor)==2) {
        if (VERSION<major) result = FALSE;
        else if (SUBVER<minor) result = FALSE;
      }
    }
    return FALSE;               /* cannot get here, but CodeWarrior fails */
}

check_empty(char *buf)  /*gab A8*/
{
	while (*buf) {
		if (*buf !=' ' && *buf !='\t' && *buf !=13 &&  *buf !=10) {
			if (*buf == ';') return 1;
			else	return 0;
		}
		buf++;
	}
	return 1;
}

static int eat_to_eol(char *buf)
{
    int i=0;

    while(buf[i] != '\n' && buf[i] != '\r')
        ++i;

    return i;	/* keep the \n for further processing */
}

int blank_buffer(void)
{
    int i=0;
    if (buffer[i] == ';')
      i += eat_to_eol(&buffer[i]);
    while (buffer[i]!='\n' && buffer[i]!='\0') {
      if (buffer[i]!=' ' && buffer[i]!='\t') return FALSE;
	  	  i++;	  /* gab e4*/
    }
    return TRUE;
}

int read_unified_file(char **pname, char **score)
{
    char *name = *pname;
    FILE *unf  = fopen(name, "rb"); /* Need to open in binary to deal with
                                       MIDI and the like. */
    int result = TRUE;
    int started = FALSE;
    int r;
	/*RWD 3:2000  fopen can fail...*/
    if (unf==NULL)
      return 0;

    orcname[0] = sconame[0] = midname[0] = '\0';
    midiSet = FALSE;
    firstsamp = 1;
    memset(sampused, 0, 100*sizeof(int));
    toremove = NULL;
//#ifdef _DEBUG
    printf("Calling unified file system with %s\n", name);
//#endif
    while (my_fgets(buffer, 200, unf)) {
      if (strstr(buffer,"<CsoundSynthesizer>") == buffer ||
	  strstr(buffer,"<CsoundSynthesiser>") == buffer) {
	printf(Str(X_453,"STARTING FILE\n"));
        started = TRUE;
      }
      else if (strstr(buffer,"</CsoundSynthesizer>") == buffer ||
	       strstr(buffer,"</CsoundSynthesiser>") == buffer)	{
	*pname = orcname;
	*score = sconame;
	if (midiSet) {
          O.FMidiname = midname;
          O.FMidiin = 1;
        }
        fclose(unf);
	return result;
      }
      else if (strstr(buffer,"<CsOptions>") == buffer) {
	printf(Str(X_233,"Creating options\n"));
	r = readOptions(unf);
        result = r && result;
      }
/*        else if (strstr(buffer,"<CsFunctions>") == buffer) { */
/*  	importFunctions(unf); */
/*        } */
      else if (strstr(buffer,"<CsInstruments>") == buffer) {
	printf(Str(X_234,"Creating orchestra\n"));
	r = createOrchestra(unf);
        result = r && result;
      }
/*  	  else if (strstr(buffer,"<CsArrangement>") == buffer) { */
/*  	    importArrangement(unf); */
/*  	  } */
      else if (strstr(buffer,"<CsScore>") == buffer) {
	printf(Str(X_235,"Creating score\n"));
	r = createScore(unf);
        result = r && result;
      }
/*  	  else if (strstr(buffer,"<CsTestScore>") == buffer) { */
/*  	    importTestScore(unf); */
/*  	  } */
      else if (strstr(buffer,"<CsMidifile>") == buffer) {
	r = createMIDI(unf);
        result = r && result;
      }
      else if (strstr(buffer,"<CsMidifileB>") == buffer) {
	r = createMIDI2(unf);
        result = r && result;
      }
      else if (strstr(buffer,"<CsSampleB filename=") == buffer) {
        r = createSample(unf);
        result = r && result;
      }
      else if (strstr(buffer,"<CsFileB filename=") == buffer) {
        r = createFile(unf);
        result = r && result;
      }
      else if (strstr(buffer,"<CsVersion>") == buffer) {
        r = checkVersion(unf);
        result = r && result;
      }
      else if (blank_buffer()) continue;
	  else if (check_empty(buffer)) ;/*gab A8*/
      else if (started && strchr(buffer, '<') == buffer) {
        printf(Str(X_510,"unknown command :%s\n"), buffer);
      }
      else {                    /* Quietly skip unknown text */
	/* printf(Str(X_510,"unknown command :%s\n"), buffer); */
      }
    }
    fclose(unf);
    return result;
}
