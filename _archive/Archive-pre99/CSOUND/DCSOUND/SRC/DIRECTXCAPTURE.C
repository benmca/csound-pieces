#include <windows.h>
#include "cs.h"
#include <malloc.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <dsound.h>
#include <math.h>
#include "DXdevices.h"

static int DsoundCapDevNum = -1;
void SetDsoundCapDevNum(int num) {DsoundCapDevNum = num;}
extern MYFLT esr;
extern int  nchnls;
//extern MYFLT one2sr;
static DWORD dwBufferSize /*, dwHalfBufferSize*/;
static UINT inbufsizUp4;
static int InBufSiz;
int directSoundCapture_flag = 0; /* gab c3 */

LPDIRECTSOUNDCAPTURE lpDirectSoundCapture;
LPDIRECTSOUNDCAPTUREBUFFER DscBuf;
/*
typedef struct {
	  GUID  guid;    // Storage for GUIDs.
	  char  lpstrDescription[256];	// Storage for device description strings.
} DSOUNDDEVICE, *LPDSOUNDDEVICE;

typedef struct {
	DSOUNDDEVICE	DSdevice[100];
	int NumOfDevices;
} APPINSTANCEDATA, *LPAPPINSTANCEDATA;
*/
LPGUID DSC_AppLetUserSelectDevice( LPAPPINSTANCEDATA AppInstanceData, LPSTR DevSel, int *numDevSel) {
    extern int flprintf;
	int j,DevSelNum;
	int temp = flprintf;
	flprintf = 0;
	printf("\n\n\n");
	if 	(DsoundCapDevNum == -1) {
		char str[256], str2[1024];
		extern int gabscanf(LPSTR text, LPSTR title);
	repeat:	
		*str='\0'; *str2='\0';
		sprintf(str2,"%i DirectSoundCapture devices found:\n",AppInstanceData->NumOfDevices);
		for (j = 0; j <	AppInstanceData->NumOfDevices; j++){
			sprintf(str,"DirectSoundCapture device %d --> %s\n", j, AppInstanceData->DSdevice[j].lpstrDescription);
			strcat(str2,str);
		}

	
		sprintf(str,"\nPlease, type DirectSoundCapture device number and press <RETURN>: ");
		strcat(str2,str);
		printf(str2);
		
		DevSelNum = gabscanf(str2, "DirectSoundCapture Device selection");

		//sscanf(InputBoxGab("\nPlease, type DirectSoundCapture device number and click OK:", "TitoloBoxGab"), "%d",&DevSelNum);	 
		
		if (DevSelNum < 0 || DevSelNum >= AppInstanceData->NumOfDevices) {
			sprintf (str,"DirectCsound ERROR!!\n Bad DirectSoundCapture device number.\n Valid numbers are 0 to %d\n",AppInstanceData->NumOfDevices-1);
		  #ifdef GAB_WIN
			{
				extern HWND MainDialogHandle;
				MessageBox( MainDialogHandle,str,"Wrong device number!",MB_OK );
			}
		  #endif
			printf(str);			
			goto repeat;
		}	
	}
	else DevSelNum = DsoundCapDevNum; 
	flprintf=temp;
	//setcolor(0);
	*numDevSel=DevSelNum;
	strcpy(DevSel,AppInstanceData->DSdevice[DevSelNum].lpstrDescription);
	printf("%d", DevSelNum);
	return	 &(AppInstanceData->DSdevice[DevSelNum].guid);
}


