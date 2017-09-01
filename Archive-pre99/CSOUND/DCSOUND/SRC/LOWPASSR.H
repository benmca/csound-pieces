
typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kfco, *kres, *istor;
	MYFLT	ynm1, ynm2;  
} LOWPR;


typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kfco, *kres, *ord, *istor;
	MYFLT	ynm1[10], ynm2[10] ;   
	int	loop;
} LOWPRX;

typedef	struct {
	OPDS	h;
	MYFLT	*ar, *asig, *kfco, *kres, *ord, *sep;
	MYFLT	ynm1[10], ynm2[10], cut[10];  
	int	loop;
} LOWPR_SEP;
