/* Opcodes By Gabriel Maldonado, 1999 */
/* Code modified by JPff to remove fixed size arrays, allow
   AIFF and WAV, and close files neatly.  Also bugs fixed */

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "cs.h"
#include "fout.h"

extern long kcounter;
extern MYFLT onedkr;
extern  void    writeheader(int, char*);
extern  void    rewriteheader(int, long, int);

struct fileinTag {
    FILE* file;
    char  *name;
    long  cnt;
    int   hdr;
};

static struct fileinTag *file_opened = NULL;
static int file_max = 0;        /* Size of file_opened structure */
static int file_num = -1;              /* Last number used */

void close_files(void)
{
    while (file_num>=0) {
      printf("%d (%s):", file_num, file_opened[file_num].name);
      fflush(file_opened[file_num].file);
      if (file_opened[file_num].hdr) {
        rewriteheader(fileno(file_opened[file_num].file),
                      file_opened[file_num].cnt, 1);
      }
      fclose(file_opened[file_num].file);
      file_num--;
      printf("\n");
    }
}

void outfile_float(OUTFILE *p)
{
    int nsmps = ksmps, j, nargs = p->nargs, k=0;
    MYFLT **args = p->argums;
    do {
      for (j = 0;j< nargs;j++)
        fwrite(&(args[j][k]), sizeof(MYFLT), 1, p->fp);
      k++;
    } while (--nsmps);
}


void outfile_int(OUTFILE *p)
{
    int nsmps = ksmps, j, nargs = p->nargs, k=0;
    MYFLT **args = p->argums;
    short tmp;
    do {
      for (j = 0;j< nargs;j++) {
        tmp = (short)	 args[j][k];
        fwrite(&tmp, sizeof(short), 1, p->fp);
      }
      k++;
    } while (--nsmps);
}


void outfile_int_head(OUTFILE *p)
{
    int nsmps= ksmps, j, nargs = p->nargs, k=0;
    MYFLT **args = p->argums;
    do {
      for (j = 0;j< nargs;j++) {
        short tmp = (short) args[j][k];
        fwrite(&tmp, sizeof(short), 1, p->fp);
      }
      k++;
    } while (--nsmps);
    p->cnt++;                   /* Count cycle */
    file_opened[p->idx].cnt += ksmps * sizeof(short)*nargs;
    if ((kcounter& 0x3f)==0) {         /* Every 64 cycles */
      fflush(p->fp);
      rewriteheader(fileno(p->fp), p->cnt * ksmps * sizeof(short)*nargs, 0);
    }
}


void outfile_set(OUTFILE *p)
{
    int n;
    if (*p->fname == sstrcod) { /* if char string name given */
      int j;
      char fname[FILENAME_MAX];
      extern EVTBLK *currevent;
      extern char *unquote(char *name);
      if (p->STRARG == NULL) strcpy(fname,unquote(currevent->strarg));
      else strcpy(fname, unquote(p->STRARG));
      for (j=0; j<file_num; j++) {
        if (!strcmp(file_opened[j].name,fname)) {
          p->fp = file_opened[j].file;
          p->idx = n = j;
          goto done;
        }
      }
                                /* ******** Following is NON ANSI ********* */
#if !defined(_macintosh) && !defined(SYMANTEC)
      if ((access(fname, 0 )) != -1 ) { /* if file exists */
        if (access(fname, 0x6)) /* check its access state */
          chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
      }
#endif
      if ((p->fp = fopen(fname,"wb")) == NULL)
        dies(Str(X_1465,"fout: cannot open outfile %s"),fname);
      else { /* put the file in the opened stack */
        file_num++;
	if (file_num>=file_max) {
          if (file_max==0) atexit(close_files);
	  file_max += 4;
	  file_opened = (struct fileinTag*)
            mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
	}
        file_opened[file_num].name = (char*) mmalloc(strlen(fname)+1);
        strcpy(file_opened[file_num].name, fname);
        file_opened[file_num].file = p->fp;
        p->idx = n = file_num;
        file_opened[file_num].cnt = 0;
        file_opened[file_num].hdr = 0;
      }
    }
    else { /* file handle as argument */
      n = (int)*p->fname;
      if (n>file_num || (p->fp = file_opened[n].file) == NULL)
        die(Str(X_1466,"fout: invalid file handle"));
    }
 done:
    p->nargs = p->INOCOUNT-2;
    switch((int) (*p->iflag+FL(0.5))) {
    case 0:
      p->outfilep = (SUBR)outfile_float;
      break;
    case 1:
      p->outfilep = (SUBR)outfile_int;
      break;
    case 2:
      p->outfilep = (SUBR)outfile_int_head;
      p->cnt = 0;
      file_opened[n].hdr = 1;
      writeheader(		/* Write header at start of file.  */
                   fileno(p->fp), /* Called after open, before data writes*/
		   file_opened[n].name);
      break;
    default:
      p->outfilep = (SUBR)outfile_int;
    }
}

