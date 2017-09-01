                                /* OPCODE.C */
                                /* Print opcodes in system */

                                /* John ffitch -- 26 Jan 97 */
#include "cs.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern OENTRY *opcodlst;
extern OENTRY *oplstend;

struct sortable {
  char *name;
  char *ans;
  char *args;
};

int mystrcmp(const void *v1, const void *v2)
{
    struct sortable *s1 = (struct sortable *)v1;
    struct sortable *s2 = (struct sortable *)v2;
    int ans;
/*     printf("Compare %s and %s =>", s1, s2); */
/* Make this stop at _ would improve things */
    ans = strcmp(s1->name, s2->name);
/*     printf(" %d\n", ans); */
    return ans;
}

void list_opcodes(int level)
{
    OENTRY *ops = opcodlst;
    struct sortable *table;
    int i=0, j, k;
    int len = 0;
                                /* All this hassle 'cos of MAC */
    long n = (long)((char*)oplstend-(char *)opcodlst);
    n /= sizeof(OENTRY);
    n *= sizeof(struct sortable);
    table = (struct sortable*)mmalloc(n);
                                /* Skip first entry */
    while (++ops<oplstend) {
      char *x = mmalloc(strlen(ops->opname)+1);
      strcpy(x, ops->opname);
      table[i].name = x;
      if (x=strchr(x,'_')) *x = '\0';
      table[i].ans = ops->outypes;
      table[i].args = ops->intypes;
      if (ops->outypes == NULL && ops->intypes == NULL) n--;
      else i++;
    }
                                /* Sort into alphabetical order */
    printf(Str(X_37,"%d opcodes\n"), i);
    qsort(table, i, sizeof(struct sortable), mystrcmp);
                                /* Print in 4 columns */
    for (j = 0, k = 0; j<i; j++) {
      if (level == 0) {
        if (j>0 && strcmp( table[j-1].name,  table[j].name)==0) continue;
        k++;
        if ((k%3)==0) {
          printf("\n"); len = 0;
        }
        else {
          do {
            printf(" ");
            len++;
          } while (len<20*(k%3));
        }
        printf("%s", table[j].name);
        len += strlen(table[j].name);
      }
      else {
        char *ans = table[j].ans, *arg = table[j].args;
        printf("%s", table[j].name);
        len = strlen(table[j].name);
        do {
          printf(" ");
          len++;
        } while (len<10);
        if (ans==NULL || *ans=='\0') ans = "(null)";
        if (arg==NULL || *arg=='\0') arg = "(null)";
        printf("%s", ans);
        len = strlen(ans);
        do {
          printf(" ");
          len++;
        } while (len<8);
        printf("%s\n", arg);
      }
    }
    printf("\n");
    mfree(table);
}
