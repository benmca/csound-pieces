# Microsoft Developer Studio Generated NMAKE File, Based on CsoundWindows.dsp
!IF "$(CFG)" == ""
CFG=CsoundWindows - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CsoundWindows - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "CsoundWindows - Win32 Release" && "$(CFG)" != "CsoundWindows - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CsoundWindows.mak" CFG="CsoundWindows - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CsoundWindows - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "CsoundWindows - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundWindows.exe" ".\Release\CsoundWindows.pch"

!ELSE 

ALL : "SSoundConsole - Win32 Release" "CsoundConsole - Win32 Release" "csoundStk - Win32 Release" "csoundFreeverb - Win32 Release" "SSound - Win32 Release" "CsoundVST - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\CsoundWindows.exe" ".\Release\CsoundWindows.pch"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "CsoundVST - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" "csoundFreeverb - Win32 ReleaseCLEAN" "csoundStk - Win32 ReleaseCLEAN" "CsoundConsole - Win32 ReleaseCLEAN" "SSoundConsole - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundWindows.obj"
	-@erase "$(INTDIR)\CsoundWindows.pch"
	-@erase "$(INTDIR)\CsoundWindows.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CsoundWindows.exe"
	-@erase "$(OUTDIR)\CsoundWindows.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_WINDOWS" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundWindows.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundWindows.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=csoundvst.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\CsoundWindows.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CsoundWindows.exe" /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundWindows.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CsoundWindows.res" \
	"..\..\..\lib\Csound.lib" \
	"$(OUTDIR)\CsoundVST.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundWindows.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundWindows.exe" ".\Debug\CsoundWindows.pch"

!ELSE 

ALL : "SSoundConsole - Win32 Debug" "CsoundConsole - Win32 Debug" "csoundStk - Win32 Debug" "csoundFreeverb - Win32 Debug" "SSound - Win32 Debug" "CsoundVST - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\CsoundWindows.exe" ".\Debug\CsoundWindows.pch"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "CsoundVST - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" "csoundFreeverb - Win32 DebugCLEAN" "csoundStk - Win32 DebugCLEAN" "CsoundConsole - Win32 DebugCLEAN" "SSoundConsole - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\CsoundWindows.obj"
	-@erase "$(INTDIR)\CsoundWindows.pch"
	-@erase "$(INTDIR)\CsoundWindows.res"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CsoundWindows.exe"
	-@erase "$(OUTDIR)\CsoundWindows.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_WINDOWS" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundWindows.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundWindows.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=csoundvst.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\CsoundWindows.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CsoundWindows.exe" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
LINK32_OBJS= \
	"$(INTDIR)\CsoundWindows.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CsoundWindows.res" \
	"..\..\..\lib\Csound.lib" \
	"$(OUTDIR)\CsoundVST.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundWindows.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CsoundWindows.dep")
!INCLUDE "CsoundWindows.dep"
!ELSE 
!MESSAGE Warning: cannot find "CsoundWindows.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CsoundWindows - Win32 Release" || "$(CFG)" == "CsoundWindows - Win32 Debug"
SOURCE=.\CsoundWindows.cpp

"$(INTDIR)\CsoundWindows.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundWindows.rc

"$(INTDIR)\CsoundWindows.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

CPP_SWITCHES=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_WINDOWS" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fp"$(INTDIR)\CsoundWindows.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CsoundWindows.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

CPP_SWITCHES=/MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_WINDOWS" /D "RTAUDIO" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fp"$(INTDIR)\CsoundWindows.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CsoundWindows.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\CsoundWindows"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\CsoundWindows"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"CsoundVST - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" 
   cd "..\CsoundWindows"

"CsoundVST - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"CsoundVST - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" 
   cd "..\CsoundWindows"

"CsoundVST - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundVST"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundVST.mak CFG="CsoundVST - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\CsoundWindows"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\CsoundWindows"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"csoundFreeverb - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" 
   cd "..\CsoundWindows"

"csoundFreeverb - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"csoundFreeverb - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" 
   cd "..\CsoundWindows"

"csoundFreeverb - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"csoundStk - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" 
   cd "..\CsoundWindows"

"csoundStk - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"csoundStk - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" 
   cd "..\CsoundWindows"

"csoundStk - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"CsoundConsole - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Release" 
   cd "..\CsoundWindows"

"CsoundConsole - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"CsoundConsole - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Debug" 
   cd "..\CsoundWindows"

"CsoundConsole - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\CsoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\CsoundConsole.mak CFG="CsoundConsole - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 

!IF  "$(CFG)" == "CsoundWindows - Win32 Release"

"SSoundConsole - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Release" 
   cd "..\CsoundWindows"

"SSoundConsole - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ELSEIF  "$(CFG)" == "CsoundWindows - Win32 Debug"

"SSoundConsole - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Debug" 
   cd "..\CsoundWindows"

"SSoundConsole - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSoundConsole"
   $(MAKE) /$(MAKEFLAGS) /F .\SSoundConsole.mak CFG="SSoundConsole - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundWindows"

!ENDIF 


!ENDIF 

