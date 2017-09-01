// FileReader.h: interface for the FileReader class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FILEREADER_H__15DB9929_76DC_48DD_BC96_26BEF7F31E8F__INCLUDED_)
#define AFX_FILEREADER_H__15DB9929_76DC_48DD_BC96_26BEF7F31E8F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class FileReader  
{
public:
	int Parse();
	int Init(const char* inFile, const char* outFile);
	FileReader();
	virtual ~FileReader();
public:
	int stripnullfromstream(const char* src, int srclen, char* dest, int destlen);
	float toseconds(const char* pbuf);
    ifstream m_in;
    ofstream m_out;
    std::vector<timepoint *> timevec;
};

#endif // !defined(AFX_FILEREADER_H__15DB9929_76DC_48DD_BC96_26BEF7F31E8F__INCLUDED_)
