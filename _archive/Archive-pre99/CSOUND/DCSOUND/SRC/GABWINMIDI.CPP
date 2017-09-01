/******************************************/
/* Developed starting by a Perry Cook's   */
/* MIDI IN C++ Class.	This Windows      */
/* Version uses some code by Bill Putnam. */
/*   Csound adaptation by G.Maldonado     */
/******************************************/
#include "GabWinMIDI.h"


#ifdef GAB_WIN
extern "C" void (*cwin_printf)(char *s,...);
#define printf cwin_printf
extern "C" int (*cwin_putchar)(int c);
extern "C" char * InputBoxGab(char *text, char *title);
#undef putchar
#define putchar cwin_putchar
#endif	  /* GAB_WIN */


#define MAX_BUFFER 1000	 //gab
#define NORM_7 0.0078125

#define STATUS 0
#define	DATA1  1
#define DATA2  2
extern "C" void getgab(void);
extern "C" int gabscanf(LPSTR text, LPSTR title);
WinMIDI_IN :: WinMIDI_IN(int port) /* costruttore creato da GAB */
{
    MMRESULT result;
	char error_string[256];

	if (port<0)   port = mChooseMidiInPort();
	port_num=port;
    
    // Open the port and return any errors	
	result =   midiInOpen(&hMidiIn, port, (DWORD) handleMidiIn, (DWORD) this, CALLBACK_FUNCTION);
	if (result != 0) {
		midiInGetErrorText(result, error_string, 256);	
		printf("Error opening MIDI IN port: %s",error_string);
		MessageBox( NULL,	// handle of owner window
				error_string,	// address of text in message box
                "Realtime Csound error opening MIDI IN port",	// address of title of message box  
                MB_TASKMODAL|MB_ICONSTOP 	// style of message box
    	);

		getgab();
		exit(0);
	}
	
	// Set up the circular buffer for the Midi Input Messages
	bufferData = NULL;
	InitializeBuffer( MAX_BUFFER, sizeof(MIDIMESSAGE) );
	    
	result = midiInStart( hMidiIn );
    
    //result = OpenMidiInput(port);
	if (result != 0) {
		midiInGetErrorText(result, error_string, 256);	
		printf("Error opening MIDI IN port: %s",error_string);
		MessageBox( NULL,	// handle of owner window
				error_string,	// address of text in message box
                "Realtime Csound error opening MIDI IN port",	// address of title of message box  
                MB_TASKMODAL|MB_ICONSTOP 	// style of message box
		);
		getgab();
		exit(0);
	}
	else {
		MIDIINCAPS  mic;
		midiInGetDevCaps(port, &mic, sizeof(mic) );	
        //printf("MIDI IN port #%u ->%s\n",j,mic.szPname); 
		printf("\nMIDI IN DEV.#%d ENABLED  ( %s )\n\n",port,mic.szPname);   
		numPending = 0;
    }
}
#ifdef GAB_WIN
extern "C" HWND MainDialogHandle;
#endif

int  WinMIDI_IN :: mChooseMidiInPort(void) {
	
	MIDIINCAPS  mic;	// address of structure for capabilities
  	int DeviceNUM;
    int j,InPort;
	char str[256],	str2[1024];
    DeviceNUM = midiInGetNumDevs();
	
    if(DeviceNUM==0) {
        sprintf(str,"\n NO MIDI IN INTERFACE INSTALLED!!!!\n");
		printf(str);
		#ifdef GAB_WIN
		MessageBox( MainDialogHandle,str,"DirectCsound: Midi IN warning!",MB_OK );
		#else
		MessageBox( NULL,str,"DirectCsound: Midi IN warning!",MB_OK );
		#endif
        return -1;
    } 
    else if ( DeviceNUM==1 ) { //if only one device is present
		return 0; // choose device number 0 without prompting
	}
  repeat:
	*str='\0'; *str2='\0';
    sprintf(str2,"\n%i MIDI IN ports found:\n\n",DeviceNUM);
	for (j=0;j< (int) DeviceNUM; j++) {
        midiInGetDevCaps(j, &mic, sizeof(mic) );	
        sprintf(str,"MIDI IN port %u -->%s\n",j,mic.szPname); 
		strcat(str2,str);
    }
	sprintf(str,"\nPlease, type MIDI IN port number and press <RETURN>: ");
	strcat(str2,str);
	printf(str2);
	
	InPort = gabscanf(str2, "MIDI IN Device selection");

	if (InPort < 0 || InPort >= DeviceNUM) {
		sprintf (str,"ERROR!! Bad MIDI IN port number.\n Valid numbers are 0 to %d\n",DeviceNUM-1);
#ifdef GAB_WIN	
		MessageBox( MainDialogHandle,str,"DirectCsound: Wrong device number!",MB_OK );
#else
		MessageBox( NULL,str,"DirectCsound: Wrong device number!",MB_OK );
#endif
		printf(str);
		goto repeat;
	}
	printf("%d", InPort);
    return InPort;
}


