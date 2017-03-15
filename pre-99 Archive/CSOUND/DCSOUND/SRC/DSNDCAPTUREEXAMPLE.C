#include <malloc.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <windows.h>
#include <dsound.h>
#include <math.h>


#define NUMCAPTUREEVENTS 2
 
LPDIRECTSOUNDCAPTURE        lpdsc;
LPDIRECTSOUNDCAPTUREBUFFER  lpdscb;
LPDIRECTSOUNDNOTIFY         lpdsNotify;
DSCBUFFERDESC               dscbDesc;
HANDLE                      rghEvent[NUMCAPTUREEVENTS];
DSBPOSITIONNOTIFY           rgdscbpn[NUMCAPTUREEVENTS];
WAVEFORMATEX                wfx = {WAVE_FORMAT_PCM, 1, 22050, 44100, 2, 16, 0};
HMMIO                       hmmio;
MMCKINFO                    mmckinfoData, mmckinfoParent;
MMIOINFO                    mmioinfo;
DWORD                       dwTotalBytesWritten;


BOOL InitDSoundCapture(void)
{
 
    DSCCAPS dsccaps;
	
	if FAILED(DirectSoundCaptureCreate(NULL, &lpdsc, NULL)) return FALSE;
 
    dsccaps.dwSize = sizeof(DSCCAPS);
    if FAILED(IDirectSoundCapture_GetCaps(lpdsc, &dsccaps)) return FALSE;
 
    if ((dsccaps.dwFormats & WAVE_FORMAT_2M16) == 0) // se sbaglia poni sr=11025 
    {
        wfx.nSamplesPerSec = 11025;
        wfx.nAvgBytesPerSec = 11025;
        wfx.nBlockAlign = 1;
        wfx.wBitsPerSample = 8; 
    }

	/*	Once you have ensured that the WAVEFORMATEX structure is 
	    valid for the user's device, you can go ahead and create 
		a capture buffer in that format. 
	*/

    dscbDesc.dwSize = sizeof(DSCBUFFERDESC);
    dscbDesc.dwFlags = 0;
    // Buffer will hold one second's worth of audio
    dscbDesc.dwBufferBytes = wfx.nAvgBytesPerSec;
    dscbDesc.dwReserved = 0;
    dscbDesc.lpwfxFormat = &wfx;
 
    if FAILED(IDirectSoundCapture_CreateCaptureBuffer(lpdsc, &dscbDesc, &lpdscb, NULL)) return FALSE;
	
	// You now have a pointer to the buffer object in lpdscb.
    
	/* As the final initialization step in the InitDSoundCapture function, you will set up 
	  notification positions in the capture buffer so that the application knows when 
	  it's time to stream more data to the file. In the example, these positions are 
	  set at the beginning and halfway mark of the buffer.

      First you create the required number of events and store 
	  their handles in the rghEvent array: 
    */
	
	
	for (int i = 0; i < NUMCAPTUREEVENTS; i++)
    {
        rghEvent[i] = CreateEvent(NULL, FALSE, FALSE, NULL);
        if (NULL == rghEvent[i]) return FALSE;
    }

    rgdscbpn[0].dwOffset = 0;
    rgdscbpn[0].hEventNotify = rghEvent[0];
    rgdscbpn[1].dwOffset = dscbDesc.dwBufferBytes/2;
    rgdscbpn[1].hEventNotify = rghEvent[1];

	/*  Next, you initialize the array of DSBPOSITIONNOTIFY structures, 
	    each of which associates a position in the buffer with an event handle:
	*/
    rgdscbpn[0].dwOffset = 0;
    rgdscbpn[0].hEventNotify = rghEvent[0];
    rgdscbpn[1].dwOffset = dscbDesc.dwBufferBytes/2;
    rgdscbpn[1].hEventNotify = rghEvent[1];
 
	/* Finally, you get the IDirectSoundNotify interface from 
	   the capture buffer and pass the DSBPOSITIONNOTIFY array 
	   to the SetNotificationPositions method: 
	*/

    if FAILED(IDirectSoundCaptureBuffer_QueryInterface(lpdscb, 
            IID_IDirectSoundNotify, (VOID **)&lpdsNotify))
        return FALSE; 
 
    if FAILED(IDirectSoundNotify_SetNotificationPositions(lpdsNotify,
            NUMCAPTUREEVENTS, rgdscbpn))
    {
        IDirectSoundNotify_Release(lpdsNotify);
        return FALSE;
    }
 
    return TRUE;
}  // end InitDSoundCapture()
 
	/* Note that if you need to set up notifications for 
	   both a capture buffer and a secondary (output) buffer, 
	   the event handles have to be stored in the same rghEvent 
	   array. When you receive the notifications in the message 
	   loop, you can distinguish between the two types of 
	   events by the index number.
	*/


	/*	At this point it is presumed that you have obtained a 
		valid filename and are ready to start saving sound data 
		in a wave file. The process is initiated in the following function:
	*/
