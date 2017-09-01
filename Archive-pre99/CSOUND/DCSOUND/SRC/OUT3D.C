#include <windows.h>
#include "dsbuffer.h"
#include "soundio.h"
#include "out3D.h"

int spoutactive3D[BUF3D_MAX];
BOOL flag3d=0;

extern MYFLT *spout3D[];
extern MYFLT *spout3D[BUF3D_MAX];
extern int nspout3D[BUF3D_MAX],spout3Dnum;
extern DS3D *instance3D[BUF3D_MAX];
extern void Dsound3d(char *outbuf, int nbytes, DS3D *instance);
extern char *outbuf3D[BUF3D_MAX];
extern unsigned int outbuf3Dsiz;
extern short *shoutbuf3Dp[BUF3D_MAX];
extern int ksmps, nchnls;
extern LPDIRECTSOUND3DLISTENER Listener;

extern BOOL secondary_flag;
extern int flprintf;

static DWORD ds3d_immediate = DS3D_IMMEDIATE;

#ifdef GAB_EAX
extern LPKSPROPERTYSET EAXListener;
BOOL flagEAX=0;
static DWORD eaxListenerFlags = EAXLISTENERFLAGS_DECAYTIMESCALE 
							  | EAXLISTENERFLAGS_REFLECTIONSSCALE
							  | EAXLISTENERFLAGS_REFLECTIONSDELAYSCALE
							  | EAXLISTENERFLAGS_REVERBSCALE
							  | EAXLISTENERFLAGS_REVERBDELAYSCALE;

static DWORD eaxSourceFlags = EAXBUFFERFLAGS_DIRECTHFAUTO 
							| EAXBUFFERFLAGS_ROOMAUTO
							| EAXBUFFERFLAGS_ROOMHFAUTO;

static DWORD eax_immediate = DSPROPERTY_EAXLISTENER_IMMEDIATE;

/*------------ EAX 2.0 API ----------------*/

void init_eax(COMMIT_DEFERRED *p)
{
	flagEAX=TRUE;
}

void eaxListEnvir(EAX_PARM *p)
{
	DWORD envID = (DWORD) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ENVIRONMENT | eax_immediate,	NULL, 0,  &envID,  sizeof(DWORD));
}

void eaxListEnvirSize(EAX_PARM *p)
{
	MYFLT envSiz = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ENVIRONMENTSIZE | eax_immediate,	NULL, 0,  &envSiz,  sizeof(MYFLT));
}

void eaxListEnvirDiffusion(EAX_PARM *p)
{
	MYFLT envDiff = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ENVIRONMENTDIFFUSION | eax_immediate, NULL, 0,  &envDiff,  sizeof(MYFLT));
}

void eaxListRoom(EAX_PARM *p)
{
	LONG ListRoom = (LONG) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ROOM | eax_immediate, NULL, 0,  &ListRoom,  sizeof(LONG));
}

void eaxListRoomHF(EAX_PARM *p)
{
	LONG ListRoomHF = (LONG) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ROOMHF | eax_immediate,	NULL, 0,  &ListRoomHF,  sizeof(LONG));
}

void eaxListDecayTime(EAX_PARM *p)
{
	MYFLT ListDecay = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_DECAYTIME | eax_immediate, NULL, 0,  &ListDecay,  sizeof(MYFLT));
}

void eaxListDecayTimeHF(EAX_PARM *p)
{
	MYFLT ListDecayHF = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_DECAYHFRATIO | eax_immediate, NULL, 0,  &ListDecayHF,  sizeof(MYFLT));
}

void eaxListReflec(EAX_PARM *p)
{
	LONG ListRefl = (LONG) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_REFLECTIONS | eax_immediate,	NULL, 0,  &ListRefl,  sizeof(LONG));
}

void eaxListReflecDel(EAX_PARM *p)
{
	MYFLT ListReflDel = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_REFLECTIONSDELAY | eax_immediate,	NULL, 0,  &ListReflDel,  sizeof(MYFLT));
}


void eaxListReverb(EAX_PARM *p)
{
	LONG ListRev = (LONG) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_REVERB | eax_immediate,	NULL, 0,  &ListRev,  sizeof(LONG));
}

