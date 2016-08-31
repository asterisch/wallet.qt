TEMPLATE = app

QT += qml quick \
        sql
CONFIG += c++11

SOURCES += main.cpp \
    category.cpp \
    message.cpp \
    categorymodel.cpp \
    purchase.cpp \
    purchasemodel.cpp \
    budget.cpp \
    budgetmodel.cpp \
    walletmodel.cpp \
    dbmanager.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    category.h \
    message.h \
    categorymodel.h \
    purchase.h \
    purchasemodel.h \
    budget.h \
    budgetmodel.h \
    walletmodel.h \
    dbmanager.h

SUBDIRS += \
    e-wallet.pro

DISTFILES += \
    images.zip \
    LICENSE \
    README.md