BOOL StartWrite(TCHAR *pszFileName)
{
    if (WaveCreateFile(pszFileName, &hmmio, &wfx, 
            &mmckinfoData, &mmckinfoParent)) 
      return FALSE;
 
    if (WaveStartDataWrite(&hmmio, &mmckinfoData, &mmioinfo))
    {
        WaveCloseWriteFile(&hmmio, &mmckinfoData, 
                &mmckinfoParent, &mmioinfo, 
                dwTotalBytesWritten / (wfx.wBitsPerSample / 8));
        DeleteFile(pszFileName);
        return FALSE;
    }
    if FAILED(IDirectSoundCaptureBuffer_Start(lpdscb,
            DSCBSTART_LOOPING))
    {
        WaveCloseWriteFile(&hmmio, &mmckinfoData,
                &mmckinfoParent, &mmioinfo, 0);
        DeleteFile(pszFileName);
        return FALSE;
    }
    
    dwTotalBytesWritten = 0;
 
    return TRUE;
}
 
	/*	This function first calls the WaveCreateFile 
		function in Wave.c, in order to create a RIFF file 
		and write the header for the wave format. 
		It then calls the WaveStartDataWrite function, which 
		advances the file pointer to the data chunk. 
		Finally, it starts the capture buffer. 
		In half a second your application will be notified 
		that data is available, and you must be ready to copy it to the file.

		Note also the initialization of dwTotalBytesWritten. 
	    This value is going to be needed for the data chunk header 
		after capture is complete.
	*/

	/*	You receive capture notifications as events in the message 
		loop, just as with playback notifications. Here is a sample loop:
	*/
BOOL Done = FALSE;
while (!Done)
{
    DWORD dwEvt = MsgWaitForMultipleObjects(
            NUMCAPTUREEVENTS,  // How many possible events
            rghEvent,          // Location of handles
            FALSE,             // Wait for all?
            INFINITE,          // How long to wait
            QS_ALLINPUT);      // Any message is an event
 
    dwEvt -= WAIT_OBJECT_0;
 
    // If the event was set by the buffer, there's input to process. 
     if (dwEvt < NUMCAPTUREEVENTS) 
    {
        StreamToFile(); 
    }
 
    // If it's the last event, it's a message 
     else if (dwEvt == NUMCAPTUREEVENTS) 
    {         
        while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) 
        {
            if (msg.message == WM_QUIT) 
            {
                Done = TRUE;
            } 
            else
            {
                TranslateMessage(&msg);
                DispatchMessage(&msg);
            }
        }
    }  // end message processing
} // while (!Done)
 
	/*	As already noted, if you are receiving notifications from 
		both a capture buffer and a secondary (output) buffer, 
		you need to distinguish between the two types of 
		events by the index value in dwEvt. 
		For example, events 0 and 1 might be playback 
		notifications, and events 2 and 3 might 
		be capture notifications.
	*/



	/* NEW TUTORIAL (STEP 7) */

	/*	In the first tutorial you saw how to identify the segment 
		of the buffer that was safe to write to by checking the 
		offset of the notification position. This technique would 
		work equally well with the capture buffer in the present tutorial, 
		but this time you'll do things a bit differently.
		
		In the previous step you saw how the StreamToFile function was 
		called in response to a notification event. Unlike the StreamToBuffer 
		function in the previous tutorial, this function does not take 
		the event index as a parameter.
	*/	

