// CSlider.cpp : implementation file
//

//#define WINVER  0x030a                  // I rely on at least Windows 3.1
#include <afxdlgs.h>
#include <afxwin.h>                     // Main MFC header file
#include "CSliders.h"

extern CSlider **m_pModeless;
extern int numsliderdlgs;
extern CButtons **m_pModelessB;
extern int numbuttondlgs;
extern CChecks **m_pModelessC;
extern int numcheckdlgs;

static int b_batch = 0;
static int c_batch = 0;
//**********************************************************************
// CRangeDlg dialog
//**********************************************************************


CRangeDlg::CRangeDlg(CWnd* pParent /*=NULL*/, int i, long mi, long ma, long va)
        : CDialog(CRangeDlg::IDD, pParent)
{
        //{{AFX_DATA_INIT(CRangeDlg)
        val = va;
        name = i+1;
        max = ma;
        min = mi;
        //}}AFX_DATA_INIT
}

void CRangeDlg::DoDataExchange(CDataExchange* pDX)
{
        CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CRangeDlg)
        DDX_Text(pDX, RG_VAL, val);
        DDX_Text(pDX, RG_NAME, name);
        DDX_Text(pDX, RG_MAX, max);
        DDX_Text(pDX, RG_MIN, min);
        DDV_MinMaxInt(pDX, val, min, max);
        //}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CRangeDlg, CDialog)
        //{{AFX_MSG_MAP(CRangeDlg)
                // NOTE: the ClassWizard will add message map macros here
        //}}AFX_MSG_MAP
  ON_COMMAND(IDNO, OnCancel)
  ON_COMMAND(IDOK, OnOK)
END_MESSAGE_MAP()

//**********************************************************************
// CSlider dialog
//**********************************************************************

CSlider::CSlider(CWnd* pParent /*=NULL*/)
        : CDialog(CSlider::IDD, pParent)
{
    //{{AFX_DATA_INIT(CSlider)
                // NOTE: the ClassWizard will add member initialization here
    //}}AFX_DATA_INIT

    m_pParent = pParent;
    m_nID = CSlider::IDD;

    int i;
    for (i=0; i<NUM_SLIDERS; i++) {
      m_num[i]    = 0;
      m_max[i]    = 127;
      m_min[i]    = 0;
      m_lab[i]    = "";
    }
    //    m_hIcon = AfxGetApp()->LoadIcon(DIALOG_1);
}


void CSlider::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CSlider)
                // NOTE: the ClassWizard will add DDX and DDV calls here
        //}}AFX_DATA_MAP
    for (int i=0; i<NUM_SLIDERS; i++) {
      DDX_Control(pDX, IDC_SLIDER1+3*i, bar[i]);
      DDX_Scroll(pDX, IDC_SLIDER1+3*i, m_num[i]);
    }
}

BEGIN_MESSAGE_MAP(CSlider, CDialog)
        //{{AFX_MSG_MAP(CSlider)
        ON_WM_HSCROLL()
        ON_COMMAND(IDC_BUTTON1, OnRange_1)
        ON_COMMAND(IDC_BUTTON2, OnRange_2)
        ON_COMMAND(IDC_BUTTON3, OnRange_3)
        ON_COMMAND(IDC_BUTTON4, OnRange_4)
        ON_COMMAND(IDC_BUTTON5, OnRange_5)
        ON_COMMAND(IDC_BUTTON6, OnRange_6)
        ON_COMMAND(IDC_BUTTON7, OnRange_7)
        ON_COMMAND(IDC_BUTTON8, OnRange_8)
        ON_COMMAND(IDC_BUTTON9, OnRange_9)
        ON_COMMAND(IDC_BUTTON10, OnRange_A)
        ON_EN_KILLFOCUS(IDC_EDIT1, OnValue_1)
        ON_EN_KILLFOCUS(IDC_EDIT2, OnValue_2)
        ON_EN_KILLFOCUS(IDC_EDIT3, OnValue_3)
        ON_EN_KILLFOCUS(IDC_EDIT4, OnValue_4)
        ON_EN_KILLFOCUS(IDC_EDIT5, OnValue_5)
        ON_EN_KILLFOCUS(IDC_EDIT6, OnValue_6)
        ON_EN_KILLFOCUS(IDC_EDIT7, OnValue_7)
        ON_EN_KILLFOCUS(IDC_EDIT8, OnValue_8)
        ON_EN_KILLFOCUS(IDC_EDIT9, OnValue_9)
        ON_EN_KILLFOCUS(IDC_EDIT10, OnValue_A)
        ON_COMMAND(IDOK, OnOK)
        ON_WM_CLOSE()
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

