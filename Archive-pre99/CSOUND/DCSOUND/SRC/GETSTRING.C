#include "cs.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

static char **strings;
static long baseloc;
static FILE *db;

extern long natlong(long);
#ifdef WIN32
extern char *getDB(void);
#endif

char *getstring(int n)
{
    long loc;
    int len;

    if (strings[n]!=NULL) return strings[n];
    fseek(db, n*sizeof(long)+baseloc, SEEK_SET);
    fread(&loc, sizeof(long), 1, db);
    loc = natlong(loc);
    if (loc==0) {
      return (strings[n] = "? ? ?");
    }
    fseek(db, loc, SEEK_SET);
    fread(&len, sizeof(int), 1, db);
    len = natlong(len);
    strings[n] = (char*)malloc(len);
    fread(strings[n], 1, len, db);
    return strings[n];
}

#ifdef RESET
void stringRESET(void) /* gab 13/Jan/2001 */
{
	db = NULL;
}
#endif
void init_getstring(int argc, char **argv)
{
    char header[20];
    char lang[30];
    char *path;
    long maxnum;
    int j;
    int order;
    char name[256];
    /* First check arguments to see if it gives a DB to use */
    for (j=1; j<argc; j++) {
      if (argv[j][0]=='-' && argv[j][1]=='j') {
        char *name = (argv[j][2]=='\0' ? argv[j+1] : &(argv[j][2]));
        db = fopen(name,  "rb");
        if (db == NULL) {
          fprintf(stderr, "failed to find DB file given in -j option.\n");
          exit(1);
        }
	else err_printf("Using %s\n", name);
        goto cmdlne;
      }
    }
    if ((path=getenv("CSSTRNGS")) != NULL) {
      strcpy(name, path);
      db = fopen(path, "rb");
    }
#ifdef WIN32
    if (db==NULL)
# if defined( _CONSOLE) || defined(GAB_RT)
    {
/*        if (GetPrivateProfileString("csound", "StringDB", "", name, 256, "csound.ini"))  */
/*  	db = fopen(name, "rb"); */
    }
# else
    {
      path = getDB();
      strcpy(name, path);
      db = fopen(name, "rb");
    }
# endif
#endif
    if (db==NULL) 
      {
	strcpy(name, "csound.txt");
	db = fopen("csound.txt", "rb");
      }
    if (db == NULL && argv[0] != NULL) {
      strcpy(name, argv[0]);
      if ((path = strrchr(name, '/')) != NULL
          || (path = strrchr(name, '\\')) != NULL) {
        strcpy(path+1, "csound.txt");
        db = fopen(name, "rb");
      }
    }
    if (db == NULL && (path=getenv("SSDIR")) != NULL) {
      sprintf(name, "%s/csound.txt", path);
      db = fopen(name, "rb");
    }
    if (db == NULL && (path=getenv("SFDIR")) != NULL) {
      sprintf(name, "%s/csound.txt", path);
      db = fopen(name, "rb");
    }
    if (db == NULL && (path=getenv("SADIR")) != NULL) {
      sprintf(name, "%s/csound.txt", path);
      db = fopen(name, "rb");
    }
    if (db == NULL) {
      strcpy(name, "/usr/local/lib/csound.txt");
      db = fopen("/usr/local/lib/csound.txt", "rb");
    }
    if (db == NULL) {
      fprintf(stderr, "failed to find Strings DataBase file.\n"
		      "Use the CSSTRNGS environment variable or you must put the \n"
              "file \"csound.txt\" in your local, SFDIR, SADIR, SSDIR or \n"
              "system directories for csound to work\n");
      exit(1);
    }
    err_printf("Using %s\n", name);
 cmdlne:
    fread(&order, sizeof(int), 1, db);
    fread(header, sizeof(X_HEADER)-1, 1, db);
    fread(lang, sizeof(char), 30, db);
    fread(&maxnum, sizeof(long), 1, db);
    maxnum = natlong(maxnum);
    strings = (char**) malloc(maxnum*sizeof(char*));
    if (strings==NULL) {
      fprintf(stderr, "No memory for strings\n");
      exit(1);
    }
    for (j=0; j<maxnum; j++) strings[j] = NULL;
    baseloc = ftell(db);
}