WinMIDI_IN :: ~WinMIDI_IN()
{
    CloseMidiInput();
    DestroyBuffer();
}

int WinMIDI_IN ::  nextMessageInt()
{
    MIDIMESSAGE midiMsg;
    messageType = 0;
	numPending = GetData( &midiMsg, 1);
	if (numPending > 0)	{ 
		register BYTE *status;
		//register BYTE *data1;
		register BYTE *data2;
		//*** ATTENZIONE! NON DISABILITARE IN CSOUND LA TRASFORMAZIONE NOTEON con velocity 0 a NOTEOFF ****
				
		if ((messageType = *(status  = &midiMsg.bData[STATUS]) >> 4) == MD_NOTEON 
		          &&      !(*(data2 = &midiMsg.bData[DATA2]))) {
			messageType = MD_NOTEOFF; /* if velocity =0 status = noteoff */
			*status = 0x80 + (*status & 0x0f);
		}
		
		/* disablitare questa condizione per distribuzione internet */
		/*
		else if (messageType == MD_CONTROLCHANGE 
		    	 && *(data1 = &midiMsg.bData[DATA1]) == 7){ // volume converted in control change for kawai mm16
			 	*data1 = *status &  0x0f; // control num = channel
			 	*status = 0xB0; // channel = 1
		}
		*/
		/*--------------------------------*/

		midi_message_long = midiMsg;       // GLOBAL of CLASS variable
	}
	return messageType;
}

MIDIMESSAGE WinMIDI_IN :: GetMidiMessage() {
 	return midi_message_long;
}

int WinMIDI_IN :: nextMessage()
{
    int status;
    int byte1;
    int byte2;
    MIDIMESSAGE midiMsg;
    messageType = -1;
	numPending = GetData( &midiMsg, 1);
	if (numPending > 0)	{ 
		status = midiMsg.bData[STATUS];
		byte1 = midiMsg.bData[DATA1];
		byte2 = midiMsg.bData[DATA2];
		channel = status && 15;
	    status = status >> 4;

		if (status==MD_NOTEON)	{
			
			byteTwo = (MYFLT) byte1;
			if( byteThree = (MYFLT) byte2 )	messageType = 9;/* if velocity =0 status = noteoff */
			else {
				messageType = 8;
				midiMsg.bData[STATUS]=0x80 + channel;
			}
		}
        else if (status==MD_NOTEOFF)	{
			byteTwo = (MYFLT) byte1;
			byteThree = (MYFLT) byte2;
			messageType = 8;
		}
        else if (status==MD_PROGRAMCHANGE)	{
			byteTwo = (MYFLT) byte1;
			messageType = 12;
		}
        else if (status==MD_CHANNELPRESSURE)	{
			byteTwo = (MYFLT) byte1;
			messageType = 13;
		}
        else if (status==MD_PITCHBENDCHANGE)	{
			byteTwo = (MYFLT) byte1;
			byteTwo += (MYFLT) byte2 * (MYFLT) NORM_7;
			messageType = 14;
		}
        else if (status==MD_CONTROLCHANGE)	{
			byteTwo = (MYFLT) byte1;
			byteThree = (MYFLT) byte2;
			messageType = 11;
		}
	}
	else {
 	    messageType = -1;
	}
    return messageType;
}

/**** Circular Buffer Implementation ****/

UINT WinMIDI_IN :: InitializeBuffer( UINT numElements, UINT numBytes ) {

	bufferData = (char *) malloc( numElements * numBytes );

	if( bufferData == 0)
		return (UINT)-1;

	dataSize = numBytes;
	readOffset = 0;
	writeOffset = 0;
	maxElements = numElements;

	return 0;
}


 UINT WinMIDI_IN :: GetData( void* data, UINT numElements ) {
	UINT	i,j;
	char*	newData = (char *) data;

	if (readOffset == writeOffset )
		return 0;

	for( i = 0; i<numElements; i++){
		for( j = 0; j<dataSize; j++)
			newData[i*dataSize+j] = bufferData[readOffset*dataSize+j];
		
		readOffset++;
		if (readOffset == writeOffset ){
			i++;
			break;
		}
		if( readOffset >= maxElements )
			readOffset = 0;
	}
	return i;
}


