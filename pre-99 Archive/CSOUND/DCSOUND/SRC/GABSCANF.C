#include <windows.h>
#include "resource.h" 

static LPSTR InputBoxGabText;
static LPSTR InputBoxGabTitle;
static char InputBoxGabValue[50];



LRESULT CALLBACK 
InputBoxGabProc(HWND hDlg,UINT msg, UINT wParam,LONG lParam)
{
	switch (msg) {
		case WM_INITDIALOG:
			SetWindowText(hDlg,InputBoxGabTitle);
			SetDlgItemText(hDlg,TestoInputBox,InputBoxGabText);
			{ 
				HWND  hnd;
				hnd = GetDlgItem(  hDlg, EditInputBox); 
				SetFocus(hnd);
			}
			break;
		case WM_COMMAND :
			switch(wParam) {
				case OkInputBox:
					SendDlgItemMessage(hDlg, EditInputBox, 
                        WM_GETTEXT, 
                        (WPARAM) 49, (LPARAM)InputBoxGabValue); 
 					EndDialog(hDlg,(int) InputBoxGabValue);
					break;
			}
			break;
		case WM_SYSCOMMAND:
			if (wParam == SC_CLOSE)	EndDialog(hDlg,(int) "-2");
			break;
		default:
			break;
	}
	return FALSE;
}


LPSTR InputBoxGab(LPSTR text, LPSTR title)
{
	InputBoxGabText = text;
	InputBoxGabTitle = title;
#ifdef GAB_WIN
	{
	extern HINSTANCE hProcessInstance;
	return (LPSTR) DialogBox( 
				hProcessInstance,
				MAKEINTRESOURCE(InputBoxGabFrame),
				NULL,  
				(DLGPROC) InputBoxGabProc ); 
	}
#else
	return (LPSTR) DialogBox( 
				NULL,
				MAKEINTRESOURCE(InputBoxGabFrame),
				NULL,  
				(DLGPROC) InputBoxGabProc ); 
#endif
}



int gabscanf(LPSTR str, LPSTR title)
{
	char *s;
	s = (char *) InputBoxGab( str,  title);
	if (*s=='\0') return -2;
	return atoi(s);
}



