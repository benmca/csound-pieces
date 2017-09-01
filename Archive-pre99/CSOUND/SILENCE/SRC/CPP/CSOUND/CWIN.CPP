// "cwin.cpp"                        Copyright (C) A C Norman, 1994-5
//                                                 Codemist Ltd
//                                   Modified by John ffitch of Codemist Ltd

//
// Main window manager code to provide general support for simple
// applications.   The interface that this provides is documented
// in "cwin.h".
//

// This uses MFC, as documented online help files and in
//       "Microsoft Foundation Class Primer" by Jim Conger
//       Waite Group Press, 1993.
// It is compiled using MS VC++ (32-bit edition) or Watcom C version 10.0,
// and runs under Win32 or Win32s.


// The following line is used by the Codemist "filesign" utility to keep
// a checksum and date-stamp in the file.

/* Signature: 686c7240 05-Feb-1995 */

#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include <time.h>
#include <math.h>
#include <setjmp.h>
#include <crtdbg.h>
//#define WINVER  0x030a                  // I rely on at least Windows 3.1
#include <afxdlgs.h>
#include <afxwin.h>                     // Main MFC header file

#ifdef _MSC_VER
#include <vfw.h>                        // for MCIWndCreate()
#endif

#include "cwin.h"                       // defines external interface
#include "version.h"
#include "cs.h"

extern "C" {
	FILE *dribble;               //RWD : declared in main.c
}

#ifdef BUILDING_DLL
#define DLLexport __declspec(dllexport)
#else
#define DLLexport
#endif

//RWD
extern "C" void RTwavclose(void);
static int WaveDevice = 0;
extern "C" int getWaveOutDevices(void);
extern "C" void getWaveOutName(int, char *);
extern "C" int getWantedDevice(void);
extern "C"     int hetro(int,char**);
extern "C"     int lpanal(int,char**);
extern "C"     int pvanal(int,char**);
extern "C"     int cvanal(int,char**);
extern "C"     int sndinfo(int,char**);
extern "C"     int pvlook(int,char**);

extern "C" {
    void cwin_args(char **, char **, char**);
    void list_opcodes(int);
}

extern "C" {
    extern int odebug;
    extern OPARMS O;
    extern int keep_tmp;
}

// Mouse tracking
//extern "C" float mouse_x, mouse_y;

int getWantedDevice(void)
{
        return WaveDevice;
}

// DisplayMsg is used a bit like fprintf(stderr, ...) but ONLY for debugging.
// It pops up a modal dialog box each time it is called.  This is easy to
// code, but a bit clumsy in the way it distrubs the screen.

extern "C" {
    void DisplayMsg(char *, ...);
}

void DisplayMsg(char *msg, ...)
{
    char buffer[256];
    va_list a;
    va_start(a, msg);
#ifdef __WATCOMC__
    vsprintf(buffer, msg, a);
#else
    _vsnprintf(buffer, 250, msg, a);
#endif
    va_end(a);
    AfxMessageBox(buffer);
}

//class CTheApp : public CWinApp          // application class
//{
//public:
//   BOOL InitInstance();                 // override default InitInstance()
//   int Run();                           // override top level loop (!)
//};

MSG *msgPtr;                            // needed by cwin_poll_window_manager()

// The amount of text that can be stored in a main window is fixed here -
// I allow for up to 16K chars and 512 lines (an average of 32 chars per
// line, and I expect these limits to be roughly comparable).

const int LINE_MASK       = 0x1ff;      // keep up to 512 lines
const int TEXT_SIZE       = 0x4000;     // keep up to 16K chars
const int MAX_LINE_LENGTH = 504;        // < 512, multiple of 8.

// I pack a line/column value into one word.  By restricting lines to be
// at worst 500 characters long I can afford to use a 9-bit field for the
// column. So provided I have at worst 4000000 lines (2^22) the packed
// value I have will remain a positive 32-bit value.  I do not check for
// line-count overflow here.

#define MakePos(line, col) (((line) << 9) | (col))
#define PosLine(x) ((x) >> 9)
#define PosChar(x) ((x) & 0x1ff)

// The main issue is that the following two values must not collide
// with SB_xxx (eg SB_LINEDOWN)

#define PRIVATE_SET_LEFT_MARGIN   0x10000
#define PRIVATE_SET_VISIBLE_LINE  0x10001

class CMainWindow : public CFrameWnd    // main window class
{
public:
    CMainWindow();                      // declare constructor
    ~CMainWindow();
    CRect clientArea;
    void InitialCleanup();

    void InsertChar(int ch);            // insert one character & display
    void InsertLine(char *s, int n);    // insert whole line of text
    void InsertSeveralLines(char **lines, int *lengths, int nlines);
    void RemoveChar();                  // remove a single character
    void AwaitInput();                  // polls until data is available
    void AbandonClipboard();            // closes partially done PASTE op.
    void OnClear();                     //RWD.5.97: see below
private:
    CMenu Menu;
    void OnPaint();
    void PaintText(CPaintDC *dc, BOOL highlighting,
                   int x, int y, char *s, int n);
    DWORD windowColor, textColor, highlightColor, highlightTextColor;

    void OnSize(UINT nType, int cx, int cy);
    void AfterSizeChange();
    CRect clipArea;
    int nRows, nCols;               // rows & cols of characters

    void OnVScroll(UINT nSBCode, UINT nPos, CScrollBar *PCntl);
    void OnHScroll(UINT nSBCode, UINT nPos, CScrollBar *PCntl);
    int VScrollPos;                 // always 0 <= thumb <= 100
    int HScrollPos;                 // always 0 <= thumb <= 100
    int leftMargin;                 // measured in character widths

    void OnSetFocus(CWnd *pOldWnd);
    void OnKillFocus(CWnd *pNewWnd);

    void OnChar(UINT ch, UINT nRepCnt, UINT nFlags);
    void OnKeyDown(UINT ch, UINT nRepCnt, UINT nFlags);

    void OnLButtonDblClk(UINT nFlags, CPoint point);
    void OnLButtonDown(UINT nFlags, CPoint point);
    void OnLButtonUp(UINT nFlags, CPoint point);
    void OnMButtonDblClk(UINT nFlags, CPoint point);
    void OnMButtonDown(UINT nFlags, CPoint point);
    void OnMButtonUp(UINT nFlags, CPoint point);
    void OnRButtonDblClk(UINT nFlags, CPoint point);
    void OnRButtonDown(UINT nFlags, CPoint point);
    void OnRButtonUp(UINT nFlags, CPoint point);
    afx_msg void OnMouseMove(UINT nFlags, CPoint point);
    int mousePos;
    BOOL trackingSelection;
    void CancelSelection();         // loses any selection
    void FindMouseChar(int x, int y);

    void OnNcLButtonDown(UINT nFlags, CPoint point);
    void OnNcMButtonDown(UINT nFlags, CPoint point);
    void OnNcRButtonDown(UINT nFlags, CPoint point);

//    void OnRead();                      // handle messages from all menu items
    void OnSaveas();
    void OnSaveSel();
    void OnTofile();
    void OnPrint();
    void OnPrintSetup();
    void OnExit();

    void OnCopy();
    void OnPaste();
    void OnMove();
    BOOL GrabLineFromClipboard();
    HGLOBAL clipboardInputHandle;
    BOOL inputspec;
    char *clipboardInput;

    void OnSelectAll();
    void OnRedraw();
  //    void OnUndo();
    void OnTop();
    void OnBottom();

    void OnFont();
    BOOL SetNewFont(CFont *newFont);
    CFont *mainFont;
    CFont *newFont;
    CFont *newSymbolFont;
    int charWidth;                  // I use a fixed-pitch font, so
    int charHeight;                 // only one character size applies
    int mainOffset;                 // vertical offset when drawing
    CFont *symbolFont;              // may be 0 if no Greek available
    int symbolWidth[256];           // character width information
    int symbolOffset;               // vertical offset needed for symbols


    void OnGShow();
    void OnGHide();
    void OnGClear();
    void OnGNext();
    void OnGPrev();

    void OnPause();
    void OnStop();
    void OnContinue();

    void OnHelpContents();
    void OnHelp();
    void OnHelpUsing();
    void OnAbout();

    void RemoveFirstLine();             // used when buffer gets full

    char txtBuffer[TEXT_SIZE];          // buffer for text
    int firstChar, currentChar;         // character buffer ptrs

    int txtLine[LINE_MASK+1];           // where each line starts
    int firstLine, firstVisibleLine, currentLine;
    int txtLineLen[LINE_MASK+1];        // length of each line
    int currentLineLength;

    void StartSelection();
    void ExtendSelection();
    int selFirstPos;                // where user clicked to begin sel
    int selStartPos;                // start posn of selection
    int selEndPos;                  // end posn of selection

    DECLARE_MESSAGE_MAP()
};

#define IDM_READ           10    /* Codes in the main menu */
#define IDM_SAVEAS         11
#define IDM_SAVESEL        12
#define IDM_TOFILE         13
#define IDM_PRINT          14
#define IDM_PRINTSETUP     15
#define IDM_EXIT           16

#define IDM_CUT            17    /* Codes in the EDIT menu */
#define IDM_COPY           18
#define IDM_PASTE          19
#define IDM_MOVE           20
#define IDM_SELECTALL      21
#define IDM_CLEAR          22
#define IDM_UNDO           23
#define IDM_REDRAW         24
#define IDM_TOP            25
#define IDM_BOTTOM         26
#define IDM_FONT           27

#define IDM_PAUSE          28    /* Codes in the BREAK menu */
#define IDM_STOP           29
#define IDM_CONTINUE       30

#define IDM_GSHOW          31    /* Codes in the GRAPHICS menu */
#define IDM_GHIDE          32
#define IDM_GCLEAR         33
#define IDM_GNEXT          34
#define IDM_GPREV          35

#define IDM_ABOUT          36


BEGIN_MESSAGE_MAP(CMainWindow, CFrameWnd)
    ON_WM_SETFOCUS()
    ON_WM_KILLFOCUS()
    ON_WM_SIZE()
    ON_WM_VSCROLL()
    ON_WM_HSCROLL()
    ON_WM_PAINT()

    ON_WM_CHAR()
    ON_WM_KEYDOWN()

    ON_WM_LBUTTONDBLCLK()
    ON_WM_LBUTTONDOWN()
    ON_WM_LBUTTONUP()
    ON_WM_MBUTTONDBLCLK()
    ON_WM_MBUTTONDOWN()
    ON_WM_MBUTTONUP()
    ON_WM_RBUTTONDBLCLK()
    ON_WM_RBUTTONDOWN()
    ON_WM_RBUTTONUP()
    ON_WM_MOUSEMOVE()

    ON_WM_NCLBUTTONDOWN()
    ON_WM_NCMBUTTONDOWN()
    ON_WM_NCRBUTTONDOWN()

//    ON_COMMAND(IDM_READ, OnRead)
    ON_COMMAND(IDM_SAVEAS, OnSaveas)
    ON_COMMAND(IDM_SAVESEL, OnSaveSel)
    ON_COMMAND(IDM_TOFILE, OnTofile)
    ON_COMMAND(IDM_PRINT, OnPrint)
    ON_COMMAND(IDM_PRINTSETUP, OnPrintSetup)
    ON_COMMAND(IDM_EXIT, OnExit)
    ON_COMMAND(IDM_COPY, OnCopy)
    ON_COMMAND(IDM_PASTE, OnPaste)
    ON_COMMAND(IDM_MOVE, OnMove)
    ON_COMMAND(IDM_SELECTALL, OnSelectAll)
    ON_COMMAND(IDM_CLEAR, OnClear)
  //    ON_COMMAND(IDM_UNDO, OnUndo)
    ON_COMMAND(IDM_REDRAW, OnRedraw)
    ON_COMMAND(IDM_TOP, OnTop)
    ON_COMMAND(IDM_BOTTOM, OnBottom)
    ON_COMMAND(IDM_FONT, OnFont)
    ON_COMMAND(IDM_PAUSE, OnPause)
    ON_COMMAND(IDM_STOP, OnStop)
    ON_COMMAND(IDM_CONTINUE, OnContinue)
    ON_COMMAND(IDM_GSHOW, OnGShow)
    ON_COMMAND(IDM_GHIDE, OnGHide)
    ON_COMMAND(IDM_GCLEAR, OnGClear)
    ON_COMMAND(IDM_GNEXT, OnGNext)
    ON_COMMAND(IDM_GPREV, OnGPrev)
    ON_COMMAND(ID_HELP_INDEX, OnHelpContents)
    ON_COMMAND(ID_HELP, OnHelp)
    ON_COMMAND(ID_HELP_USING, OnHelpUsing)
    ON_COMMAND(IDM_ABOUT, OnAbout)
END_MESSAGE_MAP()

#define PICTURE_SIZE    (32768)
//RWD
#define MAX_GRAPH       (40)

int last_tag=0;

typedef struct picElement
{
    int style;
    unsigned colour;
    float x0, y0, x1, y1;
} picElement;

class CGraphicsWindow : public CWnd     // graphics window class
{
public:
    CGraphicsWindow();                  // declare constructor
    virtual ~CGraphicsWindow();         //RWD.2.98: need to delete graphs
    void Clear();
    void Line(int style, unsigned colour, float x0, float y0, float x1, float y1);

    void Caption(char *name) { SetWindowText(name); cwin_poll_window_manager(); }
    BOOL isOnTop;
    void show() { OnPaint(); }
    void Next();
    void Prev();

private:
    CRect clientArea;
    float halfx, halfy, scalex, scaley;

    int nObjects;
    picElement objects[PICTURE_SIZE];
    picElement *graphs[MAX_GRAPH]; //RWD.2.98 make these part of the class
    int graph_tag[MAX_GRAPH];
    int graph_size[MAX_GRAPH];
    CString graph_name[MAX_GRAPH];
    int picture_number;

    void OnPaint();
    void OnSetFocus(CWnd *pOldWnd);
    void OnChar(UINT ch, UINT nRepCnt, UINT nFlags);
    void OnSysChar(UINT ch, UINT nRepCnt, UINT nFlags);
    void OnKeyDown(UINT ch, UINT nRepCnt, UINT nFlags);
    void OnSysKeyDown(UINT ch, UINT nRepCnt, UINT nFlags);

    DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP(CGraphicsWindow, CWnd)
    ON_WM_PAINT()
    ON_WM_SETFOCUS()
    ON_WM_CHAR()
    ON_WM_SYSCHAR()
    ON_WM_KEYDOWN()
    ON_WM_SYSKEYDOWN()
END_MESSAGE_MAP()

CGraphicsWindow::~CGraphicsWindow()
{
    for (int i=0;i < MAX_GRAPH;i++)
      if (graphs[i]) delete graphs[i];
 //RWD.2.98: if someday MAX_GRAPH gets set at runtime, we will need this too
 // delete [] graphs;
}

void CGraphicsWindow::Line(int style, unsigned colour, float x0, float y0, float x1, float y1)
{
    if (nObjects >= PICTURE_SIZE) { return; }
    objects[nObjects].colour = colour;
    objects[nObjects].style  = style;
    objects[nObjects].x0     = x0;
    objects[nObjects].y0     = y0;
    objects[nObjects].x1     = x1;
    objects[nObjects].y1     = y1;
    nObjects++;
    Invalidate(TRUE);
}

void CGraphicsWindow::Clear()
{
    if (picture_number>= 0) {   // Copy picture to save
      int i;
      for (i=0; i<MAX_GRAPH; i++) if (last_tag==graph_tag[i]) {
        if (++picture_number >= MAX_GRAPH) picture_number = 0;
        nObjects = 0;
        Invalidate(TRUE);
        return;
      } // We have stored it already
      picElement *pic = new picElement[nObjects];
      for (i=0; i<nObjects; i++) pic[i] = objects[i];
      for (i=0; i<MAX_GRAPH; i++) {     // Look for free slot
        if (graphs[picture_number] == NULL) break;
        if (++picture_number>=MAX_GRAPH) picture_number=0;
      }
      if (graphs[picture_number] != NULL) { // If full delete old graph
        delete graphs[picture_number];
        graphs[picture_number] = NULL;//RWD.2.98 : need to delete whole array on exit or restart...
        //graph_tag[picture_number] = -1;               //RWD.2.98 need this too?
      }
      graphs[picture_number] = pic;
      graph_size[picture_number] = nObjects;
      GetWindowText(graph_name[picture_number]);
      graph_tag[picture_number] = last_tag++;
    //       DisplayMsg((char*)(LPCTSTR)graph_name[picture_number]);
    }
    if (++picture_number >= MAX_GRAPH) picture_number = 0;
    nObjects = 0;
    Invalidate(TRUE);
}

void CGraphicsWindow::Next()
{
    int i;
    for (i=0; i<MAX_GRAPH; i++) {
      if (graphs[picture_number] != NULL) {
        nObjects = graph_size[picture_number];
        for (int j=0; j<nObjects; j++)
          objects[j] = graphs[picture_number][j];
//      DisplayMsg("Picture_number %d", picture_number);
        SetWindowText(graph_name[picture_number]);
        last_tag = graph_tag[picture_number];
        Invalidate(TRUE);
        OnPaint();
        return;
      }
      if (++picture_number >= MAX_GRAPH) picture_number = 0;
    }
}

void CGraphicsWindow::Prev()
{
    int i;
      if (--picture_number  < 0) picture_number = MAX_GRAPH-1;
    for (i=0; i<MAX_GRAPH; i++) {
      if (--picture_number  < 0) picture_number = MAX_GRAPH-1;
      if (graphs[picture_number] != NULL) {
        nObjects = graph_size[picture_number];
        for (int j=0; j<nObjects; j++)
          objects[j] = graphs[picture_number][j];
//      DisplayMsg("Picture_number %d", picture_number);
        SetWindowText(graph_name[picture_number]);
        last_tag = graph_tag[picture_number];
        Invalidate(TRUE);
        OnPaint();
        return;
      }
    }
}


#define _pi 3.141592653589793238

void CGraphicsWindow::OnPaint()
{
    CPaintDC dc(this);
    CPen * pOld;
    for (int i=0; i<nObjects; i++) {
        int x0 = (int)(scalex*objects[i].x0);
        int y0 = (int)(halfy + scaley*objects[i].y0);
        int x1 = (int)(scalex*objects[i].x1);
        int y1 = (int)(halfy + scaley*objects[i].y1);
        if (x0 != x1 || y0 != y1) {
            CPen pen(objects[i].style, 1, objects[i].colour);
            pOld = dc.SelectObject(&pen);
            if (pOld!=NULL) { dc.MoveTo(x0, y0); dc.LineTo(x1, y1); dc.SelectObject(pOld);}
        }
    }
}

// There is a sort-of wonderful delicacy here - the variable 'theApp'
// defined here will get initialised during program start-up, and pretty
// well all of the interesting activity in this whole program happens
// as part of this initialisation!  Wow.

CTheApp theApp;
CMainWindow *theWindow = NULL;
CGraphicsWindow *thePicture = NULL;
FILE *log_file = NULL;
CBrush *brush = NULL;

DLLexport void cwin_line(unsigned colour, float x0, float y0, float x1, float y1)
{
    if (thePicture == NULL) return;
    thePicture->Line(PS_SOLID, colour, x0, y0, x1, y1);
}

DLLexport void cwin_line_dash(unsigned colour, float x0, float y0, float x1, float y1)
{
    if (thePicture == NULL) return;
    thePicture->Line(PS_DASH, colour, x0, y0, x1, y1);
}

DLLexport void cwin_clear()
{
    if (thePicture == NULL) return;
    thePicture->Clear();
}

DLLexport void cwin_caption(char *name)
{
    thePicture->Caption(name);
}

DLLexport void cwin_show()
{
    if (thePicture == NULL || thePicture->isOnTop) return;
    thePicture->SetWindowPos(&thePicture->wndTopMost, 0, 0, 0, 0,
        SWP_NOMOVE | SWP_NOSIZE | SWP_SHOWWINDOW | SWP_NOACTIVATE);
    thePicture->isOnTop = TRUE;
    theWindow->SetFocus();
}

void cwin_paint(void)
{
    thePicture->show();
}


// Well, see.  When I create a graphics window I force it to be topmost
// so that it is unconditionally visible. I do this so that it will not
// vanish at the time that my main window is given the input focus. However
// if the user actually clicks the mouse anywhere in the main window I
// will cancel this special status and the graphics display will usually
// drop down and get at least partially obscured.

DLLexport void cwin_unTop()
{
    if (thePicture==NULL || !thePicture->isOnTop) return;
    thePicture->SetWindowPos(&thePicture->wndNoTopMost, 0, 0, 0, 0,
        SWP_NOMOVE | SWP_NOSIZE | SWP_SHOWWINDOW | SWP_NOACTIVATE);
    thePicture->isOnTop = FALSE;
    theWindow->BringWindowToTop();
}

static CString mainWindowClass;
//RWD.2.98 TODO:: use initializer for MAX_GRAPH for runtime control...
CGraphicsWindow::CGraphicsWindow()
{
    nObjects = 0;
    int height = GetSystemMetrics(SM_CYSCREEN),
        width  = GetSystemMetrics(SM_CXSCREEN),
        capy   = GetSystemMetrics(SM_CYCAPTION);
// Here I make some attempt to choose a sensible size for the
// graphics window based on the total size of my display. I also cause it
// to pop up somewhere roughly in the top right hand corner of the
// screen.
    for (int w = 1024; w+capy > height || w > width;) w = (3*w)/4;
    w = (3*w)/4;
    if (CreateEx(WS_EX_NOPARENTNOTIFY, mainWindowClass, "CWIN Graphics",
           WS_OVERLAPPED | WS_POPUP | WS_CAPTION,
           width-w-capy, capy, w, w/2+capy, NULL, 0, 0) == 0)
    {   DisplayMsg("Unable to create graphics window");
        ::PostQuitMessage(0);
        return;
    }
    GetClientRect(&clientArea);
    halfx = 0.5f*(float)clientArea.right;
    halfy = 0.5f*(float)clientArea.bottom;
    scalex = halfx;
    scaley = halfy;
    isOnTop = FALSE;
    picture_number = -1;
    for (w=0; w<MAX_GRAPH; w++) graphs[w] = NULL, graph_tag[w]= -1;
}

// Here I arrange that grabbing the focus to the graphics window moves it
// to the top. I really want to set the focus back again to the
// main window, but if I do that in the obvious way here I end up
// not being able to re-position the graphics window, which is an
// undesirable situation.

void CGraphicsWindow::OnSetFocus(CWnd *pOldWnd)
{
    SetWindowPos(&wndTopMost, 0, 0, 0, 0,
        SWP_NOMOVE | SWP_NOSIZE | SWP_SHOWWINDOW | SWP_NOACTIVATE);
    isOnTop = TRUE;
}

// I grab keyboard events and re-send them to the main window, altering
// the focus as I do...

void CGraphicsWindow::OnChar(UINT ch, UINT nRepCnt, UINT nFlags)
{
    theWindow->SetFocus();
    theWindow->SendMessage(WM_CHAR, ch, 1 + ((nFlags & 0x1ff)<<16));
}

void CGraphicsWindow::OnSysChar(UINT ch, UINT nRepCnt, UINT nFlags)
{
    theWindow->SetFocus();
    theWindow->SendMessage(WM_SYSCHAR, ch, 1 + ((nFlags & 0x1ff)<<16));
}

void CGraphicsWindow::OnKeyDown(UINT ch, UINT nRepCnt, UINT nFlags)
{
    theWindow->SetFocus();
    theWindow->SendMessage(WM_KEYDOWN, ch, 1 + ((nFlags & 0x1ff)<<16));
}

void CGraphicsWindow::OnSysKeyDown(UINT ch, UINT nRepCnt, UINT nFlags)
{
    theWindow->SetFocus();
    theWindow->SendMessage(WM_SYSKEYDOWN, ch, 1 + ((nFlags & 0x1ff)<<16));
}

#define OUTPUT_BUFFER_SIZE    4096
#define OUTPUT_BUFFER_LINES     32
// The output buffer here is circular. First points to the first active
// character, Last points one beyond the last, and CurLine to where
// data for the current incomplete line (length CurLength) starts.
static char outputBuffer[OUTPUT_BUFFER_SIZE];
static char *outputFirst, *outputLast, *outputCurLine;
static int outputCurLength;
// outputLines and Lengths give an index into completed lines in
// the buffer.
static char *outputLines[OUTPUT_BUFFER_LINES];
static int outputLengths[OUTPUT_BUFFER_LINES];
static int nOutputLines;

DLLexport void cwin_putchar(int c)
{
    if (c == '\n')
    {   outputLines[nOutputLines] = outputCurLine;
        outputLengths[nOutputLines++] = outputCurLength;
        outputCurLine = outputLast;
        outputCurLength = 0;
        if (nOutputLines == OUTPUT_BUFFER_LINES)
        {   theWindow->InsertSeveralLines(outputLines,
                                          outputLengths, nOutputLines);
            nOutputLines = 0;
            outputFirst = outputLast = outputCurLine = outputBuffer;
        }
        return;
    }
    if (c == '\r')
    {
        outputCurLength = 0;
        return;
    }
    if (c == '\t') {
        cwin_putchar(' '); cwin_putchar(' ');
        while ((outputLast-outputFirst)%8 == 0) cwin_putchar(' ');
        return;
    }
// When the buffer wraps round I will copy the current incomplete line
// round to the bottom of the buffer so that every line is stored as
// a single uninterrupted chunk.
    if (outputLast == &outputBuffer[OUTPUT_BUFFER_SIZE-1])
    {   outputLast = outputBuffer;
        int n = outputCurLength;
        outputCurLength = 0;
        char *p = outputCurLine;
        outputCurLine = outputBuffer;
        for (int i=0; i<n; i++) cwin_putchar(p[i]);
    }
    *outputLast++ = c;
    outputCurLength++;
//    if (outputLast == outputFirst)
    {
        theWindow->InsertSeveralLines(outputLines,
                                      outputLengths, nOutputLines);
        nOutputLines = 0;
        outputFirst = outputCurLine;
    }
}

DLLexport void cwin_puts(char *s)
{
    int c;
    while ((c = *s++) != 0) cwin_putchar(c);
    cwin_ensure_screen();
}

DLLexport void cwin_printf(char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    cwin_vfprintf(fmt, a);
    va_end(a);
}

DLLexport void cwin_fprintf(FILE *err, char *fmt, ...)
{
    va_list a;
    va_start(a, fmt);
    cwin_vfprintf(fmt, a);
    va_end(a);
}

DLLexport void cwin_vfprintf(char *fmt, va_list a)
{
    char tmpbuf[MAX_LINE_LENGTH];
#ifdef __WATCOMC__
    int len = vsprintf(tmpbuf, fmt, a);
#else
    int len = _vsnprintf(tmpbuf, MAX_LINE_LENGTH-1, fmt, a);
#endif
    cwin_puts(tmpbuf);
    if (dribble!=NULL) fputs(tmpbuf, dribble);
}

static SYSTEMTIME titleUpdateTime, lastFlushTime;

DLLexport void cwin_almost_ensure_screen(void)
{
    if (nOutputLines != 0)
    {
        theWindow->InsertSeveralLines(outputLines,
                                      outputLengths, nOutputLines);
        nOutputLines = 0;
        outputFirst = outputCurLine;
        cwin_poll_window_manager();
        GetLocalTime(&lastFlushTime);
    }
    return;
}

DLLexport int cwin_ensure_screen(void)
{
// The first call to cwin_almost_ensure_screen() flushes out all but
// a possible partial last line (this guarantees that it leaves the
// screen scrolled fully left).  There may be some characters left over
// so I then display them one at a time.
    if (nOutputLines != 0) cwin_almost_ensure_screen();
    if (outputCurLength != 0)
    {   for (int i=0; i<outputCurLength; i++)
            theWindow->InsertChar(outputCurLine[i]);
        outputFirst = outputLast = outputCurLine = outputBuffer;
        outputCurLength = 0;
        cwin_poll_window_manager();
    }
    GetLocalTime(&lastFlushTime);
    return (1);
}

// ttyIbuf is a temporary buffer that can hold just one line, used
// while that line is being typed in and subject to line-editing. After
// the user types an ENTER the data is moved elsewhere

static char ttyIbuf[MAX_LINE_LENGTH+4];
static int ttyIbufn;

// inputBuffer is a longer-term place for characters to reside. Once there
// they can not be changed (but cwin_discard_input() can abandon them)

#define INPUT_BUFFER_BITS    10
#define INPUT_BUFFER_MASK    ((1<<INPUT_BUFFER_BITS)-1)
static int inputBufferInsert = 0, inputBufferRemove = 0;
static char inputBuffer[INPUT_BUFFER_MASK+1];

DLLexport void cwin_discard_input()
{
    theWindow->AbandonClipboard();
    inputBufferInsert = inputBufferRemove = 0;
    while (ttyIbufn != 0) theWindow->RemoveChar(), ttyIbufn--;
}

void CMainWindow::AwaitInput()
{
    BOOL bottomed = FALSE;
    while (inputBufferRemove == inputBufferInsert &&
           ((clipboardInputHandle==0 && !inputspec) ||
            GrabLineFromClipboard()))
    {
// If there is clipboard input being processed I will not move to the
// bottom of the screen.  Otherwise I will do so ONCE here, so that
// if the user hits scroll bars then the window can stay scrolled... but
// otherwise the caret tends to stay visible.
        if (clipboardInputHandle == 0 && !inputspec && !bottomed)
        {   OnBottom();
            bottomed = TRUE;
        }
        cwin_ensure_screen();
        cwin_poll_window_manager();
    }
}

DLLexport int cwin_getchar()
{
    theWindow->AwaitInput();
    return inputBuffer[inputBufferRemove++ & INPUT_BUFFER_MASK];
}


static char MainTitle[84];
static char cLeft[42], cMid[42], cRight[42];

static void ReWriteTitleText()
{
    CWindowDC dc(theWindow);
// It is not (at present) clear to me how to decide how wide to make
// the title.  What follows is some sort of a guess.
    int wTitle = theWindow->clientArea.Width() -
                 3*::GetSystemMetrics(SM_CXVSCROLL);
    int wLeft  = dc.GetTextExtent(cLeft, strlen(cLeft)).cx;
    int wMid   = dc.GetTextExtent(cMid, strlen(cMid)).cx;
    int wRight = dc.GetTextExtent(cRight, strlen(cRight)).cx;
// For the calculations about padding that I use here to work the font used
// in the title bar had better not do any kerning and overhang-effects must
// not interfere.  I find I have all sorts of horrid problems if I try to
// use regular blank characters for padding, but '\xa0' displays as blank
// space and is better behaved.  It also seems (???) that at least under
// Windows 3.1 there is no great joy in trying to use caption strings that
// are longer than 78 characters...
#define PADDING_CHAR   '\xa0'
    char strSp[4]; strSp[0] = PADDING_CHAR;
    int wSp    = dc.GetTextExtent(strSp, 1).cx;
    int cw = wTitle / wSp;
// I first measure things on the supposition that I would allow up to
// 90 characters in the title.  After balancing it a bit I cut that
// down to the 78 that Windows 3.1 seems to be prepared to tolerate.
    if (cw > 90) wTitle = 90*wSp;
    int pad = (wTitle - wMid)/2;
    char *l = cLeft, *r = cRight;
    for (;;)
    {   int padLeft  = (pad - wLeft) / wSp;
        int padRight = (pad - wRight) / wSp;
        int excess = strlen(cLeft) + padLeft + strlen(cMid) +
                     padRight + strlen(cRight) - 78;
        if (excess > 0)
        {   if (excess & 1)
            {   if (padLeft > padRight) padLeft--; else padRight--;
                excess--;
            }
            excess /= 2;
            padLeft -= excess;
            padRight -= excess;
        }
        if (padLeft <= 0 && padRight <= 0)
        {   strcpy(MainTitle, cMid);    // Abandon both right & left items
            break;
        }
        else
        {   if (padLeft <= 0)
            {   l = "";                 // Abandon left item & re-try
                wLeft = 0;
                continue;
            }
            if (padRight <= 0)          // Abandon right item & re-try
            {   r = "";
                padRight = 0;
                continue;
            }
            char *p = MainTitle;
            while (*l != 0) *p++ = *l++;
            for (int i=0; i<padLeft; i++) *p++ = PADDING_CHAR;
            l = cMid;
            while (*l != 0) *p++ = *l++;
            for (i=0; i<padRight; i++) *p++ = PADDING_CHAR;
            while (*r != 0) *p++ = *r++;
            *p = 0;
            break;
        }
    }
    theWindow->SetWindowText(MainTitle);
}

static BOOL leftSetByUser = FALSE;

DLLexport void cwin_report_left(char *msg)
{
    if (msg == NULL)
    {   leftSetByUser = FALSE;
        return;                         // Date and time of day will appear
    }
    strncpy(cLeft, msg, 31); cLeft[31] = 0;
    ReWriteTitleText();
    leftSetByUser = TRUE;
}

static char programName[32];

DLLexport void cwin_report_mid(char *msg)
{
    if (msg == NULL) msg = programName;
    strncpy(cMid, msg, 31); cLeft[31] = 0;
    ReWriteTitleText();
}

extern "C" {
    DLLexport void cwin_report_right(char *msg);
}
DLLexport void cwin_report_right(char *msg)
{
    if (msg == NULL) msg = "";
    strncpy(cRight, msg, 31); cRight[31] = 0;
    ReWriteTitleText();
}

static void display_date()
{
    char dateBuffer[20];
    sprintf(dateBuffer, "%02d-%.3s-%02d. %02d:%02d:%02d",
       titleUpdateTime.wDay,
       "xxxJanFebMarAprMayJunJulAugSepOctNovDec"+3*titleUpdateTime.wMonth,
       titleUpdateTime.wYear%100,
       titleUpdateTime.wHour, titleUpdateTime.wMinute,
       titleUpdateTime.wSecond);
    cwin_report_left(dateBuffer);
    leftSetByUser = FALSE;
}

//
// Windows enters my code at WinMain, but with MFC I arrive via all sorts
// of jolly initialisation code.  To support old code I read the command
// line that invoked me, and parse it into words which I store in argv[],
// much as per the regular C startup process.  When I have a window
// ready, I might call the normal C entrypoint to my program (ie. "main()"),
// but Watcom C (at least) seems to think this is a bad idea, hence I use
// the name cwin_main() instead.
//

DLLexport char *cwin_full_program_name;
static int argc;
static char **argv;

static void set_up_argv()
// This sets up argc and argv[] as expected for a regular C application.
// It arranges that argv[0] is an unqualified name, forced into upper case.
// Ie argv[0] does not have a path-name on the front of it or any ".EXE"
// suffix after it.
{
    int i = 0, c, len = 0;
    char *w = GetCommandLine();
// The string I obtained there may be in UniCode, but I will suppose that it
// does not contain any funny characters.  In particular I will demand
// that this module is compiled with Unicode mapped onto ordinary 8-bit
// chars.
    char *w1 = w, *argbuf;
// I scan the command line once to assess its length. Note that I do not
// take any special account of quote marks etc, so this parsing MAY upset
// some people
    do
    {   while ((c = *w++) == ' ' || c == '\t');  // Blank at start of an item
        i++;                                     // Count of words
        if (c == '"') {
          c = *w++;
          while (c!= '\0' && c != '"') c = *w++, len++;
        }
        else while (c != 0 && c != ' ' && c != '\t') c = *w++, len++;
    } while (c != 0);
// Now I can allocate space for the argument vector and a copy of the data
    argv = (char **)malloc((i+1)*sizeof(char *));// +1 for guard NULL
    argbuf = (char *)malloc(i+len);
    argc = 0;
    if (argv==NULL || argbuf==NULL) return;
// Re-scan the command line copying characters into buffers
    w = w1;
    do
    {   while ((c = *w++) == ' ');
        argv[argc] = argbuf;
        if (c == '"') {         // Strip off double quote signs
          c = *w++;
          while (c != '\0' && c != '"') *argbuf++ = c, c = *w++;
          if (c == '"') c = *w++;
        }
        else while (c != 0 && c != ' ') {
          *argbuf++ = c;
          c = *w++;
        }
        *argbuf++ = 0;
        if (argv[argc][0] != 0) argc++; /* Avoid empty strings */
    } while (c != 0);
// Put a NULL pointer at the end of argv[], just to be safe
    argv[argc] = NULL;
// Now I want to trim argv[0] so that even if it started with a full
// path or with an extension (eg. "\bin\csl.exe") it is passed on trimmed
// down to just its root (eg. "csl" in the above case).  This string will
// be left in programName too.
    w = w1 = argv[0];
    cwin_full_program_name = NULL;
    while ((c = *w++) != 0)
    {   if (c == '\\') w1 = w;
// I take the view that if argv[0] contains a ":" character then it can be
// presumed to be a fully rooted file name, including a drive specification.
// In such cases I will use it when I want the full name of the executable
// I am running.
        else if (c == ':') cwin_full_program_name = argv[0];
    }
    if (*w1 == 0) w1 = "winsound";  // Final char of argv[0] was '\\': use default
    w = programName;
    while ((c = *w1++) != 0 && c != '.') *w++ = toupper(c);
    strcpy(w,VERSIONSTRING); w += strlen(VERSIONSTRING);
    *w = 0;
    argv[0] = programName;
    if (cwin_full_program_name == NULL)
// Now I would like to get a full path to the program name... The
// SearchPath function looks first in the directory from which the
// application was fetched, and provided that the ".exe" extension
// I specify here is correct the file really ought to be located!
    {   int nameLength = SearchPath(NULL, programName, ".EXE", 0, argbuf, &w);
// There is one critically important case where "SearchPath" will fail here,
// and that is when the program has been started from a debugger and the
// real name of the program is just not available.  In that case tough
// luck, you will have to make resources available by some means NOT
// dependent on the program name or the directory it lives in.  Maybe in some
// cases with DOS extenders the program will appear to have been loaded from
// a directory distinct from the one that the obvious ".EXE" file lives in.
// In those cases I had better hope that argv[0] gave me a completely
// rooted file name.
        cwin_full_program_name = (char *)malloc(nameLength+1);
        if (cwin_full_program_name == NULL)
            cwin_full_program_name = "winsound.exe";
        else
        {   if (SearchPath(NULL, programName, ".EXE",
                           nameLength+1, cwin_full_program_name, &w) == 0)
                cwin_full_program_name = "winsound.exe";
        }
    }
    strcpy(cMid, programName);
    cLeft[0] = cRight[0] = 0;
    strcpy(MainTitle, cMid);
}

BOOL CTheApp::InitInstance()
{
    set_up_argv();
    log_file = NULL;
// I register a new window class so that I can associate the icon named
// "CWIN" with it when it is minimised.  This icon is the only thing that is
// needed in the resource file to be associated with a CWIN application, so
// file file "xxx.rc" can contain just
//
//                   CWIN ICON xxx.ico
// (ie only one line!)
// and "rc -r xxx.rc" will make "xxx.res" that can be linked in with the
// application.  The icon "xxx.ico" needs to be created by some suitable
// image editor.
    brush = new CBrush(GetSysColor(COLOR_WINDOW));
    mainWindowClass = ::AfxRegisterWndClass(CS_DBLCLKS,
                          LoadStandardCursor(IDC_ARROW),
                          (HBRUSH)brush->GetSafeHandle(),
                          LoadIcon("CWIN"));
    m_pMainWnd = theWindow = new CMainWindow(); // create a main window
    if (theWindow == NULL) return FALSE;
    theWindow->ShowWindow(m_nCmdShow);          // make it visible
    theWindow->UpdateWindow();

    thePicture = new CGraphicsWindow();
    if (thePicture == NULL) return FALSE;
    thePicture->ShowWindow(SW_HIDE);

    theWindow->InitialCleanup();   // ensure main window has focus, etc.

    return TRUE;
}

// At various times I will want to go back and poll the window manager
// to ensure that mouse activity is responded to, the screen is re-drawn and
// other applications get a share of the CPU. To do that I will arrange that
// 'cwin_poll_window_manager()' is called from time to time in the middle of
// whatever else I am doing.  This grabs a message from the window manager
// and dispatches it to whatever handler is relevant.  Note that
// cwin_poll_window_manager() longjumps out when it is time to finish. This is
// maybe a bit drastic, and is only really proper if there are NO "C++"
// procedures activated between cwin_main() and it [the relevant destructors
// will not get called properly]


static jmp_buf endApplication;

#define MAX_EXIT_FUNCTIONS 32

static ExitFunction *exitFunction[MAX_EXIT_FUNCTIONS];
static int exitFunctionCount = 0;
static int returnCode;
//RWD: ??  VC++ seems to think this is an attempt to overload the func
extern "C" {
    DLLexport int cwin_atexit(ExitFunction *func);
}
DLLexport int cwin_atexit(ExitFunction *func)
{
    if (exitFunctionCount < MAX_EXIT_FUNCTIONS)
    {   exitFunction[exitFunctionCount++] = func;
        return 0;
    }
    else return 1;
}

static void DoFinishBox();
DLLexport int cwin_pause_at_end;
DLLexport int nonstop = 0;
static int play_on_exit = 0;
static int edit_on_exit = 0;
static int log_output = 0;
extern "C" int synterrcnt;
extern "C" int inerrcnt;
extern "C" int perferrcnt;
extern "C" int peakchunks;
BOOL wait_for_char = FALSE;

LPCTSTR csound_section = "Csound";
#include <mmsystem.h>
#include <process.h>

DLLexport void cwin_exit(int return_code)
{
// Note: I do not put up the "OK" box if the user exits by selecting EXIT or
//       CLOSE from a menu, in that in such cases there has already been
//       some chance to see what the screen says.
    //RWD  ensure output device closed, in case of reentry
#ifdef RESET
    RTwavclose();
#endif
    if (cwin_pause_at_end)
    {
        cwin_ensure_screen();
        //        DoFinishBox();                  // just says OK to give a pause
        if (nonstop) {
          strcpy(cMid, "Type Character to Continue");
          theWindow->SetWindowText(MainTitle);
        // Need to wait for Menu Exit
          wait_for_char = TRUE;
          while (wait_for_char) {
            cwin_ensure_screen();
            cwin_poll_window_manager();
          }
        }
        else DoFinishBox();
        cwin_unTop();
    }
    cwin_discard_input();       // Added to stop double reading RWD
    while (exitFunctionCount > 0) (*exitFunction[--exitFunctionCount])();
    returnCode = return_code;
    if (synterrcnt==0 && perferrcnt==0 && inerrcnt==0) { // All OK so play
      if (edit_on_exit==TRUE) {
        // Launch Sound editor
        CString command;
        CString filename;
        command = theApp.GetProfileString(csound_section, "SndFileEdit");
        filename = theApp.GetProfileString(csound_section, "Soundfile");
        spawnl(P_NOWAIT, (LPCSTR)command,
               (LPCSTR)command, (LPCSTR)filename, NULL);
      }
      //RWD NB.. this can only play sfiles which fit in physical memory
      if (play_on_exit) {
        HWND res = 0;
#ifdef _MSC_VAR
        WORD wver = HIWORD(VideoForWindowsVersion());
        if (wver < 0x010a) {
#endif
          sndPlaySound(theApp.GetProfileString(csound_section, "Soundfile",""),
                       SND_ASYNC);
#ifdef _MSC_VAR
          //        ::MessageBox(NULL,"VFW missing or too old!",
          //                     "Play On Exit",MB_OK);
        }
        else {
          MCI_PLAY_PARMS extra;
          res = MCIWndCreate(NULL,theApp.m_hInstance,NULL,
             (LPSTR)(const char *)theApp.GetProfileString(csound_section,
                                                          "Soundfile",""));
          //                   "d:\\vcmovie\\environ.avi");
          mciSendCommand((UINT)res, MCI_PLAY, 0, (DWORD)(LPVOID) &extra);
     //now, we get the window appearing for a while, but no content.
     //does it need to be in a full messaging context - ie within theWindow?
          Sleep(1000);
        }
#endif
        strcpy(cMid, "Playing.... any character to continue...");
        wait_for_char = TRUE;
        theWindow->SetWindowText(MainTitle);
        while (wait_for_char) {
          cwin_ensure_screen();
          cwin_poll_window_manager();
        }
        sndPlaySound(NULL, SND_ASYNC);
      }
    }
//    free(argv);
    //RWD This for a re-entrant Csound only!
    // strictly experimental: a little recursive....
#ifdef RESET
    if (nonstop && !returnCode) {
      theWindow->OnClear();
      theApp.Run();      //jumps back to another cwin_exit call...
    }
#endif
    int returnCode1 = theApp.ExitInstance();
    if (returnCode1 > returnCode) returnCode = returnCode1;
    theApp.m_pMainWnd->SendMessage(WM_CLOSE);
    //RWD I think we need to do this too...
    if (theApp.m_pMainWnd!=NULL)
        delete theApp.m_pMainWnd;
    if (brush != NULL)
        delete brush;
    if (thePicture != NULL)
        delete thePicture;
    if (nonstop) execl(cwin_full_program_name, cwin_full_program_name, NULL);
    exit(0);
//    CWinApp::ExitInstance();
}

DLLexport int cwin_poll_window_manager(void)
{
// If the application has registered an idle-time handler then that gets
// invoked until it has finished or until a real message arrives whenever
// I call cwin_poll_window_manager().  I also process ALL the window messages
// that have stacked up and only go back to the user when otherwise idle.
    BOOL msg;
//    do {
        SYSTEMTIME t1;
        GetLocalTime(&t1);
        if (t1.wHour != lastFlushTime.wHour ||
            (t1.wMinute - lastFlushTime.wMinute)*60 +
            (t1.wSecond - lastFlushTime.wSecond) > 2)
            cwin_almost_ensure_screen();
        if (!leftSetByUser)
        {
// Here I arrange to update the title-bar clock about once every 5 secs. It
// seems that every second it too frequent, especially since it often flashes
// the title-bar while re-drawing it.  But 10 seconds is too long and lets
// the user feel things may be stuck.
// If the user explicitly sets anv value in the left part of the title bar
// then this action is disabled.
            if (titleUpdateTime.wHour != t1.wHour ||
                titleUpdateTime.wMinute != t1.wMinute ||
                titleUpdateTime.wSecond/5 != t1.wSecond/5)
            {   titleUpdateTime = t1;
                display_date();
            }
        }
// Now I do any "idle tasks" that have been registered.
        LONG Idle = 0;
        while (!(msg=::PeekMessage(msgPtr, NULL, NULL, NULL, PM_NOREMOVE)) &&
               theApp.OnIdle(Idle++)) {}
// If the user selects CLOSE from the system menu it causes PumpMessage to
// return FALSE, so in that case I close things down.
        if (msg && !theApp.PumpMessage())
        {   while (exitFunctionCount > 0)
                (*exitFunction[--exitFunctionCount])();
            returnCode = 0;
            longjmp(endApplication, 1);
        }
//    } while (msg);
                return 1;
}

int CTheApp::Run()       // Main running routine until application exits
{
// If I had not managed to open a main window then I should give up.
    if (m_pMainWnd == NULL) ::PostQuitMessage(0);
// The message handler needs to access m_msgCur which is a private member
// of the class, so I can not use just (theApp.m_msgCur) to get at it. To
// work around the problem I just dump a reference to it in the variable
// msgPtr.
    msgPtr = &m_msgCur;
// Now the real fun!  I call cwin_main() which fires up my application code
// Note that if cwin_main() is written in C rather than C++ the use of setjmp
// is reasonably valid.  Remember that cwin_main() should either return to me
// or do a cwin_exit() and it should NOT call exit().
    exitFunctionCount = 0;
    cwin_poll_window_manager();       // Permit window to appear
    cwin_pause_at_end = TRUE;
    cwin_exit(cwin_main(argc, argv));
//    theWindow->DestroyWindow();
//    thePicture->DestroyWindow();
        //RWD: this code NOTREACHED     if exit() used in cwin_exit()
        //Hence, memory leak from InitInstance...
    int returnCode1 = ExitInstance();
    if (returnCode1 > returnCode) returnCode = returnCode1;
    m_pMainWnd->SendMessage(WM_CLOSE);
    return returnCode;
}


struct MENUSTRUCT
{   char *name;
    int id;
    int flags;
};


static MENUSTRUCT fileMenu[] =
{
    {"Save &As...",     IDM_SAVEAS,      MF_GRAYED},
    {"&Save Selection", IDM_SAVESEL,     MF_GRAYED},
    {NULL,              0,               MF_SEPARATOR},
    {"&Print...",       IDM_PRINT,       MF_GRAYED},
    {"P&rint Setup...", IDM_PRINTSETUP,  MF_GRAYED},
    {NULL,              0,               MF_SEPARATOR},
    {"E&xit\tCtrl+D",   IDM_EXIT,        MF_ENABLED},
    {NULL,              -1,              -1}
};


static MENUSTRUCT editMenu[] =
{
    {"&Paste\tCtrl+V",  IDM_PASTE,       MF_GRAYED},
    {"C&opy\tCtrl+O",   IDM_PASTE,       MF_GRAYED},
    {NULL,              0,               MF_SEPARATOR},
    {"&Redraw\tCtrl+L", IDM_REDRAW,      MF_ENABLED},
    {"&Home",           IDM_TOP,         MF_ENABLED},
    {"&End",            IDM_BOTTOM,      MF_ENABLED},
    {NULL,              0,               MF_SEPARATOR},
    {"&Font",           IDM_FONT,        MF_ENABLED},
    {NULL,              -1,              -1}
};

static MENUSTRUCT breakMenu[] =
{   {"&Pause\tCtrl+G",     IDM_PAUSE,       MF_ENABLED},
    {"&Stop\tCtrl+S",      IDM_STOP,        MF_ENABLED},
    {"&Continue\tCtrl+Q",  IDM_CONTINUE,    MF_ENABLED},
    {NULL,                 -1,              -1}
};

static MENUSTRUCT graphicsMenu[] =
{   {"&Show",              IDM_GSHOW,    MF_ENABLED},
    {"&Hide",              IDM_GHIDE,    MF_ENABLED},
    {"&Clear",             IDM_GCLEAR,   MF_ENABLED},
    {"&Next",              IDM_GNEXT,    MF_ENABLED},
    {"&Prev",              IDM_GPREV,    MF_ENABLED},
    {NULL,                 -1,           -1}
};

static MENUSTRUCT helpMenu[] =
{   {"&Contents",                ID_HELP_INDEX,   MF_ENABLED},
    {"&Search for Help On...",   ID_HELP,         MF_ENABLED},
    {"&How to Use Help",         ID_HELP_USING,   MF_ENABLED},
    {NULL,                       0,               MF_SEPARATOR},
    {"&About CSound",            IDM_ABOUT,       MF_ENABLED},
    {NULL,                       -1,              -1}
};

//RWD: the original is not quite kosher - causes memory leak for each CMenu
// (see VC++ Online docs).
static HMENU MakeMenu(MENUSTRUCT *p, CMenu *m)
{
# ifdef _DEBUG
    ASSERT(p!=NULL);
    ASSERT(m!=NULL);
# endif
    if (m->CreatePopupMenu() == 0) DisplayMsg("Failed to create pop-up menu");
    while (p->id != -1)
    {   if (m->AppendMenu(p->flags, p->id, p->name) == 0)
            DisplayMsg("Failed to AppendMenu");
        p++;
    }
    return m->Detach();
}

//
//  CSL ACCELERATORS
//  {
//      VK_F1, ID_HELP_INDEX, VIRTKEY
//  }
//
//

class CenteredDialogBox : public CDialog
{
public:
    void CreateAndDisplay(HGLOBAL h);
};

void CenteredDialogBox::CreateAndDisplay(HGLOBAL h)
{
    InitModalIndirect(h);
    DoModal();
}

// In-store dialog-box templates need some of their strings in 16-bit
// Unicode form.  This code stretches out a simple string. It also rounds
// the length of the data written to a multiple of 8 bytes, which seems to
// be an unpublished (?) requirement for the dialog box template structures.

LPWORD WidenString(LPWORD p, char *q)
{
    int n = 0;
    while ((*p++ = *q++) != 0) n++;
    if (n & 1) *p++ = 0;
    return p;
}

// The following function fills in details about one control within a
// dialog box template.

LPWORD PlantDlgItem(LPWORD p3, int x, int y, int cx, int cy,
                    int id, DWORD style, int type, char *text)
{
    LPDLGITEMTEMPLATE p2 = (LPDLGITEMTEMPLATE)p3;
    p2->x = x; p2->y = y; p2->cx = cx, p2->cy = cy;
    p2->id = id;
    p2->style = style;
    p3 = (LPWORD)(p2 + 1);
    *p3++ = 0xffff;
    *p3++ = type;
    int n = 1;
    while ((*p3++ = *text++) != 0) n++;
    if (n & 1) *p3++ = 0;
    *p3++ = 0;
    return p3;
}

// When I want to pop up a box that says "Press OK to exit" I make the
// structure that defines the dialog box here in memory rather than putting
// it into my resource file.  The reason for taking this step is that it
// allows to to keep the resource file as spartan and simple as possible.
// It also provides a place for me to ensure that the dialog box is central
// in the area that my window occupies.

static void DoFinishBox()
{
    HGLOBAL h = GlobalAlloc(GMEM_ZEROINIT, 1024);
    if (!h) return;
    LPDLGTEMPLATE p1 = (LPDLGTEMPLATE)GlobalLock(h);
    WORD *p0 = (WORD *)p1; //DEBUG
        //RWD.5.97
    char *msg;
    if (nonstop)
                msg = "Press OK to continue";
    else
                msg = "Press OK to exit";
    p1->style = WS_POPUP | WS_CAPTION | WS_SYSMENU | DS_MODALFRAME;
    p1->cdit = 2;
    p1->cx = 95; p1->cy = 52;
// I want the box to appear in the centre of where my window is. This
// causes extra fun because of the special coordinate system used with
// dialog boxes - I have to convert units.
    LONG units = ::GetDialogBaseUnits();
    int dlgx = units & 0xffff, dlgy = (units >> 16) & 0xffff;
    p1->x = ((4*theWindow->clientArea.Width())/dlgx - p1->cx)/2;
    p1->y = ((8*theWindow->clientArea.Height())/dlgy - p1->cy)/2;
    LPWORD p2 = (LPWORD)(p1 + 1);
    *p2++ = 0;       // no menu
    *p2++ = 0;       // a predefined box class
    *p2++ = 0;       // no title
    p2 = PlantDlgItem(p2, 1, 10, 94, 12, -1,
                      WS_CHILD | WS_VISIBLE | SS_CENTER, 0x0082, msg); //RWD.5.97
    p2 = PlantDlgItem(p2, 28, 23, 40, 14, IDOK,
                      WS_CHILD | WS_VISIBLE | BS_DEFPUSHBUTTON, 0x0080, "OK");
    GlobalUnlock(h);
    CenteredDialogBox dlg;
    dlg.CreateAndDisplay(h);
    GlobalFree(h);
}


// Similarly I make the "ABOUT" dialog box from an in-memory template, and
// this makes it possible to make the text that is included depend on
// strings that the user can potentially reconfigure.  The strings put here
// are somewhat generic.   Note also that if a user hits the HELP menu
// during system start-up before the regular user code at main() has been
// entered than the messages shown here will appear, even though later on
// the user`s properly selected messages will be the ones that show up. I
// think that on balance I almost count that to be a positive advantage! It
// means that the "CWIN" information and credits are at least just about
// available to all users!

char about_box_title[32]       = "About CSound";
char about_box_description[32] = "The CSound window driver";
char about_box_rights_1[32]    = "Copyright Codemist Ltd.";
char about_box_rights_2[32]    = "A Norman/J P ffitch 94";

static void DoAboutBox()
{
    HGLOBAL h = GlobalAlloc(GMEM_ZEROINIT, 1024);
    if (!h) return;
    LPDLGTEMPLATE p1 = (LPDLGTEMPLATE)GlobalLock(h);
    WORD *p0 = (WORD *)p1;
    p1->style = WS_POPUP | WS_CAPTION | WS_SYSMENU | DS_MODALFRAME;
    p1->cdit = 5;
    p1->cx = 167; p1->cy = 86;
    LONG units = ::GetDialogBaseUnits();
    int dlgx = units & 0xffff, dlgy = (units >> 16) & 0xffff;
    p1->x = ((4*theWindow->clientArea.Width())/dlgx - p1->cx)/2;
    p1->y = ((8*theWindow->clientArea.Height())/dlgy - p1->cy)/2;
    LPWORD p2 = (LPWORD)(p1 + 1);
    *p2++ = 0;       // no menu
    *p2++ = 0;       // a predefined box class
    p2 = WidenString(p2, about_box_title);
    p2 = PlantDlgItem(p2, 0, 4, 167, 8, -1,
        WS_CHILD | WS_VISIBLE | SS_CENTER, 0x0082, about_box_description);
    p2 = PlantDlgItem(p2, 0, 45, 167, 8, -1,
        WS_CHILD | WS_VISIBLE | SS_CENTER, 0x0082, about_box_rights_1);
    p2 = PlantDlgItem(p2, 0, 53, 167, 8, -1,
        WS_CHILD | WS_VISIBLE | SS_CENTER, 0x0082, about_box_rights_2);
    p2 = PlantDlgItem(p2, 74, 22, 0, 0, -1,
        WS_CHILD | WS_VISIBLE | SS_ICON, 0x0082, "CWIN");
    p2 = PlantDlgItem(p2, 66, 65, 32, 14, IDOK,
        WS_CHILD | WS_VISIBLE | BS_DEFPUSHBUTTON, 0x0080, "OK");
    GlobalUnlock(h);
    CenteredDialogBox dlg;
    dlg.CreateAndDisplay(h);
    GlobalFree(h);
}


CMainWindow::CMainWindow()              // constructor fn for the window
{
    //RWD to eliminate memory leaks, create here, use Detach() in MakeMenu
    CMenu myFileMenu,myEditMenu,myBreakMenu,myGraphicsMenu,myHelpMenu;

    GetLocalTime(&titleUpdateTime);
    lastFlushTime = titleUpdateTime;
    titleUpdateTime.wHour = (WORD)-1;        // so that update happens soon
    charHeight = charWidth = 0;        // mark it all as uninitialised
    clientArea.top = clientArea.bottom =
        clientArea.left = clientArea.right = 0;
    clipArea.top = clipArea.bottom =
        clipArea.left = clipArea.right = 0;
// Now make the main parts of the window
    if (Create(mainWindowClass, MainTitle,
           WS_OVERLAPPEDWINDOW | WS_VSCROLL | WS_HSCROLL) == 0)
    {   DisplayMsg("Unable to create main window");
        ::PostQuitMessage(0);
        return;
    }
    m_bAutoMenuEnable = FALSE;

    if (Menu.CreateMenu() == 0) DisplayMsg("Failed to make main menu");
    if (
        (Menu.AppendMenu(MF_POPUP,
                         (UINT)MakeMenu(fileMenu,&myFileMenu),
                         "&File") == 0) ||
        (Menu.AppendMenu(MF_POPUP,
                         (UINT)MakeMenu(editMenu,&myEditMenu),
                         "&Edit") == 0) ||
        (Menu.AppendMenu(MF_POPUP,
                         (UINT)MakeMenu(breakMenu,&myBreakMenu),
                         "&Break") == 0) ||
        (Menu.AppendMenu(MF_POPUP,
                         (UINT)MakeMenu(graphicsMenu,&myGraphicsMenu),
                         "&Graphics") == 0) ||
        (Menu.AppendMenu(MF_POPUP,
                         (UINT)MakeMenu(helpMenu,&myHelpMenu),
                         "&Help") == 0)) {
      DisplayMsg("Failed to append menu");
      ::PostQuitMessage(0);
      return;
    }
    if (SetMenu(&Menu) == 0) DisplayMsg("Failed to Setmenu()");
    windowColor = GetSysColor(COLOR_WINDOW);
    textColor = GetSysColor(COLOR_WINDOWTEXT);
    highlightColor = GetSysColor(COLOR_HIGHLIGHT);
    highlightTextColor = GetSysColor(COLOR_HIGHLIGHTTEXT);
// Discover how large the client rectangle will be
    GetClientRect(&clientArea);
    VScrollPos = HScrollPos = 0;    // scroll thumbs start at zero
    leftMargin = 0;
    firstChar = currentChar = 0;    // empty text buffer
    firstLine = firstVisibleLine = currentLine = txtLine[0] = 0;
    currentLineLength = 0;
    selFirstPos = selStartPos = selEndPos = 0;
    trackingSelection = FALSE;
    outputFirst = outputLast = outputCurLine = outputBuffer;
    outputCurLength = nOutputLines = 0;
// Create and install a suitable initial font - I use "Courier New" at around
// 12 points in bold, which looks OK on my screen.  The "-16" seems to ask
// for a font that is around 16 pixels high... but the font selection dialog
// boxes call this "12 pt".  I make the symbol font slightly smaller so that
// characters fit neatly...
    mainFont = symbolFont = NULL;
    newFont = new CFont();
// The call to SetNewFont sets charWidth, charHeight, nRows and nCols
// as well as the font itself.
    if (newFont == NULL ||
        !newFont->CreateFont(-16, 0, 0, 0, FW_NORMAL, 0, 0, 0,
           ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
           DEFAULT_QUALITY, FIXED_PITCH+FF_DONTCARE, "Courier New") ||
        !SetNewFont(newFont))
    {   DisplayMsg("Failed to find standard font");
        ::PostQuitMessage(0);
        return;
    }
    clipboardInputHandle = 0;
    clipboardInput = NULL;
    inputspec = FALSE;
}

CMainWindow::~CMainWindow(void)
{
    Menu.DestroyMenu();
    //RWD for VC++ etc: clean up Fonts
    if (newFont != NULL)
                delete newFont;
    if (newSymbolFont != NULL)
                delete newSymbolFont;
}

void CMainWindow::InitialCleanup()
{
    CancelSelection();
    SetFocus();
}


// The re-painting I do here does not pay any attention to the rectangle
// that indicates what parts of the window need re-painting. This is in the
// hope that lower level parts of Windows will perform whatever clipping
// is necessary and not too much performance will be lost.

// In my text buffer I hold regular ASCII characters with codes in the range 0
// to 127 (as usual).  Rather than taking advantage of the extra characters
// with codes in the range 128:255 that the standard Windows character set
// supports I map those characters onto selected parts of the symbol
// character set.  I print symbols one character at a time and make some
// attempt to center them in the fixed-pitch cells set aside for my
// main font.  This will cause some pain with wide symbols that can overflow
// the cell.
// Well actually if the C compiler treats the "char" data type as signed
// than by "128:255" I suppose I mean "-128:-1".
// Furthermore I reserve characters in the range 0x80 to 0x9f for things
// in the regular character set but displayed in colour -- this is for
// prompts.



void CMainWindow::PaintText(CPaintDC *dc, BOOL highlighting,
                            int x, int y, char *s, int n)
{
// When I want to highlight text I will paint the background as a
// rectangle and then draw my text using a drawing mode that does not
// disturb the background further.  This is because the basic character
// cells for the things I display are not all of uniform size.
    if (highlighting)
    {   CBrush b(highlightColor);
        CBrush *oldBrush = dc->SelectObject(&b);
        dc->BitBlt(x, y, n*charWidth, charHeight, NULL, 0, 0, PATCOPY);
        dc->SelectObject(oldBrush);
        dc->SetBkMode(TRANSPARENT);
        dc->SetTextColor(highlightTextColor);
    }
    else dc->SetTextColor(textColor);
    int i, c;
    BOOL anySymbols = FALSE;
    char oneCharacter[4];
    for (i=0; i<n; i++)
    {   c = s[i] & 0xff;
        if (c < 0xa0) continue;
        if (!anySymbols)
        {   if (symbolFont != 0) dc->SelectObject(symbolFont);
            anySymbols = TRUE;
        }
// At present I just map all symbol codes onto the lower half of the
// code map.  This will give me access to greek letters, but in due course
// I may find that I want something more elaborate so that I can
// make use of other symbols.
        c = c & 0x7f;
        oneCharacter[0] = c;
        dc->TextOut(x + i*charWidth + (charWidth - symbolWidth[c])/2,
                    y + symbolOffset,
                    oneCharacter, 1);
    }
    if (anySymbols) dc->SelectObject(mainFont);
    for (i=0; i<n; i++)
    {   c = s[i] & 0xff;
        switch (c)
        {
    case 0x81: c = '-'; break;
    case 0x82: c = '='; break;
    case 0x80: anySymbols = TRUE;   // Blank - do not print anything!
    default:   continue;
        }
        anySymbols = TRUE;
        oneCharacter[0] = c;
        COLORREF old = dc->SetTextColor(RGB(255, 0 , 0));
        dc->TextOut(x + i*charWidth,
                    y + mainOffset,
                    oneCharacter, 1);
        dc->SetTextColor(old);
    }
    if (anySymbols)
    {   int f = 0;
        for (i=0; i<n; i++)
        {   c = s[i] & 0xff;
            if (c < 0x80) continue;
            if (f != i) dc->TextOut(x + f*charWidth, y+mainOffset, s+f, i-f);
            f = i+1;
        }
        if (f != i) dc->TextOut(x + f*charWidth, y+mainOffset, s+f, i-f);
    }
    else dc->TextOut(x, y+mainOffset, s, n);
}

void CMainWindow::OnPaint()
{
    int y=0, line=firstVisibleLine, p, n, n1;
    CPaintDC dc(this);
    CRect r = dc.m_ps.rcPaint;    // The rectangle that needs re-painting
    dc.SelectObject(mainFont);
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    int selStartLine = PosLine(selStartPos),
        selStartChar = PosChar(selStartPos),
        selEndLine   = PosLine(selEndPos),
        selEndChar   = PosChar(selEndPos);
// I always keep the caret at the very end of my text, where new characters
// can be added.  This is so even when I am dragging the mouse to select
// some earlier stuff.
// A real problem about this is that it means that it is typically not
// possible to see if a selection includes a newline character at on or
// other end. For the moment I will ignore this limitation.
    CPoint cp;
    cp.x = charWidth*(currentLineLength - leftMargin);
    cp.y = charHeight*(currentLine - firstVisibleLine);
    SetCaretPos(cp);
// This is somewhat sordid mainly because it needs to paint a selected region
// of text in inverse video. I deal with this by first painting any lines
// that appear above the selection.
    int highlighting = (line > selStartLine && line <= selEndLine);
    for (;
         y < nRows && line <= currentLine && line < selStartLine;
         y++, line++)
    {   p = txtLine[line & LINE_MASK],
        n = txtLineLen[line & LINE_MASK] - leftMargin;
        if (n > nCols) n = nCols;    // clip to whole number of chars
        if (n > 0) PaintText(&dc, highlighting,
                             0, charHeight*y,
                             &txtBuffer[p + leftMargin],
                             n);
    }
    if (y >= nRows || line > currentLine) return;
// Next deal with the line on which a selection starts. This is more
// complicated because the selection can start part way across the line,
// but what is worse, the selection can end later on the same line. In
// that case I paint in three segments here.
    if (line == selStartLine)
    {   p = txtLine[line & LINE_MASK],
        n = selStartChar - leftMargin;
        if (n > nCols) n = nCols;
        if (n > 0) PaintText(&dc, FALSE,
                             0, charHeight*y,
                             &txtBuffer[p + leftMargin],
                             n);
        if (selStartLine == selEndLine)
        {   n1 = selEndChar - leftMargin;
            if (n1 > nCols) n1 = nCols;
            if (n1 > n) PaintText(&dc, TRUE,
                                  charWidth*n, charHeight*y,
                                  &txtBuffer[p + leftMargin + n],
                                  n1 - n);
            n = n1;
            n1 = txtLineLen[line & LINE_MASK] - leftMargin;
            if (n1 > nCols) n1 = nCols;
            if (n1 > n) PaintText(&dc, FALSE,
                                  charWidth*n, charHeight*y,
                                  &txtBuffer[p + leftMargin + n],
                                  n1 - n);
        }
        else
        {   n1 = txtLineLen[line & LINE_MASK] - leftMargin;
            if (n1 > nCols) n1 = nCols;
            if (n1 > n) PaintText(&dc, TRUE,
                                  charWidth*n, charHeight*y,
                                  &txtBuffer[p + leftMargin + n],
                                  n1 - n);
        }
        y++, line++;
        if (y >= nRows || line > currentLine) return;
    }
// Now if there was a multi-line selection I have a straightforward bunch
// of lines all to be painted in inverse video.
    for (;
         y < nRows && line <= currentLine && line < selEndLine;
         y++, line++)
    {   p = txtLine[line & LINE_MASK],
        n = txtLineLen[line & LINE_MASK] - leftMargin;
        if (n > nCols) n = nCols;
        if (n > 0) PaintText(&dc, TRUE,
                             0, charHeight*y,
                             &txtBuffer[p + leftMargin],
                             n);
    }
    if (y >= nRows || line > currentLine) return;

    if (line == selEndLine)
    {   p = txtLine[line & LINE_MASK],
        n = selEndChar - leftMargin;
        if (n > nCols) n = nCols;
        if (n > 0) PaintText(&dc, TRUE,
                             0, charHeight*y,
                             &txtBuffer[p + leftMargin],
                             n);
        n1 = txtLineLen[line & LINE_MASK] - leftMargin;
        if (n1 > nCols) n1 = nCols;
        if (n1 > n) PaintText(&dc, FALSE,
                              charWidth*n, charHeight*y,
                              &txtBuffer[p + leftMargin + n],
                              n1 - n);
        y++, line++;
        if (y >= nRows || line > currentLine) return;
    }
// Finally I have any unselected lines at the end of the buffer
    for (;
         y < nRows && line <= currentLine;
         y++, line++)
    {   p = txtLine[line & LINE_MASK],
        n = txtLineLen[line & LINE_MASK] - leftMargin;
        if (n > nCols) n = nCols;
        if (n > 0) PaintText(&dc, FALSE,
                             0, charHeight*y,
                             &txtBuffer[p + leftMargin],
                             n);
    }
// Note that as this procedure exits the CPaintDC goes out of scope so
// its destructor is invoked - and the caret gets re-displayed.
}

// This is the basic structure for the representation of text:
//
//  txtBuffer[] holds the characters.  Viewing it as a circular buffer
//         firstChar is the index of the first character stored, and
//         currentChar is one beyond the last.  Within this buffer data
//         is stored in "lines" and no line is ever split across the
//         wrap-around.  Characters for one line follow on immediately
//         after the previous (no terminator, no '\n' between).
//  txtLine[] holds the offsets in txtBuffer[] of the first character of
//         each line.
//  txtLineLen[] records the length of each line.
//         The index for txtLine[] and txtLineLen is taken to be an actual
//         line number masked with LINE_MASK.
//  firstLine, currentLine are the true line numbers of the first and last
//         lines stored (so txtBuffer[txtLine[firstLine]] is the first
//         character stored).
//         txtLineLen[currentLine & LINE_MASK] is not filled in until the line
//         concerned is complete, so
//  currentLineLength stores the length of the current (active) line until
//         then.
//
//  Additional variables are concerned with selected regions, scrolling,
// and the fact that in general only part of the text will fit on the
// screen.

void CMainWindow::InsertChar(int ch)
// This inserts one character into the text buffer, removing stale ones
// if space is getting tight, scrolling the window (horizontally and/or
// vertically) as necessary and either painting to the screen or marking
// things invalid as it sees fit.  The cases of '\n' (newlines) and regular
// characters are totally different but it still seems nicer to provide just
// one interface to both forms of insertion.
{
    if (log_file != NULL) {
      switch (ch) {
      case 0x80: (void)putc(' ', log_file); break;
      case 0x81: (void)putc('-', log_file); break;
      case 0x82: (void)putc('=', log_file); break;
      default:   (void)putc(ch,  log_file); break;
      }
    }
   if (ch == '\n') {
     txtLineLen[LINE_MASK & currentLine++] = currentLineLength;
     while (currentLine == firstLine + LINE_MASK + 1) RemoveFirstLine();
     txtLine[currentLine & LINE_MASK] = currentChar;
     currentLineLength = 0;
     if (leftMargin != 0) OnHScroll(PRIVATE_SET_LEFT_MARGIN, 0, NULL);
     if (currentLine - firstVisibleLine == nRows)
       OnVScroll(PRIVATE_SET_VISIBLE_LINE, firstVisibleLine+1, NULL);
// Since inserting a newline may not provoke any re-painting my normal
// mechanism for keeping the caret in place fails - hence I re-position
// it by hand here.
     CPoint cp;
     cp.x = charWidth*(currentLineLength - leftMargin);
     cp.y = charHeight*(currentLine - firstVisibleLine);
     SetCaretPos(cp);
     OnBottom();
   }
// I have an upper limit on the length of output line I will consider.  The
// main reason for this is that with this limit I can be certain that my
// text buffer has room in it for several worst-length lines, and this
// avoids awkward degenerate cases when the main buffer becomes full.  I just
// silently discard characters that are beyond the limit.  A further useful
// effect of the line-length limit is that it allows me to pack logical
// positions in the text into one word.
    else if (currentLineLength < MAX_LINE_LENGTH) {
      txtBuffer[currentChar++] = ch;
      currentLineLength++;
      if (currentChar == TEXT_SIZE) {              // need to wrap around
        while (firstChar <= currentLineLength) RemoveFirstLine();
        memcpy(txtBuffer, &txtBuffer[txtLine[currentLine & LINE_MASK]],
               currentLineLength);
        txtLine[currentLine & LINE_MASK] = 0;
        currentChar = currentLineLength;
      }
      while (currentChar == firstChar) RemoveFirstLine();
      if (currentLineLength - leftMargin >= nCols) {
        int excess = currentLineLength - leftMargin - nCols + 1;
        if (nCols > 15 && excess < 10) excess = 10;
        OnHScroll(PRIVATE_SET_LEFT_MARGIN, leftMargin+excess, NULL);
      }
      RECT r;
      r.top = charHeight*(currentLine - firstVisibleLine);
      r.bottom = r.top + charHeight;
      r.right = charWidth*(currentLineLength - leftMargin);
      r.left = r.right - charWidth;
      InvalidateRect(&r, TRUE);
    }
}

void CMainWindow::InsertLine(char *s, int n)
// This inserts several characters into the buffer, with the last of these
// being a newline (thus at the end this always leaves the insertion point
// at the left margin, and it always moves down just one line).  This
// ought to be more efficent than inserting the characters one at a time,
// especially if the line created would have been long enough to provoke
// temporary horizontal scrolling of the window.
{
    int iLineLength = currentLineLength;
// If the line looks as if it will be longer than the longest line that I
// permit I will silently truncate it. I do this even if the line would
// turn out to contain many character pairs that would collapse into single
// Greek letters...
    if (iLineLength + n >= MAX_LINE_LENGTH)
        n = MAX_LINE_LENGTH - iLineLength - 1;
    for (int i=0; i<n; i++)
    {   int ch = *s++;
        txtBuffer[currentChar++] = ch;
        currentLineLength++;
        if (currentChar == TEXT_SIZE)              // need to wrap around
        {   while (firstChar <= currentLineLength) RemoveFirstLine();
            memcpy(txtBuffer, &txtBuffer[txtLine[currentLine & LINE_MASK]],
                              currentLineLength);
            txtLine[currentLine & LINE_MASK] = 0;
            currentChar = currentLineLength;
        }
        while (currentChar == firstChar) RemoveFirstLine();
    }
// The amount that I invalidate here does not take account of reduction
// to Greek -- but that only means I re-paint a few extra character positions
// and so it seems unimportant.
    if (n > 0)
    {   RECT r;
        r.top    = charHeight*(currentLine - firstVisibleLine);
        r.bottom = r.top + charHeight;
        r.right  = charWidth*(currentLineLength - leftMargin);
        r.left   = charWidth*(iLineLength - leftMargin);
        InvalidateRect(&r, TRUE);
    }
    txtLineLen[LINE_MASK & currentLine++] = currentLineLength;
    while (currentLine == firstLine + LINE_MASK + 1) RemoveFirstLine();
    txtLine[currentLine & LINE_MASK] = currentChar;
    currentLineLength = 0;
    if (leftMargin != 0) OnHScroll(PRIVATE_SET_LEFT_MARGIN, 0, NULL);
    if (currentLine - firstVisibleLine == nRows)
        OnVScroll(PRIVATE_SET_VISIBLE_LINE, firstVisibleLine+1, NULL);
    if (n <= 0)
    {   CPoint cp;
        cp.x = charWidth*(currentLineLength - leftMargin);
        cp.y = charHeight*(currentLine - firstVisibleLine);
        SetCaretPos(cp);
    }
}

void CMainWindow::InsertSeveralLines(char **lines, int *lengths, int nlines)
// This inserts several lines of characters into the buffer.  The arrays
// lines contains pointers to each string to write, while the corresponding
// entries in lengths says how long each string is,
{
    for (int k=0; k<nlines; k++)
    {   char *s = lines[k];
        int n = lengths[k];
        int iLineLength = currentLineLength;
        if (iLineLength + n >= MAX_LINE_LENGTH)
            n = MAX_LINE_LENGTH - iLineLength - 1;
        for (int i=0; i<n; i++)
        {   int ch = *s++;
            txtBuffer[currentChar++] = ch;
            currentLineLength++;
            if (currentChar == TEXT_SIZE)
            {   while (firstChar <= currentLineLength) RemoveFirstLine();
                memcpy(txtBuffer, &txtBuffer[txtLine[currentLine & LINE_MASK]],
                                  currentLineLength);
                txtLine[currentLine & LINE_MASK] = 0;
                currentChar = currentLineLength;
            }
            while (currentChar == firstChar) RemoveFirstLine();
        }
        if (n > 0)
        {   RECT r;
            r.top    = charHeight*(currentLine - firstVisibleLine);
            r.bottom = r.top + charHeight;
            r.right  = charWidth*(currentLineLength - leftMargin);
            r.left   = charWidth*(iLineLength - leftMargin);
            InvalidateRect(&r, TRUE);
        }
        txtLineLen[LINE_MASK & currentLine++] = currentLineLength;
        while (currentLine == firstLine + LINE_MASK + 1) RemoveFirstLine();
        txtLine[currentLine & LINE_MASK] = currentChar;
        currentLineLength = 0;
    }
    if (leftMargin != 0) OnHScroll(PRIVATE_SET_LEFT_MARGIN, 0, NULL);
    if (currentLine - firstVisibleLine == nRows)
        OnVScroll(PRIVATE_SET_VISIBLE_LINE, firstVisibleLine+1, NULL);
    CPoint cp;
    cp.x = charWidth*(currentLineLength - leftMargin);
    cp.y = charHeight*(currentLine - firstVisibleLine);
    SetCaretPos(cp);
    OnBottom();
}

// When the text buffer gets full I make space in it by discarding the
// oldest stored line.  The function does that.  In the worst case this can
// lead to a need to scroll the window.

void CMainWindow::RemoveFirstLine()
{
    if (PosLine(selStartPos) == firstLine)
    {   selStartPos = MakePos(firstLine+1, 0);
        if (selStartPos > selEndPos) selEndPos = selStartPos;
        if (selStartPos > selFirstPos) selFirstPos = selStartPos;
    }
    firstLine++;
    firstChar = txtLine[firstLine & LINE_MASK];
    while (firstLine > firstVisibleLine)
        OnVScroll(PRIVATE_SET_VISIBLE_LINE, firstVisibleLine+1, NULL);
}

void CMainWindow::RemoveChar()
// This removes one character from the text buffer. If the buffer is
// empty it does nothing.
{
    if (currentLineLength == 0)
    {   if (currentLine == firstLine) return;  // buffer is empty.
        currentLineLength = txtLineLen[LINE_MASK & --currentLine];
        currentChar = txtLine[currentLine & LINE_MASK] + currentLineLength;
        if (PosLine(selEndPos) > currentLine)
        {   selEndPos = MakePos(currentLine, currentLineLength);
            if (selFirstPos > selEndPos) selFirstPos = selEndPos;
            if (selStartPos > selEndPos) selStartPos = selEndPos;
        }
        if (currentLineLength - leftMargin >= nCols)
        {   OnHScroll(PRIVATE_SET_LEFT_MARGIN,
                      currentLineLength - nCols + 1, NULL);
        }
        if (currentLine < firstVisibleLine)
        {   int deficit = firstVisibleLine - currentLine;
            int half = nRows/2;
            if (deficit < half) deficit = half;
            if (firstVisibleLine - firstLine < deficit)
                deficit = firstVisibleLine - firstLine;
            OnVScroll(PRIVATE_SET_VISIBLE_LINE,
                      firstVisibleLine-deficit, NULL);
        }
        CPoint cp;
        cp.x = charWidth*(currentLineLength - leftMargin);
        cp.y = charHeight*(currentLine - firstVisibleLine);
        SetCaretPos(cp);
    }
    else
    {   currentChar--;
        currentLineLength--;
        if (PosLine(selEndPos) == currentLine &&
            PosChar(selEndPos) > currentLineLength)
        {   selEndPos = MakePos(currentLine, currentLineLength);
            if (selFirstPos > selEndPos) selFirstPos = selEndPos;
            if (selStartPos > selEndPos) selStartPos = selEndPos;
        }
        if (currentLineLength <= leftMargin && leftMargin != 0)
        {   int deficit = leftMargin - currentLineLength;
            if (nCols > 15 && deficit < 10) deficit = 10;
            if (deficit > leftMargin) deficit = leftMargin;
            OnHScroll(PRIVATE_SET_LEFT_MARGIN,
                      leftMargin - deficit, NULL);
        }
        RECT r;
        r.top = charHeight*(currentLine - firstVisibleLine);
        r.bottom = r.top + charHeight;
        r.left = charWidth*(currentLineLength - leftMargin);
        r.right = r.left + charWidth;
        InvalidateRect(&r, TRUE);
    }
}

#define Ctrl(x) ((x) & 0x1f)

void CMainWindow::OnChar(UINT ch, UINT nRepCnt, UINT nFlags)
{
    wait_for_char = FALSE;
    ch &= 0xff;
    switch (ch)
    {
case Ctrl('C'):
        OnCopy();
        return;
// I make Ctrl+D and Ctrl+Z exit, but note very well that they both
// exit from this system super-promptly when the key is typed, and
// they do NOT wait until the program gets around to reading them.
case Ctrl('D'):          // Some Unix users may be used to Ctrl+D as EOF?
        OnExit();
        return;
case Ctrl('G'):
        OnPause();
        return;
case Ctrl('L'):
        OnRedraw();
        return;
case Ctrl('O'):
        OnMove();
        return;
case Ctrl('Q'):
        OnContinue();
        return;
case Ctrl('S'):
        OnStop();
        return;
case Ctrl('V'):
        OnPaste();
        return;
case Ctrl('Z'):         // Some PC users may be used to Ctrl+Z as EOF?
        OnExit();
        return;
case 0x0a:
case 0x0d:
        ch = '\n';
        break;
case '\t':
        break;
default:
        if ((ch & 0x7f) < 0x20) return;  // Discard control chars.
        break;
    }
    OnBottom();            // make insertion point visible
    if (ch == '\n')
    {   ttyIbuf[ttyIbufn++] = ch;
        if (inputBufferInsert + ttyIbufn - inputBufferRemove >=
            INPUT_BUFFER_MASK)
        {   ::Beep(1000, 100);          // Input buffer full - BEEP
            return;
        }
        for (int i=0; i<ttyIbufn; i++)
            inputBuffer[inputBufferInsert++ & INPUT_BUFFER_MASK] =
                ttyIbuf[i];
        ttyIbufn = 0;
        InsertChar('\n');
        return;
    }
    if (ttyIbufn >= MAX_LINE_LENGTH)
    {   ::Beep(1000 ,100);
        return;
    }
// I treat tabs as things to convert to the correct number of spaces
// to align input to a multiple of 8 columns. MAX_LINE_LENGTH ought to
// be a multiple of 8 for the overflow check here to have been valid.
// Note that currentLineLength should be at least as great as ttyIbufn:
// it can be strictly larger if there was text on the current line (eg
// a prompt) before the user started to type anything in.
    if (ch == '\t')
    {   do
        {   ttyIbuf[ttyIbufn++] = ' ';
            InsertChar(' ');
        } while ((currentLineLength & 7) != 0);
    }
    else
    {   ttyIbuf[ttyIbufn++] = ch;
        InsertChar(ch);
    }
}

void CMainWindow::OnKeyDown(UINT ch, UINT nRepCnt, UINT nFlags)
{
    switch (ch)
    {
case VK_BACK:                  // I make "backspace" and "delete"
case VK_DELETE:                // synonyms here to reduce mixups.
        if (ttyIbufn > 0) ttyIbufn--, RemoveChar();
        OnBottom();            // make insertion point visible
        return;
// The various keys like "PAGE UP" etc do just what the scroll bar can do.
case VK_UP:
        OnVScroll(SB_LINEUP, 0, NULL);
        return;
case VK_PRIOR:
        OnVScroll(SB_PAGEUP, 0, NULL);
        return;
case VK_NEXT:
        OnVScroll(SB_PAGEDOWN, 0, NULL);
        return;
case VK_DOWN:
        OnVScroll(SB_LINEDOWN, 0, NULL);
        return;
case VK_HOME:
        OnTop();
        return;
case VK_END:
        OnBottom();
        return;
    }
}

static char *xmemcopy(char *p, char *q, int n)
{
    while (n-- > 0)
    {   int c = *q++ & 0xff;
        *p++ = c;
    }
    return p;
}

void CMainWindow::OnCopy()
{
// Here I have to allocate some global memory and copy text out of my buffer
// into it, making sure I insert CR/LF combinations between lines and a
// zero byte on the end as a terminator.
    int i, size;
    txtLineLen[currentLine] = currentLineLength;
    if (!OpenClipboard()) return;
    if (!::EmptyClipboard()) return;
    int l1 = PosLine(selStartPos), l2 = PosLine(selEndPos);
    int c1 = PosChar(selStartPos), c2 = PosChar(selEndPos);
// I make the buffer for COPYing into rather larger than may be
// necessary to be certain that I have left enough space in case I need to
// expand <alpha> into <`a> etc.  For a one-line selection I just allocate
// twice as many characters as are visible - for multi-line ones I am
// more careful.
    if (l1 == l2) size = 2*(c2 - c1);
    else
    {   size = 2*(txtLineLen[l1 & LINE_MASK] - c1);  // tail of first line
        for (i=l1+1; i<l2; i++)
        {   int len = txtLineLen[i & LINE_MASK];
            size += len + 2;
        }
        size += 2*c2;
    }
    HGLOBAL h = ::GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, size+1);
    char *p = NULL;
    if (h != NULL) p = (char *)::GlobalLock(h);
    if (p != NULL)
    {   if (l1 == l2)
        {   p = xmemcopy(p, &txtBuffer[txtLine[LINE_MASK & l1]+c1], c2-c1);
            *p = 0;
        }
        else
        {   int n = txtLineLen[l1 & LINE_MASK] - c1;
            p = xmemcopy(p, &txtBuffer[txtLine[l1 & LINE_MASK]+c1], n);
            *p++ = '\r'; *p++ = '\n';
            for (i=l1+1; i<l2; i++)
            {   n = txtLineLen[i & LINE_MASK];
                p = xmemcopy(p, &txtBuffer[txtLine[i & LINE_MASK]], n);
                *p++ = '\r'; *p++ = '\n';
            }
            p = xmemcopy(p, &txtBuffer[txtLine[l2 & LINE_MASK]], c2);
            *p = 0;
        }
        ::GlobalUnlock(h);
        ::SetClipboardData(CF_TEXT, h);
    }
    ::CloseClipboard();
}

