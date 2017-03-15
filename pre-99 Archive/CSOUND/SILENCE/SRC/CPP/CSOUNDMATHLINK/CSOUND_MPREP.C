/*
 * This file automatically produced by mprep from:
 *	csound_mprep.ml
 * mprep Revision 9 Copyright (c) Wolfram Research, Inc. 1990-2000
 */

#define MPREP_REVISION 9


#include "mathlink.h"

int MLAbort = 0;
int MLDone  = 0;
long MLSpecialCharacter = '\0';
HANDLE MLInstance = (HANDLE)0;
HWND MLIconWindow = (HWND)0;

MLINK stdlink = 0;
MLEnvironment stdenv = 0;
MLYieldFunctionObject stdyielder = 0;
MLMessageHandlerObject stdhandler = 0;

#include <windows.h>
#include <stdlib.h>
#include <string.h>
#if WIN32_MATHLINK && !defined(_fstrncpy)
#       define _fstrncpy strncpy
#endif

#ifndef CALLBACK
#define CALLBACK FAR PASCAL
typedef LONG LRESULT;
typedef unsigned int UINT;
typedef WORD WPARAM;
typedef DWORD LPARAM;
#endif


LRESULT CALLBACK MLEXPORT
IconProcedure( HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);

LRESULT CALLBACK MLEXPORT
IconProcedure( HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	switch( msg){
	case WM_CLOSE:
		MLDone = 1;
		MLAbort = 1;
		break;
	case WM_QUERYOPEN:
		return 0;
	}
	return DefWindowProc( hWnd, msg, wParam, lParam);
}

#define _APISTR(i) #i
#define APISTR(i) _APISTR(i)

HWND MLInitializeIcon( HINSTANCE hInstance, int nCmdShow)
{
	char path_name[260], *icon_name;
	WNDCLASS  wc;
	HMODULE hdll;

	MLInstance = hInstance;
	if( ! nCmdShow) return (HWND)0;
#if WIN16_MATHLINK
	hdll = GetModuleHandle( "ml16i" APISTR(MLINTERFACE));
#else
	hdll = GetModuleHandle( "ml32i" APISTR(MLINTERFACE));
#endif

	(void)GetModuleFileName( hInstance, path_name, sizeof(path_name));
	icon_name = strrchr( path_name, '\\') + 1;
	*strchr( icon_name, '.') = '\0';

	wc.style = 0;
	wc.lpfnWndProc = IconProcedure;
	wc.cbClsExtra = 0;
	wc.cbWndExtra = 0;
	wc.hInstance = hInstance;
	if( hdll)
		wc.hIcon = LoadIcon( hdll, "MLIcon");
	else
		wc.hIcon = LoadIcon( NULL, IDI_APPLICATION);
	wc.hCursor = LoadCursor( NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)GetStockObject( WHITE_BRUSH);
	wc.lpszMenuName =  (LPSTR) 0;
	wc.lpszClassName = "mprepIcon";
	(void)RegisterClass( &wc);

	MLIconWindow = CreateWindow( "mprepIcon", icon_name,
			WS_OVERLAPPEDWINDOW | WS_MINIMIZE, CW_USEDEFAULT,
			CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
			(HWND)0, (HMENU)0, hInstance, (void FAR*)0);

	if( MLIconWindow){
		ShowWindow( MLIconWindow, SW_MINIMIZE);
		UpdateWindow( MLIconWindow);
	}
	return MLIconWindow;
}


#if __BORLANDC__
#pragma argsused
#endif

MLYDEFN( devyield_result, MLDefaultYielder, ( MLINK mlp, MLYieldParameters yp))
{
	MSG msg;

#if !__BORLANDC__
	mlp = mlp; /* suppress unused warning */
	yp = yp; /* suppress unused warning */
#endif

	if( PeekMessage( &msg, (HWND)0, 0, 0, PM_REMOVE)){
		TranslateMessage( &msg);
		DispatchMessage( &msg);
	}
	return MLDone;
}


/********************************* end header *********************************/


# line 1 "csound_mprep.ml"
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
* Templates for mprep to prepare declarations and marshaling code for CsoundMathLink.
* Only functions that it makes sense to call from Mathematica are declared.
*/

# line 159 "csound_mprep.c"


int csoundMathLinkNew P(( void));

