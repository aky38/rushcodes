#include <iostream>
using namespace std;

//��Ϸ״̬
enum E_GAME_STATE
{
	GAME_INIT,
	GAME_MENU,
	GAME_START,
	GAME_RUN,
	GAME_RESTART,
	GAME_EXIT
};

//ȫ�ֱ���
E_GAME_STATE g_gameState = GAME_INIT;
int error = 0;


//����Ϸ�߼�
#define FUNC(x)		\
	bool (x)()		\
{return true;}  \

FUNC ( Init )					//��Ϸ��ʼ����
E_GAME_STATE  Menu() {return GAME_START;} ;		//��ʾ�˵�
FUNC ( SetupForRun )			//����ǰ��׼��
FUNC ( Clear )					//����
FUNC ( GetInput )				//��ȡ����
FUNC ( DoLogic )				//ִ���߼���AI				
FUNC ( RenderFrame )			//��Ⱦ��һ֡
FUNC ( Wait )					//��ʾ�ٶ�ͬ��
FUNC ( FixUp )					
FUNC ( ReleaseAndCleanup )


//��ѭ��
int main()
{
	while(g_gameState != GAME_EXIT)
	{
		//�����Ϸѭ��״̬
		switch(g_gameState)
		{
		case GAME_INIT:
			{
				//���������ڴ����Դ
				Init();

				g_gameState = GAME_MENU;		//�л����˵�ģʽ
			}
			break;

		case GAME_MENU:
			{
				//�������˵��������������л�״̬
				g_gameState = Menu();			//�������ֱ���л�������״̬
			}
			break;

		case GAME_START:	//��ϷҪ������
			{
				//����״̬�ǿ�ѡ�ģ�ͨ������Ϊ��Ϸ������׼��
				//������һЩ������
				SetupForRun();

				g_gameState = GAME_RUN;			//�л�������
			}
			break;

		case GAME_RUN:
			{
				//�ⲿ�ְ���������Ϸ���߼�ѭ��
				//�ı���Ϸ״̬��Ψһ��ʽ��ͨ���û�����

				//����
				Clear();

				GetInput();			//��ȡ����

				DoLogic();			//ִ����Ϸ�߼���AI

				RenderFrame();		//������һ֡

				Wait();				//����Ϸͬ����30֡/s
			}
			break;

		case GAME_RESTART:
			{
				//����״̬
				//����������������Ϸ֮ǰ�����������
				FixUp();

				//�л����˵�״̬
				g_gameState = GAME_MENU;
			}
			break;

		case GAME_EXIT:
			{
				//�����Ϸ��������״̬�����ͷ�����ռ�õ���Դ
				ReleaseAndCleanup();

				error = 0;

				//�������л�״̬����Ϊ�����˳�״̬������һ��ѭ���У����뽫�Ƴ�ѭ�������ص�����ϵͳ
			}
			break;

		default:
			break;
		}//end switch
	}//end while

	return error;		//�������뷵�ظ�����ϵͳ
}