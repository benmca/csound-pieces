# Microsoft Developer Studio Project File - Name="DirectCsoundWin" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=DirectCsoundWin - Win32 double Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "DirectCsoundWin.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DirectCsoundWin.mak" CFG="DirectCsoundWin - Win32 double Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DirectCsoundWin - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "DirectCsoundWin - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "DirectCsoundWin - Win32 double Release" (based on "Win32 (x86) Application")
!MESSAGE "DirectCsoundWin - Win32 double Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRelease"
# PROP Intermediate_Dir "WinRelease"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10" /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /YX /FD /c
# SUBTRACT CPP /Fr
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x410 /d "NDEBUG"
# ADD RSC /l 0x410 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib fltk.lib opengl32.lib /nologo /subsystem:windows /machine:I386 /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Release" /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib"
# SUBTRACT LINK32 /nodefaultlib

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10" /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x410 /d "_DEBUG"
# ADD RSC /l 0x410 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib fltkd.lib opengl32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Debug" /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "DirectCs"
# PROP BASE Intermediate_Dir "DirectCs"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRelDouble"
# PROP Intermediate_Dir "WinRelDouble"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /FR /YX /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10" /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /D MYFLT=double /FR /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x410 /d "NDEBUG"
# ADD RSC /l 0x410 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"libcmt.lib" /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Release"
# ADD LINK32 dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib fltk.lib opengl32.lib /nologo /subsystem:windows /machine:I386 /out:"WinRelDouble/DirectCsoundWin64.exe" /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Release" /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "DirectC0"
# PROP BASE Intermediate_Dir "DirectC0"
# PROP BASE Ignore_Export_Lib 0
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebDouble"
# PROP Intermediate_Dir "WinDebDouble"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /FR /YX /FD /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "./" /I "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "GAB_WIN" /D "RESET" /D MYFLT=double /FR /YX /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x410 /d "_DEBUG"
# ADD RSC /l 0x410 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Debug"
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib libtiff.lib libjpeg.lib libpng.lib /nologo /subsystem:windows /debug /machine:I386 /out:"WinDebDouble/DirectCsoundWin64.exe" /pdbtype:sept /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Debug"

!ENDIF 

# Begin Target

# Name "DirectCsoundWin - Win32 Release"
# Name "DirectCsoundWin - Win32 Debug"
# Name "DirectCsoundWin - Win32 double Release"
# Name "DirectCsoundWin - Win32 double Debug"
# Begin Group "SourceGab"

# PROP Default_Filter ""
# Begin Group "DirectX"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\DirectXcapture.c
# End Source File
# Begin Source File

SOURCE=.\DirectXout.c
# End Source File
# Begin Source File

SOURCE=.\DirectXset.c
# ADD CPP /D "INITGUID"
# End Source File
# Begin Source File

SOURCE=.\out3D.c
# End Source File
# End Group
# Begin Group "opcodes"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\dashow.c
# End Source File
# Begin Source File

SOURCE=.\flanger.c
# End Source File
# Begin Source File

SOURCE=.\fof3.C
# End Source File
# Begin Source File

SOURCE=.\foscili2.c
# End Source File
# Begin Source File

SOURCE=.\fout.c
# End Source File
# Begin Source File

SOURCE=.\gab_osc.c
# End Source File
# Begin Source File

SOURCE=.\generative.c
# End Source File
# Begin Source File

SOURCE=.\InstrCall.c
# End Source File
# Begin Source File

SOURCE=.\loscil2.c
# End Source File
# Begin Source File

SOURCE=.\sfont.c
# ADD CPP /Zp1
# End Source File
# Begin Source File

SOURCE=.\uggab.c
# End Source File
# Begin Source File

SOURCE=.\vibrato.c
# End Source File
# End Group
# Begin Group "Graphics"

# PROP Default_Filter ""
# Begin Group "Widgets"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\Fl\Fl_Knob.cxx
# End Source File
# Begin Source File

SOURCE=.\Fl\Fl_Spin.cpp
# End Source File
# Begin Source File