BOOL CMainWindow::GrabLineFromClipboard()
{
    int c;
    while ((c = *clipboardInput++) != 0)
    {   if (c == '\r') continue;
        c &= 0xff;
        if (c == 0x0a || c == 0x0d)   // Accept CR or LF here.
        {   ttyIbuf[ttyIbufn++] = '\n';
            for (int i=0; i<ttyIbufn; i++)
                inputBuffer[inputBufferInsert++ & INPUT_BUFFER_MASK] =
                    ttyIbuf[i];
            ttyIbufn = 0;
            cwin_putchar('\n');
            break;
        }
// I just truncate overlong lines that come from the clipboard
        if (ttyIbufn >= MAX_LINE_LENGTH) continue;
        if (c == '\t')
        {   do
            {   ttyIbuf[ttyIbufn++] = ' ';
                cwin_putchar(' ');
            } while ((ttyIbufn & 7) != 0);
        }
        else if ((c & 0x7f) >= 0x20)   // Ignore control chars
        {   ttyIbuf[ttyIbufn++] = c;
            cwin_putchar(c);
        }
    }
    if (c == 0)
    {   if (inputspec) inputspec = FALSE;
        else
        {   ::GlobalUnlock(clipboardInputHandle);
            clipboardInputHandle = 0;
            OnBottom();
        }
    }
    return TRUE;
}

