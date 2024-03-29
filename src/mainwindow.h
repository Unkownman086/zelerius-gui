// Copyright (c) 2015-2018, The Bytecoin developers.
// Licensed under the GNU Lesser General Public License. See LICENSE for details.

#pragma once

#include <QMainWindow>
#include <QProcess>
#include <QStyle>

#include "rpcapi.h"

class QActionGroup;
class QDataWidgetMapper;
class QSplashScreen;
class QAbstractButton;
class QAbstractItemModel;
class QSessionManager;

namespace Ui {
  class MainWindow;
}

namespace WalletGUI {

class WalletModel;
class MiningManager;
class AddressBookManager;
class CopiedToolTip;

class MainWindow : public QMainWindow
{
    Q_OBJECT
    Q_DISABLE_COPY(MainWindow)

public:
    MainWindow(
            WalletModel* walletModel,
            const QString& styleSheetTemplate,
            MiningManager* miningManager,
            AddressBookManager* addressBookManager,
            QWidget* parent);
    virtual ~MainWindow();

    bool eventFilter(QObject* object, QEvent* event) override;

    void addRecipient(const QString& address, const QString& label = QString());
    QString getAddress() const;

    Q_SLOT void setConnectedState();
    Q_SLOT void setDisconnectedState();

    Q_SLOT void builtinRun();
//    Q_SLOT void remoteConnected();

    Q_SLOT void jsonErrorResponse(const QString& id, const QString& errorString);
    Q_SLOT void createTxReceived(const RpcApi::CreatedTx& tx);
    Q_SLOT void createTx(const RpcApi::Transaction& tx, quint64 fee, bool sub_fee_from_amount);

    Q_SLOT void copiedToClipboard();
    Q_SLOT void openDataFolder();
    Q_SLOT void splashMsg(const QString& msg);
    Q_SLOT void addDaemonOutput(const QString& msg);
    Q_SLOT void addDaemonError(const QString& msg);
    Q_SLOT void showLog();

    Q_SLOT void packetSent(const QByteArray& data);
    Q_SLOT void packetReceived(const QByteArray& data);
    Q_SLOT void importKeys();
    Q_SLOT void exportViewOnlyKeys();
    Q_SLOT void exportKeys();
    Q_SLOT void updateIsReady(const QString& newVersion);

protected:
    void changeEvent(QEvent* event) override;
    void closeEvent(QCloseEvent* event) override;

private:
    QScopedPointer<Ui::MainWindow> m_ui;
    QAbstractItemModel* m_addressBookModel;
    QAbstractItemModel* m_sortedAddressBookModel;
    QAbstractItemModel* m_minerModel;
    QString m_styleSheetTemplate;
    QDataWidgetMapper* m_addressesMapper;
    QDataWidgetMapper* m_balanceMapper;
    QMovie* m_syncMovie;
    MiningManager* m_miningManager;
    AddressBookManager* addressBookManager_;
    CopiedToolTip* copiedToolTip_;

    WalletModel* walletModel_;

    void createRecentWalletMenu();
    void updateRecentWalletActions();
    void themeChanged();
    void setOpenedState();
    void setClosedState();
    void walletStateModelDataChanged(const QModelIndex& topLeft, const QModelIndex& bottomRight, const QVector<int>& roles);
    void showSendConfirmation(const RpcApi::CreatedTx& tx);
    void setTitle();
    void clearTitle();

    Q_SLOT void aboutQt();
    Q_SLOT void about();
    Q_SLOT void copyAddress();
    Q_SLOT void copyBalance();
    Q_SLOT void communityForumTriggered();
    Q_SLOT void reportIssueTriggered();

    Q_SLOT void createWallet();
    Q_SLOT void openWallet();
    Q_SLOT void remoteWallet();
    Q_SLOT void encryptWallet();

    Q_SLOT void createProof(const QString& txHash, bool needToFind);
    Q_SLOT void checkProof();
    Q_SLOT void showWalletdParams();

    Q_SLOT void get_all_logs(bool checked);

//settings
    bool all_logs = false;

signals:
    void createTxSignal(const RpcApi::CreateTransaction::Request& req, QPrivateSignal);
    void sendTxSignal(const RpcApi::SendTransaction::Request& req, QPrivateSignal);
    void createProofSignal(const QString& txHash, bool needToFind);
    void checkProofSignal();
    void showWalletdParamsSignal();
    void exportViewOnlyKeysSignal();
    void exportKeysSignal();
    void restartDaemon(QPrivateSignal);

    void createWalletSignal(QWidget* parent);
    void openWalletSignal(QWidget* parent);
    void remoteWalletSignal(QWidget* parent);
    void encryptWalletSignal(QWidget* parent);
    void importKeysSignal(QWidget* parent);
};

}
