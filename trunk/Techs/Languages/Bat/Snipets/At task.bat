@rem ���ܲ������Լ�TIME.TM�ļ�����������TIME.TM�ж����ʱ��������
@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

if exist TIME.TM (
rem echo exist
for /f "delims=" %%i in (TIME.TM) do (
echo %%i
rem AT %TimeToRun% /EVERY:M,T,W,TH,F,S,SU "%~f0"
AT %%i /interactive /EVERY:M,T,W,TH,F,S,SU "%1"
)
) else (
echo not exist
echo ����TIME.TM�ļ�������ÿ�춨������ʱ��
exit /b -1
)

pause