void CMainWindow::AbandonClipboard()
{
    if (clipboardInputHandle)
    {   ::GlobalUnlock(clipboardInputHandle);
        clipboardInputHandle = 0;
    }
    inputspec = FALSE;
}

void CMainWindow::OnPaste()
{
    if (!OpenClipboard()) return;
    inputspec = FALSE;
    if (clipboardInputHandle) ::GlobalUnlock(clipboardInputHandle);
    clipboardInputHandle = ::GetClipboardData(CF_TEXT);
    if (clipboardInputHandle != 0)
    {   clipboardInput = (char *)::GlobalLock(clipboardInputHandle);
        if (clipboardInput == NULL) clipboardInputHandle = 0;
    }
    ::CloseClipboard();
// I transfer the first line of stuff from the clipboard at once.
// If the clipboard contained multiple lines of text than subsequent
// ones are only accessed when the user`s code tries to read them.
    if (clipboardInputHandle)
    {   int c;
        while ((c = *clipboardInput++) != 0)
        {   if (c == '\r') continue;
            OnChar(c, 1, 0);
            if (c == '\n') break;
        }
        if (c == 0)
        {   if (clipboardInputHandle) ::GlobalUnlock(clipboardInputHandle);
            clipboardInputHandle = 0;
            OnBottom();
        }
    }
}

