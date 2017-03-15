
   /*                             */
   /* Functions to write PS code  */
   /*                             */

void PS_MakeGraph(WINDAT *wdptr, char *name);  /* Open PS file & write header */
void PS_DrawGraph(WINDAT *wdptr);              /* Make one plot per page      */
int  PS_ExitGraph(void);                       /* Write PS trailer            */
