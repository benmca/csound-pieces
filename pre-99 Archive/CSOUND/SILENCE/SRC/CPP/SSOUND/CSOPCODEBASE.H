#ifndef CSOPCODEBASE_H
#define CSOPCODEBASE_H
#include <Csound/CS.H>
#include <Csound/csound.h>
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
* Declares a C++ base class for Csound opcodes.
* Supports self-registration from within a plugin library.
* The key to understanding this arcane spell is that
* the OPDS struct is merely an ALIAS for memory managed by Csound!
* <p>
* Note: all output arguments followed by all input arguments must be declared 
* as pointers to MYFLT as the FIRST data members of the class.
* They are declared in exactly the same order as the characters 
* in the strings outypes and intypes, respectively.
*/

/**
* The opcode library registration function should be defined as follows,
* where XXXX is the exact filename (not including extension) 
* of the shared library containing the function. This function returns
* true if index refers to an implemented opcode, and fills in the
* OENTRY structure for that opcode. The opcode library can store
* the ftfind and other Csound functions for internal use.
*/

extern "C"
{
	PUBLIC int XXXX_csoundEnumerateOpcodes(int index,
		OENTRY *oentry, 
		FUNC *(*ftfind_)(int index), 
		MYFLT (*csoundGetSr_)(), 
		MYFLT (*csoundGetKr_)(),
		int (*csoundGetNchnls_)());
};

struct CsoundOpcodeBase : OPDS
{
	/**
	* DECLARE OUTPUT ARGUMENTS FOLLOWED BY INPUT ARGUMENTS HERE:
	* as pointers to MYFLT, in the same order as outypes and intypes.
	*/

	/**
	* OVERRIDE THIS: 
	* Returns a pointer to a correctly
	* filled out OENTRY struct in the argument.
	*/
	virtual void getOentry(OENTRY *oentry);
	/**
	* IMPLEMENT THIS:
	* to initialize the opcode.
	* NOT a virtual function! But it acts like one.
	*/
	void initialize(){}
	/**
	* IMPLEMENT THIS:
	* to perform krate operations.
	* At least one of koperation and aoperation must be implemented.
	* NOT a virtual function! But it acts like one.
	*/
	void koperation(){}
	/**
	* IMPLEMENT THIS:
	* to perform arate operations.
	* At least one of koperation and aoperation must be defined.
	* NOT a virtual function! But it acts like one.
	*/
	void aoperation(){}
	/**
	* IMPLEMENT THIS:
	* to deinitialize the opcode,
	* for example, deleting C++ objects allocated during initialization.
	* NOT a virtual function! But it acts like one.
	*/
	void deinitialize(){}
	/**
	* Calls getOentry to register the opcode with Csound,
	* then registers Csound with the opcode's hooks.
	*/
	virtual int csoundRegisterOpcode(int index,
		OENTRY *oentry, 
		FUNC *(*ftfind_)(int index), 
		MYFLT (*csoundGetSr_)(), 
		MYFLT (*csoundGetKr_)(),
		int (*csoundGetNchnls_)());
	/**
	* Hook into Csound, can be called by the opcode to get a function table.
	*/
	static FUNC *(*ftfind)(int index);
	/**
	* Hook into Csound, can be called by the opcode to get the audio sampling rate.
	*/
	static MYFLT (*csoundGetSr)(); 
	/**
	* Hook into Csound, can be called by the opcode to get the control rate.
	*/
	static MYFLT (*csoundGetKr)();
	/**
	* Hook into Csound, can be called to get the number of audio output channels.
	*/
	static int (*csoundGetNchnls)();
};

#endif	//	CSOPCODEBASE_H