void CMainWindow::OnMove()
{
    OnCopy();
    OnPaste();
}

// Clear All just throws away the entire contents of the text buffer and
// leaves us ready to start again from scratch.

void CMainWindow::OnClear()
{
    VScrollPos = HScrollPos = 0;    // scroll thumbs start at zero
    leftMargin = 0;
    firstChar = currentChar = 0;    // empty text buffer
    firstLine = firstVisibleLine = currentLine = txtLine[0] = 0;
    currentLineLength = 0;
    selFirstPos = selStartPos = selEndPos = 0;
        //RWD.5.97
    outputFirst = outputLast = outputCurLine = outputBuffer;
    outputCurLength = nOutputLines = 0;
    trackingSelection = FALSE;
    ::ReleaseCapture();
    SetScrollPos(SB_HORZ, 0, TRUE);
    SetScrollPos(SB_VERT, 0, TRUE);
    Invalidate(TRUE);
}

void CMainWindow::FindMouseChar(int x, int y)
{
// Maybe the mouse could be outside my client area, since sometimes I
// capture the mouse.  Clip coordinates here to be on the safe side.
    if (y < 0) y = 0;
    else if (y > clientArea.Height()) y = clientArea.Height();
    y = y/charHeight + firstVisibleLine;
    if (y > currentLine) y = currentLine;
// Experiments with regular Windows "edit controls" seems to suggest
// that the rounding indicated here is what is expected.
    if (x < 0) x = 0;
    x = (x + charWidth/2)/charWidth + leftMargin;
    int len = txtLineLen[y & LINE_MASK];
    if (x > len) x = len;
    mousePos = MakePos(y, x);
}

void CMainWindow::OnSelectAll()
{
    selFirstPos = selStartPos = MakePos(firstLine, 0);
    selEndPos = MakePos(currentLine, currentLineLength);
// Even if everything was already selected I will invalidate the entire
// screen, since selecting everything seems uncommon and drastic.
    Invalidate(TRUE);
}

void CMainWindow::StartSelection()
{
    CancelSelection();
    selFirstPos = selStartPos = selEndPos = mousePos;
}

void CMainWindow::ExtendSelection()
{
    int oldStartPos = selStartPos;
    int oldEndPos = selEndPos;
    if (mousePos > selFirstPos)
    {   selStartPos = selFirstPos;
        selEndPos = mousePos;
    }
    else
    {   selStartPos = mousePos;
        selEndPos = selFirstPos;
    }
    if (oldStartPos == selStartPos &&
        oldEndPos == selEndPos) return;
// Working out what part of the screen needs to be invalidated here
// involves many more cases than I might have hoped...
    int first, last;
    if (oldEndPos == selStartPos)
    {   first = oldStartPos;
        last = selEndPos;
    }
    else if (selEndPos == oldStartPos)
    {   first = selStartPos;
        last = oldEndPos;
    }
    else if (oldEndPos == selEndPos)
    {   if (oldStartPos < selStartPos)
        {   first = oldStartPos;
            last = selStartPos;
        }
        else
        {   first = selStartPos;
            last = oldStartPos;
        }
    }
    else
    {   if (oldEndPos < selEndPos)
        {   first = oldEndPos;
            last = selEndPos;
        }
        else
        {   first = selEndPos;
            last = oldEndPos;
        }
    }
    RECT r;
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    if (PosLine(first) == PosLine(last))
    {   r.left   = charWidth*(PosChar(first) - leftMargin);
        r.right  = charWidth*(PosChar(last) - leftMargin);
        r.top    = charHeight*(PosLine(first) - firstVisibleLine);
        r.bottom = r.top + charHeight;
        InvalidateRect(&r, TRUE);
    }
// When I have a bunch of short lines I go to the trouble to invalidate
// just the parts of them that contain real character data, and not the
// blank space at the end.
    else for (int i=PosLine(first); i<=PosLine(last); i++)
    {   r.left   = 0;
        r.right  = charWidth*txtLineLen[i & LINE_MASK];
        r.top    = charHeight*(i - firstVisibleLine);
        r.bottom = r.top + charHeight;
        InvalidateRect(&r, TRUE);
    }
}

void CMainWindow::CancelSelection()
{
    if (PosLine(selStartPos) != PosLine(selEndPos))
    {   RECT r;
        r.left = 0;
        r.right = charWidth*nCols;
        r.top = charHeight*(PosLine(selStartPos) - firstVisibleLine);
        r.bottom = charHeight*(PosLine(selEndPos) + 1 - firstVisibleLine);
        InvalidateRect(&r, TRUE);
    }
    else if (selStartPos != selEndPos)
    {   RECT r;
        r.left = charWidth*(PosChar(selStartPos) - leftMargin);
        r.right = charWidth*(PosChar(selEndPos) - leftMargin);
        r.top = charHeight*(PosLine(selStartPos) - firstVisibleLine);
        r.bottom = r.top + charHeight;
        InvalidateRect(&r, TRUE);
    }
    selFirstPos = selStartPos = selEndPos = 0;
}

void CMainWindow::OnLButtonDblClk(UINT nFlags, CPoint point)
{
// This should probably select a word
    OnLButtonDown(nFlags, point);
}

void CMainWindow::OnLButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    FindMouseChar(point.x, point.y);
    trackingSelection = TRUE;
    SetCapture();
    if (nFlags & MK_SHIFT) ExtendSelection();
    else StartSelection();
}

void CMainWindow::OnLButtonUp(UINT nFlags, CPoint point)
{
    FindMouseChar(point.x, point.y);
    ::ReleaseCapture();
    if (trackingSelection) ExtendSelection();
    trackingSelection = FALSE;
}

//
// I make a click on the middle mouse button do "COPY" then "PASTE" which
// is a bit like the behaviour I have seen with X windows.  Well that is
// what this is intended to do, but the machine I have at home seems to ignore
// the mouse middle button, and GetSystemMetrics(SB_CMOUSEBUTTONS) returns 0.
// Anyway, CTRL+O does what the middle mouse button does, so no worry.
//

void CMainWindow::OnMButtonDblClk(UINT nFlags, CPoint point)
{
    OnMButtonDown(nFlags, point);
}

void CMainWindow::OnMButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    OnMove();
}

void CMainWindow::OnMButtonUp(UINT nFlags, CPoint point)
{
}

void CMainWindow::OnRButtonDblClk(UINT nFlags, CPoint point)
{
    cwin_unTop();
}

// Dragging with the right mouse position always extends a selection,
// and it tried to be a tiny bit clever about which end of an existing
// selection it leaves anchored.

void CMainWindow::OnRButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    FindMouseChar(point.x, point.y);
    int newFirst = selFirstPos;
    if (mousePos > selEndPos) newFirst = selStartPos;
    else if (mousePos < selStartPos) newFirst = selEndPos;
    trackingSelection = TRUE;
    SetCapture();
    if (selFirstPos != newFirst)
    {   CancelSelection();
         selStartPos = selEndPos = selFirstPos = newFirst;
    }
    ExtendSelection();
}

void CMainWindow::OnRButtonUp(UINT nFlags, CPoint point)
{
    FindMouseChar(point.x, point.y);
    ::ReleaseCapture();
    if (trackingSelection) ExtendSelection();
    trackingSelection = FALSE;
}

void CMainWindow::OnMouseMove(UINT nFlags, CPoint point)
{
    if (trackingSelection)
    {   FindMouseChar(point.x, point.y);
        ExtendSelection();
    }
//      else {
//        RECT rect;
//        GetClientRect(&rect);
//        mouse_x = (float)point.x/(float)rect.right;
//        mouse_y = (float)point.y/(float)rect.bottom;
//      }
}

// The next three functions are intended to make non-client hits on
// the main window demote the graphics window before they do their normal
// actions.

void CMainWindow::OnNcLButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    CFrameWnd::OnNcLButtonDown(nFlags, point);
}

void CMainWindow::OnNcMButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    CFrameWnd::OnNcMButtonDown(nFlags, point);
}

void CMainWindow::OnNcRButtonDown(UINT nFlags, CPoint point)
{
    cwin_unTop();
    CFrameWnd::OnNcRButtonDown(nFlags, point);
}

void CMainWindow::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar *pNctl)
{
    int w, oldFirst = firstVisibleLine;
// If all the text in the buffer is currently visible then I will ignore
// any attempts to scroll.
    if (currentLine - firstLine < nRows &&
        firstLine == firstVisibleLine) return;
// If I can make everything visible I will do that regardless of anything
// the user tries to do.
    if (currentLine - firstLine < nRows)
    {   firstVisibleLine = firstLine;
        VScrollPos = 0;
    }
    else
    {    switch (nSBCode)
        {
    case SB_THUMBPOSITION:
            w = currentLine - firstLine + 1 - nRows;
            if (nPos != 100) w = (nPos * w)/100;
            if (w == firstVisibleLine) return;   // no change!
            if (w < firstLine) w = firstLine;
            else if (w > currentLine - nRows + 1) w = currentLine - nRows + 1;
            firstVisibleLine = w;
            break;
    case PRIVATE_SET_VISIBLE_LINE:
            firstVisibleLine = nPos;
            break;
    case SB_LINEDOWN:
            if (currentLine - firstVisibleLine < nRows) return;
            firstVisibleLine++;
            break;
    case SB_LINEUP:
            if (firstLine == firstVisibleLine) return;
            firstVisibleLine--;
            break;
// When asked to scroll be a "page" I in fact jump by around 0.7 times
// the number of lines visible on a page.
    case SB_PAGEDOWN:
            if (currentLine - firstVisibleLine < nRows) return;
            w = firstVisibleLine + (7*nRows)/10;
            if (w > currentLine - nRows + 1) w = currentLine - nRows + 1;
            firstVisibleLine = w;
            break;
    case SB_PAGEUP:
            if (firstLine == firstVisibleLine) return;
            w = firstVisibleLine - (7*nRows)/10;
            if (w < firstLine) w = firstLine;
            firstVisibleLine = w;
            break;
        }
        VScrollPos = (firstVisibleLine * 100) /
                     (currentLine - firstLine + 1 - nRows);
        if (VScrollPos < 0) VScrollPos = 0;
        if (VScrollPos > 100) VScrollPos = 100;
    }
    SetScrollPos(SB_VERT, VScrollPos, TRUE);
    ScrollWindow(0, charHeight*(oldFirst - firstVisibleLine), NULL, clipArea);
}

void CMainWindow::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar *pNctl)
{
// Each time I hit the horizontal scroll-bar I will check to find how
// long the longest (partially) visible line is.
    int longest = 0, w, oldLeft = leftMargin;
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    for (int i = firstVisibleLine;
         i<=currentLine && i < firstVisibleLine+nRows;
         i++)
        if (txtLineLen[i] > longest) longest = txtLineLen[i];
// If everything fits and I can see it all do nothing.
    if (longest <= nCols && leftMargin == 0) return;
// If I can make everything fit just scroll back and do that.
    if (longest <= nCols)
    {   leftMargin = 0;
        HScrollPos = 0;
    }
    else
    {   switch (nSBCode)
        {
    case SB_THUMBPOSITION:
            w = (nPos * (longest - nCols)) / 100;
            if (w == leftMargin) return;
            else if (w < 0) w = 0;
            else if (w > longest - nCols) w = longest - nCols;
            leftMargin = w;
            break;
    case PRIVATE_SET_LEFT_MARGIN:
            leftMargin = nPos;
            break;
    case SB_LINERIGHT:
            if (leftMargin >= longest - nCols) return;
            leftMargin++;
            break;
    case SB_LINELEFT:
            if (leftMargin == 0) return;
            leftMargin--;
            break;
// Big jumps are by roughly half the number of visible columns.
    case SB_PAGERIGHT:
            w = leftMargin + nCols/2;
            if (w > longest - nCols) w = longest - nCols;
            leftMargin = w;
            break;
    case SB_PAGELEFT:
            w = leftMargin - nCols/2;
            if (w < 0) w = 0;
            leftMargin = w;
            break;
        }
        HScrollPos = (leftMargin * 100) / (longest - nCols);
        if (HScrollPos < 0) HScrollPos = 0;
        if (HScrollPos > 100) HScrollPos = 100;
    }
    SetScrollPos(SB_HORZ, HScrollPos, TRUE);
    ScrollWindow(charWidth*(oldLeft - leftMargin), 0, NULL, clipArea);
}

// After the window has been re-sized OR after the font used has been
// changed I need to reconsider how much of the text is visible and
// where the scroll-bar thumbs are.  When I do this I am about to redraw
// the entire window anyway, so I do not need to re-state that fact.

void CMainWindow::AfterSizeChange()
{
// The clip area is my client area cut down to be a whole number of
// character cells high and wide.  It is used when scrolling so that I
// never put characters half-way off the edge of the client area.
    CRect newArea;
    newArea.top  = 0; newArea.bottom = nRows * charHeight;
    newArea.left = 0; newArea.right  = nCols * charWidth;
    CRect r;
    if (newArea.right > clipArea.right)
    {   r.top = newArea.top; r.bottom = newArea.bottom;
        r.left = clipArea.right; r.right = newArea.right;
        InvalidateRect(&r, TRUE);
    }
    if (newArea.bottom > clipArea.bottom)
    {   r.top = clipArea.bottom; r.bottom = newArea.bottom;
        r.left = newArea.left; r.right = newArea.right;
        InvalidateRect(&r, TRUE);
    }
    clipArea = newArea;
// I need to invalidate the margin between my clip area and the full client
// area, since otherwise that can be left filled with left-over parts of
// characters when I re-size my window.
    r.top = clientArea.top; r.bottom = clientArea.bottom;
    r.left = clipArea.right; r.right = clientArea.right;
    InvalidateRect(&r, TRUE);
    r.top = clipArea.bottom; r.bottom = clientArea.bottom;
    r.left = clientArea.left; r.right = clipArea.right;
    InvalidateRect(&r, TRUE);
// Maybe I have now invalidated enough?
    if (currentLine - firstLine < nRows)
    {   firstVisibleLine = firstLine;
        VScrollPos = 0;
    }
    else VScrollPos = (firstVisibleLine * 100) /
                      (currentLine - firstLine + 1 - nRows);
    if (VScrollPos < 0) VScrollPos = 0;
    if (VScrollPos > 100) VScrollPos = 100;
    SetScrollPos(SB_VERT, VScrollPos, TRUE);
    int longest = 0;
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    for (int i = firstVisibleLine;
         i<=currentLine && i < firstVisibleLine+nRows;
         i++)
        if (txtLineLen[i] > longest) longest = txtLineLen[i];
    if (longest <= nCols)        // move to start of line if all will fit
    {   leftMargin = 0;
        HScrollPos = 0;
    }
    else
    {   int w = longest - nCols; // justify longest line to right of screen?
        if (w < leftMargin) leftMargin = w;
        HScrollPos = (leftMargin * 100) / w;
    }
    if (HScrollPos < 0) HScrollPos = 0;
    if (HScrollPos > 100) HScrollPos = 100;
    SetScrollPos(SB_HORZ, HScrollPos, TRUE);
}

static char file_select_buffer[256];


#define xputc(c,f) putc((c)&0xff,f)

void CMainWindow::OnSaveas()
{
    CFileDialog FDialog(FALSE, "LOG", "SAVEFILE.LOG",
        OFN_HIDEREADONLY,
        "Log Files (*.LOG)|*.LOG|All Files (*.*)|*.*||", NULL);
    if (FDialog.DoModal() != IDOK) return;
    const char *p1 = FDialog.GetPathName();
    FILE *ofile = fopen(p1, "w");
    if (ofile == NULL)
    {   DisplayMsg("Could not write to file");
        return;
    }
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    for (int i=firstLine; i<=currentLine; i++)
    {   int n = txtLineLen[i & LINE_MASK];
        char *l = &txtBuffer[txtLine[i & LINE_MASK]];
        for (int j=0; j<n; j++) (void)xputc(*l++, ofile);
        (void)putc('\n', ofile);
    }
    fclose(ofile);
}

void CMainWindow::OnSaveSel()
{
    CFileDialog FDialog(FALSE, "LOG", "SAVESEL.LOG",
        OFN_HIDEREADONLY,
        "Log Files (*.LOG)|*.LOG|All Files (*.*)|*.*||", NULL);
    if (FDialog.DoModal() != IDOK) return;
    const char *p1 = FDialog.GetPathName();
    FILE *ofile = fopen(p1, "w");
    if (ofile == NULL)
    {   DisplayMsg("Could not write to file");
        return;
    }
    txtLineLen[currentLine & LINE_MASK] = currentLineLength;
    int i = PosLine(selStartPos), j, n;
    char *l;
    if (PosLine(selEndPos) == i)
    {   n = PosChar(selEndPos);
        l = &txtBuffer[txtLine[i & LINE_MASK]];
        for (j=PosChar(selStartPos); j<n; j++) (void)xputc(*l++, ofile);
        (void)putc('\n', ofile);
    }
    else
    {   n = txtLineLen[i & LINE_MASK];
        l = &txtBuffer[txtLine[i & LINE_MASK]];
        for (j=PosChar(selStartPos); j<n; j++) (void)xputc(*l++, ofile);
        (void)putc('\n', ofile);
        i++;
        for (; i<PosLine(selEndPos); i++)
        {   n = txtLineLen[i & LINE_MASK];
            l = &txtBuffer[txtLine[i & LINE_MASK]];
            for (j=0; j<n; j++) (void)xputc(*l++, ofile);
            (void)putc('\n', ofile);
        }
        n = PosChar(selEndPos);
        l = &txtBuffer[txtLine[i & LINE_MASK]];
        for (j=0; j<n; j++) (void)xputc(*l++, ofile);
        (void)putc('\n', ofile);
    }
    fclose(ofile);
}

