#include <CsoundVST/CsoundView.h>
#include <CsoundVST/CsoundVST.h>
#include <SSound/SSound.h>
#include <strstream>
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

static const char *windowClassName = "CsoundVSTClass";

static CsoundView *currentCsoundView = 0;

static char staticBuffer[0x1000];

std::string GetText(HWND window, int id)
{
	std::string text;
	int lineCount = SendDlgItemMessage(window, id, EM_GETLINECOUNT, 0, 0);
	short bufferSize = sizeof(staticBuffer);
	for(int i = 0; i < lineCount; i++)
	{
		memcpy(staticBuffer, &bufferSize, sizeof(bufferSize));
		int length = SendDlgItemMessage(window, id, EM_GETLINE, i, (long) staticBuffer);
		text.append(staticBuffer);
	}
	return text;
}

void SetText(HWND window, int id, std::string text)
{
	SendDlgItemMessage(window, id, WM_SETTEXT, 0, (long) "");
	SendDlgItemMessage(window, id, WM_SETTEXT, 0, (long) text.c_str());
}

HWND CreateButton(HWND parent, int id, char* title, int x, int y, int w, int h, int extraStyles = 0)
{
    HWND hwnd = CreateWindowEx(WS_EX_CLIENTEDGE | extraStyles, 
							   "BUTTON", 
							   title,
							   WS_CHILD | WS_VISIBLE | BS_LEFT | BS_VCENTER | BS_LEFTTEXT,
							   x, 
							   y, 
							   w, 
							   h, 
							   parent, 
							   (HMENU) id, 
							   hInstance, 
							   NULL); 
	HFONT font = (HFONT) GetStockObject(DEFAULT_GUI_FONT);
	SendMessage(hwnd, WM_SETFONT, (WPARAM) font, 0);
	return hwnd;
}

HWND CreateBitmap(HWND parent, int bitmapName, int id, int x, int y, int w, int h, int extraStyles = 0)
{
	HBITMAP bitmap = LoadBitmap(hInstance,  
								MAKEINTRESOURCE(bitmapName));
    HWND child = CreateWindowEx(WS_EX_CLIENTEDGE | extraStyles, 
							    "STATIC", 
							    "",
							    WS_CHILD | WS_VISIBLE | SS_BITMAP | SS_CENTERIMAGE | SS_REALSIZEIMAGE,
							    x, 
							    y, 
							    w, 
							    h, 
							    parent, 
							    (HMENU) id, 
							    hInstance, 
							    NULL); 
	int result = SendMessage(child, 
							 STM_SETIMAGE, 
							 IMAGE_BITMAP, 
							 (LPARAM) bitmap);
	return child;
}

HWND CreateEditBox(HWND parent, int id, char* title, int x, int y, int w, int h, int extraStyles = 0, int styles = 0)
{
    HWND hwnd = CreateWindowEx(WS_EX_CLIENTEDGE | extraStyles, 
							   "RichEdit", 
							   title,
							   WS_CHILD | WS_VISIBLE | ES_MULTILINE  | ES_WANTRETURN | WS_VSCROLL | WS_HSCROLL | styles,
							   x, 
							   y, 
							   w, 
							   h, 
							   parent, 
							   (HMENU) id, 
							   hInstance, 
							   NULL); 
	HFONT font = (HFONT) GetStockObject(ANSI_FIXED_FONT);
	SendMessage(hwnd, WM_SETFONT, (WPARAM) font, 0);
	SendMessage(hwnd, EM_LIMITTEXT, 0xfffffff, 0);
	return hwnd;
}

HWND CreateList(HWND parent, int id, int x, int y, int w, int h, int extraStyles = 0, int styles = 0)
{
    HWND hwnd = CreateWindowEx(WS_EX_CLIENTEDGE | extraStyles, 
							   "LISTBOX", 
							   0,
							   WS_CHILD | WS_VISIBLE | WS_VSCROLL | styles,
							   x, 
							   y, 
							   w, 
							   h, 
							   parent, 
							   (HMENU) id, 
							   hInstance, 
							   NULL); 
	HFONT font = (HFONT) GetStockObject(ANSI_FIXED_FONT);
	SendMessage(hwnd, WM_SETFONT, (WPARAM) font, 0);
	return hwnd;
}

