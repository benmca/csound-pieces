# Microsoft Developer Studio Generated NMAKE File, Based on csoundFreeverb.dsp
!IF "$(CFG)" == ""
CFG=csoundFreeverb - Win32 Debug
!MESSAGE No configuration specified. Defaulting to csoundFreeverb - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "csoundFreeverb - Win32 Release" && "$(CFG)" != "csoundFreeverb - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "csoundFreeverb.mak" CFG="csoundFreeverb - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "csoundFreeverb - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "csoundFreeverb - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "csoundFreeverb - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\csoundFreeverb.OPC"

!ELSE 

ALL : "SSound - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\csoundFreeverb.OPC"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\allpass.obj"
	-@erase "$(INTDIR)\comb.obj"
	-@erase "$(INTDIR)\csoundFreeverb.obj"
	-@erase "$(INTDIR)\revmodel.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\csoundFreeverb.exp"
	-@erase "$(OUTDIR)\csoundFreeverb.lib"
	-@erase "$(OUTDIR)\csoundFreeverb.OPC"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /D "NDEBUG" /D "_CONSOLE" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\csoundFreeverb.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=Csound.lib SSound.lib winmm.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /incremental:no /pdb:"$(OUTDIR)\csoundFreeverb.pdb" /machine:I386 /out:"$(OUTDIR)\csoundFreeverb.OPC" /implib:"$(OUTDIR)\csoundFreeverb.lib" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\allpass.obj" \
	"$(INTDIR)\comb.obj" \
	"$(INTDIR)\csoundFreeverb.obj" \
	"$(INTDIR)\revmodel.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib"

"$(OUTDIR)\csoundFreeverb.OPC" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "csoundFreeverb - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\csoundFreeverb.OPC"

!ELSE 

ALL : "SSound - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\csoundFreeverb.OPC"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\allpass.obj"
	-@erase "$(INTDIR)\comb.obj"
	-@erase "$(INTDIR)\csoundFreeverb.obj"
	-@erase "$(INTDIR)\revmodel.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\csoundFreeverb.exp"
	-@erase "$(OUTDIR)\csoundFreeverb.ilk"
	-@erase "$(OUTDIR)\csoundFreeverb.lib"
	-@erase "$(OUTDIR)\csoundFreeverb.OPC"
	-@erase "$(OUTDIR)\csoundFreeverb.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_DEBUG" /D "_CONSOLE" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\csoundFreeverb.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=Csound.lib SSound.lib winmm.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /incremental:yes /pdb:"$(OUTDIR)\csoundFreeverb.pdb" /debug /machine:I386 /out:"$(OUTDIR)\csoundFreeverb.OPC" /implib:"$(OUTDIR)\csoundFreeverb.lib" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\allpass.obj" \
	"$(INTDIR)\comb.obj" \
	"$(INTDIR)\csoundFreeverb.obj" \
	"$(INTDIR)\revmodel.obj" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib"

"$(OUTDIR)\csoundFreeverb.OPC" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("csoundFreeverb.dep")
!INCLUDE "csoundFreeverb.dep"
!ELSE 
!MESSAGE Warning: cannot find "csoundFreeverb.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "csoundFreeverb - Win32 Release" || "$(CFG)" == "csoundFreeverb - Win32 Debug"
SOURCE=.\allpass.cpp

"$(INTDIR)\allpass.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\comb.cpp

"$(INTDIR)\comb.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\csoundFreeverb.cpp

"$(INTDIR)\csoundFreeverb.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\revmodel.cpp

"$(INTDIR)\revmodel.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "csoundFreeverb - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\csoundFreeverb"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\csoundFreeverb"

!ELSEIF  "$(CFG)" == "csoundFreeverb - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\csoundFreeverb"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\csoundFreeverb"

!ENDIF 

!IF  "$(CFG)" == "csoundFreeverb - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\csoundFreeverb"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\csoundFreeverb"

!ELSEIF  "$(CFG)" == "csoundFreeverb - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\csoundFreeverb"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\csoundFreeverb"

!ENDIF 


!ENDIF 

