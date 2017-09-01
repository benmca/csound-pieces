#include <windows.h>
#include<mmsystem.h>


static double millisec;
static double ktime;
extern float ekr;
void do_events_timing(void) 
{
	ktime += millisec;
	while (timeGetTime() < ktime ) {
		Sleep(1);
  }
}

void timer_init(void)
{
	millisec = 1000/ekr;
	ktime = timeGetTime();
}

