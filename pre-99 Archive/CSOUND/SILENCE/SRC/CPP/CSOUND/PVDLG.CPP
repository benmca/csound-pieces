// Dialog for Phase Vocoder Anal

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

class Cpvdlg : public CDialog
{
        DECLARE_DYNAMIC(Cpvdlg)

// Construction
public:
        Cpvdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, long frameSize, int ovlp,
                int frameIncr, int display, int latch);    // standard constructor
// Dialog Data
        //{{AFX_DATA(Cpvdlg)
            FLOAT       m_sr;
            int         m_chan;
            FLOAT       m_beg;
            FLOAT       m_dur;
            long        m_frameSize;
            int         m_ovlp;
            long        m_frameIncr;
            int         m_latch;
            int         m_display;
            CString     m_input;
            CString     m_output;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(Cpvdlg)
            afx_msg void OnInput(void);
            afx_msg void OnOutput(void);
            afx_msg void OnCh1(void) { m_chan = 1; }
            afx_msg void OnCh2(void) { m_chan = 2; }
            afx_msg void OnCh3(void) { m_chan = 3; }
            afx_msg void OnCh4(void) { m_chan = 4; }
            afx_msg void OnDisp(void) { m_display = (m_display==0 ? 1 : 0); }
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()

};

IMPLEMENT_DYNAMIC(Cpvdlg, CDialog)

extern LPCTSTR csound_section;

Cpvdlg::Cpvdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, long frameSize, int ovlp,
                int frameIncr, int display, int latch)
        : CDialog("DIALOG_PV", NULL)
{
        //{{AFX_DATA_INIT(Cpvdlg)
    m_sr = sr;
    m_chan = ch;
    m_beg = beg;
    m_dur = dur;
    m_frameSize = frameSize;
    m_ovlp = ovlp;
    m_frameIncr = frameIncr;
    m_latch = latch;
    m_display = display;
    m_input  = theApp.GetProfileString(csound_section, "PVinput", "");
    m_output = theApp.GetProfileString(csound_section, "PVoutput", "test.pv");
        //}}AFX_DATA_INIT
}



BEGIN_MESSAGE_MAP(Cpvdlg, CDialog)
        //{{AFX_MSG_MAP(Cpvdlg)
        ON_COMMAND(P_INPUT, OnInput)
        ON_COMMAND(P_OUTPUT, OnOutput)
        ON_COMMAND(P_C1, OnCh1)
        ON_COMMAND(P_C2, OnCh2)
        ON_COMMAND(P_C3, OnCh3)
        ON_COMMAND(P_C4, OnCh4)
        ON_COMMAND(P_DISP, OnDisp)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void Cpvdlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(Cpvdlg)
            DDX_Text(pDX, P_SAMPLE, m_sr);
            DDV_MinMaxFloat(pDX, m_sr, 0.0f, 100000.0f);
            DDX_Text(pDX, P_BEGIN, m_beg);
            DDV_MinMaxFloat(pDX, m_beg, 0.0f, 1000000.0f);
            DDX_Text(pDX, P_DUR, m_dur);
            DDV_MinMaxFloat(pDX, m_dur, 0.0f, 1000000.0f);
            DDX_Text(pDX, P_FRAME, m_frameSize);
            DDV_MinMaxLong(pDX, m_frameSize, 0, 65536);
//             if (m_frameSize<0 || m_frameSize>20) {
//                 DisplayMsg("Illegal frame size %d"); m_frameSize = 0; }
            DDX_Text(pDX, P_WIND, m_ovlp);
            DDX_Text(pDX, P_HOP, m_frameIncr);
            DDX_Text(pDX, P_LATCH, m_latch);
            DDX_Text(pDX, P_IN, m_input);
            DDX_Text(pDX, P_OUT, m_output);
            if (m_latch) m_display = 1;
        //}}AFX_DATA_MAP
}

void Cpvdlg::OnInput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "WAV Files (*.wav)|*.wav|AIFF Files (*.aif; *.aic)|*.aif;*.aic|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_input = imp.GetPathName();
    SetDlgItemText(P_IN, m_input);
    return;
}

void Cpvdlg::OnOutput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, 0,
                    "PV Files (*.pvc)|*.pvc|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_output = imp.GetPathName();
    SetDlgItemText(P_OUT, m_output);
    return;
}


BOOL Cpvdlg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(P_C1, P_C4, P_C1);
        m_sr = 0.0f;
        return TRUE;
}

extern "C" {
        extern int __cdecl pvanal_dialog(FLOAT *, int *, FLOAT *, FLOAT *, long *, int *,
                                          long *, int *, int *, char **, char **);
}

static char sconame[256];      // Should be shared with cwin.cpp
static char outname[256];
int __cdecl pvanal_dialog(FLOAT *psr, int *pchannel, FLOAT *pbeg_time, FLOAT *pinput_dur, long *pframe,
                           int *povlp, long *pframeIncr, int *pdisplay, int *platch,
                           char **pinfilnam, char **poutfilnam)
{
    Cpvdlg xxx(*psr,*pchannel,*pbeg_time,*pinput_dur, *pframe, *povlp, *pframeIncr, *pdisplay, *platch);
    if (xxx.DoModal() != IDOK) return 0;
    if (strcmp(xxx.m_input,"")==0) {
        DisplayMsg("No string");
        return 0;
    }
    *psr = xxx.m_sr;
    *pchannel = xxx.m_chan;
    *pbeg_time = xxx.m_beg;
    *pinput_dur = xxx.m_dur;
    *pframe = xxx.m_frameSize;
    *povlp = xxx.m_ovlp;
    *pframeIncr = xxx.m_frameIncr;
    *platch = xxx.m_latch;
    *pdisplay = xxx.m_display;
    strncpy(sconame,xxx.m_input,256);
    *pinfilnam = sconame;
    strncpy(outname,xxx.m_output,256);
    *poutfilnam = outname;
//    DisplayMsg("Data Transferred");
    theApp.WriteProfileString(csound_section, "PVinput", xxx.m_input);
    theApp.WriteProfileString(csound_section, "PVoutput", xxx.m_output);
    return 1;
}



