@echo On
@Rem ɾ��SVN�汾����Ŀ¼
@ ����һ������Ҫɾ��.svn�ķ�����ʹ��export������ܵ����������ļ��ˡ�
@PROMPT [Com]

@for /r . %%a in (.) do @if exist "%%a\.svn" rd /s /q "%%a\.svn"
@Rem for /r . %%a in (.) do @if exist "%%a\.svn" @echo "%%a\.svn"

@echo Mission Completed.
@pause