typedef struct {
    	OPDS   h;
		MYFLT  *argums[VARGMAX];
} ICALL;

typedef struct {
    	OPDS   h;
		MYFLT  *ktrig,*argums[VARGMAX];
} TCALL;


typedef struct {
    	OPDS   h;
		MYFLT	*argums[VARGMAX];
		int		instance_num, flag;
		short	*relesing;
} MICALL;


typedef struct {
    	OPDS   h;
		MYFLT	*argums[VARGMAX];
		long   actime;
		int insno, active_flag;
		EVTBLK *e;
} DICALL;

typedef struct {
    	OPDS   h;
		MYFLT  *argums[VARGMAX];
		long   actime;
		int insno, instance_num, flag, active_flag;
		EVTBLK *e;
		short *relesing;
} DMICALL;



typedef struct {
    	OPDS   h;
		MYFLT	*argums[VARGMAX];
		MYFLT	**target_argums;
} KARGC;


typedef struct {
    	OPDS   h;
		MYFLT	*argums[VARGMAX];
		KARGC	*caller_p;
} KARGT;



typedef struct {
    	OPDS   h;
		MYFLT 	*a1,*a2,a3;
} BUTTA;
