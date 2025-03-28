#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "text.h"

#define DEBUG (0)

long benlong(long lval)       /* coerce a natural long into a bigendian long */
{
    char  benchar[4];
    char *p = benchar;

    *p++ = (char)(0xFF & (lval >> 24));
    *p++ = (char)(0xFF & (lval >> 16));
    *p++ = (char)(0xFF & (lval >> 8));
    *p   = (char)(0xFF & lval);
    return(*(long *)benchar);
}

/* String file will have a header string (X_HEADER) and then 10 characters 
   making a language for identification
*/

int main(int argc, char **argv)
{
    char buff[256];
    long strings[X_MAXNUM];
    long loc, baseloc;
    int j;
    int n;
    long item = 0;
    FILE *db;
    FILE *raw;
    char dbname[16];
    char lang[30] = {'E', 'n', 'g', 'l', 'i', 's', 'h', '\0'};
    int order = ('t'<<24)|('x'<<16)|('t'<<8);

    if (argc>=2) raw = fopen(argv[1], "rb");
    else raw = fopen("all_strings", "rb");
    if (raw == NULL) {
      fprintf(stderr, "Failed to open input file\n");
      exit(1);
    }
    if (argc==3) {
      /* 7 is length of `English' and there are 10 maximum */
      int len = strlen(argv[2]);
      if (len>29) len = 29;
      strncpy(lang, argv[2], len);
      memset(lang+len, '\0', 30-len); /* Null rest */
    }
    strcpy(dbname, lang); strcat(dbname, ".txt"); /* ****** */
    if (DEBUG) fprintf(stderr, "DBname = >>%s<<\n", dbname);
    db = fopen(dbname, "wb");
    if (db == NULL) {
      fprintf(stderr, "Failed to create DB file\n");
      exit(1);
    }
    fwrite(&order, sizeof(int), 1, db);
    fwrite(X_HEADER, sizeof(X_HEADER)-1, 1, db);
    fwrite(lang, sizeof(char), 30, db);
    n = X_MAXNUM;
    n = benlong(n);
    fwrite(&n, sizeof(long), 1, db);
    baseloc = ftell(db);
    for (j=0; j<X_MAXNUM; j++) strings[j] = 0L;
    fwrite(strings, sizeof(long), X_MAXNUM, db); /* Write header */
    loc = ftell(db);
    if (DEBUG) fprintf(stderr, "Baseloc=%lx Loc=%lx\n", baseloc, loc);
    for (;;) {                  /* Read the text until ended */
      long n = 0;
      long i;
      int ch = getc(raw);
      while (ch=='\r' || ch =='\n') ch = getc(raw);
      if (DEBUG) fprintf(stderr, "Read '%c'(%.2x)\n", ch, ch);
      while (isdigit(ch)) {
        if (DEBUG) fprintf(stderr, "Read '%c'(%.2x)\n", ch, ch);
        n = n*10+ch-'0';
        ch = getc(raw);
      }
      if (DEBUG) fprintf(stderr, "String# %d\n", n);
      if (ch==EOF) break;
      if (ch!=',') {
        fprintf(stderr, "item %d/%d: Syntax error -- expecting comma got '%c'%2x\n",
                item, n, ch, ch);
        exit(1);
      }
      item = n;
      i = 0;
      while ((ch=getc(raw))!='"') ;
                                /* Now read the string */
      while ((ch = getc(raw))!='"') {
        if (ch=='\\') {
          ch=getc(raw);
          switch (ch) {
          case 'a':
            ch = '\a'; break;
          case 'b':
            ch = '\b'; break;
          case 'n':
            ch = '\n'; break;
          case 'r':
            ch = '\r'; break;
          case 't':
            ch = '\t'; break;
          default:
            break;
          }
        }
        buff[i++]=ch;
      }
      buff[i++] = '\0';
      strings[n] = loc;
      n = benlong(i);
      fwrite(&n, sizeof(long), 1, db);
      fwrite(buff, sizeof(char), i, db);
      loc = ftell(db);
      while ((ch=getc(raw))!='\n');
    }
    fseek(db, baseloc, SEEK_SET);
    for (j=0; j<X_MAXNUM; j++) strings[j] = benlong(strings[j]);
    fwrite(strings, sizeof(long), X_MAXNUM, db); /* rewrite header */
    fclose(raw);
    fclose(db);
    fprintf(stderr, "OK\n");
    return(0);
}

   
