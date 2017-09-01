# Microsoft Developer Studio Generated NMAKE File, Based on DirectCsoundCon.dsp
!IF "$(CFG)" == ""
CFG=DirectCsoundCon - Win32 double Debug
!MESSAGE No configuration specified. Defaulting to DirectCsoundCon - Win32\
 double Debug.
!ENDIF 

!IF "$(CFG)" != "DirectCsoundCon - Win32 Release" && "$(CFG)" !=\
 "DirectCsoundCon - Win32 Debug" && "$(CFG)" !=\
 "DirectCsoundCon - Win32 double Release" && "$(CFG)" !=\
 "DirectCsoundCon - Win32 double Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "DirectCsoundCon.mak"\
 CFG="DirectCsoundCon - Win32 double Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "DirectCsoundCon - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "DirectCsoundCon - Win32 Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "DirectCsoundCon - Win32 double Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "DirectCsoundCon - Win32 double Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\DirectCsoundCon.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ELSE 

ALL : "$(OUTDIR)\DirectCsoundCon.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\about.obj"
	-@erase "$(INTDIR)\about.sbr"
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\aifc.sbr"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\Aiff.sbr"
	-@erase "$(INTDIR)\Aops.obj"
	-@erase "$(INTDIR)\Aops.sbr"
	-@erase "$(INTDIR)\Aoscilx.obj"
	-@erase "$(INTDIR)\Aoscilx.sbr"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\argdecode.sbr"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\Auxfd.sbr"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\babo.sbr"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\biquad.sbr"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\bowedbar.sbr"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\butter.sbr"
	-@erase "$(INTDIR)\Cmath.obj"
	-@erase "$(INTDIR)\Cmath.sbr"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\Complex.sbr"
	-@erase "$(INTDIR)\ConsoleGab.obj"
	-@erase "$(INTDIR)\ConsoleGab.sbr"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cross2.sbr"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\Cscore.sbr"
	-@erase "$(INTDIR)\Cscorfns.obj"
	-@erase "$(INTDIR)\Cscorfns.sbr"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Cvanal.sbr"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\Dam.sbr"
	-@erase "$(INTDIR)\dashow.obj"
	-@erase "$(INTDIR)\dashow.sbr"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\dcblockr.sbr"
	-@erase "$(INTDIR)\Dialog.res"
	-@erase "$(INTDIR)\DirectXcapture.obj"
	-@erase "$(INTDIR)\DirectXcapture.sbr"
	-@erase "$(INTDIR)\DirectXout.obj"
	-@erase "$(INTDIR)\DirectXout.sbr"
	-@erase "$(INTDIR)\DirectXset.obj"
	-@erase "$(INTDIR)\DirectXset.sbr"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Diskin.sbr"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\Disprep.sbr"
	-@erase "$(INTDIR)\Dsputil.obj"
	-@erase "$(INTDIR)\Dsputil.sbr"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\Dumpf.sbr"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry1.sbr"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\entry2.sbr"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Express.sbr"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Extract.sbr"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fft.sbr"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Fgens.sbr"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filopen.sbr"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\Filter.sbr"
	-@erase "$(INTDIR)\Fl_Knob.obj"
	-@erase "$(INTDIR)\Fl_Knob.sbr"
	-@erase "$(INTDIR)\Fl_Spin.obj"
	-@erase "$(INTDIR)\Fl_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.obj"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.obj"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.sbr"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\flanger.sbr"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Fm4op.sbr"
	-@erase "$(INTDIR)\fof3.obj"
	-@erase "$(INTDIR)\fof3.sbr"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\Follow.sbr"
	-@erase "$(INTDIR)\foscili2.obj"
	-@erase "$(INTDIR)\foscili2.sbr"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\fout.sbr"
	-@erase "$(INTDIR)\fractals.obj"
	-@erase "$(INTDIR)\fractals.sbr"
	-@erase "$(INTDIR)\gab_osc.obj"
	-@erase "$(INTDIR)\gab_osc.sbr"
	-@erase "$(INTDIR)\gabscanf.obj"
	-@erase "$(INTDIR)\gabscanf.sbr"
	-@erase "$(INTDIR)\gabWaveCaps.obj"
	-@erase "$(INTDIR)\gabWaveCaps.sbr"
	-@erase "$(INTDIR)\gabWinMIDI.obj"
	-@erase "$(INTDIR)\gabWinMIDI.sbr"
	-@erase "$(INTDIR)\generative.obj"
	-@erase "$(INTDIR)\generative.sbr"
	-@erase "$(INTDIR)\genUser.obj"
	-@erase "$(INTDIR)\genUser.sbr"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\getstring.sbr"
	-@erase "$(INTDIR)\glpng.obj"
	-@erase "$(INTDIR)\glpng.sbr"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain.sbr"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Grain4.sbr"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hetro.sbr"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Hrtferx.sbr"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Ieee80.sbr"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\Insert.sbr"
	-@erase "$(INTDIR)\InstrCall.obj"
	-@erase "$(INTDIR)\InstrCall.sbr"
	-@erase "$(INTDIR)\keyboard.obj"
	-@erase "$(INTDIR)\keyboard.sbr"
	-@erase "$(INTDIR)\Linevent.obj"
	-@erase "$(INTDIR)\Linevent.sbr"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\locsig.sbr"
	-@erase "$(INTDIR)\loscil2.obj"
	-@erase "$(INTDIR)\loscil2.sbr"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\lowpassr.sbr"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lpanal.sbr"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Lptrkfns.sbr"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Main.sbr"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Mandolin.sbr"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memalloc.sbr"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Memfiles.sbr"
	-@erase "$(INTDIR)\midi_cs_gab.obj"
	-@erase "$(INTDIR)\midi_cs_gab.sbr"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops.sbr"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\Midiops2.sbr"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\midiops3.sbr"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midiout.sbr"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midirecv.sbr"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Midisend.sbr"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\Modal4.sbr"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Moog1.sbr"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\Musmon.sbr"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Nlfilt.sbr"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\Oload.sbr"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\one_file.sbr"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\Opcode.sbr"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\Otran.sbr"
	-@erase "$(INTDIR)\out3D.obj"
	-@erase "$(INTDIR)\out3D.sbr"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\phisem.sbr"
	-@erase "$(INTDIR)\Physmod.obj"
	-@erase "$(INTDIR)\Physmod.sbr"
	-@erase "$(INTDIR)\Physutil.obj"
	-@erase "$(INTDIR)\Physutil.sbr"
	-@erase "$(INTDIR)\picture.obj"
	-@erase "$(INTDIR)\picture.sbr"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\pitch.sbr"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\Pluck.sbr"
	-@erase "$(INTDIR)\Pvadd.obj"
	-@erase "$(INTDIR)\Pvadd.sbr"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\Pvanal.sbr"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\Pvinterp.sbr"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\pvlook.sbr"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\Pvoc.sbr"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\pvocext.sbr"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\Pvread.sbr"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdorch.sbr"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Rdscor.sbr"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\Repluck.sbr"
	-@erase "$(INTDIR)\Rtaudio.obj"
	-@erase "$(INTDIR)\Rtaudio.sbr"
	-@erase "$(INTDIR)\rtaudio2.obj"
	-@erase "$(INTDIR)\rtaudio2.sbr"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansyn.sbr"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\schedule.sbr"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scot.sbr"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scsort.sbr"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\Scxtract.sbr"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\sdif.sbr"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\Sfheader.sbr"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\sfont.sbr"
	-@erase "$(INTDIR)\Shaker.obj"
	-@erase "$(INTDIR)\Shaker.sbr"
	-@erase "$(INTDIR)\Singwave.obj"
	-@erase "$(INTDIR)\Singwave.sbr"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\Sndinfo.sbr"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\sndinfUG.sbr"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sndwarp.sbr"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Sort.sbr"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\Soundin.sbr"
	-@erase "$(INTDIR)\Soundio.obj"
	-@erase "$(INTDIR)\Soundio.sbr"
	-@erase "$(INTDIR)\Space.obj"
	-@erase "$(INTDIR)\Space.sbr"
	-@erase "$(INTDIR)\spectra.obj"
	-@erase "$(INTDIR)\spectra.sbr"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Sread.sbr"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Swrite.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Twarp.sbr"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens1.sbr"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens2.sbr"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens3.sbr"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens4.sbr"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens5.sbr"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens6.sbr"
	-@erase "$(INTDIR)\ugens7.obj"
	-@erase "$(INTDIR)\ugens7.sbr"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens8.sbr"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugens9.sbr"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\Ugensa.sbr"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\uggab.sbr"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\ugmoss.sbr"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw1.sbr"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\Ugrw2.sbr"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ugsc.sbr"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\Ulaw.sbr"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap.sbr"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_eight.sbr"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_four.sbr"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_sixteen.sbr"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vbap_zak.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vdelay.sbr"
	-@erase "$(INTDIR)\vibrato.obj"
	-@erase "$(INTDIR)\vibrato.sbr"
	-@erase "$(INTDIR)\vpvoc.obj"
	-@erase "$(INTDIR)\vpvoc.sbr"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wave.sbr"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Wavegde.sbr"
	-@erase "$(INTDIR)\widgets.obj"
	-@erase "$(INTDIR)\widgets.sbr"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Winascii.sbr"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Windin.sbr"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\Window.sbr"
	-@erase "$(INTDIR)\Wineps.obj"
	-@erase "$(INTDIR)\Wineps.sbr"
	-@erase "$(OUTDIR)\DirectCsoundCon.bsc"
	-@erase "$(OUTDIR)\DirectCsoundCon.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 
CPP_OBJS=.\Release/
CPP_SBRS=.\Release/

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
RSC_PROJ=/l 0x410 /fo"$(INTDIR)\Dialog.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DirectCsoundCon.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\about.sbr" \
	"$(INTDIR)\aifc.sbr" \
	"$(INTDIR)\Aiff.sbr" \
	"$(INTDIR)\Aops.sbr" \
	"$(INTDIR)\Aoscilx.sbr" \
	"$(INTDIR)\argdecode.sbr" \
	"$(INTDIR)\Auxfd.sbr" \
	"$(INTDIR)\babo.sbr" \
	"$(INTDIR)\biquad.sbr" \
	"$(INTDIR)\bowedbar.sbr" \
	"$(INTDIR)\butter.sbr" \
	"$(INTDIR)\Cmath.sbr" \
	"$(INTDIR)\Complex.sbr" \
	"$(INTDIR)\ConsoleGab.sbr" \
	"$(INTDIR)\Cross2.sbr" \
	"$(INTDIR)\Cscore.sbr" \
	"$(INTDIR)\Cscorfns.sbr" \
	"$(INTDIR)\Cvanal.sbr" \
	"$(INTDIR)\Dam.sbr" \
	"$(INTDIR)\dashow.sbr" \
	"$(INTDIR)\dcblockr.sbr" \
	"$(INTDIR)\DirectXcapture.sbr" \
	"$(INTDIR)\DirectXout.sbr" \
	"$(INTDIR)\DirectXset.sbr" \
	"$(INTDIR)\Diskin.sbr" \
	"$(INTDIR)\Disprep.sbr" \
	"$(INTDIR)\Dsputil.sbr" \
	"$(INTDIR)\Dumpf.sbr" \
	"$(INTDIR)\entry1.sbr" \
	"$(INTDIR)\entry2.sbr" \
	"$(INTDIR)\Express.sbr" \
	"$(INTDIR)\Extract.sbr" \
	"$(INTDIR)\Fft.sbr" \
	"$(INTDIR)\Fgens.sbr" \
	"$(INTDIR)\Filopen.sbr" \
	"$(INTDIR)\Filter.sbr" \
	"$(INTDIR)\Fl_Knob.sbr" \
	"$(INTDIR)\Fl_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Input_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Slider_Input.sbr" \
	"$(INTDIR)\flanger.sbr" \
	"$(INTDIR)\Fm4op.sbr" \
	"$(INTDIR)\fof3.sbr" \
	"$(INTDIR)\Follow.sbr" \
	"$(INTDIR)\foscili2.sbr" \
	"$(INTDIR)\fout.sbr" \
	"$(INTDIR)\fractals.sbr" \
	"$(INTDIR)\gab_osc.sbr" \
	"$(INTDIR)\gabscanf.sbr" \
	"$(INTDIR)\gabWaveCaps.sbr" \
	"$(INTDIR)\gabWinMIDI.sbr" \
	"$(INTDIR)\generative.sbr" \
	"$(INTDIR)\genUser.sbr" \
	"$(INTDIR)\getstring.sbr" \
	"$(INTDIR)\glpng.sbr" \
	"$(INTDIR)\Grain.sbr" \
	"$(INTDIR)\Grain4.sbr" \
	"$(INTDIR)\Hetro.sbr" \
	"$(INTDIR)\Hrtferx.sbr" \
	"$(INTDIR)\Ieee80.sbr" \
	"$(INTDIR)\Insert.sbr" \
	"$(INTDIR)\InstrCall.sbr" \
	"$(INTDIR)\keyboard.sbr" \
	"$(INTDIR)\Linevent.sbr" \
	"$(INTDIR)\locsig.sbr" \
	"$(INTDIR)\loscil2.sbr" \
	"$(INTDIR)\lowpassr.sbr" \
	"$(INTDIR)\Lpanal.sbr" \
	"$(INTDIR)\Lptrkfns.sbr" \
	"$(INTDIR)\Main.sbr" \
	"$(INTDIR)\Mandolin.sbr" \
	"$(INTDIR)\Memalloc.sbr" \
	"$(INTDIR)\Memfiles.sbr" \
	"$(INTDIR)\midi_cs_gab.sbr" \
	"$(INTDIR)\Midiops.sbr" \
	"$(INTDIR)\Midiops2.sbr" \
	"$(INTDIR)\midiops3.sbr" \
	"$(INTDIR)\Midiout.sbr" \
	"$(INTDIR)\Midirecv.sbr" \
	"$(INTDIR)\Midisend.sbr" \
	"$(INTDIR)\Modal4.sbr" \
	"$(INTDIR)\Moog1.sbr" \
	"$(INTDIR)\Musmon.sbr" \
	"$(INTDIR)\Nlfilt.sbr" \
	"$(INTDIR)\Oload.sbr" \
	"$(INTDIR)\one_file.sbr" \
	"$(INTDIR)\Opcode.sbr" \
	"$(INTDIR)\Otran.sbr" \
	"$(INTDIR)\out3D.sbr" \
	"$(INTDIR)\phisem.sbr" \
	"$(INTDIR)\Physmod.sbr" \
	"$(INTDIR)\Physutil.sbr" \
	"$(INTDIR)\picture.sbr" \
	"$(INTDIR)\pitch.sbr" \
	"$(INTDIR)\Pluck.sbr" \
	"$(INTDIR)\Pvadd.sbr" \
	"$(INTDIR)\Pvanal.sbr" \
	"$(INTDIR)\Pvinterp.sbr" \
	"$(INTDIR)\pvlook.sbr" \
	"$(INTDIR)\Pvoc.sbr" \
	"$(INTDIR)\pvocext.sbr" \
	"$(INTDIR)\Pvread.sbr" \
	"$(INTDIR)\Rdorch.sbr" \
	"$(INTDIR)\Rdscor.sbr" \
	"$(INTDIR)\Repluck.sbr" \
	"$(INTDIR)\Rtaudio.sbr" \
	"$(INTDIR)\rtaudio2.sbr" \
	"$(INTDIR)\scansyn.sbr" \
	"$(INTDIR)\schedule.sbr" \
	"$(INTDIR)\Scot.sbr" \
	"$(INTDIR)\Scsort.sbr" \
	"$(INTDIR)\Scxtract.sbr" \
	"$(INTDIR)\sdif.sbr" \
	"$(INTDIR)\Sfheader.sbr" \
	"$(INTDIR)\sfont.sbr" \
	"$(INTDIR)\Shaker.sbr" \
	"$(INTDIR)\Singwave.sbr" \
	"$(INTDIR)\Sndinfo.sbr" \
	"$(INTDIR)\sndinfUG.sbr" \
	"$(INTDIR)\Sndwarp.sbr" \
	"$(INTDIR)\Sort.sbr" \
	"$(INTDIR)\Soundin.sbr" \
	"$(INTDIR)\Soundio.sbr" \
	"$(INTDIR)\Space.sbr" \
	"$(INTDIR)\spectra.sbr" \
	"$(INTDIR)\Sread.sbr" \
	"$(INTDIR)\Swrite.sbr" \
	"$(INTDIR)\timer.sbr" \
	"$(INTDIR)\Twarp.sbr" \
	"$(INTDIR)\Ugens1.sbr" \
	"$(INTDIR)\Ugens2.sbr" \
	"$(INTDIR)\Ugens3.sbr" \
	"$(INTDIR)\Ugens4.sbr" \
	"$(INTDIR)\Ugens5.sbr" \
	"$(INTDIR)\Ugens6.sbr" \
	"$(INTDIR)\ugens7.sbr" \
	"$(INTDIR)\Ugens8.sbr" \
	"$(INTDIR)\Ugens9.sbr" \
	"$(INTDIR)\Ugensa.sbr" \
	"$(INTDIR)\uggab.sbr" \
	"$(INTDIR)\ugmoss.sbr" \
	"$(INTDIR)\Ugrw1.sbr" \
	"$(INTDIR)\Ugrw2.sbr" \
	"$(INTDIR)\ugsc.sbr" \
	"$(INTDIR)\Ulaw.sbr" \
	"$(INTDIR)\vbap.sbr" \
	"$(INTDIR)\vbap_eight.sbr" \
	"$(INTDIR)\vbap_four.sbr" \
	"$(INTDIR)\vbap_sixteen.sbr" \
	"$(INTDIR)\vbap_zak.sbr" \
	"$(INTDIR)\Vdelay.sbr" \
	"$(INTDIR)\vibrato.sbr" \
	"$(INTDIR)\vpvoc.sbr" \
	"$(INTDIR)\Wave.sbr" \
	"$(INTDIR)\Wavegde.sbr" \
	"$(INTDIR)\widgets.sbr" \
	"$(INTDIR)\Winascii.sbr" \
	"$(INTDIR)\Windin.sbr" \
	"$(INTDIR)\Window.sbr" \
	"$(INTDIR)\Wineps.sbr"

"$(OUTDIR)\DirectCsoundCon.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib\
 libtiff.lib libjpeg.lib libpng.lib fltk.lib opengl32.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)\DirectCsoundCon.pdb"\
 /machine:I386 /out:"$(OUTDIR)\DirectCsoundCon.exe"\
 /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Release"\
 /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib" 
LINK32_OBJS= \
	"$(INTDIR)\about.obj" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\Aops.obj" \
	"$(INTDIR)\Aoscilx.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\Cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\ConsoleGab.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\Cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dashow.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Dialog.res" \
	"$(INTDIR)\DirectXcapture.obj" \
	"$(INTDIR)\DirectXout.obj" \
	"$(INTDIR)\DirectXset.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\Dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\Fl_Knob.obj" \
	"$(INTDIR)\Fl_Spin.obj" \
	"$(INTDIR)\Fl_Value_Input_Spin.obj" \
	"$(INTDIR)\Fl_Value_Slider_Input.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\fof3.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\foscili2.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\fractals.obj" \
	"$(INTDIR)\gab_osc.obj" \
	"$(INTDIR)\gabscanf.obj" \
	"$(INTDIR)\gabWaveCaps.obj" \
	"$(INTDIR)\gabWinMIDI.obj" \
	"$(INTDIR)\generative.obj" \
	"$(INTDIR)\genUser.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\glpng.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\InstrCall.obj" \
	"$(INTDIR)\keyboard.obj" \
	"$(INTDIR)\Linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\loscil2.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\midi_cs_gab.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\out3D.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\Physmod.obj" \
	"$(INTDIR)\Physutil.obj" \
	"$(INTDIR)\picture.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\Pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\Rtaudio.obj" \
	"$(INTDIR)\rtaudio2.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\Shaker.obj" \
	"$(INTDIR)\Singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\Soundio.obj" \
	"$(INTDIR)\Space.obj" \
	"$(INTDIR)\spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\timer.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\ugens7.obj" \
	"$(INTDIR)\Ugens8.obj" \
	"$(INTDIR)\Ugens9.obj" \
	"$(INTDIR)\Ugensa.obj" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\Ugrw1.obj" \
	"$(INTDIR)\Ugrw2.obj" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\Ulaw.obj" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\Vdelay.obj" \
	"$(INTDIR)\vibrato.obj" \
	"$(INTDIR)\vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\widgets.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\Wineps.obj"

"$(OUTDIR)\DirectCsoundCon.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\DirectCsoundCon.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ELSE 

