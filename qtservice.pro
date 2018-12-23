TEMPLATE = subdirs
CONFIG *= ordered
CONFIG(qtservice-uselib)|CONFIG(QS_BUILD_LIB): SUBDIRS *= buildlib
!CONFIG(QS_NO_EXAMPLES): SUBDIRS *= examples
