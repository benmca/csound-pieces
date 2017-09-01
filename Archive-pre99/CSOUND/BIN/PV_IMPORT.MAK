# Microsoft Developer Studio Generated NMAKE File, Based on pv_import.dsp
!IF "$(CFG)" == ""
CFG=PV_IMPORT - WIN32 RELEASE
!MESSAGE No configuration specified. Defaulting to PV_IMPORT - WIN32 RELEASE.
!ENDIF 

!IF "$(CFG)" != "pv_import - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "pv_import.mak" CFG="PV_IMPORT - WIN32 RELEASE"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "pv_import - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

OUTDIR=.\pv_impor
INTDIR=.\pv_impor
# Begin Custom Macros
OutDir=.\pv_impor
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\pv_import.exe"

!ELSE 

ALL : "$(OUTDIR)\pv_import.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\Pv_impor.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\pv_import.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D\
 "_MBCS" /Fp"$(INTDIR)\pv_import.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD\
 /c 
CPP_OBJS=.\pv_impor/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\pv_import.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)\pv_import.pdb" /machine:I386 /out:"$(OUTDIR)\pv_import.exe" 
LINK32_OBJS= \
	"$(INTDIR)\Pv_impor.obj" \
	".\Release\getstring.obj"

"$(OUTDIR)\pv_import.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<


!IF "$(CFG)" == "pv_import - Win32 Release"
SOURCE=..\csound\Pv_impor.c
DEP_CPP_PV_IM=\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	

"$(INTDIR)\Pv_impor.obj" : $(SOURCE) $(DEP_CPP_PV_IM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

