@echo off

echo VS 2010 without SP1 Installer
cd en-visual-studio-2010-pro-x86
start /wait Setup\setup.exe /unattendfile C:\Users\atatat\Downloads\AdminDeployment.ini
cd ..