void WinMIDI_IN :: PutData( void* data, UINT numElements ) 
{
	UINT	i,j;
	char*	newData = (char *) data;
	for( i = 0; i<numElements; i++){
		for( j = 0; j<dataSize; j++)
			bufferData[writeOffset*dataSize+j] = newData[i*dataSize+j];
		writeOffset++;
		
		writeOffset %= maxElements; //gab
		//if( writeOffset >= maxElements )
		//	writeOffset = 0;
	}
}

void WinMIDI_IN :: DestroyBuffer(){
	
	if( bufferData != NULL )
		free( bufferData );
}


void WinMIDI_IN ::  printMessage()
{
    printf("%i %i %f %f \n",messageType,channel,byteTwo,byteThree);
}


int WinMIDI_IN ::  getType()
{
    return messageType;
}


int WinMIDI_IN ::  getChannel()
{
    return channel;
}


MYFLT WinMIDI_IN :: getByteTwo()
{
    return byteTwo;
}


MYFLT WinMIDI_IN :: getByteThree()
{
    return byteThree;
}


// ******* Port Open/Close Routines  ******

MMRESULT WinMIDI_IN :: CloseMidiInput () {

	MMRESULT result;

#if 0
	if( midiMsgBuffer != NULL )
		free( midiMsgBuffer );
#endif

	result =  midiInReset(hMidiIn);
	if ( result != 0 )
		return result;
#if 0
	result = midiInUnprepareHeader( hMidiIn, (LPMIDIHDR) &midiInputHdr, sizeof(MIDIHDR) );
	if ( result != 0 )
		return result;
#endif
	result =  midiInStop( hMidiIn);
	if ( result != 0 )
		return result;
	
	return midiInClose(hMidiIn) ;
}

/*UINT WinMIDI_IN :: GetMidiMessage( MIDIMESSAGE* newMsg ){
	
	return GetData( newMsg, 1);
}
*/
/*
void WinMIDI_IN :: printInputErrorMessage( char* func, MMRESULT result ){
	char msg[256];
	midiInGetErrorText(result, msg, 256);
	printf("%s: %s\n",func, msg);
}
*/

/**********************************************************************/
//#define TESTING_MIDI_IN


WinMIDI_OUT :: WinMIDI_OUT(int port) /* costruttore creato da GAB */
{
    MMRESULT result;
	char error_string[256];
	if (port<0)   port = mChooseMidiOutPort();
	port_num = port;
   
    result = midiOutOpen(&hMidiOut, port, NULL,NULL,NULL);
	
	if (result != 0) {
		midiOutGetErrorText(result, error_string, 256);	
		printf("Error opening MIDI OUT port: %s",error_string);
		MessageBox( NULL,	// handle of owner window
				error_string,	// address of text in message box
                "Realtime Csound error opening MIDI OUT port",	// address of title of message box  
                MB_TASKMODAL|MB_ICONSTOP 	// style of message box
		);
		getgab();
		exit(0);
	}
	else {
		MIDIOUTCAPS  mic;
		midiOutGetDevCaps(port, &mic, sizeof(mic) );	
        printf("\nMIDI OUT DEV.#%d ENABLED ( %s )\n\n",port,mic.szPname);   
    }
}

WinMIDI_OUT :: ~WinMIDI_OUT()
{
    midiOutClose(hMidiOut);
}


int  WinMIDI_OUT :: mChooseMidiOutPort(void) {
	
	MIDIOUTCAPS  moc;	// address of structure for capabilities
  	int DeviceNUM;
    int j,OutPort;
    DeviceNUM = midiOutGetNumDevs();
	char str[256],	str2[1024];

    if(DeviceNUM==0) {
        sprintf(str,"NO MIDI OUT INTERFACE INSTALLED!!!!\n");
#ifdef GAB_WIN	
		MessageBox( MainDialogHandle,str,"DirectCsound: Midi OUT warning!",MB_OK );
#else
		MessageBox( NULL,str,"DirectCsound: Midi OUT warning!",MB_OK );
#endif
        return -1;
    } 
 repeat:
	*str='\0'; *str2='\0';
	sprintf(str2,"\n%i MIDI OUT ports found:\n\n",DeviceNUM);
	for (j=0;j< (int) DeviceNUM; j++) {
        midiOutGetDevCaps(j, &moc, sizeof(moc) );	
        sprintf(str,"MIDI OUT port %u -->%s\n",j,moc.szPname); 
 		strcat(str2,str);
   }
 
	//printf("Please, type MIDI OUT port number and press <RETURN>:");
	{
		char str[256];
		
		sprintf(str,"\nPlease, type MIDI OUT port number and press <RETURN>: ");
		strcat(str2,str);
		printf(str2);
		
		OutPort = gabscanf(str2, "MIDI OUT Device selection");

	}


    //scanf("%d",&OutPort);  printf("\n");
	if (OutPort < 0 || OutPort >= DeviceNUM) {
		sprintf (str,"ERROR!! Bad MIDI OUT port number. Valid numbers are 0 to %d\n",DeviceNUM-1);
		#ifdef GAB_WIN	
		MessageBox( MainDialogHandle,str,"DirectCsound: Wrong device number!",MB_OK );
		#else
		MessageBox( NULL,str,"DirectCsound: Wrong device number!",MB_OK );
		#endif
		printf(str);
		goto repeat;
	}
	printf("%d", OutPort);
    return OutPort;
}

