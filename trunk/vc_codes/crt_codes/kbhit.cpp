// Include Directives ///////////////////////////////////////////////////////
#include <conio.h>
#include <stdio.h>

//kbhit���ڼ���Ƿ��м�����

int main(int argc, char* argv[])
{
	printf("Press any key to exit!\n");
  while (!kbhit()) { }
	return 0;
}

