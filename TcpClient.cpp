#include "TcpClient.h"

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
{
    socket = new QTcpSocket(this);
    connect(socket, SIGNAL(connected()), this, SLOT(onConnected()));
    connect(socket, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
    connect(socket, SIGNAL(errorOccurred(QAbstractSocket::SocketError)), this, SLOT(onErrorOccurred(QAbstractSocket::SocketError)));
    connectToServer();
}

void TcpClient::connectToServer() //подключаемся к серверу
{
    socket->connectToHost(ip, port);
}

void TcpClient::loginRequest(const QString &login, const QString &password)
{
    auto data = QString("LOGIN:%1 PASSWORD:%2").arg(login, password);
    socket->write(data.toUtf8());
    socket->flush();
    qDebug() << "login server";
}

void TcpClient::registrationRequest(const QString &login, const QString &password)
{
    auto data = QString("LOGIN:%1 PASSWORD:%2").arg(login).arg(password);
    socket->write(data.toUtf8());
    socket->flush();
}

void TcpClient::addQuizlet()
{
    // добавление Quizlet. Нужно подумать как передавать данные
}

void TcpClient::onConnected()
{
    qInfo() << "Connect to server";
}

void TcpClient::onReadyRead() //получили сообщение с сервера
{
    const auto message = socket->readAll();
}

void TcpClient::onErrorOccurred(QAbstractSocket::SocketError error)
{
    qWarning() << "Error: " << error;
}
