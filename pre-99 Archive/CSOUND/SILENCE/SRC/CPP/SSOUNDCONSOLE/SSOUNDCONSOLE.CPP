#include <CsoundVST/CsoundVST.h>
#include <iostream.h>
#include <time.h>
/**
* S I L E N C E
* 
* An auto-extensible system for making music on computers by means of software alone.
* Copyright (c) 2001 by Michael Gogins. All rights reserved.
*
* L I C E N S E
*
* This software is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* This software is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this software; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* P U R P O S E
*
* Shows how to use CsoundVST as a plugin software synthesizer 
* in a generic C++ console program.
*
*/
int main(int argc, char* argv[])
{
	try
	{
		cout << "S S O U N D" << endl;
		cout << "Csound for Silence" << endl;
		cout << "Copyright (C) 1988, 2001 by MIT and Michael Gogins" << endl;
		CsoundVST *csoundVST = CreateCsoundVST();
		double startedAt = clock() / (double) CLOCKS_PER_SEC;
		if(!csoundVST->compile(argc, argv))
		{
			while(!csoundVST->performKsmps());
			csoundVST->cleanup();
			csoundVST->reset();
		}
		double endedAt = clock() / (double) CLOCKS_PER_SEC;
		double elapsed = endedAt - startedAt;
		fprintf(stderr, "Total processing time: %.3lf seconds.\n", elapsed);
		cout << "FINISHED." << endl;
		delete csoundVST;
	}
	catch(char *x)
	{
		cerr << "Exception: " << x << endl;
		return -1;
	}
	return 0;
}
