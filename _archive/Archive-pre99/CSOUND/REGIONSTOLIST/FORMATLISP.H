// FormatLisp.h: interface for the FormatLisp class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FORMATLISP_H__9939991E_1B83_4390_980D_4320BBE192D9__INCLUDED_)
#define AFX_FORMATLISP_H__9939991E_1B83_4390_980D_4320BBE192D9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
class FormatLisp  
{
public:
	bool Init();
	FormatLisp();
	virtual ~FormatLisp();
	int CalculateRhythm(int tempo, timepoint* t);
	std::string do_int_to_rhythmval(int rhyint);
	//(0.00 0.1 e)
	std::string gen_start_length_e(std::vector<timepoint*> tvec);
	//(0.00 0.1 [computed rhythm])
	std::string gen_start_length_computedrhythm(std::vector<timepoint*> tvec, int tempo);
	std::string m_openstring;
//	std::map<int, float, less<int>> mControl;//store table of values for q=60 at init-time
	//cheap map
	int m_imap[128];
};

#endif // !defined(AFX_FORMATLISP_H__9939991E_1B83_4390_980D_4320BBE192D9__INCLUDED_)
