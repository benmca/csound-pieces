# Microsoft Developer Studio Generated NMAKE File, Based on CsoundVST.dsp
!IF "$(CFG)" == ""
CFG=CsoundVST - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CsoundVST - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "CsoundVST - Win32 Release" && "$(CFG)" != "CsoundVST - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CsoundVST.mak" CFG="CsoundVST - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CsoundVST - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "CsoundVST - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "CsoundVST - Win32 Release"

OUTDIR=.\../../../bin
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundVST.dll"

!ELSE 

ALL : "csoundStk - Win32 Release" "csoundFreeverb - Win32 Release" "SSound - Win32 Release" "Csound - Win32 Release" "$(OUTDIR)\CsoundVST.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 ReleaseCLEAN" "SSound - Win32 ReleaseCLEAN" "csoundFreeverb - Win32 ReleaseCLEAN" "csoundStk - Win32 ReleaseCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\AudioEffect.obj"
	-@erase "$(INTDIR)\audioeffectx.obj"
	-@erase "$(INTDIR)\CsoundView.obj"
	-@erase "$(INTDIR)\CsoundVST.obj"
	-@erase "$(INTDIR)\CsoundVST.res"
	-@erase "$(INTDIR)\Silence_Orchestra_Csound.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CsoundVST.dll"
	-@erase "$(OUTDIR)\CsoundVST.exp"
	-@erase "$(OUTDIR)\CsoundVST.lib"
	-@erase "$(OUTDIR)\CsoundVST.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MT /W3 /GX /Zd /O2 /Ob2 /I ".." /I "." /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDVST_EXPORTS" /D "NDEBUG" /D "RTAUDIO" /D "STRICT" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "MEMDEBUG" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundVST.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundVST.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=Csound.lib SSound.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib comctl32.lib rpcrt4.lib wsock32.lib winmm.lib wx.lib png.lib zlib.lib jpeg.lib tiff.lib /dll /incremental:no /pdb:"$(OUTDIR)\CsoundVST.pdb" /debug /machine:I386 /def:".\CsoundVST.def" /out:"$(OUTDIR)\CsoundVST.dll" /implib:"$(OUTDIR)\CsoundVST.lib" /libpath:"../../../lib" /libpath:"../../../bin" 
DEF_FILE= \
	".\CsoundVST.def"
LINK32_OBJS= \
	"$(INTDIR)\AudioEffect.obj" \
	"$(INTDIR)\audioeffectx.obj" \
	"$(INTDIR)\CsoundView.obj" \
	"$(INTDIR)\CsoundVST.obj" \
	"$(INTDIR)\Silence_Orchestra_Csound.obj" \
	"$(INTDIR)\CsoundVST.res" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundVST.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CsoundVST - Win32 Debug"

OUTDIR=.\../../../bin
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\../../../bin
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\CsoundVST.dll"

!ELSE 

ALL : "csoundStk - Win32 Debug" "csoundFreeverb - Win32 Debug" "SSound - Win32 Debug" "Csound - Win32 Debug" "$(OUTDIR)\CsoundVST.dll"

!ENDIF 

!IF "$(RECURSE)" == "1" 
CLEAN :"Csound - Win32 DebugCLEAN" "SSound - Win32 DebugCLEAN" "csoundFreeverb - Win32 DebugCLEAN" "csoundStk - Win32 DebugCLEAN" 
!ELSE 
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\AudioEffect.obj"
	-@erase "$(INTDIR)\audioeffectx.obj"
	-@erase "$(INTDIR)\CsoundView.obj"
	-@erase "$(INTDIR)\CsoundVST.obj"
	-@erase "$(INTDIR)\CsoundVST.res"
	-@erase "$(INTDIR)\Silence_Orchestra_Csound.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CsoundVST.dll"
	-@erase "$(OUTDIR)\CsoundVST.exp"
	-@erase "$(OUTDIR)\CsoundVST.ilk"
	-@erase "$(OUTDIR)\CsoundVST.lib"
	-@erase "$(OUTDIR)\CsoundVST.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"

