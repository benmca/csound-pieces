typedef struct {
	  GUID  guid;    // Storage for GUIDs.
	  char  lpstrDescription[256];	// Storage for device description strings.
} DSOUNDDEVICE, *LPDSOUNDDEVICE;

typedef struct {
	DSOUNDDEVICE	DSdevice[100]; // increased to 100 devices (hope this is sufficient!)
	int NumOfDevices;
} APPINSTANCEDATA, *LPAPPINSTANCEDATA;