BOOL StreamToFile(void)
{
    DWORD               dwReadPos;
    DWORD               dwNumBytes;
    LPBYTE              pbInput1, pbInput2;
    DWORD               cbInput1, cbInput2;
    static DWORD        dwMyReadCursor = 0;  
    UINT                dwBytesWritten;
 
	/*	Note the static declaration of dwMyReadCursor. 
		This is the offset of the next byte of data you 
		want to read; in other words, the byte just beyond 
		the last one read on the previous pass through this function.

		The first thing the function does is find the current 
		read position. Remember, this position marks the leading 
		edge of the data that is safe to read. It is not 
		necessarily the same as the notification position, 
		because it has likely advanced since the event was signaled. 
	*/
    IDirectSoundCaptureBuffer_GetCurrentPosition(lpdscb, NULL, &dwReadPos);
 
	/*	The function then subtracts your internal read cursor 
		from the current read position (after allowing for 
		wraparound) in order to determine how many bytes 
		of new data are available:
	*/
    if (dwReadPos < dwMyReadCursor)
            dwReadPos += dscbDesc.dwBufferBytes;
    dwNumBytes = dwReadPos - dwMyReadCursor;
 
	/*	You then lock the buffer and do the copy. Because 
		the segment of data you've identified as available 
		is not exactly demarcated by the notification positions 
		at the beginning and midpoint of the buffer, the locked 
		portion of the buffer might wrap around, in which case 
		two separate copy operations are required:
	*/
    
	if FAILED(IDirectSoundCaptureBuffer_Lock(lpdscb, 
            dwMyReadCursor, dwNumBytes,
            (LPVOID *)&pbInput1, &cbInput1, 
            (LPVOID *)&pbInput2, &cbInput2, 0))
        OutputDebugString("Capture lock failure");
 
    else   
        {
        if (WaveWriteFile(hmmio, cbInput1, pbInput1, &mmckinfoData,
                        &dwBytesWritten, &mmioinfo))
          OutputDebugString("Failure writing data to file\n");
        dwTotalBytesWritten += dwBytesWritten; 
 
        // Wraparound
        if (pbInput2 != NULL) 
        {
            if (WaveWriteFile(hmmio, cbInput2, pbInput2,
                    &mmckinfoData, &dwBytesWritten, &mmioinfo))
              OutputDebugString("Failure writing data to file\n");
            dwTotalBytesWritten += dwBytesWritten; 
        } 
 
        IDirectSoundCaptureBuffer_Unlock(lpdscb, 
                pbInput1, cbInput1, 
                pbInput2, cbInput2);
    }
 
	/*	The WaveWriteFile function returns 0 if successful 
		and also fills dwBytesWritten with the number of 
		bytes actually copied to the file. This value is 
		added to the cumulative total, which will be 
		needed when the file is closed.

		Finally, update the internal read cursor, compensating 
		for wraparound, and return to the message loop:
	*/
    dwMyReadCursor += dwNumBytes;
    if (dwMyReadCursor >= dscbDesc.dwBufferBytes)
                dwMyReadCursor -= dscbDesc.dwBufferBytes;
 
    return TRUE;       
} // end StreamToFile()
 


	/*	When it's time to stop recording, call the following function:
	*/
BOOL StopWrite()
{
    IDirectSoundCaptureBuffer_Stop(lpdscb);
    StreamToFile();  
    WaveCloseWriteFile(&hmmio, &mmckinfoData, 
            &mmckinfoParent, &mmioinfo, 
            dwTotalBytesWritten / (wfx.wBitsPerSample / 8));
    return TRUE;
}
 
	/*	This function stops the capture buffer, calls 
		the StreamToFile function one more time in order 
		to save all the data up to the current read position, 
		and closes the file. The WaveCloseWriteFile function 
		in Wave.c also updates the header of the data chunk 
		by writing the total number of samples.
	*/


	/*	Step 9: Shutting Down DirectSoundCapture
		
		Before closing the application you must shut down 
		the capture system. This is a simple matter of releasing all 
		the objects. You must release the IDirectSoundNotify 
		interface before releasing the capture buffer.
	*/
void CleanupDSoundCapture(void)
{
    if (lpdsNotify) 
        IDirectSoundNotify_Release(lpdsNotify);    
    if (lpdscb) 
        IDirectSoundCaptureBuffer_Release(lpdscb);
    if (lpdsc) 
        IDirectSoundCapture_Release(lpdsc);
}
 












----------------------



DECLARE_INTERFACE_(IDirectSound, IUnknown)
{
    // IUnknown methods
    STDMETHOD(QueryInterface)       (THIS_ REFIID, LPVOID FAR *) PURE;
    STDMETHOD_(ULONG,AddRef)        (THIS) PURE;
    STDMETHOD_(ULONG,Release)       (THIS) PURE;
    
    // IDirectSound methods
    STDMETHOD(CreateSoundBuffer)    (THIS_ LPCDSBUFFERDESC, LPDIRECTSOUNDBUFFER *, LPUNKNOWN) PURE;
    STDMETHOD(GetCaps)              (THIS_ LPDSCAPS) PURE;
    STDMETHOD(DuplicateSoundBuffer) (THIS_ LPDIRECTSOUNDBUFFER, LPDIRECTSOUNDBUFFER *) PURE;
    STDMETHOD(SetCooperativeLevel)  (THIS_ HWND, DWORD) PURE;
    STDMETHOD(Compact)              (THIS) PURE;
    STDMETHOD(GetSpeakerConfig)     (THIS_ LPDWORD) PURE;
    STDMETHOD(SetSpeakerConfig)     (THIS_ DWORD) PURE;
    STDMETHOD(Initialize)           (THIS_ LPGUID) PURE;
};

