#include <iostream>

extern "C" int sum(int a, int b);

extern "C" bool task2_4(int n);

extern "C" int* ASMsort(int n, int* arr);

using std::cout;

void m_test() {
	cout << sum(5, 3) << "\n";
}

void m_2_4() {
	int num = 3231;
	bool sign = task2_4(num);
	if (sign) {
		cout << "There are no same digits in this number!\n";
	} else {
		cout << "There are same digits in this number!\n";
	}
}

void m_3_2() {
	srand(time(NULL));

	int N = 30;

	int* arr = new int[N];
	for (int i = 0; i < N; i++) {
		arr[i] = rand() % 100;
		cout << arr[i] << "  ";
	}

	cout << "\n";
	arr = ASMsort(N, arr);

	for (int i = 0; i < N; i++) {
		cout << arr[i] << "  ";
	}
	cout << "\n";
}

int main(){

	//m_test();
	m_2_4();
	m_3_2();
	
	return 0;
}

