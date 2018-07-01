/*******************************************************************/

/* Original File Name: Counter.h                                   */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Класс основного функционала.                       */

/*******************************************************************/

#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>

class Counter : public QObject
{
    Q_OBJECT
public:
    explicit Counter(QObject *parent = nullptr);

    //Метод подсчёта символов
    Q_INVOKABLE int lengthWithoutSpaces(const QString str) const;

    //Метод подсчёта символов без знаков
    Q_INVOKABLE int lengthWithoutSigns(const QString str) const;

    //Метод подсчёта слов
    Q_INVOKABLE int wordsCounter(const QString str) const;

private:
    QString signs;
    QString alph;
};

#endif //COUNTER_H
