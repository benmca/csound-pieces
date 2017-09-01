# Microsoft Developer Studio Generated NMAKE File, Based on consound.dsp
!IF "$(CFG)" == ""
CFG=consound - Win32 Release
!MESSAGE No configuration specified. Defaulting to consound - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "consound - Win32 Release" && "$(CFG)" !=\
 "consound - Win32 Debug" && "$(CFG)" != "consound - Win32 Release64"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "consound.mak" CFG="consound - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "consound - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "consound - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE "consound - Win32 Release64" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "consound - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\consound.exe"

!ELSE 

ALL : "$(OUTDIR)\consound.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\aops.obj"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\bbcut.obj"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\cmath.obj"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\control.obj"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\cscorfns.obj"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\dsputil.obj"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\linevent.obj"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\moog1.obj"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\mxfft.obj"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\oscbnk.obj"
	-@erase "$(INTDIR)\oscils.obj"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\physmod.obj"
	-@erase "$(INTDIR)\physutil.obj"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\pstream.obj"
	-@erase "$(INTDIR)\pvadd.obj"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\pvfileio.obj"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\pvsanal.obj"
	-@erase "$(INTDIR)\pvxanal.obj"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\rtwin32.obj"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansynx.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\sdif-mem.obj"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\shaker.obj"
	-@erase "$(INTDIR)\singwave.obj"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\soundio.obj"
	-@erase "$(INTDIR)\space.obj"
	-@erase "$(INTDIR)\spat3d.obj"
	-@erase "$(INTDIR)\Spectra.obj"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens7.obj"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vpvoc.obj"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\wineps.obj"
	-@erase "$(OUTDIR)\consound.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D\
 "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "TCKTK"\
 /Fp"$(INTDIR)\consound.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\consound.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)\consound.pdb" /machine:I386\
 /out:"$(OUTDIR)\consound.exe" 
LINK32_OBJS= \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\aops.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\bbcut.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\control.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\mxfft.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\oscbnk.obj" \
	"$(INTDIR)\oscils.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\physmod.obj" \
	"$(INTDIR)\physutil.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\pstream.obj" \
	"$(INTDIR)\pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\pvfileio.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\pvsanal.obj" \
	"$(INTDIR)\pvxanal.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\rtwin32.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\scansynx.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif-mem.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\shaker.obj" \
	"$(INTDIR)\singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\soundio.obj" \
	"$(INTDIR)\space.obj" \
	"$(INTDIR)\spat3d.obj" \
	"$(INTDIR)\Spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\Ugens7.obj" \
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
	"$(INTDIR)\Vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\wineps.obj"

"$(OUTDIR)\consound.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\consound.exe"

!ELSE 

ALL : "$(OUTDIR)\consound.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\aops.obj"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\bbcut.obj"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\cmath.obj"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\control.obj"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\cscorfns.obj"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\dsputil.obj"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\linevent.obj"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\moog1.obj"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\mxfft.obj"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\oscbnk.obj"
	-@erase "$(INTDIR)\oscils.obj"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\physmod.obj"
	-@erase "$(INTDIR)\physutil.obj"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\pstream.obj"
	-@erase "$(INTDIR)\pvadd.obj"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\pvfileio.obj"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\pvsanal.obj"
	-@erase "$(INTDIR)\pvxanal.obj"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\rtwin32.obj"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansynx.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\sdif-mem.obj"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\shaker.obj"
	-@erase "$(INTDIR)\singwave.obj"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\soundio.obj"
	-@erase "$(INTDIR)\space.obj"
	-@erase "$(INTDIR)\spat3d.obj"
	-@erase "$(INTDIR)\Spectra.obj"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens7.obj"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vpvoc.obj"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\wineps.obj"
	-@erase "$(OUTDIR)\consound.exe"
	-@erase "$(OUTDIR)\consound.ilk"
	-@erase "$(OUTDIR)\consound.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_CONSOLE"\
 /D "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D "TCLTK" /D\
 "MEMDEBUG" /Fp"$(INTDIR)\consound.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\"\
 /FD /c 
CPP_OBJS=.\Debug/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\consound.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib\
 ws2_32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)\consound.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)\consound.exe" 
LINK32_OBJS= \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\aops.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\bbcut.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\control.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\mxfft.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\oscbnk.obj" \
	"$(INTDIR)\oscils.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\physmod.obj" \
	"$(INTDIR)\physutil.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\pstream.obj" \
	"$(INTDIR)\pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\pvfileio.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\pvsanal.obj" \
	"$(INTDIR)\pvxanal.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\rtwin32.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\scansynx.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif-mem.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\shaker.obj" \
	"$(INTDIR)\singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\soundio.obj" \
	"$(INTDIR)\space.obj" \
	"$(INTDIR)\spat3d.obj" \
	"$(INTDIR)\Spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\Ugens7.obj" \
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
	"$(INTDIR)\Vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\wineps.obj"

"$(OUTDIR)\consound.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

OUTDIR=.\consound
INTDIR=.\consound
# Begin Custom Macros
OutDir=.\consound
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\consound.exe"

!ELSE 

ALL : "$(OUTDIR)\consound.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\aifc.obj"
	-@erase "$(INTDIR)\Aiff.obj"
	-@erase "$(INTDIR)\aops.obj"
	-@erase "$(INTDIR)\argdecode.obj"
	-@erase "$(INTDIR)\Auxfd.obj"
	-@erase "$(INTDIR)\babo.obj"
	-@erase "$(INTDIR)\bbcut.obj"
	-@erase "$(INTDIR)\biquad.obj"
	-@erase "$(INTDIR)\bowedbar.obj"
	-@erase "$(INTDIR)\butter.obj"
	-@erase "$(INTDIR)\cmath.obj"
	-@erase "$(INTDIR)\Complex.obj"
	-@erase "$(INTDIR)\control.obj"
	-@erase "$(INTDIR)\Cross2.obj"
	-@erase "$(INTDIR)\Cscore.obj"
	-@erase "$(INTDIR)\cscorfns.obj"
	-@erase "$(INTDIR)\Cvanal.obj"
	-@erase "$(INTDIR)\Dam.obj"
	-@erase "$(INTDIR)\dcblockr.obj"
	-@erase "$(INTDIR)\Diskin.obj"
	-@erase "$(INTDIR)\Disprep.obj"
	-@erase "$(INTDIR)\dsputil.obj"
	-@erase "$(INTDIR)\Dumpf.obj"
	-@erase "$(INTDIR)\entry1.obj"
	-@erase "$(INTDIR)\entry2.obj"
	-@erase "$(INTDIR)\Express.obj"
	-@erase "$(INTDIR)\Extract.obj"
	-@erase "$(INTDIR)\Fft.obj"
	-@erase "$(INTDIR)\Fgens.obj"
	-@erase "$(INTDIR)\Filopen.obj"
	-@erase "$(INTDIR)\Filter.obj"
	-@erase "$(INTDIR)\flanger.obj"
	-@erase "$(INTDIR)\Fm4op.obj"
	-@erase "$(INTDIR)\Follow.obj"
	-@erase "$(INTDIR)\fout.obj"
	-@erase "$(INTDIR)\getstring.obj"
	-@erase "$(INTDIR)\Grain.obj"
	-@erase "$(INTDIR)\Grain4.obj"
	-@erase "$(INTDIR)\Hetro.obj"
	-@erase "$(INTDIR)\Hrtferx.obj"
	-@erase "$(INTDIR)\Ieee80.obj"
	-@erase "$(INTDIR)\Insert.obj"
	-@erase "$(INTDIR)\linevent.obj"
	-@erase "$(INTDIR)\locsig.obj"
	-@erase "$(INTDIR)\lowpassr.obj"
	-@erase "$(INTDIR)\Lpanal.obj"
	-@erase "$(INTDIR)\Lptrkfns.obj"
	-@erase "$(INTDIR)\Main.obj"
	-@erase "$(INTDIR)\Mandolin.obj"
	-@erase "$(INTDIR)\Memalloc.obj"
	-@erase "$(INTDIR)\Memfiles.obj"
	-@erase "$(INTDIR)\Midiops.obj"
	-@erase "$(INTDIR)\Midiops2.obj"
	-@erase "$(INTDIR)\midiops3.obj"
	-@erase "$(INTDIR)\Midiout.obj"
	-@erase "$(INTDIR)\Midirecv.obj"
	-@erase "$(INTDIR)\Midisend.obj"
	-@erase "$(INTDIR)\Modal4.obj"
	-@erase "$(INTDIR)\moog1.obj"
	-@erase "$(INTDIR)\Musmon.obj"
	-@erase "$(INTDIR)\mxfft.obj"
	-@erase "$(INTDIR)\Nlfilt.obj"
	-@erase "$(INTDIR)\Oload.obj"
	-@erase "$(INTDIR)\one_file.obj"
	-@erase "$(INTDIR)\Opcode.obj"
	-@erase "$(INTDIR)\oscbnk.obj"
	-@erase "$(INTDIR)\oscils.obj"
	-@erase "$(INTDIR)\Otran.obj"
	-@erase "$(INTDIR)\phisem.obj"
	-@erase "$(INTDIR)\physmod.obj"
	-@erase "$(INTDIR)\physutil.obj"
	-@erase "$(INTDIR)\pitch.obj"
	-@erase "$(INTDIR)\Pluck.obj"
	-@erase "$(INTDIR)\pstream.obj"
	-@erase "$(INTDIR)\pvadd.obj"
	-@erase "$(INTDIR)\Pvanal.obj"
	-@erase "$(INTDIR)\pvfileio.obj"
	-@erase "$(INTDIR)\Pvinterp.obj"
	-@erase "$(INTDIR)\pvlook.obj"
	-@erase "$(INTDIR)\Pvoc.obj"
	-@erase "$(INTDIR)\pvocext.obj"
	-@erase "$(INTDIR)\Pvread.obj"
	-@erase "$(INTDIR)\pvsanal.obj"
	-@erase "$(INTDIR)\pvxanal.obj"
	-@erase "$(INTDIR)\Rdorch.obj"
	-@erase "$(INTDIR)\Rdscor.obj"
	-@erase "$(INTDIR)\Repluck.obj"
	-@erase "$(INTDIR)\rtwin32.obj"
	-@erase "$(INTDIR)\scansyn.obj"
	-@erase "$(INTDIR)\scansynx.obj"
	-@erase "$(INTDIR)\schedule.obj"
	-@erase "$(INTDIR)\Scot.obj"
	-@erase "$(INTDIR)\Scsort.obj"
	-@erase "$(INTDIR)\Scxtract.obj"
	-@erase "$(INTDIR)\sdif-mem.obj"
	-@erase "$(INTDIR)\sdif.obj"
	-@erase "$(INTDIR)\Sfheader.obj"
	-@erase "$(INTDIR)\sfont.obj"
	-@erase "$(INTDIR)\shaker.obj"
	-@erase "$(INTDIR)\singwave.obj"
	-@erase "$(INTDIR)\Sndinfo.obj"
	-@erase "$(INTDIR)\sndinfUG.obj"
	-@erase "$(INTDIR)\Sndwarp.obj"
	-@erase "$(INTDIR)\Sort.obj"
	-@erase "$(INTDIR)\Soundin.obj"
	-@erase "$(INTDIR)\soundio.obj"
	-@erase "$(INTDIR)\space.obj"
	-@erase "$(INTDIR)\spat3d.obj"
	-@erase "$(INTDIR)\Spectra.obj"
	-@erase "$(INTDIR)\Sread.obj"
	-@erase "$(INTDIR)\Swrite.obj"
	-@erase "$(INTDIR)\Twarp.obj"
	-@erase "$(INTDIR)\Ugens1.obj"
	-@erase "$(INTDIR)\Ugens2.obj"
	-@erase "$(INTDIR)\Ugens3.obj"
	-@erase "$(INTDIR)\Ugens4.obj"
	-@erase "$(INTDIR)\Ugens5.obj"
	-@erase "$(INTDIR)\Ugens6.obj"
	-@erase "$(INTDIR)\Ugens7.obj"
	-@erase "$(INTDIR)\Ugens8.obj"
	-@erase "$(INTDIR)\Ugens9.obj"
	-@erase "$(INTDIR)\Ugensa.obj"
	-@erase "$(INTDIR)\uggab.obj"
	-@erase "$(INTDIR)\ugmoss.obj"
	-@erase "$(INTDIR)\Ugrw1.obj"
	-@erase "$(INTDIR)\Ugrw2.obj"
	-@erase "$(INTDIR)\ugsc.obj"
	-@erase "$(INTDIR)\Ulaw.obj"
	-@erase "$(INTDIR)\vbap.obj"
	-@erase "$(INTDIR)\vbap_eight.obj"
	-@erase "$(INTDIR)\vbap_four.obj"
	-@erase "$(INTDIR)\vbap_sixteen.obj"
	-@erase "$(INTDIR)\vbap_zak.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\Vdelay.obj"
	-@erase "$(INTDIR)\Vpvoc.obj"
	-@erase "$(INTDIR)\Wave.obj"
	-@erase "$(INTDIR)\Wavegde.obj"
	-@erase "$(INTDIR)\Winascii.obj"
	-@erase "$(INTDIR)\Windin.obj"
	-@erase "$(INTDIR)\Window.obj"
	-@erase "$(INTDIR)\wineps.obj"
	-@erase "$(OUTDIR)\consound.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D\
 "SFIRCAM" /D "PIPES" /D "MACROS" /D "RTAUDIO" /D "MSVC" /D MYFLT=double\
 /Fp"$(INTDIR)\consound.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\consound/
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)\consound.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib\
 comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib /nologo\
 /subsystem:console /incremental:no /pdb:"$(OUTDIR)\consound.pdb" /machine:I386\
 /out:"$(OUTDIR)\consound.exe" 