CsoundView::CsoundView(AudioEffect *audioEffect) : 
AEffEditor(audioEffect),
csoundVST((CsoundVST *)audioEffect),
useCount(0),
currentEditBox(ABOUT_EDIT_BOX),
arrangementIndex(0),
instrumentIndex(0),
editBoxTop(0)
{
	effect->setEditor(this);
}

CsoundView::~CsoundView()
{
}

long CsoundView::getRect(ERect **erect)
{
	static ERect r = {0, 0, kEditorHeight, kEditorWidth};
	*erect = &r;
	return true;
}

long CsoundView::open(void *parentWindow)
{
	LRESULT result = 0;
	HINSTANCE library = ::LoadLibrary("RICHED32.DLL");
	int returnValue = 0;
	systemWindow = parentWindow; 
	// Create window class, if we are called the first time
	useCount++;
	ATOM atom = 0;
	if(useCount == 1)
	{
		WNDCLASS windowClass;
		windowClass.style = 0;
		windowClass.lpfnWndProc = WindowProcedure;
		windowClass.cbClsExtra = 0;
		windowClass.cbWndExtra = 0;
		windowClass.hInstance = hInstance;
		windowClass.hIcon = 0;
		windowClass.hCursor = 0;
		windowClass.hbrBackground = GetSysColorBrush (COLOR_BTNFACE);
		windowClass.lpszMenuName = 0;
		windowClass.lpszClassName = windowClassName;
		atom = RegisterClass(&windowClass);
	}
	// Create our base window
	windowHandle = CreateWindowEx(WS_EX_CLIENTEDGE, 
		windowClassName, 
		"",
		WS_CHILD | WS_VISIBLE,
		0, 
		0, 
		kEditorWidth,
		kEditorHeight, 
		(HWND) systemWindow, 
		0, 
		hInstance, 
		0);
	returnValue = SetWindowLong(windowHandle, GWL_USERDATA, (long) this);	
	int buttonWidth = 194;
	int buttonHeight = 30;
	int x;
	int y;
	int extraStyles = WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE;
	//	Column 1
	x = xPad;
	y = yPad;
	int editHeight = 416;
	int editWidth = buttonWidth * 4 + xPad * 3;
	CreateButton(windowHandle, newButton, "New", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, openButton, "Open...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, importButton, "Import...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, saveButton, "Save", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, saveAsButton, "Save as...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	editBoxTop = y;
	CreateButton(windowHandle, addInstrumentButton, "Add instrument", x, y, buttonWidth, buttonHeight, extraStyles);
	CreateEditBox(windowHandle, csoundEditBox, "", x, y, editWidth, editHeight, extraStyles);
	CreateEditBox(windowHandle, outputEditBox, "", x, y, editWidth, editHeight, extraStyles);
	CreateEditBox(windowHandle, aboutEditBox, (char *)CsoundVST::aboutText.c_str(), x, y, editWidth, editHeight, extraStyles, ES_READONLY | extraStyles);
	y = y + buttonHeight + yPad;
	CreateList(windowHandle, instrumentNamesList, x, y, buttonWidth + xPad + buttonWidth, editHeight - yPad - buttonHeight);
	x  = x + buttonWidth + xPad + buttonWidth + xPad;
	CreateList(windowHandle, arrangementNamesList, x, y, buttonWidth + xPad + buttonWidth, editHeight - yPad - buttonHeight);
	//	Column 4
	x = xPad + buttonWidth + xPad;
	y = yPad;
	CreateButton(windowHandle, editCommandButton, "Edit command...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, editOrchestraButton, "Edit orchestra...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, editArrangementButton, "Edit arrangement...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, editScoreButton, "Edit score...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, outputButton, "Output...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, removeInstrumentButton, "Remove instrument", x, y, buttonWidth, buttonHeight, extraStyles);
	//	Column 3
	x = x + buttonWidth + xPad;
	y = yPad;
	CreateButton(windowHandle, csoundPerformanceButton, "Perform Csound", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, vstPerformanceButton, "Perform VST", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, stopPerformingButton, "Stop performing", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, openSoundButton, "Play soundfile...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, editSoundButton, "Edit soundfile...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, upInstrumentButton, "Move up", x, y, buttonWidth, buttonHeight, extraStyles);
	//	Column 4
	x = x + buttonWidth + xPad;
	y = yPad;
	int bitmapHeight = 132;
	CreateBitmap(windowHandle, 103, angelConcertBitmap, x, y, buttonWidth, bitmapHeight, extraStyles);
	y = y + bitmapHeight + yPad;
	CreateButton(windowHandle, aboutButton, "About...", x, y, buttonWidth, buttonHeight, extraStyles);
	y = y + buttonHeight + yPad;
	CreateButton(windowHandle, downInstrumentButton, "Move down", x, y, buttonWidth, buttonHeight, extraStyles);
	currentCsoundView = this;
	csoundVST->setMessageCallback(vstCsoundWxLogCallback);
	updateView();
	return true;
}

void CsoundView::close()
{
	useCount--;
	if(useCount == 0)
	{
		UnregisterClass(windowClassName, hInstance);
	}
}

void CsoundView::idle() 
{ 
	if(updateFlag) 
	{
		updateFlag = 0; 
		update();
	}
}

void CsoundView::update()
{
	updateView();
}

void CsoundView::postUpdate() 
{
	updateFlag = 1;
}

LRESULT CALLBACK CsoundView::WindowProcedure(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	CsoundView *csoundView = (CsoundView *)GetWindowLong(hwnd, GWL_USERDATA);
	if(csoundView)
	{
		return csoundView->windowProcedure(hwnd, message, wParam, lParam);
	}
	return DefWindowProc(hwnd, message, wParam, lParam); 
}

LRESULT CsoundView::windowProcedure(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int id = 0;
	switch(message)
	{
	case WM_SIZE:
		{
			HWND editWindow = GetDlgItem(windowHandle, csoundEditBox);
			int newWidth = LOWORD(lParam)  - xPad;
			int newHeight = HIWORD(lParam) - editBoxTop - yPad;
			MoveWindow(editWindow, xPad, editBoxTop, newWidth, newHeight, false);
			editWindow = GetDlgItem(windowHandle, outputEditBox);
			MoveWindow(editWindow, xPad, editBoxTop, newWidth, newHeight, false);
			editWindow = GetDlgItem(windowHandle, aboutEditBox);
			MoveWindow(editWindow, xPad, editBoxTop, newWidth, newHeight, false);
		}
		break;
	case WM_COMMAND:
	{
		switch(wParam)
		{
		case newButton:
			{
				csoundVST->removeAll();
				updateView();
			}
			break;
		case openButton:
			{
				csoundVST->removeAll();
				char szFile[260];		// buffer for filename
				memset(szFile, 0, sizeof(szFile));
				OPENFILENAME ofn;       // common dialog box structure
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = windowHandle;
				ofn.lpstrFile = szFile;
				ofn.nMaxFile = sizeof(szFile);
				ofn.lpstrFilter = "Csound\0*.csd\0Orchestra\0*.orc\0Score\0*.sco\0Midi\0*.mid\0All\0*.*\0\0";
				ofn.nFilterIndex = 0;
				ofn.lpstrFileTitle = 0;
				ofn.nMaxFileTitle = 0;
				ofn.lpstrInitialDir = 0;
				ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
				ofn.lpstrDefExt = "*.csd";
				if(GetOpenFileName(&ofn))
				{
					WaitCursor wait;
					updateView();
					csoundVST->load(ofn.lpstrFile);
					updateView();
				}	
			}
			break;
		case importButton:
			{
				char szFile[260];		// buffer for filename
				memset(szFile, 0, sizeof(szFile));
				OPENFILENAME ofn;       // common dialog box structure
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = windowHandle;
				ofn.lpstrFile = szFile;
				ofn.nMaxFile = sizeof(szFile);
				ofn.lpstrFilter = "Csound\0*.csd\0Orchestra\0*.orc\0Score\0*.sco\0Midi\0*.mid\0All\0*.*\0\0";
				ofn.nFilterIndex = 0;
				ofn.lpstrFileTitle = 0;
				ofn.nMaxFileTitle = 0;
				ofn.lpstrInitialDir = 0;
				ofn.Flags = OFN_PATHMUSTEXIST | OFN_FILEMUSTEXIST;
				ofn.lpstrDefExt = "*.csd";
				if(GetOpenFileName(&ofn))
				{
					WaitCursor wait;
					csoundVST->import(ofn.lpstrFile);
					updateView();
				}	
			}
			break;
		case saveButton:
			{
				if(csoundVST->getFilename().size() > 0)
				{
					updateModel();
					csoundVST->save(csoundVST->getFilename());
				}
			}
			break;
		case saveAsButton:
			{
				char szFile[260];		// buffer for filename
				memset(szFile, 0, sizeof(szFile));
				OPENFILENAME ofn;       // common dialog box structure
				memset(&ofn, 0, sizeof(ofn));
				ofn.lStructSize = sizeof(ofn);
				ofn.hwndOwner = windowHandle;
				ofn.lpstrFile = szFile;
				ofn.nMaxFile = sizeof(szFile);
				ofn.lpstrFilter = "Csound\0*.csd\0All\0*.*\0\0";
				ofn.nFilterIndex = 0;
				ofn.lpstrFileTitle = 0;
				ofn.nMaxFileTitle = 0;
				ofn.lpstrInitialDir = 0;
				ofn.Flags = OFN_PATHMUSTEXIST | OFN_OVERWRITEPROMPT;
				ofn.lpstrDefExt = "*.csd";
				if(GetSaveFileName(&ofn))
				{
					WaitCursor wait;
					updateModel();
					csoundVST->save(ofn.lpstrFile);
					csoundVST->setFilename(ofn.lpstrFile);
				}	
				updateModel();
			}
			break;
		case vstPerformanceButton:
			{
				WaitCursor waitCursor();
				updateModel();
				currentEditBox = OUTPUT_EDIT_BOX;
				updateView();
				clearOutput();
				SendMessage(GetDlgItem(windowHandle, outputEditBox), WM_SETFOCUS, 0, 0);
				csoundVST->vstPerform();
			}
			break;
		case csoundPerformanceButton:
			{
				WaitCursor waitCursor();
				if(currentEditBox == ARRANGEMENT_PAGE)
				{
					instrumentIndex = SendDlgItemMessage(windowHandle, instrumentNamesList, LB_GETCURSEL, 0, 0);
					if(instrumentIndex == LB_ERR)
					{
						break;
					}
					SendDlgItemMessage(windowHandle, instrumentNamesList, LB_GETTEXT, instrumentIndex, (long) staticBuffer);
					currentEditBox = OUTPUT_EDIT_BOX;
					updateView();
					clearOutput();
					SendMessage(GetDlgItem(windowHandle, outputEditBox), WM_SETFOCUS, 0, 0);
					bool succeeded = false;
					succeeded = SetFileAttributes("./test.wav", FILE_ATTRIBUTE_NORMAL);
					succeeded = DeleteFile("./test.wav");
					succeeded = SetFileAttributes("./test.orc", FILE_ATTRIBUTE_NORMAL);
					succeeded = DeleteFile("./test.orc");
					succeeded = SetFileAttributes("./test.sco", FILE_ATTRIBUTE_NORMAL);
					succeeded = DeleteFile("./test.sco");
					std::string outputFilename = csoundVST->test(staticBuffer);
					HINSTANCE returnValue = ShellExecute(0,
						"open",
						outputFilename.c_str(),
						0,
						0,
						SW_SHOWNORMAL);
					
				}
				else
				{
					updateModel();
					currentEditBox = OUTPUT_EDIT_BOX;
					updateView();
					clearOutput();
					SendMessage(GetDlgItem(windowHandle, outputEditBox), WM_SETFOCUS, 0, 0);
					csoundVST->csoundPerform();
				}
			}
			break;
		case stopPerformingButton:
			{
				csoundVST->stop();
				csoundVST->suspend();
			}
			break;
		case editCommandButton:
			{
				updateModel();
				currentEditBox = COMMAND_EDIT_BOX;
				updateView();
			}
			break;
		case editOrchestraButton:
			{
				updateModel();
				currentEditBox = ORCHESTRA_EDIT_BOX;
				updateView();
			}
			break;
		case editArrangementButton:
			{
				updateModel();
				currentEditBox = ARRANGEMENT_PAGE;
				updateView();
			}
			break;
		case editScoreButton:
			{
				updateModel();
				currentEditBox = SCORE_EDIT_BOX;
				updateView();
			}
			break;
		case outputButton:
			{
				updateModel();
				currentEditBox = OUTPUT_EDIT_BOX;
				updateView();
			}
			break;
		case openSoundButton:
			{
				csoundVST->shellPlaySoundfile();
			}
			break;
		case editSoundButton:
			{
				csoundVST->shellEditSoundfile();
			}
			break;
		case aboutButton:
			{
				updateModel();
				currentEditBox = ABOUT_EDIT_BOX;
				updateView();
			}
			break;
		case addInstrumentButton:
			{
				instrumentIndex = SendDlgItemMessage(windowHandle, instrumentNamesList, LB_GETCURSEL, 0, 0);
				if(instrumentIndex == LB_ERR)
				{
					break;
				}
				SendDlgItemMessage(windowHandle, instrumentNamesList, LB_GETTEXT, instrumentIndex, (long) staticBuffer);
				arrangementIndex = SendDlgItemMessage(windowHandle, arrangementNamesList, LB_GETCURSEL, 0, 0);
				if(arrangementIndex == LB_ERR)
				{
					csoundVST->addArrangement(staticBuffer);
				}
				else
				{
					csoundVST->insertArrangement(arrangementIndex, staticBuffer);
				}
				updateView();
			}
			break;
		case removeInstrumentButton:
			{
				int selectionIndex = SendDlgItemMessage(windowHandle, arrangementNamesList, LB_GETCURSEL, 0, 0);
				if(selectionIndex == LB_ERR)
				{
					break;
				}
				csoundVST->removeArrangement(selectionIndex);
				updateView();
			}
			break;
		case upInstrumentButton:
			{
				int arrangementCount = csoundVST->getArrangementCount();
				if(arrangementCount < 2)
				{
					break;
				}
				arrangementIndex = SendDlgItemMessage(windowHandle, arrangementNamesList, LB_GETCURSEL, 0, 0);
				int moveIndex = arrangementIndex;
				arrangementIndex--;
				if(arrangementIndex < 0)
				{
					arrangementIndex = 0;
					break;
				}
				std::string tempMove = csoundVST->getArrangement(moveIndex);
				std::string tempArrangement = csoundVST->getArrangement(arrangementIndex);
				csoundVST->setArrangement(moveIndex, tempArrangement);
				csoundVST->setArrangement(arrangementIndex, tempMove);
				updateView();
			}
			break;
		case downInstrumentButton:
			{
				int arrangementCount = csoundVST->getArrangementCount();
				if(arrangementCount < 2)
				{
					break;
				}
				arrangementIndex = SendDlgItemMessage(windowHandle, arrangementNamesList, LB_GETCURSEL, 0, 0);
				int moveIndex = arrangementIndex;
				arrangementIndex++;
				if(arrangementIndex >= arrangementCount)
				{
					arrangementIndex = arrangementCount - 1;
					break;
				}
				std::string tempMove = csoundVST->getArrangement(moveIndex);
				std::string tempArrangement = csoundVST->getArrangement(arrangementIndex);
				csoundVST->setArrangement(moveIndex, tempArrangement);
				csoundVST->setArrangement(arrangementIndex, tempMove);
				updateView();
			}
			break;
		}
		}
	}
	return DefWindowProc(hwnd, message, wParam, lParam); 
}

void CsoundView::updateModel(void)
{
	switch(currentEditBox)
	{
	case COMMAND_EDIT_BOX:
		csoundVST->setCommand(GetText(windowHandle, csoundEditBox));
		break;
	case ORCHESTRA_EDIT_BOX:
		csoundVST->setOrchestra(GetText(windowHandle, csoundEditBox));
		break;
	case ARRANGEMENT_PAGE:
		hideArrangement();
		showArrangement();
		break;
	case SCORE_EDIT_BOX:
		csoundVST->setScore(GetText(windowHandle, csoundEditBox));
		break;
	case OUTPUT_EDIT_BOX:
		break;
	case ABOUT_EDIT_BOX:
		break;
	}
	//csoundVST->programs[csoundVST->getProgram()].xml = csoundVST->getXML();
}

void CsoundView::updateView()
{
	WaitCursor waitCursor();
	HWND item = 0;
	switch(currentEditBox)
	{
	case COMMAND_EDIT_BOX:
		hideArrangement();
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_SHOW);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_HIDE);
		SetText(windowHandle, csoundEditBox, csoundVST->getCommand());
		break;
	case ORCHESTRA_EDIT_BOX:
		hideArrangement();
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_SHOW);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_HIDE);
		SetText(windowHandle, csoundEditBox, csoundVST->getOrchestra());
		break;
	case ARRANGEMENT_PAGE:
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_HIDE);
		showArrangement();
		break;
	case SCORE_EDIT_BOX:
		hideArrangement();
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_SHOW);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_HIDE);
		SetText(windowHandle, csoundEditBox, csoundVST->getScore());
		break;
	case OUTPUT_EDIT_BOX:
		hideArrangement();
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_SHOW);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_HIDE);
		break;
	case ABOUT_EDIT_BOX:
		hideArrangement();
		item = GetDlgItem(windowHandle, csoundEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, outputEditBox);
		ShowWindow(item, SW_HIDE);
		item = GetDlgItem(windowHandle, aboutEditBox);
		ShowWindow(item, SW_SHOW);
		break;
	}
}

