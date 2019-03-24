@echo off
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x86 /win7
set PATH=%PATH%;C:\bin\nasm-2.14.02
perl Configure VC-WIN32 no-shared --prefix=C:\lib\openssl\x86 --openssldir=C:\lib\openssl\x86\ssl
nmake
nmake test
nmake install
