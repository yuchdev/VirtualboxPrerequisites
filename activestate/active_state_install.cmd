@echo off

REM ActivePerl
start /wait ActivePerl-5.26.3.2603-MSWin32-x64-a95bce075.exe /quiet
ppm install Text::Template

REM ActivePython
start /wait ActivePython-2.7.14.2717-win64-x64-404905.exe /quiet