void CMainWindow::OnTofile()
{
}

void CMainWindow::OnPrint()
{
    SetWindowText("OnPrint");
}

void CMainWindow::OnPrintSetup()
{
    SetWindowText("OnPrintSetup");
}

void CMainWindow::OnExit()
{
// Since "EXIT" from the menu is a fairly simple way to get out I will
// obey all the user`s registered exit functions.
    while (exitFunctionCount > 0) (*exitFunction[--exitFunctionCount])();
    returnCode = 0;
    int returnCode1 = theApp.ExitInstance();
    if (returnCode1 > returnCode) returnCode = returnCode1;
    theApp.m_pMainWnd->SendMessage(WM_CLOSE);
    //RWD I think we need to do this too...
    if (theApp.m_pMainWnd!=NULL)
        delete theApp.m_pMainWnd;
    if (brush != NULL)
        delete brush;
    if (thePicture != NULL)
        delete thePicture;
    exit(1);
}

// "Undo" is provided on the menu partly as provocation.  Until and unless I
// understand what operations OUGHT to be undo-able I can not easily
// implement anything useful.

//void CMainWindow::OnUndo()
//{
//}

// "Redraw" is provided so that if the screen gets scrambled for some
// reason (typically a bug in this code!) the user can go
//    ALT/E-R
// or select REDRAW from the EDIT menu and maybe get everything put
// back in a tidy state.

void CMainWindow::OnRedraw()
{
    Invalidate(TRUE);
    return;
}

// The TOP and BOTTOM items in the edit menu behave like the HOME and END
// keys on the keyboard, and just scroll the window to one or other extreme
// position.

void CMainWindow::OnTop()
{
    OnVScroll(SB_THUMBPOSITION, 0, NULL);
    OnHScroll(SB_THUMBPOSITION, 0, NULL);
    return;
}

void CMainWindow::OnBottom()
{
    if (currentLine - firstVisibleLine < nRows &&
        currentLine - firstVisibleLine >= nRows/2 &&
        currentLineLength - leftMargin < nCols) return;
    OnVScroll(PRIVATE_SET_VISIBLE_LINE, currentLine - nRows + 1, NULL);
    int left = currentLineLength - nCols + 1;
    OnHScroll(PRIVATE_SET_LEFT_MARGIN, left < 0 ? 0 : left, NULL);
    return;
}

BOOL CMainWindow::SetNewFont(CFont *newFont)
{
    CClientDC dc(this);
    dc.SelectObject(newFont);    // Be very certain that old one is not in use
// Since I have a fixed-pitch font it ought not to matter what character I
// measure here. I use "M" to stress that I want a maximum width & height.
// One could worry about fine distinctions between the several different
// measurement mechanisms that Windows provides, and in particular whether
// the size of a font is certain to be a neat whole number. I believe that
// for TrueType fonts that are fixed pitch the following MAY suffice.
    CSize charSize = dc.GetTextExtent("M", 1);
    TEXTMETRIC mainSize, symbolSize;
    if (!dc.GetTextMetrics(&mainSize)) return FALSE;
    newSymbolFont = new CFont();
    if (newSymbolFont == NULL) return FALSE;
    if (!newSymbolFont->CreateFont(
        mainSize.tmHeight, 0,
        0, 0,
        mainSize.tmWeight, mainSize.tmItalic,
        0, 0, SYMBOL_CHARSET,
        OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
        DEFAULT_QUALITY, DEFAULT_PITCH+FF_DONTCARE,
        "Symbol"))
    {   delete newSymbolFont;
        return FALSE;
    }
    LOGFONT logFont;
    newSymbolFont->GetObject(sizeof(logFont), &logFont);
    if (logFont.lfCharSet != SYMBOL_CHARSET)
    {   delete newSymbolFont;
        newSymbolFont = NULL;
    }
    else
    {   dc.SelectObject(newSymbolFont);
        if (!dc.GetTextMetrics(&symbolSize))
        {   delete newSymbolFont;
            return FALSE;
        }
        if (!dc.GetCharWidth(0, 255, symbolWidth))
        {   delete newSymbolFont;
            return FALSE;
        }
    }
    if (mainFont != NULL) delete mainFont;
    if (symbolFont != NULL) delete symbolFont;
    mainFont = newFont;
    symbolFont = newSymbolFont;
    charWidth  = charSize.cx;
    charHeight = charSize.cy;
    mainOffset = 0;
    if (symbolFont == 0) symbolOffset = 0;
    else symbolOffset = (mainSize.tmAscent - symbolSize.tmAscent);
// I adjust my "character height" to allow sufficient space for symbols
    int mainh = mainSize.tmAscent +
                mainSize.tmInternalLeading + mainSize.tmExternalLeading;
    int symh =  symbolFont == 0 ? mainh : symbolSize.tmAscent +
                symbolSize.tmInternalLeading + symbolSize.tmExternalLeading;
    int d = symh - mainh;
    if (d > 0)
    {   charHeight += d;
        mainOffset += d;
        symbolOffset += d;
    }
    if (symbolFont != 0)
    {   d = symbolSize.tmDescent - mainSize.tmDescent;
        if (d > 0) charHeight += d;
    }
    nRows = clientArea.Height() / charHeight;
    nCols = clientArea.Width()  / charWidth;
    AfterSizeChange();
    OnKillFocus(NULL); OnSetFocus(NULL);        // re-establish the caret
// If the user changes font I will re-draw the entire window.  This would
// be overkill if the new font was in fact identical to the old one, but
// I am not going to worry about that!
    Invalidate(TRUE);
    return TRUE;
}

void CMainWindow::OnFont()
{
    CFontDialog fontDialog;
    LOGFONT logFont;
    mainFont->GetObject(sizeof(logFont), &logFont);
    fontDialog.m_cf.Flags = CF_SCREENFONTS | CF_FIXEDPITCHONLY |
                            CF_ANSIONLY | CF_INITTOLOGFONTSTRUCT;
    fontDialog.m_cf.lpLogFont = &logFont;       // default for selection
// I will keep trying to obtain fonts from the user until I find one that
// can be properly installed.  Maybe it is unkind, but if a font as selected
// from the dialog box fails to be created I just restart the dialog without
// further explanation.
    for (;;)
    {   int w = fontDialog.DoModal();
        if (w == IDCANCEL) break;
        else if (w != IDOK) continue;
        LOGFONT *lf = fontDialog.m_cf.lpLogFont;
        CFont *newFont = new CFont();
        if (newFont != NULL &&
            lf != NULL &&
            newFont->CreateFont(
                lf->lfHeight, 0,
                0, 0,
                lf->lfWeight, lf->lfItalic,
                0, 0, ANSI_CHARSET,
                OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
                DEFAULT_QUALITY, FIXED_PITCH+FF_DONTCARE,
                lf->lfFaceName) != 0 &&
            SetNewFont(newFont)) break;
    }
}

DLLexport int cwin_pause = 0;

void CMainWindow::OnPause()
{
    cwin_pause = ~cwin_pause;
    if (cwin_pause) {
      SetWindowText("OnPause");
      while (cwin_pause) cwin_poll_window_manager();
    }
    SetWindowText(MainTitle);
}

void CMainWindow::OnStop()
{
    cwin_pause = ~(0);
    SetWindowText("OnPause");
    while (cwin_pause) cwin_poll_window_manager();
    SetWindowText(MainTitle);
}

void CMainWindow::OnContinue()
{
    cwin_pause = 0;
    SetWindowText(MainTitle);
}

void CMainWindow::OnGShow()
{
    if (thePicture == NULL) return;
    thePicture->ShowWindow(SW_SHOW);
    cwin_show();
}

void CMainWindow::OnGHide()
{
    if (thePicture == NULL) return;
    thePicture->ShowWindow(SW_HIDE);
    thePicture->isOnTop = FALSE;
}

void CMainWindow::OnGClear()
{
    if (thePicture == NULL) return;
    thePicture->Clear();
}

void CMainWindow::OnGNext()
{
    if (thePicture == NULL) return;
    thePicture->Clear();
    thePicture->Next();
}

void CMainWindow::OnGPrev()
{
    if (thePicture == NULL) return;
    thePicture->Clear();
    thePicture->Prev();
}


void myhelp(HWND m_hWnd, UINT type, DWORD data)
// This invoked the Microsoft Help Engine.  It indicates that the
// help file to be scanned is xxx.hlp where xxx.exe was the executable
// image for this application (including its full path name). If the
// full path name seems to be damaged in some what I cop out and use the
// fixed file name "csound.hlp" which will probably not do the user much
// good. But the Help Engine will report that it is not available and provides
// some opportunity for browsing to find an alternative.
{
    ::WinHelp(m_hWnd, "csound.hlp", type, data);
}

void CMainWindow::OnHelpContents()               // Start on contents page.
{
    myhelp(m_hWnd, HELP_CONTENTS, 0);
}

void CMainWindow::OnHelp()
{
    myhelp(m_hWnd, HELP_PARTIALKEY, (DWORD)"");  // Search through keywords.
}

void CMainWindow::OnHelpUsing()                  // "Help About Help".
{
    myhelp(m_hWnd, HELP_HELPONHELP, 0);
}

void CMainWindow::OnAbout()
{
    DoAboutBox();                       // I create the box in memory so I
                                        // do not need amuch of a resoure file
}

void CMainWindow::OnSetFocus(CWnd *pOldWnd)
{
    CreateSolidCaret(2*GetSystemMetrics(SM_CXBORDER), charHeight);
    CPoint cp;
    cp.x = charWidth*(currentLineLength - leftMargin);
    cp.y = charHeight*(currentLine - firstVisibleLine);
    SetCaretPos(cp);
    ShowCaret();
}

void CMainWindow::OnKillFocus(CWnd *pOldWnd)
{
    ::DestroyCaret();
}

void CMainWindow::OnSize(UINT nType, int cx, int cy)
{
    if (charWidth == 0) return;      // This is caution in case OnSize gets
    CRect newArea;                   // called before a font has been created.
    GetClientRect(&newArea);
    nRows = newArea.Height() / charHeight;
    nCols = newArea.Width() / charWidth;
    CRect r;
    if (newArea.right > clientArea.right)
    {   r.top = newArea.top; r.bottom = newArea.bottom;
        r.left = clientArea.right; r.right = newArea.right;
        InvalidateRect(&r, TRUE);
    }
    if (newArea.bottom > clientArea.bottom)
    {   r.top = clientArea.bottom; r.bottom = newArea.bottom;
        r.left = newArea.left; r.right = newArea.right;
        InvalidateRect(&r, TRUE);
    }
    clientArea = newArea;
    AfterSizeChange();
    ReWriteTitleText();
    OnBottom();
    if (nType == SIZE_MINIMIZED) OnGHide(); // Hide graphics
}

// end of "cwin.cpp"

#include "dialogs.h"
#include "soundio.h"

class CArg : public CDialog
{
        DECLARE_DYNAMIC(CArg)

// Construction
public:
        CArg(CWnd* pParent = NULL);    // standard constructor
        BOOL OnInitDialog(void);
        UINT numdevs;           //RWD.2.98: for Device selection control
        CString *devnames;

// Dialog Data
        //{{AFX_DATA(CArg)
        CString         m_orch;
        CString         m_score;
        CString         m_sound;
        int             m_format;
        int             m_size;
        int             m_graphics;
        int             m_util;
        int             m_log_output;
        int             m_postscript;
        int             m_nonstop;              //RWD.5.97
        int             m_play_on_exit;         //RWD.5.97
        int             m_wavedevice;           //RWD.2.98
        CComboBox       m_deviceselector;       //RWD.2.98
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
        void OnRButtonDblClk(UINT, CPoint);

        // Generated message map functions
        //{{AFX_MSG(CArg)
        afx_msg void OnAIFF() { m_format = TYP_AIFF;}
        afx_msg void OnWAV() { m_format = TYP_WAV;}
        afx_msg void OnIRCAM() { m_format = 0;}
        afx_msg void OnRAW() { m_format = -1;}
        afx_msg void OnByte() { m_size = AE_UNCH;}
        afx_msg void OnEight() { m_size = AE_CHAR;}
        afx_msg void OnSixteen() { m_size = AE_SHORT;}
        afx_msg void OnTwentyFour() { m_size = AE_24INT; }
        afx_msg void OnThirtytwo() { m_size = AE_LONG;}
        afx_msg void OnFloat() { m_size = AE_FLOAT;}
        afx_msg void OnNoGraph() { m_graphics = 0; }
        afx_msg void OnASCII() { m_graphics = 1; }
        afx_msg void OnGraphics() { m_graphics = 2;}
        afx_msg void OnProject();
        afx_msg void OnSliders();
        afx_msg void OnEnviron();
        afx_msg void OnOrchestra();
        afx_msg void OnScore();
        afx_msg void OnSoundfile();
        afx_msg void OnDAC();
        afx_msg void OnMIDI();
        afx_msg void OnExtras();
        afx_msg void OnUtils();
        afx_msg void OnHlp();
        afx_msg void OnPlay() { m_play_on_exit = (play_on_exit = !play_on_exit); }//RWD.5.97
        afx_msg void OnCont() { m_nonstop = (nonstop = !nonstop); } //RWD.5.97
        afx_msg void OnLog() { m_log_output = !m_log_output; }
        afx_msg void OnPostScript() { m_postscript = !m_postscript; }
        afx_msg void OnEditOrch();
        afx_msg void OnEditScore();
        afx_msg void OnEditWav();
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CArg, CDialog)

CArg::CArg(CWnd* pParent /*=NULL*/)
        : CDialog("DIALOG_1", pParent)
{
        //{{AFX_DATA_INIT(CArg)
        m_orch =     theApp.GetProfileString(csound_section, "Orch", "");
        m_score =    theApp.GetProfileString(csound_section, "Score", "");
        m_sound =    theApp.GetProfileString(csound_section, "Soundfile","test");
        m_format =   theApp.GetProfileInt(csound_section, "Format", TYP_WAV);
        m_size =     theApp.GetProfileInt(csound_section, "Size", AE_SHORT);
        m_graphics = theApp.GetProfileInt(csound_section, "Graphics", 2);
        m_util = 0;
        m_log_output = theApp.GetProfileInt(csound_section, "Logger", 0);
        m_postscript = theApp.GetProfileInt(csound_section, "Postscript", 0);
        nonstop = m_nonstop = theApp.GetProfileInt(csound_section, "NonStop", 0);          //RWD.5.97
        play_on_exit = m_play_on_exit = theApp.GetProfileInt(csound_section, "ExitPlay", 0);
        edit_on_exit = theApp.GetProfileInt(csound_section, "ExitEdit", 0);
                //RWD.2.98
        m_wavedevice = -1;
        //}}AFX_DATA_INIT
        devnames = NULL;
        numdevs = 0;
                                // Deal with directory environment
        CString env;
        env = theApp.GetProfileString(csound_section, "SSDIR");
        if (env != "") {
          CString aaa = "SSDIR=";
          aaa += env;
          putenv(aaa);
        }
        env = theApp.GetProfileString(csound_section, "SFDIR");
        if (env != "") {
          CString aaa = "SFDIR=";
          aaa += env;
          putenv(aaa);
        }
        env = theApp.GetProfileString(csound_section, "SADIR");
        if (env != "") {
          CString aaa = "SADIR=";
          aaa += env;
          putenv(aaa);
        }
}


BOOL CArg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(BUTTON_A, BUTTON_D,
                m_format == TYP_WAV ? BUTTON_B :
                m_format == TYP_AIFF ? BUTTON_A :
                m_format == 0 ? BUTTON_C :
                BUTTON_D);
        CheckRadioButton(BUTTON_U8, BUTTON_FL,
                m_size == AE_FLOAT ? BUTTON_FL :
                m_size == AE_LONG ? BUTTON_32 :
                m_size == AE_SHORT ? BUTTON_16 :
                m_size == AE_24INT ? BUTTON_24 :         /*RWD 5:2001 */
                m_size == AE_CHAR ? BUTTON_8 :
                BUTTON_U8);
        CheckRadioButton(BUTTON_NG, BUTTON_FG,
                m_graphics == 0 ? BUTTON_NG :
                m_graphics == 1 ? BUTTON_AG :
                BUTTON_FG);
        CheckDlgButton(BUTTON_LOG, m_log_output);
        CheckDlgButton(BUTTON_PS , m_postscript);
        CheckDlgButton(BUTTON_CNT , m_nonstop);          //RWD.5.97
        CheckDlgButton(BUTTON_PLY , m_play_on_exit);     //RWD.5.97
        CheckDlgButton(BUTTON_EW , edit_on_exit);
        CheckDlgButton(BUTTON_PK , peakchunks);
        m_deviceselector.ResetContent();
        if (devnames) {
          for (UINT i=0; i < numdevs;i++)
            m_deviceselector.AddString(devnames[i]);
        }
        else m_deviceselector.EnableWindow(FALSE);
        m_deviceselector.SetCurSel(0);  //init control to default wave device
        return TRUE;
}

void CArg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CArg)
            DDX_Text(pDX, ORCH, m_orch);
            DDX_Text(pDX, SCORE, m_score);
            DDX_Text(pDX, SOUND, m_sound);
            DDX_Check(pDX,BUTTON_CNT,m_nonstop);         //RWD.5.97
            DDX_Check(pDX,BUTTON_PLY,m_play_on_exit);    //RWD.5.97
                        //RWD.2.98
            DDX_Check(pDX,BUTTON_PK, peakchunks);
            DDX_Control(pDX,IDC_WAVEOUTDEV,m_deviceselector);
            DDX_CBIndex(pDX,IDC_WAVEOUTDEV,m_wavedevice);
        //}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CArg, CDialog)
        //{{AFX_MSG_MAP(CArg)
        ON_COMMAND(BUTTON_A, OnAIFF)
        ON_COMMAND(BUTTON_B, OnWAV)
        ON_COMMAND(BUTTON_C, OnIRCAM)
        ON_COMMAND(BUTTON_D, OnRAW)
        ON_COMMAND(BUTTON_U8, OnByte)
        ON_COMMAND(BUTTON_8,  OnEight)
        ON_COMMAND(BUTTON_16, OnSixteen)
        ON_COMMAND(BUTTON_24, OnTwentyFour)
        ON_COMMAND(BUTTON_32, OnThirtytwo)
        ON_COMMAND(BUTTON_FL, OnFloat)
        ON_COMMAND(BUTTON_NG, OnNoGraph)
        ON_COMMAND(BUTTON_AG, OnASCII)
        ON_COMMAND(BUTTON_FG, OnGraphics)
        ON_BN_CLICKED(PROJ, OnProject)
        ON_BN_CLICKED(SLIDE, OnSliders)
        ON_BN_CLICKED(ENVIRON, OnEnviron)
        ON_BN_CLICKED(BUTTON_OF, OnOrchestra)
  // ON_BN_DOUBLECLICKED(BUTTON_OF, OnOrchDblClk)
        ON_BN_CLICKED(BUTTON_SF, OnScore)
        ON_BN_CLICKED(BUTTON_DAC, OnDAC)
        ON_BN_CLICKED(BUTTON_MIDI, OnExtras)
  // ON_BN_DOUBLECLICKED(BUTTON_SF, OnScoreDblClk)
        ON_COMMAND(BUTTON_Sn, OnSoundfile)
        ON_COMMAND(OTHERS,    OnExtras)
        ON_COMMAND(UTIL,      OnUtils)
        ON_COMMAND(BUTTON_HLP,OnHlp)
        ON_COMMAND(BUTTON_PLY,OnPlay)
        ON_COMMAND(BUTTON_CNT,OnCont)
        ON_COMMAND(BUTTON_LOG,OnLog)
        ON_COMMAND(BUTTON_PS ,OnPostScript)
        ON_COMMAND(BUTTON_EO, OnEditOrch)
        ON_COMMAND(BUTTON_ES, OnEditScore)
        ON_COMMAND(BUTTON_EW, OnEditWav)
        ON_WM_RBUTTONDBLCLK()
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void CArg::OnHlp()
{
    ::WinHelp(m_hWnd, "csound.hlp", HELP_CONTENTS, 0);
}

// unsigned int PASCAL
//     Double_clicked (HWND hDlg, unsigned int message,
//                  unsigned int wParam, LONG lParam)
// {
//     switch (message) {
//     case 0xc924:
//       DisplayMsg("CFileDialog Double Click %x (%d)", wParam, wParam);
//       return TRUE;
//     default: DisplayMsg("CFileDialog %x %u %x (%d)", message, message, wParam, wParam);
//       return FALSE;
//     }
//     return FALSE;
// }

