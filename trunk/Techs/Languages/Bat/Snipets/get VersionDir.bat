@echo off
rem ��ȡ�汾�ļ��У�����ȷ��������һ��\
SETLOCAL ENABLEDELAYEDEXPANSION

set VERSIONDIR=
if exist VERSIONDIR.VER	(
rem echo exist
for /f "delims=" %%i in (VERSIONDIR.VER) do set VERSIONDIR=%%i
) else (
echo not exist
echo ������汾�ļ���λ��,��ʹ�þ���ֵ:
set /p VERSIONDIR=
rem ���治�ø�������
)
echo %VERSIONDIR%

rem ȷ����ʽ��ȷ
rem echo %VERSIONDIR:~-1,1%
if "%VERSIONDIR:~-1,1%" == "\" (
rem echo good format
) else (
set VERSIONDIR=%VERSIONDIR%\

)

echo %VERSIONDIR%

rem ȷ���ļ�����Ч
mkdir "%VERSIONDIR%test"
if %errorlevel% equ 0 (
rem echo �ļ�����Ч
rmdir "%VERSIONDIR%test"
) else (
echo ��������ļ�����Ч��
pause 
exit
)

echo %VERSIONDIR%>VERSIONDIR.VER

pause