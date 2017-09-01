#include <SSound/CSOpcodeBase.h>
#include <string>
#include "Object.h"
#include "Clarinet.h"
#include "Flute.h"
#include "Brass.h"
#include "Bowed.h"
#include "BlowHole.h"
#include "Plucked.h"
#include "Mandolin.h"
#include "Rhodey.h"
#include "Wurley.h"
#include "TubeBell.h"
#include "HeavyMtl.h"
#include "PercFlut.h"
#include "BeeThree.h"
#include "Moog1.h"
#include "FMVoices.h"
#include "VoicForm.h"
#include "DrumSynt.h"
#include "Shakers.h"
#include "BowedBar.h"
#include "ModalBar.h"
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
* Makes a Csound opcode out of each and every instrument in Perry Cook's
* Synthesis Tool Kit, using exactly his code.
*/

/**
* The following template class
* adapts an STK instrument to be a Csound opcode.
* Each instrument has:
* asignal output,
* ihertz input (assumed to be from cpsmidi),
* igain input (assumed to be from veloc 0, 1),
* kstatus input (assumed to be from midiin),
* kchannel input (assumed to be from midiin),
* kdata1 input (assumed to be from midiin),
* kdata2 input (assumed to be from midiin).
*/
template<class T>
struct StkAdapter0Args : public CsoundOpcodeBase
{
	MYFLT *aoutput;
	MYFLT *ihertz;
	MYFLT *igain;
	MYFLT *kstatus;
	MYFLT *kchannel;
	MYFLT *kdata1;
	MYFLT *kdata2;
	char *name;
	T *implementation;
	int sampleCount;
	virtual void getOentry(OENTRY *oentry)
	{
		memset(oentry, 0, sizeof(OENTRY));
		oentry->opname = name;
		oentry->dsblksiz = sizeof(*this);
		oentry->thread = 3;
		oentry->outypes = "a";
		oentry->intypes = "iikkkk";
		oentry->iopadr = (SUBR) initialize_;
		oentry->kopadr = (SUBR) koperation_;
		oentry->aopadr = (SUBR) aoperation_;
		oentry->dopadr = (SUBR) deinitialize_;
	}
	void initialize()
	{
		if(!implementation)
		{
			implementation = new T;
		}
		implementation->noteOn(*ihertz, *igain);
	}
	static void initialize_(OPDS *opcode_)
	{
		StkAdapter0Args<T> *opcode = (StkAdapter0Args<T> *)opcode_;
		opcode->initialize();
	}
	void koperation()
	{
		switch(int(*kstatus))
		{
		case 0:
			break;
		case 128:
			implementation->noteOff(*kdata2);
			break;
		case 144:
			implementation->noteOn(*kdata1, *kdata2);
			break;
		case 176:
			implementation->controlChange(int(*kdata1), *kdata2);
			break;
		}
		MYFLT* output = aoutput;
		for(int i = 0, n = csoundGetKsmps(); i < n; i++)
		{
			output[i] = implementation->tick();
		}
	}
	static void koperation_(OPDS *opcode_)
	{
		StkAdapter0Args<T> *opcode = (StkAdapter0Args<T> *)opcode_;
		opcode->koperation();
	}	
	void aoperation()
	{
	}
	static void aoperation_(OPDS *opcode_)
	{
		StkAdapter0Args<T> *opcode = (StkAdapter0Args<T> *)opcode_;
		opcode->aoperation();
	}
	void deinitialize()
	{
		if(implementation)
		{
			delete implementation;
		}
		implementation = 0;
	}
	static void deinitialize_(OPDS *opcode_)
	{
		StkAdapter0Args<T> *opcode = (StkAdapter0Args<T> *)opcode_;
		opcode->deinitialize();
	}
};