//**********************************************************************
// CSlider message handlers
//**********************************************************************

BOOL CSlider::Create()
{
    return CDialog::Create(m_nID, m_pParent);
}

void CSlider::OnOK()
{
//      int i;
    if (this == NULL) return;
//      for (i=0; i<=numsliderdlgs; i++)
//        if (m_pModeless[i]==this) {
//      m_pModeless[i]=NULL;
//      break;
//        }
    PostNcDestroy();
}

void CSlider::PostNcDestroy()
{
    int i;
    if (this == NULL) return;
    for (i=0; i<=numsliderdlgs; i++)
      if (m_pModeless[i]==this) {
        m_pModeless[i]=NULL;
        break;
      }
    delete this;
}

BOOL CSlider::OnInitDialog()
{
        CDialog::OnInitDialog();

        int i;
        char buff[20];

        for (i=0; i<NUM_SLIDERS; i++) {
          m_num[i] = m_min[i];
          bar[i].SetScrollRange(m_min[i], m_max[i], FALSE);
          bar[i].SetScrollPos(m_num[i], TRUE);
          //      bar[i].EnableScrollBar(ESB_ENABLE_BOTH);
          sprintf(buff, "%ld", m_num[i]);
          SetDlgItemText(IDC_EDIT1+3*i, buff);
        }

        return TRUE;  // return TRUE unless you set the focus to a control
                      // EXCEPTION: OCX Property Pages should return FALSE
}

void CSlider::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
    int max, min;
    if (pScrollBar == NULL) return;
    pScrollBar->GetScrollRange(&min, &max);
    // ASSERT(pScrollBar != NULL);
    int nCurPos = pScrollBar->GetScrollPos();
    switch (nSBCode)
      {
      case SB_LEFT: //    Scroll to start
        nCurPos = min;
        break;
      case SB_LINELEFT: //    Scroll up.
        nCurPos--;
        break;
      case SB_LINERIGHT: //    Scroll down.
        nCurPos++;
        break;
      case SB_PAGELEFT: //    Scroll one page up.
        nCurPos -= 10;
        break;
      case SB_PAGERIGHT: //    Scroll one page down.
        nCurPos += 10;
        break;
      case SB_RIGHT: //    Scroll to bottom.
        nCurPos = max;
        break;
      case SB_THUMBPOSITION: //    Scroll to absolute position.
        // The current position is specified by the nPos parameter.
      case SB_THUMBTRACK: //    Drag scroll box to specified position. #
        // The current position is specified by the nPos parameter.
        nCurPos = nPos;
      }
    if (nCurPos < min) nCurPos = min;
    if (nCurPos > max) nCurPos = max;
    pScrollBar->SetScrollPos(nCurPos);

    int i;
    char buff[128];
    for (i=0; i<NUM_SLIDERS; i++) {
      if (&(bar[i]) == pScrollBar) break;
    }
    if (i == NUM_SLIDERS) {
      //          DisplayMsg("Unrecognised %p", pScrollBar);
      return;
    }
    m_num[i] = bar[i].GetScrollPos();
    sprintf(buff, "%ld", m_num[i]);
    SetDlgItemText(IDC_EDIT1+3*i, buff);
    CDialog::OnVScroll(nSBCode, nPos, pScrollBar);
}

void CSlider::OnRange(int i)
{
    CRangeDlg dlg(this, i, m_min[i], m_max[i], m_num[i]);

    int nResponse= 0;

    nResponse = dlg.DoModal();
    if (nResponse==IDOK) {
      char buff[128];
      i = dlg.name-1;
      m_min[i]= dlg.min;
      m_max[i]= dlg.max;
      m_num[i]= dlg.val;
      bar[i].SetScrollRange(m_min[i], m_max[i], FALSE);
      bar[i].SetScrollPos(m_num[i], TRUE);
      sprintf(buff, "%d", dlg.val);
      SetDlgItemText(IDC_EDIT1+3*i, buff);
    }
}

void CSlider::OnValue(int i)
{
    char buff[128];
    long f;

    GetDlgItemText(IDC_EDIT1+3*0+i, buff, 128);
    sscanf(buff, "%d", &f);
    if (f>=m_min[i] && f<=m_max[i]) {
      m_num[i] = f;
      bar[i].SetScrollPos(f, TRUE);
    }
    //    DisplayMsg("Value #%d", i);
}