BOOL AppCreateCaptureBuffer( LPDIRECTSOUNDCAPTURE lpDirectSoundCapture, 
								 LPDIRECTSOUNDCAPTUREBUFFER * lplpDscb,
								 LPDWORD lpdwBufferSize, 
								 int nchnls, MYFLT esr)
{
    WAVEFORMATEX wfx;
	DSCBUFFERDESC dscbdesc;
    DSCBCAPS dscbcaps;
    HRESULT hr;
    
	memset(&wfx, 0, sizeof(WAVEFORMATEX));
    wfx.wFormatTag = WAVE_FORMAT_PCM;
    wfx.nChannels = nchnls;
    wfx.nSamplesPerSec = (int) esr;
	wfx.wBitsPerSample = 16;
    wfx.nBlockAlign =  nchnls*(wfx.wBitsPerSample>>3);
    wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign;
	
    memset(&dscbdesc, 0, sizeof(dscbdesc)); 
    dscbdesc.dwSize = sizeof(dscbdesc);
    dscbdesc.dwFlags = 0;
    dscbdesc.dwBufferBytes =  32768;
    dscbdesc.lpwfxFormat = &wfx; 
    hr = IDirectSoundCapture_CreateCaptureBuffer(lpDirectSoundCapture, &dscbdesc, lplpDscb, NULL);
    if(DS_OK == hr) {
                    dscbcaps.dwSize = sizeof(DSCBCAPS);
                (*lplpDscb)->lpVtbl->GetCaps(*lplpDscb, &dscbcaps);
                *lpdwBufferSize = dscbcaps.dwBufferBytes;
                return TRUE;
     }
	 else {
			if (hr == DSERR_INVALIDPARAM ) printf("error creating DSoundCapture buffer: DSERR_INVALIDPARAM\n");
			else if  (hr == DSERR_BADFORMAT ) printf("error creating DSoundCapture buffer: DSERR_BADFORMAT\n");
			else if  (hr == DSERR_GENERIC ) printf("error creating DSoundCapture buffer: DSERR_GENERIC\n");
			else if  (hr == DSERR_NODRIVER ) printf("error creating DSoundCapture buffer: DSERR_NODRIVER\n");
			else if  (hr == DSERR_OUTOFMEMORY ) printf("error creating DSoundCapture buffer: DSERR_OUTOFMEMORY\n");
			else if  (hr == DSERR_UNINITIALIZED ) printf("error creating DSoundCapture buffer: DSERR_UNINITIALIZED\n");
	}
    *lplpDscb = NULL;
    *lpdwBufferSize = 0;
    return FALSE;
}


/////////////////////////////////////////////////////////
/*******************************************************/
/////////////////////////////////////////////////////////

HRESULT  (WINAPI *DscGetCurrentPosition)(LPDIRECTSOUNDCAPTUREBUFFER, LPDWORD, LPDWORD);
HRESULT  (WINAPI *DscLock)(LPDIRECTSOUNDCAPTUREBUFFER, DWORD, DWORD, LPVOID, LPDWORD, LPVOID, LPDWORD, DWORD);
HRESULT  (WINAPI *DscUnlock)(LPDIRECTSOUNDCAPTUREBUFFER, LPVOID, DWORD, LPVOID, DWORD);

extern BOOL _stdcall AppEnumCallbackFunction(
		LPGUID lpGuid, 
		LPCTSTR lpstrDescription,
		LPCTSTR lpstrModule,
		LPVOID lpContext);

BOOL CreateDsoundCaptureObject(char *warning)									
{
	
	DSCCAPS dsccaps;
	HRESULT hr;
	APPINSTANCEDATA AppInstanceData;
    LPGUID lpGuid;
	LPDIRECTSOUNDCAPTUREBUFFER lpDsb;
	int NumDevSel;
	char DevSelected[256];
	DWORD flags;
	AppInstanceData.NumOfDevices=0;
    hr = DirectSoundCaptureEnumerate(AppEnumCallbackFunction, &AppInstanceData);
	if (hr != DS_OK) {
		sprintf(warning,"cannot enumerate DirectSoundCapture devices");	
		return FALSE;
	}
	if (AppInstanceData.NumOfDevices == 0)	    {
        sprintf(warning,"NO DirectSoundCapture DEVICE INSTALLED!!!!\n");
        return FALSE;
    } 
	lpGuid = DSC_AppLetUserSelectDevice(&AppInstanceData,DevSelected,&NumDevSel);
	hr = DirectSoundCaptureCreate(lpGuid, &lpDirectSoundCapture,	NULL);
	if(hr != DS_OK) {
		sprintf(warning,"unable to create a DirectSoundCapture object\n");
		return FALSE;
	}
	dsccaps.dwSize = sizeof(DSCCAPS);
	hr = IDirectSoundCapture_GetCaps(lpDirectSoundCapture,&dsccaps);
   	if(hr != DS_OK) {
		sprintf(warning,"unable to get the capabilities of the DirectSound object just created\n");
		return FALSE;
	}
	flags = dsccaps.dwFlags;
	printf("DSCAPS_EMULDRIVER: %d\n",(flags & DSCAPS_EMULDRIVER) && 1 );
	printf("DSCAPS_CERTIFIED: %d\n",(flags & DSCAPS_CERTIFIED) && 1 );
	if(!AppCreateCaptureBuffer( lpDirectSoundCapture, &lpDsb, &dwBufferSize, nchnls,esr)) {
			sprintf(warning,"unable to create a buffer for DirectSoundCapture,\nmaybe DirectX is not installed or the driver of the selected audio port can support DirectX only in emulation mode\n");
			return FALSE;
	}
		
	hr = IDirectSoundCaptureBuffer_Start(lpDsb, DSCBSTART_LOOPING);
	if(hr != DS_OK) {
		sprintf(warning,"the DirectSoundCapture object just created is unable to record\n");
		return FALSE;
	}
	DscBuf = lpDsb;
	DscGetCurrentPosition = DscBuf->lpVtbl->GetCurrentPosition;
	DscLock = (HRESULT (__stdcall *)(LPDIRECTSOUNDCAPTUREBUFFER, DWORD, DWORD, LPVOID, LPDWORD, LPVOID, LPDWORD, DWORD) )DscBuf->lpVtbl->Lock;
	DscUnlock = DscBuf->lpVtbl->Unlock;
	//one2sr =  1000/(sizeof(short) * esr);
	//dwHalfBufferSize = dwBufferSize/2;
	InBufSiz = (unsigned)O.inbufsamps * O.insampsiz;
	inbufsizUp4 = InBufSiz/4;
	printf("\nDirectSoundCapture device #%i enabled ( %s )\n\n",NumDevSel,DevSelected);   
	
	return TRUE;
}