SOURCE=.\Fl\Fl_Value_Input_Spin.cpp
# End Source File
# Begin Source File

SOURCE=.\Fl\Fl_Value_Slider_Input.cpp
# End Source File
# Begin Source File

SOURCE=.\glpng.c
# End Source File
# Begin Source File

SOURCE=.\keyboard.cxx
# End Source File
# Begin Source File

SOURCE=.\widgets.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\fractals.c
# End Source File
# Begin Source File

SOURCE=.\picture.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\about.c
# End Source File
# Begin Source File

SOURCE=.\ConsoleGab.c
# End Source File
# Begin Source File

SOURCE=.\Dialog.rc
# End Source File
# Begin Source File

SOURCE=.\gabscanf.c
# End Source File
# Begin Source File

SOURCE=.\gabWaveCaps.c
# End Source File
# Begin Source File

SOURCE=.\gabWinMIDI.cpp
# SUBTRACT CPP /YX
# End Source File
# Begin Source File

SOURCE=.\genUser.cxx
# End Source File
# Begin Source File

SOURCE=.\midi_cs_gab.cpp
# End Source File
# Begin Source File

SOURCE=.\rtaudio2.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /Ot /Oi /Oy
# SUBTRACT CPP /Ox /Og

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /Ot /Oi /Oy
# SUBTRACT BASE CPP /Ox /Og
# ADD CPP /Ot /Oi /Oy
# SUBTRACT CPP /Ox /Og

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\timer.c
# End Source File
# Begin Source File

SOURCE=.\WinMain.cxx
# End Source File
# Begin Source File

SOURCE=.\WinMainAddendum.c
# End Source File
# End Group
# Begin Group "Source"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\aifc.c
# End Source File
# Begin Source File

SOURCE=.\Aiff.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /O2
# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Aops.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /Ot /Og /Op- /Oy
# SUBTRACT CPP /Ox /Oa /Ow /Oi

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /Ot /Og /Op- /Oy
# SUBTRACT BASE CPP /Ox /Oa /Ow /Oi
# ADD CPP /Ot /Og /Op- /Oy
# SUBTRACT CPP /Ox /Oa /Ow /Oi

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Aoscilx.c
# End Source File
# Begin Source File

SOURCE=.\argdecode.c
# End Source File
# Begin Source File

SOURCE=.\Auxfd.c
# End Source File
# Begin Source File

SOURCE=.\babo.c
# End Source File
# Begin Source File

SOURCE=.\biquad.c
# End Source File
# Begin Source File

SOURCE=.\bowedbar.c
# End Source File
# Begin Source File

SOURCE=.\butter.c
# End Source File
# Begin Source File

SOURCE=.\Cmath.c
# End Source File
# Begin Source File

SOURCE=.\Complex.c
# End Source File
# Begin Source File

SOURCE=.\Cross2.c
# End Source File
# Begin Source File

SOURCE=.\Cscore.c
# End Source File
# Begin Source File

SOURCE=.\Cscorfns.c
# End Source File
# Begin Source File

SOURCE=.\Cvanal.c
# End Source File
# Begin Source File

SOURCE=.\Dam.c
# End Source File
# Begin Source File

SOURCE=.\dcblockr.c
# End Source File
# Begin Source File

SOURCE=.\Diskin.c
# End Source File
# Begin Source File

SOURCE=.\Disprep.c
# End Source File
# Begin Source File

SOURCE=.\Dsputil.c
# End Source File
# Begin Source File

SOURCE=.\Dumpf.c
# End Source File
# Begin Source File

SOURCE=.\entry1.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

# SUBTRACT CPP /YX

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

# SUBTRACT BASE CPP /YX
# SUBTRACT CPP /YX

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\entry2.c
# End Source File
# Begin Source File

SOURCE=.\Express.c
# End Source File
# Begin Source File

SOURCE=.\Extract.c
# End Source File
# Begin Source File

SOURCE=.\Fft.c
# End Source File
# Begin Source File