void CSlider::StoreSlider(char *fname)
{
    // INI File etc...
    // Load the settings from the INI file....
    char pstring[64];
    int i;
    char *Num = "NUM0";
    char *Max = "MAX0";
    char *Min = "MIN0";
    char *Lab = "LAB0";
    char *Ins = "INS0";
    char *Vpm = "VPM0";
    char *Chk = "CHK0";
    char *Typ = "TYP0";
    char *Pgm = "PGM0";
    for (i=0; i<NUM_SLIDERS; i++) {
      Num[3] = (i<10 ? '1'+i : 'A'+i-10);
      Max[3] = (i<10 ? '1'+i : 'A'+i-10);
      Min[3] = (i<10 ? '1'+i : 'A'+i-10);
      Lab[3] = (i<10 ? '1'+i : 'A'+i-10);
      Ins[3] = (i<10 ? '1'+i : 'A'+i-10);
      Vpm[3] = (i<10 ? '1'+i : 'A'+i-10);

      sprintf(pstring, "%d", m_num[i]);
      WritePrivateProfileString("CSlider", Num, pstring, fname);
      sprintf(pstring, "%d", m_max[i]);
      WritePrivateProfileString("CSlider", Max, pstring, fname);
      sprintf(pstring, "%d", m_min[i]);
      WritePrivateProfileString("CSlider", Min, pstring, fname);
      WritePrivateProfileString("CSlider", Lab, m_lab[i], fname);
    }
}

void CSlider::LoadSlider(char *fname)
{
    // INI File etc...
    // Load the settings from the INI file....
    char pstring[64];
    int i;
    char *Num = "NUM0";
    char *Max = "MAX0";
    char *Min = "MIN0";
    char *Lab = "LAB0";
    char *Ins = "INS0";
    char *Vpm = "VPM0";
    char *Chk = "CHK0";
    char *Typ = "TYP0";
    char *Pgm = "PGM0";
    for (i=0; i<NUM_SLIDERS; i++) {
      Num[3] = (i<10 ? '1'+i : 'A'+i-10);
      Max[3] = (i<10 ? '1'+i : 'A'+i-10);
      Min[3] = (i<10 ? '1'+i : 'A'+i-10);
      Lab[3] = (i<10 ? '1'+i : 'A'+i-10);
      Ins[3] = (i<10 ? '1'+i : 'A'+i-10);
      Vpm[3] = (i<10 ? '1'+i : 'A'+i-10);
      m_num[i] = GetPrivateProfileInt("CSlider", Num, 0, fname);
      GetPrivateProfileString("CSlider", Max, "", pstring, 64, fname);
      sscanf(pstring, "%d", &m_max[i]);
      GetPrivateProfileString("CSlider", Min, "", pstring, 64, fname);
      sscanf(pstring, "%d", &m_min[i]);
      bar[i].SetScrollRange(m_min[i], m_max[i], FALSE);
      bar[i].SetScrollPos(m_num[i], TRUE);
      sprintf(pstring, "%d", m_num[i]);
      SetDlgItemText(IDC_EDIT1+3*0+i, pstring);
      GetPrivateProfileString("CSlider", Lab, "", pstring, 64, fname);
      m_lab[i] = CString(pstring);
    }
}

void CSlider::OnLoad(void)
{
    static char str[] = "Preset Controls (*.csc)|*.csc||";
    char pstring[64];
    CString initDir;
    GetPrivateProfileString("OpLib", "INITDIR", "", pstring, 64, "CSlider.ini");
    initDir = CString(pstring) + CString("\\*.csc");
    CFileDialog dlg(TRUE, "csc", initDir, OFN_HIDEREADONLY, str, this);
    if(dlg.DoModal() == IDOK)
      LoadSlider(dlg.GetPathName().GetBuffer(128));
}


void CSlider::OnStore(void)
{
    static char str[] = "Preset Controls (*.csc)|*.csc||";
    CString initDir;
    char pstring[64];
    GetPrivateProfileString("OpLib", "INITDIR", "", pstring, 64, "CSlider.ini");
    initDir = CString(pstring) + CString("\\*.csc");
    CFileDialog dlg(FALSE, "csc", initDir,
                    OFN_HIDEREADONLY|OFN_OVERWRITEPROMPT, str, this);
    if(dlg.DoModal() == IDOK)
      StoreSlider(dlg.GetPathName().GetBuffer(128));
}

void CSlider::OnClose()
{
    m_pModeless = NULL;
    CDialog::OnClose();
}


//**********************************************************************
// CSlider buttons
//**********************************************************************

CButtons::CButtons(CWnd* pParent /*=NULL*/, int b)
        : CDialog(CButtons::IDD, pParent)
{
    //{{AFX_DATA_INIT(CButtons)
                // NOTE: the ClassWizard will add member initialization here
    //}}AFX_DATA_INIT

    m_pParent = pParent;
    m_nID = CButtons::IDD;
    b_batch = b;

    //    m_hIcon = AfxGetApp()->LoadIcon(DIALOG_1);
}


