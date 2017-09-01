// Dialog for CV Anal

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


class Ccvdlg : public CDialog
{
        DECLARE_DYNAMIC(Ccvdlg)

// Construction
public:
        Ccvdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur);    // standard constructor
// Dialog Data
        //{{AFX_DATA(Ccvdlg)
            FLOAT       m_sr;
            int         m_chan;
            FLOAT       m_beg;
            FLOAT       m_dur;
            CString     m_input;
            CString     m_output;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(Ccvdlg)
            afx_msg void OnInput(void);
            afx_msg void OnOutput(void);
            afx_msg void OnCh5(void) { m_chan = 5; }
            afx_msg void OnCh1(void) { m_chan = 1; }
            afx_msg void OnCh2(void) { m_chan = 2; }
            afx_msg void OnCh3(void) { m_chan = 3; }
            afx_msg void OnCh4(void) { m_chan = 4; }
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()

};

IMPLEMENT_DYNAMIC(Ccvdlg, CDialog)

extern LPCTSTR csound_section;

Ccvdlg::Ccvdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur)
        : CDialog("DIALOG_CV", NULL)
{
        //{{AFX_DATA_INIT(Ccvdlg)
            m_sr = sr;
            m_chan = ch;
            m_beg = beg;
            m_dur = dur;
            m_input = theApp.GetProfileString(csound_section, "CVinput", "");
            m_output = theApp.GetProfileString(csound_section, "CVoutput", "test.cv");
        //}}AFX_DATA_INIT
}



BEGIN_MESSAGE_MAP(Ccvdlg, CDialog)
        //{{AFX_MSG_MAP(Ccvdlg)
        ON_COMMAND(C_INPUT, OnInput)
        ON_COMMAND(C_OUTPUT, OnOutput)
        ON_COMMAND(C_C1, OnCh1)
        ON_COMMAND(C_C2, OnCh2)
        ON_COMMAND(C_C3, OnCh3)
        ON_COMMAND(C_C4, OnCh4)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void Ccvdlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(Ccvdlg)
            DDX_Text(pDX, C_SAMPLE, m_sr);
            DDV_MinMaxFloat(pDX, m_sr, 0.0f, 100000.0f);
            DDX_Text(pDX, C_BEGIN, m_beg);
            DDV_MinMaxFloat(pDX, m_beg, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_DUR, m_dur);
            DDV_MinMaxFloat(pDX, m_dur, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_IN, m_input);
            DDX_Text(pDX, C_OUT, m_output);
        //}}AFX_DATA_MAP
}

void Ccvdlg::OnInput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "WAV Files (*.wav)|*.wav|AIFF Files (*.aif; *.aic)|*.aif;*.aic|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_input = imp.GetPathName();
    SetDlgItemText(C_IN, m_input);
    return;
}

void Ccvdlg::OnOutput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, 0,
                    "Conv Files (*.cv; *.con)|*.cv;*.con|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_output = imp.GetPathName();
    SetDlgItemText(C_OUT, m_output);
    return;
}


BOOL Ccvdlg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(C_C5, C_C4, C_C5);
        return TRUE;
}

extern "C" {
        extern int __cdecl cvanal_dialog(FLOAT *, int *, FLOAT *, FLOAT *, char **, char **);
}

static char sconame[256];      // Should be shared with cwin.cpp
static char outname[256];
int __cdecl cvanal_dialog(FLOAT *psr, int *pchannel, FLOAT *pbeg_time,
                           FLOAT *pinput_dur, char **pinfilnam, char **poutfilnam)
{
    Ccvdlg xxx(*psr,*pchannel,*pbeg_time,*pinput_dur);
    if (xxx.DoModal() != IDOK) return 0;
    if (strcmp(xxx.m_input,"")==0) {
        DisplayMsg("No string");
        return 0;
    }
    *psr = xxx.m_sr;
    *pchannel = xxx.m_chan;
    *pbeg_time = xxx.m_beg;
    *pinput_dur = xxx.m_dur;
    strncpy(sconame,xxx.m_input,256);
    *pinfilnam = sconame;
    strncpy(outname,xxx.m_output,256);
    *poutfilnam = outname;
//    DisplayMsg("Data Transferred");
    theApp.WriteProfileString(csound_section, "CVinput", xxx.m_input);
    theApp.WriteProfileString(csound_section, "CVoutput", xxx.m_output);
    return 1;
}