LINK32_OBJS= \
	"$(INTDIR)\aifc.obj" \
	"$(INTDIR)\Aiff.obj" \
	"$(INTDIR)\aops.obj" \
	"$(INTDIR)\argdecode.obj" \
	"$(INTDIR)\Auxfd.obj" \
	"$(INTDIR)\babo.obj" \
	"$(INTDIR)\bbcut.obj" \
	"$(INTDIR)\biquad.obj" \
	"$(INTDIR)\bowedbar.obj" \
	"$(INTDIR)\butter.obj" \
	"$(INTDIR)\cmath.obj" \
	"$(INTDIR)\Complex.obj" \
	"$(INTDIR)\control.obj" \
	"$(INTDIR)\Cross2.obj" \
	"$(INTDIR)\Cscore.obj" \
	"$(INTDIR)\cscorfns.obj" \
	"$(INTDIR)\Cvanal.obj" \
	"$(INTDIR)\Dam.obj" \
	"$(INTDIR)\dcblockr.obj" \
	"$(INTDIR)\Diskin.obj" \
	"$(INTDIR)\Disprep.obj" \
	"$(INTDIR)\dsputil.obj" \
	"$(INTDIR)\Dumpf.obj" \
	"$(INTDIR)\entry1.obj" \
	"$(INTDIR)\entry2.obj" \
	"$(INTDIR)\Express.obj" \
	"$(INTDIR)\Extract.obj" \
	"$(INTDIR)\Fft.obj" \
	"$(INTDIR)\Fgens.obj" \
	"$(INTDIR)\Filopen.obj" \
	"$(INTDIR)\Filter.obj" \
	"$(INTDIR)\flanger.obj" \
	"$(INTDIR)\Fm4op.obj" \
	"$(INTDIR)\Follow.obj" \
	"$(INTDIR)\fout.obj" \
	"$(INTDIR)\getstring.obj" \
	"$(INTDIR)\Grain.obj" \
	"$(INTDIR)\Grain4.obj" \
	"$(INTDIR)\Hetro.obj" \
	"$(INTDIR)\Hrtferx.obj" \
	"$(INTDIR)\Ieee80.obj" \
	"$(INTDIR)\Insert.obj" \
	"$(INTDIR)\linevent.obj" \
	"$(INTDIR)\locsig.obj" \
	"$(INTDIR)\lowpassr.obj" \
	"$(INTDIR)\Lpanal.obj" \
	"$(INTDIR)\Lptrkfns.obj" \
	"$(INTDIR)\Main.obj" \
	"$(INTDIR)\Mandolin.obj" \
	"$(INTDIR)\Memalloc.obj" \
	"$(INTDIR)\Memfiles.obj" \
	"$(INTDIR)\Midiops.obj" \
	"$(INTDIR)\Midiops2.obj" \
	"$(INTDIR)\midiops3.obj" \
	"$(INTDIR)\Midiout.obj" \
	"$(INTDIR)\Midirecv.obj" \
	"$(INTDIR)\Midisend.obj" \
	"$(INTDIR)\Modal4.obj" \
	"$(INTDIR)\moog1.obj" \
	"$(INTDIR)\Musmon.obj" \
	"$(INTDIR)\mxfft.obj" \
	"$(INTDIR)\Nlfilt.obj" \
	"$(INTDIR)\Oload.obj" \
	"$(INTDIR)\one_file.obj" \
	"$(INTDIR)\Opcode.obj" \
	"$(INTDIR)\oscbnk.obj" \
	"$(INTDIR)\oscils.obj" \
	"$(INTDIR)\Otran.obj" \
	"$(INTDIR)\phisem.obj" \
	"$(INTDIR)\physmod.obj" \
	"$(INTDIR)\physutil.obj" \
	"$(INTDIR)\pitch.obj" \
	"$(INTDIR)\Pluck.obj" \
	"$(INTDIR)\pstream.obj" \
	"$(INTDIR)\pvadd.obj" \
	"$(INTDIR)\Pvanal.obj" \
	"$(INTDIR)\pvfileio.obj" \
	"$(INTDIR)\Pvinterp.obj" \
	"$(INTDIR)\pvlook.obj" \
	"$(INTDIR)\Pvoc.obj" \
	"$(INTDIR)\pvocext.obj" \
	"$(INTDIR)\Pvread.obj" \
	"$(INTDIR)\pvsanal.obj" \
	"$(INTDIR)\pvxanal.obj" \
	"$(INTDIR)\Rdorch.obj" \
	"$(INTDIR)\Rdscor.obj" \
	"$(INTDIR)\Repluck.obj" \
	"$(INTDIR)\rtwin32.obj" \
	"$(INTDIR)\scansyn.obj" \
	"$(INTDIR)\scansynx.obj" \
	"$(INTDIR)\schedule.obj" \
	"$(INTDIR)\Scot.obj" \
	"$(INTDIR)\Scsort.obj" \
	"$(INTDIR)\Scxtract.obj" \
	"$(INTDIR)\sdif-mem.obj" \
	"$(INTDIR)\sdif.obj" \
	"$(INTDIR)\Sfheader.obj" \
	"$(INTDIR)\sfont.obj" \
	"$(INTDIR)\shaker.obj" \
	"$(INTDIR)\singwave.obj" \
	"$(INTDIR)\Sndinfo.obj" \
	"$(INTDIR)\sndinfUG.obj" \
	"$(INTDIR)\Sndwarp.obj" \
	"$(INTDIR)\Sort.obj" \
	"$(INTDIR)\Soundin.obj" \
	"$(INTDIR)\soundio.obj" \
	"$(INTDIR)\space.obj" \
	"$(INTDIR)\spat3d.obj" \
	"$(INTDIR)\Spectra.obj" \
	"$(INTDIR)\Sread.obj" \
	"$(INTDIR)\Swrite.obj" \
	"$(INTDIR)\Twarp.obj" \
	"$(INTDIR)\Ugens1.obj" \
	"$(INTDIR)\Ugens2.obj" \
	"$(INTDIR)\Ugens3.obj" \
	"$(INTDIR)\Ugens4.obj" \
	"$(INTDIR)\Ugens5.obj" \
	"$(INTDIR)\Ugens6.obj" \
	"$(INTDIR)\Ugens7.obj" \
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
	"$(INTDIR)\Vpvoc.obj" \
	"$(INTDIR)\Wave.obj" \
	"$(INTDIR)\Wavegde.obj" \
	"$(INTDIR)\Winascii.obj" \
	"$(INTDIR)\Windin.obj" \
	"$(INTDIR)\Window.obj" \
	"$(INTDIR)\wineps.obj"