/**
* Identical to StkAdapter0Args, except that the STK instrument constructor
* takes 1 argument (usually lowest frequency, defaulting to 32).
*/
template<class T, int B=32>
struct StkAdapter1Args : public CsoundOpcodeBase
{
	MYFLT *aoutput;
	MYFLT *ihertz;
	MYFLT *igain;
	MYFLT *kstatus;
	MYFLT *kchannel;
	MYFLT *kdata1;
	MYFLT *kdata2;
	char *name;
	T *implementation;
	int sampleCount;
	virtual void getOentry(OENTRY *oentry)
	{
		memset(oentry, 0, sizeof(OENTRY));
		oentry->opname = name;
		oentry->dsblksiz = sizeof(*this);
		oentry->thread = 3;
		oentry->outypes = "a";
		oentry->intypes = "iikkkk";
		oentry->iopadr = (SUBR) initialize_;
		oentry->kopadr = (SUBR) koperation_;
		oentry->aopadr = (SUBR) aoperation_;
		oentry->dopadr = (SUBR) deinitialize_;
	}
	void initialize()
	{
		if(!implementation)
		{
			implementation = new T(B);
		}
		implementation->noteOn(*ihertz, *igain);
	}
	static void initialize_(OPDS *opcode_)
	{
		StkAdapter1Args<T, B> *opcode = (StkAdapter1Args<T, B> *)opcode_;
		opcode->initialize();
	}
	void koperation()
	{
		switch(int(*kstatus))
		{
		case 0:
			break;
		case 128:
			implementation->noteOff(*kdata2);
			break;
		case 144:
			implementation->noteOn(*kdata1, *kdata2);
			break;
		case 176:
			implementation->controlChange(int(*kdata1), *kdata2);
			break;
		}
		MYFLT* output = aoutput;
		for(int i = 0, n = csoundGetKsmps(); i < n; i++)
		{
			output[i] = implementation->tick();
		}
	}
	static void koperation_(OPDS *opcode_)
	{
		StkAdapter1Args<T, B> *opcode = (StkAdapter1Args<T, B> *)opcode_;
		opcode->koperation();
	}	
	void aoperation()
	{
	}
	static void aoperation_(OPDS *opcode_)
	{
		StkAdapter1Args<T, B> *opcode = (StkAdapter1Args<T, B> *)opcode_;
		opcode->aoperation();
	}
	void deinitialize()
	{
		if(implementation)
		{
			delete implementation;
		}
		implementation = 0;
	}
	static void deinitialize_(OPDS *opcode_)
	{
		StkAdapter1Args<T, B> *opcode = (StkAdapter1Args<T, B> *)opcode_;
		opcode->deinitialize();
	}
};

extern "C"
{
	static bool initialized = false;
	
	PUBLIC int csoundStk_csoundEnumerateOpcodes(int index,
		OENTRY *oentry, 
		FUNC *(*ftfind_)(int index), 
		MYFLT (*csoundGetSr_)(), 
		MYFLT (*csoundGetKr_)(),
		int (*csoundGetNchnls_)())
	{
		if(!initialized)
		{
			char *csoundHome_ = getenv("STK_HOME");
			if(csoundHome_)
			{
				std::string csoundHome = csoundHome_;
				int i = csoundHome.find_last_of("\\");
				if(i != csoundHome.length() - 1)
				{
					csoundHome.append("\\");
				}
				RAWWAVE_PATH = strdup(csoundHome.c_str());
			}
			initialized = true;
		}
		switch(index)
		{
		case 0:
			{
				StkAdapter1Args<Clarinet> opcode;
				opcode.name = "stkclarinet";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
		case 1:
			{
				StkAdapter1Args<Flute> opcode;
				opcode.name = "stkflute";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 2:
			{
				StkAdapter1Args<Brass, 32> opcode;
				opcode.name = "stkbrass";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 3:
			{
				StkAdapter1Args<Bowed> opcode;
				opcode.name = "stkbowed";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 4:
			{
				StkAdapter1Args<BlowHole> opcode;
				opcode.name = "stkblowhole";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 5:
			{
				StkAdapter1Args<Plucked> opcode;
				opcode.name = "stkplucked";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 6:
			{
				StkAdapter1Args<Mandolin> opcode;
				opcode.name = "stkmandolin";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 7:
			{
				StkAdapter0Args<Rhodey> opcode;
				opcode.name = "stkrhodey";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 8:
			{
				StkAdapter0Args<Wurley> opcode;
				opcode.name = "stkwurley";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 9:
			{
				StkAdapter1Args<TubeBell> opcode;
				opcode.name = "stktubebell";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 10:
			{
				StkAdapter0Args<HeavyMtl> opcode;
				opcode.name = "stkheavymtl";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 11:
			{
				StkAdapter0Args<PercFlut> opcode;
				opcode.name = "stkpercflut";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 12:
			{
				StkAdapter0Args<BeeThree> opcode;
				opcode.name = "stkbeethree";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 13:
			{
				StkAdapter0Args<Moog1> opcode;
				opcode.name = "stkmoog";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 14:
			{
				StkAdapter0Args<FMVoices> opcode;
				opcode.name = "stkfmvoices";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 15:
			{
				StkAdapter0Args<VoicForm> opcode;
				opcode.name = "stkvoicform";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 16:
			{
				StkAdapter0Args<DrumSynt> opcode;
				opcode.name = "stkdrumsynt";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 17:
			{
				StkAdapter0Args<Shakers> opcode;
				opcode.name = "stkshakers";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 18:
			{
				StkAdapter0Args<BowedBar> opcode;
				opcode.name = "stkbowedbar";
				return opcode.csoundRegisterOpcode(index, 
					oentry, 
					ftfind_, 
					csoundGetSr_, 
					csoundGetKr_, 
					csoundGetNchnls_);
			}
			break;
		case 19:
			{
				StkAdapter0Args<ModalBar> opcode;
				opcode.name = "stkmodalbar";
				return opcode.csoundRegisterOpcode(index, 
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
