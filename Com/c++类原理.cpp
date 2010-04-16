//c++��ԭ��

#include <iostream>
#include <Windows.h>
using namespace std;

struct Vtable;

//c++�࣬���ɳ�Ա�����ͱ�����ɣ���Ա����
typedef struct{
	Vtable*			pointer;
	DWORD			count;
	char*			buffer;
}IExample;

//vtable�еĺ���������һ��Ӧ�õ����arg����ʵ����thisָ��
typedef void SetStringPtr(IExample* exp, char *);
typedef char* GetStringPtr(IExample* exp);

//ר��һ��struct�洢����ָ�룬Ҳ����c++ class�еĵ�һ��Ԫ��--vtable
struct Vtable
{
	SetStringPtr*		setstringPtr;
	GetStringPtr*		getstringPtr;
};

void SetString(IExample* exp, char* str)
{	
	exp->buffer = str;
}
char* GetString(IExample* exp)
{
	return exp->buffer;
}

int main()
{
	Vtable* vtab = new Vtable();
	vtab->setstringPtr = SetString;
	vtab->getstringPtr = GetString;

	IExample* example;
	example = (IExample*)GlobalAlloc(GMEM_FIXED, sizeof(IExample));		

	example->pointer = vtab;

	//���ó�Ա����
	example->pointer->setstringPtr(example, "hello, world");
	cout << example->pointer->getstringPtr(example);
}