void DsoundCaptureStop()
{
	IDirectSoundCaptureBuffer_Stop(DscBuf);
}


int RecordDsoundNowait(char *inbuf)
{
		static DWORD LastReadPosition=0;
		LPVOID lpvPtr1,lpvPtr2;
		DWORD dwBytes1,dwBytes2;

		LastReadPosition += inbufsizUp4;
		LastReadPosition %= dwBufferSize;
		DscLock(DscBuf, LastReadPosition , inbufsizUp4, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(inbuf,lpvPtr1 , dwBytes1);
        if(NULL != lpvPtr2) {
			CopyMemory(inbuf+dwBytes1,lpvPtr2 , dwBytes2);
		}
        DscUnlock(DscBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		return inbufsizUp4;
}


/*
int RecordDsoundNowait(char *inbuf, int nbytes)
{
		DWORD dwCurrentCaptureCursor, dwCurrentReadCursor;
		static DWORD LastReadPosition=0;
		static DWORD OldCaptureCursor=0;
		//static DWORD nrec=1;
		LPVOID lpvPtr1;
	    DWORD dwBytes1;
		LPVOID lpvPtr2;
		DWORD dwBytes2;
		do {
			DscGetCurrentPosition(DscBuf, &dwCurrentCaptureCursor, &dwCurrentReadCursor);
			if (dwCurrentCaptureCursor < OldCaptureCursor) 
				LastReadPosition %= dwBufferSize;
			OldCaptureCursor = dwCurrentCaptureCursor;
		} while (dwCurrentCaptureCursor < LastReadPosition);
		LastReadPosition += nbytes;
		DscLock(DscBuf, LastReadPosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(inbuf,lpvPtr1 , dwBytes1);
        if(NULL != lpvPtr2) {
			CopyMemory(inbuf+dwBytes1,lpvPtr2 , dwBytes2);
		}
        DscUnlock(DscBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		return nbytes;
}
*/
/*
int RecordDsoundNowait(char *inbuf, int nbytes)
{
		DWORD dwCurrentCaptureCursor, dwCurrentReadCursor;
		static DWORD LastReadPosition=0;
		static DWORD OldCaptureCursor=0;
		static DWORD nrec=1;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD dwBytes1, dwBytes2;

		do {
			DscGetCurrentPosition(DscBuf, &dwCurrentCaptureCursor, &dwCurrentReadCursor);
			if (dwCurrentCaptureCursor < OldCaptureCursor) {
				if (dwCurrentCaptureCursor < dwHalfBufferSize) {
					nrec=0;
					LastReadPosition %= dwBufferSize;
				}
				else nrec++;
			}
			OldCaptureCursor = dwCurrentCaptureCursor;
		} while (dwBufferSize * nrec + dwCurrentReadCursor < LastReadPosition);
		LastReadPosition += nbytes;
		DscLock(DscBuf, LastReadPosition , nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(inbuf,lpvPtr1 , dwBytes1);
        if(NULL != lpvPtr2) CopyMemory(inbuf+dwBytes1,lpvPtr2 , dwBytes2);
		DscUnlock(DscBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		return nbytes;
}
*/