void CArg::OnProject()
{
    CFileDialog proj(TRUE, NULL, m_orch, OFN_FILEMUSTEXIST,
                     "Orchestra/ScoreFiles (*.orc,*.sco)|*.orc;*.sco|All Files (*.*)|*.*||",
                     this);
    proj.m_ofn.lpstrTitle = "Select Orchestra and Score";
    proj.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
    //    proj.m_ofn.lpfnHook = Double_clicked;
    if (proj.DoModal() != IDOK) return;
    CString ans = proj.GetPathName();
    CString ext = proj.GetFileExt();
    if (ext != "")
      ans = ans.Left(ans.GetLength()-ext.GetLength()-1);
    m_orch = ans + ".orc";
    m_score = ans + ".sco";
    if (m_format == TYP_WAV) m_sound = ans + ".wav";
    else if (m_format == TYP_AIFF) {
      if (m_size == AE_FLOAT) m_sound = ans + ".aic";
      else m_sound = ans + ".aif";
    }
    else if (m_format == 0) m_sound = ans + ".snd";
    else m_sound = ans + ".raw";
    SetDlgItemText(ORCH, m_orch);
    SetDlgItemText(SCORE, m_score);
    SetDlgItemText(SOUND, m_sound);
    return;
}

#include "CSliders.h"
CSlider **m_pModeless = NULL;
int numsliderdlgs = 0;

extern "C" {
  void DisplaySliders(int);
  int GetSliderValue(int);
  void SetSliderValue(int, int);
  void SetSliderMin(int, int);
  void SetSliderMax(int, int);
  void SetSliderLab(int, char *);
}

void DisplaySliders(int n)
{
    int i;
    if(--n < 0) {
        DisplayMsg("control: Sliders are numbered from 1 (one) and up");
        cwin_exit(1);
    }
    // CSlider dialog has scroll bars in batches of ten
    n = n/NUM_SLIDERS;
    // Get initial memory
    if (m_pModeless == NULL) {
      m_pModeless = (CSlider**)malloc((n+1)*sizeof(CSlider*));
      for (i = 0; i < n+1; i++) m_pModeless[i] = NULL;
      numsliderdlgs = n+1;
    }
    // ...or additional memory
    else if (n >= numsliderdlgs) {
      m_pModeless = (CSlider**)realloc(m_pModeless, (n+1)*sizeof(CSlider*));
      for (i = numsliderdlgs; i < n+1; i++) m_pModeless[i] = NULL;
      numsliderdlgs = n+1;
    }
    // Make a new dialog
    if (m_pModeless[n] == NULL) {
      m_pModeless[n] = new CSlider(theWindow);
      if (m_pModeless[n]->Create() == TRUE)
        m_pModeless[n]->ShowWindow(SW_SHOW);
    }
    else    // ...or just show it
      m_pModeless[n]->SetActiveWindow();
}

int GetSliderValue(int i)
{
    i--;
    return m_pModeless[i/NUM_SLIDERS]->m_num[i%NUM_SLIDERS];
}

void SetSliderValue(int i, int v)
{
    int batch, index;
    i--;
    batch = i / NUM_SLIDERS;
    index = i % NUM_SLIDERS;
    m_pModeless[batch]->m_num[index] = v;
    m_pModeless[batch]->OnHScroll(SB_THUMBPOSITION, v,
                                 &(m_pModeless[batch]->bar[index]));
}

void SetSliderMin(int i, int v)
{
    int batch, index;
    i--;
    batch = i / NUM_SLIDERS;
    index = i % NUM_SLIDERS;
    m_pModeless[batch]->m_min[index] = v;
    m_pModeless[batch]->bar[index].SetScrollRange(v,
        m_pModeless[batch]->m_max[index], TRUE);
}

void SetSliderMax(int i, int v)
{
    int batch, index;
    i--;
    batch = i / NUM_SLIDERS;
    index = i % NUM_SLIDERS;
    m_pModeless[batch]->m_max[index] = v;
    m_pModeless[batch]->bar[index].SetScrollRange(
        m_pModeless[batch]->m_min[index],
        v, TRUE);
}

void SetSliderLab(int i, char *title)
{
    int batch, index;
    i--;
    batch = i / NUM_SLIDERS;
    index = i % NUM_SLIDERS;
    m_pModeless[batch]->m_lab[index] = title;
    m_pModeless[batch]->SetDlgItemText(IDC_SLIDER1+3*index, title);
}

CButtons **m_pModelessB = NULL;
int numbuttondlgs = 0;

extern "C" {
  void DisplayButtons(int);
  int GetButton(int);
  int ClearButtons(int);
}

void DisplayButtons(int n)
{
    int i;
    if(--n < 0) {
        DisplayMsg("control: Buttons are numbered from 1 (one) and up");
        cwin_exit(1);
    }
    // CSlider dialog has scroll bars in batches of ten
    n = n/NUM_BUTTONS;
    // Get initial memory
    if (m_pModelessB == NULL) {
      m_pModelessB = (CButtons**)malloc((n+1)*sizeof(CButtons*));
      for (i = 0; i < n+1; i++) m_pModelessB[i] = NULL;
      numbuttondlgs = n+1;
    }
    // ...or additional memory
    else if (n >= numbuttondlgs) {
      m_pModelessB = (CButtons**)realloc(m_pModelessB, (n+1)*sizeof(CButtons*));
      for (i = numbuttondlgs; i < n+1; i++) m_pModelessB[i] = NULL;
      numbuttondlgs = n+1;
    }
    // Make a new dialog
    if (m_pModelessB[n] == NULL) {
      m_pModelessB[n] = new CButtons(theWindow, n+1);
      if (m_pModelessB[n]->Create() == TRUE)
        m_pModelessB[n]->ShowWindow(SW_SHOW);
    }
    else    // ...or just show it
      m_pModelessB[n]->SetActiveWindow();
}

int GetButton(int i)
{
    int ans;
    i--;
    ans = m_pModelessB[i/NUM_BUTTONS]->m_button[i%NUM_BUTTONS];
    m_pModelessB[i/NUM_BUTTONS]->m_button[i%NUM_BUTTONS] = 0;
    return ans;
}

CChecks **m_pModelessC = NULL;
int numcheckdlgs = 0;

extern "C" {
  void DisplayChecks(int);
  int GetCheck(int);
}

void DisplayChecks(int n)
{
    int i;
    if(--n < 0) {
        DisplayMsg("control: Checks are numbered from 1 (one) and up");
        cwin_exit(1);
    }
    // CSlider dialog has scroll bars in batches of ten
    n = n/NUM_CHECKS;
    // Get initial memory
    if (m_pModelessC == NULL) {
      m_pModelessC = (CChecks**)malloc((n+1)*sizeof(CChecks*));
      for (i = 0; i < n+1; i++) m_pModelessC[i] = NULL;
      numcheckdlgs = n+1;
    }
    // ...or additional memory
    else if (n >= numcheckdlgs) {
      m_pModelessC = (CChecks**)realloc(m_pModelessC, (n+1)*sizeof(CChecks*));
      for (i = numcheckdlgs; i < n+1; i++) m_pModelessC[i] = NULL;
      numcheckdlgs = n+1;
    }
    // Make a new dialog
    if (m_pModelessC[n] == NULL) {
      m_pModelessC[n] = new CChecks(theWindow);
      if (m_pModelessC[n]->Create() == TRUE)
        m_pModelessC[n]->ShowWindow(SW_SHOW);
    }
    else    // ...or just show it
      m_pModelessC[n]->SetActiveWindow();
}

int GetCheck(int i)
{
    i--;
    return m_pModelessC[i/NUM_CHECKS]->m_check[i%NUM_CHECKS];
}

extern "C" {
  void DisplayText(int, char *);
  void DeleteText(int);
}

void DisplayText(int which, char *text)
{
  /* For now ignor which  */
  MessageBox(NULL , text, "Flashtext", MB_ICONINFORMATION);
}

void DeleteText(int which)
{
}

void CArg::OnSliders()
{
    DisplaySliders(1);
}

class CSenv : public CDialog
{
        DECLARE_DYNAMIC(CSenv)

// Construction
public:
        CSenv(void);    // standard constructor
// Dialog Data
        //{{AFX_DATA(CSenv)
            CString m_ssdir;
            CString m_sfdir;
            CString m_sadir;
  //            CString m_mididev;
  //            CString m_csnostop;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
  //        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(CSenv)
//         afx_msg void OnSS();
//         afx_msg void OnSF();
//         afx_msg void OnSA();
        //}}AFX_MSG
       DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CSenv, CDialog)

CSenv::CSenv(void)
        : CDialog("DIALOG_ENV", NULL)
{
        //{{AFX_DATA_INIT(CSenv)
    m_ssdir = getenv("SSDIR");
    m_sfdir = getenv("SFDIR");
    m_sadir = getenv("SADIR");
    //    m_mididev = getenv("MIDIOUTDEV");
    //    m_csnostop = getenv("CSNOSTOP");
       //}}AFX_DATA_INIT
}


void CSenv::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSenv)
            DDX_Text(pDX, SE_SSDIR, m_ssdir);
            DDX_Text(pDX, SE_SFDIR, m_sfdir);
            DDX_Text(pDX, SE_SADIR, m_sadir);
            //            DDX_Text(pDX, SE_MIDIDEV, m_mididev);
            //            DDX_Text(pDX, SE_NOSTOP, m_csnostop);
        //}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSenv, CDialog)
        //{{AFX_MSG_MAP(CSenv)
//          ON_BN_CLICKED(SE_SSBUTTON, OnSS)
//          ON_BN_CLICKED(SE_SFBUTTON, OnSF)
//          ON_BN_CLICKED(SE_SABUTTON, OnSA)
        //}}AFX_MSG_MAP
  ON_COMMAND(IDNO, OnCancel)
  ON_COMMAND(IDOK, OnOK)
END_MESSAGE_MAP()

//  void CSenv::OnSS()
//  {
//      CFileDialog proj(TRUE, NULL, m_ssdir, OFN_FILEMUSTEXIST,
//                   "Sample Directory|*.*||",
//                   this);
//      proj.m_ofn.lpstrTitle = "Select Samples Directory";
//      proj.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
//      if (proj.DoModal() != IDOK) return;
//      m_ssdir = proj.GetPathName();
//      SetDlgItemText(SE_SSDIR, m_ssdir);
//      return;
//  }

//  void CSenv::OnSF()
//  {
//      CFileDialog proj(TRUE, NULL, m_sfdir, OFN_FILEMUSTEXIST,
//                   "SoundFile Directory|All Files (*.*)|*.*||",
//                   this);
//      proj.m_ofn.lpstrTitle = "Select Sound File Directory";
//      proj.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
//      if (proj.DoModal() != IDOK) return;
//      m_sfdir = proj.GetPathName();
//      SetDlgItemText(SE_SFDIR, m_sfdir);
//      return;
//  }

//  void CSenv::OnSA()
//  {
//      CFileDialog proj(TRUE, NULL, m_sadir, OFN_FILEMUSTEXIST,
//                   "Analysis Directory|All Files (*.*)|*.*||",
//                   this);
//      proj.m_ofn.lpstrTitle = "Select Analysis Directory";
//      proj.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
//      if (proj.DoModal() != IDOK) return;
//      m_sadir = proj.GetPathName();
//      SetDlgItemText(SE_SADIR, m_sadir);
//      return;
//  }


void CArg::OnEnviron()
{
    CSenv xxx;
    if (xxx.DoModal() != IDOK) return;
    CString aaa;
    aaa = "SSDIR=";
    aaa += xxx.m_ssdir;
    putenv(aaa);
    aaa = "SFDIR=";
    aaa += xxx.m_sfdir;
    putenv(aaa);
    aaa = "SADIR=";
    aaa += xxx.m_sadir;
    putenv(aaa);
    theApp.WriteProfileString(csound_section, "SSDIR", xxx.m_ssdir);
    theApp.WriteProfileString(csound_section, "SFDIR", xxx.m_sfdir);
    theApp.WriteProfileString(csound_section, "SADIR", xxx.m_sadir);
}


void CArg::OnOrchestra()
{
    CFileDialog orc(TRUE, NULL, m_orch, OFN_FILEMUSTEXIST,
                    "Orchestra Files (*.orc)|*.orc|Unified Files (*.csd)|*.csd|All Files (*.*)|*.*||",
                    this);
    orc.m_ofn.lpstrTitle = "Select Orchestra";
    orc.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
    //    orc.m_ofn.lpfnHook = Double_clicked;
    if (orc.DoModal() != IDOK) return;
    m_orch = orc.GetPathName();
    SetDlgItemText(ORCH, m_orch);
    return;
}

void CArg::OnScore()
{
    CFileDialog sco(TRUE, NULL, m_score, OFN_FILEMUSTEXIST,
                    "Score Files (*.sco)|*.sco|All Files (*.*)|*.*||",
                    this);
    sco.m_ofn.lpstrTitle = "Select Score";
    sco.m_ofn.Flags |=  OFN_LONGNAMES;
    if (sco.DoModal() != IDOK) return;
    m_score = sco.GetPathName();
    SetDlgItemText(SCORE, m_score);
    return;
}

void CArg::OnDAC()
{
    m_sound = "dac";
    SetDlgItemText(SOUND, m_sound);
    return;
}

/*RWD 3:2000 added afc and aifc extensions (the two recommended by Apple) */
void CArg::OnSoundfile()
{
    CFileDialog snf(TRUE, NULL, m_sound, 0,
                    "WAV Files (*.wav)|*.wav|AIFF Files (*.aif;*.aic;*.afc;*.aifc)|*.aif;*.aic;*.afc;*.aifc|Raw (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    snf.m_ofn.lpstrTitle = "Select Output";
    snf.m_ofn.Flags |= OFN_HIDEREADONLY | OFN_LONGNAMES;
    if (snf.DoModal() != IDOK) return;
    m_sound = snf.GetPathName();
    SetDlgItemText(SOUND, m_sound);
    return;
}

#include <stddef.h>
#include <process.h>
void CArg::OnEditOrch()
{
//     const MSG *mm = GetCurrentMessage();
//     DisplayMsg("Parameters %x %x %x", mm->wParam, mm->lParam, mm->time);
    CString command = theApp.GetProfileString(csound_section, "OrchEdit");
    //"C:\\emacs-19.33\\bin\\runemacs.exe"
    char name[120];
    if (command=="") {          // Get name of editor
      CFileDialog orc(TRUE, "exe", NULL,
                      OFN_NOCHANGEDIR | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY,
                      "Executable Files (*.exe)|*.exe|All Files (*.*)|*.*||",
                      this);
      orc.m_ofn.lpstrTitle = "Select Orchestra Editor";
      orc.m_ofn.lpstrInitialDir = "C:\\WINDOWS";
      if (orc.DoModal() != IDOK) return;
      command = orc.GetPathName();
      theApp.WriteProfileString(csound_section, "OrchEdit", command);
    }
    strcpy(name,command);
    spawnl(P_NOWAIT, name, name, (LPCSTR)m_orch, NULL);
}


void CArg::OnEditScore()
{
    CString command = theApp.GetProfileString(csound_section, "ScoreEdit");
    //"C:\\emacs-19.33\\bin\\runemacs.exe"
    char name[120];
    if (command=="") {          // Get name of editor
      CFileDialog orc(TRUE, "exe", NULL,
                      OFN_NOCHANGEDIR | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY,
                      "Executable Files (*.exe)|*.exe|All Files (*.*)|*.*||",
                      this);
      orc.m_ofn.lpstrTitle = "Select Score Editor";
      orc.m_ofn.lpstrInitialDir = "C:\\WINDOWS";
      if (orc.DoModal() != IDOK) return;
      command = orc.GetPathName();
      theApp.WriteProfileString(csound_section, "ScoreEdit", command);
    }
    strcpy(name,command);
    spawnl(P_NOWAIT, name, name, (LPCSTR)m_score, NULL);
}

void CArg::OnEditWav()
{
    CString command = theApp.GetProfileString(csound_section, "SndFileEdit");
    //"C:\\emacs-19.33\\bin\\runemacs.exe"
    if (command=="") {          // Get name of editor
      CFileDialog orc(TRUE, "exe", NULL,
                      OFN_NOCHANGEDIR | OFN_FILEMUSTEXIST | OFN_HIDEREADONLY,
                      "Executable Files (*.exe)|*.exe|All Files (*.*)|*.*||",
                      this);
      orc.m_ofn.lpstrTitle = "Select SoundFile Editor";
      orc.m_ofn.lpstrInitialDir = "C:\\WINDOWS";
      if (orc.DoModal() != IDOK) {
        CheckDlgButton(BUTTON_EW, 0);
        return;
      }
        CheckDlgButton(BUTTON_EW, 1);
      command = orc.GetPathName();
      theApp.WriteProfileString(csound_section, "SndFileEdit", command);
    }
    edit_on_exit = ! edit_on_exit;
}

void CArg::OnRButtonDblClk(UINT nFlags, CPoint point)
{                               // Wipe out memory
    theApp.WriteProfileString(csound_section, "OrchEdit", "");
    theApp.WriteProfileString(csound_section, "ScoreEdit", "");
    theApp.WriteProfileString(csound_section, "SndFileEdit", "");
    CheckDlgButton(BUTTON_EW, 0);
    edit_on_exit = 0;
    theApp.WriteProfileInt(csound_section, "ExitEdit", 0);
    cwin_puts("Reset editors\n");
}


class CSextras : public CDialog
{
        DECLARE_DYNAMIC(CSextras)

// Construction
public:
        CSextras(CWnd* pParent = NULL);    // standard constructor
// Dialog Data
        //{{AFX_DATA(CSextras)
            BOOL m_cscore;
            BOOL m_inittime;
            BOOL m_nosound;
            BOOL m_verbos;
            BOOL m_rewrite;
            BOOL m_scot;
            int  m_heart;
            BOOL m_notify;
            int  m_srate;
            int  m_krate;
            int  m_msglev;
            int  m_beats;
            BOOL m_keep_tmp;
  //            int  m_pedal;
            int  m_buffer;
            int  m_lbuffer;
            CString m_midifile;
            CString m_extract;
            CString m_input;
            int         m_midinum;
            CComboBox   m_midiselector;
            int     m_trkend;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(CSextras)
//            afx_msg void OnCscore(void) { m_cscore = ! m_cscore; }
//            afx_msg void OnInittime(void) { m_inittime = ! m_inittime; }
//            afx_msg void OnNoSound(void) { m_nosound = ! m_nosound; }
//            afx_msg void OnVerbos(void) { m_verbos = ! m_verbos; }
//            afx_msg void OnRewrite(void) { m_rewrite = ! m_rewrite; }
//            afx_msg void OnScot(void) { m_scot = ! m_scot; }
//            afx_msg void OnNotify(void) { m_notify = ! m_notify; }
            afx_msg void OnMidifile(void);
            afx_msg void OnXtrfile(void);
            afx_msg void OnInputfile(void);
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CSextras, CDialog)

CSextras::CSextras(CWnd* pParent /*=NULL*/)
        : CDialog("DIALOG_2", pParent)
{
        //{{AFX_DATA_INIT(CSextras)
            m_cscore = theApp.GetProfileInt(csound_section, "Cscore", FALSE);
            m_inittime = theApp.GetProfileInt(csound_section, "Inittime", FALSE);
            m_nosound = theApp.GetProfileInt(csound_section, "Nosound", FALSE);
            m_verbos = theApp.GetProfileInt(csound_section, "Verbos", FALSE);
            m_rewrite = theApp.GetProfileInt(csound_section, "Rewrite", FALSE);
            m_scot = theApp.GetProfileInt(csound_section, "Scot", FALSE);
            m_heart = theApp.GetProfileInt(csound_section, "Heartbeat", 0);
            m_notify = theApp.GetProfileInt(csound_section, "Notify", FALSE);
            m_srate = theApp.GetProfileInt(csound_section, "Srate", -1);
            m_krate = theApp.GetProfileInt(csound_section, "Krate", -1);
            m_msglev = theApp.GetProfileInt(csound_section, "Msglev", 7);
            m_beats = theApp.GetProfileInt(csound_section, "Beats", -1);
            m_keep_tmp = theApp.GetProfileInt(csound_section, "KpTmp", FALSE);
            //            m_pedal = theApp.GetProfileInt(csound_section, "Pedal", 128);
            m_buffer = theApp.GetProfileInt(csound_section, "Buffer", 1024);
            m_lbuffer = theApp.GetProfileInt(csound_section, "LBuffer", 512);
            m_midifile = theApp.GetProfileString(csound_section, "MIDIFile", "");
            m_extract = theApp.GetProfileString(csound_section, "Extract", "");
            m_input = theApp.GetProfileString(csound_section, "Input", "");
            m_trkend = theApp.GetProfileInt(csound_section, "TrackEnd", 0);
        //}}AFX_DATA_INIT
}


BOOL CSextras::OnInitDialog(void)
{
    MIDIINCAPS caps;
    CDialog::OnInitDialog();
    m_midiselector.ResetContent();
    int midinum = midiInGetNumDevs();
    if (midinum==0) {
      m_midiselector.EnableWindow(FALSE);
    } 
    else {
      for (int j=0;j<midinum; j++) {
        midiInGetDevCaps(j, &caps, sizeof(caps));
        m_midiselector.AddString(caps.szPname);
      }
    }
    m_midiselector.SetCurSel(0);    //init control to default wave device
    return TRUE;
}

void CSextras::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSextras)
            DDX_Text(pDX, X_SRATE, m_srate);
            DDX_Text(pDX, X_KRATE, m_krate);
            DDX_Text(pDX, X_MSGLEV, m_msglev);
            DDV_MinMaxInt(pDX, m_msglev, 0, 15);
            DDX_Text(pDX, X_BEATS, m_beats);
            //            DDX_Text(pDX, X_PEDAL, m_pedal);
            //            DDV_MinMaxInt(pDX, m_pedal, 0, 128);
            DDX_Text(pDX, X_BUFFER, m_buffer);
            DDV_MinMaxInt(pDX, m_buffer, 0, 0x10000);
            DDX_Text(pDX, X_LBUFFER, m_lbuffer);
            DDV_MinMaxInt(pDX, m_lbuffer, 0, 0x10000);
            DDX_Text(pDX, X_MIDI, m_midifile);
            DDX_Text(pDX, X_EXTRACT, m_extract);
            DDX_Text(pDX, X_INPUT, m_input);
            DDX_Check(pDX, X_CSCORE, m_cscore);
            DDX_Check(pDX, X_INITTIME, m_inittime);
            DDX_Check(pDX, X_NOSOUND, m_nosound);
            DDX_Check(pDX, X_VERBOS, m_verbos);
            DDX_Check(pDX, X_REWRITE, m_rewrite);
            DDX_Check(pDX, X_SCOT, m_scot);
            DDX_Text(pDX, X_HEART, m_heart);
            DDV_MinMaxInt(pDX, m_heart, 0, 4);
            DDX_Check(pDX, X_NOTIFY, m_notify);
            DDX_Check(pDX, X_KEEPTMP, m_keep_tmp);
            DDX_Control(pDX,X_MIDIINDEV, m_midiselector);
            DDX_CBIndex(pDX,X_MIDIINDEV, m_midinum);
            DDX_Check(pDX, X_TRKEND, m_trkend);
        //}}AFX_DATA_MAP
}

