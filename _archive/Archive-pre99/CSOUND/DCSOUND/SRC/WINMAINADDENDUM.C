#include <windows.h>
#include <string.h>
#include "resource.h" 
#include "cs.h"
int flStartStop;
extern void gab_printf(char *s,...);
void (*cwin_printf)(char *s,...);
int  (*cwin_putchar)(int c);
HINSTANCE hProcessInstance;


#ifdef VST
long VSTblock_size;
float VSTsampleRate;
int VSTblockRatio, CheckVstBuffer, ndxVstBuffer;
float *spoutVST, *spinVST;
#endif


void null_printf(char *s,...)
{
}

int null_putchar(int c)
{
	return c;
}

extern int sleep_flag;
extern int  segamps, sormsg;
extern short rngflg;
HWND MainDialogHandle;
void (*err_printf)(char *s,...);
void setBufScroll(int value);
int xCurrentScroll;   // current horizontal scroll value 
int gab_putch(int c); 

void EnableDisplay(){
	cwin_printf = gab_printf;
	cwin_putchar = gab_putch;
	err_printf = gab_printf;
	O.msglevel = 0x7f;
	segamps = 1;
	sormsg =1;
	rngflg=1;
}

void DisableDisplay(){
	cwin_printf= null_printf;
	cwin_putchar = null_putchar;
	err_printf = null_printf;
	O.msglevel = 0;
	segamps = 0;
	sormsg =0;
	rngflg=0;
}

void SetConWinParms()
{
	SCROLLINFO scroll;
	char stringa[MAXNAME];
	scroll.cbSize=sizeof(SCROLLINFO); 
	scroll.fMask=SIF_ALL; 
	scroll.nMin=2; 
	scroll.nMax=1500; 
	scroll.nPage=10; 
	xCurrentScroll=scroll.nPos=O.outbufsamps; 
	SetDlgItemText(MainDialogHandle,idcBufferLabel,itoa(scroll.nPos,stringa,10));
	SendDlgItemMessage(MainDialogHandle, idcBufferScrollBar, 	 
	SBM_SETSCROLLINFO  , 
	(WPARAM) TRUE, (LPARAM) &scroll);
	if (sleep_flag)
		CheckDlgButton( MainDialogHandle,idcSleep, BST_CHECKED);
	else
		CheckDlgButton( MainDialogHandle,idcSleep, BST_UNCHECKED);
				
}


char * BakArguments[MAXCMDLINE];
char *OrcFile;
char *ScoFile;
char *WavFile;
//char *OrcPath;
//char *ScoPath;
//char *WavPath;
char *LastFlags;
int	maxCurrArgs; 

void RegistrySet() 
{
	LONG nRet;
	nRet=RegSetValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\LastFlags", REG_SZ, LastFlags, strlen(LastFlags));
	nRet=RegSetValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\OrcFile", REG_SZ, unquote(OrcFile), strlen(OrcFile));
	nRet=RegSetValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\ScoFile", REG_SZ, unquote(ScoFile), strlen(ScoFile));
	nRet=RegSetValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\WavFile", REG_SZ, unquote(WavFile), strlen(WavFile));

}																					  

void RegistryGet() 
{
	LONG nRet, size=MAXNAME;		  
	nRet=RegQueryValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\LastFlags", LastFlags, &size);
	size = MAXNAME;
	nRet=RegQueryValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\OrcFile", OrcFile, &size);
	size = MAXNAME;
	nRet=RegQueryValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\ScoFile", ScoFile, &size);
	size = MAXNAME;
	nRet=RegQueryValue(HKEY_CURRENT_USER, "Software\\DirectCsound\\WavFile", WavFile, &size);
}

void reset_all()
{
	extern void gab_midi_exit();
	extern void gab_midi_out_exit();
	extern void cscoreRESET(void);
	extern void expRESET(void);
	extern void ftRESET(void);
	extern void insertRESET(void);
	extern void memRESET(void);
	extern void musRESET(void);
	extern void oloadRESET(void);
	extern void tranRESET(void);
	extern void orchRESET(void);
	extern void soundinRESET(void);
	extern void adsynRESET(void);
	extern void lpcRESET(void);
	extern void stringRESET(void);
	extern void DirectSound_exit();
	extern char *orchname;
	extern char *scorename;
	extern void setport_num(int num);
	extern void set_out_port_num(int num);
	extern void SfReset();
	extern void playReset();
	extern void recReset();
	extern void zakreset();
	extern void hetro_reset();
	extern void argdecReset();
	extern void widgetRESET();
	extern int argc_err;
	extern long nrecs;

	argc_err = 0;
	nrecs = 0;
	sleep_flag=FALSE;
	set_out_port_num(-1);
	setport_num(-1);
	orchname=NULL;
	scorename=NULL;
	gab_midi_out_exit();
	gab_midi_exit();
	zakreset();
	DirectSound_exit();
	cscoreRESET();
	expRESET();
	ftRESET();
	SfReset();
	insertRESET();
	memRESET();
	musRESET();
	oloadRESET();
	tranRESET();
	orchRESET();
	soundinRESET();
	adsynRESET();
	lpcRESET();
	playReset();
	recReset();
	hetro_reset();
	argdecReset();
	stringRESET();
	widgetRESET();
}


char terminato[] = "\nCurrent Csound session terminated... \nClick \"Start\" to restart a new session with the same command-line arguments\n--------------------------------------------\n\0";

#undef exit

unsigned long exitWinGab(unsigned long cod)
{ 
	extern int exit_soon_flag;
	flStartStop=FALSE;
	SetDlgItemText(MainDialogHandle,idcStartStop,"Start");
	if (exit_soon_flag)	{
       RegistrySet();
	   exit(cod);
	}
	else
		flStartStop = FALSE;
		reset_all();
		gab_printf(terminato);
		ExitThread(cod);
	return cod;
	
} 