ALL : "$(OUTDIR)\DirectCsoundCon.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\about.obj"
	-@erase "$(INTDIR)\about.sbr"
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\aifc.sbr"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\Aiff.sbr"
	-@erase "$(INTDIR)\Aops.obj"
	-@erase "$(INTDIR)\Aops.sbr"
	-@erase "$(INTDIR)\Aoscilx.obj"
	-@erase "$(INTDIR)\Aoscilx.sbr"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\argdecode.sbr"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\Auxfd.sbr"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\babo.sbr"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\biquad.sbr"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\bowedbar.sbr"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\butter.sbr"
	-@erase "$(INTDIR)\Cmath.obj"
	-@erase "$(INTDIR)\Cmath.sbr"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\Complex.sbr"
	-@erase "$(INTDIR)\ConsoleGab.obj"
	-@erase "$(INTDIR)\ConsoleGab.sbr"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cross2.sbr"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\Cscore.sbr"
	-@erase "$(INTDIR)\Cscorfns.obj"
	-@erase "$(INTDIR)\Cscorfns.sbr"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Cvanal.sbr"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\Dam.sbr"
	-@erase "$(INTDIR)\dashow.obj"
	-@erase "$(INTDIR)\dashow.sbr"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\dcblockr.sbr"
	-@erase "$(INTDIR)\Dialog.res"
	-@erase "$(INTDIR)\DirectXcapture.obj"
	-@erase "$(INTDIR)\DirectXcapture.sbr"
	-@erase "$(INTDIR)\DirectXout.obj"
	-@erase "$(INTDIR)\DirectXout.sbr"
	-@erase "$(INTDIR)\DirectXset.obj"
	-@erase "$(INTDIR)\DirectXset.sbr"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Diskin.sbr"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\Disprep.sbr"
	-@erase "$(INTDIR)\Dsputil.obj"
	-@erase "$(INTDIR)\Dsputil.sbr"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\Dumpf.sbr"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry1.sbr"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\entry2.sbr"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Express.sbr"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Extract.sbr"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fft.sbr"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Fgens.sbr"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filopen.sbr"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\Filter.sbr"
	-@erase "$(INTDIR)\Fl_Knob.obj"
	-@erase "$(INTDIR)\Fl_Knob.sbr"
	-@erase "$(INTDIR)\Fl_Spin.obj"
	-@erase "$(INTDIR)\Fl_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.obj"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.obj"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.sbr"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\flanger.sbr"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Fm4op.sbr"
	-@erase "$(INTDIR)\fof3.obj"
	-@erase "$(INTDIR)\fof3.sbr"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\Follow.sbr"
	-@erase "$(INTDIR)\foscili2.obj"
	-@erase "$(INTDIR)\foscili2.sbr"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\fout.sbr"
	-@erase "$(INTDIR)\fractals.obj"
	-@erase "$(INTDIR)\fractals.sbr"
	-@erase "$(INTDIR)\gab_osc.obj"
	-@erase "$(INTDIR)\gab_osc.sbr"
	-@erase "$(INTDIR)\gabscanf.obj"
	-@erase "$(INTDIR)\gabscanf.sbr"
	-@erase "$(INTDIR)\gabWaveCaps.obj"
	-@erase "$(INTDIR)\gabWaveCaps.sbr"
	-@erase "$(INTDIR)\gabWinMIDI.obj"
	-@erase "$(INTDIR)\gabWinMIDI.sbr"
	-@erase "$(INTDIR)\generative.obj"
	-@erase "$(INTDIR)\generative.sbr"
	-@erase "$(INTDIR)\genUser.obj"
	-@erase "$(INTDIR)\genUser.sbr"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\getstring.sbr"
	-@erase "$(INTDIR)\glpng.obj"
	-@erase "$(INTDIR)\glpng.sbr"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain.sbr"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Grain4.sbr"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hetro.sbr"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Hrtferx.sbr"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Ieee80.sbr"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\Insert.sbr"
	-@erase "$(INTDIR)\InstrCall.obj"
	-@erase "$(INTDIR)\InstrCall.sbr"
	-@erase "$(INTDIR)\keyboard.obj"
	-@erase "$(INTDIR)\keyboard.sbr"
	-@erase "$(INTDIR)\Linevent.obj"
	-@erase "$(INTDIR)\Linevent.sbr"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\locsig.sbr"
	-@erase "$(INTDIR)\loscil2.obj"
	-@erase "$(INTDIR)\loscil2.sbr"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\lowpassr.sbr"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lpanal.sbr"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Lptrkfns.sbr"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Main.sbr"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Mandolin.sbr"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memalloc.sbr"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Memfiles.sbr"
	-@erase "$(INTDIR)\midi_cs_gab.obj"
	-@erase "$(INTDIR)\midi_cs_gab.sbr"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops.sbr"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\Midiops2.sbr"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\midiops3.sbr"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midiout.sbr"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midirecv.sbr"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Midisend.sbr"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\Modal4.sbr"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Moog1.sbr"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\Musmon.sbr"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Nlfilt.sbr"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\Oload.sbr"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\one_file.sbr"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\Opcode.sbr"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\Otran.sbr"
	-@erase "$(INTDIR)\out3D.obj"
	-@erase "$(INTDIR)\out3D.sbr"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\phisem.sbr"
	-@erase "$(INTDIR)\Physmod.obj"
	-@erase "$(INTDIR)\Physmod.sbr"
	-@erase "$(INTDIR)\Physutil.obj"
	-@erase "$(INTDIR)\Physutil.sbr"
	-@erase "$(INTDIR)\picture.obj"
	-@erase "$(INTDIR)\picture.sbr"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\pitch.sbr"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\Pluck.sbr"
	-@erase "$(INTDIR)\Pvadd.obj"
	-@erase "$(INTDIR)\Pvadd.sbr"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\Pvanal.sbr"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\Pvinterp.sbr"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\pvlook.sbr"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\Pvoc.sbr"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\pvocext.sbr"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\Pvread.sbr"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdorch.sbr"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Rdscor.sbr"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\Repluck.sbr"
	-@erase "$(INTDIR)\Rtaudio.obj"
	-@erase "$(INTDIR)\Rtaudio.sbr"
	-@erase "$(INTDIR)\rtaudio2.obj"
	-@erase "$(INTDIR)\rtaudio2.sbr"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansyn.sbr"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\schedule.sbr"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scot.sbr"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scsort.sbr"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\Scxtract.sbr"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\sdif.sbr"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\Sfheader.sbr"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\sfont.sbr"
	-@erase "$(INTDIR)\Shaker.obj"
	-@erase "$(INTDIR)\Shaker.sbr"
	-@erase "$(INTDIR)\Singwave.obj"
	-@erase "$(INTDIR)\Singwave.sbr"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\Sndinfo.sbr"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\sndinfUG.sbr"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sndwarp.sbr"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Sort.sbr"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\Soundin.sbr"
	-@erase "$(INTDIR)\Soundio.obj"
	-@erase "$(INTDIR)\Soundio.sbr"
	-@erase "$(INTDIR)\Space.obj"
	-@erase "$(INTDIR)\Space.sbr"
	-@erase "$(INTDIR)\spectra.obj"
	-@erase "$(INTDIR)\spectra.sbr"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Sread.sbr"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Swrite.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Twarp.sbr"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens1.sbr"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens2.sbr"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens3.sbr"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens4.sbr"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens5.sbr"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens6.sbr"
	-@erase "$(INTDIR)\ugens7.obj"
	-@erase "$(INTDIR)\ugens7.sbr"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens8.sbr"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugens9.sbr"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\Ugensa.sbr"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\uggab.sbr"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\ugmoss.sbr"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw1.sbr"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\Ugrw2.sbr"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ugsc.sbr"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\Ulaw.sbr"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap.sbr"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_eight.sbr"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_four.sbr"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_sixteen.sbr"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vbap_zak.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vdelay.sbr"
	-@erase "$(INTDIR)\vibrato.obj"
	-@erase "$(INTDIR)\vibrato.sbr"
	-@erase "$(INTDIR)\vpvoc.obj"
	-@erase "$(INTDIR)\vpvoc.sbr"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wave.sbr"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Wavegde.sbr"
	-@erase "$(INTDIR)\widgets.obj"
	-@erase "$(INTDIR)\widgets.sbr"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Winascii.sbr"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Windin.sbr"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\Window.sbr"
	-@erase "$(INTDIR)\Wineps.obj"
	-@erase "$(INTDIR)\Wineps.sbr"
	-@erase "$(OUTDIR)\DirectCsoundCon.bsc"
	-@erase "$(OUTDIR)\DirectCsoundCon.exe"
	-@erase "$(OUTDIR)\DirectCsoundCon.ilk"
	-@erase "$(OUTDIR)\DirectCsoundCon.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.\Debug/

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
RSC_PROJ=/l 0x410 /fo"$(INTDIR)\Dialog.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DirectCsoundCon.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\about.sbr" \
	"$(INTDIR)\aifc.sbr" \
	"$(INTDIR)\Aiff.sbr" \
	"$(INTDIR)\Aops.sbr" \
	"$(INTDIR)\Aoscilx.sbr" \
	"$(INTDIR)\argdecode.sbr" \
	"$(INTDIR)\Auxfd.sbr" \
	"$(INTDIR)\babo.sbr" \
	"$(INTDIR)\biquad.sbr" \
	"$(INTDIR)\bowedbar.sbr" \
	"$(INTDIR)\butter.sbr" \
	"$(INTDIR)\Cmath.sbr" \
	"$(INTDIR)\Complex.sbr" \
	"$(INTDIR)\ConsoleGab.sbr" \
	"$(INTDIR)\Cross2.sbr" \
	"$(INTDIR)\Cscore.sbr" \
	"$(INTDIR)\Cscorfns.sbr" \
	"$(INTDIR)\Cvanal.sbr" \
	"$(INTDIR)\Dam.sbr" \
	"$(INTDIR)\dashow.sbr" \
	"$(INTDIR)\dcblockr.sbr" \
	"$(INTDIR)\DirectXcapture.sbr" \
	"$(INTDIR)\DirectXout.sbr" \
	"$(INTDIR)\DirectXset.sbr" \
	"$(INTDIR)\Diskin.sbr" \
	"$(INTDIR)\Disprep.sbr" \
	"$(INTDIR)\Dsputil.sbr" \
	"$(INTDIR)\Dumpf.sbr" \
	"$(INTDIR)\entry1.sbr" \
	"$(INTDIR)\entry2.sbr" \
	"$(INTDIR)\Express.sbr" \
	"$(INTDIR)\Extract.sbr" \
	"$(INTDIR)\Fft.sbr" \
	"$(INTDIR)\Fgens.sbr" \
	"$(INTDIR)\Filopen.sbr" \
	"$(INTDIR)\Filter.sbr" \
	"$(INTDIR)\Fl_Knob.sbr" \
	"$(INTDIR)\Fl_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Input_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Slider_Input.sbr" \
	"$(INTDIR)\flanger.sbr" \
	"$(INTDIR)\Fm4op.sbr" \
	"$(INTDIR)\fof3.sbr" \
	"$(INTDIR)\Follow.sbr" \
	"$(INTDIR)\foscili2.sbr" \
	"$(INTDIR)\fout.sbr" \
	"$(INTDIR)\fractals.sbr" \
	"$(INTDIR)\gab_osc.sbr" \
	"$(INTDIR)\gabscanf.sbr" \
	"$(INTDIR)\gabWaveCaps.sbr" \
	"$(INTDIR)\gabWinMIDI.sbr" \
	"$(INTDIR)\generative.sbr" \
	"$(INTDIR)\genUser.sbr" \
	"$(INTDIR)\getstring.sbr" \
	"$(INTDIR)\glpng.sbr" \
	"$(INTDIR)\Grain.sbr" \
	"$(INTDIR)\Grain4.sbr" \
	"$(INTDIR)\Hetro.sbr" \
	"$(INTDIR)\Hrtferx.sbr" \
	"$(INTDIR)\Ieee80.sbr" \
	"$(INTDIR)\Insert.sbr" \
	"$(INTDIR)\InstrCall.sbr" \
	"$(INTDIR)\keyboard.sbr" \
	"$(INTDIR)\Linevent.sbr" \
	"$(INTDIR)\locsig.sbr" \
	"$(INTDIR)\loscil2.sbr" \
	"$(INTDIR)\lowpassr.sbr" \
	"$(INTDIR)\Lpanal.sbr" \
	"$(INTDIR)\Lptrkfns.sbr" \
	"$(INTDIR)\Main.sbr" \
	"$(INTDIR)\Mandolin.sbr" \
	"$(INTDIR)\Memalloc.sbr" \
	"$(INTDIR)\Memfiles.sbr" \
	"$(INTDIR)\midi_cs_gab.sbr" \
	"$(INTDIR)\Midiops.sbr" \
	"$(INTDIR)\Midiops2.sbr" \
	"$(INTDIR)\midiops3.sbr" \
	"$(INTDIR)\Midiout.sbr" \
	"$(INTDIR)\Midirecv.sbr" \
	"$(INTDIR)\Midisend.sbr" \
	"$(INTDIR)\Modal4.sbr" \
	"$(INTDIR)\Moog1.sbr" \
	"$(INTDIR)\Musmon.sbr" \
	"$(INTDIR)\Nlfilt.sbr" \
	"$(INTDIR)\Oload.sbr" \
	"$(INTDIR)\one_file.sbr" \
	"$(INTDIR)\Opcode.sbr" \
	"$(INTDIR)\Otran.sbr" \
	"$(INTDIR)\out3D.sbr" \
	"$(INTDIR)\phisem.sbr" \
	"$(INTDIR)\Physmod.sbr" \
	"$(INTDIR)\Physutil.sbr" \
	"$(INTDIR)\picture.sbr" \
	"$(INTDIR)\pitch.sbr" \
	"$(INTDIR)\Pluck.sbr" \
	"$(INTDIR)\Pvadd.sbr" \
	"$(INTDIR)\Pvanal.sbr" \
	"$(INTDIR)\Pvinterp.sbr" \
	"$(INTDIR)\pvlook.sbr" \
	"$(INTDIR)\Pvoc.sbr" \
	"$(INTDIR)\pvocext.sbr" \
	"$(INTDIR)\Pvread.sbr" \
	"$(INTDIR)\Rdorch.sbr" \
	"$(INTDIR)\Rdscor.sbr" \
	"$(INTDIR)\Repluck.sbr" \
	"$(INTDIR)\Rtaudio.sbr" \
	"$(INTDIR)\rtaudio2.sbr" \
	"$(INTDIR)\scansyn.sbr" \
	"$(INTDIR)\schedule.sbr" \
	"$(INTDIR)\Scot.sbr" \
	"$(INTDIR)\Scsort.sbr" \
	"$(INTDIR)\Scxtract.sbr" \
	"$(INTDIR)\sdif.sbr" \
	"$(INTDIR)\Sfheader.sbr" \
	"$(INTDIR)\sfont.sbr" \
	"$(INTDIR)\Shaker.sbr" \
	"$(INTDIR)\Singwave.sbr" \
	"$(INTDIR)\Sndinfo.sbr" \
	"$(INTDIR)\sndinfUG.sbr" \
	"$(INTDIR)\Sndwarp.sbr" \
	"$(INTDIR)\Sort.sbr" \
	"$(INTDIR)\Soundin.sbr" \
	"$(INTDIR)\Soundio.sbr" \
	"$(INTDIR)\Space.sbr" \
	"$(INTDIR)\spectra.sbr" \
	"$(INTDIR)\Sread.sbr" \
	"$(INTDIR)\Swrite.sbr" \
	"$(INTDIR)\timer.sbr" \
	"$(INTDIR)\Twarp.sbr" \
	"$(INTDIR)\Ugens1.sbr" \
	"$(INTDIR)\Ugens2.sbr" \
	"$(INTDIR)\Ugens3.sbr" \
	"$(INTDIR)\Ugens4.sbr" \
	"$(INTDIR)\Ugens5.sbr" \
	"$(INTDIR)\Ugens6.sbr" \
	"$(INTDIR)\ugens7.sbr" \
	"$(INTDIR)\Ugens8.sbr" \
	"$(INTDIR)\Ugens9.sbr" \
	"$(INTDIR)\Ugensa.sbr" \
	"$(INTDIR)\uggab.sbr" \
	"$(INTDIR)\ugmoss.sbr" \
	"$(INTDIR)\Ugrw1.sbr" \
	"$(INTDIR)\Ugrw2.sbr" \
	"$(INTDIR)\ugsc.sbr" \
	"$(INTDIR)\Ulaw.sbr" \
	"$(INTDIR)\vbap.sbr" \
	"$(INTDIR)\vbap_eight.sbr" \
	"$(INTDIR)\vbap_four.sbr" \
	"$(INTDIR)\vbap_sixteen.sbr" \
	"$(INTDIR)\vbap_zak.sbr" \
	"$(INTDIR)\Vdelay.sbr" \
	"$(INTDIR)\vibrato.sbr" \
	"$(INTDIR)\vpvoc.sbr" \
	"$(INTDIR)\Wave.sbr" \
	"$(INTDIR)\Wavegde.sbr" \
	"$(INTDIR)\widgets.sbr" \
	"$(INTDIR)\Winascii.sbr" \
	"$(INTDIR)\Windin.sbr" \
	"$(INTDIR)\Window.sbr" \
	"$(INTDIR)\Wineps.sbr"

"$(OUTDIR)\DirectCsoundCon.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib dsound.lib eaxguid.lib winmm.lib wsock32.lib paintlib.lib\
 libtiff.lib libjpeg.lib libpng.lib fltkd.lib /nologo /subsystem:console\
 /incremental:yes /pdb:"$(OUTDIR)\DirectCsoundCon.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\DirectCsoundCon.exe" /pdbtype:sept\
 /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Debug"\
 /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib" 
LINK32_OBJS= \
	"$(INTDIR)\about.obj" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\Aops.obj" \
	"$(INTDIR)\Aoscilx.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\Cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\ConsoleGab.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\Cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dashow.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Dialog.res" \
	"$(INTDIR)\DirectXcapture.obj" \
	"$(INTDIR)\DirectXout.obj" \
	"$(INTDIR)\DirectXset.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\Dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\Fl_Knob.obj" \
	"$(INTDIR)\Fl_Spin.obj" \
	"$(INTDIR)\Fl_Value_Input_Spin.obj" \
	"$(INTDIR)\Fl_Value_Slider_Input.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\fof3.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\foscili2.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\fractals.obj" \
	"$(INTDIR)\gab_osc.obj" \
	"$(INTDIR)\gabscanf.obj" \
	"$(INTDIR)\gabWaveCaps.obj" \
	"$(INTDIR)\gabWinMIDI.obj" \
	"$(INTDIR)\generative.obj" \
	"$(INTDIR)\genUser.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\glpng.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\InstrCall.obj" \
	"$(INTDIR)\keyboard.obj" \
	"$(INTDIR)\Linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\loscil2.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\midi_cs_gab.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\out3D.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\Physmod.obj" \
	"$(INTDIR)\Physutil.obj" \
	"$(INTDIR)\picture.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\Pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\Rtaudio.obj" \
	"$(INTDIR)\rtaudio2.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\Shaker.obj" \
	"$(INTDIR)\Singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\Soundio.obj" \
	"$(INTDIR)\Space.obj" \
	"$(INTDIR)\spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\timer.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\ugens7.obj" \
	"$(INTDIR)\Ugens8.obj" \
	"$(INTDIR)\Ugens9.obj" \
	"$(INTDIR)\Ugensa.obj" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\Ugrw1.obj" \
	"$(INTDIR)\Ugrw2.obj" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\Ulaw.obj" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\Vdelay.obj" \
	"$(INTDIR)\vibrato.obj" \
	"$(INTDIR)\vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\widgets.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\Wineps.obj"

"$(OUTDIR)\DirectCsoundCon.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

OUTDIR=.\RelDouble
INTDIR=.\RelDouble
# Begin Custom Macros
OutDir=.\RelDouble
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\DirectCsoundCon64.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ELSE 

ALL : "$(OUTDIR)\DirectCsoundCon64.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\about.obj"
	-@erase "$(INTDIR)\about.sbr"
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\aifc.sbr"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\Aiff.sbr"
	-@erase "$(INTDIR)\Aops.obj"
	-@erase "$(INTDIR)\Aops.sbr"
	-@erase "$(INTDIR)\Aoscilx.obj"
	-@erase "$(INTDIR)\Aoscilx.sbr"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\argdecode.sbr"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\Auxfd.sbr"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\babo.sbr"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\biquad.sbr"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\bowedbar.sbr"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\butter.sbr"
	-@erase "$(INTDIR)\Cmath.obj"
	-@erase "$(INTDIR)\Cmath.sbr"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\Complex.sbr"
	-@erase "$(INTDIR)\ConsoleGab.obj"
	-@erase "$(INTDIR)\ConsoleGab.sbr"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cross2.sbr"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\Cscore.sbr"
	-@erase "$(INTDIR)\Cscorfns.obj"
	-@erase "$(INTDIR)\Cscorfns.sbr"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Cvanal.sbr"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\Dam.sbr"
	-@erase "$(INTDIR)\dashow.obj"
	-@erase "$(INTDIR)\dashow.sbr"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\dcblockr.sbr"
	-@erase "$(INTDIR)\Dialog.res"
	-@erase "$(INTDIR)\DirectXcapture.obj"
	-@erase "$(INTDIR)\DirectXcapture.sbr"
	-@erase "$(INTDIR)\DirectXout.obj"
	-@erase "$(INTDIR)\DirectXout.sbr"
	-@erase "$(INTDIR)\DirectXset.obj"
	-@erase "$(INTDIR)\DirectXset.sbr"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Diskin.sbr"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\Disprep.sbr"
	-@erase "$(INTDIR)\Dsputil.obj"
	-@erase "$(INTDIR)\Dsputil.sbr"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\Dumpf.sbr"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry1.sbr"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\entry2.sbr"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Express.sbr"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Extract.sbr"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fft.sbr"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Fgens.sbr"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filopen.sbr"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\Filter.sbr"
	-@erase "$(INTDIR)\Fl_Knob.obj"
	-@erase "$(INTDIR)\Fl_Knob.sbr"
	-@erase "$(INTDIR)\Fl_Spin.obj"
	-@erase "$(INTDIR)\Fl_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.obj"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.obj"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.sbr"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\flanger.sbr"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Fm4op.sbr"
	-@erase "$(INTDIR)\fof3.obj"
	-@erase "$(INTDIR)\fof3.sbr"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\Follow.sbr"
	-@erase "$(INTDIR)\foscili2.obj"
	-@erase "$(INTDIR)\foscili2.sbr"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\fout.sbr"
	-@erase "$(INTDIR)\fractals.obj"
	-@erase "$(INTDIR)\fractals.sbr"
	-@erase "$(INTDIR)\gab_osc.obj"
	-@erase "$(INTDIR)\gab_osc.sbr"
	-@erase "$(INTDIR)\gabscanf.obj"
	-@erase "$(INTDIR)\gabscanf.sbr"
	-@erase "$(INTDIR)\gabWaveCaps.obj"
	-@erase "$(INTDIR)\gabWaveCaps.sbr"
	-@erase "$(INTDIR)\gabWinMIDI.obj"
	-@erase "$(INTDIR)\gabWinMIDI.sbr"
	-@erase "$(INTDIR)\generative.obj"
	-@erase "$(INTDIR)\generative.sbr"
	-@erase "$(INTDIR)\genUser.obj"
	-@erase "$(INTDIR)\genUser.sbr"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\getstring.sbr"
	-@erase "$(INTDIR)\glpng.obj"
	-@erase "$(INTDIR)\glpng.sbr"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain.sbr"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Grain4.sbr"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hetro.sbr"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Hrtferx.sbr"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Ieee80.sbr"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\Insert.sbr"
	-@erase "$(INTDIR)\InstrCall.obj"
	-@erase "$(INTDIR)\InstrCall.sbr"
	-@erase "$(INTDIR)\keyboard.obj"
	-@erase "$(INTDIR)\keyboard.sbr"
	-@erase "$(INTDIR)\Linevent.obj"
	-@erase "$(INTDIR)\Linevent.sbr"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\locsig.sbr"
	-@erase "$(INTDIR)\loscil2.obj"
	-@erase "$(INTDIR)\loscil2.sbr"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\lowpassr.sbr"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lpanal.sbr"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Lptrkfns.sbr"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Main.sbr"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Mandolin.sbr"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memalloc.sbr"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Memfiles.sbr"
	-@erase "$(INTDIR)\midi_cs_gab.obj"
	-@erase "$(INTDIR)\midi_cs_gab.sbr"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops.sbr"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\Midiops2.sbr"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\midiops3.sbr"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midiout.sbr"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midirecv.sbr"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Midisend.sbr"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\Modal4.sbr"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Moog1.sbr"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\Musmon.sbr"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Nlfilt.sbr"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\Oload.sbr"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\one_file.sbr"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\Opcode.sbr"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\Otran.sbr"
	-@erase "$(INTDIR)\out3D.obj"
	-@erase "$(INTDIR)\out3D.sbr"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\phisem.sbr"
	-@erase "$(INTDIR)\Physmod.obj"
	-@erase "$(INTDIR)\Physmod.sbr"
	-@erase "$(INTDIR)\Physutil.obj"
	-@erase "$(INTDIR)\Physutil.sbr"
	-@erase "$(INTDIR)\picture.obj"
	-@erase "$(INTDIR)\picture.sbr"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\pitch.sbr"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\Pluck.sbr"
	-@erase "$(INTDIR)\Pvadd.obj"
	-@erase "$(INTDIR)\Pvadd.sbr"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\Pvanal.sbr"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\Pvinterp.sbr"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\pvlook.sbr"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\Pvoc.sbr"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\pvocext.sbr"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\Pvread.sbr"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdorch.sbr"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Rdscor.sbr"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\Repluck.sbr"
	-@erase "$(INTDIR)\Rtaudio.obj"
	-@erase "$(INTDIR)\Rtaudio.sbr"
	-@erase "$(INTDIR)\rtaudio2.obj"
	-@erase "$(INTDIR)\rtaudio2.sbr"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansyn.sbr"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\schedule.sbr"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scot.sbr"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scsort.sbr"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\Scxtract.sbr"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\sdif.sbr"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\Sfheader.sbr"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\sfont.sbr"
	-@erase "$(INTDIR)\Shaker.obj"
	-@erase "$(INTDIR)\Shaker.sbr"
	-@erase "$(INTDIR)\Singwave.obj"
	-@erase "$(INTDIR)\Singwave.sbr"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\Sndinfo.sbr"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\sndinfUG.sbr"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sndwarp.sbr"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Sort.sbr"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\Soundin.sbr"
	-@erase "$(INTDIR)\Soundio.obj"
	-@erase "$(INTDIR)\Soundio.sbr"
	-@erase "$(INTDIR)\Space.obj"
	-@erase "$(INTDIR)\Space.sbr"
	-@erase "$(INTDIR)\spectra.obj"
	-@erase "$(INTDIR)\spectra.sbr"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Sread.sbr"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Swrite.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Twarp.sbr"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens1.sbr"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens2.sbr"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens3.sbr"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens4.sbr"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens5.sbr"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens6.sbr"
	-@erase "$(INTDIR)\ugens7.obj"
	-@erase "$(INTDIR)\ugens7.sbr"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens8.sbr"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugens9.sbr"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\Ugensa.sbr"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\uggab.sbr"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\ugmoss.sbr"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw1.sbr"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\Ugrw2.sbr"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ugsc.sbr"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\Ulaw.sbr"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap.sbr"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_eight.sbr"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_four.sbr"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_sixteen.sbr"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vbap_zak.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vdelay.sbr"
	-@erase "$(INTDIR)\vibrato.obj"
	-@erase "$(INTDIR)\vibrato.sbr"
	-@erase "$(INTDIR)\vpvoc.obj"
	-@erase "$(INTDIR)\vpvoc.sbr"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wave.sbr"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Wavegde.sbr"
	-@erase "$(INTDIR)\widgets.obj"
	-@erase "$(INTDIR)\widgets.sbr"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Winascii.sbr"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Windin.sbr"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\Window.sbr"
	-@erase "$(INTDIR)\Wineps.obj"
	-@erase "$(INTDIR)\Wineps.sbr"
	-@erase "$(OUTDIR)\DirectCsoundCon.bsc"
	-@erase "$(OUTDIR)\DirectCsoundCon64.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 
CPP_OBJS=.\RelDouble/
CPP_SBRS=.\RelDouble/

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
RSC_PROJ=/l 0x410 /fo"$(INTDIR)\Dialog.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DirectCsoundCon.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\about.sbr" \
	"$(INTDIR)\aifc.sbr" \
	"$(INTDIR)\Aiff.sbr" \
	"$(INTDIR)\Aops.sbr" \
	"$(INTDIR)\Aoscilx.sbr" \
	"$(INTDIR)\argdecode.sbr" \
	"$(INTDIR)\Auxfd.sbr" \
	"$(INTDIR)\babo.sbr" \
	"$(INTDIR)\biquad.sbr" \
	"$(INTDIR)\bowedbar.sbr" \
	"$(INTDIR)\butter.sbr" \
	"$(INTDIR)\Cmath.sbr" \
	"$(INTDIR)\Complex.sbr" \
	"$(INTDIR)\ConsoleGab.sbr" \
	"$(INTDIR)\Cross2.sbr" \
	"$(INTDIR)\Cscore.sbr" \
	"$(INTDIR)\Cscorfns.sbr" \
	"$(INTDIR)\Cvanal.sbr" \
	"$(INTDIR)\Dam.sbr" \
	"$(INTDIR)\dashow.sbr" \
	"$(INTDIR)\dcblockr.sbr" \
	"$(INTDIR)\DirectXcapture.sbr" \
	"$(INTDIR)\DirectXout.sbr" \
	"$(INTDIR)\DirectXset.sbr" \
	"$(INTDIR)\Diskin.sbr" \
	"$(INTDIR)\Disprep.sbr" \
	"$(INTDIR)\Dsputil.sbr" \
	"$(INTDIR)\Dumpf.sbr" \
	"$(INTDIR)\entry1.sbr" \
	"$(INTDIR)\entry2.sbr" \
	"$(INTDIR)\Express.sbr" \
	"$(INTDIR)\Extract.sbr" \
	"$(INTDIR)\Fft.sbr" \
	"$(INTDIR)\Fgens.sbr" \
	"$(INTDIR)\Filopen.sbr" \
	"$(INTDIR)\Filter.sbr" \
	"$(INTDIR)\Fl_Knob.sbr" \
	"$(INTDIR)\Fl_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Input_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Slider_Input.sbr" \
	"$(INTDIR)\flanger.sbr" \
	"$(INTDIR)\Fm4op.sbr" \
	"$(INTDIR)\fof3.sbr" \
	"$(INTDIR)\Follow.sbr" \
	"$(INTDIR)\foscili2.sbr" \
	"$(INTDIR)\fout.sbr" \
	"$(INTDIR)\fractals.sbr" \
	"$(INTDIR)\gab_osc.sbr" \
	"$(INTDIR)\gabscanf.sbr" \
	"$(INTDIR)\gabWaveCaps.sbr" \
	"$(INTDIR)\gabWinMIDI.sbr" \
	"$(INTDIR)\generative.sbr" \
	"$(INTDIR)\genUser.sbr" \
	"$(INTDIR)\getstring.sbr" \
	"$(INTDIR)\glpng.sbr" \
	"$(INTDIR)\Grain.sbr" \
	"$(INTDIR)\Grain4.sbr" \
	"$(INTDIR)\Hetro.sbr" \
	"$(INTDIR)\Hrtferx.sbr" \
	"$(INTDIR)\Ieee80.sbr" \
	"$(INTDIR)\Insert.sbr" \
	"$(INTDIR)\InstrCall.sbr" \
	"$(INTDIR)\keyboard.sbr" \
	"$(INTDIR)\Linevent.sbr" \
	"$(INTDIR)\locsig.sbr" \
	"$(INTDIR)\loscil2.sbr" \
	"$(INTDIR)\lowpassr.sbr" \
	"$(INTDIR)\Lpanal.sbr" \
	"$(INTDIR)\Lptrkfns.sbr" \
	"$(INTDIR)\Main.sbr" \
	"$(INTDIR)\Mandolin.sbr" \
	"$(INTDIR)\Memalloc.sbr" \
	"$(INTDIR)\Memfiles.sbr" \
	"$(INTDIR)\midi_cs_gab.sbr" \
	"$(INTDIR)\Midiops.sbr" \
	"$(INTDIR)\Midiops2.sbr" \
	"$(INTDIR)\midiops3.sbr" \
	"$(INTDIR)\Midiout.sbr" \
	"$(INTDIR)\Midirecv.sbr" \
	"$(INTDIR)\Midisend.sbr" \
	"$(INTDIR)\Modal4.sbr" \
	"$(INTDIR)\Moog1.sbr" \
	"$(INTDIR)\Musmon.sbr" \
	"$(INTDIR)\Nlfilt.sbr" \
	"$(INTDIR)\Oload.sbr" \
	"$(INTDIR)\one_file.sbr" \
	"$(INTDIR)\Opcode.sbr" \
	"$(INTDIR)\Otran.sbr" \
	"$(INTDIR)\out3D.sbr" \
	"$(INTDIR)\phisem.sbr" \
	"$(INTDIR)\Physmod.sbr" \
	"$(INTDIR)\Physutil.sbr" \
	"$(INTDIR)\picture.sbr" \
	"$(INTDIR)\pitch.sbr" \
	"$(INTDIR)\Pluck.sbr" \
	"$(INTDIR)\Pvadd.sbr" \
	"$(INTDIR)\Pvanal.sbr" \
	"$(INTDIR)\Pvinterp.sbr" \
	"$(INTDIR)\pvlook.sbr" \
	"$(INTDIR)\Pvoc.sbr" \
	"$(INTDIR)\pvocext.sbr" \
	"$(INTDIR)\Pvread.sbr" \
	"$(INTDIR)\Rdorch.sbr" \
	"$(INTDIR)\Rdscor.sbr" \
	"$(INTDIR)\Repluck.sbr" \
	"$(INTDIR)\Rtaudio.sbr" \
	"$(INTDIR)\rtaudio2.sbr" \
	"$(INTDIR)\scansyn.sbr" \
	"$(INTDIR)\schedule.sbr" \
	"$(INTDIR)\Scot.sbr" \
	"$(INTDIR)\Scsort.sbr" \
	"$(INTDIR)\Scxtract.sbr" \
	"$(INTDIR)\sdif.sbr" \
	"$(INTDIR)\Sfheader.sbr" \
	"$(INTDIR)\sfont.sbr" \
	"$(INTDIR)\Shaker.sbr" \
	"$(INTDIR)\Singwave.sbr" \
	"$(INTDIR)\Sndinfo.sbr" \
	"$(INTDIR)\sndinfUG.sbr" \
	"$(INTDIR)\Sndwarp.sbr" \
	"$(INTDIR)\Sort.sbr" \
	"$(INTDIR)\Soundin.sbr" \
	"$(INTDIR)\Soundio.sbr" \
	"$(INTDIR)\Space.sbr" \
	"$(INTDIR)\spectra.sbr" \
	"$(INTDIR)\Sread.sbr" \
	"$(INTDIR)\Swrite.sbr" \
	"$(INTDIR)\timer.sbr" \
	"$(INTDIR)\Twarp.sbr" \
	"$(INTDIR)\Ugens1.sbr" \
	"$(INTDIR)\Ugens2.sbr" \
	"$(INTDIR)\Ugens3.sbr" \
	"$(INTDIR)\Ugens4.sbr" \
	"$(INTDIR)\Ugens5.sbr" \
	"$(INTDIR)\Ugens6.sbr" \
	"$(INTDIR)\ugens7.sbr" \
	"$(INTDIR)\Ugens8.sbr" \
	"$(INTDIR)\Ugens9.sbr" \
	"$(INTDIR)\Ugensa.sbr" \
	"$(INTDIR)\uggab.sbr" \
	"$(INTDIR)\ugmoss.sbr" \
	"$(INTDIR)\Ugrw1.sbr" \
	"$(INTDIR)\Ugrw2.sbr" \
	"$(INTDIR)\ugsc.sbr" \
	"$(INTDIR)\Ulaw.sbr" \
	"$(INTDIR)\vbap.sbr" \
	"$(INTDIR)\vbap_eight.sbr" \
	"$(INTDIR)\vbap_four.sbr" \
	"$(INTDIR)\vbap_sixteen.sbr" \
	"$(INTDIR)\vbap_zak.sbr" \
	"$(INTDIR)\Vdelay.sbr" \
	"$(INTDIR)\vibrato.sbr" \
	"$(INTDIR)\vpvoc.sbr" \
	"$(INTDIR)\Wave.sbr" \
	"$(INTDIR)\Wavegde.sbr" \
	"$(INTDIR)\widgets.sbr" \
	"$(INTDIR)\Winascii.sbr" \
	"$(INTDIR)\Windin.sbr" \
	"$(INTDIR)\Window.sbr" \
	"$(INTDIR)\Wineps.sbr"