MMRESULT WinMIDI_OUT :: sendMessage (int type,int channel, int byteTwo , int byteThree) 
{
   //printf("Type:%x  Channel:%x  byteTwo:%x  byteThree:%x", type, channel, byteTwo, byteThree);
   return midiOutShortMsg( hMidiOut, 
                    (byteThree<< 16) + 
                    (byteTwo << 8)  + 
                    (type << 4) + 
                    channel );
}
 
//void inline
//  /*MMRESULT*/ WinMIDI_OUT :: sendShortMessage (DWORD message)
//{ 
//  /*    return*/ midiOutShortMsg( hMidiOut, message );
//}

MMRESULT WinMIDI_OUT::NoteOn(int chan, int num, int vel) 
{
   return midiOutShortMsg( hMidiOut, 
                    (vel << 16) + (num << 8) + (MD_NOTEON << 4) + chan );
}




MMRESULT WinMIDI_OUT::NoteOff(int chan, int num, int vel) 
{
  return midiOutShortMsg( hMidiOut, 
                    (vel << 16) + (num << 8) + (MD_NOTEOFF << 4) + chan );
}

MMRESULT WinMIDI_OUT::AfterTouch(int chan, int value)
{
   return midiOutShortMsg( hMidiOut, 
                         (value << 8) + (MD_CHANNELPRESSURE << 4) + chan );
}

MMRESULT WinMIDI_OUT::ControlChange(int chan, int num, int value)
{
   return midiOutShortMsg( hMidiOut, 
                         (value << 16) + (num << 8) + 
                         (MD_CONTROLCHANGE << 4) + chan );
}

MMRESULT WinMIDI_OUT::ProgramChange(int chan, int num)
{
   return midiOutShortMsg( hMidiOut, 
                         (num << 8) + (MD_PROGRAMCHANGE << 4) + chan );
}

MMRESULT WinMIDI_OUT::PitchBend(int chan, int lsb, int msb)
{
   return midiOutShortMsg( hMidiOut, 
                         (msb << 16) + (lsb << 8) + 
                         (MD_PITCHBENDCHANGE << 4) + chan );
}









//------------------------------------------------------------------------
// Funzione friend della classe WinMIDI_IN

static void CALLBACK  handleMidiIn( HMIDIIN hmin, UINT wMsg, 
	            		DWORD dwInstance, DWORD dwParam1, DWORD dwParam2)
{
    MIDIMESSAGE	midiMsg;
    WinMIDI_IN * MidiInObject;
    
    MidiInObject= (WinMIDI_IN *) dwInstance;
	
	switch (wMsg) {
	case MIM_OPEN:
		#ifdef TESTING_MIDI_IN
			printf("MIM_OPEN\n");
		#endif
		break;
	case MIM_CLOSE:
		#ifdef TESTING_MIDI_IN
			printf("MIM_CLOSE\n");
		#endif
		break;
	case MIM_DATA:
		// Get the new Midi Message
		midiMsg.dwData = dwParam1;
		// Put it in out circular buffer, if it is not a Active_Sensing Message
		if( midiMsg.bData[STATUS] != 0xfe ) {
			MidiInObject->numPending--;
			MidiInObject->PutData( &midiMsg, 1);
			#ifdef TESTING_MIDI_IN
				printf("MIM_DATA\n");
				printf("status: %x - data1: %x - data2: %x\n",midiMsg.bData[STATUS],
										midiMsg.bData[DATA1], midiMsg.bData[DATA2]);
			#endif
		}
		break;
	case MIM_ERROR:
		#ifdef TESTING_MIDI_IN
			printf("MIM_ERROR\n");
		#endif
		break;
	case MIM_LONGDATA:
		
		break;
	case MIM_LONGERROR:
		#ifdef TESTING_MIDI_IN
			printf("MIM_LONGERROR\n");
		#endif
		break;
	}
}

   
