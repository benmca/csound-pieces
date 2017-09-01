

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

class Chetdlg : public CDialog
{
        DECLARE_DYNAMIC(Chetdlg)

// Construction
public:
        Chetdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, FLOAT fund,
                short harm, double max, int min, int num, FLOAT filter);
// Dialog Data
        //{{AFX_DATA(Chetdlg)
            FLOAT       m_sr;
            int         m_chan;
            FLOAT       m_beg;
            FLOAT       m_dur;
            FLOAT       m_fund;
            int         m_harm;
            double      m_max;
            int         m_min;
            int         m_num;
            FLOAT       m_filter;
            CString     m_input;
            CString     m_output;
        //}}AFX_DATA

// Implementation
protected:
        virtual void DoDataExchange(CDataExchange* pDX);
        BOOL OnInitDialog(void);
        // Generated message map functions
        //{{AFX_MSG(Chetdlg)
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

IMPLEMENT_DYNAMIC(Chetdlg, CDialog)

extern LPCTSTR csound_section;

Chetdlg::Chetdlg(FLOAT sr, int ch, FLOAT beg, FLOAT dur, FLOAT fund,
                 short harm, double max, int min, int num, FLOAT filter)
        : CDialog("DIALOG_HET", NULL)
{
        //{{AFX_DATA_INIT(Chetdlg)
    m_sr = sr;
    m_chan = ch;
    m_beg = beg;
    m_dur = dur;
    m_fund = fund;
    m_harm = (int)harm;
    m_max = max;
    m_min = min;
    m_num = num;
    m_filter = filter;
    m_input = theApp.GetProfileString(csound_section, "Hetinput", "");
    m_output = theApp.GetProfileString(csound_section, "Hetoutput", "test.ads");
        //}}AFX_DATA_INIT
}



BEGIN_MESSAGE_MAP(Chetdlg, CDialog)
        //{{AFX_MSG_MAP(Chetdlg)
        ON_COMMAND(C_INPUT, OnInput)
        ON_COMMAND(C_OUTPUT, OnOutput)
        ON_COMMAND(C_C1, OnCh1)
        ON_COMMAND(C_C2, OnCh2)
        ON_COMMAND(C_C3, OnCh3)
        ON_COMMAND(C_C4, OnCh4)
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

void Chetdlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSextras)
            DDX_Text(pDX, C_SAMPLE, m_sr);
            DDV_MinMaxFloat(pDX, m_sr, 0.0f, 100000.0f);
            DDX_Text(pDX, C_BEGIN, m_beg);
            DDV_MinMaxFloat(pDX, m_beg, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_DUR, m_dur);
            DDV_MinMaxFloat(pDX, m_dur, 0.0f, 1000000.0f);
            DDX_Text(pDX, C_FUND, m_fund);
            DDV_MinMaxFloat(pDX, m_fund, 0.0f, 20000.0f);
            DDX_Text(pDX, C_HARM, m_harm);
            DDV_MinMaxInt(pDX, m_harm, 0, 0x7FFF);  // HMAX from hetro.c
            DDX_Text(pDX, C_MAX, m_max);
            DDX_Text(pDX, C_MIN, m_min);
            DDX_Text(pDX, C_NUM, m_num);
            DDX_Text(pDX, C_FILTER, m_filter);
            DDV_MinMaxFloat(pDX, m_filter, 0.0f, 1.0f);
            DDX_Text(pDX, C_IN, m_input);
            DDX_Text(pDX, C_OUT, m_output);
        //}}AFX_DATA_MAP
}

void Chetdlg::OnInput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, OFN_FILEMUSTEXIST,
                    "WAV Files (*.wav)|*.wav|AIFF Files (*.aif; *.aic)|*.aif;*.aic|Raw sounds (*.raw)|*.raw|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_input = imp.GetPathName();
    SetDlgItemText(C_IN, m_input);
    return;
}

void Chetdlg::OnOutput(void)
{
    CFileDialog imp(TRUE, NULL, m_input, 0,
                    "Hetro Files (*.ads; *.het)|*.ads ; *.het|All Files (*.*)|*.*||",
                    this);
    if (imp.DoModal() != IDOK) return;
    m_output = imp.GetPathName();
    SetDlgItemText(C_OUT, m_output);
    return;
}


BOOL Chetdlg::OnInitDialog(void)
{
        CDialog::OnInitDialog();
        CheckRadioButton(C_C5, C_C4, C_C5);
        return TRUE;
}

extern "C" {
  extern int __cdecl hetro_dialog(FLOAT *, int *, FLOAT *, FLOAT *, FLOAT *,
                                  short *, double *, int *, int *, FLOAT *p, char **, char **);
}

char sconame[256];
char outname[256];
int __cdecl hetro_dialog(FLOAT *psr, int *pchannel, FLOAT *pbeg_time,
                         FLOAT *pinput_dur, FLOAT *pfund, short *pharm,
                         double *pmax, int *pmin, int *pnum, FLOAT *pfilter,
                         char **pinfilnam, char **poutfilnam)
{
    Chetdlg xxx(*psr,*pchannel,*pbeg_time,*pinput_dur, *pfund, *pharm, *pmax, *pmin, *pnum, *pfilter);
    if (xxx.DoModal() != IDOK) return 0;
    if (strcmp(xxx.m_input,"")==0) {
        DisplayMsg("No string");
        return 0;
    }
    *psr = xxx.m_sr;
    *pchannel = xxx.m_chan;
    *pbeg_time = xxx.m_beg;
    *pinput_dur = xxx.m_dur;
    *pfund = xxx.m_fund;
    *pharm = (short)xxx.m_harm;
    *pmax = xxx.m_max;
    *pmin = xxx.m_min;
    *pnum = xxx.m_num;
    *pfilter = xxx.m_filter;
    strncpy(sconame,xxx.m_input,256);
    *pinfilnam = sconame;
    strncpy(outname,xxx.m_output,256);
    *poutfilnam = outname;
//    DisplayMsg("Data Transferred");
    theApp.WriteProfileString(csound_section, "Hetinput", xxx.m_input);
    theApp.WriteProfileString(csound_section, "Hetoutput", xxx.m_output);
    return 1;
}



