@ehco off

echo "Set Virtualbox release logging flags"
setx VBOXSVC_RELEASE_LOG "main.e.l.f+gui.e.l.f"
setx VBOXSVC_RELEASE_LOG_FLAGS "time tid thread"

echo "Set Virtualbox release logging directory"
setx VBOXSVC_RELEASE_LOG_DEST "C:\Users\atatat\.VirtualBox"

echo "Set Virtualbox debug logging flags"
setx VBOX_LOG "main.e.l.f+gui.e.l.f"
setx VBOX_LOG_FLAGS "time tid thread"

echo "Set Virtualbox debug logging directory"
setx VBOX_LOG_DEST "C:\Users\atatat\.VirtualBox"
setx WATCOM "C:\WATCOM"
setx WHTMLHELP "C:\WATCOM\BINNT\HELP"
