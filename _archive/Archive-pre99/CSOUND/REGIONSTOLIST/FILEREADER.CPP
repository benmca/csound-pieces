// FileReader.cpp: implementation of the FileReader class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <string>
#include <vector>
#include "conio.h"
#include "stdio.h"
#include "stdlib.h"
#include "iostream.h"
#include "fstream.h"
#include "timepoint.h"
#include "FileReader.h"
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FileReader::FileReader()
{
}

FileReader::~FileReader()
{

}

int FileReader::Init(const char* inFile, const char* outFile)
{
    int ret = 0;

    m_in.open(inFile, ios::in | ios::nocreate | ios::binary);
    if(m_in.fail())
    {
        cout << "Fail to open input file " << inFile;
        ret = -1;
    }
    else
    {
        m_out.open(outFile);
        if(m_out.fail())
        {
            cout << "Fail to open output file " << outFile;
        }
    }
    
    return ret;
}

int FileReader::Parse()
{
	int buflen = 8192;
    char * srcbuf = new char[buflen];
    char * buf = new char[buflen];
	memset(srcbuf, 0, buflen);
	memset(buf, 0, buflen);
    std::string s, e;

    m_in.read(srcbuf, buflen);
	stripnullfromstream(srcbuf, buflen, buf, buflen); 
	
	std::string sbuf = buf;
	int p = sbuf.find("Region");

    while(p>0)
    {
        timepoint * t = new timepoint;
        sbuf = sbuf.substr(p, sbuf.length()-p);
        //get first 00:00.000 time
        s = sbuf.substr(6, 12);
        t->start = toseconds(s.c_str());
        //skip past ' 00:00.000 to 00:' and get next timepoint
        e = sbuf.substr(20, 12);
        t->end = toseconds(e.c_str());
        //add to vector
        timevec.push_back(t);
		sbuf = sbuf.substr(27,sbuf.length()-27);
		p = sbuf.find("Region");
    }
    return 0;

}

//convert 'mm:ss.ms' to float seconds
float FileReader::toseconds(const char* pbuf)
{
	int hours = 0;
	int min = 0;
	float secs = 0;
	sscanf((char*)pbuf, "%d:%d:%f", &hours, &min, &secs);
	secs += (hours * 360);
	secs += (min * 60);
    return secs;

}

int FileReader::stripnullfromstream(const char * src, int srclen, char * dest, int destlen)
{
	int ret = 0;
	int destdx = 0;
	char* delimit = " ";
	if(destlen <= srclen)
	{
		for(int i = 0; i<srclen; i++)
		{
			if(memcmp(src+i,delimit, 1) > 0)
			{
				memcpy(dest+destdx, src+i,1);
				destdx++;
			}
		}
	}
	else 
		ret = -1;
	return ret;
}
