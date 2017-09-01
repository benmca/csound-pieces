/******************************************/
/* Developed starting by a Perry Cook's   */
/* MIDI IN C++ Class.	This Windows95    */
/* Version uses some code by Bill Putnam. */
/*   Csound adaptation by G.Maldonado     */
/******************************************/

#if !defined(__WinMIDI_h)
#define __WinMIDI_h
#include <windows.h>
#include <mmsystem.h>
#include <stdio.h>
#include "cs.h"
//#define MY_FLOAT     double
//#define MYFLT float
typedef union { 
    DWORD dwData; 
    BYTE bData[4]; 
} MIDIMESSAGE; 


class WinMIDI_IN 
{

  public:
	 int port_num;
    WinMIDI_IN(int port=-1);/* se non si mettono argomenti fa scegliere 
                           all'utente il numero di porta MIDI IN altrimenti
                           lo sceglie in base all'argomento fornito */
    ~WinMIDI_IN();
     void printMessage();
     
     int nextMessage();    // ritorna -1 se non c'e' niente in attesa, 
     					   // altrimenti il tipo di messaggio 
     
     int nextMessageInt(); // ritorna 0 se non c'e' niente in attesa, 
     					   // altrimenti il tipo di messaggio; poi mette 
						   // il messaggio completo (3 bytes) nella 
						   // variabile midi_message_long
     MIDIMESSAGE GetMidiMessage(); //ritorna il messaggio in LONG
     int getType();
     int getChannel();
     MYFLT getByteTwo();
     MYFLT getByteThree();

  protected:  
    int messageType;
    int channel;
    MYFLT byteTwo;
    MYFLT byteThree;
    int IsPending;

	MIDIMESSAGE midi_message_long;

  private:
    /* questa routine fa scegliere una porta midi_in all'utente */
    int mChooseMidiInPort();
    int numPending ;   /* valore che indica se e' arrivato un messaggio MIDI.
					     Questa variabile viene usata sia dalla classe WinMIDI_IN che dalla funzione
						esterna CALLBACK handleMidiIn() */ 
	void PutData( void* data, UINT numElements ); 
	// ****** MMWIN midi in routines and variables *****
    HMIDIIN	hMidiIn;    	                        // Handle to Midi Output Device
      
    MMRESULT OpenMidiInput (UINT midiDevNum) ;      // opens the port specified
    MMRESULT CloseMidiInput (void) ;				// Resets then closes the midi port
    //void printInputErrorMessage( char* func, MMRESULT result );
    
    friend static void CALLBACK handleMidiIn( HMIDIIN hmin, UINT wMsg, 
                                   DWORD dwInstance, 
                                   DWORD dwParam1, DWORD dwParam2);

    /**** Circular Buffer Implementation ****/
    char	*bufferData;
    UINT	dataSize;
    UINT	readOffset, writeOffset;
    UINT	maxElements;

    UINT InitializeBuffer( UINT numElements, UINT numBytes );
    UINT GetData( void* data, UINT numElements );
    
    void DestroyBuffer();
       
};


class WinMIDI_OUT
{
  public:
	int port_num;
    WinMIDI_OUT(int port=-1);/* se non si mettono argomenti fa scegliere 
                           all'utente il numero di porta MIDI OUT 
                           altrimenti sceglie la porta in base
                           all'argomento fornito */
    ~WinMIDI_OUT();
    
    MMRESULT sendMessage (int type, int channel, 
                          int byteTwo , int byteThree = 0);
    void inline sendShortMessage(DWORD message){
				midiOutShortMsg( hMidiOut, message );
   	};
    	 /* assume un unico int come argomento per i 3 bytes */

    MMRESULT NoteOn(int chan, int num, int vel);
    MMRESULT NoteOff(int chan, int num, int vel = 64);
    MMRESULT AfterTouch(int chan, int value);
    MMRESULT ControlChange(int chan, int num, int value);
    MMRESULT ProgramChange(int chan, int num);
    MMRESULT PitchBend(int chan, int lsb, int msb);


  private:
    
    HMIDIOUT hMidiOut;
    
    /* questa routine fa scegliere una porta midi_in all'utente */
    int mChooseMidiOutPort(); 

};

#endif

#define MD_NOTEOFF			8
#define MD_NOTEON			9
#define MD_CONTROLCHANGE    11
#define MD_PROGRAMCHANGE	12
#define MD_CHANNELPRESSURE  13
#define MD_PITCHBENDCHANGE	14

