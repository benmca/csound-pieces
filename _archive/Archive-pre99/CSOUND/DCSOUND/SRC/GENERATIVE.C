#include "cs.h" 
#include "cscore.h" 
#include "generative.h"

extern long kcounter;

/**---------------------------------------**/

#define MAXGENEVLISTS 20
#define MAXPARMS 20

EVLIST gen_evlist[MAXGENEVLISTS];

typedef union {
	MYFLT fl_val;
	long  lng_val;
} FLOAT_LONG;

typedef struct {
	FLOAT_LONG parm_array[20];
	int num_parms;
} PARM_ARRAY;

PARM_ARRAY parm_arrays[MAXGENEVLISTS];

extern void (*lgenplay)(EVLIST *a, PARM_ARRAY *parm_array);







//void gener1_set(GENER1 *p)	 /* trig by G.Maldonado */
//{

//}

//void gener1(GENER1 *p)	 /* trig by G.Maldonado */
//{

//}









//void lplay(EVLIST *a)           /* cscore re-entry into musmon */
//{
//        lplayed = 1;
//        if (!sectno)  printf(Str(X_448,"SECTION %d:\n"),++sectno);
//        ep = &a->e[1];            /* from 1st evlist member */
//        epend = ep + a->nevents;  /*   to last              */
//        playevents();             /* play list members      */
//}













/**---------------------------------------**/
/*
void trigseq_set(TRIGSEQ *p)	 * trig by G.Maldonado *
{
	FUNC *ftp;
	if ((ftp = ftfind(p->kfn)) == NULL) {
		  initerror("trigseq: incorrect table number");
          return;
	}
	p->done=0;
	p->table = ftp->ftable;
	p->pfn = (long)*p->kfn;
	p->ndx = (long) *p->initndx;
	p->nargs = p->INOCOUNT-5; 
}

void trigseq(TRIGSEQ *p)
{
	if (p->done) 
		return;
	else {
		int j, nargs = p->nargs;
		long start = (long) *p->kstart, loop = (long) *p->kloop; 
		long *ndx = &p->ndx;
		float *out = *p->outargs;
		
		if (p->pfn != (long)*p->kfn) {
			FUNC *ftp;
			if ( (ftp = ftfindp(p->kfn) ) == NULL) {
				perferror("trigseq: incorrect table number");
				return;
			}
			p->pfn = (long)*p->kfn;
			p->table = ftp->ftable;
		}
		if	(*p->ktrig) {
			for (j=0; j < nargs; j++) {
				*out++ = p->table[(long) (*ndx * nargs)+j];
			}
			if (loop > 0) {
				(*ndx)++;
				*ndx %= loop;
				if (*ndx == 0) 	{
					if (start == loop) {
						p->done == 1;
						return;
					}
					*ndx += start;
				}
			}
			else if (loop < 0) {
				(*ndx)--;
				while (*ndx < start) {
					if (start == loop) {
						p->done =1;
						return;
					}
					*ndx -= loop + start;
				}
			}
		}
	}
}
*/
/**---------------------------------------**/

