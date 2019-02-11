./configure --target=x86-win32-vs10 --disable-install-bins --disable-examples --disable-tools --disable-docs --prefix=/cygdrive/c/lib/libvpx
make
"/cygdrive/c/Program Files (x86)/Microsoft Visual Studio 10.0/Common7/IDE/devenv.com" vpx.sln /Project vpx.vcxproj /Rebuild "Release|Win32"
make install