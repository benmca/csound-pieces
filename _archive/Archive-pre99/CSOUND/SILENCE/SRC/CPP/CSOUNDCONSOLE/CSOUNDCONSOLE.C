#include <Csound/csound.h>
#include <stdio.h>
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
* Shows how to use the Csound API 
* in a generic C console program.
*
*/
int main(int argc, char **argv)
{
	double endedAt = 0;
	double elapsed = 0;
	double startedAt = clock() / (double) CLOCKS_PER_SEC;
	fprintf(stderr, "C S O U N D\n");
	fprintf(stderr, "Copyright (C) 1988, 2001 by MIT\n");
	// 22.181 seconds to perform trapped.csd on Dell Inspiron 8000x with csoundPerform.
	// csoundPerform(argc, argv); 
	// 22.562 seconds to perform trapped.csd on Dell Inspiron 8000 with csoundCompile & csoundPerformKsmps.
	if(!csoundCompile(argc, argv)) 
	{
		while(!csoundPerformKsmps());
		csoundCleanup();
		csoundReset();
	}
	endedAt = clock() / (double) CLOCKS_PER_SEC;
	elapsed = endedAt - startedAt;
	fprintf(stderr, "Total processing time: %.3lf seconds.\n", elapsed);
	fprintf(stderr, "FINISHED.\n");
	return 0;
}
