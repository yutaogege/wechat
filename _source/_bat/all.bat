@echo off

rem ���ñ���
set batDirDrive=%~dp0
set batDirPath=%~p0
set batName=%~n0
set configDir=%batDirDrive%..\_config

rem ����.config����Ŀ¼
cd %batDirPath%
cd ..\..\

rem ѡ�����ֻ���
echo ����ģʽ����d,����ģʽ����p,ȡ������n
choice /c dpn /M "development,production,end"
if errorlevel 3 goto end
if errorlevel 2 goto production
if errorlevel 1 goto development

rem ����ģʽ
:development
echo ����ģʽ������sourcemap
for /r %configDir% %%i in (*.rb) do (
  call compass watch -c %%i -e development --force
)
goto end

rem ����ģʽ
:production
echo ����ģʽ��ȫѹ��
for /r %configDir% %%i in (*.rb) do (
  call compass compile -c %%i -e production --force
)
goto end

rem �����˳�
:end
rem pause
cmd /k