void CSextras::OnMidifile(void)
{
    CFileDialog midi(TRUE, NULL, m_midifile, OFN_FILEMUSTEXIST,
                    "MIDI Files (*.mid; *.mf)|*.mid;*.mf|All Files (*.*)|*.*||",
                    this);
    midi.m_ofn.lpstrTitle = "Select MidiFile";
    midi.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
    if (midi.DoModal() != IDOK) return;
    m_midifile = midi.GetPathName();
    SetDlgItemText(X_MIDI, m_midifile);
    return;
}

void CSextras::OnXtrfile(void)
{
    CFileDialog sco(TRUE, NULL, m_extract, 0,
                    "Score Files (*.sco)|*.sco|All Files (*.*)|*.*||",
                    this);
    if (sco.DoModal() != IDOK) return;
    m_extract = sco.GetPathName();
    SetDlgItemText(X_EXTRACT, m_extract);
    return;
}

/*RWD 3:2000 added afc and aifc extension to list (the two recommended by Apple) */
void CSextras::OnInputfile(void)
{
    CFileDialog soundin(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "Sound Files (*.wav)|*.wav|Sound Files (*.aif;*.aic;*.afc;*.aifc)|*.aif;*.aic;*.afc;*.aifc|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    if (soundin.DoModal() != IDOK) return;
    m_input = soundin.GetPathName();
    SetDlgItemText(X_INPUT, m_input);
    return;
}

BEGIN_MESSAGE_MAP(CSextras, CDialog)
        //{{AFX_MSG_MAP(CSextras)
//        ON_COMMAND(X_CSCORE, OnCscore)
//        ON_COMMAND(X_INITTIME, OnInittime)
//        ON_COMMAND(X_NOSOUND, OnNoSound)
//        ON_COMMAND(X_VERBOS, OnVerbos)
//        ON_COMMAND(X_REWRITE, OnRewrite)
//        ON_COMMAND(X_SCOT, OnScot)
//        ON_COMMAND(X_HEART, OnHeart)
//        ON_COMMAND(X_NOTIFY, OnNotify)
        ON_COMMAND(X_MIDIFILE, OnMidifile)
        ON_COMMAND(X_XTRFILE, OnXtrfile)
        ON_COMMAND(X_IN, OnInputfile)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()


static int myScotScore;
static char orchname[256];
static char sconame[256];
static char outname[256];
static char midifile[256];
//RWD: main.c needs to get at this one, so its now defined there
//otherwise, have to write silly access func, to overcome c++ name mangling...
static char extractfile[256];
static char inputfile[256];

void CArg::OnExtras(void)
{
    CSextras xxx(this);
    if (xxx.DoModal() != IDOK) return;
    O.heartbeat = xxx.m_heart;
    O.usingcscore =xxx.m_cscore;
    O.initonly = xxx.m_inittime;
    O.sfwrite = !xxx.m_nosound;
    O.odebug = odebug = xxx.m_verbos;
    O.rewrt_hdr = xxx.m_rewrite;
    myScotScore = xxx.m_scot;
    O.termifend = xxx.m_notify;
    if (xxx.m_srate != -1) O.sr_override = xxx.m_srate;
    if (xxx.m_krate != -1) O.kr_override = xxx.m_krate;
    O.msglevel = xxx.m_msglev;
    if (xxx.m_beats != -1) {
                O.cmdTempo = xxx.m_beats;
                O.Beatmode = 1;
        }
    keep_tmp = xxx.m_keep_tmp;
    O.oMaxLag = xxx.m_buffer;
    O.outbufsamps =  xxx.m_lbuffer;
    if (strcmp(xxx.m_midifile, "") != 0) {
        strcpy(midifile, xxx.m_midifile);
        O.FMidiname = midifile;
        O.FMidiin = 1;
    }
    if (strcmp(xxx.m_extract, "") != 0) {
        strcpy(extractfile, xxx.m_extract);
    }
    if (strcmp(xxx.m_input,"") != 0) {
        strcpy(inputfile,xxx.m_input);
        O.infilename = inputfile;
        O.sfread = 1;
    }
        if (/*xxx.m_midiselector!=NULL && */xxx.m_midiselector.GetCount()>0) {
      if (xxx.m_midiselector.GetCurSel()!=0) {  // If realtime midi
        //        O.Midiin = 1;
        O.Midiin = xxx.m_midinum;
      }
    }
    theApp.WriteProfileInt(csound_section, "Cscore", xxx.m_cscore);
    theApp.WriteProfileInt(csound_section, "Inittime", xxx.m_inittime);
    theApp.WriteProfileInt(csound_section, "Nosound", xxx.m_nosound);
    theApp.WriteProfileInt(csound_section, "Verbos", xxx.m_verbos);
    theApp.WriteProfileInt(csound_section, "Rewrite", xxx.m_rewrite);
    theApp.WriteProfileInt(csound_section, "Scot", xxx.m_scot);
    theApp.WriteProfileInt(csound_section, "Heartbeat", xxx.m_heart);
    theApp.WriteProfileInt(csound_section, "Notify", xxx.m_notify);
    theApp.WriteProfileInt(csound_section, "Srate", xxx.m_srate);
    theApp.WriteProfileInt(csound_section, "Krate", xxx.m_krate);
    theApp.WriteProfileInt(csound_section, "Msglev", xxx.m_msglev);
    theApp.WriteProfileInt(csound_section, "Beats", xxx.m_beats);
    theApp.WriteProfileInt(csound_section, "KpTmp", xxx.m_keep_tmp);
    theApp.WriteProfileInt(csound_section, "Buffer", xxx.m_buffer);
    theApp.WriteProfileInt(csound_section, "LBuffer", xxx.m_lbuffer);
    theApp.WriteProfileString(csound_section, "MIDIFile", xxx.m_midifile);
    theApp.WriteProfileString(csound_section, "Extract", xxx.m_extract);
    theApp.WriteProfileString(csound_section, "Input", xxx.m_input);
    theApp.WriteProfileInt(csound_section, "MidiIn", xxx.m_midiselector.GetCurSel());
    theApp.WriteProfileInt(csound_section, "TrkEnd", xxx.m_trkend);
}

class CSmidi : public CDialog
{
        DECLARE_DYNAMIC(CSmidi)

// Construction
public:
        CSmidi(CWnd* pParent = NULL);    // standard constructor
// Dialog Data
        //{{AFX_DATA(CSmidi)
            CString m_midifile;
            int         m_midinum;
            CComboBox   m_midiselector;
            int     m_trkend;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(CSmidi)
            afx_msg void OnMidifile(void);
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CSmidi, CDialog)

CSmidi::CSmidi(CWnd* pParent /*=NULL*/)
        : CDialog("DIALOG_MIDI", pParent)
{
        //{{AFX_DATA_INIT(CSmidi)
            m_midifile = theApp.GetProfileString(csound_section, "MIDIFile", "");
            m_trkend = theApp.GetProfileInt(csound_section, "TrackEnd", 0);
        //}}AFX_DATA_INIT
}


BOOL CSmidi::OnInitDialog(void)
{
    MIDIINCAPS caps;
    CDialog::OnInitDialog();
    m_midiselector.ResetContent();
    int midinum = midiInGetNumDevs();
    if (midinum==0) {
      m_midiselector.EnableWindow(FALSE);
    } 
    else {
      for (int j=0;j<midinum; j++) {
        midiInGetDevCaps(j, &caps, sizeof(caps));
        m_midiselector.AddString(caps.szPname);
      }
    }
    m_midiselector.SetCurSel(0);    //init control to default wave device
    return TRUE;
}

void CSmidi::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSmidi)
            DDX_Text(pDX, X_MIDI, m_midifile);
            DDX_Control(pDX,X_MIDIINDEV, m_midiselector);
            DDX_CBIndex(pDX,X_MIDIINDEV, m_midinum);
            DDX_Check(pDX, X_TRKEND, m_trkend);
        //}}AFX_DATA_MAP
}

void CSmidi::OnMidifile(void)
{
    CFileDialog midi(TRUE, NULL, m_midifile, OFN_FILEMUSTEXIST,
                    "MIDI Files (*.mid; *.mf)|*.mid;*.mf|All Files (*.*)|*.*||",
                    this);
    midi.m_ofn.lpstrTitle = "Select MidiFile";
    midi.m_ofn.Flags |= OFN_LONGNAMES; /* | OFN_ENABLEHOOK */;
    if (midi.DoModal() != IDOK) return;
    m_midifile = midi.GetPathName();
    SetDlgItemText(X_MIDI, m_midifile);
    return;
}

BEGIN_MESSAGE_MAP(CSmidi, CDialog)
        //{{AFX_MSG_MAP(CSmidi)
        ON_COMMAND(X_MIDIFILE, OnMidifile)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void CArg::OnMIDI()
{
    CSmidi xxx(this);
    if (xxx.DoModal() != IDOK) return;
    if (strcmp(xxx.m_midifile, "") != 0) {
        strcpy(midifile, xxx.m_midifile);
        O.FMidiname = midifile;
        O.FMidiin = 1;
    }
    if (/*xxx.m_midiselector!=NULL && */xxx.m_midiselector.GetCount()>0) {
      if (xxx.m_midiselector.GetCurSel()!=0) {  // If realtime midi
        O.Midiin = xxx.m_midiselector.GetCurSel();
      }
    }
    theApp.WriteProfileString(csound_section, "MIDIFile", xxx.m_midifile);
    theApp.WriteProfileInt(csound_section, "MidiIn", xxx.m_midiselector.GetCurSel());
    theApp.WriteProfileInt(csound_section, "TrkEnd", xxx.m_trkend);
}



class CUtils : public CDialog
{
        DECLARE_DYNAMIC(CUtils)

// Construction
public:
        CUtils(CWnd* pParent = NULL);    // standard constructor
// Dialog Data
        //{{AFX_DATA(CUtils)
            int which;
        //}}AFX_DATA

// Implementation
protected:
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(CUtils)
            afx_msg void OnOpcodes(void) { which = U_OPCODES; }
            afx_msg void OnAllcodes(void) { which = U_ALLCODES; }
            afx_msg void OnHetro(void) { which = U_HETRO; }
            afx_msg void OnLpanal(void) { which = U_LPANAL; }
            afx_msg void OnPvanal(void) { which = U_PVANAL; }
            afx_msg void OnSndinfo(void) { which = U_SNDINFO; }
            afx_msg void OnCvanal(void) { which = U_CVANAL; }
            afx_msg void OnPvlook(void) { which = U_PVLOOK; }
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()
};

IMPLEMENT_DYNAMIC(CUtils, CDialog)

CUtils::CUtils(CWnd* pParent /*=NULL*/)
        : CDialog("DIALOG_3", pParent)
{
        //{{AFX_DATA_INIT(CUtils)
            which = 0;
        //}}AFX_DATA_INIT
}

BEGIN_MESSAGE_MAP(CUtils, CDialog)
        //{{AFX_MSG_MAP(CArg)
        ON_COMMAND(U_OPCODES, OnOpcodes)
        ON_COMMAND(U_ALLCODES, OnAllcodes)
        ON_COMMAND(U_HETRO, OnHetro)
        ON_COMMAND(U_LPANAL, OnLpanal)
        ON_COMMAND(U_PVANAL, OnPvanal)
        ON_COMMAND(U_SNDINFO, OnSndinfo)
        ON_COMMAND(U_CVANAL, OnCvanal)
        ON_COMMAND(U_PVLOOK, OnPvlook)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()



BOOL CUtils::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(U_HETRO, U_SNDINFO, U_SNDINFO);
        which = U_SNDINFO;
        return TRUE;
}

void CArg::OnUtils(void)
{
    CUtils yyy(this);
    if (yyy.DoModal() != IDOK) return;
    m_util = yyy.which;
    CDialog::EndDialog(IDOK);
}

void cwin_args(char **porchname, char **psconame, char **pxfile)
{
    int i;
        //RWD.2.98
    int numdevs;
    char buf[80];
    CString *pNames = 0;
    CArg another(theWindow);

//RWD.2.98 init dlg with WaveOut device names, if any, else disable the control
    numdevs =  getWaveOutDevices();
    another.numdevs = numdevs;
    if (numdevs <= 0);
//      another.m_deviceselector.EnableWindow(FALSE);
    else {
      pNames = new CString[numdevs];
      //load dialog with device names: dialog init will copy to control
      for (int i=0; i < numdevs; i++){
        buf[0] = '\0';
        getWaveOutName(i, buf);
        pNames[i] = (const char *)buf;
      }
    }
    another.devnames = pNames;   //NB if exit is called, we will never delete these!
    //RWD: get Extras profile data before opending dialog
    O.heartbeat= theApp.GetProfileInt(csound_section, "Heartbeat",0);
    O.usingcscore = theApp.GetProfileInt(csound_section,"Cscore",FALSE);
    O.initonly = theApp.GetProfileInt(csound_section, "Inittime",FALSE);
    O.sfwrite = !theApp.GetProfileInt(csound_section, "Nosound",FALSE);
    O.odebug = odebug = theApp.GetProfileInt(csound_section, "Verbos",FALSE);
    O.rewrt_hdr = theApp.GetProfileInt(csound_section, "Rewrite",FALSE);
    myScotScore = theApp.GetProfileInt(csound_section, "Scot",FALSE);
    O.termifend = theApp.GetProfileInt(csound_section, "Notify",FALSE);
        //RWD
        //how do I SET these correctly ?
        //O.sr_override = theApp.GetProfileInt(csound_section, "Srate",-1);
        //O.kr_override = theApp.GetProfileInt(csound_section, "Krate",-1);
    O.cmdTempo = theApp.GetProfileInt(csound_section, "Beats",-1);
    //    O.SusPThresh = theApp.GetProfileInt(csound_section, "Pedal",128);
        //RWD: for this one, use defined constant
    O.oMaxLag = theApp.GetProfileInt(csound_section, "Buffer", IODACSAMPS);
    O.outbufsamps = theApp.GetProfileInt(csound_section, "LBuffer", IODACSAMPS/2);
    O.msglevel = theApp.GetProfileInt(csound_section, "Msglev", 7);
    strcpy(midifile, (const char *)theApp.GetProfileString(csound_section, "MIDIFile",""));
    O.FMidiname = midifile;
    strcpy(extractfile, (const char *)theApp.GetProfileString(csound_section, "Extract",""));
        //RWD: not sure what should happen to that...
        // I have assigned it to 'xfilename' in main.c, in the reinit (reentry) block
    strcpy(inputfile, (const char *)theApp.GetProfileString(csound_section, "Input",""));
    O.infilename = inputfile;
    while (1) {
      i = another.DoModal();
      if (i != IDOK) {
       //RWD must destroy dlg box before jumping out
       //this will delete the local CStrings properly
          another.~CArg();
          nonstop = 0;          //RWD.5.97 so CANCEL really exits!
              play_on_exit = 0; // No need to play non-file
              edit_on_exit = 0; // No need to play non-file
          if (pNames)
            delete [] pNames;  //RWD.2.98
          cwin_exit(1);         //RWD ? really want to return FALSE
      }
      if (another.m_util != 0) {
        play_on_exit = 0;
        edit_on_exit = 0;       // No need to play non-file
        switch (another.m_util) {
        case U_OPCODES:
                list_opcodes(0);
                cwin_exit(0);
        case U_ALLCODES:
                list_opcodes(2);
                cwin_exit(0);
        case U_HETRO:
                if (hetro(1, NULL)==0) break;
                another.~CArg();               //RWD
                if (pNames)
                  delete [] pNames;                //RWD.2.98
                cwin_exit(0);
        case U_LPANAL:
                if (lpanal(1, NULL)==0) break;
                another.~CArg();               //RWD
                if (pNames)
                  delete [] pNames;                //RWD.2.98
                cwin_exit(0);
        case U_PVANAL:
                if (pvanal(1, NULL)==0) break;
                another.~CArg();               //RWD
                if (pNames)
                  delete [] pNames;                //RWD.2.98
                cwin_exit(0);
        case U_SNDINFO:
                {
                    char const *argv[2];
                                        /*RWD added afc and aifc extension ( recommended by Apple) */
                    CFileDialog FDialog(TRUE, NULL, "*.WAV", OFN_FILEMUSTEXIST,
                        "WAV Files (*.wav)|*.wav|AIFF Files (*.aif;*.aic;*.afc;*.aifc)|*.aif;*.aic;*.afc;*.aifc|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                        NULL);
                    if (FDialog.DoModal() != IDOK) break;
                    CString name = FDialog.GetPathName();
                    argv[1] = name;
                    sndinfo(2, (char**)argv);
                    another.~CArg();            //RWD
                    name.~CString();                    //RWD.5.97
                    FDialog.~CFileDialog();             //RWD.5.97
                    if (pNames)                         //RWD.2.98
                      delete [] pNames;
                    cwin_exit(0);
                }
        case U_CVANAL:
                if (cvanal(1, NULL) == 0) break;
                another.~CArg();                //RWD
                cwin_exit(0);
        case U_PVLOOK:
          if (pvlook(1, NULL) == 0) {
            strcpy(cMid, ".... any character to continue...");
            wait_for_char = TRUE;
            theWindow->SetWindowText(MainTitle);
            while (wait_for_char) {
              cwin_ensure_screen();
              cwin_poll_window_manager();
            }
            break;
          }
          another.~CArg();                //RWD
          cwin_exit(0);
        }
      }
      else break;
    }
    O.outformat = another.m_size;
    O.filetyp = another.m_format;
    nonstop = another.m_nonstop;                        //RWD.5.97
    play_on_exit = another.m_play_on_exit;              //RWD.5.97

    if (another.m_format<0) {
      O.sfheader = 0;
    }
    if (another.m_graphics == 0) O.displays = 0;
    else if (another.m_graphics == 1) O.graphsoff = 1;
    else O.graphsoff = 0;
    O.postscript = another.m_postscript;
    strcpy(orchname, another.m_orch);
    *porchname = orchname;
    strcpy(sconame, another.m_score);
    *psconame = sconame;
    strcpy(outname, another.m_sound);
    // Check name is resonable for type
    // if not devaudio and no . in name add .wav/.aif if appropriate
    if (strcmp(outname, "devaudio")!=0 &&
        strcmp(outname, "dac")!=0 &&
        strchr(outname, '.')==NULL) {
          if (another.m_format==TYP_WAV)
            strcat(outname, ".wav");
          else if (another.m_format==TYP_AIFF)          /*RWD 3:2000*/
            strcat(outname, ".aif");
          else if(another.m_format==TYP_AIFC)           /*RWD 3:2000*/
            strcat(outname, ".afc");                            /* Apple recommended 3-char extension*/
    }
    O.outfilename = outname;
    if (strcmp(extractfile, "") != 0) *pxfile = extractfile;
    theApp.WriteProfileString(csound_section, "Orch", another.m_orch);
    theApp.WriteProfileString(csound_section, "Score", another.m_score);
    theApp.WriteProfileString(csound_section, "Soundfile", another.m_sound);
    theApp.WriteProfileInt(csound_section, "Format", another.m_format);
    theApp.WriteProfileInt(csound_section, "Size", another.m_size);
    theApp.WriteProfileInt(csound_section, "Graphics", another.m_graphics);
    theApp.WriteProfileInt(csound_section, "Logger", another.m_log_output);
    theApp.WriteProfileInt(csound_section, "Postscript", another.m_postscript);
    theApp.WriteProfileInt(csound_section, "NonStop", another.m_nonstop);         //RWD.5.97
    theApp.WriteProfileInt(csound_section, "ExitPlay", another.m_play_on_exit);   //RWD.5.97
    theApp.WriteProfileInt(csound_section, "ExitEdit", edit_on_exit);

    if (another.m_log_output) dribble = fopen("winsound.log", "w");
    if (another.m_format != TYP_WAV) play_on_exit = 0;  // Only play WAV files
        //RWD.2.98
    if (numdevs > 0)
      WaveDevice = another.m_wavedevice;
    theApp.WriteProfileInt(csound_section, "Device", WaveDevice);
    if (pNames)
      delete [] pNames;
    return;
}


extern "C" {
  extern void cwin_Beep(void);
}

void cwin_Beep(void) {
    ::Beep(1000, 100);          // Input buffer full - BEEP
}

extern "C" {
  extern char *getDB(void);
}

static CString database;
char *getDB(void)
{
    database = theApp.GetProfileString(csound_section, "StringDB", "csound.xmg");
    if (!database.IsEmpty()) return database.GetBuffer(0);
    return NULL;
}
