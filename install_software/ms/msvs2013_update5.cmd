@echo off

if "%~1"=="" (
  SET ADMIN_FILE = C:\Users\atatat\Downloads\AdminDeployment.xml
)
else (
  SET ADMIN_FILE = %1%
)


cd en-visual-studio-professional-2013-update-5-x86\
start /wait vs_professional.exe /AdminFile %ADMIN_FILE% /quiet /norestart
cd ..
