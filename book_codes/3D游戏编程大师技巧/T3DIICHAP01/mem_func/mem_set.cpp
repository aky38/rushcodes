#include <iostream>
using namespace std;

//# brief ���32λ�����ڴ�
inline void Mem_Set_Quad(void *dest, unsigned int data, int count)
{
	_asm
	{
		mov edi, dest;
		mov ecx, count;
		mov eax, data;
		rep stosd;
	}
}

//# brief ���16λ�����ڴ�
inline void Mem_Set_Word(void* dest, unsigned int data, int count)
{
	_asm
	{
		mov edi, dest;
		mov ecx, count;
		mov eax, data;
		rep stosw;
	}
}

int main()
{
	int a[3]  = {1, 1, 1};
	Mem_Set_Quad(&a, 0, 3);

	short int b[3] = {1, 1, 1};
	Mem_Set_Word(&b, 0, 3);
}