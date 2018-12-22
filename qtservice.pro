TEMPLATE = subdirs
CONFIG *= ordered
include($$PWD/common.pri)
CONFIG(qtservice-uselib)|CONFIG(QS_BUILD_LIB): SUBDIRS *= buildlib
!CONFIG(QS_NO_EXAMPLES): SUBDIRS *= examples
