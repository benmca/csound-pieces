#include <iostream>

extern "C" int cs_main(int, const char **);

int main(int argc, const char **argv)
{
	std::cout << "Gsound 1.0 based on MIT/Bath Csound." << std::endl;
	int returnValue = cs_main(argc, argv);
	return returnValue;
}