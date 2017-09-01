#include <time.h>
#include <dos.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char** argv)
{
	struct dos_time_t tt;
	double ss;
	
	while(argc>1) { printf("%s ", *++argv); argc--; }
	dos_gettime(&tt);
	printf("%d:%d:%d.%03d ", tt.hour, tt.minute, tt.second, tt.hsecond);
	ss = (((double)tt.hour*60.0+(double)tt.minute)*60.0+(double)tt.second)+(double)tt.hsecond*0.01;
	printf("%7.2lf\n", ss);
}
	
