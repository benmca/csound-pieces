#include <windows.h>
#include "cs.h"
#include <malloc.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <dsound.h>
#include <math.h>
#include "dsbuffer.h"
#include "DXdevices.h"

static int DsoundDevNum = -1;
void SetDsoundDevNum(int num) {DsoundDevNum = num;}
void PlayDsoundNowait(char *, int);
void PlayDsoundSleep(char *, int);
void PlayDsoundAndFileNowait(char *, int);
void PlayDsoundAndFileSleep(char *, int);
extern MYFLT	esr;
extern int  nchnls;
#ifdef GAB_WIN
extern HWND MainDialogHandle;
#endif

DWORD dwBufferSize;

/* tweak this length for best performance in 3d audio */
#define SECONDARY_BUFFER_LENGTH  30000/* 5000 */


extern MYFLT esr;
extern void (*rtplay)(char *, int);
extern void (*rtplay_and_file) (char *, int);

void set_rtplay_Dsound() {	
	rtplay = PlayDsoundNowait;
	rtplay_and_file = PlayDsoundAndFileNowait;
}
void set_critical_priority_flag();
void set_dsound_sleep()
{ 
	rtplay = PlayDsoundSleep;
	rtplay_and_file = PlayDsoundAndFileSleep;
	set_critical_priority_flag();
}

BOOL secondary_flag=0;
void set_secondary_flag() { secondary_flag=1;}
int directSound_flag = 0;

static LPDIRECTSOUND lpDirectSound;
LPDIRECTSOUNDBUFFER DsBuf;
LPDIRECTSOUNDBUFFER lpDslb;
LPDIRECTSOUND3DLISTENER Listener;
#ifdef GAB_EAX
LPKSPROPERTYSET EAXListener;
#endif
long butta[16]={
/*0*/DS_OK, // The request completed successfully. 
/*1*/DSERR_ALLOCATED,  // The request failed because resources, such as a priority level, were already in use by another caller. 
/*2*/DSERR_ALREADYINITIALIZED, //The object is already initialized. 
/*3*/DSERR_BADFORMAT, //The specified wave format is not supported. 
/*4*/DSERR_BUFFERLOST, //The buffer memory has been lost and must be restored. 
/*5*/DSERR_CONTROLUNAVAIL, //The control (volume, pan, and so forth) requested by the caller is not available. 
/*6*/DSERR_GENERIC, //An undetermined error occurred inside the DirectSound subsystem. 
/*7*/DSERR_INVALIDCALL, //This function is not valid for the current state of this object. 
/*8*/DSERR_INVALIDPARAM, //An invalid parameter was passed to the returning function. 
/*9*/DSERR_NOAGGREGATION, //The object does not support aggregation. 
/*10*/DSERR_NODRIVER, //No sound driver is available for use. 
/*11*/DSERR_OTHERAPPHASPRIO, //This value is obsolete and is not used. 
/*12*/DSERR_OUTOFMEMORY, //The DirectSound subsystem could not allocate sufficient memory to complete the caller's request. 
/*13*/DSERR_PRIOLEVELNEEDED, //The caller does not have the priority level required for the function to succeed. 
/*14*/DSERR_UNINITIALIZED,  //The IDirectSound::Initialize method has not been called or has not been called successfully before other methods were called. 
/*15*/DSERR_UNSUPPORTED, //The function called is not supported at this time. 
} ;

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
BOOL _stdcall AppEnumCallbackFunction(
		LPGUID lpGuid, 
		LPCTSTR lpstrDescription,
		LPCTSTR lpstrModule,
		LPVOID lpContext)
{
	LPAPPINSTANCEDATA lpInstance = (LPAPPINSTANCEDATA) lpContext;
	int i = lpInstance->NumOfDevices;
	strcpy( lpInstance->DSdevice[i].lpstrDescription, lpstrDescription); // Strcpy description string into lpInstance structure.
	if (lpGuid == NULL) {(lpInstance->NumOfDevices)++; return TRUE;}
	memcpy (&(lpInstance->DSdevice[i].guid), lpGuid, sizeof (GUID )); // Copy GUID into lpInstance structure.
	(lpInstance->NumOfDevices)++;
    return TRUE; // Continue enumerating.
}

