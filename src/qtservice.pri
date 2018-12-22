include($$PWD/../common.pri)

INCLUDEPATH *= $$PWD
DEPENDPATH *= $$PWD

CONFIG(qtservice-uselib):!CONFIG(qtservice-buildlib) {
    LIBS *= -L$$LIB_DIR -l$$QTSERVICE_LIBNAME
} else {
    HEADERS *= \
        $$PWD/qtservice.h \
        $$PWD/qtservice_p.h
    SOURCES *= $$PWD/qtservice.cpp
    win32: SOURCES *= $$PWD/qtservice_win.cpp
    unix {
        HEADERS *= \
            $$PWD/qtunixsocket.h \
            $$PWD/qtunixserversocket.h
        SOURCES *= \
            $$PWD/qtservice_unix.cpp \
            $$PWD/qtunixsocket.cpp \
            $$PWD/qtunixserversocket.cpp
    }
}

win32 {
    contains(TEMPLATE, lib):CONFIG(shared, static|shared): DEFINES *= QT_QTSERVICE_EXPORT
    else:CONFIG(qtservice-uselib): DEFINES *= QT_QTSERVICE_IMPORT
    LIBS *= -lUser32 -lAdvapi32
} else {
    QT *= network
}