"$(OUTDIR)\DirectCsoundCon.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib dsound.lib eaxguid.lib winmm.lib paintlib.lib libtiff.lib\
 libjpeg.lib libpng.lib wsock32.lib fltk.lib opengl32.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)\DirectCsoundCon64.pdb"\
 /machine:I386 /out:"$(OUTDIR)\DirectCsoundCon64.exe"\
 /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Release"\
 /libpath:"\My_Docs\Visual_C\FLTK\fltk-1.0.10\lib" 
LINK32_OBJS= \
	"$(INTDIR)\about.obj" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\Aops.obj" \
	"$(INTDIR)\Aoscilx.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\Cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\ConsoleGab.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\Cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dashow.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Dialog.res" \
	"$(INTDIR)\DirectXcapture.obj" \
	"$(INTDIR)\DirectXout.obj" \
	"$(INTDIR)\DirectXset.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\Dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\Fl_Knob.obj" \
	"$(INTDIR)\Fl_Spin.obj" \
	"$(INTDIR)\Fl_Value_Input_Spin.obj" \
	"$(INTDIR)\Fl_Value_Slider_Input.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\fof3.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\foscili2.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\fractals.obj" \
	"$(INTDIR)\gab_osc.obj" \
	"$(INTDIR)\gabscanf.obj" \
	"$(INTDIR)\gabWaveCaps.obj" \
	"$(INTDIR)\gabWinMIDI.obj" \
	"$(INTDIR)\generative.obj" \
	"$(INTDIR)\genUser.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\glpng.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\InstrCall.obj" \
	"$(INTDIR)\keyboard.obj" \
	"$(INTDIR)\Linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\loscil2.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\midi_cs_gab.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\out3D.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\Physmod.obj" \
	"$(INTDIR)\Physutil.obj" \
	"$(INTDIR)\picture.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\Pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\Rtaudio.obj" \
	"$(INTDIR)\rtaudio2.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\Shaker.obj" \
	"$(INTDIR)\Singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\Soundio.obj" \
	"$(INTDIR)\Space.obj" \
	"$(INTDIR)\spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\timer.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\ugens7.obj" \
	"$(INTDIR)\Ugens8.obj" \
	"$(INTDIR)\Ugens9.obj" \
	"$(INTDIR)\Ugensa.obj" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\Ugrw1.obj" \
	"$(INTDIR)\Ugrw2.obj" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\Ulaw.obj" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\Vdelay.obj" \
	"$(INTDIR)\vibrato.obj" \
	"$(INTDIR)\vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\widgets.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\Wineps.obj"

"$(OUTDIR)\DirectCsoundCon64.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

OUTDIR=.\DebDouble
INTDIR=.\DebDouble
# Begin Custom Macros
OutDir=.\DebDouble
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\DirectCsoundCon64.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ELSE 

ALL : "$(OUTDIR)\DirectCsoundCon64.exe" "$(OUTDIR)\DirectCsoundCon.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\about.obj"
	-@erase "$(INTDIR)\about.sbr"
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\aifc.sbr"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\Aiff.sbr"
	-@erase "$(INTDIR)\Aops.obj"
	-@erase "$(INTDIR)\Aops.sbr"
	-@erase "$(INTDIR)\Aoscilx.obj"
	-@erase "$(INTDIR)\Aoscilx.sbr"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\argdecode.sbr"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\Auxfd.sbr"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\babo.sbr"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\biquad.sbr"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\bowedbar.sbr"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\butter.sbr"
	-@erase "$(INTDIR)\Cmath.obj"
	-@erase "$(INTDIR)\Cmath.sbr"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\Complex.sbr"
	-@erase "$(INTDIR)\ConsoleGab.obj"
	-@erase "$(INTDIR)\ConsoleGab.sbr"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cross2.sbr"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\Cscore.sbr"
	-@erase "$(INTDIR)\Cscorfns.obj"
	-@erase "$(INTDIR)\Cscorfns.sbr"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Cvanal.sbr"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\Dam.sbr"
	-@erase "$(INTDIR)\dashow.obj"
	-@erase "$(INTDIR)\dashow.sbr"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\dcblockr.sbr"
	-@erase "$(INTDIR)\Dialog.res"
	-@erase "$(INTDIR)\DirectXcapture.obj"
	-@erase "$(INTDIR)\DirectXcapture.sbr"
	-@erase "$(INTDIR)\DirectXout.obj"
	-@erase "$(INTDIR)\DirectXout.sbr"
	-@erase "$(INTDIR)\DirectXset.obj"
	-@erase "$(INTDIR)\DirectXset.sbr"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Diskin.sbr"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\Disprep.sbr"
	-@erase "$(INTDIR)\Dsputil.obj"
	-@erase "$(INTDIR)\Dsputil.sbr"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\Dumpf.sbr"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry1.sbr"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\entry2.sbr"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Express.sbr"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Extract.sbr"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fft.sbr"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Fgens.sbr"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filopen.sbr"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\Filter.sbr"
	-@erase "$(INTDIR)\Fl_Knob.obj"
	-@erase "$(INTDIR)\Fl_Knob.sbr"
	-@erase "$(INTDIR)\Fl_Spin.obj"
	-@erase "$(INTDIR)\Fl_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.obj"
	-@erase "$(INTDIR)\Fl_Value_Input_Spin.sbr"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.obj"
	-@erase "$(INTDIR)\Fl_Value_Slider_Input.sbr"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\flanger.sbr"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Fm4op.sbr"
	-@erase "$(INTDIR)\fof3.obj"
	-@erase "$(INTDIR)\fof3.sbr"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\Follow.sbr"
	-@erase "$(INTDIR)\foscili2.obj"
	-@erase "$(INTDIR)\foscili2.sbr"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\fout.sbr"
	-@erase "$(INTDIR)\fractals.obj"
	-@erase "$(INTDIR)\fractals.sbr"
	-@erase "$(INTDIR)\gab_osc.obj"
	-@erase "$(INTDIR)\gab_osc.sbr"
	-@erase "$(INTDIR)\gabscanf.obj"
	-@erase "$(INTDIR)\gabscanf.sbr"
	-@erase "$(INTDIR)\gabWaveCaps.obj"
	-@erase "$(INTDIR)\gabWaveCaps.sbr"
	-@erase "$(INTDIR)\gabWinMIDI.obj"
	-@erase "$(INTDIR)\gabWinMIDI.sbr"
	-@erase "$(INTDIR)\generative.obj"
	-@erase "$(INTDIR)\generative.sbr"
	-@erase "$(INTDIR)\genUser.obj"
	-@erase "$(INTDIR)\genUser.sbr"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\getstring.sbr"
	-@erase "$(INTDIR)\glpng.obj"
	-@erase "$(INTDIR)\glpng.sbr"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain.sbr"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Grain4.sbr"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hetro.sbr"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Hrtferx.sbr"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Ieee80.sbr"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\Insert.sbr"
	-@erase "$(INTDIR)\InstrCall.obj"
	-@erase "$(INTDIR)\InstrCall.sbr"
	-@erase "$(INTDIR)\keyboard.obj"
	-@erase "$(INTDIR)\keyboard.sbr"
	-@erase "$(INTDIR)\Linevent.obj"
	-@erase "$(INTDIR)\Linevent.sbr"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\locsig.sbr"
	-@erase "$(INTDIR)\loscil2.obj"
	-@erase "$(INTDIR)\loscil2.sbr"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\lowpassr.sbr"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lpanal.sbr"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Lptrkfns.sbr"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Main.sbr"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Mandolin.sbr"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memalloc.sbr"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Memfiles.sbr"
	-@erase "$(INTDIR)\midi_cs_gab.obj"
	-@erase "$(INTDIR)\midi_cs_gab.sbr"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops.sbr"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\Midiops2.sbr"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\midiops3.sbr"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midiout.sbr"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midirecv.sbr"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Midisend.sbr"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\Modal4.sbr"
	-@erase "$(INTDIR)\Moog1.obj"
	-@erase "$(INTDIR)\Moog1.sbr"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\Musmon.sbr"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Nlfilt.sbr"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\Oload.sbr"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\one_file.sbr"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\Opcode.sbr"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\Otran.sbr"
	-@erase "$(INTDIR)\out3D.obj"
	-@erase "$(INTDIR)\out3D.sbr"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\phisem.sbr"
	-@erase "$(INTDIR)\Physmod.obj"
	-@erase "$(INTDIR)\Physmod.sbr"
	-@erase "$(INTDIR)\Physutil.obj"
	-@erase "$(INTDIR)\Physutil.sbr"
	-@erase "$(INTDIR)\picture.obj"
	-@erase "$(INTDIR)\picture.sbr"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\pitch.sbr"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\Pluck.sbr"
	-@erase "$(INTDIR)\Pvadd.obj"
	-@erase "$(INTDIR)\Pvadd.sbr"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\Pvanal.sbr"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\Pvinterp.sbr"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\pvlook.sbr"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\Pvoc.sbr"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\pvocext.sbr"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\Pvread.sbr"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdorch.sbr"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Rdscor.sbr"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\Repluck.sbr"
	-@erase "$(INTDIR)\Rtaudio.obj"
	-@erase "$(INTDIR)\Rtaudio.sbr"
	-@erase "$(INTDIR)\rtaudio2.obj"
	-@erase "$(INTDIR)\rtaudio2.sbr"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansyn.sbr"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\schedule.sbr"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scot.sbr"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scsort.sbr"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\Scxtract.sbr"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\sdif.sbr"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\Sfheader.sbr"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\sfont.sbr"
	-@erase "$(INTDIR)\Shaker.obj"
	-@erase "$(INTDIR)\Shaker.sbr"
	-@erase "$(INTDIR)\Singwave.obj"
	-@erase "$(INTDIR)\Singwave.sbr"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\Sndinfo.sbr"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\sndinfUG.sbr"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sndwarp.sbr"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Sort.sbr"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\Soundin.sbr"
	-@erase "$(INTDIR)\Soundio.obj"
	-@erase "$(INTDIR)\Soundio.sbr"
	-@erase "$(INTDIR)\Space.obj"
	-@erase "$(INTDIR)\Space.sbr"
	-@erase "$(INTDIR)\spectra.obj"
	-@erase "$(INTDIR)\spectra.sbr"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Sread.sbr"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Swrite.sbr"
	-@erase "$(INTDIR)\timer.obj"
	-@erase "$(INTDIR)\timer.sbr"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Twarp.sbr"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens1.sbr"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens2.sbr"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens3.sbr"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens4.sbr"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens5.sbr"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens6.sbr"
	-@erase "$(INTDIR)\ugens7.obj"
	-@erase "$(INTDIR)\ugens7.sbr"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens8.sbr"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugens9.sbr"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\Ugensa.sbr"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\uggab.sbr"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\ugmoss.sbr"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw1.sbr"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\Ugrw2.sbr"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\ugsc.sbr"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\Ulaw.sbr"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap.sbr"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_eight.sbr"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_four.sbr"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_sixteen.sbr"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vbap_zak.sbr"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vdelay.sbr"
	-@erase "$(INTDIR)\vibrato.obj"
	-@erase "$(INTDIR)\vibrato.sbr"
	-@erase "$(INTDIR)\vpvoc.obj"
	-@erase "$(INTDIR)\vpvoc.sbr"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wave.sbr"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Wavegde.sbr"
	-@erase "$(INTDIR)\widgets.obj"
	-@erase "$(INTDIR)\widgets.sbr"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Winascii.sbr"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Windin.sbr"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\Window.sbr"
	-@erase "$(INTDIR)\Wineps.obj"
	-@erase "$(INTDIR)\Wineps.sbr"
	-@erase "$(OUTDIR)\DirectCsoundCon.bsc"
	-@erase "$(OUTDIR)\DirectCsoundCon64.exe"
	-@erase "$(OUTDIR)\DirectCsoundCon64.ilk"
	-@erase "$(OUTDIR)\DirectCsoundCon64.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 
CPP_OBJS=.\DebDouble/
CPP_SBRS=.\DebDouble/

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
RSC_PROJ=/l 0x410 /fo"$(INTDIR)\Dialog.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\DirectCsoundCon.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\about.sbr" \
	"$(INTDIR)\aifc.sbr" \
	"$(INTDIR)\Aiff.sbr" \
	"$(INTDIR)\Aops.sbr" \
	"$(INTDIR)\Aoscilx.sbr" \
	"$(INTDIR)\argdecode.sbr" \
	"$(INTDIR)\Auxfd.sbr" \
	"$(INTDIR)\babo.sbr" \
	"$(INTDIR)\biquad.sbr" \
	"$(INTDIR)\bowedbar.sbr" \
	"$(INTDIR)\butter.sbr" \
	"$(INTDIR)\Cmath.sbr" \
	"$(INTDIR)\Complex.sbr" \
	"$(INTDIR)\ConsoleGab.sbr" \
	"$(INTDIR)\Cross2.sbr" \
	"$(INTDIR)\Cscore.sbr" \
	"$(INTDIR)\Cscorfns.sbr" \
	"$(INTDIR)\Cvanal.sbr" \
	"$(INTDIR)\Dam.sbr" \
	"$(INTDIR)\dashow.sbr" \
	"$(INTDIR)\dcblockr.sbr" \
	"$(INTDIR)\DirectXcapture.sbr" \
	"$(INTDIR)\DirectXout.sbr" \
	"$(INTDIR)\DirectXset.sbr" \
	"$(INTDIR)\Diskin.sbr" \
	"$(INTDIR)\Disprep.sbr" \
	"$(INTDIR)\Dsputil.sbr" \
	"$(INTDIR)\Dumpf.sbr" \
	"$(INTDIR)\entry1.sbr" \
	"$(INTDIR)\entry2.sbr" \
	"$(INTDIR)\Express.sbr" \
	"$(INTDIR)\Extract.sbr" \
	"$(INTDIR)\Fft.sbr" \
	"$(INTDIR)\Fgens.sbr" \
	"$(INTDIR)\Filopen.sbr" \
	"$(INTDIR)\Filter.sbr" \
	"$(INTDIR)\Fl_Knob.sbr" \
	"$(INTDIR)\Fl_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Input_Spin.sbr" \
	"$(INTDIR)\Fl_Value_Slider_Input.sbr" \
	"$(INTDIR)\flanger.sbr" \
	"$(INTDIR)\Fm4op.sbr" \
	"$(INTDIR)\fof3.sbr" \
	"$(INTDIR)\Follow.sbr" \
	"$(INTDIR)\foscili2.sbr" \
	"$(INTDIR)\fout.sbr" \
	"$(INTDIR)\fractals.sbr" \
	"$(INTDIR)\gab_osc.sbr" \
	"$(INTDIR)\gabscanf.sbr" \
	"$(INTDIR)\gabWaveCaps.sbr" \
	"$(INTDIR)\gabWinMIDI.sbr" \
	"$(INTDIR)\generative.sbr" \
	"$(INTDIR)\genUser.sbr" \
	"$(INTDIR)\getstring.sbr" \
	"$(INTDIR)\glpng.sbr" \
	"$(INTDIR)\Grain.sbr" \
	"$(INTDIR)\Grain4.sbr" \
	"$(INTDIR)\Hetro.sbr" \
	"$(INTDIR)\Hrtferx.sbr" \
	"$(INTDIR)\Ieee80.sbr" \
	"$(INTDIR)\Insert.sbr" \
	"$(INTDIR)\InstrCall.sbr" \
	"$(INTDIR)\keyboard.sbr" \
	"$(INTDIR)\Linevent.sbr" \
	"$(INTDIR)\locsig.sbr" \
	"$(INTDIR)\loscil2.sbr" \
	"$(INTDIR)\lowpassr.sbr" \
	"$(INTDIR)\Lpanal.sbr" \
	"$(INTDIR)\Lptrkfns.sbr" \
	"$(INTDIR)\Main.sbr" \
	"$(INTDIR)\Mandolin.sbr" \
	"$(INTDIR)\Memalloc.sbr" \
	"$(INTDIR)\Memfiles.sbr" \
	"$(INTDIR)\midi_cs_gab.sbr" \
	"$(INTDIR)\Midiops.sbr" \
	"$(INTDIR)\Midiops2.sbr" \
	"$(INTDIR)\midiops3.sbr" \
	"$(INTDIR)\Midiout.sbr" \
	"$(INTDIR)\Midirecv.sbr" \
	"$(INTDIR)\Midisend.sbr" \
	"$(INTDIR)\Modal4.sbr" \
	"$(INTDIR)\Moog1.sbr" \
	"$(INTDIR)\Musmon.sbr" \
	"$(INTDIR)\Nlfilt.sbr" \
	"$(INTDIR)\Oload.sbr" \
	"$(INTDIR)\one_file.sbr" \
	"$(INTDIR)\Opcode.sbr" \
	"$(INTDIR)\Otran.sbr" \
	"$(INTDIR)\out3D.sbr" \
	"$(INTDIR)\phisem.sbr" \
	"$(INTDIR)\Physmod.sbr" \
	"$(INTDIR)\Physutil.sbr" \
	"$(INTDIR)\picture.sbr" \
	"$(INTDIR)\pitch.sbr" \
	"$(INTDIR)\Pluck.sbr" \
	"$(INTDIR)\Pvadd.sbr" \
	"$(INTDIR)\Pvanal.sbr" \
	"$(INTDIR)\Pvinterp.sbr" \
	"$(INTDIR)\pvlook.sbr" \
	"$(INTDIR)\Pvoc.sbr" \
	"$(INTDIR)\pvocext.sbr" \
	"$(INTDIR)\Pvread.sbr" \
	"$(INTDIR)\Rdorch.sbr" \
	"$(INTDIR)\Rdscor.sbr" \
	"$(INTDIR)\Repluck.sbr" \
	"$(INTDIR)\Rtaudio.sbr" \
	"$(INTDIR)\rtaudio2.sbr" \
	"$(INTDIR)\scansyn.sbr" \
	"$(INTDIR)\schedule.sbr" \
	"$(INTDIR)\Scot.sbr" \
	"$(INTDIR)\Scsort.sbr" \
	"$(INTDIR)\Scxtract.sbr" \
	"$(INTDIR)\sdif.sbr" \
	"$(INTDIR)\Sfheader.sbr" \
	"$(INTDIR)\sfont.sbr" \
	"$(INTDIR)\Shaker.sbr" \
	"$(INTDIR)\Singwave.sbr" \
	"$(INTDIR)\Sndinfo.sbr" \
	"$(INTDIR)\sndinfUG.sbr" \
	"$(INTDIR)\Sndwarp.sbr" \
	"$(INTDIR)\Sort.sbr" \
	"$(INTDIR)\Soundin.sbr" \
	"$(INTDIR)\Soundio.sbr" \
	"$(INTDIR)\Space.sbr" \
	"$(INTDIR)\spectra.sbr" \
	"$(INTDIR)\Sread.sbr" \
	"$(INTDIR)\Swrite.sbr" \
	"$(INTDIR)\timer.sbr" \
	"$(INTDIR)\Twarp.sbr" \
	"$(INTDIR)\Ugens1.sbr" \
	"$(INTDIR)\Ugens2.sbr" \
	"$(INTDIR)\Ugens3.sbr" \
	"$(INTDIR)\Ugens4.sbr" \
	"$(INTDIR)\Ugens5.sbr" \
	"$(INTDIR)\Ugens6.sbr" \
	"$(INTDIR)\ugens7.sbr" \
	"$(INTDIR)\Ugens8.sbr" \
	"$(INTDIR)\Ugens9.sbr" \
	"$(INTDIR)\Ugensa.sbr" \
	"$(INTDIR)\uggab.sbr" \
	"$(INTDIR)\ugmoss.sbr" \
	"$(INTDIR)\Ugrw1.sbr" \
	"$(INTDIR)\Ugrw2.sbr" \
	"$(INTDIR)\ugsc.sbr" \
	"$(INTDIR)\Ulaw.sbr" \
	"$(INTDIR)\vbap.sbr" \
	"$(INTDIR)\vbap_eight.sbr" \
	"$(INTDIR)\vbap_four.sbr" \
	"$(INTDIR)\vbap_sixteen.sbr" \
	"$(INTDIR)\vbap_zak.sbr" \
	"$(INTDIR)\Vdelay.sbr" \
	"$(INTDIR)\vibrato.sbr" \
	"$(INTDIR)\vpvoc.sbr" \
	"$(INTDIR)\Wave.sbr" \
	"$(INTDIR)\Wavegde.sbr" \
	"$(INTDIR)\widgets.sbr" \
	"$(INTDIR)\Winascii.sbr" \
	"$(INTDIR)\Windin.sbr" \
	"$(INTDIR)\Window.sbr" \
	"$(INTDIR)\Wineps.sbr"

"$(OUTDIR)\DirectCsoundCon.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib dsound.lib eaxguid.lib winmm.lib paintlib.lib libtiff.lib\
 libjpeg.lib libpng.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\DirectCsoundCon64.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\DirectCsoundCon64.exe" /pdbtype:sept\
 /libpath:"c:\My_Docs\Visual_C\paintlib\lib\Debug" 
LINK32_OBJS= \
	"$(INTDIR)\about.obj" \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\Aops.obj" \
	"$(INTDIR)\Aoscilx.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\Cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\ConsoleGab.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\Cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dashow.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Dialog.res" \
	"$(INTDIR)\DirectXcapture.obj" \
	"$(INTDIR)\DirectXout.obj" \
	"$(INTDIR)\DirectXset.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\Dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\Fl_Knob.obj" \
	"$(INTDIR)\Fl_Spin.obj" \
	"$(INTDIR)\Fl_Value_Input_Spin.obj" \
	"$(INTDIR)\Fl_Value_Slider_Input.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\fof3.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\foscili2.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\fractals.obj" \
	"$(INTDIR)\gab_osc.obj" \
	"$(INTDIR)\gabscanf.obj" \
	"$(INTDIR)\gabWaveCaps.obj" \
	"$(INTDIR)\gabWinMIDI.obj" \
	"$(INTDIR)\generative.obj" \
	"$(INTDIR)\genUser.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\glpng.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\InstrCall.obj" \
	"$(INTDIR)\keyboard.obj" \
	"$(INTDIR)\Linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\loscil2.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\midi_cs_gab.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\Moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\out3D.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\Physmod.obj" \
	"$(INTDIR)\Physutil.obj" \
	"$(INTDIR)\picture.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\Pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\Rtaudio.obj" \
	"$(INTDIR)\rtaudio2.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\Shaker.obj" \
	"$(INTDIR)\Singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\Soundio.obj" \
	"$(INTDIR)\Space.obj" \
	"$(INTDIR)\spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\timer.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\ugens7.obj" \
	"$(INTDIR)\Ugens8.obj" \
	"$(INTDIR)\Ugens9.obj" \
	"$(INTDIR)\Ugensa.obj" \
	"$(INTDIR)\uggab.obj" \
	"$(INTDIR)\ugmoss.obj" \
	"$(INTDIR)\Ugrw1.obj" \
	"$(INTDIR)\Ugrw2.obj" \
	"$(INTDIR)\ugsc.obj" \
	"$(INTDIR)\Ulaw.obj" \
	"$(INTDIR)\vbap.obj" \
	"$(INTDIR)\vbap_eight.obj" \
	"$(INTDIR)\vbap_four.obj" \
	"$(INTDIR)\vbap_sixteen.obj" \
	"$(INTDIR)\vbap_zak.obj" \
	"$(INTDIR)\Vdelay.obj" \
	"$(INTDIR)\vibrato.obj" \
	"$(INTDIR)\vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\widgets.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\Wineps.obj"