LPGUID AppLetUserSelectDevice( LPAPPINSTANCEDATA AppInstanceData, LPSTR DeviceSelected, int *numDevSel) {
    extern int flprintf;
	int j,DevSelNum;
	int temp = flprintf;
	flprintf = 0;
	printf("\n\n\n");
	if 	(DsoundDevNum == -1) {
		char str[256],	str2[2048];
		extern int gabscanf(LPSTR text, LPSTR title);
	repeat:		
		*str='\0'; *str2='\0';
		sprintf(str2,"%i DirectSound devices found:\n\n",AppInstanceData->NumOfDevices);
		for (j = 0; j <	AppInstanceData->NumOfDevices; j++){
			sprintf(str,"DirectSound device %d --> %s\n", j, AppInstanceData->DSdevice[j].lpstrDescription);
			strcat(str2,str);
		}
		if (secondary_flag)	strcpy(str,"\nUsing SECONDARY buffer(s).\n");
		else strcpy (str,"\nUsing PRIMARY buffer.\n");
		strcat(str,"Please, type a DirectSound device number and press <RETURN>:  ");
		strcat(str2,str);
		printf(str2);
		
		DevSelNum = gabscanf(str2, "DirectSound Device selection");
		if (DevSelNum < 0 || DevSelNum >= AppInstanceData->NumOfDevices) {
			sprintf (str,"DirectCsound ERROR!! Bad DirectSound device number.\nValid numbers are 0 to %d\nTry again!",AppInstanceData->NumOfDevices-1);
			#ifdef GAB_WIN
				MessageBox( MainDialogHandle,str,"Wrong device number!",MB_OK );
			#endif
			printf(str);
			goto repeat;
		}	
	}
	else DevSelNum = DsoundDevNum; 
	flprintf=temp;
	strcpy(DeviceSelected, AppInstanceData->DSdevice[DevSelNum].lpstrDescription);
	*numDevSel = DevSelNum;
	printf("%d", DevSelNum);
	return	 &(AppInstanceData->DSdevice[DevSelNum].guid);
}


int init_window(HWND* hwnd) {
	WNDCLASS wc ;
	char lpszClassName[] = "dummy" ;
	wc.style		= 0;
	wc.lpfnWndProc	= DefWindowProc; 
	wc.cbClsExtra	= 0 ;
	wc.cbWndExtra	= 0 ;
	wc.hInstance	= 0 ;
	wc.hIcon		= NULL; 
	wc.hCursor		= NULL; 
	wc.hbrBackground= NULL; 
	wc.lpszMenuName	= NULL;
	wc.lpszClassName= lpszClassName ;
	if( !RegisterClass( &wc)) 	return FALSE ;
	*hwnd = CreateWindow(lpszClassName,"",WS_POPUP ,0,0,0,0,NULL,NULL,0,NULL);
	if (*hwnd== NULL) return FALSE;
	else return TRUE;
}


BOOL AppCreateWritePrimaryBuffer( LPDIRECTSOUND lpDirectSound, 
								 LPDIRECTSOUNDBUFFER *lplpDsb,
								 LPDWORD lpdwBufferSize, 
								 HWND hwnd, int nchnls, MYFLT esr)
{
    WAVEFORMATEX wfx;
	DSBUFFERDESC dsbdesc;
    DSBCAPS dsbcaps;
    HRESULT hr;
    memset(&wfx, 0, sizeof(WAVEFORMATEX));
    wfx.wFormatTag = WAVE_FORMAT_PCM;
    wfx.nChannels = nchnls;
    wfx.nSamplesPerSec = (int) esr;
    wfx.wBitsPerSample = 16;
	wfx.nBlockAlign =  nchnls*(wfx.wBitsPerSample>>3);
    wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign;
    memset(&dsbdesc, 0, sizeof(DSBUFFERDESC)); 
    dsbdesc.dwSize = sizeof(DSBUFFERDESC);
    dsbdesc.dwFlags = DSBCAPS_PRIMARYBUFFER | DSBCAPS_STICKYFOCUS;
    dsbdesc.dwBufferBytes = 0; 
    dsbdesc.lpwfxFormat = NULL; 
    hr = lpDirectSound->lpVtbl->SetCooperativeLevel(lpDirectSound, hwnd , DSSCL_WRITEPRIMARY);
	{	long a,b, c,d,e;
	a=DSERR_ALLOCATED  ;
	b=DSERR_INVALIDPARAM ;
	c=DSERR_UNINITIALIZED ;
	d=DSERR_UNSUPPORTED   ;
	e=DSERR_OTHERAPPHASPRIO;

    if(DS_OK == hr) {
        hr = lpDirectSound->lpVtbl->CreateSoundBuffer(lpDirectSound, &dsbdesc, lplpDsb, NULL);
        if(DS_OK == hr) {
            hr = (*lplpDsb)->lpVtbl->SetFormat(*lplpDsb, &wfx);
            if(DS_OK == hr) {
                    dsbcaps.dwSize = sizeof(DSBCAPS);
                (*lplpDsb)->lpVtbl->GetCaps(*lplpDsb, &dsbcaps);
                *lpdwBufferSize = dsbcaps.dwBufferBytes;
                return TRUE;
            }
        }
    }
    }
	*lplpDsb = NULL;
    *lpdwBufferSize = 0;
    return FALSE;
}


