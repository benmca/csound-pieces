#include <SSound/CSOpcodeBase.h>
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
* Implements a C++ base class for Csound opcodes.
*/
FUNC *(*CsoundOpcodeBase::ftfind)(int index) = 0;
MYFLT (*CsoundOpcodeBase::csoundGetSr)() = 0; 
MYFLT (*CsoundOpcodeBase::csoundGetKr)() = 0;
int (*CsoundOpcodeBase::csoundGetNchnls)() = 0;

int CsoundOpcodeBase::csoundRegisterOpcode(int index,
									   OENTRY *opcode, 
									   FUNC *(*ftfind_)(int index), 
									   MYFLT (*csoundGetSr_)(), 
									   MYFLT (*csoundGetKr_)(),
									   int (*csoundGetNchnls_)())
{
	//	Register this opcode with Csound.
	getOentry(opcode);
	//	Register Csound with this opcode.
	ftfind = ftfind_;
	csoundGetSr = csoundGetSr_;
	csoundGetKr = csoundGetKr_;
	csoundGetNchnls = csoundGetNchnls_;
	return 1;
}

void CsoundOpcodeBase::getOentry(OENTRY *oentry)
{
	//	Fill in the OENTRY structure.
	memset(oentry, 0, sizeof(OENTRY));
	oentry->opname = "CsoundOpcodeBase";
	oentry->dsblksiz = sizeof(*this);
	oentry->thread = 3;
	oentry->outypes = "a";
	oentry->intypes = "iiii";
	oentry->iopadr = 0;
	oentry->kopadr = 0;
	oentry->aopadr = 0;
	oentry->dopadr = 0;
}

CsoundOpcodeBase csoundOpcodeBase;

extern "C"
{
	PUBLIC int CsoundVST_csoundEnumerateOpcodes(int index,
		OENTRY *oentry, 
		FUNC *(*ftfind_)(int index), 
		MYFLT (*csoundGetSr_)(), 
		MYFLT (*csoundGetKr_)(),
		int (*csoundGetNchnls_)())
	{
		switch(index)
		{
		case 0:
			{
				return csoundOpcodeBase.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		default:
			return 0;
		}
	}
};

