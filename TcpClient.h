#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);

public slots:
    void connectToServer();
    bool loginRequest(const QString& login, const QString& password);
    bool registrationRequest(const QString& login, const QString& password);
    void

private slots:
    void onConnected();
    void onReadyRead();
    void onErrorOccurred(QAbstractSocket::SocketError error);

signals:

private:
    QTcpSocket* socket;
    const QString ip = "127.0.0.1";
    uint port = 44333;
};

#endif // TCPCLIENT_H
