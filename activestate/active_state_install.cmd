@echo off

REM ActivePerl
echo Install ActivePerl 5.26.3
start /wait ActivePerl-5.26.3.2603-MSWin32-x64-a95bce075.exe /quiet
ppm install Text::Template

REM ActivePython
echo Install ActivePython 2.7.14
start /wait ActivePython-2.7.14.2717-win64-x64-404905.exe /quiet