BEGIN_MESSAGE_MAP(CButtons, CDialog)
        //{{AFX_MSG_MAP(CButtons)
        ON_COMMAND(IDOK, OnOK)
        ON_WM_CLOSE()
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

//**********************************************************************
// CButtons message handlers
//**********************************************************************

BOOL CButtons::Create()
{
    return CDialog::Create(m_nID, m_pParent);
}


void CButtons::OnOK()
{
    if (this == NULL) return;
    PostNcDestroy();
}

void CButtons::PostNcDestroy()
{
    int i;
    if (this == NULL) return;
    for (i=0; i<=numbuttondlgs; i++)
      if (m_pModelessB[i]==this) {
        m_pModelessB[i]=NULL;
        break;
      }
    delete this;
}

BOOL CButtons::OnInitDialog()
{
        CDialog::OnInitDialog();
        char title[100];
        int i;

        for (i=0; i<NUM_BUTTONS; i++) {
          m_button[i] = 0;
        }
        sprintf(title, "%d - %d", b_batch, b_batch+NUM_BUTTONS);
        SetDlgItemText(IDC_EDIT1, title);
        return TRUE;  // return TRUE unless you set the focus to a control
                      // EXCEPTION: OCX Property Pages should return FALSE
}

//  void CButtons::OnPush(int i)
//  {
//      button_push[i] = 1;
//  }

void CButtons::OnClose()
{
    m_pModelessB = NULL;
    CDialog::OnClose();
}

//  inline int CButtons::Read(int i)
//  {
//      int ans = button_push[i];
//      button_push[i] = 0;
//      return ans;
//  }

void CButtons::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CButtons)
                // NOTE: the ClassWizard will add DDX and DDV calls here
        //}}AFX_DATA_MAP
    for (int i=0; i<NUM_BUTTONS; i++) {
      DDX_Check(pDX, IDC_BUTTON1+2*i, m_button[i]);
    }
}

//**********************************************************************
// CSlider checks
//**********************************************************************

CChecks::CChecks(CWnd* pParent /*=NULL*/, int b)
        : CDialog(CChecks::IDD, pParent)
{
    //{{AFX_DATA_INIT(CChecks)
                // NOTE: the ClassWizard will add member initialization here
    //}}AFX_DATA_INIT

    m_pParent = pParent;
    m_nID = CChecks::IDD;
    c_batch = b;

    int i;
    for (i=0; i<NUM_CHECKS; i++) m_check[i] = 0;
    //    m_hIcon = AfxGetApp()->LoadIcon(DIALOG_1);
}


BEGIN_MESSAGE_MAP(CChecks, CDialog)
        //{{AFX_MSG_MAP(CChecks)
        ON_COMMAND(IDOK, OnOK)
        ON_WM_CLOSE()
        //}}AFX_MSG_MAP
END_MESSAGE_MAP()

//**********************************************************************
// CChecks message handlers
//**********************************************************************

BOOL CChecks::Create()
{
    return CDialog::Create(m_nID, m_pParent);
}

void CChecks::OnOK()
{
    if (this == NULL) return;
    PostNcDestroy();
}

void CChecks::PostNcDestroy()
{
    int i;
    if (this == NULL) return;
    for (i=0; i<=numcheckdlgs; i++)
      if (m_pModelessC[i]==this) {
        m_pModelessC[i]=NULL;
        break;
      }
    delete this;
}

//  void CChecks::OnPush(int i)
//  {
//      button_check[i] = !button_check[i];
//  }

BOOL CChecks::OnInitDialog()
{
        CDialog::OnInitDialog();
        char title[100];
        int i;

        for (i=0; i<NUM_CHECKS; i++) {
          m_check[i] = 0;
        }
        sprintf(title, "%d - %d", c_batch, c_batch+NUM_CHECKS);
        SetDlgItemText(IDC_EDIT1, title);
        return TRUE;  // return TRUE unless you set the focus to a control
                      // EXCEPTION: OCX Property Pages should return FALSE
}

void CChecks::OnClose()
{
    m_pModelessC = NULL;
    CDialog::OnClose();
}

int CChecks::Read(int i)
{
  return m_check[i];
}

void CChecks::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
        //{{AFX_DATA_MAP(CChecks)
                // NOTE: the ClassWizard will add DDX and DDV calls here
        //}}AFX_DATA_MAP
    for (int i=0; i<NUM_CHECKS; i++) {
      DDX_Check(pDX, IDC_BUTTON1+i, m_check[i]);
    }
}