void outfile (OUTFILE *p)
{
    p->outfilep(p);
}

void koutfile_float (KOUTFILE *p)
{
    int j, nargs = p->nargs;
    MYFLT **args = p->argums;
    for (j = 0;j< nargs;j++) {
      float tmp = (float) *args[j];
      fwrite(&tmp, sizeof(float), 1, p->fp);
    }
}


void koutfile_int (KOUTFILE *p)
{
    int j,nargs = p->nargs;
    MYFLT **args = p->argums;
    short tmp;
    for (j = 0;j< nargs;j++) {
      tmp = (short) *(args[j]);
      fwrite(&tmp, sizeof(short), 1, p->fp);
    }
}

void koutfile_set(KOUTFILE *p)
{
    int n;
    if (*p->fname == sstrcod) {/*gab B1*/ /* if char string name given */
      int j;
      char fname[FILENAME_MAX];
      extern EVTBLK *currevent; /*gab B1*/
      extern char *unquote(char *name);
      if (p->STRARG == NULL) strcpy(fname,unquote(currevent->strarg)); /*gab B1*/
      else strcpy(fname, unquote(p->STRARG));
      for (j=0; j<file_num; j++) {
        if (!strcmp(file_opened[j].name,fname)) {
          p->fp = file_opened[j].file;
          p->idx = n = j;
          goto done;
        }
      }
                                /* *** NON ANSI CODE *** */
#if !defined(_macintosh) && !defined(SYMANTEC)
      if (!(access( fname, 0 )) ) { /* if file exists */
        if (access(fname, 0x6)) /* check its access state */
          chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
      }
#endif
      if (( p->fp = fopen(fname,"wb")) == NULL)
        dies(Str(X_1467,"foutk: cannot open outfile %s"),fname);
      else { /* put the file in the opened stack */
        file_num++;
	if (file_num>=file_max) {
          if (file_max==0) atexit(close_files);
	  file_max += 4;
	  file_opened = (struct fileinTag*)
            mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
	}
        file_opened[file_num].name = (char*)mmalloc(strlen(fname)+1);
        strcpy(file_opened[file_num].name, fname);
        file_opened[file_num].file=p->fp;
        p->idx = n = file_num;
        file_opened[file_num].cnt = file_opened[file_num].hdr = 0;
      }
    }
    else { /* file handle argument */
      n = (int)*p->fname;
      if (n>file_num || (p->fp = file_opened[n].file) == NULL)
        die(Str(X_1466,"fout: invalid file handle"));
    }
 done:
    switch((int) (*p->iflag+FL(0.5))) {
    case 0:
      p->koutfilep = (SUBR)koutfile_float;
      break;
    case 1:
      p->koutfilep = (SUBR)koutfile_int;
      break;
    default:
      p->koutfilep = (SUBR)koutfile_int;
    }
    p->nargs = p->INOCOUNT-2;
    p->cnt = 0;
}

void koutfile(KOUTFILE *p)
{
    p->koutfilep(p);
}


/*--------------*/


