import os
import sys
import stat
import subprocess
import argparse
import logging
import zipfile
import .log_helper


logger = log_helper.setup_logger(name="qt_builder", level=logging.DEBUG, log_to_file=False)


QT_CONFIG_PARAMS = "-mp -opensource -confirm-license -nomake tests -nomake examples -no-compile-examples" \
                   " -release -shared -pch -no-ltcg -accessibility -no-sql-sqlite -opengl desktop -no-openvg" \
                   " -no-nis -no-iconv -no-evdev -no-mtdev -no-inotify -no-eventfd -largefile -no-system-proxies" \
                   " -qt-zlib -qt-pcre -no-icu -qt-libpng -qt-libjpeg -qt-freetype -no-fontconfig -qt-harfbuzz" \
                   " -no-angle -incredibuild-xge -no-plugin-manifests -qmake -qreal double -rtti -strip -no-ssl" \
                   " -no-openssl -no-libproxy -no-dbus -no-audio-backend -no-wmf-backend -no-qml-debug -no-direct2d" \
                   " -directwrite -no-style-fusion -native-gestures -skip qt3d -skip qtactiveqt -skip qtandroidextras" \
                   " -skip qtcanvas3d -skip qtconnectivity -skip qtdeclarative -skip qtdoc -skip qtenginio" \
                   " -skip qtgraphicaleffects -skip qtlocation -skip qtmacextras -skip qtmultimedia" \
                   " -skip qtquickcontrols -skip qtquickcontrols2 -skip qtscript -skip qtsensors -skip qtserialbus" \
                   " -skip qtserialport -skip qtwayland -skip qtwebchannel -skip qtwebengine -skip qtwebsockets" \
                   " -skip qtwebview -skip qtx11extras -skip qtxmlpatterns"


# Pass install path as QTDIR value
QT_PRECONFIGURE_CMD = """SET QTDIR={0}
SET PATH=%QTDIR%\bin;%PATH%
SET QMAKESPEC=win32-msvc2010"""


# 1st param is archive file, 2nd is unpack path
P7UNZIP_COMMAND = "7z x -y {0} -o{1} -r"


###########################################################################
def on_rm_error(*args):
    """
    In case the file or directory is read-only and we need to delete it
    this function will help to remove 'read-only' attribute
    :param args: (func, path, exc_info) tuple
    """
    # path contains the path of the file that couldn't be removed
    # let's just assume that it's read-only and unlink it.
    _, path, _ = args
    logger.warning("OnRmError: {0}".format(path))
    os.chmod(path, stat.S_IWRITE)
    os.unlink(path)


def is_file_any(executable):
    """
    :param executable: Archiver executable file name
    :return: True if found in PATH, False otherwise
    """
    if not any([os.path.exists(os.path.join(p, executable)) for p in os.environ["PATH"].split(os.pathsep)]):
        return False
    return True


def is_7z_exist():
    """
    :return: True if 7zip is found
    """
    return is_file_any("7z.exe") or is_file_any("7z")


def unzip7(archive_file, unpack_path):
    """
    Use existing 7zip archiever to unpack 7z file
    :return: 7z.exe return code
    """
    return os.system(P7UNZIP_COMMAND.format(archive_file, unpack_path))


def get_target_cmd(target):
    """
    :param target: Either "x86" or "x64"
    :return: Second param is a switch for the script, generating development environment
    """
    if target == 'x64':
        return "/x64"
    elif target == 'x86':
        return "/x86"
    else:
        logger.error("Target should be either x86 or x64")


def set_windows_environment(cmd_shell, target_switch):
    """
    Set environment variables for Windows SDK 7.1 environment scripts
    :param cmd_shell: Ful path to cmd.exe, compatible with target architecture
    :param target_switch: "/x86" or "/x64"
    :return: Process return code
    """
    winsdk_script = "C:\\Program Files\\Microsoft SDKs\\Windows\\v7.1\\Bin\\SetEnv.Cmd"
    winsdk_environment = '''"{0}" /Release /x86 /win7'''.format(winsdk_script)

    # run SDK bat-file
    if not os.path.exists(winsdk_script):
        raise RuntimeError('Cannot detect Windows 7.1 SDK environment')
    logger.info('Setting Windows 7.1 SDK environment')

    cmd_process = "{0} /C {1}".format(cmd_shell, winsdk_environment)
    logger.info("Run setting environment: {0}".format(cmd_process))
    os.system(cmd_process)
    return 0


def set_unix_environment():
    """
    Read environment variables for the POSIX build
    :return:
    """
    raise NotImplementedError(set_unix_environment())


def run_configure(cmd_shell, install_path):

    variables_cmd = QT_PRECONFIGURE_CMD.format(install_path)
    configure_cmd = "configure.bat -prefix {0} {1}".format(install_path, QT_CONFIG_PARAMS)
    
    # TODO: run configure
    logger.info('Setting variables: {0}'.format(variables_cmd))
    logger.info('Run configure: {0}'.format(configure_cmd))


def build_qt(qt_sources, qt_version, target, install_path):

    # 1. Unpack sources
    # TODO: unzip_sources(qt_sources)

    if not os.path.exists(qt_sources):
        raise RuntimeError('Cannot detect Qt sources')
    os.chdir("qt-everywhere-opensource-src-{0}".format(qt_version))

    # 2. Set environment
    target_switch = get_target_cmd(target)
    set_windows_environment(target_switch)
    
    # TODO:
    # 3.Edit source code for x86
    # 4.Compile and install


def main():
    """
    Sets build environment for the target platform and runs CMake
    :return: CMake return code
    """
    # Set environment for Windows or POSIX
    parser = argparse.ArgumentParser(description='Command-line interface')
    parser.add_argument('--qt-sources',
                        help='Path to Qt sources',
                        dest='qt_sources',
                        required=True)

    parser.add_argument('--qt-version',
                        help='Qt version to build, in format like 5.12.2',
                        dest='qt_version',
                        required=True)

    parser.add_argument('--target',
                        help='Qt target architecture, x86 or x64',
                        dest='target',
                        choices=['x86', 'x64'],
                        default='x64',
                        required=False)

    parser.add_argument('--install-path',
                        help='Path to install Qt directory, which contains bin, lib and include',
                        dest='install_path',
                        required=True)

    # Check x64 environment
    logger.info("System maxint = {0}".format(sys.maxsize))
    if sys.maxsize == 2 ** 32:
        logger.error("Compiler is expected to work in x64 environment")
        return 1

    args = parser.parse_args()

    return build_qt(args.qt_sources, args.qt_version, args.target, args.install_path)


###########################################################################
if __name__ == '__main__':
    sys.exit(main())