CPP=cl.exe
CPP_PROJ=/MTd /W3 /Gm /GX /ZI /Od /I "../SSoundLib" /I ".." /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDVST_EXPORTS" /D "_DEBUG" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\CsoundVST.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CsoundVST.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=Csound.lib SSound.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib comctl32.lib rpcrt4.lib wsock32.lib winmm.lib /dll /incremental:yes /pdb:"$(OUTDIR)\CsoundVST.pdb" /debug /machine:I386 /def:".\CsoundVST.def" /force /out:"$(OUTDIR)\CsoundVST.dll" /implib:"$(OUTDIR)\CsoundVST.lib" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin" 
DEF_FILE= \
	".\CsoundVST.def"
LINK32_OBJS= \
	"$(INTDIR)\AudioEffect.obj" \
	"$(INTDIR)\audioeffectx.obj" \
	"$(INTDIR)\CsoundView.obj" \
	"$(INTDIR)\CsoundVST.obj" \
	"$(INTDIR)\Silence_Orchestra_Csound.obj" \
	"$(INTDIR)\CsoundVST.res" \
	"..\..\..\lib\Csound.lib" \
	"..\..\..\lib\SSound.lib" \
	"$(OUTDIR)\csoundFreeverb.lib" \
	"$(OUTDIR)\csoundStk.lib"

"$(OUTDIR)\CsoundVST.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CsoundVST.dep")
!INCLUDE "CsoundVST.dep"
!ELSE 
!MESSAGE Warning: cannot find "CsoundVST.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CsoundVST - Win32 Release" || "$(CFG)" == "CsoundVST - Win32 Debug"
SOURCE=.\AudioEffect.cpp

"$(INTDIR)\AudioEffect.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\audioeffectx.cpp

"$(INTDIR)\audioeffectx.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundView.cpp

"$(INTDIR)\CsoundView.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundVST.cpp

"$(INTDIR)\CsoundVST.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\CsoundVST.rc

"$(INTDIR)\CsoundVST.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\Silence_Orchestra_Csound.cpp

"$(INTDIR)\Silence_Orchestra_Csound.obj" : $(SOURCE) "$(INTDIR)"


!IF  "$(CFG)" == "CsoundVST - Win32 Release"

"Csound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" 
   cd "..\CsoundVST"

"Csound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ELSEIF  "$(CFG)" == "CsoundVST - Win32 Debug"

"Csound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" 
   cd "..\CsoundVST"

"Csound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\Csound"
   $(MAKE) /$(MAKEFLAGS) /F .\Csound.mak CFG="Csound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ENDIF 

!IF  "$(CFG)" == "CsoundVST - Win32 Release"

"SSound - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" 
   cd "..\CsoundVST"

"SSound - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ELSEIF  "$(CFG)" == "CsoundVST - Win32 Debug"

"SSound - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" 
   cd "..\CsoundVST"

"SSound - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\SSound"
   $(MAKE) /$(MAKEFLAGS) /F .\SSound.mak CFG="SSound - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ENDIF 

!IF  "$(CFG)" == "CsoundVST - Win32 Release"

"csoundFreeverb - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" 
   cd "..\CsoundVST"

"csoundFreeverb - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ELSEIF  "$(CFG)" == "CsoundVST - Win32 Debug"

"csoundFreeverb - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" 
   cd "..\CsoundVST"

"csoundFreeverb - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundFreeverb"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundFreeverb.mak CFG="csoundFreeverb - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ENDIF 

!IF  "$(CFG)" == "CsoundVST - Win32 Release"

"csoundStk - Win32 Release" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" 
   cd "..\CsoundVST"

"csoundStk - Win32 ReleaseCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Release" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ELSEIF  "$(CFG)" == "CsoundVST - Win32 Debug"

"csoundStk - Win32 Debug" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" 
   cd "..\CsoundVST"

"csoundStk - Win32 DebugCLEAN" : 
   cd "\Cygwin\home\mkg\Silence\src\cpp\csoundStk"
   $(MAKE) /$(MAKEFLAGS) /F .\csoundStk.mak CFG="csoundStk - Win32 Debug" RECURSE=1 CLEAN 
   cd "..\CsoundVST"

!ENDIF 


!ENDIF 