void eaxListReverbDel(EAX_PARM *p)
{
	MYFLT ListRevDel = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_REVERBDELAY | eax_immediate,	NULL, 0,  &ListRevDel,  sizeof(MYFLT));
}

void eaxListRoomRolloff(EAX_PARM *p)
{
	MYFLT ListRoomRoll = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ROOMROLLOFFFACTOR | eax_immediate,	NULL, 0,  &ListRoomRoll,  sizeof(MYFLT));
}

void eaxListAirAbsHF(EAX_PARM *p)
{
	MYFLT ListAirAbs = (MYFLT) *p->parm;
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_AIRABSORPTIONHF | eax_immediate,	NULL, 0,  &ListAirAbs,  sizeof(MYFLT));
}

void eaxListFlags(EAX_LISTFLAGS *p)
{
	eaxListenerFlags = 
		((*p->p1) ? EAXLISTENERFLAGS_DECAYTIMESCALE        : 0) | // reverberation decay time
		((*p->p2) ? EAXLISTENERFLAGS_REFLECTIONSSCALE      : 0) | // reflection level
		((*p->p3) ? EAXLISTENERFLAGS_REFLECTIONSDELAYSCALE : 0) | // initial reflection delay time
		((*p->p4) ? EAXLISTENERFLAGS_REVERBSCALE           : 0) | // reflections level
		((*p->p5) ? EAXLISTENERFLAGS_REVERBDELAYSCALE      : 0) | // late reverberation delay time
		((*p->p6) ? EAXLISTENERFLAGS_DECAYHFLIMIT          : 0) ; // limits high-frequency decay time... 
																  // ...according to air absorption
	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_FLAGS | eax_immediate,	NULL, 0,  &eaxListenerFlags,  sizeof(DWORD));
}

void eaxListAll(EAX_LISTALL *p)
{	
	EAXLISTENERPROPERTIES props;

	props.dwEnvironment =		(DWORD) *p->p1,// sets all listener properties
	props.flEnvironmentSize =	(MYFLT) *p->p2,// environment size in meters
	props.flEnvironmentDiffusion=(MYFLT)*p->p3,// environment diffusion
	props.lRoom =				(LONG)  *p->p4, // room effect level at low frequencies
	props.lRoomHF =				(LONG)  *p->p5, // room effect high-frequency level re. low frequency level
	props.flDecayTime =			(MYFLT) *p->p6, // reverberation decay time at low frequencies
	props.flDecayHFRatio =		(MYFLT) *p->p7, // high-frequency to low-frequency decay time ratio
	props.lReflections =		(LONG)  *p->p8, // early reflections level relative to room effect
	props.flReflectionsDelay =	(MYFLT) *p->p9, // initial reflection delay time
	props.lReverb =				(LONG)  *p->p10, // late reverberation level relative to room effect
	props.flReverbDelay =		(MYFLT) *p->p11, // late reverberation delay time relative to initial reflection
	props.flRoomRolloffFactor =	(MYFLT) *p->p12, // like DS3D flRolloffFactor but for room effect
	props.flAirAbsorptionHF =	(MYFLT) *p->p13,// change in level per meter at 5 kHz
	props.dwFlags = eaxListenerFlags;			// modifies the behavior of properties

	EAXListener->lpVtbl->Set( EAXListener, &DSPROPSETID_EAX_ListenerProperties,
		DSPROPERTY_EAXLISTENER_ALLPARAMETERS, NULL, 0, &props, sizeof(EAXLISTENERPROPERTIES));
}

void eaxSoDirect(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG direct = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_DIRECT | eax_immediate,	NULL, 0,  &direct,  sizeof(LONG));
}

void eaxSoDirectHF(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG directHF = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_DIRECTHF | eax_immediate,	NULL, 0,  &directHF,  sizeof(LONG));
}

void eaxSoRoom(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG room = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_ROOM | eax_immediate,	NULL, 0,  &room,  sizeof(LONG));
}

