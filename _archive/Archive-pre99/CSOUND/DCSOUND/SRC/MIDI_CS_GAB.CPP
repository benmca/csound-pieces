/* interface MIDI routines by G.Maldonado */
#include "GabWinMIDI.h"

WinMIDI_IN *midi_in_port;
WinMIDI_OUT *midi_out_port;
extern "C" int midi_in_p_num=-1;
extern "C" int midi_out_p_num=-1;
extern "C" unsigned long MIDIINbufIndex=0;
extern "C" int  MIDIINBUFMAX=100;
extern "C" MIDIMESSAGE MIDIINbuffer2[];	/* see midiops2.c */
extern "C" int MIDIoutDONE;


extern "C" void setport_num(int num) 
{
 	midi_in_p_num = num;
}

extern "C" void set_out_port_num(int num)
{
	midi_out_p_num = num;
}

extern "C" void gab_midi_init()
{
	if (midi_in_p_num ==-1)	{
		midi_in_port = new 	WinMIDI_IN;
		midi_in_p_num  = midi_in_port->port_num;
	}
	else 					midi_in_port = new  WinMIDI_IN(midi_in_p_num);
}
extern "C" void gab_midi_exit()
{
	
	if (midi_in_port!= NULL) {
		delete midi_in_port;
		midi_in_port = NULL;
	}
	
}

extern "C" void gab_midi_out_exit()
{
	
	if (midi_out_port!= NULL) {
		delete midi_out_port;
		midi_out_port = NULL;
	}
}

extern "C" void gab_midi_out_init()
{
	if (midi_out_p_num ==-1) {
		midi_out_port = new WinMIDI_OUT;
		midi_out_p_num  = midi_out_port->port_num;
	}
	else 					 midi_out_port = new WinMIDI_OUT(midi_out_p_num);
	MIDIoutDONE=1;
}


extern "C" int readmidi(char *mbuf, int size)  /* GAB */
{
    if (!midi_in_port->nextMessageInt()) return 0;
	else {
    	register MIDIMESSAGE  *message = (MIDIMESSAGE *) mbuf; 
		register int temp;
		*message = MIDIINbuffer2[MIDIINbufIndex++ % MIDIINBUFMAX] = midi_in_port->GetMidiMessage();
		/*returns the MIDI message number of bytes  */
		if ( (temp  =   midi_in_port->getType()) != MD_PROGRAMCHANGE && 
		      temp 								 !=	MD_CHANNELPRESSURE )		
				return 3; 
		else	return 2;
	}
}


extern "C" void send_midi_message(int status, int data1, int data2){
	midi_out_port->sendShortMessage(status + (data1 << 8) + (data2 << 16));
}

extern "C" void note_on(int chan, int num, int vel){
	midi_out_port->sendShortMessage((0x90 | chan) + (num << 8) + (vel << 16));
}

extern "C" void note_off(int chan, int num, int vel){
	midi_out_port->sendShortMessage((0x80 | chan) + (num << 8) + (vel << 16));
}


extern "C" void control_change(int chan, int num, int value) {
	midi_out_port->sendShortMessage((0xB0 | chan) + (num << 8) + (value << 16));
}


extern "C" void after_touch(int chan, int value){
	midi_out_port->sendShortMessage((0xD0 | chan) + (value << 8));
}

extern "C" void poly_after_touch(int chan, int note_num, int value){
	midi_out_port->sendShortMessage((0xA0 | chan) + (note_num << 8) + (value << 16));
}

extern "C" void program_change(int chan, int num) {
	midi_out_port->sendShortMessage((0xC0 | chan) + (num << 8));
}

extern "C" void pitch_bend(int chan, int msb, int lsb) {
	midi_out_port->sendShortMessage((0xE0 | chan) + (lsb << 8) + (msb << 16));
}
