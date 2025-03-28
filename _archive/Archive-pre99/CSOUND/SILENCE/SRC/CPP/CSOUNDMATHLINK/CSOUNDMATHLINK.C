/**
* S I L E N C E
* 
* An auto-extensible system for making music on computers by means of software alone.
* Copyright (c) 2001 by Michael Gogins. All rights reserved.
*
* L I C E N S E
*
* This software is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* P U R P O S E
*
* Provides a native MathLink interface to CsoundVST, 
* enabling Mathematica to be used for algorithmic composition.
* Also provides a Windows stand-alone executable version of CsoundVST.
* Illustrates how to use CsoundVST as a "control" in Windows programs.
* 
* Note that this is a C file, not a C++ file, in order to compile and link with MathLink.
*/
#define APPNAME "CsoundMathLink"

#include <windows.h>
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <mathlink.h>
#include <process.h>
#include "CsoundMathLink.h"

extern int MLAbort;
extern int MLDone;
extern long MLSpecialCharacter;
extern HANDLE MLInstance;
extern HWND MLIconWindow;

char szAppName[100]; 
char szTitle[100];   

BOOL InitInstance(HINSTANCE, int);
LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);

// Include declarations and definitions generated by mprep from csound.ml.

#include "csound_mprep.c"

//	Thread routine to run the mprep event loop.

static void csoundMathLinkThreadRoutine(void *data)
{
	char *lpCmdLine = (char *)data;
	MLMainString(lpCmdLine);
}

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
	MSG msg;
	unsigned long thread = 0;
	lstrcpy (szAppName, APPNAME);
	LoadString (hInstance, IDS_APP_TITLE, szTitle, 100);
	if (!InitInstance(hInstance, nCmdShow)) 
	{
		return 0;
	}
	loadCommandLine(lpCmdLine);
	//	Start the MathLink event loop in a separate thread.	
	thread = _beginthread(csoundMathLinkThreadRoutine, 0, lpCmdLine);
	//	Run the Windows event loop.
	while (GetMessage(&msg, NULL, 0, 0)) 
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}	
	return MLDone;
}

BOOL InitInstance(HINSTANCE hInstance_, int nCmdShow)
{
    WNDCLASS  wc;
	MLInstance = hInstance_;
	wc.style         = CS_HREDRAW | CS_VREDRAW;
	wc.lpfnWndProc   = (WNDPROC)WndProc;
	wc.cbClsExtra    = 0;
	wc.cbWndExtra    = 0;
	wc.hInstance     = MLInstance;
	wc.hIcon         = LoadIcon (MLInstance, szAppName);
	wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
	wc.lpszMenuName  = szAppName;
	wc.lpszClassName = szAppName;
	//	Register the window class.
	RegisterClass(&wc);
	//	Create the main frame window, i.e. the application window.
	MLIconWindow = CreateWindow(
		szAppName,						// registered class name
		szTitle,						// window name
		WS_OVERLAPPEDWINDOW,    // window style
		50,								// horizontal position of window
		50,								// vertical position of window
		100,							// window width
		100,							// window height
		0,								// handle to parent or owner window
		0,								// menu handle or child identifier
		MLInstance,						// handle to application instance
		0								// window-creation data
		);
	fillParentWindowWithCsoundView(MLIconWindow);
	ShowWindow(MLIconWindow, nCmdShow);
	UpdateWindow(MLIconWindow);
	return 1;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId;
	switch (message) 
	{
	case WM_SIZE:
		{
			RECT clientRect;
			HWND childWindow = 0;
			GetClientRect(hWnd, &clientRect);
			childWindow = getCsoundViewWindowHandle();
			MoveWindow(childWindow, 0, 0, clientRect.right, clientRect.bottom, 0);
		}
		break;
	case WM_COMMAND:
		wmId    = LOWORD(wParam); 
		//Parse the menu selections:
		switch (wmId) 
		{
		case IDM_EXIT:
			DestroyWindow (hWnd);
			break;
		default:
			return (DefWindowProc(hWnd, message, wParam, lParam));
		}
		break;
		case WM_DESTROY:
			PostQuitMessage(0);
			break;
		case WM_CLOSE:
			MLDone = 1;
			MLAbort = 1;
			PostQuitMessage(0);
			break;
		case WM_QUERYOPEN:
		default:
			return (DefWindowProc(hWnd, message, wParam, lParam));
	}
	return 0;
}
