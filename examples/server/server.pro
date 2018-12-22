TARGET = httpservice
TEMPLATE = app
CONFIG *= console
QT *= network
QT -= gui

SOURCES  *= main.cpp

include($$PWD/../../src/qtservice.pri)