/* syntax:
	ihandle fiopen "filename" [, iascii]
*/
void fiopen(FIOPEN *p)          /* open a file and return its handle */
{                               /* the handle is simply a stack index */
    char fname[FILENAME_MAX];
    char *omodes[] = {"w", "r", "wb", "rb"};
    FILE *fp;
    int idx = (int)*p->iascii;
    strcpy(fname, unquote(p->STRARG));

#if !defined(_macintosh) && !defined(SYMANTEC)
    if ((access( fname, 0 )) != -1 ) {/* if file exists */
      if (access(fname, 0x6)) /* check its access state */
        chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
    }
#endif
    if (idx<0 || idx>3) idx=0;
    if (( fp = fopen(fname,omodes[idx])) == NULL)
      dies(Str(X_1468,"fout: cannot open outfile %s"),fname);
    if (idx>1) setbuf(fp, NULL);
    file_num++;
    if (file_num>=file_max) {
      if (file_max==0) atexit(close_files);
      file_max += 4;
      file_opened = (struct fileinTag*)
        mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
    }
    file_opened[file_num].name = (char*)mmalloc(strlen(fname)+1);
    strcpy(file_opened[file_num].name, fname);
    file_opened[file_num].file=fp;
    *p->ihandle = (MYFLT) file_num;
}

/* syntax:
   fouti  ihandle, iascii, iflag, iarg1 [,iarg2,....,iargN]
*/

long kreset=0;
void ioutfile_set(IOUTFILE *p)
{
    int j;
    MYFLT **args=p->argums;
    FILE *fil;
    int n = (int) *p->ihandle;
    if (n<0 || n>file_num)
      die(Str(X_1469,"fouti: invalid file handle"));
    fil = file_opened[n].file;
    if (fil == NULL) die(Str(X_1469,"fouti: invalid file handle"));
    if (*p->iascii == 0) { /* ascii format */
      switch ((int) *p->iflag) {
      case 1: { /* whith prefix (i-statement, p1, p2 and p3) */
        int p1 = (int) p->h.insdshead->insno;
        double p2 =   (double) kcounter * onedkr;
        double p3 = p->h.insdshead->p3;
        if (p3 > FL(0.0))
          fprintf(fil, "i %i %f %f ", p1, p2, p3);
        else
          fprintf(fil, "i %i %f . ", p1, p2);
      }
      break;
      case 2: /* whith prefix (start at 0 time) */
        if (kreset == 0) kreset = kcounter;
        {
          int p1 = (int) p->h.insdshead->insno;
          double p2= (double) (kcounter - kreset) * onedkr;
          double p3 = p->h.insdshead->p3;
          if (p3 > FL(0.0))
            fprintf(fil, "i %i %f %f ", p1, p2, p3);
          else
            fprintf(fil, "i %i %f . ", p1, p2);
        }
        break;
      case 3: /* reset */
        kreset=0;
        return;
      }
      for (j=0; j < p->INOCOUNT - 3;j++) {
        fprintf( fil, " %f",(double) *args[j]);
      }
      putc('\n',fil);
    }
    else { /* binary format */
      for (j=0; j < p->INOCOUNT - 3;j++) {
        fwrite(args[j], sizeof(MYFLT),1, fil );
      }
    }
}


void ioutfile_set_r(IOUTFILE_R *p)
{
    short *xtra;
    if (*(xtra = &(p->h.insdshead->xtratim)) < 1 )  /* gab-a5 revised */
      *xtra = 1;
    p->counter =  kcounter;
    p->done = 1;
    if (*p->iflag==2)
      if (kreset == 0) kreset = kcounter;
}


void ioutfile_r(IOUTFILE_R *p)
{
    if (p->h.insdshead->relesing) {
      if (p->done) {
        int j;
        MYFLT **args=p->argums;
        FILE *fil;
	int n = (int) *p->ihandle;
        if (n<0 || n>file_num) die(Str(X_1469,"fouti: invalid file handle"));
	fil = file_opened[n].file;
        if (fil == NULL) die(Str(X_1469,"fouti: invalid file handle"));
        if (*p->iascii == 0) { /* ascii format */
          switch ((int) *p->iflag) {
          case 1:	{	/* whith prefix (i-statement, p1, p2 and p3) */
            int p1 = (int) p->h.insdshead->insno;
            double p2 = p->counter * onedkr;
            double p3 = (double) (kcounter-p->counter) * onedkr;
            fprintf(fil, "i %i %f %f ", p1, p2, p3);
          }
          break;
          case 2: /* whith prefix (start at 0 time) */
            {
              int p1 = (int) p->h.insdshead->insno;
              double p2 = (p->counter - kreset) *onedkr;
              double p3 = (double) (kcounter-p->counter) * onedkr;
              fprintf(fil, "i %i %f %f ", p1, p2, p3);
            }
            break;
          case 3: /* reset */
            kreset=0;
            return;
          }
          for (j=0; j < p->INOCOUNT - 3;j++) {
            fprintf( fil, " %f",(double) *args[j]);
          }
          putc('\n',fil);
        }
        else { /* binary format */
          for (j=0; j < p->INOCOUNT - 3;j++) {
            fwrite(args[j], sizeof(MYFLT),1, fil );
          }
        }
        p->done = 0;
      }
    }
}

