// FormatLisp.cpp: implementation of the FormatLisp class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include <vector>
#include <string>
#include <iostream.h>
#include <map>
#include "strstrea.h"
#include "timepoint.h"
#include "FormatLisp.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FormatLisp::FormatLisp()
{
	m_openstring = "(setf idxdur '(";

}

FormatLisp::~FormatLisp()
{

}

/*
    (setf idxdur '((.808 e) (1.246 e) (1.731 e)(2.170 e) (2.586 e) (3.024 e) (3.509 e) (3.902 e) (4.410 e) (4.918 e) 
            (5.403 q) (6.234 e) (6.765 e) (7.204 q) (8.081 q) (8.936 e) (9.444 e) (9.859 e) (10.344 e) (10.76 e) (11.198 e) 
            (11.637 e) (12.122 e) (12.561 e) (13.161 e) (13.6 e) (14.039 e) (14.547 e) (15.078 e) (15.563 e) (16.071 e) 
            (16.625 e) (17.156 e) (17.641 e) (18.149 e) (18.657 e) (19.095 e) (19.65 e) (20.134 e) (20.666 e) (21.150 e) 
            (21.682 e) (22.190 e) (22.651 h))); 44 items, for 'christmas_ball.wav
*/

std::string FormatLisp::gen_start_length_e(std::vector<timepoint*> tvec)
{
	std::string s;
	strstream mystream;
	char buf[64];
	mystream << m_openstring.c_str();
	for(int i = 0; i < tvec.size(); i++)
	{
		memset(buf,0,64);
		sprintf(buf, "(%f %f e)", tvec[i]->start, 
			(tvec[i]->end)-(tvec[i]->start));
		mystream << buf;
	}
	memset(buf,0,64);
	sprintf(buf,")); %d items", tvec.size());
	mystream << buf << ends;
	s = mystream.str();

	return s;
}

std::string FormatLisp::gen_start_length_computedrhythm(std::vector<timepoint*> tvec, int tempo)
{
	std::string s;
	strstream mystream;
	char buf[64];
	mystream << m_openstring.c_str();
	for(int i = 0; i < tvec.size(); i++)
	{
		std::string rhythmval = do_int_to_rhythmval(CalculateRhythm(tempo, tvec[i]));
		memset(buf,0,64);
		sprintf(buf, "(%f %f %s)", tvec[i]->start, 
			(tvec[i]->end)-(tvec[i]->start) , rhythmval.c_str());
		mystream << buf;
	}
	memset(buf,0,64);
	sprintf(buf,")); %d items", tvec.size());
	mystream << buf << ends;
	s = mystream.str();

	return s;
}


int FormatLisp::CalculateRhythm(int tempo, timepoint* t)
{
	int ret = 0;
	float s = t->start;
	float e = t->end;

	return ret;
}

std::string FormatLisp::do_int_to_rhythmval(int rhyint)
{
	std::string s;
	switch(rhyint)
	{
	case 1:
		s = "w";
	case 2:
		s = "h";
	case 4:
		s = "q";
	case 8:
		s = "e";
	case 16:
		s = "s";
	case 32:
		s = "32";
	case 64:
		s = "64";
	}
	return s;
}

bool FormatLisp::Init()
{

	return true;
}
