# Microsoft Developer Studio Generated NMAKE File, Based on cvanal.dsp
!IF "$(CFG)" == ""
CFG=cvanal - Win32 Release
!MESSAGE No configuration specified. Defaulting to cvanal - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "cvanal - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cvanal.mak" CFG="cvanal - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cvanal - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\cvanal__
INTDIR=.\cvanal__
# Begin Custom Macros
OutDir=.\cvanal__
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\cvanal.exe"

!ELSE 

ALL : "$(OUTDIR)\cvanal.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\cv_main.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\cvanal.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\cvanal.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\cvanal__/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\cvanal.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\cvanal.pdb" /machine:I386 /out:"$(OUTDIR)\cvanal.exe" 
LINK32_OBJS= \
	"$(INTDIR)\cv_main.obj" \
	".\Release\aifc.obj" \
	".\Release\Aiff.obj" \
	".\Release\Cvanal.obj" \
	".\Release\dsputil.obj" \
	".\Release\Fft.obj" \
	".\Release\Filopen.obj" \
	".\Release\getstring.obj" \
	".\Release\Ieee80.obj" \
	".\Release\Memalloc.obj" \
	".\Release\Sfheader.obj" \
	".\Release\Soundin.obj" \
	".\Release\Ulaw.obj" \
	".\Release\Wave.obj"

"$(OUTDIR)\cvanal.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "cvanal - Win32 Release"
SOURCE=..\csound\Anal\cvanal\cv_main.c
DEP_CPP_CV_MA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ustub.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cv_main.obj" : $(SOURCE) $(DEP_CPP_CV_MA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

