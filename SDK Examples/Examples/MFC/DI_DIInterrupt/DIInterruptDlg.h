// DI InterruptDlg.h : header file
//

#pragma once
#include "ConfigurationDlg.h"
#include "afxwin.h"
#include "afxcmn.h"
#include "PictureEx.h"

/////////////////////////////////////////////////////////////////////////////
// CDIInterruptDlg dialog
class CDIInterruptDlg : public CDialog
{
// Construction
public:
	CDIInterruptDlg(CWnd* pParent = NULL);	
	~CDIInterruptDlg();
	// standard constructor
   LRESULT OnConfDevice(WPARAM w,LPARAM l);
	void ConfigureDevice();
   void ConfigurePanel();
	void CheckError(ErrorCode errorCode);
	// Dialog Data	
	enum { IDD = IDD_DIINTERRUPT_DIALOG };
   // this function is used to deal with "Interrupt"Event.
  static void  BDAQCALL OnDiSnapEvent(void * sender, DiSnapEventArgs * args, void * userParam);
	// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	HICON m_hIcon;
	// Generated message map functions
	//{{AFX_MSG(CDIInterruptDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg LRESULT OnUpdateList(WPARAM wParam, LPARAM lParam); 
	afx_msg void OnBnClickedConfig();
	afx_msg void OnClickedStart();
	afx_msg void OnClickedStop();
	//}}AFX_MSG

private:
   InstantDiCtrl *      m_instantDiCtrl;
   DevConfParam         m_confParam; // the device's configure information from config form.
   CConfigurationDlg	   m_confDlg;

   int m_eventCount;
	CListCtrl m_list;
	CPictureEx m_gifPic;	
	DECLARE_MESSAGE_MAP()
};
