#include "TcpClient.h"

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
{
    socket = new QTcpSocket(this);
    connect(socket, SIGNAL(connected()), this, SLOT(onConnected()));
    connect(socket, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
    connect(socket, SIGNAL(errorOccurred(QAbstractSocket::SocketError)), this, SLOT(onErrorOccurred(QAbstractSocket::SocketError)));
}

void TcpClient::connectToServer() //подключаемся к серверу
{
    socket->connectToHost(ip, port);
}

void TcpClient::sendMessage(const QString &message) //отправляем запрос
{
    socket->write(message.toUtf8());
    socket->flush();
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