BOOL AppCreateSecondaryBuffer(LPDIRECTSOUND lpDirectSound,
							  LPDIRECTSOUNDBUFFER *lplpDsb, 
							  LPDWORD lpdwBufferSize, 
							  HWND hwnd, int nchnls, MYFLT esr)
{
    WAVEFORMATEX wfx;
	DSBUFFERDESC dsbdesc;
    DSBCAPS dsbcaps;
    HRESULT hr;
	//LONG Volume;
    memset(&wfx, 0, sizeof(WAVEFORMATEX));
    wfx.wFormatTag = WAVE_FORMAT_PCM;
    wfx.nChannels = nchnls;
    wfx.nSamplesPerSec = (int) esr;
    wfx.wBitsPerSample = 16;
	wfx.nBlockAlign =  nchnls*(wfx.wBitsPerSample>>3);
    wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign;
    memset(&dsbdesc, 0, sizeof(DSBUFFERDESC)); 
    dsbdesc.dwSize = sizeof(DSBUFFERDESC);
    dsbdesc.dwFlags = DSBCAPS_GLOBALFOCUS;
    dsbdesc.dwBufferBytes =  SECONDARY_BUFFER_LENGTH; 
    dsbdesc.lpwfxFormat = &wfx; 
    hr = lpDirectSound->lpVtbl->SetCooperativeLevel(lpDirectSound, hwnd, DSSCL_PRIORITY);
	hr = lpDirectSound->lpVtbl->CreateSoundBuffer(lpDirectSound, &dsbdesc, lplpDsb, NULL);
	if(DS_OK == hr) {
		dsbcaps.dwSize = sizeof(DSBCAPS);
		hr=(*lplpDsb)->lpVtbl->GetCaps(*lplpDsb, &dsbcaps);
		*lpdwBufferSize = dsbcaps.dwBufferBytes;
		return TRUE;
	}

    *lplpDsb = NULL;
    return FALSE;
}


