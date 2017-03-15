// regionstolist.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <string>
#include <vector>
#include <map>
#include "conio.h"
#include "stdio.h"
#include "iostream.h"
#include "fstream.h"
#include "timepoint.h"
#include "FileReader.h"
#include "FormatLisp.h"

void PrintUsage()
{
	cout << "regionstolist.exe" << endl << endl;
	cout << "Usage:" << endl;
	cout << "   regionstolist filename1 [filename2]" << endl;
	cout << "       filename1: regions list file (playlist) output from Soundforge 4.5" << endl;
	cout << "       filename2: output file containing formatted lisp code" << endl;
}


int main(int argc, char* argv[])
{
    FileReader fr;
	if(argc < 3)
	{
		PrintUsage();
	}
	else
	{
        fr.Init(argv[1], argv[2]);
        fr.Parse();
		FormatLisp l;
		std::string s;
		s = l.gen_start_length_e(fr.timevec);
		cout << "gen_start_length_e" << endl << s.c_str() << endl;
		fr.m_out << s.c_str() << endl;
//		s = l.gen_start_length_computedrhythm(fr.timevec, 120);
//		cout << "gen_start_length_computedrhythm" << endl << s.c_str() << endl;
	}
	return 0;
}
