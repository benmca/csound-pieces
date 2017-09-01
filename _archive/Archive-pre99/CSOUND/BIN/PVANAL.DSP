# Microsoft Developer Studio Project File - Name="pvanal" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=pvanal - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "pvanal.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "pvanal.mak" CFG="pvanal - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "pvanal - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe
# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "pvanal__"
# PROP BASE Intermediate_Dir "pvanal__"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "pvanal__"
# PROP Intermediate_Dir "pvanal__"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# Begin Target

# Name "pvanal - Win32 Release"
# Begin Source File

SOURCE=.\Release\aifc.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Aiff.obj
# End Source File
# Begin Source File

SOURCE=.\Release\dsputil.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Fft.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Filopen.obj
# End Source File
# Begin Source File

SOURCE=.\Release\getstring.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Ieee80.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Memalloc.obj
# End Source File
# Begin Source File

SOURCE=.\Release\mxfft.obj
# End Source File
# Begin Source File

SOURCE=..\csound\Anal\Pvoc\Pv_main.c
# End Source File
# Begin Source File

SOURCE=.\Release\Pvanal.obj
# End Source File
# Begin Source File

SOURCE=.\Release\pvfileio.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Pvoc.obj
# End Source File
# Begin Source File

SOURCE=.\Release\pvxanal.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Sfheader.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Soundin.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Ulaw.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Wave.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Winascii.obj
# End Source File
# Begin Source File

SOURCE=.\Release\Window.obj
# End Source File
# Begin Source File

SOURCE=.\Release\wineps.obj
# End Source File
# End Target
# End Project
