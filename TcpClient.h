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

    void loginRequest(const QString& login, const QString& password);
    void registrationRequest(const QString& login, const QString& password);
    void addQuizlet();

private slots:
    void onConnected();
    void onReadyRead();
    void onErrorOccurred(QAbstractSocket::SocketError error);

signals:

private:
    void connectToServer();

private:
    QTcpSocket* socket;
    const QString ip = "127.0.0.1";
    uint port = 44333;
};

#endif // TCPCLIENT_H
