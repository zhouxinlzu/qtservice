TEMPLATE = lib
CONFIG *= qtservice-buildlib
mac: CONFIG *= absolute_library_soname
win32|mac:!wince*:!win32-msvc:!macx-xcode: CONFIG *= debug_and_release build_all
include($$PWD/../src/qtservice.pri)
TARGET = $$QTSERVICE_LIBNAME
win32 {
    CONFIG *= dll
    DLLDESTDIR = $$[QT_INSTALL_BINS]
    QMAKE_DISTCLEAN *= $$[QT_INSTALL_BINS]\\$${QTSERVICE_LIBNAME}.dll
    RC_FILE *= $$PWD/../qtservice.rc
}
isEmpty(target.path): target.path = $$BIN_DIR
INSTALLS *= target
