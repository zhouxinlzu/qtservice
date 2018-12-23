CONFIG(QS_BUILD_LIB)|CONFIG(qtservice-uselib) {
    isEmpty(QTSERVICE_LIBNAME) {
        TEMPLATE *= fakelib
        QTSERVICE_LIBNAME = $$qt5LibraryTarget(QtService)
        TEMPLATE -= fakelib
    }
    CONFIG *= qtservice-uselib QS_BUILD_LIB
}
isEmpty(ROOT): ROOT = $$PWD
isEmpty(BUILD_DIR): BUILD_DIR = $$ROOT/build
isEmpty(BIN_DIR): BIN_DIR = $$BUILD_DIR/bin
isEmpty(LIB_DIR): LIB_DIR = $$BUILD_DIR/lib
contains(QT_ARCH, x86_64) {
    BIN_DIR = $$join(BIN_DIR,,,64)
    LIB_DIR = $$join(LIB_DIR,,,64)
}
CONFIG(static, static|shared): LIB_DIR = $$join(LIB_DIR,,,_static)
contains(TEMPLATE, app): DESTDIR = $$BIN_DIR
else:contains(TEMPLATE, lib): DESTDIR = $$LIB_DIR
CONFIG *= c++11
CONFIG(qt): DEFINES *= QT_DEPRECATED_WARNINGS QT_DISABLE_DEPRECATED_BEFORE=0x050603
CONFIG -= app_bundle
unix:CONFIG(qtservice-uselib):!CONFIG(qtservice-buildlib): QMAKE_RPATHDIR *= $$LIB_DIR
