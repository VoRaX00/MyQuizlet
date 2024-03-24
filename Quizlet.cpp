#include "Quizlet.h"

Quizlet::Quizlet(QObject *parent)
    : QObject{parent}
{

}

void Quizlet::setName(const QString &_name)
{
    name = _name;
}

void Quizlet::addQuiz(const QString &term, const QString &definition)
{
    termsDefinition[term] = definition;
}
