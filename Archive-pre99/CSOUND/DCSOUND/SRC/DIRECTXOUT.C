#include <windows.h>
#include "cs.h"
#include <malloc.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <math.h>

#include "dsbuffer.h"
#include "DXdevices.h"

extern DWORD dwBufferSize;
extern LPDIRECTSOUNDBUFFER DsBuf;
extern LPDIRECTSOUND3DLISTENER Listener;
extern void  (*write_to_file) (char *, int);
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
void Dsound3d(char *outbuf, int nbytes, DS3D *instance)
{
		LPVOID lpvPtr1;
	    DWORD dwBytes1; 
		LPVOID lpvPtr2;
		DWORD dwBytes2;
/*
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;

		{
			instance->GetCurrentPosition(instance->Dsb, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < instance->OldPlayCursor) // jump to buffer start
				instance->LastWritePosition %= instance->dwBufferSize;
			instance->OldPlayCursor = dwCurrentPlayCursor;
		} 
		if (dwCurrentPlayCursor < instance->LastWritePosition) {
			return;
		}
*/		
		instance->LastWritePosition += nbytes;
		instance->LastWritePosition %= instance->dwBufferSize;
		instance->Lock(instance->Dsb, instance->LastWritePosition, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(lpvPtr1, outbuf, dwBytes1);
        if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		instance->Unlock(instance->Dsb, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
}
/*
void Dsound3d(char *outbuf, int nbytes, DS3D *instance)
{
		LPVOID lpvPtr1;
	    DWORD dwBytes1; 
		LPVOID lpvPtr2;
		DWORD dwBytes2;

		instance->LastWritePosition += nbytes;
		instance->LastWritePosition %= instance->dwBufferSize;
		instance->Lock(instance->Dsb, instance->LastWritePosition, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
        CopyMemory(lpvPtr1, outbuf, dwBytes1);
        if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		instance->Unlock(instance->Dsb, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
}
*/

MSG messg;
extern HWND MainDialogHandle;

void PlayDsoundNowait(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD  dwBytes1, dwBytes2; 
		//static DWORD c = 0;
		
		do {
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor) // jump to buffer start
				LastWritePosition %= dwBufferSize;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwCurrentPlayCursor < LastWritePosition);
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			CopyMemory(lpvPtr1, outbuf, dwBytes1);
			if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
}

/*

void PlayDsoundNowait(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD  dwBytes1, dwBytes2; 
		
		do {	
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor)  // jump to buffer start
					LastWritePosition %= dwBufferSize;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwCurrentPlayCursor < LastWritePosition) ;
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			CopyMemory(lpvPtr1, outbuf, dwBytes1);
			if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
}
*/



void PlayDsoundSleep(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD  dwBytes1, dwBytes2; 
		do {	
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor)  /* jump to buffer start */
					LastWritePosition %= dwBufferSize;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwCurrentPlayCursor < LastWritePosition);
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			CopyMemory(lpvPtr1, outbuf, dwBytes1);
			if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		Sleep(1);
}

void PlayDsoundAndFileNowait(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD  dwBytes1, dwBytes2; 

		do {	
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor)  /* jump to buffer start */
					LastWritePosition %= dwBufferSize;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwCurrentPlayCursor < LastWritePosition);
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			CopyMemory(lpvPtr1, outbuf, dwBytes1);
			if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		write_to_file(outbuf, nbytes);
}

void PlayDsoundAndFileSleep(char *outbuf, int nbytes)
{
		DWORD dwCurrentPlayCursor, dwCurrentWriteCursor;
		static DWORD LastWritePosition=0;
		static DWORD OldPlayCursor=0;
		LPVOID lpvPtr1, lpvPtr2;
	    DWORD  dwBytes1, dwBytes2; 
		do {	
			DsGetCurrentPosition(DsBuf, &dwCurrentPlayCursor, &dwCurrentWriteCursor);
			if (dwCurrentPlayCursor < OldPlayCursor)  /* jump to buffer start */
					LastWritePosition %= dwBufferSize;
			OldPlayCursor = dwCurrentPlayCursor;
		} while (dwCurrentPlayCursor < LastWritePosition);
		LastWritePosition += nbytes;
		DsLock(DsBuf, LastWritePosition % dwBufferSize, nbytes, &lpvPtr1, &dwBytes1, &lpvPtr2, &dwBytes2, 0);
			CopyMemory(lpvPtr1, outbuf, dwBytes1);
			if(NULL != lpvPtr2) CopyMemory(lpvPtr2, outbuf+dwBytes1, dwBytes2);
		DsUnlock(DsBuf, lpvPtr1, dwBytes1, lpvPtr2, dwBytes2);
		Sleep(1);
		write_to_file(outbuf, nbytes);
}