void CsoundView::clearOutput(void)
{
	SetText(windowHandle, outputEditBox, "");
}

void CsoundView::appendOutput(const char *text)
{
	HWND item = GetDlgItem(windowHandle, outputEditBox);
	SendMessage(item,	// handle to destination window 
		EM_REPLACESEL,  // message to send
		(WPARAM) 0,     // undo option
		(LPARAM) text   // text string (LPCTSTR)
		);
	SendMessage(item,	// handle to destination window 
		EM_REPLACESEL,  // message to send
		(WPARAM) 0,     // undo option
		(LPARAM) "\n"   // text string (LPCTSTR)
		);
}

void CsoundView::hideArrangement(void)
{
	HWND item = 0;
	item = GetDlgItem(windowHandle, addInstrumentButton);
	ShowWindow(item, SW_HIDE);
	item = GetDlgItem(windowHandle, removeInstrumentButton);
	ShowWindow(item, SW_HIDE);
	item = GetDlgItem(windowHandle, upInstrumentButton);
	ShowWindow(item, SW_HIDE);
	item = GetDlgItem(windowHandle, downInstrumentButton);
	ShowWindow(item, SW_HIDE);
	item = GetDlgItem(windowHandle, instrumentNamesList);
	ShowWindow(item, SW_HIDE);
	item = GetDlgItem(windowHandle, arrangementNamesList);
	ShowWindow(item, SW_HIDE);
}