"$(OUTDIR)\consound.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "consound - Win32 Release" || "$(CFG)" ==\
 "consound - Win32 Debug" || "$(CFG)" == "consound - Win32 Release64"
SOURCE=..\csound\aifc.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_AIFC_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aifc.obj" : $(SOURCE) $(DEP_CPP_AIFC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_AIFC_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aifc.obj" : $(SOURCE) $(DEP_CPP_AIFC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_AIFC_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aifc.obj" : $(SOURCE) $(DEP_CPP_AIFC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Aiff.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_AIFF_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Aiff.obj" : $(SOURCE) $(DEP_CPP_AIFF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_AIFF_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Aiff.obj" : $(SOURCE) $(DEP_CPP_AIFF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_AIFF_=\
	"..\csound\aiff.h"\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Aiff.obj" : $(SOURCE) $(DEP_CPP_AIFF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\aops.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_AOPS_=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aops.obj" : $(SOURCE) $(DEP_CPP_AOPS_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_AOPS_=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aops.obj" : $(SOURCE) $(DEP_CPP_AOPS_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_AOPS_=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\aops.obj" : $(SOURCE) $(DEP_CPP_AOPS_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\argdecode.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_ARGDE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\argdecode.obj" : $(SOURCE) $(DEP_CPP_ARGDE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_ARGDE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\argdecode.obj" : $(SOURCE) $(DEP_CPP_ARGDE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_ARGDE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\argdecode.obj" : $(SOURCE) $(DEP_CPP_ARGDE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Auxfd.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_AUXFD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Auxfd.obj" : $(SOURCE) $(DEP_CPP_AUXFD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_AUXFD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Auxfd.obj" : $(SOURCE) $(DEP_CPP_AUXFD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_AUXFD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Auxfd.obj" : $(SOURCE) $(DEP_CPP_AUXFD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\babo.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_BABO_=\
	"..\csound\babo.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\babo.obj" : $(SOURCE) $(DEP_CPP_BABO_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_BABO_=\
	"..\csound\babo.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\babo.obj" : $(SOURCE) $(DEP_CPP_BABO_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_BABO_=\
	"..\csound\babo.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\babo.obj" : $(SOURCE) $(DEP_CPP_BABO_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\bbcut.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_BBCUT=\
	"..\csound\bbcut.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bbcut.obj" : $(SOURCE) $(DEP_CPP_BBCUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_BBCUT=\
	"..\csound\bbcut.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bbcut.obj" : $(SOURCE) $(DEP_CPP_BBCUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_BBCUT=\
	"..\csound\bbcut.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bbcut.obj" : $(SOURCE) $(DEP_CPP_BBCUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\biquad.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_BIQUA=\
	"..\csound\biquad.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\biquad.obj" : $(SOURCE) $(DEP_CPP_BIQUA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_BIQUA=\
	"..\csound\biquad.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\biquad.obj" : $(SOURCE) $(DEP_CPP_BIQUA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_BIQUA=\
	"..\csound\biquad.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\biquad.obj" : $(SOURCE) $(DEP_CPP_BIQUA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\bowedbar.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_BOWED=\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bowedbar.obj" : $(SOURCE) $(DEP_CPP_BOWED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_BOWED=\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bowedbar.obj" : $(SOURCE) $(DEP_CPP_BOWED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_BOWED=\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\bowedbar.obj" : $(SOURCE) $(DEP_CPP_BOWED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\butter.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_BUTTE=\
	"..\csound\butter.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\butter.obj" : $(SOURCE) $(DEP_CPP_BUTTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_BUTTE=\
	"..\csound\butter.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\butter.obj" : $(SOURCE) $(DEP_CPP_BUTTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_BUTTE=\
	"..\csound\butter.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\butter.obj" : $(SOURCE) $(DEP_CPP_BUTTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\cmath.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CMATH=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cmath.obj" : $(SOURCE) $(DEP_CPP_CMATH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CMATH=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cmath.obj" : $(SOURCE) $(DEP_CPP_CMATH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CMATH=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cmath.obj" : $(SOURCE) $(DEP_CPP_CMATH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Complex.c

"$(INTDIR)\Complex.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\csound\control.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CONTR=\
	"..\csound\control.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\control.obj" : $(SOURCE) $(DEP_CPP_CONTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CONTR=\
	"..\csound\control.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\control.obj" : $(SOURCE) $(DEP_CPP_CONTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CONTR=\
	"..\csound\control.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\control.obj" : $(SOURCE) $(DEP_CPP_CONTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Cross2.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CROSS=\
	"..\csound\cs.h"\
	"..\csound\fhtfun.h"\
	"..\csound\prototyp.h"\
	"..\csound\ptrigtbl.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cross2.obj" : $(SOURCE) $(DEP_CPP_CROSS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CROSS=\
	"..\csound\cs.h"\
	"..\csound\fhtfun.h"\
	"..\csound\prototyp.h"\
	"..\csound\ptrigtbl.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cross2.obj" : $(SOURCE) $(DEP_CPP_CROSS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CROSS=\
	"..\csound\cs.h"\
	"..\csound\fhtfun.h"\
	"..\csound\prototyp.h"\
	"..\csound\ptrigtbl.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cross2.obj" : $(SOURCE) $(DEP_CPP_CROSS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Cscore.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CSCOR=\
	"..\csound\cscore.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\Cscore.obj" : $(SOURCE) $(DEP_CPP_CSCOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CSCOR=\
	"..\csound\cscore.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\Cscore.obj" : $(SOURCE) $(DEP_CPP_CSCOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CSCOR=\
	"..\csound\cscore.h"\
	

"$(INTDIR)\Cscore.obj" : $(SOURCE) $(DEP_CPP_CSCOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\cscorfns.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CSCORF=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cscorfns.obj" : $(SOURCE) $(DEP_CPP_CSCORF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CSCORF=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cscorfns.obj" : $(SOURCE) $(DEP_CPP_CSCORF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CSCORF=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\cscorfns.obj" : $(SOURCE) $(DEP_CPP_CSCORF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Cvanal.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_CVANA=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cvanal.obj" : $(SOURCE) $(DEP_CPP_CVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_CVANA=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cvanal.obj" : $(SOURCE) $(DEP_CPP_CVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_CVANA=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Cvanal.obj" : $(SOURCE) $(DEP_CPP_CVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Dam.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DAM_C=\
	"..\csound\cs.h"\
	"..\csound\dam.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dam.obj" : $(SOURCE) $(DEP_CPP_DAM_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DAM_C=\
	"..\csound\cs.h"\
	"..\csound\dam.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dam.obj" : $(SOURCE) $(DEP_CPP_DAM_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DAM_C=\
	"..\csound\cs.h"\
	"..\csound\dam.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dam.obj" : $(SOURCE) $(DEP_CPP_DAM_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\dcblockr.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DCBLO=\
	"..\csound\cs.h"\
	"..\csound\dcblockr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\dcblockr.obj" : $(SOURCE) $(DEP_CPP_DCBLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DCBLO=\
	"..\csound\cs.h"\
	"..\csound\dcblockr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\dcblockr.obj" : $(SOURCE) $(DEP_CPP_DCBLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DCBLO=\
	"..\csound\cs.h"\
	"..\csound\dcblockr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\dcblockr.obj" : $(SOURCE) $(DEP_CPP_DCBLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Diskin.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DISKI=\
	"..\csound\cs.h"\
	"..\csound\diskin.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Diskin.obj" : $(SOURCE) $(DEP_CPP_DISKI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DISKI=\
	"..\csound\cs.h"\
	"..\csound\diskin.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Diskin.obj" : $(SOURCE) $(DEP_CPP_DISKI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DISKI=\
	"..\csound\cs.h"\
	"..\csound\diskin.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Diskin.obj" : $(SOURCE) $(DEP_CPP_DISKI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Disprep.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DISPR=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Disprep.obj" : $(SOURCE) $(DEP_CPP_DISPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DISPR=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Disprep.obj" : $(SOURCE) $(DEP_CPP_DISPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DISPR=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Disprep.obj" : $(SOURCE) $(DEP_CPP_DISPR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\dsputil.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DSPUT=\
	"..\csound\dpwelib.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\dsputil.obj" : $(SOURCE) $(DEP_CPP_DSPUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DSPUT=\
	"..\csound\dpwelib.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\dsputil.obj" : $(SOURCE) $(DEP_CPP_DSPUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DSPUT=\
	"..\csound\dpwelib.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\dsputil.obj" : $(SOURCE) $(DEP_CPP_DSPUT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Dumpf.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_DUMPF=\
	"..\csound\cs.h"\
	"..\csound\dumpf.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dumpf.obj" : $(SOURCE) $(DEP_CPP_DUMPF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_DUMPF=\
	"..\csound\cs.h"\
	"..\csound\dumpf.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dumpf.obj" : $(SOURCE) $(DEP_CPP_DUMPF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_DUMPF=\
	"..\csound\cs.h"\
	"..\csound\dumpf.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Dumpf.obj" : $(SOURCE) $(DEP_CPP_DUMPF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\entry1.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_ENTRY=\
	"..\csound\3dug.h"\
	"..\csound\aops.h"\
	"..\csound\biquad.h"\
	"..\csound\butter.h"\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dam.h"\
	"..\csound\diskin.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\dumpf.h"\
	"..\csound\fhtfun.h"\
	"..\csound\filter.h"\
	"..\csound\flanger.h"\
	"..\csound\follow.h"\
	"..\csound\fout.h"\
	"..\csound\ftgen.h"\
	"..\csound\grain.h"\
	"..\csound\grain4.h"\
	"..\csound\hrtferx.h"\
	"..\csound\insert.h"\
	"..\csound\locsig.h"\
	"..\csound\lowpassr.h"\
	"..\csound\lpc.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops2.h"\
	"..\csound\midiops3.h"\
	"..\csound\midiout.h"\
	"..\csound\oload.h"\
	"..\csound\pitch.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvread.h"\
	"..\csound\sf.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sndinfug.h"\
	"..\csound\sndwarp.h"\
	"..\csound\soundio.h"\
	"..\csound\space.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\ugens3.h"\
	"..\csound\ugens4.h"\
	"..\csound\ugens5.h"\
	"..\csound\ugens6.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugens8.h"\
	"..\csound\ugens9.h"\
	"..\csound\ugensa.h"\
	"..\csound\uggab.h"\
	"..\csound\ugrw1.h"\
	"..\csound\ugrw2.h"\
	"..\csound\ugsc.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	"..\csound\wavegde.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\entry1.obj" : $(SOURCE) $(DEP_CPP_ENTRY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_ENTRY=\
	"..\csound\3dug.h"\
	"..\csound\aops.h"\
	"..\csound\biquad.h"\
	"..\csound\butter.h"\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dam.h"\
	"..\csound\diskin.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\dumpf.h"\
	"..\csound\fhtfun.h"\
	"..\csound\filter.h"\
	"..\csound\flanger.h"\
	"..\csound\follow.h"\
	"..\csound\fout.h"\
	"..\csound\ftgen.h"\
	"..\csound\grain.h"\
	"..\csound\grain4.h"\
	"..\csound\hrtferx.h"\
	"..\csound\insert.h"\
	"..\csound\locsig.h"\
	"..\csound\lowpassr.h"\
	"..\csound\lpc.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops2.h"\
	"..\csound\midiops3.h"\
	"..\csound\midiout.h"\
	"..\csound\oload.h"\
	"..\csound\pitch.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvread.h"\
	"..\csound\sf.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sndinfug.h"\
	"..\csound\sndwarp.h"\
	"..\csound\soundio.h"\
	"..\csound\space.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\ugens3.h"\
	"..\csound\ugens4.h"\
	"..\csound\ugens5.h"\
	"..\csound\ugens6.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugens8.h"\
	"..\csound\ugens9.h"\
	"..\csound\ugensa.h"\
	"..\csound\uggab.h"\
	"..\csound\ugrw1.h"\
	"..\csound\ugrw2.h"\
	"..\csound\ugsc.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	"..\csound\wavegde.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\entry1.obj" : $(SOURCE) $(DEP_CPP_ENTRY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_ENTRY=\
	"..\csound\3dug.h"\
	"..\csound\aops.h"\
	"..\csound\biquad.h"\
	"..\csound\butter.h"\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dam.h"\
	"..\csound\diskin.h"\
	"..\csound\disprep.h"\
	"..\csound\dsputil.h"\
	"..\csound\dumpf.h"\
	"..\csound\fhtfun.h"\
	"..\csound\filter.h"\
	"..\csound\flanger.h"\
	"..\csound\follow.h"\
	"..\csound\fout.h"\
	"..\csound\ftgen.h"\
	"..\csound\grain.h"\
	"..\csound\grain4.h"\
	"..\csound\hrtferx.h"\
	"..\csound\insert.h"\
	"..\csound\locsig.h"\
	"..\csound\lowpassr.h"\
	"..\csound\lpc.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops2.h"\
	"..\csound\midiops3.h"\
	"..\csound\midiout.h"\
	"..\csound\oload.h"\
	"..\csound\pitch.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvread.h"\
	"..\csound\sf.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sndinfug.h"\
	"..\csound\sndwarp.h"\
	"..\csound\soundio.h"\
	"..\csound\space.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\ugens3.h"\
	"..\csound\ugens4.h"\
	"..\csound\ugens5.h"\
	"..\csound\ugens6.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugens8.h"\
	"..\csound\ugens9.h"\
	"..\csound\ugensa.h"\
	"..\csound\uggab.h"\
	"..\csound\ugrw1.h"\
	"..\csound\ugrw2.h"\
	"..\csound\ugsc.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	"..\csound\wavegde.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\entry1.obj" : $(SOURCE) $(DEP_CPP_ENTRY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\entry2.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_ENTRY2=\
	"..\csound\aops.h"\
	"..\csound\babo.h"\
	"..\csound\bbcut.h"\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dcblockr.h"\
	"..\csound\fhtfun.h"\
	"..\csound\flanger.h"\
	"..\csound\flute.h"\
	"..\csound\fm4op.h"\
	"..\csound\insert.h"\
	"..\csound\lowpassr.h"\
	"..\csound\mandolin.h"\
	"..\csound\marimba.h"\
	"..\csound\midiops.h"\
	"..\csound\modal4.h"\
	"..\csound\moog1.h"\
	"..\csound\nlfilt.h"\
	"..\csound\oscbnk.h"\
	"..\csound\oscils.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\repluck.h"\
	"..\csound\scansyn.h"\
	"..\csound\scansynx.h"\
	"..\csound\schedule.h"\
	"..\csound\shaker.h"\
	"..\csound\singwave.h"\
	"..\csound\spat3d.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\ugmoss.h"\
	"..\csound\vbap.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\entry2.obj" : $(SOURCE) $(DEP_CPP_ENTRY2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_ENTRY2=\
	"..\csound\aops.h"\
	"..\csound\babo.h"\
	"..\csound\bbcut.h"\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\control.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dcblockr.h"\
	"..\csound\fhtfun.h"\
	"..\csound\flanger.h"\
	"..\csound\flute.h"\
	"..\csound\fm4op.h"\
	"..\csound\insert.h"\
	"..\csound\lowpassr.h"\
	"..\csound\mandolin.h"\
	"..\csound\marimba.h"\
	"..\csound\modal4.h"\
	"..\csound\moog1.h"\
	"..\csound\nlfilt.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\repluck.h"\
	"..\csound\scansyn.h"\
	"..\csound\schedule.h"\
	"..\csound\shaker.h"\
	"..\csound\singwave.h"\
	"..\csound\spat3d.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\ugmoss.h"\
	"..\csound\vbap.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\entry2.obj" : $(SOURCE) $(DEP_CPP_ENTRY2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_ENTRY2=\
	"..\csound\aops.h"\
	"..\csound\babo.h"\
	"..\csound\bbcut.h"\
	"..\csound\bowed.h"\
	"..\csound\bowedbar.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dcblockr.h"\
	"..\csound\fhtfun.h"\
	"..\csound\flanger.h"\
	"..\csound\flute.h"\
	"..\csound\fm4op.h"\
	"..\csound\insert.h"\
	"..\csound\lowpassr.h"\
	"..\csound\mandolin.h"\
	"..\csound\marimba.h"\
	"..\csound\midiops.h"\
	"..\csound\modal4.h"\
	"..\csound\moog1.h"\
	"..\csound\nlfilt.h"\
	"..\csound\oscbnk.h"\
	"..\csound\oscils.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\repluck.h"\
	"..\csound\scansyn.h"\
	"..\csound\scansynx.h"\
	"..\csound\schedule.h"\
	"..\csound\shaker.h"\
	"..\csound\singwave.h"\
	"..\csound\spat3d.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\ugmoss.h"\
	"..\csound\vbap.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\entry2.obj" : $(SOURCE) $(DEP_CPP_ENTRY2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Express.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_EXPRE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Express.obj" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_EXPRE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Express.obj" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_EXPRE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Express.obj" : $(SOURCE) $(DEP_CPP_EXPRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Extract.c
DEP_CPP_EXTRA=\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\Extract.obj" : $(SOURCE) $(DEP_CPP_EXTRA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\csound\Fft.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FFT_C=\
	"..\csound\cs.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fft.obj" : $(SOURCE) $(DEP_CPP_FFT_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FFT_C=\
	"..\csound\cs.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fft.obj" : $(SOURCE) $(DEP_CPP_FFT_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FFT_C=\
	"..\csound\cs.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fft.obj" : $(SOURCE) $(DEP_CPP_FFT_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Fgens.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FGENS=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\fft.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fgens.obj" : $(SOURCE) $(DEP_CPP_FGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FGENS=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fgens.obj" : $(SOURCE) $(DEP_CPP_FGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FGENS=\
	"..\csound\cmath.h"\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\fft.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fgens.obj" : $(SOURCE) $(DEP_CPP_FGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Filopen.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FILOP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filopen.obj" : $(SOURCE) $(DEP_CPP_FILOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FILOP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filopen.obj" : $(SOURCE) $(DEP_CPP_FILOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FILOP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filopen.obj" : $(SOURCE) $(DEP_CPP_FILOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Filter.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FILTE=\
	"..\csound\complex.h"\
	"..\csound\cs.h"\
	"..\csound\filter.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filter.obj" : $(SOURCE) $(DEP_CPP_FILTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FILTE=\
	"..\csound\complex.h"\
	"..\csound\cs.h"\
	"..\csound\filter.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filter.obj" : $(SOURCE) $(DEP_CPP_FILTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FILTE=\
	"..\csound\complex.h"\
	"..\csound\cs.h"\
	"..\csound\filter.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Filter.obj" : $(SOURCE) $(DEP_CPP_FILTE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\flanger.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FLANG=\
	"..\csound\cs.h"\
	"..\csound\flanger.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\flanger.obj" : $(SOURCE) $(DEP_CPP_FLANG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FLANG=\
	"..\csound\cs.h"\
	"..\csound\flanger.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\flanger.obj" : $(SOURCE) $(DEP_CPP_FLANG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FLANG=\
	"..\csound\cs.h"\
	"..\csound\flanger.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\flanger.obj" : $(SOURCE) $(DEP_CPP_FLANG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Fm4op.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FM4OP=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fm4op.obj" : $(SOURCE) $(DEP_CPP_FM4OP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FM4OP=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fm4op.obj" : $(SOURCE) $(DEP_CPP_FM4OP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FM4OP=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Fm4op.obj" : $(SOURCE) $(DEP_CPP_FM4OP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Follow.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FOLLO=\
	"..\csound\cs.h"\
	"..\csound\follow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Follow.obj" : $(SOURCE) $(DEP_CPP_FOLLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FOLLO=\
	"..\csound\cs.h"\
	"..\csound\follow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Follow.obj" : $(SOURCE) $(DEP_CPP_FOLLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FOLLO=\
	"..\csound\cs.h"\
	"..\csound\follow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Follow.obj" : $(SOURCE) $(DEP_CPP_FOLLO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\fout.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_FOUT_=\
	"..\csound\cs.h"\
	"..\csound\fout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\fout.obj" : $(SOURCE) $(DEP_CPP_FOUT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_FOUT_=\
	"..\csound\cs.h"\
	"..\csound\fout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\fout.obj" : $(SOURCE) $(DEP_CPP_FOUT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_FOUT_=\
	"..\csound\cs.h"\
	"..\csound\fout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\fout.obj" : $(SOURCE) $(DEP_CPP_FOUT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\getstring.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_GETST=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\getstring.obj" : $(SOURCE) $(DEP_CPP_GETST) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_GETST=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\getstring.obj" : $(SOURCE) $(DEP_CPP_GETST) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_GETST=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\getstring.obj" : $(SOURCE) $(DEP_CPP_GETST) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Grain.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_GRAIN=\
	"..\csound\cs.h"\
	"..\csound\grain.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain.obj" : $(SOURCE) $(DEP_CPP_GRAIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_GRAIN=\
	"..\csound\cs.h"\
	"..\csound\grain.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain.obj" : $(SOURCE) $(DEP_CPP_GRAIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_GRAIN=\
	"..\csound\cs.h"\
	"..\csound\grain.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain.obj" : $(SOURCE) $(DEP_CPP_GRAIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Grain4.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_GRAIN4=\
	"..\csound\cs.h"\
	"..\csound\grain4.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain4.obj" : $(SOURCE) $(DEP_CPP_GRAIN4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_GRAIN4=\
	"..\csound\cs.h"\
	"..\csound\grain4.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain4.obj" : $(SOURCE) $(DEP_CPP_GRAIN4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_GRAIN4=\
	"..\csound\cs.h"\
	"..\csound\grain4.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Grain4.obj" : $(SOURCE) $(DEP_CPP_GRAIN4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Hetro.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_HETRO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hetro.obj" : $(SOURCE) $(DEP_CPP_HETRO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_HETRO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hetro.obj" : $(SOURCE) $(DEP_CPP_HETRO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_HETRO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hetro.obj" : $(SOURCE) $(DEP_CPP_HETRO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Hrtferx.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_HRTFE=\
	"..\csound\3dug.h"\
	"..\csound\cs.h"\
	"..\csound\hrtferx.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hrtferx.obj" : $(SOURCE) $(DEP_CPP_HRTFE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_HRTFE=\
	"..\csound\3dug.h"\
	"..\csound\cs.h"\
	"..\csound\hrtferx.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hrtferx.obj" : $(SOURCE) $(DEP_CPP_HRTFE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_HRTFE=\
	"..\csound\3dug.h"\
	"..\csound\cs.h"\
	"..\csound\hrtferx.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Hrtferx.obj" : $(SOURCE) $(DEP_CPP_HRTFE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ieee80.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_IEEE8=\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ieee80.obj" : $(SOURCE) $(DEP_CPP_IEEE8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_IEEE8=\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ieee80.obj" : $(SOURCE) $(DEP_CPP_IEEE8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_IEEE8=\
	"..\csound\cs.h"\
	"..\csound\ieee80.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ieee80.obj" : $(SOURCE) $(DEP_CPP_IEEE8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Insert.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_INSER=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\insert.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Insert.obj" : $(SOURCE) $(DEP_CPP_INSER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_INSER=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\insert.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Insert.obj" : $(SOURCE) $(DEP_CPP_INSER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_INSER=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\insert.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Insert.obj" : $(SOURCE) $(DEP_CPP_INSER) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\linevent.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_LINEV=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\linevent.obj" : $(SOURCE) $(DEP_CPP_LINEV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_LINEV=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\linevent.obj" : $(SOURCE) $(DEP_CPP_LINEV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_LINEV=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\linevent.obj" : $(SOURCE) $(DEP_CPP_LINEV) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\locsig.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_LOCSI=\
	"..\csound\cs.h"\
	"..\csound\locsig.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\locsig.obj" : $(SOURCE) $(DEP_CPP_LOCSI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_LOCSI=\
	"..\csound\cs.h"\
	"..\csound\locsig.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\locsig.obj" : $(SOURCE) $(DEP_CPP_LOCSI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_LOCSI=\
	"..\csound\cs.h"\
	"..\csound\locsig.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\locsig.obj" : $(SOURCE) $(DEP_CPP_LOCSI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\lowpassr.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_LOWPA=\
	"..\csound\cs.h"\
	"..\csound\lowpassr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\lowpassr.obj" : $(SOURCE) $(DEP_CPP_LOWPA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_LOWPA=\
	"..\csound\cs.h"\
	"..\csound\lowpassr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\lowpassr.obj" : $(SOURCE) $(DEP_CPP_LOWPA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_LOWPA=\
	"..\csound\cs.h"\
	"..\csound\lowpassr.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\lowpassr.obj" : $(SOURCE) $(DEP_CPP_LOWPA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Lpanal.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_LPANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lpanal.obj" : $(SOURCE) $(DEP_CPP_LPANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_LPANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lpanal.obj" : $(SOURCE) $(DEP_CPP_LPANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_LPANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lpanal.obj" : $(SOURCE) $(DEP_CPP_LPANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Lptrkfns.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_LPTRK=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lptrkfns.obj" : $(SOURCE) $(DEP_CPP_LPTRK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_LPTRK=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lptrkfns.obj" : $(SOURCE) $(DEP_CPP_LPTRK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_LPTRK=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Lptrkfns.obj" : $(SOURCE) $(DEP_CPP_LPTRK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Main.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MAIN_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Main.obj" : $(SOURCE) $(DEP_CPP_MAIN_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MAIN_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Main.obj" : $(SOURCE) $(DEP_CPP_MAIN_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MAIN_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Main.obj" : $(SOURCE) $(DEP_CPP_MAIN_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Mandolin.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MANDO=\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\mandolin.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Mandolin.obj" : $(SOURCE) $(DEP_CPP_MANDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MANDO=\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\mandolin.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Mandolin.obj" : $(SOURCE) $(DEP_CPP_MANDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MANDO=\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\mandolin.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Mandolin.obj" : $(SOURCE) $(DEP_CPP_MANDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Memalloc.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MEMAL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memalloc.obj" : $(SOURCE) $(DEP_CPP_MEMAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MEMAL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memalloc.obj" : $(SOURCE) $(DEP_CPP_MEMAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MEMAL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memalloc.obj" : $(SOURCE) $(DEP_CPP_MEMAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Memfiles.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MEMFI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memfiles.obj" : $(SOURCE) $(DEP_CPP_MEMFI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MEMFI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memfiles.obj" : $(SOURCE) $(DEP_CPP_MEMFI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MEMFI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Memfiles.obj" : $(SOURCE) $(DEP_CPP_MEMFI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Midiops.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIO=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops.obj" : $(SOURCE) $(DEP_CPP_MIDIO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIO=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops.obj" : $(SOURCE) $(DEP_CPP_MIDIO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIO=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops.obj" : $(SOURCE) $(DEP_CPP_MIDIO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Midiops2.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIOP=\
	"..\csound\cs.h"\
	"..\csound\midiops2.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops2.obj" : $(SOURCE) $(DEP_CPP_MIDIOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIOP=\
	"..\csound\cs.h"\
	"..\csound\midiops2.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops2.obj" : $(SOURCE) $(DEP_CPP_MIDIOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIOP=\
	"..\csound\cs.h"\
	"..\csound\midiops2.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiops2.obj" : $(SOURCE) $(DEP_CPP_MIDIOP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\midiops3.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIOPS=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops3.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\midiops3.obj" : $(SOURCE) $(DEP_CPP_MIDIOPS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIOPS=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops3.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\midiops3.obj" : $(SOURCE) $(DEP_CPP_MIDIOPS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIOPS=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\midiops3.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\midiops3.obj" : $(SOURCE) $(DEP_CPP_MIDIOPS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Midiout.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIOU=\
	"..\csound\cs.h"\
	"..\csound\midiout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiout.obj" : $(SOURCE) $(DEP_CPP_MIDIOU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIOU=\
	"..\csound\cs.h"\
	"..\csound\midiout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiout.obj" : $(SOURCE) $(DEP_CPP_MIDIOU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIOU=\
	"..\csound\cs.h"\
	"..\csound\midiout.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midiout.obj" : $(SOURCE) $(DEP_CPP_MIDIOU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Midirecv.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIR=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midirecv.obj" : $(SOURCE) $(DEP_CPP_MIDIR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIR=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midirecv.obj" : $(SOURCE) $(DEP_CPP_MIDIR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIR=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midirecv.obj" : $(SOURCE) $(DEP_CPP_MIDIR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Midisend.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MIDIS=\
	"..\csound\cs.h"\
	"..\csound\midioops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midisend.obj" : $(SOURCE) $(DEP_CPP_MIDIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MIDIS=\
	"..\csound\cs.h"\
	"..\csound\midioops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midisend.obj" : $(SOURCE) $(DEP_CPP_MIDIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MIDIS=\
	"..\csound\cs.h"\
	"..\csound\midioops.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Midisend.obj" : $(SOURCE) $(DEP_CPP_MIDIS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Modal4.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MODAL=\
	"..\csound\cs.h"\
	"..\csound\marimba.h"\
	"..\csound\modal4.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj" : $(SOURCE) $(DEP_CPP_MODAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MODAL=\
	"..\csound\cs.h"\
	"..\csound\marimba.h"\
	"..\csound\modal4.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj" : $(SOURCE) $(DEP_CPP_MODAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MODAL=\
	"..\csound\cs.h"\
	"..\csound\marimba.h"\
	"..\csound\modal4.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\vibraphn.h"\
	

"$(INTDIR)\Modal4.obj" : $(SOURCE) $(DEP_CPP_MODAL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\moog1.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MOOG1=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\moog1.obj" : $(SOURCE) $(DEP_CPP_MOOG1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MOOG1=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\moog1.obj" : $(SOURCE) $(DEP_CPP_MOOG1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MOOG1=\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\moog1.obj" : $(SOURCE) $(DEP_CPP_MOOG1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Musmon.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MUSMO=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Musmon.obj" : $(SOURCE) $(DEP_CPP_MUSMO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MUSMO=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Musmon.obj" : $(SOURCE) $(DEP_CPP_MUSMO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MUSMO=\
	"..\csound\cs.h"\
	"..\csound\cscore.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Musmon.obj" : $(SOURCE) $(DEP_CPP_MUSMO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\mxfft.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_MXFFT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\mxfft.obj" : $(SOURCE) $(DEP_CPP_MXFFT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_MXFFT=\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	

"$(INTDIR)\mxfft.obj" : $(SOURCE) $(DEP_CPP_MXFFT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_MXFFT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\mxfft.obj" : $(SOURCE) $(DEP_CPP_MXFFT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Nlfilt.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_NLFIL=\
	"..\csound\cs.h"\
	"..\csound\nlfilt.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Nlfilt.obj" : $(SOURCE) $(DEP_CPP_NLFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_NLFIL=\
	"..\csound\cs.h"\
	"..\csound\nlfilt.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Nlfilt.obj" : $(SOURCE) $(DEP_CPP_NLFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_NLFIL=\
	"..\csound\cs.h"\
	"..\csound\nlfilt.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Nlfilt.obj" : $(SOURCE) $(DEP_CPP_NLFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Oload.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_OLOAD=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Oload.obj" : $(SOURCE) $(DEP_CPP_OLOAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_OLOAD=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Oload.obj" : $(SOURCE) $(DEP_CPP_OLOAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_OLOAD=\
	"..\csound\cs.h"\
	"..\csound\midiops.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Oload.obj" : $(SOURCE) $(DEP_CPP_OLOAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\one_file.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_ONE_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\one_file.obj" : $(SOURCE) $(DEP_CPP_ONE_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_ONE_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\one_file.obj" : $(SOURCE) $(DEP_CPP_ONE_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_ONE_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\one_file.obj" : $(SOURCE) $(DEP_CPP_ONE_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Opcode.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_OPCOD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Opcode.obj" : $(SOURCE) $(DEP_CPP_OPCOD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_OPCOD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Opcode.obj" : $(SOURCE) $(DEP_CPP_OPCOD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_OPCOD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Opcode.obj" : $(SOURCE) $(DEP_CPP_OPCOD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\oscbnk.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_OSCBN=\
	"..\csound\cs.h"\
	"..\csound\oscbnk.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\oscbnk.obj" : $(SOURCE) $(DEP_CPP_OSCBN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_OSCBN=\
	"..\csound\cs.h"\
	"..\csound\oscbnk.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	{$(INCLUDE)}"unistd.h"\
	

"$(INTDIR)\oscbnk.obj" : $(SOURCE) $(DEP_CPP_OSCBN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_OSCBN=\
	"..\csound\cs.h"\
	"..\csound\oscbnk.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\oscbnk.obj" : $(SOURCE) $(DEP_CPP_OSCBN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\oscils.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_OSCIL=\
	"..\csound\cs.h"\
	"..\csound\oscils.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\oscils.obj" : $(SOURCE) $(DEP_CPP_OSCIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_OSCIL=\
	"..\csound\cs.h"\
	"..\csound\oscils.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	{$(INCLUDE)}"unistd.h"\
	

"$(INTDIR)\oscils.obj" : $(SOURCE) $(DEP_CPP_OSCIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_OSCIL=\
	"..\csound\cs.h"\
	"..\csound\oscils.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\oscils.obj" : $(SOURCE) $(DEP_CPP_OSCIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Otran.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_OTRAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Otran.obj" : $(SOURCE) $(DEP_CPP_OTRAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_OTRAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Otran.obj" : $(SOURCE) $(DEP_CPP_OTRAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_OTRAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Otran.obj" : $(SOURCE) $(DEP_CPP_OTRAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\phisem.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PHISE=\
	"..\csound\cs.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\phisem.obj" : $(SOURCE) $(DEP_CPP_PHISE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PHISE=\
	"..\csound\cs.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\phisem.obj" : $(SOURCE) $(DEP_CPP_PHISE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PHISE=\
	"..\csound\cs.h"\
	"..\csound\phisem.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\phisem.obj" : $(SOURCE) $(DEP_CPP_PHISE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\physmod.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PHYSM=\
	"..\csound\bowed.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\flute.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physmod.obj" : $(SOURCE) $(DEP_CPP_PHYSM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PHYSM=\
	"..\csound\bowed.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\flute.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physmod.obj" : $(SOURCE) $(DEP_CPP_PHYSM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PHYSM=\
	"..\csound\bowed.h"\
	"..\csound\brass.h"\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\flute.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physmod.obj" : $(SOURCE) $(DEP_CPP_PHYSM) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\physutil.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PHYSU=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physutil.obj" : $(SOURCE) $(DEP_CPP_PHYSU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PHYSU=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physutil.obj" : $(SOURCE) $(DEP_CPP_PHYSU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PHYSU=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\physutil.obj" : $(SOURCE) $(DEP_CPP_PHYSU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pitch.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PITCH=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pitch.obj" : $(SOURCE) $(DEP_CPP_PITCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PITCH=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pitch.obj" : $(SOURCE) $(DEP_CPP_PITCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PITCH=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\pitch.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pitch.obj" : $(SOURCE) $(DEP_CPP_PITCH) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Pluck.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PLUCK=\
	"..\csound\cs.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Pluck.obj" : $(SOURCE) $(DEP_CPP_PLUCK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PLUCK=\
	"..\csound\cs.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Pluck.obj" : $(SOURCE) $(DEP_CPP_PLUCK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PLUCK=\
	"..\csound\cs.h"\
	"..\csound\pluck.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Pluck.obj" : $(SOURCE) $(DEP_CPP_PLUCK) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pstream.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PSTRE=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pstream.obj" : $(SOURCE) $(DEP_CPP_PSTRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PSTRE=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pstream.obj" : $(SOURCE) $(DEP_CPP_PSTRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PSTRE=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pstream.obj" : $(SOURCE) $(DEP_CPP_PSTRE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvadd.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVADD=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvadd.obj" : $(SOURCE) $(DEP_CPP_PVADD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVADD=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvadd.obj" : $(SOURCE) $(DEP_CPP_PVADD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVADD=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvadd.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvadd.obj" : $(SOURCE) $(DEP_CPP_PVADD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Pvanal.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvanal.obj" : $(SOURCE) $(DEP_CPP_PVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvanal.obj" : $(SOURCE) $(DEP_CPP_PVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVANA=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvanal.obj" : $(SOURCE) $(DEP_CPP_PVANA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvfileio.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVFIL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvfileio.obj" : $(SOURCE) $(DEP_CPP_PVFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVFIL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvfileio.obj" : $(SOURCE) $(DEP_CPP_PVFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVFIL=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvfileio.obj" : $(SOURCE) $(DEP_CPP_PVFIL) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Pvinterp.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVINT=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvinterp.obj" : $(SOURCE) $(DEP_CPP_PVINT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVINT=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvinterp.obj" : $(SOURCE) $(DEP_CPP_PVINT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVINT=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvinterp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvinterp.obj" : $(SOURCE) $(DEP_CPP_PVINT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvlook.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVLOO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvlook.obj" : $(SOURCE) $(DEP_CPP_PVLOO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVLOO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvlook.obj" : $(SOURCE) $(DEP_CPP_PVLOO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVLOO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvlook.obj" : $(SOURCE) $(DEP_CPP_PVLOO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Pvoc.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVOC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvoc.obj" : $(SOURCE) $(DEP_CPP_PVOC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVOC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvoc.obj" : $(SOURCE) $(DEP_CPP_PVOC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVOC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvoc.obj" : $(SOURCE) $(DEP_CPP_PVOC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvocext.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVOCE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvocext.obj" : $(SOURCE) $(DEP_CPP_PVOCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVOCE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvocext.obj" : $(SOURCE) $(DEP_CPP_PVOCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVOCE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvocext.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvocext.obj" : $(SOURCE) $(DEP_CPP_PVOCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Pvread.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVREA=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvread.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvread.obj" : $(SOURCE) $(DEP_CPP_PVREA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVREA=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvread.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvread.obj" : $(SOURCE) $(DEP_CPP_PVREA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVREA=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvread.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Pvread.obj" : $(SOURCE) $(DEP_CPP_PVREA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvsanal.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVSAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvsanal.obj" : $(SOURCE) $(DEP_CPP_PVSAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVSAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvsanal.obj" : $(SOURCE) $(DEP_CPP_PVSAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVSAN=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pstream.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvsanal.obj" : $(SOURCE) $(DEP_CPP_PVSAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\pvxanal.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_PVXAN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvxanal.obj" : $(SOURCE) $(DEP_CPP_PVXAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_PVXAN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvxanal.obj" : $(SOURCE) $(DEP_CPP_PVXAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_PVXAN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvxanal.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\pvxanal.obj" : $(SOURCE) $(DEP_CPP_PVXAN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Rdorch.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_RDORC=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdorch.obj" : $(SOURCE) $(DEP_CPP_RDORC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_RDORC=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdorch.obj" : $(SOURCE) $(DEP_CPP_RDORC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_RDORC=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdorch.obj" : $(SOURCE) $(DEP_CPP_RDORC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Rdscor.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_RDSCO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdscor.obj" : $(SOURCE) $(DEP_CPP_RDSCO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_RDSCO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdscor.obj" : $(SOURCE) $(DEP_CPP_RDSCO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_RDSCO=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Rdscor.obj" : $(SOURCE) $(DEP_CPP_RDSCO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Repluck.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_REPLU=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\repluck.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Repluck.obj" : $(SOURCE) $(DEP_CPP_REPLU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_REPLU=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\repluck.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Repluck.obj" : $(SOURCE) $(DEP_CPP_REPLU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_REPLU=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\repluck.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Repluck.obj" : $(SOURCE) $(DEP_CPP_REPLU) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\rtwin32.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_RTWIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\rtwin32.obj" : $(SOURCE) $(DEP_CPP_RTWIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_RTWIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\rtwin32.obj" : $(SOURCE) $(DEP_CPP_RTWIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_RTWIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\rtwin32.obj" : $(SOURCE) $(DEP_CPP_RTWIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\scansyn.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SCANS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansyn.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\scansyn.obj" : $(SOURCE) $(DEP_CPP_SCANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SCANS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansyn.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\scansyn.obj" : $(SOURCE) $(DEP_CPP_SCANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SCANS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansyn.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\scansyn.obj" : $(SOURCE) $(DEP_CPP_SCANS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\scansynx.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SCANSY=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansynx.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\scansynx.obj" : $(SOURCE) $(DEP_CPP_SCANSY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SCANSY=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansynx.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	{$(INCLUDE)}"unistd.h"\
	

"$(INTDIR)\scansynx.obj" : $(SOURCE) $(DEP_CPP_SCANSY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SCANSY=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\scansynx.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\scansynx.obj" : $(SOURCE) $(DEP_CPP_SCANSY) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\schedule.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SCHED=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\schedule.obj" : $(SOURCE) $(DEP_CPP_SCHED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SCHED=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\schedule.obj" : $(SOURCE) $(DEP_CPP_SCHED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SCHED=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\schedule.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\schedule.obj" : $(SOURCE) $(DEP_CPP_SCHED) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Scot.c
DEP_CPP_SCOT_=\
	"..\csound\scot.h"\
	"..\csound\text.h"\
	

"$(INTDIR)\Scot.obj" : $(SOURCE) $(DEP_CPP_SCOT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\csound\Scsort.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SCSOR=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Scsort.obj" : $(SOURCE) $(DEP_CPP_SCSOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SCSOR=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Scsort.obj" : $(SOURCE) $(DEP_CPP_SCSOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SCSOR=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Scsort.obj" : $(SOURCE) $(DEP_CPP_SCSOR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Scxtract.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SCXTR=\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\Scxtract.obj" : $(SOURCE) $(DEP_CPP_SCXTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SCXTR=\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	

"$(INTDIR)\Scxtract.obj" : $(SOURCE) $(DEP_CPP_SCXTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SCXTR=\
	"..\csound\sort.h"\
	

"$(INTDIR)\Scxtract.obj" : $(SOURCE) $(DEP_CPP_SCXTR) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE="..\csound\sdif-mem.c"

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SDIF_=\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	

"$(INTDIR)\sdif-mem.obj" : $(SOURCE) $(DEP_CPP_SDIF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SDIF_=\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	

"$(INTDIR)\sdif-mem.obj" : $(SOURCE) $(DEP_CPP_SDIF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SDIF_=\
	"..\csound\sdif-mem.h"\
	"..\csound\sdif.h"\
	

"$(INTDIR)\sdif-mem.obj" : $(SOURCE) $(DEP_CPP_SDIF_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\sdif.c
DEP_CPP_SDIF_C=\
	"..\csound\sdif.h"\
	

"$(INTDIR)\sdif.obj" : $(SOURCE) $(DEP_CPP_SDIF_C) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\csound\Sfheader.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SFHEA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sfheader.obj" : $(SOURCE) $(DEP_CPP_SFHEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SFHEA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sfheader.obj" : $(SOURCE) $(DEP_CPP_SFHEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SFHEA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sfheader.obj" : $(SOURCE) $(DEP_CPP_SFHEA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\sfont.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SFONT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sf.h"\
	"..\csound\sfenum.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sfont.obj" : $(SOURCE) $(DEP_CPP_SFONT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SFONT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sf.h"\
	"..\csound\sfenum.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sfont.obj" : $(SOURCE) $(DEP_CPP_SFONT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SFONT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sf.h"\
	"..\csound\sfenum.h"\
	"..\csound\sfont.h"\
	"..\csound\sftype.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sfont.obj" : $(SOURCE) $(DEP_CPP_SFONT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\shaker.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SHAKE=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\shaker.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\shaker.obj" : $(SOURCE) $(DEP_CPP_SHAKE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SHAKE=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\shaker.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\shaker.obj" : $(SOURCE) $(DEP_CPP_SHAKE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SHAKE=\
	"..\csound\cs.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\shaker.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\shaker.obj" : $(SOURCE) $(DEP_CPP_SHAKE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\singwave.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SINGW=\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\singwave.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\singwave.obj" : $(SOURCE) $(DEP_CPP_SINGW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SINGW=\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\singwave.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\singwave.obj" : $(SOURCE) $(DEP_CPP_SINGW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SINGW=\
	"..\csound\clarinet.h"\
	"..\csound\cs.h"\
	"..\csound\fm4op.h"\
	"..\csound\moog1.h"\
	"..\csound\physutil.h"\
	"..\csound\prototyp.h"\
	"..\csound\singwave.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\singwave.obj" : $(SOURCE) $(DEP_CPP_SINGW) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Sndinfo.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SNDIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndinfo.obj" : $(SOURCE) $(DEP_CPP_SNDIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SNDIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndinfo.obj" : $(SOURCE) $(DEP_CPP_SNDIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SNDIN=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndinfo.obj" : $(SOURCE) $(DEP_CPP_SNDIN) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\sndinfUG.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SNDINF=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\sndinfug.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sndinfUG.obj" : $(SOURCE) $(DEP_CPP_SNDINF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SNDINF=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\sndinfug.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sndinfUG.obj" : $(SOURCE) $(DEP_CPP_SNDINF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SNDINF=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\sndinfug.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\sndinfUG.obj" : $(SOURCE) $(DEP_CPP_SNDINF) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Sndwarp.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SNDWA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sndwarp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndwarp.obj" : $(SOURCE) $(DEP_CPP_SNDWA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SNDWA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sndwarp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndwarp.obj" : $(SOURCE) $(DEP_CPP_SNDWA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SNDWA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sndwarp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sndwarp.obj" : $(SOURCE) $(DEP_CPP_SNDWA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Sort.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SORT_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sort.obj" : $(SOURCE) $(DEP_CPP_SORT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SORT_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sort.obj" : $(SOURCE) $(DEP_CPP_SORT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SORT_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sort.obj" : $(SOURCE) $(DEP_CPP_SORT_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Soundin.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SOUND=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Soundin.obj" : $(SOURCE) $(DEP_CPP_SOUND) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SOUND=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Soundin.obj" : $(SOURCE) $(DEP_CPP_SOUND) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SOUND=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Soundin.obj" : $(SOURCE) $(DEP_CPP_SOUND) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\soundio.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SOUNDI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\soundio.obj" : $(SOURCE) $(DEP_CPP_SOUNDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SOUNDI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\soundio.obj" : $(SOURCE) $(DEP_CPP_SOUNDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SOUNDI=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\soundio.obj" : $(SOURCE) $(DEP_CPP_SOUNDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\space.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SPACE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\space.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\space.obj" : $(SOURCE) $(DEP_CPP_SPACE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SPACE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\space.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\space.obj" : $(SOURCE) $(DEP_CPP_SPACE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SPACE=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\space.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\space.obj" : $(SOURCE) $(DEP_CPP_SPACE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\spat3d.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SPAT3=\
	"..\csound\cs.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\spat3d.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\spat3d.obj" : $(SOURCE) $(DEP_CPP_SPAT3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SPAT3=\
	"..\csound\cs.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\spat3d.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\spat3d.obj" : $(SOURCE) $(DEP_CPP_SPAT3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SPAT3=\
	"..\csound\cs.h"\
	"..\csound\ftgen.h"\
	"..\csound\prototyp.h"\
	"..\csound\spat3d.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\spat3d.obj" : $(SOURCE) $(DEP_CPP_SPAT3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Spectra.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SPECT=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Spectra.obj" : $(SOURCE) $(DEP_CPP_SPECT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SPECT=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Spectra.obj" : $(SOURCE) $(DEP_CPP_SPECT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SPECT=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\spectra.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Spectra.obj" : $(SOURCE) $(DEP_CPP_SPECT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Sread.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SREAD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sread.obj" : $(SOURCE) $(DEP_CPP_SREAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SREAD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sread.obj" : $(SOURCE) $(DEP_CPP_SREAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SREAD=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Sread.obj" : $(SOURCE) $(DEP_CPP_SREAD) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Swrite.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_SWRIT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Swrite.obj" : $(SOURCE) $(DEP_CPP_SWRIT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_SWRIT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Swrite.obj" : $(SOURCE) $(DEP_CPP_SWRIT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_SWRIT=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Swrite.obj" : $(SOURCE) $(DEP_CPP_SWRIT) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Twarp.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_TWARP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Twarp.obj" : $(SOURCE) $(DEP_CPP_TWARP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_TWARP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Twarp.obj" : $(SOURCE) $(DEP_CPP_TWARP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_TWARP=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sort.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Twarp.obj" : $(SOURCE) $(DEP_CPP_TWARP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens1.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens1.obj" : $(SOURCE) $(DEP_CPP_UGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens1.obj" : $(SOURCE) $(DEP_CPP_UGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens1.obj" : $(SOURCE) $(DEP_CPP_UGENS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens2.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens2.obj" : $(SOURCE) $(DEP_CPP_UGENS2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens2.obj" : $(SOURCE) $(DEP_CPP_UGENS2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens2.obj" : $(SOURCE) $(DEP_CPP_UGENS2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens3.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS3=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens3.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens3.obj" : $(SOURCE) $(DEP_CPP_UGENS3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS3=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens3.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens3.obj" : $(SOURCE) $(DEP_CPP_UGENS3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS3=\
	"..\csound\cs.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens3.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens3.obj" : $(SOURCE) $(DEP_CPP_UGENS3) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens4.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS4=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens4.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens4.obj" : $(SOURCE) $(DEP_CPP_UGENS4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS4=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens4.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens4.obj" : $(SOURCE) $(DEP_CPP_UGENS4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS4=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens4.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens4.obj" : $(SOURCE) $(DEP_CPP_UGENS4) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens5.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS5=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens5.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens5.obj" : $(SOURCE) $(DEP_CPP_UGENS5) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS5=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens5.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens5.obj" : $(SOURCE) $(DEP_CPP_UGENS5) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS5=\
	"..\csound\cs.h"\
	"..\csound\lpc.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens5.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens5.obj" : $(SOURCE) $(DEP_CPP_UGENS5) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens6.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS6=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens6.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens6.obj" : $(SOURCE) $(DEP_CPP_UGENS6) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS6=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens6.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens6.obj" : $(SOURCE) $(DEP_CPP_UGENS6) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS6=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens6.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens6.obj" : $(SOURCE) $(DEP_CPP_UGENS6) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens7.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS7=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens7.obj" : $(SOURCE) $(DEP_CPP_UGENS7) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS7=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens7.obj" : $(SOURCE) $(DEP_CPP_UGENS7) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS7=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens7.obj" : $(SOURCE) $(DEP_CPP_UGENS7) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens8.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS8=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens8.obj" : $(SOURCE) $(DEP_CPP_UGENS8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS8=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens8.obj" : $(SOURCE) $(DEP_CPP_UGENS8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS8=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvfileio.h"\
	"..\csound\pvoc.h"\
	"..\csound\pvocext.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens8.obj" : $(SOURCE) $(DEP_CPP_UGENS8) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugens9.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENS9=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens9.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens9.obj" : $(SOURCE) $(DEP_CPP_UGENS9) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENS9=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens9.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens9.obj" : $(SOURCE) $(DEP_CPP_UGENS9) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENS9=\
	"..\csound\convolve.h"\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens9.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugens9.obj" : $(SOURCE) $(DEP_CPP_UGENS9) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugensa.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGENSA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugensa.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugensa.obj" : $(SOURCE) $(DEP_CPP_UGENSA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGENSA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugensa.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugensa.obj" : $(SOURCE) $(DEP_CPP_UGENSA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGENSA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens7.h"\
	"..\csound\ugensa.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugensa.obj" : $(SOURCE) $(DEP_CPP_UGENSA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\uggab.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGGAB=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\uggab.obj" : $(SOURCE) $(DEP_CPP_UGGAB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGGAB=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\uggab.obj" : $(SOURCE) $(DEP_CPP_UGGAB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGGAB=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\uggab.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\uggab.obj" : $(SOURCE) $(DEP_CPP_UGGAB) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\ugmoss.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGMOS=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugmoss.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugmoss.obj" : $(SOURCE) $(DEP_CPP_UGMOS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGMOS=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugmoss.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugmoss.obj" : $(SOURCE) $(DEP_CPP_UGMOS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGMOS=\
	"..\csound\aops.h"\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugmoss.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugmoss.obj" : $(SOURCE) $(DEP_CPP_UGMOS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugrw1.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGRW1=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw1.obj" : $(SOURCE) $(DEP_CPP_UGRW1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGRW1=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw1.obj" : $(SOURCE) $(DEP_CPP_UGRW1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGRW1=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw1.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw1.obj" : $(SOURCE) $(DEP_CPP_UGRW1) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ugrw2.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGRW2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw2.obj" : $(SOURCE) $(DEP_CPP_UGRW2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGRW2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw2.obj" : $(SOURCE) $(DEP_CPP_UGRW2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGRW2=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugrw2.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Ugrw2.obj" : $(SOURCE) $(DEP_CPP_UGRW2) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\ugsc.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_UGSC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugsc.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugsc.obj" : $(SOURCE) $(DEP_CPP_UGSC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_UGSC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugsc.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugsc.obj" : $(SOURCE) $(DEP_CPP_UGSC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_UGSC_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugsc.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\ugsc.obj" : $(SOURCE) $(DEP_CPP_UGSC_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Ulaw.c

"$(INTDIR)\Ulaw.obj" : $(SOURCE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\csound\vbap.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VBAP_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap.obj" : $(SOURCE) $(DEP_CPP_VBAP_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VBAP_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap.obj" : $(SOURCE) $(DEP_CPP_VBAP_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VBAP_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap.obj" : $(SOURCE) $(DEP_CPP_VBAP_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\vbap_eight.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VBAP_E=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_eight.obj" : $(SOURCE) $(DEP_CPP_VBAP_E) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VBAP_E=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_eight.obj" : $(SOURCE) $(DEP_CPP_VBAP_E) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VBAP_E=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_eight.obj" : $(SOURCE) $(DEP_CPP_VBAP_E) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\vbap_four.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VBAP_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_four.obj" : $(SOURCE) $(DEP_CPP_VBAP_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VBAP_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_four.obj" : $(SOURCE) $(DEP_CPP_VBAP_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VBAP_F=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_four.obj" : $(SOURCE) $(DEP_CPP_VBAP_F) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\vbap_sixteen.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VBAP_S=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj" : $(SOURCE) $(DEP_CPP_VBAP_S) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VBAP_S=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj" : $(SOURCE) $(DEP_CPP_VBAP_S) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VBAP_S=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_sixteen.obj" : $(SOURCE) $(DEP_CPP_VBAP_S) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\vbap_zak.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VBAP_Z=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_zak.obj" : $(SOURCE) $(DEP_CPP_VBAP_Z) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VBAP_Z=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_zak.obj" : $(SOURCE) $(DEP_CPP_VBAP_Z) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VBAP_Z=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vbap.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\vbap_zak.obj" : $(SOURCE) $(DEP_CPP_VBAP_Z) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Vdelay.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VDELA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\revsets.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Vdelay.obj" : $(SOURCE) $(DEP_CPP_VDELA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VDELA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\revsets.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Vdelay.obj" : $(SOURCE) $(DEP_CPP_VDELA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VDELA=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\revsets.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\vdelay.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Vdelay.obj" : $(SOURCE) $(DEP_CPP_VDELA) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Vpvoc.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_VPVOC=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	

"$(INTDIR)\Vpvoc.obj" : $(SOURCE) $(DEP_CPP_VPVOC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_VPVOC=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	

"$(INTDIR)\Vpvoc.obj" : $(SOURCE) $(DEP_CPP_VPVOC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_VPVOC=\
	"..\csound\cs.h"\
	"..\csound\dsputil.h"\
	"..\csound\fft.h"\
	"..\csound\oload.h"\
	"..\csound\prototyp.h"\
	"..\csound\pvoc.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\ugens8.h"\
	"..\csound\version.h"\
	"..\csound\vpvoc.h"\
	

"$(INTDIR)\Vpvoc.obj" : $(SOURCE) $(DEP_CPP_VPVOC) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Wave.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WAVE_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wave.h"\
	

"$(INTDIR)\Wave.obj" : $(SOURCE) $(DEP_CPP_WAVE_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WAVE_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wave.h"\
	

"$(INTDIR)\Wave.obj" : $(SOURCE) $(DEP_CPP_WAVE_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WAVE_=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sfheader.h"\
	"..\csound\soundio.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wave.h"\
	

"$(INTDIR)\Wave.obj" : $(SOURCE) $(DEP_CPP_WAVE_) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Wavegde.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WAVEG=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj" : $(SOURCE) $(DEP_CPP_WAVEG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WAVEG=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj" : $(SOURCE) $(DEP_CPP_WAVEG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WAVEG=\
	"..\csound\cs.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\wavegde.h"\
	

"$(INTDIR)\Wavegde.obj" : $(SOURCE) $(DEP_CPP_WAVEG) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Winascii.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WINAS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Winascii.obj" : $(SOURCE) $(DEP_CPP_WINAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WINAS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Winascii.obj" : $(SOURCE) $(DEP_CPP_WINAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WINAS=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\Winascii.obj" : $(SOURCE) $(DEP_CPP_WINAS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Windin.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WINDI=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\Windin.obj" : $(SOURCE) $(DEP_CPP_WINDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WINDI=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\Windin.obj" : $(SOURCE) $(DEP_CPP_WINDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WINDI=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\windin.h"\
	

"$(INTDIR)\Windin.obj" : $(SOURCE) $(DEP_CPP_WINDI) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\Window.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WINDO=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\winEPS.h"\
	

"$(INTDIR)\Window.obj" : $(SOURCE) $(DEP_CPP_WINDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WINDO=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\winEPS.h"\
	

"$(INTDIR)\Window.obj" : $(SOURCE) $(DEP_CPP_WINDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WINDO=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	"..\csound\winEPS.h"\
	

"$(INTDIR)\Window.obj" : $(SOURCE) $(DEP_CPP_WINDO) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\csound\wineps.c

!IF  "$(CFG)" == "consound - Win32 Release"

DEP_CPP_WINEP=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\wineps.obj" : $(SOURCE) $(DEP_CPP_WINEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Debug"

DEP_CPP_WINEP=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\wineps.obj" : $(SOURCE) $(DEP_CPP_WINEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "consound - Win32 Release64"

DEP_CPP_WINEP=\
	"..\csound\cs.h"\
	"..\csound\cwindow.h"\
	"..\csound\prototyp.h"\
	"..\csound\sysdep.h"\
	"..\csound\text.h"\
	"..\csound\version.h"\
	

"$(INTDIR)\wineps.obj" : $(SOURCE) $(DEP_CPP_WINEP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 


!ENDIF 

