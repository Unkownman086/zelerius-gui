#-------------------------------------------------
#
# Project created by QtCreator 2017-10-02T15:01:03
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = zelerius-gui
TEMPLATE = app

!win32: QMAKE_CXXFLAGS += -std=c++14 -Wall -Wextra
macx: QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.14
macx: ICON = images/zelerius.icns
win32: RC_ICONS = images/zelerius.ico
win32: VERSION = 1.4.0.0

#QMAKE_CXXFLAGS += -fno-omit-frame-pointer -fsanitize=address,undefined
#LIBS += -lasan -lubsan

CONFIG += c++14 strict_c++ no-opengl #static

win32 {
    #QMAKE_CXXFLAGS_RELEASE += /MT
    #QMAKE_CFLAGS_RELEASE += /MT
    msvc:LIBS += Advapi32.lib
    gcc:LIBS += -lAdvapi32
}

DESTDIR = $$PWD/../bin

# copy walletd adjacent to zelerius-gui binary on all 3 platforms
win32 {
WALLETD_BY_SRC_PATH = $$shell_path($$clean_path("$$PWD/../../Zelerius-Network/bin/walletd.exe"))
zeleriusD_BY_SRC_PATH = $$shell_path($$clean_path("$$PWD/../../Zelerius-Network/bin/zeleriusd.exe"))
Debug:BY_DST_PATH = $$shell_path($$clean_path("$$DESTDIR"))
Release:BY_DST_PATH = $$shell_path($$clean_path("$$DESTDIR"))
copywalletd.commands = $(COPY_FILE) $${WALLETD_BY_SRC_PATH} $${BY_DST_PATH}
copyzeleriusd.commands = $(COPY_FILE) $${zeleriusD_BY_SRC_PATH} $${BY_DST_PATH}
}else:macx {
copywalletd.commands += $(COPY_FILE) $$PWD/../../Zelerius-Network/bin/walletd $$DESTDIR/zelerius-gui.app/Contents/MacOS
copyzeleriusd.commands += $(COPY_FILE) $$PWD/../../Zelerius-Network/bin/zeleriusd $$DESTDIR/zelerius-gui.app/Contents/MacOS
}else {
copywalletd.commands += $(COPY_FILE) $$PWD/../../Zelerius-Network/bin/walletd $$DESTDIR
copyzeleriusd.commands += $(COPY_FILE) $$PWD/../../Zelerius-Network/bin/zeleriusd $$DESTDIR
}
first.depends = $(first) copywalletd copyzeleriusd
export(first.depends)
export(copywalletd.commands)
export(copyzeleriusd.commands)
QMAKE_EXTRA_TARGETS += first copywalletd copyzeleriusd

SOURCES += main.cpp\
    mainwindow.cpp \
    signalhandler.cpp \
    overviewframe.cpp \
    aboutdialog.cpp \
    JsonRpc/JsonRpcClient.cpp \
    JsonRpc/JsonRpcNotification.cpp \
    JsonRpc/JsonRpcObject.cpp \
    JsonRpc/JsonRpcObjectFactory.cpp \
    JsonRpc/JsonRpcRequest.cpp \
    JsonRpc/JsonRpcResponse.cpp \
    application.cpp \
    logger.cpp \
    okbutton.cpp \
    statusbar.cpp \
    windoweditemmodel.cpp \
    walletmodel.cpp \
    sendframe.cpp \
    transferframe.cpp \
    resizablescrollarea.cpp \
    common.cpp \
    connectionoptionsframe.cpp \
    settings.cpp \
    Miner/Miner.cpp \
    Miner/StratumClient.cpp \
    Miner/Worker.cpp \
    MinerDelegate.cpp \
    MinerModel.cpp \
    MiningFrame.cpp \
    MiningManager.cpp \
    connectselectiondialog.cpp \
    walletd.cpp \
    rpcapi.cpp \
    progressbar.cpp \
    addressbookframe.cpp \
    addressbookmodel.cpp \
    addressbooksortedmodel.cpp \
    newaddressdialog.cpp \
    addressbookdelegate.cpp \
    addressbookmanager.cpp \
    balanceoverviewframe.cpp \
    miningoverviewframe.cpp \
    crashdialog.cpp \
    changepassworddialog.cpp \
    sendconfirmationdialog.cpp \
    addressbookdialog.cpp \
    popup.cpp \
    logframe.cpp \
    askpassworddialog.cpp \
    importkeydialog.cpp \
    questiondialog.cpp \
    PoolTreeView.cpp \
    createproofdialog.cpp \
    checkproofdialog.cpp \
    walletdparamsdialog.cpp \
    exportkeydialog.cpp \
    filedownloader.cpp

