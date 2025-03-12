#include <iostream>
#include <xmmintrin.h>
#include <mmintrin.h>
#include <immintrin.h>
#include <dvec.h>
#include <intrin.h>

using std::cout;
using std::endl;

//extern "C" float* sseTask(float* ew0, float* ew1);

void mmxTask(void) { // 64
	int qw0[2] = { 5, 6 };
	int qw1[2] = { 1, 9 };

	cout << "Befor: qw0:[" << qw0[0] << ", " << qw0[1] << "]; qw1[" << qw1[0] << ", " << qw1[1] << "]" << endl;

	__asm {
		movq mm0, qw0
		movq mm1, qw1
		paddd mm0, mm1
		movq qw0, mm0
	}

	cout << "Paddd: " << qw0[0] << " " << qw0[1] << endl << endl;
}

void sseTask(void) { // 128
	float ew0[4] = { 3.2f, 6.4f, 3.2f, 1.1f };
	float ew1[4] = { 10.f, 90.f, 20.f, 50.f};

	cout << "Adhock:" << ew0[0] << "\n\n ";

	cout << "Befor: ew0:[";
	for (int i = 0; i < 4; i++) {
		cout << ew0[i] << " ";
	}
	cout << " ew1: ";
	for (int i = 0; i < 4; i++) {
		cout << ew1[i] << " ";
	}
	cout << endl;

	__asm {
		movups xmm0, ew0
		movups xmm1, ew1
		mulps xmm0, xmm1
		movups ew0, xmm0
	}

	cout << "Mulps: ";

	for (int i = 0; i < 4; i++) {
		cout << ew0[i] << "  ";
	}

	cout << endl << endl;
}

void sse2Task(void) { // 128

	double qw[2] = { 64, 14.2 };

	cout << "Befor: qw:[" << qw[0] << ", " << qw[1] << "]" << endl;

	__asm {
		movups xmm0, qw
		sqrtpd xmm1, xmm0
		movups qw, xmm1
	}

	cout << "Sqrtpd: ";

	for (int i = 0; i < 2; i++) {
		cout << qw[i] << "  ";
	}

	cout << endl << endl;
}

void avxTask(void) { // 256
	float avx0[8] = { 1, 2, 3, 4, 5, 6, 7, 8 };
	float avx1[8] = { 9, 10, 11, 12, 13, 14, 15, 16 };
	float res[8] = {};

	cout << "Befor: avx0: ";
	for (int i = 0; i < 8; i++) {
		cout << avx0[i] << " ";
	}

	cout << "\navx1: ";
	for (int i = 0; i < 8; i++) {
		cout << avx1[i] << " ";
	}
	cout << "\n";

					// cannot read ymmN register :(

	//__asm {
	//	vmovups ymm0, avx0
	//	smovups ymm1, avx1
	//	vsubps ymm2, ymm1, ymm0
	//	vmovups res, ymm2
	//	vzeroall
	//}

	cout << "After: ";
	for (int i = 0; i < 8; i++) {
		cout << res[i] << " ";
	}
	cout << "\n\n";
}

int main(void) {

	mmxTask();

	sseTask();

	sse2Task();

	// Does not work
	avxTask();

	return 0;
}