/*


void seqtim_set(SEQTIM *p)	 * trig by G.Maldonado *
{
	FUNC *ftp;
	long start, loop;
	long *ndx = &p->ndx;
	p->pfn = (long) *p->kfn;
	if ((ftp = ftfind(p->kfn)) == NULL) {
		  initerror("seqtim: incorrect table number");
          return;
	}
	*ndx = (long) *p->initndx;
	p->done=0;
	p->table =  ftp->ftable;
	p->newtime = p->table[p->ndx];
	p->start = kcounter * onedkr ;
	start = (long) *p->kstart;
	loop = (long) *p->kloop;
	if (loop > 0 ) {
			(*ndx)++;
			*ndx %= loop;
			if (*ndx == 0) 	{
				*ndx += start;
			}
	}
	else if (loop < 0 ){
			(*ndx)--;
			while (*ndx < start) {
				*ndx -= loop + start;
			}
	}
	p->flag=1;
}

void seqtim(SEQTIM *p)
{
	

	if (p->done) 
		goto end;
	else {
		long start = (long) *p->kstart, loop = (long) *p->kloop;
		long *ndx = &p->ndx;
		if (p->pfn != (long)*p->kfn) {
			FUNC *ftp;
			if ( (ftp = ftfindp(p->kfn) ) == NULL) {
				perferror("seqtim: incorrect table number");
				return;
			}
			p->pfn = (long)*p->kfn;
			p->table = ftp->ftable;
		}
		if (kcounter * onedkr > p->newtime * *p->unit_time + p->start) {
			p->newtime += p->table[p->ndx];
			if (loop > 0 ) {
				(*ndx)++;
				*ndx %= loop;
				if (*ndx == 0){
					if (start == loop) {
						p->done =1;
						return;
					}
					*ndx += start;
				}
			}
			else if (loop < 0 ){
				(*ndx)--;
				while (p->ndx < 0) {
					if (start == loop) {
						p->done =1;
						return;
					}
					*ndx -= loop + start;
				}
			}
			*p->ktrig = 1.f;
		}
		else {
			if(p->flag) {
					*p->ktrig=1;
				p->flag=0;
			}
			else {
end:
				*p->ktrig=0.f;
			}
		}
	}
}
*/

/**---------------------------------------**/


void seqtim2_set(SEQTIM2 *p)	 
{
	FUNC *ftp;
	long start, loop;
	long *ndx = &p->ndx;
	p->pfn = (long) *p->kfn;
	if ((ftp = ftfind(p->kfn)) == NULL) {
		  initerror("seqtim: incorrect table number");
          return;
	}
	*ndx = (long) *p->kinitndx;
	p->done=0;
	p->table =  ftp->ftable;
	p->newtime = p->table[p->ndx];
	p->start = kcounter * onedkr ;
	start = (long) *p->kstart;
	loop = (long) *p->kloop;
	if (loop > 0 ) {
			(*ndx)++;
			*ndx %= loop;
			if (*ndx == 0) 	{
				*ndx += start;
			}
	}
	else if (loop < 0 ){
			(*ndx)--;
			while (*ndx < start) {
				*ndx -= loop + start;
			}
	}
	p->flag=1;
}

void seqtim2(SEQTIM2 *p)
{
	
	if (*p->ktrigin ){
		p->ndx = (long) *p->kinitndx;
		/*
		long start = (long) *p->kstart, loop = (long) *p->kloop;
		long *ndx = &p->ndx;
		if (loop > 0 ) {
			(*ndx)++;
			*ndx %= loop;
			if (*ndx == 0) 	{
				*ndx += start;
			}
		}
		else if (loop < 0 ){
			(*ndx)--;
			while (*ndx < start) {
				*ndx -= loop + start;
			}
		}
		*/
	}
	
	if (p->done) 
		goto end;
	else {
		long start = (long) *p->kstart, loop = (long) *p->kloop;
		long *ndx = &p->ndx;
		
		if (p->pfn != (long)*p->kfn) {
			FUNC *ftp;
			if ( (ftp = ftfindp(p->kfn) ) == NULL) {
				perferror("seqtim: incorrect table number");
				return;
			}
			p->pfn = (long)*p->kfn;
			p->table = ftp->ftable;
		}
		if (kcounter * onedkr > p->newtime * *p->unit_time + p->start) {
			p->newtime += p->table[p->ndx];
			if (loop > 0 ) {
				(*ndx)++;
				*ndx %= loop;
				if (*ndx == 0){
					if (start == loop) {
						p->done =1;
						return;
					}
					*ndx += start;
				}
			}
			else if (loop < 0 ){
				(*ndx)--;
				while (p->ndx < 0) {
					if (start == loop) {
						p->done =1;
						return;
					}
					*ndx -= loop + start;
				}
			}
			*p->ktrig = 1.f;
		}
		else {
			if(p->flag) {
					*p->ktrig=1;
				p->flag=0;
			}
			else {
end:
				*p->ktrig=0.f;
			}
		}
	}
}