HEADERS  += mainwindow.h \
    signalhandler.h \
    overviewframe.h \
    aboutdialog.h \
    JsonRpc/JsonRpcClient.h \
    JsonRpc/JsonRpcNotification.h \
    JsonRpc/JsonRpcObject.h \
    JsonRpc/JsonRpcObjectFactory.h \
    JsonRpc/JsonRpcRequest.h \
    JsonRpc/JsonRpcResponse.h \
    application.h \
    logger.h \
    okbutton.h \
    statusbar.h \
    windoweditemmodel.h \
    walletmodel.h \
    sendframe.h \
    transferframe.h \
    resizablescrollarea.h \
    common.h \
    connectionoptionsframe.h \
    settings.h \
    Miner/Miner.h \
    Miner/StratumClient.h \
    Miner/Worker.h \
    MinerDelegate.h \
    MinerModel.h \
    MiningFrame.h \
    MiningManager.h \
    IMinerWorker.h \
    IMiningManager.h \
    IPoolClient.h \
    IPoolMiner.h \
    connectselectiondialog.h \
    walletd.h \
    rpcapi.h \
    progressbar.h \
    addressbookframe.h \
    addressbookmodel.h \
    addressbooksortedmodel.h \
    newaddressdialog.h \
    addressbookdelegate.h \
    addressbookmanager.h \
    balanceoverviewframe.h \
    miningoverviewframe.h \
    crashdialog.h \
    changepassworddialog.h \
    sendconfirmationdialog.h \
    addressbookdialog.h \
    popup.h \
    logframe.h \
    askpassworddialog.h \
    importkeydialog.h \
    questiondialog.h \
    PoolTreeView.h \
    createproofdialog.h \
    checkproofdialog.h \
    walletdparamsdialog.h \
    exportkeydialog.h \
    version.h \
    filedownloader.h

FORMS    += mainwindow.ui \
    overviewframe.ui \
    aboutdialog.ui \
    sendframe.ui \
    transferframe.ui \
    connectionoptionsframe.ui \
    optionsdialog.ui \
    MiningFrame.ui \
    connectselectiondialog.ui \
    addressbookframe.ui \
    newaddressdialog.ui \
    balanceoverviewframe.ui \
    miningoverviewframe.ui \
    crashdialog.ui \
    changepassworddialog.ui \
    addressbookdialog.ui \
    logframe.ui \
    askpassworddialog.ui \
    importkeydialog.ui \
    questiondialog.ui \
    createproofdialog.ui \
    checkproofdialog.ui \
    walletdparamsdialog.ui \
    exportkeydialog.ui

RESOURCES += \
    resources.qrc \


unix|win32: LIBS += -L$$PWD/../../Zelerius-Network/libs/ -lzelerius-crypto

INCLUDEPATH += $$PWD/../../Zelerius-Network/src
DEPENDPATH += $$PWD/../../Zelerius-Network/src

win32:!win32-g++: PRE_TARGETDEPS += $$PWD/../../Zelerius-Network/libs/zelerius-crypto.lib
else:unix|win32-g++: PRE_TARGETDEPS += $$PWD/../../Zelerius-Network/libs/libzelerius-crypto.a

# to add necessary dependencies,
# 1. delete built zelerius-gui.app to delete old dependencies (dylibs and frameworks)
# 2. build
# 3. run /Users/user/Qt/5.9.2/clang_64/bin/macdeployqt zelerius-gui.app
# P.S. in 3, change path accroding to your Qt installation location
