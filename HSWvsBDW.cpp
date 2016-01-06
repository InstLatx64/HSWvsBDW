// HSWvsBDW.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

using namespace std;
extern "C" __int64 __fastcall Code1_FMAPS_YMM_VPADDD(double *, double *);
extern "C" __int64 __fastcall Code2_MULPS_YMM_C5(double *, double *);
extern "C" __int64 __fastcall Code3_MULPS_YMM_C4(double *, double *);
extern "C" __int64 __fastcall Code4_FMAPS_XMM_VPADDD(double *, double *);
extern "C" __int64 __fastcall Code5_FMAPS_YMM_VPSUBD(double *, double *);
extern "C" __int64 __fastcall Code6_FMAPS_YMM_MEMOP2(double *, double *);
extern "C" __int64 __fastcall Code7_FMAPS_YMM_VPADDD_UNUSED(double *, double *);
extern "C" __int64 __fastcall Code8_FMAPS_XMM_VPADDD_UNUSED(double *, double *);

typedef __int64(__fastcall *TEST_PTR)(double *, double *);

void test(TEST_PTR testptr) {
	double xmmTemp[20];
	double result = DBL_MAX;
	__declspec(align(32)) double memOp[8] = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

	for (int i = 0; i < 1000; i++)
		result = min(result, (double)testptr(&xmmTemp[0], &memOp[0]) / 1000000.0);

	cout << result << endl;
}

int main()
{

	cout << "Code1_FMAPS_YMM_VPADDD:   ";
	test(Code1_FMAPS_YMM_VPADDD);

	cout << "Code2_MULPS_YMM_C5:       ";
	test(Code2_MULPS_YMM_C5);

	cout << "Code3_MULPS_YMM_C4:       ";
	test(Code3_MULPS_YMM_C4);

	cout << "Code4_FMAPS_XMM_VPADDD:   ";
	test(Code4_FMAPS_XMM_VPADDD);

	cout << "Code5_FMAPS_YMM_VPSUBD:   ";
	test(Code5_FMAPS_YMM_VPSUBD);

	cout << "Code6_FMAPS_YMM_MEMOP2:       ";
	test(Code6_FMAPS_YMM_MEMOP2);

	cout << "Code7_FMAPS_YMM_VPADDD_UNUSED:";
	test(Code7_FMAPS_YMM_VPADDD_UNUSED);

	cout << "Code8_FMAPS_XMM_VPADDD_UNUSED:";
	test(Code8_FMAPS_XMM_VPADDD_UNUSED);
	
	while (!_kbhit());
}

