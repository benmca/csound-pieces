# Microsoft Developer Studio Generated NMAKE File, Based on hetro.dsp
!IF "$(CFG)" == ""
CFG=hetro - Win32 Release
!MESSAGE No configuration specified. Defaulting to hetro - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "hetro - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "hetro.mak" CFG="hetro - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "hetro - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\hetro___
INTDIR=.\hetro___
# Begin Custom Macros
OutDir=.\hetro___
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\hetro.exe"

!ELSE 

ALL : "$(OUTDIR)\hetro.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Het_main.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\hetro.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\hetro.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\hetro___/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\hetro.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\hetro.pdb" /machine:I386 /out:"$(OUTDIR)\hetro.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Het_main.obj" \
	".\Release\aifc.obj" \
	".\Release\Aiff.obj" \
	".\Release\Filopen.obj" \
	".\Release\getstring.obj" \
	".\Release\Hetro.obj" \
	".\Release\Ieee80.obj" \
	".\Release\Memalloc.obj" \
	".\Release\sdif-mem.obj" \
	".\Release\sdif.obj" \
	".\Release\Sfheader.obj" \
	".\Release\Soundin.obj" \
	".\Release\Ulaw.obj" \
	".\Release\Wave.obj" \
	".\Release\Winascii.obj" \
	".\Release\Window.obj" \
	".\Release\wineps.obj"

"$(OUTDIR)\hetro.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "hetro - Win32 Release"
SOURCE=..\csound\Anal\Adsyn\Het_main.c
DEP_CPP_HET_M=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ustub.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Het_main.obj" : $(SOURCE) $(DEP_CPP_HET_M) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

