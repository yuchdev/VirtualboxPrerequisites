@echo off

REM First command-line param could be specific Qt version
REM For example, 5.6.2
IF "%~1"=="" (
  echo "Default Qt version 5.6.3"
  SET QTVERSION=5.6.3

) ELSE (
  echo "Set Qt version as %1"
  SET QTVERSION=%1
)

call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x86 /win7
SET QTDIR=C:\Qt\%QTVERSION%\msvc2010
SET PATH=%QTDIR%\bin;%PATH%
SET QMAKESPEC=win32-msvc2010
call .\qt-everywhere-opensource-src-%QTVERSION%\configure.bat -prefix %QTDIR% -mp -opensource -confirm-license -nomake tests -nomake examples -no-compile-examples -release -shared -pch -no-ltcg -accessibility -no-sql-sqlite -opengl desktop -no-openvg -no-nis -no-iconv -no-evdev -no-mtdev -no-inotify -no-eventfd -largefile -no-system-proxies -qt-zlib -qt-pcre -no-icu -qt-libpng -qt-libjpeg -qt-freetype -no-fontconfig -qt-harfbuzz -no-angle -incredibuild-xge -no-plugin-manifests -qmake -qreal double -rtti -strip -no-ssl -no-openssl -no-libproxy -no-dbus -no-audio-backend -no-wmf-backend -no-qml-debug -no-direct2d -directwrite -no-style-fusion -native-gestures -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtcanvas3d -skip qtconnectivity -skip qtdeclarative -skip qtdoc -skip qtenginio -skip qtgraphicaleffects -skip qtlocation -skip qtmacextras -skip qtmultimedia -skip qtquickcontrols -skip qtquickcontrols2 -skip qtscript -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebsockets -skip qtwebview -skip qtx11extras -skip qtxmlpatterns


