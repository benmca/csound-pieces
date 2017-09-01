					
/* some routines for Windows by Gabriel Maldonado */
#include <windows.h>
#include "cs.h"
#include <stdio.h>

#include "version.h"

int rows=0 , columns=0;
int exit_soon_flag=0;
void exit_soon() { exit_soon_flag=1;}

#ifndef GAB_WIN	//1

void set_rows(int n) {
	rows = n;
}

void set_columns( int n) {
 	columns = n;
}


BOOL WINAPI ctrlC( DWORD dwCtrlType )
{ 	
	if (dwCtrlType == CTRL_C_EVENT ) fcloseall();
	return FALSE;
}

void console_init()
{
	BOOL ret;
	ret=SetConsoleCtrlHandler(ctrlC,TRUE);
}

void console_rows()
{
	HANDLE cons_handle;
	COORD coord, firstcell;
	DWORD scritti;
	int xret;

	if (!columns && rows) columns=81;
	if (!rows && columns) rows = 26;
	coord.X=columns;
	coord.Y=rows;
 	firstcell.X=0;
	firstcell.Y=0;
 	cons_handle=GetStdHandle(STD_OUTPUT_HANDLE	);
	//if (columns || rows)
	xret = SetConsoleScreenBufferSize(cons_handle, coord);
	/*
	xret = SetConsoleTextAttribute( cons_handle,
						 BACKGROUND_BLUE
    						| BACKGROUND_GREEN
    						| BACKGROUND_RED
    						| BACKGROUND_INTENSITY 
							
	);
	*/
   	if (!columns) { coord.X = 100; coord.Y = 100; }
   	
   	FillConsoleOutputAttribute(
    	cons_handle,	// handle of screen buffer 
    	
		FOREGROUND_BLUE
		| FOREGROUND_GREEN /*| FOREGROUND_RED */| FOREGROUND_INTENSITY, 
	
    	coord.X * coord.Y,	// number of character cells to write to 
    	firstcell,	// x- and y-coordinates of first cell 
    	&scritti	// address of number of cells written to 
    );
    if (columns || rows)  xret =  ShowWindow( cons_handle,  SW_SHOWMAXIMIZED	   );	

}

void console_title()
{
	char stringa[256];
	HANDLE cons_handle;
 	cons_handle=GetStdHandle(STD_OUTPUT_HANDLE	);
	sprintf(stringa, "DirectCsoundCon " DIRECTCSOUND_VERSION " (synchronized to standard %s)", VERSIONSTRING);
  	SetConsoleTitle(stringa);	
}

void getgab() {
	extern int flprintf;
	if (exit_soon_flag) return;
	flprintf = 0;
	printf("\npress <RETURN> to terminate program...");
	getchar();
}

#else //GAB_WIN //1

void getgab() {
	extern int flprintf;
	if (exit_soon_flag) return;
	printf("\n----------------\nsession terminated. Click start to restart a new session");
	flprintf = 0;
	//printf("\npress <RETURN> to terminate program...");
	//getchar();
}


#endif //GAB_WIN //1

//#include <time.h> 
void DirectCsoundDefaults()
{

extern int flprintf, flprintfbis; 
extern void setcolor(unsigned short );
int ug_flag=-1;  /* gab A8*/

#ifndef GAB_WIN 
	console_init();
	console_title();
	console_rows();
#else	 //GAB_WIN 
	{
		 extern void SetConWinParms();
		 SetConWinParms();
	}
#endif  //GAB_WIN 

	//O.inbufsamps=O.outbufsamps=400; /* gab B0 */
	O.SusPThresh = 64; /* gab A8*/
	O.sfheader =1; 	/* gab A8*/
//	csOpcodeLoadAll();
}


int remap_argv(char *fname) /* gab-A1 */
{
	extern char *clbuf;
	extern char *argv_gab[];
	FILE * fil;
	char * pt;
	int j=0;
	clbuf = (char *) malloc(2048);
	pt = clbuf;
	if ( !(fil=fopen(fname, "rt"))) die("bad command-line script file\n");
	printf("USING file '%s' as command line\n", fname);
	while (fscanf(fil, "%s", pt) != EOF){
		argv_gab[j++] = pt;
		pt+= strlen(pt)+1;
	}	
	fclose(fil);
	/*if (access(fname, 6))  chmod( fname, S_IREAD | S_IWRITE );  removes read-only flag*/
	return j;	
}

void gab_putchar(char c)	/* gab-A1 */
{
	extern int flprintf;
	 if (!flprintf) putchar(c);
}


void cleanstr(char *s) /* gab A8 */
{
	while(*s) {
		if (*s == 10 || *s == 13) {
			*s = '\0';
			break;
		}
		s++;
	}
}


#undef MessageBoxA
int MessageBoxGab( HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType )
{
	   if (!exit_soon_flag)
		   return MessageBox(  hWnd,  lpText,  lpCaption,  uType );

}

void dieu_gab(char *s, char *title)
{
 		MessageBox( NULL,	// handle of owner window
				s,	// address of text in message box
                title,	// address of title of message box  
                MB_SYSTEMMODAL | MB_ICONSTOP 	// style of message box
		);
}

#ifdef GAB_WIN
#define exit(NUM) exitWinGab(NUM)/* gab d3*/
#endif

void die(char *s)
{
	extern int flprintf;
	flprintf=0;
	printf("%s\n",s);
	dieu_gab(s,"Csound error!");
	
	exit(1);
}

