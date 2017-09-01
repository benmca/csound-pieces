# Microsoft Developer Studio Project File - Name="csoundFreeverb" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=csoundFreeverb - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "csoundFreeverb.mak".
!MESSAGE 
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

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "csoundFreeverb - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "../../../bin"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /YX /FD /c
# ADD CPP /MT /W3 /GX /Zd /O2 /Ob2 /I ".." /D "NDEBUG" /D "_CONSOLE" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /FD /c
# SUBTRACT CPP /nologo /YX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 Csound.lib SSound.lib winmm.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /machine:I386 /out:"../../../bin/csoundFreeverb.OPC" /libpath:"../../../lib" /libpath:"../../../bin"
# SUBTRACT LINK32 /nologo

!ELSEIF  "$(CFG)" == "csoundFreeverb - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "../../../bin"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /YX /FD /GZ /c
# ADD CPP /MTd /W3 /Gm /GX /ZI /Od /I ".." /D "_DEBUG" /D "_CONSOLE" /D "RTAUDIO" /D "RESET" /D "SSOUND" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /D "CSOUNDFREEVERB_EXPORTS" /FD /GZ /c
# SUBTRACT CPP /nologo /YX
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 Csound.lib SSound.lib winmm.lib dsound.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /dll /debug /machine:I386 /out:"../../../bin/csoundFreeverb.OPC" /pdbtype:sept /libpath:"../../../lib" /libpath:"../../../bin"
# SUBTRACT LINK32 /nologo

!ENDIF 

# Begin Target

# Name "csoundFreeverb - Win32 Release"
# Name "csoundFreeverb - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\allpass.cpp
# End Source File
# Begin Source File

SOURCE=.\comb.cpp
# End Source File
# Begin Source File

SOURCE=.\csoundFreeverb.cpp
# End Source File
# Begin Source File

SOURCE=.\revmodel.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\allpass.hpp
# End Source File
# Begin Source File

SOURCE=.\comb.hpp
# End Source File
# Begin Source File

SOURCE=.\denormals.h
# End Source File
# Begin Source File

SOURCE=.\revmodel.hpp
# End Source File
# Begin Source File

SOURCE=.\tuning.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
