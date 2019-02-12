@echo off

echo VS 2010 without SP1 Installer
cd en-visual-studio-2010-x86-professional
start /wait Setup\setup.exe /unattendfile C:\Users\atatat\Downloads\vbox.ini
cd ..

echo VS SP1
cd mu-visual-studio-2010-x86-sp1
start /wait Setup.exe /q /norestart
cd ..

echo Install VS 2010 updates
cd en-visual-studio-2010-x86-sp1-updates

echo Install VS10SP1-KB2519277
start /wait VC-Compiler-KB2519277.exe /quiet /norestart

echo Install VS10SP1-KB2529927
start /wait VS10SP1-KB2529927-v2-x86.exe /quiet /norestart

echo Install VS10SP1-KB2548139
start /wait VS10SP1-KB2548139-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2549864-ReportViewer.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2549864-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2565057-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2635973-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2645410-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2736182.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2890573-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB2938807-x86.exe /quiet /norestart

echo Install VS10SP1-KB2549864
start /wait VS10SP1-KB3002340-x86.exe /quiet /norestart

echo Install VS 2010 Update Checker extension to make sure everything is installed correctly
REM Do not install VS extension from the network location
"C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\VSIXInstaller.exe" /quiet /admin /skuName:Pro /skuVersion:10.0 VersionInfo2010.vsix