/*----------------------------------*/

void infile_float(INFILE *p)
{
    int nsmps= ksmps, j, nargs = p->nargs,k=0;
    MYFLT **args = p->argums;
    if (p->flag) {
      fseek(p->fp, p->currpos*sizeof(MYFLT)*nargs ,SEEK_SET);
      p->currpos+=nsmps;
      do {
        for (j = 0;j< nargs;j++) {
          if (fread(&(args[j][k]), sizeof(MYFLT), 1, p->fp));
          else {
            p->flag = 0;
            args[j][k] = FL(0.0);
          }
        }
        k++;
      } while (--nsmps);
    }
    else { /* after end of file */
      do {
        for (j = 0;j< nargs;j++)
          args[j][k] = FL(0.0);
        k++;
      } while (--nsmps);
    }
}


void infile_int(INFILE *p)
{
    int nsmps= ksmps, j,nargs = p->nargs,k=0;
    MYFLT **args = p->argums;
    short tmp;
    if (p->flag) {
      fseek(p->fp, p->currpos*sizeof(short)*nargs ,SEEK_SET);
      p->currpos+=nsmps;
      do {
        for (j = 0;j< nargs;j++) {
          if (fread( &tmp, sizeof(short),1,p->fp))
            args[j][k] = (MYFLT) tmp;
          else {
            p->flag = 0;
            args[j][k] = FL(0.0);
          }
        }
        k++;
      } while (--nsmps);
    }
    else {  /* after end of file */
      do {
        for (j = 0;j< nargs;j++)
          args[j][k] = FL(0.0);
        k++;
      } while (--nsmps);
    }
}

void infile_set(INFILE *p)
{
    if (*p->fname == sstrcod) { /* if char string name given */
      int j;
      extern EVTBLK *currevent;
      extern char *unquote(char *name);
      char fname[FILENAME_MAX];
      if (p->STRARG == NULL) strcpy(fname,unquote(currevent->strarg));
      else strcpy(fname, unquote(p->STRARG));
      for (j=0; j<file_num || file_opened[j].name == NULL; j++) {
        if (!strcmp(file_opened[j].name,fname)) {
          p->fp = file_opened[j].file;
          goto done;
        }
      }
                                /* *** ONO ASCII *** */
#if !defined(_macintosh) && !defined(SYMANTEC)
      if ((access( fname, 0 )) != -1 ) { /* if file exists */
        if (access(fname, 0x6)) /* check its access state */
          chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
      }
#endif
      if (( p->fp = fopen(fname,"rb")) == NULL)
        dies(Str(X_1470,"fin: cannot open infile %s"),fname);
      else { /* put the file in the opened stack */
	file_num++;
	if (file_num>=file_max) {
          if (file_max==0) atexit(close_files);
	  file_max += 4;
	  file_opened = (struct fileinTag*)
            mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
	}
        file_opened[file_num].name = (char*)mmalloc(strlen(fname)+1);
        strcpy(file_opened[file_num].name, fname);
        file_opened[file_num].file=p->fp;
      }
    }
    else { /* file handle argument */
      int n = (int) *p->fname;
      if (n<0 || n> file_num || (p->fp = file_opened[n].file) == NULL)
        die(Str(X_1471,"fin: invalid file handle"));
    }
 done:
    switch((int) (*p->iflag+FL(0.5))) {
    case 0:
      p->infilep = (SUBR)infile_float;
      break;
    case 1:
      p->infilep = (SUBR)infile_int;
      break;
    default:
      p->infilep = (SUBR)infile_int;
    }
    p->nargs = p->INOCOUNT-3;
    p->currpos = (long) *p->iskpfrms;
    p->flag=1;
}

