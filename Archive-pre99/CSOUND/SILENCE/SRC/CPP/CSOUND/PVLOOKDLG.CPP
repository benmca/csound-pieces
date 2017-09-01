// Dialog for Phase Vocoder Decode

#include <string.h>
#include <ctype.h>
#include <stdarg.h>
#include "dialogs.h"

//#define WINVER  0x030a                  // I rely on at least Windows 3.1

#include <afxdlgs.h>
#include <afxwin.h>                     // Main MFC header file

#include "cwin.h"                       // defines external interface

#ifdef BUILDING_DLL
#define DLLexport __declspec(dllexport)
#else
#define DLLexport
#endif

// DisplayMsg is used a bit like fprintf(stderr, ...) but ONLY for debugging.
// It pops up a modal dialog box each time it is called.  This is easy to
// code, but a bit clumsy in the way it distrubs the screen.

extern "C" {
    void DisplayMsg(char *, ...);
}

class Cpvlookdlg : public CDialog
{
        DECLARE_DYNAMIC(Cpvlookdlg)

// Construction
public:
        Cpvlookdlg();    // standard constructor
// Dialog Data
        //{{AFX_DATA(Cpvlookdlg)
            int         m_firstbin;
            int         m_lastbin;
            int         m_firstframe;
            int         m_lastframe;
            int         m_printints;
            CString     m_input;
            CString     m_output;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(Cpvlookdlg)
            afx_msg void OnInput(void);
            afx_msg void OnOutput(void);
            afx_msg void OnPints(void) { m_printints = !m_printints; }
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()

};

IMPLEMENT_DYNAMIC(Cpvlookdlg, CDialog)

extern LPCTSTR csound_section;

Cpvlookdlg::Cpvlookdlg(void)
        : CDialog("DIALOG_PVL", NULL)
{
        //{{AFX_DATA_INIT(Cpvlookdlg)
    m_firstbin = -1;
    m_lastbin = -1;
    m_firstframe = 1;
    m_lastframe = -1;
    m_printints = 1;
    m_input  = theApp.GetProfileString(csound_section, "PVLOOKinput", "");
    m_output  = theApp.GetProfileString(csound_section, "PVLOOKoutput", "");
        //}}AFX_DATA_INIT
}



BEGIN_MESSAGE_MAP(Cpvlookdlg, CDialog)
        //{{AFX_MSG_MAP(Cpvlookdlg)
        ON_COMMAND(P_INPUT, OnInput)
        ON_COMMAND(P_OUTPUT, OnOutput)
        ON_COMMAND(P_PINT, OnPints)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void Cpvlookdlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSextras)
            DDX_Text(pDX, P_FFRAME, m_firstframe);
            DDX_Text(pDX, P_LFRAME, m_lastframe);
            DDX_Text(pDX, P_FBIN, m_firstbin);
            DDX_Text(pDX, P_IN, m_input);
            DDX_Text(pDX, P_OUT, m_output);
            DDX_Text(pDX, P_LBIN, m_lastbin);
        //}}AFX_DATA_MAP
}

void Cpvlookdlg::OnInput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "PV Files (*.pv,*.pvc)|*.pv;*.pvc|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_input = imp.GetPathName();
    SetDlgItemText(P_IN, m_input);
    return;
}

void Cpvlookdlg::OnOutput(void)
{
    CFileDialog imp(TRUE, NULL, m_output, 0,
                    "Txt Files (*.txt)|*.txt|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_output = imp.GetPathName();
    SetDlgItemText(P_OUT, m_output);
    return;
}

BOOL Cpvlookdlg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        return TRUE;
}

extern "C" {
        extern int __cdecl pvlook_dialog(int *, int *, int *, int *, int *,char **, char **);
}

static char inname[256];      // Should be shared with cwin.cpp
static char outname[256];
int __cdecl pvlook_dialog(int *firstbin, int *lastbin, int *firstframe, int *lastframe, int *printints, char **pinname,  char **poutname)
{
    Cpvlookdlg xxx;
    if (xxx.DoModal() != IDOK) return 0;
    if (strcmp(xxx.m_input,"")==0) {
        DisplayMsg("No string");
        return 0;
    }
    if (strcmp(xxx.m_output,"")!=0) {
      strncpy(outname,xxx.m_output,256);
      *poutname = outname;
    }
    else
      *poutname = NULL;
    *firstbin = xxx.m_firstbin;
    *lastbin = xxx.m_lastbin;
    *firstframe = xxx.m_firstframe;
    *lastframe = xxx.m_lastframe;
    *printints = xxx.m_printints;
//    DisplayMsg("Data Transferred");
    strncpy(inname,xxx.m_input,256);
    *pinname = inname;
    theApp.WriteProfileString(csound_section, "PVLOOKinput", xxx.m_input);
    theApp.WriteProfileString(csound_section, "PVLOOKoutput", xxx.m_output);
    return 1;
}



