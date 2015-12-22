// HSWvsBDW.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

using namespace std;
extern "C" __int64 __fastcall testFMAPS(double *);
extern "C" __int64 __fastcall testMULPS_C5(double *);
extern "C" __int64 __fastcall testMULPS_C4(double *);

typedef __int64(__fastcall *TEST_PTR)(double *);

void test(TEST_PTR testptr) {
	double xmmTemp[20];
	double result = DBL_MAX;

	for (int i = 0; i < 1000; i++)
		result = min(result, (double)testptr(&xmmTemp[0]) / 1000000.0);

	cout << result << endl;
}

int main()
{

	cout << "FMAPS:    ";
	test(testFMAPS);

	cout << "MULPS_C5: ";
	test(testMULPS_C5);

	cout << "MULPS_C4: ";
	test(testMULPS_C4);

	while (!_kbhit());
}