BOOL CreateDsoundObject(char *warning)									
{
	DSCAPS dscaps;
	HRESULT hr;
	APPINSTANCEDATA AppInstanceData;
    LPGUID lpGuid;
	LPDIRECTSOUNDBUFFER lpDsb;
	DWORD flags;
	extern HWND MainProcessWinHandle;
	char DevSelected[256];
	int NumDevSelected;
	HWND hwnd;
	AppInstanceData.NumOfDevices=0;
    hr = DirectSoundEnumerate(AppEnumCallbackFunction, &AppInstanceData);
	if (hr != DS_OK) {
		sprintf(warning,"cannot enumerate DirectSound devices");	
		return FALSE;
	}
	if (AppInstanceData.NumOfDevices == 0)	    {
        sprintf(warning,"NO DirectSound DEVICE INSTALLED!!!!\n");
        return FALSE;
    } 
	
	lpGuid = AppLetUserSelectDevice(&AppInstanceData,DevSelected, &NumDevSelected );
	
	hr = DirectSoundCreate(lpGuid, &lpDirectSound,	NULL);
	if(hr != DS_OK) {
		sprintf(warning,"unable to create a DirectSound object\n");
		return FALSE;
	}
	dscaps.dwSize = sizeof(DSCAPS);
	hr = lpDirectSound->lpVtbl->GetCaps(lpDirectSound,&dscaps);
   	if(hr != DS_OK) {
		sprintf(warning,"unable to get the capabilities of the DirectSound object just created\n");
		return FALSE;
	}
	flags = dscaps.dwFlags;
	printf("\nDSCAPS_PRIMARYMONO: %d\n",(flags & DSCAPS_PRIMARYMONO) && 1);
	printf("DSCAPS_PRIMARYSTEREO: %d\n",(flags & DSCAPS_PRIMARYSTEREO) && 1 );
	printf("DSCAPS_PRIMARY8BIT: %d\n",(flags & DSCAPS_PRIMARY8BIT) && 1 );
	printf("DSCAPS_PRIMARY16BIT: %d\n",(flags & DSCAPS_PRIMARY16BIT) && 1 );
	printf("DSCAPS_CONTINUOUSRATE: %d\n",(flags & DSCAPS_CONTINUOUSRATE) && 1 );
	printf("DSCAPS_EMULDRIVER: %d\n",(flags & DSCAPS_EMULDRIVER) && 1 );
	printf("DSCAPS_CERTIFIED: %d\n",(flags & DSCAPS_CERTIFIED) && 1 );
	printf("DSCAPS_SECONDARYMONO: %d\n",(flags & DSCAPS_SECONDARYMONO) && 1 );
	printf("DSCAPS_SECONDARYSTEREO: %d\n",(flags & DSCAPS_SECONDARYSTEREO) && 1 );
	printf("DSCAPS_SECONDARY8BIT: %d\n",(flags & DSCAPS_SECONDARY8BIT) && 1 );
#ifndef GAB_WIN	
	if(!init_window(&hwnd)) {
			sprintf(warning,"unable to create a window handle for DirectSound\n");
			return FALSE;
	}
#else
	hwnd = MainDialogHandle;
#endif
	if (!secondary_flag) {
		if(!AppCreateWritePrimaryBuffer( lpDirectSound, &lpDsb, &dwBufferSize , hwnd, nchnls, esr)) {
			sprintf(warning,"unable to create a primary buffer for DirectSound,\nmaybe DirectX is not installed or the driver of the selected audio port can support DirectX only in emulation mode\n");
			return FALSE;
		}
	} else {
		if(!AppCreateSecondaryBuffer( lpDirectSound, &lpDsb, &dwBufferSize , hwnd, nchnls, esr)) {
			sprintf(warning,"unable to create a secondary buffer for DirectSound\n");
			return FALSE;
		}
	}

	DsBuf = lpDsb;
	DsGetCurrentPosition = lpDsb->lpVtbl->GetCurrentPosition;
	DsLock = DsBuf->lpVtbl->Lock;
	DsUnlock = DsBuf->lpVtbl->Unlock;
	printf("\nDirectSound device #%i enabled( %s )\n\n",NumDevSelected,DevSelected);   
	if (secondary_flag) {
		LPVOID lpvPtr1,lpvPtr2;
		DWORD dwBytes1,dwBytes2;
		DsLock(DsBuf, 0, dwBufferSize, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			FillMemory(lpvPtr1,dwBufferSize,0);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
	}

	hr = lpDsb->lpVtbl->Play(lpDsb, 0, 0,  DSBPLAY_LOOPING);
	if(hr != DS_OK) {
		sprintf(warning,"the DirectSound object just created is unable to play\n");
		return FALSE;
	}
	return TRUE;
}

void DsoundStop()
{
	DsBuf->lpVtbl->Stop(DsBuf);
}

/* ------------------------------*/
/*
void PlayDsoundNowait(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor;
		DWORD dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		static DWORD nrec=1;
		LPVOID lpvPtr1;
	    DWORD dwBytes1; 
		LPVOID lpvPtr2;
		DWORD dwBytes2;
		do {	
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor) 	nrec++;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwBufferSize * nrec + dwCurrentPlayCursor < LastWritePosition);
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(lpvPtr1, outbuf, dwBytes1);
        if(NULL != lpvPtr2) {
			CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		}
        DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
}
*/


/*******************************************************************/
/********* 3D AUDIO DirectSound3D and EAX.         *****************/
/********* You have to define the EAX_GAB macro    *****************/
/********* in order to activate EAX audio features *****************/
/********* In this case EAX SDK is required.       *****************/
/*******************************************************************/


BOOL CreateDs3d(char *warning, DS3D *instance) {
    WAVEFORMATEX wfx;
	DSBUFFERDESC dsbdesc;
    DSBCAPS dsbcaps;
    HRESULT hr;
	DS3DBUFFER butta;
	LPVOID lpvPtr1,lpvPtr2;
	DWORD dwBytes1,dwBytes2;

	memset(&wfx, 0, sizeof(WAVEFORMATEX));
    wfx.wFormatTag = WAVE_FORMAT_PCM;
    wfx.nChannels = 1; //channels
    wfx.nSamplesPerSec = (int) esr;
    wfx.wBitsPerSample = 16;
	wfx.nBlockAlign =  wfx.nChannels*(wfx.wBitsPerSample>>3);
    wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign;
    memset(&dsbdesc, 0, sizeof(DSBUFFERDESC)); 
    dsbdesc.dwSize = sizeof(DSBUFFERDESC);
    dsbdesc.dwFlags = DSBCAPS_CTRLVOLUME | DSBCAPS_GLOBALFOCUS | DSBCAPS_CTRL3D;
    dsbdesc.dwBufferBytes =   SECONDARY_BUFFER_LENGTH; 
    dsbdesc.lpwfxFormat = &wfx;
	
	hr=lpDirectSound->lpVtbl->CreateSoundBuffer(lpDirectSound, &dsbdesc, &(instance->Dsb), NULL);
		if (DS_OK != hr) { sprintf(warning,"unable to create a secondary buffer for 3D audio\n"); return FALSE; }
	
	hr=(HRESULT) (instance->Dsb)->lpVtbl->QueryInterface(instance->Dsb, &IID_IDirectSound3DBuffer, &(instance->Ds3Db));
		if (DS_OK != hr) { sprintf(warning,"unable to create a 3D-buffer interface\n"); return FALSE; }
	butta.dwSize = sizeof(DS3DBUFFER);
	//hr=(instance->Ds3Db)->lpVtbl->GetAllParameters( instance->Ds3Db, &butta);
	//	if (DS_OK != hr) { sprintf(warning,"unable to get parameters from the 3D-buffer interface just created\n"); return FALSE; }

	dsbcaps.dwSize = sizeof(DSBCAPS);
	hr=(instance->Dsb)->lpVtbl->GetCaps(instance->Dsb, &dsbcaps);
	instance->dwBufferSize = dsbcaps.dwBufferBytes;
		if(DS_OK != hr) { sprintf(warning,"unable to create a secondary 3D-buffer\n"); return FALSE; }
	instance->GetCurrentPosition = instance->Dsb->lpVtbl->GetCurrentPosition;
	instance->Lock = instance->Dsb->lpVtbl->Lock;
	instance->Unlock = instance->Dsb->lpVtbl->Unlock;
	instance->LastWritePosition=0;
	instance->OldPlayCursor=0;
	instance->dwBufferSize=dsbdesc.dwBufferBytes;
	instance->Lock(instance->Dsb , 0, dsbdesc.dwBufferBytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			FillMemory(lpvPtr1,dsbdesc.dwBufferBytes,0);
	instance->Unlock(instance->Dsb, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
	
	hr = (instance->Dsb)->lpVtbl->Play( instance->Dsb , 0, 0,  DSBPLAY_LOOPING);
	if(hr != DS_OK) { sprintf(warning,"the 3D-buffer just created is unable to play\n"); return FALSE; }
	return TRUE;
};



#ifdef GAB_EAX

BOOL CreateEAXinterface(char *warning, DS3D *instance) 
{
	HRESULT hr;
	ULONG support=0;

	static int flag=0;

  if (!flag) { // create EAX-Listener interface
	hr=(instance->Ds3Db)->lpVtbl->QueryInterface(instance->Ds3Db, &IID_IKsPropertySet, (void**) &EAXListener);
		if (DS_OK != hr) { sprintf(warning,"unable to create the EAX-Listener interface\n"); return FALSE; }
	hr=EAXListener->lpVtbl->QuerySupport(EAXListener, &DSPROPSETID_EAX_ListenerProperties,DSPROPERTY_EAXLISTENER_ALLPARAMETERS, &support);
		if (DS_OK != hr) { sprintf(warning,"EAX-Listener not supported\n"); return FALSE; }
	flag=1;
  }
	hr=(instance->Ds3Db)->lpVtbl->QueryInterface(instance->Ds3Db, &IID_IKsPropertySet, (void**) &(instance->EAXb) );
		if (DS_OK != hr) { sprintf(warning,"unable to create the EAX-Listener interface\n"); return FALSE; }
	return TRUE;

}

#endif //GAB_EAX


BOOL CreateDsListner(char *warning) {
	WAVEFORMATEX wfx;
	DSBUFFERDESC dsbdesc;
    HRESULT hr;
	DS3DLISTENER list;


	memset(&wfx, 0, sizeof(WAVEFORMATEX));
    wfx.wFormatTag = WAVE_FORMAT_PCM;
    wfx.nChannels = 1; //channels
    wfx.nSamplesPerSec = (int) esr;
    wfx.wBitsPerSample = 16;
	wfx.nBlockAlign =  wfx.nChannels*(wfx.wBitsPerSample>>3);
    wfx.nAvgBytesPerSec = wfx.nSamplesPerSec * wfx.nBlockAlign;
    memset(&dsbdesc, 0, sizeof(DSBUFFERDESC)); 
    dsbdesc.dwSize = sizeof(DSBUFFERDESC);
    dsbdesc.dwFlags = DSBCAPS_PRIMARYBUFFER | DSBCAPS_CTRL3D ;
    dsbdesc.dwBufferBytes =   0; 
    dsbdesc.lpwfxFormat = NULL;
	hr = lpDirectSound->lpVtbl->CreateSoundBuffer(lpDirectSound, &dsbdesc, &lpDslb, NULL);
	hr = lpDslb->lpVtbl->QueryInterface(lpDslb, &IID_IDirectSound3DListener,  &Listener);
	list.dwSize=sizeof(DS3DLISTENER);
	hr = Listener->lpVtbl->SetDopplerFactor( Listener, 0.0 , DS3D_IMMEDIATE);
	//hr = Listener->lpVtbl->GetAllParameters( Listener, &list);
	if (DS_OK != hr) {	
		sprintf(warning,"unable to create the 3D-Listener\n");
		return FALSE;
	}
	return TRUE;
};

void DirectSound_exit()
{
	
	extern int nspout3D[],spout3Dnum;
	extern DS3D *instance3D[];
	extern LPDIRECTSOUNDCAPTURE lpDirectSoundCapture;
	extern LPDIRECTSOUNDCAPTUREBUFFER DscBuf;

	ULONG ret;
	int j, nret;

	for (j=0; j < spout3Dnum; j++) {
		if (instance3D[j]->Dsb != NULL) {
			nret = instance3D[j]->Dsb->lpVtbl->Release(instance3D[j]->Dsb);
			instance3D[j]->Dsb = NULL;
		}
		if (instance3D[j]->Ds3Db != NULL) {
			nret = instance3D[j]->Ds3Db->lpVtbl->Release(instance3D[j]->Ds3Db);
			instance3D[j]->Ds3Db = NULL;
		}
	}
	if (DsBuf != NULL) {
		do {
			ret = DsBuf->lpVtbl->Release(DsBuf);
		} while (ret > 0);
	}
	DsBuf = NULL;
	if (lpDslb != NULL)	{
		nret = lpDslb->lpVtbl->Release(lpDslb);
		lpDslb = NULL;
	}
	if (Listener != NULL) {
		nret = Listener->lpVtbl->Release(Listener);
		Listener = NULL;
	}
	if (DscBuf != NULL)	{
		nret = DscBuf->lpVtbl->Release(DscBuf);
		DscBuf = NULL;
	}

	if (lpDirectSoundCapture != NULL) {
		nret = lpDirectSoundCapture->lpVtbl->Release(lpDirectSoundCapture);
		lpDirectSoundCapture = NULL;
	}
	if (lpDirectSound != NULL) {
		do {
			ret = lpDirectSound->lpVtbl->Release(lpDirectSound); 
		} while (ret > 0);
	}
	lpDirectSound = NULL;
		
}

/*
typedef struct {
	LPDIRECTSOUNDBUFFER Dsb;
	LPDIRECTSOUND3DBUFFER Ds3Db;
	LPKSPROPERTYSET EAXb;
	DWORD LastWritePosition;
	DWORD dwBufferSize;
	HRESULT  (WINAPI *GetCurrentPosition)(LPDIRECTSOUNDBUFFER, LPDWORD, LPDWORD);
	HRESULT  (WINAPI *Lock)(LPDIRECTSOUNDBUFFER, DWORD, DWORD, LPVOID, LPDWORD, LPVOID, LPDWORD, DWORD);
	HRESULT  (WINAPI *Unlock)(LPDIRECTSOUNDBUFFER, LPVOID, DWORD, LPVOID, DWORD);
} DS3D;
*/