#if MLPROTOTYPES
static int _tr0( MLINK mlp)
#else
static int _tr0(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkNew();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr0 */


int csoundMathLinkNewScore P(( void));

#if MLPROTOTYPES
static int _tr1( MLINK mlp)
#else
static int _tr1(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkNewScore();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr1 */


int csoundMathLinkOpen P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr2( MLINK mlp)
#else
static int _tr2(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkOpen(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr2 */


int csoundMathLinkImport P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr3( MLINK mlp)
#else
static int _tr3(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkImport(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr3 */


int csoundMathLinkSave P(( void));

#if MLPROTOTYPES
static int _tr4( MLINK mlp)
#else
static int _tr4(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkSave();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr4 */


int csoundMathLinkSaveAs P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr5( MLINK mlp)
#else
static int _tr5(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkSaveAs(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr5 */


int csoundMathLinkPerform P(( void));

#if MLPROTOTYPES
static int _tr6( MLINK mlp)
#else
static int _tr6(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkPerform();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr6 */


int csoundMathLinkStop P(( void));

#if MLPROTOTYPES
static int _tr7( MLINK mlp)
#else
static int _tr7(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkStop();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr7 */


int csoundMathLinkPlay P(( void));

#if MLPROTOTYPES
static int _tr8( MLINK mlp)
#else
static int _tr8(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkPlay();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr8 */


int csoundMathLinkEdit P(( void));

#if MLPROTOTYPES
static int _tr9( MLINK mlp)
#else
static int _tr9(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkEdit();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);

L0:	return res;
} /* _tr9 */


char* csoundMathLinkGetText P(( void));

#if MLPROTOTYPES
static int _tr10( MLINK mlp)
#else
static int _tr10(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	kcharp_ct _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkGetText();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : (_tp0 ? MLPutString( mlp, _tp0) : MLPutSymbol( mlp, "$Failed"));

L0:	return res;
} /* _tr10 */


int csoundMathLinkSetText P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr11( MLINK mlp)
#else
static int _tr11(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkSetText(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr11 */


char* csoundMathLinkGetCommand P(( void));

#if MLPROTOTYPES
static int _tr12( MLINK mlp)
#else
static int _tr12(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	kcharp_ct _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkGetCommand();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : (_tp0 ? MLPutString( mlp, _tp0) : MLPutSymbol( mlp, "$Failed"));

L0:	return res;
} /* _tr12 */


int csoundMathLinkSetCommand P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr13( MLINK mlp)
#else
static int _tr13(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkSetCommand(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr13 */


char* csoundMathLinkGetOrchestra P(( void));

#if MLPROTOTYPES
static int _tr14( MLINK mlp)
#else
static int _tr14(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	kcharp_ct _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkGetOrchestra();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : (_tp0 ? MLPutString( mlp, _tp0) : MLPutSymbol( mlp, "$Failed"));

L0:	return res;
} /* _tr14 */


int csoundMathLinkSetOrchestra P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr15( MLINK mlp)
#else
static int _tr15(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkSetOrchestra(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr15 */


char* csoundMathLinkGetScore P(( void));

#if MLPROTOTYPES
static int _tr16( MLINK mlp)
#else
static int _tr16(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	kcharp_ct _tp0;
	if ( ! MLNewPacket(mlp) ) goto L0;

	_tp0 = csoundMathLinkGetScore();

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : (_tp0 ? MLPutString( mlp, _tp0) : MLPutSymbol( mlp, "$Failed"));

L0:	return res;
} /* _tr16 */


int csoundMathLinkSetScore P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr17( MLINK mlp)
#else
static int _tr17(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkSetScore(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr17 */


int csoundMathLinkAddScoreLine P(( kcharp_ct _tp1));

#if MLPROTOTYPES
static int _tr18( MLINK mlp)
#else
static int _tr18(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	kcharp_ct _tp1;
	if ( ! MLGetString( mlp, &_tp1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkAddScoreLine(_tp1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownString(mlp, _tp1);

L0:	return res;
} /* _tr18 */


int csoundMathLinkAddNote P(( doublep_nt _tp1, long _tpl1));

#if MLPROTOTYPES
static int _tr19( MLINK mlp)
#else
static int _tr19(mlp) MLINK mlp;
#endif
{
	int	res = 0;
	int _tp0;
	doublep_nt _tp1;
	long _tpl1;
	if ( ! MLGetRealList( mlp, &_tp1, &_tpl1) ) goto L0;
	if ( ! MLNewPacket(mlp) ) goto L1;

	_tp0 = csoundMathLinkAddNote(_tp1, _tpl1);

	res = MLAbort ?
		MLPutFunction( mlp, "Abort", 0) : MLPutInteger( mlp, _tp0);
L1:	MLDisownRealList( mlp, _tp1, _tpl1);

L0:	return res;
} /* _tr19 */


static struct func {
	int   f_nargs;
	int   manual;
	int   (*f_func)P((MLINK));
	char  *f_name;
	} _tramps[20] = {
		{ 0, 0, _tr0, "csoundMathLinkNew" },
		{ 0, 0, _tr1, "csoundMathLinkNewScore" },
		{ 1, 0, _tr2, "csoundMathLinkOpen" },
		{ 1, 0, _tr3, "csoundMathLinkImport" },
		{ 0, 0, _tr4, "csoundMathLinkSave" },
		{ 1, 0, _tr5, "csoundMathLinkSaveAs" },
		{ 0, 0, _tr6, "csoundMathLinkPerform" },
		{ 0, 0, _tr7, "csoundMathLinkStop" },
		{ 0, 0, _tr8, "csoundMathLinkPlay" },
		{ 0, 0, _tr9, "csoundMathLinkEdit" },
		{ 0, 0, _tr10, "csoundMathLinkGetText" },
		{ 1, 0, _tr11, "csoundMathLinkSetText" },
		{ 0, 0, _tr12, "csoundMathLinkGetCommand" },
		{ 1, 0, _tr13, "csoundMathLinkSetCommand" },
		{ 0, 0, _tr14, "csoundMathLinkGetOrchestra" },
		{ 1, 0, _tr15, "csoundMathLinkSetOrchestra" },
		{ 0, 0, _tr16, "csoundMathLinkGetScore" },
		{ 1, 0, _tr17, "csoundMathLinkSetScore" },
		{ 1, 0, _tr18, "csoundMathLinkAddScoreLine" },
		{ 1, 0, _tr19, "csoundMathLinkAddNote" }
		};

static char* evalstrs[] = {
	"CsoundNew::usage = \"CsoundNew[Filename_String] removes all curre",
	"nt data.\"",
	(char*)0,
	"CsoundNewScore::usage = \"CsoundNewScore[] removes only the curre",
	"nt score.\"",
	(char*)0,
	"CsoundOpen::usage = \"CsoundOpen[Filename_String] loads the speci",
	"fied file, replacing all current data with the contents of the f",
	"ile.\"",
	(char*)0,
	"CsoundImport::usage = \"Import[Filename_String] imports the filen",
	"ame, adding the file's data to the current data.\"",
	(char*)0,
	"CsoundSave::usage = \"CsoundSave[] saves the current data to the ",
	"current file, replacing the file's data.\"",
	(char*)0,
	"CsoundSaveAs::usage = \"CsoundSaveAs[Filename_String] saves the c",
	"urrent data to the named file, replacing the file's data.\"",
	(char*)0,
	"CsoundPerform::usage = \"CsoundPerform[] runs a Csound performanc",
	"e using stored data.\"",
	(char*)0,
	"CsoundStop::usage = \"CsoundStop[] stops the current Csound perfo",
	"rmance.\"",
	(char*)0,
	"CsoundPlay::usage = \"CsoundPlay[] uses the shell to play the cur",
	"rent output soundfile.\"",
	(char*)0,
	"CsoundEdit::usage = \"CsoundEdit[] uses the shell to edit the cur",
	"rent output soundfile.\"",
	(char*)0,
	"CsoundGetText::usage = \"CsoundGetText[] returns the current data",
	" as XML text.\"",
	(char*)0,
	"CsoundSetText::usage = \"CsoundSetText[Text_String] sets the curr",
	"ent data from the XML text.\"",
	(char*)0,
	"CsoundGetCommand::usage = \"CsoundGetCommand[] returns the curren",
	"t Csound command line.\"",
	(char*)0,
	"CsoundSetCommand::usage = \"CsoundSetCommand[Text_String] sets th",
	"e current Csound command line.\"",
	(char*)0,
	"CsoundGetOrchestra::usage = \"CsoundGetOrchestra[] returns the cu",
	"rrent Csound orchestra.\"",
	(char*)0,
	"CsoundSetOrchestra::usage = \"CsoundSetOrchestra[Text_String] set",
	"s the current Csound orchestra.\"",
	(char*)0,
	"CsoundGetScore::usage = \"CsoundGetScore[] returns the current Cs",
	"ound score.\"",
	(char*)0,
	"CsoundSetOrchestra::usage = \"CsoundSetOrchestra[Text_String] set",
	"s the current Csound orchestra.\"",
	(char*)0,
	"CsoundAddScoreLine::usage = \"CsoundAddScoreLine[Text_String] app",
	"ends the text as a new line in the current score.\"",
	(char*)0,
	"CsoundAddNote::usage = \"CsoundAddNote[Note_RealList] appends the",
	" vector as a new line in the current score.\"",
	(char*)0,
	(char*)0
};
#define CARDOF_EVALSTRS 20

static int _definepattern P(( MLINK, char*, char*, int));

static int _doevalstr P(( MLINK, int));

int  _MLDoCallPacket P(( MLINK, struct func[], int));


#if MLPROTOTYPES
int MLInstall( MLINK mlp)
#else
int MLInstall(mlp) MLINK mlp;
#endif
{
	int _res;
	_res = MLConnect(mlp);
	if (_res) _res = _definepattern(mlp, "CsoundNew[]", "{}", 0);
	if (_res) _res = _doevalstr( mlp, 0);
	if (_res) _res = _definepattern(mlp, "CsoundNewScore[]", "{}", 1);
	if (_res) _res = _doevalstr( mlp, 1);
	if (_res) _res = _definepattern(mlp, "CsoundOpen[Filename_String]", "{Filename}", 2);
	if (_res) _res = _doevalstr( mlp, 2);
	if (_res) _res = _definepattern(mlp, "CsoundImport[Filename_String]", "{Filename}", 3);
	if (_res) _res = _doevalstr( mlp, 3);
	if (_res) _res = _definepattern(mlp, "CsoundSave[]", "{}", 4);
	if (_res) _res = _doevalstr( mlp, 4);
	if (_res) _res = _definepattern(mlp, "CsoundSaveAs[Filename_String]", "{Filename}", 5);
	if (_res) _res = _doevalstr( mlp, 5);
	if (_res) _res = _definepattern(mlp, "CsoundPerform[]", "{}", 6);
	if (_res) _res = _doevalstr( mlp, 6);
	if (_res) _res = _definepattern(mlp, "CsoundStop[]", "{}", 7);
	if (_res) _res = _doevalstr( mlp, 7);
	if (_res) _res = _definepattern(mlp, "CsoundPlay[]", "{}", 8);
	if (_res) _res = _doevalstr( mlp, 8);
	if (_res) _res = _definepattern(mlp, "CsoundEdit[]", "{}", 9);
	if (_res) _res = _doevalstr( mlp, 9);
	if (_res) _res = _definepattern(mlp, "CsoundGetText[]", "{}", 10);
	if (_res) _res = _doevalstr( mlp, 10);
	if (_res) _res = _definepattern(mlp, "CsoundSetText[Text_String]", "{Text}", 11);
	if (_res) _res = _doevalstr( mlp, 11);
	if (_res) _res = _definepattern(mlp, "CsoundGetCommand[]", "{}", 12);
	if (_res) _res = _doevalstr( mlp, 12);
	if (_res) _res = _definepattern(mlp, "CsoundSetCommand[Text_String]", "{Text}", 13);
	if (_res) _res = _doevalstr( mlp, 13);
	if (_res) _res = _definepattern(mlp, "CsoundGetOrchestra[]", "{}", 14);
	if (_res) _res = _doevalstr( mlp, 14);
	if (_res) _res = _definepattern(mlp, "CsoundSetOrchestra[Text_String]", "{Text}", 15);
	if (_res) _res = _doevalstr( mlp, 15);
	if (_res) _res = _definepattern(mlp, "CsoundGetScore[]", "{}", 16);
	if (_res) _res = _doevalstr( mlp, 16);
	if (_res) _res = _definepattern(mlp, "CsoundSetScore[Text_String]", "{Text}", 17);
	if (_res) _res = _doevalstr( mlp, 17);
	if (_res) _res = _definepattern(mlp, "CsoundAddScoreLine[Text_String]", "{Text}", 18);
	if (_res) _res = _doevalstr( mlp, 18);
	if (_res) _res = _definepattern(mlp, "CsoundAddNote[Note_List]", "{Note}", 19);
	if (_res) _res = _doevalstr( mlp, 19);
	if (_res) _res = MLPutSymbol( mlp, "End");
	if (_res) _res = MLFlush( mlp);
	return _res;
} /* MLInstall */


#if MLPROTOTYPES
int MLDoCallPacket( MLINK mlp)
#else
int MLDoCallPacket( mlp) MLINK mlp;
#endif
{
	return _MLDoCallPacket( mlp, _tramps, 20);
} /* MLDoCallPacket */

/******************************* begin trailer ********************************/

#ifndef EVALSTRS_AS_BYTESTRINGS
#	define EVALSTRS_AS_BYTESTRINGS 1
#endif

#if CARDOF_EVALSTRS
static int  _doevalstr( MLINK mlp, int n)
{
	long bytesleft, charsleft, bytesnow;
#if !EVALSTRS_AS_BYTESTRINGS
	long charsnow;
#endif
	char **s, **p;
	char *t;

	s = evalstrs;
	while( n-- > 0){
		if( *s == 0) break;
		while( *s++ != 0){}
	}
	if( *s == 0) return 0;
	bytesleft = 0;
	charsleft = 0;
	p = s;
	while( *p){
		t = *p; while( *t) ++t;
		bytesnow = t - *p;
		bytesleft += bytesnow;
		charsleft += bytesnow;
#if !EVALSTRS_AS_BYTESTRINGS
		t = *p;
		charsleft -= MLCharacterOffset( &t, t + bytesnow, bytesnow);
		/* assert( t == *p + bytesnow); */
#endif
		++p;
	}


	MLPutNext( mlp, MLTKSTR);
#if EVALSTRS_AS_BYTESTRINGS
	p = s;
	while( *p){
		t = *p; while( *t) ++t;
		bytesnow = t - *p;
		bytesleft -= bytesnow;
		MLPut8BitCharacters( mlp, bytesleft, (unsigned char*)*p, bytesnow);
		++p;
	}
#else
	MLPut7BitCount( mlp, charsleft, bytesleft);
	p = s;
	while( *p){
		t = *p; while( *t) ++t;
		bytesnow = t - *p;
		bytesleft -= bytesnow;
		t = *p;
		charsnow = bytesnow - MLCharacterOffset( &t, t + bytesnow, bytesnow);
		/* assert( t == *p + bytesnow); */
		charsleft -= charsnow;
		MLPut7BitCharacters(  mlp, charsleft, *p, bytesnow, charsnow);
		++p;
	}
#endif
	return MLError( mlp) == MLEOK;
}
#endif /* CARDOF_EVALSTRS */


static int  _definepattern( MLINK mlp, char *patt, char *args, int func_n)
{
	MLPutFunction( mlp, "DefineExternal", (long)3);
	  MLPutString( mlp, patt);
	  MLPutString( mlp, args);
	  MLPutInteger( mlp, func_n);
	return !MLError(mlp);
} /* _definepattern */


int _MLDoCallPacket( MLINK mlp, struct func functable[], int nfuncs)
{
	long len;
	int n, res = 0;
	struct func* funcp;

	if( ! MLGetInteger( mlp, &n) ||  n < 0 ||  n >= nfuncs) goto L0;
	funcp = &functable[n];

	if( funcp->f_nargs >= 0
	&& ( ! MLCheckFunction(mlp, "List", &len)
	     || ( !funcp->manual && (len != funcp->f_nargs))
	     || (  funcp->manual && (len <  funcp->f_nargs))
	   )
	) goto L0;

	stdlink = mlp;
	res = (*funcp->f_func)( mlp);

L0:	if( res == 0)
		res = MLClearError( mlp) && MLPutSymbol( mlp, "$Failed");
	return res && MLEndPacket( mlp) && MLNewPacket( mlp);
} /* _MLDoCallPacket */


mlapi_packet MLAnswer( MLINK mlp)
{
	mlapi_packet pkt = 0;

	while( !MLDone && !MLError(mlp)
	&& (pkt = MLNextPacket(mlp), pkt) && pkt == CALLPKT){
		MLAbort = 0;
		if( !MLDoCallPacket(mlp)) pkt = 0;
	}
	MLAbort = 0;
	return pkt;
}



/*
	Module[ { me = $ParentLink},
		$ParentLink = contents of RESUMEPKT;
		Message[ MessageName[$ParentLink, "notfe"], me];
		me]
*/

static int refuse_to_be_a_frontend( MLINK mlp)
{
	int pkt;

	MLPutFunction( mlp, "EvaluatePacket", 1);
	  MLPutFunction( mlp, "Module", 2);
	    MLPutFunction( mlp, "List", 1);
		  MLPutFunction( mlp, "Set", 2);
		    MLPutSymbol( mlp, "me");
	        MLPutSymbol( mlp, "$ParentLink");
	  MLPutFunction( mlp, "CompoundExpression", 3);
	    MLPutFunction( mlp, "Set", 2);
	      MLPutSymbol( mlp, "$ParentLink");
	      MLTransferExpression( mlp, mlp);
	    MLPutFunction( mlp, "Message", 2);
	      MLPutFunction( mlp, "MessageName", 2);
	        MLPutSymbol( mlp, "$ParentLink");
	        MLPutString( mlp, "notfe");
	      MLPutSymbol( mlp, "me");
	    MLPutSymbol( mlp, "me");
	MLEndPacket( mlp);

	while( (pkt = MLNextPacket( mlp), pkt) && pkt != SUSPENDPKT)
		MLNewPacket( mlp);
	MLNewPacket( mlp);
	return MLError( mlp) == MLEOK;
}


int MLEvaluate( MLINK mlp, charp_ct s)
{
	if( MLAbort) return 0;
	return MLPutFunction( mlp, "EvaluatePacket", 1L)
		&& MLPutFunction( mlp, "ToExpression", 1L)
		&& MLPutString( mlp, s)
		&& MLEndPacket( mlp);
}


int MLEvaluateString( MLINK mlp, charp_ct s)
{
	int pkt;
	if( MLAbort) return 0;
	if( MLEvaluate( mlp, s)){
		while( (pkt = MLAnswer( mlp), pkt) && pkt != RETURNPKT)
			MLNewPacket( mlp);
		MLNewPacket( mlp);
	}
	return MLError( mlp) == MLEOK;
} /* MLEvaluateString */


#if __BORLANDC__
#pragma argsused
#endif

MLMDEFN( void, MLDefaultHandler, ( MLINK mlp, unsigned long message, unsigned long n))
{
#if !__BORLANDC__
	mlp = (MLINK)0; /* suppress unused warning */
	n = 0;          /* suppress unused warning */
#endif

	switch (message){
	case MLTerminateMessage:
		MLDone = 1;
	case MLInterruptMessage:
	case MLAbortMessage:
		MLAbort = 1;
	default:
		return;
	}
}



static int _MLMain( charpp_ct argv, charpp_ct argv_end, charp_ct commandline)
{
	MLINK mlp;
	long err;

	if( !stdenv)
		stdenv = MLInitialize( (MLParametersPointer)0);
	if( stdenv == (MLEnvironment)0) goto R0;

	if( !stdyielder)
		stdyielder = MLCreateYieldFunction( stdenv,
			NewMLYielderProc( MLDefaultYielder), 0);
	if( !stdhandler)
		stdhandler = MLCreateMessageHandler( stdenv,
			NewMLHandlerProc( MLDefaultHandler), 0);


	mlp = commandline
		? MLOpenString( stdenv, commandline, &err)
		: MLOpenArgv( stdenv, argv, argv_end, &err);
	if( mlp == (MLINK)0){
		MLAlert( stdenv, MLErrorString( stdenv, err));
		goto R1;
	}

	if( MLIconWindow){
		char textbuf[64];
		int len;
		len = GetWindowText(MLIconWindow, textbuf, sizeof(textbuf)-2);
		strcat( textbuf + len, "(");
		_fstrncpy( textbuf + len + 1, MLName(mlp), sizeof(textbuf) - len - 3);
		textbuf[sizeof(textbuf) - 2] = '\0';
		strcat( textbuf, ")");
		SetWindowText( MLIconWindow, textbuf);
	}

	if( MLInstance){
		if( stdyielder) MLSetYieldFunction( mlp, stdyielder);
		if( stdhandler) MLSetMessageHandler( mlp, stdhandler);
	}

	if( MLInstall( mlp))
		while( MLAnswer( mlp) == RESUMEPKT){
			if( ! refuse_to_be_a_frontend( mlp)) break;
		}

	MLClose( mlp);
R1:	MLDeinitialize( stdenv);
	stdenv = (MLEnvironment)0;
R0:	return !MLDone;
} /* _MLMain */


int MLMainString( charp_ct commandline)
{
	return _MLMain( (charpp_ct)0, (charpp_ct)0, commandline);
}

int MLMainArgv( char** argv, char** argv_end) /* note not FAR pointers */
{   
	static char FAR * far_argv[128];
	int count = 0;
	
	while(argv < argv_end)
		far_argv[count++] = *argv++;
		 
	return _MLMain( far_argv, far_argv + count, (charp_ct)0);

}

int MLMain( int argc, charpp_ct argv)
{
 	return _MLMain( argv, argv + argc, (charp_ct)0);
}
 
