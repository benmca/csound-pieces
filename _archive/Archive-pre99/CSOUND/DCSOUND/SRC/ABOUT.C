#include <windows.h>
#include "resource.h"
#include "version.h"

#ifdef VST
#define CSOUND_DIST "CsoundVST " DIRECTCSOUND_VERSION " (" __DATE__ ")\r\nCsound is now a VST plug-in!\r\n" 
#else
#define CSOUND_DIST "DirectCsound " DIRECTCSOUND_VERSION " (" __DATE__ ")\r\nA real-time oriented version of Csound\r\n" 
#endif

LRESULT CALLBACK 
AboutProc(HWND hDlg,UINT msg, UINT wParam,LONG lParam)
{
   	switch (msg) {
		case WM_INITDIALOG:
			{ 
				HFONT fnt;
				LOGFONT logfnt;
				char gab[]= CSOUND_DIST "Copyright © 1997-2000 Gabriel Maldonado\r\nhttp://web/.tiscalinet.it/G-Maldonado\r\ng.maldonado@agora.stm.it";
				char About[] ="Even if this version of Csound has a GUI interface, it is suggested to run it by typing a command-line with several arguments from a DOS window; alternatively you can write a batch file or use a shell program to run DirectCsound (such as VMCI).\r\n\r\nI highly recommend to use VMCI if you have an orchestra with parameters that can be varied during the performance in real-time. VMCI Lite and VMCI Plus are available for download at the url: \r\n\r\nhttp://web.tiscalinet.it/G-Maldonado\r\n\r\n"
				"Note that, if you don't type command line arguments correctly, DirectCsound will show an error message box! SEE below for some command line example.\r\n"
				"In version 2.5 a unified orc/sco file feature was implemented, so you can run DirectCsound simply dragging the .csd file to the executable file icon. In this case the command line flags are embedded into the .csd file, so the only command line arguments are the executable name (i.e. csound.exe) and the .csd file itself.\r\n" 
				"IMPORTANT: If you don't know Csound you must study the main manual at first. It is available (together with a lot of other tools) at the url: \r\n\r\n"
				"http://www.csound.org\r\n\r\n"
				"The manual in WinHelp format can be downloaded at:\r\n\r\n"
				"http://hem.passagen.se/rasmuse/Csound.htm\r\n\r\n"
				"Other useful stuff can be reached at:\r\n"
				"http://www.csounds.com\r\n\r\n"
				"Even if you perfectly know Csound, you have to study also the DirectCsound manual addendum, because several things are different, especially regarding the command line arguments.\r\n"
				"\r\n\r\n\r\n============================================================\r\n"
				"Command line arguments\r\n"
				"============================================================\r\n\r\n"
				"-+X <num> \r\n\r\nEnable DirectSound primary buffer writing for low-latency audio output. <num> optional, if you omit it, a list of available DirectX audio devices will be displayed, then you can choose one of them by typing the corresponding number to the console. Don't use this flag together with -+p and -+q flags (which enable old MME WAVE OUT) or -+S flag. Also, don't use the standard flag -odevaudio with this flag. When using '-o <FILENAME>' together with '-+X' flag, both realtime audio and FILE output are enabled in parallel.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+C <num> \r\n\r\nEnable DirectSoundCapture routines for low-latency audio input. <num> optional, if you omit it, a list of available DirectSoundCaputure audio devices will be displayed, then you can choose one of them by typing the corresponding number to the console. Don't use this flag together with -i flag (which enable old MME WAVE OUT). Also, don't use the standard flag -iadc with this flag.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+S <num> \r\n\r\nEnable DirectSound secondary buffer writing for low-latency output. <num> optional, if you omit it, a list of available DirectX audio devices will be displayed, then you can choose one of them by typing the corresponding number to the console. Don't use this flag together with -+p and -+q flags (which enable old MME WAVE OUT) or -+X flag. Also, don't use the standard flag -odevaudio with this flag. When using '-o <FILENAME>' together with '-+S' flag, both realtime audio and FILE output are enabled in parallel.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+K <num> \r\n\r\nEnable MIDI IN. <num> = MIDI IN device id number. <num> is optional, if you omit it, a list of available MIDI IN devices will be displayed, then you can choose one of them by typing the corresponding number to the console. If this flag is used, don't use the standard flag -Msbmidi.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+q <num> \r\n\r\nEnable MME WAVE OUT. <num> = WAVE OUT device id number. <num> optional, if you omit it, a list of available MME WAVE OUTdevices will be displayed, then you can choose one of them by typing the corresponding number to the console. This flag enables the old MME WAVE OUT. Don't use this flag together with -+X (DirectX audio). If this flag is used, don't use the standard flag -odevaudio. When using '-o<FILENAME>' together with '-+q' flag, both realtime audio and FILE output are enabled in parallel.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+p <num> \r\n\r\nSet the buffer number in MME WAVE OUT. <num> is optional. default=4, maximum=40. The number of buffers, togheter with the buffer length (flag -b<num>), must be choosen accurately, considering that, when increasing the buffer, the latency delay increases too, whereas when decreasing the buffer, the risk of pop and click due to buffer underruns increases.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+O (uppercase letter) \r\n\r\nSuppress all printf for better realtime performance. Using this flag is better than using '-m0' because '-m0' still leaves some message output to the console. I suggest to use both -+O and -m0 at the same time for the best realtime performance. Warning! Use '-+O' only when your orc/sco files are fully tested, because the error messages are suppressed too.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+e \r\n\r\nAllow any output sample rate (for cards that support this feature). When you use a non-standard sr in realtime (for example 40000), a message will inform you that this sampling frequency is not allowed by the card. Some cards can handle all the sr frequency (for example the Sound Blaster cards) within a range continuously (for example from 8000 to 44100). So you can use these frequencies without any problem by setting this flag.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+y    \r\n\r\nDon't wait for keypress on exit. Useful for batch processing.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+Q <num>  \r\n\r\nEnable MIDI OUT. <num> = MIDI OUT device id number. <num> is optional, if you omit it, a list of available MIDI OUT devices will be displayed, then you can choose one of them by typing the corresponding number to the console.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+Y  \r\n\r\nDisable WAVE OUT (for better MIDI OUT timing performances). When using MIDI OUT oriented orc/sco pairs, disabling WAVE OUT will improve the timing of MIDI OUT flow.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+*  \r\n\r\nYields control to system until DAC buffer is half-empty, for better multitasking. In some cases this flag enhanches the realtime performance, and, above all, allow to use other graphic programs concurrently with Csound in realtime, without interruptions of the sound flow. This flag will slow all other application, because set Csound process to a higher priority. It can be used both with MME (-+q) and DirectX (-+X) drivers.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n"
				"-+/ <filename> \r\n\r\nCsound command line is intended to be included in a text file. The command file must contain the flag as well as the other arguments in the same syntax of csound command line. Carriage returns inside the command file are ignored.\r\n"
				"---------------------------------------------------------------------------------------------------\r\n";



				char Copyright[]=  
					"###################################\r\n"
					"Gabriel Maldonado Realtime Features\r\n"
					"###################################\r\n\r\n"
					"Warning!\r\n"
					"This program is provided without warranty of any kind. Use it at your own risk.\r\n"
					"DirectCsound/CsoundVST additional features are GPL copyrighted, so both binaries and sources are free and available for download. However, a donation of any entity to the author would be very appreciated.\r\n\r\n"
					"I give permission to use, copy, or modify my code under the GNU-GPL license. Notice that original Csound code belongs to the M.I.T. and is not GPL copyrighted; see below for more information.\r\n\r\n"
					"If you want to support my future work and enhancements, send your donations to :\r\n\r\n"
					"Gabriel Maldonado\r\n"
					"Via di Donna Olimpia 166\r\n"
					"00152 Rome / Italy\r\n" 
					"email: g.maldonado@agora.stm.it\r\n\r\n"
									
					"#################################\r\n"
					"Original M.I.T. Copyright\r\n"
					"#################################\r\n\r\n"
					"Copyright 1986, 1992 by the Massachusetts Institute of Technology.  All rights reserved.\r\n"
					"Developed by Barry L. Vercoe at the Experimental Music Studio, Media Laboratory, M.I.T., Cambridge, Massachusetts, with partial support from the System Development Foundation and from National Science Foundation Grant IRI-8704665.\r\n"
					"Permission to use, copy, or modify these programs and their documentation for educational and research purposes only and without fee is hereby granted, provided that this copyright and permission notice appear on all copies and supporting documentation.  For any other uses of this software, in original or modified form, including but not limited to distribution in whole or in part, specific prior permission from M.I.T. must be obtained.  M.I.T. makes no representations about the suitability of this software for any purpose. It is provided as is without express or implied warranty.\r\n"
					"B.V.\r\n\r\n"
					
					"####################\r\n"
					"John Fitch additions\r\n"
					"####################\r\n\r\n"
					"The mixer, graphing and SoundBlaster support are probably my copyright, and I hereby give permission to use, copy, or modify this code for any purpose whatsoever.  I would like my name to remain in there, but I do not insist.\r\n"
					"J.F.\r\n\r\n"
					
					"#######################\r\n"
					"Robin Whittle additions\r\n"
					"#######################\r\n\r\n"
					"Modifications and new code provided by Robin Whittle are provided without warranty etc. etc.  They are copyright 1995 Robin Whittle.\r\n"
					"Use of this code for non-commercial software products is permitted, provided the source code is made freely available according to the principles of the Free Sofware Foundation, with this copyright notice attached - and those of Barry Vercoe and John Fitch.\r\n"
					"R.W.\r\n\r\n"
					
					"######################################\r\n"
					"Michael Gogins external library support \r\n"
					"######################################\r\n\r\n"
					
					"Note that Csound.exe and stk.opcodes are included in this distribution, but are not subject to this license. They have their own licenses under the terms of which they are freely available to use or modify for the purposes of education and research. Csound is copyrighted by MIT. The Csound copyright notice may be found in Csound.txt. \r\n"
					"Stk opcodes is based on code and algorithms in the Synthesis Toolkit 95 by Perry R. Cook, with the exception of my implementation of his instruments as Csound opcodes, and the Synthesis Toolkit notice may be found in STK.txt; Mr. Cook's header files with his notes on patent issues may be found in the Rawwaves subdirectory of this distribution.\r\n"
					"In other words, you can get my version of Csound.exe from this distribution and use it as much as you like all by itself or with stk.opcodes without owing me anything. However, if you use WCSound or any of the other proprietary files listed above to make music for the public, you owe me something. \r\n\r\n";
			#ifdef VST
			SetWindowText(hDlg,"About CsoundVST\0");
			#endif
				
				
				logfnt.lfHeight	=16;
				logfnt.lfWidth = 0;
				logfnt.lfEscapement	= 0;
				logfnt.lfOrientation= 0;
				logfnt.lfWeight	= 400;
				logfnt.lfItalic	= FALSE;
				logfnt.lfUnderline	= FALSE;
				logfnt.lfStrikeOut	= FALSE;
				logfnt.lfCharSet	= DEFAULT_CHARSET;
				logfnt.lfOutPrecision = OUT_DEFAULT_PRECIS;
				logfnt.lfClipPrecision= CLIP_DEFAULT_PRECIS;
				logfnt.lfQuality	= PROOF_QUALITY ;
				logfnt.lfPitchAndFamily	= DEFAULT_PITCH | FF_DONTCARE;
				strcpy (logfnt.lfFaceName, "MS Sans Serif\0");
				fnt = CreateFontIndirect( &logfnt);
				SendDlgItemMessage(hDlg, idcAboutAuthor, 
							WM_SETFONT , 
							(WPARAM) fnt, MAKELPARAM(TRUE, 0));
				SetDlgItemText(hDlg,idcAboutAuthor,gab);
				SetDlgItemText(hDlg,idcCopyright,Copyright);
				SetDlgItemText(hDlg,idcAboutQuickRef,About);
			}
			break;
		case WM_COMMAND :
			switch(wParam) {
				case idAboutOK:
				   EndDialog(hDlg,(int) NULL);
					break;
			}
			break;
		case WM_SYSCOMMAND:
			switch(wParam) {
				case SC_CLOSE: 
					EndDialog(hDlg,1);
				break;
			}
			break;
	}
	return FALSE;
}
