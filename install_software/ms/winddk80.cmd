@echo off

cd windows-ddk-80\

echo Windows DDK 8.0
start /wait wdksetup.exe /features + /quiet

cd ..
