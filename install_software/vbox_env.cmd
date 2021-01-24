@ehco off

echo "Set Virtualbox release logging flags"
setx /m VBOXSVC_RELEASE_LOG "main.e.l.f+gui.e.l.f"
setx /m VBOXSVC_RELEASE_LOG_FLAGS "time tid thread"

echo "Set Virtualbox release logging directory"
setx /m VBOXSVC_RELEASE_LOG_DEST "C:\Users\atatat\.VirtualBox"

echo "Set Virtualbox debug logging flags"
setx /m VBOX_LOG "main.e.l.f+gui.e.l.f"
setx /m VBOX_LOG_FLAGS "time tid thread"

echo "Set Virtualbox debug logging directory"
setx /m VBOX_LOG_DEST "C:\Users\atatat\.VirtualBox"
setx /m WATCOM "C:\WATCOM"
setx /m WHTMLHELP "C:\WATCOM\BINNT\HELP"