void eaxSoRoomHF(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG roomHF = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_ROOMHF | eax_immediate,	NULL, 0,  &roomHF,  sizeof(LONG));
}


void eaxSoObstruct(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG obstruct = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OBSTRUCTION | eax_immediate,	NULL, 0,  &obstruct,  sizeof(LONG));
}


void eaxSoObstructRatio(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	MYFLT obstructRatio = (MYFLT) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OBSTRUCTIONLFRATIO | eax_immediate, NULL, 0,  &obstructRatio,  sizeof(MYFLT));
}

void eaxSoOccl(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG occl = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OCCLUSION | eax_immediate,	NULL, 0,  &occl,  sizeof(LONG));
}

void eaxSoOcclRatio(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	MYFLT occlRatio = (MYFLT) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OCCLUSIONLFRATIO | eax_immediate,	NULL, 0,  &occlRatio,  sizeof(MYFLT));
}

void eaxSoOcclRoom(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	MYFLT occlRoom = (MYFLT) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OCCLUSIONROOMRATIO | eax_immediate,	NULL, 0,  &occlRoom,  sizeof(MYFLT));
}

void eaxSoRolloff(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	MYFLT rolloff = (MYFLT) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_ROOMROLLOFFFACTOR | eax_immediate,	NULL, 0,  &rolloff,  sizeof(MYFLT));
}

void eaxSoAirAbs(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	MYFLT airabs = (MYFLT) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_AIRABSORPTIONFACTOR | eax_immediate,	NULL, 0,  &airabs,  sizeof(MYFLT));
}

void eaxSoOutVol(EAX_SOURCEPARM *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	LONG outvol = (LONG) *p->parm;
	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_OUTSIDEVOLUMEHF | eax_immediate,	NULL, 0,  &outvol,  sizeof(LONG));
}

void eaxSoFlags(EAX_SOURCEFLAGS *p)
{
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	eaxSourceFlags = 
		((*p->p1) ? EAXBUFFERFLAGS_DIRECTHFAUTO : 0) | // Direct HF Auto
		((*p->p2) ? EAXBUFFERFLAGS_ROOMAUTO     : 0) | // Room Auto
		((*p->p3) ? EAXBUFFERFLAGS_ROOMHFAUTO   : 0) ; // Room HF Auto

	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_FLAGS | eax_immediate,	NULL, 0,  &eaxSourceFlags,  sizeof(DWORD));
}

void eaxSoAll(EAX_SOURCEALL *p)
{	
	LPKSPROPERTYSET EAXsource = instance3D[(long) *p->num]->EAXb;
	EAXBUFFERPROPERTIES props;

    props.lDirect =				(LONG)  *p->p1,  // direct path level
    props.lDirectHF =			(LONG)  *p->p2,  // direct path level at high frequencies
    props.lRoom  =				(LONG)  *p->p3,  // room effect level
    props.lRoomHF =				(LONG)  *p->p4,  // room effect level at high frequencies
    props.lObstruction =		(LONG)  *p->p5,  // main obstruction control (attenuation at high frequencies) 
    props.flObstructionLFRatio= (MYFLT) *p->p6,  // obstruction low-frequency level re. main control
    props.lOcclusion =			(LONG)  *p->p7,  // main occlusion control (attenuation at high frequencies)
    props.flOcclusionLFRatio =	(MYFLT) *p->p8,  // occlusion low-frequency level re. main control
    props.flOcclusionRoomRatio= (MYFLT) *p->p9, // occlusion room effect level re. main control
	props.flRoomRolloffFactor = (MYFLT) *p->p10,  // like DS3D flRolloffFactor but for room effect
    props.flAirAbsorptionFactor= (MYFLT)*p->p11, // multiplies DSPROPERTY_EAXLISTENER_AIRABSORPTIONHF
    props.lOutsideVolumeHF =	(LONG)  *p->p12, // outside sound cone level at high frequencies
    props.dwFlags = eaxSourceFlags;              // modifies the behavior of properties

	EAXsource->lpVtbl->Set( EAXsource, &DSPROPSETID_EAX_BufferProperties,
		DSPROPERTY_EAXBUFFER_ALLPARAMETERS, NULL, 0, &props, sizeof(EAXBUFFERPROPERTIES));

}
#endif // GAB_EAX