void CsoundView::showArrangement(void)
{
	HWND item = 0;
	item = GetDlgItem(windowHandle, addInstrumentButton);
	ShowWindow(item, SW_SHOW);
	item = GetDlgItem(windowHandle, removeInstrumentButton);
	ShowWindow(item, SW_SHOW);
	item = GetDlgItem(windowHandle, upInstrumentButton);
	ShowWindow(item, SW_SHOW);
	item = GetDlgItem(windowHandle, downInstrumentButton);
	ShowWindow(item, SW_SHOW);
	item = GetDlgItem(windowHandle, instrumentNamesList);
	ShowWindow(item, SW_SHOW);
	item = GetDlgItem(windowHandle, arrangementNamesList);
	ShowWindow(item, SW_SHOW);
	SendDlgItemMessage(windowHandle, instrumentNamesList, LB_RESETCONTENT, 0, 0);
	std::vector<std::string> names;
	csoundVST->getInstrumentNames(names);
	for(int i = 0, n = names.size(); i < n; ++i)
	{
		SendDlgItemMessage(windowHandle, instrumentNamesList, LB_ADDSTRING, 0, (long) names[i].c_str());
	}
	SendDlgItemMessage(windowHandle, arrangementNamesList, LB_RESETCONTENT, 0, 0);
	for(int j = 0, k = csoundVST->getArrangementCount(); j < k; ++j)
	{
		SendDlgItemMessage(windowHandle, arrangementNamesList, LB_ADDSTRING, 0, (long) csoundVST->getArrangement(j).c_str());
	}
	if(instrumentIndex != LB_ERR)
	{
		SendDlgItemMessage(windowHandle, instrumentNamesList, LB_SETCURSEL, instrumentIndex, 0);
	}
	if(arrangementIndex != LB_ERR)
	{
		SendDlgItemMessage(windowHandle, arrangementNamesList, LB_SETCURSEL, arrangementIndex, 0);
	}
}

HWND CsoundView::getWindowHandle(void) const
{
	return windowHandle;
}

extern "C" 
{
	void vstCsoundWxLogCallback(const char *message)
	{
		if(CsoundVST::getMessageLevel())
		{
			currentCsoundView->appendOutput(message);
		}
	}
};