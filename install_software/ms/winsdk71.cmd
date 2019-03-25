@echo off

cd windows-sdk-71-x64\

REM SDK 7
echo Windows SDK 7
start /wait setup.exe -q -params:ADDLOCAL=ALL

cd ..