/*-------------------*/

void dsSetDeferredFlag(SET_DEFERRED *p)
{
	if(*p->flag) {
		ds3d_immediate = DS3D_DEFERRED;
		#ifdef	GAB_EAX
		eax_immediate = DSPROPERTY_EAXLISTENER_DEFERRED;
		#endif
	}
	else {
		ds3d_immediate = DS3D_IMMEDIATE;
		#ifdef	GAB_EAX
		eax_immediate = DSPROPERTY_EAXLISTENER_IMMEDIATE;
		#endif
	}
}

void dsCommitDeferred(COMMIT_DEFERRED *p)
{
	Listener->lpVtbl->CommitDeferredSettings(Listener);
}

/*-------- DirectSound 3D API ----------------*/

void o3dpos(OUT3DPOS *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetPosition( buf, 
		(float) *p->x, (float) *p->y, (float) *p->z, ds3d_immediate);
}

void o3dmindist(OUT3DDIST *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetMinDistance( buf, 
		(float) *p->distance, ds3d_immediate);

}

void o3dmaxdist(OUT3DDIST *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetMaxDistance( buf, 
		(float) *p->distance, ds3d_immediate);
}

void o3dconeang(OUT3DCONEANG *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetConeAngles( buf, 
		(DWORD) *p->inside, (DWORD) *p->outside, ds3d_immediate);
}

void o3dconeorient(OUT3DPOS *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetConeOrientation( buf, 
		(float) *p->x, (float) *p->y, (float) *p->z, ds3d_immediate);
}

void o3dconevolume(OUT3DCONEVOL *p)
{
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetConeOutsideVolume( buf, 
		(LONG) *p->volume, ds3d_immediate);
}


void o3dmode(OUT3DMODE *p)
{
	/*
	#define DS3DMODE_NORMAL             0x00000000
	#define DS3DMODE_HEADRELATIVE       0x00000001
	#define DS3DMODE_DISABLE            0x00000002
    */
	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	buf->lpVtbl->SetMode( buf, 
		(DWORD) *p->mode, ds3d_immediate);
}


void o3dsetAll(OUT3DSETALL *p)
{

	DS3DBUFFER parms;
	

	LPDIRECTSOUND3DBUFFER buf = instance3D[(long) *p->num]->Ds3Db;
	parms.dwSize = sizeof(DS3DBUFFER);
	parms.vVelocity.x = (D3DVALUE) 0.;
	parms.vVelocity.y = (D3DVALUE) 0.;
	parms.vVelocity.z = (D3DVALUE) 0.;


	parms.dwMode = (DWORD) *p->p1;
    parms.vPosition.x = (D3DVALUE) *p->p2;
	parms.vPosition.y = (D3DVALUE) *p->p3;
	parms.vPosition.z = (D3DVALUE) *p->p4;
    parms.flMinDistance = (D3DVALUE) *p->p5;
    parms.flMaxDistance = (D3DVALUE) *p->p6;
    parms.dwInsideConeAngle = (DWORD) *p->p7;
    parms.dwOutsideConeAngle = (DWORD) *p->p8;
    parms.vConeOrientation.x = (D3DVALUE) *p->p9;
	parms.vConeOrientation.y = (D3DVALUE) *p->p10;
	parms.vConeOrientation.z = (D3DVALUE) *p->p11;
    parms.lConeOutsideVolume = (LONG) *p->p12;
    


	buf->lpVtbl->SetAllParameters( buf, 
		&parms, ds3d_immediate);
}


