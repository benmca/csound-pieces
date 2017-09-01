#include <SSound/CSOpcodeBase.h>
#include "revmodel.hpp"

struct CsoundFreeverb : public CsoundOpcodeBase
{
	MYFLT *outputL;
	MYFLT *outputR;
	MYFLT *inputL;
	MYFLT *inputR;
	MYFLT *roomsize;
	MYFLT *damp;
	MYFLT *wet;
	MYFLT *dry;
	MYFLT *width;
	MYFLT *mode;
	revmodel *reverb;
	virtual void getOentry(OENTRY *oentry)
	{
		memset(oentry, 0, sizeof(OENTRY));
		oentry->opname = "freeverb";
		oentry->dsblksiz = sizeof(*this);
		oentry->thread = 3;
		oentry->outypes = "aa";
		oentry->intypes = "aaiiiiii";
		oentry->iopadr = (SUBR) initialize_;
		oentry->kopadr = (SUBR) koperation_;
		oentry->aopadr = (SUBR) aoperation_;
		oentry->dopadr = (SUBR) deinitialize_;
		
	}
	void initialize()
	{
		if(!reverb)
		{
			reverb = new revmodel();
		}
		reverb->mute();
		reverb->setroomsize(*roomsize);
		reverb->setdamp(*damp);
		reverb->setwet(*wet);
		reverb->setdry(*dry);
		reverb->setwidth(*width);
		reverb->setmode(*mode);
	}
	static void initialize_(OPDS *opcode_)
	{
		CsoundFreeverb *opcode = (CsoundFreeverb *)opcode_;
		opcode->initialize();
	}
	void koperation()
	{
		reverb->processreplace(inputL, inputR, outputL, outputR, csoundGetKsmps(), 1);	
	}
	static void koperation_(OPDS *opcode_)
	{
		CsoundFreeverb *opcode = (CsoundFreeverb *)opcode_;
		opcode->koperation();
	}	
	void aoperation()
	{
	}
	static void aoperation_(OPDS *opcode_)
	{
		CsoundFreeverb *opcode = (CsoundFreeverb *)opcode_;
		opcode->aoperation();
	}
	void deinitialize()
	{
		if(reverb)
		{
			delete reverb;
		}
		reverb = 0;
	}
	static void deinitialize_(OPDS *opcode_)
	{
		CsoundFreeverb *opcode = (CsoundFreeverb *)opcode_;
		opcode->deinitialize();
	}
	
};

extern "C"
{
	PUBLIC int csoundFreeverb_csoundEnumerateOpcodes(int index,
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
				CsoundFreeverb opcode;
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
