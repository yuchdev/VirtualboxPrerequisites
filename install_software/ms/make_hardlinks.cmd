@echo off

if not exist C:\WinDDK mkdir C:\WinDDK
if not exist C:\WinSDK mkdir C:\WinSDK
if not exist C:\MSVS mkdir C:\MSVS

echo Link C:\Program Files (x86)\Windows Kits\8.0 to C:\WinDDK\8.0
mklink /D "C:\WinDDK\8.0" "C:\Program Files (x86)\Windows Kits\8.0"

echo Link C:\Program Files (x86)\Windows Kits\8.1 to C:\WinSDK\8.1
mklink /D "C:\WinSDK\8.1" "C:\Program Files (x86)\Windows Kits\8.1"

echo Link C:\Program Files\Microsoft SDKs\Windows\v7.1 to C:\WinSDK\7.1
mklink /D "C:\WinSDK\7.1" "C:\Program Files\Microsoft SDKs\Windows\v7.1"

echo Link C:\Program Files (x86)\Microsoft Visual Studio 10.0 to C:\MSVS\10.0
mklink /D "C:\MSVS\10.0" "C:\Program Files (x86)\Microsoft Visual Studio 10.0"

echo Link C:\Program Files (x86)\Microsoft Visual Studio 12.0 to C:\MSVS\12.0
mklink /D "C:\MSVS\12.0" "C:\Program Files (x86)\Microsoft Visual Studio 12.0"
