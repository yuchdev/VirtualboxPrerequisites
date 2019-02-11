call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x64 /win7
cd /d winbuild
md C:\lib\curl\x64
md C:\lib\curl\x64\lib
md C:\lib\curl\x64\bin
nmake /f Makefile.vc mode=static WITH_SSL=static DEBUG=no MACHINE=x64 SSL_PATH=C:\lib\openssl\x64 ENABLE_SSPI=no ENABLE_WINSSL=no ENABLE_IDN=no
copy ..\builds\libcurl-vc-x64-release-static-ssl-static-ipv6\lib\libcurl_a.lib C:\lib\curl\x64\libcurl.lib
copy ..\builds\libcurl-vc-x64-release-static-ssl-static-ipv6\lib\libcurl_a.lib C:\lib\curl\x64\lib\libcurl.lib
xcopy /E ..\builds\libcurl-vc-x64-release-static-ssl-static-ipv6\include\curl C:\lib\curl\x64\include\curl\
copy ..\builds\libcurl-vc-x64-release-static-ssl-static-ipv6\bin\curl.exe C:\lib\curl\x64\bin\curl.exe