void list_setAll(LISTSETALL *p)
{

	DS3DLISTENER parms;
	
	parms.dwSize = sizeof(DS3DLISTENER);
	parms.vVelocity.x = (D3DVALUE) 0.;
	parms.vVelocity.y = (D3DVALUE) 0.;
	parms.vVelocity.z = (D3DVALUE) 0.;
    parms.flDopplerFactor = (D3DVALUE) 0;

    parms.vPosition.x = (D3DVALUE) *p->p1;
	parms.vPosition.y = (D3DVALUE) *p->p2;
	parms.vPosition.z = (D3DVALUE) *p->p3;
    parms.vOrientFront.x = (D3DVALUE) *p->p4;
	parms.vOrientFront.y = (D3DVALUE) *p->p5;
	parms.vOrientFront.z = (D3DVALUE) *p->p6;
    parms.vOrientTop.x = (D3DVALUE) *p->p7;
	parms.vOrientTop.y = (D3DVALUE) *p->p8;
	parms.vOrientTop.z = (D3DVALUE) *p->p9;
    parms.flRolloffFactor = (D3DVALUE) *p->p10;
    parms.flDistanceFactor = (D3DVALUE) *p->p11;

    
/*
    DWORD      dwSize;
    D3DVECTOR  vPosition;
    D3DVECTOR  vVelocity;
    D3DVECTOR  vOrientFront;
    D3DVECTOR  vOrientTop;
    D3DVALUE   flDistanceFactor;
    D3DVALUE   flRolloffFactor;
    D3DVALUE   flDopplerFactor;
*/


	Listener->lpVtbl->SetAllParameters( Listener, 
		&parms, ds3d_immediate);
}


void list_pos(LISTPOS *p)
{
	Listener->lpVtbl->SetPosition( Listener, 
		(float) *p->x, (float) *p->y, (float) *p->z, ds3d_immediate);
}

void list_or(LISTOR *p)
{
	Listener->lpVtbl->SetOrientation( Listener, 
		(float) *p->xFront, (float) *p->yFront, (float) *p->zFront, 
		(float) *p->xTop,   (float) *p->yTop,   (float) *p->zTop, 
		ds3d_immediate);
}


void list_rolloff(LISTROLL *p)
{
	Listener->lpVtbl->SetRolloffFactor( Listener, 
		(float) *p->rolloff, ds3d_immediate);
}

void list_distance(LISTDIST *p)
{
	Listener->lpVtbl->SetDistanceFactor( Listener, 
		(float) *p->distance, ds3d_immediate);
}

void init3d(INIT3D *p)
{
	int  j;

	if (nchnls !=1)  {
		flprintf=0;
		printf("init3d error: can't create directX 3D buffers when nchnls != 1. Try to set nchnls = 1");
		MessageBox( NULL,	// handle of owner window
				"init3d error: can't create directX 3D buffers when nchnls != 1\nTry to set nchnls = 1",	// address of text in message box
                "DirectCsound fatal error",	// address of title of message box  
                MB_SYSTEMMODAL | MB_ICONSTOP 	// style of message box
		);
		exit(0);
	}
	secondary_flag =1; /* froces to use secondary buffers */
	spout3Dnum = (int) *p->num;
	outbuf3Dsiz = (unsigned)O.outbufsamps * sizeof(short);/* calc outbuf size */

	O.outformat = AE_D3D; 

	for (j=0; j < spout3Dnum; j++) {
		nspout3D[j]= ksmps;
		spout3D[j] = (MYFLT *) mcalloc((long) nspout3D[j] * sizeof(MYFLT)); 
		instance3D[j] = (DS3D *) mcalloc(sizeof(DS3D));
		outbuf3D[j] = mcalloc((long)3000/*outbuf3Dsiz*/); 
		shoutbuf3Dp[j] = (short *) outbuf3D[j];
		flag3d=1;
		spoutactive3D[j]=0;
	}

}

void out3d_set(OUT3D *p)
{
	
	if (*p->num >= spout3Dnum) {
		initerror("o3d -> no legal 3D output number");
	}
}
 
void out3d(OUT3D *p)
{
	MYFLT	*sp, *ap;
	int	nsmps = ksmps;
	long num = (long) *p->num;
	ap = p->asig;
	sp = spout3D[num];
	if (!spoutactive3D[num]) {
		do 	*sp++ = *ap++;
		while (--nsmps);
		spoutactive3D[num] = 1;
	}
	else {
		do {
			*sp += *ap++;   
			sp++;
		}
		while (--nsmps);
	}
}