SOURCE=.\Fgens.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /O2
# SUBTRACT CPP /Z<none> /Fr

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /O2
# SUBTRACT BASE CPP /Z<none> /Fr
# ADD CPP /O2
# SUBTRACT CPP /Z<none> /Fr

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Filopen.c
# End Source File
# Begin Source File

SOURCE=.\Filter.c
# End Source File
# Begin Source File

SOURCE=.\Fm4op.c
# End Source File
# Begin Source File

SOURCE=.\Follow.c
# End Source File
# Begin Source File

SOURCE=.\getstring.c
# End Source File
# Begin Source File

SOURCE=.\Grain.c
# End Source File
# Begin Source File

SOURCE=.\Grain4.c
# End Source File
# Begin Source File

SOURCE=.\Hetro.c
# End Source File
# Begin Source File

SOURCE=.\Hrtferx.c
# End Source File
# Begin Source File

SOURCE=.\Ieee80.c
# End Source File
# Begin Source File

SOURCE=.\Insert.c
# End Source File
# Begin Source File

SOURCE=.\Linevent.c
# End Source File
# Begin Source File

SOURCE=.\locsig.c
# End Source File
# Begin Source File

SOURCE=.\lowpassr.c
# End Source File
# Begin Source File

SOURCE=.\Lpanal.c
# End Source File
# Begin Source File

SOURCE=.\Lptrkfns.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /Ot /Oa /Oi /Oy

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /Ot /Oa /Oi /Oy
# ADD CPP /Ot /Oa /Oi /Oy

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Main.c
# End Source File
# Begin Source File

SOURCE=.\Mandolin.c
# End Source File
# Begin Source File

SOURCE=.\Memalloc.c
# End Source File
# Begin Source File

SOURCE=.\Memfiles.c
# End Source File
# Begin Source File

SOURCE=.\Midiops.c
# End Source File
# Begin Source File

SOURCE=.\Midiops2.c
# End Source File
# Begin Source File

SOURCE=.\midiops3.c
# End Source File
# Begin Source File

SOURCE=.\Midiout.c
# End Source File
# Begin Source File

SOURCE=.\Midirecv.c
# End Source File
# Begin Source File

SOURCE=.\Midisend.c
# End Source File
# Begin Source File

SOURCE=.\Modal4.c
# End Source File
# Begin Source File

SOURCE=.\Moog1.c
# End Source File
# Begin Source File

SOURCE=.\Musmon.c
# End Source File
# Begin Source File

SOURCE=.\Nlfilt.c
# End Source File
# Begin Source File

SOURCE=.\Oload.c
# End Source File
# Begin Source File

SOURCE=.\one_file.c
# End Source File
# Begin Source File

SOURCE=.\Opcode.c
# End Source File
# Begin Source File

SOURCE=.\Otran.c
# End Source File
# Begin Source File

SOURCE=.\phisem.c
# End Source File
# Begin Source File

SOURCE=.\Physmod.c
# End Source File
# Begin Source File

SOURCE=.\Physutil.c
# End Source File
# Begin Source File

SOURCE=.\pitch.c
# End Source File
# Begin Source File

SOURCE=.\Pluck.c
# End Source File
# Begin Source File

SOURCE=.\Pvadd.c
# End Source File
# Begin Source File

SOURCE=.\Pvanal.c
# End Source File
# Begin Source File

SOURCE=.\Pvinterp.c
# End Source File
# Begin Source File

SOURCE=.\pvlook.c
# End Source File
# Begin Source File

SOURCE=.\Pvoc.c
# End Source File
# Begin Source File

SOURCE=.\pvocext.c
# End Source File
# Begin Source File

SOURCE=.\Pvread.c
# End Source File
# Begin Source File

SOURCE=.\Rdorch.c
# End Source File
# Begin Source File

SOURCE=.\Rdscor.c
# End Source File
# Begin Source File

SOURCE=.\Repluck.c
# End Source File
# Begin Source File

SOURCE=.\Rtaudio.c
# End Source File
# Begin Source File