"$(OUTDIR)\DirectCsoundCon64.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "DirectCsoundCon - Win32 Release" || "$(CFG)" ==\
 "DirectCsoundCon - Win32 Debug" || "$(CFG)" ==\
 "DirectCsoundCon - Win32 double Release" || "$(CFG)" ==\
 "DirectCsoundCon - Win32 double Debug"
SOURCE=.\aifc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_AIFC_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\aifc.obj"	"$(INTDIR)\aifc.sbr" : $(SOURCE) $(DEP_CPP_AIFC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_AIFC_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\aifc.obj"	"$(INTDIR)\aifc.sbr" : $(SOURCE) $(DEP_CPP_AIFC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_AIFC_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\aifc.obj"	"$(INTDIR)\aifc.sbr" : $(SOURCE) $(DEP_CPP_AIFC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_AIFC_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\aifc.obj"	"$(INTDIR)\aifc.sbr" : $(SOURCE) $(DEP_CPP_AIFC_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Aiff.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_AIFF_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aiff.obj"	"$(INTDIR)\Aiff.sbr" : $(SOURCE) $(DEP_CPP_AIFF_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_AIFF_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aiff.obj"	"$(INTDIR)\Aiff.sbr" : $(SOURCE) $(DEP_CPP_AIFF_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_AIFF_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aiff.obj"	"$(INTDIR)\Aiff.sbr" : $(SOURCE) $(DEP_CPP_AIFF_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_AIFF_=\
	".\aiff.h"\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Aiff.obj"	"$(INTDIR)\Aiff.sbr" : $(SOURCE) $(DEP_CPP_AIFF_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Aops.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_AOPS_=\
	".\aops.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /Ot /Og /Oy /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Aops.obj"	"$(INTDIR)\Aops.sbr" : $(SOURCE) $(DEP_CPP_AOPS_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_AOPS_=\
	".\aops.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Aops.obj"	"$(INTDIR)\Aops.sbr" : $(SOURCE) $(DEP_CPP_AOPS_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_AOPS_=\
	".\aops.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /Ot /Og /Oy /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Aops.obj"	"$(INTDIR)\Aops.sbr" : $(SOURCE) $(DEP_CPP_AOPS_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_AOPS_=\
	".\aops.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Aops.obj"	"$(INTDIR)\Aops.sbr" : $(SOURCE) $(DEP_CPP_AOPS_)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Aoscilx.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_AOSCI=\
	".\aoscilx.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aoscilx.obj"	"$(INTDIR)\Aoscilx.sbr" : $(SOURCE) $(DEP_CPP_AOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_AOSCI=\
	".\aoscilx.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aoscilx.obj"	"$(INTDIR)\Aoscilx.sbr" : $(SOURCE) $(DEP_CPP_AOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_AOSCI=\
	".\aoscilx.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Aoscilx.obj"	"$(INTDIR)\Aoscilx.sbr" : $(SOURCE) $(DEP_CPP_AOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_AOSCI=\
	".\aoscilx.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Aoscilx.obj"	"$(INTDIR)\Aoscilx.sbr" : $(SOURCE) $(DEP_CPP_AOSCI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\argdecode.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_ARGDE=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\argdecode.obj"	"$(INTDIR)\argdecode.sbr" : $(SOURCE)\
 $(DEP_CPP_ARGDE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_ARGDE=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\argdecode.obj"	"$(INTDIR)\argdecode.sbr" : $(SOURCE)\
 $(DEP_CPP_ARGDE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_ARGDE=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\argdecode.obj"	"$(INTDIR)\argdecode.sbr" : $(SOURCE)\
 $(DEP_CPP_ARGDE) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_ARGDE=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ARGDE=\
	".\MacTransport.h"\
	".\perf.h"\
	

"$(INTDIR)\argdecode.obj"	"$(INTDIR)\argdecode.sbr" : $(SOURCE)\
 $(DEP_CPP_ARGDE) "$(INTDIR)"


!ENDIF 

SOURCE=.\Auxfd.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_AUXFD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Auxfd.obj"	"$(INTDIR)\Auxfd.sbr" : $(SOURCE) $(DEP_CPP_AUXFD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_AUXFD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Auxfd.obj"	"$(INTDIR)\Auxfd.sbr" : $(SOURCE) $(DEP_CPP_AUXFD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_AUXFD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Auxfd.obj"	"$(INTDIR)\Auxfd.sbr" : $(SOURCE) $(DEP_CPP_AUXFD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_AUXFD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Auxfd.obj"	"$(INTDIR)\Auxfd.sbr" : $(SOURCE) $(DEP_CPP_AUXFD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\babo.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_BABO_=\
	".\babo.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\babo.obj"	"$(INTDIR)\babo.sbr" : $(SOURCE) $(DEP_CPP_BABO_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_BABO_=\
	".\babo.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\babo.obj"	"$(INTDIR)\babo.sbr" : $(SOURCE) $(DEP_CPP_BABO_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_BABO_=\
	".\babo.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\babo.obj"	"$(INTDIR)\babo.sbr" : $(SOURCE) $(DEP_CPP_BABO_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_BABO_=\
	"..\paintlib\src\common\config.h"\
	".\babo.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\babo.obj"	"$(INTDIR)\babo.sbr" : $(SOURCE) $(DEP_CPP_BABO_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\biquad.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_BIQUA=\
	".\biquad.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\biquad.obj"	"$(INTDIR)\biquad.sbr" : $(SOURCE) $(DEP_CPP_BIQUA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_BIQUA=\
	".\biquad.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\biquad.obj"	"$(INTDIR)\biquad.sbr" : $(SOURCE) $(DEP_CPP_BIQUA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_BIQUA=\
	".\biquad.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\biquad.obj"	"$(INTDIR)\biquad.sbr" : $(SOURCE) $(DEP_CPP_BIQUA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_BIQUA=\
	".\biquad.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\biquad.obj"	"$(INTDIR)\biquad.sbr" : $(SOURCE) $(DEP_CPP_BIQUA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\bowedbar.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_BOWED=\
	".\bowed.h"\
	".\bowedbar.h"\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\bowedbar.obj"	"$(INTDIR)\bowedbar.sbr" : $(SOURCE) $(DEP_CPP_BOWED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_BOWED=\
	".\bowed.h"\
	".\bowedbar.h"\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\bowedbar.obj"	"$(INTDIR)\bowedbar.sbr" : $(SOURCE) $(DEP_CPP_BOWED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_BOWED=\
	".\bowed.h"\
	".\bowedbar.h"\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\bowedbar.obj"	"$(INTDIR)\bowedbar.sbr" : $(SOURCE) $(DEP_CPP_BOWED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_BOWED=\
	".\bowed.h"\
	".\bowedbar.h"\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\bowedbar.obj"	"$(INTDIR)\bowedbar.sbr" : $(SOURCE) $(DEP_CPP_BOWED)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\butter.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_BUTTE=\
	".\butter.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\butter.obj"	"$(INTDIR)\butter.sbr" : $(SOURCE) $(DEP_CPP_BUTTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_BUTTE=\
	".\butter.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\butter.obj"	"$(INTDIR)\butter.sbr" : $(SOURCE) $(DEP_CPP_BUTTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_BUTTE=\
	".\butter.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\butter.obj"	"$(INTDIR)\butter.sbr" : $(SOURCE) $(DEP_CPP_BUTTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_BUTTE=\
	".\butter.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\butter.obj"	"$(INTDIR)\butter.sbr" : $(SOURCE) $(DEP_CPP_BUTTE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Cmath.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CMATH=\
	".\cmath.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cmath.obj"	"$(INTDIR)\Cmath.sbr" : $(SOURCE) $(DEP_CPP_CMATH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CMATH=\
	".\cmath.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cmath.obj"	"$(INTDIR)\Cmath.sbr" : $(SOURCE) $(DEP_CPP_CMATH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CMATH=\
	".\cmath.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cmath.obj"	"$(INTDIR)\Cmath.sbr" : $(SOURCE) $(DEP_CPP_CMATH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CMATH=\
	".\cmath.h"\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Cmath.obj"	"$(INTDIR)\Cmath.sbr" : $(SOURCE) $(DEP_CPP_CMATH)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Complex.c

"$(INTDIR)\Complex.obj"	"$(INTDIR)\Complex.sbr" : $(SOURCE) "$(INTDIR)"


SOURCE=.\Cross2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CROSS=\
	".\cs.h"\
	".\fhtfun.h"\
	".\prototyp.h"\
	".\ptrigtbl.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cross2.obj"	"$(INTDIR)\Cross2.sbr" : $(SOURCE) $(DEP_CPP_CROSS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CROSS=\
	".\cs.h"\
	".\fhtfun.h"\
	".\prototyp.h"\
	".\ptrigtbl.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cross2.obj"	"$(INTDIR)\Cross2.sbr" : $(SOURCE) $(DEP_CPP_CROSS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CROSS=\
	".\cs.h"\
	".\fhtfun.h"\
	".\prototyp.h"\
	".\ptrigtbl.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cross2.obj"	"$(INTDIR)\Cross2.sbr" : $(SOURCE) $(DEP_CPP_CROSS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CROSS=\
	".\cs.h"\
	".\fhtfun.h"\
	".\prototyp.h"\
	".\ptrigtbl.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Cross2.obj"	"$(INTDIR)\Cross2.sbr" : $(SOURCE) $(DEP_CPP_CROSS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Cscore.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CSCOR=\
	".\cscore.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Cscore.obj"	"$(INTDIR)\Cscore.sbr" : $(SOURCE) $(DEP_CPP_CSCOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CSCOR=\
	".\cscore.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Cscore.obj"	"$(INTDIR)\Cscore.sbr" : $(SOURCE) $(DEP_CPP_CSCOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CSCOR=\
	".\cscore.h"\
	

"$(INTDIR)\Cscore.obj"	"$(INTDIR)\Cscore.sbr" : $(SOURCE) $(DEP_CPP_CSCOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CSCOR=\
	".\cscore.h"\
	".\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Cscore.obj"	"$(INTDIR)\Cscore.sbr" : $(SOURCE) $(DEP_CPP_CSCOR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Cscorfns.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CSCORF=\
	".\cs.h"\
	".\cscore.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cscorfns.obj"	"$(INTDIR)\Cscorfns.sbr" : $(SOURCE) $(DEP_CPP_CSCORF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CSCORF=\
	".\cs.h"\
	".\cscore.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cscorfns.obj"	"$(INTDIR)\Cscorfns.sbr" : $(SOURCE) $(DEP_CPP_CSCORF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CSCORF=\
	".\cs.h"\
	".\cscore.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cscorfns.obj"	"$(INTDIR)\Cscorfns.sbr" : $(SOURCE) $(DEP_CPP_CSCORF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CSCORF=\
	".\cs.h"\
	".\cscore.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Cscorfns.obj"	"$(INTDIR)\Cscorfns.sbr" : $(SOURCE) $(DEP_CPP_CSCORF)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Cvanal.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CVANA=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cvanal.obj"	"$(INTDIR)\Cvanal.sbr" : $(SOURCE) $(DEP_CPP_CVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CVANA=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cvanal.obj"	"$(INTDIR)\Cvanal.sbr" : $(SOURCE) $(DEP_CPP_CVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CVANA=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Cvanal.obj"	"$(INTDIR)\Cvanal.sbr" : $(SOURCE) $(DEP_CPP_CVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CVANA=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Cvanal.obj"	"$(INTDIR)\Cvanal.sbr" : $(SOURCE) $(DEP_CPP_CVANA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Dam.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DAM_C=\
	".\cs.h"\
	".\dam.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dam.obj"	"$(INTDIR)\Dam.sbr" : $(SOURCE) $(DEP_CPP_DAM_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DAM_C=\
	".\cs.h"\
	".\dam.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dam.obj"	"$(INTDIR)\Dam.sbr" : $(SOURCE) $(DEP_CPP_DAM_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DAM_C=\
	".\cs.h"\
	".\dam.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dam.obj"	"$(INTDIR)\Dam.sbr" : $(SOURCE) $(DEP_CPP_DAM_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DAM_C=\
	".\cs.h"\
	".\dam.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Dam.obj"	"$(INTDIR)\Dam.sbr" : $(SOURCE) $(DEP_CPP_DAM_C)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\dcblockr.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DCBLO=\
	".\cs.h"\
	".\dcblockr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dcblockr.obj"	"$(INTDIR)\dcblockr.sbr" : $(SOURCE) $(DEP_CPP_DCBLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DCBLO=\
	".\cs.h"\
	".\dcblockr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dcblockr.obj"	"$(INTDIR)\dcblockr.sbr" : $(SOURCE) $(DEP_CPP_DCBLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DCBLO=\
	".\cs.h"\
	".\dcblockr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dcblockr.obj"	"$(INTDIR)\dcblockr.sbr" : $(SOURCE) $(DEP_CPP_DCBLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DCBLO=\
	".\cs.h"\
	".\dcblockr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\dcblockr.obj"	"$(INTDIR)\dcblockr.sbr" : $(SOURCE) $(DEP_CPP_DCBLO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Diskin.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DISKI=\
	".\cs.h"\
	".\diskin.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Diskin.obj"	"$(INTDIR)\Diskin.sbr" : $(SOURCE) $(DEP_CPP_DISKI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DISKI=\
	".\cs.h"\
	".\diskin.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Diskin.obj"	"$(INTDIR)\Diskin.sbr" : $(SOURCE) $(DEP_CPP_DISKI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DISKI=\
	".\cs.h"\
	".\diskin.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Diskin.obj"	"$(INTDIR)\Diskin.sbr" : $(SOURCE) $(DEP_CPP_DISKI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DISKI=\
	".\cs.h"\
	".\diskin.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Diskin.obj"	"$(INTDIR)\Diskin.sbr" : $(SOURCE) $(DEP_CPP_DISKI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Disprep.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DISPR=\
	".\cs.h"\
	".\cwindow.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Disprep.obj"	"$(INTDIR)\Disprep.sbr" : $(SOURCE) $(DEP_CPP_DISPR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DISPR=\
	".\cs.h"\
	".\cwindow.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Disprep.obj"	"$(INTDIR)\Disprep.sbr" : $(SOURCE) $(DEP_CPP_DISPR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DISPR=\
	".\cs.h"\
	".\cwindow.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Disprep.obj"	"$(INTDIR)\Disprep.sbr" : $(SOURCE) $(DEP_CPP_DISPR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DISPR=\
	".\cs.h"\
	".\cwindow.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Disprep.obj"	"$(INTDIR)\Disprep.sbr" : $(SOURCE) $(DEP_CPP_DISPR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Dsputil.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DSPUT=\
	".\dpwelib.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Dsputil.obj"	"$(INTDIR)\Dsputil.sbr" : $(SOURCE) $(DEP_CPP_DSPUT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DSPUT=\
	".\dpwelib.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Dsputil.obj"	"$(INTDIR)\Dsputil.sbr" : $(SOURCE) $(DEP_CPP_DSPUT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DSPUT=\
	".\dpwelib.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Dsputil.obj"	"$(INTDIR)\Dsputil.sbr" : $(SOURCE) $(DEP_CPP_DSPUT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DSPUT=\
	".\dpwelib.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Dsputil.obj"	"$(INTDIR)\Dsputil.sbr" : $(SOURCE) $(DEP_CPP_DSPUT)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Dumpf.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DUMPF=\
	".\cs.h"\
	".\dumpf.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dumpf.obj"	"$(INTDIR)\Dumpf.sbr" : $(SOURCE) $(DEP_CPP_DUMPF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DUMPF=\
	".\cs.h"\
	".\dumpf.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dumpf.obj"	"$(INTDIR)\Dumpf.sbr" : $(SOURCE) $(DEP_CPP_DUMPF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DUMPF=\
	".\cs.h"\
	".\dumpf.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Dumpf.obj"	"$(INTDIR)\Dumpf.sbr" : $(SOURCE) $(DEP_CPP_DUMPF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DUMPF=\
	".\cs.h"\
	".\dumpf.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Dumpf.obj"	"$(INTDIR)\Dumpf.sbr" : $(SOURCE) $(DEP_CPP_DUMPF)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\entry1.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_ENTRY=\
	".\3dug.h"\
	".\aops.h"\
	".\biquad.h"\
	".\butter.h"\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dam.h"\
	".\dashow.h"\
	".\diskin.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\dumpf.h"\
	".\fhtfun.h"\
	".\filter.h"\
	".\flanger.h"\
	".\fof3.h"\
	".\follow.h"\
	".\foscili2.h"\
	".\fout.h"\
	".\fractals.h"\
	".\ftgen.h"\
	".\gab_osc.h"\
	".\generative.h"\
	".\grain.h"\
	".\grain4.h"\
	".\hrtferx.h"\
	".\insert.h"\
	".\instrcall.h"\
	".\locsig.h"\
	".\lowpassr.h"\
	".\lpc.h"\
	".\midiops.h"\
	".\midiops2.h"\
	".\midiops3.h"\
	".\midiout.h"\
	".\oload.h"\
	".\out3d.h"\
	".\picture.h"\
	".\pitch.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvinterp.h"\
	".\pvread.h"\
	".\schedule.h"\
	".\sf.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sndinfug.h"\
	".\sndwarp.h"\
	".\soundio.h"\
	".\space.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\ugens3.h"\
	".\ugens4.h"\
	".\ugens5.h"\
	".\ugens6.h"\
	".\ugens7.h"\
	".\ugens8.h"\
	".\ugens9.h"\
	".\ugensa.h"\
	".\uggab.h"\
	".\ugrw1.h"\
	".\ugrw2.h"\
	".\ugsc.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	".\wavegde.h"\
	".\widgets.h"\
	".\windin.h"\
	

"$(INTDIR)\entry1.obj"	"$(INTDIR)\entry1.sbr" : $(SOURCE) $(DEP_CPP_ENTRY)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_ENTRY=\
	".\3dug.h"\
	".\aops.h"\
	".\biquad.h"\
	".\butter.h"\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dam.h"\
	".\dashow.h"\
	".\diskin.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\dumpf.h"\
	".\fhtfun.h"\
	".\filter.h"\
	".\flanger.h"\
	".\fof3.h"\
	".\follow.h"\
	".\foscili2.h"\
	".\fout.h"\
	".\fractals.h"\
	".\ftgen.h"\
	".\gab_osc.h"\
	".\generative.h"\
	".\grain.h"\
	".\grain4.h"\
	".\hrtferx.h"\
	".\insert.h"\
	".\instrcall.h"\
	".\locsig.h"\
	".\lowpassr.h"\
	".\lpc.h"\
	".\midiops.h"\
	".\midiops2.h"\
	".\midiops3.h"\
	".\midiout.h"\
	".\oload.h"\
	".\out3d.h"\
	".\picture.h"\
	".\pitch.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvinterp.h"\
	".\pvread.h"\
	".\schedule.h"\
	".\sf.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sndinfug.h"\
	".\sndwarp.h"\
	".\soundio.h"\
	".\space.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\ugens3.h"\
	".\ugens4.h"\
	".\ugens5.h"\
	".\ugens6.h"\
	".\ugens7.h"\
	".\ugens8.h"\
	".\ugens9.h"\
	".\ugensa.h"\
	".\uggab.h"\
	".\ugrw1.h"\
	".\ugrw2.h"\
	".\ugsc.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	".\wavegde.h"\
	".\windin.h"\
	

"$(INTDIR)\entry1.obj"	"$(INTDIR)\entry1.sbr" : $(SOURCE) $(DEP_CPP_ENTRY)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_ENTRY=\
	".\3dug.h"\
	".\aops.h"\
	".\biquad.h"\
	".\butter.h"\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dam.h"\
	".\dashow.h"\
	".\diskin.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\dumpf.h"\
	".\fhtfun.h"\
	".\filter.h"\
	".\flanger.h"\
	".\fof3.h"\
	".\follow.h"\
	".\foscili2.h"\
	".\fout.h"\
	".\fractals.h"\
	".\ftgen.h"\
	".\gab_osc.h"\
	".\generative.h"\
	".\grain.h"\
	".\grain4.h"\
	".\hrtferx.h"\
	".\insert.h"\
	".\instrcall.h"\
	".\locsig.h"\
	".\lowpassr.h"\
	".\lpc.h"\
	".\midiops.h"\
	".\midiops2.h"\
	".\midiops3.h"\
	".\midiout.h"\
	".\oload.h"\
	".\out3d.h"\
	".\picture.h"\
	".\pitch.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvinterp.h"\
	".\pvread.h"\
	".\schedule.h"\
	".\sf.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sndinfug.h"\
	".\sndwarp.h"\
	".\soundio.h"\
	".\space.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\ugens3.h"\
	".\ugens4.h"\
	".\ugens5.h"\
	".\ugens6.h"\
	".\ugens7.h"\
	".\ugens8.h"\
	".\ugens9.h"\
	".\ugensa.h"\
	".\uggab.h"\
	".\ugrw1.h"\
	".\ugrw2.h"\
	".\ugsc.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	".\wavegde.h"\
	".\widgets.h"\
	".\windin.h"\
	

"$(INTDIR)\entry1.obj"	"$(INTDIR)\entry1.sbr" : $(SOURCE) $(DEP_CPP_ENTRY)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_ENTRY=\
	".\3dug.h"\
	".\aops.h"\
	".\biquad.h"\
	".\butter.h"\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dam.h"\
	".\dashow.h"\
	".\diskin.h"\
	".\disprep.h"\
	".\dsputil.h"\
	".\dumpf.h"\
	".\fhtfun.h"\
	".\filter.h"\
	".\flanger.h"\
	".\fof3.h"\
	".\follow.h"\
	".\foscili2.h"\
	".\fout.h"\
	".\fractals.h"\
	".\ftgen.h"\
	".\gab_osc.h"\
	".\generative.h"\
	".\grain.h"\
	".\grain4.h"\
	".\hrtferx.h"\
	".\insert.h"\
	".\instrcall.h"\
	".\locsig.h"\
	".\lowpassr.h"\
	".\lpc.h"\
	".\midiops.h"\
	".\midiops2.h"\
	".\midiops3.h"\
	".\midiout.h"\
	".\oload.h"\
	".\out3d.h"\
	".\picture.h"\
	".\pitch.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvinterp.h"\
	".\pvread.h"\
	".\schedule.h"\
	".\sf.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sndinfug.h"\
	".\sndwarp.h"\
	".\soundio.h"\
	".\space.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\ugens3.h"\
	".\ugens4.h"\
	".\ugens5.h"\
	".\ugens6.h"\
	".\ugens7.h"\
	".\ugens8.h"\
	".\ugens9.h"\
	".\ugensa.h"\
	".\uggab.h"\
	".\ugrw1.h"\
	".\ugrw2.h"\
	".\ugsc.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	".\wavegde.h"\
	".\widgets.h"\
	".\windin.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\entry1.obj"	"$(INTDIR)\entry1.sbr" : $(SOURCE) $(DEP_CPP_ENTRY)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\entry2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_ENTRY2=\
	".\aops.h"\
	".\babo.h"\
	".\bowed.h"\
	".\bowedbar.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dcblockr.h"\
	".\fhtfun.h"\
	".\flanger.h"\
	".\flute.h"\
	".\fm4op.h"\
	".\insert.h"\
	".\lowpassr.h"\
	".\mandolin.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\moog1.h"\
	".\nlfilt.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\scansyn.h"\
	".\schedule.h"\
	".\shaker.h"\
	".\singwave.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\ugmoss.h"\
	".\vbap.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\entry2.obj"	"$(INTDIR)\entry2.sbr" : $(SOURCE) $(DEP_CPP_ENTRY2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_ENTRY2=\
	".\aops.h"\
	".\babo.h"\
	".\bowed.h"\
	".\bowedbar.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dcblockr.h"\
	".\fhtfun.h"\
	".\flanger.h"\
	".\flute.h"\
	".\fm4op.h"\
	".\insert.h"\
	".\lowpassr.h"\
	".\mandolin.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\moog1.h"\
	".\nlfilt.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\scansyn.h"\
	".\schedule.h"\
	".\shaker.h"\
	".\singwave.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\vbap.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\entry2.obj"	"$(INTDIR)\entry2.sbr" : $(SOURCE) $(DEP_CPP_ENTRY2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_ENTRY2=\
	".\aops.h"\
	".\babo.h"\
	".\bowed.h"\
	".\bowedbar.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dcblockr.h"\
	".\fhtfun.h"\
	".\flanger.h"\
	".\flute.h"\
	".\fm4op.h"\
	".\insert.h"\
	".\lowpassr.h"\
	".\mandolin.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\moog1.h"\
	".\nlfilt.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\scansyn.h"\
	".\schedule.h"\
	".\shaker.h"\
	".\singwave.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\ugmoss.h"\
	".\vbap.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\entry2.obj"	"$(INTDIR)\entry2.sbr" : $(SOURCE) $(DEP_CPP_ENTRY2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_ENTRY2=\
	".\aops.h"\
	".\babo.h"\
	".\bowed.h"\
	".\bowedbar.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\dcblockr.h"\
	".\fhtfun.h"\
	".\flanger.h"\
	".\flute.h"\
	".\fm4op.h"\
	".\insert.h"\
	".\lowpassr.h"\
	".\mandolin.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\moog1.h"\
	".\nlfilt.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\scansyn.h"\
	".\schedule.h"\
	".\shaker.h"\
	".\singwave.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\ugmoss.h"\
	".\vbap.h"\
	".\vdelay.h"\
	".\version.h"\
	".\vibraphn.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_ENTRY2=\
	".\control.h"\
	

"$(INTDIR)\entry2.obj"	"$(INTDIR)\entry2.sbr" : $(SOURCE) $(DEP_CPP_ENTRY2)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Express.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_EXPRE=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Express.obj"	"$(INTDIR)\Express.sbr" : $(SOURCE) $(DEP_CPP_EXPRE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_EXPRE=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Express.obj"	"$(INTDIR)\Express.sbr" : $(SOURCE) $(DEP_CPP_EXPRE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_EXPRE=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Express.obj"	"$(INTDIR)\Express.sbr" : $(SOURCE) $(DEP_CPP_EXPRE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_EXPRE=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Express.obj"	"$(INTDIR)\Express.sbr" : $(SOURCE) $(DEP_CPP_EXPRE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Extract.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_EXTRA=\
	".\sort.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Extract.obj"	"$(INTDIR)\Extract.sbr" : $(SOURCE) $(DEP_CPP_EXTRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_EXTRA=\
	".\sort.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Extract.obj"	"$(INTDIR)\Extract.sbr" : $(SOURCE) $(DEP_CPP_EXTRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_EXTRA=\
	".\sort.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Extract.obj"	"$(INTDIR)\Extract.sbr" : $(SOURCE) $(DEP_CPP_EXTRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_EXTRA=\
	".\sort.h"\
	".\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Extract.obj"	"$(INTDIR)\Extract.sbr" : $(SOURCE) $(DEP_CPP_EXTRA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Fft.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FFT_C=\
	".\cs.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fft.obj"	"$(INTDIR)\Fft.sbr" : $(SOURCE) $(DEP_CPP_FFT_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FFT_C=\
	".\cs.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fft.obj"	"$(INTDIR)\Fft.sbr" : $(SOURCE) $(DEP_CPP_FFT_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FFT_C=\
	".\cs.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fft.obj"	"$(INTDIR)\Fft.sbr" : $(SOURCE) $(DEP_CPP_FFT_C)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FFT_C=\
	".\cs.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Fft.obj"	"$(INTDIR)\Fft.sbr" : $(SOURCE) $(DEP_CPP_FFT_C)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Fgens.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FGENS=\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\ftgen.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fgens.obj"	"$(INTDIR)\Fgens.sbr" : $(SOURCE) $(DEP_CPP_FGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FGENS=\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\ftgen.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fgens.obj"	"$(INTDIR)\Fgens.sbr" : $(SOURCE) $(DEP_CPP_FGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FGENS=\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\ftgen.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fgens.obj"	"$(INTDIR)\Fgens.sbr" : $(SOURCE) $(DEP_CPP_FGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FGENS=\
	".\cmath.h"\
	".\cs.h"\
	".\cwindow.h"\
	".\ftgen.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Fgens.obj"	"$(INTDIR)\Fgens.sbr" : $(SOURCE) $(DEP_CPP_FGENS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Filopen.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FILOP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filopen.obj"	"$(INTDIR)\Filopen.sbr" : $(SOURCE) $(DEP_CPP_FILOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FILOP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filopen.obj"	"$(INTDIR)\Filopen.sbr" : $(SOURCE) $(DEP_CPP_FILOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FILOP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filopen.obj"	"$(INTDIR)\Filopen.sbr" : $(SOURCE) $(DEP_CPP_FILOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FILOP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Filopen.obj"	"$(INTDIR)\Filopen.sbr" : $(SOURCE) $(DEP_CPP_FILOP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Filter.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FILTE=\
	".\complex.h"\
	".\cs.h"\
	".\filter.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filter.obj"	"$(INTDIR)\Filter.sbr" : $(SOURCE) $(DEP_CPP_FILTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FILTE=\
	".\complex.h"\
	".\cs.h"\
	".\filter.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filter.obj"	"$(INTDIR)\Filter.sbr" : $(SOURCE) $(DEP_CPP_FILTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FILTE=\
	".\complex.h"\
	".\cs.h"\
	".\filter.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Filter.obj"	"$(INTDIR)\Filter.sbr" : $(SOURCE) $(DEP_CPP_FILTE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FILTE=\
	".\complex.h"\
	".\cs.h"\
	".\filter.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Filter.obj"	"$(INTDIR)\Filter.sbr" : $(SOURCE) $(DEP_CPP_FILTE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Fm4op.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FM4OP=\
	".\cs.h"\
	".\fm4op.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fm4op.obj"	"$(INTDIR)\Fm4op.sbr" : $(SOURCE) $(DEP_CPP_FM4OP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FM4OP=\
	".\cs.h"\
	".\fm4op.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fm4op.obj"	"$(INTDIR)\Fm4op.sbr" : $(SOURCE) $(DEP_CPP_FM4OP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FM4OP=\
	".\cs.h"\
	".\fm4op.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Fm4op.obj"	"$(INTDIR)\Fm4op.sbr" : $(SOURCE) $(DEP_CPP_FM4OP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FM4OP=\
	".\cs.h"\
	".\fm4op.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Fm4op.obj"	"$(INTDIR)\Fm4op.sbr" : $(SOURCE) $(DEP_CPP_FM4OP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Follow.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FOLLO=\
	".\cs.h"\
	".\follow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Follow.obj"	"$(INTDIR)\Follow.sbr" : $(SOURCE) $(DEP_CPP_FOLLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FOLLO=\
	".\cs.h"\
	".\follow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Follow.obj"	"$(INTDIR)\Follow.sbr" : $(SOURCE) $(DEP_CPP_FOLLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FOLLO=\
	".\cs.h"\
	".\follow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Follow.obj"	"$(INTDIR)\Follow.sbr" : $(SOURCE) $(DEP_CPP_FOLLO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FOLLO=\
	".\cs.h"\
	".\follow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Follow.obj"	"$(INTDIR)\Follow.sbr" : $(SOURCE) $(DEP_CPP_FOLLO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\getstring.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GETST=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\getstring.obj"	"$(INTDIR)\getstring.sbr" : $(SOURCE)\
 $(DEP_CPP_GETST) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GETST=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\getstring.obj"	"$(INTDIR)\getstring.sbr" : $(SOURCE)\
 $(DEP_CPP_GETST) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GETST=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\getstring.obj"	"$(INTDIR)\getstring.sbr" : $(SOURCE)\
 $(DEP_CPP_GETST) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GETST=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\getstring.obj"	"$(INTDIR)\getstring.sbr" : $(SOURCE)\
 $(DEP_CPP_GETST) "$(INTDIR)"


!ENDIF 

SOURCE=.\Grain.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GRAIN=\
	".\cs.h"\
	".\grain.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain.obj"	"$(INTDIR)\Grain.sbr" : $(SOURCE) $(DEP_CPP_GRAIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GRAIN=\
	".\cs.h"\
	".\grain.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain.obj"	"$(INTDIR)\Grain.sbr" : $(SOURCE) $(DEP_CPP_GRAIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GRAIN=\
	".\cs.h"\
	".\grain.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain.obj"	"$(INTDIR)\Grain.sbr" : $(SOURCE) $(DEP_CPP_GRAIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GRAIN=\
	".\cs.h"\
	".\grain.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Grain.obj"	"$(INTDIR)\Grain.sbr" : $(SOURCE) $(DEP_CPP_GRAIN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Grain4.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GRAIN4=\
	".\cs.h"\
	".\grain4.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain4.obj"	"$(INTDIR)\Grain4.sbr" : $(SOURCE) $(DEP_CPP_GRAIN4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GRAIN4=\
	".\cs.h"\
	".\grain4.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain4.obj"	"$(INTDIR)\Grain4.sbr" : $(SOURCE) $(DEP_CPP_GRAIN4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GRAIN4=\
	".\cs.h"\
	".\grain4.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Grain4.obj"	"$(INTDIR)\Grain4.sbr" : $(SOURCE) $(DEP_CPP_GRAIN4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GRAIN4=\
	".\cs.h"\
	".\grain4.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Grain4.obj"	"$(INTDIR)\Grain4.sbr" : $(SOURCE) $(DEP_CPP_GRAIN4)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Hetro.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_HETRO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sdif-mem.h"\
	".\sdif.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hetro.obj"	"$(INTDIR)\Hetro.sbr" : $(SOURCE) $(DEP_CPP_HETRO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_HETRO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sdif-mem.h"\
	".\sdif.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hetro.obj"	"$(INTDIR)\Hetro.sbr" : $(SOURCE) $(DEP_CPP_HETRO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_HETRO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sdif-mem.h"\
	".\sdif.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hetro.obj"	"$(INTDIR)\Hetro.sbr" : $(SOURCE) $(DEP_CPP_HETRO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_HETRO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sdif-mem.h"\
	".\sdif.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_HETRO=\
	".\MacTransport.h"\
	

"$(INTDIR)\Hetro.obj"	"$(INTDIR)\Hetro.sbr" : $(SOURCE) $(DEP_CPP_HETRO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Hrtferx.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_HRTFE=\
	".\3dug.h"\
	".\cs.h"\
	".\hrtferx.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hrtferx.obj"	"$(INTDIR)\Hrtferx.sbr" : $(SOURCE) $(DEP_CPP_HRTFE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_HRTFE=\
	".\3dug.h"\
	".\cs.h"\
	".\hrtferx.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hrtferx.obj"	"$(INTDIR)\Hrtferx.sbr" : $(SOURCE) $(DEP_CPP_HRTFE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_HRTFE=\
	".\3dug.h"\
	".\cs.h"\
	".\hrtferx.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Hrtferx.obj"	"$(INTDIR)\Hrtferx.sbr" : $(SOURCE) $(DEP_CPP_HRTFE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_HRTFE=\
	".\3dug.h"\
	".\cs.h"\
	".\hrtferx.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Hrtferx.obj"	"$(INTDIR)\Hrtferx.sbr" : $(SOURCE) $(DEP_CPP_HRTFE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ieee80.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_IEEE8=\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Ieee80.obj"	"$(INTDIR)\Ieee80.sbr" : $(SOURCE) $(DEP_CPP_IEEE8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_IEEE8=\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Ieee80.obj"	"$(INTDIR)\Ieee80.sbr" : $(SOURCE) $(DEP_CPP_IEEE8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_IEEE8=\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Ieee80.obj"	"$(INTDIR)\Ieee80.sbr" : $(SOURCE) $(DEP_CPP_IEEE8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_IEEE8=\
	".\cs.h"\
	".\ieee80.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ieee80.obj"	"$(INTDIR)\Ieee80.sbr" : $(SOURCE) $(DEP_CPP_IEEE8)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Insert.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_INSER=\
	".\aops.h"\
	".\cs.h"\
	".\insert.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Insert.obj"	"$(INTDIR)\Insert.sbr" : $(SOURCE) $(DEP_CPP_INSER)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_INSER=\
	".\aops.h"\
	".\cs.h"\
	".\insert.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Insert.obj"	"$(INTDIR)\Insert.sbr" : $(SOURCE) $(DEP_CPP_INSER)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_INSER=\
	".\aops.h"\
	".\cs.h"\
	".\insert.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Insert.obj"	"$(INTDIR)\Insert.sbr" : $(SOURCE) $(DEP_CPP_INSER)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_INSER=\
	".\aops.h"\
	".\cs.h"\
	".\insert.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_INSER=\
	".\MacTransport.h"\
	

"$(INTDIR)\Insert.obj"	"$(INTDIR)\Insert.sbr" : $(SOURCE) $(DEP_CPP_INSER)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Linevent.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LINEV=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Linevent.obj"	"$(INTDIR)\Linevent.sbr" : $(SOURCE) $(DEP_CPP_LINEV)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LINEV=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Linevent.obj"	"$(INTDIR)\Linevent.sbr" : $(SOURCE) $(DEP_CPP_LINEV)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LINEV=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Linevent.obj"	"$(INTDIR)\Linevent.sbr" : $(SOURCE) $(DEP_CPP_LINEV)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LINEV=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Linevent.obj"	"$(INTDIR)\Linevent.sbr" : $(SOURCE) $(DEP_CPP_LINEV)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\locsig.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LOCSI=\
	".\cs.h"\
	".\locsig.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\locsig.obj"	"$(INTDIR)\locsig.sbr" : $(SOURCE) $(DEP_CPP_LOCSI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LOCSI=\
	".\cs.h"\
	".\locsig.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\locsig.obj"	"$(INTDIR)\locsig.sbr" : $(SOURCE) $(DEP_CPP_LOCSI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LOCSI=\
	".\cs.h"\
	".\locsig.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\locsig.obj"	"$(INTDIR)\locsig.sbr" : $(SOURCE) $(DEP_CPP_LOCSI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LOCSI=\
	".\cs.h"\
	".\locsig.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\locsig.obj"	"$(INTDIR)\locsig.sbr" : $(SOURCE) $(DEP_CPP_LOCSI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\lowpassr.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LOWPA=\
	".\cs.h"\
	".\lowpassr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\lowpassr.obj"	"$(INTDIR)\lowpassr.sbr" : $(SOURCE) $(DEP_CPP_LOWPA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LOWPA=\
	".\cs.h"\
	".\lowpassr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\lowpassr.obj"	"$(INTDIR)\lowpassr.sbr" : $(SOURCE) $(DEP_CPP_LOWPA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LOWPA=\
	".\cs.h"\
	".\lowpassr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\lowpassr.obj"	"$(INTDIR)\lowpassr.sbr" : $(SOURCE) $(DEP_CPP_LOWPA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LOWPA=\
	".\cs.h"\
	".\lowpassr.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\lowpassr.obj"	"$(INTDIR)\lowpassr.sbr" : $(SOURCE) $(DEP_CPP_LOWPA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Lpanal.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LPANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Lpanal.obj"	"$(INTDIR)\Lpanal.sbr" : $(SOURCE) $(DEP_CPP_LPANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LPANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Lpanal.obj"	"$(INTDIR)\Lpanal.sbr" : $(SOURCE) $(DEP_CPP_LPANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LPANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Lpanal.obj"	"$(INTDIR)\Lpanal.sbr" : $(SOURCE) $(DEP_CPP_LPANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LPANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_LPANA=\
	".\MacTransport.h"\
	

"$(INTDIR)\Lpanal.obj"	"$(INTDIR)\Lpanal.sbr" : $(SOURCE) $(DEP_CPP_LPANA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Lptrkfns.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LPTRK=\
	".\cs.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /Ot /Oa /Ow /Oi /Oy /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Lptrkfns.obj"	"$(INTDIR)\Lptrkfns.sbr" : $(SOURCE) $(DEP_CPP_LPTRK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LPTRK=\
	".\cs.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\Lptrkfns.obj"	"$(INTDIR)\Lptrkfns.sbr" : $(SOURCE) $(DEP_CPP_LPTRK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LPTRK=\
	".\cs.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /Ot /Oa /Ow /Oi /Oy /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Lptrkfns.obj"	"$(INTDIR)\Lptrkfns.sbr" : $(SOURCE) $(DEP_CPP_LPTRK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LPTRK=\
	".\cs.h"\
	".\lpc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\Lptrkfns.obj"	"$(INTDIR)\Lptrkfns.sbr" : $(SOURCE) $(DEP_CPP_LPTRK)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\Main.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MAIN_=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Main.obj"	"$(INTDIR)\Main.sbr" : $(SOURCE) $(DEP_CPP_MAIN_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MAIN_=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Main.obj"	"$(INTDIR)\Main.sbr" : $(SOURCE) $(DEP_CPP_MAIN_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MAIN_=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Main.obj"	"$(INTDIR)\Main.sbr" : $(SOURCE) $(DEP_CPP_MAIN_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MAIN_=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_MAIN_=\
	".\MacTransport.h"\
	".\perf.h"\
	

"$(INTDIR)\Main.obj"	"$(INTDIR)\Main.sbr" : $(SOURCE) $(DEP_CPP_MAIN_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Mandolin.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MANDO=\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\mandolin.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Mandolin.obj"	"$(INTDIR)\Mandolin.sbr" : $(SOURCE) $(DEP_CPP_MANDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MANDO=\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\mandolin.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Mandolin.obj"	"$(INTDIR)\Mandolin.sbr" : $(SOURCE) $(DEP_CPP_MANDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MANDO=\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\mandolin.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Mandolin.obj"	"$(INTDIR)\Mandolin.sbr" : $(SOURCE) $(DEP_CPP_MANDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MANDO=\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\mandolin.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Mandolin.obj"	"$(INTDIR)\Mandolin.sbr" : $(SOURCE) $(DEP_CPP_MANDO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Memalloc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MEMAL=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memalloc.obj"	"$(INTDIR)\Memalloc.sbr" : $(SOURCE) $(DEP_CPP_MEMAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MEMAL=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memalloc.obj"	"$(INTDIR)\Memalloc.sbr" : $(SOURCE) $(DEP_CPP_MEMAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MEMAL=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memalloc.obj"	"$(INTDIR)\Memalloc.sbr" : $(SOURCE) $(DEP_CPP_MEMAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MEMAL=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Memalloc.obj"	"$(INTDIR)\Memalloc.sbr" : $(SOURCE) $(DEP_CPP_MEMAL)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Memfiles.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MEMFI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memfiles.obj"	"$(INTDIR)\Memfiles.sbr" : $(SOURCE) $(DEP_CPP_MEMFI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MEMFI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memfiles.obj"	"$(INTDIR)\Memfiles.sbr" : $(SOURCE) $(DEP_CPP_MEMFI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MEMFI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Memfiles.obj"	"$(INTDIR)\Memfiles.sbr" : $(SOURCE) $(DEP_CPP_MEMFI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MEMFI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Memfiles.obj"	"$(INTDIR)\Memfiles.sbr" : $(SOURCE) $(DEP_CPP_MEMFI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Midiops.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIO=\
	".\cs.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops.obj"	"$(INTDIR)\Midiops.sbr" : $(SOURCE) $(DEP_CPP_MIDIO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIO=\
	".\cs.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops.obj"	"$(INTDIR)\Midiops.sbr" : $(SOURCE) $(DEP_CPP_MIDIO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIO=\
	".\cs.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops.obj"	"$(INTDIR)\Midiops.sbr" : $(SOURCE) $(DEP_CPP_MIDIO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIO=\
	".\cs.h"\
	".\midiops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Midiops.obj"	"$(INTDIR)\Midiops.sbr" : $(SOURCE) $(DEP_CPP_MIDIO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Midiops2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIOP=\
	".\cs.h"\
	".\midiops2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops2.obj"	"$(INTDIR)\Midiops2.sbr" : $(SOURCE) $(DEP_CPP_MIDIOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIOP=\
	".\cs.h"\
	".\midiops2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops2.obj"	"$(INTDIR)\Midiops2.sbr" : $(SOURCE) $(DEP_CPP_MIDIOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIOP=\
	".\cs.h"\
	".\midiops2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiops2.obj"	"$(INTDIR)\Midiops2.sbr" : $(SOURCE) $(DEP_CPP_MIDIOP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIOP=\
	".\cs.h"\
	".\midiops2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Midiops2.obj"	"$(INTDIR)\Midiops2.sbr" : $(SOURCE) $(DEP_CPP_MIDIOP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\midiops3.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIOPS=\
	".\cs.h"\
	".\midiops.h"\
	".\midiops3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\midiops3.obj"	"$(INTDIR)\midiops3.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDIOPS) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIOPS=\
	".\cs.h"\
	".\midiops.h"\
	".\midiops3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\midiops3.obj"	"$(INTDIR)\midiops3.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDIOPS) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIOPS=\
	".\cs.h"\
	".\midiops.h"\
	".\midiops3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\midiops3.obj"	"$(INTDIR)\midiops3.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDIOPS) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIOPS=\
	".\cs.h"\
	".\midiops.h"\
	".\midiops3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\midiops3.obj"	"$(INTDIR)\midiops3.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDIOPS) "$(INTDIR)"


!ENDIF 

SOURCE=.\Midiout.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIOU=\
	".\cs.h"\
	".\midiout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiout.obj"	"$(INTDIR)\Midiout.sbr" : $(SOURCE) $(DEP_CPP_MIDIOU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIOU=\
	".\cs.h"\
	".\midiout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiout.obj"	"$(INTDIR)\Midiout.sbr" : $(SOURCE) $(DEP_CPP_MIDIOU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIOU=\
	".\cs.h"\
	".\midiout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midiout.obj"	"$(INTDIR)\Midiout.sbr" : $(SOURCE) $(DEP_CPP_MIDIOU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIOU=\
	".\cs.h"\
	".\midiout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Midiout.obj"	"$(INTDIR)\Midiout.sbr" : $(SOURCE) $(DEP_CPP_MIDIOU)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Midirecv.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIR=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midirecv.obj"	"$(INTDIR)\Midirecv.sbr" : $(SOURCE) $(DEP_CPP_MIDIR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIR=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midirecv.obj"	"$(INTDIR)\Midirecv.sbr" : $(SOURCE) $(DEP_CPP_MIDIR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIR=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midirecv.obj"	"$(INTDIR)\Midirecv.sbr" : $(SOURCE) $(DEP_CPP_MIDIR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIR=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Midirecv.obj"	"$(INTDIR)\Midirecv.sbr" : $(SOURCE) $(DEP_CPP_MIDIR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Midisend.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDIS=\
	".\cs.h"\
	".\midioops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midisend.obj"	"$(INTDIR)\Midisend.sbr" : $(SOURCE) $(DEP_CPP_MIDIS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDIS=\
	".\cs.h"\
	".\midioops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midisend.obj"	"$(INTDIR)\Midisend.sbr" : $(SOURCE) $(DEP_CPP_MIDIS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDIS=\
	".\cs.h"\
	".\midioops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Midisend.obj"	"$(INTDIR)\Midisend.sbr" : $(SOURCE) $(DEP_CPP_MIDIS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDIS=\
	".\cs.h"\
	".\midioops.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Midisend.obj"	"$(INTDIR)\Midisend.sbr" : $(SOURCE) $(DEP_CPP_MIDIS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Modal4.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MODAL=\
	".\cs.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj"	"$(INTDIR)\Modal4.sbr" : $(SOURCE) $(DEP_CPP_MODAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MODAL=\
	".\cs.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj"	"$(INTDIR)\Modal4.sbr" : $(SOURCE) $(DEP_CPP_MODAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MODAL=\
	".\cs.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj"	"$(INTDIR)\Modal4.sbr" : $(SOURCE) $(DEP_CPP_MODAL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MODAL=\
	".\cs.h"\
	".\marimba.h"\
	".\modal4.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibraphn.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Modal4.obj"	"$(INTDIR)\Modal4.sbr" : $(SOURCE) $(DEP_CPP_MODAL)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Moog1.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MOOG1=\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Moog1.obj"	"$(INTDIR)\Moog1.sbr" : $(SOURCE) $(DEP_CPP_MOOG1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MOOG1=\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Moog1.obj"	"$(INTDIR)\Moog1.sbr" : $(SOURCE) $(DEP_CPP_MOOG1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MOOG1=\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Moog1.obj"	"$(INTDIR)\Moog1.sbr" : $(SOURCE) $(DEP_CPP_MOOG1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MOOG1=\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Moog1.obj"	"$(INTDIR)\Moog1.sbr" : $(SOURCE) $(DEP_CPP_MOOG1)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Musmon.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MUSMO=\
	".\cs.h"\
	".\cscore.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Musmon.obj"	"$(INTDIR)\Musmon.sbr" : $(SOURCE) $(DEP_CPP_MUSMO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MUSMO=\
	".\cs.h"\
	".\cscore.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Musmon.obj"	"$(INTDIR)\Musmon.sbr" : $(SOURCE) $(DEP_CPP_MUSMO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MUSMO=\
	".\cs.h"\
	".\cscore.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Musmon.obj"	"$(INTDIR)\Musmon.sbr" : $(SOURCE) $(DEP_CPP_MUSMO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MUSMO=\
	".\cs.h"\
	".\cscore.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Musmon.obj"	"$(INTDIR)\Musmon.sbr" : $(SOURCE) $(DEP_CPP_MUSMO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Nlfilt.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_NLFIL=\
	".\cs.h"\
	".\nlfilt.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Nlfilt.obj"	"$(INTDIR)\Nlfilt.sbr" : $(SOURCE) $(DEP_CPP_NLFIL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_NLFIL=\
	".\cs.h"\
	".\nlfilt.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Nlfilt.obj"	"$(INTDIR)\Nlfilt.sbr" : $(SOURCE) $(DEP_CPP_NLFIL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_NLFIL=\
	".\cs.h"\
	".\nlfilt.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Nlfilt.obj"	"$(INTDIR)\Nlfilt.sbr" : $(SOURCE) $(DEP_CPP_NLFIL)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_NLFIL=\
	".\cs.h"\
	".\nlfilt.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Nlfilt.obj"	"$(INTDIR)\Nlfilt.sbr" : $(SOURCE) $(DEP_CPP_NLFIL)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Oload.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_OLOAD=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Oload.obj"	"$(INTDIR)\Oload.sbr" : $(SOURCE) $(DEP_CPP_OLOAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_OLOAD=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Oload.obj"	"$(INTDIR)\Oload.sbr" : $(SOURCE) $(DEP_CPP_OLOAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_OLOAD=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Oload.obj"	"$(INTDIR)\Oload.sbr" : $(SOURCE) $(DEP_CPP_OLOAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_OLOAD=\
	".\cs.h"\
	".\midiops.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Oload.obj"	"$(INTDIR)\Oload.sbr" : $(SOURCE) $(DEP_CPP_OLOAD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\one_file.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_ONE_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\one_file.obj"	"$(INTDIR)\one_file.sbr" : $(SOURCE) $(DEP_CPP_ONE_F)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_ONE_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\one_file.obj"	"$(INTDIR)\one_file.sbr" : $(SOURCE) $(DEP_CPP_ONE_F)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_ONE_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\one_file.obj"	"$(INTDIR)\one_file.sbr" : $(SOURCE) $(DEP_CPP_ONE_F)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_ONE_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\one_file.obj"	"$(INTDIR)\one_file.sbr" : $(SOURCE) $(DEP_CPP_ONE_F)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Opcode.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_OPCOD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Opcode.obj"	"$(INTDIR)\Opcode.sbr" : $(SOURCE) $(DEP_CPP_OPCOD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_OPCOD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Opcode.obj"	"$(INTDIR)\Opcode.sbr" : $(SOURCE) $(DEP_CPP_OPCOD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_OPCOD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Opcode.obj"	"$(INTDIR)\Opcode.sbr" : $(SOURCE) $(DEP_CPP_OPCOD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_OPCOD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Opcode.obj"	"$(INTDIR)\Opcode.sbr" : $(SOURCE) $(DEP_CPP_OPCOD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Otran.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_OTRAN=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Otran.obj"	"$(INTDIR)\Otran.sbr" : $(SOURCE) $(DEP_CPP_OTRAN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_OTRAN=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Otran.obj"	"$(INTDIR)\Otran.sbr" : $(SOURCE) $(DEP_CPP_OTRAN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_OTRAN=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Otran.obj"	"$(INTDIR)\Otran.sbr" : $(SOURCE) $(DEP_CPP_OTRAN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_OTRAN=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Otran.obj"	"$(INTDIR)\Otran.sbr" : $(SOURCE) $(DEP_CPP_OTRAN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\phisem.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PHISE=\
	".\cs.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\phisem.obj"	"$(INTDIR)\phisem.sbr" : $(SOURCE) $(DEP_CPP_PHISE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PHISE=\
	".\cs.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\phisem.obj"	"$(INTDIR)\phisem.sbr" : $(SOURCE) $(DEP_CPP_PHISE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PHISE=\
	".\cs.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\phisem.obj"	"$(INTDIR)\phisem.sbr" : $(SOURCE) $(DEP_CPP_PHISE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PHISE=\
	".\cs.h"\
	".\phisem.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\phisem.obj"	"$(INTDIR)\phisem.sbr" : $(SOURCE) $(DEP_CPP_PHISE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Physmod.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PHYSM=\
	".\bowed.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\flute.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physmod.obj"	"$(INTDIR)\Physmod.sbr" : $(SOURCE) $(DEP_CPP_PHYSM)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PHYSM=\
	".\bowed.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\flute.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physmod.obj"	"$(INTDIR)\Physmod.sbr" : $(SOURCE) $(DEP_CPP_PHYSM)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PHYSM=\
	".\bowed.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\flute.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physmod.obj"	"$(INTDIR)\Physmod.sbr" : $(SOURCE) $(DEP_CPP_PHYSM)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PHYSM=\
	".\bowed.h"\
	".\brass.h"\
	".\clarinet.h"\
	".\cs.h"\
	".\flute.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Physmod.obj"	"$(INTDIR)\Physmod.sbr" : $(SOURCE) $(DEP_CPP_PHYSM)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Physutil.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PHYSU=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physutil.obj"	"$(INTDIR)\Physutil.sbr" : $(SOURCE) $(DEP_CPP_PHYSU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PHYSU=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physutil.obj"	"$(INTDIR)\Physutil.sbr" : $(SOURCE) $(DEP_CPP_PHYSU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PHYSU=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Physutil.obj"	"$(INTDIR)\Physutil.sbr" : $(SOURCE) $(DEP_CPP_PHYSU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PHYSU=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Physutil.obj"	"$(INTDIR)\Physutil.sbr" : $(SOURCE) $(DEP_CPP_PHYSU)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\pitch.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PITCH=\
	".\cs.h"\
	".\cwindow.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\pitch.obj"	"$(INTDIR)\pitch.sbr" : $(SOURCE) $(DEP_CPP_PITCH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PITCH=\
	".\cs.h"\
	".\cwindow.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\pitch.obj"	"$(INTDIR)\pitch.sbr" : $(SOURCE) $(DEP_CPP_PITCH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PITCH=\
	".\cs.h"\
	".\cwindow.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\pitch.obj"	"$(INTDIR)\pitch.sbr" : $(SOURCE) $(DEP_CPP_PITCH)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PITCH=\
	".\cs.h"\
	".\cwindow.h"\
	".\pitch.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\uggab.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\pitch.obj"	"$(INTDIR)\pitch.sbr" : $(SOURCE) $(DEP_CPP_PITCH)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pluck.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PLUCK=\
	".\cs.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Pluck.obj"	"$(INTDIR)\Pluck.sbr" : $(SOURCE) $(DEP_CPP_PLUCK)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PLUCK=\
	".\cs.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Pluck.obj"	"$(INTDIR)\Pluck.sbr" : $(SOURCE) $(DEP_CPP_PLUCK)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PLUCK=\
	".\cs.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Pluck.obj"	"$(INTDIR)\Pluck.sbr" : $(SOURCE) $(DEP_CPP_PLUCK)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PLUCK=\
	".\cs.h"\
	".\pluck.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Pluck.obj"	"$(INTDIR)\Pluck.sbr" : $(SOURCE) $(DEP_CPP_PLUCK)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pvadd.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVADD=\
	".\cs.h"\
	".\dsputil.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvadd.obj"	"$(INTDIR)\Pvadd.sbr" : $(SOURCE) $(DEP_CPP_PVADD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVADD=\
	".\cs.h"\
	".\dsputil.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvadd.obj"	"$(INTDIR)\Pvadd.sbr" : $(SOURCE) $(DEP_CPP_PVADD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVADD=\
	".\cs.h"\
	".\dsputil.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvadd.obj"	"$(INTDIR)\Pvadd.sbr" : $(SOURCE) $(DEP_CPP_PVADD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVADD=\
	".\cs.h"\
	".\dsputil.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvadd.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Pvadd.obj"	"$(INTDIR)\Pvadd.sbr" : $(SOURCE) $(DEP_CPP_PVADD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pvanal.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvanal.obj"	"$(INTDIR)\Pvanal.sbr" : $(SOURCE) $(DEP_CPP_PVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvanal.obj"	"$(INTDIR)\Pvanal.sbr" : $(SOURCE) $(DEP_CPP_PVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvanal.obj"	"$(INTDIR)\Pvanal.sbr" : $(SOURCE) $(DEP_CPP_PVANA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVANA=\
	".\cs.h"\
	".\cwindow.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_PVANA=\
	".\MacTransport.h"\
	

"$(INTDIR)\Pvanal.obj"	"$(INTDIR)\Pvanal.sbr" : $(SOURCE) $(DEP_CPP_PVANA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pvinterp.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVINT=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvinterp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvinterp.obj"	"$(INTDIR)\Pvinterp.sbr" : $(SOURCE) $(DEP_CPP_PVINT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVINT=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvinterp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvinterp.obj"	"$(INTDIR)\Pvinterp.sbr" : $(SOURCE) $(DEP_CPP_PVINT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVINT=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvinterp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvinterp.obj"	"$(INTDIR)\Pvinterp.sbr" : $(SOURCE) $(DEP_CPP_PVINT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVINT=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvinterp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Pvinterp.obj"	"$(INTDIR)\Pvinterp.sbr" : $(SOURCE) $(DEP_CPP_PVINT)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\pvlook.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVLOO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvlook.obj"	"$(INTDIR)\pvlook.sbr" : $(SOURCE) $(DEP_CPP_PVLOO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVLOO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvlook.obj"	"$(INTDIR)\pvlook.sbr" : $(SOURCE) $(DEP_CPP_PVLOO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVLOO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvlook.obj"	"$(INTDIR)\pvlook.sbr" : $(SOURCE) $(DEP_CPP_PVLOO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVLOO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\pvlook.obj"	"$(INTDIR)\pvlook.sbr" : $(SOURCE) $(DEP_CPP_PVLOO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pvoc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVOC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvoc.obj"	"$(INTDIR)\Pvoc.sbr" : $(SOURCE) $(DEP_CPP_PVOC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVOC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvoc.obj"	"$(INTDIR)\Pvoc.sbr" : $(SOURCE) $(DEP_CPP_PVOC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVOC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Pvoc.obj"	"$(INTDIR)\Pvoc.sbr" : $(SOURCE) $(DEP_CPP_PVOC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVOC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Pvoc.obj"	"$(INTDIR)\Pvoc.sbr" : $(SOURCE) $(DEP_CPP_PVOC_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\pvocext.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVOCE=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvocext.obj"	"$(INTDIR)\pvocext.sbr" : $(SOURCE) $(DEP_CPP_PVOCE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVOCE=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvocext.obj"	"$(INTDIR)\pvocext.sbr" : $(SOURCE) $(DEP_CPP_PVOCE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVOCE=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\pvocext.obj"	"$(INTDIR)\pvocext.sbr" : $(SOURCE) $(DEP_CPP_PVOCE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVOCE=\
	".\cs.h"\
	".\prototyp.h"\
	".\pvocext.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\pvocext.obj"	"$(INTDIR)\pvocext.sbr" : $(SOURCE) $(DEP_CPP_PVOCE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Pvread.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PVREA=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvread.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvread.obj"	"$(INTDIR)\Pvread.sbr" : $(SOURCE) $(DEP_CPP_PVREA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PVREA=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvread.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvread.obj"	"$(INTDIR)\Pvread.sbr" : $(SOURCE) $(DEP_CPP_PVREA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PVREA=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvread.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Pvread.obj"	"$(INTDIR)\Pvread.sbr" : $(SOURCE) $(DEP_CPP_PVREA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PVREA=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvread.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Pvread.obj"	"$(INTDIR)\Pvread.sbr" : $(SOURCE) $(DEP_CPP_PVREA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Rdorch.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_RDORC=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdorch.obj"	"$(INTDIR)\Rdorch.sbr" : $(SOURCE) $(DEP_CPP_RDORC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_RDORC=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdorch.obj"	"$(INTDIR)\Rdorch.sbr" : $(SOURCE) $(DEP_CPP_RDORC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_RDORC=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdorch.obj"	"$(INTDIR)\Rdorch.sbr" : $(SOURCE) $(DEP_CPP_RDORC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_RDORC=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Rdorch.obj"	"$(INTDIR)\Rdorch.sbr" : $(SOURCE) $(DEP_CPP_RDORC)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Rdscor.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_RDSCO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdscor.obj"	"$(INTDIR)\Rdscor.sbr" : $(SOURCE) $(DEP_CPP_RDSCO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_RDSCO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdscor.obj"	"$(INTDIR)\Rdscor.sbr" : $(SOURCE) $(DEP_CPP_RDSCO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_RDSCO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rdscor.obj"	"$(INTDIR)\Rdscor.sbr" : $(SOURCE) $(DEP_CPP_RDSCO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_RDSCO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Rdscor.obj"	"$(INTDIR)\Rdscor.sbr" : $(SOURCE) $(DEP_CPP_RDSCO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Repluck.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_REPLU=\
	".\cs.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Repluck.obj"	"$(INTDIR)\Repluck.sbr" : $(SOURCE) $(DEP_CPP_REPLU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_REPLU=\
	".\cs.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Repluck.obj"	"$(INTDIR)\Repluck.sbr" : $(SOURCE) $(DEP_CPP_REPLU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_REPLU=\
	".\cs.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Repluck.obj"	"$(INTDIR)\Repluck.sbr" : $(SOURCE) $(DEP_CPP_REPLU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_REPLU=\
	".\cs.h"\
	".\prototyp.h"\
	".\repluck.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Repluck.obj"	"$(INTDIR)\Repluck.sbr" : $(SOURCE) $(DEP_CPP_REPLU)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Rtaudio.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_RTAUD=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rtaudio.obj"	"$(INTDIR)\Rtaudio.sbr" : $(SOURCE) $(DEP_CPP_RTAUD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_RTAUD=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rtaudio.obj"	"$(INTDIR)\Rtaudio.sbr" : $(SOURCE) $(DEP_CPP_RTAUD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_RTAUD=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Rtaudio.obj"	"$(INTDIR)\Rtaudio.sbr" : $(SOURCE) $(DEP_CPP_RTAUD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_RTAUD=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Rtaudio.obj"	"$(INTDIR)\Rtaudio.sbr" : $(SOURCE) $(DEP_CPP_RTAUD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\scansyn.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SCANS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\scansyn.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\scansyn.obj"	"$(INTDIR)\scansyn.sbr" : $(SOURCE) $(DEP_CPP_SCANS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SCANS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\scansyn.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\scansyn.obj"	"$(INTDIR)\scansyn.sbr" : $(SOURCE) $(DEP_CPP_SCANS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SCANS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\scansyn.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\scansyn.obj"	"$(INTDIR)\scansyn.sbr" : $(SOURCE) $(DEP_CPP_SCANS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SCANS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\scansyn.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\scansyn.obj"	"$(INTDIR)\scansyn.sbr" : $(SOURCE) $(DEP_CPP_SCANS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\schedule.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SCHED=\
	".\cs.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\schedule.obj"	"$(INTDIR)\schedule.sbr" : $(SOURCE) $(DEP_CPP_SCHED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SCHED=\
	".\cs.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\schedule.obj"	"$(INTDIR)\schedule.sbr" : $(SOURCE) $(DEP_CPP_SCHED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SCHED=\
	".\cs.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\schedule.obj"	"$(INTDIR)\schedule.sbr" : $(SOURCE) $(DEP_CPP_SCHED)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SCHED=\
	".\cs.h"\
	".\prototyp.h"\
	".\schedule.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\schedule.obj"	"$(INTDIR)\schedule.sbr" : $(SOURCE) $(DEP_CPP_SCHED)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Scot.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SCOT_=\
	".\scot.h"\
	".\text.h"\
	

"$(INTDIR)\Scot.obj"	"$(INTDIR)\Scot.sbr" : $(SOURCE) $(DEP_CPP_SCOT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SCOT_=\
	".\scot.h"\
	".\text.h"\
	

"$(INTDIR)\Scot.obj"	"$(INTDIR)\Scot.sbr" : $(SOURCE) $(DEP_CPP_SCOT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SCOT_=\
	".\scot.h"\
	".\text.h"\
	

"$(INTDIR)\Scot.obj"	"$(INTDIR)\Scot.sbr" : $(SOURCE) $(DEP_CPP_SCOT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SCOT_=\
	".\scot.h"\
	".\text.h"\
	

"$(INTDIR)\Scot.obj"	"$(INTDIR)\Scot.sbr" : $(SOURCE) $(DEP_CPP_SCOT_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Scsort.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SCSOR=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Scsort.obj"	"$(INTDIR)\Scsort.sbr" : $(SOURCE) $(DEP_CPP_SCSOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SCSOR=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Scsort.obj"	"$(INTDIR)\Scsort.sbr" : $(SOURCE) $(DEP_CPP_SCSOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SCSOR=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Scsort.obj"	"$(INTDIR)\Scsort.sbr" : $(SOURCE) $(DEP_CPP_SCSOR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SCSOR=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Scsort.obj"	"$(INTDIR)\Scsort.sbr" : $(SOURCE) $(DEP_CPP_SCSOR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Scxtract.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SCXTR=\
	".\sort.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Scxtract.obj"	"$(INTDIR)\Scxtract.sbr" : $(SOURCE) $(DEP_CPP_SCXTR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SCXTR=\
	".\sort.h"\
	".\sysdep.h"\
	

"$(INTDIR)\Scxtract.obj"	"$(INTDIR)\Scxtract.sbr" : $(SOURCE) $(DEP_CPP_SCXTR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SCXTR=\
	".\sort.h"\
	

"$(INTDIR)\Scxtract.obj"	"$(INTDIR)\Scxtract.sbr" : $(SOURCE) $(DEP_CPP_SCXTR)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SCXTR=\
	".\sort.h"\
	".\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Scxtract.obj"	"$(INTDIR)\Scxtract.sbr" : $(SOURCE) $(DEP_CPP_SCXTR)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\sdif.c
DEP_CPP_SDIF_=\
	".\sdif.h"\
	

"$(INTDIR)\sdif.obj"	"$(INTDIR)\sdif.sbr" : $(SOURCE) $(DEP_CPP_SDIF_)\
 "$(INTDIR)"


SOURCE=.\Sfheader.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SFHEA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sfheader.obj"	"$(INTDIR)\Sfheader.sbr" : $(SOURCE) $(DEP_CPP_SFHEA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SFHEA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sfheader.obj"	"$(INTDIR)\Sfheader.sbr" : $(SOURCE) $(DEP_CPP_SFHEA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SFHEA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sfheader.obj"	"$(INTDIR)\Sfheader.sbr" : $(SOURCE) $(DEP_CPP_SFHEA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SFHEA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Sfheader.obj"	"$(INTDIR)\Sfheader.sbr" : $(SOURCE) $(DEP_CPP_SFHEA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Shaker.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SHAKE=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\shaker.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Shaker.obj"	"$(INTDIR)\Shaker.sbr" : $(SOURCE) $(DEP_CPP_SHAKE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SHAKE=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\shaker.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Shaker.obj"	"$(INTDIR)\Shaker.sbr" : $(SOURCE) $(DEP_CPP_SHAKE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SHAKE=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\shaker.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Shaker.obj"	"$(INTDIR)\Shaker.sbr" : $(SOURCE) $(DEP_CPP_SHAKE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SHAKE=\
	".\cs.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\shaker.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Shaker.obj"	"$(INTDIR)\Shaker.sbr" : $(SOURCE) $(DEP_CPP_SHAKE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Singwave.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SINGW=\
	".\clarinet.h"\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\singwave.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Singwave.obj"	"$(INTDIR)\Singwave.sbr" : $(SOURCE) $(DEP_CPP_SINGW)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SINGW=\
	".\clarinet.h"\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\singwave.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Singwave.obj"	"$(INTDIR)\Singwave.sbr" : $(SOURCE) $(DEP_CPP_SINGW)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SINGW=\
	".\clarinet.h"\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\singwave.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Singwave.obj"	"$(INTDIR)\Singwave.sbr" : $(SOURCE) $(DEP_CPP_SINGW)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SINGW=\
	".\clarinet.h"\
	".\cs.h"\
	".\fm4op.h"\
	".\moog1.h"\
	".\physutil.h"\
	".\prototyp.h"\
	".\singwave.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Singwave.obj"	"$(INTDIR)\Singwave.sbr" : $(SOURCE) $(DEP_CPP_SINGW)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Sndinfo.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SNDIN=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndinfo.obj"	"$(INTDIR)\Sndinfo.sbr" : $(SOURCE) $(DEP_CPP_SNDIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SNDIN=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndinfo.obj"	"$(INTDIR)\Sndinfo.sbr" : $(SOURCE) $(DEP_CPP_SNDIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SNDIN=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndinfo.obj"	"$(INTDIR)\Sndinfo.sbr" : $(SOURCE) $(DEP_CPP_SNDIN)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SNDIN=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SNDIN=\
	".\MacTransport.h"\
	

"$(INTDIR)\Sndinfo.obj"	"$(INTDIR)\Sndinfo.sbr" : $(SOURCE) $(DEP_CPP_SNDIN)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\sndinfUG.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SNDINF=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sndinfug.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\sndinfUG.obj"	"$(INTDIR)\sndinfUG.sbr" : $(SOURCE) $(DEP_CPP_SNDINF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SNDINF=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sndinfug.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\sndinfUG.obj"	"$(INTDIR)\sndinfUG.sbr" : $(SOURCE) $(DEP_CPP_SNDINF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SNDINF=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sndinfug.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\sndinfUG.obj"	"$(INTDIR)\sndinfUG.sbr" : $(SOURCE) $(DEP_CPP_SNDINF)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SNDINF=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sndinfug.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\sndinfUG.obj"	"$(INTDIR)\sndinfUG.sbr" : $(SOURCE) $(DEP_CPP_SNDINF)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Sndwarp.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SNDWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sndwarp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndwarp.obj"	"$(INTDIR)\Sndwarp.sbr" : $(SOURCE) $(DEP_CPP_SNDWA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SNDWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sndwarp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndwarp.obj"	"$(INTDIR)\Sndwarp.sbr" : $(SOURCE) $(DEP_CPP_SNDWA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SNDWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sndwarp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sndwarp.obj"	"$(INTDIR)\Sndwarp.sbr" : $(SOURCE) $(DEP_CPP_SNDWA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SNDWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sndwarp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Sndwarp.obj"	"$(INTDIR)\Sndwarp.sbr" : $(SOURCE) $(DEP_CPP_SNDWA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Sort.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SORT_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sort.obj"	"$(INTDIR)\Sort.sbr" : $(SOURCE) $(DEP_CPP_SORT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SORT_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sort.obj"	"$(INTDIR)\Sort.sbr" : $(SOURCE) $(DEP_CPP_SORT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SORT_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sort.obj"	"$(INTDIR)\Sort.sbr" : $(SOURCE) $(DEP_CPP_SORT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SORT_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Sort.obj"	"$(INTDIR)\Sort.sbr" : $(SOURCE) $(DEP_CPP_SORT_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Soundin.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SOUND=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Soundin.obj"	"$(INTDIR)\Soundin.sbr" : $(SOURCE) $(DEP_CPP_SOUND)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SOUND=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Soundin.obj"	"$(INTDIR)\Soundin.sbr" : $(SOURCE) $(DEP_CPP_SOUND)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SOUND=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Soundin.obj"	"$(INTDIR)\Soundin.sbr" : $(SOURCE) $(DEP_CPP_SOUND)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SOUND=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Soundin.obj"	"$(INTDIR)\Soundin.sbr" : $(SOURCE) $(DEP_CPP_SOUND)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Soundio.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SOUNDI=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\Soundio.obj"	"$(INTDIR)\Soundio.sbr" : $(SOURCE) $(DEP_CPP_SOUNDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SOUNDI=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\Soundio.obj"	"$(INTDIR)\Soundio.sbr" : $(SOURCE) $(DEP_CPP_SOUNDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SOUNDI=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\Soundio.obj"	"$(INTDIR)\Soundio.sbr" : $(SOURCE) $(DEP_CPP_SOUNDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SOUNDI=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
NODEP_CPP_SOUNDI=\
	".\MacTransport.h"\
	

"$(INTDIR)\Soundio.obj"	"$(INTDIR)\Soundio.sbr" : $(SOURCE) $(DEP_CPP_SOUNDI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Space.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SPACE=\
	".\cs.h"\
	".\prototyp.h"\
	".\space.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Space.obj"	"$(INTDIR)\Space.sbr" : $(SOURCE) $(DEP_CPP_SPACE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SPACE=\
	".\cs.h"\
	".\prototyp.h"\
	".\space.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Space.obj"	"$(INTDIR)\Space.sbr" : $(SOURCE) $(DEP_CPP_SPACE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SPACE=\
	".\cs.h"\
	".\prototyp.h"\
	".\space.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Space.obj"	"$(INTDIR)\Space.sbr" : $(SOURCE) $(DEP_CPP_SPACE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SPACE=\
	".\cs.h"\
	".\prototyp.h"\
	".\space.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Space.obj"	"$(INTDIR)\Space.sbr" : $(SOURCE) $(DEP_CPP_SPACE)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\spectra.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SPECT=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\spectra.obj"	"$(INTDIR)\spectra.sbr" : $(SOURCE) $(DEP_CPP_SPECT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SPECT=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\spectra.obj"	"$(INTDIR)\spectra.sbr" : $(SOURCE) $(DEP_CPP_SPECT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SPECT=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\spectra.obj"	"$(INTDIR)\spectra.sbr" : $(SOURCE) $(DEP_CPP_SPECT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SPECT=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\spectra.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\spectra.obj"	"$(INTDIR)\spectra.sbr" : $(SOURCE) $(DEP_CPP_SPECT)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Sread.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SREAD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sread.obj"	"$(INTDIR)\Sread.sbr" : $(SOURCE) $(DEP_CPP_SREAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SREAD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sread.obj"	"$(INTDIR)\Sread.sbr" : $(SOURCE) $(DEP_CPP_SREAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SREAD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Sread.obj"	"$(INTDIR)\Sread.sbr" : $(SOURCE) $(DEP_CPP_SREAD)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SREAD=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Sread.obj"	"$(INTDIR)\Sread.sbr" : $(SOURCE) $(DEP_CPP_SREAD)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Swrite.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SWRIT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Swrite.obj"	"$(INTDIR)\Swrite.sbr" : $(SOURCE) $(DEP_CPP_SWRIT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SWRIT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Swrite.obj"	"$(INTDIR)\Swrite.sbr" : $(SOURCE) $(DEP_CPP_SWRIT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SWRIT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Swrite.obj"	"$(INTDIR)\Swrite.sbr" : $(SOURCE) $(DEP_CPP_SWRIT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SWRIT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Swrite.obj"	"$(INTDIR)\Swrite.sbr" : $(SOURCE) $(DEP_CPP_SWRIT)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Twarp.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_TWARP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Twarp.obj"	"$(INTDIR)\Twarp.sbr" : $(SOURCE) $(DEP_CPP_TWARP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_TWARP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Twarp.obj"	"$(INTDIR)\Twarp.sbr" : $(SOURCE) $(DEP_CPP_TWARP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_TWARP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Twarp.obj"	"$(INTDIR)\Twarp.sbr" : $(SOURCE) $(DEP_CPP_TWARP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_TWARP=\
	".\cs.h"\
	".\prototyp.h"\
	".\sort.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Twarp.obj"	"$(INTDIR)\Twarp.sbr" : $(SOURCE) $(DEP_CPP_TWARP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens1.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens1.obj"	"$(INTDIR)\Ugens1.sbr" : $(SOURCE) $(DEP_CPP_UGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens1.obj"	"$(INTDIR)\Ugens1.sbr" : $(SOURCE) $(DEP_CPP_UGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens1.obj"	"$(INTDIR)\Ugens1.sbr" : $(SOURCE) $(DEP_CPP_UGENS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens1.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens1.obj"	"$(INTDIR)\Ugens1.sbr" : $(SOURCE) $(DEP_CPP_UGENS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens2.obj"	"$(INTDIR)\Ugens2.sbr" : $(SOURCE) $(DEP_CPP_UGENS2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens2.obj"	"$(INTDIR)\Ugens2.sbr" : $(SOURCE) $(DEP_CPP_UGENS2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens2.obj"	"$(INTDIR)\Ugens2.sbr" : $(SOURCE) $(DEP_CPP_UGENS2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens2.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens2.obj"	"$(INTDIR)\Ugens2.sbr" : $(SOURCE) $(DEP_CPP_UGENS2)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens3.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS3=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens3.obj"	"$(INTDIR)\Ugens3.sbr" : $(SOURCE) $(DEP_CPP_UGENS3)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS3=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens3.obj"	"$(INTDIR)\Ugens3.sbr" : $(SOURCE) $(DEP_CPP_UGENS3)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS3=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens3.obj"	"$(INTDIR)\Ugens3.sbr" : $(SOURCE) $(DEP_CPP_UGENS3)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS3=\
	".\cs.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens3.obj"	"$(INTDIR)\Ugens3.sbr" : $(SOURCE) $(DEP_CPP_UGENS3)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens4.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS4=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens4.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens4.obj"	"$(INTDIR)\Ugens4.sbr" : $(SOURCE) $(DEP_CPP_UGENS4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS4=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens4.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens4.obj"	"$(INTDIR)\Ugens4.sbr" : $(SOURCE) $(DEP_CPP_UGENS4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS4=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens4.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens4.obj"	"$(INTDIR)\Ugens4.sbr" : $(SOURCE) $(DEP_CPP_UGENS4)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS4=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens4.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens4.obj"	"$(INTDIR)\Ugens4.sbr" : $(SOURCE) $(DEP_CPP_UGENS4)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens5.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS5=\
	".\cs.h"\
	".\lpc.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens5.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens5.obj"	"$(INTDIR)\Ugens5.sbr" : $(SOURCE) $(DEP_CPP_UGENS5)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS5=\
	".\cs.h"\
	".\lpc.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens5.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens5.obj"	"$(INTDIR)\Ugens5.sbr" : $(SOURCE) $(DEP_CPP_UGENS5)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS5=\
	".\cs.h"\
	".\lpc.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens5.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens5.obj"	"$(INTDIR)\Ugens5.sbr" : $(SOURCE) $(DEP_CPP_UGENS5)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS5=\
	".\cs.h"\
	".\lpc.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens5.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens5.obj"	"$(INTDIR)\Ugens5.sbr" : $(SOURCE) $(DEP_CPP_UGENS5)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens6.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS6=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens6.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens6.obj"	"$(INTDIR)\Ugens6.sbr" : $(SOURCE) $(DEP_CPP_UGENS6)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS6=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens6.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens6.obj"	"$(INTDIR)\Ugens6.sbr" : $(SOURCE) $(DEP_CPP_UGENS6)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS6=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens6.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens6.obj"	"$(INTDIR)\Ugens6.sbr" : $(SOURCE) $(DEP_CPP_UGENS6)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS6=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens6.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens6.obj"	"$(INTDIR)\Ugens6.sbr" : $(SOURCE) $(DEP_CPP_UGENS6)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\ugens7.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS7=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\version.h"\
	

"$(INTDIR)\ugens7.obj"	"$(INTDIR)\ugens7.sbr" : $(SOURCE) $(DEP_CPP_UGENS7)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS7=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\version.h"\
	

"$(INTDIR)\ugens7.obj"	"$(INTDIR)\ugens7.sbr" : $(SOURCE) $(DEP_CPP_UGENS7)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS7=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\version.h"\
	

"$(INTDIR)\ugens7.obj"	"$(INTDIR)\ugens7.sbr" : $(SOURCE) $(DEP_CPP_UGENS7)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS7=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\ugens7.obj"	"$(INTDIR)\ugens7.sbr" : $(SOURCE) $(DEP_CPP_UGENS7)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens8.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS8=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens8.obj"	"$(INTDIR)\Ugens8.sbr" : $(SOURCE) $(DEP_CPP_UGENS8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS8=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens8.obj"	"$(INTDIR)\Ugens8.sbr" : $(SOURCE) $(DEP_CPP_UGENS8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS8=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens8.obj"	"$(INTDIR)\Ugens8.sbr" : $(SOURCE) $(DEP_CPP_UGENS8)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS8=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\pvocext.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens8.obj"	"$(INTDIR)\Ugens8.sbr" : $(SOURCE) $(DEP_CPP_UGENS8)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugens9.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENS9=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens9.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens9.obj"	"$(INTDIR)\Ugens9.sbr" : $(SOURCE) $(DEP_CPP_UGENS9)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENS9=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens9.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens9.obj"	"$(INTDIR)\Ugens9.sbr" : $(SOURCE) $(DEP_CPP_UGENS9)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENS9=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens9.h"\
	".\version.h"\
	

"$(INTDIR)\Ugens9.obj"	"$(INTDIR)\Ugens9.sbr" : $(SOURCE) $(DEP_CPP_UGENS9)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENS9=\
	".\convolve.h"\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens9.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugens9.obj"	"$(INTDIR)\Ugens9.sbr" : $(SOURCE) $(DEP_CPP_UGENS9)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugensa.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGENSA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\ugensa.h"\
	".\version.h"\
	

"$(INTDIR)\Ugensa.obj"	"$(INTDIR)\Ugensa.sbr" : $(SOURCE) $(DEP_CPP_UGENSA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGENSA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\ugensa.h"\
	".\version.h"\
	

"$(INTDIR)\Ugensa.obj"	"$(INTDIR)\Ugensa.sbr" : $(SOURCE) $(DEP_CPP_UGENSA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGENSA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\ugensa.h"\
	".\version.h"\
	

"$(INTDIR)\Ugensa.obj"	"$(INTDIR)\Ugensa.sbr" : $(SOURCE) $(DEP_CPP_UGENSA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGENSA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens7.h"\
	".\ugensa.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugensa.obj"	"$(INTDIR)\Ugensa.sbr" : $(SOURCE) $(DEP_CPP_UGENSA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\ugmoss.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGMOS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugmoss.h"\
	".\version.h"\
	

"$(INTDIR)\ugmoss.obj"	"$(INTDIR)\ugmoss.sbr" : $(SOURCE) $(DEP_CPP_UGMOS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGMOS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugmoss.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\ugmoss.obj"	"$(INTDIR)\ugmoss.sbr" : $(SOURCE) $(DEP_CPP_UGMOS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGMOS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugmoss.h"\
	".\version.h"\
	

"$(INTDIR)\ugmoss.obj"	"$(INTDIR)\ugmoss.sbr" : $(SOURCE) $(DEP_CPP_UGMOS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGMOS=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugmoss.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\ugmoss.obj"	"$(INTDIR)\ugmoss.sbr" : $(SOURCE) $(DEP_CPP_UGMOS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugrw1.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGRW1=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw1.obj"	"$(INTDIR)\Ugrw1.sbr" : $(SOURCE) $(DEP_CPP_UGRW1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGRW1=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw1.obj"	"$(INTDIR)\Ugrw1.sbr" : $(SOURCE) $(DEP_CPP_UGRW1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGRW1=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw1.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw1.obj"	"$(INTDIR)\Ugrw1.sbr" : $(SOURCE) $(DEP_CPP_UGRW1)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGRW1=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw1.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugrw1.obj"	"$(INTDIR)\Ugrw1.sbr" : $(SOURCE) $(DEP_CPP_UGRW1)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ugrw2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGRW2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw2.obj"	"$(INTDIR)\Ugrw2.sbr" : $(SOURCE) $(DEP_CPP_UGRW2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGRW2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw2.obj"	"$(INTDIR)\Ugrw2.sbr" : $(SOURCE) $(DEP_CPP_UGRW2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGRW2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw2.h"\
	".\version.h"\
	

"$(INTDIR)\Ugrw2.obj"	"$(INTDIR)\Ugrw2.sbr" : $(SOURCE) $(DEP_CPP_UGRW2)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGRW2=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugrw2.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Ugrw2.obj"	"$(INTDIR)\Ugrw2.sbr" : $(SOURCE) $(DEP_CPP_UGRW2)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\ugsc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGSC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugsc.h"\
	".\version.h"\
	

"$(INTDIR)\ugsc.obj"	"$(INTDIR)\ugsc.sbr" : $(SOURCE) $(DEP_CPP_UGSC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGSC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugsc.h"\
	".\version.h"\
	

"$(INTDIR)\ugsc.obj"	"$(INTDIR)\ugsc.sbr" : $(SOURCE) $(DEP_CPP_UGSC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGSC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugsc.h"\
	".\version.h"\
	

"$(INTDIR)\ugsc.obj"	"$(INTDIR)\ugsc.sbr" : $(SOURCE) $(DEP_CPP_UGSC_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGSC_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugsc.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\ugsc.obj"	"$(INTDIR)\ugsc.sbr" : $(SOURCE) $(DEP_CPP_UGSC_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Ulaw.c

"$(INTDIR)\Ulaw.obj"	"$(INTDIR)\Ulaw.sbr" : $(SOURCE) "$(INTDIR)"


SOURCE=.\vbap.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VBAP_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap.obj"	"$(INTDIR)\vbap.sbr" : $(SOURCE) $(DEP_CPP_VBAP_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VBAP_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap.obj"	"$(INTDIR)\vbap.sbr" : $(SOURCE) $(DEP_CPP_VBAP_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VBAP_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap.obj"	"$(INTDIR)\vbap.sbr" : $(SOURCE) $(DEP_CPP_VBAP_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VBAP_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vbap.obj"	"$(INTDIR)\vbap.sbr" : $(SOURCE) $(DEP_CPP_VBAP_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\vbap_eight.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VBAP_E=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_eight.obj"	"$(INTDIR)\vbap_eight.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_E) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VBAP_E=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_eight.obj"	"$(INTDIR)\vbap_eight.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_E) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VBAP_E=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_eight.obj"	"$(INTDIR)\vbap_eight.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_E) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VBAP_E=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vbap_eight.obj"	"$(INTDIR)\vbap_eight.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_E) "$(INTDIR)"


!ENDIF 

SOURCE=.\vbap_four.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VBAP_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_four.obj"	"$(INTDIR)\vbap_four.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_F) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VBAP_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_four.obj"	"$(INTDIR)\vbap_four.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_F) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VBAP_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_four.obj"	"$(INTDIR)\vbap_four.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_F) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VBAP_F=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vbap_four.obj"	"$(INTDIR)\vbap_four.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_F) "$(INTDIR)"


!ENDIF 

SOURCE=.\vbap_sixteen.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VBAP_S=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj"	"$(INTDIR)\vbap_sixteen.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_S) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VBAP_S=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj"	"$(INTDIR)\vbap_sixteen.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_S) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VBAP_S=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj"	"$(INTDIR)\vbap_sixteen.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_S) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VBAP_S=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vbap_sixteen.obj"	"$(INTDIR)\vbap_sixteen.sbr" : $(SOURCE)\
 $(DEP_CPP_VBAP_S) "$(INTDIR)"


!ENDIF 

SOURCE=.\vbap_zak.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VBAP_Z=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_zak.obj"	"$(INTDIR)\vbap_zak.sbr" : $(SOURCE) $(DEP_CPP_VBAP_Z)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VBAP_Z=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_zak.obj"	"$(INTDIR)\vbap_zak.sbr" : $(SOURCE) $(DEP_CPP_VBAP_Z)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VBAP_Z=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	

"$(INTDIR)\vbap_zak.obj"	"$(INTDIR)\vbap_zak.sbr" : $(SOURCE) $(DEP_CPP_VBAP_Z)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VBAP_Z=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vbap.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vbap_zak.obj"	"$(INTDIR)\vbap_zak.sbr" : $(SOURCE) $(DEP_CPP_VBAP_Z)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Vdelay.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VDELA=\
	".\cs.h"\
	".\prototyp.h"\
	".\revsets.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vdelay.h"\
	".\version.h"\
	

"$(INTDIR)\Vdelay.obj"	"$(INTDIR)\Vdelay.sbr" : $(SOURCE) $(DEP_CPP_VDELA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VDELA=\
	".\cs.h"\
	".\prototyp.h"\
	".\revsets.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vdelay.h"\
	".\version.h"\
	

"$(INTDIR)\Vdelay.obj"	"$(INTDIR)\Vdelay.sbr" : $(SOURCE) $(DEP_CPP_VDELA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VDELA=\
	".\cs.h"\
	".\prototyp.h"\
	".\revsets.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vdelay.h"\
	".\version.h"\
	

"$(INTDIR)\Vdelay.obj"	"$(INTDIR)\Vdelay.sbr" : $(SOURCE) $(DEP_CPP_VDELA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VDELA=\
	".\cs.h"\
	".\prototyp.h"\
	".\revsets.h"\
	".\sysdep.h"\
	".\text.h"\
	".\vdelay.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Vdelay.obj"	"$(INTDIR)\Vdelay.sbr" : $(SOURCE) $(DEP_CPP_VDELA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\vpvoc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VPVOC=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\vpvoc.obj"	"$(INTDIR)\vpvoc.sbr" : $(SOURCE) $(DEP_CPP_VPVOC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VPVOC=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\vpvoc.obj"	"$(INTDIR)\vpvoc.sbr" : $(SOURCE) $(DEP_CPP_VPVOC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VPVOC=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\vpvoc.obj"	"$(INTDIR)\vpvoc.sbr" : $(SOURCE) $(DEP_CPP_VPVOC)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VPVOC=\
	".\cs.h"\
	".\dsputil.h"\
	".\fft.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\pvoc.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vpvoc.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vpvoc.obj"	"$(INTDIR)\vpvoc.sbr" : $(SOURCE) $(DEP_CPP_VPVOC)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Wave.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WAVE_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wave.h"\
	

"$(INTDIR)\Wave.obj"	"$(INTDIR)\Wave.sbr" : $(SOURCE) $(DEP_CPP_WAVE_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WAVE_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wave.h"\
	

"$(INTDIR)\Wave.obj"	"$(INTDIR)\Wave.sbr" : $(SOURCE) $(DEP_CPP_WAVE_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WAVE_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wave.h"\
	

"$(INTDIR)\Wave.obj"	"$(INTDIR)\Wave.sbr" : $(SOURCE) $(DEP_CPP_WAVE_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WAVE_=\
	".\cs.h"\
	".\prototyp.h"\
	".\sfheader.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wave.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Wave.obj"	"$(INTDIR)\Wave.sbr" : $(SOURCE) $(DEP_CPP_WAVE_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Wavegde.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WAVEG=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj"	"$(INTDIR)\Wavegde.sbr" : $(SOURCE) $(DEP_CPP_WAVEG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WAVEG=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj"	"$(INTDIR)\Wavegde.sbr" : $(SOURCE) $(DEP_CPP_WAVEG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WAVEG=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj"	"$(INTDIR)\Wavegde.sbr" : $(SOURCE) $(DEP_CPP_WAVEG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WAVEG=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wavegde.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Wavegde.obj"	"$(INTDIR)\Wavegde.sbr" : $(SOURCE) $(DEP_CPP_WAVEG)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Winascii.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WINAS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Winascii.obj"	"$(INTDIR)\Winascii.sbr" : $(SOURCE) $(DEP_CPP_WINAS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WINAS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Winascii.obj"	"$(INTDIR)\Winascii.sbr" : $(SOURCE) $(DEP_CPP_WINAS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WINAS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Winascii.obj"	"$(INTDIR)\Winascii.sbr" : $(SOURCE) $(DEP_CPP_WINAS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WINAS=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Winascii.obj"	"$(INTDIR)\Winascii.sbr" : $(SOURCE) $(DEP_CPP_WINAS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Windin.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WINDI=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\windin.h"\
	

"$(INTDIR)\Windin.obj"	"$(INTDIR)\Windin.sbr" : $(SOURCE) $(DEP_CPP_WINDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WINDI=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\windin.h"\
	

"$(INTDIR)\Windin.obj"	"$(INTDIR)\Windin.sbr" : $(SOURCE) $(DEP_CPP_WINDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WINDI=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\windin.h"\
	

"$(INTDIR)\Windin.obj"	"$(INTDIR)\Windin.sbr" : $(SOURCE) $(DEP_CPP_WINDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WINDI=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\windin.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Windin.obj"	"$(INTDIR)\Windin.sbr" : $(SOURCE) $(DEP_CPP_WINDI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Window.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WINDO=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wineps.h"\
	

"$(INTDIR)\Window.obj"	"$(INTDIR)\Window.sbr" : $(SOURCE) $(DEP_CPP_WINDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WINDO=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wineps.h"\
	

"$(INTDIR)\Window.obj"	"$(INTDIR)\Window.sbr" : $(SOURCE) $(DEP_CPP_WINDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WINDO=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wineps.h"\
	

"$(INTDIR)\Window.obj"	"$(INTDIR)\Window.sbr" : $(SOURCE) $(DEP_CPP_WINDO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WINDO=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\wineps.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Window.obj"	"$(INTDIR)\Window.sbr" : $(SOURCE) $(DEP_CPP_WINDO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Wineps.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WINEP=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Wineps.obj"	"$(INTDIR)\Wineps.sbr" : $(SOURCE) $(DEP_CPP_WINEP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WINEP=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Wineps.obj"	"$(INTDIR)\Wineps.sbr" : $(SOURCE) $(DEP_CPP_WINEP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WINEP=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\Wineps.obj"	"$(INTDIR)\Wineps.sbr" : $(SOURCE) $(DEP_CPP_WINEP)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_WINEP=\
	".\cs.h"\
	".\cwindow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\Wineps.obj"	"$(INTDIR)\Wineps.sbr" : $(SOURCE) $(DEP_CPP_WINEP)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\DirectXcapture.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DIREC=\
	".\cs.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\DirectXcapture.obj"	"$(INTDIR)\DirectXcapture.sbr" : $(SOURCE)\
 $(DEP_CPP_DIREC) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DIREC=\
	".\cs.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\DirectXcapture.obj"	"$(INTDIR)\DirectXcapture.sbr" : $(SOURCE)\
 $(DEP_CPP_DIREC) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DIREC=\
	".\cs.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\DirectXcapture.obj"	"$(INTDIR)\DirectXcapture.sbr" : $(SOURCE)\
 $(DEP_CPP_DIREC) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DIREC=\
	".\cs.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\DirectXcapture.obj"	"$(INTDIR)\DirectXcapture.sbr" : $(SOURCE)\
 $(DEP_CPP_DIREC) "$(INTDIR)"


!ENDIF 

SOURCE=.\DirectXout.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DIRECT=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\DirectXout.obj"	"$(INTDIR)\DirectXout.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECT) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DIRECT=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\DirectXout.obj"	"$(INTDIR)\DirectXout.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECT) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DIRECT=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\DirectXout.obj"	"$(INTDIR)\DirectXout.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECT) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DIRECT=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\DirectXout.obj"	"$(INTDIR)\DirectXout.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECT) "$(INTDIR)"


!ENDIF 

SOURCE=.\DirectXset.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DIRECTX=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D "INITGUID" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\DirectXset.obj"	"$(INTDIR)\DirectXset.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECTX) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DIRECTX=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /D "INITGUID" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DirectXset.obj"	"$(INTDIR)\DirectXset.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECTX) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DIRECTX=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /D "INITGUID"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DirectXset.obj"	"$(INTDIR)\DirectXset.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECTX) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DIRECTX=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\dxdevices.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /D "INITGUID"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\DirectXset.obj"	"$(INTDIR)\DirectXset.sbr" : $(SOURCE)\
 $(DEP_CPP_DIRECTX) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\out3D.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_OUT3D=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\out3d.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\out3D.obj"	"$(INTDIR)\out3D.sbr" : $(SOURCE) $(DEP_CPP_OUT3D)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_OUT3D=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\out3d.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\out3D.obj"	"$(INTDIR)\out3D.sbr" : $(SOURCE) $(DEP_CPP_OUT3D)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_OUT3D=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\out3d.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	

"$(INTDIR)\out3D.obj"	"$(INTDIR)\out3D.sbr" : $(SOURCE) $(DEP_CPP_OUT3D)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_OUT3D=\
	".\cs.h"\
	".\dsbuffer.h"\
	".\out3d.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"eax.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\out3D.obj"	"$(INTDIR)\out3D.sbr" : $(SOURCE) $(DEP_CPP_OUT3D)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\dashow.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_DASHO=\
	".\cs.h"\
	".\dashow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dashow.obj"	"$(INTDIR)\dashow.sbr" : $(SOURCE) $(DEP_CPP_DASHO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_DASHO=\
	".\cs.h"\
	".\dashow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dashow.obj"	"$(INTDIR)\dashow.sbr" : $(SOURCE) $(DEP_CPP_DASHO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_DASHO=\
	".\cs.h"\
	".\dashow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\dashow.obj"	"$(INTDIR)\dashow.sbr" : $(SOURCE) $(DEP_CPP_DASHO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_DASHO=\
	".\cs.h"\
	".\dashow.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\dashow.obj"	"$(INTDIR)\dashow.sbr" : $(SOURCE) $(DEP_CPP_DASHO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\flanger.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FLANG=\
	".\cs.h"\
	".\flanger.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\flanger.obj"	"$(INTDIR)\flanger.sbr" : $(SOURCE) $(DEP_CPP_FLANG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FLANG=\
	".\cs.h"\
	".\flanger.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\flanger.obj"	"$(INTDIR)\flanger.sbr" : $(SOURCE) $(DEP_CPP_FLANG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FLANG=\
	".\cs.h"\
	".\flanger.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\flanger.obj"	"$(INTDIR)\flanger.sbr" : $(SOURCE) $(DEP_CPP_FLANG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FLANG=\
	".\cs.h"\
	".\flanger.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\flanger.obj"	"$(INTDIR)\flanger.sbr" : $(SOURCE) $(DEP_CPP_FLANG)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\fof3.C

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FOF3_=\
	".\cs.h"\
	".\fof3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fof3.obj"	"$(INTDIR)\fof3.sbr" : $(SOURCE) $(DEP_CPP_FOF3_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FOF3_=\
	".\cs.h"\
	".\fof3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fof3.obj"	"$(INTDIR)\fof3.sbr" : $(SOURCE) $(DEP_CPP_FOF3_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FOF3_=\
	".\cs.h"\
	".\fof3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fof3.obj"	"$(INTDIR)\fof3.sbr" : $(SOURCE) $(DEP_CPP_FOF3_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FOF3_=\
	".\cs.h"\
	".\fof3.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\fof3.obj"	"$(INTDIR)\fof3.sbr" : $(SOURCE) $(DEP_CPP_FOF3_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\foscili2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FOSCI=\
	".\cs.h"\
	".\foscili2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\foscili2.obj"	"$(INTDIR)\foscili2.sbr" : $(SOURCE) $(DEP_CPP_FOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FOSCI=\
	".\cs.h"\
	".\foscili2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\foscili2.obj"	"$(INTDIR)\foscili2.sbr" : $(SOURCE) $(DEP_CPP_FOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FOSCI=\
	".\cs.h"\
	".\foscili2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\foscili2.obj"	"$(INTDIR)\foscili2.sbr" : $(SOURCE) $(DEP_CPP_FOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FOSCI=\
	".\cs.h"\
	".\foscili2.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\foscili2.obj"	"$(INTDIR)\foscili2.sbr" : $(SOURCE) $(DEP_CPP_FOSCI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\fout.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FOUT_=\
	".\cs.h"\
	".\fout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fout.obj"	"$(INTDIR)\fout.sbr" : $(SOURCE) $(DEP_CPP_FOUT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FOUT_=\
	".\cs.h"\
	".\fout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fout.obj"	"$(INTDIR)\fout.sbr" : $(SOURCE) $(DEP_CPP_FOUT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FOUT_=\
	".\cs.h"\
	".\fout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\fout.obj"	"$(INTDIR)\fout.sbr" : $(SOURCE) $(DEP_CPP_FOUT_)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FOUT_=\
	".\cs.h"\
	".\fout.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\fout.obj"	"$(INTDIR)\fout.sbr" : $(SOURCE) $(DEP_CPP_FOUT_)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\gab_osc.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GAB_O=\
	".\cs.h"\
	".\gab_osc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gab_osc.obj"	"$(INTDIR)\gab_osc.sbr" : $(SOURCE) $(DEP_CPP_GAB_O)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GAB_O=\
	".\cs.h"\
	".\gab_osc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gab_osc.obj"	"$(INTDIR)\gab_osc.sbr" : $(SOURCE) $(DEP_CPP_GAB_O)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GAB_O=\
	".\cs.h"\
	".\gab_osc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gab_osc.obj"	"$(INTDIR)\gab_osc.sbr" : $(SOURCE) $(DEP_CPP_GAB_O)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GAB_O=\
	".\cs.h"\
	".\gab_osc.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\gab_osc.obj"	"$(INTDIR)\gab_osc.sbr" : $(SOURCE) $(DEP_CPP_GAB_O)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\generative.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GENER=\
	".\cs.h"\
	".\cscore.h"\
	".\generative.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\generative.obj"	"$(INTDIR)\generative.sbr" : $(SOURCE)\
 $(DEP_CPP_GENER) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GENER=\
	".\cs.h"\
	".\cscore.h"\
	".\generative.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\generative.obj"	"$(INTDIR)\generative.sbr" : $(SOURCE)\
 $(DEP_CPP_GENER) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GENER=\
	".\cs.h"\
	".\cscore.h"\
	".\generative.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\generative.obj"	"$(INTDIR)\generative.sbr" : $(SOURCE)\
 $(DEP_CPP_GENER) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GENER=\
	".\cs.h"\
	".\cscore.h"\
	".\generative.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\generative.obj"	"$(INTDIR)\generative.sbr" : $(SOURCE)\
 $(DEP_CPP_GENER) "$(INTDIR)"


!ENDIF 

SOURCE=.\InstrCall.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_INSTR=\
	".\cs.h"\
	".\instrcall.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\InstrCall.obj"	"$(INTDIR)\InstrCall.sbr" : $(SOURCE)\
 $(DEP_CPP_INSTR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_INSTR=\
	".\cs.h"\
	".\instrcall.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\InstrCall.obj"	"$(INTDIR)\InstrCall.sbr" : $(SOURCE)\
 $(DEP_CPP_INSTR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_INSTR=\
	".\cs.h"\
	".\instrcall.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\InstrCall.obj"	"$(INTDIR)\InstrCall.sbr" : $(SOURCE)\
 $(DEP_CPP_INSTR) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_INSTR=\
	".\cs.h"\
	".\instrcall.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\InstrCall.obj"	"$(INTDIR)\InstrCall.sbr" : $(SOURCE)\
 $(DEP_CPP_INSTR) "$(INTDIR)"


!ENDIF 

SOURCE=.\loscil2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_LOSCI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\loscil2.obj"	"$(INTDIR)\loscil2.sbr" : $(SOURCE) $(DEP_CPP_LOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_LOSCI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\loscil2.obj"	"$(INTDIR)\loscil2.sbr" : $(SOURCE) $(DEP_CPP_LOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_LOSCI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	

"$(INTDIR)\loscil2.obj"	"$(INTDIR)\loscil2.sbr" : $(SOURCE) $(DEP_CPP_LOSCI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_LOSCI=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens3.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\loscil2.obj"	"$(INTDIR)\loscil2.sbr" : $(SOURCE) $(DEP_CPP_LOSCI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\sfont.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_SFONT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sf.h"\
	".\sfenum.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\sfont.obj"	"$(INTDIR)\sfont.sbr" : $(SOURCE) $(DEP_CPP_SFONT)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_SFONT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sf.h"\
	".\sfenum.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /Zp1 /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\sfont.obj"	"$(INTDIR)\sfont.sbr" : $(SOURCE) $(DEP_CPP_SFONT)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_SFONT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sf.h"\
	".\sfenum.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\sfont.obj"	"$(INTDIR)\sfont.sbr" : $(SOURCE) $(DEP_CPP_SFONT)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_SFONT=\
	".\cs.h"\
	".\prototyp.h"\
	".\sf.h"\
	".\sfenum.h"\
	".\sfont.h"\
	".\sftype.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /Zp1 /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\sfont.obj"	"$(INTDIR)\sfont.sbr" : $(SOURCE) $(DEP_CPP_SFONT)\
 "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\uggab.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_UGGAB=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\uggab.obj"	"$(INTDIR)\uggab.sbr" : $(SOURCE) $(DEP_CPP_UGGAB)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_UGGAB=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\uggab.obj"	"$(INTDIR)\uggab.sbr" : $(SOURCE) $(DEP_CPP_UGGAB)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_UGGAB=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\uggab.h"\
	".\version.h"\
	

"$(INTDIR)\uggab.obj"	"$(INTDIR)\uggab.sbr" : $(SOURCE) $(DEP_CPP_UGGAB)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_UGGAB=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\uggab.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\uggab.obj"	"$(INTDIR)\uggab.sbr" : $(SOURCE) $(DEP_CPP_UGGAB)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\vibrato.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_VIBRA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibrato.h"\
	

"$(INTDIR)\vibrato.obj"	"$(INTDIR)\vibrato.sbr" : $(SOURCE) $(DEP_CPP_VIBRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_VIBRA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibrato.h"\
	

"$(INTDIR)\vibrato.obj"	"$(INTDIR)\vibrato.sbr" : $(SOURCE) $(DEP_CPP_VIBRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_VIBRA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibrato.h"\
	

"$(INTDIR)\vibrato.obj"	"$(INTDIR)\vibrato.sbr" : $(SOURCE) $(DEP_CPP_VIBRA)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_VIBRA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\vibrato.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\vibrato.obj"	"$(INTDIR)\vibrato.sbr" : $(SOURCE) $(DEP_CPP_VIBRA)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\Fl\Fl_Knob.cxx

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FL_KN=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_knob.h"\
	

"$(INTDIR)\Fl_Knob.obj"	"$(INTDIR)\Fl_Knob.sbr" : $(SOURCE) $(DEP_CPP_FL_KN)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FL_KN=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_knob.h"\
	

"$(INTDIR)\Fl_Knob.obj"	"$(INTDIR)\Fl_Knob.sbr" : $(SOURCE) $(DEP_CPP_FL_KN)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FL_KN=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_knob.h"\
	

"$(INTDIR)\Fl_Knob.obj"	"$(INTDIR)\Fl_Knob.sbr" : $(SOURCE) $(DEP_CPP_FL_KN)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FL_KN=\
	".\fl\fl_knob.h"\
	

"$(INTDIR)\Fl_Knob.obj"	"$(INTDIR)\Fl_Knob.sbr" : $(SOURCE) $(DEP_CPP_FL_KN)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Fl\Fl_Spin.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FL_SP=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_spin.h"\
	

"$(INTDIR)\Fl_Spin.obj"	"$(INTDIR)\Fl_Spin.sbr" : $(SOURCE) $(DEP_CPP_FL_SP)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FL_SP=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_spin.h"\
	

"$(INTDIR)\Fl_Spin.obj"	"$(INTDIR)\Fl_Spin.sbr" : $(SOURCE) $(DEP_CPP_FL_SP)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FL_SP=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_spin.h"\
	

"$(INTDIR)\Fl_Spin.obj"	"$(INTDIR)\Fl_Spin.sbr" : $(SOURCE) $(DEP_CPP_FL_SP)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FL_SP=\
	".\fl\fl_spin.h"\
	

"$(INTDIR)\Fl_Spin.obj"	"$(INTDIR)\Fl_Spin.sbr" : $(SOURCE) $(DEP_CPP_FL_SP)\
 "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Fl\Fl_Value_Input_Spin.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FL_VA=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_input_spin.h"\
	

"$(INTDIR)\Fl_Value_Input_Spin.obj"	"$(INTDIR)\Fl_Value_Input_Spin.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FL_VA=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_input_spin.h"\
	

"$(INTDIR)\Fl_Value_Input_Spin.obj"	"$(INTDIR)\Fl_Value_Input_Spin.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FL_VA=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_input_spin.h"\
	

"$(INTDIR)\Fl_Value_Input_Spin.obj"	"$(INTDIR)\Fl_Value_Input_Spin.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FL_VA=\
	".\fl\fl_value_input_spin.h"\
	

"$(INTDIR)\Fl_Value_Input_Spin.obj"	"$(INTDIR)\Fl_Value_Input_Spin.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\Fl\Fl_Value_Slider_Input.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FL_VAL=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_slider_input.h"\
	

"$(INTDIR)\Fl_Value_Slider_Input.obj"	"$(INTDIR)\Fl_Value_Slider_Input.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FL_VAL=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_slider_input.h"\
	

"$(INTDIR)\Fl_Value_Slider_Input.obj"	"$(INTDIR)\Fl_Value_Slider_Input.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FL_VAL=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	".\fl\fl_value_slider_input.h"\
	

"$(INTDIR)\Fl_Value_Slider_Input.obj"	"$(INTDIR)\Fl_Value_Slider_Input.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FL_VAL=\
	".\fl\fl_value_slider_input.h"\
	

"$(INTDIR)\Fl_Value_Slider_Input.obj"	"$(INTDIR)\Fl_Value_Slider_Input.sbr" : \
$(SOURCE) $(DEP_CPP_FL_VAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=.\glpng.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GLPNG=\
	"..\paintlib\otherlib\libpng\png.h"\
	"..\paintlib\otherlib\libpng\pngconf.h"\
	"..\paintlib\otherlib\zlib\zconf.h"\
	"..\paintlib\otherlib\zlib\zlib.h"\
	".\gl\glpng.h"\
	

"$(INTDIR)\glpng.obj"	"$(INTDIR)\glpng.sbr" : $(SOURCE) $(DEP_CPP_GLPNG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GLPNG=\
	".\gl\glpng.h"\
	{$(INCLUDE)}"GL\gl.h"\
	
NODEP_CPP_GLPNG=\
	".\png.h"\
	

"$(INTDIR)\glpng.obj"	"$(INTDIR)\glpng.sbr" : $(SOURCE) $(DEP_CPP_GLPNG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GLPNG=\
	"..\paintlib\otherlib\libpng\png.h"\
	"..\paintlib\otherlib\libpng\pngconf.h"\
	"..\paintlib\otherlib\zlib\zconf.h"\
	"..\paintlib\otherlib\zlib\zlib.h"\
	".\gl\glpng.h"\
	

"$(INTDIR)\glpng.obj"	"$(INTDIR)\glpng.sbr" : $(SOURCE) $(DEP_CPP_GLPNG)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GLPNG=\
	".\gl\glpng.h"\
	{$(INCLUDE)}"GL\gl.h"\
	
NODEP_CPP_GLPNG=\
	".\png.h"\
	

"$(INTDIR)\glpng.obj"	"$(INTDIR)\glpng.sbr" : $(SOURCE) $(DEP_CPP_GLPNG)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\keyboard.cxx

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_KEYBO=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	".\cs.h"\
	".\keyboard_ui.cxx"\
	".\keyboard_ui.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	

"$(INTDIR)\keyboard.obj"	"$(INTDIR)\keyboard.sbr" : $(SOURCE) $(DEP_CPP_KEYBO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_KEYBO=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	"..\FLTK\fltk-1.0.10\FL\win32.H"\
	"..\FLTK\fltk-1.0.10\FL\x.H"\
	".\cs.h"\
	".\keyboard_ui.cxx"\
	".\keyboard_ui.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\keyboard.obj"	"$(INTDIR)\keyboard.sbr" : $(SOURCE) $(DEP_CPP_KEYBO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_KEYBO=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	".\cs.h"\
	".\keyboard_ui.cxx"\
	".\keyboard_ui.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	

"$(INTDIR)\keyboard.obj"	"$(INTDIR)\keyboard.sbr" : $(SOURCE) $(DEP_CPP_KEYBO)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_KEYBO=\
	".\cs.h"\
	".\keyboard_ui.cxx"\
	".\keyboard_ui.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\keyboard.obj"	"$(INTDIR)\keyboard.sbr" : $(SOURCE) $(DEP_CPP_KEYBO)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\widgets.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_WIDGE=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_adjuster.h"\
	"..\fltk\fltk-1.0.10\fl\fl_box.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_check_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_counter.h"\
	"..\fltk\fltk-1.0.10\fl\fl_dial.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_light_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_pack.h"\
	"..\fltk\fltk-1.0.10\fl\fl_positioner.h"\
	"..\fltk\fltk-1.0.10\fl\fl_roller.h"\
	"..\fltk\fltk-1.0.10\fl\fl_round_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scroll.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scrollbar.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_tabs.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	"..\stl_sgi\char_traits.h"\
	"..\stl_sgi\concept_checks.h"\
	"..\stl_sgi\stl_algo.h"\
	"..\stl_sgi\stl_algobase.h"\
	"..\stl_sgi\stl_alloc.h"\
	"..\stl_sgi\stl_bvector.h"\
	"..\stl_sgi\stl_config.h"\
	"..\stl_sgi\stl_construct.h"\
	"..\stl_sgi\stl_ctraits_fns.h"\
	"..\stl_sgi\stl_exception.h"\
	"..\stl_sgi\stl_function.h"\
	"..\stl_sgi\stl_hash_fun.h"\
	"..\stl_sgi\stl_heap.h"\
	"..\stl_sgi\stl_iterator.h"\
	"..\stl_sgi\stl_iterator_base.h"\
	"..\stl_sgi\stl_pair.h"\
	"..\stl_sgi\stl_range_errors.h"\
	"..\stl_sgi\stl_raw_storage_iter.h"\
	"..\stl_sgi\stl_relops.h"\
	"..\stl_sgi\stl_string_fwd.h"\
	"..\stl_sgi\stl_tempbuf.h"\
	"..\stl_sgi\stl_threads.h"\
	"..\stl_sgi\stl_uninitialized.h"\
	"..\stl_sgi\stl_vector.h"\
	"..\stl_sgi\type_traits.h"\
	".\cs.h"\
	".\fl\fl_ball.h"\
	".\fl\fl_flews.h"\
	".\fl\fl_knob.h"\
	".\fl\fl_spin.h"\
	".\fl\fl_value_input_spin.h"\
	".\fl\fl_value_slider_input.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	

"$(INTDIR)\widgets.obj"	"$(INTDIR)\widgets.sbr" : $(SOURCE) $(DEP_CPP_WIDGE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_WIDGE=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_adjuster.h"\
	"..\fltk\fltk-1.0.10\fl\fl_box.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_check_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_counter.h"\
	"..\fltk\fltk-1.0.10\fl\fl_dial.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_light_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_pack.h"\
	"..\fltk\fltk-1.0.10\fl\fl_positioner.h"\
	"..\fltk\fltk-1.0.10\fl\fl_roller.h"\
	"..\fltk\fltk-1.0.10\fl\fl_round_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scroll.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scrollbar.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_tabs.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	".\cs.h"\
	".\fl\fl_ball.h"\
	".\fl\fl_flews.h"\
	".\fl\fl_knob.h"\
	".\fl\fl_spin.h"\
	".\fl\fl_value_input_spin.h"\
	".\fl\fl_value_slider_input.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\widgets.obj"	"$(INTDIR)\widgets.sbr" : $(SOURCE) $(DEP_CPP_WIDGE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_WIDGE=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_adjuster.h"\
	"..\fltk\fltk-1.0.10\fl\fl_box.h"\
	"..\fltk\fltk-1.0.10\fl\fl_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_check_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_counter.h"\
	"..\fltk\fltk-1.0.10\fl\fl_dial.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_light_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_pack.h"\
	"..\fltk\fltk-1.0.10\fl\fl_positioner.h"\
	"..\fltk\fltk-1.0.10\fl\fl_roller.h"\
	"..\fltk\fltk-1.0.10\fl\fl_round_button.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scroll.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scrollbar.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_tabs.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	"..\stl_sgi\char_traits.h"\
	"..\stl_sgi\concept_checks.h"\
	"..\stl_sgi\stl_algo.h"\
	"..\stl_sgi\stl_algobase.h"\
	"..\stl_sgi\stl_alloc.h"\
	"..\stl_sgi\stl_bvector.h"\
	"..\stl_sgi\stl_config.h"\
	"..\stl_sgi\stl_construct.h"\
	"..\stl_sgi\stl_ctraits_fns.h"\
	"..\stl_sgi\stl_exception.h"\
	"..\stl_sgi\stl_function.h"\
	"..\stl_sgi\stl_hash_fun.h"\
	"..\stl_sgi\stl_heap.h"\
	"..\stl_sgi\stl_iterator.h"\
	"..\stl_sgi\stl_iterator_base.h"\
	"..\stl_sgi\stl_pair.h"\
	"..\stl_sgi\stl_range_errors.h"\
	"..\stl_sgi\stl_raw_storage_iter.h"\
	"..\stl_sgi\stl_relops.h"\
	"..\stl_sgi\stl_string_fwd.h"\
	"..\stl_sgi\stl_tempbuf.h"\
	"..\stl_sgi\stl_threads.h"\
	"..\stl_sgi\stl_uninitialized.h"\
	"..\stl_sgi\stl_vector.h"\
	"..\stl_sgi\type_traits.h"\
	".\cs.h"\
	".\fl\fl_ball.h"\
	".\fl\fl_flews.h"\
	".\fl\fl_knob.h"\
	".\fl\fl_spin.h"\
	".\fl\fl_value_input_spin.h"\
	".\fl\fl_value_slider_input.h"\
	".\oload.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	".\widgets.h"\
	

"$(INTDIR)\widgets.obj"	"$(INTDIR)\widgets.sbr" : $(SOURCE) $(DEP_CPP_WIDGE)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"


"$(INTDIR)\widgets.obj"	"$(INTDIR)\widgets.sbr" : $(SOURCE) "$(INTDIR)"


!ENDIF 

SOURCE=.\fractals.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_FRACT=\
	".\cs.h"\
	".\fractals.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\fractals.obj"	"$(INTDIR)\fractals.sbr" : $(SOURCE) $(DEP_CPP_FRACT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_FRACT=\
	".\cs.h"\
	".\fractals.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\fractals.obj"	"$(INTDIR)\fractals.sbr" : $(SOURCE) $(DEP_CPP_FRACT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_FRACT=\
	".\cs.h"\
	".\fractals.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	

"$(INTDIR)\fractals.obj"	"$(INTDIR)\fractals.sbr" : $(SOURCE) $(DEP_CPP_FRACT)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_FRACT=\
	".\cs.h"\
	".\fractals.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\ugens8.h"\
	".\version.h"\
	".\vibrato.h"\
	".\vpvoc.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\fractals.obj"	"$(INTDIR)\fractals.sbr" : $(SOURCE) $(DEP_CPP_FRACT)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\picture.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_PICTU=\
	"..\paintlib\src\common\anybmp.h"\
	"..\paintlib\src\common\anydec.h"\
	"..\paintlib\src\common\bitmap.h"\
	"..\paintlib\src\common\config.h"\
	"..\paintlib\src\common\datasrc.h"\
	"..\paintlib\src\common\debug.h"\
	"..\paintlib\src\common\except.h"\
	"..\paintlib\src\common\picdec.h"\
	"..\paintlib\src\common\plobject.h"\
	"..\paintlib\src\common\plpoint.h"\
	"..\paintlib\src\common\stdpch.h"\
	"..\stl_sgi\concept_checks.h"\
	"..\stl_sgi\stl_algobase.h"\
	"..\stl_sgi\stl_alloc.h"\
	"..\stl_sgi\stl_bvector.h"\
	"..\stl_sgi\stl_config.h"\
	"..\stl_sgi\stl_construct.h"\
	"..\stl_sgi\stl_function.h"\
	"..\stl_sgi\stl_iterator.h"\
	"..\stl_sgi\stl_iterator_base.h"\
	"..\stl_sgi\stl_map.h"\
	"..\stl_sgi\stl_multimap.h"\
	"..\stl_sgi\stl_pair.h"\
	"..\stl_sgi\stl_range_errors.h"\
	"..\stl_sgi\stl_relops.h"\
	"..\stl_sgi\stl_threads.h"\
	"..\stl_sgi\stl_tree.h"\
	"..\stl_sgi\stl_uninitialized.h"\
	"..\stl_sgi\stl_vector.h"\
	"..\stl_sgi\type_traits.h"\
	".\cs.h"\
	".\oload.h"\
	".\picture.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\picture.obj"	"$(INTDIR)\picture.sbr" : $(SOURCE) $(DEP_CPP_PICTU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_PICTU=\
	"..\fltk\fltk-1.0.10\fl\enumerations.h"\
	"..\fltk\fltk-1.0.10\fl\fl.h"\
	"..\fltk\fltk-1.0.10\fl\fl_adjuster.h"\
	"..\fltk\fltk-1.0.10\fl\fl_box.h"\
	"..\fltk\fltk-1.0.10\fl\fl_counter.h"\
	"..\fltk\fltk-1.0.10\fl\fl_dial.h"\
	"..\fltk\fltk-1.0.10\fl\fl_draw.h"\
	"..\fltk\fltk-1.0.10\fl\fl_group.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_input_.h"\
	"..\fltk\fltk-1.0.10\fl\fl_roller.h"\
	"..\fltk\fltk-1.0.10\fl\fl_scrollbar.h"\
	"..\fltk\fltk-1.0.10\fl\fl_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_valuator.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_input.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_output.h"\
	"..\fltk\fltk-1.0.10\fl\fl_value_slider.h"\
	"..\fltk\fltk-1.0.10\fl\fl_widget.h"\
	"..\fltk\fltk-1.0.10\fl\fl_window.h"\
	"..\paintlib\src\common\anybmp.h"\
	"..\paintlib\src\common\anydec.h"\
	"..\paintlib\src\common\bitmap.h"\
	"..\paintlib\src\common\config.h"\
	"..\paintlib\src\common\datasrc.h"\
	"..\paintlib\src\common\debug.h"\
	"..\paintlib\src\common\except.h"\
	"..\paintlib\src\common\picdec.h"\
	"..\paintlib\src\common\plobject.h"\
	"..\paintlib\src\common\plpoint.h"\
	"..\paintlib\src\common\stdpch.h"\
	".\cs.h"\
	".\oload.h"\
	".\picture.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\picture.obj"	"$(INTDIR)\picture.sbr" : $(SOURCE) $(DEP_CPP_PICTU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_PICTU=\
	"..\paintlib\src\common\anybmp.h"\
	"..\paintlib\src\common\anydec.h"\
	"..\paintlib\src\common\bitmap.h"\
	"..\paintlib\src\common\config.h"\
	"..\paintlib\src\common\datasrc.h"\
	"..\paintlib\src\common\debug.h"\
	"..\paintlib\src\common\except.h"\
	"..\paintlib\src\common\picdec.h"\
	"..\paintlib\src\common\plobject.h"\
	"..\paintlib\src\common\plpoint.h"\
	"..\paintlib\src\common\stdpch.h"\
	"..\stl_sgi\concept_checks.h"\
	"..\stl_sgi\stl_algobase.h"\
	"..\stl_sgi\stl_alloc.h"\
	"..\stl_sgi\stl_bvector.h"\
	"..\stl_sgi\stl_config.h"\
	"..\stl_sgi\stl_construct.h"\
	"..\stl_sgi\stl_function.h"\
	"..\stl_sgi\stl_iterator.h"\
	"..\stl_sgi\stl_iterator_base.h"\
	"..\stl_sgi\stl_map.h"\
	"..\stl_sgi\stl_multimap.h"\
	"..\stl_sgi\stl_pair.h"\
	"..\stl_sgi\stl_range_errors.h"\
	"..\stl_sgi\stl_relops.h"\
	"..\stl_sgi\stl_threads.h"\
	"..\stl_sgi\stl_tree.h"\
	"..\stl_sgi\stl_uninitialized.h"\
	"..\stl_sgi\stl_vector.h"\
	"..\stl_sgi\type_traits.h"\
	".\cs.h"\
	".\oload.h"\
	".\picture.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\picture.obj"	"$(INTDIR)\picture.sbr" : $(SOURCE) $(DEP_CPP_PICTU)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_PICTU=\
	"..\paintlib\src\common\anybmp.h"\
	"..\paintlib\src\common\anydec.h"\
	"..\paintlib\src\common\bitmap.h"\
	"..\paintlib\src\common\config.h"\
	"..\paintlib\src\common\datasrc.h"\
	"..\paintlib\src\common\debug.h"\
	"..\paintlib\src\common\except.h"\
	"..\paintlib\src\common\picdec.h"\
	"..\paintlib\src\common\plobject.h"\
	"..\paintlib\src\common\plpoint.h"\
	"..\paintlib\src\common\stdpch.h"\
	".\cs.h"\
	".\oload.h"\
	".\picture.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\picture.obj"	"$(INTDIR)\picture.sbr" : $(SOURCE) $(DEP_CPP_PICTU)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\about.c
DEP_CPP_ABOUT=\
	".\version.h"\
	

"$(INTDIR)\about.obj"	"$(INTDIR)\about.sbr" : $(SOURCE) $(DEP_CPP_ABOUT)\
 "$(INTDIR)"


SOURCE=.\ConsoleGab.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_CONSO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\ConsoleGab.obj"	"$(INTDIR)\ConsoleGab.sbr" : $(SOURCE)\
 $(DEP_CPP_CONSO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_CONSO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\ConsoleGab.obj"	"$(INTDIR)\ConsoleGab.sbr" : $(SOURCE)\
 $(DEP_CPP_CONSO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_CONSO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\ConsoleGab.obj"	"$(INTDIR)\ConsoleGab.sbr" : $(SOURCE)\
 $(DEP_CPP_CONSO) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_CONSO=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\ConsoleGab.obj"	"$(INTDIR)\ConsoleGab.sbr" : $(SOURCE)\
 $(DEP_CPP_CONSO) "$(INTDIR)"


!ENDIF 

SOURCE=.\Dialog.rc
DEP_RSC_DIALO=\
	".\cursor2.cur"\
	".\cursor3.cur"\
	".\cursor4.cur"\
	".\icon2.ico"\
	".\OrecchioGrande.bmp"\
	".\orecchioMedio.bmp"\
	".\vstpluglogo2.bmp"\
	

"$(INTDIR)\Dialog.res" : $(SOURCE) $(DEP_RSC_DIALO) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\gabscanf.c

"$(INTDIR)\gabscanf.obj"	"$(INTDIR)\gabscanf.sbr" : $(SOURCE) "$(INTDIR)"


SOURCE=.\gabWaveCaps.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GABWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gabWaveCaps.obj"	"$(INTDIR)\gabWaveCaps.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GABWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gabWaveCaps.obj"	"$(INTDIR)\gabWaveCaps.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GABWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\gabWaveCaps.obj"	"$(INTDIR)\gabWaveCaps.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWA) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GABWA=\
	".\cs.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\gabWaveCaps.obj"	"$(INTDIR)\gabWaveCaps.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWA) "$(INTDIR)"


!ENDIF 

SOURCE=.\gabWinMIDI.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GABWI=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /FR"$(INTDIR)\\" /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\gabWinMIDI.obj"	"$(INTDIR)\gabWinMIDI.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GABWI=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D\
 "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX"\
 /FR"$(INTDIR)\\" /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\"\
 /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\gabWinMIDI.obj"	"$(INTDIR)\gabWinMIDI.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GABWI=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	
CPP_SWITCHES=/nologo /MT /W3 /GX /O2 /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "\My_Docs\Visual_C\FLTK\fltk-1.0.10"\
 /I "\My_Docs\Visual_C\OpenGl\glut-3.7.2\include\\" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\libpng" /I\
 "\My_Docs\Visual_C\paintlib\otherlib\zlib" /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /D "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\gabWinMIDI.obj"	"$(INTDIR)\gabWinMIDI.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GABWI=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /MTd /W3 /Gm /GX /Zi /Od /I "./" /I\
 "\My_Docs\Visual_C\paintlib\src\common" /I "..\paintlib" /I "..\libtiff" /I\
 "..\..\..\otherlib\libtiff\libtiff" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D\
 "_MBCS" /D "_WINDOWS" /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D\
 "MSVC" /D "GAB_RT" /D "STRICT" /D "GAB_EAX" /D MYFLT=double /FR"$(INTDIR)\\"\
 /Fp"$(INTDIR)\DirectCsoundCon.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c\
 

"$(INTDIR)\gabWinMIDI.obj"	"$(INTDIR)\gabWinMIDI.sbr" : $(SOURCE)\
 $(DEP_CPP_GABWI) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\genUser.cxx

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_GENUS=\
	".\cscore.h"\
	".\sysdep.h"\
	

"$(INTDIR)\genUser.obj"	"$(INTDIR)\genUser.sbr" : $(SOURCE) $(DEP_CPP_GENUS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_GENUS=\
	".\cscore.h"\
	".\sysdep.h"\
	

"$(INTDIR)\genUser.obj"	"$(INTDIR)\genUser.sbr" : $(SOURCE) $(DEP_CPP_GENUS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_GENUS=\
	".\cscore.h"\
	

"$(INTDIR)\genUser.obj"	"$(INTDIR)\genUser.sbr" : $(SOURCE) $(DEP_CPP_GENUS)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_GENUS=\
	".\cscore.h"\
	".\sysdep.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\genUser.obj"	"$(INTDIR)\genUser.sbr" : $(SOURCE) $(DEP_CPP_GENUS)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\midi_cs_gab.cpp

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_MIDI_=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	

"$(INTDIR)\midi_cs_gab.obj"	"$(INTDIR)\midi_cs_gab.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDI_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_MIDI_=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	

"$(INTDIR)\midi_cs_gab.obj"	"$(INTDIR)\midi_cs_gab.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDI_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_MIDI_=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\sysdep.h"\
	".\version.h"\
	

"$(INTDIR)\midi_cs_gab.obj"	"$(INTDIR)\midi_cs_gab.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDI_) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_MIDI_=\
	".\cs.h"\
	".\gabwinmidi.h"\
	".\prototyp.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\midi_cs_gab.obj"	"$(INTDIR)\midi_cs_gab.sbr" : $(SOURCE)\
 $(DEP_CPP_MIDI_) "$(INTDIR)"


!ENDIF 

SOURCE=.\rtaudio2.c

!IF  "$(CFG)" == "DirectCsoundCon - Win32 Release"

DEP_CPP_RTAUDI=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\rtaudio2.obj"	"$(INTDIR)\rtaudio2.sbr" : $(SOURCE) $(DEP_CPP_RTAUDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 Debug"

DEP_CPP_RTAUDI=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\rtaudio2.obj"	"$(INTDIR)\rtaudio2.sbr" : $(SOURCE) $(DEP_CPP_RTAUDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Release"

DEP_CPP_RTAUDI=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	

"$(INTDIR)\rtaudio2.obj"	"$(INTDIR)\rtaudio2.sbr" : $(SOURCE) $(DEP_CPP_RTAUDI)\
 "$(INTDIR)"


!ELSEIF  "$(CFG)" == "DirectCsoundCon - Win32 double Debug"

DEP_CPP_RTAUDI=\
	".\cs.h"\
	".\prototyp.h"\
	".\soundio.h"\
	".\sysdep.h"\
	".\text.h"\
	".\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	

"$(INTDIR)\rtaudio2.obj"	"$(INTDIR)\rtaudio2.sbr" : $(SOURCE) $(DEP_CPP_RTAUDI)\
 "$(INTDIR)"


!ENDIF 

SOURCE=.\timer.c

"$(INTDIR)\timer.obj"	"$(INTDIR)\timer.sbr" : $(SOURCE) "$(INTDIR)"



!ENDIF 

