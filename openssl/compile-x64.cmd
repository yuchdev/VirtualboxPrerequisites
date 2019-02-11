call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x64 /win7
set PATH=%PATH%;C:\bin\nasm-2.14.02
perl Configure VC-WIN64A no-shared --prefix=C:\lib\openssl\x64 --openssldir=C:\lib\openssl\x64\ssl
nmake
nmake test
nmake install