SOURCE=.\scansyn.c
# End Source File
# Begin Source File

SOURCE=.\schedule.c
# End Source File
# Begin Source File

SOURCE=.\Scot.c
# End Source File
# Begin Source File

SOURCE=.\Scsort.c
# End Source File
# Begin Source File

SOURCE=.\Scxtract.c
# End Source File
# Begin Source File

SOURCE=.\sdif.c
# End Source File
# Begin Source File

SOURCE=.\Sfheader.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /O2
# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Shaker.c
# End Source File
# Begin Source File

SOURCE=.\Singwave.c
# End Source File
# Begin Source File

SOURCE=.\Sndinfo.c
# End Source File
# Begin Source File

SOURCE=.\sndinfUG.c
# End Source File
# Begin Source File

SOURCE=.\Sndwarp.c
# End Source File
# Begin Source File

SOURCE=.\Sort.c
# End Source File
# Begin Source File

SOURCE=.\Soundin.c

!IF  "$(CFG)" == "DirectCsoundWin - Win32 Release"

# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 Debug"

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Release"

# ADD BASE CPP /O2
# ADD CPP /O2

!ELSEIF  "$(CFG)" == "DirectCsoundWin - Win32 double Debug"

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Soundio.c
# End Source File
# Begin Source File

SOURCE=.\Space.c
# End Source File
# Begin Source File

SOURCE=.\spectra.c
# End Source File
# Begin Source File

SOURCE=.\Sread.c
# End Source File
# Begin Source File

SOURCE=.\Swrite.c
# End Source File
# Begin Source File

SOURCE=.\Twarp.c
# End Source File
# Begin Source File

SOURCE=.\Ugens1.c
# End Source File
# Begin Source File

SOURCE=.\Ugens2.c
# End Source File
# Begin Source File

SOURCE=.\Ugens3.c
# End Source File
# Begin Source File

SOURCE=.\Ugens4.c
# End Source File
# Begin Source File

SOURCE=.\Ugens5.c
# End Source File
# Begin Source File

SOURCE=.\Ugens6.c
# End Source File
# Begin Source File

SOURCE=.\ugens7.c
# End Source File
# Begin Source File

SOURCE=.\Ugens8.c
# End Source File
# Begin Source File

SOURCE=.\Ugens9.c
# End Source File
# Begin Source File

SOURCE=.\Ugensa.c
# End Source File
# Begin Source File

SOURCE=.\ugmoss.c
# End Source File
# Begin Source File

SOURCE=.\Ugrw1.c
# End Source File
# Begin Source File

SOURCE=.\Ugrw2.c
# End Source File
# Begin Source File

SOURCE=.\ugsc.c
# End Source File
# Begin Source File

SOURCE=.\Ulaw.c
# End Source File
# Begin Source File

SOURCE=.\vbap.c
# End Source File
# Begin Source File

SOURCE=.\vbap_eight.c
# End Source File
# Begin Source File

SOURCE=.\vbap_four.c
# End Source File
# Begin Source File

SOURCE=.\vbap_sixteen.c
# End Source File
# Begin Source File

SOURCE=.\vbap_zak.c
# End Source File
# Begin Source File

SOURCE=.\Vdelay.c
# End Source File
# Begin Source File

SOURCE=.\vpvoc.c
# End Source File
# Begin Source File

SOURCE=.\Wave.c
# End Source File
# Begin Source File

SOURCE=.\Wavegde.c
# End Source File
# Begin Source File

SOURCE=.\Winascii.c
# End Source File
# Begin Source File

SOURCE=.\Windin.c
# End Source File
# Begin Source File

SOURCE=.\Window.c
# End Source File
# Begin Source File

SOURCE=.\Wineps.c
# End Source File
# End Group
# Begin Source File

SOURCE=.\bitmap.h
# End Source File
# Begin Source File

SOURCE=.\fractals.h
# End Source File
# Begin Source File

SOURCE=.\widgets.h
# End Source File
# End Target
# End Project
