#ifndef QUIZLET_H
#define QUIZLET_H

#include <QObject>
#include <QHash>

class Quizlet : public QObject
{
    Q_OBJECT
public:
    explicit Quizlet(QObject *parent = nullptr);

    void setName(const QString& _name);
    void addQuiz(const QString& term, const QString& definition);

signals:

private:
    QString name;
    QHash<QString, QString>termsDefinition;
};

#endif // QUIZLET_H
