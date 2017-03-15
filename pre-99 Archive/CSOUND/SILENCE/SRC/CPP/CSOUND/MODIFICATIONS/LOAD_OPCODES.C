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
*/
#include <io.h>
#include <direct.h>
#include <windows.h>
#include "cs.h"
#include "csound.h"

int csoundLoadLibrary(const char *libraryPath)
{
	long library = 0;
#ifdef WIN32
	library = (long) LoadLibrary(libraryPath);
#endif
	return library;
}

int csoundLibraryProcedureAddressGet(long library, 
									 const char *procedureName)
{
	void *procedureAddress = NULL;
#ifdef WIN32
	procedureAddress = GetProcAddress(library, 
		procedureName);
#endif
	return (long) procedureAddress;
}

long csoundLoadOpcodes(const char* libraryPath)
{
	long returnValue = 0;
	long opcodeSubscript;
	char procedureName[0x200];
	char libraryName[0x100];
	struct oentry opcode;
	CsoundEnumerateOpcodesType csoundEnumerateOpcodes = 0;
	/*	
	*	Load the opcode's shared library.
	*/	
	int opcodesRegistered = 0;
	int library = csoundLoadLibrary(libraryPath);
	if(library == 0)	
	{
		return 0;
	}
	/*
	*	Get the address of the opcode's registration function.
	*/
#ifdef WIN32
	_splitpath(libraryPath, 
		0, 
		0, 
		libraryName, 
		0);
#else
	strcpy(libraryName, librarypath);
#endif
	
	sprintf(procedureName, "%s_csoundEnumerateOpcodes", libraryName);
	csoundEnumerateOpcodes = (CsoundEnumerateOpcodesType *)csoundLibraryProcedureAddressGet(library, 
		procedureName);
	if(csoundEnumerateOpcodes == NULL)
	{
		return 0;
	}
	/*	
	*	Iterate through and register all the opcodes in the library.
	*/
	for(opcodeSubscript = 0, opcodesRegistered = 0; ; opcodeSubscript++)
	{
		returnValue = csoundEnumerateOpcodes(opcodeSubscript,
		&opcode,
		ftfind,
		csoundGetSr,
		csoundGetKr,
		csoundGetNchnls);
		if(returnValue <= 0)
		{
			break;
		}
		csoundAppendOpcode(&opcode);
	}
	return opcodesRegistered;
}

long csoundLoadAllOpcodes()
{
	long returnValue = 0;
	char opcodeDirectory[MAX_PATH + 1];
	char opcodePath[MAX_PATH + 1];
	char drive[_MAX_DRIVE];
	char dir[_MAX_DIR];
	char *opcodeEnvironmentDirectory = NULL;
	struct _finddata_t findData;
	long search = 0;
	int opcodesRegistered = 0;
	if(returnValue)
	{
		returnValue = putenv("CSOUND_HOME=C:\\Gogins\\Develop\\Silence\\Install");
	}
	opcodeEnvironmentDirectory = getenv("CSOUND_HOME");
	if(opcodeEnvironmentDirectory != NULL)
	{
		strncpy(opcodeDirectory, 
			opcodeEnvironmentDirectory, 
			MAX_PATH);
		sprintf(opcodePath, 
			"%s\\%s\0", 
			opcodeDirectory, 
			"*.OPC");
	}
	/*
	*	Otherwise, use the current working directory,
	*	hopefully the Csound directory.
	*/
	else
	{
#ifdef WIN32
		GetModuleFileName(0, 
			opcodeDirectory, 
			_MAX_PATH);
		_splitpath(opcodeDirectory, 
			drive, 
			dir, 
			0, 
			0);
		sprintf(opcodeDirectory, 
			"%s%s\0", 
			drive,
			dir);
		sprintf(opcodePath, 
			"%s%s%s\0", 
			drive,
			dir, 
			"*.OPC");
#else
		getcwd(opcodeDirectory,
			_MAX_PATH);
		sprintf(opcodePath, 
			"%s/%s\0", 
			opcodeDirectory,
			"*.OPC");
#endif
	}
	search = _findfirst(opcodePath, &findData);
	if(search == -1)
	{
		_findclose(search);
		return 0;
	}
	else
	{
		sprintf(opcodePath, 
			"%s\\%s\0", 
			opcodeDirectory, 
			findData.name);
		opcodesRegistered += csoundLoadOpcodes(opcodePath);
	}
	sprintf(opcodePath, 
		"%s\\%s\0", 
		opcodeDirectory, 
		findData.name);
		/*
		*	Register all OPC libraries in the opcode directory.
	*/
	while(_findnext(search, 
		&findData) == 0)
	{
		sprintf(opcodePath, 
			"%s\\%s\0", 
			opcodeDirectory, 
			findData.name);
		returnValue = csoundLoadOpcodes(opcodePath);
	}
	_findclose(search);
	return returnValue;
}