DECLARE_INTERFACE_(IDirectSoundCapture, IUnknown)
{
    // IUnknown methods
    STDMETHOD(QueryInterface)       (THIS_ REFIID, LPVOID *) PURE;
    STDMETHOD_(ULONG,AddRef)        (THIS) PURE;
    STDMETHOD_(ULONG,Release)       (THIS) PURE;

    // IDirectSoundCapture methods
    STDMETHOD(CreateCaptureBuffer)  (THIS_ LPCDSCBUFFERDESC, LPDIRECTSOUNDCAPTUREBUFFER *, LPUNKNOWN) PURE;
    STDMETHOD(GetCaps)              (THIS_ LPDSCCAPS ) PURE;
    STDMETHOD(Initialize)           (THIS_ LPGUID) PURE;
};






DECLARE_INTERFACE_(IDirectSoundBuffer, IUnknown)
{
    // IUnknown methods
    STDMETHOD(QueryInterface)       (THIS_ REFIID, LPVOID FAR *) PURE;
    STDMETHOD_(ULONG,AddRef)        (THIS) PURE;
    STDMETHOD_(ULONG,Release)       (THIS) PURE;
    
    // IDirectSoundBuffer methods
    STDMETHOD(GetCaps)              (THIS_ LPDSBCAPS) PURE;
    STDMETHOD(GetCurrentPosition)   (THIS_ LPDWORD, LPDWORD) PURE;
    STDMETHOD(GetFormat)            (THIS_ LPWAVEFORMATEX, DWORD, LPDWORD) PURE;
    STDMETHOD(GetVolume)            (THIS_ LPLONG) PURE;
    STDMETHOD(GetPan)               (THIS_ LPLONG) PURE;
    STDMETHOD(GetFrequency)         (THIS_ LPDWORD) PURE;
    STDMETHOD(GetStatus)            (THIS_ LPDWORD) PURE;
    STDMETHOD(Initialize)           (THIS_ LPDIRECTSOUND, LPCDSBUFFERDESC) PURE;
    STDMETHOD(Lock)                 (THIS_ DWORD, DWORD, LPVOID *, LPDWORD, LPVOID *, LPDWORD, DWORD) PURE;
    STDMETHOD(Play)                 (THIS_ DWORD, DWORD, DWORD) PURE;
    STDMETHOD(SetCurrentPosition)   (THIS_ DWORD) PURE;
    STDMETHOD(SetFormat)            (THIS_ LPCWAVEFORMATEX) PURE;
    STDMETHOD(SetVolume)            (THIS_ LONG) PURE;
    STDMETHOD(SetPan)               (THIS_ LONG) PURE;
    STDMETHOD(SetFrequency)         (THIS_ DWORD) PURE;
    STDMETHOD(Stop)                 (THIS) PURE;
    STDMETHOD(Unlock)               (THIS_ LPVOID, DWORD, LPVOID, DWORD) PURE;
    STDMETHOD(Restore)              (THIS) PURE;
};

DECLARE_INTERFACE_(IDirectSoundCaptureBuffer, IUnknown)
{
    // IUnknown methods
    STDMETHOD(QueryInterface)       (THIS_ REFIID, LPVOID *) PURE;
    STDMETHOD_(ULONG,AddRef)        (THIS) PURE;
    STDMETHOD_(ULONG,Release)       (THIS) PURE;

    // IDirectSoundCaptureBuffer methods
    STDMETHOD(GetCaps)              (THIS_ LPDSCBCAPS ) PURE;
    STDMETHOD(GetCurrentPosition)   (THIS_ LPDWORD, LPDWORD ) PURE;
    STDMETHOD(GetFormat)            (THIS_ LPWAVEFORMATEX, DWORD, LPDWORD ) PURE;
    STDMETHOD(GetStatus)            (THIS_ LPDWORD ) PURE;
    STDMETHOD(Initialize)           (THIS_ LPDIRECTSOUNDCAPTURE, LPCDSCBUFFERDESC) PURE;
    STDMETHOD(Lock)                 (THIS_ DWORD, DWORD, LPVOID *, LPDWORD, LPVOID *, LPDWORD, DWORD) PURE;
    STDMETHOD(Start)                (THIS_ DWORD) PURE;
    STDMETHOD(Stop)                 (THIS) PURE;
    STDMETHOD(Unlock)               (THIS_ LPVOID, DWORD, LPVOID, DWORD) PURE;
};



typedef struct _DSCBUFFERDESC
{
    DWORD           dwSize;
    DWORD           dwFlags;
    DWORD           dwBufferBytes;
    DWORD           dwReserved;
    LPWAVEFORMATEX  lpwfxFormat;
} DSCBUFFERDESC, *LPDSCBUFFERDESC;



