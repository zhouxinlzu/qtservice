TEMPLATE = lib
CONFIG *= qtservice-buildlib
mac: CONFIG *= absolute_library_soname
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
