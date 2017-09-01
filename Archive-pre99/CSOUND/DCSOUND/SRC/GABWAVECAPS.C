#include <stdio.h>
#include <windows.h>
//#include <mmsystem.h>
#include "cs.h"
//#undef printf
#ifdef GAB_WIN
extern HWND MainDialogHandle;
#endif
extern int gabscanf(LPSTR text, LPSTR title);	

int  ChooseAudioOutDev(void) {

	WAVEOUTCAPS  woc;	/* address of structure for capabilities*/
  	int DeviceNUM;
    int j,OutDev;
	char str[256],	str2[1024];
    DeviceNUM = waveOutGetNumDevs();
    if(DeviceNUM==0) {
        sprintf(str,"\n NO WAVE OUT DEVICE INSTALLED!\n");
		printf(str);
#ifdef GAB_WIN
		MessageBox( MainDialogHandle,str,"DirectCsound: WAVE OUT warning!",MB_OK );
#else
		MessageBox( NULL,str,"DirectCsound: WAVE OUT warning!",MB_OK );
#endif
        return -1;
    } 
//    else if ( DeviceNUM==1 ) { /* if only one device is present */
//		return 0; /* choose device number 0 without prompting */
//	}
 repeat:
	*str='\0'; *str2='\0';
    sprintf(str2,"\n%i WAVE OUT Devices found\n\n",DeviceNUM);
	for (j=0;j< (int) DeviceNUM; j++) {
        waveOutGetDevCaps(j, &woc, sizeof(woc) );
		sprintf(str,"WAVE OUT device %u ->%s\n",j,woc.szPname);
		strcat(str2,str);
    }

	
	sprintf(str,"\nPlease, type WAVE OUT device number and press <RETURN>: ");
	strcat(str2,str);
	printf(str2);
	
	OutDev = gabscanf(str2, "WAVE OUT Device selection");
    
    if (OutDev < 0 || OutDev >= DeviceNUM) {
		sprintf (str,"ERROR!! Bad WAVE OUT port number. \nValid numbers are 0 to %d\n",DeviceNUM-1);
		#ifdef GAB_WIN
		MessageBox( MainDialogHandle,str,"DirectCsound: Wrong device number!",MB_OK );
		#else
		MessageBox( NULL,str,"DirectCsound: Wrong device number!",MB_OK );
		#endif
		printf(str);
		goto repeat;
	}
	printf("%d", OutDev);
    return OutDev;
}


int  ChooseAudioInDev(void) {
	
	WAVEINCAPS  wic;	/* address of structure for capabilities*/
  	int DeviceNUM;
    int j,InDev;
    DeviceNUM = waveInGetNumDevs();
    if(DeviceNUM==0) {
        printf("\n NO WAVE IN DEVICE INSTALLED!!!!\n");
        return -1;
    } 
//    else if ( DeviceNUM==1 ) { /*if only one device is present*/
//		return 0; /* choose device number 0 without prompting*/
//	}
    printf("\n%i WAVE IN Devices found\n",DeviceNUM);
	for (j=0;j< DeviceNUM; j++) {
        waveInGetDevCaps(j, &wic, sizeof(wic) );	
        printf("WAVE IN device #%u ->%s\n",j,wic.szPname); 
    }
  repeat:
    
	{
		char str[256];
		extern int gabscanf(LPSTR text, LPSTR title);
		sprintf(str,"\nPlease, type WAVE IN device number and press <RETURN>: ");
		printf(str);
		
		InDev = gabscanf(str, "WAVE IN Device selection");

	}

    if (InDev < 0 || InDev >= DeviceNUM) {
		printf ("ERROR!! Bad WAVE IN port number. Valid numbers are 0 to %d\n",DeviceNUM-1);
		goto repeat;
	}
	printf("%d", InDev);
    return InDev;
}
