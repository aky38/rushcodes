@echo off

if exist TIME.TM (
rem echo exist
for /f "delims=" %%i in (TIME.TM) do (
set TimeToRun=%%i
)
) else (
echo not exist
echo ������ÿ�켸�����и��Զ�����ϵͳ[H:M/9:00]:
set /p TimeToRun=
rem ���治�ø�������
)

echo %TimeToRun%
echo %TimeToRun%>TIME.TM

rem ÿ�����иó���
AT %TimeToRun% /EVERY:M,T,W,TH,F,S,SU "%~f0"

pause