void infile(INFILE *p)
{
    p->infilep(p);
}


/*----------------------------*/


void kinfile_float(KINFILE *p)
{
    int j, nargs = p->nargs;
    MYFLT **args = p->argums;
    if (p->flag) {
      fseek(p->fp, p->currpos*sizeof(MYFLT)*nargs ,SEEK_SET);
      p->currpos++;
      for (j = 0;j< nargs;j++) {
        if (fread(args[j], sizeof(MYFLT),1,p->fp));
        else {
          p->flag = 0;
          *(args[j]) = FL(0.0);
        }
      }
    }
    else { /* after end of file */
      for (j = 0; j < nargs; j++)
        *(args[j]) = FL(0.0);
    }
}


void kinfile_int(KINFILE *p)
{
    int j,nargs = p->nargs;
    MYFLT **args = p->argums;
    short tmp;
    if (p->flag) {
      fseek(p->fp, p->currpos*sizeof(short)*nargs ,SEEK_SET);
      p->currpos++;
      for (j = 0;j< nargs;j++) {
        if (fread( &tmp, sizeof(short),1,p->fp))
          *(args[j]) = (MYFLT) tmp;
        else {
          p->flag = 0;
          *(args[j]) = FL(0.0);
        }
      }
    }
    else {  /* after end of file */
      for (j = 0;j< nargs;j++)
        *(args[j]) = FL(0.0);
    }
}


void kinfile_set(KINFILE *p)
{
    if (*p->fname == sstrcod) { /* if char string name given */
      int j;
      extern EVTBLK *currevent;
      extern char *unquote(char *name);
      char fname[FILENAME_MAX];
      if (p->STRARG == NULL) strcpy(fname,unquote(currevent->strarg)); /*gab B1*/
      else strcpy(fname, unquote(p->STRARG));
      for (j=0; j<file_num || file_opened[j].name == NULL; j++) {
        if (!strcmp(file_opened[j].name,fname)) {
          p->fp = file_opened[j].file;
          goto done;
        }
      }
#if !defined(_macintosh) && !defined(SYMANTEC)
      if ((access( fname, 0 )) != -1 ) { /* if file exists */
        if (access(fname, 0x6)) /* check its access state */
          chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
      }
#endif
      if (( p->fp = fopen(fname,"rb")) == NULL)
        dies(Str(X_1470,"fin: cannot open infile %s"),fname);
      else { /* put the file in the opened stack */
	file_num++;
	if (file_num>=file_max) {
          if (file_max==0) atexit(close_files);
	  file_max += 4;
	  file_opened = (struct fileinTag*)
            mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
	}
        file_opened[file_num].name = (char*)mmalloc(strlen(fname)+1);
        strcpy(file_opened[file_num].name, fname);
        file_opened[file_num].file=p->fp;
      }
    }
    else {/* file handle argument */
      int n = (int) *p->fname;
      if (n<0 || n>file_num || (p->fp = file_opened[n].file) == NULL)
        die(Str(X_1472,"fink: invalid file handle"));
    }
 done:
    switch((int) (*p->iflag+FL(0.5))) {
    case 0:
      p->kinfilep = (SUBR)kinfile_float;
      break;
    case 1:
      p->kinfilep = (SUBR)kinfile_int;
      break;
    default:
      p->kinfilep = (SUBR)kinfile_int;
    }
    p->nargs = p->INOCOUNT-3;
    p->currpos = (long) *p->iskpfrms;
    p->flag=1;
}


void kinfile(KINFILE *p)
{
    p->kinfilep(p);
}



