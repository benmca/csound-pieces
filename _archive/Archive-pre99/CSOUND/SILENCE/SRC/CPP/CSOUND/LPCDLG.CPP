// Dialog for LPC Anal

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

class Clpcdlg : public CDialog
{
        DECLARE_DYNAMIC(Clpcdlg)

// Construction
public:
        Clpcdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, int NPOLES, int slice,
                FLOAT pchlow, FLOAT pchhigh, int verbose, int oldf, int display);    // standard constructor
// Dialog Data
        //{{AFX_DATA(Clpcdlg)
            FLOAT       m_sr;
            int         m_chan;
            FLOAT       m_beg;
            FLOAT       m_dur;
            int         m_npoles;
            int         m_slice;
            FLOAT       m_pchlow;
            FLOAT       m_pchhigh;
            int         m_verbose;
            int         m_debug;
            int         m_display;
            int         m_oldf;
            CString     m_input;
            CString     m_output;
        //}}AFX_DATA
// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(Clpcdlg)
            afx_msg void OnInput(void);
            afx_msg void OnOutput(void);
            afx_msg void OnCh1(void) { m_chan = 1; }
            afx_msg void OnCh2(void) { m_chan = 2; }
            afx_msg void OnCh3(void) { m_chan = 3; }
            afx_msg void OnCh4(void) { m_chan = 4; }
            afx_msg void OnVerb(void) { m_verbose = (m_verbose==0 ? 1 : 0); }
            afx_msg void OnDebug(void) { m_debug = (m_debug==0 ? 1 : 0); }
            afx_msg void OnGraphics(void) { m_display = (m_display==0 ? 1 : 0); }
            afx_msg void OnOldFormat(void) { m_oldf = (m_oldf==0 ? 1 : 0); }
        //}}AFX_MSG
        DECLARE_MESSAGE_MAP()

};

IMPLEMENT_DYNAMIC(Clpcdlg, CDialog)

extern LPCTSTR csound_section;

Clpcdlg::Clpcdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, int NPOLES, int slice,
                FLOAT pchlow, FLOAT pchhigh, int verbose, int oldf, int display)
        : CDialog("DIALOG_LPC", NULL)
{
        //{{AFX_DATA_INIT(Clpcdlg)
            m_sr = sr;
            m_chan = ch;
            m_beg = beg;
            m_dur = dur;
            m_npoles = NPOLES;
            m_slice = slice;
            m_pchlow = pchlow;
            m_pchhigh = pchhigh;
            m_verbose = verbose;
            m_display = display;
            m_oldf = 1;// Default to new format
            m_input = theApp.GetProfileString(csound_section, "LPCinput", "");
            m_output = theApp.GetProfileString(csound_section, "LPCoutput", "test.lpc");
        //}}AFX_DATA_INIT
}



BEGIN_MESSAGE_MAP(Clpcdlg, CDialog)
        //{{AFX_MSG_MAP(Clpcdlg)
        ON_COMMAND(C_INPUT, OnInput)
        ON_COMMAND(C_OUTPUT, OnOutput)
        ON_COMMAND(C_C1, OnCh1)
        ON_COMMAND(C_C2, OnCh2)
        ON_COMMAND(C_C3, OnCh3)
        ON_COMMAND(C_C4, OnCh4)
        ON_COMMAND(C_VERBOSE, OnVerb)
        ON_COMMAND(C_DEBUG, OnDebug)
        ON_COMMAND(C_GRAPHICS, OnGraphics)
        ON_COMMAND(C_OLDFORM, OnOldFormat)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void Clpcdlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSextras)
            DDX_Text(pDX, C_SAMPLE, m_sr);
            DDV_MinMaxFloat(pDX, m_sr, 0.0f, 100000.0f);
            DDX_Text(pDX, C_BEGIN, m_beg);
            DDV_MinMaxFloat(pDX, m_beg, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_DUR, m_dur);
            DDV_MinMaxFloat(pDX, m_dur, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_POLES, m_npoles);
            DDX_Text(pDX, C_SLICE, m_slice);
            DDX_Text(pDX, C_PCHLOW, m_pchlow);
            DDX_Text(pDX, C_PCHHIGH, m_pchhigh);
            DDX_Text(pDX, C_IN, m_input);
            DDX_Text(pDX, C_OUT, m_output);
        //}}AFX_DATA_MAP
}

void Clpcdlg::OnInput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "WAV Files (*.wav)|*.wav|AIFF Files (*.aif; *.aic)|*.aif;*.aic|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_input = imp.GetPathName();
    SetDlgItemText(C_IN, m_input);
    return;
}

void Clpcdlg::OnOutput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, 0,
                    "LPC Files (*.lpc)|*.lpc|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_output = imp.GetPathName();
    SetDlgItemText(C_OUT, m_output);
    return;
}


BOOL Clpcdlg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(C_C1, C_C4, C_C1);
        return TRUE;
}

extern "C" {
        extern int __cdecl lpanal_dialog(FLOAT *, int *, FLOAT *, FLOAT *, int *, int *, FLOAT *,
                                          FLOAT *, int *, int *, int*, char **, char **);
}

static char sconame[256];      // Should be shared with cwin.cpp
static char outname[256];
int __cdecl lpanal_dialog(FLOAT *psr, int *pchannel, FLOAT *pbeg_time, FLOAT *pinput_dur, int *pNPOLES,
                           int *pslice, FLOAT *ppchlow, FLOAT *ppchhigh, int *pverbose, int *pdisplay, int *poldf,
                           char **pinfilnam, char **poutfilnam)
{
    Clpcdlg xxx(*psr,*pchannel,*pbeg_time,*pinput_dur, *pNPOLES, *pslice, *ppchlow, *ppchhigh,
                *pverbose, *poldf, *pdisplay);
    if (xxx.DoModal() != IDOK) return 0;
    if (strcmp(xxx.m_input,"")==0) {
        DisplayMsg("No string");
        return 0;
    }
    *psr = xxx.m_sr;
    *pchannel = xxx.m_chan;
    *pbeg_time = xxx.m_beg;
    *pinput_dur = xxx.m_dur;
    *pNPOLES = xxx.m_npoles;
    *pslice = xxx.m_slice;
    *ppchlow = xxx.m_pchlow;
    *ppchhigh = xxx.m_pchhigh;
    *pverbose = (xxx.m_debug ? 2 : xxx.m_verbose);
    *pdisplay = xxx.m_display;
    *poldf = xxx.m_oldf;
    strncpy(sconame,xxx.m_input,256);
    *pinfilnam = sconame;
    strncpy(outname,xxx.m_output,256);
    *poutfilnam = outname;
//    DisplayMsg("Data Transferred");
    theApp.WriteProfileString(csound_section, "LPCinput", xxx.m_input);
    theApp.WriteProfileString(csound_section, "LPCoutput", xxx.m_output);
    return 1;
}



