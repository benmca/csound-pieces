#ifndef CSOUNDVIEW_H
#define CSOUNDVIEW_H
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
*/
#include <windows.h>
#include <commctrl.h>
#include <richedit.h>
#include <crtdbg.h>
#include <audioeffectx.h>
#include <AEffEditor.hpp>
#include <CsoundVST/CsoundVST.h>

extern HINSTANCE hInstance;

class WaitCursor
{
	HCURSOR oldCursor;
public:
	WaitCursor()
	{
		oldCursor = SetCursor(LoadCursor(0, IDC_WAIT));
	}
	~WaitCursor()
	{
		SetCursor(oldCursor);
	}
};

class CsoundView : 
public AEffEditor{
	HWND windowHandle;
	int useCount;
	CsoundVST *csoundVST;
	static std::string aboutText;
	int arrangementIndex;
	int instrumentIndex;
	int editBoxTop;
public:
	typedef enum {
		COMMAND_EDIT_BOX = 0,
		ORCHESTRA_EDIT_BOX,
		SCORE_EDIT_BOX,
		OUTPUT_EDIT_BOX,
		ARRANGEMENT_PAGE,
		ABOUT_EDIT_BOX,
	} EditBoxes;
	int currentEditBox;
	typedef enum {
		kEditorWidth = 800,
		kEditorHeight = 600,
		xPad = 4,
		yPad = 4,
	} AEffEditorSize;
	typedef enum {
		//	Column 1
		newButton = 1000,
		openButton,
		importButton,
		saveButton,
		saveAsButton,
		addInstrumentButton,
		csoundEditBox,
		outputEditBox,
		aboutEditBox,
		//	Column 2
		editCommandButton,
		editOrchestraButton,
		editArrangementButton,
		editScoreButton,
		outputButton,
		removeInstrumentButton,
		//	Column 3
		vstPerformanceButton,
		csoundPerformanceButton,
		stopPerformingButton,
		openSoundButton,
		editSoundButton,
		upInstrumentButton,
		//	Column 4
		angelConcertBitmap,
		aboutButton,
		downInstrumentButton,
		//	Arrangement page
		instrumentNamesList,
		arrangementNamesList,
	} ControlIds;
	CsoundView(AudioEffect *audioEffect);
	//	AEffEditor
	virtual ~CsoundView();
	virtual long getRect(ERect **rect);
	virtual long open(void *ptr);
	virtual void close();
	virtual void idle();
	virtual void update();
	virtual void postUpdate();
	//	Implementation.
	LRESULT windowProcedure(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam);
	static LRESULT CALLBACK WindowProcedure(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam);
	virtual void updateView(void);
	virtual void updateModel(void);
	virtual void clearOutput(void);
	virtual void appendOutput(const char *text);
	virtual HWND getWindowHandle(void) const;
protected:
	virtual void hideArrangement(void);
	virtual void showArrangement(void);
};

#endif	//	CSOUNDVIEW_H
