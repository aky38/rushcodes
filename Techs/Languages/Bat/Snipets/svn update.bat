@echo off
Rem ��svn uplist.txt�н�������Ҫ���µ��ļ���Ŀ¼
Rem �ṩ�������汾��һ����ͨsvn�棬һ��tortoiseSvn�棬TortoiseSvn�滹д����΢�߼��˵㣬���Ǳ���������еĻ�������Ī��������޷������ļ���Ȩ�޵�bug����Ȼ�����ҵĽű����⣬��tortoiseSvn�����⡣

Rem Normal svn version
rem for /f "eol=#" %%i in (svnUplist.txt) do echo %%i & svn update %%i


Rem TortoiseSvn version ���ļ����������һ�η���tortoiseProc
set localFolder=%~d0
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "eol=#" %%i in (svnUplist.txt) do set allFolder=!allFolder!%localFolder%\%%i*
set allFolder=%allFolder:~0,-1%
Rem echo %allFolder%

TortoiseProc /command:update  /path:"%allFolder%"  /closeonend:1

echo "����ɹ����" 
rem pause "����ɹ����" 