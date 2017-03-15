# Microsoft Developer Studio Generated NMAKE File, Based on SSound.dsp
!IF "$(CFG)" == ""
CFG=SSound - Win32 Debug
!MESSAGE No configuration specified. Defaulting to SSound - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "SSound - Win32 Release" && "$(CFG)" != "SSound - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "SSound.mak" CFG="SSound - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "SSound - Win32 Release" (based on "Win32 (x86) Static Library")
!MESSAGE "SSound - Win32 Debug" (based on "Win32 (x86) Static Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "SSound - Win32 Release"

OUTDIR=.\../../../lib
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../lib
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\SSound.lib"

!ELSE 

ALL : "Csound - Win32 Release" "$(OUTDIR)\SSound.lib"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CSOpcodeBase.obj"
	-@erase "$(INTDIR)\CsoundFile.obj"
	-@erase "$(INTDIR)\SSound.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\SSound.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_LIB" /D "__WIN95__" /D "__WIN32__" /D WINVER=0x0400 /D "STRICT" /D "NDEBUG" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\SSound.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\SSound.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CSOpcodeBase.obj" \
	"$(INTDIR)\CsoundFile.obj" \
	"$(INTDIR)\SSound.obj" \
	"$(OUTDIR)\Csound.lib"

"$(OUTDIR)\SSound.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ELSEIF  "$(CFG)" == "SSound - Win32 Debug"

OUTDIR=.\../../../lib
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../lib
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\SSound.lib"

!ELSE 

ALL : "Csound - Win32 Debug" "$(OUTDIR)\SSound.lib"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CSOpcodeBase.obj"
	-@erase "$(INTDIR)\CsoundFile.obj"
	-@erase "$(INTDIR)\SSound.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\SSound.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_LIB" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fp"$(INTDIR)\SSound.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\SSound.bsc" 
BSC32_SBRS= \
	
LIB32=link.exe -lib
LIB32_FLAGS=/nologo /out:"$(OUTDIR)\SSound.lib" 
LIB32_OBJS= \
	"$(INTDIR)\CSOpcodeBase.obj" \
	"$(INTDIR)\CsoundFile.obj" \
	"$(INTDIR)\SSound.obj" \
	"$(OUTDIR)\Csound.lib"

"$(OUTDIR)\SSound.lib" : "$(OUTDIR)" $(DEF_FILE) $(LIB32_OBJS)
    $(LIB32) @<<
  $(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("SSound.dep")
!INCLUDE "SSound.dep"
!ELSE 
!MESSAGE Warning: cannot find "SSound.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "SSound - Win32 Release" || "$(CFG)" == "SSound - Win32 Debug"
SOURCE=.\CSOpcodeBase.cpp

"$(INTDIR)\CSOpcodeBase.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundFile.cpp

"$(INTDIR)\CsoundFile.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\SSound.cpp

"$(INTDIR)\SSound.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "SSound - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\SSound"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\SSound"

!ELSEIF  "$(CFG)" == "SSound - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\SSound"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\SSound"

!ENDIF 


!ENDIF 

