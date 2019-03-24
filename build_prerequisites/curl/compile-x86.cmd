@echo off

echo Set up build environment
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x86 /win7

echo Create directories
cd /d winbuild
md C:\lib\curl\x86
md C:\lib\curl\lib\x86

echo Compile and install
nmake /f Makefile.vc mode=static WITH_SSL=static DEBUG=no MACHINE=x86 SSL_PATH=C:\lib\openssl\x86 ENABLE_SSPI=no ENABLE_WINSSL=no ENABLE_IDN=no
copy ..\builds\libcurl-vc-x86-release-static-ssl-static-ipv6\lib\libcurl_a.lib C:\lib\curl\x86\libcurl.lib
copy ..\builds\libcurl-vc-x86-release-static-ssl-static-ipv6\lib\libcurl_a.lib C:\lib\curl\x86\lib\libcurl.lib
xcopy /E ..\builds\libcurl-vc-x86-release-static-ssl-static-ipv6\include\curl C:\lib\curl\x86\include\curl\