void i_infile(I_INFILE *p)
{
    int j, nargs;
    FILE *fp;
    MYFLT **args = p->argums;
    if (*p->fname == sstrcod) {/* if char string name given */
      char fname[FILENAME_MAX];
      char *omodes[] = {"r", "r", "rb"};
      int idx;
      extern EVTBLK *currevent;
      extern char *unquote(char *name);

      if (p->STRARG == NULL) strcpy(fname,unquote(currevent->strarg));
      else strcpy(fname, unquote(p->STRARG));
      for (j=0; j<file_num || file_opened[j].name == NULL; j++) {
        if (!strcmp(file_opened[j].name,fname)) {
          fp = file_opened[j].file;
          goto done;
        }
      }
#if !defined(_macintosh) && !defined(SYMANTEC)
      if ((access( fname, 0 )) != -1 ) { /* if file exists */
        if (access(fname, 0x6)) /* check its access state */
          chmod(fname, S_IREAD | S_IWRITE); /* ... and make it read-write if necessary*/
      }
#endif
      idx = (int) (*p->iflag+FL(0.5));
      if (idx<0 || idx>2) idx = 0;
      if (( fp = fopen(fname,omodes[idx])) == NULL)
        dies(Str(X_1470,"fin: cannot open infile %s"),fname);
      else { /* put the file in the opened stack */
	file_num++;
	if (file_num>=file_max) {
          if (file_max==0) atexit(close_files);
	  file_max += 4;
	  file_opened = (struct fileinTag*)
            mrealloc(file_opened, sizeof(struct fileinTag)*file_max);
	}
        file_opened[file_num].name = (char*)mmalloc(strlen(fname)+1);
        strcpy(file_opened[file_num].name, fname);
        file_opened[file_num].file=fp;
      }
    }
    else {/* file handle argument */
      int n = (int) *p->fname;
      if (n<0 || n>file_num || (fp = file_opened[n].file) == NULL)
        die(Str(X_1472,"fink: invalid file handle"));
    }
 done:
    nargs = p->INOCOUNT-3;
    switch((int) (*p->iflag+FL(0.5))) {
    case 0: /* ascii file with loop */
      {
        char cf[20], *cfp;
        int cc;
      newcycle:
        for (j = 0;j< nargs;j++) {
          cfp = cf;
          while ((*cfp=cc=getc(fp)) == 'i'
                 || isspace(*cfp));
          if (cc == EOF) {
            fseek(fp, 0 ,SEEK_SET);
            goto newcycle;
          }
          while (isdigit(*cfp) || *cfp == '.')  {
            *(++cfp) = cc = getc(fp);
          }
          *++cfp = '\0';        /* Must terminate string */
          *(args[j]) = (MYFLT) atof (cf);
          if (cc == EOF) {
            fseek(fp, 0 ,SEEK_SET);
            break;
          }
        }
      }
      break;
    case 1: /* ascii file without loop */
      {
        char cf[20], *cfp;
        int cc;
        for (j = 0;j< nargs;j++) {
          cfp = cf;
          while ((*cfp=cc=getc(fp)) == 'i'
                 || isspace(*cfp));
          if (cc == EOF) {
            *(args[j]) = FL(0.0);
            break;
          }
          while (isdigit(*cfp) || *cfp == '.') {
            *(++cfp) = cc = getc(fp);
          }
          *++cfp = '\0';        /* Must terminate */
          *(args[j]) = (MYFLT) atof (cf);
          if (cc == EOF) {
            *(args[j]) = FL(0.0);
            break;
          }
        }
      }
      break;
    case 2: /* binary floats without loop */
      fseek(fp, p->currpos*sizeof(float)*nargs ,SEEK_SET);
      p->currpos++;
      for (j = 0;j< nargs;j++) {
        if (fread(args[j], sizeof(float),1,fp));
        else {
          p->flag = 0;
          *(args[j]) = FL(0.0);
        }
      }
      break;
    }
}

/*---------------------------*/

void incr(INCR *p)
{
    MYFLT *avar = p->avar, *aincr = p->aincr;
    int nsmps= ksmps;
    do 	*(avar++) += *(aincr++);
    while (--nsmps);
}


void clear(CLEARS *p)
{
    int nsmps= ksmps,j;
    MYFLT *avar;
    for (j=0;j< p->INOCOUNT;j++) {
      avar = p->argums[j];
      nsmps= ksmps;
      do 	*(avar++) = FL(0.0);
      while (--nsmps);
    }
}


