@echo off

cd windows-sdk-81\

echo Windows SDK 8.1
start /wait sdksetup.exe /features + /quiet

cd ..
